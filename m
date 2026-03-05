Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50445EEF30F
	for <webhook@archiver.kernel.org>; Thu,  5 Mar 2026 06:58:50 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.38882.1772693927466190623
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Mar 2026 22:58:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XG38L6Y1;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-48372efa020so68013515e9.2
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Mar 2026 22:58:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772693926; x=1773298726; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/8h4aT9mhUusEdteaNXVM6mNEszroYLDq5vg0kLzYIk=;
        b=XG38L6Y1uHtkIJO0DxpRS/5YiW3sgBpUyw9Xq1Jmo9bDz4LeSsZFJeUgu+nWwEa7qJ
         /kzrKAE8vWbNXnXsnZm38OI4kTgAezga9kgoltIhOLQZv/WqSP7SzvmZ4kfFx1nk6Jb0
         0g+cLnv+Tqc5/EmzplSzvh1T+nVkJw1f7ef2DIiQPa1xH1d2wZ+FKQh1N1UORGxEbd0B
         1BzJyURCNHxM8crXmt52RFsQ5z/VWYSVkCFdVjKMds8+jPlny5yN056oYodgfzIOFwkO
         9vVRtiOYHBC23+qdRoWAxp2ywn6k5LdqzYDX0ztLlaGKCOdk2H1w4uFjZe+dbYSQHjZR
         1VyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772693926; x=1773298726;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/8h4aT9mhUusEdteaNXVM6mNEszroYLDq5vg0kLzYIk=;
        b=m8vsc9tGyMPf2N8U9+2YWOT0oj1OQgzYb1p9jPNQ5NOPjBKKT9VfxZ2HQF3XuPNTsh
         q1W35nqNnVi59a4pOS1ui4kVnkqIjX/3FqLpCKf5wTgE8aMIsojFl/X6LYPjFC1jLnmZ
         VLMDzTuUD8bFW27Nb/fzDbrgYrYu9yc6WvSk1jM5zu+Q81qzQ/hbrUYDI89cXTrRfh4y
         EnLkrz7SupUSROkiiootXtyhvnMnbrh6/0tZFMDSPEj3fOb6b6rddB2Te4CvMN01abVU
         yVSeJ4VDRWehqx3OR6SVPwpy/QTq77YbdBERHxTpBmlMposnIXuuT+7s/gFN8ntqOVpr
         F6pg==
X-Gm-Message-State: AOJu0YwvKPnmNdtf+nF0byEKleoEjD+/zfu6hRNTReKsTjaLcE+ppw5f
	7LPjmQhkPxI4dKFoPuNCylw52g2eoxJLt4tWhUBYubN98wyoblgNcsN9sOR6hKRL
X-Gm-Gg: ATEYQzx7eZGJ//6dZHa/RJisLZilI2LWnL0yrIg/z6W6DULIDGK6+9ldLCETPeO3Rpg
	H1xjzVpxSGGMeIL1RuYkegGeWr3diZCayhE+8hS0EUQTvPa3d6Dwnm0nRM+4pX5+h8SOGaqWnEn
	C8AgB8lGFPh/RprdMb3NKtEFh8OJksfbzLeIXvxqYGNLYte2T/JhBWfPy8rABAjYdXLRbGqZIFJ
	lanazzVbNHt7HT1Wc8Cx214ksOQu0RYXPKMVFpVcgiBxJkUtNRHhq7XgbXdPbHtUm7s/YiC5ITx
	eeTF55wK/Y4J2ZRwaqivBXa5zB+rco1Kr5/apnI2OtWqa9VE/nMNDrlNNPgajnWZH/SRBv3rDb6
	IrToUT92/9UEG35iXXUzMEoXsvUseZ7uXFkNGGFJ00wqIq5DKdhd0GGczPvAlcW7tw0RQ9su6PB
	Xlrq0aQu6b1BQceI0W4shBpWuPHdxF3YHqru1A
X-Received: by 2002:a05:600c:8715:b0:480:4d38:7abc with SMTP id 5b1f17b1804b1-48519849bc7mr83023485e9.11.1772693925554;
        Wed, 04 Mar 2026 22:58:45 -0800 (PST)
Received: from localhost ([109.238.218.228])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439b3cc2e65sm32909054f8f.2.2026.03.04.22.58.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 22:58:44 -0800 (PST)
From: martin.jansa@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [PATCH v2] license_image.bbclass: report all packages with incompatible license
Date: Thu,  5 Mar 2026 07:58:31 +0100
Message-ID: <20260305065831.2646172-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Mar 2026 06:58:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232448

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
 meta/classes-recipe/license_image.bbclass | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

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

