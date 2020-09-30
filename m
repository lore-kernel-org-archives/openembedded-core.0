Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web12.6498.1601503957980409527
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Sep 2020 15:12:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=ujeVErhI;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.46, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f46.google.com with SMTP id gm14so688684pjb.2
        for <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2020 15:12:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=bw9Kj34id0eaehuZsm1ZvxEspKKnkh9Cn+PO8X44A3w=;
        b=ujeVErhIi3IottQqkLtA0tOM2+vjZnjyOAee8Drsc4xt8Jy7d/txkfy7lZBa3AFeOz
         ju8BgGPkqQpBE63vpNYLeh+9B1SWEjtRuaHo3549oI/wyVTrl/ZFwnEBFzPSYIIM3jUU
         g9WinFfcKcy4JFhtcqA/SvykjEWCTra6bpYCp0/5OheVn/IMxbEZr1hbffj5BdoJRiEm
         DugGJHULMvXp7xzV47na7hUMLzoVQb/PRb2Y1A9gVFPSop3vGP1MpQ+i+TikP451/nUG
         tNd8QBELQYrM2r3e5G2EznhAFCHGGzEMccTtn0eVDbNQVPmR6FolOUCIikkmMxJCk0fP
         cKsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=bw9Kj34id0eaehuZsm1ZvxEspKKnkh9Cn+PO8X44A3w=;
        b=ogP+3TWTqUvAtnKSR5K/xDmrJfG39sBooHG1CqwmWGIFH4RK+uo7XFfrMhwmHvNfmy
         BouvqF5jjxUyyREIuvmx0VI4sNNjXZNemWT9HBxV7qlHIK7AYaLG9aFU1wZHQaHrU4l5
         tEi3R6ahgUJsQ+GwiKJWdV5exUrlDF0Em8kk2gsBrep2gZbXpDVq7qGFhWkBVIJpMiq2
         Ly/W7WLjRJgBc6+B/Marh9mo0/NzMCmZgIYZflIXGyspq7HfhgRB5EUKCsYILPvz8gzG
         H8VX/7sYppceLoaG5SDnP/+Qw2I6dbKG2RG+k6rax5chEOJA9h4BaccXLXW8qmMlGfDu
         ucrg==
X-Gm-Message-State: AOAM531EdQHotHBf33jCqls3oWhfjZo+QEO4A2N4BnAbR9mPIrNeotx6
	MbFOtbeQlCa8xrfIaZFiIyC6Uxfz45MXkYbv1us=
X-Google-Smtp-Source: ABdhPJz9kbhUucLmGkPRqsH1fpf3wVpT95x0MKW8jh3NgVEEqn/wQdTpZeXjJEcG3HIMVHPRpms71Q==
X-Received: by 2002:a17:90a:d684:: with SMTP id x4mr4333600pju.57.1601503956342;
        Wed, 30 Sep 2020 15:12:36 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id k6sm3488799pfh.92.2020.09.30.15.12.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2020 15:12:35 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 14/41] insane: Check for feature check variables not being used
Date: Wed, 30 Sep 2020 12:11:16 -1000
Message-Id: <02fa8637195447f38b4ce96086197490ce814987.1601502610.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1601502610.git.steve@sakoman.com>
References: <cover.1601502610.git.steve@sakoman.com>

From: Jacob Kroon <jacob.kroon@gmail.com>

Add a package QA check for wether any of the variables used by
features_check.bbclass is set while not inheriting the class itself.

Signed-off-by: Jacob Kroon <jacob.kroon@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit c06489d102682504afe33f9fee3facd9628b3f57)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/insane.bbclass | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index 46d386a38b..5b18fadd60 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -28,7 +28,7 @@ WARN_QA ?= "ldflags useless-rpaths rpaths staticdev libdir xorg-driver-abi \
             pn-overrides infodir build-deps src-uri-bad \
             unknown-configure-option symlink-to-sysroot multilib \
             invalid-packageconfig host-user-contaminated uppercase-pn patch-fuzz \
-            mime mime-xdg unlisted-pkg-lics \
+            mime mime-xdg unlisted-pkg-lics unhandled-features-check \
             "
 ERROR_QA ?= "dev-so debug-deps dev-deps debug-files arch pkgconfig la \
             perms dep-cmp pkgvarcheck perm-config perm-line perm-link \
@@ -977,6 +977,16 @@ def package_qa_check_src_uri(pn, d, messages):
         if re.search(r"github\.com/.+/.+/archive/.+", url):
             package_qa_handle_error("src-uri-bad", "%s: SRC_URI uses unstable GitHub archives" % pn, d)
 
+QARECIPETEST[unhandled-features-check] = "package_qa_check_unhandled_features_check"
+def package_qa_check_unhandled_features_check(pn, d, messages):
+    if not bb.data.inherits_class('features_check', d):
+        var_set = False
+        for kind in ['DISTRO', 'MACHINE', 'COMBINED']:
+            for var in ['ANY_OF_' + kind + '_FEATURES', 'REQUIRED_' + kind + '_FEATURES', 'CONFLICT_' + kind + '_FEATURES']:
+                if d.getVar(var) is not None or d.overridedata.get(var) is not None:
+                    var_set = True
+        if var_set:
+            package_qa_handle_error("unhandled-features-check", "%s: recipe doesn't inherit features_check" % pn, d)
 
 # The PACKAGE FUNC to scan each package
 python do_package_qa () {
-- 
2.17.1

