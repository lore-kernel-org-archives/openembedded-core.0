Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 29A9975AF8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jun 2015 06:26:35 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t5O6QaHP022597
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jun 2015 23:26:36 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 23 Jun 2015 23:26:36 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 23 Jun 2015 23:26:30 -0700
Message-ID: <765c82fe0a4ad8fe8e89ce5d786f2729269d92cf.1435126503.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1435126503.git.liezhi.yang@windriver.com>
References: <cover.1435126503.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 5/8] perl: fix for ODBM_File.so
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
X-List-Received-Date: Wed, 24 Jun 2015 06:26:35 -0000
Content-Type: text/plain

Fixed for test case ../ext/ODBM_File/t/odbm.t:
ok 1 - use ODBM_File;
ok 2 - use Fcntl;
./perl: symbol lookup error: /usr/lib/perl/5.22.0/auto/ODBM_File/ODBM_File.so: undefined symbol: dbminit

The checking "if -e $_.'/libgdbm_compat.so'" doesn't work when cross
build, so always link libgdbm_compat, since perl depends on gdbm and we
always have libgdbm_compat.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 ...M_File-hints-linux.pl-link-libgdbm_compat.patch |   35 ++++++++++++++++++++
 meta/recipes-devtools/perl/perl_5.22.0.bb          |    1 +
 2 files changed, 36 insertions(+)
 create mode 100644 meta/recipes-devtools/perl/perl/ext-ODBM_File-hints-linux.pl-link-libgdbm_compat.patch

diff --git a/meta/recipes-devtools/perl/perl/ext-ODBM_File-hints-linux.pl-link-libgdbm_compat.patch b/meta/recipes-devtools/perl/perl/ext-ODBM_File-hints-linux.pl-link-libgdbm_compat.patch
new file mode 100644
index 0000000..994ef70
--- /dev/null
+++ b/meta/recipes-devtools/perl/perl/ext-ODBM_File-hints-linux.pl-link-libgdbm_compat.patch
@@ -0,0 +1,35 @@
+From ba4ed0b5b7baad5353c1e65b655f41d45e01c990 Mon Sep 17 00:00:00 2001
+From: Robert Yang <liezhi.yang@windriver.com>
+Date: Mon, 22 Jun 2015 20:00:11 -0700
+Subject: [PATCH] ext/ODBM_File/hints/linux.pl: link libgdbm_compat
+
+Fixed for test case ../ext/ODBM_File/t/odbm.t:
+ok 1 - use ODBM_File;
+ok 2 - use Fcntl;
+./perl: symbol lookup error: /usr/lib/perl/5.22.0/auto/ODBM_File/ODBM_File.so: undefined symbol: dbminit
+
+The checking "if -e $_.'/libgdbm_compat.so'" doesn't work when cross
+build, so always link libgdbm_compat, since perl depends on gdbm and we
+always have libgdbm_compat.
+
+Upstream-Status:Inappropriate [embedded specific]
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+---
+ ext/ODBM_File/hints/linux.pl |    6 ------
+ 1 file changed, 6 deletions(-)
+
+diff --git a/ext/ODBM_File/hints/linux.pl b/ext/ODBM_File/hints/linux.pl
+index 204bba0..9271b45 100644
+--- a/ext/ODBM_File/hints/linux.pl
++++ b/ext/ODBM_File/hints/linux.pl
+@@ -1,8 +1,2 @@
+ # uses GDBM dbm compatibility feature - at least on SuSE 8.0
+-$self->{LIBS} = ['-lgdbm'];
+-
+-# Debian/Ubuntu have libgdbm_compat.so but not this file,
+-# so linking may fail
+-foreach (split / /, $Config{libpth}) {
+-    $self->{LIBS}->[0] .= ' -lgdbm_compat' if -e $_.'/libgdbm_compat.so';
+-}
++$self->{LIBS} = ['-lgdbm -lgdbm_compat'];
diff --git a/meta/recipes-devtools/perl/perl_5.22.0.bb b/meta/recipes-devtools/perl/perl_5.22.0.bb
index da3dba6..7c70414 100644
--- a/meta/recipes-devtools/perl/perl_5.22.0.bb
+++ b/meta/recipes-devtools/perl/perl_5.22.0.bb
@@ -59,6 +59,7 @@ SRC_URI += " \
         file://config.sh-64-be \
         file://make_ext.pl-fix-regenerate-makefile-failed-while-cc-.patch \
         file://t-run-switches.t-perl5-perl.patch \
+        file://ext-ODBM_File-hints-linux.pl-link-libgdbm_compat.patch \
 "
 
 # Fix test case issues
-- 
1.7.9.5


