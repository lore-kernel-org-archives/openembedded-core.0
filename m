Return-Path: <vkumbhar@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DA4BC7EE23
	for <webhook@archiver.kernel.org>; Wed, 31 May 2023 13:13:44 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web10.13852.1685538818159689456
 for <openembedded-core@lists.openembedded.org>;
 Wed, 31 May 2023 06:13:38 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@mvista.com header.s=google header.b=WR+EsMpe;
 spf=pass (domain: mvista.com, ip: 209.85.214.170, mailfrom: vkumbhar@mvista.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1b05e96dabbso12296165ad.2
        for <openembedded-core@lists.openembedded.org>; Wed, 31 May 2023 06:13:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1685538817; x=1688130817;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+rPanElfKcrbBii+yhnG0sw/m1PZtyxuWNnTCuRjOEY=;
        b=WR+EsMpeG4Gu5/4p2bz6tblwBHgYQIxBhyyOfNUFz8nlm/LR/FhcSpcGOwezpF4BAw
         kcY1edf6NNzdZh3g40c2bOSeH/HRWYSGQcL9+0EsG4g7W40s9FpClnOqShu4ariAoKwy
         WhPTBLEtbNS+XW9suzMJ0hky4hzfcJTZMcxLg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685538817; x=1688130817;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+rPanElfKcrbBii+yhnG0sw/m1PZtyxuWNnTCuRjOEY=;
        b=fGhCXBzq7W1kiPvTbCB8FY/unNfTyzyl9NPUok/71pyJ7BNrheHmGMTKqIS3JnJyS/
         2EgQlJ+gU7NqL1Wz3IseOTXglQkMXZGgXbl9HvqdbjvuiUPo5w1+L+sY7XR2uUc+Y2qg
         FSF0055jzU9XYE6jMCp7pnO31xNvwcVfDb7VYHIIBN/SmVWrx0bvQeR2K+HpukoVgixV
         i+CDJLAo5myG3uQ6zbLMmhqweZ8dDjAvjEdmUG78Sahgdx4O1Qt8ZuTzxEGlQrIhVW7t
         L7tG+T++kAk58bYqWI+JbNUvvhLBtyoUwKZx6Pcrc3lMp2Hr1JRCD/EJGw1Yeoc033b1
         qsmg==
X-Gm-Message-State: AC+VfDyrgxlAqpZEea3lFDUVMr9eRi/W0y+1vuMUDqjwb3GT/SG2lv9C
	978wB0vff5K/hcs3WCu//f3l7A7e0C9fm2yvrlM=
X-Google-Smtp-Source: ACHHUZ4FZQQA0cD3BhU5vPZjoRO2fpuA8aUeWbIk4hal7pejvtVWBUp23jte7OGTvd8Nj8Z1R93yqQ==
X-Received: by 2002:a17:902:e5c9:b0:1ac:3780:3a76 with SMTP id u9-20020a170902e5c900b001ac37803a76mr4920458plf.4.1685538817186;
        Wed, 31 May 2023 06:13:37 -0700 (PDT)
Received: from vkumbhar-Latitude-3400.mvista.com ([116.75.31.154])
        by smtp.googlemail.com with ESMTPSA id c12-20020a170903234c00b001ab2592ed33sm1325528plh.171.2023.05.31.06.13.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 May 2023 06:13:36 -0700 (PDT)
From: Vivek Kumbhar <vkumbhar@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Vivek Kumbhar <vkumbhar@mvista.com>
Subject: [OE-core][kirkstone-nut][PATCH] go: fix CVE-2023-24539 html/template improper sanitization of CSS values
Date: Wed, 31 May 2023 18:43:20 +0530
Message-Id: <20230531131320.844167-1-vkumbhar@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 31 May 2023 13:13:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182009

Angle brackets should not appear in CSS contexts, as they may affect
token boundaries (such as closing a <style> tag, resulting in
injection). Instead emit filterFailsafe, matching the behavior for other
dangerous characters.

Thanks to Juho Nurminen of Mattermost for reporting this issue.

For #59720
Fixes #59811
Fixes CVE-2023-24539

Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
---
 meta/recipes-devtools/go/go-1.17.13.inc       |  1 +
 .../go/go-1.18/CVE-2023-24539.patch           | 53 +++++++++++++++++++
 2 files changed, 54 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go-1.18/CVE-2023-24539.patch

diff --git a/meta/recipes-devtools/go/go-1.17.13.inc b/meta/recipes-devtools/go/go-1.17.13.inc
index e5e9d841c4..d430e0669d 100644
--- a/meta/recipes-devtools/go/go-1.17.13.inc
+++ b/meta/recipes-devtools/go/go-1.17.13.inc
@@ -31,6 +31,7 @@ SRC_URI += "\
     file://CVE-2023-24534.patch \
     file://CVE-2023-24538.patch \
     file://CVE-2023-24540.patch \
+    file://CVE-2023-24539.patch \
 "
 SRC_URI[main.sha256sum] = "a1a48b23afb206f95e7bbaa9b898d965f90826f6f1d1fc0c1d784ada0cd300fd"
 
diff --git a/meta/recipes-devtools/go/go-1.18/CVE-2023-24539.patch b/meta/recipes-devtools/go/go-1.18/CVE-2023-24539.patch
new file mode 100644
index 0000000000..fa19e18264
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.18/CVE-2023-24539.patch
@@ -0,0 +1,53 @@
+From e49282327b05192e46086bf25fd3ac691205fe80 Mon Sep 17 00:00:00 2001
+From: Roland Shoemaker <bracewell@google.com>
+Date: Thu, 13 Apr 2023 15:40:44 -0700
+Subject: [PATCH] [release-branch.go1.19] html/template: disallow angle
+ brackets in CSS values
+
+Change-Id: Iccc659c9a18415992b0c05c178792228e3a7bae4
+Reviewed-on: https://team-review.git.corp.google.com/c/golang/go-private/+/1826636
+Reviewed-by: Julie Qiu <julieqiu@google.com>
+Run-TryBot: Roland Shoemaker <bracewell@google.com>
+Reviewed-by: Damien Neil <dneil@google.com>
+Reviewed-on: https://team-review.git.corp.google.com/c/golang/go-private/+/1851496
+Run-TryBot: Damien Neil <dneil@google.com>
+Reviewed-by: Roland Shoemaker <bracewell@google.com>
+Reviewed-on: https://go-review.googlesource.com/c/go/+/491335
+Run-TryBot: Carlos Amedee <carlos@golang.org>
+Reviewed-by: Dmitri Shuralyov <dmitshur@google.com>
+TryBot-Result: Gopher Robot <gobot@golang.org>
+
+Upstream-Status: Backport [https://github.com/golang/go/commit/e49282327b05192e46086bf25fd3ac691205fe80]
+CVE: CVE-2023-24539
+Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
+---
+ src/html/template/css.go      | 2 +-
+ src/html/template/css_test.go | 2 ++
+ 2 files changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/src/html/template/css.go b/src/html/template/css.go
+index 890a0c6b227fe..f650d8b3e843a 100644
+--- a/src/html/template/css.go
++++ b/src/html/template/css.go
+@@ -238,7 +238,7 @@ func cssValueFilter(args ...any) string {
+ 	// inside a string that might embed JavaScript source.
+ 	for i, c := range b {
+ 		switch c {
+-		case 0, '"', '\'', '(', ')', '/', ';', '@', '[', '\\', ']', '`', '{', '}':
++		case 0, '"', '\'', '(', ')', '/', ';', '@', '[', '\\', ']', '`', '{', '}', '<', '>':
+ 			return filterFailsafe
+ 		case '-':
+ 			// Disallow <!-- or -->.
+diff --git a/src/html/template/css_test.go b/src/html/template/css_test.go
+index a735638b0314f..2b76256a766e9 100644
+--- a/src/html/template/css_test.go
++++ b/src/html/template/css_test.go
+@@ -231,6 +231,8 @@ func TestCSSValueFilter(t *testing.T) {
+ 		{`-exp\000052 ession(alert(1337))`, "ZgotmplZ"},
+ 		{`-expre\0000073sion`, "-expre\x073sion"},
+ 		{`@import url evil.css`, "ZgotmplZ"},
++		{"<", "ZgotmplZ"},
++		{">", "ZgotmplZ"},
+ 	}
+ 	for _, test := range tests {
+ 		got := cssValueFilter(test.css)
-- 
2.25.1


