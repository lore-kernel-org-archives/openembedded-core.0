Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0B35F513E5
	for <webhook@archiver.kernel.org>; Thu,  5 Mar 2026 22:30:50 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.56815.1772749841566626601
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Mar 2026 14:30:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZalVi0kX;
 spf=pass (domain: gmail.com, ip: 209.85.221.48, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-439ac15f35fso5306392f8f.0
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Mar 2026 14:30:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772749840; x=1773354640; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Q5v/zXaDOZEX2YUAnSxAJ9pUN+KbI8MQC+v1+YQrwtM=;
        b=ZalVi0kXCrJSAJl+q76vtyngI4OyJ8ULbSSs19Y9n1Nt3Eibnvlv/LKWKK5JTEx+es
         Yth3cFooT4/E5gFuHzEDj7oK587EAVbEy8W5BD4qnDbhng70JpQV8/tt8q09wCoPTxuU
         JZxrYxMzoFdX9TM0okPZtsQgje3zFPvQEJfMYhqv8jin+otdKIHlz2+JNsvU3kOmwRjY
         klWRN2x2ohcwUiSUjsq73FgjIlE1EzGO275icVomOeDQhQBrXpy+WPBBtG0jk/nY6nXG
         1oU1piXbmlHl/1z0XKIphu9pakFSgIDYB/SBH+B0v9peKP3Mvd/NdSYzFF5Ns/OrNDaT
         f+rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772749840; x=1773354640;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q5v/zXaDOZEX2YUAnSxAJ9pUN+KbI8MQC+v1+YQrwtM=;
        b=t3i4ELK1LRrfmDRDGzcI0H6YogN4RLFV93Aijx8fvuke0h0nz5UgisK0hV35V6zg7C
         YoGjGoeXmJeucwqV5E/bWcejUhw6IJ8ScqFdU2qWjvyjBzn6Hc84Q8Lksdu0Y9obZV6X
         xbopakBBepV75ZSlGIWPrmWoCVSfglDcO1GaOQj8FhCQGWUXOrZ5+pA6pSpp4HJRIZe1
         f/0Av0Bu7nuIjLNE2hiO3w5kofk3giEPskM/Q4dwwIwZ5EZ2yIydIqc8uzjozo6ujSBe
         YTtBXECiw0PoLjllQO5OT17ArCtjU3hwGCSLvhHN9zr7yVpo/Gtn+YY8wDt2tZVTqNco
         t8Ng==
X-Gm-Message-State: AOJu0Yy6fT34dfl6wkzI1Ptkx2db1GiKFLXS40zXkXUTjsG1zhZfYSkI
	a8Wu9jHLGTf0ef1nb5lgzSGcDqrkBWVR3BvMGChj/EYm8IL238OCdkqpFueDFMlR
X-Gm-Gg: ATEYQzzReYZub/Mv4Fcz1eXatHew3ogR7+v3PIF6X50VVqw4KLZtLmFmjcWmo02WeX0
	9wDvReFB4facOFdY9O4tETyYa8BT7ewYyKGd7Qn3+X0bWZBY/nGXCQ7/YXKGh4lNeBRgwWh+4ah
	W22rpAo4xeO+TGz3p3cTSVuF0yenbK+X3z2+PvujjMj5kw8nfGGsISiVJ0JYjJNqoPzXmcGeNTK
	Tz+Axyw3t7ttDDoDzIQGpAaiykJxTimOMFN2+MQbyb/ENetf4Ajb4wItpwh1M3SSl/6LPD5WQz2
	BlSN8zakJOv+5AH4cXRZ1muC8Os9sZX8Sto/ADn7BUThJSDlyJRPELmU2xrmnJixdlb/SCmc1TK
	eSVf0wtvQgBnYp9tZq0TG/pIETZfkSEsBvK32rxqT/pDy5/aLRD3/Fzt4bIc96B1iK/TJlW6lj0
	KPv9FdI5BpvN1EzhiEy91ZfVAXww==
X-Received: by 2002:a05:600c:1d09:b0:483:6f37:1b51 with SMTP id 5b1f17b1804b1-4851988366bmr131983225e9.23.1772749839722;
        Thu, 05 Mar 2026 14:30:39 -0800 (PST)
Received: from localhost ([109.238.218.228])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4851fad02a2sm100367025e9.2.2026.03.05.14.30.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 14:30:39 -0800 (PST)
From: martin.jansa@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [PATCH v3] license_image.bbclass: report all packages with incompatible license
Date: Thu,  5 Mar 2026 23:30:31 +0100
Message-ID: <20260305223031.1777760-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Mar 2026 22:30:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232525

From: Martin Jansa <martin.jansa@gmail.com>

When multiple packages cannot be installed it shows only first one it
finds, because of bb.fatal use. It might require many iterations to find
all packages to avoid.

e.g. with ptest enabled and GPL-3.0-or-later, GPL-3.0-only set as
incompatible licenses you might get list like this for relatively small
image:

ERROR: image-1.0-r0 do_rootfs: Some packages cannot be installed into the image because they have incompatible licenses:
        bzip2-ptest (GPL-3.0-or-later)
        coreutils (GPL-3.0-or-later)
        coreutils-stdbuf (GPL-3.0-or-later)
        diffutils (GPL-3.0-or-later)
        findutils (GPL-3.0-or-later)
        gawk (GPL-3.0-or-later)
        gnutls-openssl (GPL-3.0-or-later)
        gnutls-ptest (GPL-3.0-or-later)
        grep (GPL-3.0-only)
        make (GPL-3.0-only)
        mpfr (LGPL-3.0-or-later)
        python3-dbusmock (GPL-3.0-only)
        readline (GPL-3.0-or-later)
        sed (GPL-3.0-or-later)

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
v2: change output format as suggested by Peter
v3: update expected error_msg in selftest

 meta/classes-recipe/license_image.bbclass        | 6 +++++-
 meta/lib/oeqa/selftest/cases/incompatible_lic.py | 4 ++--
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/meta/classes-recipe/license_image.bbclass b/meta/classes-recipe/license_image.bbclass
index 8332905da5..95e0a9ba2e 100644
--- a/meta/classes-recipe/license_image.bbclass
+++ b/meta/classes-recipe/license_image.bbclass
@@ -116,6 +116,7 @@ def write_license_files(d, license_manifest, pkg_dic, rootfs):
     bad_licenses = oe.license.expand_wildcard_licenses(d, bad_licenses)
     pkgarchs = d.getVar("SSTATE_ARCHS").split()
     pkgarchs.reverse()
+    incompatible_packages = []
 
     exceptions = (d.getVar("INCOMPATIBLE_LICENSE_EXCEPTIONS") or "").split()
     with open(license_manifest, "w") as license_file:
@@ -123,7 +124,7 @@ def write_license_files(d, license_manifest, pkg_dic, rootfs):
             remaining_bad_licenses = oe.license.apply_pkg_license_exception(pkg, bad_licenses, exceptions)
             incompatible_licenses = oe.license.incompatible_pkg_license(d, remaining_bad_licenses, pkg_dic[pkg]["LICENSE"])
             if incompatible_licenses:
-                bb.fatal("Package %s cannot be installed into the image because it has incompatible license(s): %s" %(pkg, ' '.join(incompatible_licenses)))
+                incompatible_packages.append("%s (%s)" % (pkg, ' '.join(incompatible_licenses)))
             else:
                 incompatible_licenses = oe.license.incompatible_pkg_license(d, bad_licenses, pkg_dic[pkg]["LICENSE"])
                 if incompatible_licenses:
@@ -171,6 +172,9 @@ def write_license_files(d, license_manifest, pkg_dic, rootfs):
                                        "The license listed %s was not in the "\
                                        "licenses collected for recipe %s"
                                        % (lic, pkg_dic[pkg]["PN"]), d)
+    if incompatible_packages:
+        bb.fatal("Some packages cannot be installed into the image because they have incompatible licenses:\n\t%s" % ("\n\t".join(incompatible_packages)))
+
     oe.qa.exit_if_errors(d)
 
     # Two options here:
diff --git a/meta/lib/oeqa/selftest/cases/incompatible_lic.py b/meta/lib/oeqa/selftest/cases/incompatible_lic.py
index 93884f5731..1395e5d137 100644
--- a/meta/lib/oeqa/selftest/cases/incompatible_lic.py
+++ b/meta/lib/oeqa/selftest/cases/incompatible_lic.py
@@ -107,7 +107,7 @@ MACHINE_ESSENTIAL_EXTRA_RDEPENDS:remove = "tar"
 
     def test_bash_default(self):
         self.write_config(self.default_config())
-        error_msg = "ERROR: core-image-minimal-1.0-r0 do_rootfs: Package bash cannot be installed into the image because it has incompatible license(s): GPL-3.0-or-later"
+        error_msg = "ERROR: core-image-minimal-1.0-r0 do_rootfs: Some packages cannot be installed into the image because they have incompatible licenses:\n\tbash (GPL-3.0-or-later)"
 
         result = bitbake('core-image-minimal', ignore_status=True)
         if error_msg not in result.output:
@@ -116,7 +116,7 @@ MACHINE_ESSENTIAL_EXTRA_RDEPENDS:remove = "tar"
     def test_bash_and_license(self):
         self.disable_class("create-spdx")
         self.write_config(self.default_config() + '\nLICENSE:append:pn-bash = " & SomeLicense"\nERROR_QA:remove:pn-bash = "license-exists"')
-        error_msg = "ERROR: core-image-minimal-1.0-r0 do_rootfs: Package bash cannot be installed into the image because it has incompatible license(s): GPL-3.0-or-later"
+        error_msg = "ERROR: core-image-minimal-1.0-r0 do_rootfs: Some packages cannot be installed into the image because they have incompatible licenses:\n\tbash (GPL-3.0-or-later)"
 
         result = bitbake('core-image-minimal', ignore_status=True)
         if error_msg not in result.output:

