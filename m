Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FD54C83F17
	for <webhook@archiver.kernel.org>; Mon, 14 Jul 2025 16:23:33 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web10.82433.1752510203876152511
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Jul 2025 09:23:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=jvxXxOPl;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.170, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-7426c44e014so4303171b3a.3
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Jul 2025 09:23:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1752510203; x=1753115003; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JyzlmpQfVmFCI14CpFjyvFx2OQiUbkBJhYfjc381/+4=;
        b=jvxXxOPl2XT8trcGzsV9OocGvnvjt8RqdVjUxsBqo/T2CiMC4KThipxvfoP7f7rM05
         jWioHriOx20C3MO+PV5lZibvJMIqrUxtI0pBYbMQtkwLH0J+9Qb4NRIp6s03+YE1FcwH
         nTT8rr3ueaJf8o/TQ+NxLxpM78wFN0rj2bb84/F8A5HuZPGjOe06bpc5kupNsqbLAboR
         0Rf9r11/RvatFasF3jZnzM/Pwde7WiCrkva6/RtloqZfPbR+LmVGjPCAr1i6d9FmCk2v
         m2tOvafBbhweZ95cX94X4BhGhLBptY2rMDWPDpT2k1Qf07KFl8gaXmLov3KLAKYqyEGo
         xmLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752510203; x=1753115003;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JyzlmpQfVmFCI14CpFjyvFx2OQiUbkBJhYfjc381/+4=;
        b=kHCGZrZiPICrCuMQ1jbfz7ii/srcvkhfugTBihK9vJzRwyZQV7RyRL0ScKG8Uqp9GN
         h7EuTnp42gGee8Yk2Qt5GZhLIBcM8mnOcRoxypNQ3oX4SG7qWHgOfxJBpW0cD12Y2ZNw
         2U6LjbpF4C08m/r3nEkHWS6Fv8N6BcqwjPwA1Nl6pQpfqO7Xs7FpHJR5iXlNylPKvh46
         h3bGAoYTxsvm0CjrQ2hUMtQL19fznWhfpl7UtXy30LmR0T0xCuB72HDLkPlrF16vz++u
         J4IWNecQ/MD3M7jf4iMfHTqwMFKJTlY4SjIw4foshkfD9laeMJs2N5Yl6vQbIxUxKzWW
         urSA==
X-Gm-Message-State: AOJu0YxVFGfdgRWO6CDzK9KGhqdSMelE89d7VFr5V71eY1aw2Xk3M2t6
	CmBac+aJqlrZRuCp6ydiQ9cBpEOysOuZ62fdpOqsXrR9QOVu1GR++xMAMwyB8XGU1q+aVJwX9Pp
	TtoHc
X-Gm-Gg: ASbGncuRlHaxLNjY68m0/VvzaGMxnHO/cWxsVtgCThEQoX62h8j4DLjUQtcoJL1W2xf
	rs21rEWtaRYVNSxnvSG57PIttaR/xFOco7Is2jYZcnLwu7e6efXHIduDKKlLAKxnzdKC2Wg5oZN
	StZmpEC01bJ2ZKD1pZszxja1N6rfC0fFmpX2cV8WiSX92xhFd7SsPwxH6A15+jFncv07XT+iIbe
	2m+uO5HSJ+AclFtmT0v/tH+jGWlJhlDewnjLaA/Ak5470sOdgZvD3AftEfgVEXAw7r8AMhRo+zA
	ZtvZDrckNo80yrvyOOW11KcyrJhkUS+da+SY225lSK9c3grJPB6wDpzZkSobsO0cQ7+8fk2jtzf
	Ind3y9OnTtRlG
X-Google-Smtp-Source: AGHT+IHNzvegjoIHoPgaTotS1kzNuzzxxbdTbxmkAhVWqCF83F1kyqJ9RPVxdRlN6GMLaT05ccK1/Q==
X-Received: by 2002:a05:6a00:218a:b0:742:a82b:abeb with SMTP id d2e1a72fcca58-74f1beec959mr17330651b3a.2.1752510203064;
        Mon, 14 Jul 2025 09:23:23 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:4aa7:6b72:b465:3a4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74eb9dd5e8fsm10456053b3a.29.2025.07.14.09.23.22
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jul 2025 09:23:22 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 05/15] python3: update CVE product
Date: Mon, 14 Jul 2025 09:22:59 -0700
Message-ID: <8659e3537facbf3f5f5a5080137be4d9faf9c970.1752509862.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1752509862.git.steve@sakoman.com>
References: <cover.1752509862.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Jul 2025 16:23:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220243

From: Peter Marko <peter.marko@siemens.com>

There are two "new" CVEs reported for python3, their CPEs are:
* CVE-2020-1171: cpe:2.3:a:microsoft:python:*:*:*:*:*:visual_studio_code:*:* (< 2020.5.0)
* CVE-2020-1192: cpe:2.3:a:microsoft:python:*:*:*:*:*:visual_studio_code:*:* (< 2020.5.0)
These are for "Visual Studio Code Python extension".

Solve this by addding CVE vendor to python CVE product to avoid
confusion with Microsoft as vendor.

Examining CVE DB for historical python entries shows:
sqlite> select vendor, product, count(*) from products where product = 'python' or product = 'cpython'
   ...> or product like 'python%3' group by vendor, product;
microsoft|python|2
python|python|1054
python_software_foundation|python|2

Note that this already shows that cpython product is not used, so
CVE-2023-33595 mentioned in 62598e1138f21a16d8b1cdd1cfe902aeed854c5c
was updated.
But let's keep it for future in case new CVE starts with that again.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/python/python3_3.13.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3_3.13.4.bb b/meta/recipes-devtools/python/python3_3.13.4.bb
index 5b49fee3bf..0a2c41cdce 100644
--- a/meta/recipes-devtools/python/python3_3.13.4.bb
+++ b/meta/recipes-devtools/python/python3_3.13.4.bb
@@ -41,7 +41,7 @@ SRC_URI[sha256sum] = "27b15a797562a2971dce3ffe31bb216042ce0b995b39d768cf15f784cc
 # exclude pre-releases for both python 2.x and 3.x
 UPSTREAM_CHECK_REGEX = "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"
 
-CVE_PRODUCT = "python cpython"
+CVE_PRODUCT = "python:python python_software_foundation:python cpython"
 
 CVE_STATUS[CVE-2007-4559] = "disputed: Upstream consider this expected behaviour"
 CVE_STATUS[CVE-2019-18348] = "not-applicable-config: This is not exploitable when glibc has CVE-2016-10739 fixed"
-- 
2.43.0


