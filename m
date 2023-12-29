Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14A73C4707C
	for <webhook@archiver.kernel.org>; Fri, 29 Dec 2023 11:44:56 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web11.144487.1703850287466628653
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Dec 2023 03:44:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VvsZ8hLm;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-40d41555f9dso70599815e9.2
        for <openembedded-core@lists.openembedded.org>; Fri, 29 Dec 2023 03:44:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703850285; x=1704455085; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fQLymJwhOUDJ1M/zoIRhVAE0iZHuT8UWn5RdchrofdU=;
        b=VvsZ8hLmUewiRyjtzipRPC/MkizheZ/ATYbcwX3JrDZTT8DVYwNGdkpel+bbmX7ElP
         IsRFWLb+ypvWyeQwNT8Ez/BIujhP4r6DoyOqzgGylhhgbbQ1pY6fFmfTcYQEuVxHXiVM
         1Utywn8JlCXuQe/WYQGz2Skx7pXFfWaUWBCYjRfxWjhJ5RNML1aha+160XwPv/qqchO3
         oeb5WZ4IPa9pEIyD1MSiIO7IVC0itLH5fLo6DVit/u6fmqxJWK5rKY3WlMXWBKtA37Ai
         E2NI6TMmaebUup5bYVy0KjBxUgyAZC4YBnPgVOPRO1ZkCWmgZrnzryjlr2RTSyfm7AS5
         qWEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703850285; x=1704455085;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fQLymJwhOUDJ1M/zoIRhVAE0iZHuT8UWn5RdchrofdU=;
        b=MXgAqM/NceRM1bPZerv5z2OFEdMVPW4RcuRKGoe7ruiUyuFhT+1dFyMpfXQzknhxeR
         ZO7YmkEcZyVzN9Z3s87xQV8FC05urwu5oIrnaars3KjRzzATYUVC7pwvgnLeOMy3wvqF
         DF1AFcQaQhnhJNVmXK+WaJe7NixknQWyjmVP7+k16EOVS7rytZjtUTxfjjdneblGPbtQ
         SXnQ46HmiPVKwEHeE51wMZ7a0hIACG+qvFG6QmwpU6koSZX0n24ZIo4FDExzSUiCvD2B
         O8217s4cJAXoS4gLFo4SRPmEVlYUwnFySb1AFXcFIQcQSRcp0NFz/xm+qBT7eliyNKtc
         NHDA==
X-Gm-Message-State: AOJu0YyVPrNVX02sn5ZTRaip179tMvaOFw626afXptISmHZH9wIrKsWb
	sPcH2Ps7ZAzjuxACjbTDtO9SSKdQoT8=
X-Google-Smtp-Source: AGHT+IGbopFWH2FJ6/ayK2KyfI9JOIfWNH1HhOT9auHo/Oh1i7J3qWUpe47Lp3oTx6vGOIQ1SQrXcA==
X-Received: by 2002:a05:600c:3c9e:b0:40d:6473:c65e with SMTP id bg30-20020a05600c3c9e00b0040d6473c65emr1566230wmb.103.1703850285164;
        Fri, 29 Dec 2023 03:44:45 -0800 (PST)
Received: from Zuma-000004PC.lan (cust18-dsl93-89-130.idnet.net. [93.89.130.18])
        by smtp.gmail.com with ESMTPSA id l2-20020adfe582000000b003366cf8bda4sm19035525wrm.41.2023.12.29.03.44.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Dec 2023 03:44:44 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Frederic Martinsons <frederic.martinsons@gmail.com>,
	Alex Kiernan <alex.kiernan@gmail.com>
Subject: [OE-Core][PATCH v4 03/10] meta-selftest: hello-rs: Simple rust test recipe
Date: Fri, 29 Dec 2023 11:44:28 +0000
Message-Id: <20231229114435.27810-4-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20231229114435.27810-1-alex.kiernan@gmail.com>
References: <20231229114435.27810-1-alex.kiernan@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Dec 2023 11:44:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193006

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

Changes in v4:
- Mark hello-rs as EXCLUDE_FROM_WORLD as it's not reproducible

 .../hello-rs/hello-rs-crates.inc              |  8 +++++++
 .../hello-rs/0001-Greet-OE-Core.patch         | 24 +++++++++++++++++++
 .../hello-rs/hello-rs_0.1.0.bb                | 22 +++++++++++++++++
 3 files changed, 54 insertions(+)
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
index 000000000000..9a136f29788e
--- /dev/null
+++ b/meta-selftest/recipes-extended/hello-rs/hello-rs_0.1.0.bb
@@ -0,0 +1,22 @@
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
+# Remove this when the recipe is reproducible
+EXCLUDE_FROM_WORLD = "1"
+
+require ${BPN}-crates.inc
-- 
2.39.0


