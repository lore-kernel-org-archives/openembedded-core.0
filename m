Received: from tx2ehsobe002.messaging.microsoft.com ([65.55.88.12]
	helo=TX2EHSOBE004.bigfish.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1R98RW-0000Wd-OI
	for openembedded-core@lists.openembedded.org;
	Thu, 29 Sep 2011 06:41:55 +0200
Received: from mail187-tx2-R.bigfish.com (10.9.14.240) by
	TX2EHSOBE004.bigfish.com (10.9.40.24) with Microsoft SMTP Server id
	14.1.225.22; Thu, 29 Sep 2011 04:21:13 +0000
Received: from mail187-tx2 (localhost.localdomain [127.0.0.1])	by
	mail187-tx2-R.bigfish.com (Postfix) with ESMTP id BAB041AD010A	for
	<openembedded-core@lists.openembedded.org>;
	Thu, 29 Sep 2011 04:21:13 +0000 (UTC)
X-SpamScore: -2
X-BigFish: VS-2(zz444fMzz1202h1082kzz8275bhz2dh2a8h668h839h)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null);
	IPVD:NLI; H:mail.freescale.net; RD:none; EFVD:NLI
X-FB-SS: 0,13,
Received: from mail187-tx2 (localhost.localdomain [127.0.0.1]) by mail187-tx2
	(MessageSwitch) id 1317270073676728_5494;
	Thu, 29 Sep 2011 04:21:13 +0000 (UTC)
Received: from TX2EHSMHS012.bigfish.com (unknown [10.9.14.245])	by
	mail187-tx2.bigfish.com (Postfix) with ESMTP id 96B6ABE804F	for
	<openembedded-core@lists.openembedded.org>;
	Thu, 29 Sep 2011 04:21:13 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by TX2EHSMHS012.bigfish.com
	(10.9.99.112) with Microsoft SMTP Server (TLS) id 14.1.225.22;
	Thu, 29 Sep 2011 04:21:13 +0000
Received: from az33smr01.freescale.net (10.64.34.199) by
	039-SN1MMR1-002.039d.mgd.msft.net (10.84.1.15) with Microsoft SMTP
	Server id 14.1.323.7; Wed, 28 Sep 2011 23:21:13 -0500
Received: from right.am.freescale.net (right.am.freescale.net [10.82.193.13])
	by az33smr01.freescale.net (8.13.1/8.13.0) with ESMTP id
	p8T4LAKt024559	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Sep 2011 23:21:12 -0500 (CDT)
From: Matthew McClintock <msm@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 28 Sep 2011 23:21:00 -0500
Message-ID: <1317270070-14250-6-git-send-email-msm@freescale.com>
X-Mailer: git-send-email 1.7.6.1
In-Reply-To: <1317270070-14250-1-git-send-email-msm@freescale.com>
References: <1317270070-14250-1-git-send-email-msm@freescale.com>
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: [PATCH 06/16] Fix perl for powerpc64 build
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
X-List-Received-Date: Thu, 29 Sep 2011 04:41:55 -0000
Content-Type: text/plain

Build environment for ARCH was set to powerpc on a powerpc64
build, this adds an override to set this to powerpc64 when
doing this type of build

Signed-off-by: Matthew McClintock <msm@freescale.com>
---
 meta/recipes-devtools/perl/perl_5.12.3.bb |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/perl/perl_5.12.3.bb b/meta/recipes-devtools/perl/perl_5.12.3.bb
index e4769a4..d1ac0e8 100644
--- a/meta/recipes-devtools/perl/perl_5.12.3.bb
+++ b/meta/recipes-devtools/perl/perl_5.12.3.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://Copying;md5=2b4c6ffbcfcbdee469f02565f253d81a \
 # We need gnugrep (for -I)
 DEPENDS = "virtual/db grep-native"
 DEPENDS += "gdbm zlib"
-PR = "r5"
+PR = "r6"
 
 # 5.10.1 has Module::Build built-in
 PROVIDES += "libmodule-build-perl"
@@ -95,6 +95,8 @@ export LDDLFLAGS = "${LDFLAGS} -shared"
 # We're almost Debian, aren't we?
 CFLAGS += "-DDEBIAN"
 
+export ARCH_powerpc64 = "powerpc64"
+
 do_nolargefile() {
 	sed -i -e "s,\(uselargefiles=\)'define',\1'undef',g" \
 		-e "s,\(d_readdir64_r=\)'define',\1'undef',g" \
@@ -156,7 +158,7 @@ do_configure() {
             config.sh-${TARGET_ARCH}-${TARGET_OS}
 
 	case "${TARGET_ARCH}" in
-		x86_64 | powerpc | s390)
+		x86_64 | powerpc | powerpc64 | s390)
 			sed -i -e "s,\(need_va_copy=\)'undef',\1'define',g" \
 				config.sh-${TARGET_ARCH}-${TARGET_OS}
 			;;
-- 
1.7.6.1




