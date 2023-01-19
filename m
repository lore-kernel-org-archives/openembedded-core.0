Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41E72C6379F
	for <webhook@archiver.kernel.org>; Thu, 19 Jan 2023 23:51:54 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web10.61945.1674172308288652974
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Jan 2023 15:51:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=FkrpWQOF;
 spf=pass (domain: gmail.com, ip: 209.85.216.50, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f50.google.com with SMTP id o13so4047488pjg.2
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Jan 2023 15:51:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U2KH5FFRdlRAZxXbd9T42+WzQMJOyXFrMBzxJvJcY6E=;
        b=FkrpWQOFKKmd8tRSTZ34mP9/pWxIhEURWOraDuZnHuMHixH9txUMFoVqiMLy8dJ8KD
         l+a2uMUpd9SitisGUTfL4Muh97TChtFtMBNT3+hjZa5ZADOwc9XfXFUQlml4gSO+h2gv
         Xib7B1Sc/AnyVJ1KnvwJjBd1BFl0TRPbPcS7LxB3nPpStv4op4TgtHrcf0pR/hlnlN5e
         4qudea2hntbowH7ntHYB1lo8CmJ64eKQ3yCl81UCVNv2P1o0rGJQhXt0RQX7kLBDtQ0u
         S4grRQXREYdu+QE1e9YNxTxI4l7vZTLMIcK/xcw4uM1/XYE3m2jg4oLvmu4G2g5qPlQ7
         UUlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U2KH5FFRdlRAZxXbd9T42+WzQMJOyXFrMBzxJvJcY6E=;
        b=H0jdWBIOU/+5COFehgITxhNygPli3cK475uvoDDfQp12cTtsRG1iTkeHUpEYMxXOYt
         slacYBSMjLLj+2+x7p9AvubgqjYc26yqc5PCpV4VeGVApY18+4xv3D+zvhPsJFwIm3mg
         pa416nngJO9wqrMrYVanE2g6ATC9ec3JojLqs+JmU6oX/MpmCkx2Zd/Xd01XLLdX0Peh
         //RAsG93MgD9hA9iZyhxKIuvPZWDM/KJOiXbBHsQGlZiK4Nvbdk8Va86HZYClBNefERW
         4vwLGg4dmpJqLAyMdKsE4/6oMNeDyWi0EMg522kB6GsKBo/Jtrna6xkUX5YspdxMd8YZ
         3FOg==
X-Gm-Message-State: AFqh2kphTp8akTiGKkrkKKdc/vix19O9Ch32jiyLMlOUIshM0n4iQdTS
	gp7QN3Dcm/s7kS3jC2Y+Z6lFktOBa9nP4A==
X-Google-Smtp-Source: AMrXdXtqMd/nmnB0jopd/3HY9mNaBnFCcnwIq9fI8oZts0S4l5JO/JBjXhtL4E1tqPpKfOEzThw4EA==
X-Received: by 2002:a17:902:a614:b0:192:fe0a:11c8 with SMTP id u20-20020a170902a61400b00192fe0a11c8mr12839462plq.46.1674172307298;
        Thu, 19 Jan 2023 15:51:47 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::b940])
        by smtp.gmail.com with ESMTPSA id u2-20020a1709026e0200b001948d2ef5b4sm9236555plk.75.2023.01.19.15.51.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jan 2023 15:51:46 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v3 3/3] elfutils: Fix build with libcurl >= 7.87
Date: Thu, 19 Jan 2023 15:51:41 -0800
Message-Id: <20230119235141.1603399-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230119235141.1603399-1-raj.khem@gmail.com>
References: <20230119235141.1603399-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Jan 2023 23:51:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176175

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2 -> v3:
- rebase

 .../elfutils/elfutils_0.188.bb                |  4 +-
 ...od-Fix-usage-of-deprecated-CURLINFO_.patch | 49 +++++++++++++++++++
 ...t-Use-CURLOPT_PROTOCOLS_STR-for-libc.patch | 34 +++++++++++++
 3 files changed, 85 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-devtools/elfutils/files/0001-PR29926-debuginfod-Fix-usage-of-deprecated-CURLINFO_.patch
 create mode 100644 meta/recipes-devtools/elfutils/files/0002-debuginfod-client-Use-CURLOPT_PROTOCOLS_STR-for-libc.patch

diff --git a/meta/recipes-devtools/elfutils/elfutils_0.188.bb b/meta/recipes-devtools/elfutils/elfutils_0.188.bb
index 084908a38c..65cae868c7 100644
--- a/meta/recipes-devtools/elfutils/elfutils_0.188.bb
+++ b/meta/recipes-devtools/elfutils/elfutils_0.188.bb
@@ -21,6 +21,8 @@ SRC_URI = "https://sourceware.org/elfutils/ftp/${PV}/${BP}.tar.bz2 \
            file://0001-skip-the-test-when-gcc-not-deployed.patch \
            file://ptest.patch \
            file://0001-tests-Makefile.am-compile-test_nlist-with-standard-C.patch \
+           file://0001-PR29926-debuginfod-Fix-usage-of-deprecated-CURLINFO_.patch \
+           file://0002-debuginfod-client-Use-CURLOPT_PROTOCOLS_STR-for-libc.patch \
            "
 SRC_URI:append:libc-musl = " \
            file://0003-musl-utils.patch \
@@ -33,8 +35,6 @@ inherit autotools gettext ptest pkgconfig
 EXTRA_OECONF = "--program-prefix=eu-"
 
 BUILD_CFLAGS += "-Wno-error=stringop-overflow"
-# compatibility with curl 7.87; can be removed when elfutils upstream fixes the deprecation fails
-CFLAGS:append = " -Wno-error=deprecated-declarations"
 
 DEPENDS_BZIP2 = "bzip2-replacement-native"
 DEPENDS_BZIP2:class-target = "bzip2"
diff --git a/meta/recipes-devtools/elfutils/files/0001-PR29926-debuginfod-Fix-usage-of-deprecated-CURLINFO_.patch b/meta/recipes-devtools/elfutils/files/0001-PR29926-debuginfod-Fix-usage-of-deprecated-CURLINFO_.patch
new file mode 100644
index 0000000000..ee192e3581
--- /dev/null
+++ b/meta/recipes-devtools/elfutils/files/0001-PR29926-debuginfod-Fix-usage-of-deprecated-CURLINFO_.patch
@@ -0,0 +1,49 @@
+From d2bf497b12fbd49b4996ccf0744303ffd67735b1 Mon Sep 17 00:00:00 2001
+From: Andrew Paprocki <andrew@ishiboo.com>
+Date: Wed, 21 Dec 2022 11:15:00 -0500
+Subject: [PATCH] PR29926: debuginfod: Fix usage of deprecated CURLINFO_*
+
+The `CURLINFO_SIZE_DOWNLOAD_T` and `CURLINFO_CONTENT_LENGTH_DOWNLOAD_T`
+identifiers are `enum`s, not pre-processor definitions, so the current
+`#ifdef` logic is not selecting the newer API.  This results in the
+older identifiers being used and they now generate errors when compiled
+against Curl 7.87, which has silently deprecated them, causing GCC to
+emit `-Werror=deprecated-declarations`.
+
+Instead, the newer identifiers were added in Curl 7.55, so explicitly
+check for `CURL_AT_LEAST_VERSION(7, 55, 0)` instead of the current
+logic.  This eliminates the error when compiling against Curl 7.87.
+
+Ref: https://github.com/curl/curl/pull/1511
+
+Upstream-Status: Backport [https://sourceware.org/git/?p=elfutils.git;a=commit;h=d2bf497b12fbd49b4996ccf0744303ffd67735b1]
+Signed-off-by: Andrew Paprocki <andrew@ishiboo.com>
+---
+ debuginfod/debuginfod-client.c | 4 ++--
+ 2 files changed, 6 insertions(+), 2 deletions(-)
+
+diff --git a/debuginfod/debuginfod-client.c b/debuginfod/debuginfod-client.c
+index 8873fcc8..692aecce 100644
+--- a/debuginfod/debuginfod-client.c
++++ b/debuginfod/debuginfod-client.c
+@@ -1456,7 +1456,7 @@ debuginfod_query_server (debuginfod_client *c,
+              deflate-compressing proxies, this number is likely to be
+              unavailable, so -1 may show. */
+           CURLcode curl_res;
+-#ifdef CURLINFO_CONTENT_LENGTH_DOWNLOAD_T
++#if CURL_AT_LEAST_VERSION(7, 55, 0)
+           curl_off_t cl;
+           curl_res = curl_easy_getinfo(target_handle,
+                                        CURLINFO_CONTENT_LENGTH_DOWNLOAD_T,
+@@ -1491,7 +1491,7 @@ debuginfod_query_server (debuginfod_client *c,
+           if (target_handle) /* we've committed to a server; report its download progress */
+             {
+               CURLcode curl_res;
+-#ifdef CURLINFO_SIZE_DOWNLOAD_T
++#if CURL_AT_LEAST_VERSION(7, 55, 0)
+               curl_off_t dl;
+               curl_res = curl_easy_getinfo(target_handle,
+                                            CURLINFO_SIZE_DOWNLOAD_T,
+-- 
+2.39.1
+
diff --git a/meta/recipes-devtools/elfutils/files/0002-debuginfod-client-Use-CURLOPT_PROTOCOLS_STR-for-libc.patch b/meta/recipes-devtools/elfutils/files/0002-debuginfod-client-Use-CURLOPT_PROTOCOLS_STR-for-libc.patch
new file mode 100644
index 0000000000..2d4c912e82
--- /dev/null
+++ b/meta/recipes-devtools/elfutils/files/0002-debuginfod-client-Use-CURLOPT_PROTOCOLS_STR-for-libc.patch
@@ -0,0 +1,34 @@
+From 6560fb26a62ef135a804357ef4f15a47de3e49b3 Mon Sep 17 00:00:00 2001
+From: Mark Wielaard <mark@klomp.org>
+Date: Tue, 10 Jan 2023 23:20:41 +0100
+Subject: [PATCH] debuginfod-client: Use CURLOPT_PROTOCOLS_STR for libcurl >= 7.85.0
+
+https://sourceware.org/bugzilla/show_bug.cgi?id=29926
+
+Upstream-Status: Backport [https://sourceware.org/git/?p=elfutils.git;a=commit;h=6560fb26a62ef135a804357ef4f15a47de3e49b3]
+Signed-off-by: Mark Wielaard <mark@klomp.org>
+---
+ debuginfod/debuginfod-client.c | 5 +++++
+ 2 files changed, 10 insertions(+)
+
+diff --git a/debuginfod/debuginfod-client.c b/debuginfod/debuginfod-client.c
+index a16165bd..1ce45632 100644
+--- a/debuginfod/debuginfod-client.c
++++ b/debuginfod/debuginfod-client.c
+@@ -1336,8 +1336,13 @@ debuginfod_query_server (debuginfod_client *c,
+ 
+       /* Only allow http:// + https:// + file:// so we aren't being
+ 	 redirected to some unsupported protocol.  */
++#if CURL_AT_LEAST_VERSION(7, 85, 0)
++      curl_easy_setopt_ck(data[i].handle, CURLOPT_PROTOCOLS_STR,
++			  "http,https,file");
++#else
+       curl_easy_setopt_ck(data[i].handle, CURLOPT_PROTOCOLS,
+ 			  (CURLPROTO_HTTP | CURLPROTO_HTTPS | CURLPROTO_FILE));
++#endif
+       curl_easy_setopt_ck(data[i].handle, CURLOPT_URL, data[i].url);
+       if (vfd >= 0)
+ 	curl_easy_setopt_ck(data[i].handle, CURLOPT_ERRORBUFFER,
+-- 
+2.39.1
+
-- 
2.39.1


