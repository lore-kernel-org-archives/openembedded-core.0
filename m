Received: from mail.cvg.de ([62.153.82.30])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <enrico.scholz@sigma-chemnitz.de>) id 1UFORs-0001R8-6a
	for openembedded-core@lists.openembedded.org;
	Tue, 12 Mar 2013 13:36:57 +0100
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with ESMTP id r2CCK9TB014706
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Tue, 12 Mar 2013 13:20:10 +0100
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.76) (envelope-from <ensc@sigma-chemnitz.de>)
	id 1UFOBd-0006Em-32; Tue, 12 Mar 2013 13:20:09 +0100
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-core@lists.openembedded.org
Date: Tue, 12 Mar 2013 13:20:07 +0100
Message-Id: <1363090807-23944-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
X-Mailer: git-send-email 1.8.1.2
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-DSPAM-Result: Innocent
X-DSPAM-Probability: 0
X-DSPAM-Confidence: 1
X-Spam-Score: -6.6
X-Spam-Level: ------
X-Spam-Tests: AWL,BAYES_00,RP_MATCHES_RCVD,SPF_NEUTRAL,DSPAM_INNOCENT
X-Scanned-By: MIMEDefang 2.73
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Subject: [PATCH] gst-plugins-package: set ALLOW_EMPTY_${PN}
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
X-List-Received-Date: Tue, 12 Mar 2013 12:37:08 -0000

Every subpackage has a dependency on '${PN}' because
populate_packages_prepend() specifies "extra_depends=d.expand('${PN}')"
when splitting the subpackages.

Hence, '${PN}' must be always created

Although creation of -plugin-dev and -plugin-staticdev is flawed imo
(.la files are not for development purposes but useless resp. required
for module loading on non GNU/linux platforms, and .a files are not
created for plugins), patch sets ALLOW_EMPTY for -dev and -staticdev
packages for consistency reasons.

Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
---
 meta/recipes-multimedia/gstreamer/gst-plugins-package.inc | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-multimedia/gstreamer/gst-plugins-package.inc b/meta/recipes-multimedia/gstreamer/gst-plugins-package.inc
index 3e9ef92..2f2be34 100644
--- a/meta/recipes-multimedia/gstreamer/gst-plugins-package.inc
+++ b/meta/recipes-multimedia/gstreamer/gst-plugins-package.inc
@@ -24,6 +24,10 @@ python populate_packages_prepend () {
     d.setVar('DESCRIPTION_' + metapkg, pn + ' meta package')
 }
 
+ALLOW_EMPTY_${PN} = "1"
+ALLOW_EMPTY_${PN}-dev = "1"
+ALLOW_EMPTY_${PN}-staticdev = "1"
+
 PACKAGES += "${PN}-apps ${PN}-meta ${PN}-glib"
 FILES_${PN}-apps = "${bindir}"
 
-- 
1.8.1.2



