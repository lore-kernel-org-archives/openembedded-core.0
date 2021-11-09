Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7D76C433EF
	for <webhook@archiver.kernel.org>; Tue,  9 Nov 2021 13:21:34 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web08.11911.1636464094023858193
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Nov 2021 05:21:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=aBB6tgtX;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id o29so12003766wms.2
        for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Nov 2021 05:21:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9S5VV0ODafD7/ANZn7e8382IPfKwp6D54QwwFsHx6s0=;
        b=aBB6tgtXbIJD1snIoa7dvU472vlM52XB5gEdxc7RJEtbpbGVnmoR8esrVdmz7+9sCw
         piUOp+eDkLIOzt5k9Rv7elgAHUGqLWgj8h1myiOmHS2N5zy8M5H9UJG0K4W2wQIZX6Gs
         jwhtQXj+yGnyI96Z2GIdI3BDYtcEK2efHZPV0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9S5VV0ODafD7/ANZn7e8382IPfKwp6D54QwwFsHx6s0=;
        b=AWXPevZvOUy8pFfEdODzRhI4f7r+JeMQnY+NpJ56aApNRfGz6mmOCsTSmhpxFb8Xbd
         YWrIjbpDZxmszfmdCTRkOMxgs2/0bMG7y/oXCOr80wV9XOYjTJuAfitHlvymRu2eiSey
         uz267CRQGQDSsphA83DRbu1kH8If4PyQpoJmBppkNNNTw3EUoK2rAFPIJfsBOqhLk5Q8
         lZCRGIs95ZhhMJQCNuvba38BcKlzUyTh3ipJ949ZjaAplnSKmOu5a/v1GL+uFVNs7HAb
         v5nxnjw5kRDG64IMutF07Vt3vgbRghxvxTOMTaG4wUwpwdXdoagtK78jxi6qzeJafHpy
         f5ag==
X-Gm-Message-State: AOAM530KE2Cc3s9BiJPIf0LvfSWYCRQKLsVrJtRMzbJffXLPkBV30vMs
	eehb992VI8k5Yc+s9AnsUmcjARrlXIROgw==
X-Google-Smtp-Source: 
 ABdhPJwYIDCcOrks4hZCEciG9Ly3s7foX1EZ1Rgl85Q6QzUWMDJzgO0Eq4v5TxKh8l4Z6FfreBALuQ==
X-Received: by 2002:a7b:ce8a:: with SMTP id q10mr4431417wmj.55.1636464092158;
        Tue, 09 Nov 2021 05:21:32 -0800 (PST)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:10b7:e9c6:d1a:6f7c])
        by smtp.gmail.com with ESMTPSA id
 l26sm2570095wms.15.2021.11.09.05.21.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Nov 2021 05:21:31 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] mirrors: Add uninative mirror on kernel.org
Date: Tue,  9 Nov 2021 13:21:31 +0000
Message-Id: <20211109132131.3789773-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Nov 2021 13:21:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158018

At the last nas outage, we realised that we don't have good mirrors of the
uninative tarball if our main system can't be accessed. kernel.org mirrors
some Yocto Project data so we've ensured uninative is there. Add the appropriate
mirror url to make use of that.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/mirrors.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/mirrors.bbclass b/meta/classes/mirrors.bbclass
index ba325a658bc..75eb86a7243 100644
--- a/meta/classes/mirrors.bbclass
+++ b/meta/classes/mirrors.bbclass
@@ -62,6 +62,7 @@ ftp://.*/.*     http://sources.openembedded.org/ \n \
 npm://.*/?.*    http://sources.openembedded.org/ \n \
 ${CPAN_MIRROR}  http://cpan.metacpan.org/ \n \
 ${CPAN_MIRROR}  http://search.cpan.org/CPAN/ \n \
+https?$://downloads.yoctoproject.org/releases/uninative/ https://mirrors.kernel.org/yocto/uninative/ \n \
 "
 
 # Use MIRRORS to provide git repo fallbacks using the https protocol, for cases
-- 
2.32.0


