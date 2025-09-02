Return-Path: <tim.orling@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF889CA1009
	for <webhook@archiver.kernel.org>; Tue,  2 Sep 2025 21:47:00 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web10.89800.1756849607926907175
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Sep 2025 14:46:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=r/qDB7Wv;
 spf=pass (domain: konsulko.com, ip: 209.85.210.179, mailfrom: tim.orling@konsulko.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-7725fb32e1bso2705169b3a.1
        for <openembedded-core@lists.openembedded.org>; Tue, 02 Sep 2025 14:46:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1756849607; x=1757454407; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HSjoGMiHwhFIcGRiA6xbCBqvfWPXkuinOLYQL0zl9c8=;
        b=r/qDB7Wvcb3wmYKoaA1bUmh943GMRxhSMr+Y6zQnCNcxiORAcyJ1hZJyT82JQ8AuvI
         YUq+Axt5AoHQVG8ifurRqnldoO+b0xGUJspkFfCRCscW+BCHOIfioKkxxqLcsTz3TmSW
         SvV7Z6QRx5cp8Myaw18fx0DabKzrqLtTYS8Ik=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756849607; x=1757454407;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HSjoGMiHwhFIcGRiA6xbCBqvfWPXkuinOLYQL0zl9c8=;
        b=vkvGPZ8rfDMFmMFGBK89/GbjvsfiBAM8lCyFl+t+aew9n4QFZg+WM9+NhXY9aBgNtK
         evZmok7tYLQrutJskTJkfqxWKrdA6UK5gppvWOsjomNPk5c+jep/4xSBBgyAIgL8QQQA
         vXutGO375A0vFPsij1oDZ8WucA+7rrwcsQXaIggyMSBARuvC9WSZ4mYhzzblBlMf11ak
         iZ3BKXuKIJYqxEQpgcmL+Wg8GkV95m71PXtvi0Tx4RwMYloIiQyxhVmTDzsNKB6Ax5Vn
         hQhybe57wfA9g47qFdbXEhvTNvy5y9bsxbCe3sd5BNHK3W0g8Y5tUublsYSQired8Wmt
         Qnwg==
X-Gm-Message-State: AOJu0YzWhUV4d4/wBykp+WOIJphfUd/EcMS1ot5cR4JkyKfKoAJRW678
	6UjD0CoJ3MrsrQzI/84gBMZ0ZFzDvIREF1qaEcjS0XR5aQg7yglXC7J1V1g0BghmoJzguRFS715
	j8TFn4EA=
X-Gm-Gg: ASbGncs5qoLVERIvIu11kD5uzuaZBjgPeKqr3F/aZ9GsgtHDt07V9h52ab3APGEP3Db
	RNetkLCsTpeNR1YOAR8NGU5IYpuruR3QdmS++cG/JW+gmGZbIkyFQh9Jk0wNoTSiiCqVD+MlVPQ
	Qe37p7CgE618bo3kpeHCdO0FW2VE8mYHgiH3JN7ATCvOP6RbRypWuqPUDJUeEdKUIsOXJZZmr5F
	VUcFNBNd7X/HFNoMZKP3OtxrJX7F916WayUNQNU2OpTlVpv2FT/j0PR/YWUnJMou1C3IZQxpkgF
	0oAy2zMs3J66jCWyWtA0nBWQ1DLTPEujYd7Ui6Bpn08Uu/SUUq/eSmz3tWecOt5Eb7aPZbRzrYe
	TFcDe6Bvkt5doRrwAWTVcGBpijAvglzM1Sepa5r5sGTDzQc5vYfncBIpz1rZfyUCpDaW6/Qrd
X-Google-Smtp-Source: AGHT+IHeTm4n0pGGgeviLzn63fg9kQLRtURHRqwIfL7IQWlq0ajuzNZYZXyQ0/hXG1+4yclWGZ2ysg==
X-Received: by 2002:a05:6a20:9389:b0:240:750:58d with SMTP id adf61e73a8af0-243d6e5ef41mr18257085637.27.1756849606830;
        Tue, 02 Sep 2025 14:46:46 -0700 (PDT)
Received: from localhost (c-98-232-159-17.hsd1.or.comcast.net. [98.232.159.17])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b4cd092e2aasm12774332a12.21.2025.09.02.14.46.46
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 14:46:46 -0700 (PDT)
From: tim.orling@konsulko.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/6] python3-cryptography{-vectors}: upgrade to 45.0.7
Date: Tue,  2 Sep 2025 14:46:26 -0700
Message-ID: <1ed84e2cf38c5417bdde7298572756c9038eb674.1756849390.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1756849390.git.tim.orling@konsulko.com>
References: <cover.1756849390.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Sep 2025 21:47:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222749

From: Tim Orling <tim.orling@konsulko.com>

45.0.7 - 2025-09-01

* Added a function to support an upcoming pyOpenSSL release.

https://github.com/pyca/cryptography/blob/main/CHANGELOG.rst#4507---2025-09-01

Comparing Changes:
https://github.com/pyca/cryptography/compare/45.0.6...45.0.7

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
All ptests pass on qemux86-64 for core-image-ptest-python3-cryptography

 meta/recipes-devtools/python/python3-cryptography-common.inc | 2 +-
 meta/recipes-devtools/python/python3-cryptography-vectors.bb | 2 +-
 meta/recipes-devtools/python/python3-cryptography.bb         | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/python/python3-cryptography-common.inc b/meta/recipes-devtools/python/python3-cryptography-common.inc
index 874f60bf834..bcb907b6450 100644
--- a/meta/recipes-devtools/python/python3-cryptography-common.inc
+++ b/meta/recipes-devtools/python/python3-cryptography-common.inc
@@ -3,4 +3,4 @@
 #
 # Additionally AUH will detect that they share this .inc file and
 # perform a lockstep upgrade for both.
-PV = "45.0.6"
+PV = "45.0.7"
diff --git a/meta/recipes-devtools/python/python3-cryptography-vectors.bb b/meta/recipes-devtools/python/python3-cryptography-vectors.bb
index b6b0e38f2e9..e845486a94e 100644
--- a/meta/recipes-devtools/python/python3-cryptography-vectors.bb
+++ b/meta/recipes-devtools/python/python3-cryptography-vectors.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=8c3617db4fb6fae01f1d253ab91511e4 \
 # NOTE: Make sure to keep this recipe at the same version as python3-cryptography
 #       Upgrade both recipes at the same time
 require python3-cryptography-common.inc
-SRC_URI[sha256sum] = "068cee15423f3f1633ca04f12284385ac404c19366e7ccb3b680156c1aa9c573"
+SRC_URI[sha256sum] = "48e71fc4ac5f6298b2de53a99726ddc4a9e5ef0a94d921820109e7b90baf9f56"
 
 PYPI_PACKAGE = "cryptography_vectors"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
diff --git a/meta/recipes-devtools/python/python3-cryptography.bb b/meta/recipes-devtools/python/python3-cryptography.bb
index c4204712f23..55fdf13972e 100644
--- a/meta/recipes-devtools/python/python3-cryptography.bb
+++ b/meta/recipes-devtools/python/python3-cryptography.bb
@@ -11,7 +11,7 @@ LDSHARED += "-pthread"
 # NOTE: Make sure to keep this recipe at the same version as python3-cryptography-vectors
 #       Upgrade both recipes at the same time
 require python3-cryptography-common.inc
-SRC_URI[sha256sum] = "5c966c732cf6e4a276ce83b6e4c729edda2df6929083a952cc7da973c539c719"
+SRC_URI[sha256sum] = "4b1654dfc64ea479c242508eb8c724044f1e964a47d1d1cacc5132292d851971"
 
 SRC_URI += "file://0001-pyproject.toml-remove-benchmark-disable-option.patch \
             file://check-memfree.py \
-- 
2.43.0


