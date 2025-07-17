Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4631CC83F1B
	for <webhook@archiver.kernel.org>; Thu, 17 Jul 2025 02:59:21 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.web11.40515.1752721159085142049
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Jul 2025 19:59:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=vXqeAidu;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.175, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-b390136ed88so283677a12.2
        for <openembedded-core@lists.openembedded.org>; Wed, 16 Jul 2025 19:59:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1752721158; x=1753325958; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q54uFqFFzzoRCvgFN5VDG2OSO6tg2US+OMwH3LMyiIw=;
        b=vXqeAiduKwB7N+70uv/8IXzMnUlhkGICcJ0EzaR3acYofuwZU/l2145KOHaiJgWwjO
         U943yw2zuO9VBRcQRoY2+ScAKpV24d3Tw7wMS3SOn8pbvmTv76VEodYqx9/rSZ89h7Ih
         P/kDovwQEnNZkHeH0dz0ft918WhCjgLg/FFKAeyuwvpQCcfaM2JMRZF8jn6iIh4+uU2Z
         IqDDWxvFhAgUu2hwll88CXyGuJB8ipAe+FYB2GRu6v8v8P2ihWc1DiuXL9rR5LwYlDXi
         AXgwFmS95fuFu4B/9xCjBpdNmhL1ApnEB/agOYqjXtAR5mtVf+8DNjisSGGOigiy65PD
         r4kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752721158; x=1753325958;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q54uFqFFzzoRCvgFN5VDG2OSO6tg2US+OMwH3LMyiIw=;
        b=Rzc3aEnc64GTz9gpYK3BmpKPNz7hN0mvye5fD7aNlAnED8ODQrRBN6dZWTNe/5ySJN
         zAP5LHeGZBK5JaCNsMai1p7NKB9N1i7wlXbAJ62VxkHsJFenXGEeiEtpMkJ9G1AiEo8W
         ygvl2RK1sSxiQxbPzWj3WQ2AYWa1jqxpzZQXWJNzNJVGUKpJknqL6+4Q8XQJ/Yc+h7rX
         cPw7vNWfJc/B8jMGm3tw2XUhHwLaVOdeygW0OYkIbCM1F20VW5sHhVcGPhNeP0mTJ2tb
         8XqbQglas/7MHyHtwA8w1l8v8gGF+SgXSEa1hz9lrbPT7sZuMAYfpAg2Khj33IAdZpnL
         V0Ng==
X-Gm-Message-State: AOJu0YxYPFa1LSbiBtyEwo42T0TaoM6rx87OaK31lIRrOQKCZVfOM3fm
	n/AXW/HziT9Bb75HjnHv2YnaTnLgLrvUtxdcJq3GU7gNJBQpEujXq2ynP0LsTWeYqqxISR7ZB3H
	VEqBH
X-Gm-Gg: ASbGncs42t8qEpsmc9n4H8UV9TZddODyxDziWyNMCyOdFxpyW9XnK/IJtHHeBDSSdq3
	TIGEaj1y/64Bms/dE1tYSZcK9cioiXPJ2FPxN0GE0+6g3xZZBsW0u8J7ccxMJkdW6yUDLgI1ZEr
	r1FRj9NgLJu3woAyrQquL8DXcq1VMM3KdK0jCeUC+e9ccfmOIkbzMhD/+iJ+1bJX74OqMypkqhP
	e3trAcdAMU6C4HvjzRGmkFmDQSB9ofQuFdvE1HzpjhQ7knJoZCUm5jQlSLP6OB/Gqd2UQPUNBE9
	tCHO30xwJ4GHqPt+wkRKqhOt1ejTdTAuhOGC1gtkz/p/v6y6wLGKZBZu9XA251o09GXW5T3mjrv
	mavX7Yy0m1driIzoD1R8TbFam
X-Google-Smtp-Source: AGHT+IG/GtJA3sJpUDUdvZ9Ge4zManuVMZfICH+wzo4y+lHk46BP56c4ugnIQfyHfl74rfeN9aBh+Q==
X-Received: by 2002:a17:90a:e18c:b0:312:e49b:c972 with SMTP id 98e67ed59e1d1-31c9e7022f4mr7677441a91.15.1752721158285;
        Wed, 16 Jul 2025 19:59:18 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:3bfc:8fec:7e35:e96a])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31c9f29e313sm2204547a91.35.2025.07.16.19.59.17
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 19:59:17 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 06/12] git: Upgrade 2.44.3 -> 2.44.4
Date: Wed, 16 Jul 2025 19:58:54 -0700
Message-ID: <3a9fdcb2ea0dd2744f59a62f2722bfa276302324.1752721028.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1752721028.git.steve@sakoman.com>
References: <cover.1752721028.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Jul 2025 02:59:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220506

From: Vijay Anusuri <vanusuri@mvista.com>

Addresses the security issues - CVE-2025-27613, CVE-2025-27614, CVE-2025-46334,
CVE-2025-46835, CVE-2025-48384, CVE-2025-48385, and CVE-2025-48386.

Release Notes:
https://github.com/git/git/blob/v2.44.4/Documentation/RelNotes/2.44.4.txt

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/git/{git_2.44.3.bb => git_2.44.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/git/{git_2.44.3.bb => git_2.44.4.bb} (98%)

diff --git a/meta/recipes-devtools/git/git_2.44.3.bb b/meta/recipes-devtools/git/git_2.44.4.bb
similarity index 98%
rename from meta/recipes-devtools/git/git_2.44.3.bb
rename to meta/recipes-devtools/git/git_2.44.4.bb
index 7b33d6071e..66936417e1 100644
--- a/meta/recipes-devtools/git/git_2.44.3.bb
+++ b/meta/recipes-devtools/git/git_2.44.4.bb
@@ -172,4 +172,4 @@ EXTRA_OECONF += "ac_cv_snprintf_returns_bogus=no \
                  "
 EXTRA_OEMAKE += "NO_GETTEXT=1"
 
-SRC_URI[tarball.sha256sum] = "4237c37cdf7b3d38102117b22993b2f761a4c02758dfbe33f7b7423c0b096ca9"
+SRC_URI[tarball.sha256sum] = "302ebe0f4b1c5d1ee477b5ee74f7f2f69efd8fa7f27481e45087ba9a4bb4851c"
-- 
2.43.0


