Return-Path: <dev@codyps.com>
Received: from mail-qt0-f193.google.com (mail-qt0-f193.google.com
	[209.85.216.193])
	by mail.openembedded.org (Postfix) with ESMTP id C9E267197E
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Jun 2017 18:46:27 +0000 (UTC)
Received: by mail-qt0-f193.google.com with SMTP id x58so3054041qtc.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 07 Jun 2017 11:46:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=codyps.com; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=OuXExQM13fY/QZU0MJ9DB2E2pVImJROM+1KrAv4+7fE=;
	b=ILQ/YJK3afVpV48HZOT14i3Qp+T/g6tMa7y3UjhSEGaWcsLqMQZ4gnSt/iiT/BUjB5
	DJu7Mc9kQXToH7kZUVIOHzQUXEDFM5QMKw7EvatXsNLqKx582lumpZZekx6XpvvpsGcD
	QPeftjo2CNOyoVoaM3L6Alb4USTdWkLJvzlBo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=OuXExQM13fY/QZU0MJ9DB2E2pVImJROM+1KrAv4+7fE=;
	b=KhlX+3p1qyCNzOU/WUxcx4ngjRyni8o4qB+s+2Nob9hCKgIbob6PzVvlqyzTzC/wwq
	EeR08RJIZ9MAuQRpLdqtcNPGOyTWyUppbBkENzQZHudhNNDp8qVEO8MjoOKTiyvVsOS9
	DXjNieGSYj4YTbPKtRJnWeFkSd96YLfhgOcPbGyb2gqY6T8mBMo5GlT9U6u3c1QjhmFU
	pY8iSAJRgwV6+q0bIn60oKlSq4SYlNtnlUzUZk+K99JzlOnaKKydssn9u76kkaoraCsc
	BOYl4sE9QWBdVEL8ItPqN/IiAFuCRjMjmLzIMH5wvgYix4oUoWdChHDlEMrLWMNkDr+R
	W01w==
X-Gm-Message-State: AKS2vOyM26O9XoIrc7/+Qbr7p53qNwxtz8kUD4Pu7Baoy863auZ+Zs1p
	wMComP9bRm107y4HHzw=
X-Received: by 10.55.102.200 with SMTP id a191mr25479136qkc.259.1496861188544; 
	Wed, 07 Jun 2017 11:46:28 -0700 (PDT)
Received: from localhost (static-72-74-84-52.bstnma.fios.verizon.net.
	[72.74.84.52])
	by smtp.gmail.com with ESMTPSA id g34sm409544qta.46.2017.06.07.11.46.28
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 07 Jun 2017 11:46:28 -0700 (PDT)
From: Cody P Schafer <dev@codyps.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  7 Jun 2017 14:46:21 -0400
Message-Id: <20170607184621.5305-1-dev@codyps.com>
X-Mailer: git-send-email 2.13.0
Cc: Joshua Lock <joshua.g.lock@intel.com>
Subject: [morty][PATCH] gcc-6.2: backport fix of check for empty string in ubsan.c
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
X-List-Received-Date: Wed, 07 Jun 2017 18:46:28 -0000

From: Joshua Lock <joshua.g.lock@intel.com>

Building gcc-cross-initial with GCC7 on the host fails due to the
comparison of a pointer to an integer in ubsan_use_new_style_p, which
is forbidden by ISO C++:

ubsan.c:1474:23: error: ISO C++ forbids comparison between pointer and
integer [-fpermissive]
       || xloc.file == '\0' || xloc.file[0] == '\xff'

Backport the fix from upstream GCC to enable the build with GCC 7

(From OE-Core rev: 7a7fcbab0365b9501c737dbc02715be14dda72a3)

Signed-off-by: Joshua Lock <joshua.g.lock@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Cody P Schafer <dev@codyps.com>
---
 meta/recipes-devtools/gcc/gcc-6.2.inc              |  5 ++--
 .../gcc/gcc-6.2/ubsan-fix-check-empty-string.patch | 28 ++++++++++++++++++++++
 2 files changed, 31 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-devtools/gcc/gcc-6.2/ubsan-fix-check-empty-string.patch

diff --git a/meta/recipes-devtools/gcc/gcc-6.2.inc b/meta/recipes-devtools/gcc/gcc-6.2.inc
index b118995e1d..39ae653805 100644
--- a/meta/recipes-devtools/gcc/gcc-6.2.inc
+++ b/meta/recipes-devtools/gcc/gcc-6.2.inc
@@ -80,8 +80,9 @@ SRC_URI = "\
            file://0047-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch \
            ${BACKPORTS} \
 "
-BACKPORTS = ""
-
+BACKPORTS = "\
+           file://ubsan-fix-check-empty-string.patch \
+"
 SRC_URI[md5sum] = "9768625159663b300ae4de2f4745fcc4"
 SRC_URI[sha256sum] = "9944589fc722d3e66308c0ce5257788ebd7872982a718aa2516123940671b7c5"
 
diff --git a/meta/recipes-devtools/gcc/gcc-6.2/ubsan-fix-check-empty-string.patch b/meta/recipes-devtools/gcc/gcc-6.2/ubsan-fix-check-empty-string.patch
new file mode 100644
index 0000000000..c0127198e0
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-6.2/ubsan-fix-check-empty-string.patch
@@ -0,0 +1,28 @@
+From 8db2cf6353c13f2a84cbe49b689654897906c499 Mon Sep 17 00:00:00 2001
+From: kyukhin <kyukhin@138bc75d-0d04-0410-961f-82ee72b054a4>
+Date: Sat, 3 Sep 2016 10:57:05 +0000
+Subject: [PATCH] gcc/ 	* ubsan.c (ubsan_use_new_style_p): Fix check for empty
+ string.
+
+git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/trunk@239971 138bc75d-0d04-0410-961f-82ee72b054a4
+
+Upstream-Status: Backport
+Signed-off-by: Joshua Lock <joshua.g.lock@intel.com>
+
+---
+ gcc/ubsan.c   | 2 +-
+ 2 files changed, 5 insertions(+), 1 deletion(-)
+
+Index: gcc-6.3.0/gcc/ubsan.c
+===================================================================
+--- gcc-6.3.0.orig/gcc/ubsan.c
++++ gcc-6.3.0/gcc/ubsan.c
+@@ -1471,7 +1471,7 @@ ubsan_use_new_style_p (location_t loc)
+ 
+   expanded_location xloc = expand_location (loc);
+   if (xloc.file == NULL || strncmp (xloc.file, "\1", 2) == 0
+-      || xloc.file == '\0' || xloc.file[0] == '\xff'
++      || xloc.file[0] == '\0' || xloc.file[0] == '\xff'
+       || xloc.file[1] == '\xff')
+     return false;
+ 
-- 
2.13.0


