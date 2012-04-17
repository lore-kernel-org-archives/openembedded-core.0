Received: from szxga03-in.huawei.com ([58.251.152.66])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ramana.gollamudi@huawei.com>) id 1SK4fo-00061R-EZ
	for openembedded-core@lists.openembedded.org;
	Tue, 17 Apr 2012 11:26:08 +0200
Received: from huawei.com (szxga03-in [172.24.2.9])
	by szxga03-in.huawei.com (iPlanet Messaging Server 5.2 HotFix 2.14
	(built Aug
	8 2006)) with ESMTP id <0M2M004XU9864A@szxga03-in.huawei.com> for
	openembedded-core@lists.openembedded.org;
	Tue, 17 Apr 2012 17:04:54 +0800 (CST)
Received: from szxrg02-dlp.huawei.com ([172.24.2.119])
	by szxga03-in.huawei.com (iPlanet Messaging Server 5.2 HotFix 2.14
	(built Aug
	8 2006)) with ESMTP id <0M2M00L97986NX@szxga03-in.huawei.com> for
	openembedded-core@lists.openembedded.org;
	Tue, 17 Apr 2012 17:04:54 +0800 (CST)
Received: from szxeml211-edg.china.huawei.com ([172.24.2.119])
	by szxrg02-dlp.huawei.com (MOS 4.1.9-GA)	with ESMTP id AIK31099; Tue,
	17 Apr 2012 17:04:23 +0800
Received: from SZXEML406-HUB.china.huawei.com (10.82.67.93)
	by szxeml211-edg.china.huawei.com (172.24.2.182) with Microsoft SMTP
	Server (TLS) id 14.1.323.3; Tue, 17 Apr 2012 17:03:45 +0800
Received: from SZXEML534-MBX.china.huawei.com ([169.254.2.43])
	by szxeml406-hub.china.huawei.com ([10.82.67.93]) with mapi id
	14.01.0323.003; Tue, 17 Apr 2012 17:04:16 +0800
Date: Tue, 17 Apr 2012 09:04:15 +0000
From: Venkata ramana gollamudi <ramana.gollamudi@huawei.com>
X-Originating-IP: [10.18.96.93]
To: "'openembedded-core@lists.openembedded.org'"
	<openembedded-core@lists.openembedded.org>
Message-id: <36ED13F3654AE54CA763E6821D93A5711043E81A@szxeml534-mbx.china.huawei.com>
MIME-version: 1.0
Accept-Language: en-US, zh-CN
Thread-topic: [PATCH] perl: fix re-execution of compile task
Thread-index: Ac0ceQ7RX7eF6AbtRHS8Dzl5kU3VLQ==
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
X-CFilter-Loop: Reflected
Cc: Sanil kumar <sanil.kumar@huawei.com>
Subject: [PATCH] perl: fix re-execution of compile task
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
X-List-Received-Date: Tue, 17 Apr 2012 09:26:09 -0000
Content-type: text/plain; charset=us-ascii
Content-language: en-US
Content-transfer-encoding: 7BIT

After building perl package, re-execution of compile task recursively
 substitutes the path, making it an invalid path.

Fixed to prevent recursive substitution.

Similar case as [Yocto #2194]

Signed-off-by: Venkata Ramana Gollamudi <ramana.gollamudi@huawei.com>
---
 meta/recipes-devtools/perl/perl_5.14.2.bb |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/perl/perl_5.14.2.bb b/meta/recipes-devtools/perl/perl_5.14.2.bb
index ecb2262..809fc72 100644
--- a/meta/recipes-devtools/perl/perl_5.14.2.bb
+++ b/meta/recipes-devtools/perl/perl_5.14.2.bb
@@ -174,8 +174,9 @@ do_configure() {
 }
 
 do_compile() {
-        sed -i -e 's|/usr/include|${STAGING_INCDIR}|g' ext/Errno/Errno_pm.PL
-        sed -i -e 's|/usr/include|${STAGING_INCDIR}|g' cpan/Compress-Raw-Zlib/config.in
+        # Fix to avoid recursive substitution of path
+        sed -i -e "s|\([ \"\']\+\)/usr/include|\1${STAGING_INCDIR}|g" ext/Errno/Errno_pm.PL
+        sed -i -e "s|\([ \"\']\+\)/usr/include|\1${STAGING_INCDIR}|g" cpan/Compress-Raw-Zlib/config.in
         sed -i -e 's|/usr/lib|""|g' cpan/Compress-Raw-Zlib/config.in
         sed -i -e 's|SYSROOTLIB|${STAGING_LIBDIR}|g' cpan/ExtUtils-MakeMaker/lib/ExtUtils/Liblist/Kid.pm
 
-- 
1.7.7



