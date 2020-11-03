Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
 by mx.groups.io with SMTP id smtpd.web11.6774.1604421537185560208
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Nov 2020 08:38:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=pKkC2V0f;
 spf=pass (domain: gmail.com, ip: 209.85.208.41, mailfrom: toertel@gmail.com)
Received: by mail-ed1-f41.google.com with SMTP id a10so1786516edt.12
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Nov 2020 08:38:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xJKf14CCZj4pSjFCpUpYtkx0fdJs3Q+KSS/bK1L6RR4=;
        b=pKkC2V0fCWLLI0lEtF2HeChE0WpDaMLtO2SXmZ50a2Ts6T97QOYjnjkjrO9X7jOlrQ
         32xlwePRsExG7X866dughLCsJK/fDiGqZUR0lkRlLq9OK7b3ERk13uWzjczSpLDAJmWD
         R1l0sUqU93ZbHPktvrjt89cLtrewJByVNIa4io5IMMoNvnYlwZY7dFpaH/rQLxWdVpCi
         6TWtwAxlIgXmreSLUy3JkQsBFqsbvIp3FG4IWkUQM1lwYDVbLsIar/Qk1HQ6BNQ1ZH/M
         4elAOk0QoCkZB3avgCW029biKIEXuxDGq2oe/nHCxF+bNFRo2X9Ti8blW3Szl/02Vqc6
         PtHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xJKf14CCZj4pSjFCpUpYtkx0fdJs3Q+KSS/bK1L6RR4=;
        b=owNMzWPl4KkTFB3KNRCeR9UvEFQiyXHASuz3czXS2kQoJIDYEbBMiAsuM8VSznK+Ao
         3V9F+nYK4HSQiuqnCzreENvYtX268N1cw95AZxCUyPhRpo2R5qPm1KFgcQDJaUNCehsV
         JVf3cKBEMUlrhLoFdrcDkNTPAjKDeYL6dq9MvttJ5F+SXACSSsdufA6pYhcmH5+LkWUN
         RRNFHQryeBBzdUy5Cn1r+GJFocC0IRi3izHjsqgu3FvzM3AjD86KWYu1TjJlM/4EdPYt
         KE/Bzx0FlCy742o8Q5tIXYUknUr0t3Kqze7vgavF6fkmTsWIDhLiWCIRuR93dPCtMFs+
         bdoA==
X-Gm-Message-State: AOAM532SA+Rdxb9bXF95JsA3ZZhxz83I5IGosLYtlM7oS17eIFdzEPLb
	weHyzmbj54aJk35Xm1bD1X3DuRe3RWeNkg==
X-Google-Smtp-Source: ABdhPJyJHD39RScQ/YobERLkv4vqaaBK5E34BipqBdo3nAB+tTuAempDMVGfzvNljcQUWfw52hqvlg==
X-Received: by 2002:a50:9f61:: with SMTP id b88mr12821974edf.282.1604421535326;
        Tue, 03 Nov 2020 08:38:55 -0800 (PST)
Return-Path: <toertel@gmail.com>
Received: from gigabyte.fritz.box (p200300cfaf1974008871fa142a03af31.dip0.t-ipconnect.de. [2003:cf:af19:7400:8871:fa14:2a03:af31])
        by smtp.gmail.com with ESMTPSA id rk5sm7091941ejb.18.2020.11.03.08.38.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2020 08:38:54 -0800 (PST)
From: "Mark Jonas" <toertel@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Mark Jonas <toertel@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [dunfell][PATCH 1/2] libsdl2: Fix directfb syntax error
Date: Tue,  3 Nov 2020 17:38:44 +0100
Message-Id: <20201103163845.444090-1-toertel@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Build of libsdl2 with directfb is broken due to a spurious '}' and a
missing 'E' since version 2.0.12. The upstream is already fixed.

Signed-off-by: Mark Jonas <toertel@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...ectfb-spurious-curly-brace-missing-e.patch | 49 +++++++++++++++++++
 .../libsdl2/libsdl2_2.0.12.bb                 |  1 +
 2 files changed, 50 insertions(+)
 create mode 100644 meta/recipes-graphics/libsdl2/libsdl2/directfb-spurious-curly-brace-missing-e.patch

diff --git a/meta/recipes-graphics/libsdl2/libsdl2/directfb-spurious-curly-brace-missing-e.patch b/meta/recipes-graphics/libsdl2/libsdl2/directfb-spurious-curly-brace-missing-e.patch
new file mode 100644
index 0000000000..aa351a89ba
--- /dev/null
+++ b/meta/recipes-graphics/libsdl2/libsdl2/directfb-spurious-curly-brace-missing-e.patch
@@ -0,0 +1,49 @@
+# HG changeset patch
+# User Fabrice Fontaine <fontaine.fabrice@gmail.com>
+# Date 1585069551 25200
+# Node ID 769f800952179633ec6c3e6bc1bc1d40e401750a
+# Parent  63387e8920f58f608288f247824ec5f4c286691f
+src/video/directfb/SDL_DirectFB_render.c: fix build
+Build with directfb is broken due to a spurious '}' and a missing 'E'
+since version 2.0.12 and https://hg.libsdl.org/SDL/rev/2d5b5a5ccbfb:
+
+/home/buildroot/autobuild/run/instance-2/output-1/build/sdl2-2.0.12/src/video/directfb/SDL_DirectFB_render.c: In function 'SetBlendMode':
+/home/buildroot/autobuild/run/instance-2/output-1/build/sdl2-2.0.12/src/video/directfb/SDL_DirectFB_render.c:202:9: error: case label not within a switch statement
+  202 |         case SDL_BLENDMODE_MUL:
+      |         ^~~~
+
+/home/buildroot/autobuild/run/instance-2/output-1/build/sdl2-2.0.12/src/video/directfb/SDL_DirectFB_render.c:205:67: error: 'DSBF_DSTCOLOR' undeclared (first use in this function); did you mean 'DSBF_DESTCOLOR'?
+  205 |             SDL_DFB_CHECK(destsurf->SetSrcBlendFunction(destsurf, DSBF_DSTCOLOR));
+      |                                                                   ^~~~~~~~~~~~~
+
+Fixes:
+ - http://autobuild.buildroot.org/results/83ccefee68c2800c0544e6f40fa8bc8ee6b67b77
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+
+--
+
+The patch was imported from the libsdl Mercurial repository
+(https://hg.libsdl.org/SDL) as of changeset id 769f80095217.
+
+Upstream-Status: Backport
+
+Signed-off-by: Mark Jonas <toertel@gmail.com>
+
+
+diff -r 63387e8920f5 -r 769f80095217 src/video/directfb/SDL_DirectFB_render.c
+--- a/src/video/directfb/SDL_DirectFB_render.c	Mon Mar 23 14:10:25 2020 -0700
++++ b/src/video/directfb/SDL_DirectFB_render.c	Tue Mar 24 10:05:51 2020 -0700
+@@ -198,11 +198,10 @@
+             SDL_DFB_CHECK(destsurf->SetDstBlendFunction(destsurf, DSBF_SRCCOLOR));
+
+             break;
+-        }
+         case SDL_BLENDMODE_MUL:
+             data->blitFlags = DSBLIT_BLEND_ALPHACHANNEL;
+             data->drawFlags = DSDRAW_BLEND;
+-            SDL_DFB_CHECK(destsurf->SetSrcBlendFunction(destsurf, DSBF_DSTCOLOR));
++            SDL_DFB_CHECK(destsurf->SetSrcBlendFunction(destsurf, DSBF_DESTCOLOR));
+             SDL_DFB_CHECK(destsurf->SetDstBlendFunction(destsurf, DSBF_INVSRCALPHA));
+
+             break;
diff --git a/meta/recipes-graphics/libsdl2/libsdl2_2.0.12.bb b/meta/recipes-graphics/libsdl2/libsdl2_2.0.12.bb
index c1c941e452..6285477921 100644
--- a/meta/recipes-graphics/libsdl2/libsdl2_2.0.12.bb
+++ b/meta/recipes-graphics/libsdl2/libsdl2_2.0.12.bb
@@ -18,6 +18,7 @@ PROVIDES = "virtual/libsdl2"
 
 SRC_URI = "http://www.libsdl.org/release/SDL2-${PV}.tar.gz \
            file://more-gen-depends.patch \
+           file://directfb-spurious-curly-brace-missing-e.patch \
 "
 
 S = "${WORKDIR}/SDL2-${PV}"
-- 
2.25.1

