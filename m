Received: from [58.251.152.67] (helo=szxga04-in.huawei.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ramana.gollamudi@huawei.com>) id 1SIJvw-000627-HR
	for openembedded-core@lists.openembedded.org;
	Thu, 12 Apr 2012 15:19:32 +0200
Received: from huawei.com (szxga04-in [172.24.2.12])
	by szxga04-in.huawei.com (iPlanet Messaging Server 5.2 HotFix 2.14
	(built Aug
	8 2006)) with ESMTP id <0M2D00J7WB2UO5@szxga04-in.huawei.com> for
	openembedded-core@lists.openembedded.org;
	Thu, 12 Apr 2012 21:06:31 +0800 (CST)
Received: from szxrg02-dlp.huawei.com ([172.24.2.119])
	by szxga04-in.huawei.com (iPlanet Messaging Server 5.2 HotFix 2.14
	(built Aug
	8 2006)) with ESMTP id <0M2D009NHB2UDZ@szxga04-in.huawei.com> for
	openembedded-core@lists.openembedded.org;
	Thu, 12 Apr 2012 21:06:30 +0800 (CST)
Received: from szxeml201-edg.china.huawei.com ([172.24.2.119])
	by szxrg02-dlp.huawei.com (MOS 4.1.9-GA)	with ESMTP id AII06956; Thu,
	12 Apr 2012 21:06:30 +0800
Received: from SZXEML409-HUB.china.huawei.com (10.82.67.136)
	by szxeml201-edg.china.huawei.com (172.24.2.39) with Microsoft SMTP
	Server (TLS) id 14.1.323.3; Thu, 12 Apr 2012 21:06:23 +0800
Received: from SZXEML534-MBS.china.huawei.com ([169.254.6.253])
	by szxeml409-hub.china.huawei.com ([10.82.67.136])
	with mapi id 14.01.0323.003; Thu, 12 Apr 2012 21:06:20 +0800
Date: Thu, 12 Apr 2012 13:06:19 +0000
From: Venkata ramana gollamudi <ramana.gollamudi@huawei.com>
In-reply-to: <36ED13F3654AE54CA763E6821D93A57110438EED@szxeml534-mbs.china.huawei.com>
X-Originating-IP: [10.18.96.93]
To: "'openembedded-core@lists.openembedded.org'"
	<'openembedded-core@lists.openembedded.org'>
Message-id: <36ED13F3654AE54CA763E6821D93A57110438F4B@szxeml534-mbs.china.huawei.com>
MIME-version: 1.0
Accept-Language: en-US, zh-CN
Thread-topic: [Patch 1/1]:Package Boost: Reexecution of task is giving error.
Thread-index: Ac0YqODwb52LJn1hRwG/SyviOBcC3AABAd5g
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
X-CFilter-Loop: Reflected
References: <36ED13F3654AE54CA763E6821D93A57110438EED@szxeml534-mbs.china.huawei.com>
Cc: Sanil kumar <sanil.kumar@huawei.com>
Subject: [Patch 1/1]:Package Boost: Reexecution of task is giving error.
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
X-List-Received-Date: Thu, 12 Apr 2012 13:19:33 -0000
Content-type: text/plain; charset=us-ascii
Content-language: en-US
Content-transfer-encoding: 7BIT

Failure:
"error: duplicate initialization of gcc with the following parameters" during compilation.

Steps to reproduce: 
1> bitbake -c cleansstate boost 
2> bitbake boost 
3> bitbake -c boostconfig boost -f 
4> bitbake -c compile boost -f

Defect:
	https://bugzilla.yoctoproject.org/show_bug.cgi?id=2194

Fix details:
Boost package task do_boostconfigure is appending content to 
build/tmp/work/i586-poky-linux/boost-1.49.0-r2.0/boost_1_49_0/tools/build/v2/user-config.jam file 
without checking if the content is already present in that file. 
So check is added for the same.

Please find the below patch :
--------------------------------------------------------------

diff -Nupr prev/meta/recipes-support/boost/boost.inc new/meta/recipes-support/boost/boost.inc
--- prev/meta/recipes-support/boost/boost.inc	2012-04-12 11:12:49.916786261 +0530
+++ new/meta/recipes-support/boost/boost.inc	2012-04-12 11:30:32.535786134 +0530
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


