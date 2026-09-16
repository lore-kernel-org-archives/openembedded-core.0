Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 852FDC982C1
	for <webhook@archiver.kernel.org>; Wed, 16 Sep 2026 16:47:12 +0000 (UTC)
Received: from mail-wr2-f39.google.com (mail-wr2-f39.google.com [74.125.225.103])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19644.1789577223593205194
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Sep 2026 09:47:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=CH30aDom;
 spf=pass (domain: gmail.com, ip: 74.125.225.103, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wr2-f39.google.com with SMTP id ffacd0b85a97d-482f633ece3so748716f8f.3
        for <openembedded-core@lists.openembedded.org>; Wed, 16 Sep 2026 09:47:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789577222; x=1790182022; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5bS7mUaIF27ocXJX6YlR8ziKAAZvolOSvq0QQNMnUkc=;
        b=CH30aDomMzfBNYgDk+OZay1Qb7Ayptg3P4LsM0SgG/qPGDaNEmVhm2mKF6aI6W0/Nt
         jVKXTAxJaq/ARXdWZvyAhnZ9bchXC/gusw0AGUPyUQg9/HFYuPyfsKMJczGCZUuavdOm
         G4dq3RfKFGBVDgL6aZmGjHIuI1NIwdbeVMrYLbKUbliOGKXoydfrpKrF7Jrh0ENbijmj
         iHFf7INvSg5Af+UVNuDojIm0Pd81sWJAtTjTE/4h5bEY66eQp0q2Y+ej7++9mgcJISoW
         aTJH6GLry2FR09wuYtHGvYaiL9PeJZl5t/d2tsIFLHFc1/OTy0O7QK3UawiASvldNwUb
         y8yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789577222; x=1790182022;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5bS7mUaIF27ocXJX6YlR8ziKAAZvolOSvq0QQNMnUkc=;
        b=tv/nU5T7pCCQCf1mct0rVfcQdLw+VMuEvp6OcMGKAsO1YOoJxiQk2vaItuYXURjx3m
         qybNttsizJlsGIva0l7B2KvQ+DuLfqmcSYiVn3CYZ21iRioyYKYNo4lIJZD+4qF73Iki
         hMCVTWzhhLHHsQrRDNxDFT1z1miV1Gj505fI8eGX+ZvaoHRnN6DLYlh48HLQzh0kEVIh
         vZWGNNJfCyu9RmoneLBnQRsHJuD3j5AS/3VRxLVVZ6wEiE9tFiVtyFa8TzJCvxwtn5ZI
         2shfSEDkhPLPknDEIxdFX3lMsh4ujSC5LzYXQwbuQhRfgsGra+etqqSfAqmVmYESWLG5
         x5eA==
X-Gm-Message-State: AFuF++kmyFtFGm6y2c3yuH2SDXzxS5alvF+opGk3PnsXaX/E7dx77/pY
	pKqccu3aAeliZNVhre3MyvVUi8T2kwtXImPWCucUi4sls822AGSOVWWEnhocIA==
X-Gm-Gg: AYBFou0cPxzrJTEL4XZEHQ2lDbAnJdxYL27FkqDzaxTkBQ1BHfSGHIxFaWJxIWVZ3xG
	vmWKJqT4rG3XIvDEtVCFd6403digvQ72XX7d5D0eD5NVaXrnpg1GzJVPp/j8Z2m97P5Xpzw5KNm
	oxCeLx58GIsCooHcFTBX/Hz6IW6sinZMiW9OVSJnb/9osISha0BBp4TLStWY9MKWVZvgLlBuDVU
	3yK1QZEIEtJKFf6KwjBnm73RU2rTMMGK/8I+zBFeEfW8rmgqlKXGK2Ij3V0hE2CPVYBhvP68uPQ
	ooplovBzqN3Pc1/Tm/2/HJ3dRWsCmdT8UiDCZEjZDY/fJ/dbd4xTooBQChaTM3dgwwmVtWEIFkr
	lOSZDwfKYo4HOIglf7GPgKUYJCghckmccuARJzQJO7iVvol8n0uKXbKPx9efrkYdQjvpK51Te5X
	n//80ChKtm2QsLBEQMscnBHBm/UR/leWHaU3v7G8x5+HGn1hL31ik7838E11ROmim+FkCY9ek2k
	TiO9sN4YN+/Vd+wgdfK7/Kw7JBcpDGaOwpudiqdJecnoaOSjmsFMwBzkG+A
X-Received: by 2002:a5d:584c:0:b0:487:d79:7cf7 with SMTP id ffacd0b85a97d-4870d797e09mr4137045f8f.52.1789577221609;
        Wed, 16 Sep 2026 09:47:01 -0700 (PDT)
Received: from localhost.localdomain (cust18-dsl93-89-130.idnet.net. [93.89.130.18])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bf27c65sm8350544f8f.21.2026.09.16.09.47.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 09:47:00 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>,
	Alex Kiernan <alex.kiernan@gmail.com>
Subject: [PATCH] python3-requests: Add PACKAGECONFIG for chardet/charset-normalizer
Date: Wed, 16 Sep 2026 17:46:31 +0100
Message-ID: <20260916164630.2563205-2-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Sep 2026 16:47:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245991

Requests 2.26 added charset-normalizer as an alternative to chardet,
since 2.28 it is the default and chardet is the option. 2.32 makes both
of them optional to minimise footprint, falling back to UTF-8.

python3-charset-normalizer is a fraction of the size of python3-chardet,
but only exists in meta-python, not oe-core, so is not selected here.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---
 meta/recipes-devtools/python/python3-requests_2.34.2.bb | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-requests_2.34.2.bb b/meta/recipes-devtools/python/python3-requests_2.34.2.bb
index 8230e8ce43b2..9e7dc14f6a84 100644
--- a/meta/recipes-devtools/python/python3-requests_2.34.2.bb
+++ b/meta/recipes-devtools/python/python3-requests_2.34.2.bb
@@ -17,7 +17,6 @@ do_install:append:class-nativesdk() {
 
 RDEPENDS:${PN} += "\
     python3-certifi \
-    python3-chardet \
     python3-compression \
     python3-email \
     python3-idna \
@@ -27,6 +26,13 @@ RDEPENDS:${PN} += "\
     python3-urllib3 \
 "
 
+# Requests 2.26 added charset-normalizer as an alternative to chardet, since
+# 2.28 it is the default and chardet is the option. 2.32 makes both of them
+# optional to minimise footprint, falling back to UTF-8.
+PACKAGECONFIG ?= "chardet"
+PACKAGECONFIG[chardet] = ",,,python3-chardet"
+PACKAGECONFIG[charset-normalizer] = ",,,python3-charset-normalizer"
+
 FILES:${PN}:append:class-nativesdk = " ${SDKPATHNATIVE}/environment-setup.d/python3-requests.sh"
 
 CVE_PRODUCT = "requests"

