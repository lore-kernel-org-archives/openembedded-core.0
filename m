Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F3B4C369DC
	for <webhook@archiver.kernel.org>; Tue, 29 Apr 2025 09:27:06 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web10.14719.1745918824613765651
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Apr 2025 02:27:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IYQx8xvQ;
 spf=pass (domain: gmail.com, ip: 209.85.210.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-736bfa487c3so4725747b3a.1
        for <openembedded-core@lists.openembedded.org>; Tue, 29 Apr 2025 02:27:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745918824; x=1746523624; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6NMJ+nmNxjcverAxvmorW7puvWdJH9CFfIlSGVD7DI4=;
        b=IYQx8xvQiQhu7XevCAHeVej0A079wDgXVOQnzyvMk3Vg4NW4bFCZgNXC/l4m0cDDgl
         lQ9EYt2FPb6gSTO8gmJ1rUQmb+/D5NVG/qaQuD/Y/Km+nY7arMSuq9J3pgD2s6kokwYS
         wN/NN2djgb0kytlCEBrBoKh4XuY/3HCvue1k1UV1LegMe5k0B/ZrjayrZs833azHfzwZ
         z4gZeJQ4e65QFanYuXOsLy+qTUZWE9960F1HqHVQxomElXAg9EvrFNg9MuvhVbW5As5w
         W3KYmy+XTSMprL7dKZ8sncjAsjbnkG0IoNwlwTmphfc6u7Ae0OZ6sZ9GPkU1xSPR4zxD
         xs9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745918824; x=1746523624;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6NMJ+nmNxjcverAxvmorW7puvWdJH9CFfIlSGVD7DI4=;
        b=bFwdQ5NlD3rad7Np1xGmxSe0JepqC1sPrwG/Pc5XlbQ0VgQ5Sz7eumLuXQFM+0dgd7
         aSFTSB8WrppZUB5eqEcjlDCO2PaGHrNnGLDRjzgWw1nZXZDjWx+F3lMhs60FxTzJVslN
         sqPesYo8hR3oSDREzlJbtSGme6oGANDpp7gyj8ufmtVfThsdGbMYiPA2LqhwX0GkoMbt
         KlCfzu/6A7uCHgdJOu2fjKVrzMLBWdlGh0zuAqPT5ghCDoZeHuq5KUTSYOCXDBsp1NNK
         tPBA+dl4WzdMiY7TDJMsLzdW2LwQNFDOrehzWMSFKOQwC3SjU/4Ol0+LAHbssbZAno/w
         WkOA==
X-Gm-Message-State: AOJu0YwIFyzhcuazE8TDNhU4mXFTskg+TdcsfjLp0F+xpxkpYR5Lu5ux
	cJzqDvYsV6I7XDc1CG7D45541D4Wy/B6duooc9UxyLvMKXdV/P+SLsfl8AKv
X-Gm-Gg: ASbGncuye9mlOOUSLp8loLNAWpWNGS3f5EPpTVzuufaRe2ZCcQfgOYuMyfPHY3p0cDt
	RsgLkxTG/qOX26xwmdtIrCiuqrWebaAZclzdyW9Qfc5j83PeYXT6aStuDLFMxu+P9nOTUcNLrAw
	VYwhrhAPgYc58CwVsKDtIWxy/T+vXc8ItwPyb/fJdUdARr/oPZqV8CAnv0u2uJui7m7Z6rWGQoP
	oZ4pffrbHnZWYj9GqvBinurkb0z+7ikuariGY0paOranniAWynA1SHzuKLILubNp9QlNPDNM8Hr
	YQREwQmRyBX7lIBC0YXhVU8QLnBM0/g1
X-Google-Smtp-Source: AGHT+IEN8vVfYF9Zm5Tvd/zMiAHEh5lpxz03e0sjw2hhnTdQTIB0tWYPzWfYmeI4fDvRbUCjJY7vBw==
X-Received: by 2002:a05:6a21:3296:b0:204:695f:47e1 with SMTP id adf61e73a8af0-2046a58d91cmr16771792637.23.1745918823748;
        Tue, 29 Apr 2025 02:27:03 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::ceb8])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b15faee2d59sm8541877a12.70.2025.04.29.02.27.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 02:27:03 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] binutils: Specify sysroot for libtool during build
Date: Tue, 29 Apr 2025 02:27:01 -0700
Message-ID: <20250429092701.3426123-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Apr 2025 09:27:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215654

libbfd is enabled and it invokes libtool relink step to get rid of
rpaths during install step. libtool 2.4 patches rightly prepend
lt_sysroot to target libdir which relink step would use, such a patch
is also upstreamed into libtool [1]

However, when we do not specify --with-libtool-sysroot, lt_sysoot prefix
turns out to be empty and relink step adds -L/usr/lib to linker command
line. it cause all sort of problems e.g. when the build host has zlib
installed then libbfd tries to link with /usr/lib/libz.so instead of the
one in target sysroot, fortunately OE linker reports host path contamination
and fails the build. Second problem seen when building target binutils on
musl, it links with libc.so correctly but libtool relink step resolves
libc.so in /usr/lib due to this path and expands it into libc.so.6 and
ld-linux-x86-64.so.2 ( glibc host's libc.so is a linker stub ) in
DT_NEEDED ELF section which does not work with
musl linker and build QA detects this anamoly as well.

ERROR: binutils-2.44-r0 do_package_qa: QA Issue: /usr/lib/libbfd-2.44.so contained in package libbfd requires libc.so.6(GLIBC_2.34)(64bit), but no providers found in RDEPENDS:libbfd? [file-rdeps]

This inconsistency may cause produced binaries mistakenly linked against
libraries from the host distro.

Add libtool sysroot to point libtool to correct sysroot location during
build.

[1] https://git.savannah.gnu.org/cgit/libtool.git/commit/?id=3221f9f0fb98d5740ab5d0e8db6a731302520644

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/binutils/binutils_2.44.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/binutils/binutils_2.44.bb b/meta/recipes-devtools/binutils/binutils_2.44.bb
index 99b5ce178de..79bcac20254 100644
--- a/meta/recipes-devtools/binutils/binutils_2.44.bb
+++ b/meta/recipes-devtools/binutils/binutils_2.44.bb
@@ -5,6 +5,7 @@ require binutils-${PV}.inc
 DEPENDS += "zlib perl-native"
 
 EXTRA_OECONF += "--with-sysroot=/ \
+                --with-libtool-sysroot=${STAGING_DIR_HOST} \
                 --enable-install-libbfd \
                 --enable-install-libiberty \
                 --enable-shared \

