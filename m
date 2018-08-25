Return-Path: <kai.kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2CE6C794E9
	for <openembedded-core@lists.openembedded.org>;
	Sat, 25 Aug 2018 17:13:47 +0000 (UTC)
Received: from ala-blade48.wrs.com (ala-blade48.wrs.com [147.11.105.68])
	by mail.windriver.com (8.15.2/8.15.1) with SMTP id w7PHDkXE011088;
	Sat, 25 Aug 2018 10:13:47 -0700 (PDT)
Received: by ala-blade48.wrs.com (sSMTP sendmail emulation);
	Sat, 25 Aug 2018 10:13:46 -0700
From: Kai Kang <kai.kang@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Sat, 25 Aug 2018 10:13:39 -0700
Message-Id: <55b7afd2fc5b383ab482f4b004e38cb0797ca29c.1535216766.git.kai.kang@windriver.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1535216766.git.kai.kang@windriver.com>
References: <cover.1535216766.git.kai.kang@windriver.com>
In-Reply-To: <cover.1535216766.git.kai.kang@windriver.com>
References: <cover.1535216766.git.kai.kang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/5] update_font_cache: update script for multilib
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
X-List-Received-Date: Sat, 25 Aug 2018 17:13:47 -0000

Packages which inherit fontcache.bbclass call postinstall script
update_font_cache. And in update_font_cache, it calls ${bindir}/fc-cache
by qemuwrapper. When multilib is enabled, both packages foo and lib32-foo
will call ${bindir}/fc-cache and one of them will fail to run obviously.

Duplicate install file fc-cache to ${libexecdir} with ${MLPREFIX} and
call proper fc-cache in update_font_cache.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/recipes-graphics/fontconfig/fontconfig_2.12.6.bb | 8 +++++++-
 scripts/postinst-intercepts/update_font_cache         | 2 +-
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/fontconfig/fontconfig_2.12.6.bb b/meta/recipes-graphics/fontconfig/fontconfig_2.12.6.bb
index d4cbce80b45..db36c867741 100644
--- a/meta/recipes-graphics/fontconfig/fontconfig_2.12.6.bb
+++ b/meta/recipes-graphics/fontconfig/fontconfig_2.12.6.bb
@@ -35,9 +35,15 @@ do_configure_prepend() {
     rm -f ${S}/src/fcobjshash.h ${S}/src/fcobjshash.gperf
 }
 
+do_install_append_class-target() {
+    # duplicate fc-cache for postinstall script
+    mkdir -p ${D}${libexecdir}
+    cp ${D}${bindir}/fc-cache ${D}${libexecdir}/${MLPREFIX}fc-cache
+}
+
 PACKAGES =+ "fontconfig-utils"
 FILES_${PN} =+ "${datadir}/xml/*"
-FILES_fontconfig-utils = "${bindir}/*"
+FILES_fontconfig-utils = "${bindir}/* ${libexecdir}/*"
 
 # Work around past breakage in debian.bbclass
 RPROVIDES_fontconfig-utils = "libfontconfig-utils"
diff --git a/scripts/postinst-intercepts/update_font_cache b/scripts/postinst-intercepts/update_font_cache
index 20e9048adfc..e0ec471964c 100644
--- a/scripts/postinst-intercepts/update_font_cache
+++ b/scripts/postinst-intercepts/update_font_cache
@@ -2,5 +2,5 @@
 
 set -e
 
-PSEUDO_UNLOAD=1 ${binprefix}qemuwrapper -L $D -E ${fontconfigcacheenv} $D${bindir}/fc-cache --sysroot=$D --system-only ${fontconfigcacheparams}
+PSEUDO_UNLOAD=1 ${binprefix}qemuwrapper -L $D -E ${fontconfigcacheenv} $D${libexecdir}/${binprefix}fc-cache --sysroot=$D --system-only ${fontconfigcacheparams}
 chown -R root:root $D${fontconfigcachedir}
-- 
2.11.0


