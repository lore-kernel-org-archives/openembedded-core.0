Return-Path: <tom.rini@gmail.com>
Received: from mail-yw0-f194.google.com (mail-yw0-f194.google.com
	[209.85.161.194])
	by mail.openembedded.org (Postfix) with ESMTP id 181B060053
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Feb 2018 14:16:59 +0000 (UTC)
Received: by mail-yw0-f194.google.com with SMTP id q6so10512486ywg.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Feb 2018 06:17:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=N0r2CPZa4CdFxeXKeRr9ermMjOW9raeua3FjbwG+pLM=;
	b=FaKjEC9zcX0LJe3ubc4aa+Wjq4XghVB6EVw1vkWO5ySE2mKrBh+1fXnTDuAvTEAf9N
	tbjcyyPvfaNoNsQqsabi9mrfsf9JK0xBgy8Y2r6LFGnI89ooVl3sCqaIcyIMeXYsp+nr
	9VrIlQ0INOmsPCgkQI/LhduPxJLlHbZT2cjr/ExZwiXGDgz/WvzB++X9fBQ6BWYkfWtu
	wemZJTMZb6GrEbZokwfutRhEIcvzT2icdHeUUb0G7PP4cjWVZmLoKTTxbWXoYBcke6zS
	/9OR6aqtxXNS3ODdsYQIVJOw53R7MAcYEtNI2yxwZM4K+mzKdUb7IDr8xvJL0EUrVA5K
	wOOw==
X-Gm-Message-State: AKwxyte1fiFNXhdH5aEIw3xJ95dzS+6kYl4OUi+s66oPwiZSLopOtp1n
	cYqKazFiG2lUVdh7RHjNR8oH
X-Google-Smtp-Source: AH8x224Q7OhHkv/8LiVacVihQJSaoPaY7Bs7l10+SOUEDFRb5SP3Ru3cDu8W2sBNmFyH0nNd8/KrgQ==
X-Received: by 10.129.211.6 with SMTP id y6mr24274403ywi.168.1517494620849;
	Thu, 01 Feb 2018 06:17:00 -0800 (PST)
Received: from localhost.localdomain (cpe-65-184-142-68.ec.res.rr.com.
	[65.184.142.68]) by smtp.gmail.com with ESMTPSA id
	z19sm7181406ywg.102.2018.02.01.06.17.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 01 Feb 2018 06:17:00 -0800 (PST)
From: Tom Rini <trini@konsulko.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  1 Feb 2018 09:16:56 -0500
Message-Id: <1517494616-26067-1-git-send-email-trini@konsulko.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1517420847-7592-1-git-send-email-trini@konsulko.com>
References: <1517420847-7592-1-git-send-email-trini@konsulko.com>
Subject: [PATCHv3] security_flags.inc, xorg-driver-common.inc: Move SECURITY_X_LDFLAGS logic
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
X-List-Received-Date: Thu, 01 Feb 2018 14:17:00 -0000

We need to ensure that all xorg modules are linked with
SECURITY_X_LDFLAGS to ensure that they will be able to resolve their run
time dependencies.  The approach of listing each driver in
security_flags.inc lets less frequently used drivers be run-time
broken.  Move the flag logic into xorg-driver-common.inc so that all
xorg modules from all layers will have the correct security flags used.

Cc: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Tom Rini <trini@konsulko.com>
---
Changes in v3:
- After reviewing fixing the drivers in meta-openembedded/meta-oe if we
  move this logic into the common xf86 drivers inc file that all
  layers use to correctly make these drivers, all layers will get this
  fix for free if we move to overriding there instead.  Add a comment to
  security_flags.inc for future reference.
Changes in v2:
- Oops, can't use % globbing in security_flags.inc, grabs brown paper
  bag
---
 meta/conf/distro/include/security_flags.inc              | 8 ++------
 meta/recipes-graphics/xorg-driver/xorg-driver-common.inc | 2 ++
 2 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/meta/conf/distro/include/security_flags.inc b/meta/conf/distro/include/security_flags.inc
index 7ea1049edff8..49d2417a882f 100644
--- a/meta/conf/distro/include/security_flags.inc
+++ b/meta/conf/distro/include/security_flags.inc
@@ -59,12 +59,8 @@ TARGET_LDFLAGS_append_class-target = " ${SECURITY_LDFLAGS}"
 SECURITY_LDFLAGS_remove_pn-gcc-runtime = "-fstack-protector-strong"
 SECURITY_LDFLAGS_remove_pn-glibc = "-fstack-protector-strong"
 SECURITY_LDFLAGS_remove_pn-glibc-initial = "-fstack-protector-strong"
-SECURITY_LDFLAGS_pn-xf86-video-fbdev = "${SECURITY_X_LDFLAGS}"
-SECURITY_LDFLAGS_pn-xf86-video-intel = "${SECURITY_X_LDFLAGS}"
-SECURITY_LDFLAGS_pn-xf86-video-omapfb = "${SECURITY_X_LDFLAGS}"
-SECURITY_LDFLAGS_pn-xf86-video-omap = "${SECURITY_X_LDFLAGS}"
-SECURITY_LDFLAGS_pn-xf86-video-vesa = "${SECURITY_X_LDFLAGS}"
-SECURITY_LDFLAGS_pn-xf86-video-vmware = "${SECURITY_X_LDFLAGS}"
+# All xorg module drivers need to be linked this way as well and are
+# handled in recipes-graphics/xorg-driver/xorg-driver-common.inc
 SECURITY_LDFLAGS_pn-xserver-xorg = "${SECURITY_X_LDFLAGS}"
 
 TARGET_CC_ARCH_append_pn-binutils = " ${SELECTED_OPTIMIZATION}"
diff --git a/meta/recipes-graphics/xorg-driver/xorg-driver-common.inc b/meta/recipes-graphics/xorg-driver/xorg-driver-common.inc
index fe42f11b6898..bca0aade6cb5 100644
--- a/meta/recipes-graphics/xorg-driver/xorg-driver-common.inc
+++ b/meta/recipes-graphics/xorg-driver/xorg-driver-common.inc
@@ -38,3 +38,5 @@ def _add_xorg_abi_depends(d, name):
 
     pn = d.getVar("PN")
     d.appendVar('RDEPENDS_' + pn, ' ' + abi)
+
+SECURITY_LDFLAGS = "${SECURITY_X_LDFLAGS}"
-- 
2.7.4


