Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78067C47BDA
	for <webhook@archiver.kernel.org>; Tue,  6 Jan 2026 09:52:27 +0000 (UTC)
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.82470.1767668483714470903
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Jan 2026 19:01:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kLCWXlyz;
 spf=pass (domain: gmail.com, ip: 209.85.160.181, mailfrom: khaidangbk1998@gmail.com)
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-4f1ab2ea5c1so6722731cf.3
        for <openembedded-core@lists.openembedded.org>; Mon, 05 Jan 2026 19:01:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767668482; x=1768273282; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tJBFaJx5or6kC+blmhAPJ+3TmkuoHc8Rkz9jnqU7v3M=;
        b=kLCWXlyzwr5Z1g/OLH/h/A4WUFVzDc3Fk3Ag66C0rMy46X97g9dg1nLkpqd8VKlsm3
         akf8J7E0e2fxX7flt6td36+JXGVGFhpkZQzjHQDaQK74Rbdu+MMbvdrfK22mYBqwu0Nm
         F3Pxg5C0AF73C4nDw6649Tf4nkvPP/6gYYyenzD7R/CfhSX8HQnX1sWUk+Wv1F5YWVi7
         4l6Rj4Y1pYv3uIrI6fOcbUcsulDr1pXnuGQOVQfeIogIykX48WcbOCgF1lHQqcD18eFZ
         6YGLqbW+0XnYOSfz7lfdNRJqNrdSMtN0HQ9D3dd720DgurAd3swjJ5ik0SDQwlEAXQ9z
         mG7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767668482; x=1768273282;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tJBFaJx5or6kC+blmhAPJ+3TmkuoHc8Rkz9jnqU7v3M=;
        b=LM8qNTNyGlom7mfogOJ4TS8VgBTyqVPOg1t/rYRo7MpXsyqYy7gznpLF0zx9zSLGXv
         NHzuGdfJyL1W4NkIBQcxKqaju9n1aqnGRYG6YL3cPygP+6E3v4NilRwVFjgMRmQ3OJ03
         dhsZuz3EilREAJg+QUnK9bcWWOGnXdArMyXHHXZi8FWJQhJANfnBhC/V2uTYSqOS+fSS
         TRE3vVpaagemTwjNwrc/HPO9nEUd1xtvJWd7LaB6IMoruPtRuw9CqgSstczKFtMu2gPs
         iS0LKaLHniDED0EtYlxmawlnSiyZqwwKhjuqQYSdI0X8xuq3JYd0fWkyfH9g09VFkKzv
         4c9w==
X-Gm-Message-State: AOJu0YzydFxMVNwNyCNiznaIDyMeqhszr57iiW5gPx82nBAK0U1t17CG
	iPQ8iEqFsu8/lcHjEdILQpV7j6ehsxPkKaW1UmKlej7Ge7cX5FoLDibapw+4RcG0
X-Gm-Gg: AY/fxX6ItZqQrjouO6BEqO5zm+VlMhqQwTJJNdrNWEZ++jOyRKa9SoCtePoaoRgyjA8
	RAv0v9fQYgoyuUMp3bCcBdxsp6ybkSkgLQ65PkO+hcODElgaZVvYUzko+ekySpY4kJ+LvQc6d3t
	V6Jvz2KQRaTRNzZ1uHWp5hOkzBmtYuei9jlFuFRW31DvBr/JAXupIcMHRQhelXi5YygiJbXXziW
	oclL9TAzuLE1xg/FAKgE3viSTNQlt28wnJV+MuDoxxRoib82AOyV7pFpPC6S31C5x3nFcvda9xy
	OMJ0q4A4tJurD+RkKdT3gWG4a4e4/OZZkvSygj6UQzHYAbkhlLzj/0SsV4n2j1Md8o6T8XNE8Vo
	RRADVAxZymb7zNPQwtKBd71o3nKFS9nCWdkVvRoptvFogR++WIPYVEUY1MOFICsbOQytb72YHza
	72088Tdc/hnMe3ux0NVUrQx7UfdaPhz4L4KhKWd8U62yemf6vi
X-Google-Smtp-Source: AGHT+IHERltUM0z7kTGKmAp122rsdGj7iEysiCUkoANgk5EFRbxAxNcVk3wuQjCINZ1PDMnLbCXM5g==
X-Received: by 2002:aa7:9a45:0:b0:7fb:eb9c:66a7 with SMTP id d2e1a72fcca58-8187f4a1205mr923311b3a.36.1767668144982;
        Mon, 05 Jan 2026 18:55:44 -0800 (PST)
Received: from khai-dang-atlas.bee-live.svc.cluster.local ([203.247.149.239])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-819c52fd938sm470592b3a.43.2026.01.05.18.55.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 18:55:44 -0800 (PST)
From: Khai Dang <khaidangbk1998@gmail.com>
X-Google-Original-From: Khai Dang <khai.dang@lge.com>
To: openembedded-core@lists.openembedded.org
Cc: Khai Dang <khai.dang@lge.com>
Subject: [master][PATCH] docbook-xml-dtd4: fix the fetching failure
Date: Tue,  6 Jan 2026 02:55:39 +0000
Message-Id: <20260106025539.89154-1-khai.dang@lge.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Jan 2026 09:52:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228883

Updating SRC_URI, the old archive url is deprecated.

Signed-off-by: Khai Dang <khai.dang@lge.com>
---
 .../docbook-xml/docbook-xml-dtd4_4.5.bb                | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-devtools/docbook-xml/docbook-xml-dtd4_4.5.bb b/meta/recipes-devtools/docbook-xml/docbook-xml-dtd4_4.5.bb
index 1148d53694..ea0861823d 100644
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
 

