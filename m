Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web09.3601.1616143510295017607
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Mar 2021 01:45:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=TUd/IzR3;
 spf=pass (domain: gmail.com, ip: 209.85.218.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id a7so8356569ejs.3
        for <openembedded-core@lists.openembedded.org>; Fri, 19 Mar 2021 01:45:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2LnxBOxpEhfVNX6Ww8y3JDqDW0nxVTHTj3QBOvssnmI=;
        b=TUd/IzR3uw9Het6FJGS0iK+ZLsQj95npBAsZB1z2WN9d4/fv+D3JP6hbOMqkvVFnH9
         lLINadHb+bRcD468raJL5UMwNseARg9e8nHUjBTezrELS6t4/Mgi1Znp9KjbCsjrs5q+
         5RjmyYtadEm1QGdNGDOjnzD/PpTvWAu9S0NqtiRM+plKcIkCFL1l0NAp8TQlt6jCddbQ
         lz6RYNWzaq7aNz+/gDloF4J85hGXG5AS5z3Kcmq/sB5Yv/NMTq8PjaVtgp8hbU93lll8
         qkC9XBYDfZQ++Nbw1JFqg9U2Cnt+adpQ66stD6wkePwy1WvUe0hh+h7a2I1Wu8/afAK1
         mRTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2LnxBOxpEhfVNX6Ww8y3JDqDW0nxVTHTj3QBOvssnmI=;
        b=SBuha/neeVxzC17aGZ7Fmn57mcxZd6E0ULhfakxWXjU/H1f6AXZMjs9IpVze/6qbsF
         VIcvEXTQtayjRmThAB33Ux+yt7xuf8pg3O+8H2ZyZVsTNVDmZ2TkdBCHX2FqPoTEy4Q2
         wcSBEjGNoOIgrx1XoLDlprUh3Nzb6Po8ngle2pNPJYB0C1rmWNMlrL7G7d4Y8nbLuuvV
         yJIUxdtu8wqy5F98u//hHEfh0x2Wt+VkSsNovjNn4qnZRkfi+QYySz0JAdZPof9NiciH
         BVWInw5mmtwK1WgXnHbnIiMsCInq897fvyY82reMmGXss4wbqqgMbs5P4/XHFoPfDAam
         w9MA==
X-Gm-Message-State: AOAM532sA3GepVvx53M73CuuRhaf6wMzNBDxYRmig2rcERbO9OyK89o9
	6icL+Cz9q9fi04U76C6PzlKs4ujGV2EdBA==
X-Google-Smtp-Source: ABdhPJzvf18O3XqoW6RfGbiDrd232z1v+gSQ4A1yINxIlGUvu5vKl8eyQicpVIThpIQL+FWQCecJgQ==
X-Received: by 2002:a17:906:d787:: with SMTP id pj7mr2949842ejb.257.1616143508892;
        Fri, 19 Mar 2021 01:45:08 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id nd36sm3262248ejc.21.2021.03.19.01.45.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Mar 2021 01:45:08 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 02/16] weston: use standalone xwayland instead of outdated xserver-xorg version
Date: Fri, 19 Mar 2021 09:43:47 +0100
Message-Id: <20210319084401.576728-2-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210319084401.576728-1-alex.kanavin@gmail.com>
References: <20210319084401.576728-1-alex.kanavin@gmail.com>
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
2.29.2

