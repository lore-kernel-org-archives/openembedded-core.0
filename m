Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 50A93708F5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Jul 2014 03:08:28 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s6T38Q9J002195
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 28 Jul 2014 20:08:26 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.187) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Mon, 28 Jul 2014 20:08:26 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 29 Jul 2014 11:08:42 +0800
Message-ID: <b7b34860b464f0d480b9707ce99340ed3075f994.1406603221.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1406603221.git.Qi.Chen@windriver.com>
References: <cover.1406603221.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Cc: clarson@kergoth.com
Subject: [PATCH V2 3/3] image.bbclass: tweak read_only_rootfs_hook to also support systemd based systems
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
X-List-Received-Date: Tue, 29 Jul 2014 03:08:28 -0000
Content-Type: text/plain

Modify the read_only_rootfs_hook function to make it also have effect
on systemd based systems.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/classes/image.bbclass |    5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index da13bb8..82605f2 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -199,9 +199,10 @@ do_rootfs[umask] = "022"
 # A hook function to support read-only-rootfs IMAGE_FEATURES
 # Currently, it only supports sysvinit system.
 read_only_rootfs_hook () {
+	# Tweak the mount option and fs_passno for rootfs in fstab
+	sed -i -e '/^[#[:space:]]*\/dev\/root/{s/defaults/ro/;s/\([[:space:]]*[[:digit:]]\)\([[:space:]]*\)[[:digit:]]$/\1\20/}' ${IMAGE_ROOTFS}/etc/fstab
+
 	if ${@bb.utils.contains("DISTRO_FEATURES", "sysvinit", "true", "false", d)}; then
-	        # Tweak the mount option and fs_passno for rootfs in fstab
-		sed -i -e '/^[#[:space:]]*\/dev\/root/{s/defaults/ro/;s/\([[:space:]]*[[:digit:]]\)\([[:space:]]*\)[[:digit:]]$/\1\20/}' ${IMAGE_ROOTFS}/etc/fstab
 	        # Change the value of ROOTFS_READ_ONLY in /etc/default/rcS to yes
 		if [ -e ${IMAGE_ROOTFS}/etc/default/rcS ]; then
 			sed -i 's/ROOTFS_READ_ONLY=no/ROOTFS_READ_ONLY=yes/' ${IMAGE_ROOTFS}/etc/default/rcS
-- 
1.7.9.5


