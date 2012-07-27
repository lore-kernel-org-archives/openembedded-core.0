Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Suj23-0002qr-Rp for openembedded-core@lists.openembedded.org;
	Fri, 27 Jul 2012 13:48:36 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6RBb4pP005723
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jul 2012 12:37:04 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 05276-03 for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jul 2012 12:36:59 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6RBauhL005717
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jul 2012 12:36:58 +0100
Message-ID: <1343389016.9574.122.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Fri, 27 Jul 2012 12:36:56 +0100
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCH] package.bbclass/eglibc-locale: Ensure the correct PN is used for locale packages
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
X-List-Received-Date: Fri, 27 Jul 2012 11:48:36 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

This avoids dependencies like eglibc-locale-locale creeping into 
the eglibc locale packaging by blinding using the value of PN.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index ea199d3..90f145d 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -371,6 +371,8 @@ python package_get_auto_pr() {
         d.setVar('PRAUTO',str(auto_pr))
 }
 
+LOCALEBASEPN ??= "${PN}"
+
 python package_do_split_locales() {
     if (d.getVar('PACKAGE_NO_LOCALE', True) == '1'):
         bb.debug(1, "package requested not splitting locales")
@@ -384,7 +386,7 @@ python package_do_split_locales() {
         return
 
     dvar = d.getVar('PKGD', True)
-    pn = d.getVar('PN', True)
+    pn = d.getVar('LOCALEBASEPN', True)
 
     if pn + '-locale' in packages:
         packages.remove(pn + '-locale')
diff --git a/meta/recipes-core/eglibc/eglibc-locale.inc b/meta/recipes-core/eglibc/eglibc-locale.inc
index 6990569..c08e38d 100644
--- a/meta/recipes-core/eglibc/eglibc-locale.inc
+++ b/meta/recipes-core/eglibc/eglibc-locale.inc
@@ -2,6 +2,7 @@ INHIBIT_DEFAULT_DEPS = "1"
 LICENSE = "GPLv2 & LGPLv2.1"
 
 BPN = "eglibc"
+LOCALEBASEPN = "eglibc"
 
 do_fetch[noexec] = "1"
 do_unpack[noexec] = "1"




