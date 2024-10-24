Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F595D0BB62
	for <webhook@archiver.kernel.org>; Thu, 24 Oct 2024 19:04:53 +0000 (UTC)
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
 by mx.groups.io with SMTP id smtpd.web11.4450.1729796690504090780
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Oct 2024 12:04:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=G96TuwJ4;
 spf=pass (domain: gmail.com, ip: 209.85.210.53, mailfrom: jpewhacker@gmail.com)
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-71850708dc9so863258a34.0
        for <openembedded-core@lists.openembedded.org>; Thu, 24 Oct 2024 12:04:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729796689; x=1730401489; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hCUj0MaZWXTXMLYHMf7NbE3LSTYxwmYLulfzZkFKiDY=;
        b=G96TuwJ4LSSrEDtEub33lvJGyrgoxoJibiEpBibDwv13al0ggtFIMGS2rhMM6bXesz
         1mzUeZZaKIyV5PDT5vByh8GJev6qn13HlEjxq600sTCCKdh6IT5DVgCl5yvGlnfFmKxN
         0UZVlyxfx4GjwmRp0oSPO2exY1VcVO1dFPy9hLeWVp6u8Uxo4gij0Do6k/lzGBPLNq0z
         eAuJJcgLTxVb0HNbvo8PjRb6fnYCiwXiUoLjO5yMPDDi187Kv7vJLSFIUj/4Fee6W6G9
         u8a0giOzs6V38/h6sNSUGpIejdjQrwytvWAJoF/z85662oRnVvMTKDpphAyDs3rWMGYq
         xE7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729796689; x=1730401489;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hCUj0MaZWXTXMLYHMf7NbE3LSTYxwmYLulfzZkFKiDY=;
        b=wtYPd4whDR8u37EqBEA4O+cVrcDJNK+ive7xQ2e3ZjR6/xRrrmF+VIF2bKtyI9ppdP
         QYZafuuDRBDvsguMhV07t1syfLAfLFDOaqwgYrYMVNsIka2w6zKN3bmqK95t9vlsL8ee
         2ti3Vo7ooKDxtJybei7+AyhYH1yjlM7y/VeXVJqe4YqdUGRKA6fEW9ZtrF5qAyg0SCDp
         aKoRPJBrur+/01BLF60cDlhmDmmzJ9LeAsNhN36a3wzqr6Yp4dTA3dNjugTJkd8lwp+M
         KdszUjoQ4KORgvNvy+ByUeF2JnNrQJc6wn7E+8OhImmlt7w+Md9WVkZO+t5I1UiQ6f9S
         kE8A==
X-Gm-Message-State: AOJu0Yw9qtU1RsjM6A7303h/b9gAdIk6oTRPSrsoyCs3tlD1jMeI0wbq
	6tJhLYn6A4rL3/chEw9i+ktJTYyVI6upsL5NLbigyGjoPgZqrTpOWXzIuw==
X-Google-Smtp-Source: AGHT+IFrNu8X/iPK56/uiU8u9DtvL9vm2ap1gKoroyutTYhUKekO4bklchooVAc+0dTyRrJ8fosmSw==
X-Received: by 2002:a05:6830:43a6:b0:716:a62d:a79a with SMTP id 46e09a7af769-718598d9d5dmr2493903a34.29.1729796689074;
        Thu, 24 Oct 2024 12:04:49 -0700 (PDT)
Received: from localhost.localdomain ([2601:282:4300:19e0::4437])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7182ebd5af8sm2233242a34.55.2024.10.24.12.04.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 12:04:48 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH v3 3/4] lib: package: Check incompatible licenses at packaging time
Date: Thu, 24 Oct 2024 13:03:09 -0600
Message-ID: <20241024190438.3630946-4-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241024190438.3630946-1-JPEWhacker@gmail.com>
References: <20241023212013.995247-1-JPEWhacker@gmail.com>
 <20241024190438.3630946-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Oct 2024 19:04:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206306

Instead of checking for incompatible licenses in the anonymous python
and setting '_exclude_incompatible-', (re)check all the packages in
populate_packages(). This ensures that all packages are processed, even
dynamically generated ones.

The use of the '_exclude-incompatible-' variable set in base.bbclass has
been the mechanism used for per-packages licenses since it was added as
a feature (although with different names for the variable throughout
history). However, since this misses dynamic packages, calling
oe.license.skip_incompatible_package_licenses() a second time on the
actual final package set is a better solution.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/classes-global/base.bbclass    | 1 -
 meta/classes-global/package.bbclass | 4 ----
 meta/lib/oe/package.py              | 6 +++---
 3 files changed, 3 insertions(+), 8 deletions(-)

diff --git a/meta/classes-global/base.bbclass b/meta/classes-global/base.bbclass
index 5b8663f454d..b81e61fdb72 100644
--- a/meta/classes-global/base.bbclass
+++ b/meta/classes-global/base.bbclass
@@ -581,7 +581,6 @@ python () {
             if unskipped_pkgs:
                 for pkg in skipped_pkgs:
                     bb.debug(1, "Skipping the package %s at do_rootfs because of incompatible license(s): %s" % (pkg, ' '.join(skipped_pkgs[pkg])))
-                    d.setVar('_exclude_incompatible-' + pkg, ' '.join(skipped_pkgs[pkg]))
                 for pkg in unskipped_pkgs:
                     bb.debug(1, "Including the package %s" % pkg)
             else:
diff --git a/meta/classes-global/package.bbclass b/meta/classes-global/package.bbclass
index 6cd8c0140f2..9be1d6a5b17 100644
--- a/meta/classes-global/package.bbclass
+++ b/meta/classes-global/package.bbclass
@@ -447,10 +447,6 @@ def gen_packagevar(d, pkgvars="PACKAGEVARS"):
     for p in pkgs:
         for v in vars:
             ret.append(v + ":" + p)
-
-        # Ensure that changes to INCOMPATIBLE_LICENSE re-run do_package for
-        # affected recipes.
-        ret.append('_exclude_incompatible-%s' % p)
     return " ".join(ret)
 
 
diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py
index c213a9a3ca6..104b880b9e1 100644
--- a/meta/lib/oe/package.py
+++ b/meta/lib/oe/package.py
@@ -1447,10 +1447,10 @@ def populate_packages(d):
 
     # Handle excluding packages with incompatible licenses
     package_list = []
+    skipped_pkgs = oe.license.skip_incompatible_package_licenses(d, packages)
     for pkg in packages:
-        licenses = d.getVar('_exclude_incompatible-' + pkg)
-        if licenses:
-            msg = "Excluding %s from packaging as it has incompatible license(s): %s" % (pkg, licenses)
+        if pkg in skipped_pkgs:
+            msg = "Excluding %s from packaging as it has incompatible license(s): %s" % (pkg, skipped_pkgs[pkg])
             oe.qa.handle_error("incompatible-license", msg, d)
         else:
             package_list.append(pkg)
-- 
2.46.2


