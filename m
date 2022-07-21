Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7BFBC433EF
	for <webhook@archiver.kernel.org>; Thu, 21 Jul 2022 21:38:41 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com
 [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web10.1056.1658439516069643221
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Jul 2022 14:38:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=bVO8dS/y;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.43,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f43.google.com with SMTP id
 b7-20020a17090a12c700b001f20eb82a08so6499052pjg.3
        for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Jul 2022 14:38:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=xBGXjssI8CCcV4vZoc8I+6ru3iiR6THkySdIA2i747k=;
        b=bVO8dS/yjl8jtYfbvWpeSCRAFTSnsNmRVQa/Mls2WHAj41YPxA8EnM8Mhvrlcg474c
         sWe9bLQqVVlTZf49LIZRl85aWfOgtTe2WtN/xlgs8mz/JCLliHzLbaC5JFjh3buCHoj+
         cMsDBSpXVKYGdLjgyImdyjZIHSJI/xBg6rD+OLLXuPkCyAn9h9hZ1SLaRD8UBJg8l30d
         nOsEPphgTbNEgBVosrgpZDR9ekrA5dsv+s1FPNQ7eeW5QZunRYaaLVoPdIGCRSrMYFBG
         h7YkXj6QXFC1wTZTbzOuwy/yc4gd+Gh15MRqJnd5rPWt1Ck6aqN6OTsgdMe7SxYu0rmh
         hzpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xBGXjssI8CCcV4vZoc8I+6ru3iiR6THkySdIA2i747k=;
        b=4dB3WQ3qkOqOoug0gi7eriJRTX09aQSJTcf+uXrMHTEpN0nz7PWb6spvYQKJMlRFYE
         l7LNrNm/xktpGYTX4hHUb7nm5hJV+RSoJmn+eB+lf1KVT4xwdFkY6NCy7A44i17b9TUs
         KZkWz6AGDJAYZwFXDUFvxsFKrtTRRYJaQT7mzQWBuwbhaLIoYZkdOdxrcUXJeS+YXHna
         PAjYYBxb4PI7PHqWIP8IcTLtjpCb4DBlBMZ3jqhUvwyfq9He2eslXeanIa/UQR8bOITc
         9r9FInQDClBMt600S9FsDvhkvrjN99h/zVbb/pRrQNCqMvT8++zoP494LM1TXe5Yp+Nj
         JxWQ==
X-Gm-Message-State: AJIora9Bd8rWueFsVKgWeM5hcHkdMdVFZlFecQGMhqNfAOlRQdlb3Y2b
	yE6Sttdwn+FKcL3QuLMlN+yq9aGyhWyQP9Bu
X-Google-Smtp-Source: 
 AGRyM1syWUaXGFzf9GpUmkvX0Urg+ylBlL6NIiD4rNPxaaEqQezpXGBUnSa6d6Fa6S/Q31bK9i2BSg==
X-Received: by 2002:a17:90b:4c0c:b0:1ef:e4f6:409f with SMTP id
 na12-20020a17090b4c0c00b001efe4f6409fmr13295856pjb.227.1658439514565;
        Thu, 21 Jul 2022 14:38:34 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 x184-20020a6263c1000000b005283f9e9b19sm2194275pfb.180.2022.07.21.14.38.33
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Jul 2022 14:38:33 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 1/4] cve-extra-exclusions.inc: Use
 CVE_CHECK_WHITELIST
Date: Thu, 21 Jul 2022 11:38:16 -1000
Message-Id: 
 <5cb48712e09ffb4198b36897495215e578f9fe62.1658429064.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1658429064.git.steve@sakoman.com>
References: <cover.1658429064.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Jul 2022 21:38:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168393

From: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>

Use CVE_CHECK_WHITELIST as CVE_CHECK_IGNORE is not valid on dunfell
branch

Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
Signed-off-by: Ranjitsinh Rathod <ranjitsinhrathod1991@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/conf/distro/include/cve-extra-exclusions.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/conf/distro/include/cve-extra-exclusions.inc b/meta/conf/distro/include/cve-extra-exclusions.inc
index 70442df991..f3490db9dd 100644
--- a/meta/conf/distro/include/cve-extra-exclusions.inc
+++ b/meta/conf/distro/include/cve-extra-exclusions.inc
@@ -57,19 +57,19 @@ CVE-2016-0689 CVE-2016-0692 CVE-2016-0694 CVE-2016-3418 CVE-2020-2981"
 # There was a proposed patch https://lists.gnu.org/archive/html/qemu-devel/2021-02/msg06098.html
 # qemu maintainers say the patch is incorrect and should not be applied
 # Ignore from OE's perspectivee as the issue is of low impact, at worst sitting in an infinite loop rather than exploitable
-CVE_CHECK_IGNORE += "CVE-2021-20255"
+CVE_CHECK_WHITELIST += "CVE-2021-20255"
 
 # qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-12067
 # There was a proposed patch but rejected by upstream qemu. It is unclear if the issue can
 # still be reproduced or where exactly any bug is.
 # Ignore from OE's perspective as we'll pick up any fix when upstream accepts one.
-CVE_CHECK_IGNORE += "CVE-2019-12067"
+CVE_CHECK_WHITELIST += "CVE-2019-12067"
 
 # nasm:nasm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-18974
 # It is a fuzzing related buffer overflow. It is of low impact since most devices
 # wouldn't expose an assembler. The upstream is inactive and there is little to be
 # done about the bug, ignore from an OE perspective.
-CVE_CHECK_IGNORE += "CVE-2020-18974"
+CVE_CHECK_WHITELIST += "CVE-2020-18974"
 
 
 
-- 
2.25.1


