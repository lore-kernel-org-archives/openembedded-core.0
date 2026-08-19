Return-Path: <fabien.thomas@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18B06C5DF8A
	for <webhook@archiver.kernel.org>; Wed, 19 Aug 2026 15:57:41 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10315.1787155059110225752
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Aug 2026 08:57:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=GfkP1V7K;
 spf=pass (domain: smile.fr, ip: 209.85.221.49, mailfrom: fabien.thomas@smile.fr)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-47fe377a217so720011f8f.1
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Aug 2026 08:57:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1787155057; x=1787759857; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=a38oYNfAvgQasLLBAn/Q70M2hMSHxIKLPvr4j4NNWpk=;
        b=GfkP1V7KGsOm6h3NL3h+tTzw4vTgrv3DctMrmfJ9UEQSo3J3w1QRy7mWiTx1/dUG5p
         0f9Y/DOsIgGaJiq8wdOU/+DIrT/GHRLFUQKHAwJojaz301CJWI335ZU1Dp6h6WsKTzHW
         Y0RiR3YljIdItnu6gpM5y8dCUZlbSpQCA9zZw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787155057; x=1787759857;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=a38oYNfAvgQasLLBAn/Q70M2hMSHxIKLPvr4j4NNWpk=;
        b=iFNy9mS+atTBS2pb38jHbAbIgV04pZaM2SQ5VVWkbawsphUejvsYm8QmFMsqBcepAo
         sC1Ybs8G3IfnzXbRQm3e7wYKlfSIy2GW61YA1MFKyCDVvcWuYrcThyDvBvYh8/weYCrs
         UZcZgK1/l5kLUhaBH8gLFlxk5oj9vn/1rMWdXBuhx38wuMXdHuSGUfL8okOnCJj3HIFP
         g9+iQYazHdJ+RTUiUDegLihZ7FkGYgknlq2un2zKY3UQr8jsKZR13iZ1Uaj7swC3zWwU
         dJDzCBiNSh73JDAzuC1dxcnglkE4egU5NKCdS7yDawcV0UdznW9WXwt+yM9QH2/J9zDI
         y2sQ==
X-Gm-Message-State: AFuF++kVpJ/8VUMDISd/HGl3YQM3cBZhKolk8HHyzhp3LipPO5xEEPRQ
	vt3QLpzAby/ASXvIhm6/yU6nscpcXMIBIuYVXWNpC/Ol2yjdY3znqN9cv7jS14RYR8LHyB4bCfI
	j8C3qmWQ=
X-Gm-Gg: AR+sD12AsYv9t/gRq2yZtKAx5HSIgHGr9Gh+iQ+zZVZAmcZeCCYb2YA2FvIzHtuZImJ
	LJ9j5Quau8PsuVY23lFCY7sNlKIvx4HfsrzIkw4z6Dy9c09CtuhJhCA29JDbsqOtrGYoLRQLURc
	lp32B5nbWVibBX7WBi22NRqfuvlLtoRawlQudBVsMdW4GFp9+UToOA5T1mXi8RGNOjI4nDysiWh
	y6slaCgP5dpG4PMBl31rvm/XzleeoFQEIu2OY8mbHaEQqg/tiEuldR0Mz0u+rZqjX8+EDLigXHT
	AAAm5FoOAtj46mosqPoV09EL0mlscg1UrVtf9TvHJDQhTBFiHJYOU01WqKF6mTbTHJlV6drYsUW
	LdHNVEbh+ytiAFceCy65z31VWS9HGoEQjOSflcRfQKaTdRfAmpVSRL0NVyKU5VitoEHXA6sGWSP
	DMy75hSY+S5tIKoNT8EZ2UtfjRgSnUrhn+JwVRBYRrQ/iLHbP2NGOj///04tzBAKHns+1HZGY8o
	Itj39M7rf6KD1Bq0+3ZgwBsTOyKD2DTGxNn0Ytz2Bbn7zRd8DDczE3fOw6e70k32mzCYpDH3/wf
	zX3Fj4+e/u9uJIXhJLYqBax9bVIZLdpM92Ulu7i0
X-Received: by 2002:a05:6000:4029:b0:481:5003:c654 with SMTP id ffacd0b85a97d-482b1e95911mr9632390f8f.7.1787155057329;
        Wed, 19 Aug 2026 08:57:37 -0700 (PDT)
Received: from FRSMI25-GIGUE (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482b14d05a6sm7215698f8f.35.2026.08.19.08.57.36
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 08:57:37 -0700 (PDT)
From: Fabien Thomas <fabien.thomas@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 03/37] python3-certifi: set CVE_PRODUCT
Date: Wed, 19 Aug 2026 17:56:34 +0200
Message-ID: <7fde1db72b213e6828f2e30ae8304ee506cdb649.1787154074.git.fabien.thomas@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1787154074.git.fabien.thomas@smile.fr>
References: <cover.1787154074.git.fabien.thomas@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Aug 2026 15:57:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243739

From: "mark.yang" <mark.yang@lge.com>

NVD tracks certifi as certifi:certifi, so the default python:certifi
vendor prefix never matches and its CVEs are not evaluated at all.
Use the exact vendor:product pair.

For scarthgap, python3-certifi is 2024.2.2. CVE-2024-39689 affects
certifi versions before 2024.7.4, but this recipe already carries
CVE-2024-39689.patch. With this mapping, cve-check can evaluate that
existing backport against the correct NVD product instead of missing
the CVE mapping.

Note: Original commit was for python3-certifi_2026.2.25.bb. This is
adjusted for scarthgap where recipe version is
python3-certifi_2024.2.2.bb.

(From OE-Core rev: e6773f4c819544eae93f3efa7d2101b448db4ebb)

Signed-off-by: mark.yang <mark.yang@lge.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 26c49743ec431a3cc39803664eec8851be75756e)
Signed-off-by: Himanshu Jadon <hjadon@cisco.com>
Signed-off-by: Fabien Thomas <fabien.thomas@smile.fr>
---
 meta/recipes-devtools/python/python3-certifi_2024.2.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/python/python3-certifi_2024.2.2.bb b/meta/recipes-devtools/python/python3-certifi_2024.2.2.bb
index 116add2079d..b3d6cf080cc 100644
--- a/meta/recipes-devtools/python/python3-certifi_2024.2.2.bb
+++ b/meta/recipes-devtools/python/python3-certifi_2024.2.2.bb
@@ -12,6 +12,8 @@ SRC_URI += "file://CVE-2024-39689.patch \
 
 SRC_URI[sha256sum] = "0569859f95fc761b18b45ef421b1290a0f65f147e92a1e5eb3e635f9a5e4e66f"
 
+CVE_PRODUCT = "certifi:certifi"
+
 inherit pypi setuptools3
 
 BBCLASSEXTEND = "native nativesdk"

