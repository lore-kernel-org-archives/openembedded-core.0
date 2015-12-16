Return-Path: <mschiffer@universe-factory.net>
Received: from chaos.universe-factory.net (chaos.universe-factory.net
	[37.72.148.22])
	by mail.openembedded.org (Postfix) with ESMTP id 561E473183
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Dec 2015 18:21:29 +0000 (UTC)
Received: from avalon.neoraider.dn42 (unknown [IPv6:fd1b:c28a:2fd6::2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	by chaos.universe-factory.net (Postfix) with ESMTPSA id 10FD5180FD9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Dec 2015 19:12:04 +0100 (CET)
From: Matthias Schiffer <mschiffer@universe-factory.net>
To: openembedded-core@lists.openembedded.org
Date: Wed, 16 Dec 2015 19:11:57 +0100
Message-Id: <eb217bbe312a0035cec22c97fa23e93c27b034b6.1450288828.git.mschiffer@universe-factory.net>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <cover.1450288828.git.mschiffer@universe-factory.net>
References: <cover.1450288828.git.mschiffer@universe-factory.net>
In-Reply-To: <cover.1450288828.git.mschiffer@universe-factory.net>
References: <cover.1450288828.git.mschiffer@universe-factory.net>
Subject: [PATCH 1/4] busybox: generalize recipe to work with arbitrary install directories
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
X-List-Received-Date: Wed, 16 Dec 2015 18:21:31 -0000

Allow configuring base_bindir, base_sbindir, bindir and sbindir
arbitrarily.

Also change the temporary symlinks created in the postinst script from
relative to absolute to make the code simpler and more flexible. There was
no reason to use relative links anyways, as directly afterwards
update-alternatives would replace them by absolute links anyways.

Signed-off-by: Matthias Schiffer <mschiffer@universe-factory.net>
---
 meta/recipes-core/busybox/busybox.inc | 35 ++++++++++++-----------------------
 1 file changed, 12 insertions(+), 23 deletions(-)

diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
index fba956e..9541123 100644
--- a/meta/recipes-core/busybox/busybox.inc
+++ b/meta/recipes-core/busybox/busybox.inc
@@ -171,20 +171,20 @@ do_compile() {
 }
 
 do_install () {
-	if [ "${prefix}" != "/usr" ]; then
-		sed -i "s:^/usr/:${prefix}/:" busybox.links*
-	fi
-	if [ "${base_sbindir}" != "/sbin" ]; then
-		sed -i "s:^/sbin/:${base_sbindir}/:" busybox.links*
-	fi
-	if [ "${base_bindir}" != "/bin" ]; then
-		sed -i "s:^/bin/:${base_bindir}/:" busybox.links*
-	fi
+	sed -i "s:^/bin/:BASE_BINDIR/:" busybox.links*
+	sed -i "s:^/sbin/:BASE_SBINDIR/:" busybox.links*
+	sed -i "s:^/usr/bin/:BINDIR/:" busybox.links*
+	sed -i "s:^/usr/sbin/:SBINDIR/:" busybox.links*
+
+	sed -i "s:^BASE_BINDIR/:${base_bindir}/:" busybox.links*
+	sed -i "s:^BASE_SBINDIR/:${base_sbindir}/:" busybox.links*
+	sed -i "s:^BINDIR/:${bindir}/:" busybox.links*
+	sed -i "s:^SBINDIR/:${sbindir}/:" busybox.links*
 
 	install -d ${D}${sysconfdir}/init.d
 
 	if ! grep -q "CONFIG_FEATURE_INDIVIDUAL=y" ${B}/.config; then
-		# Install /bin/busybox, and the /bin/sh link so the postinst script
+		# Install ${base_bindir}/busybox, and the ${base_bindir}/sh link so the postinst script
 		# can run. Let update-alternatives handle the rest.
 		install -d ${D}${base_bindir}
 		if [ "${BUSYBOX_SPLIT_SUID}" = "1" ]; then
@@ -212,7 +212,7 @@ do_install () {
 			# We make this symlink here to eliminate the error when upgrading together
 			# with busybox-syslog. Without this symlink, the opkg may think of the
 			# busybox.nosuid as obsolete and remove it, resulting in dead links like
-			# /bin/sed -> /bin/busybox.nosuid. This will make upgrading busybox-syslog fail.
+			# ${base_bindir}/sed -> ${base_bindir}/busybox.nosuid. This will make upgrading busybox-syslog fail.
 			# This symlink will be safely deleted in postinst, thus no negative effect.
 			ln -sf busybox ${D}${base_bindir}/busybox.nosuid
 		fi
@@ -368,21 +368,10 @@ pkg_postinst_${PN} () {
 			if test -e ${sysconfdir}/busybox.links$suffix; then
 				while read link; do
 					if test ! -e "$link"; then
-						case "$link" in
-							/*/*/*)
-								to="../..${base_bindir}/busybox$suffix"
-								;;
-							/bin/*)
-								to="busybox$suffix"
-								;;
-							/*/*)
-								to="..${base_bindir}/busybox$suffix"
-								;;
-						esac
 						# we can use busybox here because even if we are using splitted busybox
 						# we've made a symlink from /bin/busybox to /bin/busybox.nosuid.
 						busybox rm -f $link
-						busybox ln -s $to $link
+						busybox ln -s "${base_bindir}/busybox$suffix" $link
 					fi
 				done < ${sysconfdir}/busybox.links$suffix
 			fi
-- 
2.6.4


