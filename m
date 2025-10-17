Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B22F8CCD195
	for <webhook@archiver.kernel.org>; Fri, 17 Oct 2025 20:39:43 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web10.3208.1760733574410337302
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Oct 2025 13:39:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=W/wFj/A7;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.174, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-78af743c232so2088208b3a.1
        for <openembedded-core@lists.openembedded.org>; Fri, 17 Oct 2025 13:39:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1760733574; x=1761338374; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nRPdh5jZISVP+aUEjIk9+g4/1gbiRHqNwxYNXPBfSGE=;
        b=W/wFj/A7Jn2boVQbMJJWlF2hKg4JDIs+7lSy0v01l8k0x0JalXgLy8igWc5E8bSx4L
         7X0LZcpHRFrFYY9Hs9JGvT/OkiZAYzxymB9zf673rGqJND5d+gwzugietk4YM3m35gJu
         loOXNfaZMoFyvKOwKCDC+i7jF8PEukZTaWqpkDuTQotqnReL5wUTJPqGb/Dj5Yuu3ylA
         CnitQ87H0ROkBJvqc0BtO4gM5xhMkC2SHHZAbsmmnHoGB1oR4R+962jmdq4afzpcVTl6
         J6i6LmHvo3jo8hnyJlJCMuDPVD85rSFggRDDSO7uyAi9y1cV9bGskvhGsfxCDLoHt00E
         BdBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760733574; x=1761338374;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nRPdh5jZISVP+aUEjIk9+g4/1gbiRHqNwxYNXPBfSGE=;
        b=MeWhpoQcvKZgNV53RDXGX9vNe/aNLlG30Bo70z4bZCiJ1e8lkgzoYgPkl7tpBRAzk/
         u4kD6XPraj+dkkemNkD+3vdEaEKFCgDmfn2ocNxqmOPNDuUeHXgaAP4wNXgnaVqXNt1e
         17PGqTVdPm3evloAijUudx9f7RMR9B7GCPBMRc+IJE+H4fDputXE94J6EZq4YUh2Eibd
         QCSCTwQAzOkIzzua0gQ2OvSaBRrPmC90Ck1ZAq8H6ZJCe4N1a1Rb1HBtZOfaxa49PEmP
         yINY+CF09W+IozRtpgNOot5OPiaqEAAYDhjJwOP4MEu2wC6nfRRgu9tHFCYUInSiW25n
         paiQ==
X-Gm-Message-State: AOJu0Yzdw9YIFynFAj0n8SMRpFaIuRmekNlBa9eLfq2GRpUiEaFXhVlW
	vtPXRQc9T7Jrnpe5VgTRrZmf+d9s8jw96jXLgVoC4T0Z2WC46d0dGSIWILNgUS071VQsyKjYBGH
	Bia6M2L4=
X-Gm-Gg: ASbGncsNHLbqYI4TE/ZWlnZHZ4iCkRZFdgKl7X6ptJcuAamy8aYQ3xpPxRFkcNR1rTB
	bv3Buztf3NTiGqi6zWx1gG2TsCfz+Nlsn8Wwjw8gKXIVvNAk5B2oC1BScmuEcitgag4Gf3uL+op
	Lsh2cnzVKIsn0ZnZUAUTIEH7YsLQeFthFX9gbrlzuflVmahFOdyyyIEhx0NUfzf1cGU2KSOMR4e
	03+/zmN6IhBlOMqTYku3F5OnuI8vTKXhXHI6H1Sl6njr3W+G1WuOryBHyLA74Pi4uxNU794NEyd
	5+b5I6h233NNRFqzs0mHwBl/+cHHgeguf1Vu3C3XleKZUj05J1KrP7MWELJw+zA7hvI6iFiufpn
	bYZpmVndJ5ypK3jUDZClZAcIZ4KFixvEb929xu/T4GLo3mkL6/PxXeJL4jfc70JZY3g==
X-Google-Smtp-Source: AGHT+IEjqpI1+hZggmbC7cc5muH9H294YcRWAXFSQ/YKsBzycLuKFU5HsoJ4HvAioO6ac8G2Nnq0tg==
X-Received: by 2002:a05:6a00:2182:b0:781:17fb:d3ca with SMTP id d2e1a72fcca58-7a220ab5260mr7370278b3a.15.1760733573671;
        Fri, 17 Oct 2025 13:39:33 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:aaee:e640:34cd:6f2])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a2300f254esm477061b3a.45.2025.10.17.13.39.33
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 13:39:33 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 07/26] openssh: fix CVE-2025-61985
Date: Fri, 17 Oct 2025 13:38:50 -0700
Message-ID: <52d925423b826383d12a97b834475ab5699fd492.1760733431.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1760733431.git.steve@sakoman.com>
References: <cover.1760733431.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Oct 2025 20:39:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225041

From: David Nyström <david.nystrom@est.tech>

ssh in OpenSSH before 10.1 allows the '\0' character in an ssh:// URI,
potentially leading to code execution when a ProxyCommand is used.

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2025-61985

Upstream patch:
https://github.com/openssh/openssh-portable/commit/43b3bff47bb029f2299bacb6a36057981b39fdb0

Signed-off-by: David Nyström <david.nystrom@est.tech>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../openssh/openssh/CVE-2025-61985.patch      | 47 +++++++++++++++++++
 .../openssh/openssh_9.6p1.bb                  |  1 +
 2 files changed, 48 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2025-61985.patch

diff --git a/meta/recipes-connectivity/openssh/openssh/CVE-2025-61985.patch b/meta/recipes-connectivity/openssh/openssh/CVE-2025-61985.patch
new file mode 100644
index 0000000000..9f4de0ed56
--- /dev/null
+++ b/meta/recipes-connectivity/openssh/openssh/CVE-2025-61985.patch
@@ -0,0 +1,47 @@
+From 54928cb9eaa7143ff17f463efa7ed3109afdbf30 Mon Sep 17 00:00:00 2001
+From: "djm@openbsd.org" <djm@openbsd.org>
+Date: Thu, 4 Sep 2025 00:30:06 +0000
+Subject: [PATCH] upstream: don't allow \0 characters in url-encoded strings.
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Suggested by David Leadbeater, ok deraadt@
+
+OpenBSD-Commit-ID: c92196cef0f970ceabc1e8007a80b01e9b7cd49c
+
+Upstream-Status: Backport [Upstream commit https://github.com/openssh/openssh-portable/commit/43b3bff47bb029f2299bacb6a36057981b39fdb0]
+CVE: CVE-2025-61985
+Signed-off-by: David Nyström <david.nystrom@est.tech>
+---
+ misc.c | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/misc.c b/misc.c
+index 3db2e4d0b..cac246b63 100644
+--- a/misc.c
++++ b/misc.c
+@@ -955,7 +955,7 @@ urldecode(const char *src)
+ 	size_t srclen;
+ 
+ 	if ((srclen = strlen(src)) >= SIZE_MAX)
+-		fatal_f("input too large");
++		return NULL;
+ 	ret = xmalloc(srclen + 1);
+ 	for (dst = ret; *src != '\0'; src++) {
+ 		switch (*src) {
+@@ -963,9 +963,10 @@ urldecode(const char *src)
+ 			*dst++ = ' ';
+ 			break;
+ 		case '%':
++			/* note: don't allow \0 characters */
+ 			if (!isxdigit((unsigned char)src[1]) ||
+ 			    !isxdigit((unsigned char)src[2]) ||
+-			    (ch = hexchar(src + 1)) == -1) {
++			    (ch = hexchar(src + 1)) == -1 || ch == 0) {
+ 				free(ret);
+ 				return NULL;
+ 			}
+-- 
+2.44.1
+
diff --git a/meta/recipes-connectivity/openssh/openssh_9.6p1.bb b/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
index afcd50c7e6..bdb8a1599b 100644
--- a/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
@@ -32,6 +32,7 @@ SRC_URI = "http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar
            file://CVE-2025-26466.patch \
            file://CVE-2025-26465.patch \
            file://CVE-2025-32728.patch \
+           file://CVE-2025-61985.patch \
            "
 SRC_URI[sha256sum] = "910211c07255a8c5ad654391b40ee59800710dd8119dd5362de09385aa7a777c"
 
-- 
2.43.0


