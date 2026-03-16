Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D6EFF46424
	for <webhook@archiver.kernel.org>; Mon, 16 Mar 2026 09:30:08 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.46891.1773653407993128991
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Mar 2026 02:30:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=ab9gQFvI;
 spf=pass (domain: smile.fr, ip: 209.85.221.46, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-439bcec8613so3225936f8f.3
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Mar 2026 02:30:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1773653406; x=1774258206; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DALSIL65ET3TAZzCzUr1bgykz9sdlTlDxpKZydIBsV0=;
        b=ab9gQFvILw6S6FC+WatrvLuykVH2xhVNBCsgsOjTN8rlerN1fu2xZJOs0WiRlPrCOS
         GwKQgQoDKJ5c0ojw7TqicYCtXYbJ7m8hbd5ZYnIvceLk9AvEc6ThWWzKIH9HmQOVkT5z
         Q8QgB5WznV/lg7x6tQ/oXN1fECKRpfdJWzsVw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773653406; x=1774258206;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DALSIL65ET3TAZzCzUr1bgykz9sdlTlDxpKZydIBsV0=;
        b=SK40r5AHM5KoSX6/YRmWKxcufO8jHTN2+aQ3Lm2sn1C6ilYiwEd1/29qH2/6iuM1dM
         W8dTQuViap7caEIS7ZPEhBpGS8ybuvqplfq5jDRDNCeK90iVPnWzZ0CJaTHCtbDkrhgZ
         lO2kOLEpj/WYh0Pg14TrSw+zIPJgjoOwJyvrWztG1iJeBvVKN4GcfaSlVwfxyRXIZN9f
         O2XIi65xeXoKx8wfR5mEj9FkZMr+NxPiC0zr/tut1SK9F42V5ZgY897nV1WMuYddl4W6
         VDrqz8sGpX2nAisbJxr9e9XNcrDYCN7ABjmrXEmhxJRfk8mZax156wlAvy7ocF1y+pS8
         SyCw==
X-Gm-Message-State: AOJu0YxZ+ATpsKo6jUJo84yzMwGHdwTp25gIR6fkKwYgIA2vOIdPINYR
	oVF5Y2mMZKrQxGNrLh4mQRW02pRzMoUbC5QOOrZ7kUpggBTMjm+CEhPB1xAsZLNjFupjl1Po6EE
	OdKDI
X-Gm-Gg: ATEYQzxSI6IV238AC4WycAvGDNQZ6qgtcj9yrhpA8kU8AmZts4tYdQi8lMxoA9XpvPS
	uTY5z44M+tW9uJSU3lGcJTI9pNX/aubBT1pmaR4vMHUKU+qcOc4d+nwb3rySbktV9Oh7bKUQMvX
	KZATeyT7Gn/mAJoopavbwnl65jtmZWDrmhJFUYv0wMjGcvFy2lFH0D8NTHd3BEvdB71L16xILZh
	V5m0A6VedG3YrQNUlZFc/L35dnbz+DaP0e+qgX38LnxfmpH2TVlCP8LhDtu7ezSdLTTzSskrKRT
	1VajLN9HhP9BnhjACYBr6T9ke9xElzBVB58rktn8gtLWwQOaLF4ifmLkP/RZ8Guvg/93maSH7ha
	vB4K4H050TGvoKP+nbcIcMhVR97aZrJ4TStWwR7meopVC1w4SXLuLIzezuxeLdm7hRb6v3hZIFd
	GQ5Lgj25IifJ7Juo80sJlVm2LtHK8q91tql9YJ//yN7vwb0UZ2BFNImV5HMc4io5gytnm8qQ57D
	bxf3fE/GzqpzQt8Az20tIwGUEae16KPhUU8jk+qYCDq
X-Received: by 2002:a05:600c:8b46:b0:485:34b3:858a with SMTP id 5b1f17b1804b1-485566d2d66mr200290765e9.11.1773653405868;
        Mon, 16 Mar 2026 02:30:05 -0700 (PDT)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48557a732cesm91138265e9.12.2026.03.16.02.30.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 02:30:05 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 06/17] busybox: patch CVE-2025-60876
Date: Mon, 16 Mar 2026 10:28:25 +0100
Message-ID: <22440b3e1fa36ade36f5cf754d25104afab308e1.1773652940.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1773652940.git.yoann.congal@smile.fr>
References: <cover.1773652940.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Mar 2026 09:30:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233228

From: Peter Marko <peter.marko@siemens.com>

Although the patch was not merged yet, Debian already took it ([1]).
Since busybox CVE handling is slow, follow Debian decision.

[1] https://sources.debian.org/src/busybox/1:1.37.0-10.1/debian/patches/wget-disallow-control-chars-in-URLs-CVE-2025-60876.patch

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Fabien Thomas <fabien.thomas@smile.fr>
[YC: fixed weird encoding in URL, added "CVE-" to subject]
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../busybox/busybox/CVE-2025-60876.patch      | 38 +++++++++++++++++++
 meta/recipes-core/busybox/busybox_1.35.0.bb   |  1 +
 2 files changed, 39 insertions(+)
 create mode 100644 meta/recipes-core/busybox/busybox/CVE-2025-60876.patch

diff --git a/meta/recipes-core/busybox/busybox/CVE-2025-60876.patch b/meta/recipes-core/busybox/busybox/CVE-2025-60876.patch
new file mode 100644
index 00000000000..72d7020f625
--- /dev/null
+++ b/meta/recipes-core/busybox/busybox/CVE-2025-60876.patch
@@ -0,0 +1,38 @@
+From 32c0f6f240fcb041ae7df44a9bbf958d627a8212 Mon Sep 17 00:00:00 2001
+From: Radoslav Kolev <radoslav.kolev@suse.com>
+Date: Fri, 21 Nov 2025 11:21:18 +0200
+Subject: [PATCH] wget: don't allow control characters or spaces in the URL
+
+Fixes CVE-2025-60876 malicious URL can be used to inject
+HTTP headers in the request.
+
+Signed-off-by: Radoslav Kolev <radoslav.kolev@suse.com>
+Reviewed-by: Emmanuel Deloget <logout@free.fr>
+
+CVE: CVE-2025-60876
+Upstream-Status: Submitted [https://lists.busybox.net/pipermail/busybox/2025-November/091840.html]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ networking/wget.c | 9 +++++++++
+ 1 file changed, 9 insertions(+)
+
+diff --git a/networking/wget.c b/networking/wget.c
+index 9ec0e67..7602563 100644
+--- a/networking/wget.c
++++ b/networking/wget.c
+@@ -536,6 +536,15 @@ static void parse_url(const char *src_url, struct host_info *h)
+ {
+ 	char *url, *p, *sp;
+ 
++	/* Fix for CVE-2025-60876 - don't allow control characters or spaces in the URL */
++	/* otherwise a malicious URL can be used to inject HTTP headers in the request */
++	const unsigned char *u = (void *) src_url;
++	while (*u) {
++		if (*u <= ' ')
++			bb_simple_error_msg_and_die("Unencoded control character found in the URL!");
++		u++;
++	}
++
+ 	free(h->allocated);
+ 	h->allocated = url = xstrdup(src_url);
+ 
diff --git a/meta/recipes-core/busybox/busybox_1.35.0.bb b/meta/recipes-core/busybox/busybox_1.35.0.bb
index 57a5747a489..0b5ac220f5f 100644
--- a/meta/recipes-core/busybox/busybox_1.35.0.bb
+++ b/meta/recipes-core/busybox/busybox_1.35.0.bb
@@ -61,6 +61,7 @@ SRC_URI = "https://busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://CVE-2023-39810.patch \
            file://CVE-2025-46394-01.patch \
            file://CVE-2025-46394-02.patch \
+           file://CVE-2025-60876.patch \
            "
 SRC_URI:append:libc-musl = " file://musl.cfg "
 

