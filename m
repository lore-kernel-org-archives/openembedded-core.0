Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA3B9C433FE
	for <webhook@archiver.kernel.org>; Thu, 27 Jan 2022 10:20:51 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web11.26836.1643278851251381405
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Jan 2022 02:20:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=C0eFHkqC;
 spf=pass (domain: gmail.com, ip: 209.85.128.51,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id c192so1525933wma.4
        for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Jan 2022 02:20:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZzobumkWTkGWvKXmHFpJqXdcYXLE5fkkuLwFzrUEz3k=;
        b=C0eFHkqCmsNCUIosYjGT2y0G4oypjUHom9Vgn5ksykeCkgrKPRIXRfarsnNFcF2bas
         5kpdp+b4Vah85eNKjD+3XblcBLu1AtyzB7GDRKM/qNAlwmJeKuOW2+NCiIfAaiGrCQ7T
         3w0IKD+XK9cV7/JWv/YkscgtmMFtP72O42ldfVnEdl9RrdGcGRO7Ixpdk2fcFlMY48/B
         L8m5VVdcd4Bj3PH/yrxskDpssRl8fEPB/YWsTIybSiog0wIq0Hye3/CMRy9MzoXSFJCY
         iBmV6ra0ZrMNgTXUPfX+IK//eOY1AYNg7G/MYj/Xp1DV3c5XrLqjpJwH6xP1CGi6T9O8
         kX9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZzobumkWTkGWvKXmHFpJqXdcYXLE5fkkuLwFzrUEz3k=;
        b=DeKcIMIKir3+KXwmXRcy4X27oLXfIlWV7BrIwzAc0L//ThLdIGmVbf3Vuu9cyPx8OG
         2cKhUjElMnTvGZY6kCp/hrx7KmaWg5j8os8+pyLftkEv04cMeuv3Tuu/Egulxn0H4i8d
         A2XsNBDvQFwMfQs3spvscwC32dPkTNVvwDj8Cas656FDFO2QwQjSQVcM9n4A/ph9LEsK
         sHogD8xfBgfaI6F8J8N//wBY97MzJ+lAYrmw9HFDP4GW4EhmN9OyMT3H03lJMmPbE42d
         DjpeJ4u1jRBqPtpRgHRmc+8q6in0TYSjeAmoDsSZWsAKQEMYwPNmaExIB+EyFa77gokV
         LmWg==
X-Gm-Message-State: AOAM533CWehxJiuzoZbsFI+kestBgNDjOTIRPaxcPO9myOwGk1RIzji6
	I5fXCqOmsH1iCNNOOQ+/qoJlIcglWbg=
X-Google-Smtp-Source: 
 ABdhPJxBGBjkgy20sOnVXxn4R9912EiUYtjE1qEUqwdWMuDpyQnDv4t1ceQVEI1yr2sOe8lAivwxXg==
X-Received: by 2002:a7b:c749:: with SMTP id w9mr2544876wmk.149.1643278849884;
        Thu, 27 Jan 2022 02:20:49 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 t14sm4060849wmq.43.2022.01.27.02.20.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jan 2022 02:20:49 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 15/17] gnutls: update 3.7.2 -> 3.7.3
Date: Thu, 27 Jan 2022 11:20:03 +0100
Message-Id: <20220127102005.3050843-15-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220127102005.3050843-1-alex@linutronix.de>
References: <20220127102005.3050843-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Jan 2022 10:20:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161037

Drop unsupported option.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../gnutls/{gnutls_3.7.2.bb => gnutls_3.7.3.bb}                | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-support/gnutls/{gnutls_3.7.2.bb => gnutls_3.7.3.bb} (95%)

diff --git a/meta/recipes-support/gnutls/gnutls_3.7.2.bb b/meta/recipes-support/gnutls/gnutls_3.7.3.bb
similarity index 95%
rename from meta/recipes-support/gnutls/gnutls_3.7.2.bb
rename to meta/recipes-support/gnutls/gnutls_3.7.3.bb
index e1a084fac4..6c47ed350f 100644
--- a/meta/recipes-support/gnutls/gnutls_3.7.2.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.7.3.bb
@@ -23,7 +23,7 @@ SRC_URI = "https://www.gnupg.org/ftp/gcrypt/gnutls/v${SHRT_VER}/gnutls-${PV}.tar
            file://arm_eabi.patch \
            "
 
-SRC_URI[sha256sum] = "646e6c5a9a185faa4cea796d378a1ba8e1148dbb197ca6605f95986a25af2752"
+SRC_URI[sha256sum] = "fc59c43bc31ab20a6977ff083029277a31935b8355ce387b634fa433f8f6c49a"
 
 inherit autotools texinfo pkgconfig gettext lib_package gtk-doc
 
@@ -42,7 +42,6 @@ EXTRA_OECONF = " \
     --disable-libdane \
     --disable-guile \
     --disable-rpath \
-    --enable-local-libopts \
     --enable-openssl-compatibility \
     --with-libpthread-prefix=${STAGING_DIR_HOST}${prefix} \
     --with-librt-prefix=${STAGING_DIR_HOST}${prefix} \
-- 
2.20.1


