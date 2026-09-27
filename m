Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2C7ECA5FAA
	for <webhook@archiver.kernel.org>; Sun, 27 Sep 2026 07:43:56 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.33578.1790495021139118459
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Sep 2026 00:43:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=aS/1QduU;
 spf=pass (domain: smile.fr, ip: 209.85.221.52, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48870973bddso932429f8f.1
        for <openembedded-core@lists.openembedded.org>; Sun, 27 Sep 2026 00:43:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1790495019; x=1791099819; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=s/8VsgU7Ry1rcW3c4Btm+XkLj/vyHGTsc21Y2CxDYOQ=;
        b=aS/1QduU1almxROaLaqBDGvtJe2F24esxDalSRRsYUN2Bii/fPma/AYWpT/wlLdESi
         qWR8yDILqgZwRv/hU2/bR5stHeV+qqLiC3Y41cl4c9k+REaXYKtFybwE/DfIcpYxuZZV
         uCvIMMDBPIIIkk1Uex4+GNLnFUN4/ifzNpXLE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790495019; x=1791099819;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=s/8VsgU7Ry1rcW3c4Btm+XkLj/vyHGTsc21Y2CxDYOQ=;
        b=Og3cvBVUasi/7RnR/KbQZ7GwxQ+gk3YrmsEotYhCycL9O/++ILl97fuArNnuWcA3c6
         92MjAFNkeE8HFWE7SUtqnF0Rn2tLcXV/z7wBRaXwj9bGtBlVM8Il/lRDnHQLQ4dc1uyy
         5ZUg0281aFz4lp8zyBK3i/6cg8DyEWVVu5BTLCDQvPV9xb91s3IdafH4v7mQJwIMUmgf
         EluuNuE35rW3SA03GDhRh1zxlur88cpWs0b5lFgWwu/i3xb9YXm4pFApk6KWACaxdFVi
         HJNyBa6Ic0WHpicaGfMH2lGj9CJtA0kMaalKPWcm73QapWPoaiNqhaqfavASTHiKRBSb
         Xssg==
X-Gm-Message-State: AFq9FYIPT0cT5SPMoTLlOcBWaaP3sATFAsq56AvYXJgvQh2rhu2Spy52
	B5JF7gU/E/16PGvJgvRue/YfnNpWVo3vo34g0pidacV9ExBzbhAaZN5yq5W9IvCOnYtuc5p6Y4V
	Q1oGdH1s=
X-Gm-Gg: AYBFou3aCvoeabd8lknFwytS6+RdxqO11d0o3sVAMWli2yeKAMB91U4IqUvW+ClUpdi
	UzKb1bxyRtzSY8B2R2hlM+und2PncgrIA9ECqrF9jMVfRcccsCugeUsfmnxwbXmr746ygK0Maeh
	BTYBmotubIJ2toBDx47RpwjJMqDvsepoRyABnS66YZGFicwjAvYBWxbGxbLeDkRgVcvoNEafZG4
	uBZYpEOafFCDKXjKXvYyySQGbVyybQxuzC691Fwt8Ds5L1GRxWnJ+dotK5LdpNQZMATIl63WwwF
	OBWeSzYaSi00fFmUqOxnvovbq83WSS2uRx/+3FeEe2MoAL2BDt65I3YqicIkZldvJH6X1kUj3mS
	tv884HSa2mSQHH7j+lRfKHZs0nZo1Sp14ueysYvCgTMC5mtlSSHHYgqO2EZE12E83vTcquexO6M
	2r0MjTvqS8u7v15QT1d59GQbXmdND50mC5W6bx8VYlVaqBCpZ2yGVBShG1DWCr2QHb8j5ELzZPL
	glmYf0zQO+gwyLqT4vu7MRqzEUrOzwO+MWd7wXGljnCe+gAU1mlISZKU25nzxztsZz3xbp3rC5L
	tgwli9+Q
X-Received: by 2002:a05:6000:4b19:b0:488:8882:d504 with SMTP id ffacd0b85a97d-4888882d749mr6094377f8f.10.1790495019015;
        Sun, 27 Sep 2026 00:43:39 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a30c43asm19821375f8f.3.2026.09.27.00.43.38
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 00:43:38 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 01/28] go: upgrade 1.26.7 -> 1.26.8
Date: Sun, 27 Sep 2026 09:42:52 +0200
Message-ID: <eebcf4bd8fe95928963a32db35962f9a7fa9783c.1790494949.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1790494949.git.yoann.congal@smile.fr>
References: <cover.1790494949.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Sep 2026 07:43:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246651

From: Peter Marko <peter.marko@siemens.com>

Upgrade to latest 1.26.x release [1]:

$ git --no-pager log --oneline go1.26.7..go1.26.8
c293dd49cb (tag: go1.26.8) [release-branch.go1.26] go1.26.8
3cc00d9c2b [release-branch.go1.26] cmd/compile: fix mergelocals for arm32/s390x/riscv64
e9fde2dea1 [release-branch.go1.26] debug/elf: use addend when applying ppc relocations
d19a1e81bc [release-branch.go1.26] cmd/go/internal: fix copy paste error
dbe8fd98d7 [release-branch.go1.26] os: don't symlink on Root.Mkdir("symlink/") on openbsd
d1434dbd34 [release-branch.go1.26] internal/cpu: disable AVX+ on netbsd/amd64

This is a bugfix release.

Release information: [2]

[1] https://github.com/golang/go/compare/go1.26.7...go1.26.8
[2] https://groups.google.com/g/golang-announce/c/QiTRm-HGGtI

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-devtools/go/{go-1.26.7.inc => go-1.26.8.inc}   | 2 +-
 ...o-binary-native_1.26.7.bb => go-binary-native_1.26.8.bb} | 6 +++---
 ...cross-canadian_1.26.7.bb => go-cross-canadian_1.26.8.bb} | 0
 .../go/{go-cross_1.26.7.bb => go-cross_1.26.8.bb}           | 0
 .../go/{go-crosssdk_1.26.7.bb => go-crosssdk_1.26.8.bb}     | 0
 .../go/{go-runtime_1.26.7.bb => go-runtime_1.26.8.bb}       | 0
 meta/recipes-devtools/go/{go_1.26.7.bb => go_1.26.8.bb}     | 0
 7 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/go/{go-1.26.7.inc => go-1.26.8.inc} (90%)
 rename meta/recipes-devtools/go/{go-binary-native_1.26.7.bb => go-binary-native_1.26.8.bb} (80%)
 rename meta/recipes-devtools/go/{go-cross-canadian_1.26.7.bb => go-cross-canadian_1.26.8.bb} (100%)
 rename meta/recipes-devtools/go/{go-cross_1.26.7.bb => go-cross_1.26.8.bb} (100%)
 rename meta/recipes-devtools/go/{go-crosssdk_1.26.7.bb => go-crosssdk_1.26.8.bb} (100%)
 rename meta/recipes-devtools/go/{go-runtime_1.26.7.bb => go-runtime_1.26.8.bb} (100%)
 rename meta/recipes-devtools/go/{go_1.26.7.bb => go_1.26.8.bb} (100%)

diff --git a/meta/recipes-devtools/go/go-1.26.7.inc b/meta/recipes-devtools/go/go-1.26.8.inc
similarity index 90%
rename from meta/recipes-devtools/go/go-1.26.7.inc
rename to meta/recipes-devtools/go/go-1.26.8.inc
index fed87015b2c..7fa02ad7100 100644
--- a/meta/recipes-devtools/go/go-1.26.7.inc
+++ b/meta/recipes-devtools/go/go-1.26.8.inc
@@ -16,4 +16,4 @@ SRC_URI += "\
     file://0009-go-Filter-build-paths-on-staticly-linked-arches.patch \
     file://0010-cmd-go-clear-GOROOT-for-func-ldShared-when-trimpath-.patch \
 "
-SRC_URI[main.sha256sum] = "0ed24eac755105085b89fe9cabc2742b91a0ad7b94b59d3ad364918ebc8956ad"
+SRC_URI[main.sha256sum] = "4e39b98e42f946fa05ac8bc5b71877df97dbdb7cbb1a777b541667ad7117fd2e"
diff --git a/meta/recipes-devtools/go/go-binary-native_1.26.7.bb b/meta/recipes-devtools/go/go-binary-native_1.26.8.bb
similarity index 80%
rename from meta/recipes-devtools/go/go-binary-native_1.26.7.bb
rename to meta/recipes-devtools/go/go-binary-native_1.26.8.bb
index 034c051cee7..1865c700fd4 100644
--- a/meta/recipes-devtools/go/go-binary-native_1.26.7.bb
+++ b/meta/recipes-devtools/go/go-binary-native_1.26.8.bb
@@ -9,9 +9,9 @@ PROVIDES = "go-native"
 
 # Checksums available at https://go.dev/dl/
 SRC_URI = "https://dl.google.com/go/go${PV}.${BUILD_GOOS}-${BUILD_GOARCH}.tar.gz;name=go_${BUILD_GOTUPLE}"
-SRC_URI[go_linux_amd64.sha256sum] = "ffb5f8de10c62550dfddab66b36b57030721e0a44a3218e9e1181d7b59f121ca"
-SRC_URI[go_linux_arm64.sha256sum] = "5a4ec883379d51ee9ce1040d5e87f8d35e20387574dd8c947feb01eabc3c1b37"
-SRC_URI[go_linux_ppc64le.sha256sum] = "22d3b362d557175fd16b79651cab0cad64f8aaaedca745f66d16f44d56bc5de1"
+SRC_URI[go_linux_amd64.sha256sum] = "d0f743b33e8d8945e6b1f432edd15785c70507121d6e2a723b21285eddf8b57b"
+SRC_URI[go_linux_arm64.sha256sum] = "211ffced9dcb9633a55eac6364816ec0ddd951389a740e88fa8b3337971bdda0"
+SRC_URI[go_linux_ppc64le.sha256sum] = "0ddf3ecab842013e6bd618602823a0b8158a18d3e9362f2540463ea5aa184975"
 
 UPSTREAM_CHECK_URI = "https://golang.org/dl/"
 UPSTREAM_CHECK_REGEX = "go(?P<pver>\d+(\.\d+)+)\.linux"
diff --git a/meta/recipes-devtools/go/go-cross-canadian_1.26.7.bb b/meta/recipes-devtools/go/go-cross-canadian_1.26.8.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross-canadian_1.26.7.bb
rename to meta/recipes-devtools/go/go-cross-canadian_1.26.8.bb
diff --git a/meta/recipes-devtools/go/go-cross_1.26.7.bb b/meta/recipes-devtools/go/go-cross_1.26.8.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross_1.26.7.bb
rename to meta/recipes-devtools/go/go-cross_1.26.8.bb
diff --git a/meta/recipes-devtools/go/go-crosssdk_1.26.7.bb b/meta/recipes-devtools/go/go-crosssdk_1.26.8.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-crosssdk_1.26.7.bb
rename to meta/recipes-devtools/go/go-crosssdk_1.26.8.bb
diff --git a/meta/recipes-devtools/go/go-runtime_1.26.7.bb b/meta/recipes-devtools/go/go-runtime_1.26.8.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-runtime_1.26.7.bb
rename to meta/recipes-devtools/go/go-runtime_1.26.8.bb
diff --git a/meta/recipes-devtools/go/go_1.26.7.bb b/meta/recipes-devtools/go/go_1.26.8.bb
similarity index 100%
rename from meta/recipes-devtools/go/go_1.26.7.bb
rename to meta/recipes-devtools/go/go_1.26.8.bb

