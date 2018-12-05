Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id B9C776D409
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Dec 2018 08:34:03 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id wB58Y5tW017756
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 5 Dec 2018 00:34:05 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.163.141) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.408.0; Wed, 5 Dec 2018 00:34:04 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 5 Dec 2018 16:40:46 +0800
Message-ID: <86b5c2cc2559cac15d914d05d15e8f58e188a547.1543996242.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1543996242.git.Qi.Chen@windriver.com>
References: <cover.1543996242.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 4/4] at: upgrade to 3.1.23
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
X-List-Received-Date: Wed, 05 Dec 2018 08:34:03 -0000
Content-Type: text/plain

The following patches are rebased.

  fix_parallel_build_error.patch
  pam.conf.patch

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../at/at/fix_parallel_build_error.patch           | 15 +++++---
 meta/recipes-extended/at/at/pam.conf.patch         | 40 +++++++++++++---------
 .../at/{at_3.1.20.bb => at_3.1.23.bb}              |  6 ++--
 3 files changed, 37 insertions(+), 24 deletions(-)
 rename meta/recipes-extended/at/{at_3.1.20.bb => at_3.1.23.bb} (90%)

diff --git a/meta/recipes-extended/at/at/fix_parallel_build_error.patch b/meta/recipes-extended/at/at/fix_parallel_build_error.patch
index 100f889..30d2324 100644
--- a/meta/recipes-extended/at/at/fix_parallel_build_error.patch
+++ b/meta/recipes-extended/at/at/fix_parallel_build_error.patch
@@ -1,3 +1,8 @@
+From 24ef2a6544f9c7ec01bc7ae73dffa2974a1e251d Mon Sep 17 00:00:00 2001
+From: Chen Qi <Qi.Chen@windriver.com>
+Date: Wed, 5 Dec 2018 09:46:22 +0800
+Subject: [PATCH] fix parallel build error
+
 make -j was failing sometimesa like this
 | ccache i586-poky-linux-gcc -march=i586 --sysroot=/home/nitin/build/build0/tmp/sysroots/i586-poky-linux -I. -fexpensive-optimizations -fomit-frame-pointer -frename-registers -O2 -ggdb -feliminate-unused-debug-types -o atd atd.o daemon.o  -lfl  -lpam -Wl,-O1 -Wl,--as-needed
 | parsetime.l:5:19: fatal error: y.tab.h: No such file or directory
@@ -12,24 +17,24 @@ Nitin <nitin.a.kamble@intel.com>
 Upstream-Status: Pending
 
 Signed-off-by: Scott Garman <scott.a.garman@intel.com>
-
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
 ---
  Makefile.in | 2 ++
  1 file changed, 2 insertions(+)
 
 diff --git a/Makefile.in b/Makefile.in
-index dd3c2f8..7897e45 100644
+index 4c11913..18ecc23 100644
 --- a/Makefile.in
 +++ b/Makefile.in
-@@ -82,6 +82,8 @@ y.tab.c y.tab.h: parsetime.y
+@@ -83,6 +83,8 @@ y.tab.c y.tab.h: parsetime.y
  lex.yy.c: parsetime.l
  	$(LEX) -i parsetime.l
  
 +parsetime.l: y.tab.h
 +
  atd.service: atd.service.in
- 	sed -e 's![@]sbindir[@]!$(sbindir)!g' < $< > $@
+ 	cat $< | sed -e 's![@]sbindir[@]!$(sbindir)!g' | sed -e 's![@]atjobdir[@]!$(atjobdir)!g' > $@
  
 -- 
-1.9.1
+2.7.4
 
diff --git a/meta/recipes-extended/at/at/pam.conf.patch b/meta/recipes-extended/at/at/pam.conf.patch
index b5ceb9a..c9f337e 100644
--- a/meta/recipes-extended/at/at/pam.conf.patch
+++ b/meta/recipes-extended/at/at/pam.conf.patch
@@ -1,27 +1,35 @@
+From 8c8a0b6ba199327d2eafefd6611353e1c483a854 Mon Sep 17 00:00:00 2001
+From: Chen Qi <Qi.Chen@windriver.com>
+Date: Wed, 5 Dec 2018 10:00:36 +0800
+Subject: [PATCH] fix pam.conf
+
 oe doesn't support "@include", use the concrete directive instead.
 
 Upstream-Status: Pending
 
 Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
-Index: at-3.1.15/pam.conf
-===================================================================
---- at-3.1.15.orig/pam.conf
-+++ at-3.1.15/pam.conf
-@@ -1,10 +1,11 @@
- #
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ pam.conf | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/pam.conf b/pam.conf
+index 3674c0a..2f8d586 100644
+--- a/pam.conf
++++ b/pam.conf
+@@ -2,9 +2,9 @@
  # The PAM configuration file for the at daemon
  #
-+ 
-+auth    required    pam_env.so
-+auth    include     common-auth
-+account include     common-account
-+session include     common-session-noninteractive
-+session required    pam_limits.so
-+session required    pam_loginuid.so
  
--auth	required	pam_env.so
 -@include common-auth
 -@include common-account
--session    required   pam_loginuid.so
++auth       include    common-auth
++acount     include    common-account
+ session    required   pam_loginuid.so
 -@include common-session-noninteractive
--session    required   pam_limits.so
++session    include    common-session-noninteractive
+ session    required   pam_limits.so
+ auth	required	pam_env.so user_readenv=1
+-- 
+2.7.4
+
diff --git a/meta/recipes-extended/at/at_3.1.20.bb b/meta/recipes-extended/at/at_3.1.23.bb
similarity index 90%
rename from meta/recipes-extended/at/at_3.1.20.bb
rename to meta/recipes-extended/at/at_3.1.23.bb
index b76e83d..b74882d 100644
--- a/meta/recipes-extended/at/at_3.1.20.bb
+++ b/meta/recipes-extended/at/at_3.1.23.bb
@@ -22,7 +22,7 @@ PAM_DEPS = "libpam libpam-runtime pam-plugin-env pam-plugin-limits"
 RCONFLICTS_${PN} = "atd"
 RREPLACES_${PN} = "atd"
 
-SRC_URI = "http://snapshot.debian.org/archive/debian/20160728T043443Z/pool/main/a/${BPN}/${BPN}_${PV}.orig.tar.gz \
+SRC_URI = "http://snapshot.debian.org/archive/debian/20180825T090248Z/pool/main/a/${BPN}/${BPN}_${PV}.orig.tar.gz \
     file://fix_parallel_build_error.patch \
     file://posixtm.c \
     file://posixtm.h \
@@ -37,8 +37,8 @@ SRC_URI = "http://snapshot.debian.org/archive/debian/20160728T043443Z/pool/main/
 PAM_SRC_URI = "file://pam.conf.patch \
                file://configure-add-enable-pam.patch"
 
-SRC_URI[md5sum] = "e7bd7b785b2cbb17e133d6bdc0fb099e"
-SRC_URI[sha256sum] = "0871923cab73050b98ace020664eb2ddc1e669e4166b5abb64d864d02fcefab9"
+SRC_URI[md5sum] = "1cec945506b5ddf1d776c92c315fc581"
+SRC_URI[sha256sum] = "97450aa954aaa8a70218cc8e61a33df9fee9f86527e9f861de302fb7a3c81710"
 
 UPSTREAM_CHECK_URI = "${DEBIAN_MIRROR}/main/a/at/"
 
-- 
1.9.1


