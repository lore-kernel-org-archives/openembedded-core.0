Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Sx3Al-0007Ti-DR for openembedded-core@lists.openembedded.org;
	Thu, 02 Aug 2012 23:43:11 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q72LVW6W011353
	for <openembedded-core@lists.openembedded.org>;
	Thu, 2 Aug 2012 22:31:32 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 09311-08 for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Aug 2012 22:31:29 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q72LVNLL011347
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 2 Aug 2012 22:31:24 +0100
Message-ID: <1343943083.9756.113.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Thu, 02 Aug 2012 22:31:23 +0100
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCH] gnome-desktop: Fix python location on recent distros
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
X-List-Received-Date: Thu, 02 Aug 2012 21:43:11 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

This fixes errors on distros with python as /bin/python of the form:

| error: Failed dependencies:
| 	/bin/python is needed by gnome-desktop-2.32.1-r5.i586

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/recipes-gnome/gnome/gnome-desktop.inc b/meta/recipes-gnome/gnome/gnome-desktop.inc
index 51933b2..4687a7b 100644
--- a/meta/recipes-gnome/gnome/gnome-desktop.inc
+++ b/meta/recipes-gnome/gnome/gnome-desktop.inc
@@ -11,12 +11,13 @@ do_configure_prepend () {
 
 FILES_${PN} += "${datadir}/gnome-about ${datadir}/libgnome-desktop/pnp.ids"
 
-PR = "r5"
+PR = "r6"
 
 inherit gnome pkgconfig
 
 do_install_append () {
 	sed -i -e's,${STAGING_BINDIR_NATIVE},${bindir},g' ${D}${bindir}/gnome-about
+	sed -i -e '1s,#!.*python,#! ${USRBINPATH}/env python,' ${D}${bindir}/gnome-about
 }
 
 




