Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9B34C4452E
	for <webhook@archiver.kernel.org>; Sat, 18 Jul 2026 08:53:31 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2526.1784364809199946066
 for <openembedded-core@lists.openembedded.org>;
 Sat, 18 Jul 2026 01:53:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=bTX0mU6m;
 spf=pass (domain: smile.fr, ip: 209.85.128.42, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-493e4ccccc2so54589995e9.2
        for <openembedded-core@lists.openembedded.org>; Sat, 18 Jul 2026 01:53:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1784364807; x=1784969607; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=P/c9a30mfYB+UfF1jiTun6adiK3y+vTX5bLEYp7/1y0=;
        b=bTX0mU6m51GhWEH452kJIaCqbMJhY8VM6Xz6FfXQ1D9m+SMeuTDeWGj+SEatkyS4A5
         Yp3VrrgaJTf4MajSJQlLW8jekd10LQuQZN+8Mk77fIiuQmLKJA/EmKPOpyr24FTdsyVu
         yn1u5Dh4IQcgN/oYEu0nFsS63Y1o1fjeC50ng=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784364807; x=1784969607;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=P/c9a30mfYB+UfF1jiTun6adiK3y+vTX5bLEYp7/1y0=;
        b=H51bGAneMY46EwgU5ReBmwWlcty66+WI3lYfNE5rk7zSZJKrCA3zEAnmojxuO5ahuu
         xjwR2l02Z9WaYpnbMM2RiYv0+ojjjmg+5V/jfXuDloNQbmIxP0cwiFtqfiA22qsgQ+va
         zfAEFNTZyarh3oIn5AS3yxhZglKVRG6oCBqZm8+t6qw5Fv4O/1i04j/TO0wFQGq326fV
         FnsAf4DtA5rPvqxNtALr+yKYykqVdF1+cNP9jewpcws/PiogupbBOzon/AyNXLmz/W5Q
         hmJIC1+QD3hrBU4D8kLi+KWfc6yXaND++3rA8agPpqdYvCo9UwzEo9ziSOc3giuuGWpb
         cyDg==
X-Gm-Message-State: AOJu0YyXuaV60GQV8UFXkDGDXcbMs5cT9F42GwLl1qlSZj3xnbgkQEYg
	GHhzW2DasLNH8pbSvOkYqTjk5I/DvW8nQlgiEJSEq6iQ7bOSuWk/XRLXozs/pD88cemcGhiskAj
	oSiA/Wpg=
X-Gm-Gg: AfdE7cm4ArKo61S7vOGdETG1i0IX0m4OYTM72OQxc/lDclwIJx22X4EcGCWa2Ck7SYQ
	h5ql3JqpsHPc1dw53NDp8E6eKUj64ellSZ4SydYfNWTOmHwRNfCrShNd/2lnVXl91HLM14PLSao
	QErQW6/nhbsZwJ0GVY6AlD+brZFmQRsfSSzo+gj7GFZcaI1m3YW6/bp4VEqZTf4DZnRlB5tanfN
	zsJ/AlDwnylKc655Ec9lsOJKxupyScTfVAc6J+PfO5FH964eA5Q1SylI3Rc/Uc69VyqQ8L8aS14
	wwVbU73SWtRWIjbTpa0STFFUY8vhZP23xX9ZdozCpN4Gf9ACCvghSk7bMjyhPvLBlrXXfC/+/rN
	a7oa+qDZ+y0EKKaYx4ILOEX9Lj2frc0W5EVNWoeMJtyBpY6RQyyPVP5C1pUvH9ZsGJF3hit9Oza
	i5bNQuoXxsQKIBaRfqT0ZBrk0oNbdZz+ufn3Ija7WlB83HW3EW9UiNdfzhs8uDr/mEpnGGrgvxi
	mRHP727Qa8fzr9Wnw==
X-Received: by 2002:a05:600c:4ed0:b0:493:c634:952 with SMTP id 5b1f17b1804b1-4954a3d0872mr66087475e9.7.1784364807347;
        Sat, 18 Jul 2026 01:53:27 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa001444456ef7d84e9a.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:1444:456e:f7d8:4e9a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4954a2b87c6sm176409335e9.7.2026.07.18.01.53.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 01:53:26 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 11/17] go: upgrade 1.26.4 -> 1.26.5
Date: Sat, 18 Jul 2026 10:52:50 +0200
Message-ID: <7ad0cfa128ad33b90e54de613d0182f0d58d580c.1784364567.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1784364567.git.yoann.congal@smile.fr>
References: <cover.1784364567.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 18 Jul 2026 08:53:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241248

From: Peter Marko <peter.marko@siemens.com>

Upgrade to latest 1.26.x release [1]:

$ git --no-pager log --oneline go1.26.4..go1.26.5
c19862e5f8 (tag: go1.26.5) [release-branch.go1.26] go1.26.5
f9ef7f5598 [release-branch.go1.26] os: properly handle trailing slashes in paths in Root
ca8ca590cc [release-branch.go1.26] crypto/tls: omit PSK in ECH outer client hello
7397dd7495 [release-branch.go1.26] net: fix TestLookupCNAME
044c995af7 [release-branch.go1.26] runtime: tolerate vendor suffixes in Linux kernel release strings
814591410b [release-branch.go1.26] cmd/compile,sync/atomic: make Add And & Or SQCST on PPC64
2055b1a15d [release-branch.go1.26] syscall: add //go:norace to rawSyscall on darwin
d7c9c818f9 [release-branch.go1.26] runtime: in moveSliceNoCap, round size down to a whole multiple of element size
dc80258a97 [release-branch.go1.26] internal/runtime/gc: require AVX512DQ for greentea
6efcff6602 [release-branch.go1.26] os/signal: make NotifyContext Cause match context.Canceled
fe91cea4f2 [release-branch.go1.26] cmd/go: use fsys.ReadDir for IsStandardPackage
ec988a9af1 [release-branch.go1.26] os: notify testlog from (*File).Chdir

Fixes CVE-2026-39822 and CVE-2026-42505.

Release information: [2]

[1] https://github.com/golang/go/compare/go1.26.4...go1.26.5
[2] https://groups.google.com/g/golang-announce/c/OrmQE_Yp5Sc

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(From OE-Core rev: b498f6d6d93e0adb3f0e9439aa55a2abfcb9b063)
Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-devtools/go/{go-1.26.4.inc => go-1.26.5.inc}   | 2 +-
 ...o-binary-native_1.26.4.bb => go-binary-native_1.26.5.bb} | 6 +++---
 ...cross-canadian_1.26.4.bb => go-cross-canadian_1.26.5.bb} | 0
 .../go/{go-cross_1.26.4.bb => go-cross_1.26.5.bb}           | 0
 .../go/{go-crosssdk_1.26.4.bb => go-crosssdk_1.26.5.bb}     | 0
 .../go/{go-runtime_1.26.4.bb => go-runtime_1.26.5.bb}       | 0
 meta/recipes-devtools/go/{go_1.26.4.bb => go_1.26.5.bb}     | 0
 7 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/go/{go-1.26.4.inc => go-1.26.5.inc} (90%)
 rename meta/recipes-devtools/go/{go-binary-native_1.26.4.bb => go-binary-native_1.26.5.bb} (80%)
 rename meta/recipes-devtools/go/{go-cross-canadian_1.26.4.bb => go-cross-canadian_1.26.5.bb} (100%)
 rename meta/recipes-devtools/go/{go-cross_1.26.4.bb => go-cross_1.26.5.bb} (100%)
 rename meta/recipes-devtools/go/{go-crosssdk_1.26.4.bb => go-crosssdk_1.26.5.bb} (100%)
 rename meta/recipes-devtools/go/{go-runtime_1.26.4.bb => go-runtime_1.26.5.bb} (100%)
 rename meta/recipes-devtools/go/{go_1.26.4.bb => go_1.26.5.bb} (100%)

diff --git a/meta/recipes-devtools/go/go-1.26.4.inc b/meta/recipes-devtools/go/go-1.26.5.inc
similarity index 90%
rename from meta/recipes-devtools/go/go-1.26.4.inc
rename to meta/recipes-devtools/go/go-1.26.5.inc
index 8bc6f4d4def..a4302b2790a 100644
--- a/meta/recipes-devtools/go/go-1.26.4.inc
+++ b/meta/recipes-devtools/go/go-1.26.5.inc
@@ -16,4 +16,4 @@ SRC_URI += "\
     file://0009-go-Filter-build-paths-on-staticly-linked-arches.patch \
     file://0010-cmd-go-clear-GOROOT-for-func-ldShared-when-trimpath-.patch \
 "
-SRC_URI[main.sha256sum] = "4f668a32fbfc1132e6a881fb968c2f1dada631492a339211735fbb255a42602d"
+SRC_URI[main.sha256sum] = "495be4bc87176ac567392e5b4116abd98466d33d7b49d41e764ccc6976b2dc42"
diff --git a/meta/recipes-devtools/go/go-binary-native_1.26.4.bb b/meta/recipes-devtools/go/go-binary-native_1.26.5.bb
similarity index 80%
rename from meta/recipes-devtools/go/go-binary-native_1.26.4.bb
rename to meta/recipes-devtools/go/go-binary-native_1.26.5.bb
index 3757b9f6a52..97a8270be2d 100644
--- a/meta/recipes-devtools/go/go-binary-native_1.26.4.bb
+++ b/meta/recipes-devtools/go/go-binary-native_1.26.5.bb
@@ -9,9 +9,9 @@ PROVIDES = "go-native"
 
 # Checksums available at https://go.dev/dl/
 SRC_URI = "https://dl.google.com/go/go${PV}.${BUILD_GOOS}-${BUILD_GOARCH}.tar.gz;name=go_${BUILD_GOTUPLE}"
-SRC_URI[go_linux_amd64.sha256sum] = "1153d3d50e0ac764b447adfe05c2bcf08e889d42a02e0fe0259bd47f6733ad7f"
-SRC_URI[go_linux_arm64.sha256sum] = "ef758ae7c6cf9267c9c0ef080b8965f453d89ab2d25d9eb22de4405925238768"
-SRC_URI[go_linux_ppc64le.sha256sum] = "53f49b8c7eace2d30389327b4a516b13321f90377fdf5929a6b63174609bc22e"
+SRC_URI[go_linux_amd64.sha256sum] = "5c2c3b16caefa1d968a94c1daca04a7ca301a496d9b086e17ad77bb81393f053"
+SRC_URI[go_linux_arm64.sha256sum] = "fe4789e92b1f33358680864bbe8704289e7bb5fc207d80623c308935bd696d49"
+SRC_URI[go_linux_ppc64le.sha256sum] = "c5d60e2b303bb612f20cd82786594b64874e73b35134025e27d3390bf284ae43"
 
 UPSTREAM_CHECK_URI = "https://golang.org/dl/"
 UPSTREAM_CHECK_REGEX = "go(?P<pver>\d+(\.\d+)+)\.linux"
diff --git a/meta/recipes-devtools/go/go-cross-canadian_1.26.4.bb b/meta/recipes-devtools/go/go-cross-canadian_1.26.5.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross-canadian_1.26.4.bb
rename to meta/recipes-devtools/go/go-cross-canadian_1.26.5.bb
diff --git a/meta/recipes-devtools/go/go-cross_1.26.4.bb b/meta/recipes-devtools/go/go-cross_1.26.5.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross_1.26.4.bb
rename to meta/recipes-devtools/go/go-cross_1.26.5.bb
diff --git a/meta/recipes-devtools/go/go-crosssdk_1.26.4.bb b/meta/recipes-devtools/go/go-crosssdk_1.26.5.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-crosssdk_1.26.4.bb
rename to meta/recipes-devtools/go/go-crosssdk_1.26.5.bb
diff --git a/meta/recipes-devtools/go/go-runtime_1.26.4.bb b/meta/recipes-devtools/go/go-runtime_1.26.5.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-runtime_1.26.4.bb
rename to meta/recipes-devtools/go/go-runtime_1.26.5.bb
diff --git a/meta/recipes-devtools/go/go_1.26.4.bb b/meta/recipes-devtools/go/go_1.26.5.bb
similarity index 100%
rename from meta/recipes-devtools/go/go_1.26.4.bb
rename to meta/recipes-devtools/go/go_1.26.5.bb

