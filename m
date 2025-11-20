Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B78DACF884F
	for <webhook@archiver.kernel.org>; Thu, 20 Nov 2025 12:19:55 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.32976.1763641190608901511
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Nov 2025 04:19:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cACRawq7;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-477563e28a3so5658555e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 20 Nov 2025 04:19:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763641189; x=1764245989; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xq5VExmpHxrU8dRcA7QH4P1Mk9j0wjUz1OcDFkzaN/M=;
        b=cACRawq794URe7i7oc5uVR+8daeYaj69G84NsExuDt1h1BNlDrNyNXKob6a3Nmbrtk
         60N5HlC2duVJh550Nv/Zb2lA7udwws2r3Lo1MPVygenlKQW4MoPqdw2v3t64ySvC5x7y
         d6zOAuVfCIwT9s9xIsT0bc1FlAyAOhFXDOT13Ibymkxzs09yxdbQXTGanZpLZZWocrvH
         2SjJC1dZROekwMZltJHLrO0DAdTFr08LzCSRiSf9WzlajncRZy2fjEYqCpEJFm84mac+
         BZUuf5ogN76gHD7wPxsdnM3MikVkXcvvorYKlWcVddD0qrc6aYbyF5Ht2iPiV3OMAhRJ
         XkAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763641189; x=1764245989;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Xq5VExmpHxrU8dRcA7QH4P1Mk9j0wjUz1OcDFkzaN/M=;
        b=X9QWv8eIw9HZeCc9ba/ITB/qxp+wGYDo8lkku7PcYky1xl6mjLuWEXrg6KZgVmfcMw
         QBTDKLg8OKKz7p9ItSZoO+SE5MnH8KgXc+rwf4SZ0HzcCbrGKGDCtS2QoduzY0PmbrE6
         +3YeR1xd73ighXt/viuNMBkYwPfAa7+dYFCTI4i/QyRkRC20bf0F/WXp0cNhOoL4+wd2
         GWj95qeI2pNfcpK5iWJAypjcA/UvMNyuo9e09MEXDcZvyO0ThlCF3T09HObP/ODdGdEF
         WC5lL0tE+44qECCcg/PDrQkPkRD5Cw0nj3VjN+ApveUUhw/IlAEApwJMp421HfCsbVdg
         Ad7w==
X-Gm-Message-State: AOJu0Yx3/RxmE9a0vMDVBhZoDWys32462PiifbYipiTMjE501Zp1lAmO
	fmW+znS+f/vQnmLPRbJ9/gBtor8Xm3BSekSQqcFKlW3wxhLjGyGgaTGOiOXvJV7Z
X-Gm-Gg: ASbGncvtXo0xAB9PtH7xH+3fgnH5NtoPM2HvvXZZtC2envh6eYgC9XCFCnVqkE9kg7A
	L0W+6KaFvMkrp/4FNFAnDBF+P/KDuj92zc3n3GBqXLsivMkugBkrqUb2OKVThLZ/FcNaFr70JGn
	34Gc3UOIN1NSZGRejXnxQqwJ/ihH7SAE9gAfZuahKrTmZdD/mC4jIIic6Qfg0dn+v3WFF5KVbn3
	vy8wv06GA1txD/RUeWnsEKzMRS+t5pt+BR4VOZbQnbMsOBOCOKg+KdAs1F2qB93FBb2bQ0rSqxX
	co1DFhMCCy4g5YNbLuGKClEVN8HI6N7/XdPlBImubalAlNkObmUyYtjOI4bXxB2SgENvb7kQbt/
	KgdcSs6awQIeMkSu4nC0TefhyA1C/Vih6giI0rqv8Ic7XiIvR/iWJEQEQ3EFxTli9zJFTexOO+C
	hI+8dUkfnS
X-Google-Smtp-Source: AGHT+IGhQOehlrN0A2O8BRZFpmFUdpVyhYf112HUP8rIu0Q+VGwn4Z9J3D+4laGICc7dI9TSnlCYVQ==
X-Received: by 2002:a05:600c:1516:b0:477:14ba:28da with SMTP id 5b1f17b1804b1-477b9ea8f78mr14377405e9.5.1763641188896;
        Thu, 20 Nov 2025 04:19:48 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477b0ffe377sm103812435e9.1.2025.11.20.04.19.48
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Nov 2025 04:19:48 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] bitbake.conf, gcc toolchain: add -fcanon-prefix-map to map-prefixes
Date: Thu, 20 Nov 2025 13:19:46 +0100
Message-ID: <20251120121947.3473848-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251120121947.3473848-1-skandigraun@gmail.com>
References: <20251120121947.3473848-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Nov 2025 12:19:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226618

This patch adds -fcanon-prefix-map to the list of compile file-prefixes
list in case at least gcc 13 is used (it's a gcc-only flag).

This flag used to be part of this list in the past, but was removed with [1].

Since then the source file paths are not canonicalized, which makes
the system to miss some (and sometimes all) source files to include
in the corresponding -src packages. As an example sqlite3 and audiofile
(from meta-oe) produces empty src packages, mostly due to the pathes:
they frequently use relative paths that don't match up with the
absolute path specified in the file-preifx map:
`pwd`/../../foo.cpp and ${S}/foo.cpp might refer to the same file, but
the first one won't match the prefix-map, so it is omitted.

This patch adds this option again with gcc: for class-target it is uses
always, and for class-native it is used when the host gcc is at least
version 13.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta/classes/toolchain/gcc-native.bbclass | 3 +++
 meta/classes/toolchain/gcc.bbclass        | 2 ++
 meta/conf/bitbake.conf                    | 2 +-
 3 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta/classes/toolchain/gcc-native.bbclass b/meta/classes/toolchain/gcc-native.bbclass
index a708bd0389..8708ad0211 100644
--- a/meta/classes/toolchain/gcc-native.bbclass
+++ b/meta/classes/toolchain/gcc-native.bbclass
@@ -13,3 +13,6 @@ BUILD_OBJDUMP = "${BUILD_PREFIX}objdump"
 BUILD_NM = "${BUILD_PREFIX}nm"
 BUILD_READELF = "${BUILD_PREFIX}readelf"
 
+# gcc started to support -fcanon-prefix-map from version 13
+DEBUG_PREFIX_MAP_EXTRA:class-native = \
+    "${@'-fcanon-prefix-map' if bb.utils.vercmp_string_op(oe.utils.get_host_gcc_version(d), '13.0.0', '>=') else ''}"
diff --git a/meta/classes/toolchain/gcc.bbclass b/meta/classes/toolchain/gcc.bbclass
index a5adb5ca37..0ed49ba892 100644
--- a/meta/classes/toolchain/gcc.bbclass
+++ b/meta/classes/toolchain/gcc.bbclass
@@ -30,4 +30,6 @@ PREFERRED_PROVIDER_virtual/nativesdk-cross-cc:class-cross-canadian = "gcc-crosss
 PREFERRED_PROVIDER_virtual/nativesdk-cross-c++:class-cross-canadian = "gcc-crosssdk-${SDK_SYS}"
 PREFERRED_PROVIDER_virtual/nativesdk-compilerlibs:class-cross-canadian = "nativesdk-gcc-runtime"
 
+DEBUG_PREFIX_MAP_EXTRA = "-fcanon-prefix-map"
+
 TCOVERRIDE = "toolchain-gcc"
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 5406e542db..600d4baffb 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -650,7 +650,7 @@ EXTRA_OEMAKE:prepend:task-install = "${PARALLEL_MAKEINST} "
 ##################################################################
 TARGET_DBGSRC_DIR ?= "/usr/src/debug/${PN}/${PV}"
 # Beware: applied last to first
-DEBUG_PREFIX_MAP ?= "\
+DEBUG_PREFIX_MAP ?= "${DEBUG_PREFIX_MAP_EXTRA} \
  -ffile-prefix-map=${S}=${TARGET_DBGSRC_DIR} \
  -ffile-prefix-map=${B}=${TARGET_DBGSRC_DIR} \
  -ffile-prefix-map=${STAGING_DIR_HOST}= \

