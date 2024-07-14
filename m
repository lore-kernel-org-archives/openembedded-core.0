Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4581C3DA42
	for <webhook@archiver.kernel.org>; Sun, 14 Jul 2024 16:59:10 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web11.19670.1720976348276260357
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Jul 2024 09:59:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XqLhPeDZ;
 spf=pass (domain: gmail.com, ip: 209.85.214.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1fb3cf78fbdso20744305ad.1
        for <openembedded-core@lists.openembedded.org>; Sun, 14 Jul 2024 09:59:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720976347; x=1721581147; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Vl+FgH+KkWr00JhZR1tAliAq7ruz7ORsaAdbpeHbs0c=;
        b=XqLhPeDZPgSoVUorMqhHLrr8EbfUohL/lI4zARRH7+8UR3Um7pOPm+hYkEgtg8F0gf
         pH2fGAKPTVAX2H+5IDF8WoSzGjqcM2D5yS03/OE4QhAhJNyNixonJu3q0r3QcTw/FpBm
         MZ0N+FrMWOJlRH9U+36IHYpsi1lIOCqHZUw6CYz+XclZeQ7Gcb98tzSsROmR29TgWaKz
         OYJA5cbhxCo8PGPuAgpPsl+f+zt9LvL4Xz8Aw1F4VaK5wtsiBNVBm9/T1HDV+WH0uTGi
         xMK6YiDusL7XSpGUCjv5OnJ+THmyzNGcBGg7v14KHDy6SEu/SIR0VKumjCI1cwHPnTm0
         aYvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720976347; x=1721581147;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Vl+FgH+KkWr00JhZR1tAliAq7ruz7ORsaAdbpeHbs0c=;
        b=paCR8YAeLibgZyw5tlKAF6TWCh+VzZWDc8F9FsDl7D2YgJ/hOywnRPx5RhFnSciBJO
         KIoQ7cRs+MzNpUp4eyphOnetBYaVY02GZhupmTITAXw1onVRwFPiK3RoeZPBaEl1oL9a
         8QyH5UHRzui7b+CSueWWWKl1tY122KrVDrr7cAhoe8PoTxamTz85KKrsTMUkCMQBVNXE
         uQBwL1foz3GB9n4xL8YHT/YUry1uH2bQNQUb+SF4T/P27aF+8uOerwy29nCPg7PMhEgC
         9yAGx/ItNcL2JR2MTXW/dU8SLqExQFR/CIexLWiGNFaeGUeEFfuCRTgXy/j/emaE57Zl
         HEvw==
X-Gm-Message-State: AOJu0YzIPcGeBByScxJTJxN5KhjEWOY6G5lZ5EaU3xVNUHF6LCxCMlGd
	gs9RYVjt1/SnpxwBRP7KnvFJaydxhmyWLOfDMTIu4V8I2ts6ufmDHBc+eafE
X-Google-Smtp-Source: AGHT+IHtDgSeeKISc8Sq2BhlRDob5dnbdqKKG2CwUjP2lv0Lu90u11VZYGmh832Tut+05OyFzkwz+Q==
X-Received: by 2002:a17:902:ea01:b0:1f9:d035:689a with SMTP id d9443c01a7336-1fbb6cd1962mr131958435ad.3.1720976347276;
        Sun, 14 Jul 2024 09:59:07 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::f6de])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fc0bc271a9sm25675985ad.172.2024.07.14.09.59.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jul 2024 09:59:06 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2] busybox: Fix tc applet build when using kernel 6.8+
Date: Sun, 14 Jul 2024 09:59:04 -0700
Message-ID: <20240714165904.736928-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 14 Jul 2024 16:59:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201888

We now have 6.9 kernel headers in master which means
busybox builds with CONFIG_TC will fail to build due
to CBQ being dropped in kernel 6.8+

Apply a fix which is reported upstream

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Rebased on top of master

 .../busybox/busybox-1.36.1-no-cbq.patch       | 61 +++++++++++++++++++
 meta/recipes-core/busybox/busybox_1.36.1.bb   |  1 +
 2 files changed, 62 insertions(+)
 create mode 100644 meta/recipes-core/busybox/busybox/busybox-1.36.1-no-cbq.patch

diff --git a/meta/recipes-core/busybox/busybox/busybox-1.36.1-no-cbq.patch b/meta/recipes-core/busybox/busybox/busybox-1.36.1-no-cbq.patch
new file mode 100644
index 00000000000..80cbc73fc41
--- /dev/null
+++ b/meta/recipes-core/busybox/busybox/busybox-1.36.1-no-cbq.patch
@@ -0,0 +1,61 @@
+Remove CBQ functionality from tc
+
+6.8+ kernel has dropped CBQ support [1], Now that OE uses 6.9 for
+kernel-headers means we are hitting the undefined symbol
+TCA_CBQ_MAX [2]  
+
+[1] https://github.com/torvalds/linux/commit/33241dca486264193ed68167c8eeae1fb197f3df
+[2] https://bugs.busybox.net/show_bug.cgi?id=15934
+
+Upstream-Status: Submitted [https://bugs.busybox.net/show_bug.cgi?id=15931]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+diff -up busybox-1.36.1/networking/tc.c.no-cbq busybox-1.36.1/networking/tc.c
+--- busybox-1.36.1/networking/tc.c.no-cbq	2024-01-29 10:24:09.135082923 -0500
++++ busybox-1.36.1/networking/tc.c	2024-01-29 10:28:12.009502552 -0500
+@@ -31,7 +31,7 @@
+ //usage:	"qdisc [handle QHANDLE] [root|"IF_FEATURE_TC_INGRESS("ingress|")"parent CLASSID]\n"
+ /* //usage: "[estimator INTERVAL TIME_CONSTANT]\n" */
+ //usage:	"	[[QDISC_KIND] [help|OPTIONS]]\n"
+-//usage:	"	QDISC_KIND := [p|b]fifo|tbf|prio|cbq|red|etc.\n"
++//usage:	"	QDISC_KIND := [p|b]fifo|tbf|prio|red|etc.\n"
+ //usage:	"qdisc show [dev STRING]"IF_FEATURE_TC_INGRESS(" [ingress]")"\n"
+ //usage:	"class [classid CLASSID] [root|parent CLASSID]\n"
+ //usage:	"	[[QDISC_KIND] [help|OPTIONS] ]\n"
+@@ -230,7 +230,7 @@ static int cbq_parse_opt(int argc, char
+ {
+ 	return 0;
+ }
+-#endif
++
+ static int cbq_print_opt(struct rtattr *opt)
+ {
+ 	struct rtattr *tb[TCA_CBQ_MAX+1];
+@@ -322,6 +322,7 @@ static int cbq_print_opt(struct rtattr *
+  done:
+ 	return 0;
+ }
++#endif
+ 
+ static FAST_FUNC int print_qdisc(
+ 		const struct sockaddr_nl *who UNUSED_PARAM,
+@@ -373,7 +374,8 @@ static FAST_FUNC int print_qdisc(
+ 		if (qqq == 0) { /* pfifo_fast aka prio */
+ 			prio_print_opt(tb[TCA_OPTIONS]);
+ 		} else if (qqq == 1) { /* class based queuing */
+-			cbq_print_opt(tb[TCA_OPTIONS]);
++			/* cbq_print_opt(tb[TCA_OPTIONS]); */
++			printf("cbq not supported");
+ 		} else {
+ 			/* don't know how to print options for this qdisc */
+ 			printf("(options for %s)", name);
+@@ -444,7 +446,8 @@ static FAST_FUNC int print_class(
+ 			/* nothing. */ /*prio_print_opt(tb[TCA_OPTIONS]);*/
+ 		} else if (qqq == 1) { /* class based queuing */
+ 			/* cbq_print_copt() is identical to cbq_print_opt(). */
+-			cbq_print_opt(tb[TCA_OPTIONS]);
++			/* cbq_print_opt(tb[TCA_OPTIONS]); */
++			printf("cbq not supported");
+ 		} else {
+ 			/* don't know how to print options for this class */
+ 			printf("(options for %s)", name);
diff --git a/meta/recipes-core/busybox/busybox_1.36.1.bb b/meta/recipes-core/busybox/busybox_1.36.1.bb
index 7ce57bb0d00..67bc5c0cadd 100644
--- a/meta/recipes-core/busybox/busybox_1.36.1.bb
+++ b/meta/recipes-core/busybox/busybox_1.36.1.bb
@@ -52,6 +52,7 @@ SRC_URI = "https://busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://CVE-2021-42380.patch \
            file://0001-awk-fix-segfault-when-compiled-by-clang.patch \
            file://CVE-2023-42363.patch \
+           file://busybox-1.36.1-no-cbq.patch \
            "
 SRC_URI:append:libc-musl = " file://musl.cfg "
 # TODO http://lists.busybox.net/pipermail/busybox/2023-January/090078.html

