Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB19CC531DC
	for <webhook@archiver.kernel.org>; Thu, 17 Aug 2023 19:54:07 +0000 (UTC)
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
 by mx.groups.io with SMTP id smtpd.web10.3489.1692302039356060854
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Aug 2023 12:53:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20221208.gappssmtp.com header.s=20221208 header.b=J8j4iPX4;
 spf=pass (domain: baylibre.com, ip: 209.85.167.176, mailfrom: tgamblin@baylibre.com)
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-3a82db15081so102791b6e.0
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Aug 2023 12:53:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1692302038; x=1692906838;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=H2vElUWofpo8jjuvDF3X1gHKsp1R4l5Y/Uc7WhA/2Yk=;
        b=J8j4iPX42aB5P0n0SO+Y2CsLBFxZ4vTRltBs6TolICwsL19pXgdWtj85Y+p8LCTnzI
         1eqK7xyDgAyBt0pQ16j8Nh513Ud3opc4m/2xYGVEIl7VGmezI3+COwqjVaT+hRvOABMF
         rPmgdEBGIahBhMl45a0+qkFEOQhABgAxE1A/PXWz5ScHZzRCs3/l3BxCgAXbD9ur156d
         rgbFLKFP27wpNPGswDpRk0hsXyJYOyty8irTzjA5LXZAiMCM/0Ql49gDluxyaaQRuCI4
         c85TYFQ7yEwqsCHpoiAnn4w7BnMqyPMpRr0ITK72BE8W/cmhxPcia+fFbP3DlyOey2gb
         xcow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692302038; x=1692906838;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=H2vElUWofpo8jjuvDF3X1gHKsp1R4l5Y/Uc7WhA/2Yk=;
        b=I+XRL8NHTjfP8/Pqiiho678KpsbqXIuaVdJABRHMhZpV76j3okf99wE62B8rt9C1rj
         OYY6SO252xxq7CYqga9HoMVLkyQfXbEHjfhy7/u2d8RILe35xwI/Wh5VULDo4cRmgUWN
         dJl/0NqJOEFgEdkedozaY/h3vtFMLxZoZZXW+u8pKzIeKHzhnD4Z9vVHGTt1h5/baKPD
         w5eplR8cOLmyqMDUjBEVjUtog21AZqjBws5DZEsnislohCdzuGSvYLfnIlKr7v4FFYSd
         vdFTRsnP9spTmEh25n6YSQkP1uKwu4lbrFn/iCiKc+nhQn5pIzeFEAGzC36rJbqaQFdY
         EUQw==
X-Gm-Message-State: AOJu0YzefUyMRukZNt2UaMjLYGnKD+LYvopn1GzVmy6/vwS6FZdJqhaC
	0tvxrM2Ski4UHFalyNS82GdyxGWRWskylx+KmWk=
X-Google-Smtp-Source: AGHT+IGvBnqMFQTMQbxe4z/EflGK0evyXPfdKTxsGmPKw8nxUGW/v4k3lv4oJdJzCT/AKCx8RtaWRQ==
X-Received: by 2002:a05:6808:2389:b0:3a7:48d2:fc82 with SMTP id bp9-20020a056808238900b003a748d2fc82mr683006oib.38.1692302038000;
        Thu, 17 Aug 2023 12:53:58 -0700 (PDT)
Received: from megalith.cgocable.net ([2001:1970:5b1f:ab00:fc4e:ec42:7e5d:48dd])
        by smtp.gmail.com with ESMTPSA id g10-20020a0cf08a000000b006472c92745asm104875qvk.97.2023.08.17.12.53.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Aug 2023 12:53:57 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] oe-buildenv-internal: update required Python version
Date: Thu, 17 Aug 2023 15:53:56 -0400
Message-ID: <20230817195356.2307068-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Aug 2023 19:54:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186340

The system requirements in the current version of the reference manual
state that Python 3.8.0 is the minimum version, but oe-buildenv-internal
still only checks for 3.5.0 or newer. Update the script to match.

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 scripts/oe-buildenv-internal | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/scripts/oe-buildenv-internal b/scripts/oe-buildenv-internal
index f856e618aa..2fdb19565a 100755
--- a/scripts/oe-buildenv-internal
+++ b/scripts/oe-buildenv-internal
@@ -32,12 +32,12 @@ fi
 # We potentially have code that doesn't parse correctly with older versions 
 # of Python, and rather than fixing that and being eternally vigilant for 
 # any other new feature use, just check the version here.
-py_v35_check=$(python3 -c 'import sys; print(sys.version_info >= (3,5,0))')
-if [ "$py_v35_check" != "True" ]; then
-    echo >&2 "BitBake requires Python 3.5.0 or later as 'python3 (scripts/install-buildtools can be used if needed)'"
+py_v38_check=$(python3 -c 'import sys; print(sys.version_info >= (3,8,0))')
+if [ "$py_v38_check" != "True" ]; then
+    echo >&2 "BitBake requires Python 3.8.0 or later as 'python3' (scripts/install-buildtools can be used if needed)"
     return 1
 fi
-unset py_v35_check
+unset py_v38_check
 
 if [ -z "$BDIR" ]; then
     if [ -z "$1" ]; then
-- 
2.41.0


