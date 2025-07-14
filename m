Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35D98C83F1B
	for <webhook@archiver.kernel.org>; Mon, 14 Jul 2025 12:28:22 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web11.76793.1752496096679833669
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Jul 2025 05:28:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=GgxaHyUU;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3b49ffbb31bso2406330f8f.3
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Jul 2025 05:28:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1752496095; x=1753100895; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=+ZB8HD1VSTMxWeG4nGhztJTTqPd79DoN5RgDxAX8HOk=;
        b=GgxaHyUUvXznW5y7Ajl6L4rCv7LoSAvQ2Nrph4pwcwo4lqgCSyYugTFH2YrmAhwvL5
         6OOEReVIVfWigI1yu3Z9I0u6f/8rIsBcBypPwv3IHDT6G8tITqQX6c8R+ntX6dhTEIQ8
         0J8PYN64UTNyw841U9ELvf/OV4JhooEh0hamo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752496095; x=1753100895;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+ZB8HD1VSTMxWeG4nGhztJTTqPd79DoN5RgDxAX8HOk=;
        b=YUMMZGNxbMcOW+R/HElFYG9r8SWSCXmd3wEZIC7FLdi6ohZSEEAFPef56yaBtK6NLm
         bxrEdlWViqAcIzbuEowYS68mlR2rwDupWY4QNg2zXQXWc32mQKXn9rnlT5jrRIBubK0A
         xy3Jjcluk8PhHcfUWRU2YYForZ82mRmrA3vEXlGohRALoUw2MIkas2nnJP5OiYxrNOqO
         ghy2+Hgr9HQShSqQ/RouYoJ9zRcsnsKODDojFmMUXsKfPjCD2+X+al4KDo4KRCiOHkhJ
         J9msbcwTgceWp1zcyV1IKRzIHHsJSk/W95KNKVZuZ/YWdltAo6b2diQsIrpV0bIIVd6O
         8ZOA==
X-Gm-Message-State: AOJu0YzQ4BFkw6OESuwuCn8YRmaLPY4645pTXNgWtF2dcwvItBjytt9P
	Q8EU27tU+ipS/cfRK9PIdbaXQahulRYlRQWIwMjhYTCy/+1WW53eWXFR6AnUv9lQGhj5tb3Qich
	LFAN4
X-Gm-Gg: ASbGncuGLZbSZRTsXMww63hhsf+a5/U47IWtiLAvPk+q1nzYdEibVrSfBf815ij7hrs
	UxjwfJpuRcwx+DwuERobtGzRkk3xTRCaZJEEkGbT9iRbSS95vUZvGvCKikl7aBSbFd33nINJE9Q
	HnlMebNhlSIEFcjHRwxxYJPdolpHCGXZrH6vGrrBD+G7YqWfhIgytfw5fBdwxaYZUYz4zaJ2vvH
	FEmT7PuB4vpYnzOy567HEpTMT4qo5CkuB1fQq5yQu1h3KHOSglyCSbjttqyDmYXU2luLHX/1GS8
	iLwCM3qYIooOc8lmg/CmlY+XVu6OFzTsuMTo4r66Djvu6/G+I8y75QACiPWVsQO6Pfw2OlB0mxh
	qtwRWDR4SR5TWEflHmeslD83ge5K45buMDTlJVDPGTxU6FSdAK5o=
X-Google-Smtp-Source: AGHT+IEBNjPgcXJ4GbhOWVLpDDNOoa8xPlmpTXPE6V/LDRC3ctyKE/0UPKXAvjjfOU1s29qDv+Jl3g==
X-Received: by 2002:adf:e9cf:0:b0:3a4:fc52:f5d4 with SMTP id ffacd0b85a97d-3b5f18d3bbbmr8859430f8f.47.1752496094521;
        Mon, 14 Jul 2025 05:28:14 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:7cb4:487f:cc4e:53c1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b5e8bd15bfsm12547618f8f.19.2025.07.14.05.28.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jul 2025 05:28:13 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] gcc: Tweak libtool patch documentation
Date: Mon, 14 Jul 2025 13:28:13 +0100
Message-ID: <20250714122813.1114867-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Jul 2025 12:28:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220230

Update the libtool patch description with a note about the patch not
being essential now due to .la file handling changes.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/gcc/gcc/0008-libtool.patch | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/gcc/gcc/0008-libtool.patch b/meta/recipes-devtools/gcc/gcc/0008-libtool.patch
index f24bb2acf03..00645f0c6a0 100644
--- a/meta/recipes-devtools/gcc/gcc/0008-libtool.patch
+++ b/meta/recipes-devtools/gcc/gcc/0008-libtool.patch
@@ -13,7 +13,11 @@ for now this resolves the nastiest problems this causes.
 func_normal_abspath would resolve an empty path to `pwd` so we need
 to filter the zero case.
 
-RP 2012/8/24
+We now delete the .la files, so the scope of this issue is limited however
+if anyting else in gcc-runtime linked to libstdc++ (which can potentially
+see the .la files), it would potentially see the issue.
+
+RP 2012/8/24 and 2025/7/14
 
 Upstream-Status: Submitted [https://lists.gnu.org/archive/html/libtool-patches/2023-04/msg00000.html]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>

