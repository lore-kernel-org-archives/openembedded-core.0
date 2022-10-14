Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A150C4321E
	for <webhook@archiver.kernel.org>; Fri, 14 Oct 2022 15:24:59 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web12.8548.1665761090318636347
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Oct 2022 08:24:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=pH3Q0wLC;
 spf=pass (domain: gmail.com, ip: 209.85.221.50, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id n12so8078915wrp.10
        for <openembedded-core@lists.openembedded.org>; Fri, 14 Oct 2022 08:24:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XFliLuMZCxw7L4m4/UByv0dP0YjKQ5ESeHoR3Nx3C7o=;
        b=pH3Q0wLC7eCGNQAxI0+zO/QwJ81e1C9HOrIgeWyoExonmawfL5XknaRoYxB81iaz03
         9AghphdeXAPHdmhAlr8tMfVzJ6IUtt06U5ZO2vU4r3jEQ93wARAI9ygtgncXiyh2elrk
         z/3JLARC0Kix+78PgNKhBHXIVcVKyuUx9WMCuSY02uJkR177Zz86DB9g0I3oPb+9A86o
         ZsmrXWYJsMoTeBEpxXIgxQcZPWeTn7CEYnBeIJMD4PNVicxb0usa5N9JB6t/i+ByZJuh
         GqcjRxwerssci3H+JQP7QBjNPGgOTIei4Y20POZdpZbc6CZNAjzDlMBwD+xt9x2Xw6UQ
         YukA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XFliLuMZCxw7L4m4/UByv0dP0YjKQ5ESeHoR3Nx3C7o=;
        b=UDGDZPmxevyABeyHDIKdNekxvM0DVR2Nqz+x9gQcSbs6Z8Yqy3Fqj4CeprGNp5CSkC
         FzsJfYue27SyIeOH/Zjh/J7MGTS0LfUdiDeC7hUljjvFwQS/CmN1tjtNOAnaWicx93VY
         XLdv9kLHfXlIVIAwbFt/RKlyDfR8lqey7OxzN8x4djOS7hDlTg+CBdscSyn+ZFkPZqFe
         WgJQOA+A/F43e/dL0LWdtgrL2kxcdpGtbgM7QZfRf4uwnDPRvnh8FOyGv1ERfU9LW3iM
         aMlQufBPXugUJ5b1hZAUdSVKCjdFI0wTLlCL4doFiiqTsFtF5t5mhMoLhxwDSQrzcPfI
         7alg==
X-Gm-Message-State: ACrzQf0skcL5no0n0a2lnIYowpLacD60e1PNuVxl2SeQBqwKd/PyJMS8
	K78QIBLmzdvsGXvWftUp8lGKVIq2Dasxy/34
X-Google-Smtp-Source: AMsMyM4w7jWVCJ48xEb4qCPcf4NRKua40WKTf1tTxITpE4NDfs+jS4pJ3bYB7EobsWTi9cs4HFHQUQ==
X-Received: by 2002:adf:e547:0:b0:22e:3c6a:bb0c with SMTP id z7-20020adfe547000000b0022e3c6abb0cmr3867189wrm.382.1665761088237;
        Fri, 14 Oct 2022 08:24:48 -0700 (PDT)
Received: from fio.lan (11.77.115.89.rev.vodafone.pt. [89.115.77.11])
        by smtp.gmail.com with ESMTPSA id bz13-20020a056000090d00b00228cd9f6349sm2148765wrb.106.2022.10.14.08.24.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Oct 2022 08:24:47 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: openembedded-core@lists.openembedded.org
Cc: ricardo@foundries.io,
	Jose Quaresma <quaresma.jose@gmail.com>,
	Jose Quaresma <jose.quaresma@foundries.io>
Subject: [OE-core][PATCH v3 2/2] archiver: avoid using machine variable as it breaks multiconfig
Date: Fri, 14 Oct 2022 16:22:46 +0100
Message-Id: <20221014152245.243292-2-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20221014152245.243292-1-jose.quaresma@foundries.io>
References: <20221014152245.243292-1-jose.quaresma@foundries.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Oct 2022 15:24:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171736

From: Jose Quaresma <quaresma.jose@gmail.com>

STAGING_KERNEL_DIR uses the MACHINE name so it breaks the multiconfig
and in this cases it will run the shared recipes twice, one for each
machine.

STAGING_KERNEL_DIR it's been introduced in commit 5487dee2e1

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
---
 meta/classes/archiver.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbclass
index 0710c1ec5e..4049694d85 100644
--- a/meta/classes/archiver.bbclass
+++ b/meta/classes/archiver.bbclass
@@ -465,7 +465,7 @@ def is_work_shared(d):
     pn = d.getVar('PN')
     return pn.startswith('gcc-source') or \
         bb.data.inherits_class('kernel', d) or \
-        (bb.data.inherits_class('kernelsrc', d) and d.getVar('S') == d.getVar('STAGING_KERNEL_DIR'))
+        (bb.data.inherits_class('kernelsrc', d) and d.expand("${TMPDIR}/work-shared") in d.getVar('S'))
 
 # Run do_unpack and do_patch
 python do_unpack_and_patch() {
-- 
2.38.0


