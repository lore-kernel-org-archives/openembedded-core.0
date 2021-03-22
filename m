Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web09.8003.1616383424636745013
 for <openembedded-core@lists.openembedded.org>;
 Sun, 21 Mar 2021 20:23:44 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: changqing.li@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 12M3NW4Y019333
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Sun, 21 Mar 2021 20:23:38 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Sun, 21 Mar 2021 20:23:32 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2106.2 via Frontend Transport; Sun, 21 Mar 2021 20:23:31 -0700
From: "Changqing Li" <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] go-helloworld: disable module-aware mode
Date: Mon, 22 Mar 2021 11:23:30 +0800
Message-ID: <20210322032330.32959-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

From go 1.16, module-aware mode is enabled by default, regardless of
whether a go.mod file is present in the current working directory or a
parent directory.

Above change makes go-helloworld build fail when doing offline build or
proxy.golang.org is not accessible.

This fix is kind of workaround, as from go1.17, GOPATH mode will be
dropped, and GO111MODULE is ignored.

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta/recipes-extended/go-examples/go-helloworld_0.1.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/go-examples/go-helloworld_0.1.bb b/meta/recipes-extended/go-examples/go-helloworld_0.1.bb
index d3f7525dc9..c51f163e9b 100644
--- a/meta/recipes-extended/go-examples/go-helloworld_0.1.bb
+++ b/meta/recipes-extended/go-examples/go-helloworld_0.1.bb
@@ -6,14 +6,15 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
 
 SRC_URI = "git://${GO_IMPORT}"
-SRCREV = "bcf50bfd7dcd8020c90965747d857ae42802e0c5"
+SRCREV = "46695d81d1fae905a270fb7db8a4d11a334562fe"
 UPSTREAM_CHECK_COMMITS = "1"
 
 GO_IMPORT = "github.com/golang/example"
 GO_INSTALL = "${GO_IMPORT}/hello"
 GO_WORKDIR = "${GO_INSTALL}"
+export GO111MODULE="off"
 
-inherit go-mod
+inherit go
 
 # This is just to make clear where this example is
 do_install_append() {
-- 
2.30.1

