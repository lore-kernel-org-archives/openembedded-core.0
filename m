Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SqnhK-0006sq-Uu
	for openembedded-core@lists.openembedded.org;
	Mon, 16 Jul 2012 17:58:59 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 16 Jul 2012 08:47:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="193443302"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.178])
	by fmsmga002.fm.intel.com with ESMTP; 16 Jul 2012 08:47:38 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 16 Jul 2012 08:47:08 -0700
Message-Id: <3f85ab6d0d05a4e34fe73fa343d2b3b942fc69b7.1342453118.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1342453118.git.sgw@linux.intel.com>
References: <cover.1342453118.git.sgw@linux.intel.com>
In-Reply-To: <cover.1342453118.git.sgw@linux.intel.com>
References: <cover.1342453118.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 02/30] package install failure on systems without /sbin/ldconfig
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
X-List-Received-Date: Mon, 16 Jul 2012 15:58:59 -0000

From: Amy Fong <amy.fong@windriver.com>

Package install failures due to issues in post install rules.

package_do_shlibs only looks for libraries in a directory "lib", this should be
modified to the variable baselib.

ldconfig_postinst_fragment failure observed on systems without /sbin/ldconfig
        [ -x /sbin/ldconfig ] && /sbin/ldconfig
results in the post install rule returning a failure. Modify to
        if [ -x /sbin/ldconfig ]; then /sbin/ldconfig; fi

Signed-off-by: Amy Fong <amy.fong@windriver.com>
Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/classes/package.bbclass |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index e6856cd..ec7de2c 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -1141,7 +1141,7 @@ emit_pkgdata[dirs] = "${PKGDESTWORK}/runtime"
 
 ldconfig_postinst_fragment() {
 if [ x"$D" = "x" ]; then
-	[ -x /sbin/ldconfig ] && /sbin/ldconfig
+	if [ -x /sbin/ldconfig ]; then /sbin/ldconfig ; fi
 fi
 }
 
@@ -1251,7 +1251,7 @@ python package_do_shlibs() {
 		return
 		
 	lib_re = re.compile("^.*\.so")
-	libdir_re = re.compile(".*/lib$")
+	libdir_re = re.compile(".*/%s$" % d.getVar('baselib', True))
 
 	packages = d.getVar('PACKAGES', True)
 	targetos = d.getVar('TARGET_OS', True)
-- 
1.7.7.6



