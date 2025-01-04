Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB496E77199
	for <webhook@archiver.kernel.org>; Sat,  4 Jan 2025 13:42:36 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web11.18157.1735998151052182604
 for <openembedded-core@lists.openembedded.org>;
 Sat, 04 Jan 2025 05:42:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=k4JyQENm;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.173, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-21644aca3a0so111015335ad.3
        for <openembedded-core@lists.openembedded.org>; Sat, 04 Jan 2025 05:42:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1735998150; x=1736602950; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UeW3q6z9Me54z5DCYkJTIoYsCYifEWS/9XZVGGZB0Hs=;
        b=k4JyQENmFbb2MeQqJP/NDj6l8qTOI38mciz3vaaspxyRt+ZQvsTeN48ESfZaUuPu25
         MPvb/hJ2tz1n2xIydSoE9URvZD6xvBZtCOczeXxzw7zzI++V5QH/EkXyAIV5orCMR5d6
         I25tAg9LYBkKaXoVr9sqUnQNEOxIQWInBdsCMVqeCA740BhHmJNHEErOkWrQeuRYpRMp
         3VEbhcFyyxsDp6rfOcn6Ehg7DZWF8A4TJ3jOw2w1w3Imj96vjP0WF8Gt7LyqdeTxqi+u
         AXzI8bA++I5FPWX2uiobH0JPTI4Xn9T4vKkWl5AXLtw1gozk5YseF4QbVc0MiL/oRqwm
         8GOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735998150; x=1736602950;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UeW3q6z9Me54z5DCYkJTIoYsCYifEWS/9XZVGGZB0Hs=;
        b=T1aKa032CpLrEYy6y7+h17a+qehwWr872a6Q/AUD4XsBEz2sR2oTnPoxXhrZhPOXrk
         UrJBUQp7s2vV3qfVvhSs+DxiOxRHQ2zfxhhT4aKW1QNtWNCKQeW14FLp44rrziOQpgLo
         IV7EPb0fdgsQL3OwOckU9yarM0YzwbVNvc8wnwunhDa95kXmeGZ0CJX+XlzG6gnVRYqo
         FtlKlHGLbxtVrF5ff3H/9J4WqGHItMUtSGki2srJmH2FdYJ5JUUcdP0rcEWIVcPlOjCW
         q2GY8Y0DDFLm9VGI0GeC6Vpm5yGzoFnT8vXcDt8u4LoM/rsxamjGtJ18ZSE4CShMLV1U
         u8AQ==
X-Gm-Message-State: AOJu0YxVi/zEFAA4dztUWokZZUQK229ZoqrRklI0v2ci0qwUm1sRmBzB
	X66fEvwmBGQp34fX/0lOFDV7hgTgX6YkxM5IdCSqmYR63jKNftL9/r7la2rZORg7wpyoNtdwamF
	9
X-Gm-Gg: ASbGncsGNSNFDQIxvEg+QRxnUbC6KkX5cBWgbena1+tvxIBYiSuEiyJ41MMKM5rD+SE
	QoaMFLVwAPEQ4TFneag0j36u5MsnaCqk9DMOysLQhv0uPJ+YQY2KyPyOu9n5Ck4Em8E5/zsnJuI
	8By4VCEM649KCVTtfvoK2CumsUkR0RFHM0hrChcYNIkYU13ol8/ezCl7Tl5X+vTa57Xz2/hPZcW
	BJJqY+wOgDbk/kJMtazM09qq1MhKNCgX+MxZS+3FAp4AA==
X-Google-Smtp-Source: AGHT+IG1EimmxMTbgwu3S+JckbUSpu8FdXWCLVetVdmpqXA0onPmUTQNQZWGbJr2jUefr69uY2CoTQ==
X-Received: by 2002:a05:6a00:3406:b0:725:eacf:cfdb with SMTP id d2e1a72fcca58-72abdeeed6emr80100510b3a.24.1735998150388;
        Sat, 04 Jan 2025 05:42:30 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad8faf93sm27966257b3a.153.2025.01.04.05.42.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jan 2025 05:42:30 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 20/25] libxml2: Upgrade 2.12.8 -> 2.12.9
Date: Sat,  4 Jan 2025 05:41:44 -0800
Message-ID: <774b10921b1e46d99338bb8c047d7f094d5ce7bd.1735997984.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1735997984.git.steve@sakoman.com>
References: <cover.1735997984.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 04 Jan 2025 13:42:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209389

From: Divya Chellam <divya.chellam@windriver.com>

Changes between 2.12.8 -> 2.12.9
================================
https://gitlab.gnome.org/GNOME/libxml2/-/releases/v2.12.9

Security
* [CVE-2024-40896] Fix XXE protection in downstream code

Improvements
* Undeprecate xmlKeepBlanksDefault.

Signed-off-by: Divya Chellam <divya.chellam@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libxml/{libxml2_2.12.8.bb => libxml2_2.12.9.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/libxml/{libxml2_2.12.8.bb => libxml2_2.12.9.bb} (97%)

diff --git a/meta/recipes-core/libxml/libxml2_2.12.8.bb b/meta/recipes-core/libxml/libxml2_2.12.9.bb
similarity index 97%
rename from meta/recipes-core/libxml/libxml2_2.12.8.bb
rename to meta/recipes-core/libxml/libxml2_2.12.9.bb
index fb103f0273..7777c9f181 100644
--- a/meta/recipes-core/libxml/libxml2_2.12.8.bb
+++ b/meta/recipes-core/libxml/libxml2_2.12.9.bb
@@ -20,7 +20,7 @@ SRC_URI += "http://www.w3.org/XML/Test/xmlts20130923.tar;subdir=${BP};name=testt
            file://install-tests.patch \
            "
 
-SRC_URI[archive.sha256sum] = "43ad877b018bc63deb2468d71f95219c2fac196876ef36d1bee51d226173ec93"
+SRC_URI[archive.sha256sum] = "59912db536ab56a3996489ea0299768c7bcffe57169f0235e7f962a91f483590"
 SRC_URI[testtar.sha256sum] = "c6b2d42ee50b8b236e711a97d68e6c4b5c8d83e69a2be4722379f08702ea7273"
 
 # Disputed as a security issue, but fixed in d39f780
-- 
2.43.0


