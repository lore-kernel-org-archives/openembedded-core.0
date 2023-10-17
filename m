Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EE23CDB483
	for <webhook@archiver.kernel.org>; Tue, 17 Oct 2023 18:42:41 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web10.238782.1697568159458556616
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Oct 2023 11:42:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=zchCi6Kr;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.178, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-6b44befac59so3254918b3a.0
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Oct 2023 11:42:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1697568158; x=1698172958; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z2RnESX2SP/ECtVNQrponKcSdesX/dLdm0cRBVb3QSY=;
        b=zchCi6Krbji708ZOBWNWUhYvOeh8mXU0VkY90f7hK6pSr59Ii0i8ohLQwXCJcQO6Wp
         VGjfbuMT0vk6Fh4kPr4MH28stXrvYQfhS7FY+gLZjpL0OnHrbbgHs0tuuFlo4Yf0c9zT
         KzEArcsJWBSwe0VSJpuR2ulVQB74VZwjrNnJFvLpdlPnd3rUJxCib/3upIPT0MMsd0o0
         COOGsYcVmJKzCcKXloq5k4wttRX64EMPZ2U2f1h3CXoWGf53xgsA+3RKbWbWHBtCWNpT
         Knxd83N/DDQAr87F9wC8HQEF/G548B7yVC52zGzmxo5jsdJ5+TSezx2OkJHmih2r9q92
         9n5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697568158; x=1698172958;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z2RnESX2SP/ECtVNQrponKcSdesX/dLdm0cRBVb3QSY=;
        b=LeXCLXa+1XSczTq/swCciVPVZuDmbNouDK9KAFE++ajGzs3M+q0hnmmgQLe/qOi4k3
         RkSYkGvW0nF4GwfBE7u8IYs+u/NT83goF/ZzMd4KNGPD4xfGnC0V/xj4Khpp1ZFED66c
         R09ePUvtpnmp4uN8T/2TFWOmq5uyJmlR89nX0t4frJ7zyFNk5pAxBnarvo5IYUoEMK67
         Z+nWAeyOlwtwemLkDbjdpx2bGs0/Wr7/eHX5LxsjyrPzXBu+5zuYVVuUmzW3NJodU5AY
         Br6xBWFyXfN57CXXypaAaBG6cCKAkjrPsadf5uT4kbMGkkMRAJBUho0yJ3F4+J/UmbNn
         pTjA==
X-Gm-Message-State: AOJu0Yz3y1nlEjwYq+KxAMACG8eBbHC+2MoLFQw7rBSMu7O0ULyV1to4
	7NhVeGHMBJfJVxVc8hUS1t0C+dTPelbteQPWIgU=
X-Google-Smtp-Source: AGHT+IGsZRw71gRErTifnisUbtVAYBJq6fqCFsdAmA0Ni3j88vV5+qzTrxXGqyiuSbfkwcxI2OT+Kg==
X-Received: by 2002:a05:6a20:840b:b0:17a:e981:7fe4 with SMTP id c11-20020a056a20840b00b0017ae9817fe4mr5019233pzd.16.1697568158375;
        Tue, 17 Oct 2023 11:42:38 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id w123-20020a626281000000b0066a31111cc5sm1838715pfb.152.2023.10.17.11.42.37
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Oct 2023 11:42:38 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 02/10] curl: Backport fix for CVE-2023-38545
Date: Tue, 17 Oct 2023 08:42:22 -1000
Message-Id: <ccec26b1437f1ece4cb4f27581b0df904297358f.1697567211.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1697567211.git.steve@sakoman.com>
References: <cover.1697567211.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Oct 2023 18:42:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189353

From: Mike Crowe <mac@mcrowe.com>

Backporting this change required tweaking the error value since the
two-level CURLE_PROXY error reporting was introduced after curl
7.69.1. The test required some tweaks to not rely on more-recent
improvements to the test infrastructure too.

Signed-off-by: Mike Crowe <mac@mcrowe.com>
CVE: CVE-2023-38545
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../curl/curl/CVE-2023-38545.patch            | 148 ++++++++++++++++++
 meta/recipes-support/curl/curl_7.69.1.bb      |   1 +
 2 files changed, 149 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2023-38545.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2023-38545.patch b/meta/recipes-support/curl/curl/CVE-2023-38545.patch
new file mode 100644
index 0000000000..c6b6726886
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2023-38545.patch
@@ -0,0 +1,148 @@
+From 600a1caeb2312fdee5ef1caf7d613c12a8b2424a Mon Sep 17 00:00:00 2001
+From: Mike Crowe <mac@mcrowe.com>
+Date: Wed, 11 Oct 2023 20:50:28 +0100
+Subject: [PATCH] socks: return error if hostname too long for remote resolve
+To: libcurl development <curl-library@cool.haxx.se>
+
+Prior to this change the state machine attempted to change the remote
+resolve to a local resolve if the hostname was longer than 255
+characters. Unfortunately that did not work as intended and caused a
+security issue.
+
+Name resolvers cannot resolve hostnames longer than 255 characters.
+
+Bug: https://curl.se/docs/CVE-2023-38545.html
+
+Unfortunately CURLE_PROXY and CURLPX_LONG_HOSTNAME were introduced in
+7.73.0 so they can't be used in 7.69.1. Let's use
+CURLE_COULDNT_RESOLVE_HOST as the best available alternative and update
+the test appropriately.
+
+libcurl's test support has been improved considerably since 7.69.1 which
+means that the test must be modified to remove use of %VERSION and
+%TESTNUMBER and the stderr output can no longer be checked.
+
+CVE: CVE-2023-38545
+Upstream-Status: Backport [fb4415d8aee6c1045be932a34fe6107c2f5ed147]
+Signed-off-by: Mike Crowe <mac@mcrowe.com>
+---
+ lib/socks.c             | 13 +++++----
+ tests/data/Makefile.inc |  2 +-
+ tests/data/test728      | 60 +++++++++++++++++++++++++++++++++++++++++
+ 3 files changed, 69 insertions(+), 6 deletions(-)
+ create mode 100644 tests/data/test728
+
+diff --git a/lib/socks.c b/lib/socks.c
+index 37099130e..f3bf40533 100644
+--- a/lib/socks.c
++++ b/lib/socks.c
+@@ -521,11 +521,14 @@ CURLcode Curl_SOCKS5(const char *proxy_user,
+       infof(conn->data, "SOCKS5: connecting to HTTP proxy %s port %d\n",
+             hostname, remote_port);
+ 
+-    /* RFC1928 chapter 5 specifies max 255 chars for domain name in packet */
++    /* RFC1928 chapter 5 specifies max 255 chars for domain name in packet. */
+     if(!socks5_resolve_local && hostname_len > 255) {
+-      infof(conn->data, "SOCKS5: server resolving disabled for hostnames of "
+-            "length > 255 [actual len=%zu]\n", hostname_len);
+-      socks5_resolve_local = TRUE;
++      failf(data, "SOCKS5: the destination hostname is too long to be "
++            "resolved remotely by the proxy.");
++      /* This version of libcurl doesn't have CURLE_PROXY and
++       * therefore CURLPX_LONG_HOSTNAME, so let's report the best we
++       * can. */
++      return CURLE_COULDNT_RESOLVE_HOST;
+     }
+ 
+     if(auth & ~(CURLAUTH_BASIC | CURLAUTH_GSSAPI))
+@@ -837,7 +840,7 @@ CURLcode Curl_SOCKS5(const char *proxy_user,
+ 
+     if(!socks5_resolve_local) {
+       socksreq[len++] = 3; /* ATYP: domain name = 3 */
+-      socksreq[len++] = (char) hostname_len; /* one byte address length */
++      socksreq[len++] = (unsigned char) hostname_len; /* one byte length */
+       memcpy(&socksreq[len], hostname, hostname_len); /* address w/o NULL */
+       len += hostname_len;
+       infof(data, "SOCKS5 connect to %s:%d (remotely resolved)\n",
+diff --git a/tests/data/Makefile.inc b/tests/data/Makefile.inc
+index 3d8565c36..5ee2284ff 100644
+--- a/tests/data/Makefile.inc
++++ b/tests/data/Makefile.inc
+@@ -89,7 +89,7 @@ test662 test663 test664 test665 test666 test667 test668 \
+ test670 test671 test672 test673 \
+ \
+ test700 test701 test702 test703 test704 test705 test706 test707 test708 \
+-test709 test710 test711 test712 test713 test714 test715 test716 test717 \
++test709 test710 test711 test712 test713 test714 test715 test716 test717 test728 \
+ \
+ test800 test801 test802 test803 test804 test805 test806 test807 test808 \
+ test809 test810 test811 test812 test813 test814 test815 test816 test817 \
+diff --git a/tests/data/test728 b/tests/data/test728
+new file mode 100644
+index 000000000..7b1d8b2f3
+--- /dev/null
++++ b/tests/data/test728
+@@ -0,0 +1,60 @@
++<testcase>
++<info>
++<keywords>
++HTTP
++HTTP GET
++SOCKS5
++SOCKS5h
++followlocation
++</keywords>
++</info>
++
++#
++# Server-side
++<reply>
++# The hostname in this redirect is 256 characters and too long (> 255) for
++# SOCKS5 remote resolve. curl must return error CURLE_PROXY in this case.
++<data>
++HTTP/1.1 301 Moved Permanently
++Location: http://AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA/
++Content-Length: 0
++Connection: close
++
++</data>
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
++socks5
++</server>
++ <name>
++SOCKS5h with HTTP redirect to hostname too long
++ </name>
++ <command>
++--no-progress-meter --location --proxy socks5h://%HOSTIP:%SOCKSPORT http://%HOSTIP:%HTTPPORT/728
++</command>
++</client>
++
++#
++# Verify data after the test has been "shot"
++<verify>
++<strip>
++^User-Agent:.*
++</strip>
++<protocol>
++GET /728 HTTP/1.1
++Host: %HOSTIP:%HTTPPORT
++Accept: */*
++
++</protocol>
++<errorcode>
++6
++</errorcode>
++</verify>
++</testcase>
+-- 
+2.39.2
+
diff --git a/meta/recipes-support/curl/curl_7.69.1.bb b/meta/recipes-support/curl/curl_7.69.1.bb
index 2a52e8233e..4012776613 100644
--- a/meta/recipes-support/curl/curl_7.69.1.bb
+++ b/meta/recipes-support/curl/curl_7.69.1.bb
@@ -53,6 +53,7 @@ SRC_URI = "https://curl.haxx.se/download/curl-${PV}.tar.bz2 \
            file://CVE-2023-28320.patch \
            file://CVE-2023-28320-fol1.patch \
            file://CVE-2023-32001.patch \
+           file://CVE-2023-38545.patch \
 "
 
 SRC_URI[md5sum] = "ec5fc263f898a3dfef08e805f1ecca42"
-- 
2.34.1


