Return-Path: <mcrowe@brightsign.biz>
X-Greylist: delayed 901 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 16 May 2017 12:55:20 UTC
Received: from relay.appriver.com (relay101b.appriver.com [207.97.230.15])
	by mail.openembedded.org (Postfix) with ESMTP id 1CE6277D43
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 May 2017 12:55:20 +0000 (UTC)
X-Note: This Email was scanned by AppRiver SecureTide
X-Note-AR-ScanTimeLocal: 05/16/2017 8:40:18 AM
X-Note: SecureTide Build: 4/27/2017 4:11:48 PM UTC (2.6.18.8)
X-Note: Filtered by 10.238.11.162
X-Policy: brightsign.biz  - brightsign.biz
X-Policy: brightsign.biz  - brightsign.biz
X-Primary: mcrowe@brightsign.biz
X-Virus-Scan: V-
X-Note: ICH-CT/SI:0-868/SG:1 5/16/2017 8:39:20 AM
X-Note-SnifferID: 0
X-Note: TCH-CT/SI:0-31/SG:1 5/16/2017 8:39:20 AM
X-GBUdb-Analysis: 0, 213.210.30.29, Ugly c=0.44763 p=-1 Source Normal
X-Signature-Violations: 0-0-0-3407-c
X-Note: Spam Tests Failed: 
X-Country-Path: ->PRIVATE->United Kingdom->United States
X-Note-Sending-IP: 213.210.30.29
X-Note-Reverse-DNS: elite.brightsigndigital.co.uk
X-Note-Return-Path: mcrowe@brightsign.biz
X-Note: User Rule Hits: 
X-Note: Global Rule Hits: G269 G270 G271 G272 G276 G277 G405 
X-Note: Encrypt Rule Hits: 
X-Note: Mail Class: VALID
X-Note: Headers Injected
Received: from [213.210.30.29] (HELO elite.brightsigndigital.co.uk)
	by relay.appriver.com (CommuniGate Pro SMTP 6.1.7)
	with ESMTPS id 144492296; Tue, 16 May 2017 08:40:18 -0400
Received: from chuckie.brightsign ([172.30.1.25] helo=chuckie)
	by elite.brightsigndigital.co.uk with esmtp (Exim 4.84_2)
	(envelope-from <mcrowe@brightsign.biz>)
	id 1dAblz-000H0f-I8; Tue, 16 May 2017 13:40:19 +0100
Received: from mac by chuckie with local (Exim 4.89)
	(envelope-from <mcrowe@brightsign.biz>)
	id 1dAblz-0004wg-FR; Tue, 16 May 2017 13:40:19 +0100
From: Mike Crowe <mac@mcrowe.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 16 May 2017 13:40:00 +0100
Message-Id: <20170516124000.21432-1-mac@mcrowe.com>
X-Mailer: git-send-email 2.11.0
Cc: Mike Crowe <mac@mcrowe.com>
Subject: [PATCH] gcc-cross-canadian: Use ${target_includedir} for compatibility with meta-micro
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
X-List-Received-Date: Tue, 16 May 2017 12:55:22 -0000

meta-micro puts headers in /include rather than /usr/include in the
sysroot. ${target_includedir} means that the correct path will be used
automatically.

Signed-off-by: Mike Crowe <mac@mcrowe.com>
Acked-by: Phil Blundell <pb@pbcl.net>
---
 meta/recipes-devtools/gcc/gcc-cross-canadian.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-cross-canadian.inc b/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
index ec1d281800..91a6fa6994 100644
--- a/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
+++ b/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
@@ -80,7 +80,7 @@ FILES_${PN} = "\
     ${includedir}/c++/${BINV} \
     ${prefix}/${TARGET_SYS}/bin/* \
     ${prefix}/${TARGET_SYS}/lib/* \
-    ${prefix}/${TARGET_SYS}/usr/include/* \
+    ${prefix}/${TARGET_SYS}${target_includedir}/* \
 "
 INSANE_SKIP_${PN} += "dev-so"
 
@@ -153,7 +153,7 @@ ELFUTILS = "nativesdk-elfutils"
 DEPENDS += "nativesdk-gmp nativesdk-mpfr nativesdk-libmpc ${ELFUTILS} nativesdk-zlib"
 RDEPENDS_${PN} += "nativesdk-mpfr nativesdk-libmpc ${ELFUTILS}"
 
-SYSTEMHEADERS = "/usr/include"
+SYSTEMHEADERS = "${target_includedir}/"
 SYSTEMLIBS = "${target_base_libdir}/"
 SYSTEMLIBS1 = "${target_libdir}/"
 
-- 
2.11.0


