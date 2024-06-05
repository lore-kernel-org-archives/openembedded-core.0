Return-Path: <kai.kang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E17DC25B78
	for <webhook@archiver.kernel.org>; Wed,  5 Jun 2024 01:37:34 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.4658.1717551450757208173
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Jun 2024 18:37:30 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=68867ad8c0=kai.kang@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4550KvhI009722
	for <openembedded-core@lists.openembedded.org>; Wed, 5 Jun 2024 01:37:29 GMT
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3yftm7uj41-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 05 Jun 2024 01:37:29 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 4 Jun 2024 18:37:27 -0700
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.39 via Frontend Transport; Tue, 4 Jun 2024 18:37:27 -0700
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] multilib.bbclass: replace deprecated e.data with d
Date: Wed, 5 Jun 2024 09:37:19 +0800
Message-ID: <20240605013719.1751604-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: 6bCyl-OH-DXKXFj0WSPrjmQ24FE8Yc51
X-Proofpoint-ORIG-GUID: 6bCyl-OH-DXKXFj0WSPrjmQ24FE8Yc51
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-04_11,2024-06-04_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 malwarescore=0
 phishscore=0 suspectscore=0 mlxscore=0 lowpriorityscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 clxscore=1011 impostorscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2405170001 definitions=main-2406050010
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Jun 2024 01:37:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200351

From: Kai Kang <kai.kang@windriver.com>

Replace deprecated e.data with d in multilib.bbclass and
multilib_global.bbclass.

Remove event check in function multilib_virtclass_handler_vendor in
multilib_global.bbclass. The function flag 'eventmask' has been set
with 'bb.event.ConfigParsed', so no need to check the event any more.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/classes/multilib.bbclass        | 87 ++++++++++++++--------------
 meta/classes/multilib_global.bbclass | 25 ++++----
 2 files changed, 56 insertions(+), 56 deletions(-)

diff --git a/meta/classes/multilib.bbclass b/meta/classes/multilib.bbclass
index b6c09969b1..a4151658a6 100644
--- a/meta/classes/multilib.bbclass
+++ b/meta/classes/multilib.bbclass
@@ -5,30 +5,30 @@
 #
 
 python multilib_virtclass_handler () {
-    cls = e.data.getVar("BBEXTENDCURR")
-    variant = e.data.getVar("BBEXTENDVARIANT")
+    cls = d.getVar("BBEXTENDCURR")
+    variant = d.getVar("BBEXTENDVARIANT")
     if cls != "multilib" or not variant:
         return
 
-    localdata = bb.data.createCopy(e.data)
+    localdata = bb.data.createCopy(d)
     localdata.delVar('TMPDIR')
-    e.data.setVar('STAGING_KERNEL_DIR', localdata.getVar('STAGING_KERNEL_DIR'))
+    d.setVar('STAGING_KERNEL_DIR', localdata.getVar('STAGING_KERNEL_DIR'))
 
     # There should only be one kernel in multilib configs
     # We also skip multilib setup for module packages.
-    provides = (e.data.getVar("PROVIDES") or "").split()
+    provides = (d.getVar("PROVIDES") or "").split()
     non_ml_recipes = d.getVar('NON_MULTILIB_RECIPES').split()
-    bpn = e.data.getVar("BPN")
-    if "virtual/kernel" in provides or \
-            bb.data.inherits_class('module-base', e.data) or \
-            bpn in non_ml_recipes:
+    bpn = d.getVar("BPN")
+    if ("virtual/kernel" in provides
+            or bb.data.inherits_class('module-base', d)
+            or bpn in non_ml_recipes):
         raise bb.parse.SkipRecipe("We shouldn't have multilib variants for %s" % bpn)
 
-    save_var_name=e.data.getVar("MULTILIB_SAVE_VARNAME") or ""
+    save_var_name = d.getVar("MULTILIB_SAVE_VARNAME") or ""
     for name in save_var_name.split():
-        val=e.data.getVar(name)
+        val = d.getVar(name)
         if val:
-            e.data.setVar(name + "_MULTILIB_ORIGINAL", val)
+            d.setVar(name + "_MULTILIB_ORIGINAL", val)
 
     # We nearly don't need this but dependencies on NON_MULTILIB_RECIPES don't work without it
     d.setVar("SSTATE_ARCHS_TUNEPKG", "${@all_multilib_tune_values(d, 'TUNE_PKGARCH')}")
@@ -36,66 +36,67 @@ python multilib_virtclass_handler () {
     overrides = e.data.getVar("OVERRIDES", False)
     pn = e.data.getVar("PN", False)
     overrides = overrides.replace("pn-${PN}", "pn-${PN}:pn-" + pn)
-    e.data.setVar("OVERRIDES", overrides)
+    d.setVar("OVERRIDES", overrides)
 
-    if bb.data.inherits_class('image', e.data):
-        e.data.setVar("MLPREFIX", variant + "-")
-        e.data.setVar("PN", variant + "-" + e.data.getVar("PN", False))
-        e.data.setVar('SDKTARGETSYSROOT', e.data.getVar('SDKTARGETSYSROOT'))
+    if bb.data.inherits_class('image', d):
+        d.setVar("MLPREFIX", variant + "-")
+        d.setVar("PN", variant + "-" + d.getVar("PN", False))
+        d.setVar('SDKTARGETSYSROOT', d.getVar('SDKTARGETSYSROOT'))
         override = ":virtclass-multilib-" + variant
-        e.data.setVar("OVERRIDES", e.data.getVar("OVERRIDES", False) + override)
-        target_vendor = e.data.getVar("TARGET_VENDOR:" + "virtclass-multilib-" + variant, False)
+        d.setVar("OVERRIDES", d.getVar("OVERRIDES", False) + override)
+        target_vendor = d.getVar("TARGET_VENDOR:" + "virtclass-multilib-" + variant, False)
         if target_vendor:
-            e.data.setVar("TARGET_VENDOR", target_vendor)
+            d.setVar("TARGET_VENDOR", target_vendor)
         return
 
-    if bb.data.inherits_class('cross-canadian', e.data):
+    if bb.data.inherits_class('cross-canadian', d):
         # Multilib cross-candian should use the same nativesdk sysroot without MLPREFIX
-        e.data.setVar("RECIPE_SYSROOT", "${WORKDIR}/recipe-sysroot")
-        e.data.setVar("STAGING_DIR_TARGET", "${WORKDIR}/recipe-sysroot")
-        e.data.setVar("STAGING_DIR_HOST", "${WORKDIR}/recipe-sysroot")
-        e.data.setVar("RECIPE_SYSROOT_MANIFEST_SUBDIR", "nativesdk-" + variant)
-        e.data.setVar("MLPREFIX", variant + "-")
+        d.setVar("RECIPE_SYSROOT", "${WORKDIR}/recipe-sysroot")
+        d.setVar("STAGING_DIR_TARGET", "${WORKDIR}/recipe-sysroot")
+        d.setVar("STAGING_DIR_HOST", "${WORKDIR}/recipe-sysroot")
+        d.setVar("RECIPE_SYSROOT_MANIFEST_SUBDIR", "nativesdk-" + variant)
+        d.setVar("MLPREFIX", variant + "-")
         override = ":virtclass-multilib-" + variant
-        e.data.setVar("OVERRIDES", e.data.getVar("OVERRIDES", False) + override)
+        d.setVar("OVERRIDES", d.getVar("OVERRIDES", False) + override)
         return
 
-    if bb.data.inherits_class('native', e.data):
+    if bb.data.inherits_class('native', d):
         raise bb.parse.SkipRecipe("We can't extend native recipes")
 
-    if bb.data.inherits_class('nativesdk', e.data) or bb.data.inherits_class('crosssdk', e.data):
+    if bb.data.inherits_class('nativesdk', d) or bb.data.inherits_class('crosssdk', d):
         raise bb.parse.SkipRecipe("We can't extend nativesdk recipes")
 
-    if bb.data.inherits_class('allarch', e.data) and not d.getVar('MULTILIB_VARIANTS') \
-        and not bb.data.inherits_class('packagegroup', e.data):
+    if (bb.data.inherits_class('allarch', d)
+            and not d.getVar('MULTILIB_VARIANTS')
+            and not bb.data.inherits_class('packagegroup', d)):
         raise bb.parse.SkipRecipe("Don't extend allarch recipes which are not packagegroups")
 
     # Expand this since this won't work correctly once we set a multilib into place
-    e.data.setVar("ALL_MULTILIB_PACKAGE_ARCHS", e.data.getVar("ALL_MULTILIB_PACKAGE_ARCHS"))
+    d.setVar("ALL_MULTILIB_PACKAGE_ARCHS", d.getVar("ALL_MULTILIB_PACKAGE_ARCHS"))
  
     override = ":virtclass-multilib-" + variant
 
-    skip_msg = e.data.getVarFlag('SKIP_RECIPE', e.data.getVar('PN'))
+    skip_msg = d.getVarFlag('SKIP_RECIPE', d.getVar('PN'))
     if skip_msg:
-        pn_new = variant + "-" + e.data.getVar('PN')
-        if not e.data.getVarFlag('SKIP_RECIPE', pn_new):
-            e.data.setVarFlag('SKIP_RECIPE', pn_new, skip_msg)
+        pn_new = variant + "-" + d.getVar('PN')
+        if not d.getVarFlag('SKIP_RECIPE', pn_new):
+            d.setVarFlag('SKIP_RECIPE', pn_new, skip_msg)
 
-    e.data.setVar("MLPREFIX", variant + "-")
-    e.data.setVar("PN", variant + "-" + e.data.getVar("PN", False))
-    e.data.setVar("OVERRIDES", e.data.getVar("OVERRIDES", False) + override)
+    d.setVar("MLPREFIX", variant + "-")
+    d.setVar("PN", variant + "-" + d.getVar("PN", False))
+    d.setVar("OVERRIDES", d.getVar("OVERRIDES", False) + override)
 
     # Expand INCOMPATIBLE_LICENSE_EXCEPTIONS with multilib prefix
-    pkgs = e.data.getVar("INCOMPATIBLE_LICENSE_EXCEPTIONS")
+    pkgs = d.getVar("INCOMPATIBLE_LICENSE_EXCEPTIONS")
     if pkgs:
         for pkg in pkgs.split():
             pkgs += " " + variant + "-" + pkg
-        e.data.setVar("INCOMPATIBLE_LICENSE_EXCEPTIONS", pkgs)
+        d.setVar("INCOMPATIBLE_LICENSE_EXCEPTIONS", pkgs)
 
     # DEFAULTTUNE can change TARGET_ARCH override so expand this now before update_data
-    newtune = e.data.getVar("DEFAULTTUNE:" + "virtclass-multilib-" + variant, False)
+    newtune = d.getVar("DEFAULTTUNE:" + "virtclass-multilib-" + variant, False)
     if newtune:
-        e.data.setVar("DEFAULTTUNE", newtune)
+        d.setVar("DEFAULTTUNE", newtune)
 }
 
 addhandler multilib_virtclass_handler
diff --git a/meta/classes/multilib_global.bbclass b/meta/classes/multilib_global.bbclass
index 6095d278dd..973ac9130b 100644
--- a/meta/classes/multilib_global.bbclass
+++ b/meta/classes/multilib_global.bbclass
@@ -171,24 +171,23 @@ def preferred_ml_updates(d):
     d.appendVar("SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS", " " + " ".join(extras))
 
 python multilib_virtclass_handler_vendor () {
-    if isinstance(e, bb.event.ConfigParsed):
-        for v in e.data.getVar("MULTILIB_VARIANTS").split():
-            if e.data.getVar("TARGET_VENDOR:virtclass-multilib-" + v, False) is None:
-                e.data.setVar("TARGET_VENDOR:virtclass-multilib-" + v, e.data.getVar("TARGET_VENDOR", False) + "ml" + v)
-        preferred_ml_updates(e.data)
+    for v in d.getVar("MULTILIB_VARIANTS").split():
+        if d.getVar("TARGET_VENDOR:virtclass-multilib-" + v, False) is None:
+            d.setVar("TARGET_VENDOR:virtclass-multilib-" + v, d.getVar("TARGET_VENDOR", False) + "ml" + v)
+    preferred_ml_updates(d)
 }
 addhandler multilib_virtclass_handler_vendor
 multilib_virtclass_handler_vendor[eventmask] = "bb.event.ConfigParsed"
 
 python multilib_virtclass_handler_global () {
-    variant = e.data.getVar("BBEXTENDVARIANT")
+    variant = d.getVar("BBEXTENDVARIANT")
     if variant:
         return
 
     non_ml_recipes = d.getVar('NON_MULTILIB_RECIPES').split()
 
-    if bb.data.inherits_class('kernel', e.data) or \
-            bb.data.inherits_class('module-base', e.data) or \
+    if bb.data.inherits_class('kernel', d) or \
+            bb.data.inherits_class('module-base', d) or \
             d.getVar('BPN') in non_ml_recipes:
 
             # We need to avoid expanding KERNEL_VERSION which we can do by deleting it
@@ -197,7 +196,7 @@ python multilib_virtclass_handler_global () {
             localdata.delVar("KERNEL_VERSION")
             localdata.delVar("KERNEL_VERSION_PKG_NAME")
 
-            variants = (e.data.getVar("MULTILIB_VARIANTS") or "").split()
+            variants = (d.getVar("MULTILIB_VARIANTS") or "").split()
 
             import oe.classextend
             clsextends = []
@@ -208,22 +207,22 @@ python multilib_virtclass_handler_global () {
             origprovs = provs = localdata.getVar("PROVIDES") or ""
             for clsextend in clsextends:
                 provs = provs + " " + clsextend.map_variable("PROVIDES", setvar=False)
-            e.data.setVar("PROVIDES", provs)
+            d.setVar("PROVIDES", provs)
 
             # Process RPROVIDES
             origrprovs = rprovs = localdata.getVar("RPROVIDES") or ""
             for clsextend in clsextends:
                 rprovs = rprovs + " " + clsextend.map_variable("RPROVIDES", setvar=False)
             if rprovs.strip():
-                e.data.setVar("RPROVIDES", rprovs)
+                d.setVar("RPROVIDES", rprovs)
 
             # Process RPROVIDES:${PN}...
-            for pkg in (e.data.getVar("PACKAGES") or "").split():
+            for pkg in (d.getVar("PACKAGES") or "").split():
                 origrprovs = rprovs = localdata.getVar("RPROVIDES:%s" % pkg) or ""
                 for clsextend in clsextends:
                     rprovs = rprovs + " " + clsextend.map_variable("RPROVIDES:%s" % pkg, setvar=False)
                     rprovs = rprovs + " " + clsextend.extname + "-" + pkg
-                e.data.setVar("RPROVIDES:%s" % pkg, rprovs)
+                d.setVar("RPROVIDES:%s" % pkg, rprovs)
 }
 
 addhandler multilib_virtclass_handler_global
-- 
2.34.1


