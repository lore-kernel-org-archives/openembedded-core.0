Return-Path: <mcrowe@brightsign.biz>
Received: from elite.brightsigndigital.co.uk
	(cpc6-cmbg17-2-0-cust487.5-4.cable.virginm.net [86.30.57.232])
	by mail.openembedded.org (Postfix) with ESMTP id 8BD8D6F19B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Feb 2014 10:41:00 +0000 (UTC)
Received: from chuckie.brightsign ([172.30.1.25])
	by elite.brightsigndigital.co.uk with esmtp (Exim 4.80)
	(envelope-from <mcrowe@brightsign.biz>)
	id 1WG4aI-0002PQ-TU; Wed, 19 Feb 2014 10:40:59 +0000
Received: from mac by chuckie.brightsign with local (Exim 4.80)
	(envelope-from <mcrowe@brightsign.biz>)
	id 1WG4aI-0001RX-SK; Wed, 19 Feb 2014 10:40:58 +0000
From: Mike Crowe <mac@mcrowe.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Feb 2014 10:40:34 +0000
Message-Id: <1392806434-5503-1-git-send-email-mac@mcrowe.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <20140218212442.GA22168@mcrowe.com>
References: <20140218212442.GA22168@mcrowe.com>
Cc: Mike Crowe <mac@mcrowe.com>
Subject: [PATCH] boost: Pass CFLAGS, CXXFLAGS and LDFLAGS correctly into boost.build
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 19 Feb 2014 10:41:01 -0000

The compileflags and linkflags do_boostconfig puts into user-config.jam are
having no effect. According to
http://www.boost.org/boost-build2/doc/html/bbv2/reference/tools.html the
correct syntax would be <compileflags>"the flags" <linkflags>"the flags".

Since the flags specified were having no effect they can't be necessary and
can be safely removed. We should be passing ${CFLAGS}, ${CXXFLAGS} and
${LDFLAGS} instead so that users of the recipe can pass arbitrary flags as
they choose.

Signed-off-by: Mike Crowe <mac@mcrowe.com>
---
 meta/recipes-support/boost/boost.inc |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/boost/boost.inc b/meta/recipes-support/boost/boost.inc
index c7642be..356ca22 100644
--- a/meta/recipes-support/boost/boost.inc
+++ b/meta/recipes-support/boost/boost.inc
@@ -134,7 +134,7 @@ do_boostconfig() {
 	# D2194:Fixing the failure of "error: duplicate initialization of gcc with the following parameters" during compilation.
 	if ! grep -qe "^using gcc : 4.3.1" ${S}/tools/build/v2/user-config.jam 
 	then
-		echo 'using gcc : 4.3.1 : ${CXX} : compileflags -DBOOST_SP_USE_PTHREADS -I${includedir} linkflags -L${libdir} ;' >> ${S}/tools/build/v2/user-config.jam
+		echo 'using gcc : 4.3.1 : ${CXX} : <cflags>"${CFLAGS}" <cxxflags>"${CXXFLAGS}" <linkflags>"${LDFLAGS}" ;' >> ${S}/tools/build/v2/user-config.jam
 	fi	
 
 	echo "using python : ${PYTHON_BASEVERSION} : : ${STAGING_INCDIR}/python${PYTHON_BASEVERSION} ;" >> ${S}/tools/build/v2/user-config.jam
-- 
1.7.10.4


