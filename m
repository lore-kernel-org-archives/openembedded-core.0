Return-Path: <mac@mcrowe.com>
Received: from smtpout.karoo.kcom.com (smtpout.karoo.kcom.com [212.50.160.34])
	by mail.openembedded.org (Postfix) with ESMTP id 720786E7D7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Mar 2014 10:01:54 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="4.97,646,1389744000"; d="scan'208";a="59863998"
Received: from deneb.mcrowe.com ([82.152.148.4])
	by smtpout.karoo.kcom.com with ESMTP; 13 Mar 2014 10:01:54 +0000
Received: from mac by deneb.mcrowe.com with local (Exim 4.80)
	(envelope-from <mac@mcrowe.com>)
	id 1WO2SY-0005kR-FQ; Thu, 13 Mar 2014 10:01:54 +0000
Date: Thu, 13 Mar 2014 10:01:54 +0000
From: Mike Crowe <mac@mcrowe.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20140313100153.GA21726@mcrowe.com>
MIME-Version: 1.0
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: [PATCH][resend] boost: Pass CFLAGS, CXXFLAGS and LDFLAGS correctly into boost.build
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
X-List-Received-Date: Thu, 13 Mar 2014 10:01:55 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

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

