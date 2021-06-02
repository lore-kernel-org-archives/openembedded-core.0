Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web11.9894.1622618734470557044
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Jun 2021 00:25:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Usx4FS7L;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id o2-20020a05600c4fc2b029019a0a8f959dso1054635wmq.1
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Jun 2021 00:25:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=o6rTNQ7wSabZM4Ej/VjVUPdo/wazYdMhjzEaZtFSdwc=;
        b=Usx4FS7L3FxI1zaloyIBK0wtjbwFnnmC80iczabGcEkb0wbkh9jfFUbL7ndvKJzssj
         IdGcZJ5IKD6WjhlxkV49mOEbbw5ewh9CohXyysHpgtqNZ30c/eW8wNcxGniyY7B0s8bf
         PWwfL41kw2Ei9M4GJrrcH5mUxS1dmACdhZ2AQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=o6rTNQ7wSabZM4Ej/VjVUPdo/wazYdMhjzEaZtFSdwc=;
        b=ozqjyBBrL2fmzy/GO6BDsMAzy1QzFG19/wT1zp8KKUNNizxs2jASfSjbiAciiQ/ysG
         GXkTph+Pk7ROcQYUKEB5gr66N2gkUAa4TBj7AJgaUYR+zs+Yy9vqm/ldeKLyCEjnNNI/
         C4cwDAajOBt0nWwJjL7BdyVfG0JYDV1nxnW3Q1d0j3gG6Ph4m7Jd5s6AedQr4eAUB9df
         SAGrf5qA1Zc2JWQdM2o0ZFWV+z6wZMHcpzfttD5N4QxBkRyE6DGqlRzOmj1BbC/5223I
         mWq3X9YIXuqTLL/GMCYCdsQf1+LSxScza7P2H4a+y67edUdgGlaG+3Ekqhrj1bs7paD+
         6HIA==
X-Gm-Message-State: AOAM532FCCm8k5HhRuQn9b7qkxUAc5HS8DbQkT4jqZKobX9lTas8Qcf9
	gcewkO4I0ve5dFwXjA2a57+5PgSfElnczA==
X-Google-Smtp-Source: ABdhPJxStKbH/zYg5s1Bc6lfkZJ14qkKVhsC/vIg+/pe+MR57LwXN5p7dzA+CRl5+TuCrRD85S13QA==
X-Received: by 2002:a1c:7218:: with SMTP id n24mr3693865wmc.104.1622618732938;
        Wed, 02 Jun 2021 00:25:32 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:743:408f:2993:133e])
        by smtp.gmail.com with ESMTPSA id q11sm1052916wmq.1.2021.06.02.00.25.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jun 2021 00:25:32 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: Trevor Gamblin <trevor.gamblin@windriver.com>
Subject: [hardknott] [PATCH 7/7] curl: fix CVE-2021-22876
Date: Wed,  2 Jun 2021 08:25:29 +0100
Message-Id: <20210602072529.2896899-7-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210602072529.2896899-1-richard.purdie@linuxfoundation.org>
References: <20210602072529.2896899-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Trevor Gamblin <trevor.gamblin@windriver.com>

Backport and modify the patch for CVE-2021-22876 from curl 7.76 to
make it apply cleanly on 7.75.

CVE: CVE-2021-22876

Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...redentials-from-the-auto-referer-hea.patch | 152 ++++++++++++++++++
 meta/recipes-support/curl/curl_7.75.0.bb      |   1 +
 2 files changed, 153 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/0002-transfer-strip-credentials-from-the-auto-referer-hea.patch

diff --git a/meta/recipes-support/curl/curl/0002-transfer-strip-credentials-from-the-auto-referer-hea.patch b/meta/recipes-support/curl/curl/0002-transfer-strip-credentials-from-the-auto-referer-hea.patch
new file mode 100644
index 00000000000..6c4f6f2f48a
--- /dev/null
+++ b/meta/recipes-support/curl/curl/0002-transfer-strip-credentials-from-the-auto-referer-hea.patch
@@ -0,0 +1,152 @@
+From 21f6cf63939111d8d76d3a4c07f2cd2fe6cb78f8 Mon Sep 17 00:00:00 2001
+From: Trevor Gamblin <trevor.gamblin@windriver.com>
+Date: Tue, 1 Jun 2021 09:59:20 -0400
+Subject: [PATCH 2/2] transfer: strip credentials from the auto-referer header
+ field
+
+Added test 2081 to verify.
+
+CVE-2021-22876
+
+Bug: https://curl.se/docs/CVE-2021-22876.html
+
+Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
+---
+ lib/transfer.c          | 25 ++++++++++++++--
+ tests/data/Makefile.inc |  2 +-
+ tests/data/test2081     | 66 +++++++++++++++++++++++++++++++++++++++++
+ 3 files changed, 90 insertions(+), 3 deletions(-)
+ create mode 100644 tests/data/test2081
+
+diff --git a/lib/transfer.c b/lib/transfer.c
+index 2f29b29d8..c641a1d47 100644
+--- a/lib/transfer.c
++++ b/lib/transfer.c
+@@ -1565,6 +1565,9 @@ CURLcode Curl_follow(struct Curl_easy *data,
+       data->set.followlocation++; /* count location-followers */
+ 
+       if(data->set.http_auto_referer) {
++        CURLU *u;
++        char *referer;
++
+         /* We are asked to automatically set the previous URL as the referer
+            when we get the next URL. We pick the ->url field, which may or may
+            not be 100% correct */
+@@ -1574,9 +1577,27 @@ CURLcode Curl_follow(struct Curl_easy *data,
+           data->change.referer_alloc = FALSE;
+         }
+ 
+-        data->change.referer = strdup(data->change.url);
+-        if(!data->change.referer)
++        /* Make a copy of the URL without crenditals and fragment */
++        u = curl_url();
++        if(!u)
++          return CURLE_OUT_OF_MEMORY;
++
++        uc = curl_url_set(u, CURLUPART_URL, data->change.url, 0);
++        if(!uc)
++          uc = curl_url_set(u, CURLUPART_FRAGMENT, NULL, 0);
++        if(!uc)
++          uc = curl_url_set(u, CURLUPART_USER, NULL, 0);
++        if(!uc)
++          uc = curl_url_set(u, CURLUPART_PASSWORD, NULL, 0);
++        if(!uc)
++          uc = curl_url_get(u, CURLUPART_URL, &referer, 0);
++
++        curl_url_cleanup(u);
++
++        if(uc || referer == NULL)
+           return CURLE_OUT_OF_MEMORY;
++
++        data->change.referer = referer;
+         data->change.referer_alloc = TRUE; /* yes, free this later */
+       }
+     }
+diff --git a/tests/data/Makefile.inc b/tests/data/Makefile.inc
+index 5ebf049b8..e08cfc7ee 100644
+--- a/tests/data/Makefile.inc
++++ b/tests/data/Makefile.inc
+@@ -223,7 +223,7 @@ test2064 test2065 test2066 test2067 test2068 test2069 \
+ test2064 test2065 test2066 test2067 test2068 test2069 test2070 \
+          test2071 test2072 test2073 test2074 test2075 test2076 test2077 \
+ test2078 \
+-test2080 \
++test2080 test2081\
+ test2100 \
+ \
+ test3000 test3001 test3002 test3003 test3004 test3005 test3006 test3007 \
+diff --git a/tests/data/test2081 b/tests/data/test2081
+new file mode 100644
+index 000000000..7e74f5766
+--- /dev/null
++++ b/tests/data/test2081
+@@ -0,0 +1,66 @@
++<testcase>
++<info>
++<keywords>
++HTTP
++HTTP GET
++referer
++followlocation
++--write-out
++</keywords>
++</info>
++
++# Server-side
++<reply>
++<data nocheck="yes">
++HTTP/1.1 301 This is a weirdo text message swsclose
++Location: data/%TESTNUMBER0002.txt?coolsite=yes
++Content-Length: 62
++Connection: close
++
++This server reply is for testing a simple Location: following
++</data>
++</reply>
++
++# Client-side
++<client>
++<server>
++http
++</server>
++ <name>
++Automatic referrer credential and anchor stripping check
++ </name>
++ <command>
++http://user:pass@%HOSTIP:%HTTPPORT/we/want/our/%TESTNUMBER#anchor --location --referer ';auto' --write-out '%{referer}\n'
++</command>
++</client>
++
++# Verify data after the test has been "shot"
++<verify>
++<errorcode>
++52
++</errorcode>
++<protocol>
++GET /we/want/our/%TESTNUMBER HTTP/1.1
++Host: %HOSTIP:%HTTPPORT
++Authorization: Basic dXNlcjpwYXNz
++User-Agent: curl/%VERSION
++Accept: */*
++
++GET /we/want/our/data/%TESTNUMBER0002.txt?coolsite=yes HTTP/1.1
++Host: %HOSTIP:%HTTPPORT
++Authorization: Basic dXNlcjpwYXNz
++User-Agent: curl/%VERSION
++Accept: */*
++Referer: http://%HOSTIP:%HTTPPORT/we/want/our/%TESTNUMBER
++
++</protocol>
++<stdout>
++HTTP/1.1 301 This is a weirdo text message swsclose
++Location: data/%TESTNUMBER0002.txt?coolsite=yes
++Content-Length: 62
++Connection: close
++
++http://%HOSTIP:%HTTPPORT/we/want/our/%TESTNUMBER
++</stdout>
++</verify>
++</testcase>
+-- 
+2.31.1
+
diff --git a/meta/recipes-support/curl/curl_7.75.0.bb b/meta/recipes-support/curl/curl_7.75.0.bb
index 428b8cd9e37..7c7b363ae38 100644
--- a/meta/recipes-support/curl/curl_7.75.0.bb
+++ b/meta/recipes-support/curl/curl_7.75.0.bb
@@ -12,6 +12,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=425f6fdc767cc067518eef9bbdf4ab7b"
 SRC_URI = "https://curl.haxx.se/download/curl-${PV}.tar.bz2 \
            file://0001-replace-krb5-config-with-pkg-config.patch \
            file://0001-vtls-add-isproxy-argument-to-Curl_ssl_get-addsession.patch \
+           file://0002-transfer-strip-credentials-from-the-auto-referer-hea.patch \
 "
 
 SRC_URI[sha256sum] = "50552d4501c178e4cc68baaecc487f466a3d6d19bbf4e50a01869effb316d026"
-- 
2.30.2

