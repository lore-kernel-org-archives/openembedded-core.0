Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D63C3D116EA
	for <webhook@archiver.kernel.org>; Fri, 28 Nov 2025 06:19:27 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10268.1764310761480559342
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Nov 2025 22:19:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=X0nbuRIB;
 spf=pass (domain: gmail.com, ip: 209.85.214.179, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-295548467c7so17544445ad.2
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Nov 2025 22:19:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764310761; x=1764915561; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XQx8tRTeBhyUBjtsl0UUsY/yKIXSuHwBu5ApBFXG/Cg=;
        b=X0nbuRIBYSn8F9ABB8Fbl9Oimc02ECek6x/6Vsi7bIAv1CCL7Vk9Xkvc47YlVY2sCe
         27ZyKMVWPgu5QNDrUVVECRXoBGRhdpk+epVG/KN6LknnOXdvuWx4oxcNkzlNNEpk0aB3
         YH3J19VKGes9f3oa5ecRIPSsymxmdSFByRmo/H5g59+bC1tgEQpo4UH+A3JEHkmuLWTI
         c6aBUxbJW//z0xm8IeEjNL27JHjwYoGZaefa20WMoHAtPOt99eM0c93A3gzocEqflAYJ
         92cngtg+SExutDyhzEFOZgQmVf1h52AdUeeP8ZN1uZRXi9zIB3xpbF08Or4v+ctKt7cF
         yaSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764310761; x=1764915561;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XQx8tRTeBhyUBjtsl0UUsY/yKIXSuHwBu5ApBFXG/Cg=;
        b=xUjZzr8JIj6Ope6fey+iEwVIFtDIF/GLGsfi3clsD6klDsGNRuiNLK83vMv13h4387
         ZnCjas2shEW25kAjyW9BZSxVclH/4xSQmVfQnF1uW9ZGz59NAaHbaXgcgA80I2oxHXxo
         FBH6PkbNytyG+PS3qzAQMUY+HBr6fA3qoX3M7aDdtxQab5U4h4pd7ABYla2ps8k3AxAA
         T8bx4Q3DO67PsG1yEnDuFiV9c3+Qi95rN1KkofvveJ2NOXGvu0KRYH64BgrAIHR8iQTY
         ydB0LRPyk2ylk+A4bl1kPorefZCiHjzpXYka3zwnhQFAfyRDlYRf4Ofu/7bcf6UzadGy
         k0Zg==
X-Gm-Message-State: AOJu0Yy7XXP+LygROdp0bRNA6o78/+xabfF9XPRKNZ3rk+ZT/HjUI8qy
	3c1ybtcWOftHjXgtLN7/0X5/+DZ5g9pEVFYZdwKvJf7g/EwLgxw3UhARn0gMhQ==
X-Gm-Gg: ASbGncsc2QNDc9aaKa9dU89C1uxJNk4Gw/B9zqr8zuRtTTilPwn8/NClTSVD1wFTfd3
	4V2y96igq6gwhQuyrs37sgM0MPZRGSoyp5l5zlp9FkOFcsjb6Ulpa6CrqpTL0OIj5jJUdZuNDPw
	0u9meu5qZrgxjiRy61ipfOLUkdI6McUB1w4HgIQo+H84jkDA7ZreC357aUfjxaD+Liq0bHhpoFG
	2AkoVJJ4HNc0DnnEvxf8rN/XRHZwSlheomGbu4r1/TWrmX6Y35fCv4Eu+Itd0gF/oMaAI8jSONY
	mptTDvTpmcrIlSnw8oSuyMiPzyYUzGGcXiTPdSG4ONiVqTt/lRwRiay301ZpbKdvGu9UZvnfYYw
	eOEtOKuFpdiT83F6/gDu5mB8eXU1/PYSiTZXYhypubWU1vxlGXg/u60PJyilZ7PAEp7wsHIXdo1
	cWV2agimN807rWpwSPC6zacY8w
X-Google-Smtp-Source: AGHT+IHzJxbjaQ2lfKkx3BsXzW+w/LwGVRIIfoAxQ/qEhA25z40/5dxZ9qgAyLgWOOPwMran5qaH2A==
X-Received: by 2002:a17:903:17c5:b0:295:7b89:cb8f with SMTP id d9443c01a7336-29b6bd583d9mr308041525ad.0.1764310760753;
        Thu, 27 Nov 2025 22:19:20 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([165.225.124.245])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29bce40a60asm35427335ad.19.2025.11.27.22.19.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Nov 2025 22:19:20 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [OE-core][PATCH 13/14] liburcu: upgrade 0.15.3 -> 0.15.5
Date: Fri, 28 Nov 2025 19:18:50 +1300
Message-ID: <20251128061851.1634479-13-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251128061851.1634479-1-ankur.tyagi85@gmail.com>
References: <20251128061851.1634479-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Nov 2025 06:19:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226896

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

v0.15.5
* x86: Define cmm_smp_mb() as lock; addl rather than mfence
* Introduce barrier test
* Add test_uatomic to gitignore
* Cleanup: Remove stray space
* benchmark: Add uatomic benchmark

v0.15.4
* uatomic: Fix redundant memory barriers for atomic builtin operations
* Cleanup: Remove useless declarations from urcu-qsbr
* src/urcu-bp.c: assert => urcu_posix_assert
* ppc.h: improve ppc64 caa_get_cycles on Darwin

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../liburcu/{liburcu_0.15.3.bb => liburcu_0.15.5.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/liburcu/{liburcu_0.15.3.bb => liburcu_0.15.5.bb} (91%)

diff --git a/meta/recipes-support/liburcu/liburcu_0.15.3.bb b/meta/recipes-support/liburcu/liburcu_0.15.5.bb
similarity index 91%
rename from meta/recipes-support/liburcu/liburcu_0.15.3.bb
rename to meta/recipes-support/liburcu/liburcu_0.15.5.bb
index fdbd79e016..94124c6391 100644
--- a/meta/recipes-support/liburcu/liburcu_0.15.3.bb
+++ b/meta/recipes-support/liburcu/liburcu_0.15.5.bb
@@ -13,7 +13,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.md;md5=c2a92498b6e88e276f986877995425b8 \
 
 SRC_URI = "http://lttng.org/files/urcu/userspace-rcu-${PV}.tar.bz2"
 
-SRC_URI[sha256sum] = "26687ec84e3e114759454c884a08abeaf79dec09b041895ddf4c45ec150acb6d"
+SRC_URI[sha256sum] = "b2f787a8a83512c32599e71cdabcc5131464947b82014896bd11413b2d782de1"
 
 S = "${UNPACKDIR}/userspace-rcu-${PV}"
 inherit autotools multilib_header

