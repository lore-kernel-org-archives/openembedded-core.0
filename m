Received: from mail-qv1-f67.google.com (mail-qv1-f67.google.com [209.85.219.67])
 by mx.groups.io with SMTP id smtpd.web10.10576.1589035887872573031
 for <openembedded-core@lists.openembedded.org>;
 Sat, 09 May 2020 07:51:28 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.219.67, mailfrom: otavio.salvador@gmail.com)
Received: by mail-qv1-f67.google.com with SMTP id ep1so2364693qvb.0
        for <openembedded-core@lists.openembedded.org>; Sat, 09 May 2020 07:51:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :organization:content-transfer-encoding;
        bh=Eg2Nv/3BoX8hsLfCzQfVPIrzypeltzfwEbRmgixTTiA=;
        b=qr9tegST7/cx32ayB5TSqZjsKWlfpezwDYNS/twgk+waYgeJkjXpllzmmE6AmfauPD
         stsUT3TltKkGrST2h2wb+0ybtEIKEIJI1bjUmLboD4SGGJeHC5y8OoouGSyHjFnYQo/v
         20MjyTDPe6rKRnDwflI50QMg9qZmzaqeD2uutWZcyYNZgHP/W44Jwnh00f13Z7SAJtcc
         WJntwfa1DfGSw/9X5RPtRVfBTKNvdYp9iXXzP0TLgu5U2MpIC96TDRyBIwRhx5ZQcuS3
         qXjWlakpT8e/SRlBIzGJEFolUltBDD4ySS0Vm09Y3muJs6rBwFS9LG3S31yOLvW30Z1l
         +h5w==
X-Gm-Message-State: AGi0PuZ1LDmThszMw7AvbiPvYUOftXdTNApg6ZOR0j8IsqSuM7KJL61A
	J7YhfI9E507Qn15oWxwZfZ7+IGHtWMM=
X-Google-Smtp-Source: APiQypIfOWmzN65aovNCR4KQ1VztWgvHWxehBU+VVRN5rMeJLQHVCZKJ8yk7SPOWyYttXaJ/cTvHnw==
X-Received: by 2002:a05:6214:1262:: with SMTP id r2mr7713693qvv.126.1589035886759;
        Sat, 09 May 2020 07:51:26 -0700 (PDT)
Return-Path: <otavio.salvador@gmail.com>
Received: from localhost ([181.220.84.90])
        by smtp.gmail.com with ESMTPSA id x19sm3658177qkh.42.2020.05.09.07.51.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 May 2020 07:51:26 -0700 (PDT)
From: "Otavio Salvador" <otavio.salvador@gmail.com>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH] avahi: Make GTK3 support conditional based on DISTRO_FEATURES
Date: Sat,  9 May 2020 11:51:22 -0300
Message-Id: <20200509145123.2332958-1-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Organization: O.S. Systems Software LTDA.
Content-Transfer-Encoding: 8bit

The GTK3 needs to have one of GTK3DISTROFEATURES enabled (x11 or
wayland) for the PACKAGECONFIG to be enable, so we keep support for
distros where those are not included.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 meta/recipes-connectivity/avahi/avahi_0.8.bb | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-connectivity/avahi/avahi_0.8.bb b/meta/recipes-connectivity/avahi/avahi_0.8.bb
index f4924fa1cb..ed1147b540 100644
--- a/meta/recipes-connectivity/avahi/avahi_0.8.bb
+++ b/meta/recipes-connectivity/avahi/avahi_0.8.bb
@@ -32,10 +32,8 @@ SRC_URI[sha256sum] = "060309d7a333d38d951bc27598c677af1796934dbd98e1024e7ad8de79
 
 DEPENDS = "expat libcap libdaemon glib-2.0 intltool-native"
 
-# For gtk related PACKAGECONFIGs: gtk, gtk3
-AVAHI_GTK ?= "gtk3"
-
-PACKAGECONFIG ??= "dbus ${AVAHI_GTK}"
+PACKAGECONFIG ??= "dbus \
+                   ${@bb.utils.contains_any('DISTRO_FEATURES', '${GTK3DISTROFEATURES}', 'gtk3', '', d)}"
 PACKAGECONFIG[dbus] = "--enable-dbus,--disable-dbus,dbus"
 PACKAGECONFIG[gtk] = "--enable-gtk,--disable-gtk,gtk+"
 PACKAGECONFIG[gtk3] = "--enable-gtk3,--disable-gtk3,gtk+3"
-- 
2.26.2

