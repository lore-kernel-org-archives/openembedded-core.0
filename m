Received: from co1ehsobe005.messaging.microsoft.com ([216.32.180.188]
	helo=co1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1THPej-0004sM-Dg
	for openembedded-core@lists.openembedded.org;
	Fri, 28 Sep 2012 03:46:17 +0200
Received: from mail139-co1-R.bigfish.com (10.243.78.246) by
	CO1EHSOBE004.bigfish.com (10.243.66.67) with Microsoft SMTP Server id
	14.1.225.23; Fri, 28 Sep 2012 01:33:24 +0000
Received: from mail139-co1 (localhost [127.0.0.1])	by
	mail139-co1-R.bigfish.com (Postfix) with ESMTP id 2CB27480138	for
	<openembedded-core@lists.openembedded.org>;
	Fri, 28 Sep 2012 01:33:24 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 3
X-BigFish: VS3(zzzz1202h1d1ah1d2ah1082kzz8275bhz2dh2a8h668h839hd24he5bhf0ah107ah1288h12a5h12a9h12bdh12e5h137ah139eh13b6h1155h)
Received: from mail139-co1 (localhost.localdomain [127.0.0.1]) by mail139-co1
	(MessageSwitch) id 1348796002746219_23041;
	Fri, 28 Sep 2012 01:33:22 +0000 (UTC)
Received: from CO1EHSMHS019.bigfish.com (unknown [10.243.78.226])	by
	mail139-co1.bigfish.com (Postfix) with ESMTP id AAA71200043	for
	<openembedded-core@lists.openembedded.org>;
	Fri, 28 Sep 2012 01:33:22 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CO1EHSMHS019.bigfish.com
	(10.243.66.29) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Fri, 28 Sep 2012 01:33:22 +0000
Received: from tx30smr01.am.freescale.net (10.81.153.31) by
	039-SN1MMR1-004.039d.mgd.msft.net (10.84.1.14) with Microsoft SMTP
	Server (TLS) id 14.2.309.3; Thu, 27 Sep 2012 20:33:21 -0500
Received: from right.am.freescale.net (right.am.freescale.net [10.82.176.228])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	q8S1XJaR007331 for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Sep 2012 18:33:21 -0700
From: Matthew McClintock <msm@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 27 Sep 2012 20:33:14 -0500
Message-ID: <1348795994-21695-10-git-send-email-msm@freescale.com>
X-Mailer: git-send-email 1.7.9.7
In-Reply-To: <1348795994-21695-1-git-send-email-msm@freescale.com>
References: <1348795994-21695-1-git-send-email-msm@freescale.com>
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: [PATCH v2 10/10] libx11.inc: fix build issues for older CentOS distros
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
X-List-Received-Date: Fri, 28 Sep 2012 01:46:17 -0000
Content-Type: text/plain

Fixes these sorts of issues present on older gcc (CentOS 5.x in this case)

| cc1: error: unrecognized command line option "-Werror=implicit"
| cc1: error: unrecognized command line option "-Werror=nonnull"
| cc1: error: unrecognized command line option "-Werror=init-self"
| cc1: error: unrecognized command line option "-Werror=main"
| cc1: error: unrecognized command line option "-Werror=missing-braces"
| cc1: error: unrecognized command line option "-Werror=sequence-point"
| cc1: error: unrecognized command line option "-Werror=return-type"
| cc1: error: unrecognized command line option "-Werror=trigraphs"
| cc1: error: unrecognized command line option "-Werror=array-bounds"
| cc1: error: unrecognized command line option "-Werror=write-strings"
| cc1: error: unrecognized command line option "-Werror=address"
| cc1: error: unrecognized command line option "-Werror=int-to-pointer-cast"
| cc1: error: unrecognized command line option "-Werror=pointer-to-int-cast"

Also fixes:

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
This replaces the previous patch series that fixes libx11 issues

 meta/recipes-graphics/xorg-lib/libx11.inc |    5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/xorg-lib/libx11.inc b/meta/recipes-graphics/xorg-lib/libx11.inc
index 3ecd9e5..97bd1c2 100644
--- a/meta/recipes-graphics/xorg-lib/libx11.inc
+++ b/meta/recipes-graphics/xorg-lib/libx11.inc
@@ -11,7 +11,7 @@ inherit siteinfo
 FILESPATH = "${FILE_DIRNAME}/libx11"
 
 PE = "1"
-INC_PR = "r8"
+INC_PR = "r9"
 
 PROVIDES = "virtual/libx11"
 
@@ -23,6 +23,7 @@ DEPENDS += "xproto xextproto xtrans libxcb kbproto inputproto"
 DEPENDS += "xproto-native"
 
 EXTRA_OECONF += "--with-keysymdefdir=${STAGING_INCDIR}/X11/"
+EXTRA_OEMAKE += 'CWARNFLAGS=""'
 
 # Let people with incredibly archaic requirements enable Xcms and BigFont, but
 # disable them by default.
@@ -33,7 +34,7 @@ PACKAGECONFIG[bigfont] = "--enable-xf86bigfont,--disable-xf86bigfont,xf86bigfont
 # src/util/makekeys needs to be compiled natively, so tell it what compiler to
 # use.
 export CC_FOR_BUILD = "${BUILD_CC}"
-export CFLAGS_FOR_BUILD = "${BUILD_CFLAGS}"
+export CFLAGS_FOR_BUILD = "${BUILD_CFLAGS} -D_GNU_SOURCE"
 export CPPFLAGS_FOR_BUILD = "${BUILD_CPPFLAGS}"
 export LDFLAGS_FOR_BUILD = "${BUILD_LDFLAGS}"
 
-- 
1.7.9.7




