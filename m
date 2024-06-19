Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCDE8C27C79
	for <webhook@archiver.kernel.org>; Wed, 19 Jun 2024 15:48:14 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web10.24615.1718812090587995538
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Jun 2024 08:48:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TznF7tcV;
 spf=pass (domain: gmail.com, ip: 209.85.221.49, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-35f275c7286so6028807f8f.2
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Jun 2024 08:48:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718812089; x=1719416889; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gDMz2XG3Mof9O6OvO/3R83lZBEcboyLgqdTx2qDGuaI=;
        b=TznF7tcVcbvjB5E8dGBzXYKqlFGIkHCijQqDjXbm6yWkeNR1wDylitpy2KQQ+wkgmI
         HDfUH3BNt+Hbxb9QES5KhxWsbmSLIlUNtJ4uwjCdZUBZljMeSEvh0OORx3de/d7vJ+8v
         aJbD6FKfjASUNmsMrumNleLk3hyjMXe6ZJ0NttVIR8+81C5mi9p5ducXI/xVnCM5A8Hz
         oOpf20DHNXTM666jtFYvQoJnx4gY73PJX4WfWb6FbPBhF1KTYCW5lT6BL3DCFZlXTUlV
         TKyl8zw4YXy6yf6P/tGgQ8Os1QS45fl/mG0PagFv7NHoXwTsxv+o3VBpfMBAZf46Yz6t
         zMfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718812089; x=1719416889;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gDMz2XG3Mof9O6OvO/3R83lZBEcboyLgqdTx2qDGuaI=;
        b=lw8lWukuTXUoosgMK5zzSWWIMoCBMfxxhNVrL4omA/okw1HDSGueNArQ0A9lbtEkhg
         iPsQTPhmxpujDgk0kjGZkgv1izixwSlwZionnkkjjeLxXrq/246z5xUBPzU5avgVnZaz
         VkrvewsOeQX2NAZsTRi3yRgS4A7mfCgTjNxmpVh4Tme8ArUU/RafXoKVQbRoIfbU2ibZ
         3DU9f9C8YJQ4zahny2ikaBLmEkPVafu1DKKf3YkykcaZCxUddPqHO1BM5A9Jtq2qVbZQ
         wqQyQs+KZAAR4Cq0oRg+zIjSBLU/cJpo6esaN4LEHNt5XDLkZtJJNR23Bg17r4s7tK/f
         qa9w==
X-Gm-Message-State: AOJu0Yz+tJVBUPZxEApUiLOP2uYsUxMiOa/KVt1Adubznx6n27G9PDja
	YNjgELb6rhYvOHG1Q9bSSWrpTzM6wBPyfVKJQnCl6YnMxKW+PkFHVH8nIz0W
X-Google-Smtp-Source: AGHT+IFhS6EmeZGto15xgHlGKzSvuaeQNyQ+MvxarnMtRGeY+sUhgmnQZdxfwtveUwl9wKWZTWx5lA==
X-Received: by 2002:a5d:5902:0:b0:362:f291:6f97 with SMTP id ffacd0b85a97d-363177a3a2amr2011158f8f.18.1718812088541;
        Wed, 19 Jun 2024 08:48:08 -0700 (PDT)
Received: from toster.lan (bl15-243-112.dsl.telepac.pt. [188.80.243.112])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36077536f78sm17341798f8f.7.2024.06.19.08.48.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jun 2024 08:48:08 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <jose.quaresma@foundries.io>
Subject: [OE-core][PATCH v2 1/3] go: upgrade 1.22.3 -> 1.22.4
Date: Wed, 19 Jun 2024 16:47:42 +0100
Message-ID: <20240619154744.381373-1-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Jun 2024 15:48:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200919

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
2.45.2


