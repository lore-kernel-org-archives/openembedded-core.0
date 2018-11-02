Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id C547779EF1
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Nov 2018 01:47:48 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id wA21lnc4010271
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 1 Nov 2018 18:47:49 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.218) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.408.0; Thu, 1 Nov 2018 18:47:49 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 2 Nov 2018 09:53:49 +0800
Message-ID: <266246b9bb4e37449816e24657690226b1bd599e.1541123540.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1541123540.git.Qi.Chen@windriver.com>
References: <cover.1541123540.git.Qi.Chen@windriver.com>
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
X-List-Received-Date: Fri, 02 Nov 2018 01:47:49 -0000
Content-Type: text/plain

Backport patch to fix the following CVE.

CVE: CVE-2018-15686

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 ...eserializing-state-always-use-read_line-L.patch | 238 +++++++++++++++++++++
 meta/recipes-core/systemd/systemd_239.bb           |   1 +
 2 files changed, 239 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/0001-core-when-deserializing-state-always-use-read_line-L.patch

diff --git a/meta/recipes-core/systemd/systemd/0001-core-when-deserializing-state-always-use-read_line-L.patch b/meta/recipes-core/systemd/systemd/0001-core-when-deserializing-state-always-use-read_line-L.patch
new file mode 100644
index 0000000..38a89a4
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0001-core-when-deserializing-state-always-use-read_line-L.patch
@@ -0,0 +1,238 @@
+From 47c45a237c1e51e987bb1607a1739338e5364724 Mon Sep 17 00:00:00 2001
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
+Upstream-Status: Backport
+[Modifed to fit the 239 version.]
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ src/core/job.c     | 19 +++++++++++--------
+ src/core/manager.c | 47 ++++++++++++++++++++---------------------------
+ src/core/unit.c    | 34 ++++++++++++++++++----------------
+ src/core/unit.h    |  2 +-
+ 4 files changed, 50 insertions(+), 52 deletions(-)
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
+index 930df4e..879ae79 100644
+--- a/src/core/manager.c
++++ b/src/core/manager.c
+@@ -3130,22 +3130,17 @@ int manager_deserialize(Manager *m, FILE *f, FDSet *fds) {
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
+-                        goto finish;
+-                }
++                r = read_line(f, LONG_LINE_MAX, &line);
++                if (r < 0)
++                        return log_error_errno(r, "Failed to read serialization line: %m");
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
+@@ -3312,29 +3307,27 @@ int manager_deserialize(Manager *m, FILE *f, FDSet *fds) {
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
+-                        goto finish;
+-                }
++                r = read_line(f, LONG_LINE_MAX, &line);
++                if (r < 0)
++                        return log_error_errno(r, "Failed to read serialization line: %m");
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
+-                        if (r == -ENOMEM)
+-                                goto finish;
+-                        unit_deserialize_skip(f);
++
++                        r = unit_deserialize_skip(f);
++                        if (r < 0)
++                                return r;
++
+                         continue;
+                 }
+ 
+diff --git a/src/core/unit.c b/src/core/unit.c
+index 113205b..a3556cc 100644
+--- a/src/core/unit.c
++++ b/src/core/unit.c
+@@ -3368,21 +3368,19 @@ int unit_deserialize(Unit *u, FILE *f, FDSet *fds) {
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
+@@ -3657,23 +3655,27 @@ int unit_deserialize(Unit *u, FILE *f, FDSet *fds) {
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
+index b3131eb..e1a60da 100644
+--- a/src/core/unit.h
++++ b/src/core/unit.h
+@@ -679,7 +679,7 @@ bool unit_can_serialize(Unit *u) _pure_;
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


