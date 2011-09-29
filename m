Received: from tx2ehsobe004.messaging.microsoft.com ([65.55.88.14]
	helo=TX2EHSOBE008.bigfish.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1R98Cm-0000DE-Dl
	for openembedded-core@lists.openembedded.org;
	Thu, 29 Sep 2011 06:26:40 +0200
Received: from mail130-tx2-R.bigfish.com (10.9.14.238) by
	TX2EHSOBE008.bigfish.com (10.9.40.28) with Microsoft SMTP Server id
	14.1.225.22; Thu, 29 Sep 2011 04:21:12 +0000
Received: from mail130-tx2 (localhost.localdomain [127.0.0.1])	by
	mail130-tx2-R.bigfish.com (Postfix) with ESMTP id 8FD594A8364	for
	<openembedded-core@lists.openembedded.org>;
	Thu, 29 Sep 2011 04:21:12 +0000 (UTC)
X-SpamScore: 3
X-BigFish: VS3(zzzz1202h1082kzz8275bh8275dhz2dh2a8h668h839h)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null);
	IPVD:NLI; H:mail.freescale.net; RD:none; EFVD:NLI
X-FB-SS: 13,
Received: from mail130-tx2 (localhost.localdomain [127.0.0.1]) by mail130-tx2
	(MessageSwitch) id 1317270072435808_17178;
	Thu, 29 Sep 2011 04:21:12 +0000 (UTC)
Received: from TX2EHSMHS025.bigfish.com (unknown [10.9.14.244])	by
	mail130-tx2.bigfish.com (Postfix) with ESMTP id 5BD552E004B	for
	<openembedded-core@lists.openembedded.org>;
	Thu, 29 Sep 2011 04:21:12 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by TX2EHSMHS025.bigfish.com
	(10.9.99.125) with Microsoft SMTP Server (TLS) id 14.1.225.22;
	Thu, 29 Sep 2011 04:21:12 +0000
Received: from az33smr01.freescale.net (10.64.34.199) by
	039-SN1MMR1-002.039d.mgd.msft.net (10.84.1.15) with Microsoft SMTP
	Server id 14.1.323.7; Wed, 28 Sep 2011 23:21:11 -0500
Received: from right.am.freescale.net (right.am.freescale.net [10.82.193.13])
	by az33smr01.freescale.net (8.13.1/8.13.0) with ESMTP id
	p8T4LAKo024559	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Sep 2011 23:21:10 -0500 (CDT)
From: Matthew McClintock <msm@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 28 Sep 2011 23:20:55 -0500
Message-ID: <1317270070-14250-1-git-send-email-msm@freescale.com>
X-Mailer: git-send-email 1.7.6.1
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: [PATCH 01/16] libnl2: Fix a race on route/pktloc_syntax.h
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
X-List-Received-Date: Thu, 29 Sep 2011 04:26:40 -0000
Content-Type: text/plain

From: Tom Rini <tom_rini@mentor.com>

At issue is that route/pktloc.c (not generated) depends on
route/pktloc_syntax.h (generated).

Signed-off-by: Tom Rini <tom_rini@mentor.com>
---
 .../libnl/fix-pktloc_syntax_h-race.patch           |   23 ++++++++++++++++++++
 meta/recipes-support/libnl/libnl_2.0.bb            |    3 +-
 2 files changed, 25 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-support/libnl/fix-pktloc_syntax_h-race.patch

diff --git a/meta/recipes-support/libnl/fix-pktloc_syntax_h-race.patch b/meta/recipes-support/libnl/fix-pktloc_syntax_h-race.patch
new file mode 100644
index 0000000..d396f96
--- /dev/null
+++ b/meta/recipes-support/libnl/fix-pktloc_syntax_h-race.patch
@@ -0,0 +1,23 @@
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




