Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3620EC44502
	for <webhook@archiver.kernel.org>; Fri,  3 Jul 2026 08:30:20 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.87935.1783067413172707433
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Jul 2026 01:30:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=fWLj9aMN;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-4758bd3731bso219197f8f.0
        for <openembedded-core@lists.openembedded.org>; Fri, 03 Jul 2026 01:30:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1783067411; x=1783672211; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oOQz2/TkJne0/kJuvAODGP79zLNIxGPWLtvK+hqyyZ4=;
        b=fWLj9aMNwoMPXyNflhl+MX8uZxbYdC3/Oc4N0DCeV2+ZM1iwqRDsuH55D90LKNqLK6
         y4oSsxQehWZtYllDDnaygb10JJyzMIefR+WdAI4GmoFHWTM5dMHiqhzn8jqjRQMgHPtl
         XE5cxw+wG/DY2SwGhKIBMaAbVpRK7cmMunHqw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783067411; x=1783672211;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oOQz2/TkJne0/kJuvAODGP79zLNIxGPWLtvK+hqyyZ4=;
        b=jciIhZsh6jWlkfnhhF8QlkXV+sqKG7fdi25iRM0R7ZS2J1W6SuefjfVDVhlwOyokUD
         37bhFhxrFB9WgPnclF85xt3SMy+zysF4Q+oFIuyD5MRUsdb8ik3MT3MqVBU1jkKW7W9B
         UKz5hnKq/o7qOQqUeVtMqqbS6ylb+JaIpVQq4ZY9LxLpJagAITGxcyBP2e4Se9Gv5nyP
         vJoho/2XSZ2csfgX2V9AnexNecUPOeROqJD1tPA9KQhL13GBAPLiYAAsJCYXpSsFU+J/
         F8XLoqhYN9k1bPMmFwEcgq+N4D0Z+ssH2TifYjhuP44Zmfn4k6jMMHrSoccKkk/J4Wsl
         poMg==
X-Gm-Message-State: AOJu0YxGLwk3FJJy1CAg0gbatbqRpsZ5SI7WOtC0SrZuxLMvTiyK6GjH
	i6ia2i0c0lFA2n0UhxWkw9NgBQZ/EqlUMxZuNiELdSLmC+KXsbc7VGD240ij1q+Q4rRxqBtgdNx
	g7fCHLq4=
X-Gm-Gg: AfdE7cmlvSROWVG7Q/MxJpjzmlK4uTZNER/xkYaQOAOmKu3HBgNinwG035NTeJoB+ya
	UlidVfXSgWu8sO/ohBR2VcaAidESuNPy76veOdsLzkk7ZuF16DZPPmEyEy4DEJnBnW3myevRiHf
	EkYIyeu9AfUdaYSqOteDAwT1u8qM/ZoyUCbL/O1AlsqJ3K8fzAHmUDcK8qQbv6bukJ0Eigdu2n4
	MBV94oarySNxdy4TNpKrUryaJFNHIShc2QJTUQ/k4ZTBPb2L2421fTpmZOiVkbkJJNpQQklWVF3
	Gk8m5mNUv44Q4/byXJAhVB4a+wvPgUvitiTOM1FwgZMJFjbm2Zyb2sH2+c3wTunogA1Hl8Mtkh7
	DIBBbAMFkOgcZCPvlb5J4l4SWVXDXyEWlyoHfNkS5Nn7PfQIEbByhC5UAjLXOn8ScU5p0WDe2wX
	jEGgcYzEb7Td8Pv+We9zDeoIDJ7OP1DIKjeIt1Nkfc3g==
X-Received: by 2002:a05:6000:98d:b0:473:41c6:f1b9 with SMTP id ffacd0b85a97d-47934d75634mr4395251f8f.11.1783067411170;
        Fri, 03 Jul 2026 01:30:11 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:ad8d:cf49:9149:eae0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-477db3dbb79sm15684554f8f.2.2026.07.03.01.30.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 01:30:10 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 13/15] erofs-utils: upgrade 1.9.1 -> 1.9.2
Date: Fri,  3 Jul 2026 09:29:53 +0100
Message-ID: <20260703082955.1585712-13-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260703082955.1585712-1-richard.purdie@linuxfoundation.org>
References: <20260703082955.1585712-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Jul 2026 08:30:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240095

License-Update: Switch to GPL-2.0-or-later OR MIT instead of Apache-2.0

https://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs-utils.git/commit/?id=c0a809cf5dccf9956b573bdd2ae51f1f100f9f90

"""
erofs-utils uses two different licensing patterns:

 - Most liberofs files in the `lib` and `include` directories
   use a dual GPL-2.0+ OR MIT license whenever possible.

 - All other files use the MIT license unless explicitly stated
   otherwise.

This model was chosen to maximize the ability of erofs-utils to
integrate with various ecosystems.

However, liberofs uses a GPL-2.0+ OR MIT dual license because some
parts should be shared with the Linux kernel.
"""

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../{erofs-utils_1.9.1.bb => erofs-utils_1.9.2.bb}         | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/erofs-utils/{erofs-utils_1.9.1.bb => erofs-utils_1.9.2.bb} (77%)

diff --git a/meta/recipes-devtools/erofs-utils/erofs-utils_1.9.1.bb b/meta/recipes-devtools/erofs-utils/erofs-utils_1.9.2.bb
similarity index 77%
rename from meta/recipes-devtools/erofs-utils/erofs-utils_1.9.1.bb
rename to meta/recipes-devtools/erofs-utils/erofs-utils_1.9.2.bb
index 03bb718b44d..801da3d6c9b 100644
--- a/meta/recipes-devtools/erofs-utils/erofs-utils_1.9.1.bb
+++ b/meta/recipes-devtools/erofs-utils/erofs-utils_1.9.2.bb
@@ -1,11 +1,10 @@
 SUMMARY = "Tools for erofs filesystems"
-# liberofs also available under Apache 2.0
-LICENSE = "GPL-2.0-or-later"
+LICENSE = "(GPL-2.0-or-later | MIT) & MIT"
 SECTION = "base"
-LIC_FILES_CHKSUM = "file://COPYING;md5=73001d804ea1e3d84365f652242cca20"
+LIC_FILES_CHKSUM = "file://COPYING;md5=63afa010baddc7d0905f9c31ac759f51"
 HOMEPAGE = "https://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs-utils.git/tree/README"
 
-SRCREV = "d3fbccba6e409c100843563b416c47cd82c87ca0"
+SRCREV = "30711d4b2e234fe3e8aaeb779ade4cb609b0d920"
 SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs-utils.git;branch=master;protocol=https;tag=v${PV}"
 
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>(\d+(\.\d+)+))"

