Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26C0BC2BA1A
	for <webhook@archiver.kernel.org>; Wed, 19 Jun 2024 10:34:23 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web10.17770.1718793258870211497
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Jun 2024 03:34:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UOprryNt;
 spf=pass (domain: gmail.com, ip: 209.85.221.54, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-362f62ae4c5so487652f8f.1
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Jun 2024 03:34:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718793257; x=1719398057; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jir1M83FSVBz14bs/J00deHQ6eAl6zVe6XjJlKds8FY=;
        b=UOprryNtzqxAP0knSlT5s2/rVCTP9Zp7joiYj3skLnvX21u9u/SPAGxU4SroeqE3qY
         vmxKjcMkQo55ByLAC52v7yYpoJcxmCINj00BsuWALSg1zFd+0t3AEPILHOVNnksOLrSc
         Pdd9GeYiXBrBpWU+N1sVmWx76JAxe679YT7OFD9uScndCMRl2yI1six1UNplyBMeqjtl
         vrPTvy4zcbRYD5seOoNIuOLQEXKQJYxVzX90nSnbhvBF/oRZGweDz8AEQxAlIZLItLAk
         Lt0JRoFyCBP4JjR4BJrpZbzWYTDrgWoOjCc+tizEV5r2lBx184WV6HiNTqf1FlzLZ++Q
         rXXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718793257; x=1719398057;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jir1M83FSVBz14bs/J00deHQ6eAl6zVe6XjJlKds8FY=;
        b=Fxt3hl6Y4Q21mt+9PLBFVSmSK9RlrpH30NdjOIudH3g8SdixHE5M3euFRQHG+5yFZ+
         zlsYP9MTijNA2SILxSmFgohkzfoEC4QVgiNxUzwFIOmYo2w+jIv6fhSYZrPtLkTC0CpD
         j5N8AhfzfZM8gX3N0dYBD1wHIUMVpeddxHRCHOlWlJCd3kgLiTKopgpyJCvICVEzN52C
         zrALZHjxlt3Omxon6/2ilur6YAiaIw4Uwe3Kvm5opA++8vWiefvw1zLKjFul04PxL4lC
         PSRFq0bsT9ZFhNSBVYz4avtyAZne5XPf6JUTmZUNQu22dLbbQJj2fy6gXMagDF7RiKs3
         ArqQ==
X-Gm-Message-State: AOJu0Yz/iSZbhRluXnmh0hFBAezTudpfWdD/x127fARo+8wFUGRqLnfc
	cXNdP1lxL6UQKgD/C1BwYCYXyWa14bfcXvKvyKpMZd3Lp5xrjS0VzWNoDvf/
X-Google-Smtp-Source: AGHT+IECw4URTxxTYs5ZN3q/Xy4bUlufBF9NgKgxBHnKgxb68JLmpWyNlhQDr9wIrZ9vPmrpuGbAmQ==
X-Received: by 2002:a5d:4dc2:0:b0:361:94d9:1e9f with SMTP id ffacd0b85a97d-36194d9203amr3714908f8f.7.1718793257031;
        Wed, 19 Jun 2024 03:34:17 -0700 (PDT)
Received: from toster.lan (bl15-243-112.dsl.telepac.pt. [188.80.243.112])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-362f03ac73dsm2697837f8f.55.2024.06.19.03.34.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jun 2024 03:34:16 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <jose.quaresma@foundries.io>
Subject: [OE-core][PATCH 3/3] go: move to a single binary bootstrap option
Date: Wed, 19 Jun 2024 11:34:06 +0100
Message-ID: <20240619103406.276716-3-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240619103406.276716-1-jose.quaresma@foundries.io>
References: <20240619103406.276716-1-jose.quaresma@foundries.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Jun 2024 10:34:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200907

With the drop of the old 1.4 bootstrap C version we can
move the go-binary-native to go-binary and drop the PREFERRED_PROVIDER

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
---
 meta/conf/distro/include/tcmode-default.inc                   | 4 ----
 .../go/{go-binary-native_1.22.4.bb => go-native_1.22.4.bb}    | 2 --
 2 files changed, 6 deletions(-)
 rename meta/recipes-devtools/go/{go-binary-native_1.22.4.bb => go-native_1.22.4.bb} (98%)

diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
index 4fb6e47b7f..a9724d7621 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -62,10 +62,6 @@ PREFERRED_VERSION_qemu ?= "${QEMUVERSION}"
 PREFERRED_VERSION_qemu-native ?= "${QEMUVERSION}"
 PREFERRED_VERSION_nativesdk-qemu ?= "${QEMUVERSION}"
 
-# Bootstrap Go using a binary release from golang.org.  If you want to bootstrap
-# from source using the C-implemented Go 1.4 (only supports x86-64 hosts) then use
-# go-native.
-PREFERRED_PROVIDER_go-native ?= "go-binary-native"
 PREFERRED_VERSION_virtual/${TARGET_PREFIX}go ?= "${GOVERSION}"
 PREFERRED_VERSION_go-cross-${TUNE_PKGARCH} ?= "${GOVERSION}"
 PREFERRED_VERSION_go-crosssdk-${SDK_ARCH} ?= "${GOVERSION}"
diff --git a/meta/recipes-devtools/go/go-binary-native_1.22.4.bb b/meta/recipes-devtools/go/go-native_1.22.4.bb
similarity index 98%
rename from meta/recipes-devtools/go/go-binary-native_1.22.4.bb
rename to meta/recipes-devtools/go/go-native_1.22.4.bb
index 61da51be3a..ee094435a7 100644
--- a/meta/recipes-devtools/go/go-binary-native_1.22.4.bb
+++ b/meta/recipes-devtools/go/go-native_1.22.4.bb
@@ -5,8 +5,6 @@ HOMEPAGE = " http://golang.org/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5d4950ecb7b26d2c5e4e7b4e0dd74707"
 
-PROVIDES = "go-native"
-
 # Checksums available at https://go.dev/dl/
 SRC_URI = "https://dl.google.com/go/go${PV}.${BUILD_GOOS}-${BUILD_GOARCH}.tar.gz;name=go_${BUILD_GOTUPLE}"
 SRC_URI[go_linux_amd64.sha256sum] = "ba79d4526102575196273416239cca418a651e049c2b099f3159db85e7bade7d"
-- 
2.45.2


