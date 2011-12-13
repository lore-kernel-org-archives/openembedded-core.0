Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RaPuH-0004wd-W1
	for openembedded-core@lists.openembedded.org;
	Tue, 13 Dec 2011 11:48:22 +0100
Received: by yenm12 with SMTP id m12so4872402yen.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Dec 2011 02:41:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=R3wbQDys0empy0HYyhQ/Z4NDhfD1hc8YNH2GSwuSYkQ=;
	b=CgaBz4K0/ueyA1uL248G19kcE/XM81qRMqR9kSHAYLPPCH3aA6lsJRMxyw1iWoS4lp
	5UDSWXfPqNu36wKubzYW7j6st+aX1bgekVLnx7OevTM3SzJ0cfr/xRvoLK5OeXXG1Ag7
	1lfzz8ECMwBQsatnUJWj8ycA+Z5mcPjGPrF/8=
Received: by 10.236.131.1 with SMTP id l1mr2657861yhi.82.1323772886124;
	Tue, 13 Dec 2011 02:41:26 -0800 (PST)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id 5sm8144235anz.14.2011.12.13.02.41.23
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 13 Dec 2011 02:41:24 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Dec 2011 10:41:14 +0000
Message-Id: <b2df27e3b60bc584dab08c25232f87b7f3a7e8db.1323772851.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1323772851.git.otavio@ossystems.com.br>
References: <cover.1323772851.git.otavio@ossystems.com.br>
Subject: [PATCH 1/1] connman: improve packaging
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
X-List-Received-Date: Tue, 13 Dec 2011 10:48:22 -0000

The scripts being included on connman-scripts was the test utility and
thus we are moving them with the rest of test utilities in
'connman-tests'. A runtime dependency on python-dbus were missing as
well as those scripts uses it.

As no dhclient, resolvconf and udhcpc plugins are being generated the
respective dependency map entries were also removed.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta/recipes-connectivity/connman/connman.inc     |   14 ++++++--------
 meta/recipes-connectivity/connman/connman_0.78.bb |    2 +-
 2 files changed, 7 insertions(+), 9 deletions(-)

diff --git a/meta/recipes-connectivity/connman/connman.inc b/meta/recipes-connectivity/connman/connman.inc
index 503bf1c..bb1b279 100644
--- a/meta/recipes-connectivity/connman/connman.inc
+++ b/meta/recipes-connectivity/connman/connman.inc
@@ -68,16 +68,16 @@ do_install_append() {
 	install -d ${D}${bindir}
 	install -m 0755 ${S}/tools/*-test ${D}${bindir}
 	install -m 0755 ${S}/tools/wispr ${D}${bindir}
+
+	# We don't need to package an empty directory
+	rmdir ${D}${libdir}/connman/scripts
 }
 
 PACKAGES_DYNAMIC = "${PN}-plugin-*"
 
 python populate_packages_prepend() {
 	depmap = dict( pppd="ppp",
-	               udhcp="busybox connman-scripts",
-	               dhclient="dhcp-client",
 	               wifi="wpa-supplicant",
-	               resolvconf="resolvconf",
 	               bluetooth="bluez4",
 	               ofono="ofono" )
 	packages = []
@@ -94,14 +94,12 @@ python populate_packages_prepend() {
 			d.setVar("RDEPENDS_%s" % package, " ".join(rdepends))
 }
 
-PACKAGES =+ "${PN}-scripts ${PN}-tools ${PN}-tests"
+PACKAGES =+ "${PN}-tools ${PN}-tests"
 
 FILES_${PN}-tools = "${bindir}/wispr"
 
-FILES_${PN}-tests = "${bindir}/*-test"
-
-FILES_${PN}-scripts += "${libdir}/${PN}/test/* ${libdir}/connman/scripts"
-RDEPENDS_${PN}-scripts = "python"
+FILES_${PN}-tests = "${bindir}/*-test ${libdir}/${PN}/test/*"
+RDEPENDS_${PN}-tests = "python-dbus"
 
 FILES_${PN} = "${bindir}/* ${sbindir}/* ${libexecdir}/* ${libdir}/lib*.so.* \
             ${sysconfdir} ${sharedstatedir} ${localstatedir} \
diff --git a/meta/recipes-connectivity/connman/connman_0.78.bb b/meta/recipes-connectivity/connman/connman_0.78.bb
index f36f670..74c102b 100644
--- a/meta/recipes-connectivity/connman/connman_0.78.bb
+++ b/meta/recipes-connectivity/connman/connman_0.78.bb
@@ -1,6 +1,6 @@
 require connman.inc
 
-PR = "r4"
+PR = "r5"
 
 # 0.78 tag
 SRCREV = "02f5d5fe2d7c71514a6387ba2b772b42d8e8d297"
-- 
1.7.2.5



