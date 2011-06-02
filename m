Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1QS4Z0-0008QF-FB for openembedded-core@lists.openembedded.org;
	Thu, 02 Jun 2011 11:51:38 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <pb@pbcl.net>) id 1QS4Vx-000334-5u
	for openembedded-core@lists.openembedded.org;
	Thu, 02 Jun 2011 11:48:29 +0200
From: Phil Blundell <pb@pbcl.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Organization: Phil Blundell Consulting Ltd
Date: Thu, 02 Jun 2011 10:48:27 +0100
Message-ID: <1307008107.2529.175.camel@phil-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: [PATCH] rpm: avoid dependency on perl and python for -native build
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
X-List-Received-Date: Thu, 02 Jun 2011 09:51:38 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Update override naming (_native -> _virtclass-native) to disable perl
and python bindings when building native rpm, and adjust the DEPENDS to
match.

Perl bindings were, in fact, already disabled for both native and target
builds so it's only the python ones that have really changed.

Signed-off-by: Phil Blundell <philb@gnu.org>
---
 meta/recipes-devtools/rpm/rpm_5.4.0.bb |   10 ++++++----
 1 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-devtools/rpm/rpm_5.4.0.bb b/meta/recipes-devtools/rpm/rpm_5.4.0.bb
index d3f85f2..5c30f1c 100644
--- a/meta/recipes-devtools/rpm/rpm_5.4.0.bb
+++ b/meta/recipes-devtools/rpm/rpm_5.4.0.bb
@@ -42,8 +42,10 @@ HOMEPAGE = "http://rpm5.org/"
 LICENSE = "LGPL 2.1"
 LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=2d5025d4aa3495befef8f17206a5b0a1"
 
-DEPENDS = "bzip2 zlib python perl db openssl elfutils expat libpcre attr acl popt"
-PR = "r16"
+rpmdeps = "bzip2 zlib db openssl elfutils expat libpcre attr acl popt"
+DEPENDS = "${rpmdeps} python perl"
+DEPENDS_virtclass-native = "${rpmdeps}"
+PR = "r17"
 
 # rpm2cpio is a shell script, which is part of the rpm src.rpm.  It is needed
 # in order to extract the distribution SRPM into a format we can extract...
@@ -92,7 +94,7 @@ WITH_PYTHON = "	--with-python=${PYTHON_BASEVERSION} \
 		--without-pythonembed \
 	      "
 
-WITH_PYTHON_native = " --without-python"
+WITH_PYTHON_virtclass-native = " --without-python"
 
 # Perl modules are not built, but they could be enabled fairly easily
 # the perl module creation and installation would need to be patched.
@@ -100,7 +102,7 @@ WITH_PYTHON_native = " --without-python"
 #WITH_PERL = "	--with-perl --without-perlembed"
 WITH_PERL = "	--without-perl"
 
-WITH_PERL_native = " --without-perl"
+WITH_PERL_virtclass-native = " --without-perl"
 
 WITH_DB = "--with-db --with-dbsql --without-db-tools-integrated --without-sqlite"
 
-- 
1.7.1





