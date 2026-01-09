Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9DF8D232E1
	for <webhook@archiver.kernel.org>; Fri,  9 Jan 2026 05:42:35 +0000 (UTC)
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1894.1767924781593482750
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Jan 2026 18:13:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NIx4RBmE;
 spf=pass (domain: gmail.com, ip: 74.125.82.177, mailfrom: khaidangbk1998@gmail.com)
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-2b19939070fso1093976eec.0
        for <openembedded-core@lists.openembedded.org>; Thu, 08 Jan 2026 18:13:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767924781; x=1768529581; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tJBFaJx5or6kC+blmhAPJ+3TmkuoHc8Rkz9jnqU7v3M=;
        b=NIx4RBmEFJpreO7vYCUU6CklwBD5Qp7VMBZNJ7CfXS8XU0BCRyecB0JGyp/kYb1DNI
         5ZAaxnir18xvDub65MM7qaewHmNA0YE7WbCETwo/3lRSBlF3eWA9fJopnbjU0J+bFPr1
         OysenbDdJ1bVIDewDqMceu7b53cwQXsXT8g+SKDxurPjwHvJMWnAAhDy4a8AbgdRalA+
         BPssOWt7jNGU0p8JC6uOtLLoJz0F+JLTMfhSFFJ/7LwHrp/9FmDDpw3FXWYUTzu88ktQ
         vHrp6w8Y3CoHFw5A18hpQN7M8uc2ZLayT01zHvoG6hgbF7+UTQg7sGlrTXMX697Hv/iz
         2G4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767924781; x=1768529581;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tJBFaJx5or6kC+blmhAPJ+3TmkuoHc8Rkz9jnqU7v3M=;
        b=IGl2VrUIcsxiXo7fL7upRDNA88+CoLBsIQITyKah/Mn5njWwwVi6PDNJp5VUvGspQV
         PmQgdxk2oyn47in6uOQylqESrZgQhktVnjQvpmmy7l4aIcxXAVOno9Vaiix1tEQrwGJq
         nr6fSjgsCjNd1Sc9gisFHazKdvNbhOrvqV/G6qyo+hRJaMthKo+K5MvtmrOVpJlS8bCs
         PF/YITmr+/U5oZDzj/t0lC4qCZ5/jrGsWCTcsuyX64ebav/ajDu6dQbULUM0Nykh8drR
         +FgcF/6T1GdytHC31kqRppOfmOnKeHq1XSu785WZSiC435zmzacxpVGhlbpxq1ud627x
         YAYw==
X-Gm-Message-State: AOJu0Ywp7rguOI1K4IvBVH3gc8ICU86BP65PAoI8IZs0TOar2Ri20vyY
	u6KCUXSdIX5K03DdtV23me2o4gf19LAafHMaz/ksTqAhb4ULweIoF8ugA4jgEXTQ
X-Gm-Gg: AY/fxX5sILE4vqMZ5rsYVCAvHRMcpMdgFk8s3FeCN04eApQQNSxxKsZTDl8vn2nSf+d
	TQraWhKxRAXS4Soi2yJk5St4TCbJFKUBFNl8x2chFdOzlOKT/EqHJXsFRkQTONhZNwmnmDfOaKr
	9l55RjQ8msZ3XJqpfiJsX/ZMhCbJJqKEvK78pF02nwKy5E/2hM6T4ujsdn9WcqLxjigi916WHHX
	uz/JQxj+i4u41Hf2RkkyAKdVv+7CxLrVvT7xVz+Xc0dPoZcWMYPoK3i2JcMKnhZFq9liiVhb+F1
	uQTCJ927480f6bAeNVhI7J7iZK/ZQmebrDcaxiyO3dUA3ekzzQgKqcuazWKy+46irZi/BiaBwm8
	7Qd6EpmN2Irzuc+gOGC1PIdFfRScNpoGqo+MjXiDyDFYcE0IXGvuxBxGYXgJyC+385I1wcwiNf0
	aNMfYeSy9ugr7InfGE8L4C+UUGAPBZSW3POGX5YALDPoNJ0aD2
X-Google-Smtp-Source: AGHT+IFlnoINjn2mVbSRyOpPhUuwE1+9f2jfb61NaZgJoZTqHbN9kMUc2c1LJlqnKFMfI3HBRwXd5Q==
X-Received: by 2002:a17:903:2a8c:b0:295:7b89:cb8f with SMTP id d9443c01a7336-2a3ee377cbcmr79957855ad.0.1767924312790;
        Thu, 08 Jan 2026 18:05:12 -0800 (PST)
Received: from khai-dang-atlas.bee-live.svc.cluster.local ([203.247.149.239])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3cc793fsm90244505ad.72.2026.01.08.18.05.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 18:05:12 -0800 (PST)
From: Khai Dang <khaidangbk1998@gmail.com>
X-Google-Original-From: Khai Dang <khai.dang@lge.com>
To: openembedded-core@lists.openembedded.org
Cc: Khai Dang <khai.dang@lge.com>
Subject: [walnascar][PATCH] docbook-xml-dtd4: fix the fetching failure
Date: Fri,  9 Jan 2026 02:05:07 +0000
Message-Id: <20260109020507.2808-1-khai.dang@lge.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Jan 2026 05:42:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229093

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
 

