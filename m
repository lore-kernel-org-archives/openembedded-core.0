Return-Path: <jkrishnanjanappa@mvista.com>
Received: from mail-oi0-f49.google.com (mail-oi0-f49.google.com
	[209.85.218.49])
	by mail.openembedded.org (Postfix) with ESMTP id 16439792F4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 11:18:54 +0000 (UTC)
Received: by mail-oi0-f49.google.com with SMTP id 8-v6so2537038oip.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 04:18:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=xZGrPys9xvpeG1xeK6/PHG/QfTwmj1Ea33WEsaDLDXw=;
	b=wCrm028TIpqvC1tp/YtSOpNfzYMzUhMyEXotBklFyo87gMx/VEhSsJEFu1vdZA6tKz
	8+3pXk/XKtieIyjV4RKbBgHQVQvjkopzEgqJDqKgn9Ie+IXVyjyfYo2yz3PnNVBwe8f/
	xjKVsCZ5yylY1PlivQis3gZAoDthhj9Csl1xp16NxGfa0JH9vAN030qs+snvEE4KHXvo
	XZ723hJ9rWyXF0RaYCcYbbGKpWrLVxH1hmv9eJYdEK7NssDL9w7Y+3TE8ilaZbQJrrJY
	mvapqnHqqDO2xv7bZvtYz9XbRc0SWe2y5tKcdgSMsuV4TANgxKIX24NA+VBwoy0wJKxQ
	ilPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=xZGrPys9xvpeG1xeK6/PHG/QfTwmj1Ea33WEsaDLDXw=;
	b=CB9A7L28cMVqGIYNOd3dHmqp+pFTx0326g+/JjquXeMv3fTi5C3+TxFMuzCV2yFmR8
	HnVs/Zq3mmh+T2dXZDZPGLKx3jHxs5wxEgcSu1IvOvlLuriE2fel7rYwMaq5pP63hplc
	KhdiNuTJpD58Xv0zf1JnZLeu4iPtEKtTtHVBOj0ypDFd9B0ns0qq4DgqhaElGTn2GUok
	qTklESwgy/4XkGfVH1Sa48kRo52mG4D28B66mE5hgCVGp9XZFx0itfd0aP1na+y1f+m5
	O7dPeVqMk9ci8NF5p3xz2uQVXhwzZ1cy28ketncuI1T/O+5S8DaZnawKTFg+rvOhQ4aJ
	6+Eg==
X-Gm-Message-State: APzg51B9Y87mKAQEbkXnxV8khn4W74IVBFChej2Ge6MkC75bSVnGGOdb
	QX9clEzCUY91iRAEcpCjF/Y+ASrshnU=
X-Google-Smtp-Source: ANB0VdYapKdt5lFqX1iVIQWXyzubWTxifXNxFtmtpYkNvupSDQlz9BrMOCQJp3X2mfpjk4C+5U+69g==
X-Received: by 2002:aca:5397:: with SMTP id
	h145-v6mr3595731oib.188.1534936735045; 
	Wed, 22 Aug 2018 04:18:55 -0700 (PDT)
Received: from dell-laptop.mvista.com ([157.49.107.222])
	by smtp.gmail.com with ESMTPSA id
	c9-v6sm862308oia.1.2018.08.22.04.18.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 22 Aug 2018 04:18:54 -0700 (PDT)
From: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Aug 2018 16:47:53 +0530
Message-Id: <1534936692-11736-15-git-send-email-jkrishnanjanappa@mvista.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1534936692-11736-1-git-send-email-jkrishnanjanappa@mvista.com>
References: <1534936692-11736-1-git-send-email-jkrishnanjanappa@mvista.com>
Subject: [ROCKO][PATCH 15/34] curl: CVE-2018-0500
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
X-List-Received-Date: Wed, 22 Aug 2018 11:18:54 -0000

smtp: use the upload buffer size for scratch buffer malloc

... not the read buffer size, as that can be set smaller and thus cause
a buffer overflow! CVE-2018-0500

Reported-by: Peter Wu
Bug: https://curl.haxx.se/docs/adv_2018-70a2.html

Affects curl >= 7.54.1 && curl <= 7.60.0

Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
---
 meta/recipes-support/curl/curl/CVE-2018-0500.patch | 39 ++++++++++++++++++++++
 meta/recipes-support/curl/curl_7.58.0.bb           |  1 +
 2 files changed, 40 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2018-0500.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2018-0500.patch b/meta/recipes-support/curl/curl/CVE-2018-0500.patch
new file mode 100644
index 0000000..4395a3c
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2018-0500.patch
@@ -0,0 +1,39 @@
+From ba1dbd78e5f1ed67c1b8d37ac89d90e5e330b628 Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Wed, 13 Jun 2018 12:24:40 +0200
+Subject: [PATCH] smtp: use the upload buffer size for scratch buffer malloc
+
+... not the read buffer size, as that can be set smaller and thus cause
+a buffer overflow! CVE-2018-0500
+
+Reported-by: Peter Wu
+Bug: https://curl.haxx.se/docs/adv_2018-70a2.html
+
+CVE: CVE-2018-0500
+Upstream-Status: Backport [https://github.com/curl/curl/commit/ba1dbd78e5f1e.patch]
+
+Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
+---
+ lib/smtp.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/lib/smtp.c b/lib/smtp.c
+index e6872badb8..ecf10a41ac 100644
+--- a/lib/smtp.c
++++ b/lib/smtp.c
+@@ -1563,13 +1563,14 @@ CURLcode Curl_smtp_escape_eob(struct connectdata *conn, const ssize_t nread)
+   if(!scratch || data->set.crlf) {
+     oldscratch = scratch;
+ 
+-    scratch = newscratch = malloc(2 * data->set.buffer_size);
++    scratch = newscratch = malloc(2 * UPLOAD_BUFSIZE);
+     if(!newscratch) {
+       failf(data, "Failed to alloc scratch buffer!");
+ 
+       return CURLE_OUT_OF_MEMORY;
+     }
+   }
++  DEBUGASSERT(UPLOAD_BUFSIZE >= nread);
+ 
+   /* Have we already sent part of the EOB? */
+   eob_sent = smtp->eob;
diff --git a/meta/recipes-support/curl/curl_7.58.0.bb b/meta/recipes-support/curl/curl_7.58.0.bb
index 4376bb3..7dc5381 100644
--- a/meta/recipes-support/curl/curl_7.58.0.bb
+++ b/meta/recipes-support/curl/curl_7.58.0.bb
@@ -9,6 +9,7 @@ SRC_URI = "http://curl.haxx.se/download/curl-${PV}.tar.bz2 \
            file://0001-replace-krb5-config-with-pkg-config.patch \
            file://CVE-2018-1000300.patch \
            file://CVE-2018-1000301.patch \
+           file://CVE-2018-0500.patch \
 "
 
 
-- 
2.7.4


