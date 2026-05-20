Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A9FECD5BB1
	for <webhook@archiver.kernel.org>; Wed, 20 May 2026 08:21:23 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7385.1779265277170903026
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 May 2026 01:21:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=XJ5RWhE9;
 spf=pass (domain: smile.fr, ip: 209.85.128.51, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-488b0046078so40492275e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 20 May 2026 01:21:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1779265275; x=1779870075; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HJQUh3B3wiA64y2/Myi3VKjPXL7aY2yWce5Bxkt0nNM=;
        b=XJ5RWhE9E5hY1EAiSH1QEb7cL5f4Yqco+Cwu6Cw10lweJXehIdEMKpfvkM+eIzue2M
         xZtv6YQGxHHUDIaf9g9XvGOSQ1G5Jd9YHsdsvV7U1bg3qeWUBdtGerFyU7Yn4BgS5SYy
         1T6wIsa+5J05ME8VnRPCOh79erdWsNu2jrQso=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779265275; x=1779870075;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HJQUh3B3wiA64y2/Myi3VKjPXL7aY2yWce5Bxkt0nNM=;
        b=tNRgJ38XQ2giynIiDAN0tBNBooV/JWJTNm/8dQlG6/+Pp4nKBUzDBowb+G0Jpwox7u
         GOj/orPcuEETFXOVNYwwhQc0THC8jycNrrjKhNsKfupDjOPxltq5giBgAbIn/Er466hB
         hIpTho/C8q7AFSMmthzpDbqSB0CYIOLrpkZEmNhfg9xb2+Bz8eLE1+xWO3re7xmEXNDr
         zsB3ElHvHZNCNFF49LCgZ7PWsw790z0kqdsAcKXuWA97AolnDJkQJbD6sNuRB7UNj95d
         VWASOscHnUQno9ivWNYU9/ac7jwTPoykTyKOvCe2LRhiL4DIP/EmhPwSVAiNonIVcbHt
         X5Fg==
X-Gm-Message-State: AOJu0Ywb8jW9bObnukk0ruwwKAL1ibOhAhqLUhOpGfxuW1Z9+enoOZZO
	TezKMmiOiQgqMpMm+BiKLYjNrVrBxTJNNMB3aJp94EdEWEvf7oMM7zbrNfJhbQ0NHgg2DS/sEHT
	VJa6d
X-Gm-Gg: Acq92OHkebah0sqm9R/rirNJTk13KwrowSai77YKYBow0AOUE/B20xbiwqF3nMv4s5v
	Kue9lHuZCNgdB0byO/Eebp3D2SKq60B3yldmtCWZeP5KFahHjEtnU7r8ihovjpLe0jTv/+lxY8f
	bbv4zoZsHAr3Wo43AxJznEyr9FP0xme1bf64oqLfi2tV15TavqMjvlJAv9OepA/a+yIv4Zn6jnR
	yWQaL5IthLSCC3CJbClVKt/WmYmhxPHzxIVv1HLR5a4iUoQG+o4aDzVDowyZb+HM6aCPOk/EEwL
	TJE2CLlAytg6OCv4wG/NJ1oUTSp0ODL0HoNHlEUexgfENxbz9DjX+F02v6q8kQojxpuwanBqBwq
	u5bTuh3mwKQCtFD8wk3QIv8/PQRUFY5IXeSopjoUEiuSLu3QJ5mlCqAb1NbPUY2sEdFkLdJjz6V
	lhhlrcxdGsFJv5zKREl8kZl/zllKmKq15cDgZrMfh+hl7oJyyGkkINyVf7TC4+I2gbixTJFsR/Z
	jvmkW+PoYeMoBTVohTZic3Rlpqc20YaL5c2lMU=
X-Received: by 2002:a05:600c:3096:b0:48a:5339:ef0e with SMTP id 5b1f17b1804b1-48fe5fcdf39mr233954205e9.3.1779265275189;
        Wed, 20 May 2026 01:21:15 -0700 (PDT)
Received: from localhost.localdomain (2a02-8440-250c-63aa-0256-2b9f-d16e-d784.rev.sfr.net. [2a02:8440:250c:63aa:256:2b9f:d16e:d784])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45d9ec39ff1sm56350642f8f.10.2026.05.20.01.21.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 01:21:14 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose v2 21/28] features-check.bbclass: add reference to required TUNE_FEATURES
Date: Wed, 20 May 2026 10:20:22 +0200
Message-ID: <e3a4bc2d85ab0dc51a4cb466191d54908ca8f54e.1779264709.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1779264709.git.yoann.congal@smile.fr>
References: <cover.1779264709.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 May 2026 08:21:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237420

From: Robert P. J. Day <rpjday@crashcourse.ca>

While commit a8ef7339ecb9eee909224e7cf23ccd48ef105d93 added the
string 'TUNE' to add support for checking required TUNE_FEATURES,
the comment was not adjusted appropriately.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 66e76b68460d5d7480e686ed2d94090d69fb4b90)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/classes-recipe/features_check.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/features_check.bbclass b/meta/classes-recipe/features_check.bbclass
index 46d8243cb6b..d69cfb8309f 100644
--- a/meta/classes-recipe/features_check.bbclass
+++ b/meta/classes-recipe/features_check.bbclass
@@ -1,6 +1,6 @@
 # Allow checking of required and conflicting features
 #
-# xxx = [DISTRO,MACHINE,COMBINED,IMAGE]
+# xxx = [DISTRO,MACHINE,COMBINED,IMAGE,TUNE]
 #
 # ANY_OF_xxx_FEATURES:        ensure at least one item on this list is included
 #                             in xxx_FEATURES.

