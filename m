Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65E1DC87FCB
	for <webhook@archiver.kernel.org>; Fri,  1 Aug 2025 04:22:55 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web11.80230.1754022170193008412
 for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Jul 2025 21:22:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=eFFooOWq;
 spf=pass (domain: gmail.com, ip: 209.85.210.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-74b52bf417cso820365b3a.0
        for <openembedded-core@lists.openembedded.org>; Thu, 31 Jul 2025 21:22:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754022169; x=1754626969; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cfbgsPTPUGYK5gw8MUTH8BM0Q9NpfP6J0CUv5+5RHoc=;
        b=eFFooOWqWI+ZBqv6HQ5Y8lIZHcaeJMDq8soQV1JQHiySqRqb5F/LB8mPlDjYGKksoA
         8va+KkAPrpkQePR8IgV3xQYD9WhRb3kWCdtedybojOR14VTQdYkbW422BgxuPykvDJAO
         C5N39F9ad5nnErukPeT2WO1p3r+tcUj07l1+WxDf4W9DUZ2tNMjViL+ZUtKfItPOaZq3
         er2IkwPHfBPVJTgxSYfCzGYF8ekgCrFPDMf3tKaih+ITmSd94EF9IJ68NOSNjQhOPFBo
         pK72ELcla+wgqgx7SZWyXUTRyvXs71D8UV+VyKyfztPSxrQp62gS3QgAN4KilAjyOR1V
         OegA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754022169; x=1754626969;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cfbgsPTPUGYK5gw8MUTH8BM0Q9NpfP6J0CUv5+5RHoc=;
        b=SXBq0xrVMZcLBJ637cCdprRA4bpFSr8zbeepdwu36iOlSG6oIUcLCtTAvhgf8GzfYw
         1K5DAjO7CB5UsKuZJy0gnj777Z6EeUIgZ5QqdwsNtQz+gqAwKY1BjGem8t+q8dtV3BcH
         uyAA5iyblixjxk4dbmHa/39JG3XDxPUKBYTNvbA1kAWN5eRYalYLPkg+/AdDK0tH+xKm
         aKPsTeZkcgIaJgDum4sg+6EKM9L8vXcar3/W9kPddpQB+gXuzARH0g9//i/torRmOr34
         8yj4EeF//3mK4ZHoVpcNyamiT6Rs15HGSWqRKBgj8AbRySJH7V1YvrQojewlsLTd+a1b
         6NVw==
X-Gm-Message-State: AOJu0YwgtWQvtdGhJmqCm3xpe7A0W3IYsfUrZ7Yhvds2WpvpmFZniYcC
	88SKjnquxMMzwbP+vS1jV83QZAfu+VhaZyt6UZXAbkh6Dn/oUxSTmnRsVZCy9xCdSsk=
X-Gm-Gg: ASbGncu7oYJjpEXrDqTmk6kvO40EyVpLcoQvzDN06l8gKwXCzReAtn8+g4A4gs7lWy0
	s0WA87Fl9zUubyJflN11w+woL0sbMDJInLOnPEeFFgss2GnGcwV5Ig5XVW3Hn32cDdUiOCE5ATk
	iEWAWeSuBvdrYM5YQDxsXZc+wfQAc4hD9bSyw/80gnEBwZ60P66yf/OqZdlHfUEPwhfl328wr8p
	6AOy8rezXDj6UU4yD4xuxxjEwuknq0OF0wukGrc+Omv7DJX8fJGReT71cT7AiFkKErAPr/CayW3
	wQAIMUD4Ebczoe65dDI8POzsXgOLiCWTrcZPB6dmtYbm6CCSQEhYE6qJ6hmqCTNYkRTDBGk7ZtP
	XihvNna5NHGw2dQ==
X-Google-Smtp-Source: AGHT+IEdrLhCfbXGi54HW+qXgU1kFojOf03mCc+uxce3vG2KfatISHJLmxM6MrogidC9nqdDxnOCxA==
X-Received: by 2002:a05:6a00:2e89:b0:748:e5a0:aa77 with SMTP id d2e1a72fcca58-76bdced5dc7mr2356843b3a.13.1754022169320;
        Thu, 31 Jul 2025 21:22:49 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::a237])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76bccfe9003sm2950780b3a.125.2025.07.31.21.22.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Jul 2025 21:22:48 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 6/7] binutils-cross-canadian: Always use GNU linker
Date: Thu, 31 Jul 2025 21:22:40 -0700
Message-ID: <20250801042242.3076232-6-raj.khem@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250801042242.3076232-1-raj.khem@gmail.com>
References: <20250801042242.3076232-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Aug 2025 04:22:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221218

LLD fails to link gprofng
aarch64-yoesdk-linux-ld.lld: error: version script assignment of 'GLIBC_2.0' to symbol 'dlclose' failed: symbol not defined
aarch64-yoesdk-linux-ld.lld: error: version script assignment of 'GLIBC_2.0' to symbol 'dlopen' failed: symbol not defined
aarch64-yoesdk-linux-ld.lld: error: version script assignment of 'GLIBC_2.0' to symbol 'fclose' failed: symbol not defined
aarch64-yoesdk-linux-ld.lld: error: version script assignment of 'GLIBC_2.0' to symbol 'fdopen' failed: symbol not defined
aarch64-yoesdk-linux-ld.lld: error: version script assignment of 'GLIBC_2.0' to symbol 'fgetpos' failed: symbol not defined
aarch64-yoesdk-linux-ld.lld: error: version script assignment of 'GLIBC_2.0' to symbol 'fopen' failed: symbol not defined
aarch64-yoesdk-linux-ld.lld: error: version script assignment of 'GLIBC_2.0' to symbol 'fsetpos' failed: symbol not defined

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/binutils/binutils-cross-canadian.inc | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-devtools/binutils/binutils-cross-canadian.inc b/meta/recipes-devtools/binutils/binutils-cross-canadian.inc
index c1fda1a4658..7d7ffe92ce1 100644
--- a/meta/recipes-devtools/binutils/binutils-cross-canadian.inc
+++ b/meta/recipes-devtools/binutils/binutils-cross-canadian.inc
@@ -13,6 +13,11 @@ EXTRA_OECONF += "--with-sysroot=${SDKPATH}/sysroots/${TUNE_PKGARCH}${TARGET_VEND
 # e.g. we switch between different machines with different tunes.
 EXTRA_OECONF[vardepsexclude] = "TUNE_PKGARCH"
 
+# lld complains
+# aarch64-yoesdk-linux-ld.lld: error: version script assignment of 'GLIBC_2.0' to symbol 'dlclose' failed: symbol not defined
+
+LDFLAGS:append:toolchain-clang = " -fuse-ld=bfd"
+
 do_install () {
 	autotools_do_install
 

