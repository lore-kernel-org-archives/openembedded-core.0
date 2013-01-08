Received: from mail-gg0-f180.google.com ([209.85.161.180])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1TsaCk-00007A-7L
	for openembedded-core@lists.openembedded.org;
	Tue, 08 Jan 2013 15:31:02 +0100
Received: by mail-gg0-f180.google.com with SMTP id c4so72705ggn.25
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Jan 2013 06:15:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=Zo7+ANgisE00RBO8e5IAIRIjvJ9cAupVjGxMxMSzUiQ=;
	b=VU3zkrG8cbjHsvSS3Y/mpPqlh9hWI/uCLBsGORv55JzBBsNAfi8UN39UntN8Jv4rlw
	o+9uZAFnC0f3KV/CTtvU7qNhn5XpR3/nJs/D+3AjcdBjZpqMycV0LiWJ3fa9OTWIA1D3
	Ok2qbScFxYZA7BkYMQLd5NHBVKVHx6j/FaHcAbghoe16+8MEn6qU4JlAaJVuCqpNk7p8
	1amNeu9sjWdAG4nEAOZDcTE0Qd90xVp1oV/XT/ZrQrPbEAb3+viyX1nDeSYE+6JGpkYP
	Ez7+rOSk2x4kREwfklb6mp8CJH0UP4vwcr2SPRQRD79RefMfhDR/EtRdHPsewmQURw6e
	YQag==
X-Received: by 10.236.65.66 with SMTP id e42mr62910587yhd.101.1357654551241;
	Tue, 08 Jan 2013 06:15:51 -0800 (PST)
Received: from nano.lab.ossystems.com.br.lab.ossystems.com.br ([187.23.158.26])
	by mx.google.com with ESMTPS id i23sm71354860yhl.22.2013.01.08.06.15.49
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 08 Jan 2013 06:15:50 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 Jan 2013 12:19:39 -0200
Message-Id: <1357654779-9320-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.10.4
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH] libnl: Update to 3.2.18
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
X-List-Received-Date: Tue, 08 Jan 2013 14:31:05 -0000

This release fixes the build failures found when building against old
Linux kernel headers and also includes the fix for to use 'flex'
instead of 'lex'.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 .../libnl/libnl/fix-build-using-flex.patch         |   55 --------------------
 .../libnl/libnl/fix-pktloc_syntax_h-race.patch     |    2 +-
 .../libnl/{libnl_3.2.16.bb => libnl_3.2.18.bb}     |    7 ++-
 3 files changed, 4 insertions(+), 60 deletions(-)
 delete mode 100644 meta/recipes-support/libnl/libnl/fix-build-using-flex.patch
 rename meta/recipes-support/libnl/{libnl_3.2.16.bb => libnl_3.2.18.bb} (87%)

diff --git a/meta/recipes-support/libnl/libnl/fix-build-using-flex.patch b/meta/recipes-support/libnl/libnl/fix-build-using-flex.patch
deleted file mode 100644
index 89a36ba..0000000
--- a/meta/recipes-support/libnl/libnl/fix-build-using-flex.patch
+++ /dev/null
@@ -1,55 +0,0 @@
-From 89ab8d4f1229a1d2605193686cc00e6b2c9786ff Mon Sep 17 00:00:00 2001
-From: Otavio Salvador <otavio@ossystems.com.br>
-Date: Mon, 7 Jan 2013 15:44:38 -0200
-Subject: [PATCH] Fix build using flex
-
-Upstream-Status: Backport [3.2.17]
----
- lib/Makefile.am     |    4 ++--
- src/lib/Makefile.am |    4 ++--
- 2 files changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/lib/Makefile.am b/lib/Makefile.am
-index 98c7b90..89cc5d2 100644
---- a/lib/Makefile.am
-+++ b/lib/Makefile.am
-@@ -43,14 +43,14 @@ CLEANFILES = \
- route/pktloc.lo: route/pktloc_syntax.h route/pktloc_grammar.h
- route/pktloc_grammar.h: route/pktloc_grammar.c
- route/pktloc_grammar.c: route/pktloc_grammar.l
--	$(AM_V_GEN) $(LEX) --header-file=route/pktloc_grammar.h $(LFLAGS) -o $@ $^
-+	$(AM_V_GEN) $(FLEX) --header-file=route/pktloc_grammar.h $(LFLAGS) -o $@ $^
- 
- route/pktloc_syntax.h: route/pktloc_syntax.c
- route/pktloc_syntax.c: route/pktloc_syntax.y
- 	$(AM_V_GEN) $(YACC) -d $(YFLAGS) -o $@ $^
- 
- route/cls/ematch_grammar.c: route/cls/ematch_grammar.l
--	$(AM_V_GEN) $(LEX) --header-file=route/cls/ematch_grammar.h $(LFLAGS) -o $@ $^
-+	$(AM_V_GEN) $(FLEX) --header-file=route/cls/ematch_grammar.h $(LFLAGS) -o $@ $^
- 
- route/cls/ematch_syntax.c: route/cls/ematch_syntax.y
- 	$(AM_V_GEN) $(YACC) -d $(YFLAGS) -o $@ $^
-diff --git a/src/lib/Makefile.am b/src/lib/Makefile.am
-index 6688e7c..507635d 100644
---- a/src/lib/Makefile.am
-+++ b/src/lib/Makefile.am
-@@ -11,13 +11,13 @@ AM_LDFLAGS = \
- #cls_ematch_cmp_la_LDFLAGS = -module -version-info 2:0:0
- 
- #cls/ematch_grammar.c: cls/ematch_grammar.l
--#	$(LEX) --header-file=cls/ematch_grammar.h $(LFLAGS) -o $@ $^
-+#	$(FLEX) --header-file=cls/ematch_grammar.h $(LFLAGS) -o $@ $^
- 
- #cls/ematch_syntax.c: cls/ematch_syntax.y
- #	$(YACC) -d $(YFLAGS) -o $@ $^
- 
- #cls/pktloc_grammar.c: cls/pktloc_grammar.l
--#	$(LEX) --header-file=cls/pktloc_grammar.h $(LFLAGS) -o $@ $^
-+#	$(FLEX) --header-file=cls/pktloc_grammar.h $(LFLAGS) -o $@ $^
- 
- #cls/pktloc_syntax.c: cls/pktloc_syntax.y
- #	$(YACC) -d $(YFLAGS) -o $@ $^
--- 
-1.7.10.4
-
diff --git a/meta/recipes-support/libnl/libnl/fix-pktloc_syntax_h-race.patch b/meta/recipes-support/libnl/libnl/fix-pktloc_syntax_h-race.patch
index 332ec01..b93d97b 100644
--- a/meta/recipes-support/libnl/libnl/fix-pktloc_syntax_h-race.patch
+++ b/meta/recipes-support/libnl/libnl/fix-pktloc_syntax_h-race.patch
@@ -17,7 +17,7 @@ Index: libnl-3.2.14/lib/Makefile.am
 +route/pktloc.lo: route/pktloc_syntax.h route/pktloc_grammar.h
 +route/pktloc_grammar.h: route/pktloc_grammar.c
  route/pktloc_grammar.c: route/pktloc_grammar.l
- 	$(AM_V_GEN) $(LEX) --header-file=route/pktloc_grammar.h $(LFLAGS) -o $@ $^
+ 	$(AM_V_GEN) $(FLEX) --header-file=route/pktloc_grammar.h $(LFLAGS) -o $@ $^
  
 +route/pktloc_syntax.h: route/pktloc_syntax.c
  route/pktloc_syntax.c: route/pktloc_syntax.y
diff --git a/meta/recipes-support/libnl/libnl_3.2.16.bb b/meta/recipes-support/libnl/libnl_3.2.18.bb
similarity index 87%
rename from meta/recipes-support/libnl/libnl_3.2.16.bb
rename to meta/recipes-support/libnl/libnl_3.2.18.bb
index db9ae9d..0da7f20 100644
--- a/meta/recipes-support/libnl/libnl_3.2.16.bb
+++ b/meta/recipes-support/libnl/libnl_3.2.18.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://www.infradead.org/~tgr/libnl/"
 SECTION = "libs/network"
 
 PE = "1"
-PR = "r1"
+PR = "r0"
 
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
@@ -12,11 +12,10 @@ DEPENDS = "flex-native bison-native"
 
 SRC_URI = "http://www.infradead.org/~tgr/${BPN}/files/${BP}.tar.gz \
            file://fix-pktloc_syntax_h-race.patch \
-           file://fix-build-using-flex.patch \
            file://fix-pc-file.patch "
 
-SRC_URI[md5sum] = "f06e6de102abb2cef71ed671957ee099"
-SRC_URI[sha256sum] = "c43a42336c6a3cf559f390e202f8f029d165bd767da7cf7a32a815c570b31826"
+SRC_URI[md5sum] = "378eafcca1f51d1c7498d78946cd891a"
+SRC_URI[sha256sum] = "6563e4e72a35f9f96380086f6bd17307552977af98e98bd3dd0fdde8013d53a9"
 
 inherit autotools pkgconfig
 
-- 
1.7.10.4



