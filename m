Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5711C49EA1
	for <webhook@archiver.kernel.org>; Mon, 29 Jul 2024 13:13:16 +0000 (UTC)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.web10.55652.1722258791177149837
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Jul 2024 06:13:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=QH7G2LnC;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.169, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-7a18ba4143bso2053046a12.2
        for <openembedded-core@lists.openembedded.org>; Mon, 29 Jul 2024 06:13:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1722258790; x=1722863590; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KU8ubl8XdLvP09CKEXGyC34tj8haMKi6oqAtlBhhyxY=;
        b=QH7G2LnC8TlRt2kiqGOr1DqtfuoVNo7qcbr7jwbO44ztQyQFZjJgzm2WKe6ePfAqtN
         0XM+6+gSDuozmv7Ro38+CZ9vvVk3eY670GOoJYDXS17MknOrClbzbGPTaEhvRC/9Wn2l
         6h0PlAGkDLYIZQ0lQI7LAxiFyLg1PU1e51nh80q7HK55V0zxk1+gtFlXwiluSzyCSDaC
         E8TDIg7ytEjc7+LOnwL82nx9yyEVnulemiCRLOwd3nWTCHHqWilCWzA8da6K87FTkh5p
         GJhlzBks8d0UuDbaZ0wIHhDxhNouF1GjtOwvF+ignEpf85c8ABbDeHorApkoG2ShzUMf
         cQIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722258790; x=1722863590;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KU8ubl8XdLvP09CKEXGyC34tj8haMKi6oqAtlBhhyxY=;
        b=rEH9pQTqKLjzpsoUbCTxXE2lgjDtZliQloyiNfEaLNn/DURcla4xc+smUiK+x/Uq5m
         /8yUKBhZ4hcq+aPtuQmIMErVUY9BQm++b/cfE9E8uc2yIwa0Vx8xZupU4ZzvvS6OUB9/
         wm0HmSzk2sCs1bmc8qlnX/HPBo3kRKq+qJVXhnhnSkMaVar7zq7Jg4hKFKGMCmXdhALD
         91ytjXZJ7OkLj48LSN6B+vSqNZrPucAGl4Ez3eQ5o2hhS11VDb4vb5otRuifYIMxW83J
         TjPsWdlSXoBBTB0pv2Y+GPsVQ7RQd0iqeblxtYVuoeNexMPm/kqPs9Z1PcP8um/9ZCaJ
         2HRA==
X-Gm-Message-State: AOJu0YzdC+rwSkg0GxiRJb5Tkt7OIfxaXL1HlEVUSOqOH57IhNga2kkU
	cpcyU4ntd8fbsU1yOKWick8YPCRZ/a1ZM96fORp7fE1CbT5JGiUMuP8v67AJIJ7M+VIX+yI4mvI
	emoKyug==
X-Google-Smtp-Source: AGHT+IGcvwr7aJIky1uMX7EpnhlN0guSqqFl2UwfsKqNLrki3pI0av3hLdniSC7m1XfArKRtGFVIDg==
X-Received: by 2002:a17:90a:b30e:b0:2c8:f3b4:421 with SMTP id 98e67ed59e1d1-2cf7e09cd84mr5612846a91.4.1722258790217;
        Mon, 29 Jul 2024 06:13:10 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2cdb73b32cbsm10493788a91.17.2024.07.29.06.13.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jul 2024 06:13:09 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 10/37] multilib.bbclass: replace deprecated e.data with d
Date: Mon, 29 Jul 2024 06:12:20 -0700
Message-Id: <01a84c3db74e8cc4923016c312a484a252fcfee0.1722258106.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1722258106.git.steve@sakoman.com>
References: <cover.1722258106.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Jul 2024 13:13:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202624

From: Kai Kang <kai.kang@windriver.com>

Replace deprecated e.data with d in multilib.bbclass and
multilib_global.bbclass.

Remove event check in function multilib_virtclass_handler_vendor in
multilib_global.bbclass. The function flag 'eventmask' has been set
with 'bb.event.ConfigParsed', so no need to check the event any more.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 8d87662d676a2b9ef921cb49ea6edc07b37410e2)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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


