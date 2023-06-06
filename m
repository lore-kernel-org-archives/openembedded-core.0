Return-Path: <asharma@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB77EC7EE24
	for <webhook@archiver.kernel.org>; Tue,  6 Jun 2023 16:42:36 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web11.1560.1686069751464709949
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Jun 2023 09:42:33 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@mvista.com header.s=google header.b=Ebz7F5xi;
 spf=pass (domain: mvista.com, ip: 209.85.214.176, mailfrom: asharma@mvista.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1b04949e5baso55686645ad.0
        for <openembedded-core@lists.openembedded.org>; Tue, 06 Jun 2023 09:42:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1686069750; x=1688661750;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pgKLvx++QaP6JFqxn0UALPw9s+tap2r5SRyi7K/1I1o=;
        b=Ebz7F5xi3rOX1B4+ZrZ9Cg1p9q4vjFEAhnHL0++nHmqiXvcdhdyYx+bYRDVKo6I6z2
         9mtPZhcMFZi8Xw2e640WK8WnVBRq1NRtLyt1SlXBDxaB3vj0AGVFTW7xxYdsH7cYm6Dp
         J403XyVS1GHe1VergQr1aIWfH3cBgz+lK+WHY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686069750; x=1688661750;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pgKLvx++QaP6JFqxn0UALPw9s+tap2r5SRyi7K/1I1o=;
        b=gA+uo1wkK1xNMwwVNUc5w3NVhJ4MUBeElYs3g0Zj6xRg3lxOCIlgjR1U+3ZX3SARfi
         37jto2THrVtHJYNHjfbHJLFnblhpECkKXFawVm6Wix9p/0zXwEDR9zl2lHrhwWxMSUea
         6ZXh9yHe4k81yq54iOBuPwk6klj1nnUZMHEDNT7FB20YEZA50BU2E8jx+39qHJlq1oLh
         ySFA2Q8xf63FiQ9sl2C9n6mvnLrDPod+oT0nJpYq66oow1/+gEGXOCsj4MVlE3PmrpQ+
         d+ZLaB5EBxAbYjp+S5cY68F6ApvRuWdOwhaKDKVaekF/EdqzHHaMvFwUGCogOM7zi53z
         TkRA==
X-Gm-Message-State: AC+VfDx1sV+9c7d9HICuJHStXgN80/CZ28CnmdrC8GWUn0qZbHZw9Q8q
	HPJKEGbE3nHyW30GSk9VbTfUXHIUUj8ijb2yzD8=
X-Google-Smtp-Source: ACHHUZ6MVZRLnwWKPujh+cK/fNH6YIMeyj2mtggREJqMYXKilBavqlYaTiOWonADWgUUoI9DY1XLfA==
X-Received: by 2002:a17:902:d34b:b0:1ab:2034:26da with SMTP id l11-20020a170902d34b00b001ab203426damr2602806plk.51.1686069750489;
        Tue, 06 Jun 2023 09:42:30 -0700 (PDT)
Received: from asharma-Latitude-3400 ([223.190.86.45])
        by smtp.gmail.com with ESMTPSA id ju11-20020a170903428b00b001a9b29b6759sm8783410plb.183.2023.06.06.09.42.27
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 06 Jun 2023 09:42:30 -0700 (PDT)
Received: by asharma-Latitude-3400 (sSMTP sendmail emulation); Tue, 06 Jun 2023 22:12:24 +0530
From: Ashish Sharma <asharma@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Ashish Sharma <asharma@mvista.com>
Subject: [OE-core][dunfell][PATCH V2] golang: Fix CVE-2023-24539
Date: Tue,  6 Jun 2023 22:12:21 +0530
Message-Id: <20230606164221.14497-1-asharma@mvista.com>
X-Mailer: git-send-email 2.17.1
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Jun 2023 16:42:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182447

Improper sanitization of CSS values in html/template

Signed-off-by: Ashish Sharma <asharma@mvista.com>
---
 meta/recipes-devtools/go/go-1.14.inc          |  1 +
 .../go/go-1.14/CVE-2023-24539.patch           | 60 +++++++++++++++++++
 2 files changed, 61 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go-1.14/CVE-2023-24539.patch

diff --git a/meta/recipes-devtools/go/go-1.14.inc b/meta/recipes-devtools/go/go-1.14.inc
index b900b1f216..6ac3075f0f 100644
--- a/meta/recipes-devtools/go/go-1.14.inc
+++ b/meta/recipes-devtools/go/go-1.14.inc
@@ -64,6 +64,7 @@ SRC_URI += "\
     file://CVE-2023-24538-1.patch \
     file://CVE-2023-24538-2.patch \
     file://CVE-2023-24538-3.patch \
+    file://CVE-2023-24539.patch \
 "
 
 SRC_URI_append_libc-musl = " file://0009-ld-replace-glibc-dynamic-linker-with-musl.patch"
diff --git a/meta/recipes-devtools/go/go-1.14/CVE-2023-24539.patch b/meta/recipes-devtools/go/go-1.14/CVE-2023-24539.patch
new file mode 100644
index 0000000000..281b6486a8
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
+Upstream-Status: Backport from [https://github.com/golang/go/commit/8673ca81e5340b87709db2d9749c92a3bf925df1]
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


