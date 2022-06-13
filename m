Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61133C43334
	for <webhook@archiver.kernel.org>; Mon, 13 Jun 2022 14:22:17 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com
 [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web12.6526.1655130132685966407
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Jun 2022 07:22:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=F1qhLH0v;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.43,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f43.google.com with SMTP id
 v11-20020a17090a4ecb00b001e2c5b837ccso8950607pjl.3
        for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Jun 2022 07:22:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=8BstvXOIx4k20xuzpM14WjfbGiJJcDwq5MlHEYcCKt4=;
        b=F1qhLH0vhwMOffwOgIHyd7PeCRJt//EvornM/zA5Wf7258mjtY5s+MH7bhgMKmJvIH
         xO9auqVkUk4QIHCp+dynUmviEaTtmjHqSSsDGDSxG6m9cpNQIUco3xMqCPCNRWHc2bwx
         P2Nh/5S878hEIAKNztVOxaYcUjQfveHcRGlln2bLBGbHZGxybuMmPZsT1bHWQLW0X3nE
         fwUcFqqPhn5/anoswvZxStuR/M8AY0HLbEjavuIQHlD2HS8wXGevXcp7MvwDe2ROffFJ
         KViKswvzegozoi6s4KAJKhZkMplfBVahQDrOlGFInP7AqrMO7QzsP1GIPvyQXGWnJyoW
         WLDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8BstvXOIx4k20xuzpM14WjfbGiJJcDwq5MlHEYcCKt4=;
        b=xcE9vxaa1AOrJ1Bupfgzg9n22Fysbo2uU6yVuWtAC1Oe9xrP5zMxQ9nRFSOzCJ0lR2
         4WHH/49T9WsgLlfIeDSmDxssnXEMvGgq4n9ibtryVWZL6/T+RDUAPRZ8nuF/iIfSVv00
         KUjTaxbCfI0qY4QLdPBL/yWtpA897fsrUBXhHsr1j4Ylto2iDOJkPIKzRBUIiZ2KkVZd
         zty3Jh8H4UANbfu/B/zz/552fcgZNmoyKAQNNZxZHCJh6u5p7EOSQj+yrI5lPwSc2vF6
         ZdgLp1nV/Z5QYh6uIkkLTGqrEpj3v9U8KkRO3aSU/RbBa442bDgGrf4polgPzGD7RMAi
         7PIQ==
X-Gm-Message-State: AOAM533aT0uYk1fHZzdTXj0UckNpFnACJj3X/sh0RV/cVJ39czu+xn/S
	7lWCGBQsUxgBru6BTPCy4IqgN4D+RMrew7c5
X-Google-Smtp-Source: 
 ABdhPJyqhY3xEyrVtx4f3qhho0AHh1e3slvqYMTRCadBJPaeqFlWAZhE5HqCX8Vjk5QOOtusXMAtFw==
X-Received: by 2002:a17:90a:31cf:b0:1c9:f9b8:68c7 with SMTP id
 j15-20020a17090a31cf00b001c9f9b868c7mr16203196pjf.34.1655130131588;
        Mon, 13 Jun 2022 07:22:11 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 iz19-20020a170902ef9300b001636c0b98a7sm5159401plb.226.2022.06.13.07.22.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jun 2022 07:22:10 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 03/20] glibc: Drop make-native dependency
Date: Mon, 13 Jun 2022 04:21:35 -1000
Message-Id: 
 <e36a8a22bd47884a8ecbaf2091560f08c22346f3.1655129917.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1655129917.git.steve@sakoman.com>
References: <cover.1655129917.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Jun 2022 14:22:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166848

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Now that our make version is a minmum of 4.0 we can drop this dependency.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 7a0c52fd44332abb24e0dea608229ab7c472d94e)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/glibc/glibc_2.35.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/glibc/glibc_2.35.bb b/meta/recipes-core/glibc/glibc_2.35.bb
index 6ea5b1efb5..96fe39c548 100644
--- a/meta/recipes-core/glibc/glibc_2.35.bb
+++ b/meta/recipes-core/glibc/glibc_2.35.bb
@@ -16,7 +16,7 @@ CVE_CHECK_IGNORE += "CVE-2019-1010022 CVE-2019-1010023 CVE-2019-1010024"
 # Potential patch at https://sourceware.org/bugzilla/show_bug.cgi?id=22853
 CVE_CHECK_IGNORE += "CVE-2019-1010025"
 
-DEPENDS += "gperf-native bison-native make-native"
+DEPENDS += "gperf-native bison-native"
 
 NATIVESDKFIXES ?= ""
 NATIVESDKFIXES:class-nativesdk = "\
-- 
2.25.1


