Received: from ch1ehsobe001.messaging.microsoft.com ([216.32.181.181]
	helo=ch1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1RRB4T-0001yc-RT
	for openembedded-core@lists.openembedded.org;
	Fri, 18 Nov 2011 00:08:43 +0100
Received: from mail213-ch1-R.bigfish.com (10.43.68.241) by
	CH1EHSOBE018.bigfish.com (10.43.70.68) with Microsoft SMTP Server id
	14.1.225.22; Thu, 17 Nov 2011 22:46:36 +0000
Received: from mail213-ch1 (localhost [127.0.0.1])	by
	mail213-ch1-R.bigfish.com (Postfix) with ESMTP id 25BF5580123	for
	<openembedded-core@lists.openembedded.org>;
	Thu, 17 Nov 2011 22:46:57 +0000 (UTC)
X-SpamScore: 3
X-BigFish: VS3(zzzz1202h1082kzzz2dh2a8h668h839h64h)
X-Spam-TCS-SCL: 3:0
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
Received: from mail213-ch1 (localhost.localdomain [127.0.0.1]) by mail213-ch1
	(MessageSwitch) id 1321570016730400_7166;
	Thu, 17 Nov 2011 22:46:56 +0000 (UTC)
Received: from CH1EHSMHS009.bigfish.com (snatpool1.int.messaging.microsoft.com
	[10.43.68.241])	by mail213-ch1.bigfish.com (Postfix) with ESMTP id
	AD0F550004A	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Nov 2011 22:46:56 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CH1EHSMHS009.bigfish.com
	(10.43.70.9) with Microsoft SMTP Server (TLS) id 14.1.225.22;
	Thu, 17 Nov 2011 22:46:35 +0000
Received: from az33smr01.freescale.net (10.64.34.199) by
	039-SN1MMR1-002.039d.mgd.msft.net (10.84.1.15) with Microsoft SMTP
	Server id 14.1.339.2; Thu, 17 Nov 2011 16:47:08 -0600
Received: from right.am.freescale.net (right.am.freescale.net [10.82.193.13])
	by az33smr01.freescale.net (8.13.1/8.13.0) with ESMTP id
	pAHMl7eh028501	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Nov 2011 16:47:07 -0600 (CST)
From: Matthew McClintock <msm@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 17 Nov 2011 16:47:07 -0600
Message-ID: <1321570027-29390-1-git-send-email-msm@freescale.com>
X-Mailer: git-send-email 1.7.6.1
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: [PATCH] Remove ttyS* from /etc/inittab that are not present
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
X-List-Received-Date: Thu, 17 Nov 2011 23:08:43 -0000
Content-Type: text/plain

This will prevent error message that pop up when the serial
port is not present
---
This seems quite hacky to me, but we have an issue where if we remove
a serial port from the device tree the serial port won't work.

It seems link it's still in /dev/ttySN but it's not configured properly.
I looked for udev rules and items in /proc and /sys to try to use but
I did not see anything...

Is there a better approach than this?

 .../sysvinit/sysvinit-inittab_2.88dsf.bb           |   19 ++++++++++++++++++-
 1 files changed, 18 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb b/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb
index 3a716d7..3031442 100644
--- a/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb
+++ b/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "Inittab for sysvinit"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 
-PR = "r6"
+PR = "r7"
 
 SRC_URI = "file://COPYING \
            file://inittab"
@@ -56,6 +56,23 @@ EOF
     fi
 }
 
+pkg_postinst_${PN} () {
+# run this on the target
+if [ "x$D" == "x" ]; then
+	tmp="${SERIAL_CONSOLES}"
+	for i in $tmp
+	do
+		j=`echo ${i} | sed s/^.*\;//g`
+		if [ -z "`dmesg | grep ${j}`" ]; then
+			sed -i /^.*${j}$/d /etc/inittab
+		fi
+	done
+	kill -HUP 1
+fi
+
+exit 1
+}
+
 # USE_VT and SERIAL_CONSOLE are generally defined by the MACHINE .conf.
 # Set PACKAGE_ARCH appropriately.
 PACKAGE_ARCH = "${MACHINE_ARCH}"
-- 
1.7.6.1




