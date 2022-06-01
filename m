Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C274C433EF
	for <webhook@archiver.kernel.org>; Wed,  1 Jun 2022 18:22:25 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web10.1529.1654107737274541564
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jun 2022 11:22:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=OTZIsPVl;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.45,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f45.google.com with SMTP id p10so3448977wrg.12
        for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jun 2022 11:22:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+bOlpWyZCkmCX7TTf1ATnlmreVxFt5SbYq9dzK1ewiI=;
        b=OTZIsPVlxie8W9L9r8+64n3tBfnE5k1cnbETQH4cp+aD9MLEzFFzS0rDc+/fAR+KBh
         +S476RLHlMw4GVmjmkT+aDqlsEPsj2nAGgWECHsGtoBDnbvnqAYsqB3tR986q5xKyjPR
         Hx3PiLnCXwdcmTknM+u86egeltlXCjJnz+bsU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+bOlpWyZCkmCX7TTf1ATnlmreVxFt5SbYq9dzK1ewiI=;
        b=Pnk+iVVP8OT2u54m8zRTtnou8Olz1XLBqCvKWvnWCDi0h++DEcbMmGxZr0AQTpK41t
         N5wRopGPqU26JSOunumxOYvyOmXt3+H12NNYST3setBq6PspmT9PwpPMiCpQV0VySmx+
         yBD3ct1lq/RXfG1qtn+wAGl/porivYbb/tIpa/Cu2ntnZy5YOWlTjg2Zp1YtxoNrizxL
         IuzargEGmKnhtw9/JqXR7JzSTESrVjBf0lRDiArvkyDGfV3U9YHcznrPgntwqrwbqndP
         MdH0i32YTq767Ut6zIz9SwVU3YJvZJz+6Jr7YdsxpOuIhRlgc9B6uMQBq5D4X3P9Nfe8
         LqXA==
X-Gm-Message-State: AOAM532kl5lKVHgnMOaw2RObHpEiFpslPaUYtjI0Onl5ETM/GCn+5exP
	C44uVRVhn9xXNCZM1dp8L/SWeCI4AbLK45xC
X-Google-Smtp-Source: 
 ABdhPJwUcr0gDCIxqja1PZNYjdYF4cmW8QPVph4GPRg7ohDL38JBoaY3JBxwaNO/JFKzdNtFK2B1TA==
X-Received: by 2002:adf:ef01:0:b0:20a:8068:ca5e with SMTP id
 e1-20020adfef01000000b0020a8068ca5emr549386wro.661.1654107735398;
        Wed, 01 Jun 2022 11:22:15 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:eab:cafb:b8d4:fe67])
        by smtp.gmail.com with ESMTPSA id
 y5-20020adff6c5000000b0020c5253d926sm2302333wrp.114.2022.06.01.11.22.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jun 2022 11:22:14 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] populate_sdk_ext: Fix race condition on bb_unihashes.dat
Date: Wed,  1 Jun 2022 19:22:13 +0100
Message-Id: <20220601182213.103534-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Jun 2022 18:22:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166438

There is a race were the bb_unihashes.dat file may end up zero sized due to
concurrent builds. Use recently added API within bitbake to copy the file
safely. Also use the opportunity to remove hardcoded filepaths internal to
bitbake from OE-Core.

Bump the minimum bitbake version to match the API being used.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/populate_sdk_ext.bbclass | 6 ++----
 meta/conf/sanity.conf                 | 2 +-
 2 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/meta/classes/populate_sdk_ext.bbclass b/meta/classes/populate_sdk_ext.bbclass
index e2019f9bbf7..926587c3564 100644
--- a/meta/classes/populate_sdk_ext.bbclass
+++ b/meta/classes/populate_sdk_ext.bbclass
@@ -401,10 +401,8 @@ python copy_buildsystem () {
             if os.path.exists(builddir + dest_stub):
                 shutil.copyfile(builddir + dest_stub, baseoutpath + dest_stub)
 
-    if os.path.exists(builddir + '/cache/bb_unihashes.dat'):
-        bb.parse.siggen.save_unitaskhashes()
-        bb.utils.mkdirhier(os.path.join(baseoutpath, 'cache'))
-        shutil.copyfile(builddir + '/cache/bb_unihashes.dat', baseoutpath + '/cache/bb_unihashes.dat')
+    cachedir = os.path.join(baseoutpath, 'cache')
+    bb.parse.siggen.copy_unitaskhashes(cachedir)
 
     # If PR Service is in use, we need to export this as well
     bb.note('Do we have a pr database?')
diff --git a/meta/conf/sanity.conf b/meta/conf/sanity.conf
index e6cb2b45fe2..fff1ad8246b 100644
--- a/meta/conf/sanity.conf
+++ b/meta/conf/sanity.conf
@@ -3,7 +3,7 @@
 # See sanity.bbclass
 #
 # Expert users can confirm their sanity with "touch conf/sanity.conf"
-BB_MIN_VERSION = "1.53.1"
+BB_MIN_VERSION = "2.0.1"
 
 SANITY_ABIFILE = "${TMPDIR}/abi_version"
 
-- 
2.34.1


