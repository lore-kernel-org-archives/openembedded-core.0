Return-Path: <fabien.thomas@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F800C5DF6E
	for <webhook@archiver.kernel.org>; Thu, 13 Aug 2026 15:22:34 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21612.1786634546686571393
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Aug 2026 08:22:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=J3VpPN8j;
 spf=pass (domain: smile.fr, ip: 209.85.221.52, mailfrom: fabien.thomas@smile.fr)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-47f96c5b722so1239621f8f.0
        for <openembedded-core@lists.openembedded.org>; Thu, 13 Aug 2026 08:22:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1786634545; x=1787239345; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=F15afBGJ2QP9GGqsAiijYxD3U75XQL7vcqfFaYY9vW4=;
        b=J3VpPN8jzhpUpR3TiNJFJ4kjfoKUOLzpPBwlhbDV2/4c1dd+VPAZWsqTs7olrazfSO
         kwrB7gMNbgOXERtnEfakkLXEds3HkjRSRU8yl2zRXSM3wknA+vuQRzjTMHxb2Uy3dNHf
         Kz3+CcLYw2SYIFxvFSNNFcX4DQ5xfrT6TCRCQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786634545; x=1787239345;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=F15afBGJ2QP9GGqsAiijYxD3U75XQL7vcqfFaYY9vW4=;
        b=MDnIj0DpXSRWGXHK4c526HGhQ1yTnRZkpZvZBnmBVntJRD9/6cOx5zYvD8ZqVcqDEV
         PNpQe+RokpKUFqqMgSWEkYHB+VhJdZUxDUDQoZXq7eNpdpEeSxof5M3G0/DCHYzmAjrT
         jbGSWN4WXh5V7ML8XMsI/MFvRZSINBrfeVEsb77TTReJNEBaLjKVfrgdBtOOB9FezNuF
         +YZ38JSTW4LqKuZ9YUhHiPEusyoZS3dG832puGRkm7WuvjMtd95FQfNrvBaKnCaNlO6V
         hBUm6nRI3dJ+nEKNuq6htn78xRHqsld8v7ibq0B7JZjzxtWz4aX9Kk0p1+RP7BI/3BJW
         Tohw==
X-Gm-Message-State: AOJu0YyHPibh1M9FNe2F/e/XPvV5GyMTmlyMDc4+S7YOXYRwjUi6RgZz
	UNo3dV3K3eWv7w+jPZ3dSNkHZs6ObczrH+fQ/Xy3XZ6irirGZoaGS7RYYM7/GVHM9bvRm7Af2id
	0pCzdcrAqZQ==
X-Gm-Gg: AR+sD13Soe+gAynt+MpSVAgwaLRkxpO9HMtvNhQyJyCadQx9y2ki0twNXZ5hoHZaPlE
	q7+/rs0YTzo7qZVBZrqFrYiUcJr58itz6YNPRl4ug0AaS50GR9ro37N18HgzraflDTve8B0CUbE
	3eXm7foae2ulAuPS22bIcv3GvbWeUz86MfHITlbJz2S4iee2c1eVrT10ig6IG0bOXJ7hr/oOQTI
	Q+r2D0Fj0cqRjgKbJnl5x6nBZd2NXBsK+3uTQQJQWiZR0LH20zGj/mIB883qKzADiQOQui+Rx3n
	r/61004vKVt8vkp9GuNyH/zqpJ7L/CBO0qRNKuGMygzktAPhc538Jud4yWqWaMZUzAS/CRkxKl3
	NLanQFMw+bnMU3zsKeIz1tj7qE9gSuKgiVWDtpyB2Hdb6PDDRWUK659zFnvFByZiLPGUXHxgipp
	zLspcEoZYZe9il5TACt078Iw0DuheoigQQ7CSiv6DCOgMDCYvESw+4sOsuVVUgGDupiCtpRxmc4
	1C4MUvimfwnQTZX6wCEUr03bMBi66pUd+dFVNPU94iGb/DPOLAPfZL0NKHpoNwbEz9xaHUaEl+y
	JOkr+bbySiHbtB64Vxzu395ArIhdWHt8jmsxq+SAqamFs8XXVEI5
X-Received: by 2002:a05:6000:61a:b0:47f:f20d:8d4f with SMTP id ffacd0b85a97d-48159eea130mr10351099f8f.18.1786634544898;
        Thu, 13 Aug 2026 08:22:24 -0700 (PDT)
Received: from FRSMI25-GIGUE (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4815f21a068sm110450f8f.12.2026.08.13.08.22.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 08:22:24 -0700 (PDT)
From: Fabien Thomas <fabien.thomas@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 04/17] python3-pyopenssl: set CVE_PRODUCT
Date: Thu, 13 Aug 2026 17:21:54 +0200
Message-ID: <9d4253c4fecdf17354779ca0ff198a0129d63ae4.1786633048.git.fabien.thomas@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1786633048.git.fabien.thomas@smile.fr>
References: <cover.1786633048.git.fabien.thomas@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Aug 2026 15:22:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243361

From: "mark.yang" <mark.yang@lge.com>

The pypi class default python:pyopenssl matches nothing in the CVE
databases, which have used four vendor spellings for pyOpenSSL over
the years:

* CVE-2013-4314 (jean-paul_calderone:pyopenssl)
* CVE-2018-1000807 (pyopenssl:pyopenssl)
* CVE-2018-1000808 (pyopenssl_project:pyopenssl)
* CVE-2026-27448, CVE-2026-27459 (pyca:pyopenssl in the CNA records,
pyopenssl:pyopenssl in the NVD CPEs)

Set all four vendor:product pairs. All five CVEs are fixed before
26.3.0 (the two 2026 ones in 26.0.0), so they resolve as not
affected.

Signed-off-by: mark.yang <mark.yang@lge.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit ba3d752e577004f871fe7f4235e2625410140a08)
Signed-off-by: Himanshu Jadon <hjadon@cisco.com>
Signed-off-by: Fabien Thomas <fabien.thomas@smile.fr>
---
 meta/recipes-devtools/python/python3-pyopenssl_26.0.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/python/python3-pyopenssl_26.0.0.bb b/meta/recipes-devtools/python/python3-pyopenssl_26.0.0.bb
index ca2ee93d29..43977d75b9 100644
--- a/meta/recipes-devtools/python/python3-pyopenssl_26.0.0.bb
+++ b/meta/recipes-devtools/python/python3-pyopenssl_26.0.0.bb
@@ -18,4 +18,6 @@ RDEPENDS:${PN}:class-target = " \
 "
 RDEPENDS:${PN}-tests = "${PN}"
 
+CVE_PRODUCT = "jean-paul_calderone:pyopenssl pyca:pyopenssl pyopenssl:pyopenssl pyopenssl_project:pyopenssl"
+
 BBCLASSEXTEND = "native nativesdk"

