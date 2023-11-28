Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 917E5C07E97
	for <webhook@archiver.kernel.org>; Tue, 28 Nov 2023 22:53:07 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web10.10163.1701211979299105574
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Nov 2023 14:52:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=01kmXOvW;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.170, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-6cb9dd2ab56so5308837b3a.3
        for <openembedded-core@lists.openembedded.org>; Tue, 28 Nov 2023 14:52:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1701211978; x=1701816778; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S0wRT1vi/SlZ87/L+bckUVMlBAdGvT0Jw6h+zYXGGwM=;
        b=01kmXOvWH8k2HisRBFPENLQd5XNW7jIKR5LRetzDVJoCVUbPoyiwpcGTcMDIC8l1Co
         dJZ4LHqRNj8uL4LMp3UyMRoCPKz5KBhpZRItHqBzkdVtg+RuBIg+aq3EvF/4ytyyaTvQ
         URcXDhNMWtmufixUN3pg1Nx9YGn5qkjXTyhEDYWkgJ6l/PH5tempnnTQy8vS0ZhaxCRO
         SxNwOrZExp5d9I8vv5izWM+NkEJlhOoR7gzcLedj0g6xG/7Cb597YP0rn7q7HeBCXd1L
         +AOxEgdkDx4ufHOlXJnnUwas13E4gZCHe+QR5i/2W6mCqneoJygVKLinwA2HwsyRsTSi
         KOqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701211978; x=1701816778;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S0wRT1vi/SlZ87/L+bckUVMlBAdGvT0Jw6h+zYXGGwM=;
        b=CBIUiWzbg+9CsH9XvI1FjyTcQ1KqPjb5ueNMTuIkdSlVzVM3ISvvcZ1md4rzc7/8cb
         7chZuRbrXvvLUuEAVtc+KdoWmii6HXM4k7XrK2UTNVwPbPDqLPVoDwTFBPiDfUsb5GPV
         g6i6plseLQUG2vbGOyk5rhekXMzkKfP9ukYxFpWCRlfZ41G66wyaiZgUlTRUJyPQ5JAE
         z7DUTFVOdq9zmIJaywse6VYXE1GJElApAQ65QsRHbQ8GUYld10zr5g4b4UUarhOwcFfa
         iE402847ewgu01W2CRIx0FBq79xIeRGz8ZiYVG8iUIU+p0gNinjJgrTMU+1RZn6q6Zr7
         koMA==
X-Gm-Message-State: AOJu0YyRXaiNFM58Jrs3fdhDgUZqwguSa2ZSCcTK3+y2RieNPEdNeg7x
	vw25oh6RpZeyzzh+YoZmLTlgmdW6vBVpo/5BmYjGgg==
X-Google-Smtp-Source: AGHT+IHZAUWBO+Mbz4LrEJCF207huq5MikRREAvO1Rr0M8yLaw3eBowXWKQmoTvjEkat6RzhPzpGgw==
X-Received: by 2002:a05:6a21:6215:b0:16c:b5ce:50f with SMTP id wm21-20020a056a21621500b0016cb5ce050fmr13254233pzb.32.1701211977461;
        Tue, 28 Nov 2023 14:52:57 -0800 (PST)
Received: from hexa.lan (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id cu20-20020a17090afa9400b00282ecb631a9sm9621898pjb.25.2023.11.28.14.52.56
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Nov 2023 14:52:57 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 05/13] curl: fix CVE-2023-28321 CVE-2023-28322
Date: Tue, 28 Nov 2023 12:52:32 -1000
Message-Id: <5cc1f487928df04c58709dd88ef6c17c171da7a5.1701210903.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1701210903.git.steve@sakoman.com>
References: <cover.1701210903.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Nov 2023 22:53:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191400

From: Lee Chee Yang <chee.yang.lee@intel.com>

import patch from ubuntu curl_7.68.0-1ubuntu2.20.

minor change to CVE-2023-28321.patch tests/data/test1397 part
so the patch can be apply.

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../curl/curl/CVE-2023-28321.patch            | 272 +++++++++++++
 .../curl/curl/CVE-2023-28322.patch            | 380 ++++++++++++++++++
 meta/recipes-support/curl/curl_7.69.1.bb      |   2 +
 3 files changed, 654 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2023-28321.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2023-28322.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2023-28321.patch b/meta/recipes-support/curl/curl/CVE-2023-28321.patch
new file mode 100644
index 0000000000..da1d1fdcd6
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2023-28321.patch
@@ -0,0 +1,272 @@
+Upstream-Status: Backport [import from ubuntu curl_7.68.0-1ubuntu2.20 with
+minor change to tests/data/test1397 part so the patch can be apply.
+upstream: https://github.com/curl/curl/commit/199f2d440d8659b42 ]
+CVE: CVE-2023-28321
+Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
+
+This backport was obtained from SUSE.
+
+From 199f2d440d8659b42670c1b796220792b01a97bf Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Mon, 24 Apr 2023 21:07:02 +0200
+Subject: [PATCH] hostcheck: fix host name wildcard checking
+
+The leftmost "label" of the host name can now only match against single
+'*'. Like the browsers have worked for a long time.
+
+- extended unit test 1397 for this
+- move some SOURCE variables from unit/Makefile.am to unit/Makefile.inc
+
+Reported-by: Hiroki Kurosawa
+Closes #11018
+---
+ lib/hostcheck.c         |  50 +++++++--------
+ tests/data/test1397     |  10 ++-
+ tests/unit/Makefile.am  |  94 ----------------------------
+ tests/unit/Makefile.inc |  94 ++++++++++++++++++++++++++++
+ tests/unit/unit1397.c   | 134 ++++++++++++++++++++++++----------------
+ 5 files changed, 202 insertions(+), 180 deletions(-)
+
+--- a/lib/hostcheck.c
++++ b/lib/hostcheck.c
+@@ -58,15 +58,19 @@
+  * apparent distinction between a name and an IP. We need to detect the use of
+  * an IP address and not wildcard match on such names.
+  *
++ * Only match on "*" being used for the leftmost label, not "a*", "a*b" nor
++ * "*b".
++ *
++ * @unittest: 1397
++ *
+  * NOTE: hostmatch() gets called with copied buffers so that it can modify the
+  * contents at will.
+  */
+ 
+ static int hostmatch(char *hostname, char *pattern)
+ {
+-  const char *pattern_label_end, *pattern_wildcard, *hostname_label_end;
+-  int wildcard_enabled;
+-  size_t prefixlen, suffixlen;
++  const char *pattern_label_end, *hostname_label_end;
++  size_t suffixlen;
+   struct in_addr ignored;
+ #ifdef ENABLE_IPV6
+   struct sockaddr_in6 si6;
+@@ -80,13 +84,12 @@ static int hostmatch(char *hostname, cha
+   if(pattern[len-1]=='.')
+     pattern[len-1] = 0;
+ 
+-  pattern_wildcard = strchr(pattern, '*');
+-  if(pattern_wildcard == NULL)
++  if(strncmp(pattern, "*.", 2))
+     return strcasecompare(pattern, hostname) ?
+       CURL_HOST_MATCH : CURL_HOST_NOMATCH;
+ 
+   /* detect IP address as hostname and fail the match if so */
+-  if(Curl_inet_pton(AF_INET, hostname, &ignored) > 0)
++  else if(Curl_inet_pton(AF_INET, hostname, &ignored) > 0)
+     return CURL_HOST_NOMATCH;
+ #ifdef ENABLE_IPV6
+   if(Curl_inet_pton(AF_INET6, hostname, &si6.sin6_addr) > 0)
+@@ -95,14 +98,9 @@ static int hostmatch(char *hostname, cha
+ 
+   /* We require at least 2 dots in pattern to avoid too wide wildcard
+      match. */
+-  wildcard_enabled = 1;
+   pattern_label_end = strchr(pattern, '.');
+-  if(pattern_label_end == NULL || strchr(pattern_label_end + 1, '.') == NULL ||
+-     pattern_wildcard > pattern_label_end ||
+-     strncasecompare(pattern, "xn--", 4)) {
+-    wildcard_enabled = 0;
+-  }
+-  if(!wildcard_enabled)
++  if(pattern_label_end == NULL ||
++     strchr(pattern_label_end + 1, '.') == NULL)
+     return strcasecompare(pattern, hostname) ?
+       CURL_HOST_MATCH : CURL_HOST_NOMATCH;
+ 
+@@ -117,11 +115,9 @@ static int hostmatch(char *hostname, cha
+   if(hostname_label_end - hostname < pattern_label_end - pattern)
+     return CURL_HOST_NOMATCH;
+ 
+-  prefixlen = pattern_wildcard - pattern;
+-  suffixlen = pattern_label_end - (pattern_wildcard + 1);
+-  return strncasecompare(pattern, hostname, prefixlen) &&
+-    strncasecompare(pattern_wildcard + 1, hostname_label_end - suffixlen,
+-                    suffixlen) ?
++  suffixlen = pattern_label_end - (pattern + 1);
++  return strncasecompare(pattern + 1, hostname_label_end - suffixlen,
++                         suffixlen) ?
+     CURL_HOST_MATCH : CURL_HOST_NOMATCH;
+ }
+ 
+--- a/tests/data/test1397
++++ b/tests/data/test1397
+@@ -2,8 +2,7 @@
+ <info>
+ <keywords>
+ unittest
+-ssl
+-wildcard
++Curl_cert_hostcheck
+ </keywords>
+ </info>
+ 
+@@ -16,9 +15,8 @@ none
+ <features>
+ unittest
+ </features>
+- <name>
+-Check wildcard certificate matching function Curl_cert_hostcheck
+- </name>
++<name>
++Curl_cert_hostcheck unit tests
++</name>
+ </client>
+-
+ </testcase>
+--- a/tests/unit/unit1397.c
++++ b/tests/unit/unit1397.c
+@@ -21,8 +21,6 @@
+  ***************************************************************************/
+ #include "curlcheck.h"
+ 
+-#include "hostcheck.h" /* from the lib dir */
+-
+ static CURLcode unit_setup(void)
+ {
+   return CURLE_OK;
+@@ -30,50 +28,94 @@ static CURLcode unit_setup(void)
+ 
+ static void unit_stop(void)
+ {
+-  /* done before shutting down and exiting */
+ }
+ 
+-UNITTEST_START
++* only these backends define the tested functions */
++#if defined(USE_OPENSSL) || defined(USE_GSKIT) || \
++  defined(USE_SCHANNEL)
++#include "hostcheck.h"
++struct testcase {
++  const char *host;
++  const char *pattern;
++  bool match;
++};
++
++static struct testcase tests[] = {
++  {"", "", FALSE},
++  {"a", "", FALSE},
++  {"", "b", FALSE},
++  {"a", "b", FALSE},
++  {"aa", "bb", FALSE},
++  {"\xff", "\xff", TRUE},
++  {"aa.aa.aa", "aa.aa.bb", FALSE},
++  {"aa.aa.aa", "aa.aa.aa", TRUE},
++  {"aa.aa.aa", "*.aa.bb", FALSE},
++  {"aa.aa.aa", "*.aa.aa", TRUE},
++  {"192.168.0.1", "192.168.0.1", TRUE},
++  {"192.168.0.1", "*.168.0.1", FALSE},
++  {"192.168.0.1", "*.0.1", FALSE},
++  {"h.ello", "*.ello", FALSE},
++  {"h.ello.", "*.ello", FALSE},
++  {"h.ello", "*.ello.", FALSE},
++  {"h.e.llo", "*.e.llo", TRUE},
++  {"h.e.llo", " *.e.llo", FALSE},
++  {" h.e.llo", "*.e.llo", TRUE},
++  {"h.e.llo.", "*.e.llo", TRUE},
++  {"*.e.llo.", "*.e.llo", TRUE},
++  {"************.e.llo.", "*.e.llo", TRUE},
++  {"AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"
++   "BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB"
++   "CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC"
++   "DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD"
++   "EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE"
++   ".e.llo.", "*.e.llo", TRUE},
++  {"\xfe\xfe.e.llo.", "*.e.llo", TRUE},
++  {"h.e.llo.", "*.e.llo.", TRUE},
++  {"h.e.llo", "*.e.llo.", TRUE},
++  {".h.e.llo", "*.e.llo.", FALSE},
++  {"h.e.llo", "*.*.llo.", FALSE},
++  {"h.e.llo", "h.*.llo", FALSE},
++  {"h.e.llo", "h.e.*", FALSE},
++  {"hello", "*.ello", FALSE},
++  {"hello", "**llo", FALSE},
++  {"bar.foo.example.com", "*.example.com", FALSE},
++  {"foo.example.com", "*.example.com", TRUE},
++  {"baz.example.net", "b*z.example.net", FALSE},
++  {"foobaz.example.net", "*baz.example.net", FALSE},
++  {"xn--l8j.example.local", "x*.example.local", FALSE},
++  {"xn--l8j.example.net", "*.example.net", TRUE},
++  {"xn--l8j.example.net", "*j.example.net", FALSE},
++  {"xn--l8j.example.net", "xn--l8j.example.net", TRUE},
++  {"xn--l8j.example.net", "xn--l8j.*.net", FALSE},
++  {"xl8j.example.net", "*.example.net", TRUE},
++  {"fe80::3285:a9ff:fe46:b619", "*::3285:a9ff:fe46:b619", FALSE},
++  {"fe80::3285:a9ff:fe46:b619", "fe80::3285:a9ff:fe46:b619", TRUE},
++  {NULL, NULL, FALSE}
++};
+ 
+-/* only these backends define the tested functions */
+-#if defined(USE_OPENSSL) || defined(USE_GSKIT)
++UNITTEST_START
++{
++  int i;
++  for(i = 0; tests[i].host; i++) {
++    if(tests[i].match != Curl_cert_hostcheck(tests[i].pattern,
++                                             tests[i].host)) {
++      fprintf(stderr,
++              "HOST: %s\n"
++              "PTRN: %s\n"
++              "did %sMATCH\n",
++              tests[i].host,
++              tests[i].pattern,
++              tests[i].match ? "NOT ": "");
++      unitfail++;
++    }
++  }
++}
+ 
+-  /* here you start doing things and checking that the results are good */
++UNITTEST_STOP
++#else
+ 
+-fail_unless(Curl_cert_hostcheck("www.example.com", "www.example.com"),
+-            "good 1");
+-fail_unless(Curl_cert_hostcheck("*.example.com", "www.example.com"),
+-            "good 2");
+-fail_unless(Curl_cert_hostcheck("xxx*.example.com", "xxxwww.example.com"),
+-            "good 3");
+-fail_unless(Curl_cert_hostcheck("f*.example.com", "foo.example.com"),
+-            "good 4");
+-fail_unless(Curl_cert_hostcheck("192.168.0.0", "192.168.0.0"),
+-            "good 5");
+-
+-fail_if(Curl_cert_hostcheck("xxx.example.com", "www.example.com"), "bad 1");
+-fail_if(Curl_cert_hostcheck("*", "www.example.com"), "bad 2");
+-fail_if(Curl_cert_hostcheck("*.*.com", "www.example.com"), "bad 3");
+-fail_if(Curl_cert_hostcheck("*.example.com", "baa.foo.example.com"), "bad 4");
+-fail_if(Curl_cert_hostcheck("f*.example.com", "baa.example.com"), "bad 5");
+-fail_if(Curl_cert_hostcheck("*.com", "example.com"), "bad 6");
+-fail_if(Curl_cert_hostcheck("*fail.com", "example.com"), "bad 7");
+-fail_if(Curl_cert_hostcheck("*.example.", "www.example."), "bad 8");
+-fail_if(Curl_cert_hostcheck("*.example.", "www.example"), "bad 9");
+-fail_if(Curl_cert_hostcheck("", "www"), "bad 10");
+-fail_if(Curl_cert_hostcheck("*", "www"), "bad 11");
+-fail_if(Curl_cert_hostcheck("*.168.0.0", "192.168.0.0"), "bad 12");
+-fail_if(Curl_cert_hostcheck("www.example.com", "192.168.0.0"), "bad 13");
+-
+-#ifdef ENABLE_IPV6
+-fail_if(Curl_cert_hostcheck("*::3285:a9ff:fe46:b619",
+-                            "fe80::3285:a9ff:fe46:b619"), "bad 14");
+-fail_unless(Curl_cert_hostcheck("fe80::3285:a9ff:fe46:b619",
+-                                "fe80::3285:a9ff:fe46:b619"), "good 6");
+-#endif
++UNITTEST_START
+ 
++UNITTEST_STOP
+ #endif
+ 
+-  /* you end the test code like this: */
+-
+-UNITTEST_STOP
diff --git a/meta/recipes-support/curl/curl/CVE-2023-28322.patch b/meta/recipes-support/curl/curl/CVE-2023-28322.patch
new file mode 100644
index 0000000000..9351a2c286
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2023-28322.patch
@@ -0,0 +1,380 @@
+CVE: CVE-2023-28322
+Upstream-Status: Backport [ import patch from ubuntu curl_7.68.0-1ubuntu2.20
+upstream https://github.com/curl/curl/commit/7815647d6582c0a4900be2e1de ]
+Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
+
+Backport of:
+
+From 7815647d6582c0a4900be2e1de6c5e61272c496b Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Tue, 25 Apr 2023 08:28:01 +0200
+Subject: [PATCH] lib: unify the upload/method handling
+
+By making sure we set state.upload based on the set.method value and not
+independently as set.upload, we reduce confusion and mixup risks, both
+internally and externally.
+
+Closes #11017
+---
+ lib/curl_rtmp.c    | 4 ++--
+ lib/file.c         | 4 ++--
+ lib/ftp.c          | 8 ++++----
+ lib/http.c         | 4 ++--
+ lib/imap.c         | 6 +++---
+ lib/rtsp.c         | 4 ++--
+ lib/setopt.c       | 6 ++----
+ lib/smb.c          | 6 +++---
+ lib/smtp.c         | 4 ++--
+ lib/tftp.c         | 8 ++++----
+ lib/transfer.c     | 4 ++--
+ lib/urldata.h      | 2 +-
+ lib/vssh/libssh.c  | 6 +++---
+ lib/vssh/libssh2.c | 6 +++---
+ lib/vssh/wolfssh.c | 2 +-
+ 15 files changed, 36 insertions(+), 38 deletions(-)
+
+--- a/lib/curl_rtmp.c
++++ b/lib/curl_rtmp.c
+@@ -213,7 +213,7 @@ static CURLcode rtmp_connect(struct conn
+   /* We have to know if it's a write before we send the
+    * connect request packet
+    */
+-  if(conn->data->set.upload)
++  if(conn->data->state.upload)
+     r->Link.protocol |= RTMP_FEATURE_WRITE;
+ 
+   /* For plain streams, use the buffer toggle trick to keep data flowing */
+@@ -245,7 +245,7 @@ static CURLcode rtmp_do(struct connectda
+   if(!RTMP_ConnectStream(r, 0))
+     return CURLE_FAILED_INIT;
+ 
+-  if(conn->data->set.upload) {
++  if(conn->data->state.upload) {
+     Curl_pgrsSetUploadSize(data, data->state.infilesize);
+     Curl_setup_transfer(data, -1, -1, FALSE, FIRSTSOCKET);
+   }
+--- a/lib/file.c
++++ b/lib/file.c
+@@ -198,7 +198,7 @@ static CURLcode file_connect(struct conn
+   file->freepath = real_path; /* free this when done */
+ 
+   file->fd = fd;
+-  if(!data->set.upload && (fd == -1)) {
++  if(!data->state.upload && (fd == -1)) {
+     failf(data, "Couldn't open file %s", data->state.up.path);
+     file_done(conn, CURLE_FILE_COULDNT_READ_FILE, FALSE);
+     return CURLE_FILE_COULDNT_READ_FILE;
+@@ -390,7 +390,7 @@ static CURLcode file_do(struct connectda
+ 
+   Curl_pgrsStartNow(data);
+ 
+-  if(data->set.upload)
++  if(data->state.upload)
+     return file_upload(conn);
+ 
+   file = conn->data->req.protop;
+--- a/lib/ftp.c
++++ b/lib/ftp.c
+@@ -1371,7 +1371,7 @@ static CURLcode ftp_state_prepare_transf
+                 data->set.str[STRING_CUSTOMREQUEST]:
+                 (data->set.ftp_list_only?"NLST":"LIST"));
+       }
+-      else if(data->set.upload) {
++      else if(data->state.upload) {
+         PPSENDF(&conn->proto.ftpc.pp, "PRET STOR %s", conn->proto.ftpc.file);
+       }
+       else {
+@@ -3303,7 +3303,7 @@ static CURLcode ftp_done(struct connectd
+     /* the response code from the transfer showed an error already so no
+        use checking further */
+     ;
+-  else if(data->set.upload) {
++  else if(data->state.upload) {
+     if((-1 != data->state.infilesize) &&
+        (data->state.infilesize != data->req.writebytecount) &&
+        !data->set.crlf &&
+@@ -3570,7 +3570,7 @@ static CURLcode ftp_do_more(struct conne
+                            connected back to us */
+       }
+     }
+-    else if(data->set.upload) {
++    else if(data->state.upload) {
+       result = ftp_nb_type(conn, data->set.prefer_ascii, FTP_STOR_TYPE);
+       if(result)
+         return result;
+@@ -4209,7 +4209,7 @@ CURLcode ftp_parse_url_path(struct conne
+     ftpc->file = NULL; /* instead of point to a zero byte,
+                             we make it a NULL pointer */
+ 
+-  if(data->set.upload && !ftpc->file && (ftp->transfer == FTPTRANSFER_BODY)) {
++  if(data->state.upload && !ftpc->file && (ftp->transfer == FTPTRANSFER_BODY)) {
+     /* We need a file name when uploading. Return error! */
+     failf(data, "Uploading to a URL without a file name!");
+     free(rawPath);
+--- a/lib/http.c
++++ b/lib/http.c
+@@ -2080,7 +2080,7 @@ CURLcode Curl_http(struct connectdata *c
+   }
+ 
+   if((conn->handler->protocol&(PROTO_FAMILY_HTTP|CURLPROTO_FTP)) &&
+-     data->set.upload) {
++     data->state.upload) {
+     httpreq = HTTPREQ_PUT;
+   }
+ 
+@@ -2261,7 +2261,7 @@ CURLcode Curl_http(struct connectdata *c
+     if((conn->handler->protocol & PROTO_FAMILY_HTTP) &&
+        (((httpreq == HTTPREQ_POST_MIME || httpreq == HTTPREQ_POST_FORM) &&
+          http->postsize < 0) ||
+-        ((data->set.upload || httpreq == HTTPREQ_POST) &&
++        ((data->state.upload || httpreq == HTTPREQ_POST) &&
+          data->state.infilesize == -1))) {
+       if(conn->bits.authneg)
+         /* don't enable chunked during auth neg */
+--- a/lib/imap.c
++++ b/lib/imap.c
+@@ -1469,11 +1469,11 @@ static CURLcode imap_done(struct connect
+     result = status;         /* use the already set error code */
+   }
+   else if(!data->set.connect_only && !imap->custom &&
+-          (imap->uid || imap->mindex || data->set.upload ||
++          (imap->uid || imap->mindex || data->state.upload ||
+           data->set.mimepost.kind != MIMEKIND_NONE)) {
+     /* Handle responses after FETCH or APPEND transfer has finished */
+ 
+-    if(!data->set.upload && data->set.mimepost.kind == MIMEKIND_NONE)
++    if(!data->state.upload && data->set.mimepost.kind == MIMEKIND_NONE)
+       state(conn, IMAP_FETCH_FINAL);
+     else {
+       /* End the APPEND command first by sending an empty line */
+@@ -1539,7 +1539,7 @@ static CURLcode imap_perform(struct conn
+     selected = TRUE;
+ 
+   /* Start the first command in the DO phase */
+-  if(conn->data->set.upload || data->set.mimepost.kind != MIMEKIND_NONE)
++  if(conn->data->state.upload || data->set.mimepost.kind != MIMEKIND_NONE)
+     /* APPEND can be executed directly */
+     result = imap_perform_append(conn);
+   else if(imap->custom && (selected || !imap->mailbox))
+--- a/lib/rtsp.c
++++ b/lib/rtsp.c
+@@ -499,7 +499,7 @@ static CURLcode rtsp_do(struct connectda
+      rtspreq == RTSPREQ_SET_PARAMETER ||
+      rtspreq == RTSPREQ_GET_PARAMETER) {
+ 
+-    if(data->set.upload) {
++    if(data->state.upload) {
+       putsize = data->state.infilesize;
+       data->set.httpreq = HTTPREQ_PUT;
+ 
+@@ -518,7 +518,7 @@ static CURLcode rtsp_do(struct connectda
+         result =
+           Curl_add_bufferf(&req_buffer,
+                            "Content-Length: %" CURL_FORMAT_CURL_OFF_T"\r\n",
+-                           (data->set.upload ? putsize : postsize));
++                           (data->state.upload ? putsize : postsize));
+         if(result)
+           return result;
+       }
+--- a/lib/setopt.c
++++ b/lib/setopt.c
+@@ -258,8 +258,8 @@ CURLcode Curl_vsetopt(struct Curl_easy *
+      * We want to sent data to the remote host. If this is HTTP, that equals
+      * using the PUT request.
+      */
+-    data->set.upload = (0 != va_arg(param, long)) ? TRUE : FALSE;
+-    if(data->set.upload) {
++    arg = va_arg(param, long);
++    if(arg) {
+       /* If this is HTTP, PUT is what's needed to "upload" */
+       data->set.httpreq = HTTPREQ_PUT;
+       data->set.opt_no_body = FALSE; /* this is implied */
+@@ -486,7 +486,6 @@ CURLcode Curl_vsetopt(struct Curl_easy *
+     }
+     else
+       data->set.httpreq = HTTPREQ_GET;
+-    data->set.upload = FALSE;
+     break;
+ 
+   case CURLOPT_COPYPOSTFIELDS:
+@@ -797,7 +796,6 @@ CURLcode Curl_vsetopt(struct Curl_easy *
+      */
+     if(va_arg(param, long)) {
+       data->set.httpreq = HTTPREQ_GET;
+-      data->set.upload = FALSE; /* switch off upload */
+       data->set.opt_no_body = FALSE; /* this is implied */
+     }
+     break;
+--- a/lib/smb.c
++++ b/lib/smb.c
+@@ -516,7 +516,7 @@ static CURLcode smb_send_open(struct con
+   byte_count = strlen(req->path);
+   msg.name_length = smb_swap16((unsigned short)byte_count);
+   msg.share_access = smb_swap32(SMB_FILE_SHARE_ALL);
+-  if(conn->data->set.upload) {
++  if(conn->data->state.upload) {
+     msg.access = smb_swap32(SMB_GENERIC_READ | SMB_GENERIC_WRITE);
+     msg.create_disposition = smb_swap32(SMB_FILE_OVERWRITE_IF);
+   }
+@@ -792,7 +792,7 @@ static CURLcode smb_request_state(struct
+     smb_m = (const struct smb_nt_create_response*) msg;
+     req->fid = smb_swap16(smb_m->fid);
+     conn->data->req.offset = 0;
+-    if(conn->data->set.upload) {
++    if(conn->data->state.upload) {
+       conn->data->req.size = conn->data->state.infilesize;
+       Curl_pgrsSetUploadSize(conn->data, conn->data->req.size);
+       next_state = SMB_UPLOAD;
+--- a/lib/smtp.c
++++ b/lib/smtp.c
+@@ -1210,7 +1210,7 @@ static CURLcode smtp_done(struct connect
+     result = status;         /* use the already set error code */
+   }
+   else if(!data->set.connect_only && data->set.mail_rcpt &&
+-          (data->set.upload || data->set.mimepost.kind)) {
++          (data->state.upload || data->set.mimepost.kind)) {
+     /* Calculate the EOB taking into account any terminating CRLF from the
+        previous line of the email or the CRLF of the DATA command when there
+        is "no mail data". RFC-5321, sect. 4.1.1.4.
+@@ -1297,7 +1297,7 @@ static CURLcode smtp_perform(struct conn
+   smtp->eob = 2;
+ 
+   /* Start the first command in the DO phase */
+-  if((data->set.upload || data->set.mimepost.kind) && data->set.mail_rcpt)
++  if((data->state.upload || data->set.mimepost.kind) && data->set.mail_rcpt)
+     /* MAIL transfer */
+     result = smtp_perform_mail(conn);
+   else
+--- a/lib/tftp.c
++++ b/lib/tftp.c
+@@ -390,7 +390,7 @@ static CURLcode tftp_parse_option_ack(tf
+ 
+       /* tsize should be ignored on upload: Who cares about the size of the
+          remote file? */
+-      if(!data->set.upload) {
++      if(!data->state.upload) {
+         if(!tsize) {
+           failf(data, "invalid tsize -:%s:- value in OACK packet", value);
+           return CURLE_TFTP_ILLEGAL;
+@@ -470,7 +470,7 @@ static CURLcode tftp_send_first(tftp_sta
+       return result;
+     }
+ 
+-    if(data->set.upload) {
++    if(data->state.upload) {
+       /* If we are uploading, send an WRQ */
+       setpacketevent(&state->spacket, TFTP_EVENT_WRQ);
+       state->conn->data->req.upload_fromhere =
+@@ -505,7 +505,7 @@ static CURLcode tftp_send_first(tftp_sta
+     if(!data->set.tftp_no_options) {
+       char buf[64];
+       /* add tsize option */
+-      if(data->set.upload && (data->state.infilesize != -1))
++      if(data->state.upload && (data->state.infilesize != -1))
+         msnprintf(buf, sizeof(buf), "%" CURL_FORMAT_CURL_OFF_T,
+                   data->state.infilesize);
+       else
+@@ -559,7 +559,7 @@ static CURLcode tftp_send_first(tftp_sta
+     break;
+ 
+   case TFTP_EVENT_OACK:
+-    if(data->set.upload) {
++    if(data->state.upload) {
+       result = tftp_connect_for_tx(state, event);
+     }
+     else {
+--- a/lib/transfer.c
++++ b/lib/transfer.c
+@@ -1405,6 +1405,7 @@ void Curl_init_CONNECT(struct Curl_easy
+ {
+   data->state.fread_func = data->set.fread_func_set;
+   data->state.in = data->set.in_set;
++  data->state.upload = (data->set.httpreq == HTTPREQ_PUT);
+ }
+ 
+ /*
+@@ -1816,7 +1817,7 @@ CURLcode Curl_retry_request(struct conne
+ 
+   /* if we're talking upload, we can't do the checks below, unless the protocol
+      is HTTP as when uploading over HTTP we will still get a response */
+-  if(data->set.upload &&
++  if(data->state.upload &&
+      !(conn->handler->protocol&(PROTO_FAMILY_HTTP|CURLPROTO_RTSP)))
+     return CURLE_OK;
+ 
+--- a/lib/urldata.h
++++ b/lib/urldata.h
+@@ -1427,6 +1427,7 @@ struct UrlState {
+   BIT(stream_depends_e); /* set or don't set the Exclusive bit */
+   BIT(previouslypending); /* this transfer WAS in the multi->pending queue */
+   BIT(cookie_engine);
++  BIT(upload);         /* upload request */
+ };
+ 
+ 
+@@ -1762,7 +1763,6 @@ struct UserDefined {
+   BIT(http_auto_referer); /* set "correct" referer when following
+                              location: */
+   BIT(opt_no_body);    /* as set with CURLOPT_NOBODY */
+-  BIT(upload);         /* upload request */
+   BIT(verbose);        /* output verbosity */
+   BIT(krb);            /* Kerberos connection requested */
+   BIT(reuse_forbid);   /* forbidden to be reused, close after use */
+--- a/lib/vssh/libssh.c
++++ b/lib/vssh/libssh.c
+@@ -1076,7 +1076,7 @@ static CURLcode myssh_statemach_act(stru
+     }
+ 
+     case SSH_SFTP_TRANS_INIT:
+-      if(data->set.upload)
++      if(data->state.upload)
+         state(conn, SSH_SFTP_UPLOAD_INIT);
+       else {
+         if(protop->path[strlen(protop->path)-1] == '/')
+@@ -1686,7 +1686,7 @@ static CURLcode myssh_statemach_act(stru
+       /* Functions from the SCP subsystem cannot handle/return SSH_AGAIN */
+       ssh_set_blocking(sshc->ssh_session, 1);
+ 
+-      if(data->set.upload) {
++      if(data->state.upload) {
+         if(data->state.infilesize < 0) {
+           failf(data, "SCP requires a known file size for upload");
+           sshc->actualcode = CURLE_UPLOAD_FAILED;
+@@ -1787,7 +1787,7 @@ static CURLcode myssh_statemach_act(stru
+         break;
+       }
+     case SSH_SCP_DONE:
+-      if(data->set.upload)
++      if(data->state.upload)
+         state(conn, SSH_SCP_SEND_EOF);
+       else
+         state(conn, SSH_SCP_CHANNEL_FREE);
+--- a/lib/vssh/libssh2.c
++++ b/lib/vssh/libssh2.c
+@@ -1664,7 +1664,7 @@ static CURLcode ssh_statemach_act(struct
+     }
+ 
+     case SSH_SFTP_TRANS_INIT:
+-      if(data->set.upload)
++      if(data->state.upload)
+         state(conn, SSH_SFTP_UPLOAD_INIT);
+       else {
+         if(sftp_scp->path[strlen(sftp_scp->path)-1] == '/')
+@@ -2366,7 +2366,7 @@ static CURLcode ssh_statemach_act(struct
+         break;
+       }
+ 
+-      if(data->set.upload) {
++      if(data->state.upload) {
+         if(data->state.infilesize < 0) {
+           failf(data, "SCP requires a known file size for upload");
+           sshc->actualcode = CURLE_UPLOAD_FAILED;
+@@ -2504,7 +2504,7 @@ static CURLcode ssh_statemach_act(struct
+     break;
+ 
+     case SSH_SCP_DONE:
+-      if(data->set.upload)
++      if(data->state.upload)
+         state(conn, SSH_SCP_SEND_EOF);
+       else
+         state(conn, SSH_SCP_CHANNEL_FREE);
diff --git a/meta/recipes-support/curl/curl_7.69.1.bb b/meta/recipes-support/curl/curl_7.69.1.bb
index 0141b780ee..82b07bc554 100644
--- a/meta/recipes-support/curl/curl_7.69.1.bb
+++ b/meta/recipes-support/curl/curl_7.69.1.bb
@@ -55,6 +55,8 @@ SRC_URI = "https://curl.haxx.se/download/curl-${PV}.tar.bz2 \
            file://CVE-2023-32001.patch \
            file://CVE-2023-38545.patch \
            file://CVE-2023-38546.patch \
+           file://CVE-2023-28321.patch \
+           file://CVE-2023-28322.patch \
 "
 
 SRC_URI[md5sum] = "ec5fc263f898a3dfef08e805f1ecca42"
-- 
2.34.1


