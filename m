Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web12.2012.1593138365688867259
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Jun 2020 19:26:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=rJbbRBKg;
 spf=pass (domain: gmail.com, ip: 209.85.214.169, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id j4so3705795plk.3
        for <openembedded-core@lists.openembedded.org>; Thu, 25 Jun 2020 19:26:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=G6U61ysmkwwODio6AUK320vDjOBiUmgvfljY+9S77W4=;
        b=rJbbRBKg1tdkcYA9aGoZ4O2utwoPdd54wg/VR+QYWidKK7VD5Tk5i0EtiCQ9FcnuKb
         LUTqv9pnvw/CLjaSVe9xjYArMFeWu57IJ4mY9Sto4IUOtYxpLckv8gD7uoShY2d9lgVI
         t7xuby+Wl05YPiJknKzAae5LxbvtmSv/ckAYOhISLvLM/cH3845PA0eezwKNR2Sha3Pc
         CrYKlN4ietvIvzCUVj367sNiulnws21/OvRpznd9pK8WKi2AsLJQy2AIN2nxujs65/JF
         cr3XtxBkPEuTQJkUdFYPXV2WmZcFxUDmdQYt+/gDSHD/iScy7EbVUvv/0ALVF5S9/Pb0
         eSNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=G6U61ysmkwwODio6AUK320vDjOBiUmgvfljY+9S77W4=;
        b=A1PN5VAEiOBOTRBSHRZagt6RE3Ov91+T9QCTvqO417MiTPYaZDhCdehCnyQf/RYCqD
         BwMNtb+F23jI7q9K/VkgB6dHs1G/TsD7uWR+Er9ESCuByZ7r1umNIFPXzXXagoUb01E5
         tRshUpcjHxQRKI/ONB3OCFW34CWMMyj4FiSJrHsVH44W78jIqb5sLzfeQXhXouu2V/vR
         4xYzTcC0iN28JL4NIQkJCglPERnJQpimVNCEd5DqCpWu0BRJdawNVhWgMqowKRA06wgO
         vpYxlY5O/84AF/lyfz+it9Jq8oX3e7dt6+8pR8bf2iJkOrZx5+vsdA42Gd9YAqnrGlQo
         EtrQ==
X-Gm-Message-State: AOAM5333vWlIWcOWT54+p5+1H6v8rON+QcspcB4ZvTo7dWq+xfYTcH/5
	sSvmvxKHm+nEfOD7CIg97ysJysRM
X-Google-Smtp-Source: ABdhPJwdnsGBBYz/F37zxGOarPSelOdpEJtIpWQIIiQj257LH/0El0jdVEuszMkKySGoVBlWUxq+Cw==
X-Received: by 2002:a17:902:8204:: with SMTP id x4mr667327pln.153.1593138364716;
        Thu, 25 Jun 2020 19:26:04 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:acbe:8216:8a55:1b44])
        by smtp.gmail.com with ESMTPSA id y12sm6726276pfo.182.2020.06.25.19.26.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2020 19:26:04 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Armin Kuster <akuster@mvista.com>
Subject: [dunfell][PATCH] curl: Security fixes for CVE-2020-{8169/8177}
Date: Thu, 25 Jun 2020 19:26:01 -0700
Message-Id: <20200626022601.27734-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1

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
---
 .../curl/curl/CVE-2020-8169.patch             | 140 ++++++++++++++++++
 .../curl/curl/CVE-2020-8177.patch             |  67 +++++++++
 meta/recipes-support/curl/curl_7.69.1.bb      |   2 +
 3 files changed, 209 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2020-8169.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2020-8177.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2020-8169.patch b/meta/recipes-support/curl/curl/CVE-2020-8169.patch
new file mode 100644
index 0000000000..5f0b47cfe3
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

