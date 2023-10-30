Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6F54C4167D
	for <webhook@archiver.kernel.org>; Mon, 30 Oct 2023 02:21:18 +0000 (UTC)
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
 by mx.groups.io with SMTP id smtpd.web11.140926.1698632474958144298
 for <openembedded-core@lists.openembedded.org>;
 Sun, 29 Oct 2023 19:21:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=XzrSRE0e;
 spf=softfail (domain: sakoman.com, ip: 209.85.161.42, mailfrom: steve@sakoman.com)
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-586ad15f9aaso2027039eaf.2
        for <openembedded-core@lists.openembedded.org>; Sun, 29 Oct 2023 19:21:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1698632474; x=1699237274; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2UPhbTkxwEAoiXp5z2+L55ZX+aVu1a/kxnF5S8/Eiqo=;
        b=XzrSRE0eb3B5jtqEVpxXyzvBYJMhjxQI9cqjmcbvABYoPiGF71NjVw9DRrWqL0u9tX
         l44Tb7yKmuK14E0ye4AUdyz07KFpWTRVrGM72w7AEEntUBkM7pcNYfpLa249BhbNwzsv
         Yy0zsJ7sP1wr2uYudgZLKgbZEokhfcFQnxnkIAm+ER8eVxP8rCZV+g/M/mcpWnqLI9df
         7TbW2hevkY8StqgERZo/qdGJDxmX3ojpktcJFzlBO1iEVOJc+B88Hst/iK2obKYy1TSU
         HTkMgP0JjlYfhWkr2aw7htmfjhBTfydGHIQU+/05w2igEKB6iscBR6VFVKCVuvfYniE4
         y9SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698632474; x=1699237274;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2UPhbTkxwEAoiXp5z2+L55ZX+aVu1a/kxnF5S8/Eiqo=;
        b=Vi5pmyns1zx3yGBP6oOfdkqmgNaDHw2DVBL55sPdT6A1mdsHsHlNaKGQ9fVuFVxY/H
         s4yRKzwJ+XqNu5E215l58My96SNa7ToZaVEvwQWEW5+4YSG0TIfDys7E9YlHeuNjEG9I
         rbME2E/BgtmBnqEL6E01kNpUGUFDQ5PTck3w9yP3QYM98LUqJMuvbu2K6AFaEcETgaZb
         pKZMtEJRBdsI5qGVx+28koZ9TR3gvR3nDmiGrIpOFu3DlercbRHTxAqYupbCyLyUp+Cv
         3LriNbFKfdMhQ+BMkSF3DghhczMNNIS53KpX+tpy/d4Xac0E6OihRONpSPLBhqC5CLWy
         l39g==
X-Gm-Message-State: AOJu0Yyr2FcDKgAQ7dLBrNQ/k4CyECTYDKGC7edlgLQaxcgVxWbEJd0c
	690c4RWWvnR+nsBM4o8Z6eq1H7zfMGqgN08nAubEjQ==
X-Google-Smtp-Source: AGHT+IHt++3zhKEgJS3YcwS8A4XvA6jNVzM0RQHbcZNsn2Tk4iNilSCY5x55iLFb2IeZgr03ei8m5A==
X-Received: by 2002:a05:6359:6c87:b0:168:ea50:fcc6 with SMTP id td7-20020a0563596c8700b00168ea50fcc6mr6509568rwb.16.1698632473663;
        Sun, 29 Oct 2023 19:21:13 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id k2-20020a637b42000000b0057412d84d25sm3900046pgn.4.2023.10.29.19.21.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Oct 2023 19:21:13 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 2/7] curl: fix CVE-2023-38545
Date: Sun, 29 Oct 2023 16:20:53 -1000
Message-Id: <44971c945a615d07c91100f514377f7247796334.1698632320.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1698632320.git.steve@sakoman.com>
References: <cover.1698632320.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Oct 2023 02:21:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189782

From: Archana Polampalli <archana.polampalli@windriver.com>

This flaw makes curl overflow a heap based buffer in the SOCKS5 proxy handshake.

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../curl/curl/CVE-2023-38545.patch            | 133 ++++++++++++++++++
 meta/recipes-support/curl/curl_7.82.0.bb      |   1 +
 2 files changed, 134 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2023-38545.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2023-38545.patch b/meta/recipes-support/curl/curl/CVE-2023-38545.patch
new file mode 100644
index 0000000000..c198d29c04
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2023-38545.patch
@@ -0,0 +1,133 @@
+From fb4415d8aee6c1045be932a34fe6107c2f5ed147 Mon Sep 17 00:00:00 2001
+From: Jay Satiro <raysatiro@yahoo.com>
+Date: Wed, 11 Oct 2023 07:34:19 +0200
+Subject: [PATCH] socks: return error if hostname too long for remote resolve
+
+Prior to this change the state machine attempted to change the remote
+resolve to a local resolve if the hostname was longer than 255
+characters. Unfortunately that did not work as intended and caused a
+security issue.
+
+Upstream-Status: Backport [https://github.com/curl/curl/commit/fb4415d8aee6c1045be932a34fe6107c2f5ed147]
+
+CVE: CVE-2023-38545
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ lib/socks.c             |  8 +++---
+ tests/data/Makefile.inc |  2 +-
+ tests/data/test722      | 64 +++++++++++++++++++++++++++++++++++++++++
+ 3 files changed, 69 insertions(+), 5 deletions(-)
+ create mode 100644 tests/data/test722
+
+diff --git a/lib/socks.c b/lib/socks.c
+index a014aa6..2215c02 100644
+--- a/lib/socks.c
++++ b/lib/socks.c
+@@ -536,9 +536,9 @@ CURLproxycode Curl_SOCKS5(const char *proxy_user,
+
+     /* RFC1928 chapter 5 specifies max 255 chars for domain name in packet */
+     if(!socks5_resolve_local && hostname_len > 255) {
+-      infof(data, "SOCKS5: server resolving disabled for hostnames of "
+-            "length > 255 [actual len=%zu]", hostname_len);
+-      socks5_resolve_local = TRUE;
++      failf(data, "SOCKS5: the destination hostname is too long to be "
++            "resolved remotely by the proxy.");
++      return CURLPX_LONG_HOSTNAME;
+     }
+
+     if(auth & ~(CURLAUTH_BASIC | CURLAUTH_GSSAPI))
+@@ -879,7 +879,7 @@ CURLproxycode Curl_SOCKS5(const char *proxy_user,
+       }
+       else {
+         socksreq[len++] = 3;
+-        socksreq[len++] = (char) hostname_len; /* one byte address length */
++	socksreq[len++] = (unsigned char) hostname_len; /* one byte length */
+         memcpy(&socksreq[len], hostname, hostname_len); /* address w/o NULL */
+         len += hostname_len;
+       }
+diff --git a/tests/data/Makefile.inc b/tests/data/Makefile.inc
+index 3064b39..47117b6 100644
+--- a/tests/data/Makefile.inc
++++ b/tests/data/Makefile.inc
+@@ -99,7 +99,7 @@ test670 test671 test672 test673 test674 test675 test676 test677 test678 \
+ \
+ test700 test701 test702 test703 test704 test705 test706 test707 test708 \
+ test709 test710 test711 test712 test713 test714 test715 test716 test717 \
+-test718 test719 test720 test721 \
++test718 test719 test720 test721 test722 \
+ \
+ test800 test801 test802 test803 test804 test805 test806 test807 test808 \
+ test809 test810 test811 test812 test813 test814 test815 test816 test817 \
+diff --git a/tests/data/test722 b/tests/data/test722
+new file mode 100644
+index 0000000..05bcf28
+--- /dev/null
++++ b/tests/data/test722
+@@ -0,0 +1,64 @@
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
++--no-progress-meter --location --proxy socks5h://%HOSTIP:%SOCKSPORT http://%HOSTIP:%HTTPPORT/%TESTNUMBER
++</command>
++</client>
++
++#
++# Verify data after the test has been "shot"
++<verify>
++<protocol crlf="yes">
++GET /%TESTNUMBER HTTP/1.1
++Host: %HOSTIP:%HTTPPORT
++User-Agent: curl/%VERSION
++Accept: */*
++
++</protocol>
++<errorcode>
++97
++</errorcode>
++# the error message is verified because error code CURLE_PROXY (97) may be
++# returned for any number of reasons and we need to make sure it is
++# specifically for the reason below so that we know the check is working.
++<stderr mode="text">
++curl: (97) SOCKS5: the destination hostname is too long to be resolved remotely by the proxy.
++</stderr>
++</verify>
++</testcase>
+--
+2.40.0
diff --git a/meta/recipes-support/curl/curl_7.82.0.bb b/meta/recipes-support/curl/curl_7.82.0.bb
index af52ecad13..86a3a84332 100644
--- a/meta/recipes-support/curl/curl_7.82.0.bb
+++ b/meta/recipes-support/curl/curl_7.82.0.bb
@@ -52,6 +52,7 @@ SRC_URI = "https://curl.se/download/${BP}.tar.xz \
            file://CVE-2023-28322-1.patch \
            file://CVE-2023-28322-2.patch \
            file://CVE-2023-32001.patch \
+           file://CVE-2023-38545.patch \
            "
 SRC_URI[sha256sum] = "0aaa12d7bd04b0966254f2703ce80dd5c38dbbd76af0297d3d690cdce58a583c"
 
-- 
2.34.1


