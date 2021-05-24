Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
 by mx.groups.io with SMTP id smtpd.web08.20625.1621847650134156028
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 May 2021 02:14:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=jGI1bz0P;
 spf=pass (domain: gmail.com, ip: 209.85.208.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f41.google.com with SMTP id i13so31085911edb.9
        for <openembedded-core@lists.openembedded.org>; Mon, 24 May 2021 02:14:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZTV0JMQyf3ljoRtIMZ9S6rC1J2ylrUG1pK50oSSMJFg=;
        b=jGI1bz0PdWmkXtgBmMlX9QuZIs6L3HoBjjyGpqwtBlt6lVKOcDI827GtuZ8CktT2pI
         R317rOzPkttYYuzQmsa5eYypxzuKQwJNecpHn/TwhhxRt1fLxuQZqHgfiqnEhVzyr+l0
         SXNYSqriocbDKz+nBy7E4XAv8GgAeybr5q7Ap9nRFTeBVbrJ/2QOceynRJlJIRrdv55Z
         JNqevmRvf4xaZGJLj2OSmNK6Nd2ACy0mvk1GeW64zUz1kJvARQdE5GOJWlyI/1IfMUri
         TEa1P+wmJ2CncHl8rQqJ5jKLL3fBNhZj03Jyqg0CigUwSb2tEkGa7afn3MbBiFiuUOsD
         RHng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZTV0JMQyf3ljoRtIMZ9S6rC1J2ylrUG1pK50oSSMJFg=;
        b=GZxGYGOkRe6Ln6/WZq1kHyUTQLFQxTc69v5tFYkiOaLD62tABzAPHilT4FMROYHlIr
         rYU8/WRzf+TCXtqQVdPWEOCasp/SYfiObGgP9qTI69A+0NvVDF6ydqnhLdK0+2LfxE5b
         2knhrcnFEr/MezplFXARPxuRVKX85y3vOBr7m7WbcAKts7ZMxPOiuxVaASHXhSlMWQ9U
         Mo80eA9AtHXNYdwSWeUi9+6UmK52/7M5sfTAgxPmjdypielGyfE9PwvFkFGw1vPyx9cK
         0swqU4B5oE09LSeXD+xW2BiWFgcMH1mqdNBL5XPuLqh1/TI6k6l1huKC5YSJ3HNEttdi
         8AFA==
X-Gm-Message-State: AOAM53335pffpKQluzYpa6zBGKezVvG3G08A1JTCEBjJTk1CmDERb5oh
	DAFnLej7kRPs3MVwEK1G/lIEiDahAfI=
X-Google-Smtp-Source: ABdhPJwOxnh6tIverKcjGOsfxZ7cIkUfbsYvqKyi6SvGNQOtIrgR+GCsX0rOszU2KZdiviFuq2PCvA==
X-Received: by 2002:a05:6402:2793:: with SMTP id b19mr24077460ede.191.1621847648810;
        Mon, 24 May 2021 02:14:08 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id h9sm8673490ede.93.2021.05.24.02.14.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 May 2021 02:14:08 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 08/21] gnomebase: trim the SRC_URI directory from the back
Date: Mon, 24 May 2021 11:13:34 +0200
Message-Id: <20210524091347.419253-8-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210524091347.419253-1-alex.kanavin@gmail.com>
References: <20210524091347.419253-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rather than take the first two components, drop the last one at the end.
This makes it compatible with both old and new gnome version schemes.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/classes/gnomebase.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes/gnomebase.bbclass b/meta/classes/gnomebase.bbclass
index efcb6caae1..884b1a106f 100644
--- a/meta/classes/gnomebase.bbclass
+++ b/meta/classes/gnomebase.bbclass
@@ -1,5 +1,6 @@
 def gnome_verdir(v):
-    return oe.utils.trim_version(v, 2)
+    return ".".join(v.split(".")[:-1])
+
 
 GNOME_COMPRESS_TYPE ?= "xz"
 SECTION ?= "x11/gnome"
-- 
2.31.1

