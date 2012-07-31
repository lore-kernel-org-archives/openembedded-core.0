Received: from ch1ehsobe004.messaging.microsoft.com ([216.32.181.184]
	helo=ch1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1SwJgP-0003CU-82
	for openembedded-core@lists.openembedded.org;
	Tue, 31 Jul 2012 23:08:49 +0200
Received: from mail34-ch1-R.bigfish.com (10.43.68.235) by
	CH1EHSOBE015.bigfish.com (10.43.70.65) with Microsoft SMTP Server id
	14.1.225.23; Tue, 31 Jul 2012 20:42:07 +0000
Received: from mail34-ch1 (localhost [127.0.0.1])	by mail34-ch1-R.bigfish.com
	(Postfix) with ESMTP id DF21D3601B2	for
	<openembedded-core@lists.openembedded.org>;
	Tue, 31 Jul 2012 20:42:07 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 3
X-BigFish: VS3(zzzz1202h1082kzz8275bhz2dh2a8h668h839hd24he5bhf0ah107ah)
Received: from mail34-ch1 (localhost.localdomain [127.0.0.1]) by mail34-ch1
	(MessageSwitch) id 1343767326860418_31783;
	Tue, 31 Jul 2012 20:42:06 +0000 (UTC)
Received: from CH1EHSMHS016.bigfish.com (snatpool2.int.messaging.microsoft.com
	[10.43.68.237])	by mail34-ch1.bigfish.com (Postfix) with ESMTP id
	CDF752004A for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Jul 2012 20:42:06 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CH1EHSMHS016.bigfish.com
	(10.43.70.16) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Tue, 31 Jul 2012 20:42:06 +0000
Received: from tx30smr01.am.freescale.net (10.81.153.31) by
	039-SN1MMR1-002.039d.mgd.msft.net (10.84.1.15) with Microsoft SMTP
	Server (TLS) id 14.2.298.5; Tue, 31 Jul 2012 15:42:05 -0500
Received: from right.am.freescale.net (right.am.freescale.net [10.82.176.228])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	q6VKg48L020235 for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Jul 2012 13:42:05 -0700
From: Matthew McClintock <msm@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 31 Jul 2012 15:42:04 -0500
Message-ID: <1343767324-11395-1-git-send-email-msm@freescale.com>
X-Mailer: git-send-email 1.7.9.7
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: [PATCH] foomatic-filters_4.0.16.bb: update recipe to work on Fedora 17
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
X-List-Received-Date: Tue, 31 Jul 2012 21:08:49 -0000
Content-Type: text/plain

This fixes isses on distro that have perl in /bin/perl instead
of /usr/bin/perl such as Fedora 17

Signed-off-by: Matthew McClintock <msm@freescale.com>
---
 .../foomatic/foomatic-filters_4.0.16.bb            |    9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-extended/foomatic/foomatic-filters_4.0.16.bb b/meta/recipes-extended/foomatic/foomatic-filters_4.0.16.bb
index 5f145b0..d5ae4c7 100644
--- a/meta/recipes-extended/foomatic/foomatic-filters_4.0.16.bb
+++ b/meta/recipes-extended/foomatic/foomatic-filters_4.0.16.bb
@@ -10,7 +10,7 @@ format using a printer-specific, but spooler-independent PPD file. \
 "
 
 DEPENDS += "cups perl libxml2"
-PR = "r0"
+PR = "r1"
 
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://${WORKDIR}/foomatic-filters-${PV}/COPYING;md5=393a5ca445f6965873eca0259a17f833"
@@ -31,6 +31,13 @@ do_configure_prepend() {
     export CUPS_PPDS=${datadir}/cups/model
 }
 
+PERLPATH = "${bindir}/env perl"
+PERLPATH_virtclass-nativesdk = "/usr/bin/env perl"
+
+do_install_append() {
+    sed -i -e '1s,#!.*perl,#! ${PERLPATH},' ${D}${libdir}/cups/backend/beh
+}
+
 do_install_append_linuxstdbase() {
     install -d ${D}${exec_prefix}/lib/cups/filter
     ln -sf ${bindir}/foomatic-rip ${D}${exec_prefix}/lib/cups/filter
-- 
1.7.9.7




