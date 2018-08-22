Return-Path: <jkrishnanjanappa@mvista.com>
Received: from mail-oi0-f54.google.com (mail-oi0-f54.google.com
	[209.85.218.54])
	by mail.openembedded.org (Postfix) with ESMTP id 26E7079473
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 15:09:25 +0000 (UTC)
Received: by mail-oi0-f54.google.com with SMTP id c190-v6so3702959oig.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 08:09:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=BOVvpHgtMcGaIxL8IaICmQWMEr3oeLMOvpAK8Z6FEA4=;
	b=q29Vzw/5paq15N4RRTyKv4zLqAblvks9EUPiv3It/Q2izJf5mlkb3i0y3Lt8wjYd4w
	PVejr0GWqbDRtRuTsAh66GbWXZT+W30ACSU3Ooeqv1w+QS9cBI46ncejny/ELNb6Ha+W
	C75karPEvpKK37lfRoFxEomTilWrmJm8FuPVRznHUmNlgf4KOVG8kFufKU0hS1L6+2cm
	x4xoWrcJe80t00jfhQpEL8MVV3VjZRmPWSU8nIidelSIOQ9LH+Iyi2yI5VyuqSEsllSX
	yApPTZ6yqEbybVbqrccMVXwLJfycrFkHpi3wZvYHojWFP016qVuinAveKUr+b7R+ueqY
	IbMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=BOVvpHgtMcGaIxL8IaICmQWMEr3oeLMOvpAK8Z6FEA4=;
	b=ewcZ2LfMza0pj2LmRGD0/1IR7qxiMCTP8nr/4auhWe6ErOkc5aa2+Uh+IHlRY9Siro
	cLl7kbfB/4LjJPx4wxWQQo7kS7G/02ubfgFVH7Y8/NfYJgiF1DgFvcGjwRCJBJ5xC6Da
	/AWNRW2vXYuf882+ASHF8cKcWWS1YTO5+3c5GO9GhPqAQo9Yz7u31ftXTnu2oWGy2HQM
	vAFvrVlOMV/R3Tov4SchPHJZUu4jtg+tOssEULXrrfbbIxDnmlYK32r9C1rCfRPQfK+K
	ocC0vnXPv0QFHcKqs2QiWXA/EqUfmVLmlZIDR1t1uo2gE/166syG+vnI4lMnGtJBQ++x
	3/mg==
X-Gm-Message-State: APzg51Dh5Q/LWKboyiLz0hmLXAUporTVbDA91uTDMaMOOROMw5zMKiZ0
	5B5HkTnF43BPE6Oen0xkUuVpB4aMsCg=
X-Google-Smtp-Source: ANB0VdYCYSrP+HVM8KvYZo4cCHODQZ4wTNtdNj/U0xRP4qc2jZxCmWFZY/RJzDAAHthJxQwsHVpkMg==
X-Received: by 2002:aca:3c45:: with SMTP id
	j66-v6mr4128944oia.118.1534950566860; 
	Wed, 22 Aug 2018 08:09:26 -0700 (PDT)
Received: from dell-laptop.mvista.com ([157.49.107.222])
	by smtp.gmail.com with ESMTPSA id
	i132-v6sm1024281oif.20.2018.08.22.08.09.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 22 Aug 2018 08:09:26 -0700 (PDT)
From: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Aug 2018 20:38:30 +0530
Message-Id: <1534950532-23850-12-git-send-email-jkrishnanjanappa@mvista.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1534950532-23850-1-git-send-email-jkrishnanjanappa@mvista.com>
References: <1534950532-23850-1-git-send-email-jkrishnanjanappa@mvista.com>
Subject: [ROCKO][PATCH V3 12/34] curl: CVE-2018-1000301
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
X-List-Received-Date: Wed, 22 Aug 2018 15:09:26 -0000

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


