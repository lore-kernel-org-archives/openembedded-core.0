Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C950C3600C
	for <webhook@archiver.kernel.org>; Fri,  4 Apr 2025 02:09:59 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web11.2299.1743732591208940192
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Apr 2025 19:09:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NVshyZWB;
 spf=pass (domain: gmail.com, ip: 209.85.210.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-7369ce5d323so1307383b3a.1
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Apr 2025 19:09:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743732590; x=1744337390; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gj8iQBXNnpNr9DrkyBG8w+ZWAC3/oJRJ7aPponceaO8=;
        b=NVshyZWBQQloRmpqy/60GzvuoHEMnjL82lLqKUEr4s008A8owolgPr+qxPPhGrHdhT
         X9nCsCXFegNtK5qIWHlsjTxmPejbBUyVO8ZTl4+0RLWSe5IYT1/+0eRHu2gtQlN2F9By
         oHrXbes1Au1lpCeipvR0c1/PpMG/AmpygkCRTdThXvR1EVCJYh7IkWyoWI1UWO1VEl1T
         O6jGbzRo4A/IcdbJuZXKcIN14wY4GWij44sSSKzW739Ig0vKNUA2NGTCdR8omLd24U4D
         5qe2OQxCMIDKJVhaMJH4yQkC+1aXhamjRfK1mUf/FdQSKbPtAQARnxATdQ9NG9sVublF
         nhFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743732590; x=1744337390;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gj8iQBXNnpNr9DrkyBG8w+ZWAC3/oJRJ7aPponceaO8=;
        b=CSOgXUfWjiocMHtoqKm113LNuTakyAZ0QoG7tzH8G481mUloLQog8/zKcfqhSgUShD
         rkzgtZ6EKQSfByPz5J/7EsOaR9+F6ZSvDKLqoMD5yX89ReiQh4Qx+CHNn3BG1eNcZzio
         fyNmFxLImQ+TU1g8faIO0Igq9cOv784LtCf8d9wbYoS0ZHEobT9wY3tu0Jafd5WjMSKA
         OaLxHGdBrMQjP40F/x9Tpl9EFv5SjaTdyGm7/0wH5S2hhQ+nKGRGExVvQgz4XcsRATTm
         x/1s0HvsxWewFCU5qSE8TU5+ZNbrk8V3OZiOwFyV+z/EGkEF90ID9j5DFUA/mA8apUa2
         /vbQ==
X-Gm-Message-State: AOJu0Yx+QhNyZzC+daRgv9a1osiKB167i+9EIW0oEDSc+SNjmyJTvYdV
	uDRdDJ1ynJZppbOXpMSz8iZMA1B2x+Iwf+Q374uOjzsLLl9xIpZbpiZc4Uph
X-Gm-Gg: ASbGncvtlFyIZ4cwEWrT2r2hMWQO3mkyxSY2nP3lmqZAMdKiUfC4UpNGhKIwnRxK3BZ
	9r7/14NPAN+oHdnSOekv44L5n/99VaJdhRdojMHmqnrUUKbeztcPa1IsKlVA4TA5KEZrbDikkXy
	HUVzZJSzkFxPBTr1i7ieODZbxzcLWrp/p+zzyJAq21RUL3lfZ3bVvcnUtF+SlPKfOyXa+D8R1Ba
	nwOwE4DvXY9cl3+krhRGSYD5bm7/Ygcudkbypv626cjT2wIpEE+2Yie4r1CMdti1BohWZ/RPphM
	CfOWHDnJT/NmSNhTjVZ0ydcRHI73Z56CJBZC
X-Google-Smtp-Source: AGHT+IE81Gr2SlmmebuhBJxM8rXuRjo21IQK4EyAj7JC3j2oTqx5wxz/SFOtV4MwQkKtbC7MrDqYnA==
X-Received: by 2002:a05:6a20:d817:b0:1f5:8e04:f186 with SMTP id adf61e73a8af0-2010817bf5cmr1500411637.35.1743732590404;
        Thu, 03 Apr 2025 19:09:50 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::78d1])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af9bc41ad1csm1895578a12.73.2025.04.03.19.09.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 19:09:50 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 1/2] gcc-target: Disable multilibs on riscv32/riscv64 targets
Date: Thu,  3 Apr 2025 19:09:47 -0700
Message-ID: <20250404020948.3903214-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Apr 2025 02:09:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214333

It builds a default multilib set know-how into compiler even-though  we do
not have any multilib on target gcc. It alters the c++ standard header paths
to multilib specific subdirs e.g.

ignoring nonexistent directory "/usr/lib/gcc/riscv32-yoe-linux/15.0.1/../../../../include/c++/15.0.1/riscv32-yoe-linux/rv32imafdc/ilp32d"

as a result it will not find the c++ headers because gcc-runtime has
installed them in ( disabled multilib assumption)

"/usr/lib/gcc/riscv32-yoe-linux/15.0.1/../../../../include/c++/15.0.1/riscv32-yoe-linux/"

Therefore disable multilib during configure to match the runtime installation
options.

Without this GCC on target is not able to compile simple C++ programs

e.g.

g++  -Wall -W -O2 -c -o arg_parser.o arg_parser.cc
In file included from /usr/include/c++/15.0.1/cstring:47,
                 from arg_parser.cc:20:
/usr/include/c++/15.0.1/bits/version.h:51:10: fatal error: bits/c++config.h: No such file or directory
   51 | #include <bits/c++config.h>
      |          ^~~~~~~~~~~~~~~~~~

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-target.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/gcc/gcc-target.inc b/meta/recipes-devtools/gcc/gcc-target.inc
index 6b47c10413a..6acf5a9604b 100644
--- a/meta/recipes-devtools/gcc/gcc-target.inc
+++ b/meta/recipes-devtools/gcc/gcc-target.inc
@@ -1,4 +1,7 @@
 GCCMULTILIB = "--enable-multilib"
+GCCMULTILIB:riscv32 = "--disable-multilib"
+GCCMULTILIB:riscv64 = "--disable-multilib"
+
 require gcc-configure-common.inc
 
 EXTRA_OECONF_PATHS = "\

