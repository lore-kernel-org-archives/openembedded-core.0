Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E625EC2BA1B
	for <webhook@archiver.kernel.org>; Tue, 11 Mar 2025 18:11:12 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.web10.17208.1741716666394958817
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Mar 2025 11:11:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=bOt9KDu/;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-256628-20250311181103bbfe16670c855c41d5-b5lb10@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 20250311181103bbfe16670c855c41d5
        for <openembedded-core@lists.openembedded.org>;
        Tue, 11 Mar 2025 19:11:03 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=ztuT4HZdBwD2tFiS5tbgiF935lFSHLCoxpS2ZT0kXwM=;
 b=bOt9KDu/AXsKomOpHYAmlZDGYgMss7NEzkFU/Sc9mv5lM68K3t2JJMuPoxa7C2Nh9h+1fe
 FJNlo/lpKvxWSn5TwWLeAAa7xhNB1tiWX9dCNaCtCJnXTLW6kmiYfFEiDHVClQSY2SPP65Ie
 v1gSa52eRpvwI30JHsQ+x2w2kM9umdW3//2SK2+OGoTVcz6U94zGpnRdkdEMupl/guCFa5xD
 jcqB6K6Y1sl7mufqZDpO7Uau14mCeb77tIkyVzP8YXMPFnMBcDhwMydglFGfxXLMj2wQd5dP
 qOhKoDrbnXLHcHJfNRQpQXHR+tUyLEnUKq0KtKa+qy1o0xI/gKYWLngw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][PATCH 02/17] grub: backport strlcpy function
Date: Tue, 11 Mar 2025 19:09:45 +0100
Message-Id: <20250311181000.8582-2-peter.marko@siemens.com>
In-Reply-To: <20250311181000.8582-1-peter.marko@siemens.com>
References: <20250311181000.8582-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Mar 2025 18:11:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212579

From: Peter Marko <peter.marko@siemens.com>

It is used to fix multiple CVEs.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
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
index a327e7ebdf..a7d24dd68d 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -18,6 +18,7 @@ SRC_URI = "${GNU_MIRROR}/grub/grub-${PV}.tar.gz \
            file://grub-module-explicitly-keeps-symbole-.module_license.patch \
            file://0001-grub.d-10_linux.in-add-oe-s-kernel-name.patch \
            file://0001-RISC-V-Restore-the-typcast-to-long.patch \
+           file://0001-misc-Implement-grub_strlcpy.patch \
 "
 
 SRC_URI[sha256sum] = "b30919fa5be280417c17ac561bb1650f60cfb80cc6237fa1e2b6f56154cb9c91"

