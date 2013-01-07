Received: from mail-ie0-f174.google.com ([209.85.223.174])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1TsHHC-0004JH-RK
	for openembedded-core@lists.openembedded.org;
	Mon, 07 Jan 2013 19:18:24 +0100
Received: by mail-ie0-f174.google.com with SMTP id c11so23887132ieb.19
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Jan 2013 10:03:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=dCL1xY8x5mXcKojpFdo+uofUF9A5Uje8GSrixoSLCkY=;
	b=ZlrGpEPYqSYeTIMcEhrbl4aTPMi2XZTsLXSAqhjnOaeMZ/sMPXalwoZAZpXqsASMs7
	qTqLPhhbUyRn82XvM2Cjx9mAmu5WANCz42PqLa4XuNxm2NUdmJ2DR7RSxP9ffXuKQXPd
	oLQUqWEg2sts+io1Vz9tc1N9lXwdzVMuCP+stqS481lGFNARovN7cGwdvvxortNDGBI2
	BAp15K/kzBGAl1wKQUJXVTIGgK4RAvEnxC75ftKVZlJ2IItxDruxpIhV15aslXLc1qXj
	ZzQjXbTZTNvOxQOSGceHshDhwpsKgFqJSwgucWWGQ0zS4LWIBW6eEGyh9BjmaqHP3jXC
	+XfQ==
X-Received: by 10.50.150.142 with SMTP id ui14mr6190096igb.93.1357581792875;
	Mon, 07 Jan 2013 10:03:12 -0800 (PST)
Received: from nano.lab.ossystems.com.br.lab.ossystems.com.br ([187.23.158.26])
	by mx.google.com with ESMTPS id wg2sm7440545igb.13.2013.01.07.10.03.10
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 07 Jan 2013 10:03:12 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Mon,  7 Jan 2013 16:06:55 -0200
Message-Id: <1357582015-16423-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.10.4
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH] libnl: Fix building using flex
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 07 Jan 2013 18:18:32 -0000

The build system has not been fully changed to use flex in 3.2.16 so
we need to finish the conversion. In 3.2.17 this bug has been fixed.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 .../libnl/libnl/fix-build-using-flex.patch         |   55 ++++++++++++++++++++
 meta/recipes-support/libnl/libnl_3.2.16.bb         |    3 +-
 2 files changed, 57 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/libnl/libnl/fix-build-using-flex.patch

diff --git a/meta/recipes-support/libnl/libnl/fix-build-using-flex.patch b/meta/recipes-support/libnl/libnl/fix-build-using-flex.patch
new file mode 100644
index 0000000..89a36ba
--- /dev/null
+++ b/meta/recipes-support/libnl/libnl/fix-build-using-flex.patch
@@ -0,0 +1,55 @@
+From 89ab8d4f1229a1d2605193686cc00e6b2c9786ff Mon Sep 17 00:00:00 2001
+From: Otavio Salvador <otavio@ossystems.com.br>
+Date: Mon, 7 Jan 2013 15:44:38 -0200
+Subject: [PATCH] Fix build using flex
+
+Upstream-Status: Backport [3.2.17]
+---
+ lib/Makefile.am     |    4 ++--
+ src/lib/Makefile.am |    4 ++--
+ 2 files changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/lib/Makefile.am b/lib/Makefile.am
+index 98c7b90..89cc5d2 100644
+--- a/lib/Makefile.am
++++ b/lib/Makefile.am
+@@ -43,14 +43,14 @@ CLEANFILES = \
+ route/pktloc.lo: route/pktloc_syntax.h route/pktloc_grammar.h
+ route/pktloc_grammar.h: route/pktloc_grammar.c
+ route/pktloc_grammar.c: route/pktloc_grammar.l
+-	$(AM_V_GEN) $(LEX) --header-file=route/pktloc_grammar.h $(LFLAGS) -o $@ $^
++	$(AM_V_GEN) $(FLEX) --header-file=route/pktloc_grammar.h $(LFLAGS) -o $@ $^
+ 
+ route/pktloc_syntax.h: route/pktloc_syntax.c
+ route/pktloc_syntax.c: route/pktloc_syntax.y
+ 	$(AM_V_GEN) $(YACC) -d $(YFLAGS) -o $@ $^
+ 
+ route/cls/ematch_grammar.c: route/cls/ematch_grammar.l
+-	$(AM_V_GEN) $(LEX) --header-file=route/cls/ematch_grammar.h $(LFLAGS) -o $@ $^
++	$(AM_V_GEN) $(FLEX) --header-file=route/cls/ematch_grammar.h $(LFLAGS) -o $@ $^
+ 
+ route/cls/ematch_syntax.c: route/cls/ematch_syntax.y
+ 	$(AM_V_GEN) $(YACC) -d $(YFLAGS) -o $@ $^
+diff --git a/src/lib/Makefile.am b/src/lib/Makefile.am
+index 6688e7c..507635d 100644
+--- a/src/lib/Makefile.am
++++ b/src/lib/Makefile.am
+@@ -11,13 +11,13 @@ AM_LDFLAGS = \
+ #cls_ematch_cmp_la_LDFLAGS = -module -version-info 2:0:0
+ 
+ #cls/ematch_grammar.c: cls/ematch_grammar.l
+-#	$(LEX) --header-file=cls/ematch_grammar.h $(LFLAGS) -o $@ $^
++#	$(FLEX) --header-file=cls/ematch_grammar.h $(LFLAGS) -o $@ $^
+ 
+ #cls/ematch_syntax.c: cls/ematch_syntax.y
+ #	$(YACC) -d $(YFLAGS) -o $@ $^
+ 
+ #cls/pktloc_grammar.c: cls/pktloc_grammar.l
+-#	$(LEX) --header-file=cls/pktloc_grammar.h $(LFLAGS) -o $@ $^
++#	$(FLEX) --header-file=cls/pktloc_grammar.h $(LFLAGS) -o $@ $^
+ 
+ #cls/pktloc_syntax.c: cls/pktloc_syntax.y
+ #	$(YACC) -d $(YFLAGS) -o $@ $^
+-- 
+1.7.10.4
+
diff --git a/meta/recipes-support/libnl/libnl_3.2.16.bb b/meta/recipes-support/libnl/libnl_3.2.16.bb
index be3a3a2..db9ae9d 100644
--- a/meta/recipes-support/libnl/libnl_3.2.16.bb
+++ b/meta/recipes-support/libnl/libnl_3.2.16.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://www.infradead.org/~tgr/libnl/"
 SECTION = "libs/network"
 
 PE = "1"
-PR = "r0"
+PR = "r1"
 
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
@@ -12,6 +12,7 @@ DEPENDS = "flex-native bison-native"
 
 SRC_URI = "http://www.infradead.org/~tgr/${BPN}/files/${BP}.tar.gz \
            file://fix-pktloc_syntax_h-race.patch \
+           file://fix-build-using-flex.patch \
            file://fix-pc-file.patch "
 
 SRC_URI[md5sum] = "f06e6de102abb2cef71ed671957ee099"
-- 
1.7.10.4



