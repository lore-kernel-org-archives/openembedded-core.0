Received: from [58.251.152.67] (helo=szxga04-in.huawei.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ramana.gollamudi@huawei.com>) id 1SIf8j-0007X0-2C
	for openembedded-core@lists.openembedded.org;
	Fri, 13 Apr 2012 13:58:09 +0200
Received: from huawei.com (szxga04-in [172.24.2.12])
	by szxga04-in.huawei.com (iPlanet Messaging Server 5.2 HotFix 2.14
	(built Aug
	8 2006)) with ESMTP id <0M2F0098M22VQ1@szxga04-in.huawei.com> for
	openembedded-core@lists.openembedded.org;
	Fri, 13 Apr 2012 19:47:19 +0800 (CST)
Received: from szxrg02-dlp.huawei.com ([172.24.2.119])
	by szxga04-in.huawei.com (iPlanet Messaging Server 5.2 HotFix 2.14
	(built Aug
	8 2006)) with ESMTP id <0M2F00D8022QT0@szxga04-in.huawei.com> for
	openembedded-core@lists.openembedded.org;
	Fri, 13 Apr 2012 19:47:19 +0800 (CST)
Received: from szxeml213-edg.china.huawei.com ([172.24.2.119])
	by szxrg02-dlp.huawei.com (MOS 4.1.9-GA)	with ESMTP id AII57796; Fri,
	13 Apr 2012 19:47:19 +0800
Received: from SZXEML414-HUB.china.huawei.com (10.82.67.153)
	by szxeml213-edg.china.huawei.com (172.24.2.30) with Microsoft SMTP
	Server (TLS) id 14.1.323.3; Fri, 13 Apr 2012 19:46:20 +0800
Received: from SZXEML534-MBS.china.huawei.com ([169.254.6.253])
	by SZXEML414-HUB.china.huawei.com ([10.82.67.153])
	with mapi id 14.01.0323.003; Fri, 13 Apr 2012 19:46:29 +0800
Date: Fri, 13 Apr 2012 11:46:28 +0000
From: Venkata ramana gollamudi <ramana.gollamudi@huawei.com>
X-Originating-IP: [10.18.96.93]
To: "'openembedded-core@lists.openembedded.org'"
	<openembedded-core@lists.openembedded.org>
Message-id: <36ED13F3654AE54CA763E6821D93A5711043A0F7@szxeml534-mbs.china.huawei.com>
MIME-version: 1.0
Accept-Language: en-US, zh-CN
Thread-topic: [PATCH] perl: fix re-execution of task
Thread-index: Ac0Zaw+w6rTszlhnQ3WAcyid18f7+A==
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
X-CFilter-Loop: Reflected
Cc: Sanil kumar <sanil.kumar@huawei.com>
Subject: [PATCH] perl: fix re-execution of task
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
X-List-Received-Date: Fri, 13 Apr 2012 11:58:09 -0000
Content-type: text/plain; charset=us-ascii
Content-language: en-US
Content-transfer-encoding: 7BIT

perl package do_configure is changing "/perl-5.14.2/patches/h2ph-multiarch.diff"
 from link to normal file in the process of correcting the paths.
So when patch task is re-executed after complete package building, giving error.

This path correction is not required for links as the link target file
 will be also be modified individually.
Fix done to ignore the path correction during do_configure,
 if file is a link.

[Yocto #2194]

Signed-off-by: Venkata Ramana Gollamudi <ramana.gollamudi@huawei.com>
---
 meta/recipes-devtools/perl/perl_5.14.2.bb |    8 ++++++--
 1 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/perl/perl_5.14.2.bb b/meta/recipes-devtools/perl/perl_5.14.2.bb
index 92ca9b8..414aa22 100644
--- a/meta/recipes-devtools/perl/perl_5.14.2.bb
+++ b/meta/recipes-devtools/perl/perl_5.14.2.bb
@@ -164,8 +164,12 @@ do_configure() {
 	esac
         # These are strewn all over the source tree
         for foo in `grep -I -m1 \/usr\/include\/.*\\.h ${WORKDIR}/* -r | cut -f 1 -d ":"` ; do
-            echo Fixing: $foo
-            sed -e "s%/usr/include/%${STAGING_INCDIR}/%g" -i $foo
+		# D2194:Fixing the issue "patch file link is replaced with modified file"
+		# Ignore if file is a link, as actual file will also get caught during grep 
+		if [ ! -h $foo ]; then
+			echo Fixing: $foo
+			sed -e "s%/usr/include/%${STAGING_INCDIR}/%g" -i $foo
+	    	fi
         done
 
         rm -f config
-- 
1.7.7



