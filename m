Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C627C35FF3
	for <webhook@archiver.kernel.org>; Wed, 12 Mar 2025 19:56:07 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web11.4755.1741809366549976292
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Mar 2025 12:56:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=0qd2VbYV;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.169, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-22334203781so24983925ad.0
        for <openembedded-core@lists.openembedded.org>; Wed, 12 Mar 2025 12:56:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1741809366; x=1742414166; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Te4j0GXjZIcL6U0LhVUyzYuYC5gl5EwURZKnqjGSjjQ=;
        b=0qd2VbYVDyp/uI9QUcKvbutSz38/ljErwGx3Kf3pEJ2e3XgFji8UWmHiX9B0dKtTKl
         A0FfBY6yC1QCl4ssBScc+8L1IvA182WvN5s8WbNK+9HQFybo0v48m9NQ42wAOtdc181l
         iUezC0RvT6VoL7Y4tL6Z4oXItBXruQbKOybaZ7hxfbfSZRf5mlBMe2bufX44kg77iyy2
         dIef/iirm1/DFOfKblLXDzjUSfMt/QKBNz2hI33OxpE646++Kr7mlmgc3AkyYK00dnot
         O0WNR5sR6dQ2WHY4pIh/ZEsRUtHfKvDkuYynNPJxYNIG3E0ATJpsHkY+9s8L6k9KTzmA
         4AxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741809366; x=1742414166;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Te4j0GXjZIcL6U0LhVUyzYuYC5gl5EwURZKnqjGSjjQ=;
        b=KxXFladCSNBBByfb66oZUPlnbFsyVx29BXz8HeOzpoEdNd2QtTq2Vt+GMSVnn4qHYJ
         9kniiAWzu2ovr5lW7dTbyV3/lzX86rMucyQJJWiIf3Yjtt73kbAmCv5YijPYAhp+nxW8
         McW4iQ/jdbkGUyqYNV2vLzP1KR8NWaiAHlVeL+Sng/GDi/UXNbQ1n8ZTxbAbjOjir0zr
         JwX9MD55ebOx2ZsOQSXvgElwY4W62z1Olf2kyORl5es5sLYyCzr9KKuHOUXFwBeoaFTi
         lMrehLmdCHPM/8cJBFw98kxe3I98F+BiML0FJFL8AtFQsazz89tV+GCeX8+UPm7T6XIU
         07GQ==
X-Gm-Message-State: AOJu0YwSil9SN2AFzLQRuePUaNQdhNf+XtOvFdQxnpwMAFa2iwyd8YYF
	X6MqvtT53wtvn0FKS6CfmBGI3iLV0Ysej3i/SUVnNTzAsQ+KLEqlu09FFdaQLhAalHMM9kVXFB2
	o
X-Gm-Gg: ASbGncsm/8LbapY+QPUc5VWXNulGOzV9bJEGIzcGmST5RjYHpIr+iCe+XXmeO6Q4yCG
	Z8qkUJsvNkv3S/bCi7E3anaoDpJUeVwvuEDPie4hV7ya3EJH4h+sp7Wwn8hXhHjAF5n49jpzEMp
	Xg0ixXnZQTSAOGdhsJLjjFiYe3pez/3MKX3esNEWe0/g+EOlBy586C+c5dpIpFRBLCyrVL8GqLx
	B2qy8+KVYaZcd00VPBU4on5hO2xxQLXS6CfRWiyo9vJDaPfdhqDrP4a7O2spKOZg4k5+Oyg2FCG
	XUbIDmZAmJqt//OIJvhWoe2omYxntGT9q08=
X-Google-Smtp-Source: AGHT+IHFz14sf8nAo+YH4rbuyZCJ8kN+oIqKBSmG34P2ISuVsH0dJw5iRMKDlSP+YYKNjEHy0b2/nw==
X-Received: by 2002:a05:6a20:7f83:b0:1ee:45a4:eb3a with SMTP id adf61e73a8af0-1f5ad3d0172mr1372119637.3.1741809365840;
        Wed, 12 Mar 2025 12:56:05 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:5779:a397:ba1c:2b0])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af281287c10sm9830332a12.78.2025.03.12.12.56.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Mar 2025 12:56:05 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 06/28] grub: backport strlcpy function
Date: Wed, 12 Mar 2025 12:55:27 -0700
Message-ID: <c12baf254a37ff4921c2be0e4d3f626a91980d1a.1741809252.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1741809252.git.steve@sakoman.com>
References: <cover.1741809252.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Mar 2025 19:56:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212700

From: Peter Marko <peter.marko@siemens.com>

It is used to fix multiple CVEs.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../0001-misc-Implement-grub_strlcpy.patch    | 68 +++++++++++++++++++
 meta/recipes-bsp/grub/grub2.inc               |  1 +
 2 files changed, 69 insertions(+)
 create mode 100644 meta/recipes-bsp/grub/files/0001-misc-Implement-grub_strlcpy.patch

diff --git a/meta/recipes-bsp/grub/files/0001-misc-Implement-grub_strlcpy.patch b/meta/recipes-bsp/grub/files/0001-misc-Implement-grub_strlcpy.patch
new file mode 100644
index 0000000000..0ff6dff33a
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/0001-misc-Implement-grub_strlcpy.patch
@@ -0,0 +1,68 @@
+From ea703528a8581a2ea7e0bad424a70fdf0aec7d8f Mon Sep 17 00:00:00 2001
+From: B Horn <b@horn.uk>
+Date: Sat, 15 Jun 2024 02:33:08 +0100
+Subject: [PATCH 1/2] misc: Implement grub_strlcpy()
+
+grub_strlcpy() acts the same way as strlcpy() does on most *NIX,
+returning the length of src and ensuring dest is always NUL
+terminated except when size is 0.
+
+Signed-off-by: B Horn <b@horn.uk>
+Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
+
+Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/grub.git/commit/?id=ea703528a8581a2ea7e0bad424a70fdf0aec7d8f]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ include/grub/misc.h | 39 +++++++++++++++++++++++++++++++++++++++
+ 1 file changed, 39 insertions(+)
+
+diff --git a/include/grub/misc.h b/include/grub/misc.h
+index 1578f36c3..14d8f37ac 100644
+--- a/include/grub/misc.h
++++ b/include/grub/misc.h
+@@ -64,6 +64,45 @@ grub_stpcpy (char *dest, const char *src)
+   return d - 1;
+ }
+ 
++static inline grub_size_t
++grub_strlcpy (char *dest, const char *src, grub_size_t size)
++{
++  char *d = dest;
++  grub_size_t res = 0;
++  /*
++   * We do not subtract one from size here to avoid dealing with underflowing
++   * the value, which is why to_copy is always checked to be greater than one
++   * throughout this function.
++   */
++  grub_size_t to_copy = size;
++
++  /* Copy size - 1 bytes to dest. */
++  if (to_copy > 1)
++    while ((*d++ = *src++) != '\0' && ++res && --to_copy > 1)
++      ;
++
++  /*
++   * NUL terminate if size != 0. The previous step may have copied a NUL byte
++   * if it reached the end of the string, but we know dest[size - 1] must always
++   * be a NUL byte.
++   */
++  if (size != 0)
++    dest[size - 1] = '\0';
++
++  /* If there is still space in dest, but are here, we reached the end of src. */
++  if (to_copy > 1)
++    return res;
++
++  /*
++   * If we haven't reached the end of the string, iterate through to determine
++   * the strings total length.
++   */
++  while (*src++ != '\0' && ++res)
++   ;
++
++  return res;
++}
++
+ /* XXX: If grub_memmove is too slow, we must implement grub_memcpy.  */
+ static inline void *
+ grub_memcpy (void *dest, const void *src, grub_size_t n)
diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index c160d15717..f3279f7d2b 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -19,6 +19,7 @@ SRC_URI = "${GNU_MIRROR}/grub/grub-${PV}.tar.gz \
            file://grub-module-explicitly-keeps-symbole-.module_license.patch \
            file://0001-grub.d-10_linux.in-add-oe-s-kernel-name.patch \
            file://0001-RISC-V-Restore-the-typcast-to-long.patch \
+           file://0001-misc-Implement-grub_strlcpy.patch \
 "
 
 SRC_URI[sha256sum] = "b30919fa5be280417c17ac561bb1650f60cfb80cc6237fa1e2b6f56154cb9c91"
-- 
2.43.0


