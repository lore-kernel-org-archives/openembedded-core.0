Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TLFmE-0007ok-GZ for openembedded-core@lists.openembedded.org;
	Mon, 08 Oct 2012 18:01:56 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q98FmmWu020988
	for <openembedded-core@lists.openembedded.org>;
	Mon, 8 Oct 2012 16:48:48 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 19723-09 for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Oct 2012 16:48:44 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q98FmfcT020982
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 8 Oct 2012 16:48:42 +0100
Message-ID: <1349711325.15658.119.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Mon, 08 Oct 2012 16:48:45 +0100
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCH] libc-package: Drop bogus replacement operation
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
X-List-Received-Date: Mon, 08 Oct 2012 16:01:57 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

The names used to generate the binary-localdata packages need to match the location
the dependencies are added. In one case the dash replacement is made, in the other it
is not leading to packages which cannot be installed:

	eglibc-binary-localedata-af-za.iso88591 is needed by locale-base-af-za.iso-8859-1-2.16-r22.i586
	eglibc-binary-localedata-cs-cz.iso88592 is needed by locale-base-cs-cz.iso-8859-2-2.16-r22.i586
	eglibc-binary-localedata-ru-ru.koi8r is needed by locale-base-ru-ru.koi8-r-2.16-r22.i586
	eglibc-binary-localedata-pl-pl.iso88592 is needed by locale-base-pl-pl.iso-8859-2-2.16-r22.i586
	eglibc-binary-localedata-hu-hu.iso88592 is needed by locale-base-hu-hu.iso-8859-2-2.16-r22.i586
	eglibc-binary-localedata-de-at+euro.iso885915 is needed by locale-base-de-at+euro.iso-8859-15-2.16-r22.i586
	eglibc-binary-localedata-sv-fi.iso88591 is needed by locale-base-sv-fi.iso-8859-1-2.16-r22.i586

This fixes things so the names are consistent.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/classes/libc-package.bbclass b/meta/classes/libc-package.bbclass
index 80d7124..3a13154 100644
--- a/meta/classes/libc-package.bbclass
+++ b/meta/classes/libc-package.bbclass
@@ -246,7 +246,7 @@ python package_do_split_gconvs () {
     def output_locale_binary_rdepends(name, pkgname, locale, encoding):
         m = re.match("(.*)\.(.*)", name)
         if m:
-            libc_name = "%s.%s" % (m.group(1), m.group(2).lower().replace("-",""))
+            libc_name = "%s.%s" % (m.group(1), m.group(2).lower())
         else:
             libc_name = name
         d.setVar('RDEPENDS_%s' % pkgname, legitimize_package_name('%s-binary-localedata-%s' \




