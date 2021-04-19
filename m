Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web09.6305.1618822954832267837
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Apr 2021 02:02:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=fKzQYlun;
 spf=pass (domain: gmail.com, ip: 209.85.218.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id w3so51746739ejc.4
        for <openembedded-core@lists.openembedded.org>; Mon, 19 Apr 2021 02:02:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cq/aynLhPcymBhr/9meHAcplQ9R/do3oIFUgYBVjFlI=;
        b=fKzQYlun7dS9LpZxmXraIvEzIdJYdoFblUMDjF+Y8lGJorx6+NeoTdt5vBobA9FpLw
         W+E25xL2x6XMQCRJOZ47qjxEHuX8dtHnWyJN72RtW9k60ef9IUJW//QyPyZ1CRwC9pFe
         LasxkwS54978UAw9Pw9J07Bp7asAHRAJOyscfPhaog1/VOvnXLNNVwGCAAMEHtn6qKVy
         78K4OnzMClCll4qsiEv/W9xeMOXRy14p+JN72g+8lC7mm3RGfAXyL5jAGXCu4Z7DkKF5
         wWaZCsu0sKgvLeFWfONfKQz4YyLCeczrEUf8GxdOK/raUVjgDzH1AdLiqUP5HewF2ZlS
         M1tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cq/aynLhPcymBhr/9meHAcplQ9R/do3oIFUgYBVjFlI=;
        b=gsaobZuahv+pP3OMDMcZazaQPsnRGpQL99ALF84z/s/4+0LTQxChLwJE7O3XPg1d2e
         ObKuTJXvR9j3hBBqTZAmkow711D/DhpsPDoFtXaepEsJct0qutAFJ61LqWu7JCAg7I5i
         kdAvl7OLbS21yvRvBgv82xbOPyow4CB1ZZDI54WqzdC5N2f6Wg3YA0OXyCXMhOegY82V
         i50eJoJLKenrV2+7vr5weSmqTREH4G4eVMxVLeHXILMNtdDWWwNTKDHEsJ4Voll4sVm0
         PeEMmIstKnFcN2p33xE1zKgrKvDJ6Mi4LuGGtAgIpIe0T6AsMRbIdIdchfEDTxhr8rd2
         4X3g==
X-Gm-Message-State: AOAM530gUc4DeMt7mDLECwWotWiMJYyVrkFX5wH1lJFXngiuoj7ThdzJ
	G7Igj3/ARulXKHd3j3oFATBEvcMkB5ep2w==
X-Google-Smtp-Source: ABdhPJxe3caPRHeHeldIxwMlFwYYvLhzbrmlg2DyIVWoDrtFQHwhHZw/x6mA7kINVR2Mq4g8aKp/9g==
X-Received: by 2002:a17:907:75d5:: with SMTP id jl21mr21095802ejc.408.1618822953453;
        Mon, 19 Apr 2021 02:02:33 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id s9sm11955252edd.16.2021.04.19.02.02.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Apr 2021 02:02:33 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 2/2] weston: use standalone xwayland instead of outdated xserver-xorg version
Date: Mon, 19 Apr 2021 11:02:24 +0200
Message-Id: <20210419090224.582794-2-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210419090224.582794-1-alex.kanavin@gmail.com>
References: <20210419090224.582794-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-graphics/wayland/weston_9.0.0.bb       | 2 +-
 meta/recipes-graphics/xorg-xserver/xserver-xorg.inc | 1 -
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/wayland/weston_9.0.0.bb b/meta/recipes-graphics/wayland/weston_9.0.0.bb
index 50fbfa613b..34ac66d4e9 100644
--- a/meta/recipes-graphics/wayland/weston_9.0.0.bb
+++ b/meta/recipes-graphics/wayland/weston_9.0.0.bb
@@ -124,7 +124,7 @@ SUMMARY_libweston-${WESTON_MAJOR_VERSION} = "Helper library for implementing 'wa
 FILES_${PN}-examples = "${bindir}/*"
 
 FILES_${PN}-xwayland = "${libdir}/libweston-${WESTON_MAJOR_VERSION}/xwayland.so"
-RDEPENDS_${PN}-xwayland += "xserver-xorg-xwayland"
+RDEPENDS_${PN}-xwayland += "xwayland"
 
 RDEPENDS_${PN} += "xkeyboard-config"
 RRECOMMENDS_${PN} = "weston-init liberation-fonts"
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
index b3e03744c0..da025171db 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
@@ -122,7 +122,6 @@ EXTRA_OECONF += "--with-fop=no \
 OPENGL_PKGCONFIGS = "dri glx glamor dri3 xshmfence"
 PACKAGECONFIG ??= "dga dri2 udev ${XORG_CRYPTO} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', '${OPENGL_PKGCONFIGS}', '', d)} \
-                   ${@bb.utils.contains('DISTRO_FEATURES', 'opengl wayland', 'xwayland', '', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd systemd-logind', '', d)} \
 "
 
-- 
2.30.2

