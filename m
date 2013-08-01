Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f172.google.com (mail-wi0-f172.google.com
	[209.85.212.172])
	by mail.openembedded.org (Postfix) with ESMTP id 921A86B1C1
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Aug 2013 09:07:54 +0000 (UTC)
Received: by mail-wi0-f172.google.com with SMTP id hj13so4303938wib.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Aug 2013 02:07:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=VbfGIp4vH4WW61uuWOk+XT0XjsRUBfd4XqLGTTZfZSg=;
	b=JJV+pDjjDpZLEvqxr29+xmlLHD9wB6Ds1iDIQz9qBzMmUXmMUgelK69MHUfL9/UznP
	MYYYHLz5x3v5w0Av2i+/02r33MnQ8C8wD+Xj/R6kFJbNT7Noro64EjCTFsfLCDinuuCG
	dAD67XLks51LeFB2Gror7Gc5nqnUYm28N2RAm7HC3AsGDFJ2E9TFz6Lv1mgqh9Ndlu25
	frRvcXPKjnlRMtSVfB7uVMY354FFg3p/btjeQx489qXQzz/3udzRwuHEwdbLWfExFQ1n
	cfltxfEtPBA1f5EbKug7ybqL4/5UL6HHr3C4XmEMQ5TGRhcepphesl/P8zj6Zd62h5t4
	DApQ==
X-Received: by 10.194.89.38 with SMTP id bl6mr459615wjb.21.1375348074615;
	Thu, 01 Aug 2013 02:07:54 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id s19sm2096969wik.11.2013.08.01.02.07.53
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 01 Aug 2013 02:07:53 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  1 Aug 2013 10:07:43 +0100
Message-Id: <1375348063-11910-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
X-Gm-Message-State: ALoCoQnUAo40O5Z/gZAeGZ1WE4A0OFgXtWtQVmY0BeGNcTgdkD33mlnQuidjVui2SDUgi77WeHxn
Subject: [PATCH] u-boot: state the MACHINE when skipping u-boot
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
X-List-Received-Date: Thu, 01 Aug 2013 09:07:54 -0000

If the user accidently tries building u-boot on a machine doesn't use u-boot
(such as qemuarm) the error message doesn't make it clear why u-boot was
skipped.  To help, state the machine that was being built for again.

[ YOCTO #4945 ]

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-bsp/u-boot/u-boot.inc |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot/u-boot.inc
index 6bbe457..769c941 100644
--- a/meta/recipes-bsp/u-boot/u-boot.inc
+++ b/meta/recipes-bsp/u-boot/u-boot.inc
@@ -13,7 +13,7 @@ python () {
 		FILE = os.path.basename(d.getVar("FILE", True))
 		bb.debug(1, "To build %s, see %s for instructions on \
 			     setting up your machine config" % (PN, FILE))
-		raise bb.parse.SkipPackage("because UBOOT_MACHINE is not set")
+		raise bb.parse.SkipPackage("UBOOT_MACHINE is not set in the ${MACHINE} machine configuration.")
 }
 
 # Allow setting an additional version string that will be picked up by the
-- 
1.7.10.4


