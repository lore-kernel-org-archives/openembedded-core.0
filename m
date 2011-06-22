Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1QZRF6-00085R-Qa
	for openembedded-core@lists.openembedded.org;
	Wed, 22 Jun 2011 19:29:33 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p5MHPvCK026921
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jun 2011 10:25:57 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Wed, 22 Jun 2011 10:25:57 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 22 Jun 2011 12:36:34 -0500
Message-ID: <b1f05da57a7748cb92cb6c690187a4b990401124.1308763995.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1308763995.git.mark.hatle@windriver.com>
References: <cover.1308763995.git.mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 40/40] boost: Move the do_configure_prepend to a seperate task
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
X-List-Received-Date: Wed, 22 Jun 2011 17:29:33 -0000
Content-Type: text/plain

We need to perform those actions after patch, and before configure.

Otherwise a rebuild starting with configure will fail.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/recipes-support/boost/boost-36.inc |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/boost/boost-36.inc b/meta/recipes-support/boost/boost-36.inc
index 3adc3ed..bc4e750 100644
--- a/meta/recipes-support/boost/boost-36.inc
+++ b/meta/recipes-support/boost/boost-36.inc
@@ -9,7 +9,7 @@ SECTION = "libs"
 DEPENDS = "boost-jam-native zlib"
 PRIORITY = "optional"
 LICENSE = "Boost"
-PR = "r3"
+PR = "r4"
 
 ARM_INSTRUCTION_SET = "arm"
 BOOST_VER = "${@"_".join(bb.data.getVar("PV",d,1).split("."))}"
@@ -126,12 +126,14 @@ BJAM_OPTS    = '${BJAM_TOOLS} \
 		${BJAM_EXTRA}'
 
 
-do_configure_prepend() {
+do_boostconfig() {
 	cp -f boost/config/platform/linux.hpp boost/config/platform/linux-gnueabi.hpp
 
 	echo 'using gcc : 4.3.1 : ${CXX} : compileflags -DBOOST_SP_USE_PTHREADS -I${includedir} linkflags -L${libdir} ;' >> ${S}/tools/build/v2/user-config.jam
 }
 
+addtask do_boostconfig after do_patch before do_configure
+
 do_compile() {
 	set -ex
 	bjam ${BJAM_OPTS} --prefix=${prefix} \
-- 
1.7.3.4



