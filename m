Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 212CFC369D1
	for <webhook@archiver.kernel.org>; Wed, 23 Apr 2025 13:20:57 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web11.8576.1745414452510763680
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Apr 2025 06:20:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=mwgELpjP;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.180, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-736bfa487c3so5914706b3a.1
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Apr 2025 06:20:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1745414452; x=1746019252; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jD4UzGrNdbRviDkWORKeyeVvfJZaSxepEHhC8DDkDjk=;
        b=mwgELpjPn3Qdpoh2p3fi3uXtIJrRgQinrd9jMcaKu2fcQh2tVhEL6exxY2FrV6IGhL
         oqJT7UgxwI2eJTPVvW2XpWNqO3XXKQtZqxydcE3cqu1SpIxGRNY6NME3CtkFzVTtH6QV
         MMaa6tiQE6zJzbeNd0upeX8gb2Gzi+edCun3Dn2d4SHz7BNgDdG7v03m/ZkYtS7WV9nJ
         4zKwx2SbeLaxI+1SDNOFJrsvgfBpCf1gJi8/a7nvpnQ5dEpR49f6YCPwiO40kzFJRI+i
         jGSnxb+6EIClyG2RHjiI5RoH+XRMVX5hZEdwpS4xP0Yr9ldyaUPNdmnVpBba5Hr3Cxym
         wlrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745414452; x=1746019252;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jD4UzGrNdbRviDkWORKeyeVvfJZaSxepEHhC8DDkDjk=;
        b=mus5Uy0Rc5wd9OQh1+03kqAFCL8aO8gEI46UDV0wkjSMn9N+fn7ArF2p40fB13zEZb
         ygV+JtbR1qhP0lHeDGIX7cU0HhB7sMFyMyCB59fWw9/LY2mvDxB6Mynq67UwX0BXAOj0
         MhCH/+E2oxDXY2VLVpIdYGGGRi3T9mFX6Eotmk8ckPd6cWBDlLp89UoBfwZZVltBOngf
         CxHyXdh1dYPavJ5lh6UoDD+Pw7xiyDWMAd/yK9dGTTBmMHt+ASRdXXXFC2kC3fXkPYXO
         LDE15FbPvTxO2/X3CqVZM2Mc0nLV20tijRY13AGo2eik2mDN/QhSsy2uhyWLV9u6+lAK
         MLHQ==
X-Gm-Message-State: AOJu0YxKI0/9nfnznkyV/B6L7zLk/koKJBX8MKiPNFJq5xt4d9+oazym
	eTeXxaVtlHEq0mG+0rvqglxkVZHA0yK2BcWQ5kc7C6ExieVJpqC4spMPMbMTENxYksia738XHXh
	K
X-Gm-Gg: ASbGncvq9QIUl5Wr6v6wwAhb9y46Qqeh5r2yhQSdo2G0flHy/bL28JEgC6v0NFqpghq
	Fd05rwrcTmvwgThCuyCbMMVvoseKXuD7dDLVTUFoBZGsy2kXSmvlPHl36WXvPdVxhG8bYlcIiW0
	nj7U6qsdVcy8zEOXybx48VBfmcqvUbrY/ZU04xxucyetoqTY3j70q1pGT0Jyp8LI3BHJErn/Coj
	UOzDdJXI9ldgTpzuEmJWJCWUWdspqtJAE+sZ2WDbXGz4lvAt7PWkIXyd9odcaXZbdZbXIHyjK7H
	5pltODpMBtIcpkkozGFTYoOMBH53Slw=
X-Google-Smtp-Source: AGHT+IGOCI5eeC+86BDeQyuYD9plWOc6xTUViJCQxJ/U3IbaNiT8qfnB2fO5DvPIkwxMt2HUVe0/AA==
X-Received: by 2002:a05:6a00:928e:b0:736:51ab:7aed with SMTP id d2e1a72fcca58-73dc1582877mr25288014b3a.16.1745414451482;
        Wed, 23 Apr 2025 06:20:51 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:371e:10cb:f3ce:33f])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbf8e510bsm10898037b3a.66.2025.04.23.06.20.50
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 06:20:51 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 10/14] curl: fix CVE-2025-0167
Date: Wed, 23 Apr 2025 06:20:21 -0700
Message-ID: <b74dba43f2d6896245232373f2a9fdf07086a237.1745356684.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1745356684.git.steve@sakoman.com>
References: <cover.1745356684.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Apr 2025 13:20:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215303

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
https://github.com/curl/curl/commit/0e120c5b925e8ca75d5319e

Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../curl/curl/CVE-2025-0167.patch             | 178 ++++++++++++++++++
 meta/recipes-support/curl/curl_8.7.1.bb       |   1 +
 2 files changed, 179 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2025-0167.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2025-0167.patch b/meta/recipes-support/curl/curl/CVE-2025-0167.patch
new file mode 100644
index 0000000000..6dad98ef7a
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2025-0167.patch
@@ -0,0 +1,178 @@
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
+Upstream-Status: Backport [https://github.com/curl/curl/commit/0e120c5b925e8ca75d5319e]
+
+Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
+---
+ lib/netrc.c             |  15 ++++--
+ tests/data/Makefile.inc |   2 +-
+ tests/data/test486      | 105 ++++++++++++++++++++++++++++++++++++++++
+ 3 files changed, 116 insertions(+), 6 deletions(-)
+ create mode 100644 tests/data/test486
+
+diff --git a/lib/netrc.c b/lib/netrc.c
+index 64efdc0..5533ecc 100644
+--- a/lib/netrc.c
++++ b/lib/netrc.c
+@@ -263,11 +263,16 @@ static int parsenetrc(const char *host,
+
+ out:
+     Curl_dyn_free(&buf);
+-    if(!retcode && !password && our_login) {
+-      /* success without a password, set a blank one */
+-      password = strdup("");
+-      if(!password)
+-        retcode = 1; /* out of memory */
++    if(!retcode) {
++     if(!password && our_login) {
++       /* success without a password, set a blank one */
++       password = strdup("");
++       if(!password)
++         retcode = 1; /* out of memory */
++     }
++     else if(!login && !password)
++       /* a default with no credentials */
++       retcode = NETRC_FILE_MISSING;
+     }
+     if(!retcode) {
+       /* success */
+diff --git a/tests/data/Makefile.inc b/tests/data/Makefile.inc
+index e3508cb..7a8074f 100644
+--- a/tests/data/Makefile.inc
++++ b/tests/data/Makefile.inc
+@@ -73,7 +73,7 @@ test426 test427 test428 test429 test430 test431 test432 test433 test434 \
+ test435 test436 test437 test438 test439 test440 test441 test442 test443 \
+ test444 test445 test446 test447 test448 test449 test450 test451 test452 \
+ test453 test454 test455 test456 test457 test458 test459 test460 test461 \
+-test462 test463 test467 test468 test478 test479 test480 \
++test462 test463 test467 test468 test478 test479 test480 test486 \
+ \
+ test490 test491 test492 test493 test494 test495 test496 test497 test498 \
+ test499 test500 test501 test502 test503 test504 test505 test506 test507 \
+diff --git a/tests/data/test486 b/tests/data/test486
+new file mode 100644
+index 0000000..093899e
+--- /dev/null
++++ b/tests/data/test486
+@@ -0,0 +1,105 @@
++<testcase>
++ <info>
++ <keywords>
++ netrc
++ HTTP
++ </keywords>
++ </info>
++ #
++ # Server-side
++ <reply>
++ <data crlf="yes">
++ HTTP/1.1 301 Follow this you fool
++ Date: Tue, 09 Nov 2010 14:49:00 GMT
++ Server: test-server/fake
++ Last-Modified: Tue, 13 Jun 2000 12:10:00 GMT
++ ETag: "21025-dc7-39462498"
++ Accept-Ranges: bytes
++ Content-Length: 6
++ Connection: close
++ Location: http://b.com/%TESTNUMBER0002
++
++ -foo-
++ </data>
++
++ <data2 crlf="yes">
++ HTTP/1.1 200 OK
++ Date: Tue, 09 Nov 2010 14:49:00 GMT
++ Server: test-server/fake
++ Last-Modified: Tue, 13 Jun 2000 12:10:00 GMT
++ ETag: "21025-dc7-39462498"
++ Accept-Ranges: bytes
++ Content-Length: 7
++ Connection: close
++
++ target
++ </data2>
++
++ <datacheck crlf="yes">
++ HTTP/1.1 301 Follow this you fool
++ Date: Tue, 09 Nov 2010 14:49:00 GMT
++ Server: test-server/fake
++ Last-Modified: Tue, 13 Jun 2000 12:10:00 GMT
++ ETag: "21025-dc7-39462498"
++ Accept-Ranges: bytes
++ Content-Length: 6
++ Connection: close
++ Location: http://b.com/%TESTNUMBER0002
++
++ HTTP/1.1 200 OK
++ Date: Tue, 09 Nov 2010 14:49:00 GMT
++ Server: test-server/fake
++ Last-Modified: Tue, 13 Jun 2000 12:10:00 GMT
++ ETag: "21025-dc7-39462498"
++ Accept-Ranges: bytes
++ Content-Length: 7
++ Connection: close
++
++ target
++ </datacheck>
++ </reply>
++
++ #
++ # Client-side
++ <client>
++ <server>
++ http
++ </server>
++ <features>
++ proxy
++ </features>
++ <name>
++ .netrc with redirect and "default" with no password or login
++ </name>
++ <command>
++ --netrc --netrc-file log/netrc%TESTNUMBER -L -x http://%HOSTIP:%HTTPPORT/ http://a.com/
++ </command>
++ <file name="log/netrc%TESTNUMBER" >
++
++ machine a.com
++   login alice
++   password alicespassword
++
++ default
++
++ </file>
++ </client>
++
++ <verify>
++ <protocol>
++ GET http://a.com/ HTTP/1.1
++ Host: a.com
++ Authorization: Basic %b64[alice:alicespassword]b64%
++ User-Agent: curl/%VERSION
++ Accept: */*
++ Proxy-Connection: Keep-Alive
++
++ GET http://b.com/%TESTNUMBER0002 HTTP/1.1
++ Host: b.com
++ User-Agent: curl/%VERSION
++ Accept: */*
++ Proxy-Connection: Keep-Alive
++
++ </protocol>
++ </verify>
++ </testcase>
+--
+2.40.0
diff --git a/meta/recipes-support/curl/curl_8.7.1.bb b/meta/recipes-support/curl/curl_8.7.1.bb
index 6d6563591c..8ce8caadf0 100644
--- a/meta/recipes-support/curl/curl_8.7.1.bb
+++ b/meta/recipes-support/curl/curl_8.7.1.bb
@@ -23,6 +23,7 @@ SRC_URI = " \
     file://CVE-2024-11053-0001.patch \
     file://CVE-2024-11053-0002.patch \
     file://CVE-2024-11053-0003.patch \
+    file://CVE-2025-0167.patch \
 "
 SRC_URI[sha256sum] = "6fea2aac6a4610fbd0400afb0bcddbe7258a64c63f1f68e5855ebc0c659710cd"
 
-- 
2.43.0


