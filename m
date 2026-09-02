Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B684C624D3
	for <webhook@archiver.kernel.org>; Wed,  2 Sep 2026 05:26:37 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5530.1788326788285471335
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Sep 2026 22:26:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=au2rStRg;
 spf=pass (domain: smile.fr, ip: 209.85.128.49, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-49b8687630fso4312775e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Sep 2026 22:26:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1788326786; x=1788931586; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=KbdGIid5rmMmjiBjla/qzfDqd0vi0hOoX7BorbN2EWM=;
        b=au2rStRgZSRi0vQWiewuLM/w8KlksYjljkD5Y8aP/wZG19uBXna6I/YcJE6eALgzE7
         6b3Cb3uWz9UJzqhDZBO3OocPgC6bauqE242Pn1/KvY/Hr7ecHbAFLWt5urfpH4wuYR9E
         6/QBDc7nw7D+2kYR9yM4j7n5dLZw5SUCnHIrA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788326786; x=1788931586;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=KbdGIid5rmMmjiBjla/qzfDqd0vi0hOoX7BorbN2EWM=;
        b=Sj6O3PNjlxc/mXWAd3mYEyMo+/9vVchJACzTcpy4hulId+zAPO1r6Oa51j2uOOaANe
         GiviexOp42DX42mZ+MSwGLL+jvnUUETeD7MWCYwgg7y01GJNoyu9cSDSrJyy4x84j1J5
         +Ylwik7VKprXIE24Xr1fjHubZTLMp6yNAM0HQ5T7xwyCNDzTDCiynR6u3E5EDo9FWlRu
         myhUhoGuSnp7qizZ6nAhRnbwLhHKFcjCK/x8qG0NK/L/3mqIxqGB57fp3RQ5r1JJup8X
         b0Ka5H/LIjUTbVuFfBkAwGVzX295ymi+Ej1dlCL51lo++JENw+6BAi3W26KReNVUxRF4
         zq4Q==
X-Gm-Message-State: AFuF++mPcJJlPHjF/TU/9Q0Z50+dbZDsssqb2pwAvVuhIHNgm+H9nR66
	MNB7s2jcRc5GxHvBCbytDnNLz/pjhXWhIW3Es3vppKkbammk2UDD4cj7om1DV0KcPwpqr9+mLs0
	FgXzjmUo=
X-Gm-Gg: AR+sD10+MXQYq6WshJWjsnZSJw2fyK3chHJXpBlswXIv4zMI4w6P75IEKGX+EXE/oUx
	Lkt3H4v8TDUR0NKmQS8VIwbE7rvU9JzZRlAPj3vht2DwfFNjNL+fFwO3+P+4MSGr0qmoeNzmo4x
	EsnW9u+XPusRHdCTby4X7mkYrWH2k/HR2QMVSNdyAljm2dtP8KsfP206AC213qGotegqb9AK8JR
	TEtS7Exm1CQsnpb/crQlwk4JnBZbzmdGbHrkZzVD5MwcT6O6mVNd0OFq4xFKX5e2WVRvs7WtWlF
	WdTQLL01nIx2DMcI+NyxSw/mbmxaztpWrmJpa+anixJSC+At1OCqBfkfIypCDvJEEJvnjRNTxLa
	AwM0Aq9vMmuYXgT6dY4ZnyzOLb3EQ4mVkh3OaPEjUDK8ta6A4BnZKF5hDOJt35GuZC8e10Vb7mz
	RjwVZ5s0YNAeg4pGyM1BPwZ2sxxky/TIVAmVs+PgapFN0Bz39XX5MUT9j1uf1/bIhfAo8zXIGrd
	md3SKBTDUbvdGQobQ==
X-Received: by 2002:a05:600c:3b07:b0:496:bffb:fb7b with SMTP id 5b1f17b1804b1-49ce5823706mr32025525e9.10.1788326786293;
        Tue, 01 Sep 2026 22:26:26 -0700 (PDT)
Received: from FRSMI25-LASER.wifi-gare.sncf.com ([148.169.40.19])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce4780f0dsm37084695e9.12.2026.09.01.22.26.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 22:26:26 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 01/27] socat: fix native build on host with newer glibc
Date: Wed,  2 Sep 2026 07:25:18 +0200
Message-ID: <0cd52c822a9929399fe8840955ff451216182f36.1788326578.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1788326578.git.yoann.congal@smile.fr>
References: <cover.1788326578.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Sep 2026 05:26:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244852

From: Martin Jansa <martin.jansa@gmail.com>

Fixes:
../socat-1.8.0.0/filan.c: In function ?printtime?:
../socat-1.8.0.0/filan.c:1065:46: error: assignment of read-only location ?*(const char *)strchr(s, 10)?
 1065 |       if (strchr(s, '\n'))  *strchr(s, '\n') = '\0';
      |                                              ^

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 ...ixed-strchr-with-const-for-new-glibc.patch | 38 +++++++++++++++++++
 .../socat/socat_1.8.0.0.bb                    |  1 +
 2 files changed, 39 insertions(+)
 create mode 100644 meta/recipes-connectivity/socat/files/0001-Fixed-strchr-with-const-for-new-glibc.patch

diff --git a/meta/recipes-connectivity/socat/files/0001-Fixed-strchr-with-const-for-new-glibc.patch b/meta/recipes-connectivity/socat/files/0001-Fixed-strchr-with-const-for-new-glibc.patch
new file mode 100644
index 00000000000..5a7c19294c4
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
index 156fd590aee..1be3a088024 100644
--- a/meta/recipes-connectivity/socat/socat_1.8.0.0.bb
+++ b/meta/recipes-connectivity/socat/socat_1.8.0.0.bb
@@ -11,6 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
 
 SRC_URI = "http://www.dest-unreach.org/socat/download/socat-${PV}.tar.bz2 \
            file://0001-fix-compile-procan.c-failed.patch \
+           file://0001-Fixed-strchr-with-const-for-new-glibc.patch \
            file://CVE-2024-54661.patch \
            file://CVE-2026-56123.patch \
 "

