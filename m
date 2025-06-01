Return-Path: <tim.orling@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A38BCC54FB3
	for <webhook@archiver.kernel.org>; Sun,  1 Jun 2025 22:26:40 +0000 (UTC)
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com [209.85.214.193])
 by mx.groups.io with SMTP id smtpd.web11.37187.1748816799464212658
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Jun 2025 15:26:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=Xlu2EMKg;
 spf=pass (domain: konsulko.com, ip: 209.85.214.193, mailfrom: tim.orling@konsulko.com)
Received: by mail-pl1-f193.google.com with SMTP id d9443c01a7336-2349f096605so46587385ad.3
        for <openembedded-core@lists.openembedded.org>; Sun, 01 Jun 2025 15:26:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1748816798; x=1749421598; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a4y9Y5/k6p7isXhFXJkS45ggyL0RkDieAILwm5oye1Y=;
        b=Xlu2EMKgrPvShl4sWQ5UABe8EWIBmymETB5OSPPywvML1hEM4ZGWQKCy7DDH5k5X46
         /iFyf7ieYPq19Px3NouhTckSZ2nz0/2QZ/o4wpu2sJYFCFTAjN9pJgZyZKjEXp0bA4Oz
         CLtre35cVdZlnoKsMO99VUb8D7TzNNsoi2r/k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748816798; x=1749421598;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a4y9Y5/k6p7isXhFXJkS45ggyL0RkDieAILwm5oye1Y=;
        b=UIN5FEq0Iise9mpXgwP4vqDYt/3BkEvnhytB0yO6KBMNKSbyeZlQDobfOApcSg0tYO
         /Kr+gRtNy+P6zRc1+M9qBpSK+OGfzrL108/16g/8N/Hc/iKB8tB9qmd+0G416y1PVHdO
         8pTEgqYqo8dWTtEDfeZsxK5Tytutucay122fqLuFZYEs6IDroh0pAu3+pBkaLB7mAzJd
         uypSh1rKJnhKgnE707tbIGIB8Lr29PzNpH8hPlp9P+apEPe2ZyrLiMWl8xGj5NvVEtT6
         c91jUjf2Ho9VtAaBFM+TfuI/jXIF3fZraLmoXW7fSOVj1RGm/dN0o6Dj38cVoKDhI6sb
         pPVQ==
X-Gm-Message-State: AOJu0Yy97wN7Vw7CujSMle25mkv7DamUIkwpiMLCRtZApeKwXsxME5sZ
	VFontUWUrPm0KGC8BnGe21TtARJxA61Jzr0ZEr7l0ROBrg3pgKQ1xvPmtkDxuTTyDJwxH94LGUH
	i3dy7vloADwxz
X-Gm-Gg: ASbGncv4ual8OD8e5oVK7Ye9Km5y+Pg9EAwZUwghmxgkXb9EkDkVPaUhSXnW3VL414E
	pRkzIC4EUqiMIhFjltWOIMCC8SqumVtPBRTbBxaNqcLVCA8m+4B+SJmuMF1XKqpuAPUJtprsJbv
	IGekS6E5DPlEEJE5zMvifXlmvXPpDrTEveKEsfO/ZYE3BPbAZ3WXwbictAuXT4xZ8HID/TDCS2T
	T6kGnJrCquxfSmPX4KlFnUrgiWPmf+y1/AV3p28iwPLu/4yCg7N/J7gwGohNypadPwVX0K23uGb
	Tn6Dqi47E7Blrx+6AIXpouHQ4J9l8UIzow1FbWIjZR47cWAIQMX88ISVYqEEFcd1tkDtb+WPbDV
	S052ajW6Jq+PO4oxL+mvdaI0A1g==
X-Google-Smtp-Source: AGHT+IFSFslQ9tBAi35f0+nITazy66oUDGx6mK0aQnQPDfipTMsW91BUu1CF5bgr5Clwe8HwyVYMEA==
X-Received: by 2002:a17:902:ce12:b0:234:ba75:836 with SMTP id d9443c01a7336-2355f766d4emr80958605ad.7.1748816798523;
        Sun, 01 Jun 2025 15:26:38 -0700 (PDT)
Received: from localhost (c-98-232-159-17.hsd1.or.comcast.net. [98.232.159.17])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506cf5432sm59098565ad.180.2025.06.01.15.26.37
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Jun 2025 15:26:38 -0700 (PDT)
From: tim.orling@konsulko.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/8] python3-pyopenssl: upgrade 25.0.0 -> 25.1.0
Date: Sun,  1 Jun 2025 15:26:18 -0700
Message-ID: <b888c6a1c612298c9ac72786883f0c5d285130bf.1748816484.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1748816484.git.tim.orling@konsulko.com>
References: <cover.1748816484.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Jun 2025 22:26:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217683

From: Tim Orling <tim.orling@konsulko.com>

Comparing changes since 25.0.0:
https://github.com/pyca/pyopenssl/compare/25.0.0...25.1.0

Changelog:

https://www.pyopenssl.org/en/latest/changelog.html

25.1.0 (2025-05-17):
Backward-incompatible changes:
* None

Deprecations:
* Attempting using any methods that mutate an OpenSSL.SSL.Context after
  it has been used to create an OpenSSL.SSL.Connection will emit a
  warning. In a future release, this will raise an exception.

Changes:
* cryptography maximum version has been increased to 45.0.x.

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 ...{python3-pyopenssl_25.0.0.bb => python3-pyopenssl_25.1.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pyopenssl_25.0.0.bb => python3-pyopenssl_25.1.0.bb} (85%)

diff --git a/meta/recipes-devtools/python/python3-pyopenssl_25.0.0.bb b/meta/recipes-devtools/python/python3-pyopenssl_25.1.0.bb
similarity index 85%
rename from meta/recipes-devtools/python/python3-pyopenssl_25.0.0.bb
rename to meta/recipes-devtools/python/python3-pyopenssl_25.1.0.bb
index 6485f3e1ed6..c1f571c552e 100644
--- a/meta/recipes-devtools/python/python3-pyopenssl_25.0.0.bb
+++ b/meta/recipes-devtools/python/python3-pyopenssl_25.1.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 DEPENDS += "openssl python3-cryptography"
 
-SRC_URI[sha256sum] = "cd2cef799efa3936bb08e8ccb9433a575722b9dd986023f1cabc4ae64e9dac16"
+SRC_URI[sha256sum] = "8d031884482e0c67ee92bf9a4d8cceb08d92aba7136432ffb0703c5280fc205b"
 
 inherit pypi setuptools3
 
-- 
2.43.0


