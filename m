Return-Path: <ralph.siemsen@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37F89C41535
	for <webhook@archiver.kernel.org>; Thu, 17 Nov 2022 16:55:13 +0000 (UTC)
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
 by mx.groups.io with SMTP id smtpd.web11.1162.1668704107198347801
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Nov 2022 08:55:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=XJ6bgFa5;
 spf=pass (domain: linaro.org, ip: 209.85.222.182, mailfrom: ralph.siemsen@linaro.org)
Received: by mail-qk1-f182.google.com with SMTP id z1so1586422qkl.9
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Nov 2022 08:55:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eL4wc56SMMLB5eMroRwV9O0XhDAByIBmhRD4OtUmZt4=;
        b=XJ6bgFa56qnyIhnGZZUZFvmp/xKhT7bDtUekFw/opq6azt1cOQa8YtiTox0fvisD2O
         SmRtJM+Jgu6kugF3zPdwe8VkuZdub59IcI1qr2JafsHzl1jDD4aRmrgE1S5E31E/U0XX
         z1darXgPjOWBjijP+XlH4Bx/A3S5pagu7OMEu9k3q5GGH+zUOPrueSZWDRkwF5hzyYjG
         uPz7T7FSOtVm3OMKRI6mJEGPnqFwI6bbH0uJAwYKCCk1U1Zz3aSykfdpL26RzaE7LWNc
         x5p9TLTYDErG12ZBLOTf/gNSFD5rYd+R6NHQ4NLwSi91KjUwTYjnyPSE1rCh40SknglK
         qc8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eL4wc56SMMLB5eMroRwV9O0XhDAByIBmhRD4OtUmZt4=;
        b=qZfOLHxbtfwyEH1YhC/kGSphLU32frnaEi0xnHvfpp8cgFrL9mFLCrKRaApzKPhqdq
         Ox4f+8E3gxiIsV0v+Ym+53hf9q34RMxpg81NkjZeDT4Tcr6zY0GEVdpBhDpgqdFFqoO+
         EYODkOUCwkULJvz4QXJ1lgyBQD/zZvp/JDh8yjF4JOmciZTD2Fbj2Sm2JKJioOobva7b
         E34Xkp0RLdAXSKquvD+r67huObxlipbjVrAbYiMju1Vc+EW8T17df+OVms8OazlDv91i
         jhI5drZ/aKLqppHRXecWznsncgn3Ed9mDd57qFKpIUvdh2wV7d+h5z5UA2fuJDb2aNxM
         39pA==
X-Gm-Message-State: ANoB5plkJBUaiLsPdB3F0VYuaCbeHuiw+fwNj+Zxj5vSoQ/UUmw0n1ii
	GCjW21KP33tggh4T6PGZVcqkVSvxVMs/uA==
X-Google-Smtp-Source: AA0mqf4JVsjVlLNqb3J7TgDZKHFOJaIlyHbxTE5AowArmuNGOnvYScV4G1v1OgyzDXrRCCYaKGgUZA==
X-Received: by 2002:a05:620a:4708:b0:6fa:ada7:e51b with SMTP id bs8-20020a05620a470800b006faada7e51bmr2423557qkb.674.1668704106256;
        Thu, 17 Nov 2022 08:55:06 -0800 (PST)
Received: from maple.netwinder.org (rfs.netwinder.org. [206.248.184.2])
        by smtp.gmail.com with ESMTPSA id c7-20020a05620a268700b006fb112f512csm785081qkp.74.2022.11.17.08.55.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Nov 2022 08:55:05 -0800 (PST)
From: Ralph Siemsen <ralph.siemsen@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Ralph Siemsen <ralph.siemsen@linaro.org>
Subject: [dunfell][PATCH 02/11] golang: fix CVE-2021-33198
Date: Thu, 17 Nov 2022 11:54:47 -0500
Message-Id: <20221117165456.1029099-2-ralph.siemsen@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221117165456.1029099-1-ralph.siemsen@linaro.org>
References: <20221117165456.1029099-1-ralph.siemsen@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Nov 2022 16:55:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173435

Upstream-Status: Backport [https://github.com/golang/go/commit/df9ce19db6df32d94eae8760927bdfbc595433c3]
CVE: CVE-2021-33198
Signed-off-by: Ralph Siemsen <ralph.siemsen@linaro.org>
---
 meta/recipes-devtools/go/go-1.14.inc          |   1 +
 .../go/go-1.14/CVE-2021-33198.patch           | 113 ++++++++++++++++++
 2 files changed, 114 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go-1.14/CVE-2021-33198.patch

diff --git a/meta/recipes-devtools/go/go-1.14.inc b/meta/recipes-devtools/go/go-1.14.inc
index 63da997bf1..90f483c294 100644
--- a/meta/recipes-devtools/go/go-1.14.inc
+++ b/meta/recipes-devtools/go/go-1.14.inc
@@ -43,6 +43,7 @@ SRC_URI += "\
     file://0004-CVE-2022-32190.patch \
     file://CVE-2022-2880.patch \
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


