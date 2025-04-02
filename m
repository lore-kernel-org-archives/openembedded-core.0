Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9028C3601A
	for <webhook@archiver.kernel.org>; Wed,  2 Apr 2025 07:11:07 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web11.2137.1743577863258533758
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Apr 2025 00:11:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=D3SMvEbC;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43690d4605dso43233415e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Apr 2025 00:11:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1743577861; x=1744182661; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=phpNmo7omEyFEd0IGqF1PkdRlIa4jqgfr4ucSp+9gO8=;
        b=D3SMvEbCYgPtcOSK1P0rgXnqk2qRkf95ln3jSlTGZSApbllngUKUAMYQoZCCN4y/uW
         yLOnQ3zGD0NFmj34k5TNT0PMYgDvAvPO3PWh5kI8UZ+1LgyCtDbdvoudgEo7V2LFNMxn
         PaAIQXGZmOLv1Fu5qfMvmsnAH78xansV9kJ10=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743577861; x=1744182661;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=phpNmo7omEyFEd0IGqF1PkdRlIa4jqgfr4ucSp+9gO8=;
        b=vDnoTxryu2O8YfvlGyn5N+bMLWvWIGgVRVCtxvZTG6a6suJvKhlPHddRp1mhEbPqiS
         5ohEMC30VHRBs/RwRe8aiYMYdTCnl4JVp6nSv403RlZmQu4+D2gQxkPpIvwpmZHkY1eN
         jHACq/Vn5YYD35OIIvK1V4PiLd3+kPEOD1q3jmQqXaBZ0WtXxsKWOG3LAUdXWdKUCn6S
         eGpEEyz5n845WYjc69KNelX/wdFa57YUzfUc9c5EorqkTyh32zxc/Hlyxz+LYTsVhM/l
         rfAClnkFY1uXM5jTs2lRzkLla14M7LZUGHEM6e0yvOH4+KEynPMAJPhQWHDcJFdD44TC
         W74Q==
X-Gm-Message-State: AOJu0Yw/2Gm9tO/rkYQ/VF8QabSJMRc7x0SQ0maVL0Vua3vF+Ux/Gx64
	ZY2nqk6yfgFnEn36yEtjnuxAwEyRjo3uDmqk/Y7QGDc7pTg+wIWom80kRbO1lUiyBeesSU6aJiz
	d
X-Gm-Gg: ASbGncsozKKWMSPJp7pu+zrc6/DDS3qwHimWwHHAsRFQKn1yCGXqQZ/vPffrR8gFJai
	1JJq1bNnjd4qZFkTxaR183mG4IOW7ZHMncYYJGp89ZUvuT4eWHBgo+Gjyaip3rqv7kvmoQapU2w
	RtO+K/HqiOq3LIZU5lCQgUsaDb3lubvx42MBvkoz2W0mAHzusmPNIQUrvJWKNZzVw91K7aVmo1y
	65AVk0B+c5HLMz+I7WCP5gPv3B4ZAmBfiL5qdlVM9ttl8gU4cXRDl6Y1AuXSZwZZ2qD+eZF4wVz
	mB2HMbXydVLqjRAUpId/SEYeFuF5kcFCgB17TiEp3H0A+our6uZMvWbPgfsOoiWAJ9x5KfCPiA=
	=
X-Google-Smtp-Source: AGHT+IEyydo22EFJf4Si1JR4dXWAU/GZzXiNBxm9JqueXk8WNBrOLy4WBSbrMU5aBS/qjm/G2oUaHA==
X-Received: by 2002:a05:600c:26d2:b0:43d:bb9:ad00 with SMTP id 5b1f17b1804b1-43dd09fd197mr101303675e9.15.1743577861256;
        Wed, 02 Apr 2025 00:11:01 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:24b8:b374:749c:8558])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43eb6103a07sm11344385e9.29.2025.04.02.00.10.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 00:10:59 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 17/48] libinput: upgrade 1.27.1 -> 1.28.1
Date: Wed,  2 Apr 2025 08:09:46 +0100
Message-ID: <20250402071017.2157620-17-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250402071017.2157620-1-richard.purdie@linuxfoundation.org>
References: <20250402071017.2157620-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Apr 2025 07:11:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214190

Add tag to SRC_URI to verify SRCREV.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../wayland/{libinput_1.27.1.bb => libinput_1.28.1.bb}        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/wayland/{libinput_1.27.1.bb => libinput_1.28.1.bb} (95%)

diff --git a/meta/recipes-graphics/wayland/libinput_1.27.1.bb b/meta/recipes-graphics/wayland/libinput_1.28.1.bb
similarity index 95%
rename from meta/recipes-graphics/wayland/libinput_1.27.1.bb
rename to meta/recipes-graphics/wayland/libinput_1.28.1.bb
index 04a03f08074..c10422bf9be 100644
--- a/meta/recipes-graphics/wayland/libinput_1.27.1.bb
+++ b/meta/recipes-graphics/wayland/libinput_1.28.1.bb
@@ -12,10 +12,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=bab4ac7dc1c10bc0fb037dc76c46ef8a"
 
 DEPENDS = "libevdev udev mtdev"
 
-SRC_URI = "git://gitlab.freedesktop.org/libinput/libinput.git;protocol=https;branch=main \
+SRC_URI = "git://gitlab.freedesktop.org/libinput/libinput.git;protocol=https;branch=main;tag=${PV} \
            file://run-ptest \
            "
-SRCREV = "3aa004b96488bf0b2446c11b97a7f8a75ff37c23"
+SRCREV = "4f7b4ef0e4eb5d569df36be387579858eba349bb"
 S = "${WORKDIR}/git"
 
 UPSTREAM_CHECK_REGEX = "libinput-(?P<pver>\d+\.\d+\.(?!9\d+)\d+)"

