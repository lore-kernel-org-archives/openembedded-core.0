Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 494EBCD3430
	for <webhook@archiver.kernel.org>; Sat,  2 May 2026 16:29:59 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9361.1777739390966865033
 for <openembedded-core@lists.openembedded.org>;
 Sat, 02 May 2026 09:29:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=D16gUH2K;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-44509921fbcso1472679f8f.3
        for <openembedded-core@lists.openembedded.org>; Sat, 02 May 2026 09:29:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1777739389; x=1778344189; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h3SochooLXwQAP4iRxDt5gqiV3GOuPbWsPhIofPrutM=;
        b=D16gUH2K7fmK6WmuRKO24tTRP9aYFQbW1g5lTeXD3AuyZEK7x2aCBR4rtHcFaEYN8F
         hj3ccS/dPddMQuZIXBPIvX4lYje5HGdYL1h4zxeoABhYV55b6zhR1ZWozE9W6/BBPUh6
         vN8aqpJF3fhYvq6tTK/r9TSS7FLFW+Wvf3M00=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777739389; x=1778344189;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=h3SochooLXwQAP4iRxDt5gqiV3GOuPbWsPhIofPrutM=;
        b=TmVchxP+HBlojm9HNykxHG5w5YbLUaSDL6yp6WCUj3cexkt4f9q9Z4Whu+PEdcogGK
         Y2/USqLId23g7kJaKTQMOrP97UO1Byhxn5UQd/eqrXXvSQXLlfKzXGVS9sbAAyaTYjZA
         7CYzeFOCDUMOQL/jCkA6fm95Cdcep2Yt8yqbqYhIJbUgkV6WPI9ChsSDeFW0kK+aZkxY
         cv/mdGA4W5jLuNvAbqhZU20IMVPc+VMS0NzwKvMSVs7mB80oNOYqVktfRMe9w9Fj01r/
         vOIGY8l17PYqVABF4TLbvg8UK05nbW4PcdBLosg3WgLdIbmlGw8ZxotjQXhJIdD7w4wc
         ZmEg==
X-Gm-Message-State: AOJu0YzkwOsTLIIh3opItLIbx/B5NylniPGQYg4QCzp/NVERGQs8t4hM
	a5pV+Lq07aCMwK+mM438/DH7hzZNAjZbOatANDvmN8wcxeGaRwllELNtIrAGlofqQ/gVhJFt964
	Piano79T/ppI85fisCeXsBccv6uWZ8wHKQBBZqQaXj+TRyUtnpFbznT+X7e9lu3KviEAOPd61E0
	d7/s6v+I8RnlWCPk0=
X-Gm-Gg: AeBDietjrxB4a3PPu+0/j4tdymvFf1H13tgb42Rf2gXELgDx3EnlzTtD9x4rCjgzpUR
	lUn9LtO3M9ZwyWt3s/sr7lnd3HcspB3sFuAURe+dNI7kEzMr0jO6g6C6mqYXdiHQ5w+beLbft+c
	XW7Ogk4NfVeSdTrhpgX3ayfMs9iXhmdt8nlButmtSgsiQNcp2/XwDWEp+jeYTrpZUUZ3PldY2wd
	wKRlOJ8AtxXuon39Tu70k73APZcgn7qImd4BpjIqPON6j+aI1wN1YbyeFjvwww8XD5/kERhKwGr
	aC+rYMQVDEKucRb54yvzyHnkl+e3WAOlL403NWk0JZY9n/gTrEUkb9DOtyqgxgVeYGuvi4gbTYV
	jOCjmkdeTFVS8+GgOYBOY6iJrVdLE7sokDAh0OhXUL12OBBMY9fxCFTgxljt31DC8nKcwRbJ7H5
	ZXMfhkC7TLljZ03VCZZ3HbXUFHE8jhqBoyaJaguXVNmbcpXg6BMTGAd0dqFeUbx3PS1AJU5EwJz
	A==
X-Received: by 2002:a5d:584e:0:b0:43d:7946:badc with SMTP id ffacd0b85a97d-44bb558c966mr5853055f8f.26.1777739388795;
        Sat, 02 May 2026 09:29:48 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:8635:4fc6:d16e:90be])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-44a986aac01sm11971926f8f.31.2026.05.02.09.29.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 May 2026 09:29:48 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 11/62] gn: upgrade to latest revision
Date: Sat,  2 May 2026 17:28:31 +0100
Message-ID: <20260502162929.1377831-11-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260502162929.1377831-1-richard.purdie@linuxfoundation.org>
References: <20260502162929.1377831-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Gm-Spam: 0
X-Gm-Phishy: 0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 02 May 2026 16:29:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236320

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/gn/gn_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/gn/gn_git.bb b/meta/recipes-devtools/gn/gn_git.bb
index 8d2c0821a0d..d2f61c2098f 100644
--- a/meta/recipes-devtools/gn/gn_git.bb
+++ b/meta/recipes-devtools/gn/gn_git.bb
@@ -7,7 +7,7 @@ DEPENDS += "ninja-native"
 UPSTREAM_CHECK_COMMITS = "1"
 
 SRC_URI = "git://gn.googlesource.com/gn;protocol=https;branch=main"
-SRCREV = "ec56d4d935a0e2ab9d52b88dd00c93ec51233055"
+SRCREV = "eab8a9f92dca9b8548a89d9e5eb6aeb8ac6bba77"
 PV = "0+git"
 
 BB_GIT_SHALLOW = ""

