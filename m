Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B8C3E7E0A0
	for <webhook@archiver.kernel.org>; Mon,  9 Feb 2026 09:29:37 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.44200.1770629368060850834
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Feb 2026 01:29:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Nur/DD0v;
 spf=pass (domain: smile.fr, ip: 209.85.128.48, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-47edd6111b4so59894015e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 09 Feb 2026 01:29:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1770629366; x=1771234166; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Cci+XdPd5TXzBJ7WTfZGi6s8ulHOjrzOjlw31HCfIJo=;
        b=Nur/DD0v3RV1fLBZi2h5scL+YiLoZ9MF1uLXPtOwaIrzDPjOuJ4AC0f/Ppxj2Pi50+
         zM5iBl6AB9+Q7FPMQVclXAifrK7q9YAd6e/sAJ9+q9o8k0sXaT9GkyuxMsl2n+XcSVY4
         MT7jSJWPbVHYFwcRafxRP1NEhyNOiD4VC7lNg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770629366; x=1771234166;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Cci+XdPd5TXzBJ7WTfZGi6s8ulHOjrzOjlw31HCfIJo=;
        b=lPR88NjrWYCRnAe6rHHelQFe3pSBvccIVDvlcg61jYdTEa170PwHWaI2xPbNXkkaq7
         9C4/wQOUeOU7O4vzZPu1QQFXWDlKwoxwgZosuAKJEZ9vLdM2TeP0v1Ntm7QJrQTnbPqD
         MX0W3XV4VmydtJnz5cD65S2rDLLncTp9loCoUvD8u1eET0aKX3CvJbnz9CTlmhJv7bKd
         VjBuYrAUU3GxK2X22hNrfR4Q9UkJb5vwQIBK8on51zFlKZFkx5tbXgoP8o4bS//Oi0LO
         4lvDNliEy9g63uKxh9wMSFSyH8JUh+l5MG+5N7KL7jCBasBsTdzYUeKZrMmpP1voTKhq
         LxWQ==
X-Gm-Message-State: AOJu0YySoIX0XNWSXC6AmzRw8bt9IVZ4NaskMMZeKX347di5YwGQxdcj
	NqP/JPfWPrFTqE6doVBMWkI8NxpKWEWecl3ZmakuCVL2CAvLeEvULA7BV09Vmhys5oQ+uSkZzuq
	E06RZSis=
X-Gm-Gg: AZuq6aJAiSP4IxByBs0bjFxDhUMqoswQaeVvVQdDW5QvvEvtc4Ip9UNnvV5v9x3oVEK
	w1SLQFUp5F6dxqzzU7nLkhDZ99C+8EahNaQ9Aq+S/9Q3m56s9sSUgSk+KfjLIb88r/auZA1eAzz
	7RhRXpiTA42/SGICebYsEkjHLkpvjev4Pug50fcH7JvjEKNQ3FA639fa/xBTyy57o10OZi8rruz
	10sso2YFI870QV188BazaIaGhLZYdWlFrZKF94GWSXpwLTwuSQM9iDhJ903j7LaWLKEG+Z6qIl9
	IJREpvtPRTLaGqTaEA0geWcU4idSkhhhI903gweODVVxCrATipWZbwVy19pkPQS/LaDz+e8KuUL
	cm+d/V1TZz57OPAerTjsxcj65saeAdniHkCBF8WMm6Q8tWCD5j0ulI9UdyRQ/+D6c9FW1PkPHy3
	OgvRZJE5oTg1Pzu93SqHRvAW5pY+KBbOVK5Jxe4cuuWlvX9ZQO2jeE1llsHopn5Vi0fnqU4Cl1e
	nJwNk9qvgq8JFA=
X-Received: by 2002:a05:600c:19c7:b0:479:1ac2:f9b8 with SMTP id 5b1f17b1804b1-483202161femr156186305e9.21.1770629366059;
        Mon, 09 Feb 2026 01:29:26 -0800 (PST)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4376a78d796sm9575656f8f.20.2026.02.09.01.29.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 01:29:25 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 09/25] libtasn1: Fix CVE-2025-13151
Date: Mon,  9 Feb 2026 10:28:52 +0100
Message-ID: <8cb69ea01147671fc403a91dfa91bcee563e1269.1770626074.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1770626074.git.yoann.congal@smile.fr>
References: <cover.1770626074.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Feb 2026 09:29:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230760

From: Hugo SIMELIERE <hsimeliere.opensource@witekio.com>

Upstream-Status: Backport from https://gitlab.com/gnutls/libtasn1/-/commit/d276cc495a2a32b182c3c39851f1ba58f2d9f9b8

Signed-off-by: Bruno VERNAY <bruno.vernay@se.com>
Signed-off-by: Hugo SIMELIERE <hsimeliere.opensource@witekio.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../gnutls/libtasn1/CVE-2025-13151.patch      | 30 +++++++++++++++++++
 .../recipes-support/gnutls/libtasn1_4.20.0.bb |  1 +
 2 files changed, 31 insertions(+)
 create mode 100644 meta/recipes-support/gnutls/libtasn1/CVE-2025-13151.patch

diff --git a/meta/recipes-support/gnutls/libtasn1/CVE-2025-13151.patch b/meta/recipes-support/gnutls/libtasn1/CVE-2025-13151.patch
new file mode 100644
index 00000000000..5047d679840
--- /dev/null
+++ b/meta/recipes-support/gnutls/libtasn1/CVE-2025-13151.patch
@@ -0,0 +1,30 @@
+From ff7aa7ef2b9ba41df8f2d1e71b05bf2c2ad868dd Mon Sep 17 00:00:00 2001
+From: Vijay Sarvepalli <vssarvepalli@cert.org>
+Date: Mon, 22 Dec 2025 12:24:27 -0500
+Subject: [PATCH] Fix for CVE-2025-13151 Buffer overflow
+
+Upstream-Status: Backport [https://gitlab.com/gnutls/libtasn1/-/commit/d276cc495a2a32b182c3c39851f1ba58f2d9f9b8]
+CVE: CVE-2025-13151
+
+Signed-off-by: Simon Josefsson <simon@josefsson.org>
+Signed-off-by: Hugo SIMELIERE <hsimeliere.opensource@witekio.com>
+---
+ lib/decoding.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lib/decoding.c b/lib/decoding.c
+index 1e0fcb3..abcb49f 100644
+--- a/lib/decoding.c
++++ b/lib/decoding.c
+@@ -1983,7 +1983,7 @@ int
+ asn1_expand_octet_string (asn1_node_const definitions, asn1_node *element,
+ 			  const char *octetName, const char *objectName)
+ {
+-  char name[2 * ASN1_MAX_NAME_SIZE + 1], value[ASN1_MAX_NAME_SIZE];
++  char name[2 * ASN1_MAX_NAME_SIZE + 2], value[ASN1_MAX_NAME_SIZE];
+   int retCode = ASN1_SUCCESS, result;
+   int len, len2, len3;
+   asn1_node_const p2;
+-- 
+2.47.1
+
diff --git a/meta/recipes-support/gnutls/libtasn1_4.20.0.bb b/meta/recipes-support/gnutls/libtasn1_4.20.0.bb
index 8127ba5b1db..bfc011a2f17 100644
--- a/meta/recipes-support/gnutls/libtasn1_4.20.0.bb
+++ b/meta/recipes-support/gnutls/libtasn1_4.20.0.bb
@@ -11,6 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=1ebbd3e34237af26da5dc08a4e440464 \
 
 SRC_URI = "${GNU_MIRROR}/libtasn1/libtasn1-${PV}.tar.gz \
            file://dont-depend-on-help2man.patch \
+           file://CVE-2025-13151.patch \
            "
 
 DEPENDS = "bison-native"

