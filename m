Return-Path: <Ming.Liu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 1296F701AC
	for <openembedded-core@lists.openembedded.org>;
	Sat,  5 Jul 2014 06:06:25 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s6566Q8k018514
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 4 Jul 2014 23:06:26 -0700 (PDT)
Received: from PEK-MLIU3-D1.corp.ad.wrs.com (128.224.163.186) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.169.1; Fri, 4 Jul 2014 23:06:26 -0700
From: Ming Liu <ming.liu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sat, 5 Jul 2014 14:06:23 +0800
Message-ID: <1404540383-13425-1-git-send-email-ming.liu@windriver.com>
X-Mailer: git-send-email 1.8.4.1
MIME-Version: 1.0
Subject: [PATCH] gconf: fix multilib conflict - org.gnome.GConf.service
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
X-List-Received-Date: Sat, 05 Jul 2014 06:06:27 -0000
Content-Type: text/plain

Fix following error:
error: file /usr/share/dbus-1/services/org.gnome.GConf.service from
install of gconf-3.2.6-r0.0.lib32_x86 conflicts with file from package
gconf-3.2.6-r0.0.x86_64

Signed-off-by: Ming Liu <ming.liu@windriver.com>
---
 .../gnome/gconf/fix-multilib-conflicts.patch       | 33 ++++++++++++++++++++++
 meta/recipes-gnome/gnome/gconf_3.2.6.bb            |  4 +++
 2 files changed, 37 insertions(+)
 create mode 100644 meta/recipes-gnome/gnome/gconf/fix-multilib-conflicts.patch

diff --git a/meta/recipes-gnome/gnome/gconf/fix-multilib-conflicts.patch b/meta/recipes-gnome/gnome/gconf/fix-multilib-conflicts.patch
new file mode 100644
index 0000000..b67157e
--- /dev/null
+++ b/meta/recipes-gnome/gnome/gconf/fix-multilib-conflicts.patch
@@ -0,0 +1,33 @@
+Upstream-Status: Inappropriate [embebbed]
+
+Signed-off-by: Ming Liu <ming.liu@windriver.com>
+
+--- a/gconf/Makefile.am
++++ b/gconf/Makefile.am
+@@ -27,8 +27,7 @@ EFENCE=
+ 
+ lib_LTLIBRARIES = libgconf-2.la
+ 
+-bin_PROGRAMS = gconftool-2 
+-libexec_PROGRAMS = gconfd-2
++bin_PROGRAMS = gconftool-2 gconfd-2 
+ 
+ CORBA_SOURCECODE = GConfX-common.c GConfX-skels.c GConfX-stubs.c GConfX.h
+ 
+@@ -168,7 +167,7 @@ default.path: $(srcdir)/default.path.in
+ 	sed -e 's,[@]sysgconfdir[@],$(sysgconfdir),g' \
+ 		<$(srcdir)/default.path.in >default.path
+ org.gnome.GConf.service:  $(srcdir)/org.gnome.GConf.service.in
+-	sed -e 's,[@]libexecdir[@],$(libexecdir),g' \
++	sed -e 's,[@]bindir[@],$(bindir),g' \
+ 		<$(srcdir)/org.gnome.GConf.service.in >org.gnome.GConf.service
+ 
+ servicedir = $(datadir)/dbus-1/services
+
+--- a/gconf/org.gnome.GConf.service.in
++++ b/gconf/org.gnome.GConf.service.in
+@@ -1,3 +1,3 @@
+ [D-BUS Service]
+ Name=org.gnome.GConf
+-Exec=@libexecdir@/gconfd-2
++Exec=@bindir@/gconfd-2
diff --git a/meta/recipes-gnome/gnome/gconf_3.2.6.bb b/meta/recipes-gnome/gnome/gconf_3.2.6.bb
index 17fdafa..e932746 100644
--- a/meta/recipes-gnome/gnome/gconf_3.2.6.bb
+++ b/meta/recipes-gnome/gnome/gconf_3.2.6.bb
@@ -9,9 +9,13 @@ DEPENDS_class-native = "glib-2.0-native dbus-native dbus-glib-native libxml2-nat
 
 inherit gnomebase gtk-doc gettext
 
+GCONF_FIX_MULTILIB_PATCH = ""
+GCONF_FIX_MULTILIB_PATCH_class-target = "file://fix-multilib-conflicts.patch"
+
 SRC_URI = "${GNOME_MIRROR}/GConf/${@gnome_verdir("${PV}")}/GConf-${PV}.tar.xz;name=archive \
            file://remove_plus_from_invalid_characters_list.patch \
            file://unable-connect-dbus.patch \
+           ${GCONF_FIX_MULTILIB_PATCH} \
 "
 
 SRC_URI[archive.md5sum] = "2b16996d0e4b112856ee5c59130e822c"
-- 
1.8.4.1


