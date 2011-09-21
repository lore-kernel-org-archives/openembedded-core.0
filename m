Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1R6LDa-00066g-1L for openembedded-core@lists.openembedded.org;
	Wed, 21 Sep 2011 13:43:58 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8LBipva029825 for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Sep 2011 12:44:52 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id s80Umq3twZ7R
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Sep 2011 12:44:51 +0100 (BST)
Received: from [192.168.250.158] ([116.246.20.131]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8LBijtJ029820
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Sep 2011 12:44:48 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Wed, 21 Sep 2011 12:38:31 +0100
X-Mailer: Evolution 3.1.91- 
Message-ID: <1316605116.13085.40.camel@ted>
Mime-Version: 1.0
Subject: [PATCH] debian.bbclass: Fix hardcoded "lib" reference
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
X-List-Received-Date: Wed, 21 Sep 2011 11:43:58 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

This patch removes a hardcoded "lib" reference from debian.bbclass
allowing libdirs like "lib64" to be used. Whilst working on this area of
code, a similar assumption about "bin" is removed and the regular
expression compilation is moved to the parent function since it doesn't
change and this will improve the speed of the code.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/classes/debian.bbclass b/meta/classes/debian.bbclass
index 1880830..554525d 100644
--- a/meta/classes/debian.bbclass
+++ b/meta/classes/debian.bbclass
@@ -24,6 +24,9 @@ python debian_package_name_hook () {
 
 	pkgdest = bb.data.getVar('PKGDEST', d, 1)
 	packages = bb.data.getVar('PACKAGES', d, 1)
+	bin_re = re.compile(".*/s?" + os.path.basename(d.getVar("bindir", True)) + "$")
+	lib_re = re.compile(".*/" + os.path.basename(d.getVar("libdir", True)) + "$")
+	so_re = re.compile("lib.*\.so")
 
 	def socrunch(s):
 		s = s.lower().replace('_', '-')
@@ -45,9 +48,6 @@ python debian_package_name_hook () {
 		return (s[stat.ST_MODE] & stat.S_IEXEC)
 
 	def auto_libname(packages, orig_pkg):
-		bin_re = re.compile(".*/s?bin$")
-		lib_re = re.compile(".*/lib$")
-		so_re = re.compile("lib.*\.so")
 		sonames = []
 		has_bins = 0
 		has_libs = 0



