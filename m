Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 946DDC3065B
	for <webhook@archiver.kernel.org>; Sun, 30 Jun 2024 20:08:08 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web10.4234.1719778083764544307
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Jun 2024 13:08:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=uzLmZZZX;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.182, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-706a4a04891so1311473b3a.3
        for <openembedded-core@lists.openembedded.org>; Sun, 30 Jun 2024 13:08:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1719778083; x=1720382883; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h/Op4I0ry5+BnaWoX1xfnd14de4vA1cmNBGhwsTjmzk=;
        b=uzLmZZZXX44pHi0YHjfm9ASS/uDSjE2cDX/TycIkkBklkxBup6uqpE3mm2C5eoFEWR
         U9xaGm+E+Lx/kBhZqbGXKLvM9eKqSn35yewf+lXywlE4XDCAaBLcLGVvZZxbpWDwJttr
         8ahrAxeknm71SaNq26fCKwsJx8cuefZofoy+HxBTlmat6KcnhkHEUkAawQt3c+OpV3I3
         AvRemvvL4VqfQH2HXP2zfnhKlJ1S+0epyFPI0ry8BDfqIJnuzAmuMYewaf2AapVYj6hD
         CSzDrPk73sfwnVeKtw12uZpiLrLuZ+Mf55+SVGJOdi1w6K8MvtwxmmRBTnKpbFGJeEpC
         m/Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719778083; x=1720382883;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h/Op4I0ry5+BnaWoX1xfnd14de4vA1cmNBGhwsTjmzk=;
        b=cXO1eqA740OEJPbwJXgIb0sIGKgiKSXVgImvN8GnUot/5LiXqw8kLI0LeJPjIbfeeu
         arPh6ISOWHEYrMwNZSR5g7dsc4Vc5AGLCxYgqQ9eUwaeIOSWAlXziO0eB8JIXzrYz43Q
         bfKsxekJchPrzSGweh9nMrrPoCnF4I/u3mBeCmHZBbwd4srFPCXf+GymebXYFP51HZ14
         q6gV1C6bhRSYbNpII4oLmaHCxh0Q1wNpqY7zfkU5wvjLzBTk9BSQLsyMxwdCznE72LWm
         G/Osi0W5Fw5e85JhWSUU4sq+BKua/5k4cWhbIRmgSNBgt+bi+GQhdUNMKdtCeOW8iwM8
         dtMA==
X-Gm-Message-State: AOJu0YznEufZdKRu6JosMxqb5xKvjyz/5k1yRmJTuesQzyA09j0fncGH
	/Sn7XNgLapTc5AtevKZD9va/q2n7WQcKv1S1ABcdKedLfebmsdbDHfJEHcRUSRue60H1feBBFvt
	0Ar0=
X-Google-Smtp-Source: AGHT+IHISar0ENkW8FCijHdttuvAZk26PpXK5OpvKUvqAUyLCQFruTp+IK/fN8ZheDJRXTnMEbkrJw==
X-Received: by 2002:a05:6a00:194b:b0:704:20b3:fe21 with SMTP id d2e1a72fcca58-70aaad4b0eemr2726602b3a.11.1719778082901;
        Sun, 30 Jun 2024 13:08:02 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-72c6a6f0817sm3340835a12.27.2024.06.30.13.08.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Jun 2024 13:08:02 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 06/35] go: upgrade 1.22.3 -> 1.22.4
Date: Sun, 30 Jun 2024 13:07:18 -0700
Message-Id: <ba176de9bd8681c00d4388945fc9c9cc1807591c.1719777887.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1719777887.git.steve@sakoman.com>
References: <cover.1719777887.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 30 Jun 2024 20:08:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201243

From: Jose Quaresma <quaresma.jose@gmail.com>

Include fixes for CVE-2024-24790

Upgrade to latest 1.22.x release [1]:

$ git --no-pager log --oneline go1.22.3..go1.22.4
ace5bb40d0 (tag: go1.22.4) [release-branch.go1.22] go1.22.4
12d5810cdb [release-branch.go1.22] net/netip: check if address is v6 mapped in Is methods
745657509e [release-branch.go1.22] os: RemoveAll: fix symlink race for unix
95389d3d9d [release-branch.go1.22] runtime: x_cgo_getstackbound: initialize pthread attr
cf501ac0c5 [release-branch.go1.22] archive/zip: treat truncated EOCDR comment as an error
cb55d1a0c8 [release-branch.go1.22] cmd/link: add runtime.text.N symbols to macho symbol table in dynlink mode
3c96ae0870 [release-branch.go1.22] runtime: update large object stats before freeSpan in sweep
6b89e7dc5a [release-branch.go1.22] cmd/compile: initialize posBaseMap correctly
185457da9b [release-branch.go1.22] crypto/x509: remove TestPlatformVerifierLegacy tests
3a84293118 [release-branch.go1.22] cmd/compile: avoid past-the-end pointer when zeroing
362dcedfdb [release-branch.go1.22] cmd/go/testdata/script: add darwin skips for selected buildrepro tests
d4a81ec7ee [release-branch.go1.22] cmd/go/testdata/script: clear path in gotoolchain_issue66175
dc8976dd0b [release-branch.go1.22] cmd/compile: don't combine loads in generated equality functions
00e6815208 [release-branch.go1.22] cmd/go: download 1.X.0 instead of 1.X during toolchain upgrade.

[1] https://github.com/golang/go/compare/go1.22.3...go1.22.4

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit cf139dfec080152a66a9c42bfb9bfca6789909be)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/go/{go-1.22.3.inc => go-1.22.4.inc}   | 2 +-
 ...o-binary-native_1.22.3.bb => go-binary-native_1.22.4.bb} | 6 +++---
 ...cross-canadian_1.22.3.bb => go-cross-canadian_1.22.4.bb} | 0
 .../go/{go-cross_1.22.3.bb => go-cross_1.22.4.bb}           | 0
 .../go/{go-crosssdk_1.22.3.bb => go-crosssdk_1.22.4.bb}     | 0
 .../go/{go-native_1.22.3.bb => go-native_1.22.4.bb}         | 0
 .../go/{go-runtime_1.22.3.bb => go-runtime_1.22.4.bb}       | 0
 meta/recipes-devtools/go/{go_1.22.3.bb => go_1.22.4.bb}     | 0
 8 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/go/{go-1.22.3.inc => go-1.22.4.inc} (89%)
 rename meta/recipes-devtools/go/{go-binary-native_1.22.3.bb => go-binary-native_1.22.4.bb} (78%)
 rename meta/recipes-devtools/go/{go-cross-canadian_1.22.3.bb => go-cross-canadian_1.22.4.bb} (100%)
 rename meta/recipes-devtools/go/{go-cross_1.22.3.bb => go-cross_1.22.4.bb} (100%)
 rename meta/recipes-devtools/go/{go-crosssdk_1.22.3.bb => go-crosssdk_1.22.4.bb} (100%)
 rename meta/recipes-devtools/go/{go-native_1.22.3.bb => go-native_1.22.4.bb} (100%)
 rename meta/recipes-devtools/go/{go-runtime_1.22.3.bb => go-runtime_1.22.4.bb} (100%)
 rename meta/recipes-devtools/go/{go_1.22.3.bb => go_1.22.4.bb} (100%)

diff --git a/meta/recipes-devtools/go/go-1.22.3.inc b/meta/recipes-devtools/go/go-1.22.4.inc
similarity index 89%
rename from meta/recipes-devtools/go/go-1.22.3.inc
rename to meta/recipes-devtools/go/go-1.22.4.inc
index 34703bc1fa..44897daba4 100644
--- a/meta/recipes-devtools/go/go-1.22.3.inc
+++ b/meta/recipes-devtools/go/go-1.22.4.inc
@@ -15,4 +15,4 @@ SRC_URI += "\
     file://0008-src-cmd-dist-buildgo.go-do-not-hardcode-host-compile.patch \
     file://0009-go-Filter-build-paths-on-staticly-linked-arches.patch \
 "
-SRC_URI[main.sha256sum] = "80648ef34f903193d72a59c0dff019f5f98ae0c9aa13ade0b0ecbff991a76f68"
+SRC_URI[main.sha256sum] = "fed720678e728a7ca30ba8d1ded1caafe27d16028fab0232b8ba8e22008fb784"
diff --git a/meta/recipes-devtools/go/go-binary-native_1.22.3.bb b/meta/recipes-devtools/go/go-binary-native_1.22.4.bb
similarity index 78%
rename from meta/recipes-devtools/go/go-binary-native_1.22.3.bb
rename to meta/recipes-devtools/go/go-binary-native_1.22.4.bb
index b67d97608d..61da51be3a 100644
--- a/meta/recipes-devtools/go/go-binary-native_1.22.3.bb
+++ b/meta/recipes-devtools/go/go-binary-native_1.22.4.bb
@@ -9,9 +9,9 @@ PROVIDES = "go-native"
 
 # Checksums available at https://go.dev/dl/
 SRC_URI = "https://dl.google.com/go/go${PV}.${BUILD_GOOS}-${BUILD_GOARCH}.tar.gz;name=go_${BUILD_GOTUPLE}"
-SRC_URI[go_linux_amd64.sha256sum] = "8920ea521bad8f6b7bc377b4824982e011c19af27df88a815e3586ea895f1b36"
-SRC_URI[go_linux_arm64.sha256sum] = "6c33e52a5b26e7aa021b94475587fce80043a727a54ceb0eee2f9fc160646434"
-SRC_URI[go_linux_ppc64le.sha256sum] = "04b7b05283de30dd2da20bf3114b2e22cc727938aed3148babaf35cc951051ac"
+SRC_URI[go_linux_amd64.sha256sum] = "ba79d4526102575196273416239cca418a651e049c2b099f3159db85e7bade7d"
+SRC_URI[go_linux_arm64.sha256sum] = "a8e177c354d2e4a1b61020aca3562e27ea3e8f8247eca3170e3fa1e0c2f9e771"
+SRC_URI[go_linux_ppc64le.sha256sum] = "a3e5834657ef92523f570f798fed42f1f87bc18222a16815ec76b84169649ec4"
 
 UPSTREAM_CHECK_URI = "https://golang.org/dl/"
 UPSTREAM_CHECK_REGEX = "go(?P<pver>\d+(\.\d+)+)\.linux"
diff --git a/meta/recipes-devtools/go/go-cross-canadian_1.22.3.bb b/meta/recipes-devtools/go/go-cross-canadian_1.22.4.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross-canadian_1.22.3.bb
rename to meta/recipes-devtools/go/go-cross-canadian_1.22.4.bb
diff --git a/meta/recipes-devtools/go/go-cross_1.22.3.bb b/meta/recipes-devtools/go/go-cross_1.22.4.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross_1.22.3.bb
rename to meta/recipes-devtools/go/go-cross_1.22.4.bb
diff --git a/meta/recipes-devtools/go/go-crosssdk_1.22.3.bb b/meta/recipes-devtools/go/go-crosssdk_1.22.4.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-crosssdk_1.22.3.bb
rename to meta/recipes-devtools/go/go-crosssdk_1.22.4.bb
diff --git a/meta/recipes-devtools/go/go-native_1.22.3.bb b/meta/recipes-devtools/go/go-native_1.22.4.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-native_1.22.3.bb
rename to meta/recipes-devtools/go/go-native_1.22.4.bb
diff --git a/meta/recipes-devtools/go/go-runtime_1.22.3.bb b/meta/recipes-devtools/go/go-runtime_1.22.4.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-runtime_1.22.3.bb
rename to meta/recipes-devtools/go/go-runtime_1.22.4.bb
diff --git a/meta/recipes-devtools/go/go_1.22.3.bb b/meta/recipes-devtools/go/go_1.22.4.bb
similarity index 100%
rename from meta/recipes-devtools/go/go_1.22.3.bb
rename to meta/recipes-devtools/go/go_1.22.4.bb
-- 
2.34.1


