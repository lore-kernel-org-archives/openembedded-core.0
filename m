Return-Path: <vince@underview.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40D91C44509
	for <webhook@archiver.kernel.org>; Sun, 12 Jul 2026 05:51:59 +0000 (UTC)
Received: from mail-yx1-f51.google.com (mail-yx1-f51.google.com [74.125.224.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9345.1783835512818126878
 for <openembedded-core@lists.openembedded.org>;
 Sat, 11 Jul 2026 22:51:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@underview.tech header.s=google header.b=i1BctelS;
 spf=pass (domain: underview.tech, ip: 74.125.224.51, mailfrom: vince@underview.tech)
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-664a09bc459so3511134d50.1
        for <openembedded-core@lists.openembedded.org>; Sat, 11 Jul 2026 22:51:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=underview.tech; s=google; t=1783835512; x=1784440312; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R67z6hoJ0NIyO+wE+zoZjMrHko4pBYAtLrCdkO3LGaw=;
        b=i1BctelSVLIM2mDeFX4EIqmLo/DOQBqeSQb6UkZliLRH1O9y+wGVq6nLHjIv1HO4Ha
         a57kN2a59fakKqa4XJ9DMvuDQOWydRVJU9KOjiY9wcZmLshL0qQfYAScxr00nkzNUz75
         HNdTZTJztYxx66315cOgoTbv4zilahQQhdVZvrdllEa154GMjMgd2+O3IcrNbuKrePsv
         cYSK4YBeef+Wa+iBNQO9ZCVDc9C8WoLVzmdiWo3W3ybu3zzcmpSZuvXYGZqQudcNYr1z
         6fc1l5QDfmK087zwdzuQoZMgyBptcV+bJa8P5v4BU8lCk+4sgSIFE2sLrKM1CRInNNoY
         NVXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783835512; x=1784440312;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=R67z6hoJ0NIyO+wE+zoZjMrHko4pBYAtLrCdkO3LGaw=;
        b=N7mEeUpQNKtND/IugATqyOZb/W1k/cGXHBEU2OZzqJeoRuu6Pe7juRH+xwQhJQmNHI
         wbSfK81GqGrknqC3Tawy5Kr+OAXayeAA0zDOO2NXH8eJNBvvL6dtBIFoWG2aDEagUXU8
         pXYhdmYpbMwyInEBfU4OeLvlovit0yEh2SBd94swRJtuR73SCLHmuW1ML1okAKYP4aSm
         QjBH0WtXS2ay5KxZ7zfWvjcBo7RE77wB2/N0k3yCCQWMci53MgrzODjZry5+8eh5Scmk
         QyRU07vG0Cpvri8xgN4mG++Ql7QPMbIfyHm9VFAPiTaP+tNYaqGCSPzyTFrjNOHMm67n
         u1bQ==
X-Gm-Message-State: AOJu0YxF90vbTzzwEsShjynIzSoOpDknjKDk7IhZA6u8D8/GwnhMNZJv
	9xumj/aJ2bVxUsUA5YcxXWDwj+fVrdOTsgXRD52MR5uB/VOzLZ6zNtknQwoJkQiL/TA2mpX9LEL
	PUsPPlS4=
X-Gm-Gg: AfdE7cmK3iXVaX9ifOCJP+WMgBvvmZeUUaFiNCcG0o7mYBIA/yQiluAxTlzMJ33LF9z
	+uizt5+/gCTMI7e+/Lbz/jCmYH0JdonJZ5YW6Pfk/vhxRm7TFMIvwNa86JZJyW67r7hdJ3ktb/V
	vO+OZlzRdvlDZTRh5/GEIrsXOPjtcG+UQYH3VAf36XrYNC9NH4WvCkSWai/fNSBIMLolsQmSj5k
	QTkY+vq8Zdha7GCYSVj04s3MJLY4kLcDIsnuShgr0/UK2O5JyLD2q8PHpIU9WcZW5atwRuYs4n7
	98tnlul7jR6XqnPre2Yv9qWWu3rnDriTFlYG6yZn1T8qgNfX82IZPmmiKzo0xXuIn++Oq7lbhFk
	XHCtQm8+Sps3j3cvlj4GU1q+5MgLsz39YmrmbyOTZNpKC4jVYw/IDdxVWTIhq4uR6R7hLXDysrS
	2dueeH+Wj1qnpV4g==
X-Received: by 2002:a53:ef0c:0:b0:667:d3e3:170f with SMTP id 956f58d0204a3-667d7c45602mr2756605d50.67.1783835511977;
        Sat, 11 Jul 2026 22:51:51 -0700 (PDT)
Received: from vince-server.attlocal.net ([2600:1700:b540:3af0::42])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-6678779e37fsm10764901d50.5.2026.07.11.22.51.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jul 2026 22:51:51 -0700 (PDT)
From: Vincent Davis Jr <vince@underview.tech>
To: openembedded-core@lists.openembedded.org
Cc: Vincent Davis Jr <vince@underview.tech>
Subject: [PATCH v2 22/26] libnl: rename kernel prefix
Date: Sun, 12 Jul 2026 01:49:50 -0400
Message-ID: <20260712054954.4063745-22-vince@underview.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260712054954.4063745-1-vince@underview.tech>
References: <20260712054954.4063745-1-vince@underview.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 12 Jul 2026 05:51:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240747

Utilize preset variable KERNEL_PACKAGE_NAME
to ensure uniformity with builds if
KERNEL_PACKAGE_NAME variable were to
change.

Signed-off-by: Vincent Davis Jr <vince@underview.tech>
---
 meta/recipes-support/libnl/libnl_3.12.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/libnl/libnl_3.12.0.bb b/meta/recipes-support/libnl/libnl_3.12.0.bb
index 2b46fb69d9..cbc5eca20e 100644
--- a/meta/recipes-support/libnl/libnl_3.12.0.bb
+++ b/meta/recipes-support/libnl/libnl_3.12.0.bb
@@ -54,7 +54,7 @@ RREPLACES:${PN}-genl = "libnl-genl2"
 RCONFLICTS:${PN}-genl = "libnl-genl2"
 
 DEPENDS += "${@bb.utils.contains('PTEST_ENABLED', '1', 'libcheck', '', d)}"
-RRECOMMENDS:${PN}-ptest += "kernel-module-dummy kernel-module-bonding"
+RRECOMMENDS:${PN}-ptest += "${KERNEL_PACKAGE_NAME}-module-dummy ${KERNEL_PACKAGE_NAME}-module-bonding"
 RDEPENDS:${PN}-ptest += "iproute2-ip"
 
 do_compile_ptest() {
-- 
2.43.0


