Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web08.17599.1613314201613711249
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Feb 2021 06:50:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=h39P0D68;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f49.google.com with SMTP id t15so5481276wrx.13
        for <openembedded-core@lists.openembedded.org>; Sun, 14 Feb 2021 06:50:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=2L/LRwigQCI7k1uSRWtTsueCkDTwr5turr7vh0kxQAA=;
        b=h39P0D68CuPzV1S5Uz5hbD9vm85AkifApoaFuBY6QVueBL+as2TIht3AK7Oyr38Jo9
         TIv8f+PnoeI8lwzcpl69AJq3E4cFb1ZkrAN50OmISU0KtOC9zXvefQFc3PiBeHqbDX7z
         Bowqq0mu6QmcltsA9cqEA9hN3k0UmshvpH37A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2L/LRwigQCI7k1uSRWtTsueCkDTwr5turr7vh0kxQAA=;
        b=fw+K3WeJI5k9LjEEoFvlVKsyNyaMzZrIq8g2x4jNBTpbnAs44Aw5KOjl4MsElez2Z3
         Glsy+hVlN7GgI94zISarQyAku0LnlMLBLSD5D4GHrcQ98brgT/CivWvu6p2Rnj5FBENY
         6hYbYSiaozacafWAlD6atBsi8/BFFfdnBUr7Q/fOTDJLcbWUHk+jD9ADrwaUoyI21T6u
         5ABV6M6EyQgCktjQVRFN74n/kWyd61/ZCLImybycPDhuvatKhkNC2/XUyExTNaupo90L
         UbkrUIfsuJQA174PfjhRdyBEA8P7dMpETa65lgzm+yukcgQwnRpMkPod9FZcqNj/+IFq
         sAsA==
X-Gm-Message-State: AOAM533dEz/CZKP4LQCuxh/agqTnjy7f1LXcv3QtFPB4wVe3NsdRr201
	gbI5e7ELAextc8rqsRBhZGqQ/2X1hYJRqw==
X-Google-Smtp-Source: ABdhPJxFuv8/0C41HZkUwNydDBU01WC3zMoVJUKJUD31xkQOAqoafvOQAQbG8Mxp9UQdsjvE8g8pnw==
X-Received: by 2002:adf:e40e:: with SMTP id g14mr13849051wrm.426.1613314200204;
        Sun, 14 Feb 2021 06:50:00 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:6c46:cb67:3902:3f00])
        by smtp.gmail.com with ESMTPSA id a186sm10710684wme.17.2021.02.14.06.49.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Feb 2021 06:50:00 -0800 (PST)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/4] quilt: Be determnistic about column presence
Date: Sun, 14 Feb 2021 14:49:57 +0000
Message-Id: <20210214144958.1966826-3-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210214144958.1966826-1-richard.purdie@linuxfoundation.org>
References: <20210214144958.1966826-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

I've seen local differences in the quilt output depending on whether the column
binary was available in the sysroot. Fix determinism issues by being specific
about configuration.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/quilt/quilt.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/quilt/quilt.inc b/meta/recipes-devtools/quilt/quilt.inc
index d6d06c049ca..d7ecda7aaa6 100644
--- a/meta/recipes-devtools/quilt/quilt.inc
+++ b/meta/recipes-devtools/quilt/quilt.inc
@@ -30,7 +30,7 @@ EXTRA_OECONF = "--with-perl='${USRBINPATH}/env perl' --with-patch=patch"
 EXTRA_OECONF_append_class-native = " --disable-nls"
 EXTRA_AUTORECONF += "--exclude=aclocal"
 
-CACHED_CONFIGUREVARS += "ac_cv_path_BASH=/bin/bash"
+CACHED_CONFIGUREVARS += "ac_cv_path_BASH=/bin/bash ac_cv_path_COLUMN=column"
 
 # Make sure we don't have "-w" in shebang lines: it breaks using
 # "/usr/bin/env perl" as parser
-- 
2.27.0

