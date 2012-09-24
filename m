Received: from co1ehsobe001.messaging.microsoft.com ([216.32.180.184]
	helo=co1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1TGFC1-0008Gd-7x
	for openembedded-core@lists.openembedded.org;
	Mon, 24 Sep 2012 22:23:49 +0200
Received: from mail150-co1-R.bigfish.com (10.243.78.249) by
	CO1EHSOBE011.bigfish.com (10.243.66.74) with Microsoft SMTP Server id
	14.1.225.23; Mon, 24 Sep 2012 19:55:56 +0000
Received: from mail150-co1 (localhost [127.0.0.1])	by
	mail150-co1-R.bigfish.com (Postfix) with ESMTP id CB3E0D00120	for
	<openembedded-core@lists.openembedded.org>;
	Mon, 24 Sep 2012 19:55:56 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 4
X-BigFish: VS4(zzd6f1izz1202h1d1ah1d2ah1082kzz8275bhz2dh2a8h668h839hd24he5bhf0ah107ah1288h12a5h12a9h12bdh12e5h137ah139eh1155h)
Received: from mail150-co1 (localhost.localdomain [127.0.0.1]) by mail150-co1
	(MessageSwitch) id 1348516554921067_25977;
	Mon, 24 Sep 2012 19:55:54 +0000 (UTC)
Received: from CO1EHSMHS015.bigfish.com (unknown [10.243.78.245])	by
	mail150-co1.bigfish.com (Postfix) with ESMTP id DE9C1940045	for
	<openembedded-core@lists.openembedded.org>;
	Mon, 24 Sep 2012 19:55:54 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CO1EHSMHS015.bigfish.com
	(10.243.66.25) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Mon, 24 Sep 2012 19:55:52 +0000
Received: from tx30smr01.am.freescale.net (10.81.153.31) by
	039-SN1MMR1-005.039d.mgd.msft.net (10.84.1.17) with Microsoft SMTP
	Server (TLS) id 14.2.309.3; Mon, 24 Sep 2012 14:55:51 -0500
Received: from right.am.freescale.net (right.am.freescale.net [10.82.176.228])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	q8OJtk7i017699 for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Sep 2012 12:55:50 -0700
From: Matthew McClintock <msm@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 24 Sep 2012 14:55:46 -0500
Message-ID: <1348516546-26005-2-git-send-email-msm@freescale.com>
X-Mailer: git-send-email 1.7.9.7
In-Reply-To: <1348516546-26005-1-git-send-email-msm@freescale.com>
References: <1348516546-26005-1-git-send-email-msm@freescale.com>
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: [PATCH 2/2] libx11: fix nativesdk build on older distros
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
X-List-Received-Date: Mon, 24 Sep 2012 20:23:49 -0000
Content-Type: text/plain

makekeys-makekeys.o: In function `main':
makekeys.c:(.text+0x85): undefined reference to `__isoc99_sscanf'
makekeys.c:(.text+0xa7): undefined reference to `__isoc99_sscanf'
collect2: ld returned 1 exit status
make: *** [makekeys] Error 1

Older libc do not have this defined, we can use the -D_GNU_SOURCE
to the compiler to prevent generating calls to this function and
make linking work

Signed-off-by: Matthew McClintock <msm@freescale.com>
---
 .../xorg-lib/libx11/use_host_cc_for_utils.patch    |   12 ++++++++++++
 meta/recipes-graphics/xorg-lib/libx11_1.5.0.bb     |    3 ++-
 2 files changed, 14 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-graphics/xorg-lib/libx11/use_host_cc_for_utils.patch

diff --git a/meta/recipes-graphics/xorg-lib/libx11/use_host_cc_for_utils.patch b/meta/recipes-graphics/xorg-lib/libx11/use_host_cc_for_utils.patch
new file mode 100644
index 0000000..08ba39a
--- /dev/null
+++ b/meta/recipes-graphics/xorg-lib/libx11/use_host_cc_for_utils.patch
@@ -0,0 +1,12 @@
+Index: libX11-1.5.0/src/Makefile.am
+===================================================================
+--- libX11-1.5.0.orig/src/Makefile.am
++++ libX11-1.5.0/src/Makefile.am
+@@ -420,6 +420,6 @@ ks_tables.h: $(KEYSYMDEFS) $(top_builddi
+ 	mv ks_tables_h $@
+ 
+ $(top_builddir)/src/util/makekeys$(EXEEXT): force
+-	cd util && $(MAKE)
++	cd util && $(MAKE) CC=gcc CCLD=gcc LDFLAGS= CFLAGS=-D_GNU_SOURCE
+ 
+ force:
diff --git a/meta/recipes-graphics/xorg-lib/libx11_1.5.0.bb b/meta/recipes-graphics/xorg-lib/libx11_1.5.0.bb
index 94e2051..3e00dd8 100644
--- a/meta/recipes-graphics/xorg-lib/libx11_1.5.0.bb
+++ b/meta/recipes-graphics/xorg-lib/libx11_1.5.0.bb
@@ -1,11 +1,12 @@
 require libx11.inc
 inherit gettext
 
-PR = "${INC_PR}.2"
+PR = "${INC_PR}.3"
 
 BBCLASSEXTEND = "native nativesdk"
 
 SRC_URI += "file://keysymdef_include.patch"
+SRC_URI_append_virtclass-nativesdk += "file://use_host_cc_for_utils.patch"
 
 SRC_URI[md5sum] = "78b4b3bab4acbdf0abcfca30a8c70cc6"
 SRC_URI[sha256sum] = "c382efd7e92bfc3cef39a4b7f1ecf2744ba4414a705e3bc1e697f75502bd4d86"
-- 
1.7.9.7




