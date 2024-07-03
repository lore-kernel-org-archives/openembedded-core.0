Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50850C30658
	for <webhook@archiver.kernel.org>; Wed,  3 Jul 2024 03:20:23 +0000 (UTC)
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
 by mx.groups.io with SMTP id smtpd.web11.42896.1719976819676493001
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Jul 2024 20:20:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=D7CxBXZr;
 spf=pass (domain: gmail.com, ip: 209.85.161.42, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-5c40f0e679aso2504212eaf.3
        for <openembedded-core@lists.openembedded.org>; Tue, 02 Jul 2024 20:20:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719976818; x=1720581618; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MYj0krgHTYAj3DwIc6ATWT/NIHARbQgMgSuppPF6nek=;
        b=D7CxBXZr1RpbUQqoCk0NkO3BaxLysZ5sS7HFM1eoG7jQ44HVwtshvJ3F6wmSiFZXxW
         32bCTkfY2UFquqdzdm1Fb5O7IRbGfjPDtDF6XIlubUgtJJDZ19ul4fR9L10zb4iq8eGr
         PhodEPVOW3P7xboRfXsrm5NeU4JblKIgoeqms0rJU9775djLKddqQGnZwxOg2r/j1J1d
         UU5M9+B1cgCeAfXuuEivforQPLWwMSdCz2NrET2UQU0qj/pIkJR+IkddRJsGaI0LuGmS
         tyzs8F0SELv6OIaCdcOvJREL6YXw9ziVajliMAp2VebrHzlgUpAH6mIcTDwzvjlNhEUS
         xMlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719976818; x=1720581618;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MYj0krgHTYAj3DwIc6ATWT/NIHARbQgMgSuppPF6nek=;
        b=P6ZLb8u6iuYQ0SzqIa88idIw4CS18IREWGEL8sqVKqRIqhPY8sOXZ3DL4fbqwoOvga
         iimx0/5L4eAAgQsptMC04+Pw6IKAnPi4A+EuL9SWO3BBK/1WOOJL3Jg0xRRRwnnfmo/a
         /E045Lh53z7ISb6f6eH4BW/q/UEXSLKUPEJdMTBhiq8BnT39Gm5UN0ijYsFrLsozDILa
         Z4o4auapymQod+nwI9LRpYf6/uV3nkaf/dBIMVcxDDCOmxqzl1VuGbFeF9JRuKK2NKGw
         DF1PSA967Dm/zZVPCEKZBww5oFfB69ErRCbZsov346Rj1xAFcMIj5dE7LMAQzhB6GrH9
         zbxw==
X-Gm-Message-State: AOJu0YwaLoEVIUoXreyRdprfTOAn8hZVhLeQlTgmcdAlWJnaLKimAs8x
	416ACD7/NMjTAFdLZ3kyhAmJmC2Hj6SKNIf23d3I922XeOAyN9igcvuqKw==
X-Google-Smtp-Source: AGHT+IHcQ0rNRhzQM+UogmaZZVCzECgcoGOjn5u1uy0ib6R+Xb1pkrekI2HQ2nsPI3o7OKJEJdm0Rg==
X-Received: by 2002:a05:6358:7241:b0:1a5:619b:662c with SMTP id e5c5f4694b2df-1a6acca566emr1025399255d.10.1719976818393;
        Tue, 02 Jul 2024 20:20:18 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::9980])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c91ce71017sm9641409a91.29.2024.07.02.20.20.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jul 2024 20:20:17 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] busybox: Fix tc applet build when using kernel 6.8+
Date: Tue,  2 Jul 2024 20:20:15 -0700
Message-ID: <20240703032015.2567938-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Jul 2024 03:20:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201449

We now have 6.9 kernel headers in master which means
busybox builds with CONFIG_TC will fail to build due
to CBQ being dropped in kernel 6.8+

Apply a fix which is reported upstream

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
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
index 373a6b7781b..327bea0d017 100644
--- a/meta/recipes-core/busybox/busybox_1.36.1.bb
+++ b/meta/recipes-core/busybox/busybox_1.36.1.bb
@@ -49,6 +49,7 @@ SRC_URI = "https://busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://0001-libbb-sockaddr2str-ensure-only-printable-characters-.patch \
            file://0002-nslookup-sanitize-all-printed-strings-with-printable.patch \
            file://start-stop-false.patch \
+           file://busybox-1.36.1-no-cbq.patch \
            "
 SRC_URI:append:libc-musl = " file://musl.cfg "
 # TODO http://lists.busybox.net/pipermail/busybox/2023-January/090078.html

