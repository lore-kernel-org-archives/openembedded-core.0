Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2668EC3DA4A
	for <webhook@archiver.kernel.org>; Sun, 16 Mar 2025 16:13:13 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web10.31823.1742141587752178577
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Mar 2025 09:13:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=GroJwDT5;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43cec5cd73bso7713665e9.3
        for <openembedded-core@lists.openembedded.org>; Sun, 16 Mar 2025 09:13:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1742141586; x=1742746386; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WBAzvuMslorgFUpftQVdbc0uIIXbAuB93rMcdcYUH+E=;
        b=GroJwDT5ZQoQRoz4xs/Au1pXKecnGZWWylDdm5JFqrIaimCBhzDkCsDHkVrUbb9YFw
         cy9QerJkFLe9y82DDmAu9KWNk7+E/z67JXoovfGnb8heyOrWcinxmaMD0iyZAbz5SUXz
         Qtii7bMIbQ4nMXCrE1dKEFkzBXFfYHjDXsXew=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742141586; x=1742746386;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WBAzvuMslorgFUpftQVdbc0uIIXbAuB93rMcdcYUH+E=;
        b=Zx3hEjI2LJ2B7SjNDAbMHcfeEVt12a99DXU3HIQF6ER0Mrw3zPImM/VdH+tR3DMb8L
         hb855c8vSB2doaWoM0nHvqgbgJgdTK6VqJzkUa/fmQj4qnMWlMBI/1OVNkEWl17V2TrL
         kS3654KVD+FoiVNYO8vo5f/WOeC5hUCmfY81qzO2YRWQaFsJImJQvEg4/HpAc02RtZLG
         ILI3ITzmGwjFGMPqPOAxVKxT4Nmg72Ka/WGUHhHTc5VrRYJmwF4W8Cjf1aIBh/WKPZ0o
         9r0l8AIavNzO8ATCYGWL/yqCpFnimvUEuON0Va7wof1166s0WS3hzW0sRV9yARK0hcWW
         GG+Q==
X-Gm-Message-State: AOJu0YymroKOayqX4DjKBWdDC4LG/VWEE/Q55sWNETJ3+By5O2hV6F2s
	YgGtwLq7zn75xfMzhoYM2cyLXtGie7c/86On7rlSrbrrAnafmzlb0u2XXDjx/pU4ZxRJyvprbc3
	d
X-Gm-Gg: ASbGncseEXVUzzb+6YGYe8enOj0aCExBYDXrYNxM0k/46MMYT9pNRUgX1kWUrexbOia
	jNvU6CVcAG8D6LYE6AMgDIE7ukh8aiGI2enoKNtdjl8AU+I71m8+bylqiGtO2+ymQzIX0FOvsX3
	oGcNCyw3nraGIDH6kBHWNFLBFGo1u5EgtovXpyrPhCuckH6tSeOrXqEzIElzzNywGWN83IvobOP
	CSZ4+NlPz3hltyuaONlXFWSbS1/Bjo6vvPaQGlHk+Ck1E5hrBRKX1HfJJXC5AwZuALlFqkAthOt
	HPHCX9+HQhOJ85SyEX+WiHWCO6PDg20bRTVGRlahJ/d5NUCfGve/r3Lz9RU9MZF2toWwPhZDGA=
	=
X-Google-Smtp-Source: AGHT+IGznNfXWFhE2R/XTbCc/fng+aqWJiI2xxHgIYeFWOshq6vpUNyHFIrTB9fJSnK42jyX+pqX6Q==
X-Received: by 2002:a05:600c:1c9f:b0:43c:f8fc:f686 with SMTP id 5b1f17b1804b1-43d1ec62883mr105072535e9.3.1742141585678;
        Sun, 16 Mar 2025 09:13:05 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:bead:7cef:d139:9ec0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d200faebbsm80252225e9.30.2025.03.16.09.13.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Mar 2025 09:13:04 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 38/43] libsm: Upgrade 1.2.5 -> 1.2.6
Date: Sun, 16 Mar 2025 16:12:04 +0000
Message-ID: <20250316161209.3629986-38-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250316161209.3629986-1-richard.purdie@linuxfoundation.org>
References: <20250316161209.3629986-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 16 Mar 2025 16:13:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213041

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../xorg-lib/{libsm_1.2.5.bb => libsm_1.2.6.bb}                 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-lib/{libsm_1.2.5.bb => libsm_1.2.6.bb} (91%)

diff --git a/meta/recipes-graphics/xorg-lib/libsm_1.2.5.bb b/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb
similarity index 91%
rename from meta/recipes-graphics/xorg-lib/libsm_1.2.5.bb
rename to meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb
index 52cca2bcd7a..d7243c15a21 100644
--- a/meta/recipes-graphics/xorg-lib/libsm_1.2.5.bb
+++ b/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb
@@ -22,7 +22,7 @@ PE = "1"
 
 XORG_PN = "libSM"
 
-SRC_URI[sha256sum] = "2af9e12da5ef670dc3a7bce1895c9c0f1bfb0cb9e64e8db40fcc33f883bd20bc"
+SRC_URI[sha256sum] = "be7c0abdb15cbfd29ac62573c1c82e877f9d4047ad15321e7ea97d1e43d835be"
 
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
 PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"

