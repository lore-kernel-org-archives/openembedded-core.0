Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com [209.85.208.66])
 by mx.groups.io with SMTP id smtpd.web10.8644.1591885833524852613
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Jun 2020 07:30:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Wr5HsxYT;
 spf=pass (domain: gmail.com, ip: 209.85.208.66, mailfrom: rehsack@gmail.com)
Received: by mail-ed1-f66.google.com with SMTP id m32so4075359ede.8
        for <openembedded-core@lists.openembedded.org>; Thu, 11 Jun 2020 07:30:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id;
        bh=hdGC82b2vrWgchYJzwMF9zNnuLckan3IBOnAiaGnJqc=;
        b=Wr5HsxYTSWq6hMIVdEVp2x2EJVrSYFeXq6zllX/J2I489PixOKcGqIKeLwkYITxMSY
         UcCa4SkxvUiqk3e4UXGhBpKm/1yx26II+XW5wYgTh46hWHDY6VfgnYG4dLWN01iF5m55
         os2/slSZlBgyF0dmaaz4T/5MyS17BDtSw8MHujylSm+dxIUWhiTMRMz4G+0pequENZLE
         MrFpqi/ZlXSiovVOJIspk089+/PjIK7c1gZN9nzzTM+jUqpfO/EEQk8Ella3EdyhQIcx
         hZbGYarqtxv+iy5jcV3qpWa6PuUFiDL7ZBdOb0tNKtHkSUgYP+AIKzMpkqbg7FIum9sv
         1BYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
        bh=hdGC82b2vrWgchYJzwMF9zNnuLckan3IBOnAiaGnJqc=;
        b=mjuU50ZSb3sYz1EevdtwiwZPyRywK7BGogIv0Q6XkLOS242rDHZQYiik6ZoeTWdq9I
         kJCU8MbwvZR6uuExsxr/pQHfV1YlK8r4TxKwZJrarPFlSzv9b/5lhFyJNYuAaGxncMeE
         ugEPjBnCLqnf3EERcJuNwzCUyWRczc1pZZTjXpwpfGzDlTywwk9yKcPDmV0O8o9zYXee
         /cKwh4dtaf5LmloD6x3KQlAuGeJbLaX/lQykdL27B7eYO9DigZ7TvMonASRxFB+y1Dx7
         U04eaGUIYnCCLT5dcUADEpfvTNYl31fAw3W/KhMG5Un358aQIfy0bY/8g63zUKmhdhDg
         ZASw==
X-Gm-Message-State: AOAM5333x8cNqbUFe/tK2+ahL9ydraCqbFjbGZtXI+CzSCPwD/XQy9X2
	YGGPCtaKpOr9PG2CE++8/RYmdTJm
X-Google-Smtp-Source: ABdhPJws+eOlXp+/UiUc9XiwycrryESi5p/0iQevE12CLX3L8ybRgq3/soSXAeYuquHCNACmXXBZiQ==
X-Received: by 2002:a50:dac8:: with SMTP id s8mr7167955edj.244.1591885831510;
        Thu, 11 Jun 2020 07:30:31 -0700 (PDT)
Return-Path: <rehsack@gmail.com>
Received: from beaker.muppets.liwing.de (p4fe931fc.dip0.t-ipconnect.de. [79.233.49.252])
        by smtp.gmail.com with ESMTPSA id qt19sm1939164ejb.14.2020.06.11.07.30.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2020 07:30:30 -0700 (PDT)
Sender: Jens Rehsack <rehsack@gmail.com>
From: "Jens Rehsack" <rehsack@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Ming Liu <ming.liu@toradex.com>,
	Ting Liu <ting.liu@nxp.com>,
	Otavio Salvador <otavio.salvador@gmail.com>,
	Jens Rehsack <sno@netbsd.org>
Subject: [OE-core][PATCH] u-boot: avoid blind merging all *.cfg
Date: Thu, 11 Jun 2020 16:30:14 +0200
Message-Id: <20200611143014.13123-1-sno@netbsd.org>
X-Mailer: git-send-email 2.17.1

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
---
 meta/recipes-bsp/u-boot/u-boot.inc | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot/u-boot.inc
index f6a68da0f6..c91da02959 100644
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

