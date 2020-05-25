Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com [209.85.214.196])
 by mx.groups.io with SMTP id smtpd.web10.41068.1590446267737744852
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 May 2020 15:37:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=OcaXBdAF;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.196, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f196.google.com with SMTP id k22so7884071pls.10
        for <openembedded-core@lists.openembedded.org>; Mon, 25 May 2020 15:37:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=oX5br0MCD8uDkzyUZUTYXYLtxg96B4/vcJ1cWOPezUQ=;
        b=OcaXBdAF4BLTzkF3yFE07bmPvY+DAc6OUn//z97gyv3sECZ8176CoHcVB2TGgr+5tC
         FbJGXui6/c9kMlnUTz+IqAtu4XxVd1O7cYfUwSfmGR8r+GVEAkzCc6zP7FSzVaYA9xea
         em6mz334+q9uOLhUGlo2Rga9LRONro8ieMMSDlp4H7cSMQN86AML3wNWLfWxYXhv1vMR
         X6V/Qauw8RSql9Q2m57uzONazLD/auV9wsaBcPC7npsFMHPGAsVzqTKS7QGMMY/GYmpZ
         4Bq7UqtDabuC807f4TqUYKt7Y+8Wt020jIxjdSk89KtuKblWTVdu2uzkELBvYlRTo74y
         UgWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=oX5br0MCD8uDkzyUZUTYXYLtxg96B4/vcJ1cWOPezUQ=;
        b=Tp67aTGLBpo3snMitwKEtOiX/bfdGfAueXpTGzvQ7aJ0QgYy/Dgpq5aljq9gijZZTg
         YffQrD5oTvdFgDAiHwzNRJyMRDpmpsk4fI1ZKePp0UOFFqGOAZzwO5HW9Er0DBftBTGB
         HhRoGzcubGMfBejgptEoHbu9Mhw+bxd4lobH/wUFE15C2uXLW6p5cYUHqH0TQ6mXym7x
         v7GMLhaOTbYEjpYXmS/c8oqE55cDrIMpQ53ytlutu2NQuizVve6ZUeolUozn6PthVqAX
         ZCG+pTWJMVTTFhe6T2uvQcJeVnOl4h7bizJ/2gyJ2KPgJ0KGCOpBkQwSRI5uZoUBo9+D
         tp8A==
X-Gm-Message-State: AOAM533+Lgw9xj9cgiP/9kvSOaYlVAdWRIaScxFWmId1v/mwW49j6j5D
	+1xwgmeD0b9zY0nCFoQk5KeBdb9VUSc=
X-Google-Smtp-Source: ABdhPJyPd7tafrzhNij74YmNsBXb1ggPsXOcKEC+7CDbj4vV05kNa17yIARk5HquNhvGdR9XfT5N0A==
X-Received: by 2002:a17:902:d312:: with SMTP id b18mr6966375plc.9.1590446266753;
        Mon, 25 May 2020 15:37:46 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id y23sm1990432pje.3.2020.05.25.15.37.45
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2020 15:37:46 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 11/17] base/insane: Check pkgs lics are subset of recipe lics only once
Date: Mon, 25 May 2020 12:36:57 -1000
Message-Id: <ae404ef230882e442e9390b314e1ce023fdbbd1b.1590445868.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1590445868.git.steve@sakoman.com>
References: <cover.1590445868.git.steve@sakoman.com>

From: Quentin Schulz <quentin.schulz@streamunlimited.com>

Move logic checking that all packages licenses are only a subset of
recipe licenses from base.bbclass to the insane.bbclass so that it's
evaluated only once, during do_package_qa.

As explained in the linked bugzilla entry, if a package license is not
part of the recipe license, the warning message gets shown an
unreasonable amount of time because it's evaluated every time a recipe
is parsed.

[YOCTO #10130]

This also makes it possible to silence this error with INSANE_SKIP.

Signed-off-by: Quentin Schulz <quentin.schulz@streamunlimited.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 852408ed4be1f64c57e196688728b7ed223d3493)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/base.bbclass   | 13 -------------
 meta/classes/insane.bbclass | 21 ++++++++++++++++++++-
 2 files changed, 20 insertions(+), 14 deletions(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index 45f9435fd8..7aa2e144eb 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -584,19 +584,6 @@ python () {
                         bb.debug(1, "Skipping recipe %s because of incompatible license(s): %s" % (pn, ' '.join(incompatible_lic)))
                         raise bb.parse.SkipRecipe("it has incompatible license(s): %s" % ' '.join(incompatible_lic))
 
-        # Try to verify per-package (LICENSE_<pkg>) values. LICENSE should be a
-        # superset of all per-package licenses. We do not do advanced (pattern)
-        # matching of license expressions - just check that all license strings
-        # in LICENSE_<pkg> are found in LICENSE.
-        license_set = oe.license.list_licenses(license)
-        for pkg in d.getVar('PACKAGES').split():
-            pkg_license = d.getVar('LICENSE_' + pkg)
-            if pkg_license:
-                unlisted = oe.license.list_licenses(pkg_license) - license_set
-                if unlisted:
-                    bb.warn("LICENSE_%s includes licenses (%s) that are not "
-                            "listed in LICENSE" % (pkg, ' '.join(unlisted)))
-
     needsrcrev = False
     srcuri = d.getVar('SRC_URI')
     for uri in srcuri.split():
diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index 7fc8f33a98..3a0efa3ad6 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -28,7 +28,7 @@ WARN_QA ?= "ldflags useless-rpaths rpaths staticdev libdir xorg-driver-abi \
             pn-overrides infodir build-deps src-uri-bad \
             unknown-configure-option symlink-to-sysroot multilib \
             invalid-packageconfig host-user-contaminated uppercase-pn patch-fuzz \
-            mime mime-xdg \
+            mime mime-xdg unlisted-pkg-lics \
             "
 ERROR_QA ?= "dev-so debug-deps dev-deps debug-files arch pkgconfig la \
             perms dep-cmp pkgvarcheck perm-config perm-line perm-link \
@@ -897,6 +897,25 @@ def package_qa_check_expanded_d(package, d, messages):
                 sane = False
     return sane
 
+QAPKGTEST[unlisted-pkg-lics] = "package_qa_check_unlisted_pkg_lics"
+def package_qa_check_unlisted_pkg_lics(package, d, messages):
+    """
+    Check that all licenses for a package are among the licenses for the recipe.
+    """
+    pkg_lics = d.getVar('LICENSE_' + package)
+    if not pkg_lics:
+        return True
+
+    recipe_lics_set = oe.license.list_licenses(d.getVar('LICENSE'))
+    unlisted = oe.license.list_licenses(pkg_lics) - recipe_lics_set
+    if not unlisted:
+        return True
+
+    package_qa_add_message(messages, "unlisted-pkg-lics",
+                           "LICENSE_%s includes licenses (%s) that are not "
+                           "listed in LICENSE" % (package, ' '.join(unlisted)))
+    return False
+
 def package_qa_check_encoding(keys, encode, d):
     def check_encoding(key, enc):
         sane = True
-- 
2.17.1

