Return-Path: <hfranco@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 767C0C79FB6
	for <webhook@archiver.kernel.org>; Wed,  9 Sep 2026 13:28:18 +0000 (UTC)
Received: from mail-vs2-f12.google.com (mail-vs2-f12.google.com [74.125.227.12])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12217.1788960488988818378
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Sep 2026 06:28:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre.com header.s=google header.b=Gu3pIgDM;
 spf=pass (domain: baylibre.com, ip: 74.125.227.12, mailfrom: hfranco@baylibre.com)
Received: by mail-vs2-f12.google.com with SMTP id 71dfb90a1353d-5c7e8a176c1so86838e0c.0
        for <openembedded-core@lists.openembedded.org>; Wed, 09 Sep 2026 06:28:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1788960488; x=1789565288; darn=lists.openembedded.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=6oeixZrhWgT0fSufJYiade93leGhDm+YLWquOOZ/w4Y=;
        b=Gu3pIgDMcrmg1WcXk6fBL/A0LJNRRYD8UjIJ/2RWjlVS9PbzXbAjGPxoloIbKmEXdr
         tWScze5RGGU04YylK775iHlJ4Uaj0HGGjHV5WXskAEQ3Bi6w/skxCNarWe2WoDSsffMA
         OW8PkihLQDS+IwJ3tB0DI3hKOb1LMvPxwal3m/HQyMqU3faS+EsGqtz84FEQzFWNf59R
         hQc8UNIkfp2Tzm5Zt12Bi7kX0lRr3gUeaGinyXx3qzcJ6MNWWpk40YOIHjYfokduTCFZ
         ig1nDcguNAsU2CoZsbHc26OfSMk2ZETFKTSd2OF4+vbOJBHfzJE25DCJnuiHTQ2Vkehs
         k4UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788960488; x=1789565288;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=6oeixZrhWgT0fSufJYiade93leGhDm+YLWquOOZ/w4Y=;
        b=Rb33KJb9HM1hXEexhgYvb0OROQ/pEtUskYSPzfsiPQi78E7Y6tb1Qp4HbghwYGh0hc
         pLKmv+kIdOs7JsOE1qztlqwCF+cT+zPQWWIhk2RzOV8RqWDaqZFhNEAantGXiM5X3UnM
         8HAtmxt+ePIw/9Z91aY8o8Ap20k/VI+7MR6UFRzYb5TQsoP7XQkZpoJUT7KUzup2HuY1
         WBkSAxYm9ELjo2cgBWaevI1ByMhFE8BybajPrDWeOEWOOTqyzurs0okV6rgfIaeSqZ5t
         xjqfWvwICsi0sfNu8TkRJLfRZQ9A9KGQRj3LDZhwpu2Ugh0JXPnMGTamn0aleJZ8p7y0
         DUwQ==
X-Gm-Message-State: AFuF++lLLOPtiQbDenrlSSIB+BRGj2qPZMiTEVQKEDkFwSg+lg+B9/gx
	P6UX1YseBGJVrM66+PYqVRxXibUjmd5mmI1oZlh7VYvK/F+Hy8ATLJKJtU4Ar1j6D20=
X-Gm-Gg: AYBFou08+vmRSEdW0GSvJQuvrTphRnrAyUCtEYrPFh1M2Eo0Ao4JlChHOvd7Zb0Ad4b
	bAuDN5cM+TxMZHV+uV0+DtxkAI+YrOemXUO3TExRVny6Gd4CARNwWfhRDch691+MWi/CiCG5NjR
	Mb1RZ7jxoThVTCADEfR3V6tVFFr7kskdLn9/YSSZhA0JqOvmrzCrwkPwigVdffZtkqO8OQpHmRR
	w4oipWJD2LuuKyKlB5Gtw3PRh8VQJAM8Iinc5G6rcuxc4vHZP/DzC1Gsh7eCSrb3jAnauiw5eVt
	IfP4HQ0C5js5eG5YkVpJeyj72WTMvJjOQR342Tr0/e+MLSOKFCJArHcXx67yW6q9i8+zGp7GSmh
	84T360gFDiM2PuuCWA6qDd7H4DmLRfq2rG4eRMykQtHRaMmqtqTJ9YcWEq6EBv8lcCkXQ6tNr6e
	+1B8XHXzGeQDn4tKpqtMtRYPi66lF89H47+CiIUdq/qJNHofVE2qJgoG8q6TsvT56ZbTSo5sxk2
	RmS4tyVGvV/QjgzQsjyCnhaEgayseEW+4coq6fe1tlAjcti5mI=
X-Received: by 2002:a05:6123:2eb:b0:5c7:c666:ec22 with SMTP id 71dfb90a1353d-5c8336b2a5emr682933e0c.6.1788960482880;
        Wed, 09 Sep 2026 06:28:02 -0700 (PDT)
Received: from [127.0.1.1] ([2804:14c:4c5:9534::7f1c])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c7ec3874acsm11923748e0c.15.2026.09.09.06.28.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 06:28:02 -0700 (PDT)
From: Hiago De Franco <hfranco@baylibre.com>
Date: Wed, 09 Sep 2026 10:27:28 -0300
Subject: [wrynose][PATCH] u-boot: share CVE_PRODUCT with u-boot-tools
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260909-uboot-cve-product-wrynose-v1-1-072b994b426f@baylibre.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/y3MTQ6CMBBA4auQWTtJpRFTr0JY0DLouOiQaYsaw
 t2tP8tv8d4GiZQpwaXZQGnlxBIrjocGwm2MV0KeqqE1bWeccVi8SMawEi4qUwkZH/qKkgitJXO
 eT86OvoPaL0ozP7/vfvg5FX+nkD/D/p8NsO9vR8HeZoYAAAA=
X-Change-ID: 20260909-uboot-cve-product-wrynose-33e07f593ab6
To: openembedded-core@lists.openembedded.org
Cc: Devansh Patel <devanshp@cisco.com>, 
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, 
 Richard Purdie <richard.purdie@linuxfoundation.org>
X-Mailer: b4 0.15.2
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Sep 2026 13:28:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245461

From: Devansh Patel <devanshp@cisco.com>

u-boot-tools builds host utilities from the same source as u-boot, but it
does not inherit the existing CVE_PRODUCT assignment and falls back to its
unrecognized recipe-name identity.  Move the mapping to u-boot-common.inc
so both recipes inherit it.

Use "u-boot:u-boot" for the CNA/CVE List V5 affected-data identity and
"denx:u-boot" for the NVD dictionary CPE and configuration identity.  The
CNA records are also covered by NVD today, but retaining both authoritative
identities permits direct matching independently of NVD enrichment.

(cherry picked from commit bc30a343627e2d207c38d2262a7b07f506259051)

Signed-off-by: Devansh Patel <devanshp@cisco.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Hiago De Franco <hfranco@baylibre.com>
---
 meta/recipes-bsp/u-boot/u-boot-common.inc | 2 ++
 meta/recipes-bsp/u-boot/u-boot.inc        | 2 --
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-bsp/u-boot/u-boot-common.inc b/meta/recipes-bsp/u-boot/u-boot-common.inc
index 5e2ec08c30..88f6ee91b1 100644
--- a/meta/recipes-bsp/u-boot/u-boot-common.inc
+++ b/meta/recipes-bsp/u-boot/u-boot-common.inc
@@ -10,6 +10,8 @@ LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://Licenses/README;md5=2ca5f2c35c8cc335f0a19756634782f1"
 PE = "1"
 
+CVE_PRODUCT = "u-boot:u-boot denx:u-boot"
+
 # We use the revision in order to avoid having to fetch it from the
 # repo during parse
 SRCREV = "127a42c7257a6ffbbd1575ed1cbaa8f5408a44b3"
diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot/u-boot.inc
index a75948dfc3..8a084d8ac0 100644
--- a/meta/recipes-bsp/u-boot/u-boot.inc
+++ b/meta/recipes-bsp/u-boot/u-boot.inc
@@ -21,8 +21,6 @@ PACKAGECONFIG ??= "openssl"
 # a host build dependency.
 PACKAGECONFIG[openssl] = ",,openssl-native"
 
-CVE_PRODUCT = "denx:u-boot"
-
 # Allow setting an additional version string that will be picked up by the
 # u-boot build system and appended to the u-boot version.  If the .scmversion
 # file already exists it will not be overwritten.

---
base-commit: 9da814ca3685ada3fce46b8987f04ed3d57247b7
change-id: 20260909-uboot-cve-product-wrynose-33e07f593ab6

Best regards,
--  
Hiago


