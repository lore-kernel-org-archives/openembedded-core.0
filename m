Return-Path: <enrico.scholz@sigma-chemnitz.de>
X-Greylist: delayed 613 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 12 Jun 2014 13:42:44 UTC
Received: from mail.cvg.de (mail.cvg.de [62.153.82.30])
	by mail.openembedded.org (Postfix) with ESMTP id E259265E0F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Jun 2014 13:42:44 +0000 (UTC)
Received: from mail.cvg.de (mail.cvg.de [62.153.82.30])
	by mailout-1.intern.sigma-chemnitz.de (8.14.4/8.14.4) with ESMTP id
	s5CDaDGN028992
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Jun 2014 15:36:16 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sigma-chemnitz.de;
	s=v2012061000; t=1402580176;
	bh=Q7Mreiyycclh6H3VjwqGmO7aXTh73I/otBHZ3ksGyIE=;
	h=From:To:Cc:Subject:Date:Message-Id:Sender;
	b=jbYTASB4BRasxPVKoSpy/qU6tQMk/M9kO0g0mH2ucUk1hcEl1L0K0RTUzS7wKaRT/
	Zw0i+Grrzw/+XY6IMSg1o3Kztjf+57DE98XaqRH0+pxE6uXRGmJdDVTzA5ZMlDGGqm
	5j8hpV865vkIYRz2TjGdE3bTBtvhfkRhUhRWQ1Z8=
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with ESMTP id s5CDa6rO027624
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Thu, 12 Jun 2014 15:36:08 +0200
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.80.1) (envelope-from <ensc@sigma-chemnitz.de>)
	id 1Wv5Ak-00085q-Qp; Thu, 12 Jun 2014 15:36:06 +0200
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-core@lists.openembedded.org
Date: Thu, 12 Jun 2014 15:36:06 +0200
Message-Id: <1402580166-30993-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
X-Mailer: git-send-email 1.9.3
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-DSPAM-Result: Innocent
X-DSPAM-Probability: 0
X-DSPAM-Confidence: 1
X-Spam-Score: -5.3
X-Spam-Level: -----
X-Spam-Tests: AWL, BAYES_00, DKIM_ADSP_ALL, RP_MATCHES_RCVD, SPF_NEUTRAL,
	DSPAM_INNOCENT
X-Scanned-By: MIMEDefang 2.74
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Subject: [PATCH] openssl: install files in ${libdir}, not in ${base_libdir}
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 12 Jun 2014 13:42:54 -0000

${base_libdir} is not in the search path of -native binaries and they
will try to pick the wrong openssl libraries.

Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
---
 meta/recipes-connectivity/openssl/openssl.inc | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-connectivity/openssl/openssl.inc b/meta/recipes-connectivity/openssl/openssl.inc
index b839c00..f17f829 100644
--- a/meta/recipes-connectivity/openssl/openssl.inc
+++ b/meta/recipes-connectivity/openssl/openssl.inc
@@ -32,6 +32,10 @@ export AS = "${CC} -c"
 
 inherit pkgconfig siteinfo multilib_header ptest
 
+# natives don't generally look in base_libdir
+base_libdir_class-native = "${libdir}"
+base_libdir_class-nativesdk = "${libdir}"
+
 PACKAGES =+ "libcrypto libssl ${PN}-misc openssl-conf"
 FILES_libcrypto = "${base_libdir}/libcrypto${SOLIBS}"
 FILES_libssl = "${libdir}/libssl.so.*"
-- 
1.9.3


