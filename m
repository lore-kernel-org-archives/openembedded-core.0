Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C5F7ECAAD1
	for <webhook@archiver.kernel.org>; Sat, 27 Aug 2022 18:26:14 +0000 (UTC)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com
 [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.web10.51630.1661624766911088218
 for <openembedded-core@lists.openembedded.org>;
 Sat, 27 Aug 2022 11:26:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=EEa0drXG;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.178,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f178.google.com with SMTP id f4so4205718pgc.12
        for <openembedded-core@lists.openembedded.org>;
 Sat, 27 Aug 2022 11:26:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc;
        bh=3aSd0mxFn1Q8r9qiw81M5PE1DeZOQZTr2JycgwWn9kU=;
        b=EEa0drXG2tvEz+xQF7JslI+CFh0kuoQOoXL+x0Imrc81ccy8fv5YjBogLnW6a+3B6s
         AFuBJBKlYMytVBobXqd3utV7+DARdwoQEgs/qR3NFV9zxRILM3B12E7E52GGhpZowRSF
         5NynO1HgdXUGsnEeMa5dPJMArId3tHZWZAVrgl6rVd/0B3lZLw3E/XCKHGx+uYRFJ9Wb
         aO87VYVwB7OrG6qJB8wIzCmECCXxJmMaXqHK2k3ljX3JXbmHGdh9eERqRU1h2bZhZG+8
         +BY5V4gt30MiYCgZZ2/Vh+wMcQryh4L6aVPCqHvgGEuU4493xZ7CKxzwNLB7TTydJS4E
         xQ7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
        bh=3aSd0mxFn1Q8r9qiw81M5PE1DeZOQZTr2JycgwWn9kU=;
        b=MbexjgzrKYfHNsdSF7KemOHi/2DuaaVvaPeVNdyaZLWWZtG60bdSzk52p56uxFwlr4
         YTx/8yCips/gwOIciS1TnFrqh+M5jEVBePPqIK1uLfYmIi1Tcgfj1TnSi5C7k4icuyGm
         biUwx+WyOmVbxV+rIkPyehPKq+PQyHA1PUdg7iU7U3rocrR2YzGXsPu6uzBK+9A53XqS
         g3qJaOGaDhE3W0FaWGEz0zYBMrYzaRhAjcCRrBjmHlCQCV1GhdRA8mpAwAAHdgIsi/bv
         LHlye/JbG+VZ83qHfvJaA0WvVbkszUq8RDW3h0nqYsDKf/+6TIsfohKXgjuNl9BjVx17
         zqCg==
X-Gm-Message-State: ACgBeo1AFZReKOa75mJNku14oXt9NT7oOvbFbrPn3s321HYYS+xtx8Hs
	6dk0Ej9kTwEsMNQGKPQV5CA+9S4hCP/IqwUF
X-Google-Smtp-Source: 
 AA6agR47QOO+MYnRX71lMPFTMOgLVyRQpBwMNXgirBAWHTjZfx9XjGOxfPvStvmnF6ooOFv6G44v0g==
X-Received: by 2002:a05:6a00:174b:b0:52f:c4d1:d12d with SMTP id
 j11-20020a056a00174b00b0052fc4d1d12dmr9289056pfc.41.1661624765823;
        Sat, 27 Aug 2022 11:26:05 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 r21-20020a170902ea5500b001708c4ebbaesm3864716plg.309.2022.08.27.11.26.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Aug 2022 11:26:05 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 01/24] vim: Upgrade 9.0.0115 -> 9.0.0242
Date: Sat, 27 Aug 2022 08:25:25 -1000
Message-Id: 
 <e79bf7e9e2161ce36c4b6db828f90d1815161a22.1661624569.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1661624569.git.steve@sakoman.com>
References: <cover.1661624569.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 27 Aug 2022 18:26:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169942

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Includes fixes for:

CVE-2022-2816
CVE-2022-2817
CVE-2022-2819
CVE-2022-2845
CVE-2022-2849
CVE-2022-2862
CVE-2022-2874
CVE-2022-2889

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 3ec2d27d09444213ec1c9b91c6f8c4363f297294)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/vim/vim.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index 48896465ed..5b95ab2625 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -20,8 +20,8 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://no-path-adjust.patch \
            "
 
-PV .= ".0115"
-SRCREV = "6747cf1671bd41cddee77c65b3f9a70509f968db"
+PV .= ".0242"
+SRCREV = "171c683237149262665135c7d5841a89bb156f53"
 
 # Remove when 8.3 is out
 UPSTREAM_VERSION_UNKNOWN = "1"
-- 
2.25.1


