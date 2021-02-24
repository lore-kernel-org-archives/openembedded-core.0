Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
 by mx.groups.io with SMTP id smtpd.web10.2004.1614135755959987928
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Feb 2021 19:02:36 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.1.11, mailfrom: randy.macleod@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 11O32Oki009274
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Tue, 23 Feb 2021 19:02:30 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Tue, 23 Feb 2021 19:02:13 -0800
Received: from vme.wrs.com (172.25.44.2) by ala-exchng01.corp.ad.wrs.com
 (147.11.82.252) with Microsoft SMTP Server id 15.1.2106.2 via Frontend
 Transport; Tue, 23 Feb 2021 19:02:13 -0800
From: "Randy MacLeod" <randy.macleod@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 7/8] cargo/rust/rustfmt: exclude from world
Date: Tue, 23 Feb 2021 22:02:00 -0500
Message-ID: <20210224030201.349588-8-Randy.MacLeod@windriver.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210224030201.349588-1-Randy.MacLeod@windriver.com>
References: <20210224030201.349588-1-Randy.MacLeod@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

cargo, rust, and rustfmt can't be built for the targets yet
so exclude them from world builds.

Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
---
 meta/recipes-devtools/cargo/cargo.inc         | 1 +
 meta/recipes-example/rustfmt/rustfmt_1.4.2.bb | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/cargo/cargo.inc b/meta/recipes-devtools/cargo/cargo.inc
index 9645b90df6..5118cc1ab1 100644
--- a/meta/recipes-devtools/cargo/cargo.inc
+++ b/meta/recipes-devtools/cargo/cargo.inc
@@ -15,6 +15,7 @@ SRC_URI += "file://0001-Disable-http2.patch"
 
 S = "${RUSTSRC}/src/tools/cargo"
 CARGO_VENDORING_DIRECTORY = "${RUSTSRC}/vendor"
+EXCLUDE_FROM_WORLD = "1"
 
 inherit cargo
 
diff --git a/meta/recipes-example/rustfmt/rustfmt_1.4.2.bb b/meta/recipes-example/rustfmt/rustfmt_1.4.2.bb
index ecced49049..b7deb4097c 100644
--- a/meta/recipes-example/rustfmt/rustfmt_1.4.2.bb
+++ b/meta/recipes-example/rustfmt/rustfmt_1.4.2.bb
@@ -11,7 +11,7 @@ SRC_URI += "git://github.com/rust-lang/rustfmt/;protocol=https;nobranch=1"
 SRCREV = "aeb3496f31a0dfa90fc511520d2023634e885260"
 S = "${WORKDIR}/git"
 CARGO_SRC_DIR = ""
-
+EXCLUDE_FROM_WORLD = "1"
 
 # please note if you have entries that do not begin with crate://
 # you must change them to how that package can be fetched
-- 
2.27.0

