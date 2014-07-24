Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id B1767609B1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Jul 2014 01:57:35 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s6O1vagh020039
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 23 Jul 2014 18:57:37 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Wed, 23 Jul 2014 18:57:36 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 24 Jul 2014 09:57:17 +0800
Message-ID: <df1ea31c10268d95242b76783a371e92abe01a48.1406166726.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1406166726.git.hongxu.jia@windriver.com>
References: <cover.1406166726.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: saul.wold@intel.com
Subject: [PATCH 1/1] perl: fix rebuid failed while ${CC} changed
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
X-List-Received-Date: Thu, 24 Jul 2014 01:57:38 -0000
Content-Type: text/plain

Reproduce steps:

1) bitbake perl
2) vim local.conf to tweak CC, just add redundant option.
...
CC_append = " ${HOST_CC_ARCH}"
...

3) bitbake perl
...
./miniperl -Ilib make_ext.pl lib/auto/Time/HiRes/HiRes.so MAKE=make LIBPERL_A=libperl.so LINKTYPE=dynamic
    Making Time::HiRes (all)my $filename=
Deleting non-Cross makefile
Running Makefile.PL in cpan/Time-HiRes
Makefile.PL: The "xdefine" exists, skipping the configure step.
("tmp/sysroots/x86_64-linux/usr/bin/perl-native/perl5.20.0.real Makefile.PL --configure" to force the configure step)
Warning: No Makefile!
make[2]: Entering directory `tmp/work/armv5te-poky-linux-gnueabi/perl/5.20.0-r1/perl-5.20.0/cpan/Time-HiRes'
make[2]: *** No rule to make target `config'.  Stop.
...

While ${CC} changed, the existance of 'xdefine' caused makefile
regeneration failed.

[YOCTO #6569]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 ...-fix-regenerate-makefile-failed-while-cc-.patch | 30 ++++++++++++++++++++++
 meta/recipes-devtools/perl/perl_5.20.0.bb          |  1 +
 2 files changed, 31 insertions(+)
 create mode 100644 meta/recipes-devtools/perl/perl-5.20.0/make_ext.pl-fix-regenerate-makefile-failed-while-cc-.patch

diff --git a/meta/recipes-devtools/perl/perl-5.20.0/make_ext.pl-fix-regenerate-makefile-failed-while-cc-.patch b/meta/recipes-devtools/perl/perl-5.20.0/make_ext.pl-fix-regenerate-makefile-failed-while-cc-.patch
new file mode 100644
index 0000000..de6f652
--- /dev/null
+++ b/meta/recipes-devtools/perl/perl-5.20.0/make_ext.pl-fix-regenerate-makefile-failed-while-cc-.patch
@@ -0,0 +1,30 @@
+make_ext.pl: fix regenerate makefile failed while $cc changed
+
+While $cc changed, the existance of 'xdefine' caused makefile
+regeneration failed.
+
+Upstream-Status: Pending
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ make_ext.pl | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/make_ext.pl b/make_ext.pl
+index b433762..9fc1a36 100644
+--- a/make_ext.pl
++++ b/make_ext.pl
+@@ -335,6 +335,10 @@ sub build_extension {
+                 print "Deleting non-Cross makefile\n";
+                 close $mfh or die "close $makefile: $!";
+                 _unlink($makefile);
++                if(-e 'xdefine') {
++                    print "Deleting xdefine for regenerate makefile\n";
++                    _unlink('xdefine');
++                }
+             }
+         }
+     }
+-- 
+1.8.1.2
+
diff --git a/meta/recipes-devtools/perl/perl_5.20.0.bb b/meta/recipes-devtools/perl/perl_5.20.0.bb
index 4bd4525..e984c90 100644
--- a/meta/recipes-devtools/perl/perl_5.20.0.bb
+++ b/meta/recipes-devtools/perl/perl_5.20.0.bb
@@ -74,6 +74,7 @@ SRC_URI += " \
         file://config.sh-64-be \
         file://perl-5.14.3-fix-CVE-2010-4777.patch \
         file://0001-Makefile.SH-fix-do_install-failed.patch \
+        file://make_ext.pl-fix-regenerate-makefile-failed-while-cc-.patch \
 "
 
 # Fix test case issues
-- 
1.8.1.2


