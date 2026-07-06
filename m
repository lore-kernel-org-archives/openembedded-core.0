Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9514AC43602
	for <webhook@archiver.kernel.org>; Mon,  6 Jul 2026 17:17:22 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.156295.1783358236764844142
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jul 2026 10:17:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=UoVmhb6Q;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-493ce08a75bso14029795e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2026 10:17:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783358235; x=1783963035; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FaRsgmQCWKl4y8wCwknJEG1+yZK2hfMRgL+DP5zBoUw=;
        b=UoVmhb6QtOao/dBkcGG30QajvM6WN4pUjvUBa48YzMLZYBVLxZ5TXy9QRJwCGdyxsf
         Fp0nGi70FXIcXizLgNa2gF1hfUr5v82D7zkicjWpQ6x0/UY/mMwtb4qdoyRHBJBFdyNZ
         vOGChpWr9mtxf/vM8pjqBUocM/CtznfX9Y70pA2v7ZwGUXTOqgGmClugf2xxTNbmpbt/
         GTqEoJEQ2h98xQF0vHF8zv26Hal+4ywcyxbm8an7X8bIa0HuyAHxNpR1AtY1iiHOQ/ET
         01Xz0+VGbxeSM+Wnp7AT024R97MgxpYrQOsL/betI4lan9742PXF48JlfSicTK4p0ULv
         lmxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783358235; x=1783963035;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FaRsgmQCWKl4y8wCwknJEG1+yZK2hfMRgL+DP5zBoUw=;
        b=fou2Wtnafq6JiwGODEdQnWUp1bmZCmbaYJVAKc1rRPXL3VgcWpB4LnzTAi/5ZME9IO
         PbDuHp8gyRCLdMBrDOGnb9NGtk1yomfSZlCnaNbXrvq0osUsoaevKkjWIG6t+dSm6HCL
         iMP+BHxhjK+YmOt6OAeVka2bOAKmW5ov54jcGlm4VpNgWFcoG1KMS057mWXrzI8qA0Sl
         Q7/tt7wFiwsb1qRCYshlTQB2VNm2zKa6Vogsx0Wn+DTPOj1P7IEaO8iuNrckMQHACAr7
         0+i4XpGkMEP+K2bfPl2txjoTVEeOAPn/0a4Md3LpDxUW/s8z+6ivaQduuKnLf7rz6V3r
         mSYA==
X-Gm-Message-State: AOJu0YxOSKAyaG21u3qh+TZ5mCLqKAnhplX0XSetkyn6MDKkI3Eeswbh
	J5GDEYi2z4FBd7Mkreiu2RRDUH7gK6LPhSjyDhO0jBAcsCr0gm7XsiZPzYo+dA==
X-Gm-Gg: AfdE7cl35OqxbGDId67u9twXv0KKG16+zV62v4Gs+UvzjPdBzrIaZNPzD2rvDMi/DmT
	jONVPiR+oc183vds0VWh5ppDX3f9ggylMSyhf3xySSpjFHc3x499p1CMwaUXkYyUzhCNkUmpXgY
	MFXCcw0qbgWb123cnTw0iOg4FSxzuYGZXlUpTjIpooHvJ4RtFLphfORvOsUzNdZmR28Ug3GbdUc
	+ijQ+/jpOVBXKYkY2t7rwSr+IMyC3Muq6DWc1AgCC6kMpeMQhovggaGv6uIRSBbEO+nmSD/+1TR
	XmEDZV3dh+pq3bECnMZYuA9taJkDIiaiEWv9WQLlsUcJbcyZkKgikzIjk3JGp/DOWd4UvJXqSdl
	AkO18zc3jyLXG/xkWoGKExruERZvnVCgj1MBv9T0RreBJTaudjClQl1KkHePzKkvfZ+N3Wjr8De
	ZjxfAK6UwCy6txjVRDfGWpyI4j1QI/Z7r2EztLJKvDAX7LXaBylrBrtXwrWJA=
X-Received: by 2002:a05:600c:6216:b0:493:adcb:d368 with SMTP id 5b1f17b1804b1-493df06a301mr17622445e9.9.1783358235018;
        Mon, 06 Jul 2026 10:17:15 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c63ba971sm640541005e9.13.2026.07.06.10.17.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 10:17:14 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 13/45] gnu-config: upgrade to latest revision
Date: Mon,  6 Jul 2026 19:16:27 +0200
Message-ID: <20260706171701.70536-13-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260706171701.70536-1-alex.kanavin@gmail.com>
References: <20260706171701.70536-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2026 17:17:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240299

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-devtools/gnu-config/gnu-config_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/gnu-config/gnu-config_git.bb b/meta/recipes-devtools/gnu-config/gnu-config_git.bb
index 65a32effd7..5d82be87da 100644
--- a/meta/recipes-devtools/gnu-config/gnu-config_git.bb
+++ b/meta/recipes-devtools/gnu-config/gnu-config_git.bb
@@ -9,8 +9,8 @@ DEPENDS:class-native = "hostperl-runtime-native"
 
 INHIBIT_DEFAULT_DEPS = "1"
 
-SRCREV = "a2287c3041a3f2a204eb942e09c015eab00dc7dd"
-PV = "20250709+git"
+SRCREV = "428664896cf9e92d264976a960c76660938dffce"
+PV = "20260629+git"
 
 SRC_URI = "git://git.savannah.gnu.org/git/config.git;protocol=https;branch=master \
            file://gnu-configize.in"
-- 
2.47.3


