Received: from szxga01-in.huawei.com ([58.251.152.64])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ramana.gollamudi@huawei.com>) id 1SIfDZ-0007xk-9V
	for openembedded-core@lists.openembedded.org;
	Fri, 13 Apr 2012 14:03:09 +0200
Received: from huawei.com (szxga05-in [172.24.2.49])
	by szxga05-in.huawei.com (iPlanet Messaging Server 5.2 HotFix 2.14
	(built Aug
	8 2006)) with ESMTP id <0M2F003IU1VM32@szxga05-in.huawei.com> for
	openembedded-core@lists.openembedded.org;
	Fri, 13 Apr 2012 19:42:59 +0800 (CST)
Received: from szxrg02-dlp.huawei.com ([172.24.2.119])
	by szxga05-in.huawei.com (iPlanet Messaging Server 5.2 HotFix 2.14
	(built Aug
	8 2006)) with ESMTP id <0M2F00JC71VMEH@szxga05-in.huawei.com> for
	openembedded-core@lists.openembedded.org;
	Fri, 13 Apr 2012 19:42:58 +0800 (CST)
Received: from szxeml202-edg.china.huawei.com ([172.24.2.119])
	by szxrg02-dlp.huawei.com (MOS 4.1.9-GA)	with ESMTP id AII57644; Fri,
	13 Apr 2012 19:42:57 +0800
Received: from SZXEML418-HUB.china.huawei.com (10.82.67.157)
	by szxeml202-edg.china.huawei.com (172.24.2.42) with Microsoft SMTP
	Server (TLS) id 14.1.323.3; Fri, 13 Apr 2012 19:42:44 +0800
Received: from SZXEML534-MBS.china.huawei.com ([169.254.6.253])
	by szxeml418-hub.china.huawei.com ([10.82.67.157])
	with mapi id 14.01.0323.003; Fri, 13 Apr 2012 19:42:48 +0800
Date: Fri, 13 Apr 2012 11:42:46 +0000
From: Venkata ramana gollamudi <ramana.gollamudi@huawei.com>
X-Originating-IP: [10.18.96.93]
To: "'openembedded-core@lists.openembedded.org'"
	<openembedded-core@lists.openembedded.org>
Message-id: <36ED13F3654AE54CA763E6821D93A5711043A0E3@szxeml534-mbs.china.huawei.com>
MIME-version: 1.0
Accept-Language: en-US, zh-CN
Thread-topic: [PATCH] boost: fix re-execution of task
Thread-index: Ac0Zaor5QOKnDXYvSmS8BLB0yRJuoA==
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
X-CFilter-Loop: Reflected
Cc: Sanil kumar <sanil.kumar@huawei.com>
Subject: [PATCH] boost: fix re-execution of task
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
X-List-Received-Date: Fri, 13 Apr 2012 12:03:09 -0000
Content-type: text/plain; charset=us-ascii
Content-language: en-US
Content-transfer-encoding: 7BIT

After building boost package, re-execution of boostconfig task followed by
re-execution of compile task is giving following error
"error: duplicate initialization of gcc with the following parameters" during compilation
It is because multiple entries of gcc are being added during boostconfig re-execution
there by failing the compilation.

The patch fixes adding multiple "Using gcc" entries into /tools/build/v2/user-config.jam

[Yocto #2194]

Signed-off-by: Venkata Ramana Gollamudi <ramana.gollamudi@huawei.com>
---
 meta/recipes-support/boost/boost.inc |    6 +++++-
 1 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-support/boost/boost.inc b/meta/recipes-support/boost/boost.inc
index d70a7e2..c9306df 100644
--- a/meta/recipes-support/boost/boost.inc
+++ b/meta/recipes-support/boost/boost.inc
@@ -135,7 +135,11 @@ BJAM_OPTS    = '${BJAM_TOOLS} \
 do_boostconfig() {
 	cp -f boost/config/platform/linux.hpp boost/config/platform/linux-gnueabi.hpp
 
-	echo 'using gcc : 4.3.1 : ${CXX} : compileflags -DBOOST_SP_USE_PTHREADS -I${includedir} linkflags -L${libdir} ;' >> ${S}/tools/build/v2/user-config.jam
+	# D2194:Fixing the failure of "error: duplicate initialization of gcc with the following parameters" during compilation.
+	if ! grep -qe "^using gcc : 4.3.1" ${S}/tools/build/v2/user-config.jam 
+	then
+		echo 'using gcc : 4.3.1 : ${CXX} : compileflags -DBOOST_SP_USE_PTHREADS -I${includedir} linkflags -L${libdir} ;' >> ${S}/tools/build/v2/user-config.jam
+	fi	
 }
 
 addtask do_boostconfig after do_patch before do_configure
-- 
1.7.7



