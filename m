Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 023CEC79F8B
	for <webhook@archiver.kernel.org>; Sat,  5 Sep 2026 20:45:36 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2593.1788641127830276032
 for <openembedded-core@lists.openembedded.org>;
 Sat, 05 Sep 2026 13:45:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=bXDbkPST;
 spf=pass (domain: smile.fr, ip: 209.85.221.44, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-485888b3c3dso2281438f8f.2
        for <openembedded-core@lists.openembedded.org>; Sat, 05 Sep 2026 13:45:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1788641126; x=1789245926; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=vphCVum9TrrHSjClpI3w/58hSkZLC3UiB5fHdoyy8dI=;
        b=bXDbkPSTW2YMQOcFVMDisnI2VmtPjGm8hJKXVYa4Sr+C+eNGS/O1rPG1RtmQ5n5ozA
         7VBnM1VAEImz12VnKIg04C8HHU+0kp5spyOcfDRpgknnuubdnFda6BbheL6RX9VsQmFf
         5VHCRKpxhASi0cyf3dkerfxC3tnm+RYNhg5kk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788641126; x=1789245926;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=vphCVum9TrrHSjClpI3w/58hSkZLC3UiB5fHdoyy8dI=;
        b=BGVcojqsOPVedNqId9fQc2bS0pDGNuiJmA9FwGcu6RtDeS2cO/rtwLwgTk2EbpUh0O
         6n5H79oi2O/dPuTZzxI7wSlPNnwKiQ1xOoKPIN/968h0H5Ry+JH7GxTPTfJCKuxGxLd/
         C+UzS69eVWeVbcmCiMupjTLiU8MKG7R2sc+S5d3uJD/XOd7JaD5pscfh8UhSqAuVmOOR
         FhqtPcbjZsqqIJgdjuy6QGJDgdti/rGWbhytWE3XvjGeHviuXTdgSC3iOAsridUnVsyX
         4tINumpnTy2t0lhOp27Om74fxeqyOEYA66rj/othQIJ3s3oOnJ4lrpd1eH25mfiqBcvb
         M/Xg==
X-Gm-Message-State: AFuF++lxO7zcaojPVVWcWsWCcmMtEKbj46AujHHlpW/05LJ7gKAW2gJj
	Evyja1NgoGAyVyKb5SJgvOGsAEdCGB/gvMd5jsDlMA/rPBc6VXlH02V/lpTpIfjr9a09Nu8dIm9
	cGppVVkE=
X-Gm-Gg: AYBFou2NssdoAT2yiJOAnMIjSZ06magfMaAU+essDQoX24H33Z2gTAx1gHSfi5zZwbx
	RWjFvv5hYI7v6nkUAptJJE+flaK9gMla+fN8fHZa5Nw8FVFTI6NOOyniyVYsYgjpY3zNlfMgvZ7
	aN8wdhErzubik21mlpRKJGUZ6hbdBaAao5RyOf8+WIgnXU069EcN4IqxYnBwsKx0gOvX6J+Hc3t
	7Mo9chTWhJ2wAqz0jvwBmwXf2DQPU4KMq8l0Rdmt3xEWwlSuOAp9EMuBMfF9ZL18f1YEN4cHzOg
	NPU9sfQZAw80x9k1W1ul0IHJxJ+f270WmCvUZ/kQe8c9ACn70jG14YHd5THluK/MzSMaQz1sqFR
	nK4CrlcuScBCHZwc5zm8vXeBVT76zrewfFL63zXqlkIaJWOGFZKwe/sQgIh/6cP1pw8p3lcWiGa
	spFIzkp5ot6iM3tHvavl/W6y6siv6Aj61qD0/CxP84YJ3Doll47xZbQOUng5XX/1LompZeIAafy
	kCNrr8NmQlSsMTipoErk9vTmLOIZ2sjYh65telfc5xhSNl7p3CCdU0/cEx/v++xkA==
X-Received: by 2002:a05:6000:41d7:b0:485:8c16:5efd with SMTP id ffacd0b85a97d-4858c16611emr10144882f8f.55.1788641125955;
        Sat, 05 Sep 2026 13:45:25 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa0048511f7ccf23d3ce.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:4851:1f7c:cf23:d3ce])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485885bfdf6sm17069098f8f.34.2026.09.05.13.45.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 13:45:25 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 27/40] go: upgrade 1.26.5 -> 1.26.6
Date: Sat,  5 Sep 2026 22:44:28 +0200
Message-ID: <a650ff35a7a60966e92ca5538125e1fecb4c1c3b.1788629392.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1788629392.git.yoann.congal@smile.fr>
References: <cover.1788629392.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 05 Sep 2026 20:45:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245179

From: Peter Marko <peter.marko@siemens.com>

Upgrade to latest 1.26.x release [1]:

$ git --no-pager log --oneline go1.26.5..go1.26.6
1ea5a71ad8 (tag: go1.26.6) [release-branch.go1.26] go1.26.6
115eb476aa [release-branch.go1.26] cmd/vendor: fix CVE-2026-56865 in x/mod
9f6980fd5c [release-branch.go1.26] cmd/vendor: fix CVE-2026-56864 in x/mod
6ec908dd24 [release-branch.go1.26] encoding/asn1: enforce maximum recursion depth
9918f26ab3 [release-branch.go1.26] encoding/xml: fix depth processing in (*Decoder).unmarshal
33ecb966ca [release-branch.go1.26] html/template: fix JavaScript regexp tracking
128893dbf9 [release-branch.go1.26] net/url: avoid quadratic complexity in resolvePath
13c194062c [release-branch.go1.26] cmd/compile: do not elide riscv64 sign extension of unsigned values
52e5e2f22a [release-branch.go1.26] cmd/compile: fix time traveling proofs in prove
db38ee7121 [release-branch.go1.26] cmd/compile: fix prove to generate Const64 for 64bits slicemasks
f5bf46f361 [release-branch.go1.26] cmd/compile: fix mips64le bigger than 32bits pointer offsets
f8d4fa6213 [release-branch.go1.26] runtime: fix frame pointer adjustment around injected calls
efc79671b1 [release-branch.go1.26] cmd/compile: do not home mul/div results in HI/LO
605fd48711 [release-branch.go1.26] crypto/tls: add fips140ems GODEBUG setting to disable EMS enforcement
100fb8f023 [release-branch.go1.26] cmd/link: quote PE .def library name
4d522f275f [release-branch.go1.26] cmd/compile: tighten mergelocals address use analysis
0e8a244fe5 [release-branch.go1.26] all: update x/net
019fcb0152 [release-branch.go1.26] cmd/compile: don't require Heapaddr for heap vars in dead code
b6432317a1 [release-branch.go1.26] crypto/tls: do not count handshake messages as state-advancing post-handshake
ae63e27897 [release-branch.go1.26] runtime: fix uninitialized 7th argument in mach_vm_region_trampoline
88bf57924f [release-branch.go1.26] runtime: don't emit write barrier for code pointers in itabInit
4238449188 [release-branch.go1.26] os: strip trailing slashes in RemoveAll on Plan 9
28f27d64cf [release-branch.go1.26] os: properly handle trailing / in Root.MkdirAll
cc312256f8 [release-branch.go1.26] runtime: be sure to scan small frame introduced by (*sigctxt).pushCall
07a0bbba1b [release-branch.go1.26] os: don't expect an error from Root.ReadFile from a directory on NetBSD
a42fec40ab [release-branch.go1.26] all: update x/net
5bbd22ff78 [release-branch.go1.26] net/http: apply header timeout to server's unencrypted HTTP/2 check

Fixes CVE-2026-56865, CVE-2026-56864, CVE-2026-56859, CVE-2026-56853,
      CVE-2026-56860, CVE-2026-46600, CVE-2026-56862, CVE-2026-56858,
      CVE-2026-39821 and CVE-2026-33818.

Release information: [2]

[1] https://github.com/golang/go/compare/go1.26.5...go1.26.6
[2] https://groups.google.com/g/golang-announce/c/94pEornpRlI

(From OE-Core rev: cae8a33abfda172e65166811eeb1bc7ad2d129a3)

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-devtools/go/{go-1.26.5.inc => go-1.26.6.inc}   | 2 +-
 ...o-binary-native_1.26.5.bb => go-binary-native_1.26.6.bb} | 6 +++---
 ...cross-canadian_1.26.5.bb => go-cross-canadian_1.26.6.bb} | 0
 .../go/{go-cross_1.26.5.bb => go-cross_1.26.6.bb}           | 0
 .../go/{go-crosssdk_1.26.5.bb => go-crosssdk_1.26.6.bb}     | 0
 .../go/{go-runtime_1.26.5.bb => go-runtime_1.26.6.bb}       | 0
 meta/recipes-devtools/go/{go_1.26.5.bb => go_1.26.6.bb}     | 0
 7 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/go/{go-1.26.5.inc => go-1.26.6.inc} (90%)
 rename meta/recipes-devtools/go/{go-binary-native_1.26.5.bb => go-binary-native_1.26.6.bb} (80%)
 rename meta/recipes-devtools/go/{go-cross-canadian_1.26.5.bb => go-cross-canadian_1.26.6.bb} (100%)
 rename meta/recipes-devtools/go/{go-cross_1.26.5.bb => go-cross_1.26.6.bb} (100%)
 rename meta/recipes-devtools/go/{go-crosssdk_1.26.5.bb => go-crosssdk_1.26.6.bb} (100%)
 rename meta/recipes-devtools/go/{go-runtime_1.26.5.bb => go-runtime_1.26.6.bb} (100%)
 rename meta/recipes-devtools/go/{go_1.26.5.bb => go_1.26.6.bb} (100%)

diff --git a/meta/recipes-devtools/go/go-1.26.5.inc b/meta/recipes-devtools/go/go-1.26.6.inc
similarity index 90%
rename from meta/recipes-devtools/go/go-1.26.5.inc
rename to meta/recipes-devtools/go/go-1.26.6.inc
index a4302b2790a..fa6b0a50a14 100644
--- a/meta/recipes-devtools/go/go-1.26.5.inc
+++ b/meta/recipes-devtools/go/go-1.26.6.inc
@@ -16,4 +16,4 @@ SRC_URI += "\
     file://0009-go-Filter-build-paths-on-staticly-linked-arches.patch \
     file://0010-cmd-go-clear-GOROOT-for-func-ldShared-when-trimpath-.patch \
 "
-SRC_URI[main.sha256sum] = "495be4bc87176ac567392e5b4116abd98466d33d7b49d41e764ccc6976b2dc42"
+SRC_URI[main.sha256sum] = "a0721c54c688901448d77ad9b3ec7ea7c474730755ff891382e92ecb93ff2cb1"
diff --git a/meta/recipes-devtools/go/go-binary-native_1.26.5.bb b/meta/recipes-devtools/go/go-binary-native_1.26.6.bb
similarity index 80%
rename from meta/recipes-devtools/go/go-binary-native_1.26.5.bb
rename to meta/recipes-devtools/go/go-binary-native_1.26.6.bb
index 97a8270be2d..2913fb65151 100644
--- a/meta/recipes-devtools/go/go-binary-native_1.26.5.bb
+++ b/meta/recipes-devtools/go/go-binary-native_1.26.6.bb
@@ -9,9 +9,9 @@ PROVIDES = "go-native"
 
 # Checksums available at https://go.dev/dl/
 SRC_URI = "https://dl.google.com/go/go${PV}.${BUILD_GOOS}-${BUILD_GOARCH}.tar.gz;name=go_${BUILD_GOTUPLE}"
-SRC_URI[go_linux_amd64.sha256sum] = "5c2c3b16caefa1d968a94c1daca04a7ca301a496d9b086e17ad77bb81393f053"
-SRC_URI[go_linux_arm64.sha256sum] = "fe4789e92b1f33358680864bbe8704289e7bb5fc207d80623c308935bd696d49"
-SRC_URI[go_linux_ppc64le.sha256sum] = "c5d60e2b303bb612f20cd82786594b64874e73b35134025e27d3390bf284ae43"
+SRC_URI[go_linux_amd64.sha256sum] = "708effb774be8237570d0add163225abbdfaf4fca28b2611df167beba4feef89"
+SRC_URI[go_linux_arm64.sha256sum] = "d0507e9e9d7fe012aae570108cbd76c15de879e17130ab8cb90d4d7445cb1f2e"
+SRC_URI[go_linux_ppc64le.sha256sum] = "232b65543a42eda95df6a63f76235c1795bb535eba5c74e509faec71bc648388"
 
 UPSTREAM_CHECK_URI = "https://golang.org/dl/"
 UPSTREAM_CHECK_REGEX = "go(?P<pver>\d+(\.\d+)+)\.linux"
diff --git a/meta/recipes-devtools/go/go-cross-canadian_1.26.5.bb b/meta/recipes-devtools/go/go-cross-canadian_1.26.6.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross-canadian_1.26.5.bb
rename to meta/recipes-devtools/go/go-cross-canadian_1.26.6.bb
diff --git a/meta/recipes-devtools/go/go-cross_1.26.5.bb b/meta/recipes-devtools/go/go-cross_1.26.6.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross_1.26.5.bb
rename to meta/recipes-devtools/go/go-cross_1.26.6.bb
diff --git a/meta/recipes-devtools/go/go-crosssdk_1.26.5.bb b/meta/recipes-devtools/go/go-crosssdk_1.26.6.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-crosssdk_1.26.5.bb
rename to meta/recipes-devtools/go/go-crosssdk_1.26.6.bb
diff --git a/meta/recipes-devtools/go/go-runtime_1.26.5.bb b/meta/recipes-devtools/go/go-runtime_1.26.6.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-runtime_1.26.5.bb
rename to meta/recipes-devtools/go/go-runtime_1.26.6.bb
diff --git a/meta/recipes-devtools/go/go_1.26.5.bb b/meta/recipes-devtools/go/go_1.26.6.bb
similarity index 100%
rename from meta/recipes-devtools/go/go_1.26.5.bb
rename to meta/recipes-devtools/go/go_1.26.6.bb

