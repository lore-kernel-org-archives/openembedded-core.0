Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CED6C77B7A
	for <webhook@archiver.kernel.org>; Fri,  2 Jun 2023 02:22:49 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web10.3383.1685672566238645528
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Jun 2023 19:22:46 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=zJ+w104R;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.170, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-652a45266dfso422982b3a.2
        for <openembedded-core@lists.openembedded.org>; Thu, 01 Jun 2023 19:22:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1685672565; x=1688264565;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TJice8P5kvprZyo7ewSAgpw0rlxG5a0L5Fbl0WpJL+0=;
        b=zJ+w104RaiVivZEVlY5hb5JIoMBRqLwo0PWXsI0RUqjtdiIfCVNMKx0T6SePwNWyaw
         0HXI9HuLsnJ18hCDiudbgLQzesNHak6/yHwypWwJx664/cwlv1sHt7g+pKiayCc79hGo
         0DikcRrLF7/XOJt5lH+uadlGWf2OqzhLF4w8U5XHmGhVtHD1+va/vhg7T31U21VxeORH
         VvxRw/lZlJsy/Hw8FoPOIAYG61Am53Lv2fFddowVSuGqxuLnjSWCNGnoGnhx3b6OOp8f
         G0pE7hdULkXQv5aSbyTTN2dIshVKxMsJrpblPeJ9U2ku5t0KqHit5vpPhH8u6PzpZfbN
         +lDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685672565; x=1688264565;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TJice8P5kvprZyo7ewSAgpw0rlxG5a0L5Fbl0WpJL+0=;
        b=h97jhGx7g3BzwEJYSR8wfEvEHKFky3qDfF4SKanC7bSa86ZYJ7UPei0GMUbZ4qR4fg
         PcOdeOTwzNqRQFswNJIHzZkfl1mrFcRlF0HSK56EfExx0uGz6xzDaUiOTrdJbi70e+Ju
         qlntY1GJ+3gR1AjIzKIhgyB5XcHqCms7ooSSk4lv98mnY3MhDrfCtE91L69uusJawW1k
         tx2Dr3HAJHjcrulJ3YPKGhv5QfwUbU8tUUY22QNd172uhOCE7d1CEeoLNrNRR98VA4/I
         1b/YtXtRJfbY2BFOBO4DyQ29dJWUt6qnCOxaePB7ZWArgeo2D9ZrRrdNWpg+7DDeklu6
         2DCg==
X-Gm-Message-State: AC+VfDw/utbGn13fPa1xRWdpM4sLlH+QrW89qh/sJVT4iBcON8UEy3Aq
	rx39VRo8FLA5UOM05TwCQmIYj87OS4NnzWhI7Yc=
X-Google-Smtp-Source: ACHHUZ7h/T7/Ct3p23gx9Nv3Lb/kGBdCKm9zEzz8TeaXBRAWXWN1J4IuVOMWVKV/aUkUwb2iVt8c6w==
X-Received: by 2002:a05:6a20:9f04:b0:10c:9efb:e04c with SMTP id mk4-20020a056a209f0400b0010c9efbe04cmr7573620pzb.61.1685672565296;
        Thu, 01 Jun 2023 19:22:45 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id z16-20020aa785d0000000b0064fc715b380sm5850234pfn.176.2023.06.01.19.22.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jun 2023 19:22:44 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 13/13] uninative: Upgrade to 4.0 to include latest gcc 13.1.1
Date: Thu,  1 Jun 2023 16:22:12 -1000
Message-Id: <0470293e16f424ba4ee6505f3ef68e5ee13df483.1685672395.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1685672395.git.steve@sakoman.com>
References: <cover.1685672395.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Jun 2023 02:22:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182136

From: Michael Halstead <mhalstead@linuxfoundation.org>

Signed-off-by: Michael Halstead <mhalstead@linuxfoundation.org>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit f87becb69e02bdf055dffb633ed4f6d36b36f7a7)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/conf/distro/include/yocto-uninative.inc | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/conf/distro/include/yocto-uninative.inc b/meta/conf/distro/include/yocto-uninative.inc
index f3c05b7e20..ad4816a1f3 100644
--- a/meta/conf/distro/include/yocto-uninative.inc
+++ b/meta/conf/distro/include/yocto-uninative.inc
@@ -7,9 +7,9 @@
 #
 
 UNINATIVE_MAXGLIBCVERSION = "2.37"
-UNINATIVE_VERSION = "3.10"
+UNINATIVE_VERSION = "4.0"
 
 UNINATIVE_URL ?= "http://downloads.yoctoproject.org/releases/uninative/${UNINATIVE_VERSION}/"
-UNINATIVE_CHECKSUM[aarch64] ?= "b11f7dff0ff5e3c971f22e89a105efb0f8d2006fd71d1ea3e5da771e416b0e01"
-UNINATIVE_CHECKSUM[i686] ?= "ad7daa7fca7693ca07eea5279f830333530171d357759b380954a25254edd8dd"
-UNINATIVE_CHECKSUM[x86_64] ?= "ce8ff7e3247da312fbf84008f415bc1b4d113ac9fe4ec91581e4a20cd8b475d3"
+UNINATIVE_CHECKSUM[aarch64] ?= "7baa8418a302df52e00916193b0a04f318356d9d2670c9a2bce3e966efefd738"
+UNINATIVE_CHECKSUM[i686] ?= "83114d36883d43a521e280742b9849bf85d039b2f83d8e21d480659babe75ee8"
+UNINATIVE_CHECKSUM[x86_64] ?= "fd75b2a1a67a10f6b7d65afb7d0f3e71a63b0038e428f34dfe420bb37716558a"
-- 
2.34.1


