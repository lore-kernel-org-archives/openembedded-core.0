Received: from mail.cvg.de ([62.153.82.30])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <enrico.scholz@sigma-chemnitz.de>) id 1TsCWY-0003gD-1O
	for openembedded-core@lists.openembedded.org;
	Mon, 07 Jan 2013 14:13:54 +0100
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with ESMTP id r07CwdfA010525
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Mon, 7 Jan 2013 13:58:40 +0100
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.76) (envelope-from <ensc@sigma-chemnitz.de>)
	id 1TsCHm-0002dW-RI; Mon, 07 Jan 2013 13:58:38 +0100
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-core@lists.openembedded.org
Date: Mon,  7 Jan 2013 13:58:31 +0100
Message-Id: <1357563511-10099-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
X-Mailer: git-send-email 1.7.11.7
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-DSPAM-Result: Innocent
X-DSPAM-Probability: 0
X-DSPAM-Confidence: 0.84
X-Spam-Score: -5.3
X-Spam-Level: -----
X-Spam-Tests: AWL,BAYES_00,RP_MATCHES_RCVD,SPF_NEUTRAL,DSPAM_INNOCENT
X-Scanned-By: MIMEDefang 2.73
Cc: Enrico Scholz <enrico.scholz@informatik.tu-chemnitz.de>
Subject: [PATCH] image.bbclass: quote TARGET_VENDOR
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
X-List-Received-Date: Mon, 07 Jan 2013 13:13:55 -0000

From: Enrico Scholz <enrico.scholz@informatik.tu-chemnitz.de>

The buildsystem does not install locale files anymore, when
TARGET_VENDOR is empty.  This regression was introduced by
ff01518c6667e1b6e87df4e5a435a701d0f38fa7

Signed-off-by: Enrico Scholz <enrico.scholz@informatik.tu-chemnitz.de>
---
 meta/classes/image.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index d3a416d..e494689 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -371,7 +371,7 @@ rootfs_install_complementary() {
     if [ "$GLOBS" != "" ] ; then
         # Use the magic script to do all the work for us :)
         : > ${WORKDIR}/complementary_pkgs.txt
-        for vendor in ${TARGET_VENDOR} ${MULTILIB_VENDORS} ; do
+        for vendor in '${TARGET_VENDOR}' ${MULTILIB_VENDORS} ; do
             oe-pkgdata-util glob ${TMPDIR}/pkgdata $vendor-${TARGET_OS} ${WORKDIR}/installed_pkgs.txt "$GLOBS" >> ${WORKDIR}/complementary_pkgs.txt
         done
 
-- 
1.7.11.7



