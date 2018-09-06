Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2E3FB796E8
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Sep 2018 16:31:04 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w86GV42t015011
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 6 Sep 2018 09:31:04 -0700
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.408.0; Thu, 6 Sep 2018 09:31:03 -0700
From: <kai.kang@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Thu, 6 Sep 2018 23:52:26 +0800
Message-ID: <64fd5d7dc795bce29d92089eac958eb6b2df68cc.1536248856.git.kai.kang@windriver.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <cover.1536248856.git.kai.kang@windriver.com>
References: <cover.1536248856.git.kai.kang@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/7] update_font_cache: update script for multilib
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
X-List-Received-Date: Thu, 06 Sep 2018 16:31:04 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

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
index d4cbce80b4..cec524755d 100644
--- a/meta/recipes-graphics/fontconfig/fontconfig_2.12.6.bb
+++ b/meta/recipes-graphics/fontconfig/fontconfig_2.12.6.bb
@@ -35,9 +35,15 @@ do_configure_prepend() {
     rm -f ${S}/src/fcobjshash.h ${S}/src/fcobjshash.gperf
 }
 
+do_install_append_class-target() {
+    # duplicate fc-cache for postinstall script
+    mkdir -p ${D}${libexecdir}
+    ln ${D}${bindir}/fc-cache ${D}${libexecdir}/${MLPREFIX}fc-cache
+}
+
 PACKAGES =+ "fontconfig-utils"
 FILES_${PN} =+ "${datadir}/xml/*"
-FILES_fontconfig-utils = "${bindir}/*"
+FILES_fontconfig-utils = "${bindir}/* ${libexecdir}/*"
 
 # Work around past breakage in debian.bbclass
 RPROVIDES_fontconfig-utils = "libfontconfig-utils"
diff --git a/scripts/postinst-intercepts/update_font_cache b/scripts/postinst-intercepts/update_font_cache
index 20e9048adf..e0ec471964 100644
--- a/scripts/postinst-intercepts/update_font_cache
+++ b/scripts/postinst-intercepts/update_font_cache
@@ -2,5 +2,5 @@
 
 set -e
 
-PSEUDO_UNLOAD=1 ${binprefix}qemuwrapper -L $D -E ${fontconfigcacheenv} $D${bindir}/fc-cache --sysroot=$D --system-only ${fontconfigcacheparams}
+PSEUDO_UNLOAD=1 ${binprefix}qemuwrapper -L $D -E ${fontconfigcacheenv} $D${libexecdir}/${binprefix}fc-cache --sysroot=$D --system-only ${fontconfigcacheparams}
 chown -R root:root $D${fontconfigcachedir}
-- 
2.18.0


