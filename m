Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SsG6B-0002fq-KW for openembedded-core@lists.openembedded.org;
	Fri, 20 Jul 2012 18:30:40 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6KGJGoh013508
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jul 2012 17:19:16 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 13343-02 for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jul 2012 17:19:11 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6KGJ7kG013502
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jul 2012 17:19:09 +0100
Message-ID: <1342801150.21788.43.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Fri, 20 Jul 2012 17:19:10 +0100
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCH] gnome-doc-utils: Update to use python-native
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
X-List-Received-Date: Fri, 20 Jul 2012 16:30:40 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

This includes a wrapper so that the full path to python-native is encoded whilst not
exceeding any environment length constraints as hinted at in the patch to this area
of code already included.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/recipes-gnome/gnome/gnome-doc-utils.inc b/meta/recipes-gnome/gnome/gnome-doc-utils.inc
index 08333db..b2570d6 100644
--- a/meta/recipes-gnome/gnome/gnome-doc-utils.inc
+++ b/meta/recipes-gnome/gnome/gnome-doc-utils.inc
@@ -2,7 +2,7 @@ LICENSE = "GPLv2 & LGPLv2.1"
 DEPENDS = "libxml2 libxslt libxslt-native gnome-doc-utils-native glib-2.0"
 DEPENDS_virtclass-native = "libxml2-native libxslt-native intltool-native glib-2.0-native"
 
-inherit gnome gettext python-dir
+inherit gnome gettext python-dir pythonnative
 
 EXTRA_OECONF += "--disable-scrollkeeper"
 
@@ -13,6 +13,10 @@ do_install_append() {
 	chown -R root:root ${D}
 }
 
+do_install_append_class-native () {
+	create_wrapper ${D}${bindir}/xml2po ${STAGING_BINDIR_NATIVE}/python-native/python
+}
+
 FILES_${PN} += "${datadir}/xml* ${PYTHON_SITEPACKAGES_DIR}/*"
 
 RDEPENDS_${PN} = "bash"




