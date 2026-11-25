Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.41718.1795613255280766448
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Nov 2026 05:27:35 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=yzcEmhxa;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: joaomarcos.costa@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 9D9E41A17EE
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Nov 2026 13:27:33 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6ABF760480;
	Wed, 25 Nov 2026 13:27:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 100B811E68463;
	Wed, 25 Nov 2026 14:27:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795613248; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=o1oe/OwxzHFnZYkY64OVUxPJAaVpFaAkUHU1ybo3yz4=;
	b=yzcEmhxaQOJGXUFMXmor/8eLypo8RZccbjv7ZEKyu+ViCn0D3CrkU0U3S8oBMZxBNb3LRv
	TUb11mDEwz9ZYAj3Agdt6iV7Ln5saZV3cmg/eo3IK4KYTR6popPjdr6bOfQjmMnWrY2A2U
	u8OLDe0y7LHtK6ST3wPQarwERODXJj4fQZw4HcjXkJQOFEPomD6xejqm3jYs3qFGoQlF3G
	ibPI6FPGFzBnYqyjOWBtXRh14YhVHwSLHiEBAypdZwmXA6hgVS3F7cBMBY7QmutQXxFyMg
	HdxR9u0kzb4lU7ADSJ9WPxqcCkIbTmXRWkxeu7mji5rH/1d8tqt/o+MMES3sYg==
From: =?UTF-8?q?Jo=C3=A3o=20Marcos=20Costa=20=28Schneider=20Electric=29?= <joaomarcos.costa@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: thomas.petazzoni@bootlin.com,
	yoann.congal@smile.fr,
	=?UTF-8?q?Jo=C3=A3o=20Marcos=20Costa=20=28Schneider=20Electric=29?= <joaomarcos.costa@bootlin.com>
Subject: [blacksail][PATCH v2 4/4] curl: fix CVE-2026-94266
Date: Wed, 25 Nov 2026 14:26:19 +0100
Message-ID: <20261125132619.3518022-5-joaomarcos.costa@bootlin.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261125132619.3518022-1-joaomarcos.costa@bootlin.com>
References: <20261125132619.3518022-1-joaomarcos.costa@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 25 Nov 2026 13:27:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251187

This vulnerability, marked as High [1], was fixed upstream [2] since
v8.23.0.

Backport the fix to curl v8.22.0.

[1] https://nvd.nist.gov/vuln/detail/cve-2026-94266
[2] https://curl.se/docs/CVE-2026-94266.html

Signed-off-by: Jo=C3=A3o Marcos Costa (Schneider Electric) <joaomarcos.co=
sta@bootlin.com>
---
 .../curl/curl/CVE-2026-94266.patch            | 220 ++++++++++++++++++
 meta/recipes-support/curl/curl_8.22.0.bb      |   1 +
 2 files changed, 221 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-94266.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2026-94266.patch b/meta/r=
ecipes-support/curl/curl/CVE-2026-94266.patch
new file mode 100644
index 0000000000..dc4d33c529
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2026-94266.patch
@@ -0,0 +1,220 @@
+From 48e89204f431dc7ae52cf4d02ce7a8f38209ff6b Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Mon, 21 Sep 2026 11:13:13 +0200
+Subject: [PATCH] getinfo: make sure CURLINFO_EFFECTIVE_URL does not cont=
ain
+ creds
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+Reported-by: Joshua Rogers
+
+Verified in test 1876
+
+Closes #23016
+
+CVE: CVE-2026-94266
+Upstream-Status: Backport [https://github.com/curl/curl/commit/7a6bd027d=
0de2b6857472d35da090ef60cc29f19]
+
+Signed-off-by: Jo=C3=A3o Marcos Costa <joaomarcos.costa@bootlin.com>
+---
+ lib/getinfo.c          | 47 +++++++++++++++++++++++++----
+ lib/transfer.c         |  1 +
+ lib/url.c              |  1 +
+ lib/urldata.h          |  1 +
+ tests/data/Makefile.am |  2 +-
+ tests/data/test1876    | 67 ++++++++++++++++++++++++++++++++++++++++++
+ 6 files changed, 113 insertions(+), 6 deletions(-)
+ create mode 100644 tests/data/test1876
+
+diff --git a/lib/getinfo.c b/lib/getinfo.c
+index 23f1de2..eda62da 100644
+--- a/lib/getinfo.c
++++ b/lib/getinfo.c
+@@ -63,6 +63,7 @@ void Curl_initinfo(struct Curl_easy *data)
+=20
+   curlx_safefree(info->contenttype);
+   curlx_safefree(info->wouldredirect);
++  curlx_safefree(info->effective_url);
+=20
+   memset(&info->primary, 0, sizeof(info->primary));
+   info->retry_after =3D 0;
+@@ -76,15 +77,51 @@ void Curl_initinfo(struct Curl_easy *data)
+ #endif
+ }
+=20
++static CURLcode effective_url(struct Curl_easy *data,
++                              const char **param_charp)
++{
++  const char *s =3D Curl_bufref_ptr(&data->state.url);
++  *param_charp =3D s ? s : "";
++  if(s) {
++    char *url =3D NULL;
++    /* Make a copy of the URL without credentials */
++    CURLU *u =3D curl_url();
++    CURLUcode uc;
++    if(!u)
++      return CURLE_OUT_OF_MEMORY;
++
++    uc =3D curl_url_set(u, CURLUPART_URL, s,
++                      CURLU_NON_SUPPORT_SCHEME |
++                      (data->set.path_as_is ? CURLU_PATH_AS_IS : 0));
++    if(!uc)
++      uc =3D curl_url_set(u, CURLUPART_USER, NULL, 0);
++    if(!uc)
++      uc =3D curl_url_set(u, CURLUPART_PASSWORD, NULL, 0);
++    if(!uc)
++      uc =3D curl_url_get(u, CURLUPART_URL, &url, CURLU_GET_EMPTY);
++
++    curl_url_cleanup(u);
++
++    if(uc || !url)
++      return CURLE_OUT_OF_MEMORY;
++    if(strcmp(url, s)) {
++      /* they are different */
++      curlx_free(data->info.effective_url);
++      data->info.effective_url =3D url;
++      *param_charp =3D url;
++    }
++    else
++      curl_free(url);
++  }
++  return CURLE_OK;
++}
++
+ static CURLcode getinfo_char(struct Curl_easy *data, CURLINFO info,
+                              const char **param_charp)
+ {
+   switch(info) {
+-  case CURLINFO_EFFECTIVE_URL: {
+-    const char *s =3D Curl_bufref_ptr(&data->state.url);
+-    *param_charp =3D s ? s : "";
+-  }
+-    break;
++  case CURLINFO_EFFECTIVE_URL:
++    return effective_url(data, param_charp);
+   case CURLINFO_EFFECTIVE_METHOD: {
+     const char *m =3D CURL_EASY_STR(data, STRING_CUSTOMREQUEST);
+     if(!m) {
+diff --git a/lib/transfer.c b/lib/transfer.c
+index 3b6c5c0..d940f8d 100644
+--- a/lib/transfer.c
++++ b/lib/transfer.c
+@@ -503,6 +503,7 @@ CURLcode Curl_pretransfer(struct Curl_easy *data)
+   data->state.authhost.want =3D data->set.httpauth;
+   data->state.authproxy.want =3D data->set.proxyauth;
+   curlx_safefree(data->info.wouldredirect);
++  curlx_safefree(data->info.effective_url);
+   Curl_data_priority_clear_state(data);
+   if(data->set.http_auto_referer)
+     Curl_bufref_free(&data->state.referer);
+diff --git a/lib/url.c b/lib/url.c
+index 6eeae43..61126a1 100644
+--- a/lib/url.c
++++ b/lib/url.c
+@@ -267,6 +267,7 @@ CURLcode Curl_close(struct Curl_easy **datap)
+   curlx_safefree(data->state.most_recent_ftp_entrypath);
+   curlx_safefree(data->info.contenttype);
+   curlx_safefree(data->info.wouldredirect);
++  curlx_safefree(data->info.effective_url);
+=20
+   /* No longer a dirty share, if it exists */
+   if(Curl_share_easy_unlink(data))
+diff --git a/lib/urldata.h b/lib/urldata.h
+index 1c01018..fb6df86 100644
+--- a/lib/urldata.h
++++ b/lib/urldata.h
+@@ -409,6 +409,7 @@ struct PureInfo {
+   curl_off_t numconnects; /* how many new connections libcurl created *=
/
+   char *contenttype; /* the content type of the object */
+   char *wouldredirect; /* URL this would have been redirected to if ask=
ed to */
++  char *effective_url; /* when needed */
+   curl_off_t retry_after; /* info from Retry-After: header */
+   const char *conn_scheme;
+   int httpcode;  /* Recent HTTP, FTP, RTSP or SMTP response code */
+diff --git a/tests/data/Makefile.am b/tests/data/Makefile.am
+index e0ce23a..8cdeaf7 100644
+--- a/tests/data/Makefile.am
++++ b/tests/data/Makefile.am
+@@ -1740,7 +1740,7 @@ TESTCASES =3D \
+   test1849 \
+   test1850 \
+   test1851 \
+-  \
++  test1876 \
+   test1900 \
+   test1901 \
+   test1902 \
+diff --git a/tests/data/test1876 b/tests/data/test1876
+new file mode 100644
+index 0000000..4fc3b9f
+--- /dev/null
++++ b/tests/data/test1876
+@@ -0,0 +1,67 @@
++<?xml version=3D"1.0" encoding=3D"US-ASCII"?>
++<testcase>
++<info>
++<keywords>
++netrc
++</keywords>
++</info>
++
++# Server-side
++<reply>
++<data crlf=3D"headers" nocheck=3D"yes">
++HTTP/1.1 301 redir
++Content-Length: 0
++Content-Type: text/html
++Location: %TESTNUMBER0002
++
++</data>
++
++<data2 crlf=3D"headers">
++HTTP/1.1 200 OK
++Content-Length: 0
++Content-Type: text/html
++
++</data2>
++
++</reply>
++
++# Client-side
++<client>
++<server>
++http
++</server>
++<name>
++verify no credentials present in effective URL after redirect
++</name>
++<file name=3D"%LOGDIR/netrc">
++machine %HOSTIP
++login netrcuser
++password netrcSECRET123
++</file>
++
++<command option=3D"no-include">
++http://%HOSTIP:%HTTPPORT/%TESTNUMBER --netrc-optional --netrc-file %LOG=
DIR/netrc -L -w 'EFFECTIVE_URL=3D%{url_effective}\n'
++</command>
++</client>
++
++# Verify data after the test has been "shot"
++<verify>
++<protocol crlf=3D"headers">
++GET /%TESTNUMBER HTTP/1.1
++Host: %HOSTIP:%HTTPPORT
++Authorization: Basic %b64[netrcuser:netrcSECRET123]b64%
++User-Agent: curl/%VERSION
++Accept: */*
++
++GET /%TESTNUMBER0002 HTTP/1.1
++Host: %HOSTIP:%HTTPPORT
++Authorization: Basic %b64[netrcuser:netrcSECRET123]b64%
++User-Agent: curl/%VERSION
++Accept: */*
++
++</protocol>
++<stdout>
++EFFECTIVE_URL=3Dhttp://%HOSTIP:%HTTPPORT/%TESTNUMBER0002
++</stdout>
++</verify>
++</testcase>
diff --git a/meta/recipes-support/curl/curl_8.22.0.bb b/meta/recipes-supp=
ort/curl/curl_8.22.0.bb
index 6445aae426..64397f1a77 100644
--- a/meta/recipes-support/curl/curl_8.22.0.bb
+++ b/meta/recipes-support/curl/curl_8.22.0.bb
@@ -20,6 +20,7 @@ SRC_URI =3D " \
     file://CVE-2026-87865.patch \
     file://CVE-2026-92386.patch \
     file://CVE-2026-92391.patch \
+    file://CVE-2026-94266.patch \
 "
=20
 SRC_URI:append:class-nativesdk =3D " \
--=20
2.55.0

