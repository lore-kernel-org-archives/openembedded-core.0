Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1QszuU-0006B0-Re
	for openembedded-core@lists.openembedded.org;
	Mon, 15 Aug 2011 18:21:06 +0200
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1Qszq4-0004yc-NU
	for openembedded-core@lists.openembedded.org;
	Mon, 15 Aug 2011 18:16:32 +0200
From: Phil Blundell <philb@gnu.org>
To: oe-core <openembedded-core@lists.openembedded.org>
Date: Mon, 15 Aug 2011 17:16:31 +0100
X-Mailer: Evolution 3.0.2- 
Message-ID: <1313424992.6733.187.camel@phil-desktop>
Mime-Version: 1.0
Subject: [PATCH] cmake.bbclass, perlnative.bbclass: arrange for cmake to find perl-native
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
X-List-Received-Date: Mon, 15 Aug 2011 16:21:06 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

When CMake is looking for perl, it only searches in the specific directories
that it's told about and ignores ${PATH}.  If perlnative is in use, ensure
that the appropriate installation path is added to the list of places that
cmake will look for perl, otherwise it won't ever be found.

Signed-off-by: Phil Blundell <philb@gnu.org>
---
 meta/classes/cmake.bbclass      |    3 ++-
 meta/classes/perlnative.bbclass |    1 +
 2 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/meta/classes/cmake.bbclass b/meta/classes/cmake.bbclass
index 89a154f..ab23bed 100644
--- a/meta/classes/cmake.bbclass
+++ b/meta/classes/cmake.bbclass
@@ -25,6 +25,7 @@ OECMAKE_C_FLAGS_RELEASE ?= "${SELECTED_OPTIMIZATION} ${CPPFLAGS} -DNDEBUG"
 OECMAKE_CXX_FLAGS_RELEASE ?= "${SELECTED_OPTIMIZATION} ${CXXFLAGS} -DNDEBUG"
 
 OECMAKE_RPATH ?= ""
+OECMAKE_PERLNATIVE_DIR ??= ""
 
 cmake_do_generate_toolchain_file() {
 	cat > ${WORKDIR}/toolchain.cmake <<EOF
@@ -41,7 +42,7 @@ set( CMAKE_CXX_FLAGS_RELEASE "${OECMAKE_CXX_FLAGS_RELEASE}" CACHE STRING "CXXFLA
 
 # only search in the paths provided so cmake doesnt pick
 # up libraries and tools from the native build machine
-set( CMAKE_FIND_ROOT_PATH ${STAGING_DIR_HOST} ${STAGING_DIR_NATIVE} ${CROSS_DIR} )
+set( CMAKE_FIND_ROOT_PATH ${STAGING_DIR_HOST} ${STAGING_DIR_NATIVE} ${CROSS_DIR} ${OECMAKE_PERLNATIVE_DIR})
 set( CMAKE_FIND_ROOT_PATH_MODE_PROGRAM ONLY )
 set( CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY )
 set( CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY )
diff --git a/meta/classes/perlnative.bbclass b/meta/classes/perlnative.bbclass
index 522344d..2211b72 100644
--- a/meta/classes/perlnative.bbclass
+++ b/meta/classes/perlnative.bbclass
@@ -1,2 +1,3 @@
 PATH_prepend = "${STAGING_BINDIR_NATIVE}/perl-native:"
 DEPENDS += "perl-native"
+OECMAKE_PERLNATIVE_DIR = "${STAGING_BINDIR_NATIVE}/perl-native"
-- 
1.7.4.1





