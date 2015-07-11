Return-Path: <ricardo.neri-calderon@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 9E44873695
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 Jul 2015 00:41:35 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga103.fm.intel.com with ESMTP; 10 Jul 2015 17:41:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,451,1432623600"; d="scan'208";a="726755089"
Received: from ranerica-desk01.sc.intel.com ([10.3.52.73])
	by orsmga001.jf.intel.com with ESMTP; 10 Jul 2015 17:41:34 -0700
From: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 10 Jul 2015 17:41:03 -0700
Message-Id: <1436575263-22445-1-git-send-email-ricardo.neri-calderon@linux.intel.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] bootimg.bbclass:iso: determine the -iso-level only if there is a rootfs
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
X-List-Received-Date: Sat, 11 Jul 2015 00:41:40 -0000

It may be possible that some bootable images do not use a rootfs; this
may be the case if the bootable image utilize only an initrd for all its
needs.

If there is not rootfs, the size calculation will fail. Furthermore, given
that the iso9660 conformance level is determined using the size of rootfs,
it makes sense to not make the calculation if there is not such rootfs.

Signed-off-by: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
---
 meta/classes/bootimg.bbclass | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/meta/classes/bootimg.bbclass b/meta/classes/bootimg.bbclass
index 2fd3efb..0a4546e 100644
--- a/meta/classes/bootimg.bbclass
+++ b/meta/classes/bootimg.bbclass
@@ -154,11 +154,14 @@ build_iso() {
 	# when it exceeds 3.8GB, the specification is 4G - 1 bytes, we need
 	# leave a few space for other files.
 	mkisofs_iso_level=""
-	rootfs_img_size=`stat -c '%s' ${ISODIR}/rootfs.img`
-	# 4080218931 = 3.8 * 1024 * 1024 * 1024
-	if [ $rootfs_img_size -gt 4080218931 ]; then
-		bbnote "${ISODIR}/rootfs.img execeeds 3.8GB, using '-iso-level 3' for mkisofs"
-		mkisofs_iso_level="-iso-level 3"
+
+        if [ -n "${ROOTFS}" ] && [ -s "${ROOTFS}" ]; then
+		rootfs_img_size=`stat -c '%s' ${ISODIR}/rootfs.img`
+		# 4080218931 = 3.8 * 1024 * 1024 * 1024
+		if [ $rootfs_img_size -gt 4080218931 ]; then
+			bbnote "${ISODIR}/rootfs.img execeeds 3.8GB, using '-iso-level 3' for mkisofs"
+			mkisofs_iso_level="-iso-level 3"
+		fi
 	fi
 
 	if [ "${PCBIOS}" = "1" ] && [ "${EFI}" != "1" ] ; then
-- 
1.9.1


