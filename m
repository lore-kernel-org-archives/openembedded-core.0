Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 3C2146C0E1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Nov 2018 11:42:18 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id y139so1896302wmc.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Nov 2018 03:42:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=WFKs7sFSKxzqOVDvpJI9OSJrZjJilyOKcujQPaTt1EA=;
	b=E332hWvhyahUHgMiH3XsVLTit+M76GeqU3KWFS0OSY1t0RQHB4AE6SXw7yTwz1yRuQ
	BsOMF5Mz6XqrYGyzhE6n6eXUJN225KeGwTofwGYosLS9GR2yEBwWjKWHvlNFjzs6ZcSs
	SzVoRihn/jJRToDYO5A0gfyvZugjbs0/cF8U6JkA1J/bGX/EkeYCX9VfrmWhFZfFQt4Q
	3N7CtuAeHTeGAoxoYstR1xmwdl9TuB07bLVVTMc4wYPoY2yrVNm2hI6xo4/nTP763oSK
	93tR9CiEHOElnrLgMsq4tWsTTPWfzUTmNf9oyWt2/fUO4zwILz4mGLTEAil/hiVng1fE
	fauA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=WFKs7sFSKxzqOVDvpJI9OSJrZjJilyOKcujQPaTt1EA=;
	b=oETVkrW1yBhBmDwACo4UHiFVS6H3l4jrFfQke2tjAJ1aesAIHy5BtWHNhaztQY19k1
	boN+zVGb92On00zyMRwzGsWf3pyC3KCmz56U2C5UECbDttl6s+W3s0pyCpvNtMAU0Oty
	ib3hiZduDDXsSpDP4ZmTVsbn2X+kaoZ5pir7nBf69rydoI+ERGMuWiOJOhkUfq/jG0RA
	7LF2/EcXfA2Z9y0sPh/xd+HxEDufJESR8SasxV5TXEJBn+thjFhBUIA8n5XE4qF700l0
	bv61aRBWTV2gWr/NnilunzuxAOxwO9qstakFi47rKMPd127TzICL71yB8UJ4LE5R2UJc
	B3uA==
X-Gm-Message-State: AA+aEWZREZo+cs915S/iR26dl9IYM5zCnkFKYWUG1pNhyCHNGcZha6bp
	Nwi6LP9IpsCUwMtq/hwHE2WDerYZonc=
X-Google-Smtp-Source: AFSGD/WTpMWLY5HFwWfqUwB3ecsnSxNnqGC5VQTyDGmKCZSsA9Cb7Fwa2uVVK4aPWmPUpSdhZzgBew==
X-Received: by 2002:a1c:cc1:: with SMTP id
	184-v6mr1502282wmm.102.1543491738448; 
	Thu, 29 Nov 2018 03:42:18 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	q12sm1568081wrx.31.2018.11.29.03.42.17
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 29 Nov 2018 03:42:17 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 29 Nov 2018 11:42:14 +0000
Message-Id: <20181129114215.4679-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH 1/2] cpio: fix crash when appending to archives
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 29 Nov 2018 11:42:18 -0000

The upstream fix for CVE-2016-2037 introduced a read from uninitialized memory
bug when appending to an existing archive, which is an operation we perform when
building an image.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../cpio-2.12/0001-Fix-segfault-with-append.patch  | 87 ++++++++++++++++++++++
 meta/recipes-extended/cpio/cpio_2.12.bb            |  1 +
 2 files changed, 88 insertions(+)
 create mode 100644 meta/recipes-extended/cpio/cpio-2.12/0001-Fix-segfault-with-append.patch

diff --git a/meta/recipes-extended/cpio/cpio-2.12/0001-Fix-segfault-with-append.patch b/meta/recipes-extended/cpio/cpio-2.12/0001-Fix-segfault-with-append.patch
new file mode 100644
index 00000000000..2043c890cde
--- /dev/null
+++ b/meta/recipes-extended/cpio/cpio-2.12/0001-Fix-segfault-with-append.patch
@@ -0,0 +1,87 @@
+Upstream-Status: Submitted [bugs-cpio]
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+From 3f0bd5a40ad0ceaee78c74a52a7166ed7f08db81 Mon Sep 17 00:00:00 2001
+From: Pavel Raiskup <praiskup@redhat.com>
+Date: Thu, 29 Nov 2018 07:03:48 +0100
+Subject: [PATCH] Fix segfault with --append
+
+The --append mode combines both process_copy_in() and
+process_copy_out() methods, each of them working with different
+(local) file_hdr->c_name buffers.  So ensure that
+cpio_set_c_name() isn't using the same static variable for
+maintaining length of different buffers.
+
+Complements d36ec5f4e93130efb24fb9.  Thanks to Ross Burton.
+
+* src/copyin.c (process_copy_in): Always initialize file_hdr.
+* src/copyout.c (process_copy_out): Likewise.
+* src/cpiohdr.h (cpio_file_stat): Add c_name_buflen variable.
+* src/util.c (cpio_set_c_name): Use file_hdr->c_name_buflen.
+---
+ src/copyin.c  | 1 +
+ src/copyout.c | 1 +
+ src/cpiohdr.h | 1 +
+ src/util.c    | 3 ++-
+ 4 files changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/src/copyin.c b/src/copyin.c
+index ba887ae..767c2f8 100644
+--- a/src/copyin.c
++++ b/src/copyin.c
+@@ -1213,6 +1213,7 @@ process_copy_in ()
+ 
+   newdir_umask = umask (0);     /* Reset umask to preserve modes of
+ 				   created files  */
++  memset (&file_hdr, 0, sizeof (struct cpio_file_stat));
+   
+   /* Initialize the copy in.  */
+   if (pattern_file_name)
+diff --git a/src/copyout.c b/src/copyout.c
+index 7532dac..fb890cb 100644
+--- a/src/copyout.c
++++ b/src/copyout.c
+@@ -594,6 +594,7 @@ process_copy_out ()
+ 
+   /* Initialize the copy out.  */
+   ds_init (&input_name, 128);
++  memset (&file_hdr, 0, sizeof (struct cpio_file_stat));
+   file_hdr.c_magic = 070707;
+ 
+   /* Check whether the output file might be a tape.  */
+diff --git a/src/cpiohdr.h b/src/cpiohdr.h
+index 588135b..cf64f3e 100644
+--- a/src/cpiohdr.h
++++ b/src/cpiohdr.h
+@@ -127,6 +127,7 @@ struct cpio_file_stat /* Internal representation of a CPIO header */
+   uint32_t c_chksum;
+   char *c_name;
+   char *c_tar_linkname;
++  size_t c_name_buflen;
+ };
+ 
+ void cpio_set_c_name(struct cpio_file_stat *file_hdr, char *name);
+diff --git a/src/util.c b/src/util.c
+index 10486dc..1256469 100644
+--- a/src/util.c
++++ b/src/util.c
+@@ -1413,7 +1413,7 @@ set_file_times (int fd,
+ void
+ cpio_set_c_name (struct cpio_file_stat *file_hdr, char *name)
+ {
+-  static size_t buflen = 0;
++  size_t buflen = file_hdr->c_name_buflen;
+   size_t len = strlen (name) + 1;
+ 
+   if (buflen == 0)
+@@ -1430,6 +1430,7 @@ cpio_set_c_name (struct cpio_file_stat *file_hdr, char *name)
+     }
+ 
+   file_hdr->c_namesize = len;
++  file_hdr->c_name_buflen = buflen;
+   memmove (file_hdr->c_name, name, len);
+ }
+ 
+-- 
+2.11.0
+
diff --git a/meta/recipes-extended/cpio/cpio_2.12.bb b/meta/recipes-extended/cpio/cpio_2.12.bb
index 69d36983e39..6ba8337e5d9 100644
--- a/meta/recipes-extended/cpio/cpio_2.12.bb
+++ b/meta/recipes-extended/cpio/cpio_2.12.bb
@@ -10,6 +10,7 @@ SRC_URI = "${GNU_MIRROR}/cpio/cpio-${PV}.tar.gz \
            file://0001-Unset-need_charset_alias-when-building-for-musl.patch \
            file://0001-Fix-CVE-2015-1197.patch \
            file://0001-CVE-2016-2037-1-byte-out-of-bounds-write.patch \
+           file://0001-Fix-segfault-with-append.patch \
            "
 
 SRC_URI[md5sum] = "fc207561a86b63862eea4b8300313e86"
-- 
2.11.0


