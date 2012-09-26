Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1TGoti-0002OW-Vy
	for openembedded-core@lists.openembedded.org;
	Wed, 26 Sep 2012 12:31:19 +0200
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1TGohK-0006Lx-M9
	for openembedded-core@lists.openembedded.org;
	Wed, 26 Sep 2012 12:18:31 +0200
From: Phil Blundell <philb@gnu.org>
To: OE-core <openembedded-core@lists.openembedded.org>
Date: Wed, 26 Sep 2012 11:18:29 +0100
X-Mailer: Evolution 3.0.2- 
Message-ID: <1348654710.31293.93.camel@phil-desktop>
Mime-Version: 1.0
Subject: [PATCH] strace: Don't package strace-graph
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
X-List-Received-Date: Wed, 26 Sep 2012 10:31:19 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Commit 9c9ea24b115a9bb87df1323b5f185ce426262aec made strace depend on perl because the
strace-graph script needs it.  However, this cost of the dependency is large (building
all of perl) and the value of the script is marginal.  Let's just delete the script
instead and remove the dependency again.

If anybody wants strace-graph then it should be packaged in its own recipe and that one
can be made to depend on perl without disrupting the main strace package.

Signed-off-by: Phil Blundell <pb@pbcl.net>
---
 meta/recipes-devtools/strace/strace_4.7.bb |   11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-devtools/strace/strace_4.7.bb b/meta/recipes-devtools/strace/strace_4.7.bb
index 21dd47a..e1a5e82 100644
--- a/meta/recipes-devtools/strace/strace_4.7.bb
+++ b/meta/recipes-devtools/strace/strace_4.7.bb
@@ -3,11 +3,7 @@ HOMEPAGE = "http://strace.sourceforge.net"
 SECTION = "console/utils"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=124500c21e856f0912df29295ba104c7"
-PR = "r1"
-
-PACKAGES =+ "${PN}-graph "
-FILES_${PN}-graph = "${bindir}/strace-graph"
-RDEPENDS_${PN}-graph = "perl"
+PR = "r2"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/strace/strace-${PV}.tar.xz \
            file://strace-eglibc-2.16.patch \
@@ -20,4 +16,9 @@ inherit autotools
 
 export INCLUDES = "-I. -I./linux"
 
+do_install_append() {
+	# We don't ship strace-graph here because it needs perl
+	rm ${D}${bindir}/strace-graph
+}
+
 BBCLASSEXTEND = "native"
-- 
1.7.10.4





