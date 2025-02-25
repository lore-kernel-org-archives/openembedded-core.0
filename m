Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 406E5C021B2
	for <webhook@archiver.kernel.org>; Tue, 25 Feb 2025 14:30:32 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web11.9095.1740493823705393889
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Feb 2025 06:30:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=dvs6k9F1;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.173, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-22185cddbffso114243195ad.1
        for <openembedded-core@lists.openembedded.org>; Tue, 25 Feb 2025 06:30:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1740493823; x=1741098623; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+psCwWOcN8iWxqYnz20UInlSr8Z8y7i0BiQX7u7qTq8=;
        b=dvs6k9F1/cCLqosYjscANbpUOkNygRJDKZBlMGX+Vfz+qN6kuf1Wp9qNvl5Krb5kDz
         ywc+AINku1HBYx71XrXjt1PR5PGHtPH34P7f3rEke294bKNsTgJdE1A3C6tVZEKwPuz+
         HjWsR7IfhSbEFCcKkRIgcgCfKtqa0PEZfHds6me/MY/8shafeYHyXRi5f0Jerhx8Au1P
         ldkvO4/CquS3BKxsjEdgNf3NQiTnNnnXGIt4r4nhF8NYCRq/7xC+Dm8jowTXGd9MfI3U
         ZRAgfoGYWNIYY8GpV3mlIVTHD2jjmfDUqOnIfDlP++yZWAc9dpR7Fmjwj4vN2VhZcDlb
         99Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740493823; x=1741098623;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+psCwWOcN8iWxqYnz20UInlSr8Z8y7i0BiQX7u7qTq8=;
        b=ZcER33Xd3+QM2ZykNpZeiR1sOdcEj80NZDgsLQU/pXKmsjg1iRw2zz4VYoxiAAssjO
         GOXwhe8AMQe2n6+3WaUT8b5K9AptIEbimjWwLKzpbK0625U2mZlrx5u0fwl+Xl/VcbCb
         NX7+bmYun0D3JfOdb1HZcdQWpC0BU1PJdfn3C64i3vcHFPg3pr38cdprg7T7By0GoLcM
         C8DcVLbJMqXe1CS8GFiKvFGmvrg8p/PzG8llZ9zdpYG1V3Slft/kVb4ra8P4cRGXfGyI
         xJL0foHtYV00/BdRA1+dDMkrQm7GPAlb87L41dVJ6FDGnLYqELhRxkBnkhr9RR9Nb4yD
         klLg==
X-Gm-Message-State: AOJu0Yxu5y2MlB6zougS+8oo7OTOwzVnEzbtlKHPUrDVPJWNCI4zB93h
	SKIFE7hqMbkHZ1mADnAYqFm1fxcHqk9V3UFV9QjeWHXFjWxU+ZT1TbepGnRok3z36+PYH4//jks
	I
X-Gm-Gg: ASbGncsMnnrPpKKLuWYLzVVUzu7deFWaAkYtMwloN34bSFX8eHH9qKQzm4Iw4FTvTYa
	gcxvX1zOP84rm2GzKuRIrSlvLh884tgSJnRo4nUD5/09uuNSdGN6fWuAoVFnsrebZZmfgyAXwRN
	2htuzKZVJpVXT+h6VitY3X7RRqVB9EFqP3FNeKCLaPbryR0mNKXk56/9WgjMAXhiA0dZ+wVyyJM
	QSnwjlEiIoGA6IP4xHCw+k+0epmLZKc8o6wxMqBcX+VSfPpT0+KH5tBySKgV0Nu2dFYbhLyKYBT
	q3coC/UvbZFmQGNmTQ==
X-Google-Smtp-Source: AGHT+IGHmk4K2JnGIrZJnPAP+y2+2Dhl5D5UXCU6CP31lu7MSRdmUYJfEg/1C36eXcg9XaXfuO04YQ==
X-Received: by 2002:a05:6a00:3cd5:b0:725:41c4:dbc7 with SMTP id d2e1a72fcca58-73425b7fd45mr28868341b3a.4.1740493822880;
        Tue, 25 Feb 2025 06:30:22 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:c473:2777:3793:104c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7347a81ed10sm1535650b3a.129.2025.02.25.06.30.22
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 06:30:22 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 11/22] libxml2: fix compilation of explicit child axis in pattern
Date: Tue, 25 Feb 2025 06:29:46 -0800
Message-ID: <0dc99e25c16a1e74aa80ca20132609990bb9dff7.1740493685.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1740493685.git.steve@sakoman.com>
References: <cover.1740493685.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Feb 2025 14:30:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211895

From: Peter Marko <peter.marko@siemens.com>

This was reported as sucurity fix in
https://gitlab.gnome.org/GNOME/libxml2/-/releases/v2.12.10
https://gitlab.gnome.org/GNOME/libxml2/-/releases/v2.13.6

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...x-compilation-of-explicit-child-axis.patch | 31 +++++++++++++++++++
 meta/recipes-core/libxml/libxml2_2.9.14.bb    |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta/recipes-core/libxml/libxml2/0001-pattern-Fix-compilation-of-explicit-child-axis.patch

diff --git a/meta/recipes-core/libxml/libxml2/0001-pattern-Fix-compilation-of-explicit-child-axis.patch b/meta/recipes-core/libxml/libxml2/0001-pattern-Fix-compilation-of-explicit-child-axis.patch
new file mode 100644
index 0000000000..932c0ec422
--- /dev/null
+++ b/meta/recipes-core/libxml/libxml2/0001-pattern-Fix-compilation-of-explicit-child-axis.patch
@@ -0,0 +1,31 @@
+From 503f788e84f1c1f1d769c2c7258d77faee94b5a3 Mon Sep 17 00:00:00 2001
+From: Nick Wellnhofer <wellnhofer@aevum.de>
+Date: Thu, 13 Feb 2025 16:48:53 +0100
+Subject: [PATCH] pattern: Fix compilation of explicit child axis
+
+The child axis is the default axis and should generate XML_OP_ELEM like
+the case without an axis.
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libxml2/-/commit/503f788e84f1c1f1d769c2c7258d77faee94b5a3]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ pattern.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/pattern.c b/pattern.c
+index 27e96946..3182794e 100644
+--- a/pattern.c
++++ b/pattern.c
+@@ -1178,10 +1178,10 @@ xmlCompileStepPattern(xmlPatParserContextPtr ctxt) {
+ 			    goto error;
+ 			}
+ 		    } else {
+-			PUSH(XML_OP_CHILD, token, URL);
++			PUSH(XML_OP_ELEM, token, URL);
+ 		    }
+ 		} else
+-		    PUSH(XML_OP_CHILD, name, NULL);
++		    PUSH(XML_OP_ELEM, name, NULL);
+ 		return;
+ 	    } else if (xmlStrEqual(name, (const xmlChar *) "attribute")) {
+ 		XML_PAT_FREE_STRING(ctxt, name)
diff --git a/meta/recipes-core/libxml/libxml2_2.9.14.bb b/meta/recipes-core/libxml/libxml2_2.9.14.bb
index ecaae0b436..912bcfd0f3 100644
--- a/meta/recipes-core/libxml/libxml2_2.9.14.bb
+++ b/meta/recipes-core/libxml/libxml2_2.9.14.bb
@@ -34,6 +34,7 @@ SRC_URI += "http://www.w3.org/XML/Test/xmlts20080827.tar;subdir=${BP};name=testt
            file://CVE-2024-25062.patch \
            file://CVE-2024-34459.patch \
            file://CVE-2022-49043.patch \
+           file://0001-pattern-Fix-compilation-of-explicit-child-axis.patch \
            "
 
 SRC_URI[archive.sha256sum] = "60d74a257d1ccec0475e749cba2f21559e48139efba6ff28224357c7c798dfee"
-- 
2.43.0


