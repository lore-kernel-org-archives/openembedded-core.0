Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DEFEEDEBFC
	for <webhook@archiver.kernel.org>; Tue,  3 Mar 2026 23:42:59 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6842.1772581373482255250
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Mar 2026 15:42:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Rw8+X8yW;
 spf=pass (domain: gmail.com, ip: 209.85.221.50, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-439bc14dcf4so1549280f8f.1
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Mar 2026 15:42:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772581372; x=1773186172; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UoD0P+VtbP9PfzbjjduwPnT7MM9ckWA92TrinXymSoM=;
        b=Rw8+X8yWYOr27hQgSawm1/YBOP2JiP0Vtejb5Umv4+awExHMANl/LLka1epGqGH29i
         omYuw72VnUV4s61RwrXjYfrQPbOKLrmdb1Eqd6BnjrUldSSMdlFwlo9l2bL8ITF95UJ+
         YHOdcHPIv+781TxxAXUjS+4s2RbHsIq+FKtas1MZbZmnQ/WR8vep7VSvqMTLXV5sXSuE
         YosRf8iITM8e5PIJ3F9cvHul5N9nyDZRr54aTtLdL/hZmxIoJr0hsFI67QwbGQ5gE9MI
         gAYQtlOsog8nljtOiChNXPqAE0BtuSAetNRiT/9ILLhe9YC7QtvK8C4mALZ61ycfSuw4
         vUog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772581372; x=1773186172;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UoD0P+VtbP9PfzbjjduwPnT7MM9ckWA92TrinXymSoM=;
        b=w2IpHXVbROgiaKMKByX5QlvWSXJNcUwyYpt0UUhc1dtHIkjyYfTLYVn5LsloFN9Vbp
         ya+YLXg6CiV3T6mno2Q73EKs2/6JNjLPDfw0SpedP30q5knqYUcvv0rgqfsPjm68LWXw
         YXZQ006OLNSKzxRawVg69tat2rWUUdf+RgoEf5Mte+7aGnxzjHXLQaDgbHf6jdYH2jqN
         etN7CicLftMk/7zWhVn+otOTmaSo1z904wz0Svgno8ZKD/dQKqVs/d1gmY3Dhi3bCrKn
         9PlUZYlpnGOolSiT29eOucWIuQv69tMa2ZeiczuMqMojxZ8BcMN8FjFoQgqzMNKpzyGq
         u+LQ==
X-Gm-Message-State: AOJu0YyCLGFVAdmgk07xQfFR79IWlwNtLslKq83zZWOHOSHjlzLKPWdP
	sgeFzG4Pg/LVlsUGPO3GsCvlxPllR1G2tImNNSL41xY8pW4fV6r/z2PACPOnTdk7
X-Gm-Gg: ATEYQzw0oYeu2ycvpg2BUxNAzJLg2+ZUmch7tplHhj6sHQxjrDwXONQKmv4ayhcOxjl
	4JjjSEmqj265hZs1JCW88pDj/JHzHcuLQS23TmtFXIiroJVgm3LzvTP9pC0j3WEP30Fd7oDANBy
	tesHGHm8CTkdLZYEnjdv5gZ9ol+BlDeDayL/DhpdpQUNX4lMlH1/pQQjekJBgS4KA3fKn8b5Qwf
	CD3PK9fwi5F9NR50HOIczP6g0L2ks0ACMRc5l5e3F0f8lsvQ/IRAvJH66s3gmrKfpNQmqQcFzPi
	URTk07x0eyw7xZorRginRY0j6ol95R+Yyk1u1iJREC3VNN/LcQphX2JvdVMEZHRTw5li2w2PHHg
	ilHmF6zE6s/UH9oMOw4iLLaKj0wQQP67P0e+PIMDaX8LdCl85NoxBJ1ixlCfpFx4/XVLnh4XEnn
	O6rBaL9gY0TA+6xnCswNAa8/WYX4WSIh5AJ4Zr
X-Received: by 2002:a05:6000:220e:b0:439:ac8b:4106 with SMTP id ffacd0b85a97d-439c8a8e07cmr107483f8f.15.1772581371463;
        Tue, 03 Mar 2026 15:42:51 -0800 (PST)
Received: from localhost ([109.238.218.228])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439b4175fd2sm22593724f8f.14.2026.03.03.15.42.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 15:42:50 -0800 (PST)
From: martin.jansa@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [PATCH] license_image.bbclass: report all packages with incompatible license
Date: Wed,  4 Mar 2026 00:42:47 +0100
Message-ID: <20260303234247.8034-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Mar 2026 23:42:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232338

From: Martin Jansa <martin.jansa@gmail.com>

When multiple packages cannot be installed it shows only first one it
finds, because of bb.fatal use. It might require many iterations to find
all packages to avoid.

e.g. with ptest enabled and GPL-3.0-or-later, GPL-3.0-only set as
incompatible licenses you might get list like this for relatively small
image:

Some packages cannot be installed into the image because they have incompatible licenses: bzip2-ptest (GPL-3.0-or-later), coreutils (GPL-3.0-or-later), coreutils-stdbuf (GPL-3.0-or-later), diffutils (GPL-3.0-or-later), findutils (GPL-3.0-or-later), gawk (GPL-3.0-or-later), gnutls-openssl (GPL-3.0-or-later), gnutls-ptest (GPL-3.0-or-later), grep (GPL-3.0-only), make (GPL-3.0-only), mpfr (LGPL-3.0-or-later), python3-dbusmock (GPL-3.0-only), readline (GPL-3.0-or-later), sed (GPL-3.0-or-later)

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 meta/classes-recipe/license_image.bbclass | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/license_image.bbclass b/meta/classes-recipe/license_image.bbclass
index 8332905da5..252754727b 100644
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
+        bb.fatal("Some packages cannot be installed into the image because they have incompatible licenses: %s" % (', '.join(incompatible_packages)))
+
     oe.qa.exit_if_errors(d)
 
     # Two options here:

