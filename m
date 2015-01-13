Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id A60A172B7E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Jan 2015 05:44:39 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id t0D5ida5003257
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL);
	Mon, 12 Jan 2015 21:44:39 -0800 (PST)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Mon, 12 Jan 2015 21:44:39 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>
Date: Tue, 13 Jan 2015 13:44:06 +0800
Message-ID: <82b71300ef03d89b22976dcb6a2511bdecbc0b9e.1421127484.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1421127484.git.hongxu.jia@windriver.com>
References: <cover.1421127484.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 06/10] dhcp: upgrade to 4.3.1
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
X-List-Received-Date: Tue, 13 Jan 2015 05:44:39 -0000
Content-Type: text/plain

Rebase fixsepbuild.patch to 4.3.1

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../dhcp/dhcp/fixsepbuild.patch                    | 112 ++++++++++++---------
 .../dhcp/{dhcp_4.3.0.bb => dhcp_4.3.1.bb}          |   4 +-
 2 files changed, 67 insertions(+), 49 deletions(-)
 rename meta/recipes-connectivity/dhcp/{dhcp_4.3.0.bb => dhcp_4.3.1.bb} (70%)

diff --git a/meta/recipes-connectivity/dhcp/dhcp/fixsepbuild.patch b/meta/recipes-connectivity/dhcp/dhcp/fixsepbuild.patch
index e686afd..14e75a3 100644
--- a/meta/recipes-connectivity/dhcp/dhcp/fixsepbuild.patch
+++ b/meta/recipes-connectivity/dhcp/dhcp/fixsepbuild.patch
@@ -4,47 +4,32 @@ Upstream-Status: Pending
 
 RP 2013/03/21
 
-Index: dhcp-4.2.5/common/Makefile.am
-===================================================================
---- dhcp-4.2.5.orig/common/Makefile.am	2013-03-21 12:54:11.345063519 +0000
-+++ dhcp-4.2.5/common/Makefile.am	2013-03-21 12:54:11.805063510 +0000
-@@ -1,4 +1,4 @@
--AM_CPPFLAGS = -I.. -DLOCALSTATEDIR='"@localstatedir@"'
-+AM_CPPFLAGS = -I$(top_srcdir)/includes -I$(top_srcdir) -DLOCALSTATEDIR='"@localstatedir@"'
- AM_CFLAGS = $(LDAP_CFLAGS)
- 
- noinst_LIBRARIES = libdhcp.a
-Index: dhcp-4.2.5/dst/Makefile.am
-===================================================================
---- dhcp-4.2.5.orig/dst/Makefile.am	2013-03-21 12:54:11.345063519 +0000
-+++ dhcp-4.2.5/dst/Makefile.am	2013-03-21 12:54:11.805063510 +0000
-@@ -1,4 +1,4 @@
--AM_CPPFLAGS = -DMINIRES_LIB -DHMAC_MD5
-+AM_CPPFLAGS = -DMINIRES_LIB -DHMAC_MD5 -I$(top_srcdir)/includes
- 
- lib_LIBRARIES = libdst.a
- 
-Index: dhcp-4.2.5/omapip/Makefile.am
-===================================================================
---- dhcp-4.2.5.orig/omapip/Makefile.am	2013-03-21 12:54:11.677063511 +0000
-+++ dhcp-4.2.5/omapip/Makefile.am	2013-03-21 12:54:11.809063510 +0000
-@@ -1,3 +1,5 @@
-+AM_CPPFLAGS = -I$(top_srcdir)/includes
-+
- lib_LIBRARIES = libomapi.a
- noinst_PROGRAMS = svtest
+Rebase to 4.3.1
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ client/Makefile.am  | 6 ++++--
+ common/Makefile.am  | 2 +-
+ dhcpctl/Makefile.am | 2 ++
+ dst/Makefile.am     | 2 +-
+ omapip/Makefile.am  | 2 ++
+ relay/Makefile.am   | 2 +-
+ server/Makefile.am  | 2 +-
+ 7 files changed, 12 insertions(+), 6 deletions(-)
+
+diff --git a/client/Makefile.am b/client/Makefile.am
+index 8411960..1740f72 100644
+--- a/client/Makefile.am
++++ b/client/Makefile.am
+@@ -4,6 +4,8 @@
+ # production code. Sadly, we are not there yet.
+ SUBDIRS = . tests
  
-Index: dhcp-4.2.5/client/Makefile.am
-===================================================================
---- dhcp-4.2.5.orig/client/Makefile.am	2013-03-21 12:54:11.677063511 +0000
-+++ dhcp-4.2.5/client/Makefile.am	2013-03-21 12:54:11.809063510 +0000
-@@ -1,3 +1,5 @@
 +AM_CPPFLAGS = -I$(top_srcdir)/includes
 +
  dist_sysconf_DATA = dhclient.conf.example
  sbin_PROGRAMS = dhclient
  dhclient_SOURCES = clparse.c dhclient.c dhc6.c \
-@@ -11,8 +13,8 @@
+@@ -17,8 +19,8 @@ EXTRA_DIST = $(man_MANS)
  
  dhclient.o: dhclient.c
  	$(COMPILE) -DCLIENT_PATH='"PATH=$(sbindir):/sbin:/bin:/usr/sbin:/usr/bin"' \
@@ -55,30 +40,60 @@ Index: dhcp-4.2.5/client/Makefile.am
  	$(COMPILE) -DCLIENT_PATH='"PATH=$(sbindir):/sbin:/bin:/usr/sbin:/usr/bin"' \
 -		   -DLOCALSTATEDIR='"$(localstatedir)"' -c dhc6.c
 +		   -DLOCALSTATEDIR='"$(localstatedir)"' -c $(srcdir)/dhc6.c
-Index: dhcp-4.2.5/dhcpctl/Makefile.am
-===================================================================
---- dhcp-4.2.5.orig/dhcpctl/Makefile.am	2013-03-21 12:54:11.677063511 +0000
-+++ dhcp-4.2.5/dhcpctl/Makefile.am	2013-03-21 12:54:11.809063510 +0000
+diff --git a/common/Makefile.am b/common/Makefile.am
+index eddef05..5ce045f 100644
+--- a/common/Makefile.am
++++ b/common/Makefile.am
+@@ -1,4 +1,4 @@
+-AM_CPPFLAGS = -I.. -DLOCALSTATEDIR='"@localstatedir@"'
++AM_CPPFLAGS = -I$(top_srcdir)/includes -I$(top_srcdir) -DLOCALSTATEDIR='"@localstatedir@"'
+ AM_CFLAGS = $(LDAP_CFLAGS)
+ 
+ noinst_LIBRARIES = libdhcp.a
+diff --git a/dhcpctl/Makefile.am b/dhcpctl/Makefile.am
+index 2987a53..cd72d75 100644
+--- a/dhcpctl/Makefile.am
++++ b/dhcpctl/Makefile.am
 @@ -1,3 +1,5 @@
 +AM_CPPFLAGS = -I$(top_srcdir)/includes -I$(top_srcdir)
 +
  bin_PROGRAMS = omshell
  lib_LIBRARIES = libdhcpctl.a
  noinst_PROGRAMS = cltest
-Index: dhcp-4.2.5/relay/Makefile.am
-===================================================================
---- dhcp-4.2.5.orig/relay/Makefile.am	2013-03-21 12:54:11.677063511 +0000
-+++ dhcp-4.2.5/relay/Makefile.am	2013-03-21 12:54:11.809063510 +0000
+diff --git a/dst/Makefile.am b/dst/Makefile.am
+index 8937fe8..a14798b 100644
+--- a/dst/Makefile.am
++++ b/dst/Makefile.am
+@@ -1,4 +1,4 @@
+-AM_CPPFLAGS = -DMINIRES_LIB -DHMAC_MD5
++AM_CPPFLAGS = -DMINIRES_LIB -DHMAC_MD5 -I$(top_srcdir)/includes
+ 
+ lib_LIBRARIES = libdst.a
+ 
+diff --git a/omapip/Makefile.am b/omapip/Makefile.am
+index 5074479..9c0fab3 100644
+--- a/omapip/Makefile.am
++++ b/omapip/Makefile.am
+@@ -1,3 +1,5 @@
++AM_CPPFLAGS = -I$(top_srcdir)/includes
++
+ lib_LIBRARIES = libomapi.a
+ noinst_PROGRAMS = svtest
+ 
+diff --git a/relay/Makefile.am b/relay/Makefile.am
+index ec72a31..f842071 100644
+--- a/relay/Makefile.am
++++ b/relay/Makefile.am
 @@ -1,4 +1,4 @@
 -AM_CPPFLAGS = -DLOCALSTATEDIR='"@localstatedir@"'
 +AM_CPPFLAGS = -DLOCALSTATEDIR='"@localstatedir@"' -I$(top_srcdir)/includes
  
  sbin_PROGRAMS = dhcrelay
  dhcrelay_SOURCES = dhcrelay.c
-Index: dhcp-4.2.5/server/Makefile.am
-===================================================================
---- dhcp-4.2.5.orig/server/Makefile.am	2013-03-21 12:54:11.677063511 +0000
-+++ dhcp-4.2.5/server/Makefile.am	2013-03-21 12:55:01.509062081 +0000
+diff --git a/server/Makefile.am b/server/Makefile.am
+index a446f0b..d0b873a 100644
+--- a/server/Makefile.am
++++ b/server/Makefile.am
 @@ -4,7 +4,7 @@
  # production code. Sadly, we are not there yet.
  SUBDIRS = . tests
@@ -88,3 +103,6 @@ Index: dhcp-4.2.5/server/Makefile.am
  
  dist_sysconf_DATA = dhcpd.conf.example
  sbin_PROGRAMS = dhcpd
+-- 
+1.9.1
+
diff --git a/meta/recipes-connectivity/dhcp/dhcp_4.3.0.bb b/meta/recipes-connectivity/dhcp/dhcp_4.3.1.bb
similarity index 70%
rename from meta/recipes-connectivity/dhcp/dhcp_4.3.0.bb
rename to meta/recipes-connectivity/dhcp/dhcp_4.3.1.bb
index 13bcceb..3f82a25 100644
--- a/meta/recipes-connectivity/dhcp/dhcp_4.3.0.bb
+++ b/meta/recipes-connectivity/dhcp/dhcp_4.3.1.bb
@@ -8,5 +8,5 @@ SRC_URI += "file://dhcp-3.0.3-dhclient-dbus.patch;striplevel=0 \
             file://replace-ifconfig-route.patch \
            "
 
-SRC_URI[md5sum] = "1020d77e1a4c1f01b76279caff9beb80"
-SRC_URI[sha256sum] = "a7b6517d5cf32c5e49d2323a63de00efe5391df7cb0045dfa0ec8f6ee46ebe8a"
+SRC_URI[md5sum] = "b3a42ece3c7f2cd2e74a3e12ca881d20"
+SRC_URI[sha256sum] = "266cbca8a7a6bb8f9ccc5765da0d2b04099329314a54a4fc1022d510ad3e9af0"
-- 
1.9.1


