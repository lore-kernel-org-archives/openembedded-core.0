Return-Path: <angelo@sysam.it>
X-Greylist: delayed 367 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 03 Oct 2018 18:19:15 UTC
Received: from sysam.it (ec2-18-194-220-216.eu-central-1.compute.amazonaws.com
	[18.194.220.216])
	by mail.openembedded.org (Postfix) with ESMTP id 93D1379274
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Oct 2018 18:19:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by sysam.it (Postfix) with ESMTP id C8DD7205BD;
	Wed,  3 Oct 2018 18:13:09 +0000 (UTC)
Received: from sysam.it ([127.0.0.1])
	by localhost (sysam.it [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zDowlGTn2loI; Wed,  3 Oct 2018 18:13:08 +0000 (UTC)
Received: from localhost.localdomain
	(host238-237-dynamic.44-79-r.retail.telecomitalia.it [79.44.237.238])
	by sysam.it (Postfix) with ESMTPSA id 8FC86205BB;
	Wed,  3 Oct 2018 18:13:08 +0000 (UTC)
From: Angelo Dureghello <angelo@sysam.it>
To: openembedded-core@lists.openembedded.org
Date: Wed,  3 Oct 2018 20:13:06 +0200
Message-Id: <20181003181306.1114-1-angelo@sysam.it>
X-Mailer: git-send-email 2.11.0
Cc: marex@denx.de, Angelo Dureghello <angelo@sysam.it>
Subject: [PATCH] kernel-uboot.bbclass: fix image format for root-located vmlinux
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
X-List-Received-Date: Wed, 03 Oct 2018 18:19:15 -0000

In case vmlinux is located in the Linux source root, it must still
be considered as _not_ compressed.

Signed-off-by: Angelo Dureghello <angelo@sysam.it>
---
 meta/classes/kernel-uboot.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/kernel-uboot.bbclass b/meta/classes/kernel-uboot.bbclass
index 2364053f31..dd5f8a7b65 100644
--- a/meta/classes/kernel-uboot.bbclass
+++ b/meta/classes/kernel-uboot.bbclass
@@ -15,8 +15,8 @@ uboot_prep_kimage() {
 		linux_comp="none"
 	else
 		vmlinux_path="vmlinux"
-		linux_suffix=".gz"
-		linux_comp="gzip"
+		linux_suffix=""
+		linux_comp="none"
 	fi
 
 	[ -n "${vmlinux_path}" ] && ${OBJCOPY} -O binary -R .note -R .comment -S "${vmlinux_path}" linux.bin
-- 
2.11.0


