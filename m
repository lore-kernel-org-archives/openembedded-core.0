Return-Path: <Yi.Zhao@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2CBEA6612C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Nov 2016 10:07:46 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id uAGA7kqF016367
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Nov 2016 02:07:46 -0800 (PST)
Received: from localhost (128.224.162.198) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.294.0;
	Wed, 16 Nov 2016 02:07:45 -0800
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 16 Nov 2016 18:07:43 +0800
Message-ID: <1479290863-11438-1-git-send-email-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [128.224.162.198]
Subject: [PATCH] nfs-utils: fix protocol minor version fall-back
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
X-List-Received-Date: Wed, 16 Nov 2016 10:07:49 -0000
Content-Type: text/plain

Mount nfs directory would fail if no specific nfsvers:
mount -t nfs IP:/foo/bar/ /mnt/
mount.nfs: an incorrect mount option was specified

mount.nfs currently expects mount(2) to fail with EPROTONOSUPPORT if
the kernel doesn't understand the requested NFS version.
Unfortunately if the requested minor is not known to the kernel
it returns -EINVAL.

Backport patch from nfs-utils-1.3.4 to fix this issue.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../fix-protocol-minor-version-fall-back.patch     | 55 ++++++++++++++++++++++
 .../nfs-utils/nfs-utils_1.3.3.bb                   |  1 +
 2 files changed, 56 insertions(+)
 create mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/fix-protocol-minor-version-fall-back.patch

diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/fix-protocol-minor-version-fall-back.patch b/meta/recipes-connectivity/nfs-utils/nfs-utils/fix-protocol-minor-version-fall-back.patch
new file mode 100644
index 0000000..683246c
--- /dev/null
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils/fix-protocol-minor-version-fall-back.patch
@@ -0,0 +1,55 @@
+From 78bb645a42c216b37b8d930c7c849a3fa89babf8 Mon Sep 17 00:00:00 2001
+From: Takashi Iwai <tiwai@suse.com>
+Date: Sat, 16 Jan 2016 12:02:30 -0500
+Subject: [PATCH] Fix protocol minor version fall-back
+
+mount.nfs currently expects mount(2) to fail with EPROTONOSUPPORT if
+the kernel doesn't understand the requested NFS version.
+
+Unfortunately if the requested minor is not known to the kernel
+it returns -EINVAL.
+In kernels since 3.11 this can happen in nfs4_alloc_client(), if
+compiled without NFS_V4_2.
+
+More generally it can happen in in nfs_validate_text_mount_data()
+when nfs_parse_mount_options() returns 0 because
+nfs_parse_version_string()
+didn't recognise the version.
+
+EPROTONOSUPPORT is only returned if NFSv4 support is completely compiled
+out.
+
+So nfs_autonegotiate needs to check for EINVAL as well as
+EPROTONOSUPPORT.
+
+URL: https://bugzilla.opensuse.org/show_bug.cgi?id=959211
+Reported-by: Takashi Iwai <tiwai@suse.com>
+Signed-off-by: NeilBrown <neilb@suse.com>
+Signed-off-by: Steve Dickson <steved@redhat.com>
+
+
+Upstream-Status: Backport
+http://git.linux-nfs.org/?p=steved/nfs-utils.git;a=patch;h=78bb645a42c216b37b8d930c7c849a3fa89babf8
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ utils/mount/stropts.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/utils/mount/stropts.c b/utils/mount/stropts.c
+index c8f5a6d..86829a9 100644
+--- a/utils/mount/stropts.c
++++ b/utils/mount/stropts.c
+@@ -841,6 +841,9 @@ check_result:
+ 	case EPROTONOSUPPORT:
+ 		/* A clear indication that the server or our
+ 		 * client does not support NFS version 4 and minor */
++	case EINVAL:
++		/* A less clear indication that our client
++		 * does not support NFSv4 minor version. */
+ 		if (mi->version.v_mode == V_GENERAL &&
+ 			mi->version.minor == 0)
+ 				return result;
+-- 
+2.7.4
+
diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils_1.3.3.bb b/meta/recipes-connectivity/nfs-utils/nfs-utils_1.3.3.bb
index 8540503..a2bebe0 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils_1.3.3.bb
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils_1.3.3.bb
@@ -33,6 +33,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/nfs-utils/${PV}/nfs-utils-${PV}.tar.x
            file://nfs-utils-debianize-start-statd.patch \
            file://0001-nfs-utils-statd-fix-a-segfault-caused-by-improper-us.patch \
            file://bugfix-adjust-statd-service-name.patch \
+           file://fix-protocol-minor-version-fall-back.patch \
 "
 
 SRC_URI[md5sum] = "cd6b568c2e9301cc3bfac09d87fbbc0b"
-- 
2.7.4


