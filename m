Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E333C47074
	for <webhook@archiver.kernel.org>; Thu, 28 Dec 2023 14:59:49 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web11.124152.1703775584961402441
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Dec 2023 06:59:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=G2U0Ygcn;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-40d5aef534eso20599325e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 28 Dec 2023 06:59:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703775582; x=1704380382; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7t/bon7ntSaI6UgtKsSTYZApxmnz9G1f0pFSJkTOKCI=;
        b=G2U0YgcnvAFdJrR1+dsANkspegMSH85CFMMlD+nv5Za3qlFJzctk3+FFmrwQ5hFUHT
         FixCG7YNgwsSN/V0+wJEvCi5D4ezhBcWd10okh/PHJrXcZ6PyHEHEUhxqZoqZK2/2v2v
         SbE02jXXD8axiTqfjEhgvb2rMqIGf1zRpFw/AzAlL3BfpexZ0sX6ugU+AqH3+TdPk7WN
         d4XqQahvGKc/5eREkN63bwvwl2OF2KxZKz4hkYy0wKG6Rfh/iUmpvSS7MfL1X26gxNGx
         JtPP2ne1K1jkVXm8p0uPctMupP8za1EdEERoPoyMB34CGdvP24D0IwnxbEXZPOmGHInL
         gGWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703775582; x=1704380382;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7t/bon7ntSaI6UgtKsSTYZApxmnz9G1f0pFSJkTOKCI=;
        b=u3yFIBNlRmZae0Nw7vWL434fDP4gjZsK7KOBJXIEEEeUPnkA4WDTw0BqVerluue0fL
         gM75ssn5uEThSkwlgQuQbPelJSCQ8N93figGjDuXYYZkk47movwH7IOWObC4+c+cT+jh
         OYxWpx+E52queilSYDv2Xi/GBkUDJ8jrVoNi3Z7KTotCSRnuRDgKSn3Ib2B8HjfMHbXm
         sha0PtbHfcjWyRPiXm+dS1QuKe8S3Ni9ql8dKq5vfefuL0XUN3goAc9ulTm0MSVNe/0w
         G9pdWzFTeYjNGh6yR0qWIhFGWc+4xxDIXIlI7r9Fm3VRTR3Lb9Q+KDU+wbr38pw6OO01
         ufUQ==
X-Gm-Message-State: AOJu0Yxk7nMrNjej76FRtE7PbO+dk/Zu96Ssx24D0IqA9XOOrw7GjwNJ
	nWBLVw/6MKDcnHJx63CGhvQ1LJEW18g=
X-Google-Smtp-Source: AGHT+IFDdWYRLeAXgeNWpihOyxZLTK3rgOwTvrrsoIZmx4pC3hXfmx4rDVfbEOl9RpXumHgqMOCDQA==
X-Received: by 2002:a05:600c:4fd3:b0:40d:5e74:89e8 with SMTP id o19-20020a05600c4fd300b0040d5e7489e8mr1297539wmq.55.1703775582463;
        Thu, 28 Dec 2023 06:59:42 -0800 (PST)
Received: from Zuma-000004PC.lan (cust18-dsl93-89-130.idnet.net. [93.89.130.18])
        by smtp.gmail.com with ESMTPSA id c12-20020a05600c0a4c00b0040d6ffae526sm1461523wmq.39.2023.12.28.06.59.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Dec 2023 06:59:41 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Frederic Martinsons <frederic.martinsons@gmail.com>,
	Alex Kiernan <alex.kiernan@gmail.com>
Subject: [OE-Core][PATCH v3 03/10] meta-selftest: hello-rs: Simple rust test recipe
Date: Thu, 28 Dec 2023 14:59:10 +0000
Message-Id: <20231228145917.18147-4-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20231228145917.18147-1-alex.kiernan@gmail.com>
References: <20231228145917.18147-1-alex.kiernan@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Dec 2023 14:59:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192985

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

(no changes since v1)

 .../hello-rs/hello-rs-crates.inc              |  8 +++++++
 .../hello-rs/0001-Greet-OE-Core.patch         | 24 +++++++++++++++++++
 .../hello-rs/hello-rs_0.1.0.bb                | 19 +++++++++++++++
 3 files changed, 51 insertions(+)
 create mode 100644 meta-selftest/recipes-extended/hello-rs/hello-rs-crates.inc
 create mode 100644 meta-selftest/recipes-extended/hello-rs/hello-rs/0001-Greet-OE-Core.patch
 create mode 100644 meta-selftest/recipes-extended/hello-rs/hello-rs_0.1.0.bb

diff --git a/meta-selftest/recipes-extended/hello-rs/hello-rs-crates.inc b/meta-selftest/recipes-extended/hello-rs/hello-rs-crates.inc
new file mode 100644
index 000000000000..9646482b2875
--- /dev/null
+++ b/meta-selftest/recipes-extended/hello-rs/hello-rs-crates.inc
@@ -0,0 +1,8 @@
+# Autogenerated with 'bitbake -c update_crates hello-rs'
+
+# from Cargo.lock
+SRC_URI += " \
+    crate://crates.io/figlet-rs/0.1.5 \
+"
+
+SRC_URI[figlet-rs-0.1.5.sha256sum] = "4742a071cd9694fc86f9fa1a08fa3e53d40cc899d7ee532295da2d085639fbc5"
diff --git a/meta-selftest/recipes-extended/hello-rs/hello-rs/0001-Greet-OE-Core.patch b/meta-selftest/recipes-extended/hello-rs/hello-rs/0001-Greet-OE-Core.patch
new file mode 100644
index 000000000000..7569ccef7bbb
--- /dev/null
+++ b/meta-selftest/recipes-extended/hello-rs/hello-rs/0001-Greet-OE-Core.patch
@@ -0,0 +1,24 @@
+From 3aea1ece0ca6ac0bf0ffe42736827af22966f767 Mon Sep 17 00:00:00 2001
+From: Alex Kiernan <alexk@zuma.ai>
+Date: Wed, 27 Dec 2023 09:55:48 +0000
+Subject: [PATCH] Greet "OE-Core"
+
+Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
+Upstream-Status: Inappropriate
+---
+ src/main.rs | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/main.rs b/src/main.rs
+index f4a310758b19..224eca65c38d 100644
+--- a/src/main.rs
++++ b/src/main.rs
+@@ -3,7 +3,7 @@ use hello_lib::greet;
+ 
+ fn main() {
+     let standard_font = FIGfont::standard().unwrap();
+-    let greeting = greet(None);
++    let greeting = greet(Some("OE-Core"));
+     let figure = standard_font.convert(&greeting);
+     println!("{}", figure.unwrap());
+ }
diff --git a/meta-selftest/recipes-extended/hello-rs/hello-rs_0.1.0.bb b/meta-selftest/recipes-extended/hello-rs/hello-rs_0.1.0.bb
new file mode 100644
index 000000000000..0046b2ca0356
--- /dev/null
+++ b/meta-selftest/recipes-extended/hello-rs/hello-rs_0.1.0.bb
@@ -0,0 +1,19 @@
+SUMMARY = "Simple hello world example"
+HOMEPAGE = "https://github.com/akiernan/hello-bin"
+LICENSE = "Unlicense"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=7246f848faa4e9c9fc0ea91122d6e680"
+
+SRC_URI = "git://github.com/akiernan/hello-bin.git;protocol=https;branch=main;subpath=rust \
+           file://0001-Greet-OE-Core.patch \
+           git://github.com/akiernan/hello-lib.git;protocol=https;branch=main;name=hello-lib;destsuffix=hello-lib;type=git-dependency \
+	   "
+SRCREV = "d3d096eda182644868f8e7458dcfa538ff637db3"
+
+SRCREV_FORMAT .= "_hello-lib"
+SRCREV_hello-lib = "59c84574e844617043cf337bc8fa537cf87ad8ae"
+
+S = "${WORKDIR}/rust"
+
+inherit cargo cargo-update-recipe-crates ptest-cargo
+
+require ${BPN}-crates.inc
-- 
2.39.0


