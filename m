Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web12.7472.1593486243037845064
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Jun 2020 20:04:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=zHIDXelV;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.44, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f44.google.com with SMTP id f6so4807637pjq.5
        for <openembedded-core@lists.openembedded.org>; Mon, 29 Jun 2020 20:04:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=+mTfFXD0VrnQDtzjOZGhcYU4oK7g347PEkw8Q5hCMU4=;
        b=zHIDXelVlw9O6MZnLJ9naPYwtuPR4DWb9jOqfJYiS6uijvNcT7uXOX8+mpPNx0EhGs
         7Hu0xEtSu9vv3BeMpMZ0cF8XbHjlCCEd1TRQWPO7Aj2uUvKyqWsci4Vuft4mggGgysMu
         CPdYHw2TUf2PmvXF5iUlzRk+MQ9OztHwzI92cgnx0KZOmZyJR3+3iM3UAej8wX6nixTt
         vZQjCQjC+yrWUVGmXqZ/gHERLBJxL1yLt0udKEjhW1PDH2cYpgR+N11Ta2YSelocki7E
         Ssp3a9duu1/aBbvawnu8qqibyBeCH/uIBxRI0REdn+ll2LMtBDrUdsGiP5QvN3j1rCIu
         bjpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=+mTfFXD0VrnQDtzjOZGhcYU4oK7g347PEkw8Q5hCMU4=;
        b=ARlaoImi4haBU4l39PR6G9mHc+sR21UH3dQw823XaoQQPIHkp/E208FZphQe8u+GgJ
         RrvrYa4/bmPV54Db8sIBSY18gdlG7IWZ8pVrNWeIt0vwOpXCHlta1Q9un68HqWSrS0sg
         eaUeuupwxNHauXE29z4jV5FwxFCf9W6+Ud7SoeqDWTVqSeuNbXK/eu2790pEMWlPlvbT
         slrmoQpG3VXVgE4V41vS/MhpsQkSNUMkUtVI4KGD7qcSxq0ZAN8zTH6DZm/jRKk6V7SA
         LH9cep2XVUjybnHMs4Tj2EZ0GKr4XcJ6HBcfgyjlsy5FO7dUMmMNFRfYK5Fkz2Rv+clJ
         pWxw==
X-Gm-Message-State: AOAM531wC2woReFFLq6BYI2+Ni4bFUsLJtmEi9/BeGiNuGOEH4Wo6xD/
	YXXcwF/n3BzDwziLGEPu6Utj0f0pK/dJFw==
X-Google-Smtp-Source: ABdhPJwB8gyWsdr+APL00/SUzg5f99pL2Cd8wHqSwVteiR+yRNeqgZ+BZMxVrDeztGce96E60GxLNg==
X-Received: by 2002:a17:902:a50e:: with SMTP id s14mr16166674plq.334.1593486241788;
        Mon, 29 Jun 2020 20:04:01 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com ([99.197.43.113])
        by smtp.gmail.com with ESMTPSA id 6sm875627pfi.170.2020.06.29.20.03.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2020 20:04:00 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 03/22] curl: Security fixes for CVE-2020-{8169/8177}
Date: Mon, 29 Jun 2020 17:03:01 -1000
Message-Id: <f42702baee57ab3d1b7ab7833e72c7d56ad4ee94.1593485896.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1593485896.git.steve@sakoman.com>
References: <cover.1593485896.git.steve@sakoman.com>

From: Armin Kuster <akuster@mvista.com>

Source: https://curl.haxx.se/
MR: 104472, 104458
Type: Security Fix
Disposition: Backport from https://github.com/curl/curl/commit/{600a8cded447cd/8236aba58542c5f}
ChangeID: 1300924f7a64b22375b4326daeef0b686481e30c
Description:

- Affected versions: curl 7.20.0 to and including 7.70.0
- Not affected versions: curl < 7.20.0 and curl >= 7.71.0

Fixes both CVE-2020-8169 and CVE-2020-8177

Signed-off-by: Armin Kuster <akuster@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../curl/curl/CVE-2020-8169.patch             | 140 ++++++++++++++++++
 .../curl/curl/CVE-2020-8177.patch             |  67 +++++++++
 meta/recipes-support/curl/curl_7.69.1.bb      |   2 +
 3 files changed, 209 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2020-8169.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2020-8177.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2020-8169.patch b/meta/recipes-support/curl/curl/CVE-2020-8169.patch
new file mode 100644
index 0000000000..7d1be24a0a
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2020-8169.patch
@@ -0,0 +1,140 @@
+From 600a8cded447cd7118ed50142c576567c0cf5158 Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Thu, 14 May 2020 14:37:12 +0200
+Subject: [PATCH] url: make the updated credentials URL-encoded in the URL
+
+Found-by: Gregory Jefferis
+Reported-by: Jeroen Ooms
+Added test 1168 to verify. Bug spotted when doing a redirect.
+Bug: https://github.com/jeroen/curl/issues/224
+Closes #5400
+
+Upstream-Status: Backport
+https://github.com/curl/curl/commit/600a8cded447cd
+
+CVE: CVE-2020-8169
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ lib/url.c               |  6 ++--
+ tests/data/Makefile.inc |  1 +
+ tests/data/test1168     | 78 +++++++++++++++++++++++++++++++++++++++++
+ 3 files changed, 83 insertions(+), 2 deletions(-)
+ create mode 100644 tests/data/test1168
+
+Index: curl-7.69.1/lib/url.c
+===================================================================
+--- curl-7.69.1.orig/lib/url.c
++++ curl-7.69.1/lib/url.c
+@@ -2776,12 +2776,14 @@ static CURLcode override_login(struct Cu
+ 
+   /* for updated strings, we update them in the URL */
+   if(user_changed) {
+-    uc = curl_url_set(data->state.uh, CURLUPART_USER, *userp, 0);
++    uc = curl_url_set(data->state.uh, CURLUPART_USER, *userp,
++                      CURLU_URLENCODE);
+     if(uc)
+       return Curl_uc_to_curlcode(uc);
+   }
+   if(passwd_changed) {
+-    uc = curl_url_set(data->state.uh, CURLUPART_PASSWORD, *passwdp, 0);
++    uc = curl_url_set(data->state.uh, CURLUPART_PASSWORD, *passwdp,
++                      CURLU_URLENCODE);
+     if(uc)
+       return Curl_uc_to_curlcode(uc);
+   }
+Index: curl-7.69.1/tests/data/Makefile.inc
+===================================================================
+--- curl-7.69.1.orig/tests/data/Makefile.inc
++++ curl-7.69.1/tests/data/Makefile.inc
+@@ -133,6 +133,7 @@ test1136 test1137 test1138 test1139 test
+ test1144 test1145 test1146 test1147 test1148 test1149 test1150 test1151 \
+ test1152 test1153 test1154 test1155 test1156 test1157 test1158 test1159 \
+ test1160 test1161 test1162 test1163 test1164 test1165 test1166 test1167 \
++test1168 \
+ \
+ test1170 test1171 test1172 test1173 test1174 test1175 test1176 \
+ \
+Index: curl-7.69.1/tests/data/test1168
+===================================================================
+--- /dev/null
++++ curl-7.69.1/tests/data/test1168
+@@ -0,0 +1,78 @@
++<testcase>
++<info>
++<keywords>
++HTTP
++HTTP GET
++followlocation
++</keywords>
++</info>
++# Server-side
++<reply>
++<data>
++HTTP/1.1 301 This is a weirdo text message swsclose
++Date: Thu, 09 Nov 2010 14:49:00 GMT
++Server: test-server/fake
++Location: /data/11680002.txt
++Connection: close
++
++This server reply is for testing a simple Location: following
++
++</data>
++<data2>
++HTTP/1.1 200 Followed here fine swsclose
++Date: Thu, 09 Nov 2010 14:49:00 GMT
++Server: test-server/fake
++Content-Length: 52
++
++If this is received, the location following worked
++
++</data2>
++<datacheck>
++HTTP/1.1 301 This is a weirdo text message swsclose
++Date: Thu, 09 Nov 2010 14:49:00 GMT
++Server: test-server/fake
++Location: /data/11680002.txt
++Connection: close
++
++HTTP/1.1 200 Followed here fine swsclose
++Date: Thu, 09 Nov 2010 14:49:00 GMT
++Server: test-server/fake
++Content-Length: 52
++
++If this is received, the location following worked
++
++</datacheck>
++</reply>
++
++# Client-side
++<client>
++<server>
++http
++</server>
++ <name>
++HTTP redirect with credentials using # in user and password
++ </name>
++ <command>
++http://%HOSTIP:%HTTPPORT/want/1168 -L -u "catmai#d:#DZaRJYrixKE*gFY"
++</command>
++</client>
++
++# Verify data after the test has been "shot"
++<verify>
++<strip>
++^User-Agent:.*
++</strip>
++<protocol>
++GET /want/1168 HTTP/1.1
++Host: %HOSTIP:%HTTPPORT
++Authorization: Basic Y2F0bWFpI2Q6I0RaYVJKWXJpeEtFKmdGWQ==
++Accept: */*
++
++GET /data/11680002.txt HTTP/1.1
++Host: %HOSTIP:%HTTPPORT
++Authorization: Basic Y2F0bWFpI2Q6I0RaYVJKWXJpeEtFKmdGWQ==
++Accept: */*
++
++</protocol>
++</verify>
++</testcase>
diff --git a/meta/recipes-support/curl/curl/CVE-2020-8177.patch b/meta/recipes-support/curl/curl/CVE-2020-8177.patch
new file mode 100644
index 0000000000..4f14fa2306
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2020-8177.patch
@@ -0,0 +1,67 @@
+From 8236aba58542c5f89f1d41ca09d84579efb05e22 Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Sun, 31 May 2020 23:09:59 +0200
+Subject: [PATCH] tool_getparam: -i is not OK if -J is used
+
+Reported-by: sn on hackerone
+Bug: https://curl.haxx.se/docs/CVE-2020-8177.html
+
+Upstream-Status: Backport
+CVE:CVE-2020-8177
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ src/tool_cb_hdr.c   | 22 ++++------------------
+ src/tool_getparam.c |  5 +++++
+ 2 files changed, 9 insertions(+), 18 deletions(-)
+
+Index: curl-7.69.1/src/tool_cb_hdr.c
+===================================================================
+--- curl-7.69.1.orig/src/tool_cb_hdr.c
++++ curl-7.69.1/src/tool_cb_hdr.c
+@@ -186,25 +186,11 @@ size_t tool_header_cb(char *ptr, size_t
+       filename = parse_filename(p, len);
+       if(filename) {
+         if(outs->stream) {
+-          int rc;
+-          /* already opened and possibly written to */
+-          if(outs->fopened)
+-            fclose(outs->stream);
+-          outs->stream = NULL;
+-
+-          /* rename the initial file name to the new file name */
+-          rc = rename(outs->filename, filename);
+-          if(rc != 0) {
+-            warnf(per->config->global, "Failed to rename %s -> %s: %s\n",
+-                  outs->filename, filename, strerror(errno));
+-          }
+-          if(outs->alloc_filename)
+-            Curl_safefree(outs->filename);
+-          if(rc != 0) {
+-            free(filename);
+-            return failure;
+-          }
++          /* indication of problem, get out! */
++          free(filename);
++          return failure;
+         }
++
+         outs->is_cd_filename = TRUE;
+         outs->s_isreg = TRUE;
+         outs->fopened = FALSE;
+Index: curl-7.69.1/src/tool_getparam.c
+===================================================================
+--- curl-7.69.1.orig/src/tool_getparam.c
++++ curl-7.69.1/src/tool_getparam.c
+@@ -1807,6 +1807,11 @@ ParameterError getparameter(const char *
+       }
+       break;
+     case 'i':
++      if(config->content_disposition) {
++        warnf(global,
++              "--include and --remote-header-name cannot be combined.\n");
++        return PARAM_BAD_USE;
++      }
+       config->show_headers = toggle; /* show the headers as well in the
+                                         general output stream */
+       break;
diff --git a/meta/recipes-support/curl/curl_7.69.1.bb b/meta/recipes-support/curl/curl_7.69.1.bb
index e854e8d4bd..8b5170f021 100644
--- a/meta/recipes-support/curl/curl_7.69.1.bb
+++ b/meta/recipes-support/curl/curl_7.69.1.bb
@@ -7,6 +7,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=2e9fb35867314fe31c6a4977ef7dd531"
 
 SRC_URI = "http://curl.haxx.se/download/curl-${PV}.tar.bz2 \
            file://0001-replace-krb5-config-with-pkg-config.patch \
+           file://CVE-2020-8169.patch \
+           file://CVE-2020-8177.patch \
 "
 
 SRC_URI[md5sum] = "ec5fc263f898a3dfef08e805f1ecca42"
-- 
2.17.1

