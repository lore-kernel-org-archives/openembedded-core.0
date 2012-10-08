Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TLFmp-00086M-RC for openembedded-core@lists.openembedded.org;
	Mon, 08 Oct 2012 18:02:33 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q98FnOK1020998
	for <openembedded-core@lists.openembedded.org>;
	Mon, 8 Oct 2012 16:49:24 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 20516-04 for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Oct 2012 16:49:19 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q98FnHi0020992
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 8 Oct 2012 16:49:18 +0100
Message-ID: <1349711362.15658.120.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Mon, 08 Oct 2012 16:49:22 +0100
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCH] package: Recommend virtual-locale-*, don't depend on it
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
X-List-Received-Date: Mon, 08 Oct 2012 16:02:38 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

The virtual-locale-* packages are provided by libc which may or
may not have a matching locale for any given recipes's provided locales.
Certainly, we shouldn't get a failure if the locale package isn't
available.

This patch therefore makes the dependency optional rather than
required, allowing the locale packages in question to install. This
resolves errors like:

	virtual-locale-eo is needed by bash-locale-eo-4.2-r5.i586
	virtual-locale-en+boldquot is needed by bash-locale-en+boldquot-4.2-r5.i586
	virtual-locale-en+quot is needed by bash-locale-en+quot-4.2-r5.i586

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 73c4358..0300277 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -451,7 +451,7 @@ python package_do_split_locales() {
         pkg = pn + '-locale-' + ln
         packages.append(pkg)
         d.setVar('FILES_' + pkg, os.path.join(datadir, 'locale', l))
-        d.setVar('RDEPENDS_' + pkg, '%s%svirtual-locale-%s' % (pndep, mlprefix, ln))
+        d.setVar('RRECOMMENDS_' + pkg, '%s%svirtual-locale-%s' % (pndep, mlprefix, ln))
         d.setVar('RPROVIDES_' + pkg, '%s-locale %s%s-translation' % (pn, mlprefix, ln))
         d.setVar('SUMMARY_' + pkg, '%s - %s translations' % (summary, l))
         d.setVar('DESCRIPTION_' + pkg, '%s  This package contains language translation files for the %s locale.' % (description, l))




