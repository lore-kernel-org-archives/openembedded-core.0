Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01DA2C38145
	for <webhook@archiver.kernel.org>; Fri,  2 Sep 2022 09:51:59 +0000 (UTC)
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [217.70.178.230])
 by mx.groups.io with SMTP id smtpd.web11.4743.1662112311156343642
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Sep 2022 02:51:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=R8J/eK6z;
 spf=pass (domain: bootlin.com, ip: 217.70.178.230,
 mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 10C5B240006;
	Fri,  2 Sep 2022 09:51:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1662112309;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=swKrkGdUwfLnr5bM3wJejCRec7TsSzChs+h3pa+qeGc=;
	b=R8J/eK6zpsIsc43FWpO1Rezz36RyKb2yYZEJEWgG2K41cPDvZ2Q5KtTkitD1O7UetlpEyJ
	P6gswN909uGeNKYowhV/UlmzT8ACgnsLzxhPLVmMW38KV9zkfsOL5HSijjbBPQH/tVqc7+
	W35RFmX1XiDZJ5HZFzIUSwBE+AnsSaqri3gDdYD5qq3Zyp78IGJEkdDB1Bx3t6ligfhKvC
	owMDkC5R7UjDLDMTMzt2zXG0YaSHOvwfuZNJwRMCPCBjIgwb1htep4ku3rI/Ta3ugrejiL
	ApK5HWIpBUdUsMTYQ+d61hj1fxwU8kbeRiIOS8BTnOqg7TjWOXi2EYF+xiX/lQ==
From: alexandre.belloni@bootlin.com
To: openembedded-core@lists.openembedded.org
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH] ruby: drop capstone support
Date: Fri,  2 Sep 2022 11:51:38 +0200
Message-Id: <20220902095138.1096792-1-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Sep 2022 09:51:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170240

From: Alexandre Belloni <alexandre.belloni@bootlin.com>

Upstream dropped capstone support and this also causing us
reproducibility issues.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 ...001-Remove-dependency-on-libcapstone.patch | 36 +++++++++++++++++++
 meta/recipes-devtools/ruby/ruby_3.1.2.bb      |  2 +-
 2 files changed, 37 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/ruby/ruby/0001-Remove-dependency-on-libcapstone.patch

diff --git a/meta/recipes-devtools/ruby/ruby/0001-Remove-dependency-on-libcapstone.patch b/meta/recipes-devtools/ruby/ruby/0001-Remove-dependency-on-libcapstone.patch
new file mode 100644
index 000000000000..5d0f8fcc0955
--- /dev/null
+++ b/meta/recipes-devtools/ruby/ruby/0001-Remove-dependency-on-libcapstone.patch
@@ -0,0 +1,36 @@
+From 222203297966f312109e8eaa2520f2cf2f59c09d Mon Sep 17 00:00:00 2001
+From: Alan Wu <XrXr@users.noreply.github.com>
+Date: Thu, 31 Mar 2022 17:26:28 -0400
+Subject: [PATCH] Remove dependency on libcapstone
+
+We have received reports of build failures due to this configuration
+check modifying compile flags. Since only YJIT devs use this library
+we can remove it to make Ruby easier to build for users.
+
+See: https://github.com/rbenv/ruby-build/discussions/1933
+
+Upstream-Status: Backport
+---
+ configure.ac | 9 ---------
+ 1 file changed, 9 deletions(-)
+
+Index: ruby-3.1.2/configure.ac
+===================================================================
+--- ruby-3.1.2.orig/configure.ac
++++ ruby-3.1.2/configure.ac
+@@ -1244,15 +1244,6 @@ AC_CHECK_LIB(dl, dlopen)	# Dynamic linki
+ AC_CHECK_LIB(dld, shl_load)	# Dynamic linking for HP-UX
+ AC_CHECK_LIB(socket, shutdown)  # SunOS/Solaris
+ 
+-if pkg-config --exists capstone; then
+-   CAPSTONE_CFLAGS=`pkg-config --cflags capstone`
+-   CAPSTONE_LIB_L=`pkg-config --libs-only-L capstone`
+-   LDFLAGS="$LDFLAGS $CAPSTONE_LIB_L"
+-   CFLAGS="$CFLAGS $CAPSTONE_CFLAGS"
+-fi
+-
+-AC_CHECK_LIB(capstone, cs_open) # Capstone disassembler for debugging YJIT
+-
+ dnl Checks for header files.
+ AC_HEADER_DIRENT
+ dnl AC_HEADER_STDC has been checked in AC_USE_SYSTEM_EXTENSIONS
diff --git a/meta/recipes-devtools/ruby/ruby_3.1.2.bb b/meta/recipes-devtools/ruby/ruby_3.1.2.bb
index 6fc1f53b1885..387bfa9b44e1 100644
--- a/meta/recipes-devtools/ruby/ruby_3.1.2.bb
+++ b/meta/recipes-devtools/ruby/ruby_3.1.2.bb
@@ -12,6 +12,7 @@ SRC_URI += " \
            file://0005-Mark-Gemspec-reproducible-change-fixing-784225-too.patch \
            file://0006-Make-gemspecs-reproducible.patch \
            file://0001-vm_dump.c-Define-REG_S1-and-REG_S2-for-musl-riscv.patch \
+           file://0001-Remove-dependency-on-libcapstone.patch \
            "
 
 SRC_URI[sha256sum] = "61843112389f02b735428b53bb64cf988ad9fb81858b8248e22e57336f24a83e"
@@ -25,7 +26,6 @@ PACKAGECONFIG[ipv6] = "--enable-ipv6, --disable-ipv6,"
 # rdoc is off by default due to non-reproducibility reported in
 # https://bugs.ruby-lang.org/issues/18456
 PACKAGECONFIG[rdoc] = "--enable-install-rdoc,--disable-install-rdoc,"
-PACKAGECONFIG[capstone] = "--with-capstone=yes, --with-capstone=no"
 
 EXTRA_OECONF = "\
     --disable-versioned-paths \
-- 
2.37.2


