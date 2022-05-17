Return-Path: <ranjitsinhrathod1991@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64128C433F5
	for <webhook@archiver.kernel.org>; Tue, 17 May 2022 11:15:22 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com
 [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.web10.5808.1652786116782852861
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 May 2022 04:15:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=agSZQ3EA;
 spf=pass (domain: gmail.com, ip: 209.85.215.179,
 mailfrom: ranjitsinhrathod1991@gmail.com)
Received: by mail-pg1-f179.google.com with SMTP id a191so16662789pge.2
        for <openembedded-core@lists.openembedded.org>;
 Tue, 17 May 2022 04:15:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id;
        bh=4P43PmB7hrDH8mVOUUXRfgz+EU2RYiPc00HVJoRiKrw=;
        b=agSZQ3EApca0AoaBSgda2oVjsttqinBWSnA+P473dzZrXUrBR87nMVNQsB+nPEYt2p
         FG+Kgx/RkTS2EfcOHCavKwMdcy1+QivVSFWquVgoPPwWC1Zjqg4AJANUVTygrE3b2e7U
         A2qeiu5PAJp6aiAXSJIrRAnBUC/kOO1yJjZGoQ4gDMi915DZXZENIo15yHL0JHEkNcKn
         B5RjWbU58w6HFcqG+IqzMrhNFgyxAEA7fPfxyGj79XhPThTgNjWb2DvLLm7+4nKO1foH
         32FqHU6yIKbCHRNmdvx40ot2BqA27Ucm8+r/5wpgKJl2115h3HW0VzI66DPMvhNeghq9
         tXcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id;
        bh=4P43PmB7hrDH8mVOUUXRfgz+EU2RYiPc00HVJoRiKrw=;
        b=IqxlfAuY+65l+2ujozORUBli43FeamHYc3Jp89kIXbNMdkOAMarwUQqIFFO2SsR6R+
         4Z0KPdanC8x/5QHvqd6CzgGE1mY/3ivFycP3f9CJkvlF+h1rbVNAkAUhMTAh21c1YH1F
         cVUlwsxiPdPIYsrdq9KmraS+oMf/YOYchc/15UdfXMplT9QUGTSjp5Gl7omx8wm899UH
         OyKpKkSUPTAAZYkgPgpI+D1eSbeX4LPwr3rN8HNMUuAn3pBMkKm14T9b9rWZnXYMwL1t
         jU/YAmmDgYOaANJa8qwsWTX1iLdq8gjC8SjCQX1iCBePbWLV03zzEsOaCTQS/xGhjFST
         8Yuw==
X-Gm-Message-State: AOAM5315Xj/6PoREuO7T0txEa6pDhOzMgNtoLLtP3l/QdNXBMK/r3hRJ
	GacdBb5FZK4jferXPpvV+x6pR4b7hZA=
X-Google-Smtp-Source: 
 ABdhPJxaPrKC6qcT9VGSamOXK0LhEbtzEx6p5nLIwkjlwngDWj1h+R8OYWwMkcCNiT78xkBBUJsTKw==
X-Received: by 2002:a63:d504:0:b0:3c6:ab6b:fd2b with SMTP id
 c4-20020a63d504000000b003c6ab6bfd2bmr19004079pgg.437.1652786115845;
        Tue, 17 May 2022 04:15:15 -0700 (PDT)
Received: from localhost.localdomain ([103.81.94.250])
        by smtp.gmail.com with ESMTPSA id
 a19-20020a63cd53000000b003c1bf4c064fsm8350113pgj.72.2022.05.17.04.15.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 May 2022 04:15:15 -0700 (PDT)
From: Ranjitsinh Rathod <ranjitsinhrathod1991@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-Core][dunfell][PATCH] git: Use CVE_CHECK_WHITELIST instead of
 CVE_CHECK_IGNORE
Date: Tue, 17 May 2022 16:45:00 +0530
Message-Id: <20220517111500.735-1-ranjitsinhrathod1991@gmail.com>
X-Mailer: git-send-email 2.17.1
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 May 2022 11:15:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165727

Use CVE_CHECK_WHITELIST as CVE_CHECK_IGNORE is not valid on dunfell
branch

Signed-off-by: Ranjitsinh Rathod <ranjitsinhrathod1991@gmail.com>
---
 meta/recipes-devtools/git/git.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/git/git.inc b/meta/recipes-devtools/git/git.inc
index 879920d97e..b5d0004712 100644
--- a/meta/recipes-devtools/git/git.inc
+++ b/meta/recipes-devtools/git/git.inc
@@ -22,7 +22,7 @@ CVE_PRODUCT = "git-scm:git"
 # This is about a manpage not mentioning --mirror may "leak" information
 # in mirrored git repos. Most OE users wouldn't build the docs and
 # we don't see this as a major issue for our general users/usecases.
-CVE_CHECK_IGNORE += "CVE-2022-24975"
+CVE_CHECK_WHITELIST += "CVE-2022-24975"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[cvsserver] = ""
-- 
2.17.1


