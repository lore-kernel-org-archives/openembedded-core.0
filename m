Return-Path: <frederic.martinsons@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C5A0C6FD1F
	for <webhook@archiver.kernel.org>; Sat, 25 Mar 2023 09:01:01 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web10.17973.1679734854156038401
 for <openembedded-core@lists.openembedded.org>;
 Sat, 25 Mar 2023 02:01:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=BdZ41cNn;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: frederic.martinsons@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id r11so3897565wrr.12
        for <openembedded-core@lists.openembedded.org>; Sat, 25 Mar 2023 02:01:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679734859;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dnYHM56JGcxr5h+2yU5uxNImNnPpnDCftF46cczRv+o=;
        b=BdZ41cNn3QQRJwMZcpOAJiGrhgXSRgilGDe/BKd68QHd7ANWa04X47Suln3ihIu1Dx
         B4fDudGkniykzVG7KVRwY/OL7h379EQGjCrmFW0RRlU2s/fDYrY67GmBm6CABe+KFrO3
         3K+SsT1P0TN6XF3IS1k+qmXUGoyfHJFzgqOu31aBuCXk8YjG/kPkodl8jmQFnhh40VdL
         nbBqTPt4AqjJx6GaA+TQNhxcSsT2zZkKNEO6n9IWZgbdguv2WahrKAfbktWikVanQ04K
         WOXCAJL+ELUUo3o8LNdsQXLUWtPYwTg+ocwZCUQViUPOMr+SVnN/DhBbPPnJoj5gl060
         K4mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679734859;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dnYHM56JGcxr5h+2yU5uxNImNnPpnDCftF46cczRv+o=;
        b=SRyqlpSDQYX8mKse9rt8RFKg6X1dfA1gYACc2mGyQo+uKxdMJSbhOpkt4gADa8zZLr
         vdbLMC2nWwb2F2SIYLWsh86YRtCwvhqFECurs1p5AMI3pX31RKPkiddJQf8UlgcSFTtG
         qdw5CK3qSq1Zq2uytCtQ4lN2oNvwFY28FVrAqEEH8dQEspYonKco3VREUFIp3SNosEDr
         1r8e4eFKJHQYHWJeAYvXfBlQQR2XjxICFfPycN6fZKRtzbsGZBt+m3P123eQJJVhdFqJ
         DvCQFcTkAaJu+wi70EGef/vjY7gYt0tw1uDODxSNq5zd0gdayey5EQl103q9fcFgU/T5
         9C1w==
X-Gm-Message-State: AAQBX9e9zt13S7zdIp+WSvJyhiegeIRdtQl/+0eSprPWoUQ0XGWz5nE9
	PKJU/fQWlJRu8fFV8FfdTjr2UQCgONw=
X-Google-Smtp-Source: AKy350azKGsp3RrIHD0ue7WkyY0yupmJJkpaHYcIVIPXCeIKLNvRoY1vK1dMYjSz8dsT7j19gTOuXQ==
X-Received: by 2002:a5d:6641:0:b0:2da:9606:65f7 with SMTP id f1-20020a5d6641000000b002da960665f7mr4715826wrw.52.1679734859498;
        Sat, 25 Mar 2023 02:00:59 -0700 (PDT)
Received: from work-pc.. ([2a01:e0a:8d5:c6c0:a02e:c702:681f:71a5])
        by smtp.gmail.com with ESMTPSA id c16-20020adffb50000000b002c56179d39esm20226621wrs.44.2023.03.25.02.00.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Mar 2023 02:00:58 -0700 (PDT)
From: frederic.martinsons@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: alex.kiernan@gmail.com
Subject: [PATCH 4/5] devtool: add support for multiple git url inside a cargo based recipe
Date: Sat, 25 Mar 2023 10:00:34 +0100
Message-Id: <b48dd61e593e57d7673b65a34a44cd304cb7b7b8.1679734210.git.frederic.martinsons@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1679734210.git.frederic.martinsons@gmail.com>
References: <cover.1679734210.git.frederic.martinsons@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 25 Mar 2023 09:01:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179093

From: Frederic Martinsons <frederic.martinsons@gmail.com>

Without that, the possible git urls that are in SRC_URI of a recipe
are sucked up during a devtool modify on the recipe.

Let's treat these dependency as local ones by using a new
dedicated variable to be set in the recipe and which will
contains the url of such dependencies.

Signed-off-by: Frederic Martinsons <frederic.martinsons@gmail.com>
---
 meta/classes-recipe/cargo_common.bbclass               | 7 +++++++
 meta/classes/externalsrc.bbclass                       | 3 +++
 meta/recipes-extended/rust-example/zvariant-crates.inc | 5 +++++
 3 files changed, 15 insertions(+)

diff --git a/meta/classes-recipe/cargo_common.bbclass b/meta/classes-recipe/cargo_common.bbclass
index 82ab25b59c..358c7d7ed2 100644
--- a/meta/classes-recipe/cargo_common.bbclass
+++ b/meta/classes-recipe/cargo_common.bbclass
@@ -33,6 +33,13 @@ CARGO_DISABLE_BITBAKE_VENDORING ?= "0"
 # Used by libstd-rs to point to the vendor dir included in rustc src
 CARGO_VENDORING_DIRECTORY ?= "${CARGO_HOME}/bitbake"
 
+# Contains a list of crate that are fetch on a git
+# repository instead of from crates.io
+# This is useful when devtool'ing a rust recipe
+# and still patch the path of these dependencies
+# to get these dependencies locally
+CARGO_GIT_DEPENDENCIES ?= ""
+
 CARGO_RUST_TARGET_CCLD ?= "${RUST_TARGET_CCLD}"
 cargo_common_do_configure () {
 	mkdir -p ${CARGO_HOME}/bitbake
diff --git a/meta/classes/externalsrc.bbclass b/meta/classes/externalsrc.bbclass
index 26c5803ee6..b8ffeb8614 100644
--- a/meta/classes/externalsrc.bbclass
+++ b/meta/classes/externalsrc.bbclass
@@ -65,6 +65,7 @@ python () {
 
         local_srcuri = []
         fetch = bb.fetch2.Fetch((d.getVar('SRC_URI') or '').split(), d)
+        cargo_git_deps = (d.getVar('CARGO_GIT_DEPENDENCIES') or '').split()
         for url in fetch.urls:
             url_data = fetch.ud[url]
             parm = url_data.parm
@@ -72,6 +73,8 @@ python () {
                     url_data.type == 'npmsw' or url_data.type == 'crate' or
                     'type' in parm and parm['type'] == 'kmeta'):
                 local_srcuri.append(url)
+            if url in cargo_git_deps:
+                local_srcuri.append(url)
 
         d.setVar('SRC_URI', ' '.join(local_srcuri))
 
diff --git a/meta/recipes-extended/rust-example/zvariant-crates.inc b/meta/recipes-extended/rust-example/zvariant-crates.inc
index 297a784661..074ac1934e 100644
--- a/meta/recipes-extended/rust-example/zvariant-crates.inc
+++ b/meta/recipes-extended/rust-example/zvariant-crates.inc
@@ -125,11 +125,16 @@ SRC_URI += " \
     crate://crates.io/winnow/0.4.0 \
     crate://crates.io/zvariant_derive/3.12.0 \
     crate://crates.io/zvariant_utils/1.0.0 \
+"
+
+CARGO_GIT_DEPENDENCIES = " \
     git://github.com/gtk-rs/glib;protocol=https;nobranch=1;name=glib;destsuffix=glib \
     git://github.com/gtk-rs/sys;protocol=https;nobranch=1;name=glib-sys;destsuffix=glib-sys;subpath=glib-sys \
     git://github.com/gtk-rs/sys;protocol=https;nobranch=1;name=gobject-sys;destsuffix=gobject-sys;subpath=gobject-sys \
 "
 
+SRC_URI += "${CARGO_GIT_DEPENDENCIES}"
+
 SRCREV_FORMAT .= "_glib"
 SRCREV_glib = "c9ee583cea07830c099cdcccd33eda9ef705ea93"
 
-- 
2.34.1


