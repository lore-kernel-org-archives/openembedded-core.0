Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1UPokl-0005sO-RI
	for openembedded-core@lists.openembedded.org;
	Wed, 10 Apr 2013 08:43:40 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 09 Apr 2013 23:25:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,444,1363158000"; d="scan'208";a="225391114"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.14.7])
	by AZSMGA002.ch.intel.com with ESMTP; 09 Apr 2013 23:25:54 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  9 Apr 2013 23:25:54 -0700
Message-Id: <1365575154-25919-2-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.0.2
In-Reply-To: <1365575154-25919-1-git-send-email-sgw@linux.intel.com>
References: <1365575154-25919-1-git-send-email-sgw@linux.intel.com>
Subject: [PATCH 2/2] busybox: fail on no media
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 10 Apr 2013 06:43:45 -0000

The current behaviour of busybox is to try all fstype when automounting
even when no media exists.  The util-linux mount command bails when no
media exists, so change the behaviour of busybox to do the same.

It could also be argued that the KERN_INFO message from btrfs could be
removed, but that would be harder to accomplish.

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../busybox/busybox-1.20.2/fail_on_no_media.patch  | 24 ++++++++++++++++++++++
 meta/recipes-core/busybox/busybox_1.20.2.bb        |  3 ++-
 2 files changed, 26 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-core/busybox/busybox-1.20.2/fail_on_no_media.patch

diff --git a/meta/recipes-core/busybox/busybox-1.20.2/fail_on_no_media.patch b/meta/recipes-core/busybox/busybox-1.20.2/fail_on_no_media.patch
new file mode 100644
index 0000000..166c619
--- /dev/null
+++ b/meta/recipes-core/busybox/busybox-1.20.2/fail_on_no_media.patch
@@ -0,0 +1,24 @@
+Upstream-Status: Pending
+
+Signed-off-by: Saul Wold <sgw@linux.intel.com>
+
+
+Index: busybox-1.20.2/util-linux/mount.c
+===================================================================
+--- busybox-1.20.2.orig/util-linux/mount.c
++++ busybox-1.20.2/util-linux/mount.c
+@@ -598,7 +598,13 @@ static int mount_it_now(struct mntent *m
+ 				break;
+ 			errno = errno_save;
+ 		}
+-
++		/*
++		 * Break if there is no media, no point retrying for all
++		 * fs types since there is no media available
++		 */
++		if ((rc == -1) && (errno == ENOMEDIUM || errno == ENODEV)) {
++			bb_perror_msg_and_die("mounting %s on %s failed", mp->mnt_fsname, mp->mnt_dir);
++		}
+ 		if (!rc || (vfsflags & MS_RDONLY) || (errno != EACCES && errno != EROFS))
+ 			break;
+ 		if (!(vfsflags & MS_SILENT))
diff --git a/meta/recipes-core/busybox/busybox_1.20.2.bb b/meta/recipes-core/busybox/busybox_1.20.2.bb
index c09a492..401c1eb 100644
--- a/meta/recipes-core/busybox/busybox_1.20.2.bb
+++ b/meta/recipes-core/busybox/busybox_1.20.2.bb
@@ -31,7 +31,8 @@ SRC_URI = "http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://busybox-syslog.service.in \
            file://busybox-klogd.service.in \
            file://testsuite-du-du-k-works-fix-false-positive.patch \
-           file://strict-atime.patch"
+           file://strict-atime.patch \
+           file://fail_on_no_media.patch"
 
 SRC_URI[tarball.md5sum] = "e025414bc6cd79579cc7a32a45d3ae1c"
 SRC_URI[tarball.sha256sum] = "eb13ff01dae5618ead2ef6f92ba879e9e0390f9583bd545d8789d27cf39b6882"
-- 
1.8.0.2



