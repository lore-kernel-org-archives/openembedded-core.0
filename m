Return-Path: <robert.joslyn@redrectangle.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C783C25B75
	for <webhook@archiver.kernel.org>; Sun, 26 May 2024 15:57:57 +0000 (UTC)
Received: from wilbur.contactoffice.com (wilbur.contactoffice.com [212.3.242.68])
 by mx.groups.io with SMTP id smtpd.web11.9356.1716739074315086519
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 May 2024 08:57:54 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=robert.joslyn@redrectangle.org header.s=20230812-3u04 header.b=gzzxyRW9;
 spf=pass (domain: redrectangle.org, ip: 212.3.242.68, mailfrom: robert.joslyn@redrectangle.org)
Received: from smtpauth1.co-bxl (smtpauth1.co-bxl [10.2.0.15])
	by wilbur.contactoffice.com (Postfix) with ESMTP id 0289D4040;
	Sun, 26 May 2024 17:57:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1716739072;
	s=20230812-3u04; d=redrectangle.org;
	i=robert.joslyn@redrectangle.org;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Transfer-Encoding;
	l=5050; bh=HibLQvCd+kM5eryX2Md2tHxAkjtmz4eIoJHDF26KTM4=;
	b=gzzxyRW9inOlnKiPD58zvjkEp7GBjndxWsptGca0CLmkzxnWIJdVhYDEI2Om2iFz
	XimaRlF+9o1Uj1OI8U7jEEHiBBaH8WYcLeCoLijfQuwDMWH7qefj9DBWkg81ZtmDxoQ
	R1aNEt4b+UvgpuPiiQDxDGqNtR1IFM/QCToCED7Ky/QiacQA7hafsB+dXKPVcafTnD+
	naqxMoIqIjvjyFWER2LHIo9mqjko1wo+qtapedp/MOC3fEsTzphPVBiC9n1CpmbNzm6
	n3S99V5wpQWadSdE9iqikLxQ9iOMj8QN7wM+HR/e3RATzZU/7OWsNTtyaH+M7Zf2SHS
	fubi4kU1Dw==
Received: by smtp.mailfence.com with ESMTPSA ; Sun, 26 May 2024 17:57:48 +0200 (CEST)
From: robert.joslyn@redrectangle.org
To: openembedded-core@lists.openembedded.org
Cc: Robert Joslyn <robert.joslyn@redrectangle.org>
Subject: [PATCH] curl: Update to 8.8.0
Date: Sun, 26 May 2024 08:57:33 -0700
Message-ID: <20240526155733.2139871-1-robert.joslyn@redrectangle.org>
X-Mailer: git-send-email 2.44.1
MIME-Version: 1.0
X-ContactOffice-Account: com:454140407
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 26 May 2024 15:57:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199883

From: Robert Joslyn <robert.joslyn@redrectangle.org>

Remove backported patch that is upsteam in this version. Disable test
1481 since it requires --libcurl option that is disabled by default.

Signed-off-by: Robert Joslyn <robert.joslyn@redrectangle.org>
---
 ...41aadf4adf4f6aeb3f4c0ab489bb89610c36.patch | 64 -------------------
 meta/recipes-support/curl/curl/disable-tests  |  1 +
 .../curl/{curl_8.7.1.bb =3D> curl_8.8.0.bb}     |  4 +-
 3 files changed, 2 insertions(+), 67 deletions(-)
 delete mode 100644 meta/recipes-support/curl/curl/721941aadf4adf4f6aeb3f=
4c0ab489bb89610c36.patch
 rename meta/recipes-support/curl/{curl_8.7.1.bb =3D> curl_8.8.0.bb} (97%=
)

diff --git a/meta/recipes-support/curl/curl/721941aadf4adf4f6aeb3f4c0ab48=
9bb89610c36.patch b/meta/recipes-support/curl/curl/721941aadf4adf4f6aeb3f=
4c0ab489bb89610c36.patch
deleted file mode 100644
index 98f7db93e8..0000000000
--- a/meta/recipes-support/curl/curl/721941aadf4adf4f6aeb3f4c0ab489bb8961=
0c36.patch
+++ /dev/null
@@ -1,64 +0,0 @@
-From 721941aadf4adf4f6aeb3f4c0ab489bb89610c36 Mon Sep 17 00:00:00 2001
-From: Stefan Eissing <stefan@eissing.org>
-Date: Mon, 1 Apr 2024 15:41:18 +0200
-Subject: [PATCH] http: with chunked POST forced, disable length check on=
 read
- callback
-
-- when an application forces HTTP/1.1 chunked transfer encoding
-  by setting the corresponding header and instructs curl to use
-  the CURLOPT_READFUNCTION, disregard any POST length information.
-- this establishes backward compatibility with previous curl versions
-
-Applications are encouraged to not force "chunked", but rather
-set length information for a POST. By setting -1, curl will
-auto-select chunked on HTTP/1.1 and work properly on other HTTP
-versions.
-
-Reported-by: Jeff King
-Fixes #13229
-Closes #13257
-Upstream-Status: Backport
----
- lib/http.c | 22 ++++++++++++++++++++--
- 1 file changed, 20 insertions(+), 2 deletions(-)
-
-diff --git a/lib/http.c b/lib/http.c
-index 92c04e69cd8373..a764d3c4403c39 100644
---- a/lib/http.c
-+++ b/lib/http.c
-@@ -2046,8 +2046,19 @@ static CURLcode set_reader(struct Curl_easy *data=
, Curl_HttpReq httpreq)
-       else
-         result =3D Curl_creader_set_null(data);
-     }
--    else { /* we read the bytes from the callback */
--      result =3D Curl_creader_set_fread(data, postsize);
-+    else {
-+      /* we read the bytes from the callback. In case "chunked" encodin=
g
-+       * is forced by the application, we disregard `postsize`. This is
-+       * a backward compatibility decision to earlier versions where
-+       * chunking disregarded this. See issue #13229. */
-+      bool chunked =3D FALSE;
-+      char *ptr =3D Curl_checkheaders(data, STRCONST("Transfer-Encoding=
"));
-+      if(ptr) {
-+        /* Some kind of TE is requested, check if 'chunked' is chosen *=
/
-+        chunked =3D Curl_compareheader(ptr, STRCONST("Transfer-Encoding=
:"),
-+                                     STRCONST("chunked"));
-+      }
-+      result =3D Curl_creader_set_fread(data, chunked? -1 : postsize);
-     }
-     return result;
-=20
-@@ -2115,6 +2126,13 @@ CURLcode Curl_http_req_set_reader(struct Curl_eas=
y *data,
-     data->req.upload_chunky =3D
-       Curl_compareheader(ptr,
-                          STRCONST("Transfer-Encoding:"), STRCONST("chun=
ked"));
-+    if(data->req.upload_chunky &&
-+       Curl_use_http_1_1plus(data, data->conn) &&
-+       (data->conn->httpversion >=3D 20)) {
-+       infof(data, "suppressing chunked transfer encoding on connection=
 "
-+             "using HTTP version 2 or higher");
-+       data->req.upload_chunky =3D FALSE;
-+    }
-   }
-   else {
-     curl_off_t req_clen =3D Curl_creader_total_length(data);
diff --git a/meta/recipes-support/curl/curl/disable-tests b/meta/recipes-=
support/curl/curl/disable-tests
index 259576fd01..c4aa7783a1 100644
--- a/meta/recipes-support/curl/curl/disable-tests
+++ b/meta/recipes-support/curl/curl/disable-tests
@@ -39,3 +39,4 @@
 1404
 1405
 1465
+1481
diff --git a/meta/recipes-support/curl/curl_8.7.1.bb b/meta/recipes-suppo=
rt/curl/curl_8.8.0.bb
similarity index 97%
rename from meta/recipes-support/curl/curl_8.7.1.bb
rename to meta/recipes-support/curl/curl_8.8.0.bb
index 23b7c50a86..b932594159 100644
--- a/meta/recipes-support/curl/curl_8.7.1.bb
+++ b/meta/recipes-support/curl/curl_8.8.0.bb
@@ -11,12 +11,11 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Deed2e5088e=
1ac619c9a1c747da291d75"
=20
 SRC_URI =3D " \
     https://curl.se/download/${BP}.tar.xz \
-    file://721941aadf4adf4f6aeb3f4c0ab489bb89610c36.patch \
     file://run-ptest \
     file://disable-tests \
     file://no-test-timeout.patch \
 "
-SRC_URI[sha256sum] =3D "6fea2aac6a4610fbd0400afb0bcddbe7258a64c63f1f68e5=
855ebc0c659710cd"
+SRC_URI[sha256sum] =3D "0f58bb95fc330c8a46eeb3df5701b0d90c9d9bfcc42bd1cd=
08791d12551d4400"
=20
 # Curl has used many names over the years...
 CVE_PRODUCT =3D "haxx:curl haxx:libcurl curl:curl curl:libcurl libcurl:l=
ibcurl daniel_stenberg:curl"
@@ -73,7 +72,6 @@ PACKAGECONFIG[zstd] =3D "--with-zstd,--without-zstd,zst=
d"
=20
 EXTRA_OECONF =3D " \
     --disable-libcurl-option \
-    --disable-ntlm-wb \
     --with-ca-bundle=3D${sysconfdir}/ssl/certs/ca-certificates.crt \
     --without-libpsl \
     --enable-optimize \
--=20
2.44.1


