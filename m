Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AF9FC87FCB
	for <webhook@archiver.kernel.org>; Thu,  7 Aug 2025 00:44:36 +0000 (UTC)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.web11.40242.1754527470836634794
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Aug 2025 17:44:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BvA4zKnp;
 spf=pass (domain: gmail.com, ip: 209.85.215.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-b427094abdeso345572a12.3
        for <openembedded-core@lists.openembedded.org>; Wed, 06 Aug 2025 17:44:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754527469; x=1755132269; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=02Z51idZ0lEbKJ0lTDDkG0h81ZgNc04LBvaSxQZHWMg=;
        b=BvA4zKnpXA8LFRxfhOpFck73uMKUdfVmy6X/88SqH5r1hdDJXbxEg+Qweq9b4B+Ldj
         7gR90GgDWYsMor5RvIcbjM8Z4qc02IR2tUg/og0p81ddH+LDepgtjN1kJCtW2dFdKXpS
         V3XqqYpy2onlx8JNJeFA/NyuxOMdzYmGW2OpdYIUbT1vV7M0ks75hNf6UtlvjEtCAkjB
         S4ogiTrLogx4Xeir2gDHfWH/cX2bjCdwRxhcgc8St6hJX68OXCwo3ok3OIbvCiO9zeN0
         GO7ts2A/XZyG6HuedZas9m2rU2pbaf83Aw1YE4ykIwhbneO4FE1BMDXyv2O1kFKwwNcC
         oVaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754527469; x=1755132269;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=02Z51idZ0lEbKJ0lTDDkG0h81ZgNc04LBvaSxQZHWMg=;
        b=fW8aa+feg+OfHO+Kev+WMM9j0FlrTNheU9QxBF/wHVH0SCZNmpa0+1ucYpaYQ/yhFP
         Cx7pWje+X0Ty8dwK0vVPNXdHsJ3A8z4i/7PBQzGdeBTANn4kIVKrAogzu3A98uxYIluK
         hA5+w8AvDltQQ3wVyMd2zE7DLEYoGBSHubaDgXJy026r6CgpLXT5jwo3bN6xwxfmDKZB
         zaWgJ2l/N001m561o0cDvBbmsJgcnVXNMHppHDqve1YQfmWaT1WVRTjyzLioGmEkb0jS
         MYefBtV/8bhiI+kQ+UKzNSguZRKuA6NU81SC5Y/6Y/qqzVTwJDs1wvtKfI8ZTmN4+KDe
         I0CQ==
X-Gm-Message-State: AOJu0YzzJuMR8vtRVCTcc2J6mT1hVNTv7QmaGNW8lV0/lPmPlLsG8GWE
	jY+DxiAxWR22SIC2zaGAH/Ywh9P3oI+i/VI0ktACavZ6wAknGwJbuyIhWiWjShkPKOg=
X-Gm-Gg: ASbGncswj70he0VmnPQgihDIhyequRX5tChB1bRLJ7sLr9CDy5UeLY0a++c84vwmH2Q
	iSgAro/toEF+xZkTTtPBIIxBr18J9072UMfl3yjauu71k3mUfoo32Rcic6fOYsxB0WjU5i8mncj
	OgX4FC1le60qYkXIMxIiqI104iWpDt/2/4mAEJykfXF9EanhjuIaYtKuZ7P8cT2BW0x9iTLeuRl
	hq51wB4f3i5XuGpOV/DfhlYuEGaSPEYJ2NYzk8L2s7JLqs6tOpKUm78g9ZIISwvL0OkjyL2bUKX
	CYvwTgXOrMpOPwHQCcvlawroggRMZUOjJmsWM47B5SmF+tmqSBH93DL5Zt3+nmSF7KS4Zshs52T
	rc7V8SRK9ovqTKuC+KBE1hQ==
X-Google-Smtp-Source: AGHT+IGubRC8xZAKOj0xjtvEQFjaykTvZ8XFBdpE7e6Qmfapt6ruBCqQ118k0GAADDsHI2MVKTbLIg==
X-Received: by 2002:a17:903:4b24:b0:240:900b:7550 with SMTP id d9443c01a7336-2429f2f6a15mr55314715ad.5.1754527469304;
        Wed, 06 Aug 2025 17:44:29 -0700 (PDT)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::ccc5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241e899a909sm167910355ad.123.2025.08.06.17.44.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Aug 2025 17:44:28 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Ross Burton <ross.burton@arm.com>
Subject: [PATCH 2/2] clang-cross: Create <cross>-clang binary copy instead of symlink
Date: Wed,  6 Aug 2025 17:44:25 -0700
Message-ID: <20250807004425.1768854-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250807004425.1768854-1-raj.khem@gmail.com>
References: <20250807004425.1768854-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Aug 2025 00:44:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221553

With clang cleanup in [1] we ended up removing this logic, which
is still required.

This ensures that search path for subsequent tools e.g. linker
assembler are searched in the same dir where <cross>-clang is
installed. If its a symlink to ../clang then the reference
installation dir is ../ and all cross-tools are not there
so clang will fail to find assembler/linker from cross staging
area and use /usr/bin/ld or /usr/bin/as  which we do not want

[1] https://git.openembedded.org/openembedded-core/commit/meta/recipes-devtools/clang/clang-cross_git.bb?id=5d96ed55acf7b9a908241222097ad809355de7cf

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/clang/clang-cross_git.bb | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/clang/clang-cross_git.bb b/meta/recipes-devtools/clang/clang-cross_git.bb
index 33b01e42349..2ec15dd1dfc 100644
--- a/meta/recipes-devtools/clang/clang-cross_git.bb
+++ b/meta/recipes-devtools/clang/clang-cross_git.bb
@@ -15,7 +15,7 @@ DEPENDS = "clang-native virtual/cross-binutils ${@bb.utils.contains('DISTRO_FEAT
 
 do_install() {
 	install -d ${D}${bindir}
-	for tool in clang clang++ clang-tidy lld ld.lld llvm-profdata \
+	for tool in clang-tidy lld ld.lld llvm-profdata \
             llvm-nm llvm-ar llvm-as llvm-ranlib llvm-strip llvm-objcopy llvm-objdump llvm-readelf \
             llvm-addr2line llvm-dwp llvm-size llvm-strings llvm-cov
 	do
@@ -23,4 +23,10 @@ do_install() {
 			ln -sf ../$tool ${D}${bindir}/${TARGET_PREFIX}$tool
 		fi
 	done
+	# GNU Linker and assembler is needed in same directory as clang binaries else
+	# it will fallback to host linker which is not desired
+	install -m 0755 ${STAGING_BINDIR_NATIVE}/clang ${D}${bindir}/${TARGET_PREFIX}clang
+	ln -sf ${TARGET_PREFIX}clang ${D}${bindir}/${TARGET_PREFIX}clang++
 }
+# clang driver being copied above is already stripped
+INHIBIT_SYSROOT_STRIP = "1"

