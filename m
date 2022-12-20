Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5ADEC4708E
	for <webhook@archiver.kernel.org>; Tue, 20 Dec 2022 18:07:24 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web10.57099.1671559639564572644
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Dec 2022 10:07:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=GXcJaMYR;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id m5-20020a7bca45000000b003d2fbab35c6so9460322wml.4
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Dec 2022 10:07:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZoflZfWDH81eQMvYh/JbpZ0jkloqgFnLy17tqaBqt5Y=;
        b=GXcJaMYR3NJFonEd89GpC54SY12W7D1iAV60hazu4lIUjWujuEcHlH7go0U8ZZTU4t
         waIKSy49Ei003wkZY+ub/EV7tAefjnIlZlBA0p4BaVJNgLjwuhrPju+nkzT8vmUKWrjj
         NI6ETDVOwLQlxoVbABK04FsPWSumbMi4xF9kyWTIX6visFZBp7qi9ecr0YK6b/sZ5nCn
         1U/sAIwpP2JIm7dZfOVNDZkp9bDzqKJZpxTmtChBPviVA8xzfyXSrcSsfoDvpZoxCYBQ
         /EK4DDtEnBpnoPNl7CCPZS+GFdV7X/ER6oSK2UkPTFQP1lk5F2vNy9BgeuBH70EEd8p1
         ZzAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZoflZfWDH81eQMvYh/JbpZ0jkloqgFnLy17tqaBqt5Y=;
        b=VJypOzMknKSu2wKvx9z8Tgnohwx8fWcftixX9G6QL/H1Ov2EQmueUsHku6W1AOAkm3
         fr/j5hS2beo32918tW+58wN24k76OJYbfRdR9bYwD+XNntDzwiRrBguc8ah3/pHi+nOU
         L15byqkExDhf5prTpdDmnvFGVVmH2zh0cG1ZyyVRRUHMTh6QIylCKoe7R5uqcZATaw0p
         r7Yj9OGWjLyrERTs7DRRaP6wIJ/E1yjDddNWE+sXr737MSy/6LwUHyR4k/iFdBfq/LdO
         bTv5R6BcebIqhd6KEiaGXl0oMKusMj3cnsYSlejwTVd1rRPcc2Ba3n1is00XDnPKJgUl
         DlRw==
X-Gm-Message-State: AFqh2krRLhwTJu7jn2SoA1iLCa1KnAOJO2zbmqkb+hC9LIec17k3gbQ0
	0y87JhRD8n9zZJtmbFzVQHYj4ZAAciE=
X-Google-Smtp-Source: AMrXdXuV6oGNYBPiEZdIARlaZXMAZFjYCsY0wyKGF9FBsyOU/zZeXIJ+/48pblTcui81zsPPM3lX9Q==
X-Received: by 2002:a05:600c:35d5:b0:3d3:864a:1173 with SMTP id r21-20020a05600c35d500b003d3864a1173mr3498095wmq.18.1671559637866;
        Tue, 20 Dec 2022 10:07:17 -0800 (PST)
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net. [91.135.6.246])
        by smtp.gmail.com with ESMTPSA id u9-20020a05600c00c900b003cf37c5ddc0sm16243754wmm.22.2022.12.20.10.07.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Dec 2022 10:07:17 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [OE-Core][PATCH][PATCH 05/11] rust-llvm: Update LLVM_VERSION to match embedded version
Date: Tue, 20 Dec 2022 18:06:06 +0000
Message-Id: <20221220180612.24555-6-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221220180612.24555-1-alex.kiernan@gmail.com>
References: <20221220180612.24555-1-alex.kiernan@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Dec 2022 18:07:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174865

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

 meta/recipes-devtools/rust/rust-llvm_1.66.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/rust/rust-llvm_1.66.0.bb b/meta/recipes-devtools/rust/rust-llvm_1.66.0.bb
index e1baeb78574f..4cf244bb67f5 100644
--- a/meta/recipes-devtools/rust/rust-llvm_1.66.0.bb
+++ b/meta/recipes-devtools/rust/rust-llvm_1.66.0.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "http://www.rust-lang.org"
 
 # check src/llvm-project/llvm/CMakeLists.txt for llvm version in use
 #
-LLVM_RELEASE = "14.0.5"
+LLVM_RELEASE = "15.0.2"
 
 require rust-source.inc
 
-- 
2.39.0


