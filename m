Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6C1BC4450B
	for <webhook@archiver.kernel.org>; Wed,  8 Jul 2026 11:40:35 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6245.1783510834582155374
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jul 2026 04:40:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=czj/3jk4;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4938d5f86f3so3709095e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Jul 2026 04:40:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1783510833; x=1784115633; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SOIRlRwDe6MexhfOy778ck8v2PjQXgWZQGveNRLcMqQ=;
        b=czj/3jk4YvB79jdZLofBULwkS0KkZplbmQOyc6aBFmWxLujonfWn/5TWC7uLev5UzX
         IpWrg3+YgnTtifhzteLV9NaBY9v4KQuMcNGIAigmpktFLb2aQZeGsgglkmJmhKAg/OB1
         1X9G2RO57WoBNNRnvnGa6XgzHNOJS9oHUq5tw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783510833; x=1784115633;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SOIRlRwDe6MexhfOy778ck8v2PjQXgWZQGveNRLcMqQ=;
        b=jR8nOmezb3u1yDU2hkOpm1cTANHVFUknvpQjPwv9XsB7yuZDY+iD/cVlpqoXczsNYt
         MgJxV1XcKIxM5Mx974oK9ay4H1g/jAQkUgbIG443YkKK7kdi7k5+3eJlxcMgYwC6Sle6
         dUuS92rHMuVVXIHstKDBl7TYmZlMj/NWEXqhivG/HLvjCZfrGDN0dizKqc/9Od4mkeLI
         21TeFnCDrgy/QawpQFxlAl67SvjKT/qF7nb0dCMZGMMVLK61m7OafhbiuiHXPJIR9Qwp
         ByD1f2l3fjIDS0aX18ZvSv0ywNMXovQaeV8ZlAQkWOurD9ijydaNoIJPbeixspO+8pZc
         9tkQ==
X-Gm-Message-State: AOJu0YztC6JsLjlvZHO3efG8bLxEdETKXJFpXvNiefXAvc/KTInqkV6a
	f6sexgW5PQp1iyz8zd8QEGqu1BZqWe8eJK4sma+bzYYe1ZGjnKo4b51pxI41qJAo6TzdzfKekUk
	DexjR22g=
X-Gm-Gg: AfdE7cnMndZe5dFXbYNbuagyojQZNmikjiA/IlG0kOqD6DBq/DynzqtooHk5GghSWio
	PTlBr4Aw/vlKLruFrag5uSl2u6EpU/Gri+CXSkBUMLEgeqQwAr9bxkBVGZxVEFOuMHJOvP5NrvI
	7EDKSAIp226obvK/IIo2Euri+75EPCRZ61HfMwuJ7S2kBSZaDxuGbdVR6oqFYac5bA3hoer+Fx8
	KlJshlhK7XCi7lXUUTboDLQKIi8+kif51XKv39TCbHSKNKVG952Ageck3t9JMF3wESw2GZN2Z4k
	DhbwZajafk221Puee7TazcElAbf1u7Yn0y0M07tuzvpxVgtpEA1iwTWi2fWSyEpyyuiLXbe2QuA
	g2yyza2uya75m68pRwJQ+TjumtshPJOX37YeH4aREgeuxnSIlgkOvYIQWLO5k9bT0VGw/Ms2545
	NVG6xvyYHKWhDP/KkbDyCP7RQn9ox5oiVATG/ycL08xA==
X-Received: by 2002:a05:600c:4fc9:b0:493:cbdc:7cd2 with SMTP id 5b1f17b1804b1-493e6368e4bmr21489475e9.3.1783510832798;
        Wed, 08 Jul 2026 04:40:32 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:b60a:b356:19ef:1131])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e0f51193sm131183165e9.12.2026.07.08.04.40.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 04:40:31 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 09/11] patchelf: upgrade 0.19.0 -> 0.19.1
Date: Wed,  8 Jul 2026 12:40:19 +0100
Message-ID: <20260708114021.3484868-9-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260708114021.3484868-1-richard.purdie@linuxfoundation.org>
References: <20260708114021.3484868-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Jul 2026 11:40:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240472

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/patchelf/patchelf_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/patchelf/patchelf_git.bb b/meta/recipes-devtools/patchelf/patchelf_git.bb
index 6ce77213537..6c88da1b098 100644
--- a/meta/recipes-devtools/patchelf/patchelf_git.bb
+++ b/meta/recipes-devtools/patchelf/patchelf_git.bb
@@ -6,9 +6,9 @@ LICENSE = "GPL-3.0-only"
 
 SRC_URI = "git://github.com/NixOS/patchelf;protocol=https;branch=master \
 "
-SRCREV = "1e279e99b952c765824fa0401abb8dc0d944e4ea"
+SRCREV = "7688b17c18d16f67fa8d5a82a2404c2e3a18648d"
 
-PV = "0.19.0"
+PV = "0.19.1"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=c678957b0c8e964aa6c70fd77641a71e"
 

