Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A38AC54F40
	for <webhook@archiver.kernel.org>; Sun, 26 Jul 2026 08:30:21 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7376.1785054614590844262
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Jul 2026 01:30:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=QMusxMdi;
 spf=pass (domain: smile.fr, ip: 209.85.128.49, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-493f75f7172so15434935e9.1
        for <openembedded-core@lists.openembedded.org>; Sun, 26 Jul 2026 01:30:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1785054613; x=1785659413; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=07/2U+sr4eb5Xq4uWNibPdyoTbkoMkj7GXBE5GjIiuo=;
        b=QMusxMdi4DRHW/OtWkW4WdXidhU+m9RedHzxE7vnykltyIqreeqsPN3a0i6dNh5Xw9
         pQMgwJ0KcfELeFmXiKXa41gspHEf6F/n+s5+VNPfzG2cd7Qubr02IzFKeAgOqodFHzuC
         UYnCzei3H3Q4xwOCv5xQt/rFxx7M7KIbY6dMQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785054613; x=1785659413;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=07/2U+sr4eb5Xq4uWNibPdyoTbkoMkj7GXBE5GjIiuo=;
        b=XCG/BLeXuFOQU+rLfcJSEVZvLkYaKdadAqIzq7XCVmKkv4qIsJYfRrtKbc2jvM7JVP
         gJcJGFKnsB5wgiBlBRCJN3eS2jbMpUYfFcDtOZKSYYfTEMYPBf8mZro8HTZES99cH0GA
         nfnWAM3bB7zA/zBRPkemfaSRtKlc4pzkfOhApefzwmQjQK9V8wZ2LaYxHI+hHa6JD6kb
         i1YR1/97pa4216huWDX7Mrz+dzsHCE9eUIuYMjk7ib9fALawgu6J+rBdnF1mPmEDSOvv
         lyQfXwQ1ZHHa3kFqphKGFpkkvLG9XPSou7jP25Ickj+dF/IINCh9dCPl/s+Wd1C0uj+y
         VZyA==
X-Gm-Message-State: AOJu0YxwPzQ+K4x33GuJUU9S/u5dvHBXFwGtc48di43cJ0NTl7JhKh1c
	0ldi1KNoE1meyh/oP/Drh5P40oFDCNJcnWRAnq8+004cLL1Prs3p0Eu2g1qnJRoZj130a/TRabC
	X5oSCnTc=
X-Gm-Gg: AR+sD10u2n2dv6B32sZmDww+VovHfoaygfWjLzkVlsie4r55ctikud7E6boJcVF7uKZ
	8Uvi7O3kuSfXhPd5284DD5jRU9bid7xPT8gkBr+KQCX/JYbvvMwinjG4gP3FcsKSsRJPC8F5vZi
	PxFn6DT0exObL8+gJeVahvax5mKlsJbOXb0NOlA68DutV4VNVleSw8lA1XmgaqNXrLSMeu/N7nl
	OqbjIFnXy9OGkJ7MWti+LS0/0sDVB/EYrRyVmqB07PZnj0DSJ2YOnUVR4h8wdhce846I1s+KEu/
	1IHkL//gCO07x8Adovumo516vgAftpRwP2fDGsmJG3lilNPVdQpHYV/Vc67qBVAKq39bu7l1tiy
	/BLISdE9QRCQtGTCkZrJXd8A6sH2iI5cg31kzOL1WzXNJNPg6ksToQDCgMwPDrymE5MCN0yYM/Q
	CdF1iij9SyelN6XnabbXjy760lHWvKef9qU16pjP5gsLyB17g7dC/Q7c8U/aFLpKHavcDEQea1j
	ekmrQ==
X-Received: by 2002:a05:600c:a4f:b0:493:d741:5d72 with SMTP id 5b1f17b1804b1-496b57116e2mr67632775e9.38.1785054612800;
        Sun, 26 Jul 2026 01:30:12 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496b4f24a93sm142482505e9.11.2026.07.26.01.30.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 01:30:12 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 06/31] openssh: Fix CVE-2026-59999
Date: Sun, 26 Jul 2026 10:29:30 +0200
Message-ID: <c185f00f350783e8c59b0257eb279f2f7bb0a5de.1785054430.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1785054429.git.yoann.congal@smile.fr>
References: <cover.1785054429.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 26 Jul 2026 08:30:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241988

From: Devansh Patel <devanshp@cisco.com>

This patch applies the upstream OpenSSH 10.4 backport for
CVE-2026-59999. The upstream fix commit is referenced in [1],
and the public CVE advisory is referenced in [2].

[1] https://github.com/openssh/openssh-portable/commit/8dfe7ed6e2fd988de08df508355a196b956b2753
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-59999

Signed-off-by: Devansh Patel <devanshp@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../openssh/openssh/CVE-2026-59999.patch      | 36 +++++++++++++++++++
 .../openssh/openssh_9.6p1.bb                  |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2026-59999.patch

diff --git a/meta/recipes-connectivity/openssh/openssh/CVE-2026-59999.patch b/meta/recipes-connectivity/openssh/openssh/CVE-2026-59999.patch
new file mode 100644
index 00000000000..89b7aa9c7f4
--- /dev/null
+++ b/meta/recipes-connectivity/openssh/openssh/CVE-2026-59999.patch
@@ -0,0 +1,36 @@
+From 1c719fa7d0fb0aa335f0e8d5db5d5e5d01c894e5 Mon Sep 17 00:00:00 2001
+From: "djm@openbsd.org" <djm@openbsd.org>
+Date: Sun, 31 May 2026 04:47:29 +0000
+Subject: [PATCH] upstream: DisableForwarding=yes didn't override
+ PermitTunnel=yes
+
+Reported independently by Huzaifa Sidhpurwala of Redhat and Marko
+Jevtic; ok markus@
+
+CVE: CVE-2026-59999
+Upstream-Status: Backport [https://github.com/openssh/openssh-portable/commit/8dfe7ed6e2fd988de08df508355a196b956b2753]
+
+Backport Changes:
+- Retained the Scarthgap serverloop.c OpenBSD revision identifier because
+  the 10.4 identifier does not describe the older source baseline.
+
+OpenBSD-Commit-ID: b5c13f0746cf079b21f8deba47407fad49ccbf4c
+(cherry picked from commit 8dfe7ed6e2fd988de08df508355a196b956b2753)
+Signed-off-by: Devansh Patel <devanshp@cisco.com>
+---
+ serverloop.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/serverloop.c b/serverloop.c
+index f3683c2e4..c1fe99d12 100644
+--- a/serverloop.c
++++ b/serverloop.c
+@@ -531,7 +531,7 @@ server_request_tun(struct ssh *ssh)
+ 		ssh_packet_send_debug(ssh, "Unsupported tunnel device mode.");
+ 		return NULL;
+ 	}
+-	if ((options.permit_tun & mode) == 0) {
++	if ((options.permit_tun & mode) == 0 || options.disable_forwarding) {
+ 		ssh_packet_send_debug(ssh, "Server has rejected tunnel device "
+ 		    "forwarding");
+ 		return NULL;
diff --git a/meta/recipes-connectivity/openssh/openssh_9.6p1.bb b/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
index 4ab3174924c..b6eda3607a9 100644
--- a/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
@@ -37,6 +37,7 @@ SRC_URI = "http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar
            file://CVE-2026-35385.patch \
            file://CVE-2026-35414-CVE-2026-35387.patch \
            file://CVE-2026-35388.patch \
+           file://CVE-2026-59999.patch \
            "
 SRC_URI[sha256sum] = "910211c07255a8c5ad654391b40ee59800710dd8119dd5362de09385aa7a777c"
 

