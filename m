Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web09.8466.1628082014315135786
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Aug 2021 06:00:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=gy5SujQH;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id f9-20020a05600c1549b029025b0f5d8c6cso3858414wmg.4
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Aug 2021 06:00:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zeYtj1wvTnRvXo+taDDwhERwW3tp0RrfGm99ZnYbYIA=;
        b=gy5SujQHYKZPS6JBZZCHyL9Cseo16eXaJ3j/jr2h7TvT4zKXLKqxfnHSA92nSpk+Ca
         P2YckCqTOXpqXoYfEz/NzgiKYulhtmZlMvMFKMyRbWRLyWVFpbouZwWiu8cvV1IFz8rM
         svVMQalrRsOGUQCGJCvhxF8g7+gm9SqDuUYbI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zeYtj1wvTnRvXo+taDDwhERwW3tp0RrfGm99ZnYbYIA=;
        b=E/uwqKdbWDuTmNl7PPPgNZpFsyUVF1YwJxakFdjApfagRqfsXl+Nw9p+2b+wlMHQf8
         V7eMofid/tOhDwMuMuwo801YW16HE5vr9uxQBbwEKoWUL2SpR6X4hWDxIMP4loTEdgxS
         RhqtZPnu4AO++sntKTOBSf7Wga/wEy+KVfg7XMrBmB5/9quvNIVxmeX26xcSN7u8fS00
         Fz1sOWjzWz5b3FivDt3suMBuXyob67TKCHvafrPQTWc3WWFckEUa0In4emMzbRK/1rbB
         xWRmE+0b2R3tQpp7cj3PvsGY6r7cuRmI0l5wwFDjp/Og78P+mYsYb6k3xuB+iSNFUYdt
         A+Kw==
X-Gm-Message-State: AOAM531dltr725N2X4P8P1jETY91i9cz0NDGugY/aaBUXq7hRUvHEqCM
	IaGj7yVAo7f7Z8cjJQSJzmEsoR76u7g=
X-Google-Smtp-Source: ABdhPJxEL0vu4nwzNyR3J956JEJoOeOujPVC5KJzxnwwAl4tWDn5pg1u3SSmqZP54dqdEHdakcdAbA==
X-Received: by 2002:a05:600c:304a:: with SMTP id n10mr9863351wmh.79.1628082012365;
        Wed, 04 Aug 2021 06:00:12 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:895b:15d0:6c2e:72fa])
        by smtp.gmail.com with ESMTPSA id w9sm2241488wmc.19.2021.08.04.06.00.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Aug 2021 06:00:12 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] image/image_types: Convert CONVERSION_CMD/COMPRESS_CMD to new override syntax
Date: Wed,  4 Aug 2021 14:00:10 +0100
Message-Id: <20210804130011.3513634-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For consistency, use override syntax for these variables as well since
it is more consistent with the rest of the image code. We may be able to use
these as proper overrides in due course.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/image.bbclass           |  6 ++--
 meta/classes/image_types.bbclass     | 50 ++++++++++++++--------------
 scripts/contrib/convert-overrides.py |  2 +-
 3 files changed, 29 insertions(+), 29 deletions(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 0321b4f7ae0..df34c7884c5 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -457,11 +457,11 @@ python () {
                     # Create input image first.
                     gen_conversion_cmds(type)
                     localdata.setVar('type', type)
-                    cmd = "\t" + (localdata.getVar("CONVERSION_CMD_" + ctype) or localdata.getVar("COMPRESS_CMD_" + ctype))
+                    cmd = "\t" + (localdata.getVar("CONVERSION_CMD:" + ctype) or localdata.getVar("COMPRESS_CMD:" + ctype))
                     if cmd not in cmds:
                         cmds.append(cmd)
-                    vardeps.add('CONVERSION_CMD_' + ctype)
-                    vardeps.add('COMPRESS_CMD_' + ctype)
+                    vardeps.add('CONVERSION_CMD:' + ctype)
+                    vardeps.add('COMPRESS_CMD:' + ctype)
                     subimage = type + "." + ctype
                     if subimage not in subimages:
                         subimages.append(subimage)
diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
index 6a88ac85adf..e0eb06c1e3b 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -279,31 +279,31 @@ IMAGE_TYPES = " \
 COMPRESSIONTYPES ?= ""
 
 CONVERSIONTYPES = "gz bz2 lzma xz lz4 lzo zip zst sum md5sum sha1sum sha224sum sha256sum sha384sum sha512sum bmap u-boot vmdk vhd vhdx vdi qcow2 base64 gzsync zsync ${COMPRESSIONTYPES}"
-CONVERSION_CMD_lzma = "lzma -k -f -7 ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}"
-CONVERSION_CMD_gz = "gzip -f -9 -n -c --rsyncable ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} > ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.gz"
-CONVERSION_CMD_bz2 = "pbzip2 -f -k ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}"
-CONVERSION_CMD_xz = "xz -f -k -c ${XZ_COMPRESSION_LEVEL} ${XZ_DEFAULTS} --check=${XZ_INTEGRITY_CHECK} ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} > ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.xz"
-CONVERSION_CMD_lz4 = "lz4 -9 -z -l ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.lz4"
-CONVERSION_CMD_lzo = "lzop -9 ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}"
-CONVERSION_CMD_zip = "zip ${ZIP_COMPRESSION_LEVEL} ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.zip ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}"
-CONVERSION_CMD_zst = "zstd -f -k -T0 -c ${ZSTD_COMPRESSION_LEVEL} ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} > ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.zst"
-CONVERSION_CMD_sum = "sumtool -i ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} -o ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.sum ${JFFS2_SUM_EXTRA_ARGS}"
-CONVERSION_CMD_md5sum = "md5sum ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} > ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.md5sum"
-CONVERSION_CMD_sha1sum = "sha1sum ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} > ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.sha1sum"
-CONVERSION_CMD_sha224sum = "sha224sum ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} > ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.sha224sum"
-CONVERSION_CMD_sha256sum = "sha256sum ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} > ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.sha256sum"
-CONVERSION_CMD_sha384sum = "sha384sum ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} > ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.sha384sum"
-CONVERSION_CMD_sha512sum = "sha512sum ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} > ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.sha512sum"
-CONVERSION_CMD_bmap = "bmaptool create ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} -o ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.bmap"
-CONVERSION_CMD_u-boot = "mkimage -A ${UBOOT_ARCH} -O linux -T ramdisk -C none -n ${IMAGE_NAME} -d ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.u-boot"
-CONVERSION_CMD_vmdk = "qemu-img convert -O vmdk ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.vmdk"
-CONVERSION_CMD_vhdx = "qemu-img convert -O vhdx -o subformat=dynamic ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.vhdx"
-CONVERSION_CMD_vhd = "qemu-img convert -O vpc -o subformat=fixed ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.vhd"
-CONVERSION_CMD_vdi = "qemu-img convert -O vdi ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.vdi"
-CONVERSION_CMD_qcow2 = "qemu-img convert -O qcow2 ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.qcow2"
-CONVERSION_CMD_base64 = "base64 ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} > ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.base64"
-CONVERSION_CMD_zsync = "zsyncmake_curl ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}"
-CONVERSION_CMD_gzsync = "zsyncmake_curl -z ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}"
+CONVERSION_CMD:lzma = "lzma -k -f -7 ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}"
+CONVERSION_CMD:gz = "gzip -f -9 -n -c --rsyncable ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} > ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.gz"
+CONVERSION_CMD:bz2 = "pbzip2 -f -k ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}"
+CONVERSION_CMD:xz = "xz -f -k -c ${XZ_COMPRESSION_LEVEL} ${XZ_DEFAULTS} --check=${XZ_INTEGRITY_CHECK} ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} > ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.xz"
+CONVERSION_CMD:lz4 = "lz4 -9 -z -l ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.lz4"
+CONVERSION_CMD:lzo = "lzop -9 ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}"
+CONVERSION_CMD:zip = "zip ${ZIP_COMPRESSION_LEVEL} ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.zip ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}"
+CONVERSION_CMD:zst = "zstd -f -k -T0 -c ${ZSTD_COMPRESSION_LEVEL} ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} > ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.zst"
+CONVERSION_CMD:sum = "sumtool -i ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} -o ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.sum ${JFFS2_SUM_EXTRA_ARGS}"
+CONVERSION_CMD:md5sum = "md5sum ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} > ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.md5sum"
+CONVERSION_CMD:sha1sum = "sha1sum ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} > ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.sha1sum"
+CONVERSION_CMD:sha224sum = "sha224sum ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} > ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.sha224sum"
+CONVERSION_CMD:sha256sum = "sha256sum ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} > ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.sha256sum"
+CONVERSION_CMD:sha384sum = "sha384sum ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} > ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.sha384sum"
+CONVERSION_CMD:sha512sum = "sha512sum ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} > ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.sha512sum"
+CONVERSION_CMD:bmap = "bmaptool create ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} -o ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.bmap"
+CONVERSION_CMD:u-boot = "mkimage -A ${UBOOT_ARCH} -O linux -T ramdisk -C none -n ${IMAGE_NAME} -d ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.u-boot"
+CONVERSION_CMD:vmdk = "qemu-img convert -O vmdk ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.vmdk"
+CONVERSION_CMD:vhdx = "qemu-img convert -O vhdx -o subformat=dynamic ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.vhdx"
+CONVERSION_CMD:vhd = "qemu-img convert -O vpc -o subformat=fixed ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.vhd"
+CONVERSION_CMD:vdi = "qemu-img convert -O vdi ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.vdi"
+CONVERSION_CMD:qcow2 = "qemu-img convert -O qcow2 ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.qcow2"
+CONVERSION_CMD:base64 = "base64 ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} > ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.base64"
+CONVERSION_CMD:zsync = "zsyncmake_curl ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}"
+CONVERSION_CMD:gzsync = "zsyncmake_curl -z ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}"
 CONVERSION_DEPENDS_lzma = "xz-native"
 CONVERSION_DEPENDS_gz = "pigz-native"
 CONVERSION_DEPENDS_bz2 = "pbzip2-native"
diff --git a/scripts/contrib/convert-overrides.py b/scripts/contrib/convert-overrides.py
index fd87deb07b2..1f395deeeb8 100755
--- a/scripts/contrib/convert-overrides.py
+++ b/scripts/contrib/convert-overrides.py
@@ -64,7 +64,7 @@ skips = skips + ["get_appends_for_files", "test_doubleref_remove", "test_bitbake
 skips = skips + ["test_rpm_remove", "test_bitbakelayers_add_remove", "recipe_append_file", "log_data_removed", "recipe_append", "systemd_machine_unit_append"]
 skips = skips + ["recipetool_append", "changetype_remove", "try_appendfile_wc", "test_qemux86_directdisk", "test_layer_appends", "tgz_removed"]
 
-imagevars = ["IMAGE_CMD", "EXTRA_IMAGECMD", "IMAGE_TYPEDEP"]
+imagevars = ["IMAGE_CMD", "EXTRA_IMAGECMD", "IMAGE_TYPEDEP", "CONVERSION_CMD", "COMPRESS_CMD"]
 packagevars = packagevars + imagevars
 
 vars_re = {}
-- 
2.30.2

