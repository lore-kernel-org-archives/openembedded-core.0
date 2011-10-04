Received: from tx2ehsobe002.messaging.microsoft.com ([65.55.88.12]
	helo=TX2EHSOBE003.bigfish.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1RBDDN-0007mt-CU
	for openembedded-core@lists.openembedded.org;
	Wed, 05 Oct 2011 00:11:54 +0200
Received: from mail17-tx2-R.bigfish.com (10.9.14.241) by
	TX2EHSOBE003.bigfish.com (10.9.40.23) with Microsoft SMTP Server id
	14.1.225.22; Tue, 4 Oct 2011 22:06:18 +0000
Received: from mail17-tx2 (localhost.localdomain [127.0.0.1])	by
	mail17-tx2-R.bigfish.com (Postfix) with ESMTP id A74581600080	for
	<openembedded-core@lists.openembedded.org>;
	Tue,  4 Oct 2011 22:06:17 +0000 (UTC)
X-SpamScore: -2
X-BigFish: VS-2(zz444fMzz1202h1082kzz8275bh8275dhz2dh2a8h668h839h)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null);
	IPVD:NLI; H:mail.freescale.net; RD:none; EFVD:NLI
X-FB-SS: 0,13,
Received: from mail17-tx2 (localhost.localdomain [127.0.0.1]) by mail17-tx2
	(MessageSwitch) id 1317765902935991_2425;
	Tue,  4 Oct 2011 22:05:02 +0000 (UTC)
Received: from TX2EHSMHS035.bigfish.com (unknown [10.9.14.244])	by
	mail17-tx2.bigfish.com (Postfix) with ESMTP id 1A9FEC980D5	for
	<openembedded-core@lists.openembedded.org>;
	Tue,  4 Oct 2011 22:03:13 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by TX2EHSMHS035.bigfish.com
	(10.9.99.135) with Microsoft SMTP Server (TLS) id 14.1.225.22;
	Tue, 4 Oct 2011 22:03:09 +0000
Received: from az33smr02.freescale.net (10.64.34.200) by
	039-SN1MMR1-002.039d.mgd.msft.net (10.84.1.15) with Microsoft SMTP
	Server id 14.1.323.7; Tue, 4 Oct 2011 17:03:09 -0500
Received: from right.am.freescale.net (right.am.freescale.net [10.82.193.13])
	by az33smr02.freescale.net (8.13.1/8.13.0) with ESMTP id
	p94M38JG010861	for <openembedded-core@lists.openembedded.org>;
	Tue, 4 Oct 2011 17:03:08 -0500 (CDT)
From: Matthew McClintock <msm@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 4 Oct 2011 17:03:03 -0500
Message-ID: <1317765787-19127-2-git-send-email-msm@freescale.com>
X-Mailer: git-send-email 1.7.6.1
In-Reply-To: <1317765787-19127-1-git-send-email-msm@freescale.com>
References: <1317765787-19127-1-git-send-email-msm@freescale.com>
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: [PATCH 2/6] Fix perl for powerpc64 build
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
X-List-Received-Date: Tue, 04 Oct 2011 22:11:54 -0000
Content-Type: text/plain

Build environment for ARCH was set to powerpc on a powerpc64
build, this adds an override to set this to powerpc64 when
doing this type of build

Signed-off-by: Matthew McClintock <msm@freescale.com>
---
No comments on original patch:

http://lists.linuxtogo.org/pipermail/openembedded-core/2011-September/010340.html

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




