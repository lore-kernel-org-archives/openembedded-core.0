Return-Path: <jkrishnanjanappa@mvista.com>
Received: from mail-oi0-f43.google.com (mail-oi0-f43.google.com
	[209.85.218.43])
	by mail.openembedded.org (Postfix) with ESMTP id 1EC3379265
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 11:18:47 +0000 (UTC)
Received: by mail-oi0-f43.google.com with SMTP id r69-v6so1916699oie.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 04:18:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=BOVvpHgtMcGaIxL8IaICmQWMEr3oeLMOvpAK8Z6FEA4=;
	b=n6R1gZtyXfAftIOlXDj5hQSpa7jYL4el3KOzOXYKO84InIXNrNpPfKeYoGDuicumIY
	bGcx/CvHOXGQs4Z6MSMbH58ZOg1PIKJnFSqSHM8gCF4mor172fse0Cq+S+TpL1dr1OSn
	E8+65ZbKFcigPbegwSUszl6eoct+vu6oOa7Uhb5V+i6zVghjC0JRyNg1fKl4iBFjnm3w
	WtIJMYGzL9+60dVSXYNzvGV4nL7kSrI55FtaeliIMdeOBDhzKv0KA2hWD+k2eIvw3LMe
	N0DvPux2yW8p2IFC56d6iObbCJIlFwdEnCP20pe3NzIsxJC9uvSLNoCjcOhgbSv8CMEu
	Xbeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=BOVvpHgtMcGaIxL8IaICmQWMEr3oeLMOvpAK8Z6FEA4=;
	b=M/JDZr6Qcv4XtJc1IPPZdlqzoM2OCkrdeXn3lKVajo2xjPafTyJ4e1xlGgu0zZe7GD
	DWAk1SHGUBbSFJ+I+XQrCN/RIST4g5KVeDCG7QIaRQWexU3Eiso8kmV3UnhPuYp9+tgf
	cS+5ox2wX2IByPR/PPt+znASAshLYK4s3m4dlKzk7DDK/dV4fRaEoWq3JizRZAuTw4jI
	cM3L7PRb0q/FAPCRWSfl9YcHevV1TxILaVZbqLrvwobpCT4usAX5trO3G/PclF/Yz4Fq
	mF3zVAEvgaR267drUwSi17JniOWZ2nzfZgcmWfAEuxlxfdVVE5/dYdsprxaI6wl7txDC
	tF/g==
X-Gm-Message-State: APzg51DIG5rnXtJ7nXbYzrkhclayjrKI39BSfj/MeHrbHpAcjYssSlZO
	8Bfs+wxkuT0LY0BWnJr3B2oD0k0KQd4=
X-Google-Smtp-Source: ANB0VdY7KdZhcwp7MEj4eUT/IlnbaLRRJAsDgYkx5hDHP8aSRfnvOhRxw0uF/M2mSHqNP3fxKco65Q==
X-Received: by 2002:aca:45d6:: with SMTP id
	s205-v6mr3600352oia.147.1534936728008; 
	Wed, 22 Aug 2018 04:18:48 -0700 (PDT)
Received: from dell-laptop.mvista.com ([157.49.107.222])
	by smtp.gmail.com with ESMTPSA id
	c9-v6sm862308oia.1.2018.08.22.04.18.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 22 Aug 2018 04:18:47 -0700 (PDT)
From: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Aug 2018 16:47:50 +0530
Message-Id: <1534936692-11736-12-git-send-email-jkrishnanjanappa@mvista.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1534936692-11736-1-git-send-email-jkrishnanjanappa@mvista.com>
References: <1534936692-11736-1-git-send-email-jkrishnanjanappa@mvista.com>
Subject: [ROCKO][PATCH 12/34] curl: CVE-2018-1000301
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
X-List-Received-Date: Wed, 22 Aug 2018 11:18:47 -0000

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


