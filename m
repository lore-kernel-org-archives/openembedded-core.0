Return-Path: <jkrishnanjanappa@mvista.com>
Received: from mail-oi0-f43.google.com (mail-oi0-f43.google.com
	[209.85.218.43])
	by mail.openembedded.org (Postfix) with ESMTP id A0C7C79458
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 15:09:33 +0000 (UTC)
Received: by mail-oi0-f43.google.com with SMTP id q204-v6so3690963oig.9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 08:09:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=xZGrPys9xvpeG1xeK6/PHG/QfTwmj1Ea33WEsaDLDXw=;
	b=LFU19yZ6fcN/lsurMZ0M1iKE3DUSNYbEbkqQ2cHF8iPIdUtxQCEwLK3qs/Z8IBhQJb
	TOEOmG2K2+NhHmM0U5AZtzO3IR7c+0rIzNxXmaD7Dker3E4rGtYs1HZRL7y58Jg1E/mI
	jaOmLCvlB54hAWDyOCFfO1bR7fNWHv9eJpjoaDUsL/1NzqVzAZRm7mL7GsmczUbGwRpg
	8V4oDNGsrKHnylVKs4M5/zuI9thg9SEcX2JFR/pYRjBjMwhkZNG6UoAPI9VEwdlF/DlJ
	CVLner7KP1YopO7mHO5yWX6rd2U8cn5kfAYnYCsjkggl6gsnuSjJGndtemiagpOYzmcj
	trwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=xZGrPys9xvpeG1xeK6/PHG/QfTwmj1Ea33WEsaDLDXw=;
	b=QibqLZGL2z8+l6Ky0FNIh6n+3akHTvlYmD+e6wxcbPbBlkmCOm4DnJBLHz/2SxULaV
	vn/QdprRWqbCwhOKNH9IucRB4iCHkEYVK1liDTWkXGVioAlyU623kA6F9N7y/SP9W1Vo
	9ugDDmKK610XmU99UtFV4BGJQpInES7Fy1Fvy3MX+CJ/9sGtNyrPZIIQpXkOA6PFkBzq
	7dpGEHoKsTYKWMHSx4Gf7doxhQ/lOlp1wFmnwQE2o/c+7tC7SSdATPRy4uLCaw4Jb6sM
	kfelz/Wmjllyi4GDxsWtroMxnNHZzYJrE8+kcpiw4E5thzfAboJ5lU4fVIN0ifuBxFth
	g1nA==
X-Gm-Message-State: APzg51DYO97hctzlJhbc06Ina+xnDEQp/MYNq9evGFy5Sxr4Z6ugv58C
	3EPfKaZDz6sAVQsEZUjqVxmLv/JzFFg=
X-Google-Smtp-Source: ANB0VdafS49EGYnuh2lu9cMzCGDh++nND5EQ7TKXssX7KKvdgVNlepDIUknfWRPlCYvqK8MzVIOK8g==
X-Received: by 2002:aca:adc6:: with SMTP id
	w189-v6mr4537535oie.174.1534950574161; 
	Wed, 22 Aug 2018 08:09:34 -0700 (PDT)
Received: from dell-laptop.mvista.com ([157.49.107.222])
	by smtp.gmail.com with ESMTPSA id
	i132-v6sm1024281oif.20.2018.08.22.08.09.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 22 Aug 2018 08:09:33 -0700 (PDT)
From: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Aug 2018 20:38:33 +0530
Message-Id: <1534950532-23850-15-git-send-email-jkrishnanjanappa@mvista.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1534950532-23850-1-git-send-email-jkrishnanjanappa@mvista.com>
References: <1534950532-23850-1-git-send-email-jkrishnanjanappa@mvista.com>
Subject: [ROCKO][PATCH V3 15/34] curl: CVE-2018-0500
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
X-List-Received-Date: Wed, 22 Aug 2018 15:09:33 -0000

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


