Return-Path: <asharma@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C38EC77B73
	for <webhook@archiver.kernel.org>; Mon,  5 Jun 2023 03:26:01 +0000 (UTC)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.web11.3788.1685935557024023063
 for <openembedded-core@lists.openembedded.org>;
 Sun, 04 Jun 2023 20:25:57 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@mvista.com header.s=google header.b=c5Wvm6IK;
 spf=pass (domain: mvista.com, ip: 209.85.215.174, mailfrom: asharma@mvista.com)
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-53063897412so4018449a12.0
        for <openembedded-core@lists.openembedded.org>; Sun, 04 Jun 2023 20:25:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1685935556; x=1688527556;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IrwCFgOAadyfT8gIODZiCZc4/ET64QQ1cFNd0v9vrag=;
        b=c5Wvm6IK9Y0NppdTyPt94BPG3D5+sVQnX6/+5T84RI65EOlLGBf8tKhD/5dFnOK8ap
         9ltJ260dFC0qiGsXmfGTL+EKSphR4l+vASoSvB5M7QLmtni7itx9NAWG5Qe6uaU3JUxJ
         gWGr0XkxWBMC3foW7H/J9szepnJvbSJnwwE5Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685935556; x=1688527556;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IrwCFgOAadyfT8gIODZiCZc4/ET64QQ1cFNd0v9vrag=;
        b=dQXSKb4U60ZdgSc6FqR/P2ohKZQc1kLRaP8b4hEyg+LgIXG5Behuetp1QHjaR6khHp
         4wqbWFp198q+gy9eeXa202786Hp0Lv0ZcbDf7JMBECi+vNb08TIUAE1rpuktW2HcjhTs
         heY2rAYEnMtJEW6NWaDQOFgfYF4GX0C6ORsHB4OAzpUizGMNNPFzhgKVvhwWdyzwimGv
         zoGFcxKBs//oZ7C5H4D9JJ1gSabmm3/LIn1pylYKTVQFgISkQGhSPfW0AIS2EuUDmiqF
         WO85eThVb7TjP/odwKGMkRHDMgLrqHkXMBiq/c4/yq13dsD9zjT5/cRAmASpobefQZ1l
         k53g==
X-Gm-Message-State: AC+VfDxfjefEr7LrkO0fY0+WV155y6v8nhEQCTBW6Xrnfe4F1ZizLp5l
	HSMydd1OiZmas1eO6UG3IdqCt5h1bPM976pl0hM=
X-Google-Smtp-Source: ACHHUZ5111p2J/sGdjuNufIUhh7fg/A290x6PidS2Gt7ndwDmKEekTRvqKaSGiwsVb8+RNvbun/jdg==
X-Received: by 2002:a05:6a20:c8:b0:10b:8a3b:1680 with SMTP id 8-20020a056a2000c800b0010b8a3b1680mr5406853pzh.29.1685935556209;
        Sun, 04 Jun 2023 20:25:56 -0700 (PDT)
Received: from asharma-Latitude-3400 ([223.190.86.45])
        by smtp.gmail.com with ESMTPSA id c24-20020a62e818000000b0065da94fe917sm12785pfi.36.2023.06.04.20.25.53
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 04 Jun 2023 20:25:55 -0700 (PDT)
Received: by asharma-Latitude-3400 (sSMTP sendmail emulation); Mon, 05 Jun 2023 08:55:50 +0530
From: Ashish Sharma <asharma@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Ashish Sharma <asharma@mvista.com>
Subject: [OE-core][dunfell][PATCH] golang: Fix CVE-2023-24539
Date: Mon,  5 Jun 2023 08:55:36 +0530
Message-Id: <20230605032536.17282-1-asharma@mvista.com>
X-Mailer: git-send-email 2.17.1
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Jun 2023 03:26:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182371

Fixing of improper sanitization of CSS values in html/template

Signed-off-by: Ashish Sharma <asharma@mvista.com>
---
 meta/recipes-devtools/go/go-1.14.inc          |  1 +
 .../go/go-1.14/CVE-2023-24539.patch           | 60 +++++++++++++++++++
 2 files changed, 61 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go-1.14/CVE-2023-24539.patch

diff --git a/meta/recipes-devtools/go/go-1.14.inc b/meta/recipes-devtools/go/go-1.14.inc
index f7482f8458..228becdb23 100644
--- a/meta/recipes-devtools/go/go-1.14.inc
+++ b/meta/recipes-devtools/go/go-1.14.inc
@@ -55,6 +55,7 @@ SRC_URI += "\
     file://CVE-2022-41715.patch \
     file://CVE-2022-41717.patch \
     file://CVE-2022-1962.patch \
+    file://CVE-2023-24539.patch \
 "
 
 SRC_URI_append_libc-musl = " file://0009-ld-replace-glibc-dynamic-linker-with-musl.patch"
diff --git a/meta/recipes-devtools/go/go-1.14/CVE-2023-24539.patch b/meta/recipes-devtools/go/go-1.14/CVE-2023-24539.patch
new file mode 100644
index 0000000000..1b7d849c23
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.14/CVE-2023-24539.patch
@@ -0,0 +1,60 @@
+From 8673ca81e5340b87709db2d9749c92a3bf925df1 Mon Sep 17 00:00:00 2001
+From: Roland Shoemaker <bracewell@google.com>
+Date: Thu, 13 Apr 2023 15:40:44 -0700
+Subject: [PATCH] html/template: disallow angle brackets in CSS values
+
+Angle brackets should not appear in CSS contexts, as they may affect
+token boundaries (such as closing a <style> tag, resulting in
+injection). Instead emit filterFailsafe, matching the behavior for other
+dangerous characters.
+
+Thanks to Juho Nurminen of Mattermost for reporting this issue.
+
+Fixes #59720
+Fixes CVE-2023-24539
+
+Change-Id: Iccc659c9a18415992b0c05c178792228e3a7bae4
+Reviewed-on: https://team-review.git.corp.google.com/c/golang/go-private/+/1826636
+Reviewed-by: Julie Qiu <julieqiu@google.com>
+Run-TryBot: Roland Shoemaker <bracewell@google.com>
+Reviewed-by: Damien Neil <dneil@google.com>
+Reviewed-on: https://go-review.googlesource.com/c/go/+/491615
+Reviewed-by: Dmitri Shuralyov <dmitshur@golang.org>
+Reviewed-by: Dmitri Shuralyov <dmitshur@google.com>
+Run-TryBot: Carlos Amedee <carlos@golang.org>
+TryBot-Result: Gopher Robot <gobot@golang.org>
+
+Upstream-Status: Backport [https://github.com/golang/go/commit/8673ca81e5340b87709db2d9749c92a3bf925df1]
+CVE: CVE-2023-24539
+Signed-off-by: Ashish Sharma <asharma@mvista.com>
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
2.17.1


