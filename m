Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60D32C5DF66
	for <webhook@archiver.kernel.org>; Mon, 17 Aug 2026 17:45:28 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.673.1786988719946072043
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Aug 2026 10:45:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Bq0IYkRw;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4955aa106b1so33104855e9.0
        for <openembedded-core@lists.openembedded.org>; Mon, 17 Aug 2026 10:45:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786988718; x=1787593518; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=j5Gat1mYyyPwuuaEK1+BOBjpK9LRJ98ybk64QtEry9I=;
        b=Bq0IYkRw+qBEQ8c7iMnTgYdaJQ28irFMtekY08YEHpkWqDrIjiBkilv0V+LlKp39OF
         oiDNEs55JqO2jPf6riTULqrQFqaP8zhSeyp/wWwoXYN9ze/CYeCepTYcww3hiaGCL/ya
         T+ymqpviFzd1VmSxIakSeQVN3VRNv0ouUEIk2DRIXl/0sgt9FYI7ecsbWVWXlbd3iT/j
         54FG58uOjnlVWQ2H8hpIBZ1beRtfbGRST03/h+LGImxXfp4qv0cCJSpuWlCy+ABGILDr
         IxWQwcFfJZKbbjYkF75BTp5mwK3hB26MDIGouWwpKXRjL7QFe/U34BFUpjDYFUytXjYn
         du0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786988718; x=1787593518;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j5Gat1mYyyPwuuaEK1+BOBjpK9LRJ98ybk64QtEry9I=;
        b=LA2AyznIDqLS4PY5PDhZb8foYO7gCrtzRpZU8ZwFX27iOJKi1+QGNGzKuq5y9g7jMc
         19SWNBlO+hNNynhrcxqLruLOoiZYe59+tJ4MdX4E75Q5rZvWNjcYQC80GwJPFArru4CF
         fg7S1ron1q8EnVDg6AH4kG8jE6tGljLaPGeQFNgSilV0QvW1NR+Dq0ZndM/cZkOB5aZj
         OIlzSzs9cZlB2rpKDP9i/64EfvNv2l85wHzMyu1iSM1ynvzMqc9+wN3KH/Tx5+fOzyWb
         9vdaLNOHE6eliMxol1Gpl33h4sfhAw34a/KWyMcpWkE3jaf33vCrN4ygE2f4Rq5AuFq5
         fSBw==
X-Gm-Message-State: AOJu0YwTl61Ifb+mNIZTpFoHvcnxW8rhddL9eK9howLBbFnIuuNMs4Zh
	6UrzHaV9N9jh9U7XUAkt2bRhfEhz2lyYd7YMRY1mdjSlIt4EU6d3KVuwHC6R/1tjaF7Wmg==
X-Gm-Gg: AR+sD13aHgBF8yHGdrQ+Z0tIs0amUxMnoj67bedSxWKZpTVEOgN7e3MR4ILjdK9wxuW
	qGaEHTM7KGjiPQvBLAOf/F4aNGLUGP9gL4glqKn2mYCyfzf34pN44cjz29y03WdmkEJJP52b5CF
	wWBtDX2P3AykniDPL53O5oIAf7wofIONuNumR+wRdMKMZGJJnd3zpyCOS0X+wusNlNyB/blARX0
	dsUbl0KY3kD5jYNsZNRund31iKnNkiy7qfLkAID+aCZ3rOiZeHPi8/8YrDQnt6o2ntQhf4NeBiD
	HKeLo+BUufvHub390QjIeK5n1m5wntt8fEEhzXfLti5hN8WWeBwRC7ogCbI5XlnimZiwcywNGuu
	mvLDvSbMWKHKTc3A8ybrSmpZoXx4VbF2DiJqDOAutXpkniXPcxbGMF2WYWnA3L1Swltk5x/fqfv
	wQ5mSinvkEfZVnECQrUTLMYhfOwI3pZpsnfhybyhBnnjeLKQ57iMFjP7ksfUaV0xStvoBWBRBof
	zGJmwdCI5K+/ikE9TOg1SMpPquz4PH7o3YKR/jluG1EuXc=
X-Received: by 2002:a05:600c:8189:b0:496:c1f3:e8f8 with SMTP id 5b1f17b1804b1-499879500f8mr470452985e9.7.1786988717844;
        Mon, 17 Aug 2026 10:45:17 -0700 (PDT)
Received: from localhost ([109.238.218.228])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49996109652sm212902655e9.4.2026.08.17.10.45.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 10:45:16 -0700 (PDT)
From: martin.jansa@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [scarthgap][PATCH] socat: fix native build on host with newer glibc
Date: Mon, 17 Aug 2026 19:45:12 +0200
Message-ID: <20260817174512.2137333-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Aug 2026 17:45:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243628

From: Martin Jansa <martin.jansa@gmail.com>

Fixes:
../socat-1.8.0.0/filan.c: In function ?printtime?:
../socat-1.8.0.0/filan.c:1065:46: error: assignment of read-only location ?*(const char *)strchr(s, 10)?
 1065 |       if (strchr(s, '\n'))  *strchr(s, '\n') = '\0';
      |                                              ^

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 ...ixed-strchr-with-const-for-new-glibc.patch | 38 +++++++++++++++++++
 .../socat/socat_1.8.0.0.bb                    |  1 +
 2 files changed, 39 insertions(+)
 create mode 100644 meta/recipes-connectivity/socat/files/0001-Fixed-strchr-with-const-for-new-glibc.patch

diff --git a/meta/recipes-connectivity/socat/files/0001-Fixed-strchr-with-const-for-new-glibc.patch b/meta/recipes-connectivity/socat/files/0001-Fixed-strchr-with-const-for-new-glibc.patch
new file mode 100644
index 0000000000..5a7c19294c
--- /dev/null
+++ b/meta/recipes-connectivity/socat/files/0001-Fixed-strchr-with-const-for-new-glibc.patch
@@ -0,0 +1,38 @@
+From 3033625d5a67514e3d74021fc39f7fcb542d7f2d Mon Sep 17 00:00:00 2001
+From: Gerhard Rieger <gerhard@dest-unreach.org>
+Date: Wed, 11 Feb 2026 14:06:25 +0100
+Subject: [PATCH] Fixed strchr with const for new glibc
+
+Upstream-Status: Backport [https://repo.or.cz/socat.git/commit/a7058c9340db0bf90bf4372de0ae87ad37f57735]
+Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
+---
+ filan.c   | 2 +-
+ xio-ip6.c | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/filan.c b/filan.c
+index 36def50..e256f74 100644
+--- a/filan.c
++++ b/filan.c
+@@ -1055,7 +1055,7 @@ const char *getfiletypestring(int st_mode) {
+ }
+ 
+ static int printtime(FILE *outfile, time_t time) {
+-   const char *s;
++   char *s;
+ 
+    if (filan_rawoutput) {
+       fprintf(outfile, "\t"F_time, time);
+diff --git a/xio-ip6.c b/xio-ip6.c
+index bd94bdd..09abdd1 100644
+--- a/xio-ip6.c
++++ b/xio-ip6.c
+@@ -114,7 +114,7 @@ int xioparsenetwork_ip6(
+ 	struct xiorange *range,
+ 	const int ai_flags[2])
+ {
+-   char *delimpos;	/* absolute address of delimiter */
++   const char *delimpos;	/* absolute address of delimiter */
+    size_t delimind;	/* index of delimiter in string */
+    unsigned int bits;	/* netmask bits */
+    char *endptr;
diff --git a/meta/recipes-connectivity/socat/socat_1.8.0.0.bb b/meta/recipes-connectivity/socat/socat_1.8.0.0.bb
index 156fd590ae..1be3a08802 100644
--- a/meta/recipes-connectivity/socat/socat_1.8.0.0.bb
+++ b/meta/recipes-connectivity/socat/socat_1.8.0.0.bb
@@ -11,6 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
 
 SRC_URI = "http://www.dest-unreach.org/socat/download/socat-${PV}.tar.bz2 \
            file://0001-fix-compile-procan.c-failed.patch \
+           file://0001-Fixed-strchr-with-const-for-new-glibc.patch \
            file://CVE-2024-54661.patch \
            file://CVE-2026-56123.patch \
 "

