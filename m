Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72B14CCF9E5
	for <webhook@archiver.kernel.org>; Mon, 27 Oct 2025 23:39:35 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web10.5764.1761608375085340685
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Oct 2025 16:39:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XZ/qAPt/;
 spf=pass (domain: gmail.com, ip: 209.85.210.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-78af743c232so4836211b3a.1
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Oct 2025 16:39:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761608374; x=1762213174; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/+V8W1kSVX6Mk6lgsYBJxQw5PY9WTk/e9sCP3Q+KSpU=;
        b=XZ/qAPt/b8817xRhE7V4zNd5HgtdSmjLrjR7kHpsdcqEE9w1hGSVHrFjtHb+4Jy7JR
         NFpLBhkWelwucDOjurrxJHDqisrhCtn+S//8ExSO6s9UZg45BuDI/sBh7elXkmp+HGU3
         6dN9deTTxaHad998y41cuoBloclwiwESAR8lpDwrX5V1CxbEGF7TBloWMzXSDO4dSABI
         Ejl2CvCkLKTRarhqG6NVP7iU+pc4cqRrBMMa57TXKajeXNZCA0wGRj+z8gKAwKul5559
         0mjFm4byNanxpdq5bs9fPIEllGihHHZUjkPxgmpG/x6M/10kCU+CfWOJzREh21PjOpAa
         0L6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761608374; x=1762213174;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/+V8W1kSVX6Mk6lgsYBJxQw5PY9WTk/e9sCP3Q+KSpU=;
        b=Ta9AyCHiEzrlm3QxFrp1HZebsCebqULVvAGH+jIMmZguQwLGssgdUIwEppmMoZxoGy
         MphTkd/+aegpXmeKU6ZLkpg5XUXeZhJsNB2IgFSXUrolextwcAuU5Nxf9bu5yyYSzE1A
         MNbbV/TdhFpz52f7q+l5bhH9FAH3kJ+JYFwjDwCul38q6FIO5Z3c4ZeIA52vnIjB0yhH
         hW4sHfUVnpAvMC8e7YyvBkgaQh9+fB4pNyMyn3Vtj7zFIA17OlWCLsp5RLntzrJIfBhq
         WGodeq8i89kMfLw9izQU1EIKXNoNwGHi5oTzdo8QXVwQMmJjxCPmEDvBiIjY7007k/BU
         PkMA==
X-Gm-Message-State: AOJu0Yzqn1hiVnwg5ZtMTl+OdgkCJ76OHM/RfXVNxHHVxmkffry6IRNz
	yFcL0kgMy4Pqsh2lfR1Qj4meptWZ+1k1Fb6GAeidpHVCiyhrgtS6WwTL6Ze5lV/M
X-Gm-Gg: ASbGnctbGYL+f63YV0HFcwfhMS/cXIBvF3SMn5c9+4Ty265+5vvfiK0Nr4Jzfq3iX2U
	5R1PqEMYvTlZ4sz/aw7y684IRiejINa7+GaN8hCS/nzUlPL5Ij7FlxYqPbwmK55tkKNmDl5nHrS
	ATeFGafcbtz+PY5y/O3XJFmVohMAod5omuhmMNj8nBPOQVh6WFIA8nZbgd2WEM4I+UxushzIfnH
	sO7d8EMu5ABwa2Agt0ixmg08x4Qa/LnhaKC65wamyotMKJsvmwZN+FIzLHVxOOGqkZbGXvJfJRA
	9Fg609kERLmnSRfYF/BUPfAcNW7cI7dLSg+VHTMaOGBpVkgqe4pOR/9eZtOee64QHYbppz+3KEu
	ohDLEon/wX3VetWea+fZJnTQBKVdaudHcYOE6LLe8TOOt/8Zfe4mAz6N4poa2KK5g6tXN4KwWwO
	pg8CYzl9d21A4nYhpms5G4qhvz63cJPQlr/mQW6ewPfLbvYtU3B88efLY78B37hg==
X-Google-Smtp-Source: AGHT+IHzkKXZj8BPoZNfRnEe+YFqJdI07W+57IiIzc/pULvzJdkgAbBGh93A8vSz4M0xNnmWpBliWg==
X-Received: by 2002:a17:902:d4d2:b0:267:87be:505e with SMTP id d9443c01a7336-294cb3d8384mr17273475ad.23.1761608374050;
        Mon, 27 Oct 2025 16:39:34 -0700 (PDT)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::9dbe])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498e4349fsm93983645ad.107.2025.10.27.16.39.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 16:39:32 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 2/2] binutils-cross-canadian: Do not install bdf-plugins
Date: Mon, 27 Oct 2025 16:39:29 -0700
Message-ID: <20251027233929.2454193-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251027233929.2454193-1-raj.khem@gmail.com>
References: <20251027233929.2454193-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Oct 2025 23:39:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225371

for SDK they are provided via nativesdk-binutils
latest binutils have started to build libdep plugin
as static library libdep.a which is then reported via build QA

ERROR: QA Issue: non -staticdev package contains static .a library: binutils-cross-canadian-aarch64 path '/usr/local/oe-sdk-hardcoded-buildpath/sysroots/x86_64-oesdk-linux/usr/lib/aarch64-oe-linux/bfd-plugins/libdep.a' [staticdev]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/binutils/binutils-cross-canadian.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/binutils/binutils-cross-canadian.inc b/meta/recipes-devtools/binutils/binutils-cross-canadian.inc
index 7d7ffe92ce1..d28dcaf4022 100644
--- a/meta/recipes-devtools/binutils/binutils-cross-canadian.inc
+++ b/meta/recipes-devtools/binutils/binutils-cross-canadian.inc
@@ -21,9 +21,10 @@ LDFLAGS:append:toolchain-clang = " -fuse-ld=bfd"
 do_install () {
 	autotools_do_install
 
-	# We're not interested in the libs or headers, these would come from the 
+	# We're not interested in the plugins, libs, or headers, these would come from the
 	# nativesdk or target version of the binutils recipe
 	rm -rf ${D}${prefix}/${TARGET_SYS}
+	rm -rf ${D}${libdir}/bfd-plugins
 	rm -f ${D}${libdir}/libbfd*
 	rm -f ${D}${libdir}/libiberty*
 	rm -f ${D}${libdir}/libopcodes*

