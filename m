Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id C7F166EFD7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Feb 2014 02:38:39 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s1E2ceqM004752
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Feb 2014 18:38:41 -0800 (PST)
Received: from pek-blade16.wrs.com (128.224.153.44) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.2.347.0;
	Thu, 13 Feb 2014 18:38:40 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 14 Feb 2014 10:40:58 +0800
Message-ID: <c9b8972a07e3000851cdecfae8a9344ead540999.1392345397.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1392345397.git.liezhi.yang@windriver.com>
References: <cover.1392345397.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] systemd: journald fix ignored disk space restrictions
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
X-List-Received-Date: Fri, 14 Feb 2014 02:38:40 -0000
Content-Type: text/plain

From: Diego Sueiro <diego.sueiro@gmail.com>

The upstream bug report can be seen at:
[Systemd #68161] -- https://bugs.freedesktop.org/show_bug.cgi?id=68161

This backports patches come from 207 and need to address this in the 206 version for dora branch.

Signed-off-by: Diego Sueiro <diego.sueiro@gmail.com>
Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 ...ournald-fix-fd-leak-in-journal_file_empty.patch | 27 ++++++++++++++++
 ...urnald-fix-vacuuming-of-archived-journals.patch | 37 ++++++++++++++++++++++
 meta/recipes-core/systemd/systemd_206.bb           |  2 ++
 3 files changed, 66 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/journald-fix-fd-leak-in-journal_file_empty.patch
 create mode 100644 meta/recipes-core/systemd/systemd/journald-fix-vacuuming-of-archived-journals.patch

diff --git a/meta/recipes-core/systemd/systemd/journald-fix-fd-leak-in-journal_file_empty.patch b/meta/recipes-core/systemd/systemd/journald-fix-fd-leak-in-journal_file_empty.patch
new file mode 100644
index 0000000..a83c858
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/journald-fix-fd-leak-in-journal_file_empty.patch
@@ -0,0 +1,27 @@
+journald: fix fd leak in journal_file_empty
+Before my previous patch, journal_file_empty wasn't be called with the
+correct filename. Now that it's being called with the correct filename
+it leaks file descriptors. This patch closes the file descriptors before
+returning.
+
+Signed-off-by: George McCollister <george.mccollister@gmail.com>
+
+
+Index: systemd-206/src/journal/journal-vacuum.c
+===================================================================
+--- systemd-206.orig/src/journal/journal-vacuum.c	2013-07-21 19:43:28.146183128 -0300
++++ systemd-206/src/journal/journal-vacuum.c	2014-01-29 20:43:27.492343295 -0200
+@@ -129,9 +129,9 @@
+ }
+ 
+ static int journal_file_empty(int dir_fd, const char *name) {
+-        int fd, r;
++        int r;
+         le64_t n_entries;
+-
++        _cleanup_close_ int fd;
+         fd = openat(dir_fd, name, O_RDONLY|O_CLOEXEC|O_NOFOLLOW|O_NONBLOCK);
+         if (fd < 0)
+                 return -errno;
+
+Upstream-Status: Backport [207]
diff --git a/meta/recipes-core/systemd/systemd/journald-fix-vacuuming-of-archived-journals.patch b/meta/recipes-core/systemd/systemd/journald-fix-vacuuming-of-archived-journals.patch
new file mode 100644
index 0000000..7c59200
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/journald-fix-vacuuming-of-archived-journals.patch
@@ -0,0 +1,37 @@
+journald: fix vacuuming of archived journals
+d_name is modified on line 227 so if the entire journal name is needed
+again p must be used. Before this change when journal_file_empty was called
+on archived journals it would always return with -2.
+
+Signed-off-by: George McCollister <george.mccollister@gmail.com>
+
+Index: systemd-206/src/journal/journal-vacuum.c
+===================================================================
+--- systemd-206.orig/src/journal/journal-vacuum.c	2014-01-29 20:43:27.492343295 -0200
++++ systemd-206/src/journal/journal-vacuum.c	2014-01-29 20:48:55.076356876 -0200
+@@ -265,18 +265,18 @@
+                         /* We do not vacuum active files or unknown files! */
+                         continue;
+ 
+-                if (journal_file_empty(dirfd(d), de->d_name)) {
++                if (journal_file_empty(dirfd(d), p)) {
+ 
+                         /* Always vacuum empty non-online files. */
+ 
+-                        if (unlinkat(dirfd(d), de->d_name, 0) >= 0)
+-                                log_debug("Deleted empty journal %s/%s.", directory, de->d_name);
++                        if (unlinkat(dirfd(d), p, 0) >= 0)
++                                log_debug("Deleted empty journal %s/%s.", directory, p);
+                         else if (errno != ENOENT)
+-                                log_warning("Failed to delete %s/%s: %m", directory, de->d_name);
++                                log_warning("Failed to delete %s/%s: %m", directory, p);
+                         continue;
+                 }
+ 
+-                patch_realtime(directory, de->d_name, &st, &realtime);
++                patch_realtime(directory, p, &st, &realtime);
+ 
+                 GREEDY_REALLOC(list, n_allocated, n_list + 1);
+
+
+Upstream-Status: Backport [207] 
diff --git a/meta/recipes-core/systemd/systemd_206.bb b/meta/recipes-core/systemd/systemd_206.bb
index a1a8bd7..e7d0f1f 100644
--- a/meta/recipes-core/systemd/systemd_206.bb
+++ b/meta/recipes-core/systemd/systemd_206.bb
@@ -21,6 +21,8 @@ SRC_URI = "http://www.freedesktop.org/software/systemd/systemd-${PV}.tar.xz \
            file://0001-use-CAP_MKNOD-ConditionCapability.patch \
            file://0001-Use-bin-mkdir-instead-of-host-mkdir-path.patch \
            file://binfmt-install.patch \
+           file://journald-fix-fd-leak-in-journal_file_empty.patch \
+           file://journald-fix-vacuuming-of-archived-journals.patch \
            file://touchscreen.rules \
            ${UCLIBCPATCHES} \
            file://00-create-volatile.conf \
-- 
1.8.3.1


