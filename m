Return-Path: <luca.boccassi@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8546EC4332F
	for <webhook@archiver.kernel.org>; Wed, 19 Oct 2022 17:50:03 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web12.550.1666201795737531168
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Oct 2022 10:49:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Ak2Hh27q;
 spf=pass (domain: gmail.com, ip: 209.85.221.47, mailfrom: luca.boccassi@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id v1so1111893wrt.11
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Oct 2022 10:49:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=3nZJRMoWIHwKYNiE5XJY4JzJS6qdH+iAraxu4GS/SBE=;
        b=Ak2Hh27q+/ezzBVST8qck4HL6JcCAX+8RtDzLRS9Sl8KTMQ17xBw0lU/RIBOWpR5P3
         FDc0kRIdcJg5AFWKpvRq5egpkJk9jB9Sr+6RDo+Fp+ZDMf88uNWQt28DMTlEWHBqdIJK
         UgndBg3HIB9kVqd3NAhNAg70foZ0xnKfeom+fsiju3TTmlUVcZDDTY875txahZFPR+mz
         YWeKZETNmzhUj/N3p5KMtOOhiQ/o0izYA4tNeFBNKIFa/9hnnfrWnHV5PszH0l5cbsRx
         b+ZxUQB4FS0uH+7M3k/kH7mqQWZkCBKSgrmwDNIsoxOuCTjqzWyFezm3gMWkW89eFZ8B
         H67g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3nZJRMoWIHwKYNiE5XJY4JzJS6qdH+iAraxu4GS/SBE=;
        b=aIrlGmv3dFni1lUSHCk0WyFY8gqos1oW5z8ta9XQPioHzQcNYJgoTAf71wSnbo3mwH
         OSsOvQXIl+eGNK76aBXmr9gKNDLuQgbc5Qr0AfXPtS0tmsc4PxAj3vy9oeTcG8k6D1aq
         11S7pUuJPVfDYI2R5dmJfzT4GCZ/kmOlitsi0sqTfxYYvfAQ6g4ypli0cu9HwC6knjTD
         6JKcFTsmWF4HC0KmsZjagdHeqjNSyUv0jBNw7P6/LeSeE7iPGnF2G4EWH4d5QDZcRZz1
         rdABIy72XRSrbq6cACQVckE2qthX32FMBk+rbW/baPtON5X7pIol5r/saD5ePEvcQIzU
         isqg==
X-Gm-Message-State: ACrzQf0kjUVTaZcWx2DXuQHIzIhX7zC7p8UUTGaVsOlhrqU16UdAiw+5
	YImgP61uJ3/0xLoo/FjtDK6ehfKbsAa/uQ==
X-Google-Smtp-Source: AMsMyM7lf9Q+Tu/dEGRWXyC1BmEyL40GGNdLWhftl7rzqF9GIeVsFIsNyk9fLs/+w2UX2oz7G33Bbw==
X-Received: by 2002:adf:cc83:0:b0:22e:4e3c:fe06 with SMTP id p3-20020adfcc83000000b0022e4e3cfe06mr5841815wrj.20.1666201793536;
        Wed, 19 Oct 2022 10:49:53 -0700 (PDT)
Received: from localhost ([137.220.119.58])
        by smtp.gmail.com with ESMTPSA id m6-20020a05600c3b0600b003c6c2ff7f25sm805758wms.15.2022.10.19.10.49.51
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Oct 2022 10:49:52 -0700 (PDT)
From: luca.boccassi@gmail.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] systemd: add systemd-creds and systemd-cryptenroll to systemd-extra-utils
Date: Wed, 19 Oct 2022 18:49:49 +0100
Message-Id: <20221019174949.3167645-1-luca.boccassi@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Oct 2022 17:50:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171976

From: Luca Boccassi <luca.boccassi@microsoft.com>

ERROR: systemd-1_251.4-r0 do_package: QA Issue: systemd: Files/directories were installed but not shipped in any package:
  /usr/bin/systemd-creds
  /usr/bin/systemd-cryptenroll

Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
---
 meta/recipes-core/systemd/systemd_251.4.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/systemd/systemd_251.4.bb b/meta/recipes-core/systemd/systemd_251.4.bb
index 910ea71bf64..87668cadc75 100644
--- a/meta/recipes-core/systemd/systemd_251.4.bb
+++ b/meta/recipes-core/systemd/systemd_251.4.bb
@@ -518,6 +518,8 @@ FILES:${PN}-extra-utils = "\
                         ${bindir}/systemd-path \
                         ${bindir}/systemd-run \
                         ${bindir}/systemd-cat \
+                        ${bindir}/systemd-creds \
+                        ${bindir}/systemd-cryptenroll \
                         ${bindir}/systemd-delta \
                         ${bindir}/systemd-cgls \
                         ${bindir}/systemd-cgtop \
-- 
2.34.1


