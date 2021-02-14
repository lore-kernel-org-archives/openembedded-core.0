Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web12.17425.1613314201183778896
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Feb 2021 06:50:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=F4AKZfwK;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f46.google.com with SMTP id l12so5578945wry.2
        for <openembedded-core@lists.openembedded.org>; Sun, 14 Feb 2021 06:50:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9Im/D2jKlD5ZtOjo1XTflmWxDaCHzs1dcdphWXeCDkM=;
        b=F4AKZfwKc+uTxgFB7g3OoQDGtec1/hpreQzSCzgbijS63vu2qjs+WnIsfZ4cB0Z1Ut
         BTUEM6Uw4rXrgFDCVnEFnyXEV6FCP6TmNTDWKvTOOHhg60s/Pb3tWx4pvhzpJ9xzoTIm
         1GEYNmVK63SDGBbvlExnRNEEjWnG/SYfuNc38=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9Im/D2jKlD5ZtOjo1XTflmWxDaCHzs1dcdphWXeCDkM=;
        b=megv7//T665GhxtzyhEja62cZBxlaYAkIV7tFOOtoG0bNDaXaVUX4UydHftP8llz2x
         npHSsmUMsoTLL0JJwd90cyq3bVgJYxPEBbdwN6Cy3bToiBo+8wEp17C7qxCH5y1hYZ8j
         8CXfpaZugAcIjHPOe6fYXNB0K3U+68FW4nQs0FXGkc0tkxmuwZyVyp6RWKmE4oad7wUz
         dhfi1y1tpdv/shW9x8N4anEtbenPr3niZcpTkJ8R3dh/lnAoJr292xKe2djTA8+c1zjn
         RxkpyWF+X06RVLkUCRz+DqQIsFtWlKoPlj8q8mB+nXoLH5kyFYlr4I8zL2ptENRs7joD
         KGUw==
X-Gm-Message-State: AOAM5304W+uxJn0vF8eJhr4Ruk+4VGmDXP7QgjSfuzxUgS+1BGAxmJJ1
	GI6zgXSk8K06PgZlrWaTS8Te5WkCuWrR7Q==
X-Google-Smtp-Source: ABdhPJy8THmFDmqOSTgamK+18n6fgdtBUFES5J5C/M/WY3dW+qOovOyxX47x2PO2tdTRZ/dMeINfuA==
X-Received: by 2002:adf:dc8d:: with SMTP id r13mr14246023wrj.209.1613314199519;
        Sun, 14 Feb 2021 06:49:59 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:6c46:cb67:3902:3f00])
        by smtp.gmail.com with ESMTPSA id a186sm10710684wme.17.2021.02.14.06.49.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Feb 2021 06:49:59 -0800 (PST)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/4] vim: Improve determinism
Date: Sun, 14 Feb 2021 14:49:55 +0000
Message-Id: <20210214144958.1966826-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a couple of configure options to avoid determism issues in the vim build.
This can happen due to the addition of glib-2.0 to the native sysroot through
later task additions to the sysroot through indirect dependencies.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-support/vim/vim.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index 4d2886c19e2..1ea40e5e7f5 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -68,8 +68,10 @@ EXTRA_OECONF = " \
     --disable-gtktest \
     --disable-xim \
     --disable-netbeans \
+    --disable-desktop-database-update \
     --with-tlib=ncurses \
     ac_cv_small_wchar_t=no \
+    ac_cv_path_GLIB_COMPILE_RESOURCES=no \
     vim_cv_getcwd_broken=no \
     vim_cv_memmove_handles_overlap=yes \
     vim_cv_stat_ignores_slash=no \
-- 
2.27.0

