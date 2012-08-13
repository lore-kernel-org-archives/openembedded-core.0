Received: from co1ehsobe001.messaging.microsoft.com ([216.32.180.184]
	helo=co1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1T10kX-0002qp-VE
	for openembedded-core@lists.openembedded.org;
	Mon, 13 Aug 2012 21:56:30 +0200
Received: from mail147-co1-R.bigfish.com (10.243.78.239) by
	CO1EHSOBE009.bigfish.com (10.243.66.72) with Microsoft SMTP Server id
	14.1.225.23; Mon, 13 Aug 2012 19:44:35 +0000
Received: from mail147-co1 (localhost [127.0.0.1])	by
	mail147-co1-R.bigfish.com (Postfix) with ESMTP id 896EAB4036F	for
	<openembedded-core@lists.openembedded.org>;
	Mon, 13 Aug 2012 19:44:35 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 3
X-BigFish: VS3(zzzz1202h1082kzz8275bhz2dh2a8h668h839hd24he5bhf0ah107ah)
Received: from mail147-co1 (localhost.localdomain [127.0.0.1]) by mail147-co1
	(MessageSwitch) id 1344887073862275_9974;
	Mon, 13 Aug 2012 19:44:33 +0000 (UTC)
Received: from CO1EHSMHS025.bigfish.com (unknown [10.243.78.237])	by
	mail147-co1.bigfish.com (Postfix) with ESMTP id D0AC23C0044	for
	<openembedded-core@lists.openembedded.org>;
	Mon, 13 Aug 2012 19:44:33 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CO1EHSMHS025.bigfish.com
	(10.243.66.35) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Mon, 13 Aug 2012 19:44:33 +0000
Received: from tx30smr01.am.freescale.net (10.81.153.31) by
	039-SN1MMR1-001.039d.mgd.msft.net (10.84.1.13) with Microsoft SMTP
	Server (TLS) id 14.2.298.5; Mon, 13 Aug 2012 14:44:32 -0500
Received: from right.am.freescale.net (right.am.freescale.net [10.82.176.228])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	q7DJiVCZ028341 for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Aug 2012 12:44:32 -0700
From: Matthew McClintock <msm@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 13 Aug 2012 14:44:31 -0500
Message-ID: <1344887071-10378-1-git-send-email-msm@freescale.com>
X-Mailer: git-send-email 1.7.9.7
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: [PATCH] distutils.bbclass: fix libdir for 64-bit python modules built with distutils
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
X-List-Received-Date: Mon, 13 Aug 2012 19:56:30 -0000
Content-Type: text/plain

Without this some modules will be intalled in /usr/lib/python2.6/
instead of /usr/${libdir}/python2.6

Signed-off-by: Matthew McClintock <msm@freescale.com>
---
 meta/classes/distutils.bbclass |    1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/distutils.bbclass b/meta/classes/distutils.bbclass
index 690df73..7588b81 100644
--- a/meta/classes/distutils.bbclass
+++ b/meta/classes/distutils.bbclass
@@ -39,6 +39,7 @@ distutils_do_install() {
         PYTHONPATH=${D}/${PYTHON_SITEPACKAGES_DIR} \
         BUILD_SYS=${BUILD_SYS} HOST_SYS=${HOST_SYS} \
         ${STAGING_BINDIR_NATIVE}/python-native/python setup.py install ${DISTUTILS_INSTALL_ARGS} || \
+        ${STAGING_BINDIR_NATIVE}/python-native/python setup.py install ${DISTUTILS_INSTALL_ARGS} --install-lib=${D}${libdir}/${PYTHON_DIR} || \
         bbfatal "python setup.py install execution failed."
 
         for i in `find ${D} -name "*.py"` ; do \
-- 
1.7.9.7




