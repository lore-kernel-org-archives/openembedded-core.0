Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB56CCFA47D
	for <webhook@archiver.kernel.org>; Wed, 23 Oct 2024 21:20:37 +0000 (UTC)
Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
 by mx.groups.io with SMTP id smtpd.web11.9346.1729718428441886454
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Oct 2024 14:20:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=atBYdjsR;
 spf=pass (domain: gmail.com, ip: 209.85.161.45, mailfrom: jpewhacker@gmail.com)
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-5ebc0dbc65dso127918eaf.1
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Oct 2024 14:20:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729718427; x=1730323227; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NXe9n/6kyb2fUA6cXYWPGENXN9SZWMHnKQZm0v3PsgQ=;
        b=atBYdjsR/kA9toWMoVHKDj0cPJw25MoBD20IXbckqb0fwS7c849c0r48sAJWciIg02
         FdWpTdyNTpX7RdCzYeq0k/CgKyuEOAbSLIbbVP1LjrP0XHF2FWJUi102FuY+RZ1Di7sx
         wjFYL1CgXdwPUMUcmulDK4TZrHCdZ4Fe7F/d2+1O9FbtWa9YJThuWKWhfJdykshg32Pk
         iHUesePrxAttnuR5kTnVP5Sb0VrF6hM3lhJZgydeEUpQ+7+NNt4Kudkt2+5HpLfTJATG
         GJOpbCMyAhLphDjW8EpZr05aQdISonBu1OReXM2I2VJSW2nkfsrAqIP1vWwc0nbLth4r
         L2LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729718427; x=1730323227;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NXe9n/6kyb2fUA6cXYWPGENXN9SZWMHnKQZm0v3PsgQ=;
        b=ADcBnTe0dQNZZGnkukv71FgtbyvHLsk9pWzLKZAPXhT40dLdZb3Rj+RiI3mPD2maKb
         PEIUKFLDIbRDCoVX/+ksl/OnzJJL5J8Jda50jRJQ5z/Rio9JHqMOa0CQRnV2YmAwNiR3
         R/JyR481eykprY/9Qp5LO6MSb4HtQh/C9NuODiJSIXVaAikgk+PiRq0LgGBcvlM5LV6q
         dxREYXysAlRb71uWg5gYY6hPe2Qoj+51SX80WulDfN+BBACoRd48hHoqQiEo5tZcWDAr
         JxS6+LN5moDn19LrlWOFUeRjXEZRpbF6BeMBUvyw2NiBoAdwOyQmUxg+CiwKGn6v3f2Y
         24vg==
X-Gm-Message-State: AOJu0YzOzpZrSW3vHypv2L6I/1ChXgdmK+tQ4WKdA7YzqLqIaO25KfJG
	Zp4/uyYE4jIBMDxDJwawLV2p/bbztHUt+8kghP5RdNsP4U9qCVtcyIWZKw==
X-Google-Smtp-Source: AGHT+IFuWDnLyQQjPzcdcUf50FoG+87vMucq0UpDxnJWJHgCdwD/fU8yhWKp7f1XiE1u1l1xIdpRqQ==
X-Received: by 2002:a05:6870:8a0a:b0:288:6644:9c1c with SMTP id 586e51a60fabf-28ccb39b1e0mr4310872fac.6.1729718427042;
        Wed, 23 Oct 2024 14:20:27 -0700 (PDT)
Received: from localhost.localdomain ([2601:282:4300:19e0::fbb0])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-28c79204699sm2681940fac.2.2024.10.23.14.20.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 14:20:25 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH v2 3/4] lib: package: Check incompatible licenses at packaging time
Date: Wed, 23 Oct 2024 15:15:21 -0600
Message-ID: <20241023212013.995247-4-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241023212013.995247-1-JPEWhacker@gmail.com>
References: <20241018220818.4042304-1-JPEWhacker@gmail.com>
 <20241023212013.995247-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Oct 2024 21:20:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206268

Instead of checking for incompatible licenses in the anonymous python
and setting '_exclude_incompatible-', (re)check all the packages in
populate_packages(). This ensures that all packages are processed, even
dynamically generated ones.

The use of the '_exclude-incompatible-' variable set in base.bbclass has
been the mechanism used for per-packages licenses since its it was added
as a feature (although with different names for the variable throughout
history). However, since this misses dynamic packages, calling
oe.license.skip_incompatible_package_licenses() a second time on the
actual final package set is a better solution.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/classes-global/base.bbclass | 1 -
 meta/lib/oe/package.py           | 6 +++---
 2 files changed, 3 insertions(+), 4 deletions(-)

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
diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py
index c213a9a3ca6..480408e41e3 100644
--- a/meta/lib/oe/package.py
+++ b/meta/lib/oe/package.py
@@ -1447,10 +1447,10 @@ def populate_packages(d):
 
     # Handle excluding packages with incompatible licenses
     package_list = []
+    skipped_pkgs = oe.license.skip_incompatible_package_licenses(d, pkgs):
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


