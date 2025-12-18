Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DECD8D711BE
	for <webhook@archiver.kernel.org>; Thu, 18 Dec 2025 20:23:13 +0000 (UTC)
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2038.1766089393104310261
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Dec 2025 12:23:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QR2EK8+w;
 spf=pass (domain: gmail.com, ip: 209.85.219.47, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-8885b3c06caso15100656d6.1
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Dec 2025 12:23:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766089392; x=1766694192; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uj6xLaB178TnGV5ANxk0AkcPf0CG53SNc1Bimzy6C18=;
        b=QR2EK8+wLpwDnvk/G0DmjmLr3yX311vwQp4d73qKvwyem6SKAdv2d5Ew7Zd7q55UZG
         ovuv4M2MxVBzkJqlx6AMwhxi+gQsOw/G365k7MUZhIxXxi4/BB1TKWP1gA9Yw/FYMTve
         Ap4ZQbwT7eeTcTKsZz0NKOPQDloq+jnOTg8a+k03rw+GibJekbzWASMpDoPB2kqNxC+A
         bPCwH/dnWIvgyT67lGBdweGPM1cCo19PBqErvleWQzlBHm8nRBo1EkR8+7vWVavVnT/J
         Qk2Rlypczp5LE9J5xYW+lgVLsazRGciHqHAXbGbEq00e8IRxGiRHyDCBtNiLjcy5WSS+
         IQ0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766089392; x=1766694192;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uj6xLaB178TnGV5ANxk0AkcPf0CG53SNc1Bimzy6C18=;
        b=VQWgH3+x9D2Kr4AQKwSl7SYAYCFsdS1Ca2l4H8emKE4PdHkBykFakV7PIkKWwqfcao
         MkiLytgO86H3HNrC5g3TRCL1xDLzf4xLBTtMVGORmr0rW5OrfAGOqm3g9VmhHf/1+x7C
         cJvvAJlhpv+//b8je2UochcJbj8tzXnN5g74vOR9XpMzuSNMDc9oLWk8yeE6c5LjI7dY
         FkTt1X0qAp9ZhzCiprfByI3Ay9LQ3ZCi91obb22ldvhmmgrnh75Hoqy6Z7AgLbz5GmfA
         SyL2YJe5tcxBwTyl58UXPpIZLktxCRONj+Lx8tok+18lWTU8Basi7q96fgr2916HeKzK
         4BGA==
X-Gm-Message-State: AOJu0YzxKlOZTxCbhxS2+y77gAwdHZkrCTsaaKwN2tUhw3zj4zQf15II
	cp+d68IhRLL86KrF4zLur0QIGk1L5bcKGVnRweD4P9OVQoCG8D4lDy7G
X-Gm-Gg: AY/fxX5/YCAFmKa7ArOYsnv0jP792I74YrYXjCkUleunv7a7vQ1YeN2FlM7+HG0uuhA
	/U2ijt2LXj0rUDSZnQV+5l/Gb90G+RmsDhkhEDtz6g02WlR6qXNkRehjotS+Jcjmsupx8RiRuoo
	9uKOjymewhmS+OBgnPinXmmFBhnu5PJawzs7cHZNYeRA2EUfEl8FTx+kE5g0Eryvk3sPiRgqq/V
	mWCzsvgqfqykeKk6JZ9EVNb4HtzsWjTNXWQ/exCsMVHi+mOnVEgVrPdZv0O+3arIrbQz6o5nGhS
	zIPCnUy9N98vo3NAz1N4wSm4FqDH+eVo1JplhCjyPbYD7hNWta+X7Q/e1It1O2PJC4/3HauJWtn
	Vnq3+WCPWEpI/w1xKtMFhnR+FIJEWVRVIBNLwe7LnrY+h4jy8shMu7bkfra7cDkMsHS6FdVwIu1
	hot66lSFtCjI1CpRzFs/iTTeEwLb2Tus0lIvOhgGAlabY46bcVQu/pjVJNyii4r9qNxoDoDm28U
	G9NyU+YN2BR4zI=
X-Google-Smtp-Source: AGHT+IHUriOGmb/s0Nl3iOHk4FA9QvMZ3R7g4hWV0xiMipKJiZ+VY3wSZHMvh3yBDWEJD5CKMWK8vQ==
X-Received: by 2002:a05:6214:1a51:b0:882:3704:3028 with SMTP id 6a1803df08f44-88d85e98b2cmr10412186d6.30.1766089391947;
        Thu, 18 Dec 2025 12:23:11 -0800 (PST)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-88d99d7dbdcsm3226456d6.43.2025.12.18.12.23.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 12:23:11 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [02/06][meta-yocto] yocto-bsp/6.17: drop bbappend
Date: Thu, 18 Dec 2025 15:22:42 -0500
Message-Id: <20251218202248.70476-17-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1766087617.bruce.ashfield@gmail.com>
References: <cover.1766087617.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Dec 2025 20:23:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228160

From: Bruce Ashfield <bruce.ashfield@gmail.com>

The 6.17 kernel is being removed from OE core, so we no longer
need this bbappend.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../recipes-kernel/linux/linux-yocto_6.17.bbappend    | 11 -----------
 1 file changed, 11 deletions(-)
 delete mode 100644 meta-yocto-bsp/recipes-kernel/linux/linux-yocto_6.17.bbappend

diff --git a/meta-yocto-bsp/recipes-kernel/linux/linux-yocto_6.17.bbappend b/meta-yocto-bsp/recipes-kernel/linux/linux-yocto_6.17.bbappend
deleted file mode 100644
index 603a967..0000000
--- a/meta-yocto-bsp/recipes-kernel/linux/linux-yocto_6.17.bbappend
+++ /dev/null
@@ -1,11 +0,0 @@
-COMPATIBLE_MACHINE:genericarm64 = "genericarm64"
-COMPATIBLE_MACHINE:beaglebone-yocto = "beaglebone-yocto"
-COMPATIBLE_MACHINE:genericx86 = "genericx86"
-COMPATIBLE_MACHINE:genericx86-64 = "genericx86-64"
-
-KMACHINE:beaglebone-yocto ?= "beaglebone"
-KMACHINE:genericx86 ?= "common-pc"
-KMACHINE:genericx86-64 ?= "common-pc-64"
-
-KBRANCH:genericarm64 ?= "v6.17/standard/genericarm64"
-SRCREV_machine:genericarm64 ?= "459fdea93914f4db040bd8ebf8bce134a4cd6388"
-- 
2.39.2


