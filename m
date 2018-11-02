Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 46BDB79F04
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Nov 2018 04:36:50 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id wA24aVjR024484
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 1 Nov 2018 21:36:41 -0700
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.218) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.408.0; Thu, 1 Nov 2018 21:36:20 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 2 Nov 2018 12:42:41 +0800
Message-ID: <99ab986e947955f086fb298bb2cd094f0352758b.1541133621.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1541133621.git.Qi.Chen@windriver.com>
References: <cover.1541133621.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/3] systemd: fix CVE-2018-15686
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
X-List-Received-Date: Fri, 02 Nov 2018 04:36:50 -0000
Content-Type: text/plain

Backport patch to fix the following CVE.

CVE: CVE-2018-15686

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 ...eserializing-state-always-use-read_line-L.patch | 250 +++++++++++++++++++++
 meta/recipes-core/systemd/systemd_239.bb           |   1 +
 2 files changed, 251 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/0001-core-when-deserializing-state-always-use-read_line-L.patch

diff --git a/meta/recipes-core/systemd/systemd/0001-core-when-deserializing-state-always-use-read_line-L.patch b/meta/recipes-core/systemd/systemd/0001-core-when-deserializing-state-always-use-read_line-L.patch
new file mode 100644
index 0000000..215d680
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0001-core-when-deserializing-state-always-use-read_line-L.patch
@@ -0,0 +1,250 @@
+From 1a05ff4948d778280ec155a9abe69d3360bfddd9 Mon Sep 17 00:00:00 2001
+From: Lennart Poettering <lennart@poettering.net>
+Date: Wed, 17 Oct 2018 18:36:24 +0200
+Subject: [PATCH] =?UTF-8?q?core:=20when=20deserializing=20state=20always?=
+ =?UTF-8?q?=20use=20read=5Fline(=E2=80=A6,=20LONG=5FLINE=5FMAX,=20?=
+ =?UTF-8?q?=E2=80=A6)?=
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+This should be much better than fgets(), as we can read substantially
+longer lines and overly long lines result in proper errors.
+
+Fixes a vulnerability discovered by Jann Horn at Google.
+
+CVE-2018-15686
+LP: #1796402
+https://bugzilla.redhat.com/show_bug.cgi?id=1639071
+
+(cherry picked from commit 8948b3415d762245ebf5e19d80b97d4d8cc208c1)
+
+CVE: CVE-2018-15686
+Upstream-Status: Backport
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ src/core/job.c     | 19 +++++++++++--------
+ src/core/manager.c | 44 ++++++++++++++++++++------------------------
+ src/core/unit.c    | 34 ++++++++++++++++++----------------
+ src/core/unit.h    |  2 +-
+ 4 files changed, 50 insertions(+), 49 deletions(-)
+
+diff --git a/src/core/job.c b/src/core/job.c
+index 734756b..8552ffb 100644
+--- a/src/core/job.c
++++ b/src/core/job.c
+@@ -10,6 +10,7 @@
+ #include "dbus-job.h"
+ #include "dbus.h"
+ #include "escape.h"
++#include "fileio.h"
+ #include "job.h"
+ #include "log.h"
+ #include "macro.h"
+@@ -1091,24 +1092,26 @@ int job_serialize(Job *j, FILE *f) {
+ }
+ 
+ int job_deserialize(Job *j, FILE *f) {
++        int r;
++
+         assert(j);
+         assert(f);
+ 
+         for (;;) {
+-                char line[LINE_MAX], *l, *v;
++                _cleanup_free_ char *line = NULL;
++                char *l, *v;
+                 size_t k;
+ 
+-                if (!fgets(line, sizeof(line), f)) {
+-                        if (feof(f))
+-                                return 0;
+-                        return -errno;
+-                }
++                r = read_line(f, LONG_LINE_MAX, &line);
++                if (r < 0)
++                        return log_error_errno(r, "Failed to read serialization line: %m");
++                if (r == 0)
++                        return 0;
+ 
+-                char_array_0(line);
+                 l = strstrip(line);
+ 
+                 /* End marker */
+-                if (l[0] == 0)
++                if (isempty(l))
+                         return 0;
+ 
+                 k = strcspn(l, "=");
+diff --git a/src/core/manager.c b/src/core/manager.c
+index 3a7f0c4..a5780c9 100644
+--- a/src/core/manager.c
++++ b/src/core/manager.c
+@@ -3171,22 +3171,19 @@ int manager_deserialize(Manager *m, FILE *f, FDSet *fds) {
+         m->n_reloading++;
+ 
+         for (;;) {
+-                char line[LINE_MAX];
++                _cleanup_free_ char *line = NULL;
+                 const char *val, *l;
+ 
+-                if (!fgets(line, sizeof(line), f)) {
+-                        if (feof(f))
+-                                r = 0;
+-                        else
+-                                r = -errno;
+-
++                r = read_line(f, LONG_LINE_MAX, &line);
++                if (r < 0) {
++                        log_error_errno(r, "Failed to read serialization line: %m");
+                         goto finish;
+                 }
++                if (r == 0)
++                        break;
+ 
+-                char_array_0(line);
+                 l = strstrip(line);
+-
+-                if (l[0] == 0)
++                if (isempty(l)) /* end marker */
+                         break;
+ 
+                 if ((val = startswith(l, "current-job-id="))) {
+@@ -3353,29 +3350,31 @@ int manager_deserialize(Manager *m, FILE *f, FDSet *fds) {
+         }
+ 
+         for (;;) {
+-                Unit *u;
+-                char name[UNIT_NAME_MAX+2];
++                _cleanup_free_ char *line = NULL;
+                 const char* unit_name;
++                Unit *u;
+ 
+                 /* Start marker */
+-                if (!fgets(name, sizeof(name), f)) {
+-                        if (feof(f))
+-                                r = 0;
+-                        else
+-                                r = -errno;
+-
++                r = read_line(f, LONG_LINE_MAX, &line);
++                if (r < 0) {
++                        log_error_errno(r, "Failed to read serialization line: %m");
+                         goto finish;
+                 }
++                if (r == 0)
++                        break;
+ 
+-                char_array_0(name);
+-                unit_name = strstrip(name);
++                unit_name = strstrip(line);
+ 
+                 r = manager_load_unit(m, unit_name, NULL, NULL, &u);
+                 if (r < 0) {
+                         log_notice_errno(r, "Failed to load unit \"%s\", skipping deserialization: %m", unit_name);
+                         if (r == -ENOMEM)
+                                 goto finish;
+-                        unit_deserialize_skip(f);
++
++                        r = unit_deserialize_skip(f);
++                        if (r < 0)
++                                goto finish;
++
+                         continue;
+                 }
+ 
+@@ -3388,9 +3387,6 @@ int manager_deserialize(Manager *m, FILE *f, FDSet *fds) {
+         }
+ 
+ finish:
+-        if (ferror(f))
+-                r = -EIO;
+-
+         assert(m->n_reloading > 0);
+         m->n_reloading--;
+ 
+diff --git a/src/core/unit.c b/src/core/unit.c
+index 7da963a..e98c9c4 100644
+--- a/src/core/unit.c
++++ b/src/core/unit.c
+@@ -3380,21 +3380,19 @@ int unit_deserialize(Unit *u, FILE *f, FDSet *fds) {
+         assert(fds);
+ 
+         for (;;) {
+-                char line[LINE_MAX], *l, *v;
++                _cleanup_free_ char *line = NULL;
+                 CGroupIPAccountingMetric m;
++                char *l, *v;
+                 size_t k;
+ 
+-                if (!fgets(line, sizeof(line), f)) {
+-                        if (feof(f))
+-                                return 0;
+-                        return -errno;
+-                }
++                r = read_line(f, LONG_LINE_MAX, &line);
++                if (r < 0)
++                        return log_error_errno(r, "Failed to read serialization line: %m");
++                if (r == 0) /* eof */
++                        break;
+ 
+-                char_array_0(line);
+                 l = strstrip(line);
+-
+-                /* End marker */
+-                if (isempty(l))
++                if (isempty(l)) /* End marker */
+                         break;
+ 
+                 k = strcspn(l, "=");
+@@ -3671,23 +3669,27 @@ int unit_deserialize(Unit *u, FILE *f, FDSet *fds) {
+         return 0;
+ }
+ 
+-void unit_deserialize_skip(FILE *f) {
++int unit_deserialize_skip(FILE *f) {
++        int r;
+         assert(f);
+ 
+         /* Skip serialized data for this unit. We don't know what it is. */
+ 
+         for (;;) {
+-                char line[LINE_MAX], *l;
++                _cleanup_free_ char *line = NULL;
++                char *l;
+ 
+-                if (!fgets(line, sizeof line, f))
+-                        return;
++                r = read_line(f, LONG_LINE_MAX, &line);
++                if (r < 0)
++                        return log_error_errno(r, "Failed to read serialization line: %m");
++                if (r == 0)
++                        return 0;
+ 
+-                char_array_0(line);
+                 l = strstrip(line);
+ 
+                 /* End marker */
+                 if (isempty(l))
+-                        return;
++                        return 1;
+         }
+ }
+ 
+diff --git a/src/core/unit.h b/src/core/unit.h
+index 06321bb..51c7aaa 100644
+--- a/src/core/unit.h
++++ b/src/core/unit.h
+@@ -684,7 +684,7 @@ bool unit_can_serialize(Unit *u) _pure_;
+ 
+ int unit_serialize(Unit *u, FILE *f, FDSet *fds, bool serialize_jobs);
+ int unit_deserialize(Unit *u, FILE *f, FDSet *fds);
+-void unit_deserialize_skip(FILE *f);
++int unit_deserialize_skip(FILE *f);
+ 
+ int unit_serialize_item(Unit *u, FILE *f, const char *key, const char *value);
+ int unit_serialize_item_escaped(Unit *u, FILE *f, const char *key, const char *value);
+-- 
+2.7.4
+
diff --git a/meta/recipes-core/systemd/systemd_239.bb b/meta/recipes-core/systemd/systemd_239.bb
index fe67c45..48b6c3a 100644
--- a/meta/recipes-core/systemd/systemd_239.bb
+++ b/meta/recipes-core/systemd/systemd_239.bb
@@ -30,6 +30,7 @@ SRC_URI += "file://touchscreen.rules \
            file://0001-sd-bus-make-BUS_DEFAULT_TIMEOUT-configurable.patch \
            file://0022-build-sys-Detect-whether-struct-statx-is-defined-in-.patch \
            file://0023-resolvconf-fixes-for-the-compatibility-interface.patch \
+           file://0001-core-when-deserializing-state-always-use-read_line-L.patch \
            "
 
 # patches made for musl are only applied on TCLIBC is musl
-- 
1.9.1


