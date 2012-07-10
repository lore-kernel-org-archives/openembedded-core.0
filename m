Received: from ch1ehsobe004.messaging.microsoft.com ([216.32.181.184]
	helo=ch1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1Soh1b-0006Ij-SR
	for openembedded-core@lists.openembedded.org;
	Tue, 10 Jul 2012 22:27:12 +0200
Received: from mail218-ch1-R.bigfish.com (10.43.68.238) by
	CH1EHSOBE017.bigfish.com (10.43.70.67) with Microsoft SMTP Server id
	14.1.225.23; Tue, 10 Jul 2012 19:58:26 +0000
Received: from mail218-ch1 (localhost [127.0.0.1])	by
	mail218-ch1-R.bigfish.com (Postfix) with ESMTP id 88F9160505	for
	<openembedded-core@lists.openembedded.org>;
	Tue, 10 Jul 2012 19:58:25 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 3
X-BigFish: VS3(zzzz1202h1082kzz8275bhz2dh2a8h668h839hd24he5bhf0ah107ah)
Received: from mail218-ch1 (localhost.localdomain [127.0.0.1]) by mail218-ch1
	(MessageSwitch) id 1341950303890245_28141;
	Tue, 10 Jul 2012 19:58:23 +0000 (UTC)
Received: from CH1EHSMHS037.bigfish.com (snatpool1.int.messaging.microsoft.com
	[10.43.68.244])	by mail218-ch1.bigfish.com (Postfix) with ESMTP id
	D7E644C0048	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jul 2012 19:58:23 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CH1EHSMHS037.bigfish.com
	(10.43.69.246) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Tue, 10 Jul 2012 19:58:22 +0000
Received: from tx30smr01.am.freescale.net (10.81.153.31) by
	039-SN1MMR1-002.039d.mgd.msft.net (10.84.1.15) with Microsoft SMTP
	Server (TLS) id 14.2.298.5; Tue, 10 Jul 2012 15:00:40 -0500
Received: from right.am.freescale.net (right.am.freescale.net [10.82.176.228])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	q6AK0ebn015357 for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jul 2012 13:00:41 -0700
From: Matthew McClintock <msm@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 10 Jul 2012 15:00:39 -0500
Message-ID: <1341950440-19009-1-git-send-email-msm@freescale.com>
X-Mailer: git-send-email 1.7.10
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: [PATCH 1/2] Fix hang issue when execute "shutdown now" command
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
X-List-Received-Date: Tue, 10 Jul 2012 20:27:12 -0000
Content-Type: text/plain

From: Zhenhua Luo <b19537@freescale.com>

    The original issue:
    When "shutdown now" command is typed on Linux prompt, the system tries to
    shut down gracefully from runlevel 5 to 1.
    RunLevel 1 is single-user/maintenance mode. This is the default behavior
    when no runlevel option is mentioned in shutdown command (like shutdown
    -h now OR shutdown -r now).
    The startup script which starts single-user mode by initiating a new
    process is missing from /etc/rc1.d/...
    Because of this, following error appears:
        INIT: no more processes left in this runlevel
    A start-up script is needed to enables the user to log into single-user
    mode when "shutdown now" command is given.

Signed-off-by: Matthew McClintock <msm@freescale.com>
Signed-off-by: Zhenhua Luo <b19537@freescale.com>
---
 meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb |    5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb b/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb
index 492c60c..fe1ff41 100644
--- a/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb
+++ b/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "Inittab for sysvinit"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
 
-PR = "r7"
+PR = "r8"
 
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
 
-- 
1.7.10




