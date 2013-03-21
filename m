Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard@rpsys.net>) id 1UIi6P-0006N1-AZ
	for openembedded-core@lists.openembedded.org;
	Thu, 21 Mar 2013 17:12:31 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r2LG4s0C009104; Thu, 21 Mar 2013 16:04:57 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id MQXmvF03Icab; Thu, 21 Mar 2013 16:04:57 +0000 (GMT)
Received: from ted (bebox.config [93.97.175.187] (may be forged))
	(authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r2LG4n0W009089
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Thu, 21 Mar 2013 16:04:51 GMT
Received: from richard by ted with local (Exim 4.80)
	(envelope-from <richard@dan.rpsys.net>)
	id 1UIhpo-0006Mc-84; Thu, 21 Mar 2013 15:55:20 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 21 Mar 2013 15:55:13 +0000
Message-Id: <1363881315-24352-14-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1363881315-24352-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1363881315-24352-1-git-send-email-richard.purdie@linuxfoundation.org>
Subject: [PATCH 14/16] dhcp: Fix case where ${B} != ${S}
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
X-List-Received-Date: Thu, 21 Mar 2013 16:13:20 -0000

Add patch to allow out of tree builds to work.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../dhcp/dhcp-4.2.5/fixsepbuild.patch              |   90 ++++++++++++++++++++
 meta/recipes-connectivity/dhcp/dhcp_4.2.5.bb       |    1 +
 2 files changed, 91 insertions(+)
 create mode 100644 meta/recipes-connectivity/dhcp/dhcp-4.2.5/fixsepbuild.patch

diff --git a/meta/recipes-connectivity/dhcp/dhcp-4.2.5/fixsepbuild.patch b/meta/recipes-connectivity/dhcp/dhcp-4.2.5/fixsepbuild.patch
new file mode 100644
index 0000000..e686afd
--- /dev/null
+++ b/meta/recipes-connectivity/dhcp/dhcp-4.2.5/fixsepbuild.patch
@@ -0,0 +1,90 @@
+Fix out of tree builds
+
+Upstream-Status: Pending
+
+RP 2013/03/21
+
+Index: dhcp-4.2.5/common/Makefile.am
+===================================================================
+--- dhcp-4.2.5.orig/common/Makefile.am	2013-03-21 12:54:11.345063519 +0000
++++ dhcp-4.2.5/common/Makefile.am	2013-03-21 12:54:11.805063510 +0000
+@@ -1,4 +1,4 @@
+-AM_CPPFLAGS = -I.. -DLOCALSTATEDIR='"@localstatedir@"'
++AM_CPPFLAGS = -I$(top_srcdir)/includes -I$(top_srcdir) -DLOCALSTATEDIR='"@localstatedir@"'
+ AM_CFLAGS = $(LDAP_CFLAGS)
+ 
+ noinst_LIBRARIES = libdhcp.a
+Index: dhcp-4.2.5/dst/Makefile.am
+===================================================================
+--- dhcp-4.2.5.orig/dst/Makefile.am	2013-03-21 12:54:11.345063519 +0000
++++ dhcp-4.2.5/dst/Makefile.am	2013-03-21 12:54:11.805063510 +0000
+@@ -1,4 +1,4 @@
+-AM_CPPFLAGS = -DMINIRES_LIB -DHMAC_MD5
++AM_CPPFLAGS = -DMINIRES_LIB -DHMAC_MD5 -I$(top_srcdir)/includes
+ 
+ lib_LIBRARIES = libdst.a
+ 
+Index: dhcp-4.2.5/omapip/Makefile.am
+===================================================================
+--- dhcp-4.2.5.orig/omapip/Makefile.am	2013-03-21 12:54:11.677063511 +0000
++++ dhcp-4.2.5/omapip/Makefile.am	2013-03-21 12:54:11.809063510 +0000
+@@ -1,3 +1,5 @@
++AM_CPPFLAGS = -I$(top_srcdir)/includes
++
+ lib_LIBRARIES = libomapi.a
+ noinst_PROGRAMS = svtest
+ 
+Index: dhcp-4.2.5/client/Makefile.am
+===================================================================
+--- dhcp-4.2.5.orig/client/Makefile.am	2013-03-21 12:54:11.677063511 +0000
++++ dhcp-4.2.5/client/Makefile.am	2013-03-21 12:54:11.809063510 +0000
+@@ -1,3 +1,5 @@
++AM_CPPFLAGS = -I$(top_srcdir)/includes
++
+ dist_sysconf_DATA = dhclient.conf.example
+ sbin_PROGRAMS = dhclient
+ dhclient_SOURCES = clparse.c dhclient.c dhc6.c \
+@@ -11,8 +13,8 @@
+ 
+ dhclient.o: dhclient.c
+ 	$(COMPILE) -DCLIENT_PATH='"PATH=$(sbindir):/sbin:/bin:/usr/sbin:/usr/bin"' \
+-		   -DLOCALSTATEDIR='"$(localstatedir)"' -c dhclient.c
++		   -DLOCALSTATEDIR='"$(localstatedir)"' -c $(srcdir)/dhclient.c
+ 
+ dhc6.o: dhc6.c
+ 	$(COMPILE) -DCLIENT_PATH='"PATH=$(sbindir):/sbin:/bin:/usr/sbin:/usr/bin"' \
+-		   -DLOCALSTATEDIR='"$(localstatedir)"' -c dhc6.c
++		   -DLOCALSTATEDIR='"$(localstatedir)"' -c $(srcdir)/dhc6.c
+Index: dhcp-4.2.5/dhcpctl/Makefile.am
+===================================================================
+--- dhcp-4.2.5.orig/dhcpctl/Makefile.am	2013-03-21 12:54:11.677063511 +0000
++++ dhcp-4.2.5/dhcpctl/Makefile.am	2013-03-21 12:54:11.809063510 +0000
+@@ -1,3 +1,5 @@
++AM_CPPFLAGS = -I$(top_srcdir)/includes -I$(top_srcdir)
++
+ bin_PROGRAMS = omshell
+ lib_LIBRARIES = libdhcpctl.a
+ noinst_PROGRAMS = cltest
+Index: dhcp-4.2.5/relay/Makefile.am
+===================================================================
+--- dhcp-4.2.5.orig/relay/Makefile.am	2013-03-21 12:54:11.677063511 +0000
++++ dhcp-4.2.5/relay/Makefile.am	2013-03-21 12:54:11.809063510 +0000
+@@ -1,4 +1,4 @@
+-AM_CPPFLAGS = -DLOCALSTATEDIR='"@localstatedir@"'
++AM_CPPFLAGS = -DLOCALSTATEDIR='"@localstatedir@"' -I$(top_srcdir)/includes
+ 
+ sbin_PROGRAMS = dhcrelay
+ dhcrelay_SOURCES = dhcrelay.c
+Index: dhcp-4.2.5/server/Makefile.am
+===================================================================
+--- dhcp-4.2.5.orig/server/Makefile.am	2013-03-21 12:54:11.677063511 +0000
++++ dhcp-4.2.5/server/Makefile.am	2013-03-21 12:55:01.509062081 +0000
+@@ -4,7 +4,7 @@
+ # production code. Sadly, we are not there yet.
+ SUBDIRS = . tests
+ 
+-AM_CPPFLAGS = -I.. -DLOCALSTATEDIR='"@localstatedir@"'
++AM_CPPFLAGS = -I$(top_srcdir) -DLOCALSTATEDIR='"@localstatedir@"' -I$(top_srcdir)/includes
+ 
+ dist_sysconf_DATA = dhcpd.conf.example
+ sbin_PROGRAMS = dhcpd
diff --git a/meta/recipes-connectivity/dhcp/dhcp_4.2.5.bb b/meta/recipes-connectivity/dhcp/dhcp_4.2.5.bb
index 0f247ae..3ec9f3b 100644
--- a/meta/recipes-connectivity/dhcp/dhcp_4.2.5.bb
+++ b/meta/recipes-connectivity/dhcp/dhcp_4.2.5.bb
@@ -6,6 +6,7 @@ SRC_URI += "file://fixincludes.patch \
             file://dhcp-3.0.3-dhclient-dbus.patch;striplevel=0 \
             file://fix-external-bind.patch \
             file://link-with-lcrypto.patch \
+            file://fixsepbuild.patch \
            "
 
 SRC_URI[md5sum] = "6489e919ac093d17249270ee9be1020e"
-- 
1.7.10.4



