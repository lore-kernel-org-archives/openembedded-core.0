Received: from exprod5og119.obsmtp.com ([64.18.0.189])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.donnelly@ge.com>) id 1UVN7x-0002PY-N1
	for openembedded-core@lists.openembedded.org;
	Thu, 25 Apr 2013 16:26:28 +0200
Received: from alpmlip13.e2k.ad.ge.com ([165.156.5.1]) (using TLSv1) by
	exprod5ob119.postini.com ([64.18.4.12]) with SMTP
	ID DSNKUXk458UxSM6dW4Nm8RwJ/DucUgSPvNc5@postini.com;
	Thu, 25 Apr 2013 07:08:40 PDT
Received: from unknown (HELO alpmlip01.e2k.ad.ge.com) ([3.159.17.48])
	by alpmlip13.e2k.ad.ge.com with ESMTP/TLS/RC4-SHA;
	25 Apr 2013 09:28:47 -0400
Received: from selma.edi.geip.ge.com ([3.26.68.70])
	by alpmlip01.e2k.ad.ge.com with ESMTP; 25 Apr 2013 09:28:46 -0400
Received: from edna.edi.geip.ge.com (edna.edi.geip.ge.com [3.26.68.71])
	by selma.edi.geip.ge.com (Postfix) with ESMTP id 15403E1858;
	Thu, 25 Apr 2013 14:28:46 +0100 (BST)
From: Martin Donnelly <martin.donnelly@ge.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 25 Apr 2013 14:28:39 +0100
Message-Id: <1366896519-27520-1-git-send-email-martin.donnelly@ge.com>
X-Mailer: git-send-email 1.7.1
Subject: [PATCH] cracklib: generate the default dictionary on the target
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
X-List-Received-Date: Thu, 25 Apr 2013 14:26:30 -0000

Currently cracklib-native is used to generate the dictionary
database from the wordlist during install. Unfortunately the
database files are endian-specific and this results in
errors when the host and target endianness differ.

This patch creates the default dictionary files on the target
during post-install. In order to do this the default wordlist has
also been compressed, this enables an unmodified cracklib-format
to correctly parse the input file with both busybox and GNU gzip.
(These behave differently if the input is uncompressed, GNU
gzip behaves like cat while busybox returns an error).

Finally the cracklib-native package has been removed since
it is no longer used.

Signed-off-by: Martin Donnelly <martin.donnelly@ge.com>
---
 meta/recipes-extended/cracklib/cracklib_2.8.22.bb |   15 ++++++++++-----
 1 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-extended/cracklib/cracklib_2.8.22.bb b/meta/recipes-extended/cracklib/cracklib_2.8.22.bb
index 7e398f4..9ebca33 100644
--- a/meta/recipes-extended/cracklib/cracklib_2.8.22.bb
+++ b/meta/recipes-extended/cracklib/cracklib_2.8.22.bb
@@ -4,8 +4,7 @@ HOMEPAGE = "http://sourceforge.net/projects/cracklib"
 LICENSE = "LGPLv2.1+"
 LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=e3eda01d9815f8d24aae2dbd89b68b06"
 
-DEPENDS = "cracklib-native zlib"
-DEPENDS_class-native = "zlib"
+DEPENDS = "zlib"
 PR ="r0"
 
 EXTRA_OECONF = "--without-python"
@@ -17,8 +16,14 @@ SRC_URI[sha256sum] = "feaff49bfb513ec10b2618c00d2f7f60776ba93fcc5fa22dd3479dd9ca
 
 inherit autotools gettext
 
-BBCLASSEXTEND = "native"
-
 do_install_append_class-target() {
-	create-cracklib-dict -o ${D}${datadir}/cracklib/pw_dict ${D}${datadir}/cracklib/cracklib-small
+	gzip ${D}${datadir}/cracklib/cracklib-small
+}
+
+pkg_postinst_${PN} () {
+if [ "x$D" = "x" ]; then
+	create-cracklib-dict -o ${datadir}/cracklib/pw_dict ${datadir}/cracklib/cracklib-small.gz >/dev/null
+else
+	exit 1
+fi
 }
-- 
1.7.1



