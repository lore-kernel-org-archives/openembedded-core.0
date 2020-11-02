Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web10.28539.1604306743466771692
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Nov 2020 00:45:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Z0Y0MXIW;
 spf=pass (domain: gmail.com, ip: 209.85.218.53, mailfrom: toertel@gmail.com)
Received: by mail-ej1-f53.google.com with SMTP id o21so10732124ejb.3
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Nov 2020 00:45:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=AXxD8BxGBmFysTqnecDmSs2TdCiXuRgz+OoKMVPCPGM=;
        b=Z0Y0MXIWruBNR/8pZB5OXiBTKIEhBEPjkHLhCOFgWQ+a5SBpvO4bSznAM8MPbFtfJ+
         wlXvsLfE2X9w+F9AH6HuQEcse0ndarDh4na1OGBcPo1fijfYWjnWdAiPlFqRcR3EN82i
         0DCYaeUFrP4z3iIIhG+FSP6RPbvuTqQCsUdHi/gC79bQxJdHQ3owwf4uVrXPqWsg/NwN
         lYxMpUa/XUVpCg6MYgL0b4pIr9FGOYIkW7caFh9eGvFgWts/zp4TSZ0dnaOfkT0HQ5M0
         Hsi8NVh3+IGfgRc6M3i6u6RcKFLvrZLfK/+Kk6E3wcxLI2UBzokKYg3WJ/r3baUHdGHh
         /cQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=AXxD8BxGBmFysTqnecDmSs2TdCiXuRgz+OoKMVPCPGM=;
        b=X11m8VCWYNDFVVAkk9GHE+HbRcCAn4yRRDA4l9nNgjgbQBPQY9/t/h73ARvR5WayYX
         +WylIJUsNHqRWMBNM4Da1bIg8j3H0A2ajycmd7LhdnJJ+eiG24SQxaVHcTvz2jSOOD5Q
         E13doh8MxFUyZOsjsmeXc49E7HSZi+MCp4kOiSnUURa6Py3uEIDZN7uY1vaO124UcKcT
         Jg8CFhCWFUtBA+jGJ71aGtJxW54hFkpnz/FikfjT0a8oQXIQCj++cu3pBL2g01qFTqMl
         51z/8JbUedMjYlN2jIg82QuS+AOI02O3y2pEBv6VTmsYH6zMAJL/5L2KbR59wfmmIqNA
         PUIw==
X-Gm-Message-State: AOAM532ceMRJetqt9YGCVLe7kclmge79M0FkcnhklxFBmHZZIiW6jfoY
	VUpw8Z+FyEw8dhYz9CjxiJjbdneH40HS0A==
X-Google-Smtp-Source: ABdhPJzcCpeotKCseCbggQKstCW4+lW9kPfU2e4LTLl+VQMe5b4wBykeFheBsMcaWk/v9ISfw1Chew==
X-Received: by 2002:a17:907:644:: with SMTP id wq4mr14146506ejb.234.1604306741723;
        Mon, 02 Nov 2020 00:45:41 -0800 (PST)
Return-Path: <toertel@gmail.com>
Received: from gigabyte.fritz.box (p200300cfaf2f4a0005ab6f8a57512e19.dip0.t-ipconnect.de. [2003:cf:af2f:4a00:5ab:6f8a:5751:2e19])
        by smtp.gmail.com with ESMTPSA id t5sm10055091edw.45.2020.11.02.00.45.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2020 00:45:41 -0800 (PST)
From: "Mark Jonas" <toertel@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Mark Jonas <toertel@gmail.com>
Subject: [PATCH 2/2] libsdl2: Fix directfb SDL_RenderFillRect
Date: Mon,  2 Nov 2020 09:34:40 +0100
Message-Id: <20201102083440.28814-2-toertel@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201102083440.28814-1-toertel@gmail.com>
References: <20201102083440.28814-1-toertel@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Refactoring of SDL2 internal API has broken SDL_RenderFillRect for
DirectFB. The problem has already been fixed upstream.

Signed-off-by: Mark Jonas <toertel@gmail.com>
---
 .../libsdl2/directfb-renderfillrect-fix.patch | 33 +++++++++++++++++++
 .../libsdl2/libsdl2_2.0.12.bb                 |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta/recipes-graphics/libsdl2/libsdl2/directfb-renderfillrect-fix.patch

diff --git a/meta/recipes-graphics/libsdl2/libsdl2/directfb-renderfillrect-fix.patch b/meta/recipes-graphics/libsdl2/libsdl2/directfb-renderfillrect-fix.patch
new file mode 100644
index 0000000000..83d4f4b1ec
--- /dev/null
+++ b/meta/recipes-graphics/libsdl2/libsdl2/directfb-renderfillrect-fix.patch
@@ -0,0 +1,33 @@
+# HG changeset patch
+# User Sam Lantinga <slouken@libsdl.org>
+# Date 1590793369 25200
+# Node ID a90089f75990e8b07a1dcf931c5f8a580ae343bf
+# Parent  a9b4bd264f3cbedc4f3287b3ec6b32311370ba85
+Fixed bug 5146 - SDL_RenderFillRect doesn't work in DirectFB
+
+Lacky
+
+It looks like refactoring of SDL2 internal API has broken SDL_RenderFillRect for DirectFB. In new version function SDL_RenderFillRect returns 0, but rectangle is not visible.
+
+Replacing "count" with "len" in the argument list for SDL_memcpy in DirectFB_QueueFillRects fixes problem.
+
+--
+
+The patch was imported from the libsdl Mercurial repository
+(https://hg.libsdl.org/SDL) as of changeset id a90089f75990.
+
+Upstream-Status: Backport
+
+Signed-off-by: Mark Jonas <toertel@gmail.com>
+
+diff -r a9b4bd264f3c -r a90089f75990 src/video/directfb/SDL_DirectFB_render.c
+--- a/src/video/directfb/SDL_DirectFB_render.c	Thu May 21 00:06:09 2020 -0400
++++ b/src/video/directfb/SDL_DirectFB_render.c	Fri May 29 16:02:49 2020 -0700
+@@ -626,7 +626,7 @@
+     }
+
+     cmd->data.draw.count = count;
+-    SDL_memcpy(verts, rects, count);
++    SDL_memcpy(verts, rects, len);
+     return 0;
+ }
diff --git a/meta/recipes-graphics/libsdl2/libsdl2_2.0.12.bb b/meta/recipes-graphics/libsdl2/libsdl2_2.0.12.bb
index 8ecf161f69..0b75eb0c1d 100644
--- a/meta/recipes-graphics/libsdl2/libsdl2_2.0.12.bb
+++ b/meta/recipes-graphics/libsdl2/libsdl2_2.0.12.bb
@@ -19,6 +19,7 @@ PROVIDES = "virtual/libsdl2"
 SRC_URI = "http://www.libsdl.org/release/SDL2-${PV}.tar.gz \
            file://more-gen-depends.patch \
            file://directfb-spurious-curly-brace-missing-e.patch \
+           file://directfb-renderfillrect-fix.patch \
 "
 
 S = "${WORKDIR}/SDL2-${PV}"
-- 
2.25.1

