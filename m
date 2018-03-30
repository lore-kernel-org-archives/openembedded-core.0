Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id B619C746CF
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Mar 2018 08:53:09 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w2U8rAVj017875
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 30 Mar 2018 01:53:10 -0700
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.361.1;
	Fri, 30 Mar 2018 01:53:03 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 30 Mar 2018 04:52:47 -0400
Message-ID: <5d83883a2a415fc5af60b38710ba6bd41430f408.1522399417.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1522399417.git.hongxu.jia@windriver.com>
References: <cover.1522399417.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH V2 5/7] dhcp: 4.3.6 -> 4.4.1
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
X-List-Received-Date: Fri, 30 Mar 2018 08:53:09 -0000
Content-Type: text/plain

1. Rebase 0004, 0007, 0010

2. Rework 0008 to support external bind

3. Drop backported 0011-Moved-the-call-to-isc_app_ctxstart-to-not-get-signal.patch

License-Update: "ISC" -> "MPL-2.0"

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-connectivity/dhcp/dhcp.inc            |   4 +-
 ...o-_PATH_DHCPD_CONF-and-_PATH_DHCLIENT_CON.patch |   6 +-
 .../dhcp/dhcp/0002-dhclient-dbus.patch             |  10 +-
 .../dhcp/dhcp/0003-link-with-lcrypto.patch         |   6 +-
 .../dhcp/dhcp/0004-Fix-out-of-tree-builds.patch    |  87 +--------
 ...-fix-invoke-dhclient-script-failed-on-Rea.patch |   4 +-
 .../dhcp/0006-site.h-enable-gentle-shutdown.patch  |   6 +-
 ...re-argument-to-make-the-libxml2-dependenc.patch |  16 +-
 .../dhcp/0008-tweak-to-support-external-bind.patch | 161 ++++++----------
 ...09-remove-dhclient-script-bash-dependency.patch |   4 +-
 .../dhcp/dhcp/0010-build-shared-libs.patch         | 210 ++++++++++++---------
 ...all-to-isc_app_ctxstart-to-not-get-signal.patch |  81 --------
 ...correct-the-intention-for-xml2-lib-search.patch |  10 +-
 .../dhcp/{dhcp_4.3.6.bb => dhcp_4.4.1.bb}          |   5 +-
 14 files changed, 227 insertions(+), 383 deletions(-)
 delete mode 100644 meta/recipes-connectivity/dhcp/dhcp/0011-Moved-the-call-to-isc_app_ctxstart-to-not-get-signal.patch
 rename meta/recipes-connectivity/dhcp/{dhcp_4.3.6.bb => dhcp_4.4.1.bb} (79%)

diff --git a/meta/recipes-connectivity/dhcp/dhcp.inc b/meta/recipes-connectivity/dhcp/dhcp.inc
index e943707..bb2c71b 100644
--- a/meta/recipes-connectivity/dhcp/dhcp.inc
+++ b/meta/recipes-connectivity/dhcp/dhcp.inc
@@ -7,8 +7,8 @@ easier to administer devices."
 
 HOMEPAGE = "http://www.isc.org/"
 
-LICENSE = "ISC"
-LIC_FILES_CHKSUM = "file://LICENSE;beginline=4;md5=c5c64d696107f84b56fe337d14da1753"
+LICENSE = "MPL-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;beginline=4;md5=004a4db50a1e20972e924a8618747c01"
 
 DEPENDS = "openssl bind"
 
diff --git a/meta/recipes-connectivity/dhcp/dhcp/0001-define-macro-_PATH_DHCPD_CONF-and-_PATH_DHCLIENT_CON.patch b/meta/recipes-connectivity/dhcp/dhcp/0001-define-macro-_PATH_DHCPD_CONF-and-_PATH_DHCLIENT_CON.patch
index e5b3cf9..823e8ad 100644
--- a/meta/recipes-connectivity/dhcp/dhcp/0001-define-macro-_PATH_DHCPD_CONF-and-_PATH_DHCLIENT_CON.patch
+++ b/meta/recipes-connectivity/dhcp/dhcp/0001-define-macro-_PATH_DHCPD_CONF-and-_PATH_DHCLIENT_CON.patch
@@ -1,4 +1,4 @@
-From 7cc29144535a622fc671dc86eb1da65b0473a7c4 Mon Sep 17 00:00:00 2001
+From 0f6deb81b3ea989dc5c71ad3ddf7a713c9a0bea7 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Tue, 15 Aug 2017 16:14:22 +0800
 Subject: [PATCH 01/11] define macro _PATH_DHCPD_CONF and _PATH_DHCLIENT_CONF
@@ -12,10 +12,10 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  1 file changed, 2 insertions(+), 1 deletion(-)
 
 diff --git a/includes/site.h b/includes/site.h
-index b2f7fd7..280fbb9 100644
+index 2ef69e4..b4dd2e4 100644
 --- a/includes/site.h
 +++ b/includes/site.h
-@@ -149,7 +149,8 @@
+@@ -148,7 +148,8 @@
  /* Define this if you want the dhcpd.conf file to go somewhere other than
     the default location.   By default, it goes in /etc/dhcpd.conf. */
  
diff --git a/meta/recipes-connectivity/dhcp/dhcp/0002-dhclient-dbus.patch b/meta/recipes-connectivity/dhcp/dhcp/0002-dhclient-dbus.patch
index 101c33f..44d2301 100644
--- a/meta/recipes-connectivity/dhcp/dhcp/0002-dhclient-dbus.patch
+++ b/meta/recipes-connectivity/dhcp/dhcp/0002-dhclient-dbus.patch
@@ -1,4 +1,4 @@
-From be7540d31c356e80ee02e90e8bf162b7ac6e5ba5 Mon Sep 17 00:00:00 2001
+From 4514f02e4bbd33d9136ed4522f508d64c7ec9249 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Tue, 15 Aug 2017 14:56:56 +0800
 Subject: [PATCH 02/11] dhclient dbus
@@ -33,7 +33,7 @@ index d69d0d8..095b143 100755
  }
  
 diff --git a/client/scripts/freebsd b/client/scripts/freebsd
-index 8f3e2a2..ad7fb44 100755
+index 7c073f8..b3426bf 100755
 --- a/client/scripts/freebsd
 +++ b/client/scripts/freebsd
 @@ -89,6 +89,11 @@ exit_with_hooks() {
@@ -49,7 +49,7 @@ index 8f3e2a2..ad7fb44 100755
  }
  
 diff --git a/client/scripts/linux b/client/scripts/linux
-index 5fb1612..3d447b6 100755
+index 0c42969..cded38f 100755
 --- a/client/scripts/linux
 +++ b/client/scripts/linux
 @@ -174,6 +174,11 @@ exit_with_hooks() {
@@ -65,7 +65,7 @@ index 5fb1612..3d447b6 100755
  }
  
 diff --git a/client/scripts/netbsd b/client/scripts/netbsd
-index 07383b7..aaba8e8 100755
+index fa08637..3628418 100755
 --- a/client/scripts/netbsd
 +++ b/client/scripts/netbsd
 @@ -45,6 +45,11 @@ exit_with_hooks() {
@@ -81,7 +81,7 @@ index 07383b7..aaba8e8 100755
  }
  
 diff --git a/client/scripts/openbsd b/client/scripts/openbsd
-index e7f4746..56b980c 100644
+index afb7924..57c80d4 100755
 --- a/client/scripts/openbsd
 +++ b/client/scripts/openbsd
 @@ -45,6 +45,11 @@ exit_with_hooks() {
diff --git a/meta/recipes-connectivity/dhcp/dhcp/0003-link-with-lcrypto.patch b/meta/recipes-connectivity/dhcp/dhcp/0003-link-with-lcrypto.patch
index 810c7b6..5b46855 100644
--- a/meta/recipes-connectivity/dhcp/dhcp/0003-link-with-lcrypto.patch
+++ b/meta/recipes-connectivity/dhcp/dhcp/0003-link-with-lcrypto.patch
@@ -1,4 +1,4 @@
-From d80bd792323dbd56269309f85b4506eb6b1b60e9 Mon Sep 17 00:00:00 2001
+From 08b13bbb8951235a5e9c614641bbb34e357f5c12 Mon Sep 17 00:00:00 2001
 From: Andrei Gherzan <andrei@gherzan.ro>
 Date: Tue, 15 Aug 2017 15:05:47 +0800
 Subject: [PATCH 03/11] link with lcrypto
@@ -19,10 +19,10 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  1 file changed, 4 insertions(+)
 
 diff --git a/configure.ac b/configure.ac
-index cdfa352..44fb57e 100644
+index a797438..552631a 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -591,6 +591,10 @@ AC_COMPILE_IFELSE([AC_LANG_PROGRAM([[]], [[void foo() __attribute__((noreturn));
+@@ -612,6 +612,10 @@ AC_COMPILE_IFELSE([AC_LANG_PROGRAM([[]], [[void foo() __attribute__((noreturn));
  # Look for optional headers.
  AC_CHECK_HEADERS(sys/socket.h net/if_dl.h net/if6.h regex.h)
  
diff --git a/meta/recipes-connectivity/dhcp/dhcp/0004-Fix-out-of-tree-builds.patch b/meta/recipes-connectivity/dhcp/dhcp/0004-Fix-out-of-tree-builds.patch
index 7d1d867..f8f94e2 100644
--- a/meta/recipes-connectivity/dhcp/dhcp/0004-Fix-out-of-tree-builds.patch
+++ b/meta/recipes-connectivity/dhcp/dhcp/0004-Fix-out-of-tree-builds.patch
@@ -1,100 +1,31 @@
-From cccec0344d68dac4100b6f260ee24e7c2da9dfda Mon Sep 17 00:00:00 2001
+From ddb15684f61818c76a7eff8b6f6f662880abc09b Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
-Date: Tue, 15 Aug 2017 15:08:22 +0800
+Date: Thu, 29 Mar 2018 10:37:03 +0800
 Subject: [PATCH 04/11] Fix out of tree builds
 
 Upstream-Status: Pending
 
 RP 2013/03/21
 
-Rebase to 4.3.6
-
+Rebase to 4.4.1
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
 ---
- client/Makefile.am  | 4 ++--
- common/Makefile.am  | 3 ++-
- dhcpctl/Makefile.am | 2 ++
- omapip/Makefile.am  | 1 +
- relay/Makefile.am   | 2 +-
- server/Makefile.am  | 2 +-
- 6 files changed, 9 insertions(+), 5 deletions(-)
+ client/Makefile.am | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/client/Makefile.am b/client/Makefile.am
-index 2cb83d8..4730bb3 100644
+index d177159..d1f9c15 100644
 --- a/client/Makefile.am
 +++ b/client/Makefile.am
-@@ -7,11 +7,11 @@ SUBDIRS = . tests
- BINDLIBDIR = @BINDDIR@/lib
- 
- AM_CPPFLAGS = -DCLIENT_PATH='"PATH=$(sbindir):/sbin:/bin:/usr/sbin:/usr/bin"' \
--	      -DLOCALSTATEDIR='"$(localstatedir)"'
-+	      -DLOCALSTATEDIR='"$(localstatedir)"' -I$(top_srcdir)/includes
+@@ -9,7 +9,7 @@ AM_CPPFLAGS += -DLOCALSTATEDIR='"$(localstatedir)"'
  
  dist_sysconf_DATA = dhclient.conf.example
  sbin_PROGRAMS = dhclient
--dhclient_SOURCES = clparse.c dhclient.c dhc6.c \
-+dhclient_SOURCES = $(srcdir)/clparse.c $(srcdir)/dhclient.c $(srcdir)/dhc6.c \
+-dhclient_SOURCES = client_tables.c clparse.c dhclient.c dhc6.c \
++dhclient_SOURCES = $(srcdir)/client_tables.c $(srcdir)/clparse.c $(srcdir)/dhclient.c $(srcdir)/dhc6.c \
  		   scripts/bsdos scripts/freebsd scripts/linux scripts/macos \
  		   scripts/netbsd scripts/nextstep scripts/openbsd \
  		   scripts/solaris scripts/openwrt
-diff --git a/common/Makefile.am b/common/Makefile.am
-index 113aee8..0f24fbb 100644
---- a/common/Makefile.am
-+++ b/common/Makefile.am
-@@ -1,4 +1,5 @@
--AM_CPPFLAGS = -I$(top_srcdir) -DLOCALSTATEDIR='"@localstatedir@"'
-+AM_CPPFLAGS = -I$(top_srcdir)/includes -I$(top_srcdir) -DLOCALSTATEDIR='"@localstatedir@"'
-+
- AM_CFLAGS = $(LDAP_CFLAGS)
- 
- noinst_LIBRARIES = libdhcp.a
-diff --git a/dhcpctl/Makefile.am b/dhcpctl/Makefile.am
-index ceb0de1..ba8dd8b 100644
---- a/dhcpctl/Makefile.am
-+++ b/dhcpctl/Makefile.am
-@@ -1,5 +1,7 @@
- BINDLIBDIR = @BINDDIR@/lib
- 
-+AM_CPPFLAGS = -I$(top_srcdir)/includes -I$(top_srcdir)
-+
- bin_PROGRAMS = omshell
- lib_LIBRARIES = libdhcpctl.a
- noinst_PROGRAMS = cltest
-diff --git a/omapip/Makefile.am b/omapip/Makefile.am
-index 446a594..dd1afa0 100644
---- a/omapip/Makefile.am
-+++ b/omapip/Makefile.am
-@@ -1,4 +1,5 @@
- BINDLIBDIR = @BINDDIR@/lib
-+AM_CPPFLAGS = -I$(top_srcdir)/includes
- 
- lib_LIBRARIES = libomapi.a
- noinst_PROGRAMS = svtest
-diff --git a/relay/Makefile.am b/relay/Makefile.am
-index 3060eca..6d652f6 100644
---- a/relay/Makefile.am
-+++ b/relay/Makefile.am
-@@ -1,6 +1,6 @@
- BINDLIBDIR = @BINDDIR@/lib
- 
--AM_CPPFLAGS = -DLOCALSTATEDIR='"@localstatedir@"'
-+AM_CPPFLAGS = -DLOCALSTATEDIR='"@localstatedir@"' -I$(top_srcdir)/includes
- 
- sbin_PROGRAMS = dhcrelay
- dhcrelay_SOURCES = dhcrelay.c
-diff --git a/server/Makefile.am b/server/Makefile.am
-index 54feedf..3990b9c 100644
---- a/server/Makefile.am
-+++ b/server/Makefile.am
-@@ -6,7 +6,7 @@ SUBDIRS = . tests
- 
- BINDLIBDIR = @BINDDIR@/lib
- 
--AM_CPPFLAGS = -I.. -DLOCALSTATEDIR='"@localstatedir@"'
-+AM_CPPFLAGS = -I$(top_srcdir) -DLOCALSTATEDIR='"@localstatedir@"' -I$(top_srcdir)/includes
- 
- dist_sysconf_DATA = dhcpd.conf.example
- sbin_PROGRAMS = dhcpd
 -- 
 1.8.3.1
 
diff --git a/meta/recipes-connectivity/dhcp/dhcp/0005-dhcp-client-fix-invoke-dhclient-script-failed-on-Rea.patch b/meta/recipes-connectivity/dhcp/dhcp/0005-dhcp-client-fix-invoke-dhclient-script-failed-on-Rea.patch
index dd56381..84b126f 100644
--- a/meta/recipes-connectivity/dhcp/dhcp/0005-dhcp-client-fix-invoke-dhclient-script-failed-on-Rea.patch
+++ b/meta/recipes-connectivity/dhcp/dhcp/0005-dhcp-client-fix-invoke-dhclient-script-failed-on-Rea.patch
@@ -1,4 +1,4 @@
-From 2e8ff0e4f6d39e346ea86b8c514ab4ccc78fa359 Mon Sep 17 00:00:00 2001
+From b5ca894a5e82b365f0804be2a48bd687824fceef Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Tue, 15 Aug 2017 15:24:14 +0800
 Subject: [PATCH 05/11] dhcp-client: fix invoke dhclient-script failed on
@@ -19,7 +19,7 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/client/scripts/linux b/client/scripts/linux
-index 3d447b6..3122a75 100755
+index cded38f..516c986 100755
 --- a/client/scripts/linux
 +++ b/client/scripts/linux
 @@ -40,7 +40,7 @@ make_resolv_conf() {
diff --git a/meta/recipes-connectivity/dhcp/dhcp/0006-site.h-enable-gentle-shutdown.patch b/meta/recipes-connectivity/dhcp/dhcp/0006-site.h-enable-gentle-shutdown.patch
index c62b283..a57dffd 100644
--- a/meta/recipes-connectivity/dhcp/dhcp/0006-site.h-enable-gentle-shutdown.patch
+++ b/meta/recipes-connectivity/dhcp/dhcp/0006-site.h-enable-gentle-shutdown.patch
@@ -1,4 +1,4 @@
-From 01641d146e4e6bea954e4a4ee1f6230b822665b4 Mon Sep 17 00:00:00 2001
+From 249389cb6b25e828c2902d07d0277697d0f97418 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Tue, 15 Aug 2017 15:37:49 +0800
 Subject: [PATCH 06/11] site.h: enable gentle shutdown
@@ -13,10 +13,10 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/includes/site.h b/includes/site.h
-index 280fbb9..e6c2972 100644
+index b4dd2e4..1fb0de4 100644
 --- a/includes/site.h
 +++ b/includes/site.h
-@@ -296,7 +296,7 @@
+@@ -295,7 +295,7 @@
     situations.  We plan to revisit this feature and may
     make non-backwards compatible changes including the
     removal of this define.  Use at your own risk.  */
diff --git a/meta/recipes-connectivity/dhcp/dhcp/0007-Add-configure-argument-to-make-the-libxml2-dependenc.patch b/meta/recipes-connectivity/dhcp/dhcp/0007-Add-configure-argument-to-make-the-libxml2-dependenc.patch
index 43c26ea..7d446ee 100644
--- a/meta/recipes-connectivity/dhcp/dhcp/0007-Add-configure-argument-to-make-the-libxml2-dependenc.patch
+++ b/meta/recipes-connectivity/dhcp/dhcp/0007-Add-configure-argument-to-make-the-libxml2-dependenc.patch
@@ -1,6 +1,6 @@
-From 7107511fd209f08f9a96f8938041ae48f3295895 Mon Sep 17 00:00:00 2001
-From: Christopher Larson <chris_larson@mentor.com>
-Date: Tue, 15 Aug 2017 16:17:49 +0800
+From a2646c0a27de8dc1d386368b48fe7d0d2042491b Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Thu, 29 Mar 2018 10:45:13 +0800
 Subject: [PATCH 07/11] Add configure argument to make the libxml2 dependency
  explicit and determinisitic.
 
@@ -8,7 +8,7 @@ Upstream-Status: Pending
 
 Signed-off-by: Christopher Larson <chris_larson@mentor.com>
 
-Rebase to 4.3.6
+Rebase to 4.4.4
 
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
 ---
@@ -16,12 +16,12 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  1 file changed, 11 insertions(+)
 
 diff --git a/configure.ac b/configure.ac
-index 44fb57e..8e9f509 100644
+index 552631a..ea9f40f 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -611,6 +611,17 @@ AC_CHECK_FUNCS(strlcat)
- # For HP/UX we need -lipv6 for if_nametoindex, perhaps others.
- AC_SEARCH_LIBS(if_nametoindex, [ipv6])
+@@ -642,6 +642,17 @@ if test "$have_nanosleep" = "rt"; then
+ 	LIBS="-lrt $LIBS"
+ fi
  
 +AC_ARG_WITH(libxml2,
 +	AS_HELP_STRING([--with-libxml2], [link against libxml2. this is needed if bind was built with xml2 support enabled]),
diff --git a/meta/recipes-connectivity/dhcp/dhcp/0008-tweak-to-support-external-bind.patch b/meta/recipes-connectivity/dhcp/dhcp/0008-tweak-to-support-external-bind.patch
index 006d18a..0f47f9c 100644
--- a/meta/recipes-connectivity/dhcp/dhcp/0008-tweak-to-support-external-bind.patch
+++ b/meta/recipes-connectivity/dhcp/dhcp/0008-tweak-to-support-external-bind.patch
@@ -1,6 +1,6 @@
-From 92875f5cc44914515e50c11c503a09cec90497b2 Mon Sep 17 00:00:00 2001
+From 36925e610901ed37fb6c52339847d283acb3bb20 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
-Date: Sat, 11 Jun 2016 22:51:44 -0400
+Date: Thu, 29 Mar 2018 11:15:49 +0800
 Subject: [PATCH 08/11] tweak to support external bind
 
 Tweak the external bind to oe-core's sysroot rather than
@@ -8,110 +8,65 @@ external bind source build.
 
 Upstream-Status: Inappropriate <oe-core specific>
 
+Rework on 4.4.1
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
 ---
- client/Makefile.am       | 2 +-
- client/tests/Makefile.am | 2 +-
- common/tests/Makefile.am | 2 +-
- dhcpctl/Makefile.am      | 2 +-
- omapip/Makefile.am       | 2 +-
- relay/Makefile.am        | 2 +-
- server/Makefile.am       | 2 +-
- server/tests/Makefile.am | 2 +-
- 8 files changed, 8 insertions(+), 8 deletions(-)
+ configure.ac | 34 ++++------------------------------
+ 1 file changed, 4 insertions(+), 30 deletions(-)
 
-diff --git a/client/Makefile.am b/client/Makefile.am
-index 4730bb3..84d8131 100644
---- a/client/Makefile.am
-+++ b/client/Makefile.am
-@@ -4,7 +4,7 @@
- # production code. Sadly, we are not there yet.
- SUBDIRS = . tests
- 
--BINDLIBDIR = @BINDDIR@/lib
-+BINDLIBDIR = @BINDDIR@
- 
- AM_CPPFLAGS = -DCLIENT_PATH='"PATH=$(sbindir):/sbin:/bin:/usr/sbin:/usr/bin"' \
- 	      -DLOCALSTATEDIR='"$(localstatedir)"' -I$(top_srcdir)/includes
-diff --git a/client/tests/Makefile.am b/client/tests/Makefile.am
-index 5031d0c..a8dfd26 100644
---- a/client/tests/Makefile.am
-+++ b/client/tests/Makefile.am
-@@ -1,6 +1,6 @@
- SUBDIRS = .
- 
--BINDLIBDIR = @BINDDIR@/lib
-+BINDLIBDIR = @BINDDIR@
- 
- AM_CPPFLAGS = $(ATF_CFLAGS) -DUNIT_TEST -I$(top_srcdir)/includes
- AM_CPPFLAGS += -I@BINDDIR@/include -I$(top_srcdir)
-diff --git a/common/tests/Makefile.am b/common/tests/Makefile.am
-index f6a43e4..2f98d22 100644
---- a/common/tests/Makefile.am
-+++ b/common/tests/Makefile.am
-@@ -1,6 +1,6 @@
- SUBDIRS = .
- 
--BINDLIBDIR = @BINDDIR@/lib
-+BINDLIBDIR = @BINDDIR@
- 
- AM_CPPFLAGS = $(ATF_CFLAGS) -I$(top_srcdir)/includes
- 
-diff --git a/dhcpctl/Makefile.am b/dhcpctl/Makefile.am
-index ba8dd8b..9b2486e 100644
---- a/dhcpctl/Makefile.am
-+++ b/dhcpctl/Makefile.am
-@@ -1,4 +1,4 @@
--BINDLIBDIR = @BINDDIR@/lib
-+BINDLIBDIR = @BINDDIR@
- 
- AM_CPPFLAGS = -I$(top_srcdir)/includes -I$(top_srcdir)
- 
-diff --git a/omapip/Makefile.am b/omapip/Makefile.am
-index dd1afa0..e4a8599 100644
---- a/omapip/Makefile.am
-+++ b/omapip/Makefile.am
-@@ -1,4 +1,4 @@
--BINDLIBDIR = @BINDDIR@/lib
-+BINDLIBDIR = @BINDDIR@
- AM_CPPFLAGS = -I$(top_srcdir)/includes
- 
- lib_LIBRARIES = libomapi.a
-diff --git a/relay/Makefile.am b/relay/Makefile.am
-index 6d652f6..b3bf578 100644
---- a/relay/Makefile.am
-+++ b/relay/Makefile.am
-@@ -1,4 +1,4 @@
--BINDLIBDIR = @BINDDIR@/lib
-+BINDLIBDIR = @BINDDIR@
- 
- AM_CPPFLAGS = -DLOCALSTATEDIR='"@localstatedir@"' -I$(top_srcdir)/includes
- 
-diff --git a/server/Makefile.am b/server/Makefile.am
-index 3990b9c..b5d8c2d 100644
---- a/server/Makefile.am
-+++ b/server/Makefile.am
-@@ -4,7 +4,7 @@
- # production code. Sadly, we are not there yet.
- SUBDIRS = . tests
- 
--BINDLIBDIR = @BINDDIR@/lib
-+BINDLIBDIR = @BINDDIR@
- 
- AM_CPPFLAGS = -I$(top_srcdir) -DLOCALSTATEDIR='"@localstatedir@"' -I$(top_srcdir)/includes
- 
-diff --git a/server/tests/Makefile.am b/server/tests/Makefile.am
-index a87c5e7..9821081 100644
---- a/server/tests/Makefile.am
-+++ b/server/tests/Makefile.am
-@@ -1,6 +1,6 @@
- SUBDIRS = .
- 
--BINDLIBDIR = @BINDDIR@/lib
-+BINDLIBDIR = @BINDDIR@
- 
- AM_CPPFLAGS = $(ATF_CFLAGS) -DUNIT_TEST -I$(top_srcdir)/includes
- AM_CPPFLAGS += -I@BINDDIR@/include -I$(top_srcdir)
+diff --git a/configure.ac b/configure.ac
+index ea9f40f..2bf434d 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -815,22 +815,11 @@ no)
+ 	if test ! -d "$use_libbind"; then
+ 		AC_MSG_ERROR([Cannot find bind directory at $use_libbind])
+ 	fi
+-	if test ! -d "$use_libbind/include" -o \
+-	        ! -f "$use_libbind/include/isc/buffer.h"
+-	then
+-		AC_MSG_ERROR([Cannot find bind includes at $use_libbind/include])
+-	fi
+-	if test	! -d "$use_libbind/lib" -o \
+-	        \( ! -f "$use_libbind/lib/libisc.a" -a \
+-		   ! -f	"$use_libbind/lib/libisc.la" \)
+-	then
+-		AC_MSG_ERROR([Cannot find bind libraries at $use_libbind/lib])
+-	fi
+ 	BINDDIR="$use_libbind"
+-	BINDLIBIRSDIR="$BINDDIR/lib"
+-	BINDLIBDNSDIR="$BINDDIR/lib"
+-	BINDLIBISCCFGDIR="$BINDDIR/lib"
+-	BINDLIBISCDIR="$BINDDIR/lib"	
++	BINDLIBIRSDIR="$BINDDIR"
++	BINDLIBDNSDIR="$BINDDIR"
++	BINDLIBISCCFGDIR="$BINDDIR"
++	BINDLIBISCDIR="$BINDDIR"
+ 	DISTCHECK_LIBBIND_CONFIGURE_FLAG="--with-libbind=$use_libbind"
+ 	;;
+ esac
+@@ -865,21 +854,6 @@ AC_ARG_ENABLE(libtool,
+ 	AS_HELP_STRING([--enable-libtool],
+ [use GNU libtool for dynamic shared libraries (default is no).]),
+ 	want_libtool="$enableval")
+-
+-if test "$use_libbind" != "no"; then
+-	if test "$want_libtool" = "yes" -a \
+-	        ! -f "$use_libbind/lib/libisc.la"
+-	then
+-		AC_MSG_ERROR([Cannot find dynamic libraries at $use_libbind/lib])
+-	fi
+-	if test "$want_libtool" = "no" -a \
+-	        ! -f "$use_libbind/lib/libisc.a"
+-	then
+-		AC_MSG_ERROR([Cannot find static libraries at $use_libbind/lib])
+-	fi
+-fi
+-
+-
+ if test "$want_libtool" = "yes"; then
+ 	AC_MSG_WARN([legacy configure is used but libtool is enabled. Trying to recover...])
+ 	# expand $ac_configure_args
 -- 
 1.8.3.1
 
diff --git a/meta/recipes-connectivity/dhcp/dhcp/0009-remove-dhclient-script-bash-dependency.patch b/meta/recipes-connectivity/dhcp/dhcp/0009-remove-dhclient-script-bash-dependency.patch
index 912b6d6..ff1924d 100644
--- a/meta/recipes-connectivity/dhcp/dhcp/0009-remove-dhclient-script-bash-dependency.patch
+++ b/meta/recipes-connectivity/dhcp/dhcp/0009-remove-dhclient-script-bash-dependency.patch
@@ -1,4 +1,4 @@
-From f3f8b7726e50e24ef3edf5fa5a17e31d39118d7e Mon Sep 17 00:00:00 2001
+From 538c7b61d1ecebbbcd7526fc6aecd8b0b830a24a Mon Sep 17 00:00:00 2001
 From: Andre McCurdy <armccurdy@gmail.com>
 Date: Tue, 15 Aug 2017 15:49:31 +0800
 Subject: [PATCH 09/11] remove dhclient-script bash dependency
@@ -14,7 +14,7 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/client/scripts/linux b/client/scripts/linux
-index 3122a75..1712d7d 100755
+index 516c986..e9ea379 100755
 --- a/client/scripts/linux
 +++ b/client/scripts/linux
 @@ -1,4 +1,4 @@
diff --git a/meta/recipes-connectivity/dhcp/dhcp/0010-build-shared-libs.patch b/meta/recipes-connectivity/dhcp/dhcp/0010-build-shared-libs.patch
index f128731..19f4358 100644
--- a/meta/recipes-connectivity/dhcp/dhcp/0010-build-shared-libs.patch
+++ b/meta/recipes-connectivity/dhcp/dhcp/0010-build-shared-libs.patch
@@ -1,6 +1,6 @@
-From 76c370a929e5ab5dbc81c2fbcf4e50f4fbc08ce9 Mon Sep 17 00:00:00 2001
-From: Kai Kang <kai.kang@windriver.com>
-Date: Tue, 15 Aug 2017 15:53:37 +0800
+From c1a904dedbf2f1333f139da71fdaa1ced4de80be Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Thu, 29 Mar 2018 14:01:43 +0800
 Subject: [PATCH 10/11] build shared libs
 
 Upstream-Status: Pending
@@ -9,75 +9,102 @@ Port patches from Fedora to build shared libs rather than static libs.
 
 Signed-off-by: Kai Kang <kai.kang@windriver.com>
 
-Rebase to 4.3.6
+Rebase to 4.4.1
 
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+
+squash! build shared libs
 ---
- client/Makefile.am       |  4 ++--
- common/tests/Makefile.am | 13 +++++--------
+ client/Makefile.am       |  7 ++-----
+ common/tests/Makefile.am | 35 ++++++++++-------------------------
  configure.ac             | 12 ++----------
- dhcpctl/Makefile.am      | 14 ++++++--------
- omapip/Makefile.am       |  7 +++----
- relay/Makefile.am        |  5 ++---
- server/Makefile.am       |  7 +++----
- server/tests/Makefile.am |  7 +++----
- 8 files changed, 26 insertions(+), 43 deletions(-)
+ dhcpctl/Makefile.am      | 18 ++++++------------
+ omapip/Makefile.am       | 11 ++++-------
+ relay/Makefile.am        |  7 ++-----
+ server/Makefile.am       |  9 +++------
+ server/tests/Makefile.am |  9 +++------
+ 8 files changed, 32 insertions(+), 76 deletions(-)
 
 diff --git a/client/Makefile.am b/client/Makefile.am
-index 84d8131..e776bf0 100644
+index d1f9c15..10844f3 100644
 --- a/client/Makefile.am
 +++ b/client/Makefile.am
-@@ -15,7 +15,7 @@ dhclient_SOURCES = $(srcdir)/clparse.c $(srcdir)/dhclient.c $(srcdir)/dhc6.c \
+@@ -13,10 +13,7 @@ dhclient_SOURCES = $(srcdir)/client_tables.c $(srcdir)/clparse.c $(srcdir)/dhcli
  		   scripts/bsdos scripts/freebsd scripts/linux scripts/macos \
  		   scripts/netbsd scripts/nextstep scripts/openbsd \
  		   scripts/solaris scripts/openwrt
--dhclient_LDADD = ../common/libdhcp.a ../omapip/libomapi.a $(BINDLIBDIR)/libirs.a \
--		 $(BINDLIBDIR)/libdns.a $(BINDLIBDIR)/libisccfg.a $(BINDLIBDIR)/libisc.a
-+dhclient_LDADD = ../common/libdhcp.a ../omapip/libomapi.la \
-+		  -L$(BINDLIBDIR) -lirs -ldns -lisccfg -lisc
+-dhclient_LDADD = ../common/libdhcp.@A@ ../omapip/libomapi.@A@ \
+-		 @BINDLIBIRSDIR@/libirs.@A@ \
+-		 @BINDLIBDNSDIR@/libdns.@A@ \
+-		 @BINDLIBISCCFGDIR@/libisccfg.@A@ \
+-		 @BINDLIBISCDIR@/libisc.@A@
++dhclient_LDADD = ../common/libdhcp.@A@ ../omapip/libomapi.la \
++		 -L$(BINDDIR) -lirs -ldns -lisccfg -lisc
  man_MANS = dhclient.8 dhclient-script.8 dhclient.conf.5 dhclient.leases.5
  EXTRA_DIST = $(man_MANS)
 diff --git a/common/tests/Makefile.am b/common/tests/Makefile.am
-index 2f98d22..8745e88 100644
+index 322f77e..917120b 100644
 --- a/common/tests/Makefile.am
 +++ b/common/tests/Makefile.am
-@@ -15,26 +15,23 @@ ATF_TESTS += alloc_unittest dns_unittest misc_unittest ns_name_unittest
+@@ -13,43 +13,28 @@ ATF_TESTS += alloc_unittest dns_unittest misc_unittest ns_name_unittest \
+ 
  alloc_unittest_SOURCES = test_alloc.c $(top_srcdir)/tests/t_api_dhcp.c
  alloc_unittest_LDADD = $(ATF_LDFLAGS)
- alloc_unittest_LDADD += ../libdhcp.a  \
--	../../omapip/libomapi.a $(BINDLIBDIR)/libirs.a \
--	$(BINDLIBDIR)/libdns.a $(BINDLIBDIR)/libisccfg.a  $(BINDLIBDIR)/libisc.a
-+	../../omapip/libomapi.la -L$(BINDLIBDIR) -ldns -lisccfg -lisc
+-alloc_unittest_LDADD += ../libdhcp.@A@ ../../omapip/libomapi.@A@ \
+-	@BINDLIBIRSDIR@/libirs.@A@ \
+-	@BINDLIBDNSDIR@/libdns.@A@ \
+-	@BINDLIBISCCFGDIR@/libisccfg.@A@  \
+-	@BINDLIBISCDIR@/libisc.@A@
++alloc_unittest_LDADD += ../libdhcp.@A@ ../../omapip/libomapi.la \
++	-L$(BINDDIR) -lirs -ldns -lisccfg -lisc
  
  dns_unittest_SOURCES = dns_unittest.c $(top_srcdir)/tests/t_api_dhcp.c
  dns_unittest_LDADD = $(ATF_LDFLAGS)
- dns_unittest_LDADD += ../libdhcp.a  \
--	../../omapip/libomapi.a $(BINDLIBDIR)/libirs.a \
--	$(BINDLIBDIR)/libdns.a $(BINDLIBDIR)/libisccfg.a  $(BINDLIBDIR)/libisc.a
-+	../../omapip/libomapi.la -L$(BINDLIBDIR) -ldns -lisccfg -lisc
+-dns_unittest_LDADD += ../libdhcp.@A@ ../../omapip/libomapi.@A@ \
+-	@BINDLIBIRSDIR@/libirs.@A@ \
+-	@BINDLIBDNSDIR@/libdns.@A@ \
+-	@BINDLIBISCCFGDIR@/libisccfg.@A@  \
+-	@BINDLIBISCDIR@/libisc.@A@
++dns_unittest_LDADD += ../libdhcp.@A@  ../../omapip/libomapi.la \
++	-L$(BINDDIR) -lirs -ldns -lisccfg -lisc
  
  misc_unittest_SOURCES = misc_unittest.c $(top_srcdir)/tests/t_api_dhcp.c
  misc_unittest_LDADD = $(ATF_LDFLAGS)
- misc_unittest_LDADD += ../libdhcp.a  \
--	../../omapip/libomapi.a $(BINDLIBDIR)/libirs.a \
--	$(BINDLIBDIR)/libdns.a $(BINDLIBDIR)/libisccfg.a  $(BINDLIBDIR)/libisc.a
-+	../../omapip/libomapi.la -L$(BINDLIBDIR) -ldns -lisccfg -lisc
+-misc_unittest_LDADD += ../libdhcp.@A@ ../../omapip/libomapi.@A@ \
+-	@BINDLIBIRSDIR@/libirs.@A@ \
+-	@BINDLIBDNSDIR@/libdns.@A@ \
+-	@BINDLIBISCCFGDIR@/libisccfg.@A@  \
+-	@BINDLIBISCDIR@/libisc.@A@
++misc_unittest_LDADD += ../libdhcp.@A@  ../../omapip/libomapi.la \
++	-L$(BINDDIR) -lirs -ldns -lisccfg -lisc
  
  ns_name_unittest_SOURCES = ns_name_test.c $(top_srcdir)/tests/t_api_dhcp.c
  ns_name_unittest_LDADD = $(ATF_LDFLAGS)
- ns_name_unittest_LDADD += ../libdhcp.a  \
--	../../omapip/libomapi.a $(BINDLIBDIR)/libirs.a \
--	$(BINDLIBDIR)/libdns.a $(BINDLIBDIR)/libisccfg.a  $(BINDLIBDIR)/libisc.a
-+	../../omapip/libomapi.a -L$(BINDLIBDIR) \
-+	-ldns -lisccfg -lisc
+-ns_name_unittest_LDADD += ../libdhcp.@A@ ../../omapip/libomapi.@A@ \
+-	@BINDLIBIRSDIR@/libirs.@A@ \
+-	@BINDLIBDNSDIR@/libdns.@A@ \
+-	@BINDLIBISCCFGDIR@/libisccfg.@A@  \
+-	@BINDLIBISCDIR@/libisc.@A@
++ns_name_unittest_LDADD += ../libdhcp.@A@  ../../omapip/libomapi.la \
++	-L$(BINDDIR) -lirs -ldns -lisccfg -lisc
+ 
+ option_unittest_SOURCES = option_unittest.c $(top_srcdir)/tests/t_api_dhcp.c
+ option_unittest_LDADD = $(ATF_LDFLAGS)
+-option_unittest_LDADD += ../libdhcp.@A@ ../../omapip/libomapi.@A@ \
+-	@BINDLIBIRSDIR@/libirs.@A@ \
+-	@BINDLIBDNSDIR@/libdns.@A@ \
+-	@BINDLIBISCCFGDIR@/libisccfg.@A@  \
+-	@BINDLIBISCDIR@/libisc.@A@
++option_unittest_LDADD += ../libdhcp.@A@  ../../omapip/libomapi.la \
++	-L$(BINDDIR) -lirs -ldns -lisccfg -lisc
  
  check: $(ATF_TESTS)
  	@if test $(top_srcdir) != ${top_builddir}; then \
 diff --git a/configure.ac b/configure.ac
-index 8e9f509..bfe988a 100644
+index 2bf434d..97fc39c 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -47,16 +47,8 @@ AM_CONDITIONAL(CROSS_COMPILING, test "$cross_compiling" = "yes")
+@@ -60,16 +60,8 @@ AC_SUBST(BINDCONFIG)
  # Use this to define _GNU_SOURCE to pull in the IPv6 Advanced Socket API.
  AC_USE_SYSTEM_EXTENSIONS
  
@@ -97,11 +124,11 @@ index 8e9f509..bfe988a 100644
  AC_CONFIG_HEADERS([includes/config.h])
  
 diff --git a/dhcpctl/Makefile.am b/dhcpctl/Makefile.am
-index 9b2486e..784cdf7 100644
+index 0d66971..5b77e90 100644
 --- a/dhcpctl/Makefile.am
 +++ b/dhcpctl/Makefile.am
-@@ -3,19 +3,17 @@ BINDLIBDIR = @BINDDIR@
- AM_CPPFLAGS = -I$(top_srcdir)/includes -I$(top_srcdir)
+@@ -4,23 +4,17 @@ BINDLIBISCCFGDIR=@BINDLIBISCCFGDIR@
+ BINDLIBISCDIR=@BINDLIBISCDIR@
  
  bin_PROGRAMS = omshell
 -lib_LIBRARIES = libdhcpctl.a
@@ -112,27 +139,31 @@ index 9b2486e..784cdf7 100644
  
  omshell_SOURCES = omshell.c
 -omshell_LDADD = libdhcpctl.a ../common/libdhcp.a ../omapip/libomapi.a \
--	        $(BINDLIBDIR)/libirs.a $(BINDLIBDIR)/libdns.a \
--	        $(BINDLIBDIR)/libisccfg.a $(BINDLIBDIR)/libisc.a
+-		$(BINDLIBIRSDIR)/libirs.a \
+-		$(BINDLIBDNSDIR)/libdns.a \
+-	        $(BINDLIBISCCFGDIR)/libisccfg.a \
+-		$(BINDLIBISCDIR)/libisc.a
 +omshell_LDADD = libdhcpctl.la ../common/libdhcp.a ../omapip/libomapi.la \
-+	        -L$(BINDLIBDIR) -lirs -ldns -lisccfg -lisc
++               -L$(BINDDIR) -lirs -ldns -lisccfg -lisc
  
 -libdhcpctl_a_SOURCES = dhcpctl.c callback.c remote.c
 +libdhcpctl_la_SOURCES = dhcpctl.c callback.c remote.c
  
  cltest_SOURCES = cltest.c
 -cltest_LDADD = libdhcpctl.a ../common/libdhcp.a ../omapip/libomapi.a \
--	       $(BINDLIBDIR)/libirs.a $(BINDLIBDIR)/libdns.a \
--               $(BINDLIBDIR)/libisccfg.a $(BINDLIBDIR)/libisc.a
+-	       $(BINDLIBIRSDIR)/libirs.a \
+-	       $(BINDLIBDNSDIR)/libdns.a \
+-	       $(BINDLIBISCCFGDIR)/libisccfg.a \
+-	       $(BINDLIBISCDIR)/libisc.a
 +cltest_LDADD = libdhcpctl.la ../common/libdhcp.a ../omapip/libomapi.la \
-+	       -L$(BINDLIBDIR) -lirs -ldns -lisccfg -lisc
++              -L$(BINDDIR) -lirs -ldns -lisccfg -lisc
 diff --git a/omapip/Makefile.am b/omapip/Makefile.am
-index e4a8599..c0c7a1e 100644
+index 5b61581..9a40f1e 100644
 --- a/omapip/Makefile.am
 +++ b/omapip/Makefile.am
-@@ -1,10 +1,10 @@
- BINDLIBDIR = @BINDDIR@
- AM_CPPFLAGS = -I$(top_srcdir)/includes
+@@ -3,10 +3,10 @@ BINDLIBDNSDIR=@BINDLIBDNSDIR@
+ BINDLIBISCCFGDIR=@BINDLIBISCCFGDIR@
+ BINDLIBISCDIR=@BINDLIBISCDIR@
  
 -lib_LIBRARIES = libomapi.a
 +lib_LTLIBRARIES = libomapi.la
@@ -140,66 +171,75 @@ index e4a8599..c0c7a1e 100644
  
 -libomapi_a_SOURCES = protocol.c buffer.c alloc.c result.c connection.c \
 +libomapi_la_SOURCES = protocol.c buffer.c alloc.c result.c connection.c \
- 		     errwarn.c listener.c dispatch.c generic.c support.c \
- 		     handle.c message.c convert.c hash.c auth.c inet_addr.c \
- 		     array.c trace.c toisc.c iscprint.c isclib.c
-@@ -13,6 +13,5 @@ man_MANS = omapi.3
+ 		       errwarn.c listener.c dispatch.c generic.c support.c \
+ 		       handle.c message.c convert.c hash.c auth.c inet_addr.c \
+ 		       array.c trace.c toisc.c iscprint.c isclib.c
+@@ -15,8 +15,5 @@ man_MANS = omapi.3
  EXTRA_DIST = $(man_MANS)
  
  svtest_SOURCES = test.c
--svtest_LDADD = libomapi.a $(BINDLIBDIR)/libirs.a $(BINDLIBDIR)/libdns.a \
--		$(BINDLIBDIR)/libisccfg.a $(BINDLIBDIR)/libisc.a
-+svtest_LDADD = libomapi.la -L$(BINDLIBDIR) -lirs -ldns -lisccfg -lisc
- 
+-svtest_LDADD = libomapi.a \
+-	       $(BINDLIBIRSDIR)/libirs.a \
+-	       $(BINDLIBDNSDIR)/libdns.a \
+-	       $(BINDLIBISCCFGDIR)/libisccfg.a \
+-	       $(BINDLIBISCDIR)/libisc.a
++svtest_LDADD = libomapi.la \
++		-L$(BINDDIR) -lirs -ldns -lisccfg -lisc
 diff --git a/relay/Makefile.am b/relay/Makefile.am
-index b3bf578..f47009f 100644
+index 2ba5979..2c1fb38 100644
 --- a/relay/Makefile.am
 +++ b/relay/Makefile.am
-@@ -4,9 +4,8 @@ AM_CPPFLAGS = -DLOCALSTATEDIR='"@localstatedir@"' -I$(top_srcdir)/includes
+@@ -2,11 +2,8 @@ AM_CPPFLAGS = -DLOCALSTATEDIR='"@localstatedir@"'
  
  sbin_PROGRAMS = dhcrelay
  dhcrelay_SOURCES = dhcrelay.c
--dhcrelay_LDADD = ../common/libdhcp.a ../omapip/libomapi.a \
--		 $(BINDLIBDIR)/libirs.a $(BINDLIBDIR)/libdns.a \
--		 $(BINDLIBDIR)/libisccfg.a $(BINDLIBDIR)/libisc.a
-+dhcrelay_LDADD = ../common/libdhcp.a ../omapip/libomapi.la \
-+		 -L$(BINDLIBDIR) -lirs -ldns -lisccfg -lisc
+-dhcrelay_LDADD = ../common/libdhcp.@A@ ../omapip/libomapi.@A@ \
+-		 @BINDLIBIRSDIR@/libirs.@A@ \
+-		 @BINDLIBDNSDIR@/libdns.@A@ \
+-		 @BINDLIBISCCFGDIR@/libisccfg.@A@ \
+-		 @BINDLIBISCDIR@/libisc.@A@
++dhcrelay_LDADD = ../common/libdhcp.@A@ ../omapip/libomapi.la \
++		 -L$(BINDDIR) -lirs -ldns -lisccfg -lisc
  man_MANS = dhcrelay.8
  EXTRA_DIST = $(man_MANS)
  
 diff --git a/server/Makefile.am b/server/Makefile.am
-index b5d8c2d..d7f876d 100644
+index 787efca..d533715 100644
 --- a/server/Makefile.am
 +++ b/server/Makefile.am
-@@ -15,10 +15,9 @@ dhcpd_SOURCES = dhcpd.c dhcp.c bootp.c confpars.c db.c class.c failover.c \
+@@ -13,12 +13,9 @@ dhcpd_SOURCES = dhcpd.c dhcp.c bootp.c confpars.c db.c class.c failover.c \
  		dhcpv6.c mdb6.c ldap.c ldap_casa.c leasechain.c ldap_krb_helper.c
  
  dhcpd_CFLAGS = $(LDAP_CFLAGS)
--dhcpd_LDADD = ../common/libdhcp.a ../omapip/libomapi.a \
--	      ../dhcpctl/libdhcpctl.a $(BINDLIBDIR)/libirs.a \
--	      $(BINDLIBDIR)/libdns.a $(BINDLIBDIR)/libisccfg.a \
--	      $(BINDLIBDIR)/libisc.a $(LDAP_LIBS)
-+dhcpd_LDADD = ../common/libdhcp.a ../omapip/libomapi.la \
-+	      ../dhcpctl/libdhcpctl.la -L$(BINDLIBDIR) \
+-dhcpd_LDADD = ../common/libdhcp.@A@ ../omapip/libomapi.@A@ \
+-	      ../dhcpctl/libdhcpctl.@A@ \
+-	      $(BINDLIBIRSDIR)/libirs.@A@ \
+-	      $(BINDLIBDNSDIR)/libdns.@A@ \
+-	      $(BINDLIBISCCFGDIR)/libisccfg.@A@ \
+-	      $(BINDLIBISCDIR)/libisc.@A@ $(LDAP_LIBS)
++dhcpd_LDADD = ../common/libdhcp.@A@ ../omapip/libomapi.la \
++	      ../dhcpctl/libdhcpctl.la -L$(BINDDIR) \
 +	      -lirs -ldns -lisccfg -lisc $(LDAP_LIBS)
  
  man_MANS = dhcpd.8 dhcpd.conf.5 dhcpd.leases.5
  EXTRA_DIST = $(man_MANS)
 diff --git a/server/tests/Makefile.am b/server/tests/Makefile.am
-index 9821081..de95872 100644
+index 699a0b6..78e81c6 100644
 --- a/server/tests/Makefile.am
 +++ b/server/tests/Makefile.am
-@@ -19,10 +19,9 @@ DHCPSRC = ../dhcp.c ../bootp.c ../confpars.c ../db.c ../class.c      \
-           ../ddns.c ../dhcpleasequery.c ../dhcpv6.c ../mdb6.c        \
+@@ -18,12 +18,9 @@ DHCPSRC = ../dhcp.c ../bootp.c ../confpars.c ../db.c ../class.c      \
            ../ldap.c ../ldap_casa.c ../dhcpd.c ../leasechain.c
  
--DHCPLIBS = $(top_builddir)/common/libdhcp.a $(top_builddir)/omapip/libomapi.a \
--          $(top_builddir)/dhcpctl/libdhcpctl.a $(BINDLIBDIR)/libirs.a \
--	  $(BINDLIBDIR)/libdns.a $(BINDLIBDIR)/libisccfg.a \
--	  $(BINDLIBDIR)/libisc.a
-+DHCPLIBS = $(top_builddir)/common/libdhcp.a $(top_builddir)/omapip/libomapi.la \
-+          $(top_builddir)/dhcpctl/libdhcpctl.la \
-+          -L$(BINDLIBDIR) -lirs -ldns -lisccfg -lisc
+ DHCPLIBS = $(top_builddir)/common/libdhcp.@A@ \
+-	  $(top_builddir)/omapip/libomapi.@A@ \
+-          $(top_builddir)/dhcpctl/libdhcpctl.@A@ \
+-	  $(BINDLIBIRSDIR)/libirs.@A@ \
+-	  $(BINDLIBDNSDIR)/libdns.@A@ \
+-	  $(BINDLIBISCCFGDIR)/libisccfg.@A@ \
+-	  $(BINDLIBISCDIR)/libisc.@A@
++	  $(top_builddir)/omapip/libomapi.la \
++	  $(top_builddir)/dhcpctl/libdhcpctl.la \
++	  -L$(BINDDIR) -lirs -ldns -lisccfg -lisc
  
  ATF_TESTS =
  if HAVE_ATF
diff --git a/meta/recipes-connectivity/dhcp/dhcp/0011-Moved-the-call-to-isc_app_ctxstart-to-not-get-signal.patch b/meta/recipes-connectivity/dhcp/dhcp/0011-Moved-the-call-to-isc_app_ctxstart-to-not-get-signal.patch
deleted file mode 100644
index 67bb463..0000000
--- a/meta/recipes-connectivity/dhcp/dhcp/0011-Moved-the-call-to-isc_app_ctxstart-to-not-get-signal.patch
+++ /dev/null
@@ -1,81 +0,0 @@
-From 37725f3e22edb50e0ca2d1fff971321a5a4d5112 Mon Sep 17 00:00:00 2001
-From: Hongxu Jia <hongxu.jia@windriver.com>
-Date: Wed, 12 Jul 2017 03:05:13 -0400
-Subject: [PATCH 11/11] Moved the call to isc_app_ctxstart() to not get signal
- block by all threads
-
-Signed-off-by: Francis Dupont <fdupont@isc.org>
-
-In https://source.isc.org/git/bind9.git, since the following
-commit applied:
-...
-commit b99bfa184bc9375421b5df915eea7dfac6a68a99
-Author: Evan Hunt <each@isc.org>
-Date:   Wed Apr 10 13:49:57 2013 -0700
-
-    [master] unify internal and export libraries
-
-    3550.       [func]          Unified the internal and export versions of the
-                        BIND libraries, allowing external clients to use
-                        the same libraries as BIND. [RT #33131]
-...
-(git show b99bfa184bc9375421b5df915eea7dfac6a68a99 -- ./lib/isc/unix/app.c)
-
-In this commit, if bind9 enable threads(ISC_PLATFORM_USETHREADS),
-it blocks signal SIGHUP, SIGINT and SIGTERM in isc__app_ctxstart.
-Which caused dhclient/dhcpd could not be stopped by SIGTERM.
-
-It caused systemd's reboot hung which send SIGTERM by default.
-
-Upstream-Status: Backport [https://source.isc.org/git/dhcp.git]
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
----
- omapip/isclib.c | 25 +++++++++++++++----------
- 1 file changed, 15 insertions(+), 10 deletions(-)
-
-diff --git a/omapip/isclib.c b/omapip/isclib.c
-index ce86490..6a04345 100644
---- a/omapip/isclib.c
-+++ b/omapip/isclib.c
-@@ -185,16 +185,6 @@ dhcp_context_create(int flags,
- 		if (result != ISC_R_SUCCESS)
- 			goto cleanup;
- 
--		result = isc_app_ctxstart(dhcp_gbl_ctx.actx);
--		if (result != ISC_R_SUCCESS)
--			return (result);
--		dhcp_gbl_ctx.actx_started = ISC_TRUE;
--
--		/* Not all OSs support suppressing SIGPIPE through socket
--		 * options, so set the sigal action to be ignore.  This allows
--		 * broken connections to fail gracefully with EPIPE on writes */
--		handle_signal(SIGPIPE, SIG_IGN);
--
- 		result = isc_taskmgr_createinctx(dhcp_gbl_ctx.mctx,
- 						 dhcp_gbl_ctx.actx,
- 						 1, 0,
-@@ -217,6 +207,21 @@ dhcp_context_create(int flags,
- 		result = isc_task_create(dhcp_gbl_ctx.taskmgr, 0, &dhcp_gbl_ctx.task);
- 		if (result != ISC_R_SUCCESS)
- 			goto cleanup;
-+
-+		result = isc_app_ctxstart(dhcp_gbl_ctx.actx);
-+		if (result != ISC_R_SUCCESS)
-+			return (result);
-+		dhcp_gbl_ctx.actx_started = ISC_TRUE;
-+
-+		/* Not all OSs support suppressing SIGPIPE through socket
-+		 * options, so set the sigal action to be ignore.  This allows
-+		 * broken connections to fail gracefully with EPIPE on writes */
-+		handle_signal(SIGPIPE, SIG_IGN);
-+
-+		/* Reset handlers installed by isc_app_ctxstart()
-+		 * to default for control-c and kill */
-+		handle_signal(SIGINT, SIG_DFL);
-+		handle_signal(SIGTERM, SIG_DFL);
- 	}
- 
- #if defined (NSUPDATE)
--- 
-1.8.3.1
-
diff --git a/meta/recipes-connectivity/dhcp/dhcp/0012-dhcp-correct-the-intention-for-xml2-lib-search.patch b/meta/recipes-connectivity/dhcp/dhcp/0012-dhcp-correct-the-intention-for-xml2-lib-search.patch
index 2d3af9d..5c8a368 100644
--- a/meta/recipes-connectivity/dhcp/dhcp/0012-dhcp-correct-the-intention-for-xml2-lib-search.patch
+++ b/meta/recipes-connectivity/dhcp/dhcp/0012-dhcp-correct-the-intention-for-xml2-lib-search.patch
@@ -1,7 +1,7 @@
-From 501543b3ef715488a142e3d301ff2733aa33eec7 Mon Sep 17 00:00:00 2001
+From 0adf1dea52007cdfb72520c87485c7cb0af9cd1f Mon Sep 17 00:00:00 2001
 From: Awais Belal <awais_belal@mentor.com>
 Date: Wed, 25 Oct 2017 21:00:05 +0500
-Subject: [PATCH] dhcp: correct the intention for xml2 lib search
+Subject: [PATCH 11/11] dhcp: correct the intention for xml2 lib search
 
 A missing case breaks the build when libxml2 is
 required and found appropriately. The third argument
@@ -20,10 +20,10 @@ Signed-off-by: Awais Belal <awais_belal@mentor.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index bfe988a..f0459e6 100644
+index 97fc39c..42de9e7 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -608,7 +608,7 @@ AC_ARG_WITH(libxml2,
+@@ -639,7 +639,7 @@ AC_ARG_WITH(libxml2,
  	with_libxml2="$withval", with_libxml2="no")
  
  if test x$with_libxml2 != xno; then
@@ -33,5 +33,5 @@ index bfe988a..f0459e6 100644
  			AC_MSG_FAILURE([*** Cannot find xmlTextWriterStartElement with -lxml2 and libxml2 was requested])
  		fi])
 -- 
-2.11.1
+1.8.3.1
 
diff --git a/meta/recipes-connectivity/dhcp/dhcp_4.3.6.bb b/meta/recipes-connectivity/dhcp/dhcp_4.4.1.bb
similarity index 79%
rename from meta/recipes-connectivity/dhcp/dhcp_4.3.6.bb
rename to meta/recipes-connectivity/dhcp/dhcp_4.4.1.bb
index 6615ae2..bc5d5db 100644
--- a/meta/recipes-connectivity/dhcp/dhcp_4.3.6.bb
+++ b/meta/recipes-connectivity/dhcp/dhcp_4.4.1.bb
@@ -10,12 +10,11 @@ SRC_URI += "file://0001-define-macro-_PATH_DHCPD_CONF-and-_PATH_DHCLIENT_CON.pat
             file://0008-tweak-to-support-external-bind.patch \
             file://0009-remove-dhclient-script-bash-dependency.patch \
             file://0010-build-shared-libs.patch \
-            file://0011-Moved-the-call-to-isc_app_ctxstart-to-not-get-signal.patch \
             file://0012-dhcp-correct-the-intention-for-xml2-lib-search.patch \
            "
 
-SRC_URI[md5sum] = "afa6e9b3eb7539ea048421a82c668adc"
-SRC_URI[sha256sum] = "a41eaf6364f1377fe065d35671d9cf82bbbc8f21207819b2b9f33f652aec6f1b"
+SRC_URI[md5sum] = "18c7f4dcbb0a63df25098216d47b1ede"
+SRC_URI[sha256sum] = "2a22508922ab367b4af4664a0472dc220cc9603482cf3c16d9aff14f3a76b608"
 
 PACKAGECONFIG ?= ""
 PACKAGECONFIG[bind-httpstats] = "--with-libxml2,--without-libxml2,libxml2"
-- 
2.8.1


