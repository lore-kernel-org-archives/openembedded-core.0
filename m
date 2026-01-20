Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2EF8D2ED17
	for <webhook@archiver.kernel.org>; Tue, 20 Jan 2026 12:09:24 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5024.1768910960525535898
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Jan 2026 04:09:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=TrQ3nf7Y;
 spf=pass (domain: smile.fr, ip: 209.85.221.53, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-430fbb6012bso4488634f8f.1
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 04:09:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1768910958; x=1769515758; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t6ib1HyLTnzDH59OrmzQ+JBc9Kwzr5LuB62JjkW/KEo=;
        b=TrQ3nf7Y0bFbiUNy19foheSkI8QhgCZl5xAdVCClz76d3TvrqErNWt708v9+oSkLJD
         5rPE4capL5DsIxaUrfPZFOTSj1reBZVNvb6uY0042PlGiDiCjoMt3hUkPAL48yCxd0fK
         UKCfJpCYJROOg3AzIJnp9WC+ABqhHtC1L1rLc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768910958; x=1769515758;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=t6ib1HyLTnzDH59OrmzQ+JBc9Kwzr5LuB62JjkW/KEo=;
        b=rbhozZ8clDHbnHgFcIYMReRviVJw1h6suW0dDIS7xNL2qdFrRgpa42XYJnqQO83s+T
         HdSrh8YF8C9Ng7SIZEqTO3OLVwKHgZuE/2KAOTJfVymII3hqGBnKScCIcAwpBj69K0ND
         mYOJi/6XARqx9dpj4cUxoywRYscVgxrTfTxS6vswSzCMFHqADtgPeUmbQgNyNGI3DQo7
         +oyIM79kfIm471gLilhc1SM2XshYE1jDCjdiA3L6eynlY6jTqoh41t/T4twBf9UtNdYV
         mlCpLsZg9PCY8ln1ROVAtenM+f9UeEOqvl/5dWqqrbUoS5P41L/bZUbnG3SNMGb1+Y9M
         mNhA==
X-Gm-Message-State: AOJu0YxOUv7Skizft954+5gmA0U2uYx5mnT6kyhPj7REsd9UxWfP0i0W
	gYiw9WvEcz2sy+sJIE6hXcWs0WZPeaRZJMnaDAPnLxTnOrqRe31qjP+7ilxmaivzPz73xRjuokA
	WWvC7
X-Gm-Gg: AZuq6aJdeNR4dqjNAFZ5zp1L/18KfZH2zU9pI4Va/viaDcnUPxv1iBDKmR/tN+HYa2G
	jKJjqmxL5cs9tnNTmkwTEHuYapSQz18U6JlbzQQ267gw7Vmdxe3jXvOVN4dlYsBgosaHlyqTDyh
	ADtP+pygVJn4G+BnYpvJZSEDhM+1cnwOZ7FSgUzK7Rf6uvL+43co5fvyCBxsAQgrPSGqn83Kz+1
	ky8LuHBZrB5S1VYtyLR5TIz1ZimM3jCRV+huF8ePupR59JCGAXAWlpqoVg5lQzE6ExCGZzxo8kV
	vHi/1MzQylndjsabrCix78Cl79wssG3pZGzVJZr34eChJmkWeKXWrQ4DdFeBrS/WJ0obdW/34wm
	MV2B8MmWhCaWhaIXV01HsWTuVlX/B8o7u+QYC5nYTPbpwQLZGMiOCGX5xt9RXpZXWXjdIVb2QLB
	2hdo1AvUIO4CtSWBg6mCqV1zoMIrEa3KhXi5eQe30J03N5bUXaaVgWzHs6Vaih41f2j7hwW16oW
	HRPZSY8y8s9MWuCJozzMtO68F8+uGgn
X-Received: by 2002:a05:6000:2386:b0:42f:bab5:953b with SMTP id ffacd0b85a97d-4358fed7979mr2502295f8f.16.1768910958502;
        Tue, 20 Jan 2026 04:09:18 -0800 (PST)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43569927007sm28916097f8f.16.2026.01.20.04.09.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 04:09:18 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 10/22] libpcap: patch CVE-2025-11964
Date: Tue, 20 Jan 2026 13:08:24 +0100
Message-ID: <58f0bb5bef7092585c53dda9fc8bfa2955a27c1a.1768910519.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1768910519.git.yoann.congal@smile.fr>
References: <cover.1768910519.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 12:09:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229688

From: Peter Marko <peter.marko@siemens.com>

Pick patch per [1].

[1] https://nvd.nist.gov/vuln/detail/CVE-2025-11964

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libpcap/libpcap/CVE-2025-11964.patch      | 33 +++++++++++++++++++
 .../libpcap/libpcap_1.10.4.bb                 |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta/recipes-connectivity/libpcap/libpcap/CVE-2025-11964.patch

diff --git a/meta/recipes-connectivity/libpcap/libpcap/CVE-2025-11964.patch b/meta/recipes-connectivity/libpcap/libpcap/CVE-2025-11964.patch
new file mode 100644
index 0000000000..003d21fb1f
--- /dev/null
+++ b/meta/recipes-connectivity/libpcap/libpcap/CVE-2025-11964.patch
@@ -0,0 +1,33 @@
+From 7fabf607f2319a36a0bd78444247180acb838e69 Mon Sep 17 00:00:00 2001
+From: Guy Harris <gharris@sonic.net>
+Date: Sun, 7 Sep 2025 12:51:56 -0700
+Subject: [PATCH] Fix a copy-and-pasteo in utf_16le_to_utf_8_truncated().
+
+For the four octets of UTF-8 case, it was decrementing the remaining
+buffer length by 3, not 4.
+
+Thanks to a team of developers from the Univesity of Waterloo for
+reporting this.
+
+(cherry picked from commit aebfca1aea2fc8c177760a26e8f4de27b51d1b3b)
+
+CVE: CVE-2025-11964
+Upstream-Status: Backport [https://github.com/the-tcpdump-group/libpcap/commit/7fabf607f2319a36a0bd78444247180acb838e69]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ fmtutils.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/fmtutils.c b/fmtutils.c
+index a5a4fe62..78a0f8b7 100644
+--- a/fmtutils.c
++++ b/fmtutils.c
+@@ -235,7 +235,7 @@ utf_16le_to_utf_8_truncated(const wchar_t *utf_16, char *utf_8,
+ 			*utf_8++ = ((uc >> 12) & 0x3F) | 0x80;
+ 			*utf_8++ = ((uc >> 6) & 0x3F) | 0x80;
+ 			*utf_8++ = ((uc >> 0) & 0x3F) | 0x80;
+-			utf_8_len -= 3;
++			utf_8_len -= 4;
+ 		}
+ 	}
+ 
diff --git a/meta/recipes-connectivity/libpcap/libpcap_1.10.4.bb b/meta/recipes-connectivity/libpcap/libpcap_1.10.4.bb
index df091e5ca2..ee7d7540f6 100644
--- a/meta/recipes-connectivity/libpcap/libpcap_1.10.4.bb
+++ b/meta/recipes-connectivity/libpcap/libpcap_1.10.4.bb
@@ -16,6 +16,7 @@ SRC_URI = "https://www.tcpdump.org/release/${BP}.tar.gz \
            file://CVE-2024-8006.patch \
            file://CVE-2025-11961-01.patch \
            file://CVE-2025-11961-02.patch \
+           file://CVE-2025-11964.patch \
           "
 
 SRC_URI[sha256sum] = "ed19a0383fad72e3ad435fd239d7cd80d64916b87269550159d20e47160ebe5f"

