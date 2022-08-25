Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD5B1C04AA5
	for <webhook@archiver.kernel.org>; Thu, 25 Aug 2022 10:49:08 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web08.22458.1661424538779038896
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Aug 2022 03:48:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=QCrOIALi;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.51,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f51.google.com with SMTP id a4so24114106wrq.1
        for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Aug 2022 03:48:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc;
        bh=s+5PpQCQ1IleuFvsQN3+Ymw3os0qifI9jvDa9n1JXMg=;
        b=QCrOIALik0ktbwOkOBoKaqKh+mFGJf2SR6gpknxJ7kfVPkI7h132MlBBXnPTdZmx2u
         ZRw7q1i6XutPSvgx1VKVZWo5WIKr5EZ/JqgGOhhPt7SIEd0wgv0Je7LOaMGbLOOva13A
         b4y6kRvIFSLEmHPR/+y8vxySPERHqpFcsVFTQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
        bh=s+5PpQCQ1IleuFvsQN3+Ymw3os0qifI9jvDa9n1JXMg=;
        b=H42pAPn235QRE3ZYqT+fePH6DNNd9H5OgRlr8qV2zmOh3KtEoGt5UrxewgSrpjTFsa
         kNAy5W6RSWeZGgUxiQ+p+02brkiWDeWaiGznc0km0+au/xvHMEyAxwURwjsW/jtih9NJ
         7WPhdQkUqW/sE1UNMIQKBkQ8oE1Fb4Q5PTsS92te3UPByNzupbEH4xTRSZ+DxpvMTCXe
         MdvngxoHwtqRk6Z/3CcP2pNZ6mqlWYSgD0b+XM8ieQe2FfxGBC126We6JX2mpPS/SU4V
         RqLrVARZPrdFbxdBBgRPaOvrKlT2nam9eES1c2Am0Js1RxdEVnWx3jIKNtaXI5dedGRZ
         9otg==
X-Gm-Message-State: ACgBeo2jVnm8ytes6dxbWZ9zaYmNYs8PMKZooMW3qYsn1pjAlBcl/hrz
	7G8IOladPLlEUY1MUmBTIzG37VX/sEjodw==
X-Google-Smtp-Source: 
 AA6agR6UuLnIc6bn20mIjTLdCtcZywpZuupdAQMcIhJ5XX3GUCRMgncheq58lvYA1dr8YIwyhxHrYg==
X-Received: by 2002:adf:dfc8:0:b0:225:2266:7cd8 with SMTP id
 q8-20020adfdfc8000000b0022522667cd8mr1842582wrn.19.1661424536744;
        Thu, 25 Aug 2022 03:48:56 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:8059:8737:891c:87d])
        by smtp.gmail.com with ESMTPSA id
 bh19-20020a05600c3d1300b003a54d610e5fsm5235521wmb.26.2022.08.25.03.48.56
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Aug 2022 03:48:56 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/3] rust-target-config: Drop has-elf-tls option
Date: Thu, 25 Aug 2022 11:48:50 +0100
Message-Id: <20220825104851.3258387-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220825104851.3258387-1-richard.purdie@linuxfoundation.org>
References: <20220825104851.3258387-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 Aug 2022 10:49:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169845

This option doesn't seem to exist any more and causes lots of warnings.
Remove it.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes-recipe/rust-target-config.bbclass | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/classes-recipe/rust-target-config.bbclass b/meta/classes-recipe/rust-target-config.bbclass
index 34050864023..e30eaa1da30 100644
--- a/meta/classes-recipe/rust-target-config.bbclass
+++ b/meta/classes-recipe/rust-target-config.bbclass
@@ -362,7 +362,6 @@ def rust_gen_target(d, thing, wd, arch):
     tspec['linker-is-gnu'] = True
     tspec['linker-flavor'] = "gcc"
     tspec['has-rpath'] = True
-    tspec['has-elf-tls'] = True
     tspec['position-independent-executables'] = True
     tspec['panic-strategy'] = d.getVar("RUST_PANIC_STRATEGY")
 
-- 
2.34.1


