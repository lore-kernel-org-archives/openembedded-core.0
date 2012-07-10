Received: from am1ehsobe006.messaging.microsoft.com ([213.199.154.209]
	helo=am1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1SohjI-000258-Ia
	for openembedded-core@lists.openembedded.org;
	Tue, 10 Jul 2012 23:12:20 +0200
Received: from mail31-am1-R.bigfish.com (10.3.201.234) by
	AM1EHSOBE008.bigfish.com (10.3.204.28) with Microsoft SMTP Server id
	14.1.225.23; Tue, 10 Jul 2012 19:58:26 +0000
Received: from mail31-am1 (localhost [127.0.0.1])	by mail31-am1-R.bigfish.com
	(Postfix) with ESMTP id 8BEAF20061	for
	<openembedded-core@lists.openembedded.org>;
	Tue, 10 Jul 2012 19:58:26 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 3
X-BigFish: VS3(zzzz1202h1082kzz8275bhz2dh2a8h668h839hd24he5bhf0ah107ah)
Received: from mail31-am1 (localhost.localdomain [127.0.0.1]) by mail31-am1
	(MessageSwitch) id 134195030498378_8397; Tue, 10 Jul 2012 19:58:24 +0000
	(UTC)
Received: from AM1EHSMHS011.bigfish.com (unknown [10.3.201.239])	by
	mail31-am1.bigfish.com (Postfix) with ESMTP id 1689C42006B	for
	<openembedded-core@lists.openembedded.org>;
	Tue, 10 Jul 2012 19:58:24 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by AM1EHSMHS011.bigfish.com
	(10.3.207.111) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Tue, 10 Jul 2012 19:58:23 +0000
Received: from tx30smr01.am.freescale.net (10.81.153.31) by
	039-SN1MMR1-003.039d.mgd.msft.net (10.84.1.16) with Microsoft SMTP
	Server (TLS) id 14.2.298.5; Tue, 10 Jul 2012 15:00:41 -0500
Received: from right.am.freescale.net (right.am.freescale.net [10.82.176.228])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	q6AK0ebo015357 for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jul 2012 13:00:41 -0700
From: Matthew McClintock <msm@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 10 Jul 2012 15:00:40 -0500
Message-ID: <1341950440-19009-2-git-send-email-msm@freescale.com>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <1341950440-19009-1-git-send-email-msm@freescale.com>
References: <1341950440-19009-1-git-send-email-msm@freescale.com>
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: [PATCH 2/2] sysvinit-inittab.bb: fix up dynamically removed consoles
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
X-List-Received-Date: Tue, 10 Jul 2012 21:12:20 -0000
Content-Type: text/plain

Using dmesg could result in removing all the serial consoles as the
dmesg buffer might get filled up and erase the info we are looking
for. Instead let's look at /proc/consoles

Signed-off-by: Matthew McClintock <msm@freescale.com>
---
 meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb b/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb
index fe1ff41..fae3cac 100644
--- a/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb
+++ b/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "Inittab for sysvinit"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
 
-PR = "r8"
+PR = "r9"
 
 SRC_URI = "file://inittab"
 
@@ -59,7 +59,7 @@ if [ "x$D" == "x" ]; then
 	for i in $tmp
 	do
 		j=`echo ${i} | sed s/^.*\;//g`
-		if [ -z "`dmesg | grep ${j}`" ]; then
+		if [ -z "`cat /proc/consoles | grep ${j}`" ]; then
 			sed -i /^.*${j}$/d /etc/inittab
 		fi
 	done
-- 
1.7.10




