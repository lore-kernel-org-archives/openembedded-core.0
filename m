Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55927C83F15
	for <webhook@archiver.kernel.org>; Wed,  9 Jul 2025 15:19:35 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web10.18423.1752074371356918601
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Jul 2025 08:19:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=vJoN3ipg;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.176, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-236470b2dceso587065ad.0
        for <openembedded-core@lists.openembedded.org>; Wed, 09 Jul 2025 08:19:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1752074370; x=1752679170; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DAIDXxsQdxSTbeqHkEos+zedWH9Uj4B04aiCdDoY2QU=;
        b=vJoN3ipgi6qHpPbnM9F9wGF1OjkkGf3QYldPzCA8McK8qNrO8cfmiVuz7WC8e1eqng
         w11kYm9t6TkIJpzMyl7U8esTCnn8b/M6qfHL3y8vnagqCo3upkV2cSrbgkwaCOX6SBrT
         Xs3dy0YVU88qZeCePEhvBJcQaPxjpPz/k7wbRc8/sBvr/cBiaakrcXfguMShl1km/eS5
         werVeolRVSSkKivhHtCLuhrEKLaQZcHzwv6O1aBgrTcwUvclj3axg8URaKY7u7psSLON
         Ki9isXlmoJHHQeQD1YaYHJsq2E3gejsM8Wr0ZDzH0BAE4tvkibANnwzPIrE6Sg2rpJbT
         1ruQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752074370; x=1752679170;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DAIDXxsQdxSTbeqHkEos+zedWH9Uj4B04aiCdDoY2QU=;
        b=p7HXyEPaqDoXV6DmieN3NM1Z9mDycUBGJDhnPcKBkaomvIuKNzlC5osRCL5glwSEVG
         xIJr9JT2PbEPhfPk3l0Zr8vw5a1AQCIq+XgQAbyL+6CVhj0CKthVFzOJB1tmh59vQiml
         c26TFIKVp0nir0XLn9zIqMQptiZ06IW23qutg4hZBH+VwUkiCb+EV00aq3shCfj06Mbh
         iyS1787HbWO/yG4znYM53GTy0+yZNBP4m5rqczHrbNA3xRcdv/Fmf2FIz43B2NM2pfo8
         YxCu14Y/63FOD0GR0P4Cd7vjjaGi17+el6O2oBhCkXYWX3Jx2oW9r0KvHDAOVSk6CkCd
         T55A==
X-Gm-Message-State: AOJu0Yz6FiDR0FDDmM35aWYSQtvKXTgrOArPhaca90421Yfa8fgVumZL
	VJcok6PrWNX27wK8qGhAML/68DKTXUaSiFu9deeDt5TSY+mwvrvdtvNosmrFxLXoQUS7YVACHBY
	WTmIJ
X-Gm-Gg: ASbGncvBZAqouOp31TerJ1tQtXnkZZiYNU2Ok+/CJqis9P7BxaWARTfpCoWuF2mglHa
	0bWUnxNNn57+n0eicud+ozUyTJrz+LFUWNBulNNy2ztqcY5RGnz8jOmdE4Y5t2uhgofwRAaLa88
	OFMQcKmV8yrLjHa6AmvJpWkIGqcJ/ZzwWDkK0wX21RoAxiz87iqW5RfNgIFsm4aqNRxpsLrmpHW
	DnoOdPkH1d8ltjwKSLYxoINeXEU0vYpaBxqXZXFGs2M6h/g/BFiHiiGrlqJ0R722vwNEY++1Q9q
	NKkOiK1ddbd5IMI43CHgCjMA72p9l1HV7ro5iNOjGKf5I4N8c+2gUOe8ojC53Q78
X-Google-Smtp-Source: AGHT+IEXfXJZbUBlcUJXAHqu/5rhouVFTYigqvPTrLko6hbAJ/UskuYlQhF7GKSDztHhw+GM4LyrHw==
X-Received: by 2002:a17:90b:2811:b0:311:a314:c2d1 with SMTP id 98e67ed59e1d1-31c2fd27addmr4236344a91.6.1752074369467;
        Wed, 09 Jul 2025 08:19:29 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:a6e1:d218:3fcc:fd7d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31c3019e934sm2340536a91.33.2025.07.09.08.19.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 08:19:29 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 06/11] curl: fix CVE-2024-11053
Date: Wed,  9 Jul 2025 08:19:09 -0700
Message-ID: <87823ff05a4f90b42c138902639a59231fa17def.1752073806.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1752073806.git.steve@sakoman.com>
References: <cover.1752073806.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Jul 2025 15:19:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220097

From: Yogita Urade <yogita.urade@windriver.com>

When asked to both use a `.netrc` file for credentials and to follow HTTP
redirects, curl could leak the password used for the first host to the
followed-to host under certain circumstances.

This flaw only manifests itself if the netrc file has an entry that matches
the redirect target hostname but the entry either omits just the password or
omits both login and password.

References:
https://nvd.nist.gov/vuln/detail/CVE-2024-11053
https://git.launchpad.net/ubuntu/+source/curl/diff/debian/patches/CVE-2024-11053-pre1.patch?id=2126676d86041cabd7b1aa302fc1fdf47989df95
https://git.launchpad.net/ubuntu/+source/curl/diff/debian/patches/CVE-2024-11053.patch?id=2126676d86041cabd7b1aa302fc1fdf47989df95

Upstream patch:
https://github.com/curl/curl/commit/9bee39bfed2c413b4cc4eb306a57ac92a1854907
https://github.com/curl/curl/commit/e9b9bbac22c26cf67316fa8e6c6b9e831af31949

Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../curl/curl/CVE-2024-11053-0001.patch       | 340 ++++++++
 .../curl/curl/CVE-2024-11053-0002.patch       | 746 ++++++++++++++++++
 meta/recipes-support/curl/curl_7.82.0.bb      |   2 +
 3 files changed, 1088 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2024-11053-0001.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2024-11053-0002.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2024-11053-0001.patch b/meta/recipes-support/curl/curl/CVE-2024-11053-0001.patch
new file mode 100644
index 0000000000..86ca27a694
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2024-11053-0001.patch
@@ -0,0 +1,340 @@
+From 9bee39bfed2c413b4cc4eb306a57ac92a1854907 Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Sat, 12 Oct 2024 23:54:39 +0200
+Subject: [PATCH]  url: use same credentials on redirect
+
+Previously it could lose the username and only use the password.
+
+Added test 998 and 999 to verify.
+
+Reported-by: Tobias Bora
+Fixes #15262
+Closes #15282
+
+CVE: CVE-2024-11053
+Upstream-Status: Backport [https://github.com/curl/curl/commit/9bee39bfed2c413b4cc4eb306a57ac92a1854907]
+
+Changes:
+- Refresh patch context.
+- Small change in the Makefile to add a new test.
+
+Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
+---
+ lib/transfer.c          |  3 ++
+ lib/url.c               | 18 ++++----
+ lib/urldata.h           |  8 ++++
+ tests/data/Makefile.inc |  2 +-
+ tests/data/test998      | 92 +++++++++++++++++++++++++++++++++++++++++
+ tests/data/test999      | 81 ++++++++++++++++++++++++++++++++++++
+ 6 files changed, 194 insertions(+), 10 deletions(-)
+ create mode 100644 tests/data/test998
+ create mode 100644 tests/data/test999
+
+diff --git a/lib/transfer.c b/lib/transfer.c
+index d567c4b..cd7365b 100644
+--- a/lib/transfer.c
++++ b/lib/transfer.c
+@@ -1479,6 +1479,9 @@ CURLcode Curl_pretransfer(struct Curl_easy *data)
+       return CURLE_OUT_OF_MEMORY;
+   }
+
++  if(data->set.str[STRING_USERNAME] ||
++     data->set.str[STRING_PASSWORD])
++    data->state.creds_from = CREDS_OPTION;
+   if(!result)
+     result = Curl_setstropt(&data->state.aptr.user,
+                             data->set.str[STRING_USERNAME]);
+diff --git a/lib/url.c b/lib/url.c
+index 9406cca..99d1082 100644
+--- a/lib/url.c
++++ b/lib/url.c
+@@ -2098,10 +2098,10 @@ static CURLcode parseurlandfillconn(struct Curl_easy *data,
+     return result;
+
+   /*
+-   * User name and password set with their own options override the
+-   * credentials possibly set in the URL.
++   * username and password set with their own options override the credentials
++   * possibly set in the URL, but netrc does not.
+    */
+-  if(!data->state.aptr.passwd) {
++  if(!data->state.aptr.passwd || (data->state.creds_from != CREDS_OPTION)) {
+     uc = curl_url_get(uh, CURLUPART_PASSWORD, &data->state.up.password, 0);
+     if(!uc) {
+       char *decoded;
+@@ -2112,6 +2112,7 @@ static CURLcode parseurlandfillconn(struct Curl_easy *data,
+         return result;
+       conn->passwd = decoded;
+       result = Curl_setstropt(&data->state.aptr.passwd, decoded);
++      data->state.creds_from = CREDS_URL;
+       if(result)
+         return result;
+     }
+@@ -2119,7 +2120,7 @@ static CURLcode parseurlandfillconn(struct Curl_easy *data,
+       return Curl_uc_to_curlcode(uc);
+   }
+
+-  if(!data->state.aptr.user) {
++  if(!data->state.aptr.user || (data->state.creds_from != CREDS_OPTION)) {
+     /* we don't use the URL API's URL decoder option here since it rejects
+        control codes and we want to allow them for some schemes in the user
+        and password fields */
+@@ -2133,13 +2134,10 @@ static CURLcode parseurlandfillconn(struct Curl_easy *data,
+         return result;
+       conn->user = decoded;
+       result = Curl_setstropt(&data->state.aptr.user, decoded);
++      data->state.creds_from = CREDS_URL;
+     }
+     else if(uc != CURLUE_NO_USER)
+       return Curl_uc_to_curlcode(uc);
+-    else if(data->state.aptr.passwd) {
+-      /* no user was set but a password, set a blank user */
+-      result = Curl_setstropt(&data->state.aptr.user, "");
+-    }
+     if(result)
+       return result;
+   }
+@@ -3032,7 +3030,8 @@ static CURLcode override_login(struct Curl_easy *data,
+       if(result)
+         return result;
+     }
+-    if(data->state.aptr.user) {
++    if(data->state.aptr.user &&
++       (data->state.creds_from != CREDS_NETRC)) {
+       uc = curl_url_set(data->state.uh, CURLUPART_USER, data->state.aptr.user,
+                         CURLU_URLENCODE);
+       if(uc)
+@@ -3048,6 +3047,7 @@ static CURLcode override_login(struct Curl_easy *data,
+     CURLcode result = Curl_setstropt(&data->state.aptr.passwd, *passwdp);
+     if(result)
+       return result;
++    data->state.creds_from = CREDS_NETRC;
+   }
+   if(data->state.aptr.passwd) {
+     uc = curl_url_set(data->state.uh, CURLUPART_PASSWORD,
+diff --git a/lib/urldata.h b/lib/urldata.h
+index e78a7e8..d252e73 100644
+--- a/lib/urldata.h
++++ b/lib/urldata.h
+@@ -1324,6 +1324,11 @@ struct urlpieces {
+   char *query;
+ };
+
++#define CREDS_NONE   0
++#define CREDS_URL    1 /* from URL */
++#define CREDS_OPTION 2 /* set with a CURLOPT_ */
++#define CREDS_NETRC  3 /* found in netrc */
++
+ struct UrlState {
+   /* Points to the connection cache */
+   struct conncache *conn_cache;
+@@ -1454,6 +1459,9 @@ struct UrlState {
+     char *proxypasswd;
+   } aptr;
+
++  unsigned int creds_from:2; /* where is the server credentials originating
++                                from, see the CREDS_* defines above */
++
+ #ifdef CURLDEBUG
+   BIT(conncache_lock);
+ #endif
+diff --git a/tests/data/Makefile.inc b/tests/data/Makefile.inc
+index 5415f37..00cdfb8 100644
+--- a/tests/data/Makefile.inc
++++ b/tests/data/Makefile.inc
+@@ -123,7 +123,7 @@ test954 test955 test956 test957 test958 test959 test960 test961 test962 \
+ test963 test964 test965 test966 test967 test968 test969 test970 test971 \
+ test972 \
+ \
+-test980 test981 test982 test983 test984 test985 test986 \
++test980 test981 test982 test983 test984 test985 test986 test998 test999 \
+ \
+ test1000 test1001 test1002 test1003 test1004 test1005 test1006 test1007 \
+ test1008 test1009 test1010 test1011 test1012 test1013 test1014 test1015 \
+diff --git a/tests/data/test998 b/tests/data/test998
+new file mode 100644
+index 0000000..6dcd95f
+--- /dev/null
++++ b/tests/data/test998
+@@ -0,0 +1,92 @@
++<testcase>
++<info>
++<keywords>
++HTTP
++--location-trusted
++</keywords>
++</info>
++
++#
++# Server-side
++<reply>
++<data>
++HTTP/1.1 301 redirect
++Date: Tue, 09 Nov 2010 14:49:00 GMT
++Server: test-server/fake
++Content-Length: 0
++Connection: close
++Content-Type: text/html
++Location: http://somewhere.else.example/a/path/%TESTNUMBER0002
++
++</data>
++<data2>
++HTTP/1.1 200 OK
++Date: Tue, 09 Nov 2010 14:49:00 GMT
++Content-Length: 6
++Content-Type: text/html
++Funny-head: yesyes
++
++-foo-
++</data2>
++
++<datacheck>
++HTTP/1.1 301 redirect
++Date: Tue, 09 Nov 2010 14:49:00 GMT
++Server: test-server/fake
++Content-Length: 0
++Connection: close
++Content-Type: text/html
++Location: http://somewhere.else.example/a/path/%TESTNUMBER0002
++
++HTTP/1.1 200 OK
++Date: Tue, 09 Nov 2010 14:49:00 GMT
++Content-Length: 6
++Content-Type: text/html
++Funny-head: yesyes
++
++-foo-
++</datacheck>
++
++</reply>
++
++#
++# Client-side
++<client>
++<features>
++proxy
++</features>
++<server>
++http
++</server>
++<name>
++HTTP with auth in URL redirected to another host
++</name>
++<command>
++-x %HOSTIP:%HTTPPORT http://alberto:einstein@somwhere.example/%TESTNUMBER --location-trusted
++</command>
++</client>
++
++#
++# Verify data after the test has been "shot"
++<verify>
++<strip>
++QUIT
++</strip>
++<protocol>
++GET http://somwhere.example/998 HTTP/1.1
++Host: somwhere.example
++Authorization: Basic YWxiZXJ0bzplaW5zdGVpbg==
++User-Agent: curl/%VERSION
++Accept: */*
++Proxy-Connection: Keep-Alive
++
++GET http://somewhere.else.example/a/path/9980002 HTTP/1.1
++Host: somewhere.else.example
++Authorization: Basic YWxiZXJ0bzplaW5zdGVpbg==
++User-Agent: curl/%VERSION
++Accept: */*
++Proxy-Connection: Keep-Alive
++
++</protocol>
++</verify>
++</testcase>
+diff --git a/tests/data/test999 b/tests/data/test999
+new file mode 100644
+index 0000000..e805cde
+--- /dev/null
++++ b/tests/data/test999
+@@ -0,0 +1,81 @@
++<testcase>
++<info>
++<keywords>
++HTTP
++--location-trusted
++</keywords>
++</info>
++
++#
++# Server-side
++<reply>
++<data nocheck="yes">
++HTTP/1.1 200 OK
++Date: Tue, 09 Nov 2010 14:49:00 GMT
++Content-Length: 6
++Content-Type: text/html
++Funny-head: yesyes
++
++-foo-
++</data>
++
++<datacheck>
++HTTP/1.1 301 redirect
++Date: Tue, 09 Nov 2010 14:49:00 GMT
++Server: test-server/fake
++Content-Length: 0
++Connection: close
++Content-Type: text/html
++Location: http://somewhere.else.example/a/path/%TESTNUMBER0002
++
++HTTP/1.1 200 OK
++Date: Tue, 09 Nov 2010 14:49:00 GMT
++Content-Length: 6
++Content-Type: text/html
++Funny-head: yesyes
++
++-foo-
++</datacheck>
++
++</reply>
++
++#
++# Client-side
++<client>
++<features>
++proxy
++</features>
++<server>
++http
++</server>
++<name>
++HTTP with auth in first URL but not second
++</name>
++<command>
++-x %HOSTIP:%HTTPPORT http://alberto:einstein@somwhere.example/%TESTNUMBER http://somewhere.else.example/%TESTNUMBER
++</command>
++</client>
++
++#
++# Verify data after the test has been "shot"
++<verify>
++<strip>
++QUIT
++</strip>
++<protocol>
++GET http://somwhere.example/%TESTNUMBER HTTP/1.1
++Host: somwhere.example
++Authorization: Basic YWxiZXJ0bzplaW5zdGVpbg==
++User-Agent: curl/%VERSION
++Accept: */*
++Proxy-Connection: Keep-Alive
++
++GET http://somewhere.else.example/%TESTNUMBER HTTP/1.1
++Host: somewhere.else.example
++User-Agent: curl/%VERSION
++Accept: */*
++Proxy-Connection: Keep-Alive
++
++</protocol>
++</verify>
++</testcase>
+--
+2.40.0
diff --git a/meta/recipes-support/curl/curl/CVE-2024-11053-0002.patch b/meta/recipes-support/curl/curl/CVE-2024-11053-0002.patch
new file mode 100644
index 0000000000..5db0499987
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2024-11053-0002.patch
@@ -0,0 +1,746 @@
+From e9b9bbac22c26cf67316fa8e6c6b9e831af31949 Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Fri, 15 Nov 2024 11:06:36 +0100
+Subject: [PATCH] netrc: address several netrc parser flaws
+
+- make sure that a match that returns a username also returns a
+  password, that should be blank if no password is found
+
+- fix handling of multiple logins for same host where the password/login
+  order might be reversed.
+
+- reject credentials provided in the .netrc if they contain ASCII control
+  codes - if the used protocol does not support such (like HTTP and WS do)
+
+Reported-by: Harry Sintonen
+
+Add test 478, 479 and 480 to verify. Updated unit 1304.
+
+Closes #15586
+
+Changes:
+- Refresh patch context.
+- Adjust `%LOGDIR/` to 'log/' due to its absence in code.
+- Replaces the previous usage of the state_login, state_password, and
+  state_our_login variables with the found_state enum, which includes the
+  values NONE, LOGIN, and PASSWORD. As a result, all conditionals and memory
+  management logic associated with these variables were updated.
+- Updates to use password and login instead of s_password and s_login,
+  which do not exist in the current version. This change preserves the
+  same logic while adapting the code to the current structure.
+- test478 is disabled as this version of curl does not support searching
+  for a specific login in the netrc file.
+  (see https://github.com/curl/curl/issues/8241)
+- test480 is disabled as this version of curl does not support quoted or
+  escaped strings in the netrc file.
+  (see https://github.com/curl/curl/issues/8908)
+- Small change in the Makefile to add a new test
+
+CVE: CVE-2024-11053
+Upstream-Status: Backport [https://github.com/curl/curl/commit/e9b9bbac22c26cf67316fa8e6c6b9e831af31949]
+
+Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
+---
+ lib/netrc.c             | 121 ++++++++++++++++++++++------------------
+ lib/url.c               |  53 ++++++++++++------
+ tests/data/DISABLED     |   3 +
+ tests/data/Makefile.inc |   2 +-
+ tests/data/test478      |  73 ++++++++++++++++++++++++
+ tests/data/test479      | 107 +++++++++++++++++++++++++++++++++++
+ tests/data/test480      |  38 +++++++++++++
+ tests/unit/unit1304.c   |  81 +++++++--------------------
+ 8 files changed, 348 insertions(+), 130 deletions(-)
+ create mode 100644 tests/data/test478
+ create mode 100644 tests/data/test479
+ create mode 100644 tests/data/test480
+
+diff --git a/lib/netrc.c b/lib/netrc.c
+index b771b60..23080b3 100644
+--- a/lib/netrc.c
++++ b/lib/netrc.c
+@@ -46,6 +46,15 @@ enum host_lookup_state {
+   MACDEF
+ };
+
++enum found_state {
++  NONE,
++  LOGIN,
++  PASSWORD
++};
++
++#define FOUND_LOGIN    1
++#define FOUND_PASSWORD 2
++
+ #define NETRC_FILE_MISSING 1
+ #define NETRC_FAILED -1
+ #define NETRC_SUCCESS 0
+@@ -54,7 +63,7 @@ enum host_lookup_state {
+  * Returns zero on success.
+  */
+ static int parsenetrc(const char *host,
+-                      char **loginp,
++                      char **loginp, /* might point to a username */
+                       char **passwordp,
+                       bool *login_changed,
+                       bool *password_changed,
+@@ -63,16 +72,14 @@ static int parsenetrc(const char *host,
+   FILE *file;
+   int retcode = NETRC_FILE_MISSING;
+   char *login = *loginp;
+-  char *password = *passwordp;
+-  bool specific_login = (login && *login != 0);
+-  bool login_alloc = FALSE;
+-  bool password_alloc = FALSE;
++  char *password = NULL;
++  bool specific_login = login; /* points to something */
+   enum host_lookup_state state = NOTHING;
+
+-  char state_login = 0;      /* Found a login keyword */
+-  char state_password = 0;   /* Found a password keyword */
+-  int state_our_login = FALSE;  /* With specific_login, found *our* login
+-                                   name */
++  enum found_state keyword = NONE;
++  unsigned char found = 0; /* login + password found bits, as they can come in
++                              any order */
++  bool our_login = FALSE;  /* found our login name */
+
+   DEBUGASSERT(netrcfile);
+
+@@ -95,11 +102,7 @@ static int parsenetrc(const char *host,
+       if(tok && *tok == '#')
+         /* treat an initial hash as a comment line */
+         continue;
+-      while(tok) {
+-        if((login && *login) && (password && *password)) {
+-          done = TRUE;
+-          break;
+-        }
++      while(tok && !done) {
+
+         switch(state) {
+         case NOTHING:
+@@ -115,6 +118,12 @@ static int parsenetrc(const char *host,
+                after this we need to search for 'login' and
+                'password'. */
+             state = HOSTFOUND;
++            keyword = NONE;
++            found = 0;
++            our_login = FALSE;
++            Curl_safefree(password);
++            if(!specific_login)
++              Curl_safefree(login);
+           }
+           else if(strcasecompare("default", tok)) {
+             state = HOSTVALID;
+@@ -138,48 +147,55 @@ static int parsenetrc(const char *host,
+           break;
+         case HOSTVALID:
+           /* we are now parsing sub-keywords concerning "our" host */
+-          if(state_login) {
++          if(keyword == LOGIN) {
+             if(specific_login) {
+-              state_our_login = !Curl_timestrcmp(login, tok);
++              our_login = !Curl_timestrcmp(login, tok);
+             }
+-            else if(!login || Curl_timestrcmp(login, tok)) {
+-              if(login_alloc) {
+-                free(login);
+-                login_alloc = FALSE;
+-              }
++            else {
++              our_login = TRUE;
++              free(login);
+               login = strdup(tok);
+               if(!login) {
+                 retcode = NETRC_FAILED; /* allocation failed */
+                 goto out;
+               }
+-              login_alloc = TRUE;
+             }
+-            state_login = 0;
++          found |= FOUND_LOGIN;
++          keyword = NONE;
+           }
+-          else if(state_password) {
+-            if((state_our_login || !specific_login)
+-               && (!password || Curl_timestrcmp(password, tok))) {
+-              if(password_alloc) {
+-                free(password);
+-                password_alloc = FALSE;
+-              }
+-              password = strdup(tok);
+-              if(!password) {
+-                retcode = NETRC_FAILED; /* allocation failed */
+-                goto out;
+-              }
+-              password_alloc = TRUE;
++          else if(keyword == PASSWORD) {
++            free(password);
++            password = strdup(tok);
++            if(!password) {
++              retcode = NETRC_FAILED; /* allocation failed */
++              goto out;
+             }
+-            state_password = 0;
++          found |= FOUND_PASSWORD;
++          keyword = NONE;
+           }
+           else if(strcasecompare("login", tok))
+-            state_login = 1;
++            keyword = LOGIN;
+           else if(strcasecompare("password", tok))
+-            state_password = 1;
++            keyword = PASSWORD;
+           else if(strcasecompare("machine", tok)) {
+-            /* ok, there's machine here go => */
++            /* a new machine here */
+             state = HOSTFOUND;
+-            state_our_login = FALSE;
++            keyword = NONE;
++            found = 0;
++            Curl_safefree(password);
++            if(!specific_login)
++              Curl_safefree(login);
++          }
++          else if(strcasecompare("default", tok)) {
++            state = HOSTVALID;
++            retcode = NETRC_SUCCESS; /* we did find our host */
++            Curl_safefree(password);
++            if(!specific_login)
++              Curl_safefree(login);
++          }
++          if((found == (FOUND_PASSWORD|FOUND_LOGIN)) && our_login) {
++            done = TRUE;
++            break;
+           }
+           break;
+         } /* switch (state) */
+@@ -189,28 +205,27 @@ static int parsenetrc(const char *host,
+     } /* while fgets() */
+
+     out:
++    if(!retcode && !password && our_login) {
++      /* success without a password, set a blank one */
++      password = strdup("");
++      if(!password)
++        retcode = 1; /* out of memory */
++    }
+     if(!retcode) {
+       /* success */
+       *login_changed = FALSE;
+       *password_changed = FALSE;
+-      if(login_alloc) {
+-        if(*loginp)
+-          free(*loginp);
++      if(!specific_login) {
+         *loginp = login;
+         *login_changed = TRUE;
+       }
+-      if(password_alloc) {
+-        if(*passwordp)
+-          free(*passwordp);
+-        *passwordp = password;
+-        *password_changed = TRUE;
+-      }
++      *passwordp = password;
++      *password_changed = TRUE;
+     }
+     else {
+-      if(login_alloc)
++      if(!specific_login)
+         free(login);
+-      if(password_alloc)
+-        free(password);
++      free(password);
+     }
+     fclose(file);
+   }
+diff --git a/lib/url.c b/lib/url.c
+index 99d1082..48835c9 100644
+--- a/lib/url.c
++++ b/lib/url.c
+@@ -2954,6 +2954,17 @@ static CURLcode parse_remote_port(struct Curl_easy *data,
+   return CURLE_OK;
+ }
+
++static bool str_has_ctrl(const char *input)
++{
++  const unsigned char *str = (const unsigned char *)input;
++  while(*str) {
++    if(*str < 0x20)
++      return TRUE;
++    str++;
++  }
++  return FALSE;
++}
++
+ /*
+  * Override the login details from the URL with that in the CURLOPT_USERPWD
+  * option or a .netrc file, if applicable.
+@@ -2995,22 +3006,32 @@ static CURLcode override_login(struct Curl_easy *data,
+       url_provided = TRUE;
+     }
+
+-    ret = Curl_parsenetrc(conn->host.name,
+-                          userp, passwdp,
+-                          &netrc_user_changed, &netrc_passwd_changed,
+-                          data->set.str[STRING_NETRC_FILE]);
+-    if(ret > 0) {
+-      infof(data, "Couldn't find host %s in the %s file; using defaults",
+-            conn->host.name, data->set.str[STRING_NETRC_FILE]);
+-    }
+-    else if(ret < 0) {
+-      return CURLE_OUT_OF_MEMORY;
+-    }
+-    else {
+-      /* set bits.netrc TRUE to remember that we got the name from a .netrc
+-         file, so that it is safe to use even if we followed a Location: to a
+-         different host or similar. */
+-      conn->bits.netrc = TRUE;
++    if(!*passwdp) {
++      ret = Curl_parsenetrc(conn->host.name,
++                            userp, passwdp,
++                            &netrc_user_changed, &netrc_passwd_changed,
++                            data->set.str[STRING_NETRC_FILE]);
++      if(ret > 0) {
++        infof(data, "Couldn't find host %s in the %s file; using defaults",
++              conn->host.name, data->set.str[STRING_NETRC_FILE]);
++      }
++      else if(ret < 0) {
++        return CURLE_OUT_OF_MEMORY;
++      }
++      else {
++        if(!(conn->handler->flags&PROTOPT_USERPWDCTRL)) {
++          /* if the protocol can't handle control codes in credentials, make
++             sure there are none */
++          if(str_has_ctrl(*userp) || str_has_ctrl(*passwdp)) {
++            failf(data, "control code detected in .netrc credentials");
++            return CURLE_READ_ERROR;
++          }
++        }
++        /* set bits.netrc TRUE to remember that we got the name from a .netrc
++           file, so that it is safe to use even if we followed a Location: to a
++           different host or similar. */
++        conn->bits.netrc = TRUE;
++      }
+     }
+     if(url_provided) {
+       Curl_safefree(conn->user);
+diff --git a/tests/data/DISABLED b/tests/data/DISABLED
+index 7187ec3..4434c41 100644
+--- a/tests/data/DISABLED
++++ b/tests/data/DISABLED
+@@ -85,3 +85,6 @@
+ %if wolfssl
+ 313
+ %endif
++# 478 and 480 are backported and do not work with this version of curl
++478
++480
+diff --git a/tests/data/Makefile.inc b/tests/data/Makefile.inc
+index 00cdfb8..ad41a5e 100644
+--- a/tests/data/Makefile.inc
++++ b/tests/data/Makefile.inc
+@@ -73,7 +73,7 @@ test418 \
+ \
+ test430 test431 test432 test433 test434 test435 test436 \
+ \
+-test446 \
++test446 test478 test479 test480 \
+ test490 test491 test492 test493 test494 \
+ \
+ test500 test501 test502 test503 test504 test505 test506 test507 test508 \
+diff --git a/tests/data/test478 b/tests/data/test478
+new file mode 100644
+index 0000000..c356ef5
+--- /dev/null
++++ b/tests/data/test478
+@@ -0,0 +1,73 @@
++<testcase>
++<info>
++<keywords>
++netrc
++HTTP
++</keywords>
++</info>
++#
++# Server-side
++<reply>
++<data crlf="yes">
++HTTP/1.1 200 OK
++Date: Tue, 09 Nov 2010 14:49:00 GMT
++Server: test-server/fake
++Last-Modified: Tue, 13 Jun 2000 12:10:00 GMT
++ETag: "21025-dc7-39462498"
++Accept-Ranges: bytes
++Content-Length: 6
++Connection: close
++Content-Type: text/html
++Funny-head: yesyes
++
++-foo-
++</data>
++</reply>
++
++#
++# Client-side
++<client>
++<server>
++http
++</server>
++<features>
++proxy
++</features>
++<name>
++.netrc with multiple accounts for same host
++</name>
++<command>
++--netrc --netrc-file log/netrc%TESTNUMBER -x http://%HOSTIP:%HTTPPORT/ http://debbie@github.com/
++</command>
++<file name="log/netrc%TESTNUMBER" >
++
++machine github.com
++password weird
++password firstone
++login daniel
++
++machine github.com
++
++machine github.com
++login debbie
++
++machine github.com
++password weird
++password "second\r"
++login debbie
++
++</file>
++</client>
++
++<verify>
++<protocol>
++GET http://github.com/ HTTP/1.1
++Host: github.com
++Authorization: Basic %b64[debbie:second%0D]b64%
++User-Agent: curl/%VERSION
++Accept: */*
++Proxy-Connection: Keep-Alive
++
++</protocol>
++</verify>
++</testcase>
+diff --git a/tests/data/test479 b/tests/data/test479
+new file mode 100644
+index 0000000..8d67fdf
+--- /dev/null
++++ b/tests/data/test479
+@@ -0,0 +1,107 @@
++<testcase>
++<info>
++<keywords>
++netrc
++HTTP
++</keywords>
++</info>
++#
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
++#
++# Client-side
++<client>
++<server>
++http
++</server>
++<features>
++proxy
++</features>
++<name>
++.netrc with redirect and default without password
++</name>
++<command>
++--netrc --netrc-file log/netrc%TESTNUMBER -L -x http://%HOSTIP:%HTTPPORT/ http://a.com/
++</command>
++<file name="log/netrc%TESTNUMBER" >
++
++machine a.com
++  login alice
++  password alicespassword
++
++default
++  login bob
++
++</file>
++</client>
++
++<verify>
++<protocol>
++GET http://a.com/ HTTP/1.1
++Host: a.com
++Authorization: Basic %b64[alice:alicespassword]b64%
++User-Agent: curl/%VERSION
++Accept: */*
++Proxy-Connection: Keep-Alive
++
++GET http://b.com/%TESTNUMBER0002 HTTP/1.1
++Host: b.com
++Authorization: Basic %b64[bob:]b64%
++User-Agent: curl/%VERSION
++Accept: */*
++Proxy-Connection: Keep-Alive
++
++</protocol>
++</verify>
++</testcase>
+diff --git a/tests/data/test480 b/tests/data/test480
+new file mode 100644
+index 0000000..f097f81
+--- /dev/null
++++ b/tests/data/test480
+@@ -0,0 +1,38 @@
++<testcase>
++<info>
++<keywords>
++netrc
++pop3
++</keywords>
++</info>
++#
++# Server-side
++<reply>
++
++</reply>
++
++#
++# Client-side
++<client>
++<server>
++pop3
++</server>
++<name>
++Reject .netrc with credentials using CRLF for POP3
++</name>
++<command>
++--netrc --netrc-file log/netrc%TESTNUMBER pop3://%HOSTIP:%POP3PORT/%TESTNUMBER
++</command>
++<file name="log/netrc%TESTNUMBER" >
++machine %HOSTIP
++  login alice
++  password "password\r\ncommand"
++</file>
++</client>
++
++<verify>
++<errorcode>
++26
++</errorcode>
++</verify>
++</testcase>
+diff --git a/tests/unit/unit1304.c b/tests/unit/unit1304.c
+index a6dc64d..d2dba14 100644
+--- a/tests/unit/unit1304.c
++++ b/tests/unit/unit1304.c
+@@ -29,13 +29,8 @@ static char filename[64];
+
+ static CURLcode unit_setup(void)
+ {
+-  password = strdup("");
+-  login = strdup("");
+-  if(!password || !login) {
+-    Curl_safefree(password);
+-    Curl_safefree(login);
+-    return CURLE_OUT_OF_MEMORY;
+-  }
++  password = NULL;
++  login = NULL;
+   return CURLE_OK;
+ }
+
+@@ -59,86 +54,52 @@ UNITTEST_START
+   result = Curl_parsenetrc("test.example.com", &login, &password,
+              &login_changed, &password_changed, filename);
+   fail_unless(result == 1, "Host not found should return 1");
+-  abort_unless(password != NULL, "returned NULL!");
+-  fail_unless(password[0] == 0, "password should not have been changed");
+-  abort_unless(login != NULL, "returned NULL!");
+-  fail_unless(login[0] == 0, "login should not have been changed");
++  abort_unless(password == NULL, "password did not return NULL!");
++  abort_unless(login == NULL, "user did not return NULL!");
+
+   /*
+    * Test a non existent login in our netrc file.
+    */
+-  free(login);
+-  login = strdup("me");
+-  abort_unless(login != NULL, "returned NULL!");
++  login = (char *)"me";
+   result = Curl_parsenetrc("example.com", &login, &password,
+              &login_changed, &password_changed, filename);
+   fail_unless(result == 0, "Host should have been found");
+-  abort_unless(password != NULL, "returned NULL!");
+-  fail_unless(password[0] == 0, "password should not have been changed");
+-  fail_unless(!password_changed, "password should not have been changed");
+-  abort_unless(login != NULL, "returned NULL!");
+-  fail_unless(strncmp(login, "me", 2) == 0,
+-              "login should not have been changed");
+-  fail_unless(!login_changed, "login should not have been changed");
++  abort_unless(password == NULL, "password is not NULL!");
+
+   /*
+    * Test a non existent login and host in our netrc file.
+    */
+-  free(login);
+-  login = strdup("me");
+-  abort_unless(login != NULL, "returned NULL!");
++  login = (char *)"me";
+   result = Curl_parsenetrc("test.example.com", &login, &password,
+              &login_changed, &password_changed, filename);
+   fail_unless(result == 1, "Host not found should return 1");
+-  abort_unless(password != NULL, "returned NULL!");
+-  fail_unless(password[0] == 0, "password should not have been changed");
+-  abort_unless(login != NULL, "returned NULL!");
+-  fail_unless(strncmp(login, "me", 2) == 0,
+-              "login should not have been changed");
++  abort_unless(password == NULL, "password is not NULL!");
+
+   /*
+    * Test a non existent login (substring of an existing one) in our
+    * netrc file.
+    */
+-  free(login);
+-  login = strdup("admi");
+-  abort_unless(login != NULL, "returned NULL!");
++  login = (char *)"admi";
+   result = Curl_parsenetrc("example.com", &login, &password,
+              &login_changed, &password_changed, filename);
+   fail_unless(result == 0, "Host should have been found");
+-  abort_unless(password != NULL, "returned NULL!");
+-  fail_unless(password[0] == 0, "password should not have been changed");
+-  fail_unless(!password_changed, "password should not have been changed");
+-  abort_unless(login != NULL, "returned NULL!");
+-  fail_unless(strncmp(login, "admi", 4) == 0,
+-              "login should not have been changed");
+-  fail_unless(!login_changed, "login should not have been changed");
++  abort_unless(password == NULL, "password is not NULL!");
+
+   /*
+    * Test a non existent login (superstring of an existing one)
+    * in our netrc file.
+    */
+-  free(login);
+-  login = strdup("adminn");
+-  abort_unless(login != NULL, "returned NULL!");
++  login = (char *)"adminn";
+   result = Curl_parsenetrc("example.com", &login, &password,
+              &login_changed, &password_changed, filename);
+   fail_unless(result == 0, "Host should have been found");
+-  abort_unless(password != NULL, "returned NULL!");
+-  fail_unless(password[0] == 0, "password should not have been changed");
+-  fail_unless(!password_changed, "password should not have been changed");
+-  abort_unless(login != NULL, "returned NULL!");
+-  fail_unless(strncmp(login, "adminn", 6) == 0,
+-              "login should not have been changed");
+-  fail_unless(!login_changed, "login should not have been changed");
++  abort_unless(password == NULL, "password is not NULL!");
+
+   /*
+    * Test for the first existing host in our netrc file
+    * with login[0] = 0.
+    */
+-  free(login);
+-  login = strdup("");
+-  abort_unless(login != NULL, "returned NULL!");
++  login = NULL;
+   result = Curl_parsenetrc("example.com", &login, &password,
+              &login_changed, &password_changed, filename);
+   fail_unless(result == 0, "Host should have been found");
+@@ -155,8 +116,9 @@ UNITTEST_START
+    * with login[0] != 0.
+    */
+   free(password);
+-  password = strdup("");
+-  abort_unless(password != NULL, "returned NULL!");
++  free(login);
++  password = NULL;
++  login = NULL;
+   result = Curl_parsenetrc("example.com", &login, &password,
+              &login_changed, &password_changed, filename);
+   fail_unless(result == 0, "Host should have been found");
+@@ -173,11 +135,9 @@ UNITTEST_START
+    * with login[0] = 0.
+    */
+   free(password);
+-  password = strdup("");
+-  abort_unless(password != NULL, "returned NULL!");
++  password = NULL;
+   free(login);
+-  login = strdup("");
+-  abort_unless(login != NULL, "returned NULL!");
++  login = NULL;
+   result = Curl_parsenetrc("curl.example.com", &login, &password,
+              &login_changed, &password_changed, filename);
+   fail_unless(result == 0, "Host should have been found");
+@@ -194,8 +154,9 @@ UNITTEST_START
+    * with login[0] != 0.
+    */
+   free(password);
+-  password = strdup("");
+-  abort_unless(password != NULL, "returned NULL!");
++  free(login);
++  password = NULL;
++  login = NULL;
+   result = Curl_parsenetrc("curl.example.com", &login, &password,
+              &login_changed, &password_changed, filename);
+   fail_unless(result == 0, "Host should have been found");
+--
+2.40.0
diff --git a/meta/recipes-support/curl/curl_7.82.0.bb b/meta/recipes-support/curl/curl_7.82.0.bb
index 748afc1235..f40139418a 100644
--- a/meta/recipes-support/curl/curl_7.82.0.bb
+++ b/meta/recipes-support/curl/curl_7.82.0.bb
@@ -63,6 +63,8 @@ SRC_URI = "https://curl.se/download/${BP}.tar.xz \
            file://CVE-2024-8096.patch \
            file://0001-url-free-old-conn-better-on-reuse.patch \
            file://CVE-2024-9681.patch \
+           file://CVE-2024-11053-0001.patch \
+           file://CVE-2024-11053-0002.patch \
            "
 SRC_URI[sha256sum] = "0aaa12d7bd04b0966254f2703ce80dd5c38dbbd76af0297d3d690cdce58a583c"
 
-- 
2.43.0


