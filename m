Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C569C41535
	for <webhook@archiver.kernel.org>; Wed,  8 Nov 2023 14:16:47 +0000 (UTC)
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
 by mx.groups.io with SMTP id smtpd.web11.14752.1699453000484483651
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Nov 2023 06:16:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Y1VmUKau;
 spf=pass (domain: gmail.com, ip: 209.85.160.175, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-41ea8debcdaso28082261cf.1
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Nov 2023 06:16:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699452999; x=1700057799; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZodNsE2g7551ZXbHeAI5l/B4pKxFn/KtA5oPDoEQ9q4=;
        b=Y1VmUKauiw+FJsvJm8AxMV1ym1WrLuHiioWl5MJSCZAB2lSShMamtr19kFBhAR4rsY
         6B2+AK36go2jYYbaT/xUh1awjbPTDh8LY1rCA/BdaeJTiu7rizVc/cbE0SHHj7gkakK1
         8u8Nswx98SYRQ0dQ4cMndHa54hXmkOddpNOdsFFiatQ6d9Tge1uss0Ho4t22H6LMcz5U
         jrrM4vU0/8KJVvu3zBVTGfMSsB9kDRi/SCbB+CeXl84OV8jabq+ikvzSKoXj3m0cgkNc
         ehNiyfyGowscEwx57wrMkShUNlXKrlUr7uNIQPorIkLhKQvAyHkAaBVAj4TcdxtgU+sN
         1iwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699452999; x=1700057799;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZodNsE2g7551ZXbHeAI5l/B4pKxFn/KtA5oPDoEQ9q4=;
        b=EQDrjrw8QDyoVcwjffNakQWkHNtL1rEdTMeJCtNZT6TqrQTx8OjZ+BEYj3mjUpkSGT
         /WoHCZt85vz40RHHLPoQ6gLMg2Ki2sl1XYDQMM2zW9icab8tl4OEpowDeIFjXX/ZDMR7
         fW5lnScIb/o7g/pElkksYPjs5NsapBxe58LrtglY1F/6G9zXlrOfSjalZKsuJVM3jqTh
         5Az4z4Fbe0RucbSQ9XOcWJUmwBZWy9eJXFesASDBFUQXvBzyc4j7UI1wIzEWomy0GuU8
         2XtAER1Bty8jiJ/xxsZWCg0/4eXoLkMuMbqn1EdkqNbIKfuX+nIOQDYyVHKVLPGS2/RH
         QSsg==
X-Gm-Message-State: AOJu0Yz1LVHPKEQ7BtEXNxPxtknp4YWf4nIBRJvNgU722mXT3+lsd3kr
	8d6Hp1umu3VN/k0FeAkI+T5Pia5N1dvRWsF4
X-Google-Smtp-Source: AGHT+IFbv6i4Z8gPMal+Vd9PeZbUI2TmpBMEHO4TQlFRURKzrTRL23R8O+mZklCrWWU6E6XYuFJ1xQ==
X-Received: by 2002:a05:622a:15d2:b0:41e:1dff:bed5 with SMTP id d18-20020a05622a15d200b0041e1dffbed5mr2351711qty.37.1699452999374;
        Wed, 08 Nov 2023 06:16:39 -0800 (PST)
Received: from build.lan ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id j14-20020ac85c4e000000b004181138e0c0sm921665qtj.31.2023.11.08.06.16.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Nov 2023 06:16:38 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 05/12] kern-tools: make lower context patches reproducible
Date: Wed,  8 Nov 2023 09:16:23 -0500
Message-Id: <e80668f7f62ed3bf0a4f357c5acb775925438d31.1699452828.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1699452828.git.bruce.ashfield@gmail.com>
References: <cover.1699452828.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Nov 2023 14:16:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190344

From: Bruce Ashfield <bruce.ashfield@gmail.com>

It could be argued that it should be an error to have a
reduced context patch now that we've had many years to
ensure that our kernel path queues are clean.

But there are still some supported scenarios where a
patch is on multiple branches and reduced context makes
sense.

Applying the following patch to make sure these are
reproducible like the primary mode of application.

   kgit-s2q: use additional git-am options with reduced context as well

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/kern-tools/kern-tools-native_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
index 3fcfe4b4c3..e109cd7454 100644
--- a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
+++ b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "\
 
 DEPENDS = "git-native"
 
-SRCREV = "6645d3897cc2eeb1237ee0e2ff5342bd73ee0875"
+SRCREV = "270f9ccc5e2998cd1f3ed1e32d02e356793e4680"
 PV = "0.3+git"
 
 inherit native
-- 
2.34.1


