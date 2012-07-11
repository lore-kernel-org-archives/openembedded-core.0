Received: from co1ehsobe001.messaging.microsoft.com ([216.32.180.184]
	helo=co1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1Sp6J1-0002hZ-1h
	for openembedded-core@lists.openembedded.org;
	Thu, 12 Jul 2012 01:26:51 +0200
Received: from mail127-co1-R.bigfish.com (10.243.78.225) by
	CO1EHSOBE005.bigfish.com (10.243.66.68) with Microsoft SMTP Server id
	14.1.225.23; Wed, 11 Jul 2012 23:13:15 +0000
Received: from mail127-co1 (localhost [127.0.0.1])	by
	mail127-co1-R.bigfish.com (Postfix) with ESMTP id D4F4672053C	for
	<openembedded-core@lists.openembedded.org>;
	Wed, 11 Jul 2012 23:13:14 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 3
X-BigFish: VS3(zzzz1202h1082kzzz2dh2a8h668h839hd24he5bhf0ah107ah)
Received: from mail127-co1 (localhost.localdomain [127.0.0.1]) by mail127-co1
	(MessageSwitch) id 1342048392579421_22976;
	Wed, 11 Jul 2012 23:13:12 +0000 (UTC)
Received: from CO1EHSMHS030.bigfish.com (unknown [10.243.78.239])	by
	mail127-co1.bigfish.com (Postfix) with ESMTP id 8BE9ABC004D	for
	<openembedded-core@lists.openembedded.org>;
	Wed, 11 Jul 2012 23:13:12 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CO1EHSMHS030.bigfish.com
	(10.243.66.40) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Wed, 11 Jul 2012 23:13:12 +0000
Received: from tx30smr01.am.freescale.net (10.81.153.31) by
	039-SN1MMR1-002.039d.mgd.msft.net (10.84.1.15) with Microsoft SMTP
	Server (TLS) id 14.2.298.5; Wed, 11 Jul 2012 18:15:29 -0500
Received: from right.am.freescale.net (right.am.freescale.net [10.82.176.228])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	q6BNFR7T002372 for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Jul 2012 16:15:29 -0700
From: Matthew McClintock <msm@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 11 Jul 2012 18:15:27 -0500
Message-ID: <1342048527-20262-1-git-send-email-msm@freescale.com>
X-Mailer: git-send-email 1.7.10
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: [PATCH] sysvinit-inittab_2.88dsf.bb: Allow multiple serial port consoles to be defined
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
X-List-Received-Date: Wed, 11 Jul 2012 23:26:51 -0000
Content-Type: text/plain

Set SERIAL_CONSOLES if you want to define multiple serial consoles, also if
you need to check for the presence of the serial consoles you can also define
SERIAL_CONSOLES_CHECK to determine if these are present when you boot. This
will prevent error message that pop up when the serial port is not present.

SERIAL_CONSOLES = "115200;ttyS0 115200;ttyS1 115200;ttyEHV0"
SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"

The above lines in machine.conf or elsewhere will have the effect of having
two serial consoles and removing any that are not present at boot
---
 .../sysvinit/sysvinit-inittab_2.88dsf.bb           |   22 ++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb b/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb
index 9bd087c..1089edb 100644
--- a/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb
+++ b/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "Inittab for sysvinit"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
 
-PR = "r6"
+PR = "r7"
 
 SRC_URI = "file://inittab"
 
@@ -26,7 +26,8 @@ do_install() {
     for i in $tmp
     do
 	j=`echo ${i} | sed s/\;/\ /g`
-        echo "${idx}:2345:respawn:${base_sbindir}/getty ${j}" >> ${D}${sysconfdir}/inittab
+	echo "${idx}:12345:respawn:${base_sbindir}/getty ${j}" >> ${D}${sysconfdir}/inittab
+
 	idx=`expr $idx + 1`
     done
 
@@ -51,6 +52,23 @@ EOF
     fi
 }
 
+pkg_postinst_${PN} () {
+# run this on the target
+if [ "x$D" == "x" ]; then
+	tmp="${SERIAL_CONSOLES_CHECK}"
+	for i in $tmp
+	do
+		j=`echo ${i} | sed s/^.*\;//g`
+		if [ -z "`cat /proc/consoles | grep ${j}`" ]; then
+			sed -i /^.*${j}$/d /etc/inittab
+		fi
+	done
+	kill -HUP 1
+else
+	exit 1
+fi
+}
+
 # USE_VT and SERIAL_CONSOLE are generally defined by the MACHINE .conf.
 # Set PACKAGE_ARCH appropriately.
 PACKAGE_ARCH = "${MACHINE_ARCH}"
-- 
1.7.10




