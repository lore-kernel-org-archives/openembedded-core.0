Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E93FC41513
	for <webhook@archiver.kernel.org>; Fri, 13 Oct 2023 21:53:13 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web11.51158.1697233989225837811
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Oct 2023 14:53:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=xEsuEBhX;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.173, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-690fe10b6a4so2091918b3a.3
        for <openembedded-core@lists.openembedded.org>; Fri, 13 Oct 2023 14:53:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1697233988; x=1697838788; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6kDUfaJ9xTodrJzy0szn8B9NgvXoILY2H6s68H3nMNs=;
        b=xEsuEBhXI9SZx4I0TjiDtIBFQYzbB9vJyaK4/Gw6jNS+6iWgp99bJAwECJcZf2miZp
         GXxDiAZ8uOxYIwrgcxCht2lO0BTRBnhhRlhyuA7W4fEUkzj37Dv8W/ueDoXBCkDpcHR4
         zMONKAcohzd8zQl0n7lc9xiaOeq+G5rZC9TlWqvrubYIO/iqtXUq3FoBrlB0GL9HGIOc
         nA8+LNqrz2D3c+zdAu98JegOv3gIRT+c4jx2hSrZeiK+HX4z84KMhX7WvVhfjcp9KG99
         +7U/jH3SZysxBDDomdl3NhU4XLnaeeXLLzFeTfmoO9p9/sVF4GcNDqDcj7NR9OWNKF4E
         v9Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697233988; x=1697838788;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6kDUfaJ9xTodrJzy0szn8B9NgvXoILY2H6s68H3nMNs=;
        b=hvX5y4JGFxUiSmmp/n2W5Nb5haLrAYz2Il1rPGSyCDQ4EeeGsqhS0fRqp4041z3d6C
         cXloORiWsSFBP3aJydWapCB8HT04b35DE2vh7xop4aCEpZhGkrbRcCMEQcRMZFTT75in
         9V8nFhliN6g5sdViofPyPaRNiWwNyPVvHY+NDi37vrZX01IA6B1FC6aYoS+dA6VIdfQI
         FYsa4MkLcrwOzS6Gzf8VB3oFZ/zrePs6stZ37ZJsI4qrBNsYx8p3TOv2zMuKqeBVSVJc
         g1lwXpq/pYYF5DPxsOufTLBrntbnSNay7bvAmioGKmrRYcO3orNuxwyUFeWGUqFhcb6w
         3NWA==
X-Gm-Message-State: AOJu0Ywvw16vd+iBmuGLydtq16D3a8dI+S5W9ZDzmSzsGPu5o+hHgKjX
	h7vLRreGDwxuZ5LxjGswJvazJsw+jh4Uu5HkoBQ=
X-Google-Smtp-Source: AGHT+IH7adfVKhWnOcMWkgCIA9xrWpbOW+PbsvuXLtnOK0GAoNuzttxM9TClwuai9C3+82aWhXdGIA==
X-Received: by 2002:a05:6a00:2e95:b0:68f:f741:57a1 with SMTP id fd21-20020a056a002e9500b0068ff74157a1mr39267002pfb.7.1697233988324;
        Fri, 13 Oct 2023 14:53:08 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id u22-20020a62ed16000000b00690fe1c928csm14307334pfh.147.2023.10.13.14.53.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Oct 2023 14:53:08 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 04/27] curl: fix CVE-2023-38545
Date: Fri, 13 Oct 2023 11:52:28 -1000
Message-Id: <9b0867861a9c053f19bdb99bd6cba44ee5cb64e1.1697233866.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1697233866.git.steve@sakoman.com>
References: <cover.1697233866.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Oct 2023 21:53:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189081

From: Archana Polampalli <archana.polampalli@windriver.com>

This flaw makes curl overflow a heap based buffer in the SOCKS5 proxy handshake.

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../curl/curl/CVE-2023-38545.patch            | 133 ++++++++++++++++++
 meta/recipes-support/curl/curl_8.0.1.bb       |   1 +
 2 files changed, 134 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2023-38545.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2023-38545.patch b/meta/recipes-support/curl/curl/CVE-2023-38545.patch
new file mode 100644
index 0000000000..b90677fa5f
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
+Bug: https://curl.se/docs/CVE-2023-38545.html
+
+Upstream-Status: Backport [https://github.com/curl/curl/commit/fb4415d8aee6c1045be932a34fe6107c2f5ed147]
+CVE: CVE-2023-38545
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ lib/socks.c             |  8 +++---
+ tests/data/Makefile.inc |  2 +-
+ tests/data/test722      | 64 +++++++++++++++++++++++++++++++++++++++++
+ 3 files changed, 69 insertions(+), 5 deletions(-)
+ create mode 100644 tests/data/test722
+
+diff --git a/lib/socks.c b/lib/socks.c
+index 95c2b00..8cf694d 100644
+--- a/lib/socks.c
++++ b/lib/socks.c
+@@ -588,9 +588,9 @@ static CURLproxycode do_SOCKS5(struct Curl_cfilter *cf,
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
+@@ -904,7 +904,7 @@ static CURLproxycode do_SOCKS5(struct Curl_cfilter *cf,
+       }
+       else {
+         socksreq[len++] = 3;
+-        socksreq[len++] = (char) hostname_len; /* one byte address length */
++        socksreq[len++] = (unsigned char) hostname_len; /* one byte length */
+         memcpy(&socksreq[len], sx->hostname, hostname_len); /* w/o NULL */
+         len += hostname_len;
+       }
+diff --git a/tests/data/Makefile.inc b/tests/data/Makefile.inc
+index 7ed03a2..643c9fe 100644
+--- a/tests/data/Makefile.inc
++++ b/tests/data/Makefile.inc
+@@ -100,7 +100,7 @@ test679 test680 test681 test682 test683 test684 test685 test686 \
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
diff --git a/meta/recipes-support/curl/curl_8.0.1.bb b/meta/recipes-support/curl/curl_8.0.1.bb
index 708f622fe1..bdffe7be34 100644
--- a/meta/recipes-support/curl/curl_8.0.1.bb
+++ b/meta/recipes-support/curl/curl_8.0.1.bb
@@ -19,6 +19,7 @@ SRC_URI = " \
     file://CVE-2023-28321.patch \
     file://CVE-2023-32001.patch \
     file://CVE-2023-28320-fol1.patch \
+    file://CVE-2023-38545.patch \
 "
 SRC_URI[sha256sum] = "0a381cd82f4d00a9a334438b8ca239afea5bfefcfa9a1025f2bf118e79e0b5f0"
 
-- 
2.34.1


