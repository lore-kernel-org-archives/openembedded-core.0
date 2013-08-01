Return-Path: <ross.burton@intel.com>
Received: from mail-we0-f175.google.com (mail-we0-f175.google.com
	[74.125.82.175])
	by mail.openembedded.org (Postfix) with ESMTP id 9AF5C6B1C1
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Aug 2013 10:07:40 +0000 (UTC)
Received: by mail-we0-f175.google.com with SMTP id q58so1520296wes.20
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Aug 2013 03:07:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=CvmQ2uYtnO88YVM/eXbF/XK5CtWXabkzkZZO9Y8N7+E=;
	b=OR8nmMu5dog60uiXmv2vso1NzYuPLBD++9Pj6Ds36hzkchMcKKUKlo1lOiOTeKIXJ6
	7peGSSJgKWQrsDsd7ZAxtIbzCwZCrn33GSrfugYeqajiXU1GA0sSjHlfiCmNilqQvViM
	cuILTPuZagNHvoQF6LqL7wK8wivsUdXgq/gMNLyFsvsNblxArPQegdhyJcUJX/5eXc/z
	OZiQf+86IY/iT6+KYvOkA3txaGUt0p17os11UvBTyH8ZnwSfxleHiVxCdoNKzY0J2rcH
	VJ1il7EHIXfAKJdgbZjTTMoJn8dwYsAmoD5pyBwaZCv/Lk84sDGzZqyZrkBKZguVHdgr
	2piQ==
X-Received: by 10.194.8.72 with SMTP id p8mr590249wja.71.1375351660558;
	Thu, 01 Aug 2013 03:07:40 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id s19sm2457530wik.11.2013.08.01.03.07.39
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 01 Aug 2013 03:07:39 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  1 Aug 2013 11:07:36 +0100
Message-Id: <1375351656-12261-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
X-Gm-Message-State: ALoCoQmzEU4XuPnPCiVgNFNlpSBf1Tpfc+A6Q9XS6gJNxUEuu6RaDnaxydz0daz4/Lpbzu8jYTFL
Subject: [PATCH][V2] u-boot: state the MACHINE when skipping u-boot
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
X-List-Received-Date: Thu, 01 Aug 2013 10:07:41 -0000

If the user accidently tries building u-boot on a machine doesn't use u-boot
(such as qemuarm) the error message doesn't make it clear why u-boot was
skipped.  To help, state the machine that was being built for again.

[ YOCTO #4945 ]

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-bsp/u-boot/u-boot.inc |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot/u-boot.inc
index 6bbe457..6ec63df 100644
--- a/meta/recipes-bsp/u-boot/u-boot.inc
+++ b/meta/recipes-bsp/u-boot/u-boot.inc
@@ -13,7 +13,7 @@ python () {
 		FILE = os.path.basename(d.getVar("FILE", True))
 		bb.debug(1, "To build %s, see %s for instructions on \
 			     setting up your machine config" % (PN, FILE))
-		raise bb.parse.SkipPackage("because UBOOT_MACHINE is not set")
+		raise bb.parse.SkipPackage("UBOOT_MACHINE is not set in the %s machine configuration." % d.getVar("MACHINE", True))
 }
 
 # Allow setting an additional version string that will be picked up by the
-- 
1.7.10.4


