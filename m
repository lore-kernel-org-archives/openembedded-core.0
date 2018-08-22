Return-Path: <jkrishnanjanappa@mvista.com>
Received: from mail-oi0-f53.google.com (mail-oi0-f53.google.com
	[209.85.218.53])
	by mail.openembedded.org (Postfix) with ESMTP id 0A6DE79368
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 13:36:29 +0000 (UTC)
Received: by mail-oi0-f53.google.com with SMTP id p84-v6so3154757oic.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 06:36:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=BOVvpHgtMcGaIxL8IaICmQWMEr3oeLMOvpAK8Z6FEA4=;
	b=V/VVOVC24FCOYoeWIYp4uYk8jh93zOPtPZ3UFAVHPdQojXfVbFC/qYx1Cl3d+0Eoop
	0lXVkjp9HoTxP+xP/sO7lzX+ntEqlrExnV6w44Yoz73lJ6k/Nh7uGIUagAENBt07z9vz
	yeaBSgFnjPbVLavh/rwINPyaieNy6/0AvOOjz3BnQ5CJ3cTGWuNkC7VKK95d4W+LTg8C
	Ni7Oaql6jZ6F/3at9SkTIUhmQf/0GahLJn0NiWuRnKvoJ+jjXWIAkqHx9L9yJDaV8vDG
	RAQGHryVGyrKq/cYBDJh3jIrXDSPAY5SiYDiy8td2teTP4WHnUQ1n/dQAoqiq4bX5ySi
	2t4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=BOVvpHgtMcGaIxL8IaICmQWMEr3oeLMOvpAK8Z6FEA4=;
	b=qg6rVL3gnCqPNOkk+Henglbg2jy+QAlKMH0RS+Tzo10kymG7+khZTicnuliuhSAhG6
	wfnRJzx7mnGO29YqDtUYazJvtocA193AUvmzz8oF7y/44qWAsBtKKHj9NNXNT43hfoj5
	Prw5HBy6YeCXzAjpMbv3wAH0lWGILfMn5NzxKU8pYP/+JDRVu0NN+facvt7uq2kcMI+V
	lScy68v2jTEnvLUbGcZBhylZDtA1BWta34kB2hcOEfZtloS71u4lV6bbiJ23Azt2sb5w
	XsfteqKBpUMcXUECD8UdHbb/PhWlXRWxgH2l1tdFVKxnm1SwvR/TdrqSKufDkQCC/J/Q
	5RAg==
X-Gm-Message-State: APzg51A4oM5MlYLqT1Prtg++j03pBjBFfcwMxs9tdiVoLH0h2wMv0p3k
	Z09+Eq+ZFkUEjRKI76Hij/5XAU5cgWA=
X-Google-Smtp-Source: ANB0Vdb+M8lT/ZiC4MEtXhax/24+Zq/CaIDvAp7ZRWI7WHQSdTwLFS3ubf/+cHjrZ8kPn+3tU5Qeyw==
X-Received: by 2002:aca:d946:: with SMTP id
	q67-v6mr1657971oig.212.1534944990867; 
	Wed, 22 Aug 2018 06:36:30 -0700 (PDT)
Received: from dell-laptop.mvista.com ([157.49.3.26])
	by smtp.gmail.com with ESMTPSA id
	h186-v6sm3746773oib.55.2018.08.22.06.36.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 22 Aug 2018 06:36:30 -0700 (PDT)
From: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Aug 2018 19:05:18 +0530
Message-Id: <1534944940-21566-12-git-send-email-jkrishnanjanappa@mvista.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1534944940-21566-1-git-send-email-jkrishnanjanappa@mvista.com>
References: <1534944940-21566-1-git-send-email-jkrishnanjanappa@mvista.com>
Subject: [ROCKO][PATCH V2 12/34] curl: CVE-2018-1000301
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 22 Aug 2018 13:36:30 -0000

http: restore buffer pointer when bad response-line is parsed

... leaving the k->str could lead to buffer over-reads later on.

CVE: CVE-2018-1000301
Assisted-by: Max Dymond

Detected by OSS-Fuzz.
Bug: https://curl.haxx.se/docs/adv_2018-b138.html
Bug: https://bugs.chromium.org/p/oss-fuzz/issues/detail?id=7105

Affects curl >= 7.20.0 && curl <= 7.59.0

Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
---
 .../curl/curl/CVE-2018-1000301.patch               | 54 ++++++++++++++++++++++
 meta/recipes-support/curl/curl_7.58.0.bb           |  1 +
 2 files changed, 55 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2018-1000301.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2018-1000301.patch b/meta/recipes-support/curl/curl/CVE-2018-1000301.patch
new file mode 100644
index 0000000..f42178e
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2018-1000301.patch
@@ -0,0 +1,54 @@
+From 8c7b3737d29ed5c0575bf592063de8a51450812d Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Sat, 24 Mar 2018 23:47:41 +0100
+Subject: [PATCH] http: restore buffer pointer when bad response-line is parsed
+
+... leaving the k->str could lead to buffer over-reads later on.
+
+CVE: CVE-2018-1000301
+Assisted-by: Max Dymond
+
+Detected by OSS-Fuzz.
+Bug: https://curl.haxx.se/docs/adv_2018-b138.html
+Bug: https://bugs.chromium.org/p/oss-fuzz/issues/detail?id=7105
+
+Upstream-Status: Backport [https://github.com/curl/curl-www/commit/3ee30b2b5e3836345ac510bc1674aa3a4272936e]
+Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
+---
+ lib/http.c | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/lib/http.c b/lib/http.c
+index 1a313b4fb..e080ae513 100644
+--- a/lib/http.c
++++ b/lib/http.c
+@@ -3012,10 +3012,12 @@ CURLcode Curl_http_readwrite_headers(struct Curl_easy *data,
+                                        ssize_t *nread,
+                                        bool *stop_reading)
+ {
+   CURLcode result;
+   struct SingleRequest *k = &data->req;
++  ssize_t onread = *nread;
++  char *ostr = k->str;
+ 
+   /* header line within buffer loop */
+   do {
+     size_t rest_length;
+     size_t full_length;
+@@ -3076,11 +3078,13 @@ CURLcode Curl_http_readwrite_headers(struct Curl_easy *data,
+           /* since there's more, this is a partial bad header */
+           k->badheader = HEADER_PARTHEADER;
+         else {
+           /* this was all we read so it's all a bad header */
+           k->badheader = HEADER_ALLBAD;
+-          *nread = (ssize_t)rest_length;
++          *nread = onread;
++          k->str = ostr;
++          return CURLE_OK;
+         }
+         break;
+       }
+     }
+ 
+-- 
+2.17.0
diff --git a/meta/recipes-support/curl/curl_7.58.0.bb b/meta/recipes-support/curl/curl_7.58.0.bb
index fdfbb3d..4376bb3 100644
--- a/meta/recipes-support/curl/curl_7.58.0.bb
+++ b/meta/recipes-support/curl/curl_7.58.0.bb
@@ -8,6 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;beginline=8;md5=3a34942f4ae3fbf1a303160714e66
 SRC_URI = "http://curl.haxx.se/download/curl-${PV}.tar.bz2 \
            file://0001-replace-krb5-config-with-pkg-config.patch \
            file://CVE-2018-1000300.patch \
+           file://CVE-2018-1000301.patch \
 "
 
 
-- 
2.7.4


