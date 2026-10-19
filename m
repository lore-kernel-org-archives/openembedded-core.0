Return-Path: <dkelaiya@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71171CCF2DE
	for <webhook@archiver.kernel.org>; Mon, 19 Oct 2026 06:43:33 +0000 (UTC)
Received: from rcdn-iport-3.cisco.com (rcdn-iport-3.cisco.com [173.37.86.74])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.28816.1792392206147735939
 for <openembedded-core@lists.openembedded.org>;
 Sun, 18 Oct 2026 23:43:26 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=Jpk7Y3B5;
 spf=pass (domain: cisco.com, ip: 173.37.86.74, mailfrom: dkelaiya@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=14619; q=dns/txt;
  s=iport01; t=1792392206; x=1793601806;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ACQYK4zeVzLzm2byaH+KIFKZxrprckKDdSGRIxisDT0=;
  b=Jpk7Y3B56JAclGsviwNOrqb/mYZkUmW34IfixiNM00WJwKvZrJ4Gsz2d
   EKCn41ikg3RoCkEiJ0JoZliiN5qkFJ2AKmAx4QWaC0J/Yv4WPqm+HO48V
   oLa90nJ5HByx7CG54gpygyPcoUnTJ9iv6Z9QErX32oCnautVlM2/rV84K
   Ov9+6iCPXDynlBSWA9eNycbOD5iqYE3Ty2fsH6/QMukbY2Cn3e4BvdulO
   DwA/c6WxWu1PnUE8cWkWGHA8QrPm7wCfJGrrSL5R71SuQRf8xliI+BTsz
   eexOSlSGNGD3l2Dj2Tp2oKgYPnI+pWJKqs/AY4tsvNHiTZimU1ZRy7oVf
   A==;
X-CSE-ConnectionGUID: 2/CBc88dQtiO+L4BxsxQ/w==
X-CSE-MsgGUID: j/bbgx5aSI6hzyo8kDb/OA==
X-IPAS-Result: =?us-ascii?q?A0BKAgBsu9Vq/5T/Ja1aHgEBCxIMggULgld1YENJlkoDk?=
 =?us-ascii?q?UqMUhSBag8BAQEPRA0EAQGFBQKOFQImNAkOAQIEAwIDAQEBAQEBAQEBAQEBC?=
 =?us-ascii?q?gEBBQEBAQIBBwWBDhOGTw2QEgECAQMyARgBLRAcAwECFwEBFisdAQUIGYMCA?=
 =?us-ascii?q?YJ0AxEGvR0bN4IsgQGDKQE/AgJAAVDbMgELFAGBOIVAiCNdGAGEfCcbG4Fyg?=
 =?us-ascii?q?RWBO4IugQWBMioCAYEmIAFgAgaFdQSCInoSgVoYBmWHNocnhX1IgR4DWSwBV?=
 =?us-ascii?q?RMNCgsHBYFoAzUSKhVuMh2BIz4XgQcbBgWBHYEgghYjGTZ6gQlegSspYAEQF?=
 =?us-ascii?q?4EJggcCglSCAAIBSUEOB0VTCSVDEkcmIggSCQETGjALgRs4PAkoQRcMcwwdB?=
 =?us-ascii?q?XIIAg0JB00YDUgRLDcVGQQ+bgeSKh6CXgcBWAgtAQciAQGBBX0GNQsBAQQYk?=
 =?us-ascii?q?nSQJ4IhgTWfWgoog3aMIo4Nhy0aM4VbpRSZCIs3glOVNDQLDk+EaYFoPIFZc?=
 =?us-ascii?q?BU7gmcJFjQZD44uCwuBeIFohAeCOcgaJzICCTIBAQcCBw4DC4FokAACJAKBV?=
 =?us-ascii?q?gEB?=
IronPort-Data: A9a23:oSUvIKKfNyrkXXU/FE+RgJQlxSXFcZb7ZxGr2PjKsXjdYENS0WYGn
 2EZCjyBPPffNzD2KYwlYI7l8h8A6pDQyINnHQsd+CA2RRqmiyZq6fd1j6vUF3nPRiEWZBs/t
 63yUvGZcoZpCCea+Uf1WlTYhSEU/bmSQbbhA/LzNCl0RAt1IA8skhsLd9QR2uaEuvDnRVnS0
 T/Oi5eHYgH8g2clajt8B5+r8XuDgtyj4Fv0gXRmDRx7lAe2v2UYCpsZOZawIxPQKqFIHvS3T
 vr017qw+GXU5X8FUrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRuukoPD8fwXG8M49m/c3+d/
 /0W3XC4YV9B0qQhA43xWTEAe811FfUuFLMqvRFTvOTLp3AqfUcAzN00S2ocNt1I9t9rAEYN0
 aAyOCsdV1ec0rfeLLKTEoGAh+w5J8XteYdasXZ6wHSAVLAtQIvIROPB4towMDUY358VW62BI
 ZBENHw2MESojx5nYj/7DLoyn+qsj3juehVTqUmeouw85G27IAlZjeOyb4KKIIXaLSlTtkTfr
 GjJ7znwOTBENM6OzmqG3njrocaayEsXX6pXTtVU7MVCh0WewGEWAhAaWVa35PK+kEOWX9NEN
 1dS/TIjq6U3/kGnQtTxGRqirxa5UgU0QdFcFag+rQqK0KeRul/fDWkfRTkHY9sj3CMreQEXO
 payt4uBLVRSXHe9EBpxKp/8QeuOBBUo
IronPort-HdrOrdr: A9a23:tQ7Im65AkE0/mabPcAPXwOrXdLJyesId70hD6qm+c3Nom6uj5q
 eTdZsgtCMc5Ax9ZJhko6HjBEDiewK5yXcK2+ks1N6ZNWGM0ldAbrsSiLcKqAePJ8SRzIJgPN
 9bAstDIey1K0RmhsDn5wT9OdMhzN6btJ2Mv47lvhFQpcUAUdAZ0++/YTzra3FLeA==
X-Talos-CUID: 9a23:2YfnOmM8Ftr2su5DAm5M3kVESswcbnz6j1OMCV+jGV8uV+jA
X-Talos-MUID: 9a23:dPz75wQSVMj8TSgjRXTuwztoO9c16p+PVkAfgJJWuOWOcgtZbmI=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,167,1787011200"; 
   d="scan'208";a="537707218"
Received: from rcdn-l-core-11.cisco.com ([173.37.255.148])
  by rcdn-iport-3.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 19 Oct 2026 06:43:25 +0000
Received: from sjc-ads-5675.cisco.com (sjc-ads-5675.cisco.com [10.28.88.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-11.cisco.com (Postfix) with ESMTPS id D59471800014B;
	Mon, 19 Oct 2026 06:43:24 +0000 (GMT)
Received: by sjc-ads-5675.cisco.com (Postfix, from userid 1887444)
	id 5E0CACBF201; Sun, 18 Oct 2026 23:43:24 -0700 (PDT)
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: Darsh Kelaiya <dkelaiya@cisco.com>
Subject: [OE-core][wrynose][PATCH 1/5] curl: fix CVE-2026-8926
Date: Sun, 18 Oct 2026 23:43:16 -0700
Message-Id: <20261019064320.3978613-2-dkelaiya@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261019064320.3978613-1-dkelaiya@cisco.com>
References: <20261019064320.3978613-1-dkelaiya@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5675.cisco.com [10.28.88.189];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.88.189, sjc-ads-5675.cisco.com
X-Outbound-Node: rcdn-l-core-11.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Oct 2026 06:43:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248135

From: Darsh Kelaiya <dkelaiya@cisco.com>

Backport the upstream fix [1] for [2] to curl 8.19.0.

Include entry-selection changes and extended test 685 from [4].
Keep password-only entries valid for a user supplied in the URL,
while rejecting passwords tied to a different login. Reset login
matching state when changing entries.

Include upstream follow-up [3] to cover URL users absent from the
netrc file, with regression test 1646.

[1] https://github.com/curl/curl/commit/4ae1d7cc2643e4773a136395f12bc02fc6867854
[2] https://curl.se/docs/CVE-2026-8926.html
[3] https://github.com/curl/curl/commit/7ca5f939c8403db7ede21e2ccb805a65d3329ef8
[4] https://github.com/curl/curl/commit/a327a5bdedfad6b486bca4e0a1a4fdac9ab298ca

Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
---
 .../curl/curl/CVE-2026-8926-dependent.patch   | 140 ++++++++++++++++++
 .../curl/curl/CVE-2026-8926_p1.patch          | 100 +++++++++++++
 .../curl/curl/CVE-2026-8926_p2.patch          |  84 +++++++++++
 meta/recipes-support/curl/curl_8.19.0.bb      |   3 +
 4 files changed, 327 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-8926-dependent.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-8926_p1.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-8926_p2.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2026-8926-dependent.patch b/meta/recipes-support/curl/curl/CVE-2026-8926-dependent.patch
new file mode 100644
index 0000000000..1c46d08e27
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2026-8926-dependent.patch
@@ -0,0 +1,140 @@
+From a327a5bdedfad6b486bca4e0a1a4fdac9ab298ca Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Mon, 9 Mar 2026 08:38:14 +0100
+Subject: [PATCH] netrc: refactor into smaller sub functions
+
+Fixes #20950 - test 685 is extended for this
+Closes #20932
+
+CVE: CVE-2026-8926
+Upstream-Status: Backport [https://github.com/curl/curl/commit/a327a5bdedfad6b486bca4e0a1a4fdac9ab298ca]
+
+Backport Changes:
+- Kept the curl 8.19.0 parser and login/password API instead of
+  extracting netrc_state, token, state, and finalization helpers.
+- Applied the password-presence check, generic-entry selection and
+  entry-state resets in the existing parser, without the helper moves.
+- Omitted netrc_finalize's password-return comment because the CVE
+  fix must reject entries with an explicitly mismatched login.
+
+(cherry picked from commit a327a5bdedfad6b486bca4e0a1a4fdac9ab298ca)
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ docs/cmdline-opts/netrc.md         | 12 ++++++++++--
+ docs/libcurl/opts/CURLOPT_NETRC.md |  5 +++++
+ lib/netrc.c                        | 17 ++++++++++++++---
+ tests/data/test685                 |  4 +++-
+ 4 files changed, 32 insertions(+), 6 deletions(-)
+
+diff --git a/docs/cmdline-opts/netrc.md b/docs/cmdline-opts/netrc.md
+index 72b5ff9..03a7ed6 100644
+--- a/docs/cmdline-opts/netrc.md
++++ b/docs/cmdline-opts/netrc.md
+@@ -35,10 +35,18 @@ On Windows two filenames in the home directory are checked: *.netrc* and
+ *_netrc*, preferring the former. Older versions on Windows checked for
+ *_netrc* only.
+ 
+-A quick and simple example of how to setup a *.netrc* to allow curl to FTP to
+-the machine host.example.com with username 'myself' and password 'secret'
++A quick and simple example of how to setup a *.netrc* to allow curl to access
++the machine host.example.com with username `myself` and password `secret`
+ could look similar to:
+ 
+     machine host.example.com
+     login myself
+     password secret
++
++curl also supports the `default` keyword. This is the same as machine name
++except that default matches any name. There can be only one `default` token,
++and it must be after all machine tokens.
++
++When providing a username in the URL and a *.netrc* file, curl looks for the
++password for that specific user for the given host if such an entry appears in
++the file before a "generic" `machine` entry without `login` specified.
+diff --git a/docs/libcurl/opts/CURLOPT_NETRC.md b/docs/libcurl/opts/CURLOPT_NETRC.md
+index 65d87cf..1e3dbb1 100644
+--- a/docs/libcurl/opts/CURLOPT_NETRC.md
++++ b/docs/libcurl/opts/CURLOPT_NETRC.md
+@@ -50,6 +50,11 @@ and similar things are not supported).
+ The netrc file provides credentials for a hostname independent of which
+ protocol and port number that are used.
+ 
++When providing a username in the URL and a *.netrc* file, libcurl looks for
++and uses the password for that specific user for the given host if such an
++entry appears in the file before a "generic" `machine` entry without `login`
++specified.
++
+ libcurl does not verify that the file has the correct properties set (as the
+ standard Unix ftp client does). It should only be readable by user.
+ 
+diff --git a/lib/netrc.c b/lib/netrc.c
+index 1073cc5..5eb0c84 100644
+--- a/lib/netrc.c
++++ b/lib/netrc.c
+@@ -289,8 +289,7 @@ static NETRCcode parsenetrc(struct store_netrc *store,
+             retcode = NETRC_OUT_OF_MEMORY; /* allocation failed */
+             goto out;
+           }
+-          if(!specific_login || our_login)
+-            found |= FOUND_PASSWORD;
++          found |= FOUND_PASSWORD;
+           keyword = NONE;
+         }
+         else if(curl_strequal("login", tok))
+@@ -299,13 +298,22 @@ static NETRCcode parsenetrc(struct store_netrc *store,
+           keyword = PASSWORD;
+         else if(curl_strequal("machine", tok)) {
+           /* a new machine here */
+-          if(found & FOUND_PASSWORD) {
++          if(found & FOUND_PASSWORD &&
++             /* a password was provided for this host */
++
++             ((!specific_login || our_login) ||
++              /* either there was no specific login to search for, or this
++                 is the specific one we wanted */
++              (specific_login && !(found & FOUND_LOGIN)))) {
++            /* or we look for a specific login, but that was not specified */
++
+             done = TRUE;
+             break;
+           }
+           state = HOSTFOUND;
+           keyword = NONE;
+           found = 0;
++          our_login = FALSE;
+           Curl_safefree(password);
+           if(!specific_login)
+             Curl_safefree(login);
+@@ -313,6 +321,9 @@ static NETRCcode parsenetrc(struct store_netrc *store,
+         else if(curl_strequal("default", tok)) {
+           state = HOSTVALID;
+           retcode = NETRC_OK; /* we did find our host */
++          keyword = NONE;
++          found = 0;
++          our_login = FALSE;
+           Curl_safefree(password);
+           if(!specific_login)
+             Curl_safefree(login);
+diff --git a/tests/data/test685 b/tests/data/test685
+index a069ff8..5346cd1 100644
+--- a/tests/data/test685
++++ b/tests/data/test685
+@@ -26,13 +26,15 @@ Connection: close
+ http
+ </server>
+ <name>
+-netrc with no login - provided user
++netrc with no login - but provided user in URL
+ </name>
+ <command>
+ --netrc-optional --netrc-file %LOGDIR/netrc%TESTNUMBER http://user@%HOSTIP:%HTTPPORT/
+ </command>
+ <file name="%LOGDIR/netrc%TESTNUMBER" >
++machine %HOSTIP password firstthis login unknown
+ machine %HOSTIP password 5up3r53cr37
++machine %HOSTIP password d1ff3r3nt login anotherone
+ </file>
+ </client>
+ 
+-- 
+2.35.6
diff --git a/meta/recipes-support/curl/curl/CVE-2026-8926_p1.patch b/meta/recipes-support/curl/curl/CVE-2026-8926_p1.patch
new file mode 100644
index 0000000000..8402429fce
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2026-8926_p1.patch
@@ -0,0 +1,100 @@
+From 4ae1d7cc2643e4773a136395f12bc02fc6867854 Mon Sep 17 00:00:00 2001
+From: Stefan Eissing <stefan@eissing.org>
+Date: Fri, 15 May 2026 11:45:49 +0200
+Subject: [PATCH] netrc: scanner refactor
+
+Refactor the netrc scanner. Add test case for checking that the last
+matched machine with unmatched login does not return the password as
+success (unit1304).
+
+Closes #21624
+
+CVE: CVE-2026-8926
+Upstream-Status: Backport [https://github.com/curl/curl/commit/4ae1d7cc2643e4773a136395f12bc02fc6867854]
+
+Backport Changes:
+- Kept the curl 8.19.0 tokenizer and login/password API in netrc.c;
+  omitted the Curl_creds API changes in netrc.h and url.c.
+- Replaced the scanner refactor with a NETRC_NO_MATCH guard for an
+  unmatched requested login, keeping generic password-only entries.
+- Corrected test 685's regression in the initial backport: a missing
+  login keyword must not reject a password-only entry for a URL user.
+- Preserved the old blank-password behavior for a matching login.
+- Adapted unit1304 to the curl 8.19.0 login/password API and retained
+  the upstream regression scenario for the last unmatched login.
+
+(cherry picked from commit 4ae1d7cc2643e4773a136395f12bc02fc6867854)
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ lib/netrc.c           |  3 +++
+ tests/unit/unit1304.c | 20 +++++++++++++++++---
+ 2 files changed, 20 insertions(+), 3 deletions(-)
+
+diff --git a/lib/netrc.c b/lib/netrc.c
+index 5eb0c84..425a535 100644
+--- a/lib/netrc.c
++++ b/lib/netrc.c
+@@ -349,6 +349,9 @@ static NETRCcode parsenetrc(struct store_netrc *store,
+ 
+ out:
+   curlx_dyn_free(&token);
++  if(!retcode && specific_login && !our_login &&
++     ((found & FOUND_LOGIN) || !password))
++    retcode = NETRC_NO_MATCH;
+   if(!retcode) {
+     if(!password && our_login) {
+       /* success without a password, set a blank one */
+diff --git a/tests/unit/unit1304.c b/tests/unit/unit1304.c
+index 231ddd4..cff99f1 100644
+--- a/tests/unit/unit1304.c
++++ b/tests/unit/unit1304.c
+@@ -59,7 +59,7 @@ static CURLcode test_unit1304(const char *arg)
+   login = curlx_strdup("me");
+   Curl_netrc_init(&store);
+   result = Curl_parsenetrc(&store, "example.com", &login, &password, arg);
+-  fail_unless(result == 0, "Host should have been found");
++  fail_unless(result == 1, "Login should not have been found");
+   abort_unless(password == NULL, "password is not NULL!");
+   Curl_netrc_cleanup(&store);
+   curlx_free(login);
+@@ -82,7 +82,7 @@ static CURLcode test_unit1304(const char *arg)
+   login = curlx_strdup("admi"); /* spellchecker:disable-line */
+   Curl_netrc_init(&store);
+   result = Curl_parsenetrc(&store, "example.com", &login, &password, arg);
+-  fail_unless(result == 0, "Host should have been found");
++  fail_unless(result == 1, "Login should not have been found");
+   abort_unless(password == NULL, "password is not NULL!");
+   Curl_netrc_cleanup(&store);
+   curlx_free(login);
+@@ -94,7 +94,7 @@ static CURLcode test_unit1304(const char *arg)
+   login = curlx_strdup("adminn");
+   Curl_netrc_init(&store);
+   result = Curl_parsenetrc(&store, "example.com", &login, &password, arg);
+-  fail_unless(result == 0, "Host should have been found");
++  fail_unless(result == 1, "Login should not have been found");
+   abort_unless(password == NULL, "password is not NULL!");
+   Curl_netrc_cleanup(&store);
+   curlx_free(login);
+@@ -166,6 +166,20 @@ static CURLcode test_unit1304(const char *arg)
+   fail_unless(strncmp(login, "none", 4) == 0, "login should be 'none'");
+   Curl_netrc_cleanup(&store);
+ 
++  /*
++   * Test for the last host where we do not want to see the password
++   * if the login does not match.
++   */
++  curlx_free(password);
++  password = NULL;
++  curlx_free(login);
++  login = curlx_strdup("hilarious");
++  Curl_netrc_init(&store);
++  result = Curl_parsenetrc(&store, "curl.example.com", &login, &password, arg);
++  fail_unless(result == 1, "Login should not have been found");
++  abort_unless(password == NULL, "password is not NULL!");
++  Curl_netrc_cleanup(&store);
++
+   UNITTEST_END(t1304_stop(&password, &login))
+ }
+ 
+-- 
+2.35.6
diff --git a/meta/recipes-support/curl/curl/CVE-2026-8926_p2.patch b/meta/recipes-support/curl/curl/CVE-2026-8926_p2.patch
new file mode 100644
index 0000000000..b511e03fc4
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2026-8926_p2.patch
@@ -0,0 +1,84 @@
+From 7ca5f939c8403db7ede21e2ccb805a65d3329ef8 Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Sat, 16 May 2026 00:54:13 +0200
+Subject: [PATCH] test1646: netrc parsing without user match but user in URL
+
+Follow-up to 4ae1d7cc2643e
+
+CVE: CVE-2026-8926
+Upstream-Status: Backport [https://github.com/curl/curl/commit/7ca5f939c8403db7ede21e2ccb805a65d3329ef8]
+
+Backport Changes:
+- Registered test 1646 in the older curl 8.19.0 test-list row.
+
+(cherry picked from commit 7ca5f939c8403db7ede21e2ccb805a65d3329ef8)
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ tests/data/Makefile.am |  2 +-
+ tests/data/test1646    | 45 +++++++++++++++++++++++++++++++++++++++++++++
+ 2 files changed, 46 insertions(+), 1 deletion(-)
+
+diff --git a/tests/data/Makefile.am b/tests/data/Makefile.am
+index 13e47a3..ea700cd 100644
+--- a/tests/data/Makefile.am
++++ b/tests/data/Makefile.am
+@@ -218,7 +218,7 @@ test1620 test1621 test1622 test1623 test1624 \
+ \
+ test1630 test1631 test1632 test1633 test1634 test1635 test1636 test1637 \
+ \
+-test1640 test1641 test1642 test1643 test1647 test1648 test1649 \
++test1640 test1641 test1642 test1643 test1646 test1647 test1648 test1649 \
+ \
+ test1650 test1651 test1652 test1653 test1654 test1655 test1656 test1657 \
+ test1658 \
+diff --git a/tests/data/test1646 b/tests/data/test1646
+new file mode 100644
+index 0000000..3df03be
+--- /dev/null
++++ b/tests/data/test1646
+@@ -0,0 +1,45 @@
++<?xml version="1.0" encoding="US-ASCII"?>
++<testcase>
++<info>
++<keywords>
++netrc
++</keywords>
++</info>
++
++<reply>
++<data>
++HTTP/1.1 200 OK
++Content-Length: 6
++
++12345
++</data>
++</reply>
++
++# Client-side
++<client>
++<server>
++http
++</server>
++<name>
++netrc parsing without user match but user in URL
++</name>
++<command>
++--netrc --netrc-file %LOGDIR/netrc%TESTNUMBER http://alice@example.com:%HTTPPORT/%TESTNUMBER --resolve example.com:%HTTPPORT:%HOSTIP
++</command>
++<file name="%LOGDIR/netrc%TESTNUMBER" >
++machine example.com login bob password sekret
++</file>
++</client>
++
++# Verify data after the test has been "shot"
++<verify>
++<protocol crlf="headers">
++GET /%TESTNUMBER HTTP/1.1
++Host: example.com:%HTTPPORT
++Authorization: Basic %b64[alice:]b64%
++User-Agent: curl/%VERSION
++Accept: */*
++
++</protocol>
++</verify>
++</testcase>
diff --git a/meta/recipes-support/curl/curl_8.19.0.bb b/meta/recipes-support/curl/curl_8.19.0.bb
index c2697d6dd8..af76f5d53b 100644
--- a/meta/recipes-support/curl/curl_8.19.0.bb
+++ b/meta/recipes-support/curl/curl_8.19.0.bb
@@ -38,6 +38,9 @@ SRC_URI = "https://curl.se/download/${BP}.tar.xz \
            file://CVE-2026-80229.patch \
            file://CVE-2026-9546-01.patch \
            file://CVE-2026-9546-02.patch \
+           file://CVE-2026-8926-dependent.patch \
+           file://CVE-2026-8926_p1.patch \
+           file://CVE-2026-8926_p2.patch \
            file://CVE-2026-80230.patch \
            "
 
-- 
2.35.6


