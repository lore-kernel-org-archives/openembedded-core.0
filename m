Received: from mga03.intel.com (mga03.intel.com [])
 by mx.groups.io with SMTP id smtpd.web11.48460.1612244058134667125
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Feb 2021 21:34:30 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: 0hh8sQ0VRS6iKcb6yatdwtbVJgdtvXSSJPCfCAn3wZKta5wxYzpP45QZWPl6WJ56Izbz8AJBEQ
 uHN3Gxk/CEgw==
X-IronPort-AV: E=McAfee;i="6000,8403,9882"; a="180876908"
X-IronPort-AV: E=Sophos;i="5.79,394,1602572400"; 
   d="scan'208";a="180876908"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2021 21:34:30 -0800
IronPort-SDR: snY8oGjbVMGZfwwZ+4zbc8kwwCFfZRpognPIzYEPzrwfAQ/OBks/mEo4qq3vWZWWyBTC7Wk+Ni
 yyI4GP/TxW8g==
X-IronPort-AV: E=Sophos;i="5.79,394,1602572400"; 
   d="scan'208";a="370360954"
Received: from ajayap1x-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.184.137])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2021 21:34:29 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 14/25] gobject-introspection: Fix variable override order
Date: Tue,  2 Feb 2021 13:33:57 +0800
Message-Id: <3f56b2666f823dadca84f76daee829f19cce3d6f.1612243805.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1612243805.git.anuj.mittal@intel.com>
References: <cover.1612243805.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

The DEPENDS variable override ordering here was almostly certainly
incorrect and led to weird behaviour when making changes elsewhere.
Correct it.

(From OE-Core rev: c8f7e92244b3c52c275a457aced69086800351d8)

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 3a59f2abe2713151f429d50a96e2360598fd30df)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../gobject-introspection/gobject-introspection_1.64.1.bb     | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.64.1.bb b/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.64.1.bb
index 4d80f00e10..0f0f7a82c4 100644
--- a/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.64.1.bb
+++ b/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.64.1.bb
@@ -29,14 +29,14 @@ GTKDOC_MESON_OPTION = "gtk_doc"
 
 MULTILIB_SCRIPTS = "${PN}:${bindir}/g-ir-annotation-tool ${PN}:${bindir}/g-ir-scanner"
 
-DEPENDS_append = " libffi zlib glib-2.0 python3 flex-native bison-native autoconf-archive"
+DEPENDS += " libffi zlib glib-2.0 python3 flex-native bison-native autoconf-archive"
 
 # target build needs qemu to run temporary introspection binaries created
 # on the fly by g-ir-scanner and a native version of itself to run
 # native versions of its own tools during build.
 # Also prelink-rtld is used to find out library dependencies of introspection binaries
 # (standard ldd doesn't work when cross-compiling).
-DEPENDS_class-target_append = " gobject-introspection-native qemu-native prelink-native"
+DEPENDS_append_class-target = " gobject-introspection-native qemu-native prelink-native"
 
 # needed for writing out the qemu wrapper script
 export STAGING_DIR_HOST
-- 
2.29.2

