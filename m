Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3B8F07E6C4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Jun 2019 12:35:52 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x5QCZIbS008601
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Jun 2019 05:35:43 -0700
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.439.0; Wed, 26 Jun 2019 05:35:39 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 26 Jun 2019 20:59:34 +0800
Message-ID: <b3d612f8898d7b98acd594d9fe946b6c995b2a00.1561553919.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1561553919.git.liezhi.yang@windriver.com>
References: <cover.1561553919.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] multilib.bbclass: Reduce ALTERNATIVE_PRIORITY for extended recipes
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
X-List-Received-Date: Wed, 26 Jun 2019 12:35:52 -0000
Content-Type: text/plain

Fixed:
MACHINE = "qemux86-64"
require conf/multilib.conf
MULTILIBS = "multilib:lib32"
DEFAULTTUNE_virtclass-multilib-lib32 = "x86"

$ bitbake core-image-minimal
update-alternatives: libtool has multiple providers with the same priority,
please check
/path/to/rootfs/usr/lib/opkg/alternatives/libtool for details

Both libtool and lib32-libtool have the same priority (as they're the same
recipe), so update-alternatives won't deterministically pick a provider. This
means you could end up with an image using a 32-bit pkgconfig and 64-bit
libtool, for example.

Make extended recipes reduce priority by 1 (or 2, 3 ... when there are multiple
variants in MULTILIB_VARIANTS) to fix the problem.

[YOCTO #13418]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/multilib.bbclass | 47 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/meta/classes/multilib.bbclass b/meta/classes/multilib.bbclass
index 7750221..d625bd5 100644
--- a/meta/classes/multilib.bbclass
+++ b/meta/classes/multilib.bbclass
@@ -125,8 +125,55 @@ python __anonymous () {
     clsextend.map_variable("USERADD_PACKAGES")
     clsextend.map_variable("SYSTEMD_PACKAGES")
     clsextend.map_variable("UPDATERCPN")
+
+    reset_alternative_priority(d)
 }
 
+def reset_alternative_priority(d):
+    if not bb.data.inherits_class('update-alternatives', d):
+        return
+
+    # There might be multiple multilibs at the same time, e.g., lib32 and
+    # lib64, each of them should have a different priority.
+    multilib_variants = d.getVar('MULTILIB_VARIANTS')
+    bbextendvariant = d.getVar('BBEXTENDVARIANT')
+    reset_gap = multilib_variants.split().index(bbextendvariant) + 1
+
+    # ALTERNATIVE_PRIORITY = priority
+    alt_priority_recipe = d.getVar('ALTERNATIVE_PRIORITY')
+    # Reset ALTERNATIVE_PRIORITY when found
+    if alt_priority_recipe:
+        reset_priority = int(alt_priority_recipe) - reset_gap
+        bb.debug(1, '%s: Setting ALTERNATIVE_PRIORITY to %s' % (d.getVar('PN'), reset_priority))
+        d.setVar('ALTERNATIVE_PRIORITY', reset_priority)
+
+    handled_pkgs = []
+    for pkg in (d.getVar('PACKAGES') or "").split():
+        # ALTERNATIVE_PRIORITY_pkg = priority
+        alt_priority_pkg = d.getVar('ALTERNATIVE_PRIORITY_%s' % pkg)
+        # Reset ALTERNATIVE_PRIORITY_pkg when found
+        if alt_priority_pkg:
+            reset_priority = int(alt_priority_pkg) - reset_gap
+            if not pkg in handled_pkgs:
+                handled_pkgs.append(pkg)
+                bb.debug(1, '%s: Setting ALTERNATIVE_PRIORITY_%s to %s' % (pkg, pkg, reset_priority))
+                d.setVar('ALTERNATIVE_PRIORITY_%s' % pkg, reset_priority)
+
+        for alt_name in (d.getVar('ALTERNATIVE_%s' % pkg) or "").split():
+            # ALTERNATIVE_PRIORITY_pkg[tool]  = priority
+            alt_priority_pkg_name = d.getVarFlag('ALTERNATIVE_PRIORITY_%s' % pkg, alt_name)
+            # ALTERNATIVE_PRIORITY[tool] = priority
+            alt_priority_name = d.getVarFlag('ALTERNATIVE_PRIORITY', alt_name)
+
+            if alt_priority_pkg_name:
+                reset_priority = int(alt_priority_pkg_name) - reset_gap
+                bb.debug(1, '%s: Setting ALTERNATIVE_PRIORITY_%s[%s] to %s' % (pkg, pkg, alt_name, reset_priority))
+                d.setVarFlag('ALTERNATIVE_PRIORITY_%s' % pkg, alt_name, reset_priority)
+            elif alt_priority_name:
+                reset_priority = int(alt_priority_name) - reset_gap
+                bb.debug(1, '%s: Setting ALTERNATIVE_PRIORITY[%s] to %s' % (pkg, alt_name, reset_priority))
+                d.setVarFlag('ALTERNATIVE_PRIORITY', alt_name, reset_priority)
+
 PACKAGEFUNCS_append = " do_package_qa_multilib"
 
 python do_package_qa_multilib() {
-- 
2.7.4


