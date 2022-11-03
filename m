Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7990AC433FE
	for <webhook@archiver.kernel.org>; Thu,  3 Nov 2022 10:34:41 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web09.17851.1667471668799729650
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Nov 2022 03:34:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=FtxGSahX;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id c3-20020a1c3503000000b003bd21e3dd7aso3049813wma.1
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Nov 2022 03:34:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Cf1p01Wwi4waoB2PNAixotbEfg47i82iDLHfzoFUW2Q=;
        b=FtxGSahXj11fCrsekmS2irgmQelutieScbQXiFk3Bu+FGddK+P1v1xSy1mPZgSKuzW
         vwjzFWiERbT7B/JNI0HBCg580CgiiSSM7ds1uXBUolqWgzg4HQHdcKhdBHnwRjPD+QNQ
         NrcvpBnq1bO8YssJOgt6p5QdG1O2NzjYL/s+Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Cf1p01Wwi4waoB2PNAixotbEfg47i82iDLHfzoFUW2Q=;
        b=BySW4244QogxwQ6t7wHVr7D+Z49lLXbhAggthS8qghFmSMYPSugOUvJI7aqHwPHa04
         lBzE9mbiHpgCnvSET5nBQdMWDY7y8oijWf6QTQ/MZ9rhDwZ6+zK/iwiqxEhXnlyJYSQ3
         yYd1cPo2Z5+l/NCzFEB44kAaxC+CvEQB82mnzEa0/PkETGHGI1OYh0datxLsZNfKIZ+6
         6+ygVt8TzRY9RvPhMDSBZZqoP1iAcTOfWu+GWv7quc12g+HDOrYoNlrG+otbdWsJsXbg
         YiKMLESp9j7gGmS4R0PlhiK00U1CnhsApC0IDGS7zJ9NwOWcdRxiC3X7FPNDC3NLtu5h
         rslQ==
X-Gm-Message-State: ACrzQf19W4DxGKHGW1Hqtg8bEj3S7xIpUIZck5J/FNhYGdftVtyY7J/M
	CP1AberVW1hy1Zy/Po+KBvMvdkXYi+5LAA==
X-Google-Smtp-Source: AMsMyM6PqvTNK68Rp9Z+mnW1NiGPmhAXEzmwy4iMrY3THLG7W6GKuL40G2X32blSd6lqNH0bJ7CbGQ==
X-Received: by 2002:a05:600c:46ce:b0:3c6:f274:33b2 with SMTP id q14-20020a05600c46ce00b003c6f27433b2mr18875217wmo.27.1667471666717;
        Thu, 03 Nov 2022 03:34:26 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:fec4:d12e:21c:2d17])
        by smtp.gmail.com with ESMTPSA id g17-20020a5d4891000000b0023655e51c33sm534662wrq.4.2022.11.03.03.34.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Nov 2022 03:34:26 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] gcc-source: Fix gengtypes race
Date: Thu,  3 Nov 2022 10:34:25 +0000
Message-Id: <20221103103425.823566-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Nov 2022 10:34:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172621

gcc renamed .c files to .cc files:

https://gcc.gnu.org/git/?p=gcc.git;a=commitdiff;h=5c69acb32329d49e58c26fa41ae74229a52b9106

but we didn't fix this reference which meant we re-introduced a race around
gengtypes-lex.c. This lead to the race reappearing on the autobuilder. Fix
the naming to avoid the problem again.

[YOCTO #14953]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/gcc/gcc-source.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/gcc/gcc-source.inc b/meta/recipes-devtools/gcc/gcc-source.inc
index 224b7778efd..03837f43811 100644
--- a/meta/recipes-devtools/gcc/gcc-source.inc
+++ b/meta/recipes-devtools/gcc/gcc-source.inc
@@ -26,7 +26,7 @@ python do_preconfigure () {
     cmd = d.expand('cd ${S} && PATH=${PATH} gnu-configize')
     subprocess.check_output(cmd, stderr=subprocess.STDOUT, shell=True)
     # See 0044-gengtypes.patch, we need to regenerate this file
-    bb.utils.remove(d.expand("${S}/gcc/gengtype-lex.c"))
+    bb.utils.remove(d.expand("${S}/gcc/gengtype-lex.cc"))
     cmd = d.expand("sed -i 's/BUILD_INFO=info/BUILD_INFO=/' ${S}/gcc/configure")
     subprocess.check_output(cmd, stderr=subprocess.STDOUT, shell=True)
 
-- 
2.34.1


