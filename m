Return-Path: <fede.evol@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADC87C433EF
	for <webhook@archiver.kernel.org>; Sun, 19 Jun 2022 15:24:26 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com
 [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.web08.20034.1655652261100780584
 for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Jun 2022 08:24:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=EzYD4NU5;
 spf=pass (domain: gmail.com, ip: 209.85.208.42,
 mailfrom: fede.evol@gmail.com)
Received: by mail-ed1-f42.google.com with SMTP id cf14so2179768edb.8
        for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Jun 2022 08:24:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=w+bnSc8hLdy0CpmjIrT/W08Hz3k+xrowFGjFexqN1PI=;
        b=EzYD4NU5Bn4FdrW+U4EC20IbkIx++4loo9S+gBZhr8NeYRjJ4Fb/KYoosVUT+JWnCB
         X3ws5H3QCMX14i6kBt5Y7rql6gxmlbHfMXD5JYhlRD9IuMtQBjqj1AAAN3TC86AD4yRQ
         NgJ08f30cXTJCyKbWKGrpy43i7ubfEi0A/RCDGbrdnuv8ZjvgRLjKCapN0h1UmaStTAw
         1JZObkRoNhG/RezB92ScIECQ3ZHeiXGnSMWSYd76LLitOnGgz5WxhErLBFPMvb6qbotM
         JPmD+VCefW1VajKB1KevJ0KXUFBKq/lLMNeAuekDA72WuIetdIRQeM1gMHxTuF7plLPa
         d1rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=w+bnSc8hLdy0CpmjIrT/W08Hz3k+xrowFGjFexqN1PI=;
        b=ShUSvh1//+K3RleICob25Wv9QaQgkeqwC2p+0onMjiJxAnIKDIc52u2CdNPpVDwhiU
         6LgweOS7I3I99E0egZEhSUpanVsuWai2HAC9pFQN9yDUa3i61tio2CvyCAIt4y+kLmfU
         +Ccmqv33xDiaKZ3ZcYsee468hHISObWKQLRfrE4lPHjcohy6kfHRcrhEUZYI9gdynkjg
         56+jQCavPvdt5xcm0sIvFCrPAoebQ6InMBkYw2nHXaTIeeTG+xCU65PzD8Dy7t3XnmqS
         SPuekBbfSQIYyur6cjPNWXKVR8wUkxvONalY7FrKE8kOdiMCm8HaEB8e+BPFu+tiYe/1
         b3hQ==
X-Gm-Message-State: AJIora8Vb4hmzUNO1v1RlwRmuCSLztjBSzqwCQ6d7y9XCq0ICz0hNnr0
	4KAmjL+iNILMEkcpGRSsyhXjYp8227xKKQ==
X-Google-Smtp-Source: 
 AGRyM1u3hRdiEMUv214KaBvk0Cu3s+rZ9hBXp+mnXVNSRN9HaFYRo9gtMMclu6dp7EO63/2EAHxOHQ==
X-Received: by 2002:a05:6402:40c9:b0:42d:da4a:9a72 with SMTP id
 z9-20020a05640240c900b0042dda4a9a72mr24549955edb.380.1655652259687;
        Sun, 19 Jun 2022 08:24:19 -0700 (PDT)
Received: from interzone.fritz.box ([2a02:2455:e62:5a00:cd58:9e10:e01f:52a7])
        by smtp.gmail.com with ESMTPSA id
 fd18-20020a056402389200b0043570d96d25sm3313072edb.95.2022.06.19.08.24.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jun 2022 08:24:19 -0700 (PDT)
Sender: Federico Pellegrin <fede.evol@gmail.com>
From: Federico Pellegrin <fede@evolware.org>
To: openembedded-core@lists.openembedded.org
Cc: Federico Pellegrin <fede@evolware.org>
Subject: [poky][meta][PATCHv2] signing-keys: fix RDEPENDS to signing-keys-dev
Date: Sun, 19 Jun 2022 17:24:17 +0200
Message-Id: <20220619152417.44584-1-fede@evolware.org>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 19 Jun 2022 15:24:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167037

Specific provider (ie. RPM or IPK) does "provide" just itself as a
package to the system. This will cause the "-dev" package, which
refers to the generic signing-keys and not the provider specific,
to miss the dependency.

Error case (RPM) when populating sdk:

Error:
 Problem: conflicting requests
  - nothing provides signing-keys = 1.0-r0 needed by signing-keys-dev-1.0-r0.noarch
(try to add '--skip-broken' to skip uninstallable packages)

Examining signing-keys-rpm packages in PROVIDES we have indeed:
signing-keys-rpm = 1.0-r0

But in signing-keys-dev: in REQUIRES:
signing-keys-1.0-r0

This MR will fix the situation by removing the RDEPENDS for
the -dev package

Signed-off-by: Federico Pellegrin <fede@evolware.org>
---
 meta/recipes-core/meta/signing-keys.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/meta/signing-keys.bb b/meta/recipes-core/meta/signing-keys.bb
index 03463f95f56..107a39d6581 100644
--- a/meta/recipes-core/meta/signing-keys.bb
+++ b/meta/recipes-core/meta/signing-keys.bb
@@ -18,6 +18,8 @@ FILES:${PN}-rpm = "${sysconfdir}/pki/rpm-gpg"
 FILES:${PN}-ipk = "${sysconfdir}/pki/ipk-gpg"
 FILES:${PN}-packagefeed = "${sysconfdir}/pki/packagefeed-gpg"
 
+RDEPENDS:${PN}-dev = ""
+
 python do_get_public_keys () {
     from oe.gpg_sign import get_signer
 
-- 
2.35.3


