Received: from co1ehsobe001.messaging.microsoft.com ([216.32.180.184]
	helo=co1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1TBUu4-00042j-MJ
	for openembedded-core@lists.openembedded.org;
	Tue, 11 Sep 2012 20:09:41 +0200
Received: from mail121-co1-R.bigfish.com (10.243.78.230) by
	CO1EHSOBE002.bigfish.com (10.243.66.65) with Microsoft SMTP Server id
	14.1.225.23; Tue, 11 Sep 2012 17:57:09 +0000
Received: from mail121-co1 (localhost [127.0.0.1])	by
	mail121-co1-R.bigfish.com (Postfix) with ESMTP id EE65C7C00DF	for
	<openembedded-core@lists.openembedded.org>;
	Tue, 11 Sep 2012 17:57:08 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 3
X-BigFish: VS3(zzzz1202h1d1ah1d2ah1082kzz8275bhz2dh2a8h668h839hd24he5bhf0ah107ah1288h12a5h12bdh1155h)
Received: from mail121-co1 (localhost.localdomain [127.0.0.1]) by mail121-co1
	(MessageSwitch) id 1347386226821364_10489;
	Tue, 11 Sep 2012 17:57:06 +0000 (UTC)
Received: from CO1EHSMHS004.bigfish.com (unknown [10.243.78.247])	by
	mail121-co1.bigfish.com (Postfix) with ESMTP id C100DA40049	for
	<openembedded-core@lists.openembedded.org>;
	Tue, 11 Sep 2012 17:57:06 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CO1EHSMHS004.bigfish.com
	(10.243.66.14) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Tue, 11 Sep 2012 17:56:59 +0000
Received: from tx30smr01.am.freescale.net (10.81.153.31) by
	039-SN1MMR1-004.039d.mgd.msft.net (10.84.1.14) with Microsoft SMTP
	Server (TLS) id 14.2.309.3; Tue, 11 Sep 2012 12:56:54 -0500
Received: from right.am.freescale.net (right.am.freescale.net [10.82.176.228])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	q8BHurqp005262 for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Sep 2012 10:56:54 -0700
From: Matthew McClintock <msm@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 11 Sep 2012 12:56:53 -0500
Message-ID: <1347386213-6215-1-git-send-email-msm@freescale.com>
X-Mailer: git-send-email 1.7.9.7
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: [PATCH v3] sysvinit-inittab_2.88dsf.bb: only run serial checks at boot if we have items to check
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
X-List-Received-Date: Tue, 11 Sep 2012 18:09:41 -0000
Content-Type: text/plain

Right now, we delay running the serial console checks to we boot up. This causes
issues for read only file systems. So, if have not configured any serial ports to
check via SERIAL_CONSOLES_CHECK we can skip the check at boot. This fixes any
issues with read only file systems and ipk packaging.

Signed-off-by: Matthew McClintock <msm@freescale.com>
---
v2: bump PR
v3: change a == bashism to =

 .../sysvinit/sysvinit-inittab_2.88dsf.bb           |   10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb b/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb
index 1089edb..5b79caf 100644
--- a/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb
+++ b/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "Inittab for sysvinit"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
 
-PR = "r7"
+PR = "r8"
 
 SRC_URI = "file://inittab"
 
@@ -54,7 +54,7 @@ EOF
 
 pkg_postinst_${PN} () {
 # run this on the target
-if [ "x$D" == "x" ]; then
+if [ "x$D" = "x" ]; then
 	tmp="${SERIAL_CONSOLES_CHECK}"
 	for i in $tmp
 	do
@@ -65,7 +65,11 @@ if [ "x$D" == "x" ]; then
 	done
 	kill -HUP 1
 else
-	exit 1
+	if [ "${SERIAL_CONSOLES_CHECK}" = "" ]; then
+		exit 0
+	else
+		exit 1
+	fi
 fi
 }
 
-- 
1.7.9.7




