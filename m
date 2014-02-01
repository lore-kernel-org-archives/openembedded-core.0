Return-Path: <diego.sueiro@gmail.com>
Received: from mail-yk0-f169.google.com (mail-yk0-f169.google.com
	[209.85.160.169])
	by mail.openembedded.org (Postfix) with ESMTP id BDC4C6E9D0
	for <openembedded-core@lists.openembedded.org>;
	Sat,  1 Feb 2014 09:07:43 +0000 (UTC)
Received: by mail-yk0-f169.google.com with SMTP id q9so29000190ykb.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 01 Feb 2014 01:07:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=13+zUeqZIH3934jlIl/g7n80WFY8fCutcUlujNIYodI=;
	b=PEdLT7qzXd+0GPHipeGO5495qvywtZ3Rjg4rq1PYYzRGdM5ChRPKNEC6BR2LO6Tcis
	EhlglymPr3q0iZXRjzbaaBvz8y1cv2WHID0tKJbNBC2+j/uX0X97YalvgL/SfRgC00Sz
	J1eDkSS22GJRCbWky0bDGyo9Ik5DKzSgsiD7xYyxfrP1HEVVd+UicJcsJcKXtiTvnBKC
	RGH5ocePQyuWxdROcPYo0oRfSBqpYoU5hNO5iwk+ixj/ATZfAz+v/SoO0zcN2yAen/vB
	LdofhGRdHwL5jcEaRTULJ2fSqYLfVxsWWoa/3vs+m4PS126CkZat9mysQryULj+gNMIH
	HU7g==
X-Received: by 10.236.158.226 with SMTP id q62mr23546393yhk.2.1391245664626;
	Sat, 01 Feb 2014 01:07:44 -0800 (PST)
Received: from localhost.localdomain ([187.106.25.157])
	by mx.google.com with ESMTPSA id
	o27sm43668646yhb.19.2014.02.01.01.07.43 for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 01 Feb 2014 01:07:44 -0800 (PST)
From: Diego Sueiro <diego.sueiro@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  1 Feb 2014 07:07:11 -0200
Message-Id: <1391245631-10681-1-git-send-email-diego.sueiro@gmail.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [for-dora] systemd: journald fix ignored disk space restrictions
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
X-List-Received-Date: Sat, 01 Feb 2014 09:07:44 -0000

The upstream bug report can be seen at:
[Systemd #68161] -- https://bugs.freedesktop.org/show_bug.cgi?id=68161

This backports patches come from 207 and need to address this in the 206 version for dora branch.

Signed-off-by: Diego Sueiro <diego.sueiro@gmail.com>
---
 ...ournald-fix-fd-leak-in-journal_file_empty.patch |   27 ++++++++++++++
 ...urnald-fix-vacuuming-of-archived-journals.patch |   37 ++++++++++++++++++++
 meta/recipes-core/systemd/systemd_206.bb           |    2 ++
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
1.7.10.4


