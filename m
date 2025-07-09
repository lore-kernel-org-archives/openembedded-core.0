Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55E02C83F03
	for <webhook@archiver.kernel.org>; Wed,  9 Jul 2025 15:19:35 +0000 (UTC)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.web10.18424.1752074372122807604
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Jul 2025 08:19:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=KLmVc4fl;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.173, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-b31d489a76dso92674a12.1
        for <openembedded-core@lists.openembedded.org>; Wed, 09 Jul 2025 08:19:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1752074371; x=1752679171; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t/WXBE3n7i3uRdr0J7DEyEHcV83Nso5kBw5mZtn//TY=;
        b=KLmVc4flZM8bRapEHMYNI67OkUXRWMThAqodLz3pTmrPHQIBIkbctSxRfW3aG3t7Jg
         961OSqmvkhYbFMg0b/hBeYWFiQQ78GJ80ms17RwJn0H3FK6v9W9PtCGuFKZXjtzk/3px
         4IwzLeZ2Fg0G2sil3Q+QkLcqBmtsofdPTiVLKZY2q/Zcd1KJL0lpiKMdkWIdoHGFNkhf
         27Onc6dkoekx+zNrpf4L4KnedEoZxgcqzKTxbnXlcz/6GbgPeOWN3nfJaa286rJkvHf3
         dEQupnz8FLTNHiEl/Uywst3cHA4Zol6gq8nD1Tgdwk0YrpufJz1N9Xuw2ddfH6+4JzY0
         Mz9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752074371; x=1752679171;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t/WXBE3n7i3uRdr0J7DEyEHcV83Nso5kBw5mZtn//TY=;
        b=rcskwJ+oGg6MqiriBF0cTPJFwX/iTp4UHg4awAnlBRRrDnYPA2o842kYnckmwZsNCt
         aEfAfxETfjK3ETf9wCXLRYHjz5b6RY8UD0wZvzfXxOUtvpLV5SDvsPBUqCHqTx15KUgY
         IQ3HWqCs6AjhwYcLKC0NXEquGTmYYgSIVk9xbQoyBPCLQgYX6Ts+R2xkeLhpkpRSpWLt
         zkFi1/dpSpoig6ozIolP/DO3ISZz+LDmBsBZ1OYqduz4Cpr8zbXEGUraLfYTDyz3G0CB
         D0/BTPLzJCv2ZkHj9Y9se2SrOF4VDn5SpAWoSbkrPACZK9ZXKJwwQimTOAg7FOZVD8jR
         hK6w==
X-Gm-Message-State: AOJu0YyduWiPxjiziXrqK857Lf9KS3SKkXnNyHjP/gR+2RgjpOHcq1XV
	S7gNBJBA82EhA3rc/SLuFkxfq+CApIHv7RjWCXUw734DMTuDbX/FzQ3A/AHOq5Q0fl/tL7iUUsk
	H6Ohx
X-Gm-Gg: ASbGncvwlOQrHQcbR1nLpPUWnT+ZaVCx2BUgPFL+DwKMhtRY1ZVbHbgTAQz/T8BFzr6
	xYH+lOc/SrgB0veq0mux3Zz76zsmar5vCkEHY1yBdfDY7zqeVuY69oyuwAnwP+BHD0lE7EY/h+t
	8SMuNo9lunDMSUggfNUoHqL4z0oKwOAk/weuBRJ5ZDvZwXuED/FIfi2j42Cvd9EM/AwpW45ImIK
	wfc5/7sbK2xJ1nuecNsbHuFB4QWK1HbbItqMS7u3ypgQUqL+vydB/ij48J9aoQbQ7lQaxnoSft7
	Trd3Zl/NyWenQG9rhvbe49Qm8fStzZrcCO04pFbOZez/Y6IiuXTQPQ==
X-Google-Smtp-Source: AGHT+IGftDtBP4H1jNY52o4mwqfm1obX07T7cEKvjXEvIZRGJJsZGPWv3l1dkK5AKr19bCYGoR05Lw==
X-Received: by 2002:a17:90b:1dce:b0:31c:38f8:7e84 with SMTP id 98e67ed59e1d1-31c38f87f76mr1982976a91.16.1752074371081;
        Wed, 09 Jul 2025 08:19:31 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:a6e1:d218:3fcc:fd7d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31c3019e934sm2340536a91.33.2025.07.09.08.19.30
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 08:19:30 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 07/11] curl: fix CVE-2025-0167
Date: Wed,  9 Jul 2025 08:19:10 -0700
Message-ID: <7c5aee3066e4c8056d994cd50b26c18a16316c96.1752073806.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1752073806.git.steve@sakoman.com>
References: <cover.1752073806.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Jul 2025 15:19:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220098

From: Yogita Urade <yogita.urade@windriver.com>

When asked to use a `.netrc` file for credentials *and* to
follow HTTP redirects, curl could leak the password used
for the first host to the followed-to host under certain
circumstances.

This flaw only manifests itself if the netrc file has a
`default` entry that omits both login and password. A
rare circumstance.

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2025-0167

Upstream patch:
https://github.com/curl/curl/commit/0e120c5b925e8ca75d5319e319e5ce4b8080d8eb

Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../curl/curl/CVE-2025-0167.patch             | 175 ++++++++++++++++++
 meta/recipes-support/curl/curl_7.82.0.bb      |   1 +
 2 files changed, 176 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2025-0167.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2025-0167.patch b/meta/recipes-support/curl/curl/CVE-2025-0167.patch
new file mode 100644
index 0000000000..b803cff0d2
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2025-0167.patch
@@ -0,0 +1,175 @@
+From 0e120c5b925e8ca75d5319e319e5ce4b8080d8eb Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Fri, 3 Jan 2025 16:22:27 +0100
+Subject: [PATCH] netrc: 'default' with no credentials is not a match
+
+Test 486 verifies.
+
+Reported-by: Yihang Zhou
+
+Closes #15908
+
+Changes:
+- Test files are added in Makefile.inc.
+- Adjust `%LOGDIR/` to 'log/' due to its absence in code.
+
+CVE: CVE-2025-0167
+Upstream-Status: Backport [https://github.com/curl/curl/commit/0e120c5b925e8ca75d5319e319e5ce4b8080d8eb]
+
+Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
+---
+ lib/netrc.c            |   7 ++-
+ tests/data/Makefile.in |   2 +
+ tests/data/test486     | 105 +++++++++++++++++++++++++++++++++++++++++
+ 3 files changed, 113 insertions(+), 1 deletion(-)
+ create mode 100644 tests/data/test486
+
+diff --git a/lib/netrc.c b/lib/netrc.c
+index 23080b3..6d87007 100644
+--- a/lib/netrc.c
++++ b/lib/netrc.c
+@@ -205,12 +205,17 @@ static int parsenetrc(const char *host,
+     } /* while fgets() */
+
+     out:
+-    if(!retcode && !password && our_login) {
++  if(!retcode) {
++    if(!password && our_login) {
+       /* success without a password, set a blank one */
+       password = strdup("");
+       if(!password)
+         retcode = 1; /* out of memory */
+     }
++    else if(!login && !password)
++      /* a default with no credentials */
++      retcode = NETRC_FILE_MISSING;
++    }
+     if(!retcode) {
+       /* success */
+       *login_changed = FALSE;
+diff --git a/tests/data/Makefile.in b/tests/data/Makefile.in
+index 3da7d31..5a3ec48 100644
+--- a/tests/data/Makefile.in
++++ b/tests/data/Makefile.in
+@@ -431,6 +431,8 @@ test409 test410 \
+ \
+ test430 test431 test432 test433 test434 test435 test436 \
+ \
++test486 \
++\
+ test490 test491 test492 test493 test494 \
+ \
+ test500 test501 test502 test503 test504 test505 test506 test507 test508 \
+diff --git a/tests/data/test486 b/tests/data/test486
+new file mode 100644
+index 0000000..6926092
+--- /dev/null
++++ b/tests/data/test486
+@@ -0,0 +1,105 @@
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
++.netrc with redirect and "default" with no password or login
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
++User-Agent: curl/%VERSION
++Accept: */*
++Proxy-Connection: Keep-Alive
++
++</protocol>
++</verify>
++</testcase>
+--
+2.40.0
diff --git a/meta/recipes-support/curl/curl_7.82.0.bb b/meta/recipes-support/curl/curl_7.82.0.bb
index f40139418a..623d8a4bc3 100644
--- a/meta/recipes-support/curl/curl_7.82.0.bb
+++ b/meta/recipes-support/curl/curl_7.82.0.bb
@@ -65,6 +65,7 @@ SRC_URI = "https://curl.se/download/${BP}.tar.xz \
            file://CVE-2024-9681.patch \
            file://CVE-2024-11053-0001.patch \
            file://CVE-2024-11053-0002.patch \
+           file://CVE-2025-0167.patch \
            "
 SRC_URI[sha256sum] = "0aaa12d7bd04b0966254f2703ce80dd5c38dbbd76af0297d3d690cdce58a583c"
 
-- 
2.43.0


