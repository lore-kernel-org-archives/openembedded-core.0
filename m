Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3551DC433FE
	for <webhook@archiver.kernel.org>; Sat, 19 Nov 2022 17:48:18 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web10.26311.1668880092056527129
 for <openembedded-core@lists.openembedded.org>;
 Sat, 19 Nov 2022 09:48:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=ummq0Rr0;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.43, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f43.google.com with SMTP id h14so7117738pjv.4
        for <openembedded-core@lists.openembedded.org>; Sat, 19 Nov 2022 09:48:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tyynZzsfxaVMp3tdSN975KqybX6GL2w2MRW7IN7MSDs=;
        b=ummq0Rr0b2T/QJsD9VgmJKTVM93nTnOiUMFE1sS1pFP08+/TYEyWfaVaX/17Hj+W8Q
         Dxam6KB4Iydv4/4St/bx+YX6YR3FokT+aOLqtv+4xCOOoOeJOxYtZzMFnI4mfNrZLQUB
         0NQ/uKkjfKfFQvnli6YbNWvonqtXM4VxX75wZX5ESDYG5KXwueuCyiK2k9ZJGvaIWWg2
         O7fPJu4lwEM0w5ehqpRKByzzGZv1/dIxtCZVbpnXq91IjmA7wNmTwgRZc0Zwf1AYdJB3
         MGW/0/OjpyoMTGy1sV+5EDfq7ixSeLCUQCubbPAmpMoxzXiClumlMXN/0OCszWAjFcUC
         MfmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tyynZzsfxaVMp3tdSN975KqybX6GL2w2MRW7IN7MSDs=;
        b=T0KPxHNVn9w1y2a6ZX6MhnGWpMROdcBbRJAnLuTTYD1GB5SwGv9PI0vQkURebkJxsm
         kGDoGjheHdP7FnYY8+CgJ5Ok8MkOYfFDoJ5wZ4pPugC1heMWYuflW566ZeceoQG9yYSU
         RlonpfB4KKFG21ecI1+IcFenchwohL9Uy2ZDID10pPOcqlMtNXMwYA4n9vpGn/6zyqnt
         chUzg6gNTZsMdj5kmETJgXjR7/4xRo7Mc1EoyfwId6FBgoaUA+ChxxGKWdTQdTf+kAn0
         zPePgDBirJNTRFgozIs1c9OGHlPG/ltNA9yp+CVuIoT5xoHZ4B4P2ug/rHF9GxjEua9e
         ExEg==
X-Gm-Message-State: ANoB5pnwAso1nmbpbx7lcLpYvZTqugkY3WUvjItyZAWrv2BmrBSMCkWo
	qrQtgBmyIXCYeFFfc2IcaCerVrYiUtBSxCBZV8o=
X-Google-Smtp-Source: AA0mqf6DDF4W1617YFfo9fIzcSTrvkQy1YuyV+6ImRHLrsjHNuAJHGZWHEdZJWpE0PL9ZNmHXxI0Og==
X-Received: by 2002:a17:90a:d805:b0:213:a95:88bd with SMTP id a5-20020a17090ad80500b002130a9588bdmr18963488pjv.98.1668880091038;
        Sat, 19 Nov 2022 09:48:11 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id m6-20020a17090a668600b0020d3662cc77sm7384151pjj.48.2022.11.19.09.48.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Nov 2022 09:48:10 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 08/21] golang: fix CVE-2021-33198
Date: Sat, 19 Nov 2022 07:47:36 -1000
Message-Id: <c7291e1521527cdf8ae04933c23e64a9b287aa18.1668879817.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1668879817.git.steve@sakoman.com>
References: <cover.1668879817.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 19 Nov 2022 17:48:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173526

From: Ralph Siemsen <ralph.siemsen@linaro.org>

Upstream-Status: Backport [https://github.com/golang/go/commit/df9ce19db6df32d94eae8760927bdfbc595433c3]
CVE: CVE-2021-33198
Signed-off-by: Ralph Siemsen <ralph.siemsen@linaro.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/go/go-1.14.inc          |   1 +
 .../go/go-1.14/CVE-2021-33198.patch           | 113 ++++++++++++++++++
 2 files changed, 114 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go-1.14/CVE-2021-33198.patch

diff --git a/meta/recipes-devtools/go/go-1.14.inc b/meta/recipes-devtools/go/go-1.14.inc
index 3814bf0149..ae2c4746f4 100644
--- a/meta/recipes-devtools/go/go-1.14.inc
+++ b/meta/recipes-devtools/go/go-1.14.inc
@@ -44,6 +44,7 @@ SRC_URI += "\
     file://CVE-2022-2880.patch \
     file://CVE-2022-2879.patch \
     file://CVE-2021-33195.patch \
+    file://CVE-2021-33198.patch \
 "
 
 SRC_URI_append_libc-musl = " file://0009-ld-replace-glibc-dynamic-linker-with-musl.patch"
diff --git a/meta/recipes-devtools/go/go-1.14/CVE-2021-33198.patch b/meta/recipes-devtools/go/go-1.14/CVE-2021-33198.patch
new file mode 100644
index 0000000000..241c08dad7
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.14/CVE-2021-33198.patch
@@ -0,0 +1,113 @@
+From c8866491ac424cdf39aedb325e6dec9e54418cfb Mon Sep 17 00:00:00 2001
+From: Robert Griesemer <gri@golang.org>
+Date: Sun, 2 May 2021 11:27:03 -0700
+Subject: [PATCH] math/big: check for excessive exponents in Rat.SetString
+
+CVE-2021-33198
+
+Upstream-Status: Backport [https://github.com/golang/go/commit/df9ce19db6df32d94eae8760927bdfbc595433c3]
+CVE: CVE-2021-33198
+Signed-off-by: Ralph Siemsen <ralph.siemsen@linaro.org>
+
+
+Found by OSS-Fuzz https://bugs.chromium.org/p/oss-fuzz/issues/detail?id=33284
+
+Thanks to Emmanuel Odeke for reporting this issue.
+
+Updates #45910
+Fixes #46305
+Fixes CVE-2021-33198
+
+Change-Id: I61e7b04dbd80343420b57eede439e361c0f7b79c
+Reviewed-on: https://go-review.googlesource.com/c/go/+/316149
+Trust: Robert Griesemer <gri@golang.org>
+Trust: Katie Hockman <katie@golang.org>
+Run-TryBot: Robert Griesemer <gri@golang.org>
+TryBot-Result: Go Bot <gobot@golang.org>
+Reviewed-by: Katie Hockman <katie@golang.org>
+Reviewed-by: Emmanuel Odeke <emmanuel@orijtech.com>
+(cherry picked from commit 6c591f79b0b5327549bd4e94970f7a279efb4ab0)
+Reviewed-on: https://go-review.googlesource.com/c/go/+/321831
+Run-TryBot: Katie Hockman <katie@golang.org>
+Reviewed-by: Roland Shoemaker <roland@golang.org>
+---
+ src/math/big/ratconv.go      | 15 ++++++++-------
+ src/math/big/ratconv_test.go | 25 +++++++++++++++++++++++++
+ 2 files changed, 33 insertions(+), 7 deletions(-)
+
+diff --git a/src/math/big/ratconv.go b/src/math/big/ratconv.go
+index e8cbdbe..90053a9 100644
+--- a/src/math/big/ratconv.go
++++ b/src/math/big/ratconv.go
+@@ -51,7 +51,8 @@ func (z *Rat) Scan(s fmt.ScanState, ch rune) error {
+ // An optional base-10 ``e'' or base-2 ``p'' (or their upper-case variants)
+ // exponent may be provided as well, except for hexadecimal floats which
+ // only accept an (optional) ``p'' exponent (because an ``e'' or ``E'' cannot
+-// be distinguished from a mantissa digit).
++// be distinguished from a mantissa digit). If the exponent's absolute value
++// is too large, the operation may fail.
+ // The entire string, not just a prefix, must be valid for success. If the
+ // operation failed, the value of z is undefined but the returned value is nil.
+ func (z *Rat) SetString(s string) (*Rat, bool) {
+@@ -174,6 +175,9 @@ func (z *Rat) SetString(s string) (*Rat, bool) {
+ 				return nil, false
+ 			}
+ 		}
++		if n > 1e6 {
++			return nil, false // avoid excessively large exponents
++		}
+ 		pow5 := z.b.abs.expNN(natFive, nat(nil).setWord(Word(n)), nil) // use underlying array of z.b.abs
+ 		if exp5 > 0 {
+ 			z.a.abs = z.a.abs.mul(z.a.abs, pow5)
+@@ -186,15 +190,12 @@ func (z *Rat) SetString(s string) (*Rat, bool) {
+ 	}
+ 
+ 	// apply exp2 contributions
++	if exp2 < -1e7 || exp2 > 1e7 {
++		return nil, false // avoid excessively large exponents
++	}
+ 	if exp2 > 0 {
+-		if int64(uint(exp2)) != exp2 {
+-			panic("exponent too large")
+-		}
+ 		z.a.abs = z.a.abs.shl(z.a.abs, uint(exp2))
+ 	} else if exp2 < 0 {
+-		if int64(uint(-exp2)) != -exp2 {
+-			panic("exponent too large")
+-		}
+ 		z.b.abs = z.b.abs.shl(z.b.abs, uint(-exp2))
+ 	}
+ 
+diff --git a/src/math/big/ratconv_test.go b/src/math/big/ratconv_test.go
+index b820df4..e55e655 100644
+--- a/src/math/big/ratconv_test.go
++++ b/src/math/big/ratconv_test.go
+@@ -590,3 +590,28 @@ func TestIssue31184(t *testing.T) {
+ 		}
+ 	}
+ }
++
++func TestIssue45910(t *testing.T) {
++	var x Rat
++	for _, test := range []struct {
++		input string
++		want  bool
++	}{
++		{"1e-1000001", false},
++		{"1e-1000000", true},
++		{"1e+1000000", true},
++		{"1e+1000001", false},
++
++		{"0p1000000000000", true},
++		{"1p-10000001", false},
++		{"1p-10000000", true},
++		{"1p+10000000", true},
++		{"1p+10000001", false},
++		{"1.770p02041010010011001001", false}, // test case from issue
++	} {
++		_, got := x.SetString(test.input)
++		if got != test.want {
++			t.Errorf("SetString(%s) got ok = %v; want %v", test.input, got, test.want)
++		}
++	}
++}
-- 
2.25.1


