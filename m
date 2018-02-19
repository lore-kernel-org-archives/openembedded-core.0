Return-Path: <maxin.john@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 76880607A4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Feb 2018 08:34:57 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	19 Feb 2018 00:34:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,534,1511856000"; d="scan'208";a="21241470"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga002.fm.intel.com with ESMTP; 19 Feb 2018 00:34:59 -0800
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.84])
	by linux.intel.com (Postfix) with ESMTP id 61FF658030D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Feb 2018 00:34:58 -0800 (PST)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 19 Feb 2018 10:36:59 +0200
Message-Id: <1519029438-11092-9-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1519029438-11092-1-git-send-email-maxin.john@intel.com>
References: <1519029438-11092-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 08/27] meson: remove PKG_CONFIG_SYSROOT_DIR work-around
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
X-List-Received-Date: Mon, 19 Feb 2018 08:34:57 -0000

We are moving from freedesktop.org's pkg-config to pkgconf.
This helps us to update the following patch as PKG_CONFIG_SYSROOT_DIR
behaves consistently with pkgconf:

1) 0002-gobject-introspection-determine-g-ir-scanner-and-g-i.patch

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 .../0002-gobject-introspection-determine-g-ir-scanner-and-g-i.patch   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/meson/meson/0002-gobject-introspection-determine-g-ir-scanner-and-g-i.patch b/meta/recipes-devtools/meson/meson/0002-gobject-introspection-determine-g-ir-scanner-and-g-i.patch
index ded42d1..440f637 100644
--- a/meta/recipes-devtools/meson/meson/0002-gobject-introspection-determine-g-ir-scanner-and-g-i.patch
+++ b/meta/recipes-devtools/meson/meson/0002-gobject-introspection-determine-g-ir-scanner-and-g-i.patch
@@ -32,8 +32,8 @@ index 4f7fe30..9610cf6 100644
                  self.gir_dep = PkgConfigDependency('gobject-introspection-1.0',
                                                     state.environment,
                                                     {'native': True})
-+            giscanner = os.environ['PKG_CONFIG_SYSROOT_DIR'] + self.gir_dep.get_pkgconfig_variable('g_ir_scanner', {})
-+            gicompiler = os.environ['PKG_CONFIG_SYSROOT_DIR'] + self.gir_dep.get_pkgconfig_variable('g_ir_compiler', {})
++            giscanner =  self.gir_dep.get_pkgconfig_variable('g_ir_scanner', {})
++            gicompiler = self.gir_dep.get_pkgconfig_variable('g_ir_compiler', {})
              pkgargs = self.gir_dep.get_compile_args()
          except Exception:
              raise MesonException('gobject-introspection dependency was not found, gir cannot be generated.')
-- 
2.4.0


