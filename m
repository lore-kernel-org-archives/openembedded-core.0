Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1TAetJ-0002Io-9A
	for openembedded-core@lists.openembedded.org;
	Sun, 09 Sep 2012 12:37:25 +0200
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.6])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1TAehH-0007Yd-6G
	for openembedded-core@lists.openembedded.org;
	Sun, 09 Sep 2012 12:24:59 +0200
Message-ID: <1347186173.4396.258.camel@x121e.pbcl.net>
From: Phil Blundell <philb@gnu.org>
To: openembedded-core@lists.openembedded.org
Date: Sun, 09 Sep 2012 11:22:53 +0100
X-Mailer: Evolution 3.4.3-1 
Mime-Version: 1.0
Subject: [PATCH] shadow: Fix various invalid assumptions about directory layout
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
X-List-Received-Date: Sun, 09 Sep 2012 10:37:25 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

The makefiles in the shadow package have their own hard-coded paths
for ${base_bindir} and ${base_sbindir} (known as "bindir" and "sbindir"
in shadow-speak).  Ensure that they install into our paths rather than
their own.

Also check that ${base_bindir} and ${bindir} are different before trying
to move files from one to the other; likewise for ${base_sbindir} and
${sbindir}.

Signed-off-by: Phil Blundell <pb@pbcl.net>
---
 meta/recipes-extended/shadow/shadow_4.1.4.3.bb |   17 ++++++++++++++---
 1 files changed, 14 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-extended/shadow/shadow_4.1.4.3.bb b/meta/recipes-extended/shadow/shadow_4.1.4.3.bb
index 6794cc1..eb00bf0 100644
--- a/meta/recipes-extended/shadow/shadow_4.1.4.3.bb
+++ b/meta/recipes-extended/shadow/shadow_4.1.4.3.bb
@@ -56,7 +56,14 @@ PAM_SRC_URI = "file://pam.d/chfn \
                file://pam.d/passwd \
                file://pam.d/su"
 
-do_install_append() {
+do_install() {
+	oe_runmake DESTDIR="${D}" sbindir="${base_sbindir}" usbindir="${sbindir}" install
+
+	# Info dir listing isn't interesting at this point so remove it if it exists.
+	if [ -e "${D}${infodir}/dir" ]; then
+		rm -f ${D}${infodir}/dir
+	fi
+
 	# Ensure that the image has as a /var/spool/mail dir so shadow can
 	# put mailboxes there if the user reconfigures shadow to its
 	# defaults (see sed below).
@@ -93,8 +100,12 @@ do_install_append() {
 	# Move binaries to the locations we want
 	rm ${D}${sbindir}/vigr
 	ln -sf vipw.${BPN} ${D}${base_sbindir}/vigr
-	mv ${D}${sbindir}/vipw ${D}${base_sbindir}/vipw
-	mv ${D}${bindir}/login ${D}${base_bindir}/login
+	if [ "${sbindir}" != "${base_sbindir}" ]; then
+		mv ${D}${sbindir}/vipw ${D}${base_sbindir}/vipw
+	fi
+	if [ "${bindir}" != "${base_bindir}" ]; then
+		mv ${D}${bindir}/login ${D}${base_bindir}/login
+	fi
 
 	# Handle link properly after rename, otherwise missing files would
 	# lead rpm failed dependencies.
-- 
1.7.9





