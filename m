Return-Path: <pgowda.cve@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38F92ECAAD3
	for <webhook@archiver.kernel.org>; Sun,  4 Sep 2022 07:04:14 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com
 [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web08.10982.1662275051283786451
 for <openembedded-core@lists.openembedded.org>;
 Sun, 04 Sep 2022 00:04:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=XfFWb2oI;
 spf=pass (domain: gmail.com, ip: 209.85.216.53,
 mailfrom: pgowda.cve@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id
 o2-20020a17090a9f8200b0020025a22208so2148317pjp.2
        for <openembedded-core@lists.openembedded.org>;
 Sun, 04 Sep 2022 00:04:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=IkYl5GLIBqetVfxc4GzlRHWksBxOZF2GDIuklHiBHGI=;
        b=XfFWb2oIn8txXC8jxmvk9/trwTMIwXS3PUx6ATfCOKYOJYQcAz5z9VLYJO+pRQcFU9
         +BAn2FrPo+JE+OwP2ekPOrPJ7AdDiEdUO6pOkNQHx2agKqCNdrH/wnOa6SmO/pH7RbM2
         WNsaIXGBu76NXSfuM+zfHaktnz0O1IW26vHKfzHMA//QaWVFgDsDvMSAapAKa9LSCGYR
         /LRYCreDTctIdFxkMvBiCvG8GZLyW7fdjl7g6lyKUf7GPPXS0lPfe7cdtMRjp9TL0jtb
         q9fQRcUeJDotSQn15Bay3U3BQXjtnEYo9e0gnOOzFylgJ0NqSG4chSaAfLK33nAE/H/i
         CCkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=IkYl5GLIBqetVfxc4GzlRHWksBxOZF2GDIuklHiBHGI=;
        b=UeGcBysg/NyGIY1LvSoNkSu5W3xxaDpPS+JJZwRfF+bUTaZkPqdDyun7HJgBerKjGN
         Kp0ThEdrrHtNmTUFBNT3Xcbp71UgIf3tldfvoKrSJmZz47NunGsoL6Yqq2zV/agiG6W6
         Q0669CMg+DsjcZ4n48+o3boULyTe8rh9/m4pFvLkFOLTvQwlJjZnXNw8QDZHlmr13Y//
         W43h6EtvVaEBHA+ls71iboaqpLIKP23odpq5EMCdYvETExkV18xx4vwnpnyruk/FT1BG
         QrH366F0kAZek8doF5XFkRwTluzs9FKl+CWDmVBLpglg2mWCwUsy7L78LT9sh1v0N1zt
         62Hg==
X-Gm-Message-State: ACgBeo3QRuRbpq5Q9Fvj7Cjcn9qAkIsDw7vlpfkrKZ83tziZuQNx+vi1
	uwIQwlqqGcAz1DhxmMZ8bUti5759XUY=
X-Google-Smtp-Source: 
 AA6agR6BDV1rTbwjfi7AEywbEBKYkUOcM8EDTHAG/6wC6Yw3kWZpWUR09I06X9DdzGbC/ZCDu9RK9g==
X-Received: by 2002:a17:902:d4c1:b0:174:3ce8:dd96 with SMTP id
 o1-20020a170902d4c100b001743ce8dd96mr42311179plg.80.1662275050202;
        Sun, 04 Sep 2022 00:04:10 -0700 (PDT)
Received: from localhost.localdomain ([49.204.85.206])
        by smtp.gmail.com with ESMTPSA id
 i11-20020a056a00004b00b0053ba52b49a3sm1318435pfk.25.2022.09.04.00.04.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Sep 2022 00:04:09 -0700 (PDT)
From: pgowda.cve@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: richard.purdie@linuxfoundation.org,
	Randy.MacLeod@windriver.com,
	vinay.m.engg@gmail.com,
	pgowda <pgowda.cve@gmail.com>
Subject: [PATCH] rust: Add linker configurations for cross compilation
Date: Sun,  4 Sep 2022 12:34:03 +0530
Message-Id: <20220904070403.2706101-1-pgowda.cve@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 04 Sep 2022 07:04:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170276

From: pgowda <pgowda.cve@gmail.com>

Adds the cross compilation linker for build, host and target.
Ensure the main rust config has the appropriate sections added
to match the configurations.

Signed-off-by: pgowda <pgowda.cve@gmail.com>
---
 meta/recipes-devtools/rust/rust.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/rust/rust.inc b/meta/recipes-devtools/rust/rust.inc
index 284347dedc..20fd797a90 100644
--- a/meta/recipes-devtools/rust/rust.inc
+++ b/meta/recipes-devtools/rust/rust.inc
@@ -81,6 +81,7 @@ python do_configure() {
 
     config.set(host_section, "cxx", e(d.expand("${RUST_TARGET_CXX}")))
     config.set(host_section, "cc", e(d.expand("${RUST_TARGET_CC}")))
+    config.set(host_section, "linker", e(d.expand("${RUST_TARGET_CCLD}")))
     if "musl" in host_section:
         config.set(host_section, "musl-root", e(d.expand("${STAGING_DIR_HOST}${exec_prefix}")))
 
@@ -94,6 +95,7 @@ python do_configure() {
 
         config.set(build_section, "cxx", e(d.expand("${RUST_BUILD_CXX}")))
         config.set(build_section, "cc", e(d.expand("${RUST_BUILD_CC}")))
+	config.set(build_section, "linker", e(d.expand("${RUST_BUILD_CCLD}")))
 
     target_section = "target.{}".format(d.getVar('RUST_TARGET_SYS', True))
     if target_section != host_section and target_section != build_section:
@@ -103,6 +105,7 @@ python do_configure() {
 
         config.set(target_section, "cxx", e(d.expand("${RUST_TARGET_CXX}")))
         config.set(target_section, "cc", e(d.expand("${RUST_TARGET_CC}")))
+	config.set(target_section, "linker", e(d.expand("${RUST_TARGET_CCLD}")))
 
     # [llvm]
     config.add_section("llvm")
-- 
2.25.1


