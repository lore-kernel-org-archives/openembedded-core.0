Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CE93C79FA1
	for <webhook@archiver.kernel.org>; Sat,  5 Sep 2026 20:45:36 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2603.1788641134488076305
 for <openembedded-core@lists.openembedded.org>;
 Sat, 05 Sep 2026 13:45:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=0YVsRLMy;
 spf=pass (domain: smile.fr, ip: 209.85.221.51, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-4858595f997so1316267f8f.1
        for <openembedded-core@lists.openembedded.org>; Sat, 05 Sep 2026 13:45:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1788641133; x=1789245933; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B8zvxlYBP6bLdNlwJl0Qhl1D1dCY1m6pvsd1zB6ApiM=;
        b=0YVsRLMyz0NSLG08s5EQhSbXBWI//up03RvEa06tKemByzbZjh0CmqPA4fVwOoWTsg
         UyciL76fbiIA4T0UFHyQcBurcy2qPNYzQB3aETrR3xghC/jHteySTgfga1S1z4puvaoF
         lSVWjU1A7pMpwgA2Uo5uJ5hJgOZmIBUQu64/Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788641133; x=1789245933;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B8zvxlYBP6bLdNlwJl0Qhl1D1dCY1m6pvsd1zB6ApiM=;
        b=j37TKrwTDtmPNneNmBRVQBoHogLyhiT9mokOnFqkTbsJ2d3bAoBPLfpb0iqet30UcG
         E+dAkVLcJVqwWshikZnlJDYxUkxR53E+1B3c2AdpVve1ElUJrkkZnn1ZKFaI7gry65lJ
         3xoQ5urz/sN7XafjTzDfui9e6mAhWYp9LZcKYLIEKeTQmFA/8cV39YqbVx86FGP8YtS0
         S9F/mp6UjSjAizYX+gMBVNzAUbUDUBj9+ovwRUrNdnKuG29QEH1M1Onc8Kdf58f6tHOF
         ihFYZthuoVfgBNarzUC3iHM/HIpCOesr3Fv7d+aEj0Dcq3A28mp4QzYeCMeL92AAg+Rb
         vyEg==
X-Gm-Message-State: AFuF++lXQYWwnIJar/eW2mY2N35fbz+sD5XWP2D+Lfgm63/fdmKfFTXk
	Rg2PHoglljTXrWh/Zp1TVAG2i1JaAZQVU3YMewBh6lOaOuefgFIYS5P6qVVbrG144pCtz1i7FOG
	GuCOM8zc=
X-Gm-Gg: AYBFou0mS5S8+PORJ3/LLXWAORW8eML6eyDldCZ7IJmoCd17kR58Af4fPJizORZrNu/
	KqvHVIOcMUkH2xDkySO/LVcTOk9682cYB9xACT5sJHCwWwpAuyh8RbbpN+19+eARwrHqpjtC9vo
	MBgx/63H9jjnZ3toJz1iBL9Mt1gMx3prrzkLHI9BaKSJgQ8TuY9cI1SYYNpbkvZvmhgLw4b/NUo
	PRTMCyycXyvxji9DPfpPUSE4D1YMlFZZq2F71oI5DcNG832BYKSGIke6HWgFsCDbnv3Lol4x40p
	WryCla5Qa5Ve4F1ORvDjS5jLnMDsbx1LEBtG1o5pVVy1SjzkFOyJ5BI/blbcHR5wk9Up4T/2ipB
	+8HLSf6TD4cKGZHcW57hNZDgoKO+cH4e4mMk6w7WQsAcsJFcZgNKctLVfh8H/E8dHZ533qrfVl9
	YuLfx9Zx5aRZtRuDB6RNXr51pXVZWCFd2jGls8ePlLK4oDGYBlBM/83XGIEgCwk9Qj+VsgdXmpZ
	MaH1Zz6a8jGcf+IBfUJ2fsPjY70S7qhDFfL+8JehkExuIBUBYKGGNE2qEEI7DqRYDEiU5Q9Et0N
X-Received: by 2002:a05:6000:1acb:b0:485:8b5d:96d with SMTP id ffacd0b85a97d-4858b5d0d2dmr21292312f8f.19.1788641132695;
        Sat, 05 Sep 2026 13:45:32 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa0048511f7ccf23d3ce.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:4851:1f7c:cf23:d3ce])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485885bfdf6sm17069098f8f.34.2026.09.05.13.45.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 13:45:32 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 39/40] go: upgrade 1.26.6 -> 1.26.7
Date: Sat,  5 Sep 2026 22:44:40 +0200
Message-ID: <f5d807c50beaac084c14e42e1f9cc8041b757862.1788629392.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1788629392.git.yoann.congal@smile.fr>
References: <cover.1788629392.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 05 Sep 2026 20:45:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245191

From: Peter Marko <peter.marko@siemens.com>

Upgrade to latest 1.26.x release [1]:

$ git --no-pager log --oneline go1.26.6..go1.26.7
e3336a22ad (tag: go1.26.7) [release-branch.go1.26] go1.26.7
50e5b59e9c [release-branch.go1.26] net/http: clear ReadHeaderTimeout after accepting an unencrypted h2 conn
98e6631a5a [release-branch.go1.26] cmd/internal/moddeps: restore tests

This minor release includes a fix to address a breakage affecting
unencrypted HTTP/2 (h2c) connections caused by a security patch
included in last week’s release. See go.dev/issue/80876 for details.

Release information: [2]

[1] https://github.com/golang/go/compare/go1.26.6...go1.26.7
[2] https://groups.google.com/g/golang-announce/c/qA6Vpj2UA-4

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(From OE-Core rev: e6739374b865cae8d6f105c7a600a52736579c25)
Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-devtools/go/{go-1.26.6.inc => go-1.26.7.inc}   | 2 +-
 ...o-binary-native_1.26.6.bb => go-binary-native_1.26.7.bb} | 6 +++---
 ...cross-canadian_1.26.6.bb => go-cross-canadian_1.26.7.bb} | 0
 .../go/{go-cross_1.26.6.bb => go-cross_1.26.7.bb}           | 0
 .../go/{go-crosssdk_1.26.6.bb => go-crosssdk_1.26.7.bb}     | 0
 .../go/{go-runtime_1.26.6.bb => go-runtime_1.26.7.bb}       | 0
 meta/recipes-devtools/go/{go_1.26.6.bb => go_1.26.7.bb}     | 0
 7 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/go/{go-1.26.6.inc => go-1.26.7.inc} (90%)
 rename meta/recipes-devtools/go/{go-binary-native_1.26.6.bb => go-binary-native_1.26.7.bb} (80%)
 rename meta/recipes-devtools/go/{go-cross-canadian_1.26.6.bb => go-cross-canadian_1.26.7.bb} (100%)
 rename meta/recipes-devtools/go/{go-cross_1.26.6.bb => go-cross_1.26.7.bb} (100%)
 rename meta/recipes-devtools/go/{go-crosssdk_1.26.6.bb => go-crosssdk_1.26.7.bb} (100%)
 rename meta/recipes-devtools/go/{go-runtime_1.26.6.bb => go-runtime_1.26.7.bb} (100%)
 rename meta/recipes-devtools/go/{go_1.26.6.bb => go_1.26.7.bb} (100%)

diff --git a/meta/recipes-devtools/go/go-1.26.6.inc b/meta/recipes-devtools/go/go-1.26.7.inc
similarity index 90%
rename from meta/recipes-devtools/go/go-1.26.6.inc
rename to meta/recipes-devtools/go/go-1.26.7.inc
index fa6b0a50a14..fed87015b2c 100644
--- a/meta/recipes-devtools/go/go-1.26.6.inc
+++ b/meta/recipes-devtools/go/go-1.26.7.inc
@@ -16,4 +16,4 @@ SRC_URI += "\
     file://0009-go-Filter-build-paths-on-staticly-linked-arches.patch \
     file://0010-cmd-go-clear-GOROOT-for-func-ldShared-when-trimpath-.patch \
 "
-SRC_URI[main.sha256sum] = "a0721c54c688901448d77ad9b3ec7ea7c474730755ff891382e92ecb93ff2cb1"
+SRC_URI[main.sha256sum] = "0ed24eac755105085b89fe9cabc2742b91a0ad7b94b59d3ad364918ebc8956ad"
diff --git a/meta/recipes-devtools/go/go-binary-native_1.26.6.bb b/meta/recipes-devtools/go/go-binary-native_1.26.7.bb
similarity index 80%
rename from meta/recipes-devtools/go/go-binary-native_1.26.6.bb
rename to meta/recipes-devtools/go/go-binary-native_1.26.7.bb
index 2913fb65151..753f1b13bb5 100644
--- a/meta/recipes-devtools/go/go-binary-native_1.26.6.bb
+++ b/meta/recipes-devtools/go/go-binary-native_1.26.7.bb
@@ -9,9 +9,9 @@ PROVIDES = "go-native"
 
 # Checksums available at https://go.dev/dl/
 SRC_URI = "https://dl.google.com/go/go${PV}.${BUILD_GOOS}-${BUILD_GOARCH}.tar.gz;name=go_${BUILD_GOTUPLE}"
-SRC_URI[go_linux_amd64.sha256sum] = "708effb774be8237570d0add163225abbdfaf4fca28b2611df167beba4feef89"
-SRC_URI[go_linux_arm64.sha256sum] = "d0507e9e9d7fe012aae570108cbd76c15de879e17130ab8cb90d4d7445cb1f2e"
-SRC_URI[go_linux_ppc64le.sha256sum] = "232b65543a42eda95df6a63f76235c1795bb535eba5c74e509faec71bc648388"
+SRC_URI[go_linux_amd64.sha256sum] = "ffb5f8de10c62550dfddab66b36b57030721e0a44a3218e9e1181d7b59f121ca"
+SRC_URI[go_linux_arm64.sha256sum] = "5a4ec883379d51ee9ce1040d5e87f8d35e20387574dd8c947feb01eabc3c1b37"
+SRC_URI[go_linux_ppc64le.sha256sum] = "22d3b362d557175fd16b79651cab0cad64f8aaaedca745f66d16f44d56bc5de1"
 
 UPSTREAM_CHECK_URI = "https://golang.org/dl/"
 UPSTREAM_CHECK_REGEX = "go(?P<pver>\d+(\.\d+)+)\.linux"
diff --git a/meta/recipes-devtools/go/go-cross-canadian_1.26.6.bb b/meta/recipes-devtools/go/go-cross-canadian_1.26.7.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross-canadian_1.26.6.bb
rename to meta/recipes-devtools/go/go-cross-canadian_1.26.7.bb
diff --git a/meta/recipes-devtools/go/go-cross_1.26.6.bb b/meta/recipes-devtools/go/go-cross_1.26.7.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross_1.26.6.bb
rename to meta/recipes-devtools/go/go-cross_1.26.7.bb
diff --git a/meta/recipes-devtools/go/go-crosssdk_1.26.6.bb b/meta/recipes-devtools/go/go-crosssdk_1.26.7.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-crosssdk_1.26.6.bb
rename to meta/recipes-devtools/go/go-crosssdk_1.26.7.bb
diff --git a/meta/recipes-devtools/go/go-runtime_1.26.6.bb b/meta/recipes-devtools/go/go-runtime_1.26.7.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-runtime_1.26.6.bb
rename to meta/recipes-devtools/go/go-runtime_1.26.7.bb
diff --git a/meta/recipes-devtools/go/go_1.26.6.bb b/meta/recipes-devtools/go/go_1.26.7.bb
similarity index 100%
rename from meta/recipes-devtools/go/go_1.26.6.bb
rename to meta/recipes-devtools/go/go_1.26.7.bb

