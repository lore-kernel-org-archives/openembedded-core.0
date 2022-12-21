Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B816C41535
	for <webhook@archiver.kernel.org>; Wed, 21 Dec 2022 21:17:26 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web11.30735.1671657441973301734
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Dec 2022 13:17:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Hg9rqQUD;
 spf=pass (domain: gmail.com, ip: 209.85.221.50, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id y16so16225573wrm.2
        for <openembedded-core@lists.openembedded.org>; Wed, 21 Dec 2022 13:17:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d4gQi8OuYoeZcVag7RZJ3HkFSj96ezDIqCzNwhzZp4I=;
        b=Hg9rqQUDS2JahgVV19hcUtT36bitHghPfuYgMMluvA285bfSVuEdERLEpRejBVcF2O
         8jnK8W8y4QW3MD173HuXM3WqcQaDUezERyqntxC7yM4QHymThGBGaj6mO9EZiQHnZ9d1
         zmDssEBuu3d6XV4J0tlQRXk+RK9pEnvn/u0FMM63eOxc8xXighi19Vz+QJfURu+eTtI7
         Wovvf7ijvAgz312xcZp5PM2puLWAeySpT2QatTfD+MnVCEImgpP9MQi/LcSJmxrLT0e7
         arQmtaxGRxfFwnS/nLkm9H5pSefzyeJkHwUhZkxlah9LkkVDtguZ8gVC1BpdlRGZPPHJ
         F89g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d4gQi8OuYoeZcVag7RZJ3HkFSj96ezDIqCzNwhzZp4I=;
        b=kaniAYZA4IFXpG+p1lK9VvDYcOrYI/UImcvxIeelleRIwsGEaTLRpm/57xX9AnaS9x
         8hV2DbEfRYIhXQu8Xm4wo4Zun2MD3ABKtbBTlgYGXzH765BuTnAkDjpykLcuWhvsk18p
         WSM78AYIXqUVSzQy6Q1B1wJHlkueyJdIdH3+agntokYGyCkI6C0FY0jkuRJvbSUrDq4Y
         FEw6KJgE1+aUQ+IzIo4tjSzP1BVwSyR678HV/vKza6ei/an/Zz4Hp0aV/n3EDJTZZgBH
         wte1LFTIXT+TFLodBhJ2JSoT7GqCm3Al1Arr/gONzda1L4HsGEkRqSx4GRRfOr7EW4Y8
         b5UA==
X-Gm-Message-State: AFqh2kqNhRR+grOYhnOr23eLivBsm7VkM2Ilv7vFIvGuee2izf3HeJ/D
	U97FhKQy2lGywZXI2VFbmT1vV2G/zXA=
X-Google-Smtp-Source: AMrXdXutChj7u+dHJ4RzJ5/pSTKYqPkdHxtzXhQvf+bw2Zs5hTtGwlPzCAr41tZUpW0ZRbMLVImmDw==
X-Received: by 2002:a05:6000:18d1:b0:242:1f46:fb8c with SMTP id w17-20020a05600018d100b002421f46fb8cmr1964950wrq.41.1671657440189;
        Wed, 21 Dec 2022 13:17:20 -0800 (PST)
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net. [91.135.6.246])
        by smtp.gmail.com with ESMTPSA id bx25-20020a5d5b19000000b00225307f43fbsm16312442wrb.44.2022.12.21.13.17.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Dec 2022 13:17:19 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [OE-Core][PATCH v3 05/10] rust-llvm: Update LLVM_VERSION to match embedded version
Date: Wed, 21 Dec 2022 21:17:01 +0000
Message-Id: <20221221211706.25347-6-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221221211706.25347-1-alex.kiernan@gmail.com>
References: <20221221211706.25347-1-alex.kiernan@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Dec 2022 21:17:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174945

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

(no changes since v1)

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


