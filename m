Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C2C9C54E71
	for <webhook@archiver.kernel.org>; Tue, 20 May 2025 19:48:34 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web10.413.1747770504653323302
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 May 2025 12:48:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=WKeJ+oLr;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.43, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-30e8daea8c6so3645587a91.0
        for <openembedded-core@lists.openembedded.org>; Tue, 20 May 2025 12:48:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1747770504; x=1748375304; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XWfpQnwYb35ApN8aw4nDODAXZT192qdafzYTEi7PC0k=;
        b=WKeJ+oLrvhy0b28wrp+E6wBlS8pB7wUf+fusNTReUsp/pVxzkG0pX7K6fBFbhz2cvv
         +sHmjCtOGOJ7HrR4W6NMa3hZWV5bKHwSTSlAYceDgVBtxpXuthYyosgCWYMgxu+hpnqW
         4q0PFdNbxYMR8y8it2sVeKcMBi2rSu6klBGZhajzIWTqzxLEAAfrcMtCepf9SDX7tEi3
         VkAqvc9kALrtHs1+UVxiz4WhmG2ABVK1z8FZYbs0Vn7ZIB9oHgULg/LdGIZQfg2QJUWL
         HWNGVl9wOW5JyuaFv5livJwqQ7k3GZT8+R7IPqXsvCJDhTFpS2cTOzch8z2EyxOn3drg
         2P/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747770504; x=1748375304;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XWfpQnwYb35ApN8aw4nDODAXZT192qdafzYTEi7PC0k=;
        b=nQC9cftVa2XLZwigPnjytUwhVi4vKup4LwOjqf95Npy/v0IaHWuietgPJ0yC/548Z1
         b7qtSrsjYITBdEnYbBRWdakEMm1nQSKd5wZQkJ+bFnnTvXnco6sHcaNMmSGSwQgozbg6
         PlPuUgJcQsb9iE3ckKKhhpaR+aMpyxsoOk0wEJSa38IR9FrP6YNzJzHfd6cVa+Te08Cc
         mKg4R0Usb7bOlBPnOWU+88Cck42B8UoJCWHHHhaksuRP/mZvcSmW/ElCoQ0jJRDzSVJV
         Ey8Zn6nWAXC4GZfWjnppN1QT+uqlrUXR/jPFNlubl6fd9ZN9Db7OEjjq4UFgqT/u3lb5
         z2VQ==
X-Gm-Message-State: AOJu0YxIHTcYADo7fRHROHQ+NGqFKHsR2xShfZnCG0NuYZLiI0jlMdAG
	/x3VOEFH+NKkwZ/uR/dKUrUTIt7ukpnqmxYq9OwIqIsiJBKykM0dVDbuedKEBWfOpCtztXzpuYF
	qk8yi
X-Gm-Gg: ASbGnctroSXRdqEfTbi7T0OPt1MlTJHT0qdPTR1rmwnanjRuW5VQ4i2tjw4Wd7sW44m
	kMmhKxuFSpCINM/zuYdNSJpUeYfQN2s8qb056CZrySWr6oB6SUJqh2HS6R7atcI8kQ3mbn6B47c
	0ZjKOLCr6VJS68pyJVmqq2ko6vK0jPLRi/9PH2P3wQ4ovKGXjhO0Uu5b2IUwotw8IzuWq7ctynF
	O2xoXFv29iWuvezPak9OpCaQXOpqsQigd30QCqCWxcEPAsDmY7o4zBoU5GlPoE8oi8rC+3WzEPa
	Ulug5EecpIQa6IiDF2njK9ngVcmCxAk6gvjQc4GWYSvyl4NY1ZWC
X-Google-Smtp-Source: AGHT+IHQc4BbGtuHnLDAe5QiyVRLtsAHUwhkU3rHbJMBQN7WGG774CnTcwLZBmiX3zsRbTJFOuMTVA==
X-Received: by 2002:a17:90b:3e8e:b0:2fe:d766:ad8e with SMTP id 98e67ed59e1d1-30e7d507e75mr26628324a91.4.1747770503878;
        Tue, 20 May 2025 12:48:23 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:48df:296e:5350:93e])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30f36386944sm2120772a91.14.2025.05.20.12.48.22
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 12:48:23 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 1/8] connman :fix CVE-2025-32366
Date: Tue, 20 May 2025 12:48:08 -0700
Message-ID: <1c908b1c44a006b6707a1f0da59781a6750cf8ce.1747770224.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1747770224.git.steve@sakoman.com>
References: <cover.1747770224.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 May 2025 19:48:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216934

From: Praveen Kumar <praveen.kumar@windriver.com>

In ConnMan through 1.44, parse_rr in dnsproxy.c has a memcpy length
that depends on an RR RDLENGTH value, i.e., *rdlen=ntohs(rr->rdlen)
and memcpy(response+offset,*end,*rdlen) without a check for whether
the sum of *end and *rdlen exceeds max. Consequently, *rdlen may be
larger than the amount of remaining packet data in the current state
of parsing. Values of stack memory locations may be sent over the
network in a response.

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2025-32366

Upstream-patch:
https://git.kernel.org/pub/scm/network/connman/connman.git/commit/?id=8d3be0285f1d4667bfe85dba555c663eb3d704b4

Signed-off-by: Praveen Kumar <praveen.kumar@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../connman/connman/CVE-2025-32366.patch      | 41 +++++++++++++++++++
 .../connman/connman_1.43.bb                   |  1 +
 2 files changed, 42 insertions(+)
 create mode 100644 meta/recipes-connectivity/connman/connman/CVE-2025-32366.patch

diff --git a/meta/recipes-connectivity/connman/connman/CVE-2025-32366.patch b/meta/recipes-connectivity/connman/connman/CVE-2025-32366.patch
new file mode 100644
index 0000000000..62f07e707a
--- /dev/null
+++ b/meta/recipes-connectivity/connman/connman/CVE-2025-32366.patch
@@ -0,0 +1,41 @@
+From 8d3be0285f1d4667bfe85dba555c663eb3d704b4 Mon Sep 17 00:00:00 2001
+From: Yoonje Shin <ioerts@kookmin.ac.kr>
+Date: Mon, 12 May 2025 10:48:18 +0200
+Subject: [PATCH] dnsproxy: Address CVE-2025-32366 vulnerability
+
+In Connman parse_rr in dnsproxy.c has a memcpy length
+that depends on an RR RDLENGTH value (i.e., *rdlen=ntohs(rr->rdlen)
+and memcpy(response+offset,*end,*rdlen)). Here, rdlen may be larger
+than the amount of remaining packet data in the current state of
+parsing. As a result, values of stack memory locations may be sent
+over the network in a response.
+
+This patch adds a check to ensure that (*end + *rdlen) does not exceed
+the valid range. If the condition is violated, the function returns
+-EINVAL.
+
+CVE: CVE-2025-32366
+
+Upstream-Status: Backport [https://git.kernel.org/pub/scm/network/connman/connman.git/commit/?id=8d3be0285f1d4667bfe85dba555c663eb3d704b4]
+
+Signed-off-by: Praveen Kumar <praveen.kumar@windriver.com>
+---
+ src/dnsproxy.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/src/dnsproxy.c b/src/dnsproxy.c
+index 7ee26d9..1dd2f7f 100644
+--- a/src/dnsproxy.c
++++ b/src/dnsproxy.c
+@@ -998,6 +998,9 @@ static int parse_rr(const unsigned char *buf, const unsigned char *start,
+	if ((offset + *rdlen) > *response_size)
+		return -ENOBUFS;
+
++	if ((*end + *rdlen) > max)
++		return -EINVAL;
++
+	memcpy(response + offset, *end, *rdlen);
+
+	*end += *rdlen;
+--
+2.40.0
diff --git a/meta/recipes-connectivity/connman/connman_1.43.bb b/meta/recipes-connectivity/connman/connman_1.43.bb
index 02abda568f..936e880c06 100644
--- a/meta/recipes-connectivity/connman/connman_1.43.bb
+++ b/meta/recipes-connectivity/connman/connman_1.43.bb
@@ -7,6 +7,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/network/${BPN}/${BP}.tar.xz \
            file://no-version-scripts.patch \
            file://0002-resolve-musl-does-not-implement-res_ninit.patch \
            file://CVE-2025-32743.patch \
+           file://CVE-2025-32366.patch \
            "
 
 
-- 
2.43.0


