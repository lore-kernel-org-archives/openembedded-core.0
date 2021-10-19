Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 569B4C433EF
	for <webhook@archiver.kernel.org>; Tue, 19 Oct 2021 19:55:06 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com
 [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web11.15103.1634673306099424601
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 12:55:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=6cbsAbdG;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.54,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f54.google.com with SMTP id
 ez7-20020a17090ae14700b001a132a1679bso763531pjb.0
        for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 12:55:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=lKvgBiIjzBzYVsYSVIlNqSdpJ7H2WRx8lXfo6Ui7Ozk=;
        b=6cbsAbdG6PzPEw789334L9zSLR8HvRf5EyAi0X5iXVE+CmlrrULqDv/ueni+D+g/8o
         l65u4Cf5hrzKDoT99uJG+lSAS810iCvhKokDEWpyWR8eLDZrFVB16CedDJXEv+jNNX1w
         rCMpbRZFOQTDMFuLqHFNf8tOeAn1WKJlDLLhNe2JLEKCwIpAqA9/07dRwNqa+77L8bxA
         u8vDBHi9ZH+2TiQt7XEkZ06PXDHu+h82qS1AFHN/Xsv3BwBIpgcB47ikydMnebc+QqS5
         TcC/eJAAxtP6HIrgUh92LYRyjNn79NHkx5qWC3hbmALfAxy/FAVchr/QAbZlXhQKYv/v
         Xssw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lKvgBiIjzBzYVsYSVIlNqSdpJ7H2WRx8lXfo6Ui7Ozk=;
        b=ni++2WzWhLrkdA26abxKmkjjSqLW0CEPg8S6UrEwvU1UlC7J8IEpAjDs0BNvmsL1Ap
         PXX/ko1Bc1kjDiC17dVYQU98UYtTuz+Pc4MWzJQtIiuLsi4clNr2b7aQ9hTAesRPWQyp
         PTocAy2eEOi2PCW3RWkrswyW5Oe/gsyvn0xnsAxm+C9BbMuVOSFX+DeVYECsKxlfgDT2
         C8CkSoBs7K3bXuUeRdwpqwoJcLA0+gwnSmE7H7Wm8lob+EME1MateS7nYnK9uowJDb7Z
         UsjmwoJ/A1gbQn5RAtdDfTmDmGecQoTAxl1R78vPJDyyzNk8lXiQlWQISJW0U/U+ZOYE
         nLWw==
X-Gm-Message-State: AOAM532MZt0tFHQl4SDhMS007TKYUU+IBQZxnAY3SomHSlz8UVuGcfPe
	4amdroUGU6gSYhf1tY1Mtd0lcC6ulel3flpMB58=
X-Google-Smtp-Source: 
 ABdhPJyVgDWrFvJJ8DSt14AH/IhEwbL2OLZ+EkVKJbQ5eRQ3TIE1LIbepHBn/LWn4taA/zsGSxx3xQ==
X-Received: by 2002:a17:902:8b83:b029:12c:cbce:a52f with SMTP id
 ay3-20020a1709028b83b029012ccbcea52fmr34731061plb.9.1634673305171;
        Tue, 19 Oct 2021 12:55:05 -0700 (PDT)
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id q14sm67104pfk.3.2021.10.19.12.55.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Oct 2021 12:55:04 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 24/38] uninative: Improve glob to handle glibc 2.34
Date: Tue, 19 Oct 2021 09:53:35 -1000
Message-Id: 
 <effa24ebf216687c97b9edc5d2ac4a74ff430f4c.1634665675.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1634665675.git.steve@sakoman.com>
References: <cover.1634665675.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Oct 2021 19:55:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157229

From: Ross Burton <ross.burton@arm.com>

With glibc 2.34, the libraries were renamed. Tweak the glob to support both
as this is needed for newer uninative versions.

[RP: tweak commit message]
Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 98248306e4b5f023e96375293b60524574ebb686)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/uninative.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/uninative.bbclass b/meta/classes/uninative.bbclass
index 1e19917a97..3c7ccd66f4 100644
--- a/meta/classes/uninative.bbclass
+++ b/meta/classes/uninative.bbclass
@@ -100,7 +100,7 @@ ${UNINATIVE_STAGING_DIR}-uninative/relocate_sdk.py \
   ${UNINATIVE_LOADER} \
   ${UNINATIVE_LOADER} \
   ${UNINATIVE_STAGING_DIR}-uninative/${BUILD_ARCH}-linux/${bindir_native}/patchelf-uninative \
-  ${UNINATIVE_STAGING_DIR}-uninative/${BUILD_ARCH}-linux${base_libdir_native}/libc*.so" % chksum)
+  ${UNINATIVE_STAGING_DIR}-uninative/${BUILD_ARCH}-linux${base_libdir_native}/libc*.so*" % chksum)
         subprocess.check_output(cmd, shell=True)
 
         with open(loaderchksum, "w") as f:
-- 
2.25.1


