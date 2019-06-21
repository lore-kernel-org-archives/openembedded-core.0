Return-Path: <jpewhacker@gmail.com>
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
	[209.85.166.68])
	by mail.openembedded.org (Postfix) with ESMTP id 623246D548
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Jun 2019 13:30:38 +0000 (UTC)
Received: by mail-io1-f68.google.com with SMTP id m24so1250863ioo.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Jun 2019 06:30:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=bq0zXh2tZSGR0a/ZWqit80r0xBs9HJv5HcTDxsYmRe4=;
	b=C3fDJaB+j/3boqh8ufvupkRF+8ivzAVDtYWIOAH31AF8FZ6/5e6ZY4jNyAqvX0NoAj
	mX2v7JVHwL4+o8zlNVS0srHVNAZAQyeSo3qYDmfK3MefbodoPWuFHcFbPZLTEx+cpSEv
	j/U0UhoGydlTh28vhgtD/bjSIX6l8iEAbZk/e4krh3OKHoshNMzo3M5hNqaOc+9bm2T+
	4ONgh0/zMb6fuGKHSvhuymsUBaSx+zP7q5nlG7Auslr/CW0taH4l5HcxJW8om9uWyLmY
	VRusKUKG31HJGgpVhkt+BPKanEVYe19987qibmAfZus1ZUbR26R7HKHsLRjPCkQpjoDM
	pPvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=bq0zXh2tZSGR0a/ZWqit80r0xBs9HJv5HcTDxsYmRe4=;
	b=Hl+LZCQ06zTALdH6F9ptuvtBuTdcbZmDuDOjUiihkwmVD1Zgrfd6/ghaOBn3z0U963
	X4QMmN5iQLh1eQ+XGgDaVDpXhzkSSDFaWVS31fR8vcRlk73zWrAj9472MW1LxySxsKDJ
	O+9kO6pMlkPpBBJ71bbpAt44qjXL63iZczGqLpWbrJvDuVJe7JDUJpbVebocuaWRoMDQ
	BsOwocfxJsAf8kJuz+e7j8KDljtvEGEAZcaJow0LYSZHFu/pQl6ELBY2MjJaOpj7mL0s
	nQo0a6fd15DUumWJ8ZaHT74Q1C4YbtOI0wGj5Dpfa5r6Fm2BBd13RM3BJ4LBbOMbfUfn
	C5IQ==
X-Gm-Message-State: APjAAAXZG5hFvo7DnbAqdDGjU0wuLfJyaRvDh/fDtQ9J4Y6YBkIhen69
	0NeX48vzAm1YTQvhQZZc8l6NuIqy
X-Google-Smtp-Source: APXvYqzl8B17UGcHAgYiWQ1t3fVD/IRxvzgTfSCffFHaUEE7CENsWsLJvUYaDe5G4ikjCZ4GBGUlDA==
X-Received: by 2002:a05:6638:201:: with SMTP id
	e1mr8144241jaq.45.1561123839114; 
	Fri, 21 Jun 2019 06:30:39 -0700 (PDT)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.gmail.com with ESMTPSA id b8sm3831768ioj.16.2019.06.21.06.30.38
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Fri, 21 Jun 2019 06:30:38 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 21 Jun 2019 08:30:30 -0500
Message-Id: <20190621133030.10720-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [PATCH] perl: Reproducible build fixes
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
X-List-Received-Date: Fri, 21 Jun 2019 13:30:38 -0000
Content-Transfer-Encoding: 8bit

Applies two patches that are required to improve the reproducibility of
builds.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 ...onment-variable-to-suppress-comments.patch | 30 +++++++++++++++++
 .../files/0002-Constant-Fix-up-shebang.patch  | 32 +++++++++++++++++++
 meta/recipes-devtools/perl/perl_5.30.0.bb     |  5 +++
 3 files changed, 67 insertions(+)
 create mode 100644 meta/recipes-devtools/perl/files/0001-enc2xs-Add-environment-variable-to-suppress-comments.patch
 create mode 100644 meta/recipes-devtools/perl/files/0002-Constant-Fix-up-shebang.patch

diff --git a/meta/recipes-devtools/perl/files/0001-enc2xs-Add-environment-variable-to-suppress-comments.patch b/meta/recipes-devtools/perl/files/0001-enc2xs-Add-environment-variable-to-suppress-comments.patch
new file mode 100644
index 00000000000..07f153162b0
--- /dev/null
+++ b/meta/recipes-devtools/perl/files/0001-enc2xs-Add-environment-variable-to-suppress-comments.patch
@@ -0,0 +1,30 @@
+From 31a2c5555f9ef32f35d7d5ce1fd09a010ba5f5c6 Mon Sep 17 00:00:00 2001
+From: Joshua Watt <JPEWhacker@gmail.com>
+Date: Mon, 17 Jun 2019 10:47:15 -0500
+Subject: [PATCH 1/2] enc2xs: Add environment variable to suppress comments
+
+Comment generation in enc2xs can now be suppressed by setting the
+ENC2XS_NO_COMMENTS environment variable. This allows enc2xs to produce
+reproducible output by omitting the name of the generating program.
+
+Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
+Upstream-status: Accepted [https://github.com/dankogai/p5-encode/pull/145]
+---
+ cpan/Encode/bin/enc2xs | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/cpan/Encode/bin/enc2xs b/cpan/Encode/bin/enc2xs
+index 619b64b757..bfce9ee735 100644
+--- a/cpan/Encode/bin/enc2xs
++++ b/cpan/Encode/bin/enc2xs
+@@ -144,6 +144,7 @@ getopts('CM:SQqOo:f:n:v',\%opt);
+ $opt{M} and make_makefile_pl($opt{M}, @ARGV);
+ $opt{C} and make_configlocal_pm($opt{C}, @ARGV);
+ $opt{v} ||= $ENV{ENC2XS_VERBOSE};
++$opt{q} ||= $ENV{ENC2XS_NO_COMMENTS};
+ 
+ sub verbose {
+     print STDERR @_ if $opt{v};
+-- 
+2.21.0
+
diff --git a/meta/recipes-devtools/perl/files/0002-Constant-Fix-up-shebang.patch b/meta/recipes-devtools/perl/files/0002-Constant-Fix-up-shebang.patch
new file mode 100644
index 00000000000..e70ff67f726
--- /dev/null
+++ b/meta/recipes-devtools/perl/files/0002-Constant-Fix-up-shebang.patch
@@ -0,0 +1,32 @@
+From 260ebd15e16cd86b9b58e5c5f3a496b3853ca46d Mon Sep 17 00:00:00 2001
+From: Joshua Watt <JPEWhacker@gmail.com>
+Date: Mon, 17 Jun 2019 10:47:23 -0500
+Subject: [PATCH 2/2] Constant: Fix up shebang
+
+The instructions indicate that the script should be explicitly passed to
+"perl -x", so automatically setting the #! to be ^X is unnecessary and
+makes the file non-reproducible when building because ^X could be the
+absolute path to miniperl.
+
+Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
+Upstream-status: Submitted [https://rt.cpan.org/Public/Bug/Display.html?id=129866]
+---
+ cpan/ExtUtils-Constant/lib/ExtUtils/Constant/XS.pm | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/cpan/ExtUtils-Constant/lib/ExtUtils/Constant/XS.pm b/cpan/ExtUtils-Constant/lib/ExtUtils/Constant/XS.pm
+index 14eb809714..d4d074e121 100644
+--- a/cpan/ExtUtils-Constant/lib/ExtUtils/Constant/XS.pm
++++ b/cpan/ExtUtils-Constant/lib/ExtUtils/Constant/XS.pm
+@@ -219,7 +219,7 @@ sub dogfood {
+      Regenerate these constant functions by feeding this entire source file to
+      perl -x
+ 
+-#!$^X -w
++#!/usr/bin/env perl -x -w
+ use ExtUtils::Constant qw (constant_types C_constant XS_constant);
+ 
+ EOT
+-- 
+2.21.0
+
diff --git a/meta/recipes-devtools/perl/perl_5.30.0.bb b/meta/recipes-devtools/perl/perl_5.30.0.bb
index b18a6b69131..e3664290e30 100644
--- a/meta/recipes-devtools/perl/perl_5.30.0.bb
+++ b/meta/recipes-devtools/perl/perl_5.30.0.bb
@@ -19,6 +19,8 @@ SRC_URI = "https://www.cpan.org/src/5.0/perl-${PV}.tar.gz;name=perl \
            file://perl-dynloader.patch \
            file://0001-configure_path.sh-do-not-hardcode-prefix-lib-as-libr.patch \
            file://fix-setgroup.patch \
+           file://0001-enc2xs-Add-environment-variable-to-suppress-comments.patch \
+           file://0002-Constant-Fix-up-shebang.patch \
            "
 SRC_URI_append_class-native = " \
            file://perl-configpm-switch.patch \
@@ -37,6 +39,9 @@ DEPENDS += "db gdbm zlib virtual/crypt"
 
 PERL_LIB_VER = "${@'.'.join(d.getVar('PV').split('.')[0:2])}.0"
 
+# Don't generate comments in enc2xs output files. They are not reproducible
+export ENC2XS_NO_COMMENTS = "1"
+
 do_unpack_append() {
     bb.build.exec_func('do_copy_perlcross', d)
 }
-- 
2.21.0


