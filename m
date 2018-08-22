Return-Path: <jkrishnanjanappa@mvista.com>
Received: from mail-oi0-f49.google.com (mail-oi0-f49.google.com
	[209.85.218.49])
	by mail.openembedded.org (Postfix) with ESMTP id 56E5D793EB
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 13:36:37 +0000 (UTC)
Received: by mail-oi0-f49.google.com with SMTP id q11-v6so3108900oic.12
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 06:36:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=xZGrPys9xvpeG1xeK6/PHG/QfTwmj1Ea33WEsaDLDXw=;
	b=nAl+rG0XaSwxeo0hP2mpQ30WYwHtJRlh8GN/qKbFrH6Xq9h7BrxWRHeKyoHSn6S86K
	fU6fe1yOcO/Br2iRmfMN6gxeSJ6sfw29bSX0djeDacULNsKD8hqTLe6m8t4PN4BEsiNP
	643APa32F5/vBxRlHuR/5x00ZaT5DFWjYoHPIe+AkOjVmXLBUPl2ca2CTkx6CWRtnj0D
	8Ijl5wmkVolxs/DiMhwpf3s7gbBp5e5DuJgA99vXy4f85ZbeUXvYLxZdgxwjfYC/V6GO
	IFmcPD6W36/NBGd70mcNvGXzcpRYco6R6tdBCsSxHCM+OUD4CFE3qX4E2EGO01fYLAT7
	V0Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=xZGrPys9xvpeG1xeK6/PHG/QfTwmj1Ea33WEsaDLDXw=;
	b=OO1vnfa0MxgkzXWYvxCp2hD9nqfsQJJg12KHjf2vS8IXcoWpkxUMh/2k3rdmvmfOlm
	20b/m6EpZzf+FonwhHQI8we9tLYvj8YWWnD0FG3+FzBChzyvO3CrGWyH1RF14sLkvHgR
	qP75C0yadZapopPzdAfZgTOZ5Ae20fFu7aw+1MHRMV5ofLUjM8+eqxVncdQItcJ18U+n
	PiwkDs/vMBWlmvCHE8mvTEtoZy43+5ZiFI1VeZE5rUzhPrBj5hGEzns4bqLRNByGvHWg
	L/9jNWkUNnl+WgtC6BxeDejscqfapPx008cTeG6IOFuJN1Di+drCdwx2u5fsLLvUdC7M
	l8xQ==
X-Gm-Message-State: APzg51AL6hHG1Iqfk2tSBGNe3fSFuxX5NsXJeoCRH7RhQ2OqixwwyyXZ
	Imsky1hL+oX25scIoNZLlYByj7ufD3E=
X-Google-Smtp-Source: ANB0VdbsxqDONUYRYX9ID+O/oK902SGTIHWg6b1RjP+xMp+lx5RyBsH8c/WBxYvAhThLG5mqGpF2SQ==
X-Received: by 2002:aca:b885:: with SMTP id
	i127-v6mr4216723oif.180.1534944998256; 
	Wed, 22 Aug 2018 06:36:38 -0700 (PDT)
Received: from dell-laptop.mvista.com ([157.49.3.26])
	by smtp.gmail.com with ESMTPSA id
	h186-v6sm3746773oib.55.2018.08.22.06.36.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 22 Aug 2018 06:36:37 -0700 (PDT)
From: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Aug 2018 19:05:21 +0530
Message-Id: <1534944940-21566-15-git-send-email-jkrishnanjanappa@mvista.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1534944940-21566-1-git-send-email-jkrishnanjanappa@mvista.com>
References: <1534944940-21566-1-git-send-email-jkrishnanjanappa@mvista.com>
Subject: [ROCKO][PATCH V2 15/34] curl: CVE-2018-0500
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
X-List-Received-Date: Wed, 22 Aug 2018 13:36:37 -0000

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


