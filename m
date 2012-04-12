Received: from szxga03-in.huawei.com ([58.251.152.66])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ramana.gollamudi@huawei.com>) id 1SIKC1-0006Gq-3K
	for openembedded-core@lists.openembedded.org;
	Thu, 12 Apr 2012 15:36:09 +0200
Received: from huawei.com (szxga03-in [172.24.2.9])
	by szxga03-in.huawei.com (iPlanet Messaging Server 5.2 HotFix 2.14
	(built Aug
	8 2006)) with ESMTP id <0M2D007A5C0KQE@szxga03-in.huawei.com> for
	openembedded-core@lists.openembedded.org;
	Thu, 12 Apr 2012 21:26:45 +0800 (CST)
Received: from szxrg02-dlp.huawei.com ([172.24.2.119])
	by szxga03-in.huawei.com (iPlanet Messaging Server 5.2 HotFix 2.14
	(built Aug
	8 2006)) with ESMTP id <0M2D00ADWC0K4C@szxga03-in.huawei.com> for
	openembedded-core@lists.openembedded.org;
	Thu, 12 Apr 2012 21:26:44 +0800 (CST)
Received: from szxeml201-edg.china.huawei.com ([172.24.2.119])
	by szxrg02-dlp.huawei.com (MOS 4.1.9-GA)	with ESMTP id AII07706; Thu,
	12 Apr 2012 21:26:44 +0800
Received: from SZXEML413-HUB.china.huawei.com (10.82.67.152)
	by szxeml201-edg.china.huawei.com (172.24.2.39) with Microsoft SMTP
	Server (TLS) id 14.1.323.3; Thu, 12 Apr 2012 21:26:38 +0800
Received: from SZXEML534-MBS.china.huawei.com ([169.254.6.253])
	by szxeml413-hub.china.huawei.com ([10.82.67.152])
	with mapi id 14.01.0323.003; Thu, 12 Apr 2012 21:26:35 +0800
Date: Thu, 12 Apr 2012 13:26:34 +0000
From: Venkata ramana gollamudi <ramana.gollamudi@huawei.com>
X-Originating-IP: [10.18.96.93]
To: "'openembedded-core@lists.openembedded.org'"
	<'openembedded-core@lists.openembedded.org'>
Message-id: <36ED13F3654AE54CA763E6821D93A57110438F36@szxeml534-mbs.china.huawei.com>
MIME-version: 1.0
Accept-Language: en-US, zh-CN
Thread-topic: [Patch 1/1]:Package perl: Re-execution of  do_patch task is
	giving error.
Thread-index: Ac0Yr+DVvI6DFRdTQSyPvVkf4bAnOg==
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
X-CFilter-Loop: Reflected
Cc: Sanil kumar <sanil.kumar@huawei.com>
Subject: [Patch 1/1]:Package perl: Re-execution of do_patch task is giving error.
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
X-List-Received-Date: Thu, 12 Apr 2012 13:36:09 -0000
Content-type: text/plain; charset=us-ascii
Content-language: en-US
Content-transfer-encoding: 7BIT

Failure:
Perl package : Re-execution of do_patch task is giving error.

Error Message:
NOTE: package perl-5.14.2-r4: task do_patch: Started 
ERROR: [Errno 22] Invalid argument: '/home/jxu49/osel/sstate-test/build/tmp/work/i586-poky-linux/perl-5.14.2-r4/perl-5.14.2/patches/h2ph-multiarch.diff' 
ERROR: Function failed: patch_do_patch 
ERROR: Logfile of failure stored in: /home/jxu49/osel/sstate-test/build/tmp/work/i586-poky-linux/perl-5.14.2-r4/temp/log.do_patch.11173 
NOTE: package perl-5.14.2-r4: task do_patch: Failed 
ERROR: Task 1 (/home/jxu49/osel/sstate-test/meta/recipes-devtools/perl/perl_5.14.2.bb, do_patch) failed with exit code '1' 
NOTE: Tasks Summary: Attempted 10 tasks of which 9 didn't need to be rerun and 1 failed.

Steps to reproduce: 
1> bitbake -c cleansstate perl
2> bitbake perl
3> bitbake -c patch perl -f

Defect:
	As part of defect https://bugzilla.yoctoproject.org/show_bug.cgi?id=2194

Fix details:
Perl Package do_configure is changing "/perl-5.14.2/patches/h2ph-multiarch.diff" from link to 
normal file in the process of correcting the paths. This path correction is not required for links as the original file will be any way modified separately.
So when patch tried to be applied again, giving error.
Fix done to ignore the path correction during do_configure, if the file is a link.

Please find the below patch :
--------------------------------------------------------------
diff -Nupr prev/meta/recipes-devtools/perl/perl_5.14.2.bb new/meta/recipes-devtools/perl/perl_5.14.2.bb
--- prev/meta/recipes-devtools/perl/perl_5.14.2.bb	2012-04-12 11:04:39.921786320 +0530
+++ new/meta/recipes-devtools/perl/perl_5.14.2.bb	2012-04-12 11:38:25.634786078 +0530
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


