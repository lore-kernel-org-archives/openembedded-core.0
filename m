Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAD61E6E7E9
	for <webhook@archiver.kernel.org>; Tue,  3 Feb 2026 10:19:34 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13357.1770113969948277337
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Feb 2026 02:19:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=t5fKdf3X;
 spf=pass (domain: smile.fr, ip: 209.85.221.42, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-43615d9c507so167411f8f.1
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Feb 2026 02:19:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1770113968; x=1770718768; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Cci+XdPd5TXzBJ7WTfZGi6s8ulHOjrzOjlw31HCfIJo=;
        b=t5fKdf3Xftdo+iCCBpLdJbsrj0x2drJMqajsiG3yGGLVZgzFdNUtPQmCIpjxl5z25I
         GAGIVKvzF28Ji+m8Zlg5MwdCtY1ooCo93RxI4TsBGr56vPUr0XbCrGy04pq3jASqgZPA
         /hb3Z4uSNVH4eRrmm5eJZI3YiDyAezDrh8cec=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770113968; x=1770718768;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Cci+XdPd5TXzBJ7WTfZGi6s8ulHOjrzOjlw31HCfIJo=;
        b=LFrKARzEWSNiWJ6JDfugO7fk6zQHcaW0/m78MBNkQr/3wRIlYfJxgktPgaewsKUHhW
         OjNIjXUZIhjo6fl35r3qRxVbgYEzEkVcqM3X0sfxkilR4kQc2PqIE1KzdmgeAHOyoddR
         eoA9zNTZDTj8JfG2tW+SasufdtTP4kt5+t09FooLaUipkrsa1YGS668C/6QIkqsXPiSr
         nqCXGjlDKs7EJsnPHo4YWItpyWJk3tdedcq1D7PysipNLKjc7GZMZ2oJe80FH7AOrkWt
         xF9Nahydl0ujsDUHezwT2/141tCKPE8StgBiczhFiSTR3L58tohTK+xoadjthlpwRPnl
         8/SQ==
X-Gm-Message-State: AOJu0Yw32M3SvrDHdUgmhc1sNcOnUKh2Z/fewHF88kuOuZN5c/6dM/vb
	MN9u1QjSJr0dBv/GZOheXcboPnn8leA3acc6yDlyJkYqgUvaD9KtuEevk36TuWHG41B6oKPHH+w
	P2xyf/k4=
X-Gm-Gg: AZuq6aJFoPm6EIL+maGS2f+Lv5cgo+PCDMO3l42rePOC4ou1jTOl7AaEVWqaSYw9Wlg
	TGvsJpzAan4uNtu4Hs274e3GjHFemYLXxLpO8EH8Z4JNCuz4wPCzP1wdVPOfbU0LVsP/DkFY40/
	8JRYwmweTR9RggsqwxjxgdMJDC0oFml7+PI/zk7MFlER+uplaGX6bkd/wodBmhlxL96NcrQPDJH
	fce9NCmo0JLO0xYXzoY36MQAvk6c4I3SHyrOEzsdwYRPN8VoyHrnDNUhozWfaH4elv7ivS+8v+G
	+jroOO9twXuuqSmYwDsrRuBFE+BZc/5jE/wtBcrxqtCinrbeLYW5NDvomYFkmsGA0RZB5jDzOru
	6G8FiHMSOSTHZd/BLsJYHQjDHzN0xEDv2TIFTCvZzVKWgCQ6JphtL2RS0D8sb8aoRiZNHZ3Xbr8
	fkbYTon6hvMxUlt+eJO/kbbe1gahApEwv6BjFpjC3TL7lHnF6ZDkmOsdFwTJ53dZ4HxijqQOtCC
	yT13easUVld2iE=
X-Received: by 2002:a05:600c:4e56:b0:480:1b1a:551d with SMTP id 5b1f17b1804b1-482db47cf43mr183433795e9.18.1770113967781;
        Tue, 03 Feb 2026 02:19:27 -0800 (PST)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e131ce70sm52293041f8f.27.2026.02.03.02.19.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 02:19:27 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter v2 08/22] libtasn1: Fix CVE-2025-13151
Date: Tue,  3 Feb 2026 11:16:37 +0100
Message-ID: <e6b85f9a4cdcc4175fe259c0a5bfa764cd1be1f9.1770109549.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1770109549.git.yoann.congal@smile.fr>
References: <cover.1770109549.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Feb 2026 10:19:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230436

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

