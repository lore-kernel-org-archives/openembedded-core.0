Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0308FC71143
	for <webhook@archiver.kernel.org>; Wed, 28 Aug 2024 20:58:27 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web11.7095.1724878704582936537
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Aug 2024 13:58:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=OI7+SUnw;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-42bb4f8a4bfso832255e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Aug 2024 13:58:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1724878702; x=1725483502; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JqmmrPtoa1mpYOEmQZIPyjU2ajy3T9fjgOfYf9QOu2U=;
        b=OI7+SUnwOCNux+YsZ/Dxinqn46Pr6AffxuPxV6noOpaffDScGV7emFcb5Nq1nBaU7y
         rR+9gBvOQIjATsiax0e4DR6fM7Wsaa3ZQ33xYCbdoDkp7tVVZExT21l6GOKrdJCO+af5
         JUui52P0eSrRwdlA9ejmU7RZ/tZsw3XFm1wWY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724878702; x=1725483502;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JqmmrPtoa1mpYOEmQZIPyjU2ajy3T9fjgOfYf9QOu2U=;
        b=jFPBXv8PLC3ME/OyT4tMgFw25JogjXXWhsCI/m6J3T6ztnTs0d92iselwb4YFoWRYm
         9DJjd2mr0MyhPGu1R/DWIZS0bmoRKtxElUWJwXTLaS4fkapbeq/lfAUTv/erL9Zw/H+7
         s3yZRCHBxVwea7DQ1/kcAz+yyBMElgn5eOnAZbMoRO8rQE0IKNcvVu3BaE5YK6SzqvLi
         NlC/Wu3LnNSbENKoxBWRQXXeqbdOWAVbWBQfkBMpyNNkrky0oX6tmrYX7xIvZJGlWARg
         J248gxmMASZ15L5XVMbjy3k2qC/o2pu9jtpSC5pvtgqHzV/g4KGLnYk99f+wJ70PxHqa
         u8DQ==
X-Gm-Message-State: AOJu0YxVi/geI0zrtljPq6dnvYgbvWf3fNZIXVaRey+WLUMUeJIsZP1Y
	hc9LanNkHm0A+ZyKJmFEx1Dv7ef0J2saFyqXJDe6qNi5d0+/zdbynp0AZKCiXjlhQLKPk9g6sTh
	O
X-Google-Smtp-Source: AGHT+IGafQcK0MjjXMl5V86t0WkTLCkCCp9FEDPA4YKModRLwf/LuTapA983CvfUVqfsR5CHQPuNnQ==
X-Received: by 2002:a5d:5384:0:b0:368:4467:c23e with SMTP id ffacd0b85a97d-3749c252959mr140053f8f.30.1724878702079;
        Wed, 28 Aug 2024 13:58:22 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:354e:532a:804e:264e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42ba64258absm31162925e9.41.2024.08.28.13.58.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Aug 2024 13:58:21 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] insane: Allow ERROR_QA to use 'contains' hash optimisations for do_package_qa
Date: Wed, 28 Aug 2024 21:58:19 +0100
Message-ID: <20240828205819.1697047-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240828205819.1697047-1-richard.purdie@linuxfoundation.org>
References: <20240828205819.1697047-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Aug 2024 20:58:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203894

We want ERROR_QA to operate using the "contains" optimizations which means
accessing the variable only using the contains function.

To do this, remove usage of ALL_QA, open coding the few references to check
both WARN_QA and ERROR_QA.

Move the function table generation to a separate function where we can exclude
the ERROR_QA and WARN_QA variables since they are handled by the handle_error()
function calls.

Ensure all the chain of functions to the handle_error calls is correctly
recognised in the variable dependencies.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes-global/insane.bbclass | 64 +++++++++++++++---------------
 1 file changed, 33 insertions(+), 31 deletions(-)

diff --git a/meta/classes-global/insane.bbclass b/meta/classes-global/insane.bbclass
index 7ef2ffcc8b3..7f84cd2cd5b 100644
--- a/meta/classes-global/insane.bbclass
+++ b/meta/classes-global/insane.bbclass
@@ -54,8 +54,6 @@ FAKEROOT_QA = "host-user-contaminated"
 FAKEROOT_QA[doc] = "QA tests which need to run under fakeroot. If any \
 enabled tests are listed here, the do_package_qa task will run under fakeroot."
 
-ALL_QA = "${WARN_QA} ${ERROR_QA}"
-
 UNKNOWN_CONFIGURE_OPT_IGNORE ?= "--enable-nls --disable-nls --disable-silent-rules --disable-dependency-tracking --disable-static"
 
 # This is a list of directories that are expected to be empty.
@@ -1081,6 +1079,25 @@ def package_qa_check_missing_update_alternatives(pn, d):
         if d.getVar('ALTERNATIVE:%s' % pkg) and not bb.data.inherits_class('update-alternatives', d):
             oe.qa.handle_error("missing-update-alternatives", "%s: recipe defines ALTERNATIVE:%s but doesn't inherit update-alternatives. This might fail during do_rootfs later!" % (pn, pkg), d)
 
+def parse_test_matrix(matrix_name):
+        testmatrix = d.getVarFlags(matrix_name) or {}
+        g = globals()
+        checks = []
+        for w in (d.getVar("WARN_QA") or "").split():
+            if w in skip:
+               continue
+            if w in testmatrix and testmatrix[w] in g:
+                checks.append(g[testmatrix[w]])
+
+        for e in (d.getVar("ERROR_QA") or "").split():
+            if e in skip:
+               continue
+            if e in testmatrix and testmatrix[e] in g:
+                checks.append(g[testmatrix[e]])
+        return checks
+parse_test_matrix[vardepsexclude] = "ERROR_QA WARN_QA"
+
+
 # The PACKAGE FUNC to scan each package
 python do_package_qa () {
     import subprocess
@@ -1136,23 +1153,6 @@ python do_package_qa () {
     for dep in taskdepdata:
         taskdeps.add(taskdepdata[dep][0])
 
-    def parse_test_matrix(matrix_name):
-        testmatrix = d.getVarFlags(matrix_name) or {}
-        g = globals()
-        checks = []
-        for w in (d.getVar("WARN_QA") or "").split():
-            if w in skip:
-               continue
-            if w in testmatrix and testmatrix[w] in g:
-                checks.append(g[testmatrix[w]])
-
-        for e in (d.getVar("ERROR_QA") or "").split():
-            if e in skip:
-               continue
-            if e in testmatrix and testmatrix[e] in g:
-                checks.append(g[testmatrix[e]])
-        return checks
-
     for package in packages:
         skip = set((d.getVar('INSANE_SKIP') or "").split() +
                    (d.getVar('INSANE_SKIP:' + package) or "").split())
@@ -1179,8 +1179,7 @@ python do_package_qa () {
     for func in checks:
         func(pn, d)
 
-    if 'libdir' in d.getVar("ALL_QA").split():
-        package_qa_check_libdir(d)
+    package_qa_check_libdir(d)
 
     oe.qa.exit_if_errors(d)
 }
@@ -1198,6 +1197,10 @@ python() {
     pkgs = (d.getVar('PACKAGES') or '').split()
     for pkg in pkgs:
         d.appendVarFlag("do_package_qa", "vardeps", " INSANE_SKIP:{}".format(pkg))
+    funcs = d.getVarFlags("QAPATHTEST")
+    funcs.update(d.getVarFlags("QAPKGTEST"))
+    funcs.update(d.getVarFlags("QARECIPETEST"))
+    d.appendVarFlag("do_package_qa", "vardeps", " ".join(funcs.values()))
 }
 
 SSTATETASKS += "do_package_qa"
@@ -1295,7 +1298,9 @@ python do_qa_patch() {
         return False
 
     srcdir = d.getVar('S')
-    if not bb.utils.contains('DISTRO_FEATURES', 'ptest', True, False, d) or not bb.utils.contains('ALL_QA', 'unimplemented-ptest', True, False, d):
+    if not bb.utils.contains('DISTRO_FEATURES', 'ptest', True, False, d):
+        pass
+    elif not (bb.utils.contains('ERROR_QA', 'unimplemented-ptest', True, False, d) or bb.utils.contains('WARN_QA', 'unimplemented-ptest', True, False, d)):
         pass
     elif bb.data.inherits_class('ptest', d):
         bb.note("Package %s QA: skipping unimplemented-ptest: ptest implementation detected" % d.getVar('PN'))
@@ -1494,8 +1499,7 @@ do_unpack[postfuncs] += "do_qa_unpack"
 python () {
     import re
 
-    tests = d.getVar('ALL_QA').split()
-    if "desktop" in tests:
+    if bb.utils.contains('ERROR_QA', 'desktop', True, False, d) or bb.utils.contains('WARN_QA', 'desktop', True, False, d):
         d.appendVar("PACKAGE_DEPENDS", " desktop-file-utils-native")
 
     ###########################################################################
@@ -1545,11 +1549,10 @@ python () {
         oe.qa.handle_error("pkgvarcheck", "recipe uses DEPENDS:${PN}, should use DEPENDS", d)
 
     # virtual/ is meaningless for these variables
-    if "virtual-slash" in (d.getVar("ALL_QA") or "").split():
-        for k in ['RDEPENDS', 'RPROVIDES']:
-            for var in bb.utils.explode_deps(d.getVar(k + ':' + pn) or ""):
-                if var.startswith("virtual/"):
-                    oe.qa.handle_error("virtual-slash", "%s is set to %s but the substring 'virtual/' holds no meaning in this context. It only works for build time dependencies, not runtime ones. It is suggested to use 'VIRTUAL-RUNTIME_' variables instead." % (k, var), d)
+    for k in ['RDEPENDS', 'RPROVIDES']:
+        for var in bb.utils.explode_deps(d.getVar(k + ':' + pn) or ""):
+            if var.startswith("virtual/"):
+                oe.qa.handle_error("virtual-slash", "%s is set to %s but the substring 'virtual/' holds no meaning in this context. It only works for build time dependencies, not runtime ones. It is suggested to use 'VIRTUAL-RUNTIME_' variables instead." % (k, var), d)
 
     issues = []
     if (d.getVar('PACKAGES') or "").split():
@@ -1559,8 +1562,7 @@ python () {
             if d.getVar(var, False):
                 issues.append(var)
 
-        fakeroot_tests = d.getVar('FAKEROOT_QA').split()
-        if set(tests) & set(fakeroot_tests):
+        if bb.utils.contains('ERROR_QA', 'host-user-contaminated', True, False, d) or bb.utils.contains('WARN_QA', 'host-user-contaminated', True, False, d):
             d.setVarFlag('do_package_qa', 'fakeroot', '1')
             d.appendVarFlag('do_package_qa', 'depends', ' virtual/fakeroot-native:do_populate_sysroot')
     else:

