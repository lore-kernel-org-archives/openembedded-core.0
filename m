Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 462C2CD4F54
	for <webhook@archiver.kernel.org>; Wed, 20 May 2026 08:21:12 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7284.1779265271577980698
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 May 2026 01:21:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=s1csIvcU;
 spf=pass (domain: smile.fr, ip: 209.85.221.47, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-449de065cb3so4187553f8f.2
        for <openembedded-core@lists.openembedded.org>; Wed, 20 May 2026 01:21:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1779265270; x=1779870070; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6HJKg1tJy9aiC63wH7W7apZNAv2shqC1M9hJbeiBrMg=;
        b=s1csIvcU3qn5eY/bZK7UM6YdU8nWAJs/SXkmcFA/WGp+qjA8Y1xnbi7uuVAnjsMDV4
         bQYcbPL4oQBfcb/lCdNyROYHxLNH+K9HJ+d7j3fHsGtQV+QGUSWFOZ4K6uppOPFTANvk
         GwOGTPtRYmOjAJM3N4IcGAnH4+Cn46OboAf24=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779265270; x=1779870070;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6HJKg1tJy9aiC63wH7W7apZNAv2shqC1M9hJbeiBrMg=;
        b=R+ohz2gTHQGfuMUcebMemEcMn9GCnhheilsntJxl/cVjpVLnFyNmnHkYgSS/LBa8R6
         rQxIeEWEkKD8jaPtJcbabxyXqMIKPgaKNGp8zFZsklv9odopxRxDXk5545rOSWs48Izf
         N/GGKv9fbB2b8uL+Kk+/kShCYNcSyhgoC0LZLOzKf0H7ZQnlwJeekMSxcpu8NHixigbd
         dErTeNya9d99HZ2Sydd+JnowEVKu3RxyYozIVgwpPD1eX+i4xrVXEX5nr3ZQrijW3Ld9
         WOwkubQWueBS6s0Q7l1dkjrWSkcVjDFszd2sbrqOXQ9lY10xDwNyY3oJM6d/0fLpS98B
         Bhiw==
X-Gm-Message-State: AOJu0Yy9Bsf83e9NQCLbO8aFrDAgMMvMDokiclv/v5A/qw3zTTg6f/Gy
	pmjMCe17uxlk7EFo3z6al9zpqS5BiaWpDKYn02Aa8Olhnf45Na2U6Y7PObKcemcgK9CZBPOLLim
	oeZzm
X-Gm-Gg: Acq92OE9GSHg08o+ZsGAmX0XMP5yqnZtS/N0oQ9FcKVuallVT8Le7Cd/EpszzuJ/mnQ
	65fRwc68YuU9gPkqA6D2y5oiWA2HwNvpEIlMAf3CG8sHfe1a7/TaV7qwZwa49xxCf9VrRNFfePk
	m3z+b3FXKyYfLhIooWBY85cf4eqiGnvjNqv8hAbUjT+njPhQEFzScaprYOcSvhw2r8pE0JrHMRB
	8njH+fD7Kcd7+CUAR3eTqtLpVJR4ITYZUhNtfBiZo1Hv9YWinhIotZwK6lW/qj8nApmio6735Rg
	7266SIaP9IToZ6AMfUwIrR7/BIbb4lZim6mROvEHktxzgSYlHOUimkwYzzSvRBVLDW3SnNIPAlz
	eVjpm86vnd3Ds9oRGHCsk/r04gDPMZHpiklgt+M9dSMKqMj0k9PhU1+Px7L1WLID2A+6GG1SIUe
	Eb7k6WtPNYa9663Cmv7KnSMZgodsRJ6fSZq6CKrEDuZa4lMm52+TbiLzbnWS1NEv/sX3lTM/XOu
	t5PUemdbJrQT2FEW84U/1O9kCuf
X-Received: by 2002:adf:ecd1:0:b0:45e:73a5:e1ed with SMTP id ffacd0b85a97d-45e73a5e543mr19043076f8f.27.1779265269809;
        Wed, 20 May 2026 01:21:09 -0700 (PDT)
Received: from localhost.localdomain (2a02-8440-250c-63aa-0256-2b9f-d16e-d784.rev.sfr.net. [2a02:8440:250c:63aa:256:2b9f:d16e:d784])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45d9ec39ff1sm56350642f8f.10.2026.05.20.01.21.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 01:21:09 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose v2 16/28] oe-pkgdata-util: fix empty runtime-rprovides directory handling
Date: Wed, 20 May 2026 10:20:17 +0200
Message-ID: <941cc0a8f8bf88fa9a66e26debb518bc664e418f.1779264709.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1779264709.git.yoann.congal@smile.fr>
References: <cover.1779264709.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 May 2026 08:21:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237415

From: Sam Kent <sam.john.kent@gmail.com>

An empty runtime-provides directory caused lookup-recipe, package-info
and list-pkg-files to skip the runtime-reverse fallback.

Use os.listdir() to ensure the folder is not empty and use
os.path.isdir( to ensure it is not a file.

Signed-off-by: Sam Kent <sam.john.kent@gmail.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 678c1c2077316b6b81ba9be000528b50dca19ca6)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 scripts/oe-pkgdata-util | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/scripts/oe-pkgdata-util b/scripts/oe-pkgdata-util
index bbfc6a2dddd..904008bd029 100755
--- a/scripts/oe-pkgdata-util
+++ b/scripts/oe-pkgdata-util
@@ -289,8 +289,9 @@ def lookup_recipe(args):
 
     for pkg in pkgs:
         providepkgpath = os.path.join(args.pkgdata_dir, "runtime-rprovides", pkg)
-        if os.path.exists(providepkgpath):
-            for f in os.listdir(providepkgpath):
+        rprovides = os.listdir(providepkgpath) if os.path.isdir(providepkgpath) else []
+        if rprovides:
+            for f in rprovides:
                 if f != pkg:
                     print("%s is in the RPROVIDES of %s:" % (pkg, f))
                 pkgdatafile = os.path.join(args.pkgdata_dir, "runtime", f)
@@ -355,8 +356,9 @@ def package_info(args):
 
     for pkg in packages:
         providepkgpath = os.path.join(args.pkgdata_dir, "runtime-rprovides", pkg)
-        if os.path.exists(providepkgpath):
-            for f in os.listdir(providepkgpath):
+        rprovides = os.listdir(providepkgpath) if os.path.isdir(providepkgpath) else []
+        if rprovides:
+            for f in rprovides:
                 if f != pkg:
                     print("%s is in the RPROVIDES of %s:" % (pkg, f))
                 pkgdatafile = os.path.join(args.pkgdata_dir, "runtime", f)
@@ -507,8 +509,9 @@ def list_pkg_files(args):
 
         else:
             providepkgpath = os.path.join(args.pkgdata_dir, "runtime-rprovides", pkg)
-            if os.path.exists(providepkgpath):
-                for f in os.listdir(providepkgpath):
+            rprovides = os.listdir(providepkgpath) if os.path.isdir(providepkgpath) else []
+            if rprovides:
+                for f in rprovides:
                     if f != pkg:
                         print("%s is in the RPROVIDES of %s:" % (pkg, f))
                     pkgdatafile = os.path.join(args.pkgdata_dir, "runtime", f)

