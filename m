Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41D48C3600B
	for <webhook@archiver.kernel.org>; Thu, 27 Mar 2025 22:32:15 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web11.2012.1743114727163274313
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Mar 2025 15:32:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=BmJLWjwu;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43ce71582e9so11771465e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Mar 2025 15:32:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1743114725; x=1743719525; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=v/nsAb5srbs0rCz7IQfYFewhvB+/cAxKPOEjnaiP/hg=;
        b=BmJLWjwuHLoze4UaEbiGQ/OrWhT0moY6YeXCbCoiQCyuc5JY+9yNPFsEcA5hpGjfci
         PG1WsSBFkRm36RFH2gpE1aLZI27CaPG8IlwHMfjWpolRISrghg1r584KDvqFpXSWvbDV
         Wyfxu0FW511K5CiFmXoxsQM/3oDXYDfwbeZ2E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743114725; x=1743719525;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=v/nsAb5srbs0rCz7IQfYFewhvB+/cAxKPOEjnaiP/hg=;
        b=nhKqbXfdiVbGOr2CHXa4UetXMfCVcdwTSu4dxg3+LIGsWMLPvHZwjBxCQU7NbU1WhX
         EKMUil/SMP3DRP0yfCWeshe+0vcenzqqB11PWc3t1H9ZrCyWagZ1W7dSga2ESAW5/R55
         oHcriQv6ZtPxtVIzDt2qMUfl6xh9JJDBg7ASU6TrA35ON3JBq5Dfsa4L1yGuQ82ZXVAZ
         yNoBdhVchKqy8iSaRLq3t4Os1HrKxrgJZR6PSViQWTzzLBHcE1f7mMLvJIPpWfqhgHoX
         8HgTHsE7N6cYnDCTQcL/E3nn17Kp62gyBF/UfWjwoX2qfJ1dUzfLk/Qqm3RgkBOdnCRC
         vpkg==
X-Gm-Message-State: AOJu0Yx4Lk4SCRI3fiDUfuJVKHQKON48jnJct6KXGe3aVj0qElqNRmav
	EHMEhVIqrZX4SuACuqByNOUKO81zbqBcgU3F8kb+oIZSPGBj1aAG7ws+DWQahEu/F3DHwlBVUvS
	M
X-Gm-Gg: ASbGncsc6HshGYFCn8firf2IB7fca4z44X41oHLn4x4NXanDWIP5hiT9Vm1xCN1r9fO
	9qHbytHL+lnqVSJMEaf5U+WVlCuzEJUo4fpnBDDP1rinxxrajRIpZ4t4KF9YfeuQ5RKa/Ni0cUj
	jKzft3mnG0zkeMCVzJWxSK09B6j5SUjmDXUMIdM2NhQZZf1wqdikaCHxItj/9hKPLrWokySlavD
	nKfGj48tRfygvRZLGA+wXsqQSZjHo6+OT3x/3p7gknnS1pY9yBBSC4pT2ZABvgryO/CjRlhHU6B
	7VYf90rHn0y7uRYbyOiTY09GrYpQErHvKeX2Ny6wQQ/jkuO1IE6+KmGDyGvSra6yuap7LLxE8Z5
	uAAlFPlRV
X-Google-Smtp-Source: AGHT+IGbNPM+aQftRVmzdOyanol8vaTdMXxdsjrqeFOJhU6JQxanlvbQL4rneOfbhpwN5X9mOvkORw==
X-Received: by 2002:a05:600c:1604:b0:434:fa55:eb56 with SMTP id 5b1f17b1804b1-43d8522cca1mr42708775e9.7.1743114724618;
        Thu, 27 Mar 2025 15:32:04 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:d200:1d89:496d:2f28])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d8314b9e9sm50870585e9.37.2025.03.27.15.32.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 15:32:03 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] expat: Upgrade 2.7.0 -> 2.7.1
Date: Thu, 27 Mar 2025 22:32:02 +0000
Message-ID: <20250327223202.1224045-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Mar 2025 22:32:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213800

Includes a fix for a regression from the fix for CVE-2024-8176.

License-Update: Copyright years change only

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/expat/{expat_2.7.0.bb => expat_2.7.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-core/expat/{expat_2.7.0.bb => expat_2.7.1.bb} (86%)

diff --git a/meta/recipes-core/expat/expat_2.7.0.bb b/meta/recipes-core/expat/expat_2.7.1.bb
similarity index 86%
rename from meta/recipes-core/expat/expat_2.7.0.bb
rename to meta/recipes-core/expat/expat_2.7.1.bb
index f3659d9f909..2da15329221 100644
--- a/meta/recipes-core/expat/expat_2.7.0.bb
+++ b/meta/recipes-core/expat/expat_2.7.1.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/libexpat/libexpat"
 SECTION = "libs"
 LICENSE = "MIT"
 
-LIC_FILES_CHKSUM = "file://COPYING;md5=7b3b078238d0901d3b339289117cb7fb"
+LIC_FILES_CHKSUM = "file://COPYING;md5=f4fedd6116da0e171f7cb4d2923d7ac2"
 
 VERSION_TAG = "${@d.getVar('PV').replace('.', '_')}"
 
@@ -15,7 +15,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/R_${VERSION_TAG}/expat-${PV}.tar.bz2  \
 GITHUB_BASE_URI = "https://github.com/libexpat/libexpat/releases/"
 UPSTREAM_CHECK_REGEX = "releases/tag/R_(?P<pver>.+)"
 
-SRC_URI[sha256sum] = "10f3e94896cd7f44de566cafa2e0e1f35e8df06d119b38d117c0e72d74a4b4b7"
+SRC_URI[sha256sum] = "45c98ae1e9b5127325d25186cf8c511fa814078e9efeae7987a574b482b79b3d"
 
 EXTRA_OECMAKE:class-native += "-DEXPAT_BUILD_DOCS=OFF"
 

