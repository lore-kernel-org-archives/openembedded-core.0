Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA6F8FD5F7C
	for <webhook@archiver.kernel.org>; Wed,  8 Apr 2026 05:59:11 +0000 (UTC)
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.100070.1775627948048110832
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Apr 2026 22:59:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=AMKKqXvs;
 spf=pass (domain: gmail.com, ip: 74.125.82.177, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-2d18dfa2713so1467879eec.0
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Apr 2026 22:59:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775627947; x=1776232747; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jAI0PaX/E54MawTcfpeIsDMWItYiy9KsIHtnPADd2kw=;
        b=AMKKqXvsqH4Yf55A07dRQARUyHfXjSPpwkZCeeW486JBy5bwjlE4dA6hWtjkkYlzMV
         8LCVLkINtQvQY8bCJcFmQa3ccnztS6MBAiV4n0Zm6AMAccWiKy5A6GUa6ZXdC3rM1Srp
         SJTbtkA00gWJGW7iAw7tBmRkowaQ1XKBW+BZ60MNpccyEUr1g4fvZHL/iNL+ZajfAzNZ
         16+DPtOni6kqfd2jyR4GbKV9qUp262YndvaBJGswUfUNECRKRCl9iXDKyoulu5wTkNTA
         S+06UZPEJYeFoxBiwbp7DDeIln5slI9I1TbhmW0lOZoOIguNciSwvKvMkjIs7dUsFAm2
         j90w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775627947; x=1776232747;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jAI0PaX/E54MawTcfpeIsDMWItYiy9KsIHtnPADd2kw=;
        b=o3SKpapUaIRhXRgf6b+7+sJtWSzFVJNTjlN4F063Qqm/VaaDGHYCrk6LPL97BlKpDN
         EA0rbJsY+Jfmv8ivi0M8d7VOEZgqsJXLTl4qcuEfVsAU72oEAekwVobjlHBrTTVPH2zk
         uE2bHjw4w3wGcMnLwbEfraLis+3lk3BZw202fbj43H1gKiNLy5lSV6+Th3ZTfKOE0yp0
         fUuKhAczvjjR6CdCwPYHMwHe+Oyfovh4QQQvFSfe3lSyVLED/lpGznkPBoxRJo64G3jJ
         uU0tNfeVi398k7Qa2lx80oBMrDXkfH4tfBi13RREKUgV0xOY5YYfTMsjVu/XFovTHTBT
         NFLg==
X-Gm-Message-State: AOJu0Yy5SBA2hIyZBg1zD8y60e8ogLzudawWuNZv2zYv/xnsQeRxkEFg
	poYvjFUaEXLtnXzCKMdTcVSq02DzpkNM0lD+zSrNrwSwHvFQvAPI5hkFZIlSy5L4
X-Gm-Gg: AeBDieslSkRqJdJ6guwEViQVHv5wkZeVg07Rd0+CmbooeAExNKimqsQsZXYWrychrG+
	ZGsWBIAd/t5INCAmTDG5D3GCR1i8etst5ca75ayfIPXtqBQ3tt+q6swxJuhGOwFCCBxQnkhJZhI
	4/kZDjJGDzzELjtdfT1JLNMgoa1OyYwr0n9vCY8FxoTMHyFqpgk8tFDnFuZj7A8lXtvyJsdyVa7
	UqYLpcIzVrB89GQhzcIDtTuc1FjgEt1ETH3AOxMGpmPMMMeJNC7Kdyot9DB0dJ0WXfFZJfWWVnM
	w+MYKvO9ryZCdFT1jvjAwufVxKkek+GyAuwmICuvOq1XKYmL5czyw9Cgx4C5KJw5A/PW63RlR32
	eqmkOuhaaqHobsUujqMVm8OolI9BNyh6GTTUtnIYkBGxHR0bswzwUzFMnF+H6SeAMO8vORFbu9f
	zMz2cjkawzVPMBP1Qzz+zNZ6mOvl+ZYUrIQeS+ukM4TrCYSt5X2PaO2OIttv8kHlrVpQrSaSHo5
	5ncGF5UGY/X8JE/iXDAY/kTzvLUVR6jW2kFrtrkPBnLAQIyfq1RVPegtyjC
X-Received: by 2002:a05:7300:571e:b0:2c5:3b87:2fe9 with SMTP id 5a478bee46e88-2cbfa4c7f62mr9310726eec.9.1775627947094;
        Tue, 07 Apr 2026 22:59:07 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ca78df8942sm25037819eec.2.2026.04.07.22.59.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 22:59:06 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [PATCH] ghostscript: Fix build with clang-22
Date: Tue,  7 Apr 2026 22:59:03 -0700
Message-ID: <20260408055903.1194723-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Apr 2026 05:59:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234807

It seems clang can't handle floating-point arithmetic in
static initializers at compile time in this context.

Change the static const double declarations to
use #define macros fixes the problem

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...ace-static-const-double-with-macros-.patch | 33 +++++++++++++++++++
 .../ghostscript/ghostscript_10.06.0.bb        |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/0001-psi-ztype.c-replace-static-const-double-with-macros-.patch

diff --git a/meta/recipes-extended/ghostscript/ghostscript/0001-psi-ztype.c-replace-static-const-double-with-macros-.patch b/meta/recipes-extended/ghostscript/ghostscript/0001-psi-ztype.c-replace-static-const-double-with-macros-.patch
new file mode 100644
index 0000000000..6f310abf2e
--- /dev/null
+++ b/meta/recipes-extended/ghostscript/ghostscript/0001-psi-ztype.c-replace-static-const-double-with-macros-.patch
@@ -0,0 +1,33 @@
+From 0298799777bd179c455e5ce8d6008b2d84732967 Mon Sep 17 00:00:00 2001
+From: Khem Raj <khem.raj@oss.qualcomm.com>
+Date: Tue, 7 Apr 2026 22:40:26 -0700
+Subject: [PATCH] psi/ztype.c: replace static const double with macros for
+ min/max int bounds
+
+Clang rejects floating-point arithmetic in static initializers when it
+cannot evaluate them as constant expressions at compile time. Replace
+min_int_real and max_int_real with #define macros so the arithmetic is
+evaluated at each call site, fixing the build without any semantic change.
+
+Upstream-Status: Submitted [https://bugs.ghostscript.com/show_bug.cgi?id=709309]
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+ psi/ztype.c | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/psi/ztype.c b/psi/ztype.c
+index a01d83f..d454778 100644
+--- a/psi/ztype.c
++++ b/psi/ztype.c
+@@ -53,8 +53,9 @@ static int convert_to_string(const gs_memory_t *mem, os_ptr, os_ptr);
+  */
+ #define ALT_MIN_INT (((ps_int)-1) << ((sizeof(ps_int) * 8) - 1))
+ #define ALT_MAX_INT (~(ALT_MIN_INT))
+-static const double min_int_real = (ALT_MIN_INT * 1.0 - 1);
+-static const double max_int_real = (ALT_MAX_INT * 1.0 + 1);
++
++#define min_int_real ((double)(ALT_MIN_INT) - 1.0)
++#define max_int_real ((double)(ALT_MAX_INT) + 1.0)
+
+ #define REAL_CAN_BE_INT(v)\
+   ((v) > min_int_real && (v) < max_int_real)
diff --git a/meta/recipes-extended/ghostscript/ghostscript_10.06.0.bb b/meta/recipes-extended/ghostscript/ghostscript_10.06.0.bb
index e0add4bae9..1363aa281e 100644
--- a/meta/recipes-extended/ghostscript/ghostscript_10.06.0.bb
+++ b/meta/recipes-extended/ghostscript/ghostscript_10.06.0.bb
@@ -26,6 +26,7 @@ SRC_URI = "https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/downlo
            file://avoid-host-contamination.patch \
            file://0001-Fix-32-bit-build.patch \
            file://out-of-tree.patch \
+           file://0001-psi-ztype.c-replace-static-const-double-with-macros-.patch \
            "
 
 SRC_URI[sha256sum] = "5bd6da34794928cc7e616f288e32bd0be7f9a5ca2d3c206a0af2c19a4e3a318f"

