Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EAFC1099B52
	for <webhook@archiver.kernel.org>; Fri, 20 Mar 2026 23:07:33 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1973.1774048050873279101
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Mar 2026 16:07:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=VizMuqex;
 spf=pass (domain: smile.fr, ip: 209.85.221.51, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-43b41b545d9so2929758f8f.2
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Mar 2026 16:07:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1774048049; x=1774652849; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xPhjJPVwDn8ksPlBmmf6a7h7ivzI8TmVvfWLVE6OQBA=;
        b=VizMuqex7VCUa7xCvv5proS1n0DS/kfVeFz5VmdSM2WogdJPIpxh7k28quVJvIxVyN
         fxt5ZOjwy8Tk35UOYGu4Ff6uZAvA1G/M4uGwD75iUKmF8dFGSzeJ/7l44RrKgT/s2V50
         nn0P7wDDNCFainj7WA6Bm6LiHPUeNWJUzEo5I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774048049; x=1774652849;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xPhjJPVwDn8ksPlBmmf6a7h7ivzI8TmVvfWLVE6OQBA=;
        b=eNcAf8fJVF1SfvciJNJWmY3ASDKT3XmG/jlkbX4TI5RQaydGWR1n0ZxEXbbzNccYMM
         l/pn3zGPTFg/8DfDE3Se8intEXYM81wsRaxLkbtcpjLeADH/TK5RUrC5RvLBesTAAniD
         TUt7q2hQgWBjnaeO6M0JWkRzjAkSFsH+GWHQumn9xn/bhiaKrGAAIw3VjK/SB4pLpMhJ
         n34UQT06VPLAYbq9y5Tpxbn78ZD7qjOBlv5xnpSXFV67glj8J6krXJCKIyNB9DlZpAXb
         g1WDpGk/lhB93J/0MOI4k8CkZaRLBOgNBGrv/L61uc+LQ2iyEtYpAgKypmLcRUdPmoFi
         fXIw==
X-Gm-Message-State: AOJu0YwTJtnNx+foe2tbxqUMMw25/obY8Tgl65I6QqfzOBMtElTaMJR7
	STpXi3NKNE0brtQXlO2ZBYWE+/sW9pacV54q1E5/EW+yNwhHTxQUqSxBftYLh23fxOsvj4F0T4k
	geL8c
X-Gm-Gg: ATEYQzznjc651ZkQbciCrSOc1MvSk+ZsF7VmvhT1RKEAnizSh4PvH/Gt68rQ3SxmAx1
	nFeOLern6BGWZjuIFU1lqkFEYXJL4rvBimPw34T/yApIh3mrUpK+fXdx/DCSBFbSk3bKIWJi2Zy
	M051hSr7LdGWrnkNJ1ZJ61HvK6B9uA/mNCTlQvAbVcVM5YcG2Urv88LsaAlf0GYsHD84MQKSe5i
	Tu1cw0wOsiaRXCEq+HiyKIEhUA5veAoP0fIffvWAF1SYqbn09245fLPee36++8zHURNbfXwWyU6
	Gn8wjzx+hN/Oal1Am4hn7Klpb14tULolBwtFdflej1RHpFzacOJE3XRRR/xX+08+SXYTAW/xp6M
	zpm7xpEk5Md7FnEntq4XfUGV89GkUMsWCF/3TZPOLdq8mQASrZq5deD2b3ljN/u1H59mBKHZmAz
	+Bq9tinVR+SobdBvMb9iLRQJDTkWmTPxV3163bunGchj7BsARUS3y9DkWzRDyCg1nR77bjHfiXA
	UCiklF7kfIFhRqCOclPs+LNh50=
X-Received: by 2002:a05:6000:613:b0:439:c42f:10c4 with SMTP id ffacd0b85a97d-43b6423bc0bmr8892082f8f.15.1774048048767;
        Fri, 20 Mar 2026 16:07:28 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b6425eeb4sm9238332f8f.0.2026.03.20.16.07.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 16:07:28 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter 5/7] curl: patch CVE-2026-3783
Date: Sat, 21 Mar 2026 00:07:20 +0100
Message-ID: <9d82d72e16b803fb69d913195c28ca4d95d001fa.1774047909.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1774047909.git.yoann.congal@smile.fr>
References: <cover.1774047909.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Mar 2026 23:07:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233641

From: Peter Marko <peter.marko@siemens.com>

Pick patch from [1].

[1] https://curl.se/docs/CVE-2026-3783.html

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../curl/curl/CVE-2026-3783.patch             | 148 ++++++++++++++++++
 meta/recipes-support/curl/curl_8.17.0.bb      |   1 +
 2 files changed, 149 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-3783.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2026-3783.patch b/meta/recipes-support/curl/curl/CVE-2026-3783.patch
new file mode 100644
index 00000000000..11ffaa72de4
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2026-3783.patch
@@ -0,0 +1,148 @@
+From e3d7401a32a46516c9e5ee877e613e62ed35bddc Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Fri, 6 Mar 2026 23:13:07 +0100
+Subject: [PATCH] http: only send bearer if auth is allowed
+
+Verify with test 2006
+
+Closes #20843
+
+CVE: CVE-2026-3783
+Upstream-Status: Backport [https://github.com/curl/curl/commit/e3d7401a32a46516c9e5ee877e613e62ed35bddc]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ lib/http.c             |  1 +
+ tests/data/Makefile.am |  2 +-
+ tests/data/test2006    | 98 ++++++++++++++++++++++++++++++++++++++++++
+ 3 files changed, 100 insertions(+), 1 deletion(-)
+ create mode 100644 tests/data/test2006
+
+diff --git a/lib/http.c b/lib/http.c
+index d2f85fc5bf..d61edbd0cd 100644
+--- a/lib/http.c
++++ b/lib/http.c
+@@ -729,6 +729,7 @@ output_auth_headers(struct Curl_easy *data,
+   if(authstatus->picked == CURLAUTH_BEARER) {
+     /* Bearer */
+     if((!proxy && data->set.str[STRING_BEARER] &&
++        Curl_auth_allowed_to_host(data) &&
+         !Curl_checkheaders(data, STRCONST("Authorization")))) {
+       auth = "Bearer";
+       result = http_output_bearer(data);
+diff --git a/tests/data/Makefile.am b/tests/data/Makefile.am
+index f39568d3b8..6c8be18b32 100644
+--- a/tests/data/Makefile.am
++++ b/tests/data/Makefile.am
+@@ -242,7 +242,7 @@ test1955 test1956 test1957 test1958 test1959 test1960 test1964 \
+ test1970 test1971 test1972 test1973 test1974 test1975 test1976 test1977 \
+ test1978 test1979 test1980 test1981 \
+ \
+-test2000 test2001 test2002 test2003 test2004 test2005 \
++test2000 test2001 test2002 test2003 test2004 test2005 test2006 \
+ \
+                                                                test2023 \
+ test2024 test2025 test2026 test2027 test2028 test2029 test2030 test2031 \
+diff --git a/tests/data/test2006 b/tests/data/test2006
+new file mode 100644
+index 0000000000..200d30a7ce
+--- /dev/null
++++ b/tests/data/test2006
+@@ -0,0 +1,98 @@
++<?xml version="1.0" encoding="US-ASCII"?>
++<testcase>
++<info>
++<keywords>
++netrc
++HTTP
++</keywords>
++</info>
++# Server-side
++<reply>
++<data crlf="headers">
++HTTP/1.1 301 Follow this you fool
++Date: Tue, 09 Nov 2010 14:49:00 GMT
++Server: test-server/fake
++Last-Modified: Tue, 13 Jun 2000 12:10:00 GMT
++ETag: "21025-dc7-39462498"
++Accept-Ranges: bytes
++Content-Length: 6
++Connection: close
++Location: http://b.com/%TESTNUMBER0002
++
++-foo-
++</data>
++
++<data2 crlf="headers">
++HTTP/1.1 200 OK
++Date: Tue, 09 Nov 2010 14:49:00 GMT
++Server: test-server/fake
++Last-Modified: Tue, 13 Jun 2000 12:10:00 GMT
++ETag: "21025-dc7-39462498"
++Accept-Ranges: bytes
++Content-Length: 7
++Connection: close
++
++target
++</data2>
++
++<datacheck crlf="headers">
++HTTP/1.1 301 Follow this you fool
++Date: Tue, 09 Nov 2010 14:49:00 GMT
++Server: test-server/fake
++Last-Modified: Tue, 13 Jun 2000 12:10:00 GMT
++ETag: "21025-dc7-39462498"
++Accept-Ranges: bytes
++Content-Length: 6
++Connection: close
++Location: http://b.com/%TESTNUMBER0002
++
++HTTP/1.1 200 OK
++Date: Tue, 09 Nov 2010 14:49:00 GMT
++Server: test-server/fake
++Last-Modified: Tue, 13 Jun 2000 12:10:00 GMT
++ETag: "21025-dc7-39462498"
++Accept-Ranges: bytes
++Content-Length: 7
++Connection: close
++
++target
++</datacheck>
++</reply>
++
++# Client-side
++<client>
++<server>
++http
++</server>
++<features>
++proxy
++</features>
++<name>
++.netrc default with redirect plus oauth2-bearer
++</name>
++<command>
++--netrc --netrc-file %LOGDIR/netrc%TESTNUMBER --oauth2-bearer SECRET_TOKEN -L -x http://%HOSTIP:%HTTPPORT/ http://a.com/
++</command>
++<file name="%LOGDIR/netrc%TESTNUMBER" >
++default login testuser password testpass
++</file>
++</client>
++
++<verify>
++<protocol crlf="headers">
++GET http://a.com/ HTTP/1.1
++Host: a.com
++Authorization: Bearer SECRET_TOKEN
++User-Agent: curl/%VERSION
++Accept: */*
++Proxy-Connection: Keep-Alive
++
++GET http://b.com/%TESTNUMBER0002 HTTP/1.1
++Host: b.com
++User-Agent: curl/%VERSION
++Accept: */*
++Proxy-Connection: Keep-Alive
++
++</protocol>
++</verify>
++</testcase>
diff --git a/meta/recipes-support/curl/curl_8.17.0.bb b/meta/recipes-support/curl/curl_8.17.0.bb
index 06f4353134f..31d34c53909 100644
--- a/meta/recipes-support/curl/curl_8.17.0.bb
+++ b/meta/recipes-support/curl/curl_8.17.0.bb
@@ -22,6 +22,7 @@ SRC_URI = " \
     file://CVE-2025-15224.patch \
     file://CVE-2026-1965-01.patch \
     file://CVE-2026-1965-02.patch \
+    file://CVE-2026-3783.patch \
 "
 
 SRC_URI:append:class-nativesdk = " \

