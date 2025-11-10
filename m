Return-Path: <nmjain23@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B7A0CCFA13
	for <webhook@archiver.kernel.org>; Mon, 10 Nov 2025 11:34:53 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.46131.1762774488314726415
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Nov 2025 03:34:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MxN0aLfl;
 spf=pass (domain: gmail.com, ip: 209.85.215.172, mailfrom: nmjain23@gmail.com)
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-b98a619f020so2571556a12.2
        for <openembedded-core@lists.openembedded.org>; Mon, 10 Nov 2025 03:34:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762774487; x=1763379287; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=K2Kw5TZZ5xoFy2SlMWLs3I5NIpPCOvkUFyUfDvp+zgU=;
        b=MxN0aLfl96igbWH/m0WsklrxWEbLeDhjFgbbWoYvNZJGPnieLomox0QXYoNo7HE9QI
         vjWLupmya/2O8aRLMPVoQT9irAPXCuXM7zzME159ILcMGkYEfay0FXgUkHsenf2nydly
         XOMqsNQwM4XFkHMhL8XDNIdLC/p//t4MTjAvUNKawBwGjt8+x0suMlkAC+JBz34dgs1D
         zIyIg856Wiz6o8Qgj5jfy9vd3PmThnWwlziYacMPBgovNJUJMJD6ZdIrtqXPm/qgZ/rC
         oJnkiz1TXWMVUnan8oqfJfJ5mEhAz+QK30OkSATwp9Y6T3ORZKmTXGFf2aEiInI1y95Q
         +EYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762774487; x=1763379287;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K2Kw5TZZ5xoFy2SlMWLs3I5NIpPCOvkUFyUfDvp+zgU=;
        b=gFjwVjkuW4lHPSzDqgVK394btgiCaR9E0jBO5eqiNS1HtZZy0ar7YC3rnOB3IzV7lF
         csfcUMsIlxPUZpe+ILCIoyIn6E3MHs9mZpKcDdpIb4VDV6D47dOnQCnEkpF5pnzyLqnb
         ZyVXQt2grTwqQphlZE7lekg2CXUIoUqHZExNVEs/ZesMdEYztWlz1xtCGnwxfjZnHgDE
         KhCCNtfr2iGCofpfiSz0oB0S81FF/0ep6mADihVaBXy7exZEtMHmvTZFsAzCidXJPhnL
         zxrKiLL0+A7h8DAQ1lMgFNqETz6vQkWVyei4nNiSVqetLkViTGguLGRqlMNQlAg99snJ
         6XRQ==
X-Gm-Message-State: AOJu0YxnlEJjbUrO0GJGDDgK1okxIz13GzbUfAsCrTXtpbCLdvbe7C+W
	eEiL09PK+rQMvQp0u8VbMAZzV7GvFrWfBd4eEk/TwedJfRzAQIs/4gzU2x1llQ==
X-Gm-Gg: ASbGncuXBjyKQBBxFfhXXMy+1D+CtfFr9662YMUssez3pIQSUlynPEYBhIiOvT11xD1
	i26Hj7SEciOxSwW1ebyQFQN3L/1BGIHQ8+jLQ80Hs45bZfDvTf3J7eDJXyZXXjvRDsLQJlWC9Uw
	RNl2AZc5IhIB/0WE2KbMKtrmdBGPEfaVfSdkETHdxOdWRlefwrYTiykZBoWKkveerLBZOc5ndsL
	LYzFMojrG59vLUGxj7Q8x2i+i/dtS/PdIOMBniJNp8sYgxPb73OEeVvU2G1g2ckQSA2E4V5Avgm
	XU6gCAkdm8f+O3iaVOJw1JtaMPRnWhcqyRvsATe6Dr8beKeDR9Ld4prcO8+vMMrnUip3ikiS9gA
	GiD1PkryEjgj/u2YgbXOzHvJTiXqlNxA/8QAQHsA2xMy1PlCZKKPz4UqGayeznCGJc4udWTW8u5
	QaRo6+EX1LMmwnS/by
X-Google-Smtp-Source: AGHT+IFm5GtTF8KbYHvg9dT7J2ABZjJcGpDs64c02xx3s85ZdbrJvQAvOheJ0geXBPr5d/voDjGMdA==
X-Received: by 2002:a17:902:f54e:b0:277:3488:787e with SMTP id d9443c01a7336-297e53e7704mr106497395ad.12.1762774487384;
        Mon, 10 Nov 2025 03:34:47 -0800 (PST)
Received: from LL-3450LLL.kpit.com ([103.133.67.152])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29650c5f011sm143485185ad.25.2025.11.10.03.34.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 03:34:46 -0800 (PST)
From: Naman Jain <nmjain23@gmail.com>
X-Google-Original-From: Naman Jain <namanj1@kpit.com>
To: openembedded-core@lists.openembedded.org
Cc: Virendra Thakur <virendra.thakur@kpit.com>
Subject: [meta][kirkstone][PATCH] socat: Update LICENSE field
Date: Mon, 10 Nov 2025 17:04:15 +0530
Message-Id: <20251110113415.851515-1-namanj1@kpit.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Nov 2025 11:34:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226118

The below reference clearly states that GPL-2.0-with-OpenSSL-exception
is to be used with GPL 2.0 or GPL3.0 and not as a standalone license.
Therefore, update the correct license. Also add LGPL-2.1-or-later as
socat uses it.

Reference:
https://github.com/aboutcode-org/scancode-licensedb/blob/569d72e13e7c8d14a44380f91e80c5a2d4091f8f/docs/openssl-exception-gpl-2.0.yml#L7

Signed-off-by: Virendra Thakur <virendra.thakur@kpit.com>
Signed-off-by: Naman Jain <namanj1@kpit.com>
---
 meta/recipes-connectivity/socat/socat_1.7.4.4.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-connectivity/socat/socat_1.7.4.4.bb b/meta/recipes-connectivity/socat/socat_1.7.4.4.bb
index 86ca5879be..4a18219208 100644
--- a/meta/recipes-connectivity/socat/socat_1.7.4.4.bb
+++ b/meta/recipes-connectivity/socat/socat_1.7.4.4.bb
@@ -5,9 +5,10 @@ HOMEPAGE = "http://www.dest-unreach.org/socat/"
 
 SECTION = "console/network"
 
-LICENSE = "GPL-2.0-with-OpenSSL-exception"
+LICENSE = "GPL-2.0-only & GPL-2.0-with-OpenSSL-exception"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
-                    file://README;beginline=257;endline=287;md5=82520b052f322ac2b5b3dfdc7c7eea86"
+                    file://README;beginline=257;endline=287;md5=82520b052f322ac2b5b3dfdc7c7eea86 \
+                    file://COPYING.OpenSSL;md5=5c9bccc77f67a8328ef4ebaf468116f4"
 
 SRC_URI = "http://www.dest-unreach.org/socat/download/socat-${PV}.tar.bz2 \
            file://CVE-2024-54661.patch \
-- 
2.34.1


