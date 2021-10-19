Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56A36C433F5
	for <webhook@archiver.kernel.org>; Tue, 19 Oct 2021 19:55:09 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web08.15310.1634673308725383996
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 12:55:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=kiuSOpFP;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.182,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f182.google.com with SMTP id w17so2618999plg.9
        for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 12:55:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=UyBsdahmrvbx3omHPvx8yOGPAjajjQCjnp+LyyN/43o=;
        b=kiuSOpFP5Y7u3AYHD2O2mN10aaxIBf931joJUlk/xucYPq7x84BAdckaD1k4yjNKDQ
         PyK/KCI4lLwsFHY7TNfTM45Xu3XbgcapdNG6ExywAnMQb2yyEww5bxDWAXr5/QzljwYZ
         wOxYEuPWmix2gqCYI/Jmf5MG3Phj3dG7W9+Xn6TAmJFw8kaA6p9Pmz/KK97CZNhXeBh8
         RdQh6jhBqB7iLZWaFlZ0/e39mZjLDiEcOHnIVCmm/hnZDP39yHAvU20vLMyg/1RlQQCa
         TXsSIe1/BFYT7G1vgzBGR09y5HBMDzLwD2Iga+eucy+EGUVOZwM8ltp0jiAeKIFWg+8x
         LBew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UyBsdahmrvbx3omHPvx8yOGPAjajjQCjnp+LyyN/43o=;
        b=hxY8xIhreYqLPg8K7k92Dua3frzBu7Q1SNLdm52Bws8OJ6z+KqyLK5UQSuXXXRusx+
         2v9V8cwAXHpcqMxle2a+Z4+MYt5NzrB3O8alzwcN3zRyZDqL+b71Fn+g1dN68eq69dbi
         sT5WcCdQdoMt5gTS53kJYKMdsNxgYryPBU/mT9CGKdzB5S2O6gdq+WLgRBtC0MV8JAIv
         jkl3WW760Zi70gFDrXVYF5Zc+LI/bQQAAl46DvLvodonWeR7BdFdMu0GbMEafaXA0h/v
         plviPoQZ1hTORR7avjGJRjTtWVoQRKduKMa3ZWG+TFGiwRGZ8PpJk1+ufVtH0ptwrI4c
         yi0w==
X-Gm-Message-State: AOAM532iytdJgSYjPBCoKGInEnw93FH/5J14Cz3dKqTN6Q8UwTppnCn0
	SUNtqhwBB+B2m/hZkwdREpvjDbKiJOxK/aQLgLg=
X-Google-Smtp-Source: 
 ABdhPJzXFV1PtmnSc4Qtl+DOdYsfp9tSToqNQSNIU0IksPIDOTxEFqaNJQilc9g7wUbAxb1on1nKlg==
X-Received: by 2002:a17:902:b691:b029:12d:2b6:d116 with SMTP id
 c17-20020a170902b691b029012d02b6d116mr34692189pls.71.1634673307744;
        Tue, 19 Oct 2021 12:55:07 -0700 (PDT)
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id q14sm67104pfk.3.2021.10.19.12.55.06
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Oct 2021 12:55:07 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 25/38] uninative: Upgrade to 3.3,
 support glibc 2.34
Date: Tue, 19 Oct 2021 09:53:36 -1000
Message-Id: 
 <03b4b26ced1d3fb3646b366b5178bb6cdcb9addd.1634665675.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1634665675.git.steve@sakoman.com>
References: <cover.1634665675.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Oct 2021 19:55:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157230

From: Michael Halstead <mhalstead@linuxfoundation.org>

Signed-off-by: Michael Halstead <mhalstead@linuxfoundation.org>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 4aa4dcd5f31657073f2207a9a4a43247322c7eb1)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/conf/distro/include/yocto-uninative.inc | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/conf/distro/include/yocto-uninative.inc b/meta/conf/distro/include/yocto-uninative.inc
index 740cca0ecf..76f4cff565 100644
--- a/meta/conf/distro/include/yocto-uninative.inc
+++ b/meta/conf/distro/include/yocto-uninative.inc
@@ -6,9 +6,9 @@
 # to the distro running on the build machine.
 #
 
-UNINATIVE_MAXGLIBCVERSION = "2.33"
+UNINATIVE_MAXGLIBCVERSION = "2.34"
 
-UNINATIVE_URL ?= "http://downloads.yoctoproject.org/releases/uninative/3.2/"
-UNINATIVE_CHECKSUM[aarch64] ?= "4f0872cdca2775b637a8a99815ca5c8dd42146abe903a24a50ee0448358c764b"
-UNINATIVE_CHECKSUM[i686] ?= "e2eeab92e67263db37d9bb6d4c58579abd1f47ff4cded3171bde572fece124b2"
-UNINATIVE_CHECKSUM[x86_64] ?= "3ee8c7d55e2d4c7ae3887cddb97219f97b94efddfeee2e24923c0cb0e8ce84c6"
+UNINATIVE_URL ?= "http://downloads.yoctoproject.org/releases/uninative/3.3/"
+UNINATIVE_CHECKSUM[aarch64] ?= "372d31264ea7ab8e08e0a9662f003b53e99b3813cc2d9f9a4cc5c2949a1de00b"
+UNINATIVE_CHECKSUM[i686] ?= "36436167eba8a5957a0bf9a32402dd1be8b69528c1ff25e711e6895b583b2b42"
+UNINATIVE_CHECKSUM[x86_64] ?= "92b5e465f74d7e195e0b60fe4146f0f1475fff87ab2649bf2d57a1526ef58aec"
-- 
2.25.1


