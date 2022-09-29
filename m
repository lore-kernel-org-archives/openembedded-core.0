Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2644AC433F5
	for <webhook@archiver.kernel.org>; Thu, 29 Sep 2022 12:39:46 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com
 [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web10.9557.1664455184038003121
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Sep 2022 05:39:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=Adi6+92g;
 spf=pass (domain: mvista.com, ip: 209.85.216.53,
 mailfrom: hprajapati@mvista.com)
Received: by mail-pj1-f53.google.com with SMTP id 70so1206927pjo.4
        for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Sep 2022 05:39:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=VYm/hAu8nnnCUuc/sgtfpqsojQrWPJ17LgtggGrEFJ0=;
        b=Adi6+92g+8DKfqzBi+RGlYnOytiOIeE22G0lYaiU5D8k9rYJc7sBRuZqg68B8Xvvgz
         kG8rTsL8yG7+Ok/Osjgak94Zi42DBd6QvBbKs/MYQlTzU6vGW+ysGiBGiHJ0TuXBTag1
         dXb68YS391xRc7TG6w1+MKldqXovw6vfydDYs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=VYm/hAu8nnnCUuc/sgtfpqsojQrWPJ17LgtggGrEFJ0=;
        b=tt8hfl7cwMytI/jLpj1Rqnw3cpbAgpf8FCwjWy5c+A30AfYeoAoQMaGrXIoq5vzj0Z
         cevTNTlBgA1gfB2Mjp2qf68nZnu7DQZunImJkmsxQnaK10PRozTbYlV2zJTimx4g37Q2
         jfab5n0wi4YWOGgw8AZbLxUUQ56N6v5orTOllnOSg4gFbBPQdqMfliHHQcqIFL2TF0d1
         vUb5/i/zpA42/ntfinef8W59CVmGtJuVFhO0Gb7WOact0D2Vt1lnGynqR4CwF9tT8bRP
         r9BMKpF26dgZf3YikrB7AWRCfcVQhXIpO5FyxJDg/BZ92LpT4akr99INnuojZxVEXwRc
         75CA==
X-Gm-Message-State: ACrzQf18BYuRrr4w/x30l3stSjAGiMxulwn4Xq5cPS6GsdShaZ62dh5m
	KNClouhli7OD1pgRGe/Wm1ddURdyZVrs8g==
X-Google-Smtp-Source: 
 AMsMyM4VZXbsGmFJrV0jNiUb5uQUn8TXAFcR/BY3tIhzqznRGkXdZrRvULn+mryzpHP6UlC/labylQ==
X-Received: by 2002:a17:90b:3c5:b0:205:dc5b:5436 with SMTP id
 go5-20020a17090b03c500b00205dc5b5436mr14753976pjb.35.1664455183197;
        Thu, 29 Sep 2022 05:39:43 -0700 (PDT)
Received: from MVIN00024 ([150.129.170.198])
        by smtp.gmail.com with ESMTPSA id
 o67-20020a625a46000000b005546642e815sm6065079pfb.31.2022.09.29.05.39.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Sep 2022 05:39:42 -0700 (PDT)
Received: by MVIN00024 (sSMTP sendmail emulation);
 Thu, 29 Sep 2022 18:09:37 +0530
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [dunfell][PATCH] golang: CVE-2022-27664 net/http: handle server
 errors after sending GOAWAY
Date: Thu, 29 Sep 2022 18:09:36 +0530
Message-Id: <20220929123936.47288-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Sep 2022 12:39:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171185

Source: https://github.com/golang/go
MR: 121912
Type: Security Fix
Disposition: Backport from https://github.com/golang/go/commit/5bc9106458fc07851ac324a4157132a91b1f3479
ChangeID: 0b76a92a774279d7bffc9d6fa05564dfd8371e8c
Description:
	 CVE-2022-27664 golang: net/http: handle server errors after sending GOAWAY.

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 meta/recipes-devtools/go/go-1.14.inc          |  1 +
 .../go/go-1.14/CVE-2022-27664.patch           | 68 +++++++++++++++++++
 2 files changed, 69 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go-1.14/CVE-2022-27664.patch

diff --git a/meta/recipes-devtools/go/go-1.14.inc b/meta/recipes-devtools/go/go-1.14.inc
index af6345205e..540ea4e62d 100644
--- a/meta/recipes-devtools/go/go-1.14.inc
+++ b/meta/recipes-devtools/go/go-1.14.inc
@@ -36,6 +36,7 @@ SRC_URI += "\
     file://CVE-2021-36221.patch \
     file://CVE-2021-39293.patch \
     file://CVE-2021-41771.patch \
+    file://CVE-2022-27664.patch \
 "
 
 SRC_URI_append_libc-musl = " file://0009-ld-replace-glibc-dynamic-linker-with-musl.patch"
diff --git a/meta/recipes-devtools/go/go-1.14/CVE-2022-27664.patch b/meta/recipes-devtools/go/go-1.14/CVE-2022-27664.patch
new file mode 100644
index 0000000000..238c3eac5b
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.14/CVE-2022-27664.patch
@@ -0,0 +1,68 @@
+From 48c9076dcfc2dc894842ff758c8cfae7957c9565 Mon Sep 17 00:00:00 2001
+From: Hitendra Prajapati <hprajapati@mvista.com>
+Date: Thu, 29 Sep 2022 17:06:18 +0530
+Subject: [PATCH] CVE-2022-27664
+
+Upstream-Status: Backport [https://github.com/golang/go/commit/5bc9106458fc07851ac324a4157132a91b1f3479]
+CVE: CVE-2022-27664
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ src/net/http/h2_bundle.go | 21 +++++++++++++--------
+ 1 file changed, 13 insertions(+), 8 deletions(-)
+
+diff --git a/src/net/http/h2_bundle.go b/src/net/http/h2_bundle.go
+index 65d851d..83f2a72 100644
+--- a/src/net/http/h2_bundle.go
++++ b/src/net/http/h2_bundle.go
+@@ -3254,10 +3254,11 @@ var (
+ // name (key). See httpguts.ValidHeaderName for the base rules.
+ //
+ // Further, http2 says:
+-//   "Just as in HTTP/1.x, header field names are strings of ASCII
+-//   characters that are compared in a case-insensitive
+-//   fashion. However, header field names MUST be converted to
+-//   lowercase prior to their encoding in HTTP/2. "
++//
++//	"Just as in HTTP/1.x, header field names are strings of ASCII
++//	characters that are compared in a case-insensitive
++//	fashion. However, header field names MUST be converted to
++//	lowercase prior to their encoding in HTTP/2. "
+ func http2validWireHeaderFieldName(v string) bool {
+ 	if len(v) == 0 {
+ 		return false
+@@ -3446,8 +3447,8 @@ func (s *http2sorter) SortStrings(ss []string) {
+ // validPseudoPath reports whether v is a valid :path pseudo-header
+ // value. It must be either:
+ //
+-//     *) a non-empty string starting with '/'
+-//     *) the string '*', for OPTIONS requests.
++//	*) a non-empty string starting with '/'
++//	*) the string '*', for OPTIONS requests.
+ //
+ // For now this is only used a quick check for deciding when to clean
+ // up Opaque URLs before sending requests from the Transport.
+@@ -4897,6 +4898,9 @@ func (sc *http2serverConn) startGracefulShutdownInternal() {
+ func (sc *http2serverConn) goAway(code http2ErrCode) {
+ 	sc.serveG.check()
+ 	if sc.inGoAway {
++		if sc.goAwayCode == http2ErrCodeNo {
++			sc.goAwayCode = code
++		}
+ 		return
+ 	}
+ 	sc.inGoAway = true
+@@ -6091,8 +6095,9 @@ func (rws *http2responseWriterState) writeChunk(p []byte) (n int, err error) {
+ // prior to the headers being written. If the set of trailers is fixed
+ // or known before the header is written, the normal Go trailers mechanism
+ // is preferred:
+-//    https://golang.org/pkg/net/http/#ResponseWriter
+-//    https://golang.org/pkg/net/http/#example_ResponseWriter_trailers
++//
++//	https://golang.org/pkg/net/http/#ResponseWriter
++//	https://golang.org/pkg/net/http/#example_ResponseWriter_trailers
+ const http2TrailerPrefix = "Trailer:"
+ 
+ // promoteUndeclaredTrailers permits http.Handlers to set trailers
+-- 
+2.25.1
+
-- 
2.25.1


