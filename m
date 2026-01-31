Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AA22D7975D
	for <webhook@archiver.kernel.org>; Sat, 31 Jan 2026 07:57:06 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5009.1769846225457944255
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Jan 2026 23:57:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=DBZWf/Zo;
 spf=pass (domain: smile.fr, ip: 209.85.221.51, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-4327555464cso2070763f8f.1
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Jan 2026 23:57:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1769846223; x=1770451023; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1rvrEdw9rY3VIakIu2LZnyijy7NIiePsjtf6cb1WcQo=;
        b=DBZWf/ZoXxRg9EMmkq2Clh1tAdytLUJZ1VQkuJMwdxp4dQzZkT+eIR9V62pFj/8r41
         6ENwfYrgleVJqpDG5YF2/W1mVmyLyLrBSqgDGhmiGdiyfBypuClSA9P/eIEQylbUx8n8
         neOfkPz4GXk8YH9i5HFf0Kzrql7FPDBBqOM9c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769846223; x=1770451023;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1rvrEdw9rY3VIakIu2LZnyijy7NIiePsjtf6cb1WcQo=;
        b=tABboT7iRGnb8VtlguSkaunWBRWSj9LKDjYexHTiNILxUmbAKHaiTz4hYKxuF/hB+Q
         9jLtNyqXlXYKYYCswRvPocRMk3dB3vXB+4td1U2ca205FM+BrVWSV8WJNysBK8Ivf88T
         Nahy5Uri5xYolv+9B0EvdNON7pTH1kXXS5ExrGa+QYTc/kEbcevA9s20XYAdzJsn367+
         STfTqRoar053Wg+sEz/gVemeIdUChGZpIUmltUIuDye70ai+y7B1qNuql6IOIwviY0Cm
         FDENEI/QUEIi+vw+azsiNtljneyGTiXVBuDuyrTthSBSL8XVCJxVoOJdkA80c5mmTlmg
         ujww==
X-Gm-Message-State: AOJu0Yw24GAzR1TUZuRQVqIdYvK3NHjN6cizoZ5W442X9DHKp3RP42Dc
	J4fHdn/hlqOzNyrRYFY994RpjQpnVUb+awWbAoyXfR22+8yM6sCjmOeKw1UCYks+yjZdez3UJRx
	HBkCtJFQ=
X-Gm-Gg: AZuq6aK1h8ARjvOHXv89RVO+w+JRqe2xH1OQ/RrHneDnAoB1WmpMkSeGutGl6OVM8fe
	K1wVFSpHDhZ4NHd8CErrtRG5nshh0luVm/RpPWcm12Y4grlIdejZFbr9kn43iYLVqL/txTSOV76
	2wCaSsLVTRwryGYHVyoRjngYvtRndoOBegfQ1IqyzCVRFzNu1mHLp1wXbGyBBrgHHbzV2/eg8fz
	AASFZQ7xk0FmxAiu1pDWPlnZE/ASwzAlYyTKSPIM+u5565O3G3sqS55sWoJTrUNq9IAFcyQRpUc
	pXnuVI7qpaw45Cu3Q5joE5VnrZN44Tak/KUjKc11L0KKAW+3b8u+BaUeXcXHK83wU4sNT3S1+vU
	PYJ3V25NRaJTlLtd1EuGKh+3OyRBCOhdEetvBk2qQtWkclmoo09VnCSwcAzEb8H+DUjBm3HrIXM
	lSkTToFz5M/KTao5ReQGJ2pUTSKyTaE4am1+jY1q0vp3LZN72b6sdl2KZXveuoLRZg6HHOVE241
	aYRcdxVMPQIcp7DXoiaazW5diQ=
X-Received: by 2002:a05:600c:6206:b0:47e:e970:b4e4 with SMTP id 5b1f17b1804b1-482db48e90emr54900905e9.29.1769846223561;
        Fri, 30 Jan 2026 23:57:03 -0800 (PST)
Received: from FRSMI25-LASER.home (2a01cb001331aa00fa8b238ae1dd6dd8.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:fa8b:238a:e1dd:6dd8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4806ce564f9sm258621475e9.14.2026.01.30.23.57.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jan 2026 23:57:03 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter 14/22] docbook-xml-dtd4: fix the fetching failure
Date: Sat, 31 Jan 2026 08:56:25 +0100
Message-ID: <f626a481fb1e1d7ac59bc88fd373f420eeefe67b.1769845858.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1769845858.git.yoann.congal@smile.fr>
References: <cover.1769845858.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 31 Jan 2026 07:57:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230219

From: Khai Dang <khaidangbk1998@gmail.com>

Updating SRC_URI, the old archive url is deprecated.

Signed-off-by: Khai Dang <khai.dang@lge.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit c137d3637b6171fbd3bfd671a56096e7f2b3c318)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../docbook-xml/docbook-xml-dtd4_4.5.bb                | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-devtools/docbook-xml/docbook-xml-dtd4_4.5.bb b/meta/recipes-devtools/docbook-xml/docbook-xml-dtd4_4.5.bb
index 1148d536944..ea0861823d3 100644
--- a/meta/recipes-devtools/docbook-xml/docbook-xml-dtd4_4.5.bb
+++ b/meta/recipes-devtools/docbook-xml/docbook-xml-dtd4_4.5.bb
@@ -10,11 +10,11 @@ LIC_FILES_CHKSUM = "file://docbook-4.5/docbookx.dtd;beginline=15;endline=30;md5=
                     file://LICENSE-OASIS;md5=b9ee6208caa6e66c68dfad6f31d73f92"
 
 # Install the latest 4.5 DTDs, and the previous releases for backward compatibility.
-SRC_URI = "https://docbook.org/xml/4.1.2/docbkx412.zip;name=payload412;subdir=docbook-4.1.2 \
-           https://docbook.org/xml/4.2/docbook-xml-4.2.zip;name=payload42;subdir=docbook-4.2 \
-           https://docbook.org/xml/4.3/docbook-xml-4.3.zip;name=payload43;subdir=docbook-4.3 \
-           https://docbook.org/xml/4.4/docbook-xml-4.4.zip;name=payload44;subdir=docbook-4.4 \
-           https://docbook.org/xml/${PV}/docbook-xml-${PV}.zip;name=payloadPV;subdir=docbook-${PV} \
+SRC_URI = "https://archive.docbook.org/xml/4.1.2/docbkx412.zip;name=payload412;subdir=docbook-4.1.2 \
+           https://archive.docbook.org/xml/4.2/docbook-xml-4.2.zip;name=payload42;subdir=docbook-4.2 \
+           https://archive.docbook.org/xml/4.3/docbook-xml-4.3.zip;name=payload43;subdir=docbook-4.3 \
+           https://archive.docbook.org/xml/4.4/docbook-xml-4.4.zip;name=payload44;subdir=docbook-4.4 \
+           https://archive.docbook.org/xml/${PV}/docbook-xml-${PV}.zip;name=payloadPV;subdir=docbook-${PV} \
            file://docbook-xml-update-catalog.xml.patch \
            file://LICENSE-OASIS"
 

