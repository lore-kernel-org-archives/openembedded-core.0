Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DECBCD98DC
	for <webhook@archiver.kernel.org>; Sun, 14 Jun 2026 08:03:40 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.105036.1781424214646343641
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Jun 2026 01:03:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=hpp0Bgy3;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-490b3e03939so17531635e9.1
        for <openembedded-core@lists.openembedded.org>; Sun, 14 Jun 2026 01:03:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1781424213; x=1782029013; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8PgaQTCYfqwmhcm9msDXKxO/zrVuRfO5dv4VgUwLV/c=;
        b=hpp0Bgy3CLeoLai89qVQvRZZYsb+tXO66hec5TLNjL3L/7BYrlzctAS3KD2ArhrGF3
         XFmQySl2kkEzHdIJo92EB7/irrcXCcUCvtIvpmvFeFwHhBVvmDtdEQTMptsz+F8F7hly
         Tl48Jzl66JiduO8ikQM1dTV+k6YK2uGynKxSU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781424213; x=1782029013;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8PgaQTCYfqwmhcm9msDXKxO/zrVuRfO5dv4VgUwLV/c=;
        b=dCJVxGvMGjJpmFk9T7HYgBotEK/OxhXpyMFgcp8m2j5aAhfh62+HP5m2fb71nD7tWy
         Sn9ysOg2I5zFq1QN4pbC3eofdd7o0uni+WfLgiwv0dRc6KsA96yWNPSEIist5n1XCrDM
         zCM3CQGAWgibCLQNoSV5+7EGYKkenaf6d9ZHkwgW4lE/nejnADtvqiuaXpjPdzhZx5Rj
         y3/IRE42GJQbD65hyo+FNjF5ZEXFLQdp6KRD7ZLY+W8n/BitutWmo9RBaWU7TW4JSwjV
         2EtEkVupb9BqoMf+6R3e9z1R29nTPz2X4asMzBF760ukBgToIeHZ+Eig8f4Ph54O55lC
         GzNw==
X-Gm-Message-State: AOJu0YypYUxKXgxU9sDQ2PiCYpNIJXJ/OYJngBI/YKyaTnXkjGhNJYx9
	9vWfmgJd3EbpQ86SfYtOWEENHtjEQG0+FEcBpWym9FN98RriqSkFtOHMVXOL5BNWdX1R3Va5BED
	Dhtcj
X-Gm-Gg: Acq92OExT0OdsyqofeJxth++l7CrOl8gIZXGnlWaUpk3MBUejSvAgEKGjKPFLgmu9YG
	ymarsj+7ulhuOlxdPRmUi1Rl4o4pNqy4YKXeoqeAw6B1YJsEALai2boj2lQGCQf37ZrbuOX2y3j
	kNMjtReBtiOYq75EGVHKHPWXYN+Uyf4Qi/EtPtcpgsHVtEkgm8IapNOrWdSedSUGGgHVymUHFzh
	J4q7r+bzRJwVNOtilJz4l2Usq4B4SyxGXcIbDdBAIK0zHt1rlNo3O3WnaOYvV6Q32fb0ZcQmEAz
	is4nmyRqMvrGEEPl+LccLZF5sX0RUqXxuPxNmQIF+G9/TdVSD7ECMUSMMUj8YhaqfFW6S89rJTh
	MVHC7LOCWmgP3DlbVfe9gaKeZg91qGo+PriDUEfgbPszLpsdpFrxJdoAwUmcRGFlPk0mmwdUWlD
	Pekm5f6QTtxiIBa5hYxSciUqxVFEsTaK4WXiYO9kH+0pK/IpguDsEd
X-Received: by 2002:a05:600c:4512:b0:490:b26c:64ad with SMTP id 5b1f17b1804b1-490ec491e93mr103573075e9.5.1781424212850;
        Sun, 14 Jun 2026 01:03:32 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:b23b:4f5a:d2e8:6789])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-492202edf89sm149999065e9.1.2026.06.14.01.03.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 01:03:31 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 15/56] gn: upgrade to latest revision
Date: Sun, 14 Jun 2026 09:02:26 +0100
Message-ID: <20260614080307.4017177-15-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260614080307.4017177-1-richard.purdie@linuxfoundation.org>
References: <20260614080307.4017177-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 14 Jun 2026 08:03:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238699

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../0001-gn-fix-build-with-gcc-16-on-musl.patch      | 12 ++++--------
 meta/recipes-devtools/gn/gn_git.bb                   |  2 +-
 2 files changed, 5 insertions(+), 9 deletions(-)

diff --git a/meta/recipes-devtools/gn/files/0001-gn-fix-build-with-gcc-16-on-musl.patch b/meta/recipes-devtools/gn/files/0001-gn-fix-build-with-gcc-16-on-musl.patch
index e933c17d8a0..f894e2cc3fd 100644
--- a/meta/recipes-devtools/gn/files/0001-gn-fix-build-with-gcc-16-on-musl.patch
+++ b/meta/recipes-devtools/gn/files/0001-gn-fix-build-with-gcc-16-on-musl.patch
@@ -1,4 +1,4 @@
-From 6d22f5c9e96811f1abcedd8fb1849fe72747b5c4 Mon Sep 17 00:00:00 2001
+From f497b019507aef8f6e54dd577ba67801ca146560 Mon Sep 17 00:00:00 2001
 From: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
 Date: Mon, 11 May 2026 02:43:10 -0700
 Subject: [PATCH] gn: fix build with GCC 16 on musl
@@ -11,23 +11,19 @@ Fixes:
 Upstream-Status: Submitted [https://gn-review.googlesource.com/c/gn/+/22740]
 
 Signed-off-by: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
-
 ---
  src/gn/pool.h | 1 +
  1 file changed, 1 insertion(+)
 
 diff --git a/src/gn/pool.h b/src/gn/pool.h
-index e03113608..247cb6425 100644
+index 7beb5da0..c3d5883e 100644
 --- a/src/gn/pool.h
 +++ b/src/gn/pool.h
-@@ -6,6 +6,7 @@
- #define TOOLS_GN_POOL_H_
+@@ -7,6 +7,7 @@
  
+ #include <cstdint>
  #include <string>
 +#include <cstdint>
  
  #include "gn/item.h"
  
--- 
-2.49.0
-
diff --git a/meta/recipes-devtools/gn/gn_git.bb b/meta/recipes-devtools/gn/gn_git.bb
index 6047ab5e2b7..a5b8a7c9db2 100644
--- a/meta/recipes-devtools/gn/gn_git.bb
+++ b/meta/recipes-devtools/gn/gn_git.bb
@@ -9,7 +9,7 @@ UPSTREAM_CHECK_COMMITS = "1"
 SRC_URI = "git://gn.googlesource.com/gn;protocol=https;branch=main \
            file://0001-gn-fix-build-with-gcc-16-on-musl.patch \
 "
-SRCREV = "eab8a9f92dca9b8548a89d9e5eb6aeb8ac6bba77"
+SRCREV = "bac66cfc3254aabcd8640c8ebbeb6d62a198d454"
 PV = "0+git"
 
 BB_GIT_SHALLOW = ""

