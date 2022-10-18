Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C065C433FE
	for <webhook@archiver.kernel.org>; Tue, 18 Oct 2022 23:08:28 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web08.1794.1666134504265360220
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Oct 2022 16:08:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=H3n5UYFn;
 spf=pass (domain: gmail.com, ip: 209.85.216.53, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id a6-20020a17090abe0600b0020d7c0c6650so18880173pjs.0
        for <openembedded-core@lists.openembedded.org>; Tue, 18 Oct 2022 16:08:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=i4d6IWsHizllWXoDJ7MPVqewFJeqBU7oIpYBNS2ogIY=;
        b=H3n5UYFns3ogSdps+GlvPNeMRAIWfKQLBjsUhTLfRBHCXCcMwjvOaWrHgNoNSI+IkV
         7FR87c6Ezg+C9shh/+CeZ66C9KqMWvTTf/8qXAYcc3W2xA/kndJueNQlaV+gAbh9Uf/8
         Ok9l+Kk35X8ndvGt571EqNDKzl08GGAQinbN/NoMKcEPf24n+S9VzCaa7RXwlsJuVKqC
         aRvSWLpXxcu+6hxEArRdwrdf3dCQv9+Xi52CbWFK4Cx1BV+z22N8A1bN8+7hcvpVtqnf
         78Lw6DfeK5nqmjuHAx/tJKyXt75KDPLXnd32q5+0yFRvn3zLf5TQvsk53xR6Mj2dnFUn
         J0GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i4d6IWsHizllWXoDJ7MPVqewFJeqBU7oIpYBNS2ogIY=;
        b=k+XhIcjfkS2Zdwdd7PheFTDU+nHzMUOQhA37wvKaxwDDz90MTFgXnyKxGlx51fFLDo
         GQoFVsKsaVZwuUZASxf4RaP9uVbZKY/1DYySFi21PsqVbcfCUSGj8TCG1anDJEjNqEer
         sDvsxRlHuFg/ZjhRBFQKMll0ZYInwow/efPOX+Uj4ngucGZ/XoGn/NBmDf6VE8DpcJST
         J6791Ff7OP586EfvgWpir5q1MIjSlvTWaZX9yi5VXD5lMq4qs6EIt4o/PswT2FV/vNCq
         GnJzepoOVW9VVthUULmDCJc2L8Aan0kF4px6u2YboaMaZ0aGVeZncdcAcMIcuBeLgLlR
         y29g==
X-Gm-Message-State: ACrzQf0nRBWjJfc76sjiHw4meGRpMpK2amvCZHvTIklii6PHRviNhNeO
	1eNlKZosOMaBs3EXGZFXFVhQgN1dJXA=
X-Google-Smtp-Source: AMsMyM4suVmkKp7xL4HaL4C3cxX/rfGuWKWt+hrZYmAJAnCKjqHLG2hvsr/jEFe9hoR3Bp4PpVTmoQ==
X-Received: by 2002:a17:902:c3cc:b0:183:dca7:8b64 with SMTP id j12-20020a170902c3cc00b00183dca78b64mr5297809plj.3.1666134503402;
        Tue, 18 Oct 2022 16:08:23 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::751e])
        by smtp.gmail.com with ESMTPSA id r16-20020a63e510000000b004308422060csm8432577pgh.69.2022.10.18.16.08.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Oct 2022 16:08:23 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Kai Kang <kai.kang@windriver.com>
Subject: [PATCH v2] mesa: Add native patch via a variable
Date: Tue, 18 Oct 2022 16:08:20 -0700
Message-Id: <20221018230820.2385167-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.38.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Oct 2022 23:08:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171948

This helps override the SRC_URI in entirety if needed by
and overriding recipe

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Kai Kang <kai.kang@windriver.com>
---
v2: Weakly define NATIVE_PATCHES

 meta/recipes-graphics/mesa/mesa.inc | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index c94e439363..04d78a6aa5 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -19,10 +19,11 @@ SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
            file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch \
            file://0001-futex.h-Define-__NR_futex-if-it-does-not-exist.patch \
            file://0001-util-format-Check-for-NEON-before-using-it.patch \
+           ${NATIVE_PATCHES} \
            "
-
+NATIVE_PATCHES ?= ""
 # required by mesa-native on Ubuntu 18.04 with gcc 7.5 when DEBUG_BUILD enabled
-SRC_URI:append:class-native = " file://0001-nir-nir_opt_move-fix-ALWAYS_INLINE-compiler-error.patch"
+NATIVE_PATCHES:class-native = "file://0001-nir-nir_opt_move-fix-ALWAYS_INLINE-compiler-error.patch"
 
 SRC_URI[sha256sum] = "b1f9c8fd08f2cae3adf83355bef4d2398e8025f44947332880f2d0066bdafa8c"
 
-- 
2.38.0


