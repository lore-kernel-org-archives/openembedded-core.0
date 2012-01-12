Received: from mail.cvg.de ([62.153.82.30])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <enrico.scholz@sigma-chemnitz.de>) id 1RlNf5-0000x9-1l
	for openembedded-core@lists.openembedded.org;
	Thu, 12 Jan 2012 17:37:59 +0100
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with SMTP id q0CGUPEY032554
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Thu, 12 Jan 2012 17:30:26 +0100
Received: by ensc-virt.intern.sigma-chemnitz.de (sSMTP sendmail emulation);
	Thu, 12 Jan 2012 17:30:25 +0100
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-core@lists.openembedded.org
Date: Thu, 12 Jan 2012 17:30:20 +0100
Message-Id: <1326385824-32201-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
X-Mailer: git-send-email 1.7.7.5
X-DSPAM-Result: Innocent
X-DSPAM-Probability: 0
X-DSPAM-Confidence: 1
X-Spam-Score: -5.8
X-Spam-Level: -----
X-Spam-Tests: AWL,BAYES_00,SPF_NEUTRAL,T_RP_MATCHES_RCVD,DSPAM_INNOCENT
X-Scanned-By: MIMEDefang 2.72 on 62.153.82.30
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Subject: [PATCH] package.bbclass: quote pathname given to objdump
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
X-List-Received-Date: Thu, 12 Jan 2012 16:37:59 -0000

Packaging will fail with executable files containing spaces in their
names. Patch quotes the parameter passed to 'objdump'.

Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
---
 meta/classes/package.bbclass |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index f8f0a12..1088470 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -1205,7 +1205,7 @@ SHLIBSDIR = "${STAGING_DIR_HOST}/shlibs"
 SHLIBSWORKDIR = "${WORKDIR}/shlibs"
 
 python package_do_shlibs() {
-	import re
+	import re, pipes
 
 	exclude_shlibs = d.getVar('EXCLUDE_FROM_SHLIBS', 0)
 	if exclude_shlibs:
@@ -1234,7 +1234,7 @@ python package_do_shlibs() {
 	lf = bb.utils.lockfile(bb.data.expand("${PACKAGELOCK}", d))
 
 	def linux_so(root, path, file):
-		cmd = d.getVar('OBJDUMP', True) + " -p " + os.path.join(root, file) + " 2>/dev/null"
+		cmd = d.getVar('OBJDUMP', True) + " -p " + pipes.quote(os.path.join(root, file)) + " 2>/dev/null"
 		cmd = "PATH=\"%s\" %s" % (d.getVar('PATH', True), cmd)
 		fd = os.popen(cmd)
 		lines = fd.readlines()
-- 
1.7.7.5



