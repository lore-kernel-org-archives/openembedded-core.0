Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA1FCC7EE23
	for <webhook@archiver.kernel.org>; Fri, 26 May 2023 03:41:31 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web10.1009.1685072480167999913
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 May 2023 20:41:22 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@mvista.com header.s=google header.b=cImDbYuG;
 spf=pass (domain: mvista.com, ip: 209.85.210.178, mailfrom: vanusuri@mvista.com)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-64d5f65a2f7so353475b3a.1
        for <openembedded-core@lists.openembedded.org>; Thu, 25 May 2023 20:41:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1685072479; x=1687664479;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3IvMPpMshrTeTUyeS5QJo+6N5vKJMiqEeF0w+sDNpGU=;
        b=cImDbYuG6m/x76oYKCOlT9vlpxuKsaOmA5YH+1zPoxFl/LEEr4+Md8sAq1Of8teHZQ
         6TR1coEB9vOC0E62t8zMeJA53ggonyFQCIuIbwFHDXR+6KgvmwgamI92ZHrqJV6hwF2U
         xmAsszxOEvTw092YX4XtlgL5c9kfshN4yr/hI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685072479; x=1687664479;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3IvMPpMshrTeTUyeS5QJo+6N5vKJMiqEeF0w+sDNpGU=;
        b=WBjXIyFr0yKGgXP96n/TcERDr1vwmmzKigezA7XbQazGWvhWCJ+vUvcYEHIF498GlT
         wUeV7CY1XpQNC7zjyOg0WLWmE8vSQQn9WbS+74wgS0QBKFDDEWRakUGIqVsdWbJT1Wzi
         702ahx6JqdLtZiMK9FddK8sLI2n8a8RKgOMr+9Qc2acOQE8fQpZtpcB9AVFWK5yQ/YuM
         X8LpVf/IkLMs733ByAd5kQclYdv/jOhnErvNCE5A6+SAbY/PXZoKl8Osa/cdgPh3BSUs
         7CurROwdPjgPu57eVpcFcba3378rbbJ3WutVZ7PBiWB3lZj8gjJnqw0hAAZ33Yeg5KzW
         LkTw==
X-Gm-Message-State: AC+VfDwQEwQL/X3tdPSvmQafrXV3ce3BpPrM+1HTzlczeyt866jBROeK
	Zfu4ssfflSMLGDWFb8lfOsPKJZt8JWbk0RhXNrU=
X-Google-Smtp-Source: ACHHUZ6vCPZp1hZHpqy+lsNialVC4nR6wPmqs/IXcmuxml1+9xQPJtgnFsiz4WcnPiem8N+U0jriEQ==
X-Received: by 2002:a05:6a00:1a12:b0:64d:742f:f590 with SMTP id g18-20020a056a001a1200b0064d742ff590mr1466637pfv.8.1685072479100;
        Thu, 25 May 2023 20:41:19 -0700 (PDT)
Received: from MVIN00020.mvista.com ([117.98.129.187])
        by smtp.gmail.com with ESMTPSA id u5-20020aa78385000000b0064305676b61sm1785969pfm.203.2023.05.25.20.41.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 May 2023 20:41:18 -0700 (PDT)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][dunfell][PATCH] go: Security fix CVE-2023-24540
Date: Fri, 26 May 2023 09:09:02 +0530
Message-Id: <20230526033902.178105-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 May 2023 03:41:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181756

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport [https://github.com/golang/go/commit/ce7bd33345416e6d8cac901792060591cafc2797]

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 meta/recipes-devtools/go/go-1.14.inc          |  1 +
 .../go/go-1.14/CVE-2023-24540.patch           | 90 +++++++++++++++++++
 2 files changed, 91 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go-1.14/CVE-2023-24540.patch

diff --git a/meta/recipes-devtools/go/go-1.14.inc b/meta/recipes-devtools/go/go-1.14.inc
index f734fe1ac8..43590278c8 100644
--- a/meta/recipes-devtools/go/go-1.14.inc
+++ b/meta/recipes-devtools/go/go-1.14.inc
@@ -61,6 +61,7 @@ SRC_URI += "\
     file://CVE-2023-24538-1.patch \
     file://CVE-2023-24538-2.patch \
     file://CVE-2023-24538-3.patch \
+    file://CVE-2023-24540.patch \
 "
 
 SRC_URI_append_libc-musl = " file://0009-ld-replace-glibc-dynamic-linker-with-musl.patch"
diff --git a/meta/recipes-devtools/go/go-1.14/CVE-2023-24540.patch b/meta/recipes-devtools/go/go-1.14/CVE-2023-24540.patch
new file mode 100644
index 0000000000..799a0dfcda
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.14/CVE-2023-24540.patch
@@ -0,0 +1,90 @@
+From ce7bd33345416e6d8cac901792060591cafc2797 Mon Sep 17 00:00:00 2001
+From: Roland Shoemaker <bracewell@google.com>
+Date: Tue, 11 Apr 2023 16:27:43 +0100
+Subject: [PATCH] [release-branch.go1.19] html/template: handle all JS
+ whitespace characters
+
+Rather than just a small set. Character class as defined by \s [0].
+
+Thanks to Juho Nurminen of Mattermost for reporting this.
+
+For #59721
+Fixes  #59813
+Fixes CVE-2023-24540
+
+[0] https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide/Regular_Expressions/Character_Classes
+
+Change-Id: I56d4fa1ef08125b417106ee7dbfb5b0923b901ba
+Reviewed-on: https://team-review.git.corp.google.com/c/golang/go-private/+/1821459
+Reviewed-by: Julie Qiu <julieqiu@google.com>
+Run-TryBot: Roland Shoemaker <bracewell@google.com>
+Reviewed-by: Damien Neil <dneil@google.com>
+Reviewed-on: https://team-review.git.corp.google.com/c/golang/go-private/+/1851497
+Run-TryBot: Damien Neil <dneil@google.com>
+Reviewed-by: Roland Shoemaker <bracewell@google.com>
+Reviewed-on: https://go-review.googlesource.com/c/go/+/491355
+Reviewed-by: Dmitri Shuralyov <dmitshur@google.com>
+Reviewed-by: Carlos Amedee <carlos@golang.org>
+TryBot-Bypass: Carlos Amedee <carlos@golang.org>
+Run-TryBot: Carlos Amedee <carlos@golang.org>
+
+Upstream-Status: Backport [https://github.com/golang/go/commit/ce7bd33345416e6d8cac901792060591cafc2797]
+CVE: CVE-2023-24540
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ src/html/template/js.go      |  8 +++++++-
+ src/html/template/js_test.go | 11 +++++++----
+ 2 files changed, 14 insertions(+), 5 deletions(-)
+
+diff --git a/src/html/template/js.go b/src/html/template/js.go
+index fe7054efe5cd8..4e05c1455723f 100644
+--- a/src/html/template/js.go
++++ b/src/html/template/js.go
+@@ -13,6 +13,11 @@ import (
+ 	"unicode/utf8"
+ )
+ 
++// jsWhitespace contains all of the JS whitespace characters, as defined
++// by the \s character class.
++// See https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide/Regular_expressions/Character_classes.
++const jsWhitespace = "\f\n\r\t\v\u0020\u00a0\u1680\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u2028\u2029\u202f\u205f\u3000\ufeff"
++
+ // nextJSCtx returns the context that determines whether a slash after the
+ // given run of tokens starts a regular expression instead of a division
+ // operator: / or /=.
+@@ -26,7 +31,8 @@ import (
+ // JavaScript 2.0 lexical grammar and requires one token of lookbehind:
+ // https://www.mozilla.org/js/language/js20-2000-07/rationale/syntax.html
+ func nextJSCtx(s []byte, preceding jsCtx) jsCtx {
+-	s = bytes.TrimRight(s, "\t\n\f\r \u2028\u2029")
++	// Trim all JS whitespace characters
++	s = bytes.TrimRight(s, jsWhitespace)
+ 	if len(s) == 0 {
+ 		return preceding
+ 	}
+diff --git a/src/html/template/js_test.go b/src/html/template/js_test.go
+index e07c695f7a77d..e52180cc113b5 100644
+--- a/src/html/template/js_test.go
++++ b/src/html/template/js_test.go
+@@ -81,14 +81,17 @@ func TestNextJsCtx(t *testing.T) {
+ 		{jsCtxDivOp, "0"},
+ 		// Dots that are part of a number are div preceders.
+ 		{jsCtxDivOp, "0."},
++		// Some JS interpreters treat NBSP as a normal space, so
++		// we must too in order to properly escape things.
++		{jsCtxRegexp, "=\u00A0"},
+ 	}
+ 
+ 	for _, test := range tests {
+-		if nextJSCtx([]byte(test.s), jsCtxRegexp) != test.jsCtx {
+-			t.Errorf("want %s got %q", test.jsCtx, test.s)
++		if ctx := nextJSCtx([]byte(test.s), jsCtxRegexp); ctx != test.jsCtx {
++			t.Errorf("%q: want %s got %s", test.s, test.jsCtx, ctx)
+ 		}
+-		if nextJSCtx([]byte(test.s), jsCtxDivOp) != test.jsCtx {
+-			t.Errorf("want %s got %q", test.jsCtx, test.s)
++		if ctx := nextJSCtx([]byte(test.s), jsCtxDivOp); ctx != test.jsCtx {
++			t.Errorf("%q: want %s got %s", test.s, test.jsCtx, ctx)
+ 		}
+ 	}
+ 
-- 
2.25.1


