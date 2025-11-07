Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EF3DCCFA05
	for <webhook@archiver.kernel.org>; Fri,  7 Nov 2025 07:08:28 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6157.1762499303412271198
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Nov 2025 23:08:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OtXLrpZO;
 spf=pass (domain: gmail.com, ip: 209.85.216.44, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-341c68c953bso545428a91.1
        for <openembedded-core@lists.openembedded.org>; Thu, 06 Nov 2025 23:08:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762499302; x=1763104102; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=O0GWFRv0IvJyxQ0sMXj5hT/Il3zBXLqqGVEAMXk1vok=;
        b=OtXLrpZOKGld1C5W7ciWmBwbx8h/M5l71TMpNvA2+fk8PesPP6bVYFy+jS01l7KvhK
         qDj3+eXVy4t07IagPRZ7D+zkgC3rbMjdHOlA37GgS/zryvz55iv1cZ+K1xbkaTUeHRhh
         blRmj1TreFFR7jpzu7i2fgL55NMqyHW2FhQPXp0BkMOJutdXBxm0csJ/Fl03rAFSGf2W
         7by0IGS4Rux4Ex7PhadQz346ujnbC5sS47T5TFHEofYkwFd9V0ecp8+L0g2fPJDBHx3l
         BlSGFV4xlL6EyaZU10GiGyyZOCXvWQ2eHqrkgkozKkEktS2DrnkZLbwLrxhdIxZn5FHV
         TsdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762499302; x=1763104102;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O0GWFRv0IvJyxQ0sMXj5hT/Il3zBXLqqGVEAMXk1vok=;
        b=cthIQJayqVvk7oe67b4jyJAgLAlsmu10kev+i4G0vnZPW6iadCUjuiB9Ei/V4BLON8
         ETmwSNzvZyR4SLQg24711cxDQmh4R6OpZqoLVydkmRonsfv/jgyALhSb6A+yhJpHBq/h
         vltOs5mz9t+Xwd1Fy4q3ow5Rez9twWPnCdlIEe4oQZb6c9ntOKoBFIi1HaPrmrYUDmz6
         lI9A+Hdr5nVAp4cymc87uBDaO36YDp7exz5sZZsUlu1f+3VQI4s/+OtBOKyRoId6Ypi0
         znbgrI8m5+a8/apeHHUJeT0I2cOldem7kRx3gobclL89SC/KRant+po9ab/PEuL1L7ED
         f4Cg==
X-Gm-Message-State: AOJu0YyEtVdpDMWn+ZRTaLhrRUGQT+6JjanCIJX0HEj9g3JDjyLKbHOt
	ovcWRpOKjN1Ad/BnaG021xrLqF8C8Vo27GM+kVffTkw/YfFq4SX99TSSdjeMP+Q5gdY=
X-Gm-Gg: ASbGnctTZjSb5jvbokEcsIrzGb3l35tgr+xrfxWQJkizgN+K+j7ezDAqT2bwtPlNjIj
	V0Z6SBJT6GtjMohD7qoNLXAU21+e3O8qxDlZlwtY11QgacIgFokkMyFxubLs4WFwQ+A/aNfO51R
	9o3poq4B2xq+uq96X/0KIKqgyKTARKX3Nb9+zr/1PUtNJ7dE3pc8LuDeA/mkhPESDKQHDqLfokt
	ROBgyS9h24crHyex5C4cg7p5nmetnWUwvLMlPd8259T+RKed+eYrxSFs+3h7fqs4d4PJKta5cWr
	CUWj+W4ZI4Cx+Egb8jTINXzT2DbAggQ4V6Pw/YSu9XlrHJPsifmaIjeRvRqIkChYjsURTVsa45r
	GFKb761KABby0R/XOf/HHHqQZKyGwGyIXdPOtdZaNh/Wcncity665Fs3/clU4QQRK4uOPM2uXaB
	WSjYTJbJ7yKk7lpi9hxQ+MAzWq0Ci36to0JJ/D89rT85ECHOBHMl2jTvh6fd2KwZs47o9z4dNc
X-Google-Smtp-Source: AGHT+IG2EqRDCAF+U8PIcJCD5zqJISiWjZPtIo1A2aL+TJ5HyEdKSJ2sDprpJQ9osHuFXP8iDNZ8zw==
X-Received: by 2002:a17:90b:1c88:b0:340:29a1:1b0c with SMTP id 98e67ed59e1d1-3434c4df264mr2782020a91.7.1762499302115;
        Thu, 06 Nov 2025 23:08:22 -0800 (PST)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::888a])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-341a67e2f82sm8561625a91.0.2025.11.06.23.08.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 23:08:21 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 1/5] gn: upgrade to latest revision
Date: Thu,  6 Nov 2025 23:08:15 -0800
Message-ID: <20251107070819.3751599-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.51.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Nov 2025 07:08:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226008

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/gn/gn_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/gn/gn_git.bb b/meta/recipes-devtools/gn/gn_git.bb
index d8896609b19..86372169884 100644
--- a/meta/recipes-devtools/gn/gn_git.bb
+++ b/meta/recipes-devtools/gn/gn_git.bb
@@ -7,7 +7,7 @@ DEPENDS += "ninja-native"
 UPSTREAM_CHECK_COMMITS = "1"
 
 SRC_URI = "git://gn.googlesource.com/gn;protocol=https;branch=main"
-SRCREV = "81b24e01531ecf0eff12ec9359a555ec3944ec4e"
+SRCREV = "092f4f0d612e5982728c8b872c2e69cf3d04b21f"
 PV = "0+git"
 
 BB_GIT_SHALLOW = ""

