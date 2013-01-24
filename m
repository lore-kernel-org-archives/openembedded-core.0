Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1TyIrS-0001MD-JH
	for openembedded-core@lists.openembedded.org;
	Thu, 24 Jan 2013 10:12:42 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r0O8v8tJ029059
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 24 Jan 2013 00:57:08 -0800 (PST)
Received: from localhost.localdomain (128.224.162.205) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.318.4; Thu, 24 Jan 2013 00:57:08 -0800
From: Kang Kai <kai.kang@windriver.com>
To: <ross.burton@intel.com>
Date: Thu, 24 Jan 2013 16:58:15 +0800
Message-ID: <2edf2d7df4c5b61bd99ccb58fdc1e2ae7bfcdf87.1359016228.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1359016228.git.kai.kang@windriver.com>
References: <cover.1359016228.git.kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.205]
Cc: Zhenfeng.Zhao@windriver.com, openembedded-core@lists.openembedded.org
Subject: [PATCH 1/1] perl: fix security issue
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 24 Jan 2013 09:12:43 -0000
Content-Type: text/plain

Add perl-fix-CVE-2012-5195.patch to fix perl memory exhaustion
denial-of-service attack issue.

And patch is from perl 5.14.3 branch:
http://perl5.git.perl.org/perl.git/commit/b675304e3fdbcce3ef853b06b6ebe870d99faa7e

[Yocto 3701]

Signed-off-by: Kang Kai <kai.kang@windriver.com>
---
 .../perl/perl-5.14.2/perl-fix-CVE-2012-5195.patch  |   41 ++++++++++++++++++++
 meta/recipes-devtools/perl/perl_5.14.2.bb          |    3 +-
 2 files changed, 43 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-devtools/perl/perl-5.14.2/perl-fix-CVE-2012-5195.patch

diff --git a/meta/recipes-devtools/perl/perl-5.14.2/perl-fix-CVE-2012-5195.patch b/meta/recipes-devtools/perl/perl-5.14.2/perl-fix-CVE-2012-5195.patch
new file mode 100644
index 0000000..da96f9c
--- /dev/null
+++ b/meta/recipes-devtools/perl/perl-5.14.2/perl-fix-CVE-2012-5195.patch
@@ -0,0 +1,41 @@
+Upstream-Status: Backport
+
+This patch is from perl mainline:
+http://perl5.git.perl.org/perl.git/commit/b675304e3fdbcce3ef853b06b6ebe870d99faa7e
+
+Signed-off-by: Kang Kai <kai.kang@windriver.com>
+
+---
+From b675304e3fdbcce3ef853b06b6ebe870d99faa7e Mon Sep 17 00:00:00 2001
+From: Andy Dougherty <doughera@lafayette.edu>
+Date: Thu, 27 Sep 2012 09:52:18 -0400
+Subject: [PATCH] avoid calling memset with a negative count
+
+Poorly written perl code that allows an attacker to specify the count to
+perl's 'x' string repeat operator can already cause a memory exhaustion
+denial-of-service attack. A flaw in versions of perl before 5.15.5 can
+escalate that into a heap buffer overrun; coupled with versions of glibc
+before 2.16, it possibly allows the execution of arbitrary code.
+
+The flaw addressed to this commit has been assigned identifier
+CVE-2012-5195.
+---
+ util.c |    3 +++
+ 1 files changed, 3 insertions(+), 0 deletions(-)
+
+diff --git a/util.c b/util.c
+index 0ea39c6..230211e 100644
+--- a/util.c
++++ b/util.c
+@@ -3319,6 +3319,9 @@ Perl_repeatcpy(register char *to, register const char *from, I32 len, register I
+ {
+     PERL_ARGS_ASSERT_REPEATCPY;
+ 
++    if (count < 0)
++	Perl_croak_nocontext("%s",PL_memory_wrap);
++
+     if (len == 1)
+ 	memset(to, *from, count);
+     else if (count) {
+-- 
+1.7.4.1
diff --git a/meta/recipes-devtools/perl/perl_5.14.2.bb b/meta/recipes-devtools/perl/perl_5.14.2.bb
index d9206d8..d3f6ffd 100644
--- a/meta/recipes-devtools/perl/perl_5.14.2.bb
+++ b/meta/recipes-devtools/perl/perl_5.14.2.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://Copying;md5=2b4c6ffbcfcbdee469f02565f253d81a \
 # We need gnugrep (for -I)
 DEPENDS = "virtual/db grep-native"
 DEPENDS += "gdbm zlib"
-PR = "r11"
+PR = "r12"
 
 # 5.10.1 has Module::Build built-in
 PROVIDES += "libmodule-build-perl"
@@ -67,6 +67,7 @@ SRC_URI = "http://www.cpan.org/src/5.0/perl-${PV}.tar.gz \
 	file://fix_bad_rpath.patch \
 	file://perl-build-in-t-dir.patch \
 	file://perl-archlib-exp.patch \
+	file://perl-fix-CVE-2012-5195.patch \
 	\
         file://config.sh \
         file://config.sh-32 \
-- 
1.7.5.4



