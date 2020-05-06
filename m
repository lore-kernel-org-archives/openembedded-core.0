Received: from mail2.skidata.com (mail2.skidata.com [91.230.2.91])
 by mx.groups.io with SMTP id smtpd.web10.2814.1588756212476879793
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 May 2020 02:10:13 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@skidata.com header.s=selector1 header.b=a30Qz4lZ;
 spf=pass (domain: skidata.com, ip: 91.230.2.91, mailfrom: prvs=388eec6a1=richard.leitner@skidata.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=skidata.com; i=@skidata.com; q=dns/txt; s=selector1;
  t=1588756212; x=1620292212;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=O2CjBCXwFZdJY/ugg+OZUX6b0osYrqL8/tEt+y3X7rM=;
  b=a30Qz4lZvv/xYBjB8RGKG1rzLDcwTdYvrk8GMeL8kcWtY7rgxZyHxhBQ
   ivb14Jvp5F+xf/xTtzp1ZAcw1QWjJnp4/JDTkqnaLmldB6FIp3TZFyZTa
   E5uLaUYLTjWeYxLrZWOpMB0Y/r89ciZ+DU08lrBUVItdvq2w2sF/UwMya
   c9SAFwd9BAulmzAueOQNbJu4juQ0TGaXlulbGAL4Wmn9hc2Ul5esjPFbP
   z3PbWSZEJ/cTQdAQROEQlrrNZlzFUjwgoeU9HjPLGvju+P+ue+Q5yvh7z
   ZbG7grp0btETdj91LuazdqoQxvef+vhXeh3BFlWMEMIRAHMvzLveafOMb
   Q==;
IronPort-SDR: weCg/jur6jZ3ZxIFhVz8h2pKZNZILY8EN5Z1jaRBftqsgyejyJGzqk5aNxfmhseYVkqoPq45aM
 R6ElTfXX+KjU+0/BD+Ds4bLvIy0sRsZefZfGaZhJ37ML3GF1DvnkGJpSgxuGsz6QnflgYhNKrS
 etMuK78gyW5VoiRMkF5yK75xgoRrE1HS50zr09vSzdiT3GQmPccxGyCe9RY18u14jtBScG2USU
 j1vTeMeZTyEGifPOMbVF1vG7QiYcmDmAdfwjgd/aXroBixc2RStl56qHfe//c1byi9GSsd1Cfi
 SBY=
X-IronPort-AV: E=Sophos;i="5.73,358,1583190000"; 
   d="scan'208";a="2575602"
From: "Richard Leitner" <richard.leitner@skidata.com>
To: <openembedded-core@lists.openembedded.org>
CC: Richard Leitner <richard.leitner@skidata.com>
Subject: [PATCH v2 2/2] cpio: add patch to fix issues with gcc 10
Date: Wed, 6 May 2020 11:09:43 +0200
Message-ID: <20200506090943.2111027-2-richard.leitner@skidata.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200506090943.2111027-1-richard.leitner@skidata.com>
References: <20200506090943.2111027-1-richard.leitner@skidata.com>
MIME-Version: 1.0
Return-Path: richard.leitner@skidata.com
X-Originating-IP: [192.168.111.252]
X-ClientProxiedBy: sdex3srv.skidata.net (192.168.111.81) To
 sdex5srv.skidata.net (192.168.111.83)
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

gcc 10 introduced "-fno-common" as default. Therefore backport the
according cpio patch to fix this issue.

Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
---
 ...ove-superfluous-declaration-of-progr.patch | 28 +++++++++++++++++++
 meta/recipes-extended/cpio/cpio_2.13.bb       |  1 +
 2 files changed, 29 insertions(+)
 create mode 100644 meta/recipes-extended/cpio/cpio-2.13/0002-src-global.c-Remove-superfluous-declaration-of-progr.patch

diff --git a/meta/recipes-extended/cpio/cpio-2.13/0002-src-global.c-Remove-superfluous-declaration-of-progr.patch b/meta/recipes-extended/cpio/cpio-2.13/0002-src-global.c-Remove-superfluous-declaration-of-progr.patch
new file mode 100644
index 0000000000..d48a3b0d19
--- /dev/null
+++ b/meta/recipes-extended/cpio/cpio-2.13/0002-src-global.c-Remove-superfluous-declaration-of-progr.patch
@@ -0,0 +1,28 @@
+From 33e6cb5a28fab3d99bd6818f8c01e6f33805390f Mon Sep 17 00:00:00 2001
+From: Sergey Poznyakoff <gray@gnu.org>
+Date: Mon, 20 Jan 2020 07:45:39 +0200
+Subject: [PATCH] src/global.c: Remove superfluous declaration of program_name
+
+Upstream-Status: Accepted (commit 641d3f4)
+Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
+---
+ src/global.c | 3 ---
+ 1 file changed, 3 deletions(-)
+
+diff --git a/src/global.c b/src/global.c
+index fb3abe9..acf92bc 100644
+--- a/src/global.c
++++ b/src/global.c
+@@ -184,9 +184,6 @@ unsigned int warn_option = 0;
+ /* Extract to standard output? */
+ bool to_stdout_option = false;
+ 
+-/* The name this program was run with.  */
+-char *program_name;
+-
+ /* A pointer to either lstat or stat, depending on whether
+    dereferencing of symlinks is done for input files.  */
+ int (*xstat) ();
+-- 
+2.26.2
+
diff --git a/meta/recipes-extended/cpio/cpio_2.13.bb b/meta/recipes-extended/cpio/cpio_2.13.bb
index ecea8c6d8e..9e35a80f8b 100644
--- a/meta/recipes-extended/cpio/cpio_2.13.bb
+++ b/meta/recipes-extended/cpio/cpio_2.13.bb
@@ -8,6 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=f27defe1e96c2e1ecd4e0c9be8967949"
 
 SRC_URI = "${GNU_MIRROR}/cpio/cpio-${PV}.tar.gz \
            file://0001-Unset-need_charset_alias-when-building-for-musl.patch \
+           file://0002-src-global.c-Remove-superfluous-declaration-of-progr.patch \
            "
 
 SRC_URI[md5sum] = "389c5452d667c23b5eceb206f5000810"
-- 
2.26.2

