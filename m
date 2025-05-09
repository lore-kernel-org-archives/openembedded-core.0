Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79DE8C3ABCD
	for <webhook@archiver.kernel.org>; Fri,  9 May 2025 15:24:03 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web11.1413.1746804237247472497
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 May 2025 08:23:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=rICCzjC6;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.182, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-73bf1cef6ceso2374231b3a.0
        for <openembedded-core@lists.openembedded.org>; Fri, 09 May 2025 08:23:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1746804236; x=1747409036; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5bvSkR9RUjVJvpNfsXfD4VPlqogOvNzYKASdb8t2lm0=;
        b=rICCzjC6jeLGGtQohzQFYEYEyhqt5YSCre4T2NtxZ3OqzkSv0tOWMnB9b79qSR7MP7
         N80JqWyo9qScImUHlNov2Li2Kf3aKY2EcEUGiBpATSP1ET6TxPkw6eWGQRpppqqT5OaG
         +lZalXJErd8n7T8y/xw9p++oclQj2/S5jFZxUznBvpY9yhWGQi49+k4iNWXmji2pFNR1
         mMA7guUSpMY5oiJk2HC7QKTg4Fh+tnS3W0ArpCOHs7CHZJMtpLWhb9H5sEeUYEEHS1UU
         s/JWJlfv9FB7jJ/35bpENAnmvwBMyiySCD5aPE3+p8dTkTBjiqpDzv8A4yD9yNP1sSqD
         Bvpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746804236; x=1747409036;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5bvSkR9RUjVJvpNfsXfD4VPlqogOvNzYKASdb8t2lm0=;
        b=e6lAaiGLnkh5SOBMAGcjSBimFOyKW0brcZznpi1EXchCZOpQ9d4bC1QCKvXbwRMt4/
         SwoTwUrTDST6RnM7cvE9TF3FZGF1Zu6F0kXS2mqDYSKJPyfgzqAP0UDCcZTkOH21r+Qd
         xL36xF5ADymC+mWOfzeXUz1iBZvTegzSbdIs1OGDA7LkC6pFXAOsak1AZz2wPfE2o4bJ
         LI4q8q7+hWRROqD9vfPLMvTP4hQs7hz/EOPNTWrRXGZCnwExwG+IZnlspxH0YA0zhvER
         GNRWd0RdRlJmV8Oh3YY/LMdTXnKUwVSEMRT207idYxOLeuNmMhUfG4Dy+xfNQl/bwlWy
         zfvw==
X-Gm-Message-State: AOJu0YzckVMHgzDNpHLqqX1CIEMpr6W2W6zViJM2pzNbMhlxLEkMx1v0
	MdT5OCFeYxDecib7YMewZXcG0lVPVYXUXFv6TRacMTgo9TQ32carJguB3tM+GkI0u3EFVob1IFL
	c
X-Gm-Gg: ASbGncvorvIoYEnEjbMqtQD71JFef287rUmjnj75CMzUOYF8bJg6ApxdXLdZQs6SXmC
	wmbOd67Bs5Jyl85jfK4qVfyrippdURgmhB2yv+Fs6MnxIWX4fSE7m+xpOIY7BIlJnqHJmBm94kk
	zpCWrlJ0uJHQrMUWAd3enoX1/dnEhok09Tb+bGjDabVkZs8drpJG6axjdCxDeI7oGungeGlHfyc
	WHTmd+iIlSYyNYdxlxdbvPHGuvZGP1kuDzHrXLeTwqtLIU4ds0YIJGRfKGICKchPcCfTLAQmNgl
	qSVJINxYsaXUZ+GHBrt/doTIKt6BCMUf
X-Google-Smtp-Source: AGHT+IH91oJkzCKAqy1KJwj2cE+NkjMm70CUa/+a4ucw3gckmxAARHK8+GUyyV+hk4ud0HhYL9Xa7g==
X-Received: by 2002:a05:6a00:17a7:b0:740:6f86:a0e6 with SMTP id d2e1a72fcca58-7423bc5ba52mr4912032b3a.6.1746804236415;
        Fri, 09 May 2025 08:23:56 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:1912:b658:11a7:402c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74237a108fbsm1848319b3a.115.2025.05.09.08.23.55
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 08:23:56 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 03/17] connman :fix CVE-2025-32743
Date: Fri,  9 May 2025 08:23:19 -0700
Message-ID: <61610f57c6b9ee2b6002decc037db049e9ddfe51.1746804035.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1746804035.git.steve@sakoman.com>
References: <cover.1746804035.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 May 2025 15:24:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216211

From: Praveen Kumar <praveen.kumar@windriver.com>

In ConnMan through 1.44, the lookup string in ns_resolv in dnsproxy.c
can be NULL or an empty string when the TC (Truncated) bit is set in
a DNS response. This allows attackers to cause a denial of service
(application crash) or possibly execute arbitrary code, because those
lookup values lead to incorrect length calculations and incorrect
memcpy operations.

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2025-32743

Upstream-patch:
https://git.kernel.org/pub/scm/network/connman/connman.git/commit/?id=d90b911f6760959bdf1393c39fe8d1118315490f

Signed-off-by: Praveen Kumar <praveen.kumar@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../connman/connman/CVE-2025-32743.patch      | 48 +++++++++++++++++++
 .../connman/connman_1.43.bb                   |  1 +
 2 files changed, 49 insertions(+)
 create mode 100644 meta/recipes-connectivity/connman/connman/CVE-2025-32743.patch

diff --git a/meta/recipes-connectivity/connman/connman/CVE-2025-32743.patch b/meta/recipes-connectivity/connman/connman/CVE-2025-32743.patch
new file mode 100644
index 0000000000..c114589679
--- /dev/null
+++ b/meta/recipes-connectivity/connman/connman/CVE-2025-32743.patch
@@ -0,0 +1,48 @@
+From d90b911f6760959bdf1393c39fe8d1118315490f Mon Sep 17 00:00:00 2001
+From: Praveen Kumar <praveen.kumar@windriver.com>
+Date: Thu, 24 Apr 2025 11:39:29 +0000
+Subject: [PATCH] dnsproxy: Fix NULL/empty lookup causing potential crash
+
+In ConnMan through 1.44, the lookup string in ns_resolv in dnsproxy.c
+can be NULL or an empty string when the TC (Truncated) bit is set in
+a DNS response. This allows attackers to cause a denial of service
+(application crash) or possibly execute arbitrary code, because those
+lookup values lead to incorrect length calculations and incorrect
+memcpy operations.
+
+This patch includes a check to make sure loookup value is valid before
+using it. This helps avoid unexpected value when the input is empty or
+incorrect.
+
+Fixes: CVE-2025-32743
+
+CVE: CVE-2025-32743
+
+Upstream-Status: Backport [https://git.kernel.org/pub/scm/network/connman/connman.git/commit/?id=d90b911f6760959bdf1393c39fe8d1118315490f]
+
+Signed-off-by: Praveen Kumar <praveen.kumar@windriver.com>
+---
+ src/dnsproxy.c | 7 ++++++-
+ 1 file changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/src/dnsproxy.c b/src/dnsproxy.c
+index f28a5d7..7ee26d9 100644
+--- a/src/dnsproxy.c
++++ b/src/dnsproxy.c
+@@ -1685,8 +1685,13 @@ static int ns_resolv(struct server_data *server, struct request_data *req,
+				gpointer request, gpointer name)
+ {
+	int sk = -1;
++	int err;
+	const char *lookup = (const char *)name;
+-	int err = ns_try_resolv_from_cache(req, request, lookup);
++
++	if (!lookup || strlen(lookup) == 0)
++		return -EINVAL;
++
++	err = ns_try_resolv_from_cache(req, request, lookup);
+
+	if (err > 0)
+		/* cache hit */
+--
+2.40.0
diff --git a/meta/recipes-connectivity/connman/connman_1.43.bb b/meta/recipes-connectivity/connman/connman_1.43.bb
index 1100599490..02abda568f 100644
--- a/meta/recipes-connectivity/connman/connman_1.43.bb
+++ b/meta/recipes-connectivity/connman/connman_1.43.bb
@@ -6,6 +6,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/network/${BPN}/${BP}.tar.xz \
            file://connman \
            file://no-version-scripts.patch \
            file://0002-resolve-musl-does-not-implement-res_ninit.patch \
+           file://CVE-2025-32743.patch \
            "
 
 
-- 
2.43.0


