Return-Path: <vince@underview.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD7ADC04A95
	for <webhook@archiver.kernel.org>; Sat, 22 Oct 2022 17:13:34 +0000 (UTC)
Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
 by mx.groups.io with SMTP id smtpd.web11.627.1666458806256085313
 for <openembedded-core@lists.openembedded.org>;
 Sat, 22 Oct 2022 10:13:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@underview.tech header.s=google header.b=HfMio+/L;
 spf=pass (domain: underview.tech, ip: 209.85.160.43, mailfrom: vince@underview.tech)
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-131dda37dddso7392628fac.0
        for <openembedded-core@lists.openembedded.org>; Sat, 22 Oct 2022 10:13:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=underview.tech; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=urj4nZ7mb062blC+qGZFZjR66kaQJGMk1WjdBxvZM3A=;
        b=HfMio+/LeDEYbV2LoptV7PyhYGkUPQGn12gmRIBOTCNTDtSfUszZmQmhglvrebm+uL
         i8ulSlc54urrHcLVGpPzTk3L3YVcv910h1WF7t52Ji38/vsu2sa7orcnulxf4w3kAFjB
         56i7foiI9a/Ea+IUAhlf8Q8DTEOZm1L4iPTcFuemBLbZhq9noR+IUpnqh00P0LyiY3sW
         ds1QMfA+IvN515NZi0j3rOtVONDsQX1NTTBKoCjnYb3pYfTuGR8jT8oZB85HELPw8Y4o
         O0EL4bD2MirXTloUzx0wR5Lx/LnfQ0tHpQ1xNhjViVSpAgkFm058Irxv4nhqTJMXS6X7
         xsFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=urj4nZ7mb062blC+qGZFZjR66kaQJGMk1WjdBxvZM3A=;
        b=t/UMYpSiZq1+wMkBeJSKVTzf0aF5J6nDpsDinNfgy2FZOw13g75J4vD7sH/R9+vUaL
         M9cKQxDmg3cejRSksqJ3SmCTlPSxxuxA3/pDA9ok7yGCglj6hwibIcedQcbPA+lQLf99
         Fku01GOtilLFoggTUKspuXdHFfoX0SrxCV+PvAA4tC99qAJ+Huf1dR+5YpANjHi26BVS
         v3Y/G1E6SpNIfWC6cUKy4mRPb4lqMWdOnwjJcm4lEwCruxq9n0RvPTpo5Vgsbl/XH01z
         a8lHE5I0z37O729fc7U6ZJwQdhWlsafB+auSlnxLW93JOF5QX+FZb1SmDex68tieBkbs
         jZvQ==
X-Gm-Message-State: ACrzQf21kXEJSgOWtKOGyAyzkEAaQITPJeYnVQrqPxpaqGBu0wEhEKI9
	FjHmbwmVOwZENRIHHG6GZQ93nOTCIF/LnC8P
X-Google-Smtp-Source: AMsMyM5f7w8GDhUYd40fZy7sqDSJ3d7xykmzvgIaY/Sz3omF58AIoK7B61i2LbLd/9ol6BTTK7FJcQ==
X-Received: by 2002:a05:6870:f596:b0:136:6fa7:8c76 with SMTP id eh22-20020a056870f59600b001366fa78c76mr33630647oab.236.1666458805330;
        Sat, 22 Oct 2022 10:13:25 -0700 (PDT)
Received: from vince-ubuntu.attlocal.net (99-113-4-128.lightspeed.hstntx.sbcglobal.net. [99.113.4.128])
        by smtp.gmail.com with ESMTPSA id x27-20020a056870a79b00b001372c1902afsm11660703oao.52.2022.10.22.10.13.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Oct 2022 10:13:24 -0700 (PDT)
From: Vincent Davis Jr <vince@underview.tech>
To: openembedded-core@lists.openembedded.org
Cc: Vincent Davis Jr <vince@underview.tech>
Subject: [PATCH] libglvnd: add new recipe libglvnd v1.5.0
Date: Sat, 22 Oct 2022 12:10:36 -0500
Message-Id: <20221022171036.85415-1-vince@underview.tech>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 22 Oct 2022 17:13:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172062

Signed-off-by: Vincent Davis Jr <vince@underview.tech>
---
 .../libglvnd/libglvnd_1.5.0.bb                | 30 +++++++++++++++++++
 1 file changed, 30 insertions(+)
 create mode 100644 meta/recipes-graphics/libglvnd/libglvnd_1.5.0.bb

diff --git a/meta/recipes-graphics/libglvnd/libglvnd_1.5.0.bb b/meta/recipes-graphics/libglvnd/libglvnd_1.5.0.bb
new file mode 100644
index 0000000000..b92bad46e0
--- /dev/null
+++ b/meta/recipes-graphics/libglvnd/libglvnd_1.5.0.bb
@@ -0,0 +1,30 @@
+DESCRIPTION = "libglvnd is a vendor-neutral dispatch layer for arbitrating \
+OpenGL API calls between multiple vendors."
+HOMEPAGE = "https://gitlab.freedesktop.org/glvnd/libglvnd"
+LICENSE = "MIT & BSD-1-Clause & BSD-3-Clause & GPL-3.0-with-autoconf-exception"
+LIC_FILES_CHKSUM = "file://README.md;beginline=323;md5=7ac5f0111f648b92fe5427efeb08e8c4"
+
+SRC_URI = "git://git@gitlab.freedesktop.org/glvnd/libglvnd.git;protocol=https;branch=master"
+
+# v1.5.0 tag
+SRCREV = "c7cdf0cc4395b57563294d1f340b6bb1b95366a0"
+
+REQUIRED_DISTRO_FEATURES = "opengl"
+
+inherit meson pkgconfig features_check
+
+S = "${WORKDIR}/git"
+
+PACKAGECONFIG ?= "\
+  ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)} \
+  ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'egl gles1 gles2', '', d)} \
+  ${@bb.utils.contains('DISTRO_FEATURES', 'opengl x11', 'glx', '', d)} \
+  "
+
+PACKAGECONFIG[x11] = "-Dx11=enabled,-Dx11=disabled,libx11 libxext xorgproto"
+PACKAGECONFIG[glx] = "-Dglx=enabled,-Dglx=disabled,libx11 libxext xorgproto"
+PACKAGECONFIG[egl] = "-Degl=true,-Degl=false,"
+PACKAGECONFIG[gles1] = "-Dgles1=true,-Dgles1=false,"
+PACKAGECONFIG[gles2] = "-Dgles2=true,-Dgles2=false,"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.34.1


