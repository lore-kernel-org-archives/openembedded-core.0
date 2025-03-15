Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 601A0C28B28
	for <webhook@archiver.kernel.org>; Sat, 15 Mar 2025 19:44:06 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web11.16543.1742067843055306817
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Mar 2025 12:44:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UytpoN9l;
 spf=pass (domain: gmail.com, ip: 209.85.214.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-224341bbc1dso59727715ad.3
        for <openembedded-core@lists.openembedded.org>; Sat, 15 Mar 2025 12:44:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742067842; x=1742672642; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Nu0E30Kp5tLz6qf7vk9ya3rVu9ij5X8LQH6kJb0G/fs=;
        b=UytpoN9lfqfvgUezU8G+ZRXYbazrqBCD7vsV3r0KZc4WrG0U+JSEnp4I3mWJXB/gnU
         vSyWuZ4S7Rxqv7l0aHPEVS4lnno2JuqN1Z3gxUP6nUP8FLyFmcR32L9IbD0yjcG5dr65
         NGmp+Z2Hoyl2HlE1l728ZG91XC1L6N81268TOMzblEmlTaL/1X5s/qK69Stoo8o73hw5
         gvFZkwMyRzO6AEj7Y/CNYm/MSUjcddOgmebFPlJrd9NGXSG1Vo+lk8b21B4aNzLExhsr
         tBHr8VSIaxeudnIQm1CnXKnhwh0Ka9DSKan7l8SlQzHpzVKB8v+NpeDrGHsavENYPEtB
         LFMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742067842; x=1742672642;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Nu0E30Kp5tLz6qf7vk9ya3rVu9ij5X8LQH6kJb0G/fs=;
        b=Ud013uXNM8cEl5mx6u4RAqieKTDD8TieH5UHdbhO4UuOoc7I5qpLRct9EA0pbz+wc/
         hbJ3Rkk5xPTiiXh+AK93BfENOsHzEu1mm5l2othxfNpXFK2Q7MvXjzR2/I4pgbq+T+G2
         0a9EilhhS30V4FKXNIqqgYWqj5qZQ2AEM98Bhb5o0KRDRqJs7WJgAFXhaUjI1G3msjm1
         V2gE1tdShpijrRRwOtXceF5vtnELMInV0omT/DqXnX3l6MzKw1RPTTQLRosFHk0Edezy
         kMFhpwOlLwwROatfjx9bVeBYx1bxYC/de6P0fjbF5lQiYrx97jjGgkGP6CK5orLzdV9e
         Ub1Q==
X-Gm-Message-State: AOJu0Yx7FwSyvEOI9G2YBk1mzGUY7tnsGQ+I7rrdzW62++q3YKmWUMkI
	//jj7a80SmUElc/0D9wYpfxXhaWokPL/nsOKGj6FHFPNHrhF3NEsztp6JhTw
X-Gm-Gg: ASbGnct1HNnan7n6FnwdpdfTLi6P+zrzPnZfz4n3YvO/YWsS/Y2vzZsm2tqZNyrR8A8
	GglnhU0Af2eNlAhyI5Wxs3nTzdh2Hj1bdXhb1LJ5rLtHZUwtWtkefOuv6nzL0dEmFhbGokdrXMk
	whyhcpQUYxnlApv4cd64wQqvqbJ3Jr4Bieiq10Wmt3rrJlJAUOvc1P9rCP3OGa09XMQYld2JRlk
	O5CDkQWsB0MdKJGCfI6W2evkhHHsr/U3yqgUAWg+oSeuL2zsUeDERi65wP5VhMRbXVYq1umQIo2
	HjrCJ8exSGw9Cgoac5ucOv0ZnHNEtTF5PxUieDSUlrho4jA=
X-Google-Smtp-Source: AGHT+IEJLkvD90IFKSjAX4oCKje2gwqb8WXCkNz9myS7mDgujg7yURl95Y9iVHb8pBJ+zlm/YYOn5Q==
X-Received: by 2002:a17:903:f86:b0:220:c4e8:3b9f with SMTP id d9443c01a7336-225e08605f9mr81944725ad.0.1742067842040;
        Sat, 15 Mar 2025 12:44:02 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::6874])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c6ba740bsm47489195ad.122.2025.03.15.12.44.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Mar 2025 12:44:01 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] ppp: Replace K&R style C declarations
Date: Sat, 15 Mar 2025 12:43:57 -0700
Message-ID: <20250315194358.3962845-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Mar 2025 19:44:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212984

GCC uses C23 standard by default which does not allow
K&R style declarations

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...pdump-Fixed-building-with-GCC-15-548.patch | 75 +++++++++++++++++++
 meta/recipes-connectivity/ppp/ppp_2.5.2.bb    |  1 +
 2 files changed, 76 insertions(+)
 create mode 100644 meta/recipes-connectivity/ppp/ppp/0001-pppdump-Fixed-building-with-GCC-15-548.patch

diff --git a/meta/recipes-connectivity/ppp/ppp/0001-pppdump-Fixed-building-with-GCC-15-548.patch b/meta/recipes-connectivity/ppp/ppp/0001-pppdump-Fixed-building-with-GCC-15-548.patch
new file mode 100644
index 00000000000..2a3b3cc84ab
--- /dev/null
+++ b/meta/recipes-connectivity/ppp/ppp/0001-pppdump-Fixed-building-with-GCC-15-548.patch
@@ -0,0 +1,75 @@
+From 44a766a3d086f10cb584a0c423e5bed6af2e3615 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Jaroslav=20=C5=A0karvada?= <jskarvad@redhat.com>
+Date: Thu, 27 Feb 2025 23:00:16 +0100
+Subject: [PATCH] pppdump: Fixed building with GCC 15 (#548)
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+GCC 15 defaults to C23 which does not allow K&R declarations.
+
+Credit Yaakov Selkowitz in:
+https://src.fedoraproject.org/rpms/ppp/pull-request/12
+
+Upstream-Status: Backport [https://github.com/ppp-project/ppp/pull/548]
+
+Signed-off-by: Jaroslav Škarvada <jskarvad@redhat.com>
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ pppdump/pppdump.c | 20 +++++++-------------
+ 1 file changed, 7 insertions(+), 13 deletions(-)
+
+diff --git a/pppdump/pppdump.c b/pppdump/pppdump.c
+index c24208a..1534036 100644
+--- a/pppdump/pppdump.c
++++ b/pppdump/pppdump.c
+@@ -42,14 +42,12 @@ int tot_sent, tot_rcvd;
+ extern int optind;
+ extern char *optarg;
+ 
+-void dumplog();
+-void dumpppp();
+-void show_time();
++void dumplog(FILE *);
++void dumpppp(FILE *);
++void show_time(FILE *, int);
+ 
+ int
+-main(ac, av)
+-    int ac;
+-    char **av;
++main(int ac, char **av)
+ {
+     int i;
+     char *p;
+@@ -97,8 +95,7 @@ main(ac, av)
+ }
+ 
+ void
+-dumplog(f)
+-    FILE *f;
++dumplog(FILE *f)
+ {
+     int c, n, k, col;
+     int nb, c2;
+@@ -241,8 +238,7 @@ struct pkt {
+ unsigned char dbuf[8192];
+ 
+ void
+-dumpppp(f)
+-    FILE *f;
++dumpppp(FILE *f)
+ {
+     int c, n, k;
+     int nb, nl, dn, proto, rv;
+@@ -375,9 +371,7 @@ dumpppp(f)
+ }
+ 
+ void
+-show_time(f, c)
+-    FILE *f;
+-    int c;
++show_time(FILE *f, int c)
+ {
+     time_t t;
+     int n;
diff --git a/meta/recipes-connectivity/ppp/ppp_2.5.2.bb b/meta/recipes-connectivity/ppp/ppp_2.5.2.bb
index 9ea99cc15a3..5565ce51cff 100644
--- a/meta/recipes-connectivity/ppp/ppp_2.5.2.bb
+++ b/meta/recipes-connectivity/ppp/ppp_2.5.2.bb
@@ -23,6 +23,7 @@ SRC_URI = "https://download.samba.org/pub/${BPN}/${BP}.tar.gz \
            file://ppp_on_boot \
            file://provider \
            file://ppp@.service \
+           file://0001-pppdump-Fixed-building-with-GCC-15-548.patch \
            "
 
 SRC_URI[sha256sum] = "47da358de54a10cb10bf6ff2cf9b1c03c0d3555518f6182e8f701b8e55733cb2"

