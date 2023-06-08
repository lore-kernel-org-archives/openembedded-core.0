Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41412C7EE25
	for <webhook@archiver.kernel.org>; Thu,  8 Jun 2023 02:36:26 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web10.510.1686191782509240477
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Jun 2023 19:36:22 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=TPKK+SdQ;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.171, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-653f9c7b3e4so20197b3a.2
        for <openembedded-core@lists.openembedded.org>; Wed, 07 Jun 2023 19:36:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1686191781; x=1688783781;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k7pdfmeuvAkWJzXNki9JYDSwPON1Zv9Vc8rNCCPtPr8=;
        b=TPKK+SdQ+YJKfw4Sn46ojhKC+sqpuroTeME/pPsKqpRvpI/RvG9RQ8/8+7H3vVs9pj
         VbgILh/H5Nb8SQYbSVs4KlfrS9sJLnKyOxAOvQ3tYmVuf0l2zSUcP9ZIaIEkkkHZun+W
         bziaE7KQf8Vdxq2t1RhhaNDajObYsBRzzyREByQuorBv0y/h0ouTtREdHnwiTrjyMYxY
         MrqKhMCeG/WZB62VQfPDDmQPPxoMe1Q0HrV+vQkz5vKpakBJPJZzhlxga/Vngq+FkAMy
         9t68Mp4MEFE0pAwBGzARJRK2VODgHo+tFF5RRoJPrzikx4oW/B54R4VgYTipY8OOJMed
         p1UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686191781; x=1688783781;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k7pdfmeuvAkWJzXNki9JYDSwPON1Zv9Vc8rNCCPtPr8=;
        b=Bytugm/6u1vTHUn7QUDwV7iCNfBMSQX2QIyN7bEzPMQc73vNMJD3JmTgObiaXTycwz
         yucA5nUwz2e5zA5Tz80moZZtMXRHcIS2k7wlR89xlYrqKuCVrE7UWlaE54ADgYM+Vl4y
         nKr6bsv/4WwoZ/SUs0n86zmkhhw/gHsV3+p1/5qf0Sa4zD0ZoAG6+rJyA+I2petvUocX
         +U54q7arEQGxq3buunOxUt/P6lZlCLURqeJbyLU+HtQVIFANk92IEGsovVhrDWh/ewYC
         pcbA//0t4DzXPcUYd+QE6eknxZTixhjm79dwmqwSWEZloqlYPN4jw5qbv8EmMpx9VeU4
         szbg==
X-Gm-Message-State: AC+VfDwOK3mG3KOVZspBJghHpBvLgJe0F4RX9sN9q5zzwbEEIDz/K5Hn
	OAp3/yVZMdRKI5J2iFFhG05FuYccIWzWF3H0fe4=
X-Google-Smtp-Source: ACHHUZ5jRTPYAof3MRQcQCQDtlZNDM2WVfyT+vzdoiWW+/9v1bFEVS4egH8e0mV3ZPtZGywRcQZwdQ==
X-Received: by 2002:a05:6a20:4303:b0:10b:f980:18d3 with SMTP id h3-20020a056a20430300b0010bf98018d3mr4258742pzk.1.1686191781415;
        Wed, 07 Jun 2023 19:36:21 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id j8-20020a62b608000000b00649ac17779csm19478pff.160.2023.06.07.19.36.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jun 2023 19:36:21 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 05/11] go: Security fix CVE-2023-24540
Date: Wed,  7 Jun 2023 16:35:58 -1000
Message-Id: <e569586ac9095d344967c5b9c4bfb07f70948936.1686191643.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1686191643.git.steve@sakoman.com>
References: <cover.1686191643.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Jun 2023 02:36:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182487

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport [https://github.com/golang/go/commit/ce7bd33345416e6d8cac901792060591cafc2797]

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/go/go-1.14.inc          |  1 +
 .../go/go-1.14/CVE-2023-24540.patch           | 90 +++++++++++++++++++
 2 files changed, 91 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go-1.14/CVE-2023-24540.patch

diff --git a/meta/recipes-devtools/go/go-1.14.inc b/meta/recipes-devtools/go/go-1.14.inc
index d0fbde9cae..2c500e8331 100644
--- a/meta/recipes-devtools/go/go-1.14.inc
+++ b/meta/recipes-devtools/go/go-1.14.inc
@@ -62,6 +62,7 @@ SRC_URI += "\
     file://CVE-2023-24538-2.patch \
     file://CVE-2023-24538-3.patch \
     file://CVE-2023-24539.patch \
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
2.34.1


