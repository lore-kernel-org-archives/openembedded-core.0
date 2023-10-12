Return-Path: <mac@mcrowe.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDC6ACDB46E
	for <webhook@archiver.kernel.org>; Thu, 12 Oct 2023 05:55:39 +0000 (UTC)
Received: from smarthost01a.sbp.mail.zen.net.uk (smarthost01a.sbp.mail.zen.net.uk [212.23.1.1])
 by mx.groups.io with SMTP id smtpd.web10.5148.1697090130079969010
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Oct 2023 22:55:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mcrowe.com header.s=20191005 header.b=SJ6+EMCa;
 spf=pass (domain: mcrowe.com, ip: 212.23.1.1, mailfrom: mac@mcrowe.com)
Received: from [88.97.37.36] (helo=deneb.mcrowe.com)
	by smarthost01a.sbp.mail.zen.net.uk with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.90_1)
	(envelope-from <mac@mcrowe.com>)
	id 1qqofP-0002Ja-F4
	for openembedded-core@lists.openembedded.org; Thu, 12 Oct 2023 05:55:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mcrowe.com;
	s=20191005; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
	Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	In-Reply-To:References; bh=qRd1Wtnu/lqnarGQQwuTNBuMRCgZyoLkHZ2qwMLSqzY=; b=SJ
	6+EMCaG/Jr5gBomHO1JDEJw/K5D6b/Y7ycjCZoVGrh/uzFuVL7G6xMLozrssye4SZVBORk33/evoy
	q7cqE6V9B0kIE5Dmix4KphXdccwE1fyxY60OMOyMjU79dSxaLMshvoOhZOjjSGImAiLkZXIoVpGRE
	2b4mf+z6IjM7Ps/fW7kEzGeAIeHH6dwBejDRBbd+gdttDTbuK+O4Y0gagtJhfUlDAHjRmjIo3488t
	NK4xHgE26XKM3roSx1NOuqF+bM8Tsbey3nmeZWi3WIpD0gZFp0HHiAYkgbahHnssAEtbMB1MMuqbB
	wqYUEWTVDEG2R8xd0ra/SD3XdIHVEZAg==;
Received: from mac by deneb.mcrowe.com with local (Exim 4.96)
	(envelope-from <mac@mcrowe.com>)
	id 1qqofN-00BRsL-2W;
	Thu, 12 Oct 2023 06:55:25 +0100
From: mac@mcrowe.com
To: openembedded-core@lists.openembedded.org
Cc: Mike Crowe <mac@mcrowe.com>
Subject: [dunfell][PATCH 1/2] curl: Backport fix for CVE-2023-38545
Date: Thu, 12 Oct 2023 06:54:43 +0100
Message-Id: <20231012055444.564180-1-mac@mcrowe.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Originating-smarthost01a-IP: [88.97.37.36]
Feedback-ID: 88.97.37.36
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Oct 2023 05:55:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188976

From: Mike Crowe <mac@mcrowe.com>

Backporting this change required tweaking the error value since the
two-level CURLE_PROXY error reporting was introduced after curl
7.69.1. The test required some tweaks to not rely on more-recent
improvements to the test infrastructure too.

Signed-off-by: Mike Crowe <mac@mcrowe.com>
---
 .../curl/curl/CVE-2023-38545.patch            | 146 ++++++++++++++++++
 meta/recipes-support/curl/curl_7.69.1.bb      |   1 +
 2 files changed, 147 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2023-38545.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2023-38545.patch b/meta/rec=
ipes-support/curl/curl/CVE-2023-38545.patch
new file mode 100644
index 0000000000..40a92ce3fb
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2023-38545.patch
@@ -0,0 +1,146 @@
+From 600a1caeb2312fdee5ef1caf7d613c12a8b2424a Mon Sep 17 00:00:00 2001
+From: Mike Crowe <mac@mcrowe.com>
+Date: Wed, 11 Oct 2023 20:50:28 +0100
+Subject: [PATCH] socks: return error if hostname too long for remote resol=
ve
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
+Upstream-Status: Backport [fb4415d8aee6c1045be932a34fe6107c2f5ed147]
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
+=20
+-    /* RFC1928 chapter 5 specifies max 255 chars for domain name in packe=
t */
++    /* RFC1928 chapter 5 specifies max 255 chars for domain name in packe=
t. */
+     if(!socks5_resolve_local && hostname_len > 255) {
+-      infof(conn->data, "SOCKS5: server resolving disabled for hostnames =
of "
+-            "length > 255 [actual len=3D%zu]\n", hostname_len);
+-      socks5_resolve_local =3D TRUE;
++      failf(data, "SOCKS5: the destination hostname is too long to be "
++            "resolved remotely by the proxy.");
++      /* This version of libcurl doesn't have CURLE_PROXY and
++       * therefore CURLPX_LONG_HOSTNAME, so let's report the best we
++       * can. */
++      return CURLE_COULDNT_RESOLVE_HOST;
+     }
+=20
+     if(auth & ~(CURLAUTH_BASIC | CURLAUTH_GSSAPI))
+@@ -837,7 +840,7 @@ CURLcode Curl_SOCKS5(const char *proxy_user,
+=20
+     if(!socks5_resolve_local) {
+       socksreq[len++] =3D 3; /* ATYP: domain name =3D 3 */
+-      socksreq[len++] =3D (char) hostname_len; /* one byte address length=
 */
++      socksreq[len++] =3D (unsigned char) hostname_len; /* one byte lengt=
h */
+       memcpy(&socksreq[len], hostname, hostname_len); /* address w/o NULL=
 */
+       len +=3D hostname_len;
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
++test709 test710 test711 test712 test713 test714 test715 test716 test717 t=
est728 \
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
++Location: http://AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA/
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
++--no-progress-meter --location --proxy socks5h://%HOSTIP:%SOCKSPORT http:=
//%HOSTIP:%HTTPPORT/728
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
++GET /728 HTTP/1.1=0D
++Host: %HOSTIP:%HTTPPORT=0D
++Accept: */*=0D
++=0D
++</protocol>
++<errorcode>
++6
++</errorcode>
++</verify>
++</testcase>
+--=20
+2.39.2
+
diff --git a/meta/recipes-support/curl/curl_7.69.1.bb b/meta/recipes-suppor=
t/curl/curl_7.69.1.bb
index 2a52e8233e..4012776613 100644
--- a/meta/recipes-support/curl/curl_7.69.1.bb
+++ b/meta/recipes-support/curl/curl_7.69.1.bb
@@ -53,6 +53,7 @@ SRC_URI =3D "https://curl.haxx.se/download/curl-${PV}.tar=
.bz2 \
            file://CVE-2023-28320.patch \
            file://CVE-2023-28320-fol1.patch \
            file://CVE-2023-32001.patch \
+           file://CVE-2023-38545.patch \
 "
=20
 SRC_URI[md5sum] =3D "ec5fc263f898a3dfef08e805f1ecca42"
--=20
2.39.2


