Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D560DC4332F
	for <webhook@archiver.kernel.org>; Mon, 14 Mar 2022 14:17:00 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web10.26589.1647267417033193989
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Mar 2022 07:17:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=DZcgNYZ2;
 spf=pass (domain: axis.com, ip: 195.60.68.18,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1647267418;
  x=1678803418;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=r5SXOSLOpMbHjfteD+O7W+mWSOPH+42W1aowYMMccVg=;
  b=DZcgNYZ2fqp6COTfQ0m3nSx6OlnlV4jpiHdPyaHnaEevkRjUaXMWR4uw
   TRi1S3RKxI/3zhOLF1CYB4A4Tni85EAfZPQNpYE2E1BANUZbDL8XA7c6X
   5wDwOC0T5BNVGL+MFn/MPvu3wD/0adTYZ8WXZJatKeJ38ffF/jqYbXE9x
   JcTHuLxe6ahCBV1PJg4kqbOGsOftghntZ4DTeN9eaMWpZQX+78GR67BR8
   Yf9PnZCfaXUE+7ZQiFvvbFlS4UpsgRCLULn1qkt1G+/VbfrvbZjnoOEFV
   Xvd0cbLTqnmbqJsRz30wgVL3suBAOnXGUqVKNM+mmO302mT0/xYecAXsY
   Q==;
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 5/5] go: Remove three unnecessary paths from do_compile[dirs]
Date: Mon, 14 Mar 2022 15:16:47 +0100
Message-ID: <20220314141647.14807-5-pkj@axis.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20220314141647.14807-1-pkj@axis.com>
References: <20220314141647.14807-1-pkj@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Mar 2022 14:17:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163147

From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>

There is no reason to include a path in foo[dirs] if it is also in
foo[cleandirs] (except if it is the last path in foo[dirs]).

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/recipes-devtools/go/go-cross-canadian.inc | 1 -
 meta/recipes-devtools/go/go-cross.inc          | 1 -
 meta/recipes-devtools/go/go-crosssdk.inc       | 1 -
 meta/recipes-devtools/go/go-native_1.17.8.bb   | 1 -
 meta/recipes-devtools/go/go-runtime.inc        | 1 -
 meta/recipes-devtools/go/go-target.inc         | 1 -
 6 files changed, 6 deletions(-)

diff --git a/meta/recipes-devtools/go/go-cross-canadian.inc b/meta/recipes-devtools/go/go-cross-canadian.inc
index d49250a8e2..c1aa987427 100644
--- a/meta/recipes-devtools/go/go-cross-canadian.inc
+++ b/meta/recipes-devtools/go/go-cross-canadian.inc
@@ -27,7 +27,6 @@ do_compile() {
 	./make.bash --host-only --no-banner
 	cd ${B}
 }
-do_compile[dirs] =+ "${GOTMPDIR} ${B}/bin ${B}/pkg"
 do_compile[cleandirs] += "${GOTMPDIR} ${B}/bin ${B}/pkg"
 
 
diff --git a/meta/recipes-devtools/go/go-cross.inc b/meta/recipes-devtools/go/go-cross.inc
index 3d5803bf07..a0fbdbe3b9 100644
--- a/meta/recipes-devtools/go/go-cross.inc
+++ b/meta/recipes-devtools/go/go-cross.inc
@@ -17,7 +17,6 @@ do_compile() {
 	./make.bash --host-only --no-banner
 	cd ${B}
 }
-do_compile[dirs] =+ "${GOTMPDIR} ${B}/bin ${B}/pkg"
 do_compile[cleandirs] += "${GOTMPDIR} ${B}/bin ${B}/pkg"
 
 make_wrapper() {
diff --git a/meta/recipes-devtools/go/go-crosssdk.inc b/meta/recipes-devtools/go/go-crosssdk.inc
index f0bec79719..cd23cca2fe 100644
--- a/meta/recipes-devtools/go/go-crosssdk.inc
+++ b/meta/recipes-devtools/go/go-crosssdk.inc
@@ -13,7 +13,6 @@ do_compile() {
 	./make.bash --host-only --no-banner
 	cd ${B}
 }
-do_compile[dirs] =+ "${GOTMPDIR} ${B}/bin ${B}/pkg"
 do_compile[cleandirs] += "${GOTMPDIR} ${B}/bin ${B}/pkg"
 
 make_wrapper() {
diff --git a/meta/recipes-devtools/go/go-native_1.17.8.bb b/meta/recipes-devtools/go/go-native_1.17.8.bb
index ffe4ef3523..76c0ab73a6 100644
--- a/meta/recipes-devtools/go/go-native_1.17.8.bb
+++ b/meta/recipes-devtools/go/go-native_1.17.8.bb
@@ -27,7 +27,6 @@ do_compile() {
 	./make.bash ${GOMAKEARGS}
 	cd ${B}
 }
-do_compile[dirs] =+ "${GOTMPDIR} ${B}/bin"
 do_compile[cleandirs] += "${GOTMPDIR} ${B}/bin"
 
 make_wrapper() {
diff --git a/meta/recipes-devtools/go/go-runtime.inc b/meta/recipes-devtools/go/go-runtime.inc
index ccb86d4fe9..e18339cddb 100644
--- a/meta/recipes-devtools/go/go-runtime.inc
+++ b/meta/recipes-devtools/go/go-runtime.inc
@@ -38,7 +38,6 @@ do_compile() {
 	fi
 	cd ${B}
 }
-do_compile[dirs] =+ "${GOTMPDIR} ${B}/bin ${B}/pkg"
 do_compile[cleandirs] += "${GOTMPDIR} ${B}/bin ${B}/pkg"
 
 do_install() {
diff --git a/meta/recipes-devtools/go/go-target.inc b/meta/recipes-devtools/go/go-target.inc
index b0d487ae1c..d085643036 100644
--- a/meta/recipes-devtools/go/go-target.inc
+++ b/meta/recipes-devtools/go/go-target.inc
@@ -29,7 +29,6 @@ do_compile() {
 	./make.bash --target-only --no-banner
 	cd ${B}
 }
-do_compile[dirs] =+ "${GOTMPDIR} ${B}/bin ${B}/pkg"
 do_compile[cleandirs] += "${GOTMPDIR} ${B}/bin ${B}/pkg"
 
 do_install() {

