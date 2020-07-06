Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com [209.85.216.66])
 by mx.groups.io with SMTP id smtpd.web11.61411.1594051872076731897
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jul 2020 09:11:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=obz8etwz;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.66, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f66.google.com with SMTP id f16so6835662pjt.0
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2020 09:11:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=qGJNng2VgZI4oY7q5+k9xi/i50tfmj4whIC9+4hC+lc=;
        b=obz8etwzRcryzTHdICR9sxUHBaU38wH4HRNRnDafa1afPdwmjiVWMyuyB8rHEpee+X
         EcmP1UKyzru2Ljgw0L+u92CsGsuHr6/gk1Uqws9ZoD50ajTsUmMALGGQc2FScY+m/19b
         5EZ9nY9sP91rfM/yjRQ9BGFzaEN5Y2LDRdT5ogGpnaZusNH4QbNObWdiPzQhhuepmwC4
         9Yc0EOxizgDdZOnmtNzjKIs28JOZA6IuwTHAMXAfnwu8q/sXb2iN5x/XiiMRRuaIkuwv
         5sNfiK8//2+RbvIT4Agh4LEOTpfJEpbyBx+soyOjm3nqZ4/4W2T+bHgm16X+kWhSLhfp
         TzkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=qGJNng2VgZI4oY7q5+k9xi/i50tfmj4whIC9+4hC+lc=;
        b=B/m2n3sS/R8KDKpfHPiShyZK45npYXKDK0VLD7r/jwJ/iQDA6ShKyI2zyOWPIke//N
         yOQgW/gx+Sx1kZoCKhL391B2ZyXPj8/yOGG7wgO55Lih3IAB8wsYpXKgAFnp+WQo3Vkk
         C+tPdQlJ4VTaZrjmX3QsYJAefmAGlzknvIYIQEcyIe2hAm/Ld4dBuAPLoCwA0bhQtzQ1
         zi/FKk1PspRoQiXLJIoVb4a8+QUgyzUOD7E/Q+3nytYJ9cXJQBue5ahfdyGrfnU3+A2x
         RVXOu5os8XymIze9Afk2GkWYBpQWJlMOi0ILJLEaFD23BL/1zaTmwKVeu1d9t3Xx2Agm
         NU9A==
X-Gm-Message-State: AOAM533elpo+yc632xtqVR2GgoVEuyiOyOODJ5z1FYDIlsxcnUdiLyGr
	74W3ZJfNbDdjoOI9Z/Wiy8++pK72TfnS6w==
X-Google-Smtp-Source: ABdhPJy5xH1cpD1Tc2vWy11yra2qmKY/yGAPQNpAESprbvQdSUVqrgD4+XRTG9cRV7SPV+PLIJpRiw==
X-Received: by 2002:a17:902:bf4c:: with SMTP id u12mr7356778pls.32.1594051871139;
        Mon, 06 Jul 2020 09:11:11 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id i67sm18225811pfg.13.2020.07.06.09.11.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2020 09:11:10 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 03/25] u-boot: avoid blind merging all *.cfg
Date: Mon,  6 Jul 2020 06:10:05 -1000
Message-Id: <8c2f4dc79f69df2174b8ab4f8b69a749aee16129.1594050175.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1594050175.git.steve@sakoman.com>
References: <cover.1594050175.git.steve@sakoman.com>

From: Jens Rehsack <rehsack@gmail.com>

This fixes u-boot-qoriq breakage of:

    commit 4fde8c8f479f5acd24fb6e0d0b9b4dc94d6f560b
    Author: Ming Liu <ming.liu@toradex.com>
    Date:   Wed Jun 3 13:56:01 2020 +0200

	u-boot: support merging .cfg files for UBOOT_CONFIG

	U-boot recipe supports .cfg files in SRC_URI, but they would be merged
	to .config during do_configure only when UBOOT_MACHINE is set, we
	should also support merging .cfg files for UBOOT_CONFIG.

The intension of 4fde8c8 looks more than append delta-config snippets to
u-boot config and should probably be rewritten to express that much better
than implicitely assume all "*.cfg" are for merging into .config.

Signed-off-by: Jens Rehsack <sno@netbsd.org>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit b4644f231a1463123d4100fcaf1448b3d174ef1a)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-bsp/u-boot/u-boot.inc | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot/u-boot.inc
index f905dfed4e..bed759c7c5 100644
--- a/meta/recipes-bsp/u-boot/u-boot.inc
+++ b/meta/recipes-bsp/u-boot/u-boot.inc
@@ -89,8 +89,10 @@ do_configure () {
                 j=$(expr $j + 1);
                 if [ $j -eq $i ]; then
                     oe_runmake -C ${S} O=${B}/${config} ${config}
-                    merge_config.sh -m -O ${B}/${config} ${B}/${config}/.config ${@" ".join(find_cfgs(d))}
-                    oe_runmake -C ${S} O=${B}/${config} oldconfig
+                    if [ test -n "${@' '.join(find_cfgs(d))}" ]; then
+                        merge_config.sh -m -O ${B}/${config} ${B}/${config}/.config ${@" ".join(find_cfgs(d))}
+                        oe_runmake -C ${S} O=${B}/${config} oldconfig
+                    fi
                 fi
             done
             unset j
@@ -123,7 +125,7 @@ do_compile () {
 		echo ${UBOOT_LOCALVERSION} > ${S}/.scmversion
 	fi
 
-    if [ -n "${UBOOT_CONFIG}" ]
+    if [ -n "${UBOOT_CONFIG}" -o -n "${UBOOT_DELTA_CONFIG}" ]
     then
         unset i j k
         for config in ${UBOOT_MACHINE}; do
-- 
2.17.1

