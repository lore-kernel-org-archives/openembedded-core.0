Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61CD3CAC5B8
	for <webhook@archiver.kernel.org>; Tue, 30 Sep 2025 19:50:31 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web11.230.1759261821588131986
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Sep 2025 12:50:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=brC8w/Vm;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.176, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-7833765433cso4620046b3a.0
        for <openembedded-core@lists.openembedded.org>; Tue, 30 Sep 2025 12:50:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1759261821; x=1759866621; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ALqtEO9z4g4IaXL79YekV1Fc8+5fbJUmzk6ZeCnXRGE=;
        b=brC8w/VmPUgV7UkKxzjjQOF8uuWQXY4V9nZq1xsVH0uP4ZDBV8TBAXggPLM/s2M61x
         w7aWEcANuyZZlHa1SP40I90hGj64Q9mRn6iHOoRrSILV26/VIlVH0ErjSlDmRpt/eRRd
         sP1FYRY6vlffu/4jtGAOpLoj2ijIRj9Nfb+DK36TxZgDBiNrVVDm2hpa8pXYwMgJLsto
         CuXHStA+utdYVx2XxZfpCd+E37ioVM5NONvVzmuBcgU+RhLPE9eHzCzASq3mskNrF1A4
         PJoc2oN4CyLvyFia0k4Vnxminkke2qTzordjn8eHwhnQnMYdQzjRxbbVQDarzadxEDxc
         5XOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759261821; x=1759866621;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ALqtEO9z4g4IaXL79YekV1Fc8+5fbJUmzk6ZeCnXRGE=;
        b=ga3hh93CSOs45MEQbhmWv7HnyYfMcZMGV7UgNQ3QGfLD298Dzmc58oTQbwmlRENedC
         zNNMcQtS8WFXOH/OKe/gxHjIjLY5+boDGQTupLjJwWJn8gOGT6YtacUzChF2SbmhFAoQ
         9Dy6IH8EqOU1x12qi2pu7TE/uCr1vTFb5fZMWLQOCMkOUZmjG0d1QDDq2o3epY9H7Aiw
         S0Of5A/FJTDha2WvnQtfBX6ITAKQJz2YeD8w6lOrMV8crSSOJIbAZOdKMYJ1jLY8md16
         C/OsQxEAfKmt8QkCd3QoqDec6r649JcUPnf16bOwenyFwEZIHkAN8N0sGjlBrMOU+YNh
         1R+A==
X-Gm-Message-State: AOJu0YzGHTH1qun7cZwkrD8Ad+lqdV0YXEysroinl4bmBMBCiEttxNUn
	Iu2a49XZZ7auQHURjtF2Cx7Nr6TN6f5vfw2gefcmt6opxPkxz579A6MtUWFkxK6lIxep3Tgp7ZD
	C+MMK
X-Gm-Gg: ASbGncv47UidMAgCV6jEeQptH9P65RQsZwru4DIB0sZsTcDQOKZVBphcHJCPcxclfVa
	R4UkhzBkToLdQji43bVT6L0T7R3W/RBGL14wDInJjkiZF+lTVLHfnNJa0fNuVxu36CZPhdZk4Q8
	rLestxrpGVruf4JnyhJ+bICkAWqylBS4mkdTLru3WibsZU0A4gbPCMYFP71Xqq1zpJlEJeelw7e
	SfrO6MrRdv3smq+Ccltkn02v8TjkvN37y3s9umLqsFJH2EG3qgpyY6LMJwwrjKEXv/kyJYXNBo9
	yv+4p95Zvef2+bHIGNOLj7gQ/tqW3bceNaPJODFVDZPbQAypZqHD0jxyly5lhqp/ns3pjqBSh8J
	9X6a6E1WVamSZrXluwVo0Xl1l1KRXjCIpceRhh3GzyJKPrc3H
X-Google-Smtp-Source: AGHT+IE4ViVRTkc+UvbQ9bx0gwkzVhTGC8PjplTsQ7nRvXxhDr0dlgCCbsLfi79tqpj202Y1az3JUQ==
X-Received: by 2002:a05:6a00:848:b0:781:4ec:4ec4 with SMTP id d2e1a72fcca58-78af422dc47mr739753b3a.31.1759261820743;
        Tue, 30 Sep 2025 12:50:20 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:5e34:462b:e2f0:5898])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7810238ca6dsm14411202b3a.8.2025.09.30.12.50.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Sep 2025 12:50:20 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 3/7] curl: fix CVE-2025-9086
Date: Tue, 30 Sep 2025 12:50:05 -0700
Message-ID: <dc842a631b178acd9c4f00c4a3b87831baf08ebb.1759260542.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1759260542.git.steve@sakoman.com>
References: <cover.1759260542.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Sep 2025 19:50:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224196

From: Yogita Urade <yogita.urade@windriver.com>

1, A cookie is set using the secure keyword for https://target
2, curl is redirected to or otherwise made to speak with http://target
(same hostname, but using clear text HTTP) using the same cookie set
3, The same cookie name is set - but with just a slash as path (path="/").
Since this site is not secure, the cookie should just be ignored.
4, A bug in the path comparison logic makes curl read outside a heap buffer boundary

The bug either causes a crash or it potentially makes the comparison come to
the wrong conclusion and lets the clear-text site override the contents of
the secure cookie, contrary to expectations and depending on the memory contents
immediately following the single-byte allocation that holds the path.

The presumed and correct behavior would be to plainly ignore the second set of
the cookie since it was already set as secure on a secure host so overriding
it on an insecure host should not be okay.

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2025-9086

Upstream patch:
https://github.com/curl/curl/commit/c6ae07c6a541e0e96d0040afb6

Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../curl/curl/CVE-2025-9086.patch             | 55 +++++++++++++++++++
 meta/recipes-support/curl/curl_7.82.0.bb      |  1 +
 2 files changed, 56 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2025-9086.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2025-9086.patch b/meta/recipes-support/curl/curl/CVE-2025-9086.patch
new file mode 100644
index 0000000000..8ee7cd5192
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2025-9086.patch
@@ -0,0 +1,55 @@
+From c6ae07c6a541e0e96d0040afb62b45dd37711300 Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Mon, 11 Aug 2025 20:23:05 +0200
+Subject: [PATCH] cookie: don't treat the leading slash as trailing
+
+If there is only a leading slash in the path, keep that. Also add an
+assert to make sure the path is never blank.
+
+Reported-by: Google Big Sleep
+Closes #18266
+
+CVE: CVE-2025-9086
+Upstream-Status: Backport [https://github.com/curl/curl/commit/c6ae07c6a541e0e96d0040afb6]
+
+Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
+---
+ lib/cookie.c | 9 +++++----
+ 1 file changed, 5 insertions(+), 4 deletions(-)
+
+diff --git a/lib/cookie.c b/lib/cookie.c
+index e287458..ac7d3de 100644
+--- a/lib/cookie.c
++++ b/lib/cookie.c
+@@ -312,7 +312,7 @@ static char *sanitize_cookie_path(const char *cookie_path)
+   }
+
+   /* convert /hoge/ to /hoge */
+-  if(len && new_path[len - 1] == '/') {
++  if(len > 1 && new_path[len - 1] == '/') {
+     new_path[len - 1] = 0x0;
+   }
+
+@@ -1078,7 +1078,7 @@ Curl_cookie_add(struct Curl_easy *data,
+         if(clist->spath && co->spath) {
+           if(clist->secure && !co->secure && !secure) {
+             size_t cllen;
+-            const char *sep;
++            const char *sep = NULL;
+
+             /*
+              * A non-secure cookie may not overlay an existing secure cookie.
+@@ -1087,8 +1087,9 @@ Curl_cookie_add(struct Curl_easy *data,
+              * "/loginhelper" is ok.
+              */
+
+-            sep = strchr(clist->spath + 1, '/');
+-
++            DEBUGASSERT(clist->spath[0]);
++            if(clist->spath[0])
++              sep = strchr(clist->spath + 1, '/');
+             if(sep)
+               cllen = sep - clist->spath;
+             else
+--
+2.40.0
diff --git a/meta/recipes-support/curl/curl_7.82.0.bb b/meta/recipes-support/curl/curl_7.82.0.bb
index 623d8a4bc3..54362e6978 100644
--- a/meta/recipes-support/curl/curl_7.82.0.bb
+++ b/meta/recipes-support/curl/curl_7.82.0.bb
@@ -66,6 +66,7 @@ SRC_URI = "https://curl.se/download/${BP}.tar.xz \
            file://CVE-2024-11053-0001.patch \
            file://CVE-2024-11053-0002.patch \
            file://CVE-2025-0167.patch \
+           file://CVE-2025-9086.patch \
            "
 SRC_URI[sha256sum] = "0aaa12d7bd04b0966254f2703ce80dd5c38dbbd76af0297d3d690cdce58a583c"
 
-- 
2.43.0


