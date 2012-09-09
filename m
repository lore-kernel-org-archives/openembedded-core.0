Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1TAfIL-00033n-5J
	for openembedded-core@lists.openembedded.org;
	Sun, 09 Sep 2012 13:03:17 +0200
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.6])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1TAf6J-0007cT-89
	for openembedded-core@lists.openembedded.org;
	Sun, 09 Sep 2012 12:50:51 +0200
Message-ID: <1347187725.4396.259.camel@x121e.pbcl.net>
From: Phil Blundell <philb@gnu.org>
To: openembedded-core@lists.openembedded.org
Date: Sun, 09 Sep 2012 11:48:45 +0100
X-Mailer: Evolution 3.4.3-1 
Mime-Version: 1.0
Subject: [PATCH] shadow-native: Ensure that ${sbindir} and ${base_sbindir} are respected
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
X-List-Received-Date: Sun, 09 Sep 2012 11:03:17 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

These values need to be passed on the command line to "make install" otherwise
shadow will use its own built-in idea of where those directories are located.

Signed-off-by: Phil Blundell <pb@pbcl.net>
---
 .../shadow/shadow-native_4.1.4.3.bb                |   11 +++++++++--
 1 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/shadow/shadow-native_4.1.4.3.bb b/meta/recipes-extended/shadow/shadow-native_4.1.4.3.bb
index cd5605f..0469306 100644
--- a/meta/recipes-extended/shadow/shadow-native_4.1.4.3.bb
+++ b/meta/recipes-extended/shadow/shadow-native_4.1.4.3.bb
@@ -7,7 +7,7 @@ LICENSE = "BSD | Artistic-1.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=08c553a87d4e51bbed50b20e0adcaede \
                     file://src/passwd.c;firstline=8;endline=30;md5=2899a045e90511d0e043b85a7db7e2fe"
 
-PR = "r7"
+PR = "r8"
 
 SRC_URI = "http://pkg-shadow.alioth.debian.org/releases/${BPN}-${PV}.tar.bz2 \
            file://shadow.automake-1.11.patch \
@@ -30,7 +30,14 @@ EXTRA_OECONF += "--without-audit \
                  --without-selinux \
                  --without-nscd"
 
-do_install_append() {
+do_install() {
+	oe_runmake DESTDIR="${D}" sbindir="${base_sbindir}" usbindir="${sbindir}" install
+
+	# Info dir listing isn't interesting at this point so remove it if it exists.
+	if [ -e "${D}${infodir}/dir" ]; then
+		rm -f ${D}${infodir}/dir
+	fi
+
 	# Enable CREATE_HOME by default.
 	sed -i 's/#CREATE_HOME/CREATE_HOME/g' ${D}${sysconfdir}/login.defs
 
-- 
1.7.9





