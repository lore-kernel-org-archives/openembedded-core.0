Return-Path: <liu.ming50@gmail.com>
Received: from mail-lf0-f42.google.com (mail-lf0-f42.google.com
	[209.85.215.42])
	by mail.openembedded.org (Postfix) with ESMTP id 1F1C46057B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Dec 2015 21:20:29 +0000 (UTC)
Received: by mail-lf0-f42.google.com with SMTP id p203so234025107lfa.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Dec 2015 13:20:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=ubM38aIJIAz+jguztHdGhl+vVRh3Mx/HKy7sw8p3+bU=;
	b=G1R3a96Gk6Ai+sJJl8G/rYB1f7p64Z8SS8QehxCGf11/LOGARamtUQvKm6u15uxpwy
	DsL4S5F71vghnhLDH/mMKg08KenxmisO1ejUYfnXVjkKtg0iw4o50Rrg7yBTN0OkgKZq
	ZTxvnSwuvTIhd0/jllcoBM7wJfSwjaVuSOuyRn2j4IebpRiUHKdTrV5u1HkQP/sENENi
	gtfUzyJr+TRXTtZrjy7Y2rd9szEguuBoEgPD0LqdGeWzDxMmvbBN1cFSjEsggqGiL18i
	6DS2y+IbOcH/AFXBLWUMgPcJ0owDmk9h6ZMLNal5MdP+cOchYp1CWDdaR+Mv9iP3/hpm
	fkXA==
X-Received: by 10.25.40.205 with SMTP id o196mr25644069lfo.116.1451510429489; 
	Wed, 30 Dec 2015 13:20:29 -0800 (PST)
Received: from localhost.localdomain (c80-217-62-231.bredband.comhem.se.
	[80.217.62.231]) by smtp.gmail.com with ESMTPSA id
	h82sm12247544lfh.27.2015.12.30.13.20.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 30 Dec 2015 13:20:28 -0800 (PST)
From: Ming Liu <liu.ming50@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 30 Dec 2015 22:19:58 +0100
Message-Id: <1451510400-7446-1-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 1.9.1
Cc: bruce.ashfield@windriver.com, yue.tao@windriver.com,
	Ming Liu <peter.x.liu@external.atlascopco.com>
Subject: [PATCH V1 1/3] kernel.bbclass: do not install initramfs bundled kernel image
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
X-List-Received-Date: Wed, 30 Dec 2015 21:20:30 -0000

From: Ming Liu <peter.x.liu@external.atlascopco.com>

It makes no sense to install a initramfs bundled kernel image since
do_package does not depend on do_bundle_initramfs at all, otherwise, it
leads to a impicit kernel-image package depending on do_package run before
or after do_bundle_initramfs.

Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
---
 meta/classes/kernel.bbclass | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 4ce1611..d1ca614 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -179,10 +179,6 @@ do_bundle_initramfs () {
 		kernel_do_compile
 		mv -f ${KERNEL_OUTPUT} ${KERNEL_OUTPUT}.initramfs
 		mv -f ${KERNEL_OUTPUT}.bak ${KERNEL_OUTPUT}
-		# Update install area
-		echo "There is kernel image bundled with initramfs: ${B}/${KERNEL_OUTPUT}.initramfs"
-		install -m 0644 ${B}/${KERNEL_OUTPUT}.initramfs ${D}/boot/${KERNEL_IMAGETYPE}-initramfs-${MACHINE}.bin
-		echo "${B}/${KERNEL_OUTPUT}.initramfs"
 	fi
 }
 
-- 
1.9.1


