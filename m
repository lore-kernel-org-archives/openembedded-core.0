Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E637D0C5FE
	for <webhook@archiver.kernel.org>; Fri, 25 Oct 2024 10:54:47 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web11.9484.1729853682509387046
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Oct 2024 03:54:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=bB+jWsdj;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43161e7bb25so18657085e9.2
        for <openembedded-core@lists.openembedded.org>; Fri, 25 Oct 2024 03:54:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1729853681; x=1730458481; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=2SYCb096aAt8x8p1vGs3monzxAsfij0dk0p2T9qCF8Q=;
        b=bB+jWsdjbJmWaxrJN357PL/u5q6Iyz4lEZ/AAQJVqQy2qrEOKA1mWFyrOJb/p8jMG+
         WoqwLQyWA7542aiaPAy5XYVfgnnEXbSSYPt3+03xYf2GkVA9FPRoFbMlCf7pLhEW06cd
         ucOt1c777Zhfc7C/HL9V72FBfeteqiBzGMgYc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729853681; x=1730458481;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2SYCb096aAt8x8p1vGs3monzxAsfij0dk0p2T9qCF8Q=;
        b=w4f5hqvgn6D8ryoDg/Z3H74gX4JBbfy9vh8++j6Gji7TZZuzhKgzir3IWXbWvAhSD1
         SxHMGiAfJOD18bpBsMASzLatlRbCEXBlidA05Bgsz5OxlPm0PusH2n7ByZom0W+1+Wa5
         Zd5nCJfhMrlDaAci1PkQ2C3BzHiE4k626Pq32a9bzpminpV19/fANhN0seWc3sOLyLlU
         WEk/rv5XQ/NYnFajxt+Ahwt2PHeZv+d7uC35G0TQ5tida3HOPFHLxmfxkVo8XouV9prj
         CCSs02y0I8HgV3Ms9a5sXFu08J20ZZ8LNm2RVTYuZiEzWCYYBCMD52bh2isJlhAJJXyA
         Boyw==
X-Gm-Message-State: AOJu0YwfJ+tpJ2nv7xSgil9gZtzc8A5pNyPwwvren+PFRRt+lWPL/GH9
	HNALGGCH9JgUr13mShzqwhiOrtpKiszk5RoPldh3v5POTAEmVrC2iMh3wcjELtkogVLdaTdlAFi
	4ClE=
X-Google-Smtp-Source: AGHT+IEjtVhRkQmOKc80h3QD1LS+P9vFWtuLIbUKIkiTIAHsEsK/oOMrqyGApR/PNTzLAhqCfBXdJg==
X-Received: by 2002:a05:600c:1d1f:b0:42c:ba83:3f01 with SMTP id 5b1f17b1804b1-4318413e3afmr76057185e9.8.1729853680485;
        Fri, 25 Oct 2024 03:54:40 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:5e58:696f:3954:9f3f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4318b57088bsm45076785e9.37.2024.10.25.03.54.39
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 03:54:39 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] oeqa/selftest/buildoptions: Use continue option in source mirrors test
Date: Fri, 25 Oct 2024 11:54:38 +0100
Message-ID: <20241025105438.3990293-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Oct 2024 10:54:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206349

It is helpful to see all the issues in the source mirror test so
use the continue option.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/cases/buildoptions.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/buildoptions.py b/meta/lib/oeqa/selftest/cases/buildoptions.py
index 423c31e1892..09272314bb8 100644
--- a/meta/lib/oeqa/selftest/cases/buildoptions.py
+++ b/meta/lib/oeqa/selftest/cases/buildoptions.py
@@ -229,7 +229,7 @@ PREMIRRORS = "\\
     https://.*/.*    http://downloads.yoctoproject.org/mirror/sources/ \\n"
 """)
 
-        bitbake("world --runall fetch")
+        bitbake("world --runall fetch --continue")
 
 
 class Poisoning(OESelftestTestCase):

