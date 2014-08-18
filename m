Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7684E70D30
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Aug 2014 01:51:34 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s7I1pZgm012595
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Aug 2014 18:51:35 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.187) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Sun, 17 Aug 2014 18:51:35 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 18 Aug 2014 09:51:46 +0800
Message-ID: <9bd38b9adac3100a8c60af01fc542d830de9fe82.1408326458.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1408326458.git.Qi.Chen@windriver.com>
References: <cover.1408326458.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH V3 09/10] systemd: add support for executing scripts under /etc/rcS.d
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
X-List-Received-Date: Mon, 18 Aug 2014 01:51:34 -0000
Content-Type: text/plain

This patch adds support for systemd to execute scripts under /etc/rcS.d.

The patch references the patch below from Debian.
http://sources.debian.net/src/systemd/204-5/debian/patches/debian-changes/?hl=1391#L1391

[YOCTO #5159]

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 ...ort-for-executing-scripts-under-etc-rcS.d.patch |   93 ++++++++++++++++++++
 meta/recipes-core/systemd/systemd_215.bb           |    1 +
 2 files changed, 94 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/0001-add-support-for-executing-scripts-under-etc-rcS.d.patch

diff --git a/meta/recipes-core/systemd/systemd/0001-add-support-for-executing-scripts-under-etc-rcS.d.patch b/meta/recipes-core/systemd/systemd/0001-add-support-for-executing-scripts-under-etc-rcS.d.patch
new file mode 100644
index 0000000..c1b52f6
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0001-add-support-for-executing-scripts-under-etc-rcS.d.patch
@@ -0,0 +1,93 @@
+Upstream-Status: Inappropriate [OE specific]
+
+Subject: add support for executing scripts under /etc/rcS.d/
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ src/sysv-generator/sysv-generator.c |   19 +++++++++++++++----
+ 1 file changed, 15 insertions(+), 4 deletions(-)
+
+diff --git a/src/sysv-generator/sysv-generator.c b/src/sysv-generator/sysv-generator.c
+index 9a869ba..976f58a 100644
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
+@@ -82,6 +86,7 @@ typedef struct SysvStub {
+         char **conflicts;
+         bool has_lsb;
+         bool reload;
++        bool default_dependencies;
+ } SysvStub;
+ 
+ const char *arg_dest = "/tmp";
+@@ -156,6 +161,9 @@ static int generate_unit_file(SysvStub *s) {
+                 "Description=%s\n",
+                 s->path, s->description);
+ 
++        if (!s->default_dependencies)
++                fprintf(f, "DefaultDependencies=no\n");
++
+         if (!isempty(before))
+                 fprintf(f, "Before=%s\n", before);
+         if (!isempty(after))
+@@ -725,6 +733,7 @@ static int enumerate_sysv(LookupPaths lp, Hashmap *all_services) {
+                                 return log_oom();
+ 
+                         service->sysv_start_priority = -1;
++                        service->default_dependencies = true;
+                         service->name = name;
+                         service->path = fpath;
+ 
+@@ -810,9 +819,10 @@ static int set_dependencies_from_rcnd(LookupPaths lp, Hashmap *all_services) {
+ 
+                                 if (de->d_name[0] == 'S')  {
+ 
+-                                        if (rcnd_table[i].type == RUNLEVEL_UP) {
++                                        if (rcnd_table[i].type == RUNLEVEL_UP || rcnd_table[i].type == RUNLEVEL_SYSINIT) {
+                                                 service->sysv_start_priority =
+                                                         MAX(a*10 + b, service->sysv_start_priority);
++                                                service->default_dependencies = (rcnd_table[i].type == RUNLEVEL_SYSINIT)?false:true;
+                                         }
+ 
+                                         r = set_ensure_allocated(&runlevel_services[i],
+@@ -825,7 +835,8 @@ static int set_dependencies_from_rcnd(LookupPaths lp, Hashmap *all_services) {
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
+1.7.9.5
+
diff --git a/meta/recipes-core/systemd/systemd_215.bb b/meta/recipes-core/systemd/systemd_215.bb
index cde167e..102eae0 100644
--- a/meta/recipes-core/systemd/systemd_215.bb
+++ b/meta/recipes-core/systemd/systemd_215.bb
@@ -33,6 +33,7 @@ SRC_URI = "git://anongit.freedesktop.org/systemd/systemd;branch=master;protocol=
            file://uclibc-get-physmem.patch \
            file://0001-always-check-for-__BYTE_ORDER-__BIG_ENDIAN-when-chec.patch \
            file://0002-endian-explicitly-include-endian.h-wherever-we-want-.patch \
+           file://0001-add-support-for-executing-scripts-under-etc-rcS.d.patch \
            file://touchscreen.rules \
            file://00-create-volatile.conf \
            file://init \
-- 
1.7.9.5


