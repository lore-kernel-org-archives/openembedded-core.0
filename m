Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7E60CE7AEB
	for <webhook@archiver.kernel.org>; Thu, 28 Sep 2023 02:49:18 +0000 (UTC)
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
 by mx.groups.io with SMTP id smtpd.web11.6177.1695869350010953349
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Sep 2023 19:49:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Asis6d/l;
 spf=softfail (domain: sakoman.com, ip: 209.85.221.171, mailfrom: steve@sakoman.com)
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-495c10cec8aso4818690e0c.1
        for <openembedded-core@lists.openembedded.org>; Wed, 27 Sep 2023 19:49:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1695869349; x=1696474149; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Qwo1+prO0x1oXTC512Tr8uxvO9Tv0lOM0N7LyKM/Sdk=;
        b=Asis6d/lhAsweEmkiQ58IjFK6mTXgRZqyzQpwvZgT+n9kNn0/0QozB/npboWXoY5Bz
         LCZiARCGMHsPBV0z8GlvTpTe411Nf/m6uMPeOPErY2ysEL+7wCoLhCjF4NGh2H1EKlm8
         A9BFDqL1jwf7RqR7pIJmSOEam4+uNWCk35i5vegWdsKgPYxr7/Z5eaknAtT5fuHMeQyo
         ZFdXxhTyFhqSTy1w89gmo40Wa9JNmQdOLaoiaWlkMRmxm58FIAe4DOmAQ4HQa3LsiapS
         sqHJm8RueYmjsgeWBHrCLcxqM5mbjrNvFyPT7LennFH5yggvOLYlFhAgJuFO03NIuv+G
         OhuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695869349; x=1696474149;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qwo1+prO0x1oXTC512Tr8uxvO9Tv0lOM0N7LyKM/Sdk=;
        b=Q0LHEzcaZrE/hnOcIVP4pyjDx0AzP0dGRAJqz2+og2YvQ1Z5P4KHtf1gZuH18kCCjX
         SOUyImleZhuh0rotTdGr5CP48MI3rry4qPKTrtNUCHfqu8mcRoXDXrssTiXJ2wwbTpNe
         e0HPpBMFaFcVcbVDnr7M2wTUhp61hFfJPvQQIxAQ7QHIqGhzBtqnNf/nXYt6z3Od10ga
         KVA2RS+yvAPpVXSMfPozDu0fbaqCq+JWHudRj+pKMNfhQZROhfxKhBsOGiGTY4YAwD1k
         nRiXyeiUjemYFg50SElU7C/ttErt5tlR5K/vqW0mTnUma/oQn8B4hIAX1LlT8IbwoTK7
         o0nw==
X-Gm-Message-State: AOJu0YzxohLX5NcheoiaDZe2oz8z++08WlYb33dy9syYq2SBIcNxsMF5
	WvoKHXovE6QZw60jsbS6U1VjU5NtOco3wYJt1pM=
X-Google-Smtp-Source: AGHT+IF3wsgEm4PTKOJ6ak7E6JTzQYrZio8rlVVA/cJ/3vCktWPHhF34DH3q6+xpXCa5DHhnP6n2eQ==
X-Received: by 2002:a1f:d6c7:0:b0:49a:1a56:945c with SMTP id n190-20020a1fd6c7000000b0049a1a56945cmr3830555vkg.13.1695869348749;
        Wed, 27 Sep 2023 19:49:08 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id n3-20020aa79043000000b0068e12e6954csm1850214pfo.36.2023.09.27.19.49.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Sep 2023 19:49:08 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 10/17] xserver-xorg: ignore CVE-2022-3553 as it is XQuartz-specific
Date: Wed, 27 Sep 2023 16:48:39 -1000
Message-Id: <96d36b97d9c6d1f5e79b1bea79f182561423fecb.1695869144.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1695869144.git.steve@sakoman.com>
References: <cover.1695869144.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Sep 2023 02:49:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188360

From: Ross Burton <ross.burton@arm.com>

(cherry-pick from commit 769576f36aac9652525beec5c7e8a4d26632b844 )

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-graphics/xorg-xserver/xserver-xorg.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
index 6b11c79be6..ecb164ddf7 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
@@ -28,6 +28,8 @@ CVE_CHECK_IGNORE += "CVE-2011-4613"
 # impossible or difficult to exploit. There is currently no upstream patch
 # available for this flaw.
 CVE_CHECK_IGNORE += "CVE-2020-25697"
+# This is specific to XQuartz, which is the macOS X server port
+CVE_CHECK_IGNORE += "CVE-2022-3553"
 
 S = "${WORKDIR}/${XORG_PN}-${PV}"
 
-- 
2.34.1


