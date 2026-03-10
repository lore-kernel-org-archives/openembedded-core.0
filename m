Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B1C6FD2D72
	for <webhook@archiver.kernel.org>; Tue, 10 Mar 2026 12:57:58 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.39290.1773147477486589284
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Mar 2026 05:57:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FcNAribH;
 spf=pass (domain: gmail.com, ip: 209.85.221.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-4327790c4e9so10008381f8f.2
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Mar 2026 05:57:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773147476; x=1773752276; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=I8bEIf+d6ReWPWhGlPkosXOVVdoyWVQXyiMkAcYcUgg=;
        b=FcNAribH/1vot1b295xJwwKkNtGKDVoB8jL/Cl0YHl/BivHjqk+nT8s3+zBvPlxs/8
         Ssrf/dALNf3vYXGKXQGG+SxiegaJ0I8pEr0B6g8DjcaCwgpEL9t41uDUTsDOKfZj7pw9
         fEzmNUtiAyJHkHPvjnCi8Gep3qr95elUcseDshJiV3Phm6kVZh+HL+CgE5TDbR8jjOCb
         C/vE9rioPGxUxFbFDS+k5TqBhuApztOPwPdeuB7FOLZxo1GBFzcbyx8vYsDOhfP8Sk9B
         UMn9Em+8uWmeSbOoI/h8RDJ7Kbudrq4wGL7VPJ7pLCP/zvFnmg0EqJOmMMaaGBZ5mJnI
         pOuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773147476; x=1773752276;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I8bEIf+d6ReWPWhGlPkosXOVVdoyWVQXyiMkAcYcUgg=;
        b=NsBQlGA8dKHzHH2hnMzFy6CoJkAcGOT12GWafHveOhOliYF6MCAItM7zSgnWJjm7CQ
         PtgHJ5cPO2qVx2jGr/A+Ek12BKnDpGLfi1c4hh7nxg4o2Ynf290Yd5ewYa8S2iwS4SsH
         PkLUCyKFwvCeOsLHOhTiXvPqMxEOwdfuVw8nQ8jLwzku4zy6llV2WtiPNzpTIBqit+XU
         5ExL4d0mPQvaiGANZahGttu+GYFd94XMaCjeHi8Z9la0f1dDAYyS4u8/lVHtD6WGV6Ea
         bsW+XNYPieBIn8QaPof4OiWuLNLbqvvalNyq2dNmvw1LeHYttbrrClvo3R2iAZyO/p/K
         wleg==
X-Gm-Message-State: AOJu0Yxkti4l9kJ/3f8KkIQaZcKCtzPItjZZN2ujm8Gd5pv1v+8mQdik
	e9nRai5Q3uzUE/t9K5uFicXwesc/9dQ5FDNy73FSSMA2qrhnddGMrheZNL8EjQ==
X-Gm-Gg: ATEYQzx5Kev3k/27z1AE6uCUE7Xjhx3APWXXSDMHAOjVFU8CHULvf/zRp5DDOwrHOdu
	jw6/kom+YEXMqUX0HaVVlzeSNCHlkBe8jFuNcjAnUFJUgC8qJG5ePOCJWQYKuVLv0LPUp1E1gTu
	9mPsrTOdEP3qIf2YtTRb7aISNQhYbmn3/QBkexeZY1KceR/GvSfUAFfiRo9YPL9wH5RxHvLYZ4R
	e1WEAplPLLFTO+vgLA2THFDmiHlO85PLTzWvG9xacl5BIYUYPjV4PH77iq3jsFhc9aMME3Szh3S
	/KREZpxRs/APZ908xM504Mn7XmczxqCVWH2CU37ywtKVltDTzdlu6Gm11Dw0FTL9JGWnQi6b6Xo
	YwfT3LQctr0o7R8bQClTwrt+C/91/7gO3yevKO5MzTxcHlF9qHi3DcT+mx4TwWo0a9lRkOAPzr8
	ykhQqtLTIRYVyw8Ftb7VH6XHt24MociV2H2EHLHvIisG1FB2eAkxLSElB0wfY=
X-Received: by 2002:a05:6000:2881:b0:439:b744:c601 with SMTP id ffacd0b85a97d-439da894037mr24670830f8f.40.1773147475626;
        Tue, 10 Mar 2026 05:57:55 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dae57401sm29782290f8f.38.2026.03.10.05.57.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 05:57:55 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 1/3] libfyaml: inherit github-releases class
Date: Tue, 10 Mar 2026 13:57:48 +0100
Message-ID: <20260310125750.2240849-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Mar 2026 12:57:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232780

From: Alexander Kanavin <alex@linutronix.de>

This fixes the upstream version check for the newly added recipe,
as the default SRC_URI-minus-tarball page doesn't contain a list of releases.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-support/libfyaml/libfyaml_0.9.4.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/libfyaml/libfyaml_0.9.4.bb b/meta/recipes-support/libfyaml/libfyaml_0.9.4.bb
index c5f2ef30e2..77fe0a15b0 100644
--- a/meta/recipes-support/libfyaml/libfyaml_0.9.4.bb
+++ b/meta/recipes-support/libfyaml/libfyaml_0.9.4.bb
@@ -3,9 +3,10 @@ HOMEPAGE = "https://github.com/pantoniou/libfyaml"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=6399094fbc639a289cfca2d660c010aa"
 
-SRC_URI = "https://github.com/pantoniou/libfyaml/releases/download/v${PV}/libfyaml-${PV}.tar.gz"
+GITHUB_BASE_URI = "https://github.com/pantoniou/libfyaml"
+SRC_URI = "${GITHUB_BASE_URI}/releases/download/v${PV}/libfyaml-${PV}.tar.gz"
 SRC_URI[sha256sum] = "dac2b0af7b757b32a4fa7c6493d85d0f7dea6effd20ae4352570b6a450b9e5fb"
 
-inherit autotools pkgconfig
+inherit autotools pkgconfig github-releases
 
 BBCLASSEXTEND = "native"
-- 
2.47.3


