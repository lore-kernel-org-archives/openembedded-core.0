Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45DDCCD4F3D
	for <webhook@archiver.kernel.org>; Fri, 22 May 2026 08:23:14 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12648.1779438186018946696
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 May 2026 01:23:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=NO3JC7v7;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-48fe26a177cso52866465e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 22 May 2026 01:23:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779438184; x=1780042984; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Y8KlPHo8QvC/g1JUdPC6pBZSq21jj/5at7aJTC8mhmU=;
        b=NO3JC7v7fEa/XmxGYwoX53XAZIOSCmj1OEKx2M8CM1Jqzl0eGHLQsZ0DnSH2E23ln2
         vju861L/VbRUDEG60t5de1+DuCPsqP1Miv/C7RJRwF+M0RvQNebe8pN17T4OiY3HvLKG
         N5tqECHO2fWvzSsDbG6b9xJ35ajbhgjeB24hT2FL+CKnQzdBfWyM0an1prL5XFI5ZrkL
         p2za67cRKirIRQeAvqp32/eR3ZbQ5WhmvqwxM+8rbfR+8d19harZsn1s6rrbxzY2fD7h
         mjMmyGaDYR5YgjcqdrVQI2ZIHXflliZJNfzE2PKoNfUS9JTUGyP0raQG2PQONgPnID1L
         ULDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779438184; x=1780042984;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y8KlPHo8QvC/g1JUdPC6pBZSq21jj/5at7aJTC8mhmU=;
        b=ReJuXVPRkIe5hUnSKJZO93HP6pIgRgHrTnlMzFP/K4J+6YCDELR7s5KpYpVAnkavyO
         m45aUrL9UViOagG0PH8tiHQCLGPoOB3sB3C3Stbs9ZyRhKYaNvmAvR5//M+x0/YHEkMg
         XsVzNdXtgF38EcU918YQnrh7a57iac6TuttvEE0X+5GE3BhcJthD0NUK+0cUPMXlBxD4
         zkL55GT8qMT4Grk6Qle0eZtu2vRb7G8cRikXdMHrhKAiV1BYgNdDniRnZtvKUHzFTGJp
         YGBRhVXjVblZEP2IY4yJnUhQZCL56hmIcdUE/Wn8nt0jVaiZSm2UTUowuX5fRm8EWOLH
         CAJQ==
X-Gm-Message-State: AOJu0YyTy80+1r21fG9qdfGU+iqf7H4qhMwlb1bv35HXUUNVrMXzSIEG
	QBifTPGmBU2B8RuNpapzM3eYbwxmr9V5GiQDuIbl3FPNI+F/V6xmQAAKdvTDgQ==
X-Gm-Gg: Acq92OEGczNwbW3Rmprtd9RaNuTgUTdetJGY3zbP/c0Nc2bI203IrCe0LJgrmtm3DYb
	y/9kBc6/OwCncftXiMgFRDA32buvq4oMvb1kLbuzlisNfYzzYpz3HjHHMDwvBj6+bVruoH8ZYkg
	Fa3sTMs1CHfnImF30LbIMRKHY0lHG/hZEnvWafePaBu32VzVfCo15z0OScDttbo+2c9w+0BJ0gj
	BzAFbNXY+MQRxxHRQj5ff5mh4a05H2CxRJD5UKvkVDLToz4jrMMqFO3w4GuzPqurwvKxEMt3hSS
	6I/heNdnyONCEkEN6ZqZhyfkNV1QuElT3zheDJl1ArdkM4r7TjkutXF+of0jsIgBjyNa7nPdS9R
	Y/ZS2PTE3vY14IcOP0BwdZx4vbsbcjmDY8Ys9Q+w3vO25BrJmQcEKyTWfJwS6SZcVTNfvb7brxM
	xHoDbHbCfJGQD8WcU3ABdJww1wVhfUtO5N7DcbYLL7AEqA55RZBJDv4LWLNWDes2VaJ3qZnx0vp
	aair0KwSA==
X-Received: by 2002:a05:600c:4510:b0:48f:e230:72fc with SMTP id 5b1f17b1804b1-490428ee268mr28784875e9.33.1779438184137;
        Fri, 22 May 2026 01:23:04 -0700 (PDT)
Received: from localhost ([109.238.218.228])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490452765f5sm25306925e9.5.2026.05.22.01.23.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 01:23:03 -0700 (PDT)
From: martin.jansa@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [PATCH] clang/llvm: Upgrade to 22.1.6 release
Date: Fri, 22 May 2026 10:22:59 +0200
Message-ID: <20260522082259.1610223-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 May 2026 08:23:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237533

From: Martin Jansa <martin.jansa@gmail.com>

https://discourse.llvm.org/t/llvm-22-1-6-released/90838

Brings following fixes:

fc4aad7b5db3 [Clang][Coroutines] Don't emit fake uses for coroutine parameters (#194690)
5fb52fc3fda6 [Coverage] Fix assertion failure when a -isystem header invokes a user macro (#195427)
fd10d8f31077 [DAGTypeLegalizer] Add missing BR_CC handler for soft-promoted half operands (#196214)
c0262e742787 [SystemZ] Fix internal error with single-element vector types (#196127)
cbb1eb533ded [lldb-dap] Fix crash in source request handler (#195847)
897d3e2b2a63 [lldb][windows] fix cross DLL file descriptor lookup crash (#195855)
60e3203b2e90 Bump version to 22.1.6

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
Depends on https://lists.openembedded.org/g/openembedded-core/message/237462
unfortunately doesn't fix clang's ICE when building ffmpeg with -march=nehalem
(builds fine with -march=x86-64-v3 used by qemux86-64 by default nowadas).

 meta/conf/distro/include/maintainers.inc     | 2 +-
 meta/recipes-devtools/clang/common-clang.inc | 2 +-
 meta/recipes-devtools/clang/common.inc       | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 981a3c4fcc..af4ea1b14f 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -482,7 +482,7 @@ RECIPE_MAINTAINER:pn-linux-yocto-tiny = "Bruce Ashfield <bruce.ashfield@gmail.co
 RECIPE_MAINTAINER:pn-lld = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-lldb = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-llvm = "Khem Raj <raj.khem@gmail.com>"
-RECIPE_MAINTAINER:pn-llvm-project-source-22.1.5 = "Khem Raj <raj.khem@gmail.com>"
+RECIPE_MAINTAINER:pn-llvm-project-source-22.1.6 = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-llvm-tblgen-native = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-log4cplus = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-logrotate = "Yi Zhao <yi.zhao@windriver.com>"
diff --git a/meta/recipes-devtools/clang/common-clang.inc b/meta/recipes-devtools/clang/common-clang.inc
index d6ad546c59..a7934951e0 100644
--- a/meta/recipes-devtools/clang/common-clang.inc
+++ b/meta/recipes-devtools/clang/common-clang.inc
@@ -5,7 +5,7 @@ LLVM_HTTP ?= "https://github.com/llvm"
 
 MAJOR_VER = "22"
 MINOR_VER = "1"
-PATCH_VER = "5"
+PATCH_VER = "6"
 # could be 'rcX' or 'git' or empty ( for release )
 VER_SUFFIX = ""
 
diff --git a/meta/recipes-devtools/clang/common.inc b/meta/recipes-devtools/clang/common.inc
index 30bd7e18af..0252d77a7e 100644
--- a/meta/recipes-devtools/clang/common.inc
+++ b/meta/recipes-devtools/clang/common.inc
@@ -17,7 +17,7 @@ BASEURI ?= "${LLVM_HTTP}/llvm-project/releases/download/llvmorg-${PV}${VER_SUFFI
 UPSTREAM_CHECK_URI = "${LLVM_HTTP}/llvm-project/releases/"
 UPSTREAM_CHECK_REGEX = "releases/tag/llvmorg-?(?P<pver>\d+(\.\d+)+)"
 SOURCEDIR ?= "llvm-project-${PV}${VER_SUFFIX}.src"
-SRC_URI[sha256sum] = "7972b87b705a003ce70ab55f9f0fb495d156887cba0eb296d284731139118e2c"
+SRC_URI[sha256sum] = "6e0b376a1f6d9873e7dfb09ae6e04b9c7024400f01733fa4c29be69d5c138bc2"
 
 SRC_URI = "\
     ${BASEURI} \

