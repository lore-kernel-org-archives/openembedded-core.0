Received: from ch1ehsobe005.messaging.microsoft.com ([216.32.181.185]
	helo=ch1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1TBT1v-0001tX-2m
	for openembedded-core@lists.openembedded.org;
	Tue, 11 Sep 2012 18:09:40 +0200
Received: from mail115-ch1-R.bigfish.com (10.43.68.248) by
	CH1EHSOBE005.bigfish.com (10.43.70.55) with Microsoft SMTP Server id
	14.1.225.23; Tue, 11 Sep 2012 15:41:59 +0000
Received: from mail115-ch1 (localhost [127.0.0.1])	by
	mail115-ch1-R.bigfish.com (Postfix) with ESMTP id 14B4A360062	for
	<openembedded-core@lists.openembedded.org>;
	Tue, 11 Sep 2012 15:41:59 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 3
X-BigFish: VS3(zzzz1202h1d1ah1082kzz8275bhz2dh2a8h668h839hd24he5bhf0ah107ah1288h12a5h12bdh1155h)
Received: from mail115-ch1 (localhost.localdomain [127.0.0.1]) by mail115-ch1
	(MessageSwitch) id 134737811858234_8456;
	Tue, 11 Sep 2012 15:41:58 +0000 (UTC)
Received: from CH1EHSMHS008.bigfish.com (snatpool1.int.messaging.microsoft.com
	[10.43.68.249])	by mail115-ch1.bigfish.com (Postfix) with ESMTP id
	F243030009F	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Sep 2012 15:41:57 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CH1EHSMHS008.bigfish.com
	(10.43.70.8) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Tue, 11 Sep 2012 15:41:56 +0000
Received: from tx30smr01.am.freescale.net (10.81.153.31) by
	039-SN1MMR1-004.039d.mgd.msft.net (10.84.1.14) with Microsoft SMTP
	Server (TLS) id 14.2.309.3; Tue, 11 Sep 2012 10:41:55 -0500
Received: from right.am.freescale.net (right.am.freescale.net [10.82.176.228])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	q8BFftkw003555 for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Sep 2012 08:41:55 -0700
From: Matthew McClintock <msm@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 11 Sep 2012 10:41:54 -0500
Message-ID: <1347378114-19897-1-git-send-email-msm@freescale.com>
X-Mailer: git-send-email 1.7.9.7
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: [PATCH v2] sysvinit-inittab_2.88dsf.bb: only run serial checks at boot if we have items to check
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
X-List-Received-Date: Tue, 11 Sep 2012 16:09:40 -0000
Content-Type: text/plain

Right now, we delay running the serial console checks to we boot up. This causes
issues for read only file systems. So, if have not configured any serial ports to
check via SERIAL_CONSOLES_CHECK we can skip the check at boot. This fixes any
issues with read only file systems and ipk packaging.

Signed-off-by: Matthew McClintock <msm@freescale.com>
---
v2: bump PR

 .../sysvinit/sysvinit-inittab_2.88dsf.bb           |    8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb b/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb
index 1089edb..ec27b8c 100644
--- a/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb
+++ b/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "Inittab for sysvinit"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
 
-PR = "r7"
+PR = "r8"
 
 SRC_URI = "file://inittab"
 
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




