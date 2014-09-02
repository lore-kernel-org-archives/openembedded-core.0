Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 1AFD465D56
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Sep 2014 10:54:14 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s82AsG99010808
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 2 Sep 2014 03:54:16 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.187) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Tue, 2 Sep 2014 03:54:15 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 2 Sep 2014 18:53:55 +0800
Message-ID: <09976ba7b8afef4bca4ac35d9a66f08bfa98a047.1409655125.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1409655125.git.Qi.Chen@windriver.com>
References: <cover.1409655125.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 09/26] systemd: add support for executing scripts under /etc/rcS.d
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 02 Sep 2014 10:54:15 -0000
Content-Type: text/plain

This patch adds support for systemd to execute scripts under /etc/rcS.d.

To be compitable, all services translated from /etc/rcS.d/ scripts would
run before services translated from /etc/rcN.d scripts.

[YOCTO #5159]

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 ...ort-for-executing-scripts-under-etc-rcS.d.patch | 138 +++++++++++++++++++++
 meta/recipes-core/systemd/systemd_216.bb           |   1 +
 2 files changed, 139 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/0001-add-support-for-executing-scripts-under-etc-rcS.d.patch

diff --git a/meta/recipes-core/systemd/systemd/0001-add-support-for-executing-scripts-under-etc-rcS.d.patch b/meta/recipes-core/systemd/systemd/0001-add-support-for-executing-scripts-under-etc-rcS.d.patch
new file mode 100644
index 0000000..9aa07c1
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0001-add-support-for-executing-scripts-under-etc-rcS.d.patch
@@ -0,0 +1,138 @@
+Upstream-Status: Inappropriate [OE specific]
+
+Subject: add support for executing scripts under /etc/rcS.d/
+
+To be compatible, all services translated from scripts under /etc/rcS.d would
+run before services translated from scripts under /etc/rcN.d.
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ src/sysv-generator/sysv-generator.c | 50 ++++++++++++++++++++++++++++---------
+ 1 file changed, 38 insertions(+), 12 deletions(-)
+
+diff --git a/src/sysv-generator/sysv-generator.c b/src/sysv-generator/sysv-generator.c
+index 9a869ba..10c55c0 100644
+--- a/src/sysv-generator/sysv-generator.c
++++ b/src/sysv-generator/sysv-generator.c
+@@ -43,7 +43,8 @@
+ 
+ typedef enum RunlevelType {
+         RUNLEVEL_UP,
+-        RUNLEVEL_DOWN
++        RUNLEVEL_DOWN,
++        RUNLEVEL_SYSINIT
+ } RunlevelType;
+ 
+ static const struct {
+@@ -58,6 +59,9 @@ static const struct {
+         { "rc4.d",  SPECIAL_RUNLEVEL4_TARGET, RUNLEVEL_UP },
+         { "rc5.d",  SPECIAL_RUNLEVEL5_TARGET, RUNLEVEL_UP },
+ 
++        /* Debian style rcS.d, also adopted by OE */
++        { "rcS.d",  SPECIAL_SYSINIT_TARGET,   RUNLEVEL_SYSINIT},
++
+         /* Standard SysV runlevels for shutdown */
+         { "rc0.d",  SPECIAL_POWEROFF_TARGET,  RUNLEVEL_DOWN },
+         { "rc6.d",  SPECIAL_REBOOT_TARGET,    RUNLEVEL_DOWN }
+@@ -66,7 +70,7 @@ static const struct {
+            directories in this order, and we want to make sure that
+            sysv_start_priority is known when we first load the
+            unit. And that value we only know from S links. Hence
+-           UP must be read before DOWN */
++           UP/SYSINIT must be read before DOWN */
+ };
+ 
+ typedef struct SysvStub {
+@@ -82,6 +86,8 @@ typedef struct SysvStub {
+         char **conflicts;
+         bool has_lsb;
+         bool reload;
++        bool default_dependencies;
++        bool from_rcsd;
+ } SysvStub;
+ 
+ const char *arg_dest = "/tmp";
+@@ -156,6 +162,9 @@ static int generate_unit_file(SysvStub *s) {
+                 "Description=%s\n",
+                 s->path, s->description);
+ 
++        if (!s->default_dependencies)
++                fprintf(f, "DefaultDependencies=no\n");
++
+         if (!isempty(before))
+                 fprintf(f, "Before=%s\n", before);
+         if (!isempty(after))
+@@ -661,18 +670,30 @@ static int fix_order(SysvStub *s, Hashmap *all_services) {
+                 if (s->has_lsb && other->has_lsb)
+                         continue;
+ 
+-                if (other->sysv_start_priority < s->sysv_start_priority) {
+-                        r = strv_extend(&s->after, other->name);
++                /* All scripts under /etc/rcS.d should execute before scripts under
++                 * /etc/rcN.d */
++                if (!other->from_rcsd && s->from_rcsd) {
++                        r = strv_extend(&s->before, other->name);
+                         if (r < 0)
+                                 return log_oom();
+-                }
+-                else if (other->sysv_start_priority > s->sysv_start_priority) {
+-                        r = strv_extend(&s->before, other->name);
++                } else if (other->from_rcsd && !s->from_rcsd) {
++                        r = strv_extend(&s->after, other->name);
+                         if (r < 0)
+                                 return log_oom();
+-                }
+-                else
+-                        continue;
++                } else {
++                        if (other->sysv_start_priority < s->sysv_start_priority) {
++                                r = strv_extend(&s->after, other->name);
++                                if (r < 0)
++                                        return log_oom();
++                        }
++                        else if (other->sysv_start_priority > s->sysv_start_priority) {
++                                r = strv_extend(&s->before, other->name);
++                                if (r < 0)
++                                        return log_oom();
++                        }
++                        else
++                                continue;
++                 }
+ 
+                 /* FIXME: Maybe we should compare the name here lexicographically? */
+         }
+@@ -725,6 +746,8 @@ static int enumerate_sysv(LookupPaths lp, Hashmap *all_services) {
+                                 return log_oom();
+ 
+                         service->sysv_start_priority = -1;
++                        service->default_dependencies = true;
++                        service->from_rcsd = false;
+                         service->name = name;
+                         service->path = fpath;
+ 
+@@ -810,9 +833,11 @@ static int set_dependencies_from_rcnd(LookupPaths lp, Hashmap *all_services) {
+ 
+                                 if (de->d_name[0] == 'S')  {
+ 
+-                                        if (rcnd_table[i].type == RUNLEVEL_UP) {
++                                        if (rcnd_table[i].type == RUNLEVEL_UP || rcnd_table[i].type == RUNLEVEL_SYSINIT) {
+                                                 service->sysv_start_priority =
+                                                         MAX(a*10 + b, service->sysv_start_priority);
++                                                service->default_dependencies = (rcnd_table[i].type == RUNLEVEL_SYSINIT)?false:true;
++                                                service->from_rcsd = (rcnd_table[i].type == RUNLEVEL_SYSINIT)?true:false;
+                                         }
+ 
+                                         r = set_ensure_allocated(&runlevel_services[i],
+@@ -825,7 +850,8 @@ static int set_dependencies_from_rcnd(LookupPaths lp, Hashmap *all_services) {
+                                                 goto finish;
+ 
+                                 } else if (de->d_name[0] == 'K' &&
+-                                           (rcnd_table[i].type == RUNLEVEL_DOWN)) {
++                                           (rcnd_table[i].type == RUNLEVEL_DOWN ||
++                                            rcnd_table[i].type == RUNLEVEL_SYSINIT)) {
+ 
+                                         r = set_ensure_allocated(&shutdown_services,
+                                                                  trivial_hash_func, trivial_compare_func);
+-- 
+1.9.1
+
diff --git a/meta/recipes-core/systemd/systemd_216.bb b/meta/recipes-core/systemd/systemd_216.bb
index 8fc79e4..776006f 100644
--- a/meta/recipes-core/systemd/systemd_216.bb
+++ b/meta/recipes-core/systemd/systemd_216.bb
@@ -30,6 +30,7 @@ SRC_URI = "git://anongit.freedesktop.org/systemd/systemd;branch=master;protocol=
            file://optional_secure_getenv.patch \
            file://uclibc-sysinfo_h.patch \
            file://uclibc-get-physmem.patch \
+           file://0001-add-support-for-executing-scripts-under-etc-rcS.d.patch \
            file://0001-missing.h-add-fake-__NR_memfd_create-for-MIPS.patch \
            file://touchscreen.rules \
            file://00-create-volatile.conf \
-- 
1.9.1


