Return-Path: <fabien.thomas@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 396EBC5DF81
	for <webhook@archiver.kernel.org>; Wed, 19 Aug 2026 15:57:51 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10325.1787155069860341628
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Aug 2026 08:57:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=g60nf5W7;
 spf=pass (domain: smile.fr, ip: 209.85.128.52, mailfrom: fabien.thomas@smile.fr)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4956869750eso7693905e9.2
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Aug 2026 08:57:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1787155068; x=1787759868; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=g/XROzwA0KnlfgRiRO0LJH4gXp5ycKnvB0C7irdETWA=;
        b=g60nf5W7lOBrTREkgnTg69zXCCq/vNo9YMFMi5kSCQxrb+txdM6Pe562Zu1T9cdn6i
         5p/hM75AX34ukhg4b3rzQwxxeT2Fuzq/AEt3Nae9hIyEEYPW+6QPOtuSpX1hJwbfdzg1
         tO4sy1tHaC3MSlEsu8/U664to+/zMgfHTuJ6s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787155068; x=1787759868;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=g/XROzwA0KnlfgRiRO0LJH4gXp5ycKnvB0C7irdETWA=;
        b=Cy0G+mJdNuf2MkjMPAGug1rcTHIm1YzrqLR/U2843bjZQcTgbLfjZg4OKKMzifcQr2
         A3WudDrcuucuQLh5f/byNkD8wVY1j1OYh/Zh/CMUlzVcG0v/Ri3wPnSdJg/JV/U9DICl
         stGMcKGEIEas4iXIKFD1SddZ2QV+1zAtgPotd5+joOCX3pRtSiPRbENrlp5ajOqpzO62
         by5fQoZVj7r3bPpkpLaPrkLjI3ov3Vm5P4lTuRr0Mhb2jPYIyah/VIAXgduGhS+ld0ca
         +1N/MuR9ZhFyCJWio/WwCEvkyTwTC5JpJBKYXdx8QvCl022Gr9NMVTibaLw39157JJSX
         DekA==
X-Gm-Message-State: AOJu0YwvDXzJr5xP7P07b+EOEMwksjJduQ2oKrDGBBZczX8p7qUkplzB
	9xLMjYaReQIFTpSOBUpRsP8htTui10pr8LAX72sAR/SEe7IBdkILYhxHurj9F+TGLmXUJsMWR+e
	LJ1CeYgU=
X-Gm-Gg: AR+sD11UE8U2JgrxpBpeq2brdyzAExGFywoG1wyE+RQ7+DufWGQiITsGflKxp01YLBd
	II0ZFlyUEQBnf6sJYHnaF7Mo4I4+3Cp3L9YTRBfOYxH7veZnH3xa8Y08NQACvfgwGmdYNcAzKVN
	B7+nONZcMTojxtUeF2AriTblab5OSt2QeswKncfbDKeDF/mJ0oC8oPvYnSmbpUnOOvdfy7t31w6
	KkYitRe5lF3l/eZ3npn5CCeHQcBA6cTRmdduiNrvEc0NtEwjgJ36l2KshGDo181f7fCoge4tiey
	6+Y3kjebBqmG40jA/jPxOcIsdaFXYIKVvEYJvzFNo98md2ffzXL0KcprPREF4bKB0oTNj1h5vRD
	mPFwq0E7mD43z2quI5hDhEEatS6NiwLj2CBKCvbkJ+c/N/qWOLxiTR7I2nh7zgZQFp1LTTEU87Y
	6420xAViIgqVXnt+pdcOVkBm7yNBRWeyaz2A5mM7v/LrnjK0vQ9txGf1ih6+gIvonn8xlcYl3x+
	Aia+ULn/zvwk+8rei8QFE6OaoHlWZHoMrZGEATKlRznIk/6xawkyw7H6CYtBnHesIkQUxL0akox
	+De/Cf7s20pTUbcTvUKRyvg/0/KBFTItOdvhkATH
X-Received: by 2002:a05:600c:8b35:b0:499:7ce1:d8a2 with SMTP id 5b1f17b1804b1-499aa1a54b2mr117987085e9.8.1787155068101;
        Wed, 19 Aug 2026 08:57:48 -0700 (PDT)
Received: from FRSMI25-GIGUE (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482b14d05a6sm7215698f8f.35.2026.08.19.08.57.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 08:57:47 -0700 (PDT)
From: Fabien Thomas <fabien.thomas@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 18/37] python3-pip: set CVE_PRODUCT
Date: Wed, 19 Aug 2026 17:56:49 +0200
Message-ID: <85e02d942810674a7712e4ea1db32540c85e5096.1787154074.git.fabien.thomas@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1787154074.git.fabien.thomas@smile.fr>
References: <cover.1787154074.git.fabien.thomas@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Aug 2026 15:57:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243754

From: Himanshu Jadon <hjadon@cisco.com>

CVE_PRODUCT is not set for python3-pip, so cve-check can miss or
misreport pip CVEs. CVE-2026-8643 is reported in NVD with pypa:pip.

Add CVE_PRODUCT to match the NVD product name and report this CVE
correctly.

(From OE-Core rev: 3a24c9f77622148c3894c9228e061cabf79f169f)

Signed-off-by: Himanshu Jadon <hjadon@cisco.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit a486abd4889ad03e1a8ddd5311595f3ece7d61b6)
Signed-off-by: Himanshu Jadon <hjadon@cisco.com>
Signed-off-by: Fabien Thomas <fabien.thomas@smile.fr>
---
 meta/recipes-devtools/python/python3-pip_24.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/python/python3-pip_24.0.bb b/meta/recipes-devtools/python/python3-pip_24.0.bb
index cf123a5d230..51fff41e257 100644
--- a/meta/recipes-devtools/python/python3-pip_24.0.bb
+++ b/meta/recipes-devtools/python/python3-pip_24.0.bb
@@ -41,6 +41,8 @@ do_install:append() {
     rm -f ${D}/${bindir}/pip
 }
 
+CVE_PRODUCT = "pypa:pip"
+
 do_install:append(){
 	# pip vendors distlib which ships Windows launcher templates (*.exe).
 	# Keep them only when building for a Windows (mingw) host.

