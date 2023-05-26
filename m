Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DF5CC7EE32
	for <webhook@archiver.kernel.org>; Fri, 26 May 2023 02:29:31 +0000 (UTC)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.web11.104.1685068167880388677
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 May 2023 19:29:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=V6guVzkg;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.173, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-53482b44007so148951a12.2
        for <openembedded-core@lists.openembedded.org>; Thu, 25 May 2023 19:29:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1685068167; x=1687660167;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hDg0quUs/zW4aPnngJwbUpUx/2b6nNhGFzmMrRvFCxA=;
        b=V6guVzkgV+WhqTemlVY137CxqX7oPC5OoZkO7bedBc+e+LAgogVK8WIuRSeLzq4QYu
         Wx42D8fHK1WavVr2NIBBGZtpD0ytNC8rVSqJDZgGRAxQQxEzJDCkbdtAYHUhAplBoBLD
         XHVaAIP+AiVDRMW5agwmXYmo5QM1+w1wBaNninW7EG2DnjxV2PbHlOfjY0WxQLy4lZ/5
         BfSHF6sOwxwGjKaTCYzocvMMEqxyyqIIA481DVN3uezRQC7pQItxiDSgAJin1qlSJQkx
         nSNojDGK0e5t4ki5r4XzyFSwf5uKuJtFasKXC12uTCZKOLwdsMpR6nUHkCSV1znyNTr5
         s4Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685068167; x=1687660167;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hDg0quUs/zW4aPnngJwbUpUx/2b6nNhGFzmMrRvFCxA=;
        b=RsurhVv5/lixy01cX85OV57HsdMEt9FxCD24yKQzyyjYrbcQDk+GgiJu0AfGUX4OYj
         IuATBTcW5Fx5wc1f5XfZwftAXYKW4RLmSeHpb2VLonES+NHf98KFT7Z0obK7UpqDF0dr
         xVYhu9B1t3fg3EjPn86OsUBj3iq6VFkuR9lAfWI2RYLHxI9X/h33ACMCvJwO6hISybJ2
         q9nO/VEfV8RU9ETt8nniNObQ1qWO2bT0dmyzbdYCQm7sREyASNkOtBv1CPSCsKWDimBE
         LL1UMKV4HlRYzgpyT+9S1cp+YmKF3tJ/X1OcvrCWkt265+6+T9QMoQ77d/5ydxDIHVzS
         O4YA==
X-Gm-Message-State: AC+VfDwC1/9w+Cj/jnTN5aZwtY2XePuOYvp+D++FVauUgwaYqmkVgkwJ
	dcNLBkGRpoHZLkQKgcFF8CXVu+PQhN07Fy36OD8=
X-Google-Smtp-Source: ACHHUZ7gmh/gUxyPLS/i9CXILhJtpnqkFDpHWma9de44Fdim0NnQFpAI8rYdOoj79YOJJJtTFNP3qA==
X-Received: by 2002:a17:903:1105:b0:1af:cbe4:d953 with SMTP id n5-20020a170903110500b001afcbe4d953mr831614plh.60.1685068166758;
        Thu, 25 May 2023 19:29:26 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id t13-20020a170902b20d00b0019ee045a2b3sm2023794plr.308.2023.05.25.19.29.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 May 2023 19:29:26 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 02/21] go: fix CVE-2023-24540
Date: Thu, 25 May 2023 16:28:50 -1000
Message-Id: <5defed7d5dc8bc6f68f021d19c4f42832d33472b.1685068004.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1685068004.git.steve@sakoman.com>
References: <cover.1685068004.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 May 2023 02:29:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181734

From: Sakib Sajal <sakib.sajal@windriver.com>

References:
https://nvd.nist.gov/vuln/detail/CVE-2023-24540

Upstream patch:
https://github.com/golang/go/commit/ce7bd33345416e6d8cac901792060591cafc2797 (go 1.19.9)

Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/go/go-1.17.13.inc       |  1 +
 .../go/go-1.19/CVE-2023-24540.patch           | 93 +++++++++++++++++++
 2 files changed, 94 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go-1.19/CVE-2023-24540.patch

diff --git a/meta/recipes-devtools/go/go-1.17.13.inc b/meta/recipes-devtools/go/go-1.17.13.inc
index d7cb47ebf4..e5e9d841c4 100644
--- a/meta/recipes-devtools/go/go-1.17.13.inc
+++ b/meta/recipes-devtools/go/go-1.17.13.inc
@@ -30,6 +30,7 @@ SRC_URI += "\
     file://CVE-2023-24537.patch \
     file://CVE-2023-24534.patch \
     file://CVE-2023-24538.patch \
+    file://CVE-2023-24540.patch \
 "
 SRC_URI[main.sha256sum] = "a1a48b23afb206f95e7bbaa9b898d965f90826f6f1d1fc0c1d784ada0cd300fd"
 
diff --git a/meta/recipes-devtools/go/go-1.19/CVE-2023-24540.patch b/meta/recipes-devtools/go/go-1.19/CVE-2023-24540.patch
new file mode 100644
index 0000000000..7e6e871e38
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.19/CVE-2023-24540.patch
@@ -0,0 +1,93 @@
+From 2305cdb2aa5ac8e9960bd64e548a119c7dd87530 Mon Sep 17 00:00:00 2001
+From: Roland Shoemaker <bracewell@google.com>
+Date: Tue, 11 Apr 2023 16:27:43 +0100
+Subject: [PATCH] html/template: handle all JS whitespace characters
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
+CVE: CVE-2023-24540
+Upstream-Status: Backport [https://github.com/golang/go/commit/ce7bd33345416e6d8cac901792060591cafc2797]
+
+Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
+---
+ src/html/template/js.go      |  8 +++++++-
+ src/html/template/js_test.go | 11 +++++++----
+ 2 files changed, 14 insertions(+), 5 deletions(-)
+
+diff --git a/src/html/template/js.go b/src/html/template/js.go
+index b888eaf..35994f0 100644
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
+index d7ee47b..8f5d76d 100644
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
+-- 
+2.40.0
+
-- 
2.34.1


