Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A6ACCA0FED
	for <webhook@archiver.kernel.org>; Wed, 27 Aug 2025 21:30:29 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web11.6640.1756330225064447071
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Aug 2025 14:30:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=r6+wFs+Q;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.180, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2489c65330aso3012245ad.0
        for <openembedded-core@lists.openembedded.org>; Wed, 27 Aug 2025 14:30:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1756330224; x=1756935024; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6cS0ee6vh2c0kvJQyu+xaQ2FzSyOrgvNdCiwlEJngk4=;
        b=r6+wFs+QQtOwAbWq18Wf8ZYx4cGrw32S4GSCyFQK2v+Uqa4UKu1/5ytmrPGgXvs83d
         eKBq1ioYRxVGhsnsKyAfKuUcrzHJA1/EK/sqqNGXNvWKTtlsM8D+8nyiM3a3tJ+/02wc
         y/RzpeAkF3EEUAJtVmXab5MpqtDwEo+QQj6H+HkmF9T8RnBgI5f7gjAbCTZ3VUKNn93H
         8AQEQhj9AYfr9gUNGi3fIAdmXjUT1suTP+FRroxI0dBjrGfNFEU+BDiYffhRt1ksXEhd
         sW4Uiy/eAiZPhJ0z61nHCsqwurRdwsL6I2P4/hnhkUHBCHBo34FNWGi7JZJLCISdsppD
         I8VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756330224; x=1756935024;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6cS0ee6vh2c0kvJQyu+xaQ2FzSyOrgvNdCiwlEJngk4=;
        b=Al8tkHZbdcF2C9/LSV4+DAX4Y0MEKzqkaOcSSXzFcfVpIO/goOnAdO+cPMvcYezfyx
         CwShysPr1Wr4ju64Ke7uqYGtzI6iese/PX1Gnwjz77mIWRZk5xJhD0ADa7dad7OnCuiw
         oprJ6TlkkcAZ3Wjc6pBzL8g7uLngd3rI1X9Yko2ZXs5MYrssISlCNAt6uzN5zGbFXi+1
         lJi0hys+G50u5WFx+RenU07Yo/2KFAdCDbpAh0Fz9CDXoKMP+jE5Ucq2kqYb9gvl2W6g
         /vtJo/0YiSgqVrXnaD7cjeOgEyiTIpHjbmOwFb0MX+o3bAb68UK3dzmy70SwjYkkOkq3
         7NUw==
X-Gm-Message-State: AOJu0Yz7FYF9IXlq0lMCRS+/srpiiN3Lps/KFNNvThDzyrxrCIVQpqFO
	iD95wNZqfM0RUZSTJ0OJhHuW05NNNMD3VLYbmTSDgnTOyOTFciWw4EF1BTSW+4/Lz/Ic+McHfko
	/2q88
X-Gm-Gg: ASbGncvYw99/HwCxmU4iVkdkm4Q6tSiHTpp4OdsxkDllXJghH7cqR/eihnNoHCLjAL1
	hQ+zpiAD1pNXqonpmS5WVqHhC9n7zZaDL7QCHSwkej+NjJ2X6ADipZ/PxwiuHaPPzWJzefT/O98
	9okaDly2NClSlO5pwy2OyDSjBV3DNXTNsPSjClt5F7RFc3LiX6k8AxG6eJKDBu8sQOXhTg459/z
	ozMujREV6RfqgDAIxtrd3pfRiqBjwaDsLkZB6VIMrLefTWIsLOGhts8CYB6kHdUSN4h+B38AkHP
	4r5auEykKAxOhPFfEs739oROXTIreOVeHxbQSyaXVlRIPj/azq+gyGKcFktNfXAbO17lSmTspGC
	hlaqZWAhvtAUiWQ==
X-Google-Smtp-Source: AGHT+IGE4pQ22g2HnpVkuxZBdQgmaF73IshkZN3KjCL59PMq1N208fTkDfk/RLIaj8l1QD9Ottm1lQ==
X-Received: by 2002:a17:903:11c5:b0:23f:f96f:9de7 with SMTP id d9443c01a7336-2462ef1f266mr225976105ad.51.1756330223872;
        Wed, 27 Aug 2025 14:30:23 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:d0c9:1052:20fd:8423])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3276fce1f30sm2905857a91.23.2025.08.27.14.30.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Aug 2025 14:30:23 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 17/33] m4: Stick to C17 standard
Date: Wed, 27 Aug 2025 14:29:24 -0700
Message-ID: <94ec72b332dce71a2756560ddf738f864e3c853d.1756329972.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1756329972.git.steve@sakoman.com>
References: <cover.1756329972.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Aug 2025 21:30:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222525

From: Khem Raj <raj.khem@gmail.com>

GCC15 imposes C23 by default and 1.4.19 release has gnulib version which
can not be compiled without errors, while new release of m4 is in progress
we might use C17 until then and use GCC15 to compile it

For scarthgap also add it in BUILD_CFLAGS.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/m4/m4-1.4.19.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/m4/m4-1.4.19.inc b/meta/recipes-devtools/m4/m4-1.4.19.inc
index fcc9e58270..4b1f847664 100644
--- a/meta/recipes-devtools/m4/m4-1.4.19.inc
+++ b/meta/recipes-devtools/m4/m4-1.4.19.inc
@@ -30,6 +30,9 @@ EXTRA_OECONF += "--without-libsigsegv-prefix"
 
 EXTRA_OEMAKE += "'infodir=${infodir}'"
 
+CFLAGS += "-std=gnu17"
+BUILD_CFLAGS += "-std=gnu17"
+
 do_compile_ptest() {
 	cd ${B}/tests
 	sed -i '/^buildtest-TESTS: /c buildtest-TESTS: $(TESTS) $(check_LIBRARIES) $(check_PROGRAMS)' Makefile
-- 
2.43.0


