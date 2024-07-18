Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 496E5C3DA70
	for <webhook@archiver.kernel.org>; Thu, 18 Jul 2024 13:46:01 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web11.15458.1721310354635081408
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Jul 2024 06:45:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=STcldCBD;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.179, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1fbe6f83957so7495705ad.3
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Jul 2024 06:45:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1721310354; x=1721915154; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0OkpOzgIpqyf3rBKP3LLP2PvQToynI4hp5w/JKjz5OM=;
        b=STcldCBDc2grJ5eLhrOfj11/9ON43imdngh89TfwHLHX0MwaI/n3R4ZnpB5xlfnuRK
         w32Xq3FZXgUNaWV2eJLMycgbjeaixMopLebQXAjKOesmY4pk64zfwBQDKHyfx9pOlqg+
         Q63fdl1Cyn6b+hqiwHYjFxzVSNtiQGb1UxGRTaCXh+CVoDMzYinuzWQzvFHtrwbL3I8b
         zmPvHmOS4BIa8GXdl6s5wHwFYpIuKaVTjZcJVbCSczXjBoNZuCn9om13TMicItYLD7r1
         0+h5TKQY93VpgMsNqhfRFpcg0EnP2M1iFQ0SBp3ZvP7TMU1YdcRfZ+gI7/iCPaDyE7nP
         ku+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721310354; x=1721915154;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0OkpOzgIpqyf3rBKP3LLP2PvQToynI4hp5w/JKjz5OM=;
        b=BCsPilpOnJTZzdlmiThWnVaC0tMfb91mDFP6w5Pn/IY2zqGMjTVNe11HAvuPJLsN/o
         kgQuTxxCTi/3qpNMvdPg/8jtXNWsWhaDWZZ4JWO21moADOisFfI4G5SUMf+4yvbvLDkm
         xZJSaVDMtHs0nWVf71VGSK9snSA3n7dC9X93D3U0cfCisEgPtXDVx/xHAZzHDHedBPzF
         dG1mdrGNPGSR8fdSlHpPhjnm39EHs7fCn5gX5s1/KmLTq2OOyrtifFMeH45IVjUMt0lN
         gsMGbSWQvCuNtOVSuXSOP5xCqEya3GY1iwRp7uWIQaPF2fwwV4n/O5wp00I2hRrbtOvg
         mR+w==
X-Gm-Message-State: AOJu0Yz+aAy62QTxyPp2KargatORVr+gzEOf2hzYAXNGokb48fr8MUnY
	Hnyv+lSXjeDm0s8MgnCPKgvG+ULQWeLbkKnKoeFRD9H8kgJVTsI53j29hb0xnzxGT1mm7PhNml2
	2
X-Google-Smtp-Source: AGHT+IF4p22XIFUgWeTLuERLq0Nqx7aV07awo+joB/Bqcd5coj4IHpF5P5MJhNm/ijY0drndnTdhHA==
X-Received: by 2002:a17:903:22c7:b0:1f7:19b7:98bd with SMTP id d9443c01a7336-1fc4e105de3mr43002515ad.6.1721310353790;
        Thu, 18 Jul 2024 06:45:53 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fc0bb6ffbdsm93366985ad.60.2024.07.18.06.45.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jul 2024 06:45:53 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 02/12] busybox: Patch CVE-2023-42363
Date: Thu, 18 Jul 2024 06:45:31 -0700
Message-Id: <9c52dadd06fd9132c6efc1d06b6fc4a4517be6c3.1721310237.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1721310237.git.steve@sakoman.com>
References: <cover.1721310237.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Jul 2024 13:46:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202215

From: Peter Marko <peter.marko@siemens.com>

Backport patch for CVE-2023-42363.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 814f97922e1d6c24a36b03ee0e865f2210ff6d7c)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../busybox/busybox/CVE-2023-42363.patch      | 67 +++++++++++++++++++
 meta/recipes-core/busybox/busybox_1.36.1.bb   |  1 +
 2 files changed, 68 insertions(+)
 create mode 100644 meta/recipes-core/busybox/busybox/CVE-2023-42363.patch

diff --git a/meta/recipes-core/busybox/busybox/CVE-2023-42363.patch b/meta/recipes-core/busybox/busybox/CVE-2023-42363.patch
new file mode 100644
index 0000000000..379f6f83b1
--- /dev/null
+++ b/meta/recipes-core/busybox/busybox/CVE-2023-42363.patch
@@ -0,0 +1,67 @@
+From fb08d43d44d1fea1f741fafb9aa7e1958a5f69aa Mon Sep 17 00:00:00 2001
+From: Natanael Copa <ncopa@alpinelinux.org>
+Date: Mon, 20 May 2024 17:55:28 +0200
+Subject: [PATCH] awk: fix use after free (CVE-2023-42363)
+
+function                                             old     new   delta
+evaluate                                            3377    3385      +8
+
+Fixes https://bugs.busybox.net/show_bug.cgi?id=15865
+
+Signed-off-by: Natanael Copa <ncopa@alpinelinux.org>
+Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
+
+CVE: CVE-2023-42363
+Upstream-Status: Backport [https://git.busybox.net/busybox/commit/?id=fb08d43d44d1fea1f741fafb9aa7e1958a5f69aa]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ editors/awk.c | 21 +++++++++++++--------
+ 1 file changed, 13 insertions(+), 8 deletions(-)
+
+diff --git a/editors/awk.c b/editors/awk.c
+index 0981c6735..ff6d6350b 100644
+--- a/editors/awk.c
++++ b/editors/awk.c
+@@ -2910,19 +2910,14 @@ static var *evaluate(node *op, var *res)
+ 				/* yes, remember where Fields[] is */
+ 				old_Fields_ptr = Fields;
+ 			}
+-			if (opinfo & OF_STR1) {
+-				L.s = getvar_s(L.v);
+-				debug_printf_eval("L.s:'%s'\n", L.s);
+-			}
+ 			if (opinfo & OF_NUM1) {
+ 				L_d = getvar_i(L.v);
+ 				debug_printf_eval("L_d:%f\n", L_d);
+ 			}
+ 		}
+-		/* NB: Must get string/numeric values of L (done above)
+-		 * _before_ evaluate()'ing R.v: if both L and R are $NNNs,
+-		 * and right one is large, then L.v points to Fields[NNN1],
+-		 * second evaluate() reallocates and moves (!) Fields[],
++		/* NB: if both L and R are $NNNs, and right one is large,
++		 * then at this pint L.v points to Fields[NNN1], second
++		 * evaluate() below reallocates and moves (!) Fields[],
+ 		 * R.v points to Fields[NNN2] but L.v now points to freed mem!
+ 		 * (Seen trying to evaluate "$444 $44444")
+ 		 */
+@@ -2942,6 +2937,16 @@ static var *evaluate(node *op, var *res)
+ 				debug_printf_eval("R.s:'%s'\n", R.s);
+ 			}
+ 		}
++		/* Get L.s _after_ R.v is evaluated: it may have realloc'd L.v
++		 * so we must get the string after "old_Fields_ptr" correction
++		 * above. Testcase: x = (v = "abc", gsub("b", "X", v));
++		 */
++		if (opinfo & OF_RES1) {
++			if (opinfo & OF_STR1) {
++				L.s = getvar_s(L.v);
++				debug_printf_eval("L.s:'%s'\n", L.s);
++			}
++		}
+ 
+ 		debug_printf_eval("switch(0x%x)\n", XC(opinfo & OPCLSMASK));
+ 		switch (XC(opinfo & OPCLSMASK)) {
+-- 
+2.30.2
+
diff --git a/meta/recipes-core/busybox/busybox_1.36.1.bb b/meta/recipes-core/busybox/busybox_1.36.1.bb
index 513dff8011..170447743c 100644
--- a/meta/recipes-core/busybox/busybox_1.36.1.bb
+++ b/meta/recipes-core/busybox/busybox_1.36.1.bb
@@ -52,6 +52,7 @@ SRC_URI = "https://busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://start-stop-false.patch \
            file://CVE-2021-42380.patch \
            file://0001-awk-fix-segfault-when-compiled-by-clang.patch \
+           file://CVE-2023-42363.patch \
            "
 SRC_URI:append:libc-musl = " file://musl.cfg "
 # TODO http://lists.busybox.net/pipermail/busybox/2023-January/090078.html
-- 
2.34.1


