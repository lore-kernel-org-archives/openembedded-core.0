Return-Path: <martin.jansa@gmail.com>
Received: from mail-la0-f41.google.com (unknown [209.85.215.41])
	by mail.openembedded.org (Postfix) with ESMTP id 796996609D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 May 2014 11:34:52 +0000 (UTC)
Received: by mail-la0-f41.google.com with SMTP id e16so1798022lan.14
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 May 2014 04:34:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=Lmf2i0pvNYuE3c0YiuEc+x8Cge7RDAgmNva9a4vmm0Q=;
	b=Is4MhAdK5WV/PyAed+jXbmnskuvAAxJmaRWGBIIsWLAeA7G+++ILDVZMPceAfoTl5H
	tQRJp8EbzsbkyOxeHkEe8ux1NQgh9mcrx/VxMhE+rvMhPIcZaNvjkuWF9y5iGxIWdyB4
	txqI5vm2PFL9WrUMZ69FLAnFUUUKFsBFdoj92QHgZzqVpCQbHcxH02P8z/+H+wYrJTTt
	/kVqC5Frb7ejDZXp8OUl4FFXQWFz/o0+GNxNK+xzFYCuUEddO1PmY/haxAlSL2feML3k
	ZXHRB81Dakyo2BUdXdmbcIODPTpo/+ceVPReK5zWlXBcBQ95HSmfk/D4ylsiMxtGBmyr
	sC/A==
X-Received: by 10.112.137.136 with SMTP id qi8mr204lbb.91.1399894492566;
	Mon, 12 May 2014 04:34:52 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	g6sm11483228laa.10.2014.05.12.04.34.51
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 12 May 2014 04:34:51 -0700 (PDT)
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 12 May 2014 13:34:56 +0200
Message-Id: <2125ae8f28196ae3b0b911fc78acabad960e7e98.1399894447.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.9.2
In-Reply-To: <cover.1399894447.git.Martin.Jansa@gmail.com>
References: <cover.1399894447.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1399894447.git.Martin.Jansa@gmail.com>
References: <cover.1399894447.git.Martin.Jansa@gmail.com>
Subject: [daisy][PATCH 07/10] console-tools: Remove floating runtime dependency on flex
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
X-List-Received-Date: Mon, 12 May 2014 11:34:54 -0000

From: Jacob Kroon <jacob.kroon@mikrodidakt.se>

The 'loadkeys' program defines its own yywrap()/yylex() functions,
there is no need to link with flex shared library.

Signed-off-by: Jacob Kroon <jacob.kroon@mikrodidakt.se>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../console-tools-0.3.2/no-dep-on-libfl.patch         | 19 +++++++++++++++++++
 .../recipes-core/console-tools/console-tools_0.3.2.bb |  1 +
 2 files changed, 20 insertions(+)
 create mode 100644 meta/recipes-core/console-tools/console-tools-0.3.2/no-dep-on-libfl.patch

diff --git a/meta/recipes-core/console-tools/console-tools-0.3.2/no-dep-on-libfl.patch b/meta/recipes-core/console-tools/console-tools-0.3.2/no-dep-on-libfl.patch
new file mode 100644
index 0000000..a6735a5
--- /dev/null
+++ b/meta/recipes-core/console-tools/console-tools-0.3.2/no-dep-on-libfl.patch
@@ -0,0 +1,19 @@
+No reason to link with libfl since 'loadkeys' implements
+its own yywrap()/yylex() functions.
+
+Upstream-Status: Pending
+Signed-off-by: Jacob Kroon <jacob.kroon@mikrodidakt.se>
+
+Index: console-tools-0.3.2/kbdtools/Makefile.am
+===================================================================
+--- console-tools-0.3.2.orig/kbdtools/Makefile.am
++++ console-tools-0.3.2/kbdtools/Makefile.am
+@@ -19,8 +19,6 @@ LDADD = ../lib/ctlocal/libctlocal.a ../l
+ 	../lib/cfont/libcfont.la \
+ 	../lib/console/libconsole.la ../lib/generic/libctgeneric.la
+ 
+-loadkeys_LDADD = $(LDADD) @LEXLIB@
+-
+ bin_SCRIPTS = mk_modmap
+ 
+ noinst_HEADERS = loadkeys.h
diff --git a/meta/recipes-core/console-tools/console-tools_0.3.2.bb b/meta/recipes-core/console-tools/console-tools_0.3.2.bb
index 80fab55..c60a5a0 100644
--- a/meta/recipes-core/console-tools/console-tools_0.3.2.bb
+++ b/meta/recipes-core/console-tools/console-tools_0.3.2.bb
@@ -13,6 +13,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/lct/console-tools-${PV}.tar.gz \
            file://uclibc-fileno.patch \
            file://nodocs.patch \
            file://fix-libconsole-linking.patch \
+           file://no-dep-on-libfl.patch \
            file://lcmessage.m4 \
            file://Makevars"
 
-- 
1.9.2


