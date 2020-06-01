Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web12.38005.1591020727355878487
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jun 2020 07:12:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=v1j3VVVi;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.48, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f48.google.com with SMTP id nm22so4482614pjb.4
        for <openembedded-core@lists.openembedded.org>; Mon, 01 Jun 2020 07:12:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=rxJo8eSP9w+8yzW27Qm4yCRWjy8bhZWnlJ9IwZjgfec=;
        b=v1j3VVViMJfrF/99O832gdq9jQmWSyCviHCl/Pq5MdAf2/xlb3mdY7Xw1SJcy/ghhf
         3GqseMj+w4ilgi/Bx745d5lAElFMd7+QSzid4XI7jnIXE7XWeTlBL6hbbaKQFUkDm2gu
         JQNkW7+MwM/58y6RfIGu9ujO/LmnU/EZNhE7haqgi0PPN5aFrMU2z3495oG3xdGko/pT
         iXfu/B5D0kE/ihd41CLOSu13wedDaHBrbuvQchNpJ+KnZZw+754jxe3hTvSXUtBZs3SF
         W8HiZQk7TSeb9X8XaMj37CE3DlIbD6tP9dqBFR6iH4OoPwzBzUg0RCoTsMK793+JLX9N
         kDuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=rxJo8eSP9w+8yzW27Qm4yCRWjy8bhZWnlJ9IwZjgfec=;
        b=l/+AJj2aF3wpF0yCfczNEymoVfNI9eefINNtO+iDrL9yD0XP2topPpCZbavJj9TzUw
         Gt9lGkRm+pr31W1WThm2LzPPyXyICJecsLf4NQX4/IGjdclRBdejEd311v5AmWE4oylq
         NWuSuMieu5h+V6HnO5nc9rJjIijfE9GFdVmddSa9l6AW+ao3U4HPaQfXJQifkDs2XtyC
         Ghqo1ALhtj0EyaTOCQffTLBABMqLGLeYsIHwz/dl/vbXRksRo6WXsAQHKpGXmVldqgNq
         QDuL/hQKs7M4hWPh140oF+cNbGlYJrofkada8twpDKqOen2syr97zajOKTnYKduZQoqy
         4txg==
X-Gm-Message-State: AOAM532hifyZow/sGSvJijVcSDeWlbIgVMQRq0mGpyPFfO6qShUAfpGx
	xaB5ZtgBUSRdDFK9jTX93h3P+V4J1A0=
X-Google-Smtp-Source: ABdhPJznzUI7A7uceWpkuGd63KvJvBHmEfbAuxypSg1i5ql/a+c1SYW7Ols60gGdCJ1fK7pLLX1bFw==
X-Received: by 2002:a17:90b:888:: with SMTP id bj8mr23540077pjb.148.1591020726415;
        Mon, 01 Jun 2020 07:12:06 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id u19sm5509859pfk.98.2020.06.01.07.12.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2020 07:12:05 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 08/16] terminal.py: do not stop searching for auto
Date: Mon,  1 Jun 2020 04:11:16 -1000
Message-Id: <5ca00faa9c085fef1781b66561de461e9cc5b117.1591020366.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1591020366.git.steve@sakoman.com>
References: <cover.1591020366.git.steve@sakoman.com>

From: Joe Slater <joe.slater@windriver.com>

If a terminal fails to spawn() we should continue looking.
gnome-terminal, in particular can be present but not start.

Signed-off-by: Joe Slater <joe.slater@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 6e4babdeee38d32002a4c9129e77466ae4156dd7)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oe/terminal.py | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oe/terminal.py b/meta/lib/oe/terminal.py
index a1daa2bed6..eb10a6e33e 100644
--- a/meta/lib/oe/terminal.py
+++ b/meta/lib/oe/terminal.py
@@ -207,7 +207,10 @@ def spawn_preferred(sh_cmd, title=None, env=None, d=None):
             spawn(terminal.name, sh_cmd, title, env, d)
             break
         except UnsupportedTerminal:
-            continue
+            pass
+        except:
+            bb.warn("Terminal %s is supported but did not start" % (terminal.name))
+    # when we've run out of options
     else:
         raise NoSupportedTerminals(get_cmd_list())
 
-- 
2.17.1

