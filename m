Return-Path: <paul.betafive@gmail.com>
Received: from mail-wg0-f51.google.com (mail-wg0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id CB88C601AF
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Aug 2013 21:31:25 +0000 (UTC)
Received: by mail-wg0-f51.google.com with SMTP id a12so2853029wgh.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Aug 2013 14:31:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=JkehKNThccu+NAI5TMGkUuIJJdYlR6hnwZX4hyIx9Yw=;
	b=M3cVW59J5LYk/eDWQhL/yiZlJBwCbbKv0kkwc4EaPYkWEKoijZCmUPDs+CWHzwZ7Tc
	RnGIwlrDKI5iZsafuG2W7HJmsUhrwPv2brNINqq9wvkm0KDJxFEmQ6jwbxoK7U5oX3zh
	0ar20+l7k3ENNGyg+PpsIJePiKP0GUod9UMpg1J0upSJvjnk4kVVDKMqS6MDvoxUpYQ4
	i/2S2gldiSasSI0juPv/ti3PjcMRiB9UmtWhu+kPquRuXZV+cMGnKv1m/FwhG+EpQK0b
	D7bks2FeemwjVud7zUj6TcLAZpEtQz7ZySP1hQrxbQsDAPblgwHzhzQPhods9mTV3Ypd
	IWOA==
X-Received: by 10.181.13.209 with SMTP id fa17mr8052111wid.12.1375738285431;
	Mon, 05 Aug 2013 14:31:25 -0700 (PDT)
Received: from desktop.betafive.co.uk (94-192-12-83.zone6.bethere.co.uk.
	[94.192.12.83])
	by mx.google.com with ESMTPSA id gg10sm1525465wib.1.2013.08.05.14.31.24
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 05 Aug 2013 14:31:24 -0700 (PDT)
Sender: Paul Barker <paul.betafive@gmail.com>
From: Paul Barker <paul@paulbarker.me.uk>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Mon,  5 Aug 2013 22:31:00 +0100
Message-Id: <1375738260-29990-1-git-send-email-paul@paulbarker.me.uk>
X-Mailer: git-send-email 1.8.3.4
Subject: [PATCH] opkg: Fix possible installation of GPLv3 header
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
X-List-Received-Date: Mon, 05 Aug 2013 21:31:26 -0000

opkg is GPLv2+ licensed but it has optional support for sha256 checksums which
was GPLv3+ licensed. This code is not built unless '--enable-sha256' is passed
to the configure script, the default is equivalent to '--disable-sha256'.

However, the header 'sha256.h', which is GPLv3+ licensed, is in the list of
header files to be installed and thus could end up in the libopkg-dev package.
As this header is installed to '/usr/include/libopkg' it is very unlikely that
it will ever be used. However, if you're uncomfortable with GPLv3 code going
anywhere near your target filesystem you won't want this to happen.

The simplest solution is to replace the sha256 implementation in opkg with the
implementation from coreutils-6.9 which is licensed under GPLv2+. This is
committed to the opkg subversion repository as r652/r653.

The only intervening commit between r650 (previous SRCREV) and this is r651,
which integrates 'obsolete_automake_macros.patch' into the opkg sources. Thus
this patch isn't needed in oe-core anymore.

(Note: Before 873689bbabba25e7be5c12317c04519a7bc8d0ef, this header is only
installed if opkg is built in its source tree (ie. ${B}=${S}). After that commit
the header will always be installed)

Signed-off-by: Paul Barker <paul@paulbarker.me.uk>
---
 .../opkg/opkg/obsolete_automake_macros.patch              | 15 ---------------
 meta/recipes-devtools/opkg/opkg_svn.bb                    |  6 ++----
 2 files changed, 2 insertions(+), 19 deletions(-)
 delete mode 100644 meta/recipes-devtools/opkg/opkg/obsolete_automake_macros.patch

diff --git a/meta/recipes-devtools/opkg/opkg/obsolete_automake_macros.patch b/meta/recipes-devtools/opkg/opkg/obsolete_automake_macros.patch
deleted file mode 100644
index 1f9833a..0000000
--- a/meta/recipes-devtools/opkg/opkg/obsolete_automake_macros.patch
+++ /dev/null
@@ -1,15 +0,0 @@
-Upstream-Status: Pending
-
-Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
-diff -Nurd opkg/configure.ac opkg/configure.ac
---- opkg/configure.ac	2013-02-01 23:01:57.419774077 +0200
-+++ opkg/configure.ac	2013-02-01 23:02:25.643773458 +0200
-@@ -7,7 +7,7 @@
- AC_CONFIG_MACRO_DIR([shave])
-
- AM_INIT_AUTOMAKE
--AM_CONFIG_HEADER(libopkg/config.h)
-+AC_CONFIG_HEADERS(libopkg/config.h)
-
- AC_CANONICAL_HOST
- AC_GNU_SOURCE
diff --git a/meta/recipes-devtools/opkg/opkg_svn.bb b/meta/recipes-devtools/opkg/opkg_svn.bb
index 3a47b95..032578d 100644
--- a/meta/recipes-devtools/opkg/opkg_svn.bb
+++ b/meta/recipes-devtools/opkg/opkg_svn.bb
@@ -1,12 +1,10 @@
 require opkg.inc
 
-SRC_URI = "svn://opkg.googlecode.com/svn;module=trunk;protocol=http \
-           file://obsolete_automake_macros.patch \
-"
+SRC_URI = "svn://opkg.googlecode.com/svn;module=trunk;protocol=http"
 
 S = "${WORKDIR}/trunk"
 
-SRCREV = "650"
+SRCREV = "653"
 PV = "0.1.8+svnr${SRCPV}"
 
 PR = "${INC_PR}.0"
-- 
1.8.3.4


