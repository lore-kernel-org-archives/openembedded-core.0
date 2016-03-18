Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id CB2C1731A5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Mar 2016 09:02:52 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u2I92qiG015195
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 18 Mar 2016 02:02:52 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Fri, 18 Mar 2016 02:02:50 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <ross.burton@intel.com>, <richard.purdie@linuxfoundation.org>,
	<raj.khem@gmail.com>
Date: Fri, 18 Mar 2016 05:01:59 -0400
Message-ID: <ced58b296b886bfe1db833e823eb2b80d43e324f.1458282563.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1458282563.git.hongxu.jia@windriver.com>
References: <cover.1458282563.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 17/18] gconf: fix buildpaths QA issue
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
X-List-Received-Date: Fri, 18 Mar 2016 09:02:53 -0000
Content-Type: text/plain

In ${S}/gconf/gconfd.c, we have:
...
  /* -- Debug only */

  if (addresses == NULL)
    {
      gconf_log(GCL_DEBUG, _("gconfd compiled with debugging; trying to load gconf.path from the source directory"));
      conffile = g_strconcat(GCONF_SRCDIR, "/gconf/gconf.path", NULL);
      addresses = gconf_load_source_path(conffile, NULL);
      g_free(conffile);
    }

  /* -- End of Debug Only */
...

- While --enable-debug=yes, the above works, but the released tarball
  did not have gconf.path, so get a copy from git://git.gnome.org/gconf

- Use target path rather than build path to configure above variable
  GCONF_SRCDIR, by setting absolute_top_srcdir in configure.ac.

[YOCTO #7058]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-gnome/gnome/gconf/gconf.path          |  6 +++++
 .../gnome/gconf/use-target-path-for-debug.patch    | 31 ++++++++++++++++++++++
 meta/recipes-gnome/gnome/gconf_3.2.6.bb            | 12 +++++++++
 3 files changed, 49 insertions(+)
 create mode 100644 meta/recipes-gnome/gnome/gconf/gconf.path
 create mode 100644 meta/recipes-gnome/gnome/gconf/use-target-path-for-debug.patch

diff --git a/meta/recipes-gnome/gnome/gconf/gconf.path b/meta/recipes-gnome/gnome/gconf/gconf.path
new file mode 100644
index 0000000..573ec68
--- /dev/null
+++ b/meta/recipes-gnome/gnome/gconf/gconf.path
@@ -0,0 +1,6 @@
+# This file stores the addresses of config sources for GConf
+# When a value is stored or requested, the sources are scanned from top to
+# bottom, and the first one to have a value for the key (or the first one
+# to be writeable) is used to load/store the data.
+# You can also use include statements
+xml:readwrite:$(DEFAULTUSERSOURCE)
diff --git a/meta/recipes-gnome/gnome/gconf/use-target-path-for-debug.patch b/meta/recipes-gnome/gnome/gconf/use-target-path-for-debug.patch
new file mode 100644
index 0000000..0698831
--- /dev/null
+++ b/meta/recipes-gnome/gnome/gconf/use-target-path-for-debug.patch
@@ -0,0 +1,31 @@
+From 7d03ad64b6a8fd2897b07a92c66a15e871f2efe9 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Wed, 2 Mar 2016 03:19:50 -0500
+Subject: [PATCH] use target path for debugging
+
+The variable absolute_top_srcdir is used for
+debugging purposes, use target path rather
+than build path for cross complication.
+
+Upstream-Status: Inappropriate [openembedded specific]
+
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 69a57e6..1b0739f 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -365,7 +365,7 @@ AC_SUBST(CPPFLAGS)
+ AC_SUBST(LDFLAGS)
+ 
+ ## Just for debugging purposes
+-absolute_top_srcdir=`pwd`
++absolute_top_srcdir="/usr/src/${S##*/}"
+ AC_SUBST(absolute_top_srcdir)
+ 
+ AC_CONFIG_FILES([
+-- 
+1.9.1
+
diff --git a/meta/recipes-gnome/gnome/gconf_3.2.6.bb b/meta/recipes-gnome/gnome/gconf_3.2.6.bb
index feaf080..d5dc0b7 100644
--- a/meta/recipes-gnome/gnome/gconf_3.2.6.bb
+++ b/meta/recipes-gnome/gnome/gconf_3.2.6.bb
@@ -10,6 +10,8 @@ inherit gnomebase gtk-doc gettext gobject-introspection
 SRC_URI = "${GNOME_MIRROR}/GConf/${@gnome_verdir("${PV}")}/GConf-${PV}.tar.xz;name=archive \
            file://remove_plus_from_invalid_characters_list.patch \
            file://unable-connect-dbus.patch \
+           file://use-target-path-for-debug.patch \
+           file://gconf.path \
 "
 
 SRC_URI[archive.md5sum] = "2b16996d0e4b112856ee5c59130e822c"
@@ -17,6 +19,7 @@ SRC_URI[archive.sha256sum] = "1912b91803ab09a5eed34d364bf09fe3a2a9c96751fde03a4e
 
 S = "${WORKDIR}/GConf-${PV}"
 
+CACHED_CONFIGUREVARS += "S=${S}"
 EXTRA_OECONF = "--enable-shared --disable-static --enable-debug=yes \
                 --disable-orbit --with-openldap=no --disable-gtk"
 
@@ -28,6 +31,15 @@ PACKAGECONFIG_libc-uclibc = ""
 
 PACKAGECONFIG[policykit] = "--enable-defaults-service,--disable-defaults-service,polkit"
 
+do_unpack[postfuncs] += "unpack_gconf_debug"
+do_unpack[vardeps] += "unpack_gconf_debug"
+unpack_gconf_debug() {
+	# A copy from git://git.gnome.org/gconf for debug
+	if [ ! -e ${S}/gconf/gconf.path ]; then
+		install -m 0664 ${WORKDIR}/gconf.path ${S}/gconf/
+	fi
+}
+
 do_install_append() {
 	# this directory need to be created to avoid an Error 256 at gdm launch
 	install -d ${D}${sysconfdir}/gconf/gconf.xml.system
-- 
1.9.1


