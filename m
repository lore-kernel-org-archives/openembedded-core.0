Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE349C54EBC
	for <webhook@archiver.kernel.org>; Wed, 11 Jan 2023 14:35:00 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.web11.25217.1673447695666956102
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Jan 2023 06:34:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=m3sZjveu;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.180, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f180.google.com with SMTP id f3so10656938pgc.2
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Jan 2023 06:34:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MxgZTgRaSAEmTMrT/iiYlM8Eb0B63+ebDmavKd5pLGY=;
        b=m3sZjveuFUBMFdbgi3vqilJ+KunKJU/aTuVidzga87bralqeAi9EnecSXnPAWOmzJP
         6Sxn93fy+TbxY2aBwGdrPYusGRBrRU58gY4rBsKxYnqBSpTfXdCBxgFFlp02YxIrZVRn
         H2gTGMXSLM37iXk062sRMFrtACY6cw1w+CLuRRpze2NpthoMjq19hnvJ5HVv312IBw6k
         OEZEqXbNGm+N2c+b2zhNjQejFn4F28M4e008mtEm/RNRoOSTFXf3EluwwXffPOSdihlR
         sb7eb26XVGlCXOpFEwOML6geXoncAsqdWZgdm5ejjddLq6fHRd4CxBTCDfAv+0MmXld9
         cCKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MxgZTgRaSAEmTMrT/iiYlM8Eb0B63+ebDmavKd5pLGY=;
        b=sfrDSwbDL/2otDjnL/nxJfDytvrA3+rk1RfovWdRmSx8FAp/wDcQAgAoqYDNxrKgCM
         TCr9UkPj+vrMhowLnDpJZRgKJwaTgumQFfsvwGqxbjVAULFntm9IFQBw8cGX+V3rTYvq
         WmitlA9dsxJawG3UK20WhylXZWuO3qAoOinlYdLeHS0LCna8qgShqjSz5D3dmvpcEPCV
         Ln45ZwcSRk5KhXtpgB96zoRnvnMGw+liX3AjyHJJLgCMkufNS68cNcViVdhDr133IEb0
         E7llG5SYM244TbVdw6EHOEzw1WtM3y5vjvgZpXzrhCO3r7eEebBvm0C8FY8Zd32AcelG
         o9Sw==
X-Gm-Message-State: AFqh2ko0pedbJ9jYgUZpRwY7XoAowhmN26gnOTFDKj9x+qgXOwXIan1z
	01C1u1AowANQkrUEbLIsiVgaO0OvbhOyqsrUgtM=
X-Google-Smtp-Source: AMrXdXvoxLWPd/8Zj70ruuaztK3vH6vqujHABnZGfj7OWqv+YRkvsaDyxosH9D+lD0koZo0JqoTUbQ==
X-Received: by 2002:a62:3883:0:b0:580:b942:e85 with SMTP id f125-20020a623883000000b00580b9420e85mr61325454pfa.16.1673447696541;
        Wed, 11 Jan 2023 06:34:56 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-5-74.hawaiiantel.net. [72.253.5.74])
        by smtp.gmail.com with ESMTPSA id y29-20020aa793dd000000b0056c2e497b02sm10381288pff.173.2023.01.11.06.34.55
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jan 2023 06:34:56 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 8/8] ovmf: fix gcc12 warning for device path handling
Date: Wed, 11 Jan 2023 04:34:30 -1000
Message-Id: <a33abd759e2e9f41e056f87024de3b333e9b948b.1673447528.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1673447528.git.steve@sakoman.com>
References: <cover.1673447528.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Jan 2023 14:35:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175749

Backport [https://github.com/tianocore/edk2/commit/22130dcd98b4d4b76ac8d922=
adb4a2dbc86fa52c]

Fixes:

In function ?SetDevicePathEndNode?,
    inlined from ?FileDevicePath? at DevicePathUtilities.c:857:5:
DevicePathUtilities.c:321:3: error: writing 4 bytes into a region of size 1=
 [-Werror=3Dstringop-overflow=3D]
  321 |   memcpy (Node, &mUefiDevicePathLibEndDevicePath, sizeof (mUefiDevi=
cePathLibEndDevicePath));
      |   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~
In file included from UefiDevicePathLib.h:22,
                 from DevicePathUtilities.c:16:
../Include/Protocol/DevicePath.h: In function ?FileDevicePath?:
../Include/Protocol/DevicePath.h:51:9: note: destination object ?Type? of s=
ize 1
   51 |   UINT8 Type;       ///< 0x01 Hardware Device Path.
      |         ^~~~

Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...001-Basetools-turn-off-gcc12-warning.patch | 41 +++++++++++++++++++
 meta/recipes-core/ovmf/ovmf_git.bb            |  1 +
 2 files changed, 42 insertions(+)
 create mode 100644 meta/recipes-core/ovmf/ovmf/0001-Basetools-turn-off-gcc=
12-warning.patch

diff --git a/meta/recipes-core/ovmf/ovmf/0001-Basetools-turn-off-gcc12-warn=
ing.patch b/meta/recipes-core/ovmf/ovmf/0001-Basetools-turn-off-gcc12-warni=
ng.patch
new file mode 100644
index 0000000000..73a432684c
--- /dev/null
+++ b/meta/recipes-core/ovmf/ovmf/0001-Basetools-turn-off-gcc12-warning.pat=
ch
@@ -0,0 +1,41 @@
+From 22130dcd98b4d4b76ac8d922adb4a2dbc86fa52c Mon Sep 17 00:00:00 2001
+From: Gerd Hoffmann <kraxel@redhat.com>
+Date: Thu, 24 Mar 2022 20:04:36 +0800
+Subject: [PATCH] Basetools: turn off gcc12 warning
+
+In function ?SetDevicePathEndNode?,
+    inlined from ?FileDevicePath? at DevicePathUtilities.c:857:5:
+DevicePathUtilities.c:321:3: error: writing 4 bytes into a region of size =
1 [-Werror=3Dstringop-overflow=3D]
+  321 |   memcpy (Node, &mUefiDevicePathLibEndDevicePath, sizeof (mUefiDev=
icePathLibEndDevicePath));
+      |   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~
+In file included from UefiDevicePathLib.h:22,
+                 from DevicePathUtilities.c:16:
+../Include/Protocol/DevicePath.h: In function ?FileDevicePath?:
+../Include/Protocol/DevicePath.h:51:9: note: destination object ?Type? of =
size 1
+   51 |   UINT8 Type;       ///< 0x01 Hardware Device Path.
+      |         ^~~~
+
+Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
+Reviewed-by: Bob Feng <bob.c.feng@intel.com>
+
+Upstream-Status: Backport [https://github.com/tianocore/edk2/commit/22130d=
cd98b4d4b76ac8d922adb4a2dbc86fa52c]
+Signed-off-by: Steve Sakoman <steve@sakoman.com>
+
+---
+ BaseTools/Source/C/DevicePath/GNUmakefile | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/BaseTools/Source/C/DevicePath/GNUmakefile b/BaseTools/Source/=
C/DevicePath/GNUmakefile
+index 7ca08af9662d..b05d2bddfa68 100644
+--- a/BaseTools/Source/C/DevicePath/GNUmakefile
++++ b/BaseTools/Source/C/DevicePath/GNUmakefile
+@@ -13,6 +13,9 @@ OBJECTS =3D DevicePath.o UefiDevicePathLib.o DevicePathF=
romText.o  DevicePathUtili
+ =0D
+ include $(MAKEROOT)/Makefiles/app.makefile=0D
+ =0D
++# gcc 12 trips over device path handling=0D
++BUILD_CFLAGS +=3D -Wno-error=3Dstringop-overflow=0D
++=0D
+ LIBS =3D -lCommon=0D
+ ifeq ($(CYGWIN), CYGWIN)=0D
+   LIBS +=3D -L/lib/e2fsprogs -luuid=0D
diff --git a/meta/recipes-core/ovmf/ovmf_git.bb b/meta/recipes-core/ovmf/ov=
mf_git.bb
index ddadbac4b7..a487f77e3c 100644
--- a/meta/recipes-core/ovmf/ovmf_git.bb
+++ b/meta/recipes-core/ovmf/ovmf_git.bb
@@ -20,6 +20,7 @@ SRC_URI =3D "gitsm://github.com/tianocore/edk2.git;branch=
=3Dmaster;protocol=3Dhttps \
            file://0001-Fix-VLA-parameter-warning.patch \
            file://0001-Basetools-genffs-fix-gcc12-warning.patch \
            file://0001-Basetools-lzmaenc-fix-gcc12-warning.patch \
+           file://0001-Basetools-turn-off-gcc12-warning.patch \
            "
=20
 PV =3D "edk2-stable202008"
--=20
2.25.1


