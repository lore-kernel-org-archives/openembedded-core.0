Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5352DC3DA59
	for <webhook@archiver.kernel.org>; Sat, 20 Jul 2024 12:42:54 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web10.5373.1721479373698696556
 for <openembedded-core@lists.openembedded.org>;
 Sat, 20 Jul 2024 05:42:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=kSrgN+fN;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.176, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-70d199fb3dfso22793b3a.3
        for <openembedded-core@lists.openembedded.org>; Sat, 20 Jul 2024 05:42:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1721479373; x=1722084173; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ze1wXXA8VmIFPm/LDUhSSYy+mDKDr2J0qBfMDmkhdbg=;
        b=kSrgN+fNKV316r9kRVgH+IwTuzNXNbwqcqSBgpSc20lb8jkhcgTlm0Q1xgfIDoVFUw
         j0x4zrw3Ky/teSi+2wa7o4QjAsm6FfV7Lw3ryvOF+sUZKR/tMHjv+P5t2p9P4zSoeC4E
         X9uOpD1+P8fObHX1ENgN55C+NEQbefiFCSNjigKU6HyYKs9B+iPeI9Jw1Q7PodWA9OUC
         h5IDLSOnnBufnRWpcpZ/+5gBFsk7GRiiE3H4IstCxpCy2MtZG27rWO8HNdzHwSVBlojU
         nL2D7Iw7ZtpdwQisd+ys/0H+NN8VqNR1Kn5O0DqmaKh1FCCrM7rOrzdc+MSxA7FcAyeQ
         XeGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721479373; x=1722084173;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ze1wXXA8VmIFPm/LDUhSSYy+mDKDr2J0qBfMDmkhdbg=;
        b=eVpHzbbCN4zXDc05+Pfg1v61jrgLRTVqdPWpIJBLbt7e6aPbKxmkHa6ZoCPimnfmCP
         0hjMBzaUS/QvgjA7RtXVBfqYamJbaiFOeXvLV48wpZmUyareacA4e5TW3cL9GoUchkIl
         9XpivhIFIrBaihqnXJgbNC0byW/cjheINQYYmhhKF3vHttB/UAJgJX9PjEqv4n5NH3Ie
         eF04abcAbPgGujd38oSn8cV5UnyJZfCeU4JgozxSYiRAAt4cQBMnqsp3Le1n+OMf/npE
         7kE7/DZhqBgmOTyr4xd8msy/c0ReO/BW81vu2cSIhU4PU2MWNLKSTF/eu2AfeEJk8seW
         kOag==
X-Gm-Message-State: AOJu0YzmpME6jeGmAhERqhGOVTCjFgJqyXWUzSeBxCLYsxnmT3hcZ3pz
	JF3yzcbDrqAoVUK+4YsWFi+QBaWWLJ+2wpo9SglHHNijkDQR/qYPpIxkmCjlr74iwuB46wV7kHX
	19YE=
X-Google-Smtp-Source: AGHT+IFKCIJJfd9BemnylfLB/1Ms/jR8UVzfPR3ff36sRB0ImGjb2yDA6t9vFtdZZ7T5fQTkiWh40g==
X-Received: by 2002:a05:6a20:a104:b0:1be:e265:81fa with SMTP id adf61e73a8af0-1c4229527eemr3656326637.35.1721479372523;
        Sat, 20 Jul 2024 05:42:52 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70d0fe2e2b4sm796604b3a.10.2024.07.20.05.42.51
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Jul 2024 05:42:52 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 1/6] busybox: Fix CVE-2023-42363
Date: Sat, 20 Jul 2024 05:42:42 -0700
Message-Id: <929deb4a80d65dc3a6e9a523f1aed12635ed7d53.1721479252.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1721479252.git.steve@sakoman.com>
References: <cover.1721479252.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 20 Jul 2024 12:42:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202278

From: Hitendra Prajapati <hprajapati@mvista.com>

Upstream-Status: Backport from https://git.busybox.net/busybox/commit/?id=fb08d43d44d1fea1f741fafb9aa7e1958a5f69aa

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../busybox/busybox/CVE-2023-42363.patch      | 67 +++++++++++++++++++
 meta/recipes-core/busybox/busybox_1.35.0.bb   |  1 +
 2 files changed, 68 insertions(+)
 create mode 100644 meta/recipes-core/busybox/busybox/CVE-2023-42363.patch

diff --git a/meta/recipes-core/busybox/busybox/CVE-2023-42363.patch b/meta/recipes-core/busybox/busybox/CVE-2023-42363.patch
new file mode 100644
index 0000000000..b401a6e3e5
--- /dev/null
+++ b/meta/recipes-core/busybox/busybox/CVE-2023-42363.patch
@@ -0,0 +1,67 @@
+From fb08d43d44d1fea1f741fafb9aa7e1958a5f69aa Mon Sep 17 00:00:00 2001
+From: Natanael Copa <ncopa@alpinelinux.org>
+Date: Mon, 20 May 2024 17:55:28 +0200
+Subject: awk: fix use after free (CVE-2023-42363)
+
+function                                             old     new   delta
+evaluate                                            3377    3385      +8
+
+Fixes https://bugs.busybox.net/show_bug.cgi?id=15865
+
+Signed-off-by: Natanael Copa <ncopa@alpinelinux.org>
+Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
+
+Upstream-Status: Backport [https://git.busybox.net/busybox/commit/?id=fb08d43d44d1fea1f741fafb9aa7e1958a5f69aa]
+CVE: CVE-2023-42363
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ editors/awk.c | 21 +++++++++++++--------
+ 1 file changed, 13 insertions(+), 8 deletions(-)
+
+diff --git a/editors/awk.c b/editors/awk.c
+index 654cbac..4fbc11d 100644
+--- a/editors/awk.c
++++ b/editors/awk.c
+@@ -2889,19 +2889,14 @@ static var *evaluate(node *op, var *res)
+ 			if ((opinfo & OF_REQUIRED) && !op1)
+ 				syntax_error(EMSG_TOO_FEW_ARGS);
+ 			L.v = evaluate(op1, TMPVAR0);
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
+@@ -2914,6 +2909,16 @@ static var *evaluate(node *op, var *res)
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
+2.25.1
+
diff --git a/meta/recipes-core/busybox/busybox_1.35.0.bb b/meta/recipes-core/busybox/busybox_1.35.0.bb
index 07a5137d2a..842562c4c4 100644
--- a/meta/recipes-core/busybox/busybox_1.35.0.bb
+++ b/meta/recipes-core/busybox/busybox_1.35.0.bb
@@ -52,6 +52,7 @@ SRC_URI = "https://busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://CVE-2022-30065.patch \
            file://0001-devmem-add-128-bit-width.patch \
 	   file://CVE-2022-48174.patch \
+           file://CVE-2023-42363.patch \
            "
 SRC_URI:append:libc-musl = " file://musl.cfg "
 
-- 
2.34.1


