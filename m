Received: from mail.cvg.de ([62.153.82.30])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <enrico.scholz@sigma-chemnitz.de>) id 1TwbRV-0005H2-U4
	for openembedded-core@lists.openembedded.org;
	Sat, 19 Jan 2013 17:39:04 +0100
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with ESMTP id r0JGNHBu010099
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Sat, 19 Jan 2013 17:23:18 +0100
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.76) (envelope-from <ensc@sigma-chemnitz.de>)
	id 1TwbCM-0004FF-Ev; Sat, 19 Jan 2013 17:23:14 +0100
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-core@lists.openembedded.org
Date: Sat, 19 Jan 2013 17:23:01 +0100
Message-Id: <1358612581-5453-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
X-Mailer: git-send-email 1.7.11.7
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-DSPAM-Result: Innocent
X-DSPAM-Probability: 0
X-DSPAM-Confidence: 1
X-Spam-Score: -5.3
X-Spam-Level: -----
X-Spam-Tests: AWL,BAYES_00,RP_MATCHES_RCVD,SPF_NEUTRAL,DSPAM_INNOCENT
X-Scanned-By: MIMEDefang 2.73
Cc: Enrico Scholz <enrico.scholz@informatik.tu-chemnitz.de>
Subject: [PATCH] package.bbclass: replace AUTOINC directly in PKGV
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
X-List-Received-Date: Sat, 19 Jan 2013 16:39:04 -0000

From: Enrico Scholz <enrico.scholz@informatik.tu-chemnitz.de>

b27b438221e16ac3df6ac66d761b77e3bd43db67 introduced a regression when
PKGV is modified by the recipe.  E.g. when having something like

| PV = "1.7.33+gitr${SRCPV}"
| PKGV = "1.7.33+gitr${GITPKGV}"
| RDEPENDS_${PN}-subpkg += "${PN} (= ${EXTENDPKGV})"
| inherit gitpkgv

The resulting core package has

| Version: 1.7.33+git234+cd01e8c-r11

and because the subpackage has

| Depends: vdr (= 1.7.33+git0+cd01e8c18d494150730214f033f84e5282ce7639-r11)

image build fails with

|  * satisfy_dependencies_for: Cannot satisfy the following dependencies ...
|  *    vdr (= 1.7.33+git0+cd01e8c18d494150730214f033f84e5282ce7639-r11)

Patch avoids the 'PKGV = "cleanup(${PV})"' operation and replaces
AUTOINC directly within PKGV.  This might introduce a regression too
when 'AUTOINC' is added to PKGV intentionally but impact is small and
can be fixed trivially by using another string.

Signed-off-by: Enrico Scholz <enrico.scholz@informatik.tu-chemnitz.de>
Cc: Constantin Musca <constantinx.musca@intel.com>
---
 meta/classes/package.bbclass | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index b067dd8..d350eb2 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -418,9 +418,9 @@ python package_get_auto_pr() {
             return
         d.setVar('PRAUTO',str(auto_pr))
     else:
-        pv = d.getVar("PV", True)
-        if 'AUTOINC' in pv:
-            d.setVar("PKGV", pv.replace("AUTOINC", "0"))
+        pkgv = d.getVar("PKGV", True)
+        if 'AUTOINC' in pkgv:
+            d.setVar("PKGV", pkgv.replace("AUTOINC", "0"))
 }
 
 LOCALEBASEPN ??= "${PN}"
-- 
1.7.11.7



