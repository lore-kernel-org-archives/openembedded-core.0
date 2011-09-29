Received: from db3ehsobe003.messaging.microsoft.com ([213.199.154.141]
	helo=DB3EHSOBE003.bigfish.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1R98RU-0000XL-Fz
	for openembedded-core@lists.openembedded.org;
	Thu, 29 Sep 2011 06:41:52 +0200
Received: from mail24-db3-R.bigfish.com (10.3.81.251) by
	DB3EHSOBE003.bigfish.com (10.3.84.23) with Microsoft SMTP Server id
	14.1.225.22; Thu, 29 Sep 2011 04:21:20 +0000
Received: from mail24-db3 (localhost.localdomain [127.0.0.1])	by
	mail24-db3-R.bigfish.com (Postfix) with ESMTP id EFBF6E183E6	for
	<openembedded-core@lists.openembedded.org>;
	Thu, 29 Sep 2011 04:21:19 +0000 (UTC)
X-SpamScore: 3
X-BigFish: VS3(zzzz1202h1082kzz8275bhz2dh2a8h668h839h62h)
X-Spam-TCS-SCL: 1:0
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null);
	IPVD:NLI; H:mail.freescale.net; RD:none; EFVD:NLI
Received: from mail24-db3 (localhost.localdomain [127.0.0.1]) by mail24-db3
	(MessageSwitch) id 1317270079759040_5939;
	Thu, 29 Sep 2011 04:21:19 +0000 (UTC)
Received: from DB3EHSMHS014.bigfish.com (unknown [10.3.81.250])	by
	mail24-db3.bigfish.com (Postfix) with ESMTP id A6E2B1118050	for
	<openembedded-core@lists.openembedded.org>;
	Thu, 29 Sep 2011 04:21:19 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by DB3EHSMHS014.bigfish.com
	(10.3.87.114) with Microsoft SMTP Server (TLS) id 14.1.225.22;
	Thu, 29 Sep 2011 04:21:16 +0000
Received: from az33smr01.freescale.net (10.64.34.199) by
	039-SN1MMR1-001.039d.mgd.msft.net (10.84.1.13) with Microsoft SMTP
	Server id 14.1.323.7; Wed, 28 Sep 2011 23:21:14 -0500
Received: from right.am.freescale.net (right.am.freescale.net [10.82.193.13])
	by az33smr01.freescale.net (8.13.1/8.13.0) with ESMTP id
	p8T4LAL1024559	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Sep 2011 23:21:14 -0500 (CDT)
From: Matthew McClintock <msm@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 28 Sep 2011 23:21:06 -0500
Message-ID: <1317270070-14250-12-git-send-email-msm@freescale.com>
X-Mailer: git-send-email 1.7.6.1
In-Reply-To: <1317270070-14250-1-git-send-email-msm@freescale.com>
References: <1317270070-14250-1-git-send-email-msm@freescale.com>
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: [PATCH 12/16] Fix flac build on e500mc cores
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
X-List-Received-Date: Thu, 29 Sep 2011 04:41:52 -0000
Content-Type: text/plain

This core does not have altivec, so we disable it in the build,
also reestablish the config option to enable/disable building
with altivec

If SPE is not detected we always build with altivec which is wrong. This
will check to make sure altivec is enabled and pass build options
through accordingly

Signed-off-by: Matthew McClintock <msm@freescale.com>
---
 .../flac/flac-1.2.1/0001-No-AltiVec-on-SPE.patch   |    4 +++-
 meta/recipes-multimedia/flac/flac_1.2.1.bb         |    5 ++++-
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-multimedia/flac/flac-1.2.1/0001-No-AltiVec-on-SPE.patch b/meta/recipes-multimedia/flac/flac-1.2.1/0001-No-AltiVec-on-SPE.patch
index 658e190..5ca8b35 100644
--- a/meta/recipes-multimedia/flac/flac-1.2.1/0001-No-AltiVec-on-SPE.patch
+++ b/meta/recipes-multimedia/flac/flac-1.2.1/0001-No-AltiVec-on-SPE.patch
@@ -39,15 +39,17 @@ diff --git a/src/libFLAC/Makefile.am b/src/libFLAC/Makefile.am
 index cbfb0ac..5785372 100644
 --- a/src/libFLAC/Makefile.am
 +++ b/src/libFLAC/Makefile.am
-@@ -40,8 +40,13 @@ if FLaC__SYS_DARWIN
+@@ -40,8 +40,15 @@ if FLaC__SYS_DARWIN
  CPUCFLAGS = -faltivec -force_cpusubtype_ALL -DFLAC__NO_ASM
  else
  # Linux-gcc for PPC does not have -force_cpusubtype_ALL, it is Darwin-specific
 +CPUCFLAGS =
 +if FLaC__CPU_PPC_SPE
 +else
++if FLaC__USE_ALTIVEC
 +CPUCFLAGS += -maltivec -mabi=altivec
 +endif
++endif
  #@@@ PPC optimizations temporarily disabled
 -CPUCFLAGS = -maltivec -mabi=altivec -DFLAC__NO_ASM
 +CPUCFLAGS += -DFLAC__NO_ASM
diff --git a/meta/recipes-multimedia/flac/flac_1.2.1.bb b/meta/recipes-multimedia/flac/flac_1.2.1.bb
index 341047a..652d69a 100644
--- a/meta/recipes-multimedia/flac/flac_1.2.1.bb
+++ b/meta/recipes-multimedia/flac/flac_1.2.1.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://COPYING.FDL;md5=ad1419ecc56e060eccf8184a87c4285f \
                     file://include/FLAC/all.h;beginline=64;endline=69;md5=64474f2b22e9e77b28d8b8b25c983a48"
 DEPENDS = "libogg"
 
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/flac/flac-${PV}.tar.gz \
            file://disable-xmms-plugin.patch \
@@ -36,6 +36,9 @@ EXTRA_OECONF = "--disable-oggtest --disable-id3libtest \
                 --without-xmms-exec-prefix \
                 --without-libiconv-prefix \
                 --without-id3lib"
+EXTRA_OECONF_prepend_e500mc = "--disable-altivec "
+EXTRA_OECONF_prepend_e5500 = "--disable-altivec "
+EXTRA_OECONF_prepend_e5500-64b = "--disable-altivec "
 
 PACKAGES += "libflac libflac++ liboggflac liboggflac++"
 FILES_${PN} = "${bindir}/*"
-- 
1.7.6.1




