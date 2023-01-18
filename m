Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F04BC32793
	for <webhook@archiver.kernel.org>; Wed, 18 Jan 2023 14:22:34 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web10.16171.1674051745049916113
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Jan 2023 06:22:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=V2qPCXhJ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f54.google.com with SMTP id l8so7664340wms.3
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Jan 2023 06:22:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=jw0d5rmnnNUcZmDYUJMD+BYhG8emKFc4Bw9KwgdRoh4=;
        b=V2qPCXhJxkN1rAJ5Vcn6mdGDxRUMOtsbOxH5bXDFT3kh34az/UoTnbUzYroYaodP83
         /SCB/7PLQGlS7PNenY5ivdomGbqvgbDz9LY+5vNmWEmZlfHTAKaPs8YSG48cc7MUWhiD
         IXc10q8OV4Xu6Vh2eYcYhCekq26z3Lkr/cGMU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jw0d5rmnnNUcZmDYUJMD+BYhG8emKFc4Bw9KwgdRoh4=;
        b=kmDiRRQyT9bGdcAFqTspQ0ED362i/ffl/5B65SimlrUwiifMP9lPULMSSNeqSHYyRm
         hT8CVHUWMplHobrKm/85qRM3ym8E7A730xrz6eAKsDXYDOQ5W2/ZMfRcYL6TNByAwbaK
         rw72Coqj9tfWByalPyGkWM28kBe9d0RquXXmyRPXSaFJVCmrBuMBNqkjv0BTX0qLgc5T
         jPlGv9uYCyeBpgKiBr8KA65cbLpbxkO5IsI1d6VBj5U/lKoBKlMABZ3i00a9hEg2UK+b
         3JO3tNIUNQxk4tKq6+R9B3o3vvadavPBjHwrHLvIndLgfbl4uv/AWcB0GUjreoKYhiLt
         1TCg==
X-Gm-Message-State: AFqh2kp6WJT2VAu3/DMuEH74jeKLHtIAarbRZZbYu//7itI2/onREPmy
	kNa2aqDC2Fl4P+c9RV2gVy1yekA3tQv7+d5N
X-Google-Smtp-Source: AMrXdXt+9Y8ixOckqPGNlB0slkXbj4S9QnJm5NQHpMWocqCm94i4LB/1bXl/u4A/5f9CFChdE0WxUg==
X-Received: by 2002:a05:600c:384d:b0:3da:f7ee:6a80 with SMTP id s13-20020a05600c384d00b003daf7ee6a80mr6819225wmr.37.1674051742943;
        Wed, 18 Jan 2023 06:22:22 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:54cb:642:5dda:e3f7])
        by smtp.gmail.com with ESMTPSA id bd24-20020a05600c1f1800b003db122d5ac2sm2133304wmb.15.2023.01.18.06.22.22
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jan 2023 06:22:22 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/3] insane: Improve patch warning/error handling
Date: Wed, 18 Jan 2023 14:22:19 +0000
Message-Id: <20230118142221.1926666-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Jan 2023 14:22:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176098

Currently, whilst patch errors or warnings are shown, the errors don't stop builds.
The configuration isn't very configurable from WARN_QA and ERROR_QA either.

This patch:
 * Uses the standard mechanisms to handle the patch fuzz warnings/errors
 * Makes Upstream-Status checking configurable from WARN/ERROR_QA
 * Allows that checking to be used with non-core layers
 * Makes patch-fuzz an error by default
 * Enables warnings for missing Upstream-Status in non-core layer patches by default

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes-global/insane.bbclass | 27 ++++++++++++++++++---------
 1 file changed, 18 insertions(+), 9 deletions(-)

diff --git a/meta/classes-global/insane.bbclass b/meta/classes-global/insane.bbclass
index ada8a7ef4e4..e1295f85392 100644
--- a/meta/classes-global/insane.bbclass
+++ b/meta/classes-global/insane.bbclass
@@ -29,11 +29,12 @@
 WARN_QA ?= " libdir xorg-driver-abi buildpaths \
             textrel incompatible-license files-invalid \
             infodir build-deps src-uri-bad symlink-to-sysroot multilib \
-            invalid-packageconfig host-user-contaminated uppercase-pn patch-fuzz \
+            invalid-packageconfig host-user-contaminated uppercase-pn \
             mime mime-xdg unlisted-pkg-lics unhandled-features-check \
             missing-update-alternatives native-last missing-ptest \
             license-exists license-no-generic license-syntax license-format \
             license-incompatible license-file-missing obsolete-license \
+            patch-status-noncore \
             "
 ERROR_QA ?= "dev-so debug-deps dev-deps debug-files arch pkgconfig la \
             perms dep-cmp pkgvarcheck perm-config perm-line perm-link \
@@ -44,6 +45,7 @@ ERROR_QA ?= "dev-so debug-deps dev-deps debug-files arch pkgconfig la \
             already-stripped installed-vs-shipped ldflags compile-host-path \
             install-host-path pn-overrides unknown-configure-option \
             useless-rpaths rpaths staticdev empty-dirs \
+            patch-fuzz patch-status-core\
             "
 # Add usrmerge QA check based on distro feature
 ERROR_QA:append = "${@bb.utils.contains('DISTRO_FEATURES', 'usrmerge', ' usrmerge', '', d)}"
@@ -1334,24 +1336,27 @@ python do_qa_patch() {
             msg += "    devtool modify %s\n" % d.getVar('PN')
             msg += "    devtool finish --force-patch-refresh %s <layer_path>\n\n" % d.getVar('PN')
             msg += "Don't forget to review changes done by devtool!\n"
-            if bb.utils.filter('ERROR_QA', 'patch-fuzz', d):
-                bb.error(msg)
-            elif bb.utils.filter('WARN_QA', 'patch-fuzz', d):
-                bb.warn(msg)
-            msg = "Patch log indicates that patches do not apply cleanly."
+            msg += "\nPatch log indicates that patches do not apply cleanly."
             oe.qa.handle_error("patch-fuzz", msg, d)
 
     # Check if the patch contains a correctly formatted and spelled Upstream-Status
     import re
     from oe import patch
 
+    allpatches = False
+    if bb.utils.filter('ERROR_QA', 'patch-status-noncore', d) or bb.utils.filter('WARN_QA', 'patch-status-noncore', d):
+        allpatches = True
+
     coremeta_path = os.path.join(d.getVar('COREBASE'), 'meta', '')
     for url in patch.src_patches(d):
        (_, _, fullpath, _, _, _) = bb.fetch.decodeurl(url)
 
        # skip patches not in oe-core
+       patchtype = "patch-status-core"
        if not os.path.abspath(fullpath).startswith(coremeta_path):
-           continue
+           patchtype = "patch-status-noncore"
+           if not allpatches:
+               continue
 
        kinda_status_re = re.compile(r"^.*upstream.*status.*$", re.IGNORECASE | re.MULTILINE)
        strict_status_re = re.compile(r"^Upstream-Status: (Pending|Submitted|Denied|Accepted|Inappropriate|Backport|Inactive-Upstream)( .+)?$", re.MULTILINE)
@@ -1364,9 +1369,13 @@ python do_qa_patch() {
 
            if not match_strict:
                if match_kinda:
-                   bb.error("Malformed Upstream-Status in patch\n%s\nPlease correct according to %s :\n%s" % (fullpath, guidelines, match_kinda.group(0)))
+                   msg = "Malformed Upstream-Status in patch\n%s\nPlease correct according to %s :\n%s" % (fullpath, guidelines, match_kinda.group(0))
+                   oe.qa.handle_error(patchtype, msg, d)
                else:
-                   bb.error("Missing Upstream-Status in patch\n%s\nPlease add according to %s ." % (fullpath, guidelines))
+                   msg = "Missing Upstream-Status in patch\n%s\nPlease add according to %s ." % (fullpath, guidelines)
+                   oe.qa.handle_error(patchtype, msg, d)
+
+    oe.qa.exit_if_errors(d)
 }
 
 python do_qa_configure() {
-- 
2.37.2


