Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB168C433FE
	for <webhook@archiver.kernel.org>; Thu, 13 Oct 2022 19:25:56 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web09.414.1665689156069282379
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Oct 2022 12:25:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=cxCAFAcN;
 spf=pass (domain: gmail.com, ip: 209.85.221.45, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id bp11so4342902wrb.9
        for <openembedded-core@lists.openembedded.org>; Thu, 13 Oct 2022 12:25:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fZxz9TLzvJZdhPJGHDuA72UIglNRhAH9dmMZTF6c1uI=;
        b=cxCAFAcNzY8mzaGhsk78qX0U5MD23GaCG+GF4lO4Q2us2LW4+lWHmnP5f3Z62O7mGv
         aLT5qN7jqnrA2zPv1w1jnp6YKewYvQ9J35Fl0I4sLyYnhZAFfwLp+5SlRUlhkZSpjjok
         +JR4EvzVfjSt86tYaEFckfb9HPBUZUgzhZUg74b5jSNz91zd8vZcRLm5ZYdc6K5V6a7A
         Wp3KFR2ENEe3a8Ovb4VA8C1YeclioG/8mgjF6W6HWUNqbFjug7qTWzp+voRUasrPez8G
         lP6g5vW7TuRKPQUDqOpfewwjWLMyolkhmxo6I1dWwEm8P7P3hGNZtbfD/jHlKNMyPDnF
         8d2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fZxz9TLzvJZdhPJGHDuA72UIglNRhAH9dmMZTF6c1uI=;
        b=nE/mNo4GoAMQSsnr4Q19DA2U/IZ/bAh8+bPh3+ofTSr7PKmZ1Odx7stCYL/N1oP6Ea
         CdI5sMKKWQzF0J+cxtSw6o6uKR3qXwOw+82uAWCLMead0rrPWFGGXx6bkEww4tgRe8Gb
         NjxZt71+I2XcNNSmReSwY4nqKoDkGoswYhdS7saWORNncu7Gi+LSZvDQuJK9oqAoXV3g
         CEec3biaveZJcKmsX3Y4rB9btmudtFbrfHrmzVTaV/NiagZkSzWJd+zX1hNagfD03zYc
         id/HjwZk0atH1HThLkkdpPIRQUEAszACrOshiSUxsBEqfLjlqG/y4WyuWre9Z9B7yL2r
         HxvA==
X-Gm-Message-State: ACrzQf2YnaRVkKfBoBoPG1sAdAbvfFQYtEoddcOwlHGAGWw1t81IjsBA
	xHv2FptYh71lQAPDHTHFte51yh9AiM7jxA==
X-Google-Smtp-Source: AMsMyM6gGDwtPMHnUVti7wrZh2Zht3Oq0xfwYPrnoGTHIhkW6YBFj7k9tduqRNYsV6r9ENbjeJHqQg==
X-Received: by 2002:a5d:588c:0:b0:231:893c:1a08 with SMTP id n12-20020a5d588c000000b00231893c1a08mr1028558wrf.317.1665689154243;
        Thu, 13 Oct 2022 12:25:54 -0700 (PDT)
Received: from og-worker-dev-01.infra.foundries.io.net (51-159-19-113.rev.poneytelecom.eu. [51.159.19.113])
        by smtp.gmail.com with ESMTPSA id f7-20020a1cc907000000b003b31c560a0csm304371wmb.12.2022.10.13.12.25.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Oct 2022 12:25:53 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: openembedded-core@lists.openembedded.org
Cc: ricardo@foundries.io,
	Jose Quaresma <jose.quaresma@foundries.io>
Subject: [OE-core][PATCH 2/2] archiver: avoid using machine variable as it breaks multiconfig
Date: Thu, 13 Oct 2022 19:25:30 +0000
Message-Id: <20221013192530.1761915-2-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221013192530.1761915-1-jose.quaresma@foundries.io>
References: <20221013192530.1761915-1-jose.quaresma@foundries.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Oct 2022 19:25:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171720

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
2.34.1


