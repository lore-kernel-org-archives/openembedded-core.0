Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5950C28B2E
	for <webhook@archiver.kernel.org>; Wed, 12 Mar 2025 19:52:56 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web10.4457.1741809166855803464
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Mar 2025 12:52:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=QqOb3RPJ;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.177, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2239aa5da08so4458155ad.3
        for <openembedded-core@lists.openembedded.org>; Wed, 12 Mar 2025 12:52:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1741809166; x=1742413966; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LzvtRwCSNa6vIwAGukn3DwIib8dM8VkdYXYvUUj0m3M=;
        b=QqOb3RPJv1ifm4q0/NcL6/7eRSTogStKNOsnH0BHCno7MUQB5OmHVQF7D6EPqkmx1o
         f1smqC6ZjvxGHFb+ltxu86gSwaHVb+WUIjNRctHzwIFeFUjle/na7eEPMUS8BsgTn+L8
         7spfQ68i0UchREtXK9WkDUHARwuXzb/Jz+mVGM/0kXTRWiDDudYuqHlA168JO7H3dLeF
         XCXRhLfTeJzh3N67BGUxCYdTFvDqZB7opBvgzWSJQwVitSwo+S77D++RsIlO+UpQI0Ap
         etwS+cuQtTpLec6LWBiyw6jAsy0/1Khu5JCfrWZu/NO1HVA4MAz8t9A5kTcCHwxDKvj9
         kx0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741809166; x=1742413966;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LzvtRwCSNa6vIwAGukn3DwIib8dM8VkdYXYvUUj0m3M=;
        b=ZS13AoP68Kkx/3AjX62t/9vtnp5YYZRC72rryJM6ST6LaydVYfQDJnE2AIAOyyfn3i
         9EXIoPHE8X+/3r9EqiulkQKNFl/2U5ic7SYATWogbHYtq49R5Sp8XJRFtWAIVH2ITTlG
         QDyMHLOv+8X+ohAD/QGIO3XkMYffHYEM2mTucqXrNND5iIIjbefGjnGVQ0F3hfeWXfIg
         QAlPEKNel7WUowovTrpWAYC1en2+1vqqjIO/ZgeRPDMf3pVSuzHeNIMiLXvu07YJwNnC
         +dsaN/DrIB8ZHkdALvE/BF3coG5rleN7LXP/HmZFZM9aZlEhxWjOn9YAi3AGHM52WGwe
         Kfpw==
X-Gm-Message-State: AOJu0YzKZ17g2MJ5UwB9BM/a5vQu5SLbKQjAWDsLzDQsoRC35dWpt5qr
	xFyN7FoA7JnkzcXym1nGpzJSp0ic4+ToeWzlKvFGKZTq6ZQoB7rF9MhDVfPD5nS7UJhW3jQ1960
	c
X-Gm-Gg: ASbGnctN91CgZCS6o5PQ++4k5May0qCxHIxICP3nyyBnMK20OHqSB28uojo52NtGIs/
	UBsvIxR/bYqrX7VKU55Ltt2H2yREVXMCWKGSvfE+AcumB2lcX2UAzf/43AZYk5/qxJkYapr3UsM
	N8qm5JBJqgRCcpp1ExVviFKNEsyqbUy69/fEOfXuKExuoqB/WZdw0JlI2yfGE17uHDzUJsUY9SS
	kRxrfWCau3IY12cfAdmmDUGhNHibC/gD2QgvCOrPQoxRhpmsDB6LxtWjqsbewdso1O6i6SZcm0K
	0H0P4rNi6a62b6OOQs3645pCCnwR8gAxX0w=
X-Google-Smtp-Source: AGHT+IFHdbOzQaFyhqj13Szg3eaTTlL0RbUAtr7Ng0qoDrELcoqyYspqZJbU0hhdeZQLOepy6y+D4A==
X-Received: by 2002:a05:6a21:1583:b0:1f5:8622:5ecb with SMTP id adf61e73a8af0-1f586226198mr18941312637.34.1741809166054;
        Wed, 12 Mar 2025 12:52:46 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:5779:a397:ba1c:2b0])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af56093c2f5sm1389955a12.67.2025.03.12.12.52.45
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Mar 2025 12:52:45 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][styhead 04/25] grub: backport strlcpy function
Date: Wed, 12 Mar 2025 12:52:12 -0700
Message-ID: <48cf877397b82449f171190a33a8e723512b8227.1741808973.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1741808973.git.steve@sakoman.com>
References: <cover.1741808973.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Mar 2025 19:52:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212671

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
index c93b9594c8..43ba632ce2 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -18,6 +18,7 @@ SRC_URI = "${GNU_MIRROR}/grub/grub-${PV}.tar.gz \
            file://grub-module-explicitly-keeps-symbole-.module_license.patch \
            file://0001-grub.d-10_linux.in-add-oe-s-kernel-name.patch \
            file://0001-RISC-V-Restore-the-typcast-to-long.patch \
+           file://0001-misc-Implement-grub_strlcpy.patch \
 "
 
 SRC_URI[sha256sum] = "b30919fa5be280417c17ac561bb1650f60cfb80cc6237fa1e2b6f56154cb9c91"
-- 
2.43.0


