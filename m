Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web10.11122.1632141993329564091
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Sep 2021 05:46:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=K0A+i0UB;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f50.google.com with SMTP id w17so21170973wrv.10
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Sep 2021 05:46:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=5Vat/L2rdDkV61ouIzTZwLB80VUykT2hhKrECNpkarQ=;
        b=K0A+i0UBhHqTOes1lsOWBZVR0YK+Ky0+lS6ipsI1+BbtcCC4sn6dwDxhvqGru4zANR
         lvP3bDhj6yo+2c2wpmziLHyZ1pTviY/Q9lNVdSDqAfoOFCfzSeOEjqM7VrSFatlUmlQq
         ZWK6BEfFg498szAGZOMza+mZ6ODaz9Nkz3hEU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5Vat/L2rdDkV61ouIzTZwLB80VUykT2hhKrECNpkarQ=;
        b=68kkdh/cepftuFQ6vKCMPLnRT5EfloHyV18NzwogefGd42+qocwZM6Dzs66ZzuYdEm
         /0lCABTgX86/OLOZIzNkTpJsqrN7gi4HVkWJiR+56dcC3NcMh34N2DRjQZrynePo+fN9
         sHZaBDOSN/kXos8UI8HgtuOHoUjMLkUrqCtc+UTheZHg9zMUu991YlLcXdIcLGFa/7kj
         9aD6cMiusZHXSe+71OqDPq1CCvBNl8YcAUJFOAuGQ2EG+7zLVi4wXD5Kah4RU31iTUr4
         Txqm4PWZ8TeItetra5kRrjsGrPO7VEuV2LeNQjXSlEjDOVnVjHgdrsuiAWNxEr15pTEK
         mO0Q==
X-Gm-Message-State: AOAM531uAquNwd+Lko0FBxKY7tcRwxnMNrAMyJyGjpShvwzcGYLbpbAC
	Hv7LJ7m09aLI7j6tzF7fKgV0wnnBIfCvP2FH
X-Google-Smtp-Source: ABdhPJwiBFwcsSn1p1AR/oTFw3ibPCghe4UzzjbhaKnj3QUYugTHagaI9nJLYWXy1j/06mQGsXkMZg==
X-Received: by 2002:a5d:69c8:: with SMTP id s8mr27917302wrw.330.1632141991758;
        Mon, 20 Sep 2021 05:46:31 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:7173:466e:b128:3e8b])
        by smtp.gmail.com with ESMTPSA id j21sm15773514wrd.48.2021.09.20.05.46.30
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Sep 2021 05:46:31 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [RFC PATCH 10/14] package_ipk/deb/rpm: Drop recursive do_build task dependencies
Date: Mon, 20 Sep 2021 13:46:17 +0100
Message-Id: <20210920124621.1576702-10-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210920124621.1576702-1-richard.purdie@linuxfoundation.org>
References: <20210920124621.1576702-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is a controversial change which removes the recursive dependencies
from the do_build target of packaging tasks of recipes.

Currently this means when you "bitbake <image>" or "bitbake <recipe>",
the packaging tasks run for all packaging backends enabled for all recipes
in the dependency chain. The same therefore then applies to images.

We don't actually need that, it is a convinience thing. Removing it
massively simplifies the task graph and causes much fewer tasks to execute
in many common scenarios. It also means less sstate is fetched for
example when building an image.

This means when building a recipe all package formats would be built
but when building an image, only the format used by the image would be
generated. This should be an improvement in most cases but some CI systems
may need to be explict about what they're building.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/package_deb.bbclass | 5 +----
 meta/classes/package_ipk.bbclass | 4 +---
 meta/classes/package_rpm.bbclass | 4 +---
 3 files changed, 3 insertions(+), 10 deletions(-)

diff --git a/meta/classes/package_deb.bbclass b/meta/classes/package_deb.bbclass
index eca43e17876..77caaa55c8f 100644
--- a/meta/classes/package_deb.bbclass
+++ b/meta/classes/package_deb.bbclass
@@ -315,10 +315,7 @@ python do_package_write_deb () {
 do_package_write_deb[dirs] = "${PKGWRITEDIRDEB}"
 do_package_write_deb[cleandirs] = "${PKGWRITEDIRDEB}"
 do_package_write_deb[depends] += "${@oe.utils.build_depends_string(d.getVar('PACKAGE_WRITE_DEPS'), 'do_populate_sysroot')}"
-addtask package_write_deb after do_packagedata do_package
-
+addtask package_write_deb after do_packagedata do_package before do_build
 
 PACKAGEINDEXDEPS += "dpkg-native:do_populate_sysroot"
 PACKAGEINDEXDEPS += "apt-native:do_populate_sysroot"
-
-do_build[recrdeptask] += "do_package_write_deb"
diff --git a/meta/classes/package_ipk.bbclass b/meta/classes/package_ipk.bbclass
index c3b53854e8b..998e18ba6c1 100644
--- a/meta/classes/package_ipk.bbclass
+++ b/meta/classes/package_ipk.bbclass
@@ -274,9 +274,7 @@ python do_package_write_ipk () {
 do_package_write_ipk[dirs] = "${PKGWRITEDIRIPK}"
 do_package_write_ipk[cleandirs] = "${PKGWRITEDIRIPK}"
 do_package_write_ipk[depends] += "${@oe.utils.build_depends_string(d.getVar('PACKAGE_WRITE_DEPS'), 'do_populate_sysroot')}"
-addtask package_write_ipk after do_packagedata do_package
+addtask package_write_ipk after do_packagedata do_package before do_build
 
 PACKAGEINDEXDEPS += "opkg-utils-native:do_populate_sysroot"
 PACKAGEINDEXDEPS += "opkg-native:do_populate_sysroot"
-
-do_build[recrdeptask] += "do_package_write_ipk"
diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
index 88d861c0e75..60f8299d965 100644
--- a/meta/classes/package_rpm.bbclass
+++ b/meta/classes/package_rpm.bbclass
@@ -748,9 +748,7 @@ python do_package_write_rpm () {
 do_package_write_rpm[dirs] = "${PKGWRITEDIRRPM}"
 do_package_write_rpm[cleandirs] = "${PKGWRITEDIRRPM}"
 do_package_write_rpm[depends] += "${@oe.utils.build_depends_string(d.getVar('PACKAGE_WRITE_DEPS'), 'do_populate_sysroot')}"
-addtask package_write_rpm after do_packagedata do_package
+addtask package_write_rpm after do_packagedata do_package before do_build
 
 PACKAGEINDEXDEPS += "rpm-native:do_populate_sysroot"
 PACKAGEINDEXDEPS += "createrepo-c-native:do_populate_sysroot"
-
-do_build[recrdeptask] += "do_package_write_rpm"
-- 
2.32.0

