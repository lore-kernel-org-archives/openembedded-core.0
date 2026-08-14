Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74E50C5DF69
	for <webhook@archiver.kernel.org>; Fri, 14 Aug 2026 14:08:32 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13870.1786716505262620625
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Aug 2026 07:08:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=f6AH74KT;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-4813ea321cdso1444113f8f.1
        for <openembedded-core@lists.openembedded.org>; Fri, 14 Aug 2026 07:08:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1786716503; x=1787321303; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ZJc7UWqsNRT3+duhZMAeRTtUW8S8W12M61dzcO+buno=;
        b=f6AH74KT+IimRq7QJfasdDVKnvQrEguvLLO2CWHbVsowFDiC3fOgJHVlXXptx2UOqw
         FmfYRzlO6bWGXuGxMlXHSvZDP1KMCKX+M6PRYy1zPeRnqTFHL1F4OMWR/UOlkEgq5+c+
         wTFrCIyT4nH8wRDBsSDstWHs02fY9BsQuQde0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786716503; x=1787321303;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ZJc7UWqsNRT3+duhZMAeRTtUW8S8W12M61dzcO+buno=;
        b=miC2zDB9Ar4VjUwBsytnDZ+a87HNPK/ZjfA/Ljx/MAfYR3bocePW8SBKzUJp8mRSJZ
         ZkFNjtbU3ym90dVRaQyxaFmINj/nPOnDFAtK5JDYEl9zbcJrbLBJsVEZrjntN8n4qwaO
         IHpaaHvS8cdh290g9vBTnxB7fXn3XV4oa6EbEIKX1ydoruXIqANOs9EXrYcjhhSi3qTO
         xMNxdb3EZXVjsQOkWqRBGObmPW373Vy2U/fPOCTRGJZlkIiTwQoUTzG/5X8rjBK5d6+U
         mlLtdw8ErM7f+oAHpaTS3/ZJHL/dYaWIC7ukFee+My7XA7otdDi3+WTC+Sx4i+bZKISo
         MUkQ==
X-Gm-Message-State: AOJu0Yxirzk3M7cFb/AQ2HsGvld+fUfyO6FBQJ5hTplF0sMYBXv8bDKR
	QgpqxVYDpuqPpgLBvhFEB7Go54+ojsUifyqaPSjNjVnWjxLHO1m/XQMr4bOuDxAuxR5e8VVcGGu
	XJ4ktHOI=
X-Gm-Gg: AR+sD13jkGdI5NBdC44scPYsVsUsnWSXyp2WTQp+HI7JVrn4NKpb/YNBEudqoTw8QkD
	jNfFCTi7h+Nj3xGvB7dTBaJG8MkPcqxzfVljA7zolHOITLjGMfBK5bAJcy+NTgWqiAnUOI9dXTC
	oMkuFSekO9YlvEEz22VLhmH175//eAe6lAUwl/ojQ4a7lGkbtXXk0xL9BH2ksQ5Buv26qsQKK7S
	GXwPOLo+UXmUrTNW7ULb8QxcmME38/K+BLJm1r5mazwicnaLXxxAtIw8qqewqeQm7WPz8ZppKvy
	wDKd4sJLJbLWjjdiLIqSkt1xSBMwEzLzYoKPDj++6avxtNLfbECsUDKvrAVQMvwtIqqtjrC1faZ
	dl+rXJz+2ip7qWAMkGnARQztpcysJqliQrMhJT/t24OPdPqq1kT6NsHPNIjOxt5qBCkH1CGvFLG
	7kno2IHKlqCh8zuFteWHEFo7rWMI8ms4SCmss6YJqwzsv46TmAtUYRSJFsK/td5IwMZqbQ7uE4B
	bOVFvc8qgZXQ/2wrw==
X-Received: by 2002:a05:6000:4006:b0:47f:8fda:1af0 with SMTP id ffacd0b85a97d-4815a4e7281mr19647800f8f.4.1786716503475;
        Fri, 14 Aug 2026 07:08:23 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:9095:412f:3012:ddca])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4815f21df13sm7072915f8f.15.2026.08.14.07.08.22
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 07:08:22 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/3] libgit2: upgrade 1.9.6 -> 1.9.7
Date: Fri, 14 Aug 2026 15:08:19 +0100
Message-ID: <20260814140819.2840177-3-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260814140819.2840177-1-richard.purdie@linuxfoundation.org>
References: <20260814140819.2840177-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Aug 2026 14:08:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243453

v1.9.7
------

This is an security release with one change.

* Escape remote repository paths in libssh2

  In v1.9.2, we started escaping repository paths in the OpenSSH-based
  exec ssh transport. Bring the same escaping to the libssh2 transport
  to avoid any potential command injection.

In addition, changes have been ported from the main branch to update
CI builds.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...cmake-mark-system-libraries-are-private-link-librari.patch | 4 +---
 .../libgit2/{libgit2_1.9.6.bb => libgit2_1.9.7.bb}            | 2 +-
 2 files changed, 2 insertions(+), 4 deletions(-)
 rename meta/recipes-support/libgit2/{libgit2_1.9.6.bb => libgit2_1.9.7.bb} (93%)

diff --git a/meta/recipes-support/libgit2/files/0001-cmake-mark-system-libraries-are-private-link-librari.patch b/meta/recipes-support/libgit2/files/0001-cmake-mark-system-libraries-are-private-link-librari.patch
index 267770ae6fe..93f1f3a870c 100644
--- a/meta/recipes-support/libgit2/files/0001-cmake-mark-system-libraries-are-private-link-librari.patch
+++ b/meta/recipes-support/libgit2/files/0001-cmake-mark-system-libraries-are-private-link-librari.patch
@@ -1,4 +1,4 @@
-From 5670d3eed82f0d64766158809bf3d0c7c631b0ea Mon Sep 17 00:00:00 2001
+From 41048806aec8a4b71f3ccf11fdedbec88080a675 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@arm.com>
 Date: Thu, 23 Jul 2026 17:35:23 +0100
 Subject: [PATCH] cmake: mark system libraries are private link libraries
@@ -38,5 +38,3 @@ index 8045ddef9..fafdb09ec 100644
  target_include_directories(libgit2package SYSTEM PRIVATE ${LIBGIT2_INCLUDES})
  target_include_directories(libgit2package INTERFACE $<INSTALL_INTERFACE:${CMAKE_INSTALL_INCLUDEDIR}>)
  
--- 
-2.43.0
diff --git a/meta/recipes-support/libgit2/libgit2_1.9.6.bb b/meta/recipes-support/libgit2/libgit2_1.9.7.bb
similarity index 93%
rename from meta/recipes-support/libgit2/libgit2_1.9.6.bb
rename to meta/recipes-support/libgit2/libgit2_1.9.7.bb
index b17b22c63e1..2de3503aac4 100644
--- a/meta/recipes-support/libgit2/libgit2_1.9.6.bb
+++ b/meta/recipes-support/libgit2/libgit2_1.9.7.bb
@@ -8,7 +8,7 @@ DEPENDS = "curl openssl zlib libssh2 libgcrypt libpcre2"
 SRC_URI = "git://github.com/libgit2/libgit2.git;branch=maint/v1.9;protocol=https;tag=v${PV} \
            file://0001-cmake-mark-system-libraries-are-private-link-librari.patch"
 
-SRCREV = "26055f5af74ab1cf636d272e8a34315496d3f06f"
+SRCREV = "49e408b3208bc3093757a1c2db938d3590f3f412"
 
 inherit cmake
 

