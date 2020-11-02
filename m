Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web10.28538.1604306741974301868
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Nov 2020 00:45:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=hfvX8Rm0;
 spf=pass (domain: gmail.com, ip: 209.85.218.47, mailfrom: toertel@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id p5so17797242ejj.2
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Nov 2020 00:45:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OaXrELFjkn5XI7t3lSyfyv2P7AOBY6UEaXSsfLustqA=;
        b=hfvX8Rm0w8NFyPK7Ur7wqwUjHYqY74+FU0bo9X8JDop7vzP6M+Z3GNesMLdhxm6sp2
         03+HbqPGyPEfjvimuFrRfmplBvagBjs/6/ieGl5u1VQZ/NOxs5BafjtSshkBLKXr7Xop
         pa4TzCSqjZokgnB9ewlEn7bdoI2lQmQoDKueE2EpOrNdjFPD28exqgd83N78Pe59rL3J
         7P/Ke/DsjFm7mLP8U+k+pUf6XkwQ2sk5RqX1L2b6S8I3lQok65mwg2nxIyp5WERo7PJ2
         R3TYrxkSCtC+3K1cvyqH6RfUkQ2IgZ/Ye8If57LmpfP4K3G+DK8lLFtF+M7zA3OHZ6y7
         xi7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OaXrELFjkn5XI7t3lSyfyv2P7AOBY6UEaXSsfLustqA=;
        b=hqV+WqDBHw1oCtl41E8H+BRZOQ5Fo58XB3OyMqr1JLfnropmth/Vo+kaIEzCnkrKVo
         Ssr9bCYUMlT3Hr5bzc8jZzPtlEnqyJItjxAXcmW3BsvOqE17jmA/5sd3V/D34GtxD07g
         MeVGZpRk7q7/P3HdgwvClHs710HjHz3U+O4XNE2VuCysjrOFTaiW7tTP6VzUvGtHwRvM
         fUpJMSxge4jMzJRsoRnQKqfokV7Z2N0JVbhXkUYBXHQ41Fyf0HVJH+odTMpjhN3sGzLR
         nJT/adDm0GFSh+1Cf+gcp/CnWGumrWOiXe5pTmA66j5GuvHaeNJwTMB4DRaCDVU2kDHO
         XZGw==
X-Gm-Message-State: AOAM530NDUbPc/sszlWy6l1GwI1BA0lGTndtLSCCi3lEu4ExK/0uArqQ
	giK9LtMoDc8DfuneA3qqjkm19Dhmx5ncTA==
X-Google-Smtp-Source: ABdhPJyt+QBJQOqTa/MZd9kkzfCp+lway+XlNFwOqkiYeV+4Vl2SsbhDCFskDsvJftwdqYaVndmsNw==
X-Received: by 2002:a17:906:f201:: with SMTP id gt1mr13613614ejb.229.1604306739863;
        Mon, 02 Nov 2020 00:45:39 -0800 (PST)
Return-Path: <toertel@gmail.com>
Received: from gigabyte.fritz.box (p200300cfaf2f4a0005ab6f8a57512e19.dip0.t-ipconnect.de. [2003:cf:af2f:4a00:5ab:6f8a:5751:2e19])
        by smtp.gmail.com with ESMTPSA id t5sm10055091edw.45.2020.11.02.00.45.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2020 00:45:39 -0800 (PST)
From: "Mark Jonas" <toertel@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Mark Jonas <toertel@gmail.com>
Subject: [PATCH 1/2] libsdl2: Fix directfb syntax error
Date: Mon,  2 Nov 2020 09:34:39 +0100
Message-Id: <20201102083440.28814-1-toertel@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Build of libsdl2 with directfb is broken due to a spurious '}' and a
missing 'E' since version 2.0.12. The upstream is already fixed.

Signed-off-by: Mark Jonas <toertel@gmail.com>
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
index 83dce86801..8ecf161f69 100644
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

