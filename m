Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41FF4CFA44E
	for <webhook@archiver.kernel.org>; Thu, 20 Nov 2025 22:36:33 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.142.1763678186715912619
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Nov 2025 14:36:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dNnlRg8E;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4779cb0a33fso13734415e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 20 Nov 2025 14:36:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763678185; x=1764282985; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sQw4wbCtpfz9XZ+VILTBFApYB6mELi61Fq+rEW1nheI=;
        b=dNnlRg8Ez5sTgHXm07C1NAFBEJz8LcKs7ZQE44mMw2qdfC+a+GzlRmwqQGp6xQ8qK7
         Q2bXTBKgUUta+kVlZ4caIPHIgI/EZnXq9oGQURoqe5WAjBOvemnngvQcblZDtojQQ6UR
         4QkX7eqg4qqAOuzf+amVR1aGs8FtXzdQIcCccWD7rLw6iGWB1QIKyZft1/04xQlv8R0z
         Ea+x0sZNqzkPiizeeBb6oh0GcBJ8+5hNc9e6eovKdOTaRJ/8pb2GaL917aIrqeEMDtgM
         rgevXrRLi7+VEIt1LpRtlgSGwvL+F44mQ2mZIxLltFj58PINH5OvS8nq38yVuHqHDAFc
         LXrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763678185; x=1764282985;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sQw4wbCtpfz9XZ+VILTBFApYB6mELi61Fq+rEW1nheI=;
        b=eb0h5VKT6M1wAoKtlboAcLI9zd3oj8kFudq3PKwiWI5R0cAZ+Sz/DMLH0U0fBZi9QS
         ju/dg3JJe01Op7oHI1OyyrgZBP5tvqRRVVQtyWTN4bWEDFYSSO5jlD3ehjS0JEEF+FiH
         xD9TX7FDsWp/ZYFHL1yXIREtUmSc6B/F135BeItWdFbyHhAFRJBqyhVH2CYrtLZjZbYS
         6zIAQcx2alUEuvyfTVzHl28VNwOHTDhLItnp6UR/ZOAaheU8Z/k+1vmKMmUvrwWSHP4c
         VoUmygft3FrX5d5P2N8N+PInLyasHUtdYz6VEk36Bl70DCS2eZ57h8AudSAb855GdhWf
         nN9Q==
X-Gm-Message-State: AOJu0YzmQM9ZjCUIcEVxbbOhmKnewkPzaB5Vfv6IIW3gyP2efItB4TQl
	kSE4P8bQsa7Y/n7PrgJM7WMKxY+anQgAj7s7T9fC/s/E7s+nJnAeDcmGlFuxzQGm
X-Gm-Gg: ASbGnctxueuPZLahwGp3EPCX7/aeJLdv83/qU/vQw2BEzEtVkMhXCD+pPigJOV62gsS
	Ywm7Rpr2yqddOqBfi97tdbZnroAbgaWXiCqvfETR0/7yr5Dq2UORrkSH5w2lBTQaA4owjMB64Oc
	uh91VVRhCrB9Dj5zKJIBRjeKOxE2pTMKXJp2RqbUyHKHu4JsW9zepH/Uyuh9iU/TVYt39wh8ir4
	CzMoGMqcMSFYT3ueLYquRFMDeIK2muvjYB8eBT7cJauwAZHlyR0l0yqNQi23JJIQgzgjW7mTMko
	z5jZIt3eLXJqeMlSIjHEgxhz1Xu0cayxf3gsLqccoJc9yKnaqNQneFAxTqVDmlZ2hYfmW9A3dlq
	2ac/F+WEJfhDKbJu7fLBc9dFmgkmxUKtPIo8WiQ8kp1MBbiStDeUTVqMK1AJsPYatrC5k3hsEM2
	FXf5B9BbpMEJrhjlInSck=
X-Google-Smtp-Source: AGHT+IGYdiZ/iIgOTOnLpqk944R9tm68EnITUCB0thoBa95jUQOc0yvscOGbivNDRtgOXxXnMk+NCQ==
X-Received: by 2002:a05:600c:3595:b0:477:755b:5587 with SMTP id 5b1f17b1804b1-477c0184b34mr2822575e9.8.1763678184823;
        Thu, 20 Nov 2025 14:36:24 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7f363e4sm7611553f8f.12.2025.11.20.14.36.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Nov 2025 14:36:24 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 1/2] bitbake.conf, gcc toolchain: add -fcanon-prefix-map to map-prefixes
Date: Thu, 20 Nov 2025 23:36:22 +0100
Message-ID: <20251120223623.282605-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251120223623.282605-1-skandigraun@gmail.com>
References: <20251120223623.282605-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Nov 2025 22:36:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226639

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

v2: no change

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

