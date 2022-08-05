Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7678BC3F6B0
	for <webhook@archiver.kernel.org>; Fri,  5 Aug 2022 13:13:10 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web12.6768.1659705176182557441
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Aug 2022 06:13:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=KFj+MEIa;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.54,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f54.google.com with SMTP id b6so1389994wmq.5
        for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Aug 2022 06:13:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc;
        bh=GXEiZaUo2jc528PGvNwaWOpdzWuGPCO+1Uo980CA+PM=;
        b=KFj+MEIaTj6BmrdUn6chjbPcevCRx5f7NjuUQyV6pfI+8ZR88RpIPZQ3JwRayrGqm9
         tLvlImcdpxK2Is6bcb9OZbrZDseX1SSxkyF4l3z9jaeBCQaqV9tcpn2WDmEy9jgNdeKh
         3vonTBfNmEOj01U8M6D4MmIU3/Y18EFonuyt8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
        bh=GXEiZaUo2jc528PGvNwaWOpdzWuGPCO+1Uo980CA+PM=;
        b=K5b2CKXfIhjGGBRvnxWoOIjJCynYaIE0dkUNaYXv6GYqtEQ0LLB/AyowSVPSLVtxgR
         QHPkfmEj3OgmcGkaX9P8IcYyGD0mC7+yA7pwXXt9YFHUCTIGQZiJBqVEFsDtk675om6G
         Z0wt3mXqrwiSip2KAS2jJXcIbdTenQ2EmMXFCxglRdtjer7jYOL/qP1WaEDlM0UZFxaB
         cW59O2sfRZUrpaHS838DfTQAmXrPc0HFnuZanoaZyIDm3jmzF6THgHTFrCWTxsfcR3yE
         9sePjTvQATuDmi88wZzfLrH7G1AocxGrfFqMBgKWFt6jUlaq3B8tHGaZgY9iiRRZAGQa
         Vggg==
X-Gm-Message-State: ACgBeo27kShPNR2o+YmAiB8CRVoXc5PMTyhSQORo0X8xnBzixepvWiSZ
	GZg9l5b02m5DQZAArjZKIZbuBxk3VQknrA==
X-Google-Smtp-Source: 
 AA6agR6Ax11191d8rJaSU3us6UPuKgCS3Aq+BHaaQwFMOIK1bmRw+YKfejxi8x9M1Y0C1FVN+JHZlA==
X-Received: by 2002:a7b:cb0a:0:b0:3a4:eafc:367d with SMTP id
 u10-20020a7bcb0a000000b003a4eafc367dmr4805280wmj.0.1659705186589;
        Fri, 05 Aug 2022 06:13:06 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:f483:fcb0:1452:5a5a])
        by smtp.gmail.com with ESMTPSA id
 p12-20020a05600c204c00b003a51a0d35e7sm1908901wmg.37.2022.08.05.06.13.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Aug 2022 06:13:06 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 14/29] rust-target-config: Show clear error when target isn't
 defined
Date: Fri,  5 Aug 2022 14:12:37 +0100
Message-Id: <20220805131252.3706794-14-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220805131252.3706794-1-richard.purdie@linuxfoundation.org>
References: <20220805131252.3706794-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Aug 2022 13:13:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168948

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/rust-target-config.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes/rust-target-config.bbclass b/meta/classes/rust-target-config.bbclass
index 7fe039601af..ab177cf59f4 100644
--- a/meta/classes/rust-target-config.bbclass
+++ b/meta/classes/rust-target-config.bbclass
@@ -326,6 +326,8 @@ def rust_gen_target(d, thing, wd, arch):
     tspec = {}
     tspec['llvm-target'] = llvm_target
     tspec['data-layout'] = d.getVarFlag('DATA_LAYOUT', arch_abi)
+    if tspec['data-layout'] is None:
+        bb.fatal("No rust target defined for %s" % arch_abi)
     tspec['max-atomic-width'] = int(d.getVarFlag('MAX_ATOMIC_WIDTH', arch_abi))
     tspec['target-pointer-width'] = d.getVarFlag('TARGET_POINTER_WIDTH', arch_abi)
     tspec['target-c-int-width'] = d.getVarFlag('TARGET_C_INT_WIDTH', arch_abi)
-- 
2.34.1


