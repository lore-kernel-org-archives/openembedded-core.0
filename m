Received: from mga05.intel.com (mga05.intel.com [])
 by mx.groups.io with SMTP id smtpd.web10.2077.1593651261154006625
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jul 2020 17:54:21 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: /wh9LlO81IEgviyK8oe1LDG7gqHQ2Ig5xjhqJKnTacHHPQjDOPr5Cl/MUVW2zTlGPdumwINCp5
 p23uyI68swWA==
X-IronPort-AV: E=McAfee;i="6000,8403,9669"; a="231628768"
X-IronPort-AV: E=Sophos;i="5.75,302,1589266800"; 
   d="scan'208";a="231628768"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2020 17:54:21 -0700
IronPort-SDR: 7Y9UUdL4MVNQtQNZJyd2zoO4Y7kO5rJnlxB/vH/tUEl4C++1Nszy0A9NHn0SKWHy9PiEhwZKlQ
 aylHSDiPkSqA==
X-IronPort-AV: E=Sophos;i="5.75,302,1589266800"; 
   d="scan'208";a="481801493"
Received: from anmitta2-mobl1.gar.corp.intel.com ([10.249.69.56])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2020 17:54:20 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [zeus][PATCH 01/10] nfs-utils: fix CVE-2019-3689
Date: Thu,  2 Jul 2020 08:54:03 +0800
Message-Id: <15186556c7e6ccdb3a308c90563f61b0bbd57407.1593474787.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <cover.1593474787.git.anuj.mittal@intel.com>
References: <cover.1593474787.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "wenlin.kang@windriver.com" <wenlin.kang@windriver.com>

Fix CVE-2019-3689

Signed-off-by: Wenlin Kang <wenlin.kang@windriver.com>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 ...atd-take-user-id-from-var-lib-nfs-sm.patch | 102 ++++++++++++++++++
 .../nfs-utils/nfs-utils_2.4.1.bb              |   1 +
 2 files changed, 103 insertions(+)
 create mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/0001-statd-take-user-id-from-var-lib-nfs-sm.patch

diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-statd-take-user-id-from-var-lib-nfs-sm.patch b/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-statd-take-user-id-from-var-lib-nfs-sm.patch
new file mode 100644
index 0000000000..87f4f098e0
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
+Upstream-Status: Backport [https://git.linux-nfs.org/?p=steved/nfs-utils.git;a=commitdiff;h=fee2cc29e888f2ced6a76990923aef19d326dc0e]
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
2.25.4

