Return-Path: <festevam@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94DA1E77188
	for <webhook@archiver.kernel.org>; Tue,  7 Jan 2025 01:38:03 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web10.11413.1736213879181811813
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jan 2025 17:37:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KHhSNEnD;
 spf=pass (domain: gmail.com, ip: 209.85.216.51, mailfrom: festevam@gmail.com)
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-2ee46851b5eso17749967a91.1
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Jan 2025 17:37:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736213878; x=1736818678; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AL/mcYPMdz2q6wLF6fK71FQ221MxYO0T2oun87MbgXs=;
        b=KHhSNEnDHm74zsZzrzIOWgy0qZ8czTlAtuUb+UZ4Kje1W2RSjctrh5dbZ7Tdjlqh4b
         T6ILhr3ARiEhumSKubK7HSwRJICGUZ1lLfJHX5lbv2CZPc/2yWQqPdo7DqpGdzT0s5MV
         r1mfuIumMzyqbVdyYioyCdLJdWGSKdEs0VlGrgP/+DeTEKYBdUdtTWaBcITdhRutE02q
         H6ifeKcTWkJ1i10XvevbzCnoFRaOKODCDL0xL0sPJlwXu0THMJdvmMNqguqNFK2+3WYg
         n/nHNqJAd2/isg4tOLqTp0N70lp51t/6XRYQ6wdcn0cZZnX1pbi/ue60NyuBYwA89RbF
         bJng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736213878; x=1736818678;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AL/mcYPMdz2q6wLF6fK71FQ221MxYO0T2oun87MbgXs=;
        b=CPts9KxiDIOeqI6FUFQx7AmPxlc8LJIJB4nWkEbx6+O0udiGyIhQtrqHlkLN+x6FXG
         uJatmmucu6OZxeN9ROMvZ4KX0GO97y1CSrcl6iteoVC66WmlTEDKV6Dz6u1UIxirYaJl
         2hY6BMumhPldoe2a+D+ugsBEzAdtSTYUEDWOP3r2AAkbupq4ShIpiOfoBSiDNYcvCO3K
         F+rWEH10p/C3PyuWWC1C51A7FRZ87OK0M0O5ig0+CzwdHq2hdndl7PgfWy9w6UB8YUvO
         aJk5uyUjcWQ7sobBws7CuhY0I9RbwPdDGalI0QIok+2exOLMCbPxMFv9lcZndkjNOgZ8
         2DEw==
X-Gm-Message-State: AOJu0YxnO/UjH4Gcjtr00QK4TVQ6jqr0SHCaXAtQlVojR/tixY1cPoBZ
	WNIayKGTGS+xv2vJmxadMYO5gL2MwkNbGJRDxomTVn2etcydNFHN0vXN6Q==
X-Gm-Gg: ASbGncvNBSrrNFOmgL4hnpv4Q8wCavBotYNUCySFANAGHUodKgE1AsYXzrsAcCcM756
	C9gYNWNkx6d05yCCVgLzG0TK/yrssuCV27nuwG2g2WCTo/UNobLO6tm6LvyVjvpUvatsfluDnyG
	/qboy/Deydmdegtr0JtAq+ESpr42vTgvaHp5vA64x5tWApoqiPDRAX4UoId2gJatQ31pYKWMnL/
	TbBH7w0XvX4QNHm8tClubG7vE+ZayqdOsIgcUZKvPJcEvkHjIY7ZO8q52+EZzUdAk4LzBI=
X-Google-Smtp-Source: AGHT+IH4RRrSy/FU5VRrXt9A4PGKimBcWDT48UXC7vIAMlmmvo3zuGfZAOhGD6f8qqBplBs9GGmm7g==
X-Received: by 2002:a17:90b:134d:b0:2ea:4c4f:bd20 with SMTP id 98e67ed59e1d1-2f452eed773mr80476200a91.32.1736213878116;
        Mon, 06 Jan 2025 17:37:58 -0800 (PST)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:d4cb:2a53:2696:85ea])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f44779990csm34793718a91.6.2025.01.06.17.37.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 17:37:57 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Fabio Estevam <festevam@denx.de>
Subject: [PATCH] u-boot: upgrade 2024.10 -> 2025.01
Date: Mon,  6 Jan 2025 22:37:49 -0300
Message-Id: <20250107013749.2176391-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Jan 2025 01:38:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209432

From: Fabio Estevam <festevam@denx.de>

Upgrade to U-Boot 2025.01.

Remove the patch as it has been upstreamed.

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
 ...bfdt-libfdt.i_shipped-Use-SWIG_Appen.patch | 60 -------------------
 meta/recipes-bsp/u-boot/u-boot-common.inc     |  3 +-
 ...ols_2024.10.bb => u-boot-tools_2025.01.bb} |  0
 .../{u-boot_2024.10.bb => u-boot_2025.01.bb}  |  0
 4 files changed, 1 insertion(+), 62 deletions(-)
 delete mode 100644 meta/recipes-bsp/u-boot/files/0001-scripts-dtc-pylibfdt-libfdt.i_shipped-Use-SWIG_Appen.patch
 rename meta/recipes-bsp/u-boot/{u-boot-tools_2024.10.bb => u-boot-tools_2025.01.bb} (100%)
 rename meta/recipes-bsp/u-boot/{u-boot_2024.10.bb => u-boot_2025.01.bb} (100%)

diff --git a/meta/recipes-bsp/u-boot/files/0001-scripts-dtc-pylibfdt-libfdt.i_shipped-Use-SWIG_Appen.patch b/meta/recipes-bsp/u-boot/files/0001-scripts-dtc-pylibfdt-libfdt.i_shipped-Use-SWIG_Appen.patch
deleted file mode 100644
index 2eeef99b21..0000000000
--- a/meta/recipes-bsp/u-boot/files/0001-scripts-dtc-pylibfdt-libfdt.i_shipped-Use-SWIG_Appen.patch
+++ /dev/null
@@ -1,60 +0,0 @@
-From e093607e9a08e9c29b7bbaa6aeb137036db798a6 Mon Sep 17 00:00:00 2001
-From: Markus Volk <f_l_k@t-online.de>
-Date: Wed, 30 Oct 2024 05:46:00 +0100
-Subject: [PATCH] scripts/dtc/pylibfdt/libfdt.i_shipped: Use SWIG_AppendOutput
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Swig has changed language specific AppendOutput functions. The helper
-macro SWIG_AppendOutput remains unchanged. Use that instead
-of SWIG_Python_AppendOutput, which would require an extra parameter
-since swig 4.3.0.
-
-/home/flk/poky/build-test/tmp/work/qemux86_64-poky-linux/u-boot/2024.10/git/arch/x86/cpu/u-boot-64.lds
-| scripts/dtc/pylibfdt/libfdt_wrap.c: In function ‘_wrap_fdt_next_node’:
-| scripts/dtc/pylibfdt/libfdt_wrap.c:5581:17: error: too few arguments to function ‘SWIG_Python_AppendOutput’
-|  5581 |     resultobj = SWIG_Python_AppendOutput(resultobj, val);
-|       |                 ^~~~~~~~~~~~~~~~~~~~~~~~
-
-Upstream-Status: Backport [https://github.com/u-boot/u-boot/commit/a63456b9191fae2fe49f4b121e025792022e3950]
-
-Signed-off-by: Markus Volk <f_l_k@t-online.de>
----
- scripts/dtc/pylibfdt/libfdt.i_shipped | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/scripts/dtc/pylibfdt/libfdt.i_shipped b/scripts/dtc/pylibfdt/libfdt.i_shipped
-index 56cc5d48f4..e4659489a9 100644
---- a/scripts/dtc/pylibfdt/libfdt.i_shipped
-+++ b/scripts/dtc/pylibfdt/libfdt.i_shipped
-@@ -1037,7 +1037,7 @@ typedef uint32_t fdt32_t;
- 			fdt_string(fdt1, fdt32_to_cpu($1->nameoff)));
- 		buff = PyByteArray_FromStringAndSize(
- 			(const char *)($1 + 1), fdt32_to_cpu($1->len));
--		resultobj = SWIG_Python_AppendOutput(resultobj, buff);
-+		resultobj = SWIG_AppendOutput(resultobj, buff);
- 	}
- }
- 
-@@ -1076,7 +1076,7 @@ typedef uint32_t fdt32_t;
- 
- %typemap(argout) int *depth {
-         PyObject *val = Py_BuildValue("i", *arg$argnum);
--        resultobj = SWIG_Python_AppendOutput(resultobj, val);
-+        resultobj = SWIG_AppendOutput(resultobj, val);
- }
- 
- %apply int *depth { int *depth };
-@@ -1092,7 +1092,7 @@ typedef uint32_t fdt32_t;
-            if (PyTuple_GET_SIZE(resultobj) == 0)
-               resultobj = val;
-            else
--              resultobj = SWIG_Python_AppendOutput(resultobj, val);
-+              resultobj = SWIG_AppendOutput(resultobj, val);
-         }
- }
- 
--- 
-2.47.0
-
diff --git a/meta/recipes-bsp/u-boot/u-boot-common.inc b/meta/recipes-bsp/u-boot/u-boot-common.inc
index fe3afb33b5..fc860248ed 100644
--- a/meta/recipes-bsp/u-boot/u-boot-common.inc
+++ b/meta/recipes-bsp/u-boot/u-boot-common.inc
@@ -12,10 +12,9 @@ PE = "1"
 
 # We use the revision in order to avoid having to fetch it from the
 # repo during parse
-SRCREV = "f919c3a889f0ec7d63a48b5d0ed064386b0980bd"
+SRCREV = "6d41f0a39d6423c8e57e92ebbe9f8c0333a63f72"
 
 SRC_URI = "git://source.denx.de/u-boot/u-boot.git;protocol=https;branch=master"
-SRC_URI += "file://0001-scripts-dtc-pylibfdt-libfdt.i_shipped-Use-SWIG_Appen.patch"
 
 S = "${WORKDIR}/git"
 B = "${WORKDIR}/build"
diff --git a/meta/recipes-bsp/u-boot/u-boot-tools_2024.10.bb b/meta/recipes-bsp/u-boot/u-boot-tools_2025.01.bb
similarity index 100%
rename from meta/recipes-bsp/u-boot/u-boot-tools_2024.10.bb
rename to meta/recipes-bsp/u-boot/u-boot-tools_2025.01.bb
diff --git a/meta/recipes-bsp/u-boot/u-boot_2024.10.bb b/meta/recipes-bsp/u-boot/u-boot_2025.01.bb
similarity index 100%
rename from meta/recipes-bsp/u-boot/u-boot_2024.10.bb
rename to meta/recipes-bsp/u-boot/u-boot_2025.01.bb
-- 
2.37.3


