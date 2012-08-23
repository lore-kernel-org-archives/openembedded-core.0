Received: from ch1ehsobe004.messaging.microsoft.com ([216.32.181.184]
	helo=ch1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1T4gye-0001fD-Io
	for openembedded-core@lists.openembedded.org;
	Fri, 24 Aug 2012 01:38:16 +0200
Received: from mail127-ch1-R.bigfish.com (10.43.68.230) by
	CH1EHSOBE017.bigfish.com (10.43.70.67) with Microsoft SMTP Server id
	14.1.225.23; Thu, 23 Aug 2012 22:55:55 +0000
Received: from mail127-ch1 (localhost [127.0.0.1])	by
	mail127-ch1-R.bigfish.com (Postfix) with ESMTP id E9279220282	for
	<openembedded-core@lists.openembedded.org>;
	Thu, 23 Aug 2012 22:55:54 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 3
X-BigFish: VS3(zzzz1202h1082kzz8275bhz2dh2a8h668h839hd24he5bhf0ah107ah1155h)
Received: from mail127-ch1 (localhost.localdomain [127.0.0.1]) by mail127-ch1
	(MessageSwitch) id 1345762553313597_21772;
	Thu, 23 Aug 2012 22:55:53 +0000 (UTC)
Received: from CH1EHSMHS010.bigfish.com (snatpool2.int.messaging.microsoft.com
	[10.43.68.233])	by mail127-ch1.bigfish.com (Postfix) with ESMTP id
	4AEE420021E	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Aug 2012 22:55:53 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CH1EHSMHS010.bigfish.com
	(10.43.70.10) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Thu, 23 Aug 2012 22:55:52 +0000
Received: from tx30smr01.am.freescale.net (10.81.153.31) by
	039-SN1MMR1-005.039d.mgd.msft.net (10.84.1.17) with Microsoft SMTP
	Server (TLS) id 14.2.309.3; Thu, 23 Aug 2012 17:55:51 -0500
Received: from right.am.freescale.net (right.am.freescale.net [10.82.176.228])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	q7NMtp3K011130 for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Aug 2012 15:55:51 -0700
From: Matthew McClintock <msm@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 23 Aug 2012 17:55:51 -0500
Message-ID: <1345762551-11974-1-git-send-email-msm@freescale.com>
X-Mailer: git-send-email 1.7.9.7
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: [PATCH] distutils.bbclass: install libraries in ${PYTHON_SITEPACKAGES_DIR}
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
X-List-Received-Date: Thu, 23 Aug 2012 23:38:16 -0000
Content-Type: text/plain

This moves libaries from ${libdir}/${PYTHON_DIR}/
to ${libdir}/${PYTHON_DIR}/sitepackages/

Signed-off-by: Matthew McClintock <msm@freescale.com>
---
 meta/classes/distutils.bbclass |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/distutils.bbclass b/meta/classes/distutils.bbclass
index 52a1aa8..bf1bd83 100644
--- a/meta/classes/distutils.bbclass
+++ b/meta/classes/distutils.bbclass
@@ -38,7 +38,7 @@ distutils_do_install() {
         STAGING_LIBDIR=${STAGING_LIBDIR} \
         PYTHONPATH=${D}/${PYTHON_SITEPACKAGES_DIR} \
         BUILD_SYS=${BUILD_SYS} HOST_SYS=${HOST_SYS} \
-        ${STAGING_BINDIR_NATIVE}/python-native/python setup.py install --install-lib=${D}${libdir}/${PYTHON_DIR} ${DISTUTILS_INSTALL_ARGS} || \
+        ${STAGING_BINDIR_NATIVE}/python-native/python setup.py install --install-lib=${D}${PYTHON_SITEPACKAGES_DIR} ${DISTUTILS_INSTALL_ARGS} || \
         bbfatal "python setup.py install execution failed."
 
         for i in `find ${D} -name "*.py"` ; do \
-- 
1.7.9.7




