Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <amy.fong@windriver.com>) id 1SoJU0-0000rr-8k
	for openembedded-core@lists.openembedded.org;
	Mon, 09 Jul 2012 21:18:56 +0200
Received: from yow-afong-lx2.ottawa.windriver.com (yow-afong-lx2.wrs.com
	[128.224.146.164])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q69FchA6008340
	for <openembedded-core@lists.openembedded.org>;
	Mon, 9 Jul 2012 08:38:44 -0700 (PDT)
Received: from afong by yow-afong-lx2.ottawa.windriver.com with local (Exim
	4.80) (envelope-from <amy.fong@windriver.com>) id 1SoG2s-0003u2-Nf
	for openembedded-core@lists.openembedded.org;
	Mon, 09 Jul 2012 11:38:42 -0400
Date: Mon, 9 Jul 2012 11:38:42 -0400
From: Amy Fong <amy.fong@windriver.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20120709153842.GA14986@windriver.com>
MIME-Version: 1.0
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: [PATCH] package install failure on systems without /sbin/ldconfig
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
X-List-Received-Date: Mon, 09 Jul 2012 19:18:56 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Package install failures due to issues in post install rules.
    
package_do_shlibs only looks for libraries in a directory "lib", this should be
modified to the variable baselib.
    
ldconfig_postinst_fragment failure observed on systems without /sbin/ldconfig
        [ -x /sbin/ldconfig ] && /sbin/ldconfig
results in the post install rule returning a failure. Modify to
        if [ -x /sbin/ldconfig ]; then /sbin/ldconfig; fi
    
Signed-off-by: Amy Fong <amy.fong@windriver.com>
---
 package.bbclass |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 56ab25c..28a263c 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -1151,7 +1151,7 @@ emit_pkgdata[dirs] = "${PKGDESTWORK}/runtime"
 
 ldconfig_postinst_fragment() {
 if [ x"$D" = "x" ]; then
-	[ -x /sbin/ldconfig ] && /sbin/ldconfig
+	if [ -x /sbin/ldconfig ]; then /sbin/ldconfig ; fi
 fi
 }
 
@@ -1261,7 +1261,7 @@ python package_do_shlibs() {
 		return
 		
 	lib_re = re.compile("^.*\.so")
-	libdir_re = re.compile(".*/lib$")
+	libdir_re = re.compile(".*/%s$" % d.getVar('baselib', True))
 
 	packages = d.getVar('PACKAGES', True)
 	targetos = d.getVar('TARGET_OS', True)


