Received: from mail1.wrs.com (mail1.wrs.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web11.12392.1631884487440662140
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Sep 2021 06:14:47 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: kai.kang@windriver.com)
Received: from mail.windriver.com (mail.wrs.com [147.11.1.11])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 18HDEkwH013224
	(version=TLSv1.1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Fri, 17 Sep 2021 06:14:46 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 18HDEjmd028633
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Fri, 17 Sep 2021 06:14:46 -0700 (PDT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Fri, 17 Sep 2021 06:14:45 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.14; Fri, 17 Sep 2021 06:14:45 -0700
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Fri, 17 Sep 2021 06:14:44 -0700
From: "kai" <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] rust-common.bbclass: make sure ccache exist
Date: Fri, 17 Sep 2021 21:14:38 +0800
Message-ID: <20210917131438.14995-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

It fails to run task rust_create_wrappers of recipe which inherit
rust-common.bbclass such as rust-hello-world if no host ccache exists:

| DEBUG: Executing shell function do_rust_create_wrappers
| /path/to/project/tmp-glibc/work/core2-64-wrs-linux/rust-hello-world/git-r0/temp/run.do_rust_create_wrappers.3422:
    line 179: ccache: command not found

Run task rust_create_wrappers before do_prepare_recipe_sysroot to make
sure required tools such as ccache exist.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/classes/rust-common.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/rust-common.bbclass b/meta/classes/rust-common.bbclass
index a8803d61b6..f7f9cbbb2e 100644
--- a/meta/classes/rust-common.bbclass
+++ b/meta/classes/rust-common.bbclass
@@ -176,5 +176,5 @@ do_rust_create_wrappers () {
 	${BUILD_CC} ${COREBASE}/meta/files/rust-ccld-wrapper.c -o ${RUST_TARGET_CCLD}
 }
 
-addtask rust_create_wrappers before do_configure after do_patch
+addtask rust_create_wrappers before do_configure after do_patch do_prepare_recipe_sysroot
 do_rust_create_wrappers[dirs] += "${WRAPPER_DIR}"
-- 
2.17.1

