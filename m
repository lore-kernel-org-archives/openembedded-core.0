Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9981D79980
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Jan 2019 06:33:52 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x0O6XCso000678
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Jan 2019 22:33:43 -0800
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.408.0;
	Wed, 23 Jan 2019 22:33:34 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 23 Jan 2019 22:33:02 -0800
Message-ID: <155aefd083ca8db46abaf336851018dc0d2d8f81.1548311560.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <cover.1548311560.git.liezhi.yang@windriver.com>
References: <cover.1548311560.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] perl: Make install.perl depend on install.sym
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
X-List-Received-Date: Thu, 24 Jan 2019 06:33:52 -0000
Content-Type: text/plain

Fixed a race issue when do_install:
Generating wrapper script for
/path/to/8.1-r0/image/path/to/8.1-r0/recipe-sysroot-native/usr/bin/perl-native/perl5.28.1
mv: cannot stat
/path/to/8.1-r0/image/path/to/8.1-r0/recipe-sysroot-native/usr/bin/perl-native/perl5.28.1:
No such file or directory

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 ...e-Make-install.perl-depend-on-install.sym.patch | 32 ++++++++++++++++++++++
 meta/recipes-devtools/perl-sanity/perl_5.28.1.bb   |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta/recipes-devtools/perl-sanity/files/0001-Makefile-Make-install.perl-depend-on-install.sym.patch

diff --git a/meta/recipes-devtools/perl-sanity/files/0001-Makefile-Make-install.perl-depend-on-install.sym.patch b/meta/recipes-devtools/perl-sanity/files/0001-Makefile-Make-install.perl-depend-on-install.sym.patch
new file mode 100644
index 0000000..1267339
--- /dev/null
+++ b/meta/recipes-devtools/perl-sanity/files/0001-Makefile-Make-install.perl-depend-on-install.sym.patch
@@ -0,0 +1,32 @@
+From a0a2fcac3735ca90017976d2b87f550d051a969b Mon Sep 17 00:00:00 2001
+From: Robert Yang <liezhi.yang@windriver.com>
+Date: Tue, 22 Jan 2019 19:21:27 -0800
+Subject: [PATCH] Makefile: Make install.perl depend on install.sym
+
+Fix a race issue when install, there might be no
+$(installbin)/$(perlname)$(version) when install.sym runs after install.perl
+since install.sym removes it.
+
+Upstream-Status: Submitted [https://github.com/arsv/perl-cross/pull/73]
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+---
+ Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile b/Makefile
+index cd8d75f..1aa8ef2 100644
+--- a/Makefile
++++ b/Makefile
+@@ -406,7 +406,7 @@ META.yml: Porting/makemeta Porting/Maintainers.pl Porting/Maintainers.pm miniper
+ 
+ install: install.perl install.sym install.man
+ 
+-install.perl: installperl | miniperl$X
++install.perl: installperl install.sym | miniperl$X
+ 	./miniperl_top installperl --destdir=$(DESTDIR) $(INSTALLFLAGS) $(STRIPFLAGS)
+ 	-@test ! -s extras.lst || $(MAKE) extras.install
+ 
+-- 
+2.10.2
+
diff --git a/meta/recipes-devtools/perl-sanity/perl_5.28.1.bb b/meta/recipes-devtools/perl-sanity/perl_5.28.1.bb
index 176980e..a2ec264 100644
--- a/meta/recipes-devtools/perl-sanity/perl_5.28.1.bb
+++ b/meta/recipes-devtools/perl-sanity/perl_5.28.1.bb
@@ -23,6 +23,7 @@ SRC_URI = "https://www.cpan.org/src/5.0/perl-${PV}.tar.gz;name=perl \
            file://fix-race-failures-2.patch \
            file://0001-Also-build-dynaloader-separately-as-race-failures-ha.patch \
            file://0001-Make-sure-install.perl-runs-before-install.man.patch \
+           file://0001-Makefile-Make-install.perl-depend-on-install.sym.patch \
            "
 
 SRC_URI[perl.md5sum] = "838198c43d4f39d7af797e2f59c2bee5"
-- 
2.10.2


