Received: from va3ehsobe006.messaging.microsoft.com ([216.32.180.16]
	helo=va3outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B19537@freescale.com>) id 1TGmHP-0006NN-EH
	for openembedded-core@lists.openembedded.org;
	Wed, 26 Sep 2012 09:43:35 +0200
Received: from mail202-va3-R.bigfish.com (10.7.14.254) by
	VA3EHSOBE004.bigfish.com (10.7.40.24) with Microsoft SMTP Server id
	14.1.225.23; Wed, 26 Sep 2012 07:00:35 +0000
Received: from mail202-va3 (localhost [127.0.0.1])	by
	mail202-va3-R.bigfish.com (Postfix) with ESMTP id 0385E200140	for
	<openembedded-core@lists.openembedded.org>;
	Wed, 26 Sep 2012 07:00:35 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 1
X-BigFish: VS1(zzd6eahd6f1izz1202h1d1ah1d2ahzz8275bhz2dh2a8h668h839hd24he5bhf0ah107ah1288h12a5h12a9h12bdh12e5h137ah139eh13b6h1155h)
Received: from mail202-va3 (localhost.localdomain [127.0.0.1]) by mail202-va3
	(MessageSwitch) id 1348642833220793_1929;
	Wed, 26 Sep 2012 07:00:33 +0000 (UTC)
Received: from VA3EHSMHS031.bigfish.com (unknown [10.7.14.244])	by
	mail202-va3.bigfish.com (Postfix) with ESMTP id 30B10500045	for
	<openembedded-core@lists.openembedded.org>;
	Wed, 26 Sep 2012 07:00:33 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by VA3EHSMHS031.bigfish.com
	(10.7.99.41) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Wed, 26 Sep 2012 07:00:29 +0000
Received: from az84smr01.freescale.net (10.64.34.197) by
	039-SN1MMR1-004.039d.mgd.msft.net (10.84.1.14) with Microsoft SMTP
	Server (TLS) id 14.2.309.3; Wed, 26 Sep 2012 02:00:28 -0500
Received: from bjsimics-desktop.ap.freescale.net
	(bjsimics-desktop-010192208197.ap.freescale.net [10.192.208.197])	by
	az84smr01.freescale.net (8.14.3/8.14.0) with ESMTP id q8Q70PDh003269;
	Wed, 26 Sep 2012 00:00:26 -0700
From: <b19537@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 26 Sep 2012 15:18:37 +0800
Message-ID: <1348643917-26301-1-git-send-email-b19537@freescale.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: msm@freescale.com
Subject: ysvinit-inittab: fix hang issue of series consoles check
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
X-List-Received-Date: Wed, 26 Sep 2012 07:43:35 -0000
Content-Type: text/plain

From: Zhenhua Luo <b19537@freescale.com>

    the kernel boot process hangs when /proc/consoles doesn't exists, check
    the existence of /proc/consoles before executing pkg_postinst script.

    Following is the log when /proc/consoles doesn't exist:
        Running postinst /etc/rpm-postinsts/102...
        cat: /proc/consoles: No such file or directory
        cat: /proc/consoles: No such file or directory
        cat: /proc/consoles: No such file or directory
        INIT: Entering runlevel: 5
        Starting OpenBSD Secure Shell server: sshd
          generating ssh RSA key...
          generating ssh ECDSA key...
          generating ssh DSA key...
        done.
        Starting network benchmark server: netserver.
        Starting system log daemon...0
        Starting kernel log daemon...0
        Stopping Bootlog daemon: bootlogd.
        INIT: no more processes left in this runlevel

Signed-off-by: Zhenhua Luo <b19537@freescale.com>
---
 .../sysvinit/sysvinit-inittab_2.88dsf.bb           |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb b/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb
index 5b79caf..b289853 100644
--- a/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb
+++ b/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "Inittab for sysvinit"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
 
-PR = "r8"
+PR = "r9"
 
 SRC_URI = "file://inittab"
 
@@ -54,7 +54,7 @@ EOF
 
 pkg_postinst_${PN} () {
 # run this on the target
-if [ "x$D" = "x" ]; then
+if [ "x$D" = "x" ] && [ -e /proc/consoles ]; then
 	tmp="${SERIAL_CONSOLES_CHECK}"
 	for i in $tmp
 	do
-- 
1.7.9.5




