Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96E2AC61DD9
	for <webhook@archiver.kernel.org>; Fri, 28 Aug 2026 13:49:23 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1071.1787924960635505213
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Aug 2026 06:49:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=c1212SEA;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-49b0dbfbf7bso6648625e9.2
        for <openembedded-core@lists.openembedded.org>; Fri, 28 Aug 2026 06:49:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1787924959; x=1788529759; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=oGbz04xy+O32YxcmuDqWgi5DKslQwPbF0QUYFxCo73k=;
        b=c1212SEA9upuxxbGiINjXD44pXn7/OsXgUvx6y9ozGTkPGb0yvGqAveDRgqGTsAttU
         SKPccqBfDpBtaZ958uWAkOpf4YoAjPbvwf36eMEoPGYjlhT1zCOLvjpHJ0/X7QjVI2j6
         0nH2AORFx69b7cM6ihszls7wYKvKTjb5cyB2o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787924959; x=1788529759;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=oGbz04xy+O32YxcmuDqWgi5DKslQwPbF0QUYFxCo73k=;
        b=J6vVqt2wcJ38w06QZ4iTKi46KA+glbFr2Ow7rq2RiPfxb4RsVbOV05eMqoDhpOIygQ
         wTg33hQhytYgqzL6C6aK9lC7K4PMp1ff12y1ys6kwQ5mG4K0Y8oqZXF4kSJmUzk9gLEi
         B9/bpeeWqiZEeDi1Wiyh8hdDsUptr7n18wmxCgorU4XAOM+MmIzcgTIoeVit/RKuCodS
         Ljkud2+oU9dLiHGAttG3LtML/6LeSBOhkZlwFRP22JI8+iJZR23WE3YQyQkuKpvCvqRu
         EDYmLMJyaqShVpJf8tUrOsZ2xcc+t5QY+taGExvUI7IrtYaEJIJKjSb3/RD5Juj0RgCB
         rZcA==
X-Gm-Message-State: AFuF++lx+XarbNgO1w1jOxMYyZM3KS/qgFSHVQ1Yj09u4zQsrMX3LrTN
	NxTDZ8k5cS7mLDXrX7UPfNmxo5mDl3qtGI4caL8qoUxmqOPj6iUmlAFchZHgLDhHTBk4tvtYAqX
	tvHTDSvk=
X-Gm-Gg: AR+sD12RYH6g5Bg6YNZvqEyeEKtcZy3Z3MtoCS+rnrl4pGii0nh049Nb362h53BHjAi
	leXw2wKY8MNd/uxjuKVBRjER7CFIpxL1t9kSaSudigeB2CBJJz4HPhnvoBkzPYtcoayknSnqccX
	FZNz9lzcnfOKHqbR7u0JBA0UfoKGKZUnGRbukL8KkMgcqLxkIjGbyYLhvFCEWU9y5kgcIQ2Lbbt
	ZwPSmGeO8MG4ta5EXql4PKbPiMr/qo1LLEh04HYZTs1/poWGgs9nntWqVfKMDT8F2Dp/9bTi6No
	VeAcbwKS1/Lr4qG1ayOckcZ3sXddmpuyAh8VnKajaBFd3ia7nV+//CCynIYH9j2lrj8BDwrgo8r
	dLjGJ27nsyBPv/zcYrBxGZPedqw/k+NM7X8bbNp/1O7BzoISzWji0pmkNJrCDQRjSBDC+NJVkKm
	O5Gxhv1TjbWQdAS2sIpVOjUrlqGuvZV3hz7g/+kIEVeUYN64LnC+XXDzNkfsvc1E3nk7p9kMCuL
	BJjwABMtu8tirv4meEuSoHmEKlo
X-Received: by 2002:a05:600c:4715:b0:499:cd34:f7c with SMTP id 5b1f17b1804b1-49b91c26a01mr102785275e9.5.1787924958932;
        Fri, 28 Aug 2026 06:49:18 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:c3f1:c7b4:8368:83c1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b91ca11d0sm56144815e9.1.2026.08.28.06.49.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 06:49:18 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/3] lttng-ust: 2.15.1 -> 2.16.0
Date: Fri, 28 Aug 2026 14:49:11 +0100
Message-ID: <20260828134914.1288180-3-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260828134914.1288180-1-richard.purdie@linuxfoundation.org>
References: <20260828134914.1288180-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Aug 2026 13:49:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244544

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../0001-lttng-ust-common-link-with-liburcu-explicitly.patch    | 2 +-
 ...1-python-lttngust-Makefile.am-Add-install-lib-to-setup.patch | 2 +-
 .../lttng/{lttng-ust_2.15.1.bb => lttng-ust_2.16.0.bb}          | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-kernel/lttng/{lttng-ust_2.15.1.bb => lttng-ust_2.16.0.bb} (96%)

diff --git a/meta/recipes-kernel/lttng/lttng-ust/0001-lttng-ust-common-link-with-liburcu-explicitly.patch b/meta/recipes-kernel/lttng/lttng-ust/0001-lttng-ust-common-link-with-liburcu-explicitly.patch
index d9cf861dbc2..6a9f7cc31f5 100644
--- a/meta/recipes-kernel/lttng/lttng-ust/0001-lttng-ust-common-link-with-liburcu-explicitly.patch
+++ b/meta/recipes-kernel/lttng/lttng-ust/0001-lttng-ust-common-link-with-liburcu-explicitly.patch
@@ -1,4 +1,4 @@
-From 182cb1e754e861a4eff4bde3919bc32462e3072c Mon Sep 17 00:00:00 2001
+From 3d9cfc77caca0624c8018542167cc7c79bf6e857 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Sun, 5 Sep 2021 10:44:19 +0200
 Subject: [PATCH] lttng-ust-common: link with liburcu explicitly
diff --git a/meta/recipes-kernel/lttng/lttng-ust/0001-python-lttngust-Makefile.am-Add-install-lib-to-setup.patch b/meta/recipes-kernel/lttng/lttng-ust/0001-python-lttngust-Makefile.am-Add-install-lib-to-setup.patch
index 733a4de456e..f193e306f0e 100644
--- a/meta/recipes-kernel/lttng/lttng-ust/0001-python-lttngust-Makefile.am-Add-install-lib-to-setup.patch
+++ b/meta/recipes-kernel/lttng/lttng-ust/0001-python-lttngust-Makefile.am-Add-install-lib-to-setup.patch
@@ -1,4 +1,4 @@
-From cd2fbbf5454af7c0910549e841b5da7a1b133a89 Mon Sep 17 00:00:00 2001
+From 25efcd5efd9e57fa8e0ad251000c8586b6fdfe22 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Tue, 20 Feb 2024 12:19:06 +0000
 Subject: [PATCH] python-lttngust/Makefile.am: Add --install-lib to setup.py
diff --git a/meta/recipes-kernel/lttng/lttng-ust_2.15.1.bb b/meta/recipes-kernel/lttng/lttng-ust_2.16.0.bb
similarity index 96%
rename from meta/recipes-kernel/lttng/lttng-ust_2.15.1.bb
rename to meta/recipes-kernel/lttng/lttng-ust_2.16.0.bb
index 5d2ce3d0b44..abc701cb79d 100644
--- a/meta/recipes-kernel/lttng/lttng-ust_2.15.1.bb
+++ b/meta/recipes-kernel/lttng/lttng-ust_2.16.0.bb
@@ -35,7 +35,7 @@ SRC_URI = "https://lttng.org/files/lttng-ust/lttng-ust-${PV}.tar.bz2 \
            file://0001-lttng-ust-common-link-with-liburcu-explicitly.patch \
            "
 
-SRC_URI[sha256sum] = "37c9b58ea7aa7bc47d6630b52ba1a48ebce095b9a196eab4ddd273d78301792d"
+SRC_URI[sha256sum] = "1e84e02fa1fc1261eb6cf3d14d64006506a29f7c605ac85de02180318c6aa38a"
 
 CVE_PRODUCT = "ust"
 

