Received: from ch1ehsobe005.messaging.microsoft.com ([216.32.181.185]
	helo=ch1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1T3tcu-0004Tx-3d
	for openembedded-core@lists.openembedded.org;
	Tue, 21 Aug 2012 20:56:32 +0200
Received: from mail132-ch1-R.bigfish.com (10.43.68.239) by
	CH1EHSOBE011.bigfish.com (10.43.70.61) with Microsoft SMTP Server id
	14.1.225.23; Tue, 21 Aug 2012 18:44:27 +0000
Received: from mail132-ch1 (localhost [127.0.0.1])	by
	mail132-ch1-R.bigfish.com (Postfix) with ESMTP id C27C22C0434	for
	<openembedded-core@lists.openembedded.org>;
	Tue, 21 Aug 2012 18:44:27 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -2
X-BigFish: VS-2(zzc1dMzz1202h1082kzz8275bhz2dh2a8h668h839hd24he5bhf0ah107ah)
Received: from mail132-ch1 (localhost.localdomain [127.0.0.1]) by mail132-ch1
	(MessageSwitch) id 1345574665692823_32216;
	Tue, 21 Aug 2012 18:44:25 +0000 (UTC)
Received: from CH1EHSMHS002.bigfish.com (snatpool2.int.messaging.microsoft.com
	[10.43.68.232])	by mail132-ch1.bigfish.com (Postfix) with ESMTP id
	A5522100052	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Aug 2012 18:44:25 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CH1EHSMHS002.bigfish.com
	(10.43.70.2) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Tue, 21 Aug 2012 18:44:23 +0000
Received: from tx30smr01.am.freescale.net (10.81.153.31) by
	039-SN1MMR1-003.039d.mgd.msft.net (10.84.1.16) with Microsoft SMTP
	Server (TLS) id 14.2.309.3; Tue, 21 Aug 2012 13:44:22 -0500
Received: from right.am.freescale.net (right.am.freescale.net [10.82.176.228])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	q7LIiM7a025840 for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Aug 2012 11:44:22 -0700
From: Matthew McClintock <msm@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 21 Aug 2012 13:44:21 -0500
Message-ID: <1345574661-23816-1-git-send-email-msm@freescale.com>
X-Mailer: git-send-email 1.7.9.7
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: [PATCH] distutils.bblass: change order of args to install step
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
X-List-Received-Date: Tue, 21 Aug 2012 18:56:32 -0000
Content-Type: text/plain

This let's the user override install-lib argument again if it needs
to be something else, otherwise things like python-setuptools
won't be able to modify the install-lib dir

This fixes a new issue exposed by my previous distutils patch
that fixed the python modules default install location. Also,
it removes running the install step twice which was inadvertant

Signed-off-by: Matthew McClintock <msm@freescale.com>
---
 meta/classes/distutils.bbclass |    3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/classes/distutils.bbclass b/meta/classes/distutils.bbclass
index 7588b81..52a1aa8 100644
--- a/meta/classes/distutils.bbclass
+++ b/meta/classes/distutils.bbclass
@@ -38,8 +38,7 @@ distutils_do_install() {
         STAGING_LIBDIR=${STAGING_LIBDIR} \
         PYTHONPATH=${D}/${PYTHON_SITEPACKAGES_DIR} \
         BUILD_SYS=${BUILD_SYS} HOST_SYS=${HOST_SYS} \
-        ${STAGING_BINDIR_NATIVE}/python-native/python setup.py install ${DISTUTILS_INSTALL_ARGS} || \
-        ${STAGING_BINDIR_NATIVE}/python-native/python setup.py install ${DISTUTILS_INSTALL_ARGS} --install-lib=${D}${libdir}/${PYTHON_DIR} || \
+        ${STAGING_BINDIR_NATIVE}/python-native/python setup.py install --install-lib=${D}${libdir}/${PYTHON_DIR} ${DISTUTILS_INSTALL_ARGS} || \
         bbfatal "python setup.py install execution failed."
 
         for i in `find ${D} -name "*.py"` ; do \
-- 
1.7.9.7




