Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bogdan.a.marinescu@intel.com>) id 1Tm23T-0003hU-Rt
	for openembedded-core@lists.openembedded.org;
	Fri, 21 Dec 2012 13:50:24 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 21 Dec 2012 04:35:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,329,1355126400"; d="scan'208";a="265540102"
Received: from bogdanm (HELO localhost.localdomain) ([10.237.105.166])
	by fmsmga001.fm.intel.com with ESMTP; 21 Dec 2012 04:35:38 -0800
From: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 21 Dec 2012 14:38:39 +0200
Message-Id: <1356093519-27312-3-git-send-email-bogdan.a.marinescu@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1356093519-27312-1-git-send-email-bogdan.a.marinescu@intel.com>
References: <1356093519-27312-1-git-send-email-bogdan.a.marinescu@intel.com>
Subject: [PATCH 2/2] rpm: remove declaration of "sykcparse"
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
X-List-Received-Date: Fri, 21 Dec 2012 12:50:24 -0000

This is needed so rpm compiles with the latest update of bison
(2.7), otherwise compilations ends with a "function already declared"
error.

Signed-off-by: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
---
 .../rpm/rpm/rpm-remove-sykcparse-decl.patch              |   14 ++++++++++++++
 meta/recipes-devtools/rpm/rpm_5.4.9.bb                   |    3 ++-
 2 files changed, 16 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-remove-sykcparse-decl.patch

diff --git a/meta/recipes-devtools/rpm/rpm/rpm-remove-sykcparse-decl.patch b/meta/recipes-devtools/rpm/rpm/rpm-remove-sykcparse-decl.patch
new file mode 100644
index 0000000..89ee410
--- /dev/null
+++ b/meta/recipes-devtools/rpm/rpm/rpm-remove-sykcparse-decl.patch
@@ -0,0 +1,14 @@
+diff --git a/syck/lib/syck.h b/syck/lib/syck.h
+index 04be1d9..73830a6 100644
+--- a/syck/lib/syck.h
++++ b/syck/lib/syck.h
+@@ -621,9 +621,6 @@ long syck_seq_count( SyckNode *seq )
+  */
+ void syckerror( char *msg )
+ 	/*@*/;
+-int syckparse( void * )
+-	/*@globals fileSystem @*/
+-	/*@modifies fileSystem @*/;
+ /* XXX union YYSTYPE *sycklval has issues on Mac OS X. */
+ int sycklex( void *_sycklval, SyckParser *parser )
+ 	/*@modifies _sycklval, parser @*/;
diff --git a/meta/recipes-devtools/rpm/rpm_5.4.9.bb b/meta/recipes-devtools/rpm/rpm_5.4.9.bb
index be76f24..088fc66 100644
--- a/meta/recipes-devtools/rpm/rpm_5.4.9.bb
+++ b/meta/recipes-devtools/rpm/rpm_5.4.9.bb
@@ -43,7 +43,7 @@ LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=2d5025d4aa3495befef8f17206a5b0a1"
 
 DEPENDS = "libpcre attr acl popt ossp-uuid file bison-native"
-PR = "r59"
+PR = "r60"
 
 # rpm2cpio is a shell script, which is part of the rpm src.rpm.  It is needed
 # in order to extract the distribution SRPM into a format we can extract...
@@ -84,6 +84,7 @@ SRC_URI = "http://www.rpm5.org/files/rpm/rpm-5.4/rpm-5.4.9-0.20120508.src.rpm;ex
 	   file://python-rpm-rpmsense.patch \
 	   file://rpm-reloc-macros.patch \
 	   file://rpm-platform2.patch \
+     file://rpm-remove-sykcparse-decl.patch \
 	  "
 
 # Uncomment the following line to enable platform score debugging
-- 
1.7.10.4



