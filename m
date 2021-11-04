Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD683C433F5
	for <webhook@archiver.kernel.org>; Thu,  4 Nov 2021 11:05:29 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web11.10246.1636023919121565739
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Nov 2021 04:05:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=dCpu8j8b;
 spf=temperror,
 err=parse error for token &{10 18 _spf.google.com}: parse error for token
 &{10 18 _netblocks.google.com}: temporary DNS error (domain:
 linuxfoundation.org, ip: 209.85.221.44,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f44.google.com with SMTP id s13so8002790wrb.3
        for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Nov 2021 04:05:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=pO74bZWOWegL2CB26uqhhODMxMMVSgBG5kN9v7BapPA=;
        b=dCpu8j8bco+HFwdjxZSEVJXFQ2/uRZoH4nel/rXWWiTepEkhUQAOL2chmDlTj5Dv8I
         Bvpqjn4p/orNvZuSBu8yQJcWbeXptTWdch7F6NCq67wl08GVyZUNWqWWIJuJohD7G73S
         hSSLwosE0kv82YiLmno8D0bMW2rj8shF9DyIg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pO74bZWOWegL2CB26uqhhODMxMMVSgBG5kN9v7BapPA=;
        b=lIEYZJOF7XfC97MnRWWlcX117bVqk8kV+PA4JnpB51r3kgUxQnrgj4QRSeuZxD1KJR
         slHqbWlKCjcYgA38jmPbeBGlID5eDCW7TvHgl/IWgNJWi59vlw1Mg+dVrEN2KRzWiQy9
         TGZU+3eUUH7qw4P8o5pXd+mtP72/iyNpc9NgAGxSUET9dA41mvGISJZOyvqkYeIKa43W
         v0NsJExQhxqVahIRnTd/zsTM+ISjT6o7BJLVbnqV/nB7Gtgq1J+9EusTzR04EPoiRPrX
         RyYWSbTS5kpmfgjM0vEwvqufpyCg8ALqbn+rWxldysL28q6NM8Kss7o4xy8ctzNo7woD
         EC2g==
X-Gm-Message-State: AOAM530HV+Cl+WeoeVp92KnxS5+j3sqfh/5pLoPxdAVbhdTq1NuZw9BP
	D/BqhFoyK4XFgmbmGyooQ/aARTKmtaMGSQ==
X-Google-Smtp-Source: 
 ABdhPJxrCyFoa1lENUqjAHHM5vyEYSNS2fRBkYNHqZI4hwHicdAerSxg3AyaYtOp6xsJzpi7bFBxrQ==
X-Received: by 2002:a5d:624c:: with SMTP id
 m12mr66167349wrv.160.1636023917288;
        Thu, 04 Nov 2021 04:05:17 -0700 (PDT)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:2578:3d9c:c55b:5282])
        by smtp.gmail.com with ESMTPSA id
 l26sm4855219wms.15.2021.11.04.04.05.17
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Nov 2021 04:05:17 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH RFC 1/2] package: Introduce PACKAGE_GLOBAL_RENAMES
Date: Thu,  4 Nov 2021 11:05:15 +0000
Message-Id: <20211104110516.3616891-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211104110516.3616891-1-richard.purdie@linuxfoundation.org>
References: <20211104110516.3616891-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Nov 2021 11:05:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157840

Allow renaming of packages on a global basis to work, e.g.:

PACKAGE_GLOBAL_RENAMES[bash] = "busybox"

Note this happens at package creation time and build time dependencies
remain as written.

This does have the potential to replace the horrific VIRTUAL-RUNTIME*
variables, see the follow up patch.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/image.bbclass             |  7 ++++---
 meta/classes/package.bbclass           | 16 ++++++++++------
 meta/classes/populate_sdk_base.bbclass |  9 +++++----
 3 files changed, 19 insertions(+), 13 deletions(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 2fa69a40d10..b3f5421697d 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -236,9 +236,10 @@ fakeroot python do_rootfs () {
     # otherwise, the multilib renaming could step in and squash any fixups that
     # may have occurred.
     pn = d.getVar('PN')
-    runtime_mapping_rename("PACKAGE_INSTALL", pn, d)
-    runtime_mapping_rename("PACKAGE_INSTALL_ATTEMPTONLY", pn, d)
-    runtime_mapping_rename("BAD_RECOMMENDATIONS", pn, d)
+    remaps = d.getVarFlags("PACKAGE_GLOBAL_RENAMES")
+    runtime_mapping_rename("PACKAGE_INSTALL", pn, remaps, d)
+    runtime_mapping_rename("PACKAGE_INSTALL_ATTEMPTONLY", pn, remaps, d)
+    runtime_mapping_rename("BAD_RECOMMENDATIONS", pn, remaps, d)
 
     # Generate the initial manifest
     create_manifest(d)
diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 92eba988929..aad58ead977 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -612,9 +612,12 @@ def copydebugsources(debugsrcdir, sources, d):
 # Package data handling routines
 #
 
-def get_package_mapping (pkg, basepkg, d, depversions=None):
+def get_package_mapping(pkg, basepkg, remaps, d, depversions=None):
     import oe.packagedata
 
+    if pkg in remaps:
+        pkg = remaps[pkg]
+
     data = oe.packagedata.read_subpkgdata(pkg, d)
     key = "PKG:%s" % pkg
 
@@ -646,13 +649,13 @@ def get_package_additional_metadata (pkg_type, d):
         metadata_fields = [field.strip() for field in oe.data.typed_value(key, d)]
         return "\n".join(metadata_fields).strip()
 
-def runtime_mapping_rename (varname, pkg, d):
+def runtime_mapping_rename(varname, pkg, remaps, d):
     #bb.note("%s before: %s" % (varname, d.getVar(varname)))
 
     new_depends = {}
     deps = bb.utils.explode_dep_versions2(d.getVar(varname) or "")
     for depend, depversions in deps.items():
-        new_depend = get_package_mapping(depend, pkg, d, depversions)
+        new_depend = get_package_mapping(depend, pkg, remaps, d, depversions)
         if depend != new_depend:
             bb.note("package name mapping done: %s -> %s" % (depend, new_depend))
         new_depends[new_depend] = deps[depend]
@@ -2512,6 +2515,7 @@ def mapping_rename_hook(d):
     like debian.bbclass or manual PKG variable name changes
     """
     pkg = d.getVar("PKG")
-    runtime_mapping_rename("RDEPENDS", pkg, d)
-    runtime_mapping_rename("RRECOMMENDS", pkg, d)
-    runtime_mapping_rename("RSUGGESTS", pkg, d)
+    remaps = d.getVarFlags("PACKAGE_GLOBAL_RENAMES")
+    runtime_mapping_rename("RDEPENDS", pkg, remaps, d)
+    runtime_mapping_rename("RRECOMMENDS", pkg, remaps, d)
+    runtime_mapping_rename("RSUGGESTS", pkg, remaps, d)
diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate_sdk_base.bbclass
index fafdd96749c..55c36e1108d 100644
--- a/meta/classes/populate_sdk_base.bbclass
+++ b/meta/classes/populate_sdk_base.bbclass
@@ -152,13 +152,14 @@ def populate_sdk_common(d):
     d.setVar("PACKAGE_INSTALL_ATTEMPTONLY", ' '.join(inst_attempt_pkgs))
 
     pn = d.getVar('PN')
-    runtime_mapping_rename("TOOLCHAIN_TARGET_TASK", pn, d)
-    runtime_mapping_rename("TOOLCHAIN_TARGET_TASK_ATTEMPTONLY", pn, d)
+    remaps = d.getVarFlags("PACKAGE_GLOBAL_RENAMES")
+    runtime_mapping_rename("TOOLCHAIN_TARGET_TASK", pn, remaps, d)
+    runtime_mapping_rename("TOOLCHAIN_TARGET_TASK_ATTEMPTONLY", pn, remaps, d)
 
     ld = bb.data.createCopy(d)
     ld.setVar("PKGDATA_DIR", "${STAGING_DIR}/${SDK_ARCH}-${SDKPKGSUFFIX}${SDK_VENDOR}-${SDK_OS}/pkgdata")
-    runtime_mapping_rename("TOOLCHAIN_HOST_TASK", pn, ld)
-    runtime_mapping_rename("TOOLCHAIN_HOST_TASK_ATTEMPTONLY", pn, ld)
+    runtime_mapping_rename("TOOLCHAIN_HOST_TASK", pn, remaps, ld)
+    runtime_mapping_rename("TOOLCHAIN_HOST_TASK_ATTEMPTONLY", pn, remaps, ld)
     d.setVar("TOOLCHAIN_HOST_TASK", ld.getVar("TOOLCHAIN_HOST_TASK"))
     d.setVar("TOOLCHAIN_HOST_TASK_ATTEMPTONLY", ld.getVar("TOOLCHAIN_HOST_TASK_ATTEMPTONLY"))
     
-- 
2.32.0


