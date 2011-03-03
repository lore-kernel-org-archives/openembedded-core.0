Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1PvEl1-0002Te-JL
	for openembedded-core@lists.openembedded.org;
	Thu, 03 Mar 2011 21:04:19 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 03 Mar 2011 12:02:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.62,259,1297065600"; d="scan'208";a="893505454"
Received: from unknown (HELO localhost) ([10.255.12.102])
	by fmsmga001.fm.intel.com with ESMTP; 03 Mar 2011 12:02:43 -0800
Message-Id: <de623268301228d1948b7310191c2db28cf987dd.1299182375.git.sgw@linux.intel.com>
In-Reply-To: <cover.1299182375.git.sgw@linux.intel.com>
References: <cover.1299182375.git.sgw@linux.intel.com>
Old-Date: Thu, 3 Mar 2011 19:20:25 +0800
Date: Thu, 03 Mar 2011 12:02:43 -0800
To: poky@yoctoproject.org,openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
Subject: [PATCH 01/10] libpcre: fix the name collision with libc
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
X-List-Received-Date: Thu, 03 Mar 2011 20:04:20 -0000

From: Qing He <qing.he@intel.com>

fixes [YOCTO #721] [YOCTO #722]

[sgw: added patch comment, bump PR, and changed BUGID -> YOCTO]
Signed-off-by: Qing He <qing.he@intel.com>
Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../libpcre/files/fix-pcre-name-collision.patch    |   40 ++++++++++++++++++++
 meta/recipes-support/libpcre/libpcre_8.10.bb       |    5 +-
 2 files changed, 43 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-support/libpcre/files/fix-pcre-name-collision.patch

diff --git a/meta/recipes-support/libpcre/files/fix-pcre-name-collision.patch b/meta/recipes-support/libpcre/files/fix-pcre-name-collision.patch
new file mode 100644
index 0000000..6548353
--- /dev/null
+++ b/meta/recipes-support/libpcre/files/fix-pcre-name-collision.patch
@@ -0,0 +1,40 @@
+
+This patch address a namespace collision with libc.
+
+Although there is no "#include <regex.h>" in the source file, at
+runtime, it's unintentionally linked to the libc version, the regcomp of
+libc is called instead the pcre one using pcre's data structure...
+that looks like a disaster.
+
+Can patch is from Debian (and Ubuntu 11.04alpha has it also).
+
+[sgw: added patch comment]
+Signed-off-by: Qing He <qing.he@intel.com>
+Signed-off-by: Saul Wold <sgw@linux.intel.com>
+
+--- a/pcreposix.h	2010-05-17 00:17:23.000000000 +0800
++++ b/pcreposix.h	2009-01-15 04:32:17.000000000 +0800
+@@ -133,14 +130,19 @@
+ 
+ /* The functions */
+ 
+-PCREPOSIX_EXP_DECL int regcomp(regex_t *, const char *, int);
+-PCREPOSIX_EXP_DECL int regexec(const regex_t *, const char *, size_t,
++PCREPOSIX_EXP_DECL int pcreposix_regcomp(regex_t *, const char *, int);
++PCREPOSIX_EXP_DECL int pcreposix_regexec(const regex_t *, const char *, size_t,
+                      regmatch_t *, int);
+-PCREPOSIX_EXP_DECL size_t regerror(int, const regex_t *, char *, size_t);
+-PCREPOSIX_EXP_DECL void regfree(regex_t *);
++PCREPOSIX_EXP_DECL size_t pcreposix_regerror(int, const regex_t *, char *, size_t);
++PCREPOSIX_EXP_DECL void pcreposix_regfree(regex_t *);
+ 
+ #ifdef __cplusplus
+ }   /* extern "C" */
+ #endif
+ 
++#define regcomp pcreposix_regcomp
++#define regexec pcreposix_regexec
++#define regerror pcreposix_regerror
++#define regfree pcreposix_regfree
++
+ #endif /* End of pcreposix.h */
diff --git a/meta/recipes-support/libpcre/libpcre_8.10.bb b/meta/recipes-support/libpcre/libpcre_8.10.bb
index db89c89..2e17493 100644
--- a/meta/recipes-support/libpcre/libpcre_8.10.bb
+++ b/meta/recipes-support/libpcre/libpcre_8.10.bb
@@ -5,11 +5,12 @@ provides a POSIX calling interface to PCRE; the regular expressions \
 themselves still follow Perl syntax and semantics. The header file for \
 the POSIX-style functions is called pcreposix.h."
 SECTION = "devel"
-PR = "r4"
+PR = "r6"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://LICENCE;md5=77f9b14fe707d0376d89bc162e6c54ff"
 SRC_URI = "${SOURCEFORGE_MIRROR}/pcre/pcre-${PV}.tar.bz2 \
-           file://pcre-cross.patch;patch=1"
+           file://pcre-cross.patch;patch=1 \
+           file://fix-pcre-name-collision.patch"
 
 SRC_URI[md5sum] = "780867a700e9d4e4b9cb47aa5453e4b2"
 SRC_URI[sha256sum] = "7ac4e016f6bad8c7d990e6de9bce58c04ff5dd8838be0c5ada0afad1d6a07480"
-- 
1.7.1.1



