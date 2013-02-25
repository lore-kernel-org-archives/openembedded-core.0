Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1U9uwe-0003j1-BV
	for openembedded-core@lists.openembedded.org;
	Mon, 25 Feb 2013 11:06:06 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 25 Feb 2013 01:49:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,733,1355126400"; d="scan'208";a="295464939"
Received: from lpalcu-linux (HELO localhost.localdomain) ([10.237.105.165])
	by fmsmga002.fm.intel.com with ESMTP; 25 Feb 2013 01:49:44 -0800
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 25 Feb 2013 11:49:42 +0200
Message-Id: <1361785782-31883-1-git-send-email-laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1361361450-30087-1-git-send-email-laurentiu.palcu@intel.com>
References: <1361361450-30087-1-git-send-email-laurentiu.palcu@intel.com>
Subject: [PATCH] gconf: add patch to remove '+' from invalid characters list
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
X-List-Received-Date: Mon, 25 Feb 2013 10:06:07 -0000

This will allow gconftool-2 to run when configuration source addresses
contain the '+' sign.

[YOCTO #3893]

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 .../remove_plus_from_invalid_characters_list.patch |   19 +++++++++++++++++++
 meta/recipes-gnome/gnome/gconf_3.2.5.bb            |    1 +
 2 files changed, 20 insertions(+)
 create mode 100644 meta/recipes-gnome/gnome/gconf-3.2.5/remove_plus_from_invalid_characters_list.patch

diff --git a/meta/recipes-gnome/gnome/gconf-3.2.5/remove_plus_from_invalid_characters_list.patch b/meta/recipes-gnome/gnome/gconf-3.2.5/remove_plus_from_invalid_characters_list.patch
new file mode 100644
index 0000000..59a7ca7
--- /dev/null
+++ b/meta/recipes-gnome/gnome/gconf-3.2.5/remove_plus_from_invalid_characters_list.patch
@@ -0,0 +1,19 @@
+Upstream-Status: Pending
+
+Remove '+' from invalid characters list
+
+Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
+
+Index: GConf-3.2.5/gconf/gconf-backend.c
+===================================================================
+--- GConf-3.2.5.orig/gconf/gconf-backend.c
++++ GConf-3.2.5/gconf/gconf-backend.c
+@@ -37,7 +37,7 @@ static const char invalid_chars[] =
+   /* Space is common in user names (and thus home directories) on Windows */
+   " "
+ #endif
+-  "\t\r\n\"$&<>,+=#!()'|{}[]?~`;%\\";
++  "\t\r\n\"$&<>,=#!()'|{}[]?~`;%\\";
+ 
+ static gboolean
+ gconf_address_valid (const char  *address,
diff --git a/meta/recipes-gnome/gnome/gconf_3.2.5.bb b/meta/recipes-gnome/gnome/gconf_3.2.5.bb
index c80c0b0..abdf151 100644
--- a/meta/recipes-gnome/gnome/gconf_3.2.5.bb
+++ b/meta/recipes-gnome/gnome/gconf_3.2.5.bb
@@ -15,6 +15,7 @@ inherit gnomebase gtk-doc
 
 SRC_URI = "${GNOME_MIRROR}/GConf/${@gnome_verdir("${PV}")}/GConf-${PV}.tar.xz;name=archive \
            file://obsolete_automake_macros.patch \
+           file://remove_plus_from_invalid_characters_list.patch \
 "
 
 S = "${WORKDIR}/GConf-${PV}"
-- 
1.7.9.5



