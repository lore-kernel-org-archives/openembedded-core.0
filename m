Received: from ch1ehsobe002.messaging.microsoft.com ([216.32.181.182]
	helo=ch1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1RMR5S-0007AJ-7W
	for openembedded-core@lists.openembedded.org;
	Fri, 04 Nov 2011 22:14:07 +0100
Received: from mail35-ch1-R.bigfish.com (10.43.68.252) by
	CH1EHSOBE004.bigfish.com (10.43.70.54) with Microsoft SMTP Server id
	14.1.225.22; Fri, 4 Nov 2011 21:07:38 +0000
Received: from mail35-ch1 (localhost.localdomain [127.0.0.1])	by
	mail35-ch1-R.bigfish.com (Postfix) with ESMTP id 366415E02C3	for
	<openembedded-core@lists.openembedded.org>;
	Fri,  4 Nov 2011 21:07:48 +0000 (UTC)
X-SpamScore: 3
X-BigFish: VS3(zzzz1202h1082kzz8275bhz2dh2a8h668h839h)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null);
	IPVD:NLI; H:mail.freescale.net; RD:none; EFVD:NLI
X-FB-SS: 13,
Received: from mail35-ch1 (localhost.localdomain [127.0.0.1]) by mail35-ch1
	(MessageSwitch) id 1320440867985678_12480;
	Fri,  4 Nov 2011 21:07:47 +0000 (UTC)
Received: from CH1EHSMHS018.bigfish.com (snatpool1.int.messaging.microsoft.com
	[10.43.68.252])	by mail35-ch1.bigfish.com (Postfix) with ESMTP id
	ED26E32804C for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Nov 2011 21:07:47 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CH1EHSMHS018.bigfish.com
	(10.43.70.18) with Microsoft SMTP Server (TLS) id 14.1.225.22;
	Fri, 4 Nov 2011 21:07:35 +0000
Received: from az33smr02.freescale.net (10.64.34.200) by
	039-SN1MMR1-001.039d.mgd.msft.net (10.84.1.13) with Microsoft SMTP
	Server id 14.1.339.2; Fri, 4 Nov 2011 16:07:53 -0500
Received: from right.am.freescale.net (right.am.freescale.net [10.82.193.13])
	by az33smr02.freescale.net (8.13.1/8.13.0) with ESMTP id
	pA4L7qW2028283	for <openembedded-core@lists.openembedded.org>;
	Fri, 4 Nov 2011 16:07:52 -0500 (CDT)
From: Matthew McClintock <msm@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 4 Nov 2011 16:07:52 -0500
Message-ID: <1320440872-28420-1-git-send-email-msm@freescale.com>
X-Mailer: git-send-email 1.7.6.1
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: [PATCH] Introduce new SERIAL_CONSOLES to add multiple consoles for your MACHINE
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
X-List-Received-Date: Fri, 04 Nov 2011 21:14:07 -0000
Content-Type: text/plain

Just define additional serial consoles like so:

SERIAL_CONSOLES="115200;ttyS0 115200;ttyS1 ... 115200;ttySN"

Also be sure to remove SERIAL_CONSOLE (lacking the S) from your
machine as they can conflict.

Signed-off-by: Matthew McClintock <msm@freescale.com>
---
 .../sysvinit/sysvinit-inittab_2.88dsf.bb           |   10 ++++++++++
 1 files changed, 10 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb b/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb
index ba60c74..3a716d7 100644
--- a/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb
+++ b/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb
@@ -25,6 +25,16 @@ do_install() {
     if [ ! -z "${SERIAL_CONSOLE}" ]; then
         echo "S:2345:respawn:${base_sbindir}/getty ${SERIAL_CONSOLE}" >> ${D}${sysconfdir}/inittab
     fi
+
+    idx=0
+    tmp="${SERIAL_CONSOLES}"
+    for i in $tmp
+    do
+	j=`echo ${i} | sed s/\;/\ /g`
+        echo "${idx}:2345:respawn:${base_sbindir}/getty ${j}" >> ${D}${sysconfdir}/inittab
+	idx=`expr $idx + 1`
+    done
+
     if [ "${USE_VT}" = "1" ]; then
         cat <<EOF >>${D}${sysconfdir}/inittab
 # ${base_sbindir}/getty invocations for the runlevels.
-- 
1.7.6.1




