Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id B0B976F98E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Mar 2014 02:28:43 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s2R2Sier008864
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Mar 2014 19:28:44 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.218) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.169.1; Wed, 26 Mar 2014 19:28:43 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 27 Mar 2014 10:29:07 +0800
Message-ID: <dc876f2fd4fb312364f86f07fd1bd9267bca973b.1395887206.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1395887206.git.Qi.Chen@windriver.com>
References: <cover.1395887206.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] image.bbclass: replace rootfs with /dev/root
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
X-List-Received-Date: Thu, 27 Mar 2014 02:28:45 -0000
Content-Type: text/plain

Replace 'rootfs' with '/dev/root' in read_only_rootfs_hook function
to match the latest change in fstab file from the base-files recipe.

The related commit is as follows.

commit e8bc7a136a81a0d8df2d32dfba0920c1b2835141
    base-files: use /dev/root in /etc/fstab for systemd support

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/classes/image.bbclass |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index b0639ae..29309f5 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -175,7 +175,7 @@ do_rootfs[umask] = "022"
 read_only_rootfs_hook () {
 	if ${@base_contains("DISTRO_FEATURES", "sysvinit", "true", "false", d)}; then
 	        # Tweak the mount option and fs_passno for rootfs in fstab
-		sed -i -e '/^[#[:space:]]*rootfs/{s/defaults/ro/;s/\([[:space:]]*[[:digit:]]\)\([[:space:]]*\)[[:digit:]]$/\1\20/}' ${IMAGE_ROOTFS}/etc/fstab
+		sed -i -e '/^[#[:space:]]*\/dev\/root/{s/defaults/ro/;s/\([[:space:]]*[[:digit:]]\)\([[:space:]]*\)[[:digit:]]$/\1\20/}' ${IMAGE_ROOTFS}/etc/fstab
 	        # Change the value of ROOTFS_READ_ONLY in /etc/default/rcS to yes
 		if [ -e ${IMAGE_ROOTFS}/etc/default/rcS ]; then
 			sed -i 's/ROOTFS_READ_ONLY=no/ROOTFS_READ_ONLY=yes/' ${IMAGE_ROOTFS}/etc/default/rcS
-- 
1.7.9.5


