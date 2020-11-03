Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.web08.6802.1604421539462990927
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Nov 2020 08:38:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=U3mnjJvi;
 spf=pass (domain: gmail.com, ip: 209.85.208.45, mailfrom: toertel@gmail.com)
Received: by mail-ed1-f45.google.com with SMTP id w1so17883979edv.11
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Nov 2020 08:38:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=v3xXK+zgiflpM+C0ZHeAO6UAIHbdguOLFgIIKUXoP4I=;
        b=U3mnjJviVoSuywvr+OdicUddLI/HpmQszFK5a6AenWHKLjd4wZ0HgtKPR0aQ1j1dSa
         e1Igjw/QSZFODog0kvIls4gNGqvz3QG+RFJGZAGRti//p3ziDfeZjZc3H0bP5S0br6m/
         STISjC0us0m9gvi/3CYKcLPXcg1xk4SW9IbFp42XhMXnTDOra2oda7lwG8Bk8T2k0m+x
         geYo+wxhfjRVeHq41P2hUCrw0CPYf1Gwl/eLV7nY0DDByybgK8gax3Y+mpnPYcyP75Ch
         c2rjf4evZtJweiqatX+rHQWL/sUMh5YBtpsftWu8X3/rIedwr7bPJhATuHcuUebUtR0D
         kqLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=v3xXK+zgiflpM+C0ZHeAO6UAIHbdguOLFgIIKUXoP4I=;
        b=KclZBbx37jfottc+NPHrxZtzsMr8SQvckOEcIMrTDMbAX132yNV9/gS2n+6gUOqmhP
         BS3JLvuva5GzLkf1uaLOkoMPlYzFv9XARFBlpe9vu9hbjJHqqGidzNATom9Lv0pCE9hC
         1FaFUGUvuajjdTf2lQ4Mc6tPO1eDluwDlCZgSqItYS9uqjQXiW1tLc4Zg1F0xZp4n2vz
         TUc/WenlE45MB1Ii/rTtjwRoiXkVE2+lCyIYQzjs8YbL/QNzr1Mynrxm7abGh3nmldkc
         UwkXhKm/8b3B7CuY3vilXM7TJhg5VRodQ8EdakLhOoSZ1hYiRsy/RX8V1Nv8JI1aS4CS
         wilQ==
X-Gm-Message-State: AOAM532fSr+BF0J6zKiavvsEmgpmqcysbnFqimUWU1rBvve34kgdnhp/
	Cr1OkMcjGvtJOk2OKMZCiI8qkP26L0pXGg==
X-Google-Smtp-Source: ABdhPJxvUqRbuYGd6iGmDTvc6zoIrF9gnEAKt6KQ3MJ7grelO1pk61q8yRUUDiMk8m/83QEv9P9VXw==
X-Received: by 2002:a05:6402:3056:: with SMTP id bu22mr22277657edb.252.1604421537676;
        Tue, 03 Nov 2020 08:38:57 -0800 (PST)
Return-Path: <toertel@gmail.com>
Received: from gigabyte.fritz.box (p200300cfaf1974008871fa142a03af31.dip0.t-ipconnect.de. [2003:cf:af19:7400:8871:fa14:2a03:af31])
        by smtp.gmail.com with ESMTPSA id rk5sm7091941ejb.18.2020.11.03.08.38.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2020 08:38:57 -0800 (PST)
From: "Mark Jonas" <toertel@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Mark Jonas <toertel@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [dunfell][PATCH 2/2] libsdl2: Fix directfb SDL_RenderFillRect
Date: Tue,  3 Nov 2020 17:38:45 +0100
Message-Id: <20201103163845.444090-2-toertel@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201103163845.444090-1-toertel@gmail.com>
References: <20201103163845.444090-1-toertel@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Refactoring of SDL2 internal API has broken SDL_RenderFillRect for
DirectFB. The problem has already been fixed upstream.

Signed-off-by: Mark Jonas <toertel@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
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
index 6285477921..1049aa548a 100644
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

