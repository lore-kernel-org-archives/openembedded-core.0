Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86ACAEE49A6
	for <webhook@archiver.kernel.org>; Fri, 25 Aug 2023 02:48:12 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web10.5611.1692931686199612861
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Aug 2023 19:48:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=YG92O5Ip;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.172, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-68bec3a81c4so362897b3a.1
        for <openembedded-core@lists.openembedded.org>; Thu, 24 Aug 2023 19:48:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1692931685; x=1693536485;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=23NeLciyWMSs0mANQXVWfRZf8zN8Jmtxql9mGq5ClTQ=;
        b=YG92O5Ip6Fmvwdrng4FYBo/nWgv+SX2nNbo/mcPQjwbF/q0EyaaeXBO3tpwt+F/Uet
         AbhyYueQv+PNi8ZW6EKXjvCkpvaNUJwcFxuHNzBd7aNQbTj8ivhcDlznEGpL3P8jRo3s
         W7jNtZPRLpacVhKATfgxilx0mFXwFvn93v7FcFOoQD6CTMpGzI6L9CUsYR+spUqUuCm0
         4qrQGY6ptQ3hSjCLyR9FXsUTtbQZAuSScBUivtFu8xppCaPrjNVxuXQG6I8smRNylYBS
         8tu7BaR9WNgThmigy165b3pE/Ltx4dT3rwS9ykH+ZmTTZqAKe+aS+rHbsjY5A0KrtEZs
         BTlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692931685; x=1693536485;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=23NeLciyWMSs0mANQXVWfRZf8zN8Jmtxql9mGq5ClTQ=;
        b=PwdCj/h5S4P4j6S4ZGLSGEXFCLL7XEO1Dygt24TaKKpHfiNIXvnnicNcRDNTHG9t4w
         0rQ0BXeF9WkvAB6+tqHw4uotJQlE9NJxIURKnC4vYPAxE37q+BLwtFj13zlXOylZ6Yg5
         Rk+2dpyNNyAePke5KZHoxbd0JA7GcCM+dHL+sZvolN9K/rzeRai9AOBjrHGSa3STAhAW
         r+pNKZxKCvqOG8CLiPKeH/zr2v0m01di4AY207+zuiTBiSN9aLr7rPPoV69QAVV4ID/m
         Fs7gbNCm8+bKmsnKGeWamZ6Ofn/UJpa60JP+EpmEyzug1Hug8dlcu703SFFwEG7E9++i
         Ssdw==
X-Gm-Message-State: AOJu0YyLyE2p24WBtU5VtSK27ZVy9jXqgRATOmOFq94icgKQIt57Ao5W
	rqnZSvIbuFQWylDoVh2F6rW7NuIG8oSZHb/9wmI=
X-Google-Smtp-Source: AGHT+IG6kZNRg3JZKcVNPxplR1zzMrTWtArtCJDtbBnZKyPx27PvJRwYoZ+x+KdcD3QBcZZlzF9JQw==
X-Received: by 2002:a05:6a00:14cf:b0:68a:5e3c:79e0 with SMTP id w15-20020a056a0014cf00b0068a5e3c79e0mr22031083pfu.4.1692931685274;
        Thu, 24 Aug 2023 19:48:05 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id d3-20020aa78143000000b0068883728c16sm446803pfn.144.2023.08.24.19.48.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Aug 2023 19:48:04 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 11/14] yocto-uninative: Update to 4.2 for glibc 2.38
Date: Thu, 24 Aug 2023 16:47:35 -1000
Message-Id: <2ceb7fb60c04fe024c2e1c098b6937b28f392160.1692931546.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1692931546.git.steve@sakoman.com>
References: <cover.1692931546.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Aug 2023 02:48:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186684

From: Michael Halstead <mhalstead@linuxfoundation.org>

Uninative 4.2 adds glibc 2.38.

Signed-off-by: Michael Halstead <mhalstead@linuxfoundation.org>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit c6654fab00a1b4e4bb05eec8b77c8c60e1f8a709)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/conf/distro/include/yocto-uninative.inc | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/conf/distro/include/yocto-uninative.inc b/meta/conf/distro/include/yocto-uninative.inc
index b3bd7794fb..6596c0f4a2 100644
--- a/meta/conf/distro/include/yocto-uninative.inc
+++ b/meta/conf/distro/include/yocto-uninative.inc
@@ -6,10 +6,10 @@
 # to the distro running on the build machine.
 #
 
-UNINATIVE_MAXGLIBCVERSION = "2.37"
-UNINATIVE_VERSION = "4.1"
+UNINATIVE_MAXGLIBCVERSION = "2.38"
+UNINATIVE_VERSION = "4.2"
 
 UNINATIVE_URL ?= "http://downloads.yoctoproject.org/releases/uninative/${UNINATIVE_VERSION}/"
-UNINATIVE_CHECKSUM[aarch64] ?= "b6ff9171aa7d3828bc81197822e804725908856bbd488bf412121cc0deddcb60"
-UNINATIVE_CHECKSUM[i686] ?= "6354fd2e09af1f111bad5e34ce7af4f9ad7cd266188af7eeceaeb982afd5354b"
-UNINATIVE_CHECKSUM[x86_64] ?= "f83eca543170adfd2432b135ca655922a4303622d73cc4b13e92b973cdf49e3a"
+UNINATIVE_CHECKSUM[aarch64] ?= "cff40e7bdde50aeda06707af8c001796a71b4cf33c5ae1616e5c47943ff6b94e"
+UNINATIVE_CHECKSUM[i686] ?= "a70516447e9a9f1465ffaf1c7f89e79d1692d2356d86fd2a5a63acd908db1ff2"
+UNINATIVE_CHECKSUM[x86_64] ?= "6a86d71eeafba4fefec600c9bf8cf4a01324d1eb52788b6e398d3f23c10d19fb"
-- 
2.34.1


