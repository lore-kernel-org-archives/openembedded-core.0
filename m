Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web12.25098.1593335573183074982
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Jun 2020 02:12:53 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: wenlin.kang@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 05S9CLpI013634
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Sun, 28 Jun 2020 02:12:41 -0700
Received: from ala-lpggp3.wrs.com (147.11.105.124) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.50) with Microsoft SMTP Server id 14.3.487.0; Sun, 28 Jun 2020
 02:12:13 -0700
From: "wenlin.kang@windriver.com" <wenlin.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][zeus][PATCH] nfs-utils: fix CVE-2019-3689
Date: Sun, 28 Jun 2020 02:12:13 -0700
Message-ID: <20200628091213.159102-1-wenlin.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

Fix CVE-2019-3689

Signed-off-by: Wenlin Kang <wenlin.kang@windriver.com>
---
 ...atd-take-user-id-from-var-lib-nfs-sm.patch | 102 ++++++++++++++++++
 .../nfs-utils/nfs-utils_2.4.1.bb              |   1 +
 2 files changed, 103 insertions(+)
 create mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/0001-statd-take-user-id-from-var-lib-nfs-sm.patch

diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-statd-take-user-id-from-var-lib-nfs-sm.patch b/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-statd-take-user-id-from-var-lib-nfs-sm.patch
new file mode 100644
index 0000000000..21fed52233
--- /dev/null
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-statd-take-user-id-from-var-lib-nfs-sm.patch
@@ -0,0 +1,102 @@
+From 12ee0ff1120a6e42b67cc90ad7d5006555e866c3 Mon Sep 17 00:00:00 2001
+From: NeilBrown <neilb@suse.de>
+Date: Tue, 23 Jun 2020 09:22:22 +0000
+Subject: [PATCH] statd: take user-id from /var/lib/nfs/sm
+
+Having /var/lib/nfs writeable by statd is not ideal
+as there are files in there that statd doesn't need
+to access.
+After dropping privs, statd and sm-notify only need to
+access files in the directories sm and sm.bak.
+So take the uid for these deamons from 'sm'.
+
+Upsteam-Status: Backport [https://git.linux-nfs.org/?p=steved/nfs-utils.git;a=commitdiff;h=fee2cc29e888f2ced6a76990923aef19d326dc0e]
+CVE: CVE-2019-3689
+
+Signed-off-by: NeilBrown <neilb@suse.de>
+Signed-off-by: Steve Dickson <steved@redhat.com>
+Signed-off-by: Wenlin Kang <wenlin.kang@windriver.com>
+---
+ support/nsm/file.c        | 16 +++++-----------
+ utils/statd/sm-notify.man | 10 +++++++++-
+ utils/statd/statd.man     | 10 +++++++++-
+ 3 files changed, 23 insertions(+), 13 deletions(-)
+
+diff --git a/support/nsm/file.c b/support/nsm/file.c
+index 0b66f12..f5b4480 100644
+--- a/support/nsm/file.c
++++ b/support/nsm/file.c
+@@ -388,23 +388,17 @@ nsm_drop_privileges(const int pidfd)
+ 
+ 	(void)umask(S_IRWXO);
+ 
+-	/*
+-	 * XXX: If we can't stat dirname, or if dirname is owned by
+-	 *      root, we should use "statduser" instead, which is set up
+-	 *      by configure.ac.  Nothing in nfs-utils seems to use
+-	 *      "statduser," though.
+-	 */
+-	if (lstat(nsm_base_dirname, &st) == -1) {
+-		xlog(L_ERROR, "Failed to stat %s: %m", nsm_base_dirname);
+-		return false;
+-	}
+-
+ 	if (chdir(nsm_base_dirname) == -1) {
+ 		xlog(L_ERROR, "Failed to change working directory to %s: %m",
+ 				nsm_base_dirname);
+ 		return false;
+ 	}
+ 
++	if (lstat(NSM_MONITOR_DIR, &st) == -1) {
++		xlog(L_ERROR, "Failed to stat %s/%s: %m", nsm_base_dirname, NSM_MONITOR_DIR);
++		return false;
++	}
++
+ 	if (!prune_bounding_set())
+ 		return false;
+ 
+diff --git a/utils/statd/sm-notify.man b/utils/statd/sm-notify.man
+index cfe1e4b..addf5d3 100644
+--- a/utils/statd/sm-notify.man
++++ b/utils/statd/sm-notify.man
+@@ -190,7 +190,15 @@ by default.
+ After starting,
+ .B sm-notify
+ attempts to set its effective UID and GID to the owner
+-and group of this directory.
++and group of the subdirectory
++.B sm
++of this directory.  After changing the effective ids,
++.B sm-notify
++only needs to access files in
++.B sm
++and
++.B sm.bak
++within the state-directory-path.
+ .TP
+ .BI -v " ipaddr " | " hostname
+ Specifies the network address from which to send reboot notifications,
+diff --git a/utils/statd/statd.man b/utils/statd/statd.man
+index 71d5846..6222701 100644
+--- a/utils/statd/statd.man
++++ b/utils/statd/statd.man
+@@ -259,7 +259,15 @@ by default.
+ After starting,
+ .B rpc.statd
+ attempts to set its effective UID and GID to the owner
+-and group of this directory.
++and group of the subdirectory
++.B sm
++of this directory.  After changing the effective ids,
++.B rpc.statd
++only needs to access files in
++.B sm
++and
++.B sm.bak
++within the state-directory-path.
+ .TP
+ .BR -v ", " -V ", " --version
+ Causes
+-- 
+2.23.0
+
diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.4.1.bb b/meta/recipes-connectivity/nfs-utils/nfs-utils_2.4.1.bb
index 3ae8f965c8..458e534864 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.4.1.bb
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils_2.4.1.bb
@@ -34,6 +34,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/nfs-utils/${PV}/nfs-utils-${PV}.tar.x
            file://0001-Don-t-build-tools-with-CC_FOR_BUILD.patch \
            file://0001-Fix-include-order-between-config.h-and-stat.h.patch \
            file://0001-Disable-statx-if-using-glibc-emulation.patch \
+           file://0001-statd-take-user-id-from-var-lib-nfs-sm.patch \
 "
 SRC_URI_append_libc-glibc = " file://0001-configure.ac-Do-not-fatalize-Wmissing-prototypes.patch"
 SRC_URI_append_libc-musl = " file://nfs-utils-musl-res_querydomain.patch"
-- 
2.17.1

