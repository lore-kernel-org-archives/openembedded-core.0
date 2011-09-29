Received: from am1ehsobe001.messaging.microsoft.com ([213.199.154.204]
	helo=AM1EHSOBE001.bigfish.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1R9MMT-00044O-7Y
	for openembedded-core@lists.openembedded.org;
	Thu, 29 Sep 2011 21:33:37 +0200
Received: from mail32-am1-R.bigfish.com (10.3.201.249) by
	AM1EHSOBE001.bigfish.com (10.3.204.21) with Microsoft SMTP Server id
	14.1.225.22; Thu, 29 Sep 2011 19:13:02 +0000
Received: from mail32-am1 (localhost.localdomain [127.0.0.1])	by
	mail32-am1-R.bigfish.com (Postfix) with ESMTP id 118C44103FA	for
	<openembedded-core@lists.openembedded.org>;
	Thu, 29 Sep 2011 19:13:02 +0000 (UTC)
X-SpamScore: 3
X-BigFish: VS3(zzzz1202h1082kzz8275bh8275dhz2dh2a8h668h839h)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null);
	IPVD:NLI; H:mail.freescale.net; RD:none; EFVD:NLI
X-FB-SS: 0,13,
Received: from mail32-am1 (localhost.localdomain [127.0.0.1]) by mail32-am1
	(MessageSwitch) id 1317323525366074_24162;
	Thu, 29 Sep 2011 19:12:05 +0000 (UTC)
Received: from AM1EHSMHS007.bigfish.com (unknown [10.3.201.246])	by
	mail32-am1.bigfish.com (Postfix) with ESMTP id A8DEC9F0234	for
	<openembedded-core@lists.openembedded.org>;
	Thu, 29 Sep 2011 19:11:47 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by AM1EHSMHS007.bigfish.com
	(10.3.207.107) with Microsoft SMTP Server (TLS) id 14.1.225.22;
	Thu, 29 Sep 2011 19:11:38 +0000
Received: from az33smr01.freescale.net (10.64.34.199) by
	039-SN1MMR1-001.039d.mgd.msft.net (10.84.1.13) with Microsoft SMTP
	Server id 14.1.323.7; Thu, 29 Sep 2011 14:11:37 -0500
Received: from right.am.freescale.net (right.am.freescale.net [10.82.193.13])
	by az33smr01.freescale.net (8.13.1/8.13.0) with ESMTP id
	p8TJBauQ012495	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Sep 2011 14:11:36 -0500 (CDT)
From: Matthew McClintock <msm@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 29 Sep 2011 14:11:36 -0500
Message-ID: <1317323496-1818-1-git-send-email-msm@freescale.com>
X-Mailer: git-send-email 1.7.6.1
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: [PATCH v2 01/16] libnl2: Fix a race on route/pktloc_syntax.h
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 29 Sep 2011 19:33:37 -0000
Content-Type: text/plain

From: Tom Rini <tom_rini@mentor.com>

At issue is that route/pktloc.c (not generated) depends on
route/pktloc_syntax.h (generated).

Signed-off-by: Tom Rini <tom_rini@mentor.com>
Signed-off-by: Matthew McClintock <msm@freescale.com>
---
 .../libnl/fix-pktloc_syntax_h-race.patch           |   29 ++++++++++++++++++++
 meta/recipes-support/libnl/libnl_2.0.bb            |    3 +-
 2 files changed, 31 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-support/libnl/fix-pktloc_syntax_h-race.patch

diff --git a/meta/recipes-support/libnl/fix-pktloc_syntax_h-race.patch b/meta/recipes-support/libnl/fix-pktloc_syntax_h-race.patch
new file mode 100644
index 0000000..1c3efb4
--- /dev/null
+++ b/meta/recipes-support/libnl/fix-pktloc_syntax_h-race.patch
@@ -0,0 +1,29 @@
+Upstream-Status: Inappropriate old version / already fixed
+
+libnl has progressed to 0.3.2 and there does not appear to be any
+"make -j" issues with this build after my limited testing on that
+newer version so we can assume this issue is fixed upstream
+
+---
+ lib/Makefile.am |    3 +++
+ 1 file changed, 3 insertions(+)
+
+Index: libnl-2.0/lib/Makefile.am
+===================================================================
+--- libnl-2.0.orig/lib/Makefile.am
++++ libnl-2.0/lib/Makefile.am
+@@ -27,11 +27,14 @@ CLEANFILES = \
+ 	route/pktloc_grammar.c route/pktloc_grammar.h \
+ 	route/pktloc_syntax.c route/pktloc_syntax.h
+ 
++BUILT_SOURCES = route/pktloc_syntax.h
++
+ # Hack to avoid using ylwrap. It does not function correctly in combination
+ # with --header-file=
+ route/pktloc_grammar.c: route/pktloc_grammar.l
+ 	$(LEX) --header-file=route/pktloc_grammar.h $(LFLAGS) -o $@ $^
+ 
++route/pktloc_syntax.h: route/pktloc_syntax.c
+ route/pktloc_syntax.c: route/pktloc_syntax.y
+ 	$(YACC) -d $(YFLAGS) -o $@ $^
+ 
diff --git a/meta/recipes-support/libnl/libnl_2.0.bb b/meta/recipes-support/libnl/libnl_2.0.bb
index 0dfcaf6..5339846 100644
--- a/meta/recipes-support/libnl/libnl_2.0.bb
+++ b/meta/recipes-support/libnl/libnl_2.0.bb
@@ -6,10 +6,11 @@ LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=2b41e13261a330ee784153ecbb6a82bc"
 
 DEPENDS = "flex-native bison-native"
-PR = "r2"
+PR = "r3"
 
 SRC_URI= "http://www.infradead.org/~tgr/libnl/files/${BPN}-${PV}.tar.gz \
           file://fix-makefile.patch \
+	  file://fix-pktloc_syntax_h-race.patch \
          "
 
 SRC_URI[md5sum] = "6aaf1e9802a17a7d702bb0638044ffa7"
-- 
1.7.6.1




