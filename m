Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71EA8D63951
	for <webhook@archiver.kernel.org>; Wed, 20 Nov 2024 13:57:34 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web11.13835.1732111047960091781
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Nov 2024 05:57:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=li4owxFp;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.179, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-21271dc4084so5202925ad.2
        for <openembedded-core@lists.openembedded.org>; Wed, 20 Nov 2024 05:57:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1732111047; x=1732715847; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AmTbQUgFd1YxfIFgU+MPCIeyjMubcm3aDZstOocEug8=;
        b=li4owxFpYEg6V/jw0ZOYS9Ud/2F+fSOJZMDhNcbAM5GA0V+GnhArWM7IAJAg1z6FRg
         A+AMGEVPXENrlKdSRbMkY51Thi02oPaGNfRpP96GLVKXBlCv16Ggc8sb0JVr88llaIfF
         1VTLJn9Cq3+6TDB8Gl9WmfXR4sr5MlpAwgn1tMtLQBZUjaW4M21cmaM5fvuKGH/vK62T
         Y/zu2Kv8X3aYj2mzVi58Pk1NX8eXbk4HiYxuZ7Z2sZrNdPCvg+A+j1tesK03gE3viXpo
         XOVvbUlVhoayFiJqzgkSfT1P2xN5FkabGtPGcjnzdBc5r0/RHgBEy72GgwcKBmMDt5RU
         uUMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732111047; x=1732715847;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AmTbQUgFd1YxfIFgU+MPCIeyjMubcm3aDZstOocEug8=;
        b=Qzi9E2Bt71Mqn+rMIOVfjX1BFyOmeYZylUpTMFdXZh0/0/2QX8NVrY+MV3Z7+OgA7z
         EDljVrkmqryq8u5/qt6qOBZTFseMzc6xABJUdv+F+6WFyw0PZXfPfY6BIZFczCEdLCrt
         WejoW8o4rzFPXmhZ0C4C57AhlHmgEn7FA07mtWb5/wcyJLtT3AOFOX6/y99Akx+JJmjo
         IFMu4LEjb1+Juc4HlM0BEr7ONx8Tvk5MBQ5lrI8v0+2RwlJz0T+HkK4OIpOFJdh1FOnw
         OBJOqae+bD4puQFZ/nWsWgk5InejT7wi+Xhy5FMkb4npH4RQFuD/Tbg0QUlCvGdVsgig
         MXpw==
X-Gm-Message-State: AOJu0YzEbrVkIqImn/eNwQSIZ6eqPyTMr02KTCmYatZXsdc0RTZMB0LA
	iOLfFGy4ftMuuoCblgMkG68fAZjkUi6MnhwmOQsF2cgo6pP7Onv/8Bc6vAqk3iFb8y4Orc5fA18
	J
X-Google-Smtp-Source: AGHT+IE+p2o97plWrjxw7q9GaI49by3ixctckn/UDQSjIzAroQxj/E4b7+1wxRSysiUkLNq91Zn6ow==
X-Received: by 2002:a17:903:2312:b0:20c:ee32:7597 with SMTP id d9443c01a7336-2126ca4ea95mr30289225ad.8.1732111047308;
        Wed, 20 Nov 2024 05:57:27 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2127a4db5b3sm4658175ad.233.2024.11.20.05.57.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Nov 2024 05:57:26 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][styhead 10/31] uboot-sign: fix concat_dtb arguments
Date: Wed, 20 Nov 2024 05:56:42 -0800
Message-Id: <5b837f65a41fff75517e9e9c241eaaf8e79afc5d.1732110892.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1732110892.git.steve@sakoman.com>
References: <cover.1732110892.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Nov 2024 13:57:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207434

From: Clayton Casciato <majortomtosourcecontrol@gmail.com>

Fixes [YOCTO #15642]

Ensure empty argument passed from do_uboot_assemble_fitimage is passed to
concat_dtb

Signed-off-by: Clayton Casciato <majortomtosourcecontrol@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit b3c473785e5ceef677ff2b77c5fc17f5704c622f)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes-recipe/uboot-sign.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/uboot-sign.bbclass b/meta/classes-recipe/uboot-sign.bbclass
index 3e5f5dcf66..a17be745ce 100644
--- a/meta/classes-recipe/uboot-sign.bbclass
+++ b/meta/classes-recipe/uboot-sign.bbclass
@@ -338,7 +338,7 @@ uboot_assemble_fitimage_helper() {
 	binary="$2"
 
 	if [ "${UBOOT_SIGN_ENABLE}" = "1" -a -n "${UBOOT_DTB_BINARY}" ] ; then
-		concat_dtb $type $binary
+		concat_dtb "$type" "$binary"
 	fi
 
 	if [ "${UBOOT_FITIMAGE_ENABLE}" = "1" -a -n "${SPL_DTB_BINARY}" ]; then
-- 
2.34.1


