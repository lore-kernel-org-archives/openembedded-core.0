Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C119BC54F30
	for <webhook@archiver.kernel.org>; Fri, 23 May 2025 03:52:56 +0000 (UTC)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.web11.41007.1747972372574785090
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 May 2025 20:52:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OWZhb4XR;
 spf=pass (domain: gmail.com, ip: 209.85.215.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-b27015122c4so3958165a12.3
        for <openembedded-core@lists.openembedded.org>; Thu, 22 May 2025 20:52:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747972372; x=1748577172; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RBI3Bc2vDZl6Jt4cPt9etx33zUGL1L3j36BSetdxOSY=;
        b=OWZhb4XR1wM3zfDIjrjorNGVlPL6OjCJqVO2j7YnBzZmaD7eMuKOO7HwJlo03EGZkV
         sXL13yytzYOpGqqkhOLmGEPpkRH0SJgPFpOtoW1d5M72f6EZzUgU/If//TQYhT2km42i
         HvIwNAQDJ5nE+dadO+PoxufRcTwjWWKtRg3VWlQGFwyMNdolIrIAtGGghv+MCl4EC60a
         W/adxtTD4aRwXEGJ7MyYggVLiPi25JYXHX51db9zMzAxJ6MebMghmrV9DrPOeg46h8EJ
         sCOmZPG5Ig59M67QnPAGpVp2XHqjhPEB2dITx8t9g93Wt1FxM+G3oMtISNuYUHjP3Pbk
         5+qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747972372; x=1748577172;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RBI3Bc2vDZl6Jt4cPt9etx33zUGL1L3j36BSetdxOSY=;
        b=d5L1273yXBDGTrrtlvu3Aoa4bhTlIihIqVBU3hlorBctHxcXoucKnMT9f7wWRLVqxU
         2ApLI8wKQWOfLPvfcz8/Gx66hVuOsgeledQ2hLZGkn0SWAHNOr54Y/4STw3FdkZfRumY
         dOutjsy8nFNUV8HbZDjDZ/3vqDwZoJntYIHdEWRg0PvlN9Uzj+J36xir7Qr3M6gqY56S
         UjCdqcUMo/lqHVx4zoD2hsPfN+ySq+FVqrhzh4LretBfrGogAqmCdejDN5RIzw7pS5Gn
         +csgEvM5xB8RQOMbXkqnR7lgmgTmvyFPthjGpXs0lWV0X7Z1i4/GCkzSGzm7RV3S4EDr
         IZHQ==
X-Gm-Message-State: AOJu0YxVUhHQv0EmfIgKonFoj1i1ybjaAmo0ebnnnWAHiM2AaFEbP9/B
	I1oKi19M96anuZU9iGmUcAdl3E1SJfS1saSq7C4OVhrKl+zrlDw4LKJseNy6wQF0
X-Gm-Gg: ASbGnctzgN29DbrmrYZeI4RGDFdTnNv2O9iMeb4/TTzbvu4+R0mgAVlTI8HHyEz2/dd
	3X6v8qkoQzr4Kkc9k4T763icLbbBL+vNaWuVogLG7ZIO3UEBwPy6L4mLZMUUphaGdCX+x5DlPD6
	UlnUwnTj3mbTsgmUW7RcIWBkKleYrGqUzbfc8I6fj5ziJOuUekffRRTMpUoVcXBcono7kIBpsT7
	Xr22ZiO6tf2KAFNDMmT5ecIAVGBKwWucIWwbjFz8JJuNPSLSOihF1ZDsdG9TPvCGeYzQsK4LKxa
	w8JsnodFpzp98o9GUBaI+XXm2PQGfHa1oe7KLtqVnf4=
X-Google-Smtp-Source: AGHT+IHuMQlMCe9/s8VETeeAdtXO3IQn3eY03mDoRp9YvFE3RgsKnOidwYQtJ72ib88vApiVUbTRhw==
X-Received: by 2002:a17:902:ec8b:b0:231:f064:aae8 with SMTP id d9443c01a7336-233f260cf6amr20156895ad.45.1747972371923;
        Thu, 22 May 2025 20:52:51 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::5f56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231ecd5ea41sm107181155ad.228.2025.05.22.20.52.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 20:52:51 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 22 May 2025 20:52:43 -0700
Subject: [PATCH v3 09/13] bluez: Disable invalid-pp-token warning with
 clang
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250522-clang-toolchain-v3-9-16cfc6d9891b@gmail.com>
References: <20250522-clang-toolchain-v3-0-16cfc6d9891b@gmail.com>
In-Reply-To: <20250522-clang-toolchain-v3-0-16cfc6d9891b@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
X-Mailer: b4 0.14.2
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 23 May 2025 03:52:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217169

We add FIRMWARE_DIR via CFLAGS using escapes for string and clang
option parser flags it

<command line>:4:23: warning: missing terminating '"' character [-Winvalid-pp-token]
    4 | #define FIRMWARE_DIR \"/usr/lib/firmware\"
      |                       ^

emitting this warning during configure means some tests fail wrongly. e.g.
test for enable -fPIC -DPIC, which results in textrels in libbbluetooth.so

This warning can be disabled, the string is correctly passed to sources in
the end, so its spurious

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-connectivity/bluez5/bluez5.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-connectivity/bluez5/bluez5.inc
index 7bae968094f2a272c4deff7416dbd1208549e6ce..5835662f7a63a23915ec4af94597ec4a614a4640 100644
--- a/meta/recipes-connectivity/bluez5/bluez5.inc
+++ b/meta/recipes-connectivity/bluez5/bluez5.inc
@@ -84,6 +84,7 @@ EXTRA_OECONF = "\
 "
 
 CFLAGS += "-DFIRMWARE_DIR=\\"${nonarch_base_libdir}/firmware\\""
+CFLAGS:append:toolchain-clang = " -Wno-invalid-pp-token"
 
 # bluez5 builds a large number of useful utilities but does not
 # install them.  Specify which ones we want put into ${PN}-noinst-tools.

-- 
2.49.0


