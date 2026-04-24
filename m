Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F7FBFE5218
	for <webhook@archiver.kernel.org>; Fri, 24 Apr 2026 20:56:51 +0000 (UTC)
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.32573.1777064202600700732
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Apr 2026 13:56:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=KFuUdff9;
 spf=pass (domain: smile.fr, ip: 209.85.128.68, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f68.google.com with SMTP id 5b1f17b1804b1-488e1a8ac40so101192365e9.2
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Apr 2026 13:56:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1777064201; x=1777669001; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8YcwZ540DUifD4V6KsO5S8rGugtz37qMuR8sr2Em/PU=;
        b=KFuUdff9CjhHih6wH03T22dTOFTYNxDPaFO2VTuaBI3YJMGEglJCZxhDWicKJzQY7S
         SRA81JKLf8uzIc+c9QBo6OuOv6HbNLk02Ot29LZk2NnIA+lWfMpw8zawSkhbYvtAHH3E
         wQJlMgCF6MFsTdCGfOpij0chCtdcWxxL31PrA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777064201; x=1777669001;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8YcwZ540DUifD4V6KsO5S8rGugtz37qMuR8sr2Em/PU=;
        b=DDx0rSW/e2A/8H14MZli7CIKiUjcdlmInDEW+iqDS5MtydAEePFQmjzWxAoNNy/VlB
         7yf7I5sgdrt8MxVDVGhfH+RByHtLBewrHpYX2CI5aum++Ya6xZnKb1DgKI3Drwp+iGMo
         hbf+G0oy1N/uYJH89Qn+fa7A55CjuE6Ij+H+j4UE/OiggXRtigYLrF6HiPSup6N03qdf
         mxPYx2JyJJ0oswJDADUUUltpJ1sdjBcQsuB7IdPjLfCiMFcPesCMwY8SUdwCFgEl/4Ih
         1BTFabHMHJ8muexAZPdxh8EbkbX+DpWN06yaT/9vUf9axRSepyi4HYnVS/avDPBEn25e
         ef1A==
X-Gm-Message-State: AOJu0Ywliex6TgX8CRQrwf1T1fhHEegayPrlHP+ykqt39hbY069933UZ
	ITKfWAGKkesBhsnkOkNRTyaLy6fkUlqT+LxUf0SdXZdbQi+K4fX+1ePYUUkXAry8l/whQLDiXee
	4jFlC+ydxeShX
X-Gm-Gg: AeBDietEpXbVK1+/7JNnO9Cd732ivyDqik4/bTQhUxfcYGx9snReXed+7eVJNAOSiNy
	0gLZRSQDZBsflvi/ylKgu+g3G7+idvy/xTBqfFt5k3BBQikuyDvYFlp4jEqwVJqh5x+ODYR8eZm
	7J+dDsEXKUM7wazdrkomCcY0MpimOk0odcu/mLgBwbyWkNS3nzMvIWRvKg3QL9a+I3kuZ3HY94m
	+UDLVOz2Z4jaW9IffZdEvhhlWXi8wr/snzrzqpnigz2gWcqGmeQ1jeQSMrs5/5i5i7l7KxoytYh
	Tgwx442ny3bw2bP3Q7uCvVcs/BfqTg/b8kNt6MeV0a5AHMuz0Muk8D03FjTli7n3DsrsbzkHOZh
	IbOo+niZAYzkePFoVOEOgw4QsfzxJaWHVDMGKcRxyZsvp045e1te8vMN/V2aNTC86B0fJfEHxem
	61N9nOdmEmOcSBZmHbrqdqZsecaFUeg3MksEqIcN9+V4GJKRHbeCb83QCbRQHawHh+jMiH6mTxh
	HzHnXrvdFGtl5DseGPF4mUei7w2D2sGM7+uu5axipVs3gu2
X-Received: by 2002:a05:600c:c4ab:b0:487:1fb4:7e1 with SMTP id 5b1f17b1804b1-488fb7864c3mr475614255e9.22.1777064200734;
        Fri, 24 Apr 2026 13:56:40 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4891cca5743sm394841005e9.9.2026.04.24.13.56.40
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 13:56:40 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 05/66] curl: patch CVE-2026-3783
Date: Fri, 24 Apr 2026 22:55:04 +0200
Message-ID: <f09125ca033126260c3d66daaa04fffb0d1480f3.1777064068.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1777064068.git.yoann.congal@smile.fr>
References: <cover.1777064068.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Apr 2026 20:56:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235878

From: Vijay Anusuri <vanusuri@mvista.com>

pick patches from ubuntu per [1]

[1] http://archive.ubuntu.com/ubuntu/pool/main/c/curl/curl_8.5.0-2ubuntu10.8.debian.tar.xz
[2] https://ubuntu.com/security/CVE-2026-3783
[3] https://curl.se/docs/CVE-2026-3783.html

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../curl/curl/CVE-2026-3783.patch             | 153 ++++++++++++++++++
 meta/recipes-support/curl/curl_8.7.1.bb       |   1 +
 2 files changed, 154 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-3783.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2026-3783.patch b/meta/recipes-support/curl/curl/CVE-2026-3783.patch
new file mode 100644
index 00000000000..609b519ddb4
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2026-3783.patch
@@ -0,0 +1,153 @@
+From e3d7401a32a46516c9e5ee877e613e62ed35bddc Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Fri, 6 Mar 2026 23:13:07 +0100
+Subject: [PATCH] http: only send bearer if auth is allowed
+
+Verify with test 2006
+
+Closes #20843
+
+Upstream-Status: Backport [https://github.com/curl/curl/commit/e3d7401a32a46516c9e5ee877]
+Backported by Ubuntu team http://archive.ubuntu.com/ubuntu/pool/main/c/curl/curl_8.5.0-2ubuntu10.8.debian.tar.xz
+
+CVE: CVE-2026-3783
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ lib/http.c              |  1 +
+ tests/data/Makefile.inc |  2 +-
+ tests/data/test2006     | 98 +++++++++++++++++++++++++++++++++++++++++
+ 3 files changed, 100 insertions(+), 1 deletion(-)
+ create mode 100644 tests/data/test2006
+
+diff --git a/lib/http.c b/lib/http.c
+index a764d3c..b80bebf 100644
+--- a/lib/http.c
++++ b/lib/http.c
+@@ -673,6 +673,7 @@ output_auth_headers(struct Curl_easy *data,
+   if(authstatus->picked == CURLAUTH_BEARER) {
+     /* Bearer */
+     if((!proxy && data->set.str[STRING_BEARER] &&
++	Curl_auth_allowed_to_host(data) &&
+         !Curl_checkheaders(data, STRCONST("Authorization")))) {
+       auth = "Bearer";
+       result = http_output_bearer(data);
+diff --git a/tests/data/Makefile.inc b/tests/data/Makefile.inc
+index 4c2cd52..9fb9274 100644
+--- a/tests/data/Makefile.inc
++++ b/tests/data/Makefile.inc
+@@ -230,7 +230,7 @@ test1941 test1942 test1943 test1944 test1945 test1946 test1947 test1948 \
+ test1955 test1956 test1957 test1958 test1959 test1960 test1964 \
+ test1970 test1971 test1972 test1973 test1974 test1975 \
+ \
+-test2000 test2001 test2002 test2003 test2004 test2005 \
++test2000 test2001 test2002 test2003 test2004 test2005 test2006 \
+ \
+                                                                test2023 \
+ test2024 test2025 test2026 test2027 test2028 test2029 test2030 test2031 \
+diff --git a/tests/data/test2006 b/tests/data/test2006
+new file mode 100644
+index 0000000..4b8b269
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
++<data crlf="yes">
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
++<data2 crlf="yes">
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
++<datacheck crlf="yes">
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
++<protocol crlf="yes">
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
+-- 
+2.43.0
+
diff --git a/meta/recipes-support/curl/curl_8.7.1.bb b/meta/recipes-support/curl/curl_8.7.1.bb
index 0b4c93ec66c..ff4524e1bd1 100644
--- a/meta/recipes-support/curl/curl_8.7.1.bb
+++ b/meta/recipes-support/curl/curl_8.7.1.bb
@@ -34,6 +34,7 @@ SRC_URI = " \
     file://CVE-2025-15224.patch \
     file://CVE-2026-1965-1.patch \
     file://CVE-2026-1965-2.patch \
+    file://CVE-2026-3783.patch \
 "
 
 SRC_URI:append:class-nativesdk = " \

