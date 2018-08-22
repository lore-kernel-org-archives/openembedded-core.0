Return-Path: <jkrishnanjanappa@mvista.com>
Received: from mail-oi0-f43.google.com (mail-oi0-f43.google.com
	[209.85.218.43])
	by mail.openembedded.org (Postfix) with ESMTP id B840B79265
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 11:18:44 +0000 (UTC)
Received: by mail-oi0-f43.google.com with SMTP id y207-v6so2439552oie.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 04:18:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=bvjAggxl3o8jyJYPtFDOKRLkKIfQ1iAFeIZyvH7BVXE=;
	b=wA0wbMrNdFhYKRFaVC8JF9tr7wmQCgx7vrhBeffKOoRAmVS5mTCZt574ad1b9XWXFQ
	lE5qHlU1QU1wcaThTnk5tnJc38NaedO8SP2u6pCLjMK8/Rn36Jc392ky82tBH6qU0eQb
	dpIsg8cWCM2bj/mHyHwfGOjdWet3hp2nG3vXtQ0/LSPGmVFCrTSv50wB/pE/VNf6Qzyh
	YKSOjmwDaiaQu0WHbpFbHulLoyS+LvU1pBN5o/PvfuVU2gCfw4Ies+0VtDVfbiuJcykR
	44nAfM6SBhJZJC+ezzXW2geV+YA6/vRQDpScCs54yKifBI+Wm1IhUiopqAiLM4VYNgzo
	VN5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=bvjAggxl3o8jyJYPtFDOKRLkKIfQ1iAFeIZyvH7BVXE=;
	b=lxgnoEjGD0lWHU9fR8Qfn4BiywAFieuDNaAqpCkjfW4IeVI2HS79/gsqOmxjr72/mK
	XKfJruVMTg8yyovGM+cnas+1/OqaHoGZnXnDaxcUZZPDqideAd4xSOI6OatvdX/ElrLA
	w8RAGfi8gJGsHibYQGqGe/oncD4jnTtHnBa5tSNS3LDVSKpece1VtFXRE0ThkT0Z0X5q
	w+dPbeknh8iFigHBa9ubWEpXyyXnpASd/6HfJOLOuNzTUsK5XmqBIzUfJoayJ18urzEG
	CRlLV1PkMTCSX2ph3j2NgrzV+jyy7Z1bLKMNOPH7v8p5myNCz03UgdUqB3eqvHBgYxg9
	qbAA==
X-Gm-Message-State: APzg51BkT7otcp3mKtwW1IbaRNUumdL+Vjl/MctVbJhf4UXYzI+WZ3FG
	Pe9UdBQ+w1fvVU99j+dRaaT5ajMnxDo=
X-Google-Smtp-Source: ANB0VdbJEzUbJ3vY3ljv0IdQKbZr27oRuBKkvMcFtdo9S9XKJFMpaTpkK4RR88PWkLAxTXHVbl6K6A==
X-Received: by 2002:aca:4aca:: with SMTP id
	x193-v6mr1417267oia.211.1534936725781; 
	Wed, 22 Aug 2018 04:18:45 -0700 (PDT)
Received: from dell-laptop.mvista.com ([157.49.107.222])
	by smtp.gmail.com with ESMTPSA id
	c9-v6sm862308oia.1.2018.08.22.04.18.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 22 Aug 2018 04:18:45 -0700 (PDT)
From: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Aug 2018 16:47:49 +0530
Message-Id: <1534936692-11736-11-git-send-email-jkrishnanjanappa@mvista.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1534936692-11736-1-git-send-email-jkrishnanjanappa@mvista.com>
References: <1534936692-11736-1-git-send-email-jkrishnanjanappa@mvista.com>
Subject: [ROCKO][PATCH 11/34] curl: CVE-2018-1000300
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
X-List-Received-Date: Wed, 22 Aug 2018 11:18:44 -0000

pingpong: fix response cache memcpy overflow

Response data for a handle with a large buffer might be cached and then
used with the "closure" handle when it has a smaller buffer and then
he
larger cache will be copied and overflow the new smaller heap based
buffer.

Reported-by: Dario Weisser
CVE: CVE-2018-1000300
Bug: https://curl.haxx.se/docs/adv_2018-82c2.html

Affects curl >= 7.54.1 && curl <= 7.59.0

Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
---
 .../curl/curl/CVE-2018-1000300.patch               | 44 ++++++++++++++++++++++
 meta/recipes-support/curl/curl_7.58.0.bb           |  1 +
 2 files changed, 45 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2018-1000300.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2018-1000300.patch b/meta/recipes-support/curl/curl/CVE-2018-1000300.patch
new file mode 100644
index 0000000..893d45c
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2018-1000300.patch
@@ -0,0 +1,44 @@
+From 0a79d714bd55779a3a223efb5c089d0ad7e128a8 Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Fri, 23 Mar 2018 23:30:04 +0100
+Subject: [PATCH] pingpong: fix response cache memcpy overflow
+
+Response data for a handle with a large buffer might be cached and then
+used with the "closure" handle when it has a smaller buffer and then the
+larger cache will be copied and overflow the new smaller heap based
+buffer.
+
+Reported-by: Dario Weisser
+
+CVE: CVE-2018-1000300
+Bug: https://curl.haxx.se/docs/adv_2018-82c2.html
+Upstream-Status: Backport [https://github.com/curl/curl-www/commit/3ee30b2b5e3836345ac510bc1674aa3a4272936e]
+
+Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
+---
+ lib/pingpong.c | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/lib/pingpong.c b/lib/pingpong.c
+index 438856a99..ad370ee82 100644
+--- a/lib/pingpong.c
++++ b/lib/pingpong.c
+@@ -302,11 +302,14 @@ CURLcode Curl_pp_readresp(curl_socket_t sockfd,
+        *
+        * pp->cache_size is cast to ssize_t here.  This should be safe, because
+        * it would have been populated with something of size int to begin
+        * with, even though its datatype may be larger than an int.
+        */
+-      DEBUGASSERT((ptr + pp->cache_size) <= (buf + data->set.buffer_size + 1));
++      if((ptr + pp->cache_size) > (buf + data->set.buffer_size + 1)) {
++        failf(data, "cached response data too big to handle");
++        return CURLE_RECV_ERROR;
++      }
+       memcpy(ptr, pp->cache, pp->cache_size);
+       gotbytes = (ssize_t)pp->cache_size;
+       free(pp->cache);    /* free the cache */
+       pp->cache = NULL;   /* clear the pointer */
+       pp->cache_size = 0; /* zero the size just in case */
+-- 
+2.17.0
+
diff --git a/meta/recipes-support/curl/curl_7.58.0.bb b/meta/recipes-support/curl/curl_7.58.0.bb
index d2d0180..fdfbb3d 100644
--- a/meta/recipes-support/curl/curl_7.58.0.bb
+++ b/meta/recipes-support/curl/curl_7.58.0.bb
@@ -7,6 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;beginline=8;md5=3a34942f4ae3fbf1a303160714e66
 
 SRC_URI = "http://curl.haxx.se/download/curl-${PV}.tar.bz2 \
            file://0001-replace-krb5-config-with-pkg-config.patch \
+           file://CVE-2018-1000300.patch \
 "
 
 
-- 
2.7.4


