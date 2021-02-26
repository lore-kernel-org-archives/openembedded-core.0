Received: from mail-io1-f51.google.com (mail-io1-f51.google.com [209.85.166.51])
 by mx.groups.io with SMTP id smtpd.web08.9838.1614349571959110529
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Feb 2021 06:26:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=U0OXLdub;
 spf=softfail (domain: sakoman.com, ip: 209.85.166.51, mailfrom: steve@sakoman.com)
Received: by mail-io1-f51.google.com with SMTP id n14so9793133iog.3
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Feb 2021 06:26:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=VMr3sE1RVH5nTQ7ONSftZ+RiZ5EJEz1rWTis+UpdqBc=;
        b=U0OXLdubC6P1T8oA/vju2SR/3DdCpaEOlMlSVgbbNg25S4emBkz2kXTzhld4bHjhGi
         6zAt6wY+pe/ABDJTSFN4MwAlchTRUehgrmZxMgYJOsCCksGvCKJzdula5dqT6r0NlAlq
         fARWayqLEge23Px0L4YNunDRkevZ0teyYFUXzJktdDTu6o3jbUQjzssNaQYHYr4sQB4B
         5c4/siGjUAGh57ptUQ6uYDRIKtkMCdJNrqMWeHHe/i+6XA0HxcE9KhlXqS1ijf+G6FYd
         9uspqcgueAIudB35lB2vkMt00AHuPS6lX+6FG3XJR8o/hYinvaQ+3yak4zusQA8MO+gs
         PCSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VMr3sE1RVH5nTQ7ONSftZ+RiZ5EJEz1rWTis+UpdqBc=;
        b=VFQYP0im7w0vHldcLUQrAmX1Pwm+BnPE1JGgzI6JZOwNAx36FO3AqkZ3G1OYqWashZ
         hZQxU050PzURAzUT36aE73e4+i1Ug1PhVtCbyDBIy6J9WdSNNdzGq2Av8p3P65OFZtUc
         ncsIron0+3vifC+4MTV5sbQ0JY5Mt5jwjaWil035z5SxcWaVMLvsV2wQGNqy6Lw5w1CJ
         Hp4NMAszP9NqB1n1Kzkwrt3F4Zi2MpyZAPONmlnu0Oik4ruEwfQA+lUpe/fJ+n+cFHTK
         chNKec3C/dGIZwaDhNx4SxdlJJUADhy4uT6Dm/MHz7/aV+cnBP3/pZ7kRy37KCWX2TAz
         rdxg==
X-Gm-Message-State: AOAM530Y+Pe7GIMhffVYqARiLCgifT3Lr2mjYAlEDNXUVYXs9LM5PZom
	qOxT8EpFxGCoyWIVwQr7+FuI/GLaF3XWmylY
X-Google-Smtp-Source: ABdhPJznXjK4nndAlzE622SXJEimmwunXwx1iRw5kYQ7xFeJ9qP3moqIt9tehJ2v9T/oWY2I3ShzTg==
X-Received: by 2002:a05:6602:314b:: with SMTP id m11mr3055529ioy.158.1614349570899;
        Fri, 26 Feb 2021 06:26:10 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([72.173.249.164])
        by smtp.gmail.com with ESMTPSA id i3sm5383377ioq.13.2021.02.26.06.26.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Feb 2021 06:26:10 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 14/40] quilt: Be determnistic about column presence
Date: Fri, 26 Feb 2021 04:23:57 -1000
Message-Id: <729102f0cf6ac0914a992a1199dd4ecca1e28853.1614348990.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1614348990.git.steve@sakoman.com>
References: <cover.1614348990.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

I've seen local differences in the quilt output depending on whether the column
binary was available in the sysroot. Fix determinism issues by being specific
about configuration.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 0cd5fba8634bcc679518f98cc25be66a51081372)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/quilt/quilt.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/quilt/quilt.inc b/meta/recipes-devtools/quilt/quilt.inc
index d6d06c049c..d7ecda7aaa 100644
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
2.25.1

