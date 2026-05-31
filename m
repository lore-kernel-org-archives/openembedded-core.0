Return-Path: <tim.orling@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0874ECD6E59
	for <webhook@archiver.kernel.org>; Sun, 31 May 2026 00:18:25 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16959.1780186702249823028
 for <openembedded-core@lists.openembedded.org>;
 Sat, 30 May 2026 17:18:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=s2IYMpcD;
 spf=pass (domain: konsulko.com, ip: 209.85.214.177, mailfrom: tim.orling@konsulko.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2c0c32f6ce1so1444985ad.2
        for <openembedded-core@lists.openembedded.org>; Sat, 30 May 2026 17:18:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1780186702; x=1780791502; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cTZoPYX6FqWm6t13qpibYJc/o89vEKX08WN1s4DHbNc=;
        b=s2IYMpcDHeg5CyOHIrrKCH9QxiTOcSfrI17gjZxVC9KZsRB/5tzw1S6d7WeVeGMiwH
         3Tu0F73I8rvbA//GyqQlQ4jwqJ4ZV6QuPzIiDv0hZLIZHwLBKtsoeHauaCyHeB7hCAsS
         +RUy789wk3xxA0W7S0yY7Y1Xph+3URKy3469k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780186702; x=1780791502;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cTZoPYX6FqWm6t13qpibYJc/o89vEKX08WN1s4DHbNc=;
        b=YpPvfQUc9v8voE5+V6KYBWuqJoMkROplbDEuZ3MM8eSts2HNG1wtSS2HjKdPSrXsNx
         jOvdd4XSA92w3rTwuc2fzji00TPoGLkJw6S6SMWXVRZjLYHWxnYJMATnz9Z7e2rB/lkT
         LPjWVBym9CIXegjqtj50rFzfBFpoa7J2UxVzUFv0wNZhC3C5ycO5LiIKgeov50OmcEhW
         hMhQFqyj7wi+bTcTaOEzE4YdoFy7hMy1ITyjN9iVWdpSJ6bFBCS6qfkQ+7eTIAP7luC4
         sLaqkwva0PDjxi3PYoHPizCea0ZRaEDz4U3zv7El5abN/g407uRgI/ymwAoFdLjJbmzd
         UgkA==
X-Gm-Message-State: AOJu0YwC0Qlg4MbdkPnCQGfad/yhY8HGRDhWIiuYYTywrguzsNTgoE9Z
	kXqp5dT5blovK5QfZjQAtkmI1Eh97j6bQUvlIHiJlqhzGUiy+KPQFULuq0sSRSWrjQ8lBaeRvkt
	mfQ/y
X-Gm-Gg: Acq92OEc9n/UPb6LzGjKzXfI5umsApmLg9LA5xPwjlwsiGq/vbDrkS+e88ugJZ/w3MW
	/C4Hns9V/OWNk0aejWWkFiodXNezqfiImycbcSVTBpg9t+puTwEDGCWq8BL7AkQ6GBW9H/bkx+s
	U5Irgilw2uCzzXOynUr9gX0ypMJMDL+ACLMuIq+rdL3HQ+BVEXOV+ibHvAamotvLVff32eT/8rq
	e575MQ6SnPv8gFVWgbU8U1gLFbCRQUBsjiT1XKfDt3lEgoLkWnE2GmQs54e++3N+52nkLnWUOsg
	63TFL4qbR6A+Y1Ct5I+LsaujeH6DOGTBER8RgqTTQQkBYMI6ZPPQpG6HJ6DUKNxPdBmFg/7FjLf
	BAjFoF4917APPiHMXjHw8I3YpO4EhbiE5tmoasGu9w1glQ/hIKDqB4i4sup5sTv/JbZ3rsWvA8X
	w2KrAlznImRbFVB6mnSc+NkO0IJgUFLl+eq+r0OLyjNj+beBavyUnBAA99jU2Ts30TLR4th8+rN
	w==
X-Received: by 2002:a05:6300:668a:b0:3b1:6649:e524 with SMTP id adf61e73a8af0-3b428287984mr5379787637.33.1780186701700;
        Sat, 30 May 2026 17:18:21 -0700 (PDT)
Received: from localhost (c-98-232-159-17.hsd1.or.comcast.net. [98.232.159.17])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84214b26c99sm7021645b3a.14.2026.05.30.17.18.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2026 17:18:21 -0700 (PDT)
From: tim.orling@konsulko.com
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH 8/9] python3-wcwidth: upgrade 0.6.0 -> 0.7.0
Date: Sat, 30 May 2026 17:17:55 -0700
Message-ID: <20260531001756.1582306-8-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260531001756.1582306-1-tim.orling@konsulko.com>
References: <20260531001756.1582306-1-tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 31 May 2026 00:18:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237787

From: Tim Orling <tim.orling@konsulko.com>

Changes [1]:
* New support for kitty text sizing protocol (OSC 66) in width() and
  clip().
* New clip() parameter control_codes='parse', 'ignore', and 'strict'.
  clip() is now able to clip OSC 8 hyperlinks and OSC 66 text sizing
  sequences.
* Improved clip() and width() to support horizontal cursor sequences
  (cub, cuf, hpa). Cursor-left (cub) or backspace (\b) now overwrites
  text. column_address (hpa) and carriage return (\r) are now parsed,
  and more values conditionally raise ValueError when
  control_codes='strict'.

PR's:
* Remove docs, add utils by @jquast in #209
* Bump requests from 2.32.5 to 2.33.0 in /docs by @dependabot[bot] in
  #210
* Bump pygments from 2.19.2 to 2.20.0 in /docs by @dependabot[bot] in
  #212
* dependabot nonsense by @jquast in #215
* Expand terminal escape sequence for three more ECMA-48 "families" by
  @jquast in #214
* Improve clip() and width() with hyperlinks and overtyping by @jquast
  in #216
* Improve width() and clip() with kitty Text Sizing Protocol by @jquast
  in #213

For a full comparison of changes, see [2].

[1] https://github.com/jquast/wcwidth/releases/tag/0.7.0
[2] https://github.com/jquast/wcwidth/compare/0.6.0...0.7.0

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../{python3-wcwidth_0.6.0.bb => python3-wcwidth_0.7.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-wcwidth_0.6.0.bb => python3-wcwidth_0.7.0.bb} (84%)

diff --git a/meta/recipes-devtools/python/python3-wcwidth_0.6.0.bb b/meta/recipes-devtools/python/python3-wcwidth_0.7.0.bb
similarity index 84%
rename from meta/recipes-devtools/python/python3-wcwidth_0.6.0.bb
rename to meta/recipes-devtools/python/python3-wcwidth_0.7.0.bb
index 874b30b7dd..cd5e40b080 100644
--- a/meta/recipes-devtools/python/python3-wcwidth_0.6.0.bb
+++ b/meta/recipes-devtools/python/python3-wcwidth_0.7.0.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/jquast/wcwidth"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b15979c39a2543892fca8cd86b4b52cb"
 
-SRC_URI[sha256sum] = "cdc4e4262d6ef9a1a57e018384cbeb1208d8abbc64176027e2c2455c81313159"
+SRC_URI[sha256sum] = "90e3a7ea092341c44b99562e75d09e4d5160fe7a3974c6fb842a101a95e7eed0"
 
 inherit pypi python_hatchling ptest-python-pytest
 
-- 
2.43.0


