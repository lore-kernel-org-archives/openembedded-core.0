Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id 57ED76612D
	for <openembedded-core@lists.openembedded.org>;
	Sat, 27 Jan 2018 07:06:35 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id 17so151979pfw.11
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jan 2018 23:06:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=+PTXFYJaWh1Um2uM8GWoUyGpEXL1g1WQbpK56Fd14I8=;
	b=jTQV4FoW/nY2g71qKWQZgTGS6TA83rorCeZBTbeKeiDliQ3dqIwuZQCiuAWlf+HpBs
	7FPBuPiZebmcpLapLBvI9JzdCEur7TzG0cJMw9F7x11phGcViTDURyDjd10HSqnRlwCG
	x4e+QaloxyLpFDGaWkkRZiqo4x1GUDRz02YXHjvOs1ilYFcQDkK2pI9MgYZMZ2JAzhnz
	EFuMO+hp0lZ6IOClhChmmnZ5f1W2NmXCbJBQC0k0PBAzREl9y+xhobMjVgmcEWRufKSA
	1JdSu6rgSkScSZowx766V3ONqonpgQQfuti0tB5P4zCxeesAs4xIS39Q++EVQXIoBr5V
	FE2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=+PTXFYJaWh1Um2uM8GWoUyGpEXL1g1WQbpK56Fd14I8=;
	b=HPOCY4zPaKdSaA1Bo23ML7o1vduBNY7qEqTPjfun2E/Qs0CfMkF5wqWE2RTwsEvful
	fpHlEAGRAWuRuZ3MaOVYjnLLScrnm2gXQXhBYxv8GY0r8RKMhuyznkj8yQ8vD75iG1lc
	aQr6RQdyzDSVvisk1rVQy84oq9Li5d7NR/64Tl9syUIBkXdztpaLiCvpOmZ8WTuYtlQl
	XJf/mP11vo9AVqJ8lziUevbp+7ueBau0sRgrT7GQwNNigaiRyQHFd2RmASJ0pJ6a5JfV
	Kj3H3qxFUpr63Is4T9V2afGe+KdrfV8kgNGBQYQK7W5XjAtMqxI/ex/P/OIPCr2OlEAt
	+n/w==
X-Gm-Message-State: AKwxytcpdz56l0Y1G1XG+IvVRA5gSpMRFRivOwYlBJ9VVSmZQ1RO/C0t
	3LGcSMC9nqAkGaMKu4zGjJAy6g==
X-Google-Smtp-Source: AH8x2258DQRg6YrextOjUH2jRwDpuotRU5qWWzV+/IrqMDXc5bOV2C3HM/xAaa01wSNym6G0ullHfg==
X-Received: by 10.99.131.74 with SMTP id h71mr17057765pge.373.1517036797179;
	Fri, 26 Jan 2018 23:06:37 -0800 (PST)
Received: from localhost.localdomain ([2601:646:8880:466c::a8d6])
	by smtp.gmail.com with ESMTPSA id
	206sm20360192pfy.71.2018.01.26.23.06.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 26 Jan 2018 23:06:36 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 26 Jan 2018 23:06:26 -0800
Message-Id: <20180127070626.27581-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.16.1
Subject: [PATCH] meson: Adjust for clang compiler
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 27 Jan 2018 07:06:36 -0000

Remove hardcoding c/c++ compiler to be gcc alone, its
possible to use clang as replacement for cross compilers
from meta-clang, therefore set clang/clang++ if
TOOLCHAIN = "clang"

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes/meson.bbclass | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/meta/classes/meson.bbclass b/meta/classes/meson.bbclass
index 91ac652651..cd3497a802 100644
--- a/meta/classes/meson.bbclass
+++ b/meta/classes/meson.bbclass
@@ -40,6 +40,11 @@ EXTRA_OEMESON += "${PACKAGECONFIG_CONFARGS}"
 MESON_CROSS_FILE = ""
 MESON_CROSS_FILE_class-target = "--cross-file ${WORKDIR}/meson.cross"
 
+CCOMPILER ?= "gcc"
+CXXCOMPILER ?= "g++"
+CCOMPILER_toolchain-clang = "clang"
+CXXCOMPILER_toolchain-clang = "clang++"
+
 def meson_array(var, d):
     return "', '".join(d.getVar(var).split()).join(("'", "'"))
 
@@ -49,8 +54,8 @@ do_write_config() {
     # This needs to be Py to split the args into single-element lists
     cat >${WORKDIR}/meson.cross <<EOF
 [binaries]
-c = '${HOST_PREFIX}gcc'
-cpp = '${HOST_PREFIX}g++'
+c = '${HOST_PREFIX}${CCOMPILER}'
+cpp = '${HOST_PREFIX}${CXXCOMPILER}'
 ar = '${HOST_PREFIX}ar'
 ld = '${HOST_PREFIX}ld'
 strip = '${HOST_PREFIX}strip'
-- 
2.16.1


