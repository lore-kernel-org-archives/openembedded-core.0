Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3240C77B79
	for <webhook@archiver.kernel.org>; Sat, 15 Apr 2023 15:27:07 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web10.10502.1681572424358936387
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Apr 2023 08:27:04 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=EkHEMe6+;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.178, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f178.google.com with SMTP id d15so4017840pll.12
        for <openembedded-core@lists.openembedded.org>; Sat, 15 Apr 2023 08:27:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1681572423; x=1684164423;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h9xAJm7ZWkbYRCZ0+V5WkNnbB1jIfjxUB/0WEj2sqd8=;
        b=EkHEMe6+uNguyvIO8H8cEBx2eBkfSgPxj0HJHW46CUBUOksD7wBbWlpTvJc2ruxrfu
         1bbnTTsivNO03vGB9quyUwmedG/DoZSFYBVXqtj3Jnp3DdeX9v9ecrx5oF9u3sKGSMdo
         f/2nynLvShdksHZS16RmGgS/0ZqevpeH5uimN2/6IE0eD60rm3F6fBs3XbaSkEErxjrB
         XKHxkvJmuJqIv9KSj6VnjgkAfrkKBRyuFWGoRa49y/iSUlCr6dIMFgPWqi2zVUVIWZ+C
         PjDDGoxcM1H07dxoVTU5WqsOr5rsxl0JkcmGiOYGU5aSmCsfRD0FnHJB+zXhVw3HPi/f
         Oy0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681572423; x=1684164423;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h9xAJm7ZWkbYRCZ0+V5WkNnbB1jIfjxUB/0WEj2sqd8=;
        b=BfNpJ8xOhFp7DLNLsf5Qz8M38pri0We885gHrH69aU0czSJ/vs4yD6g3sKV+889Qs6
         XzvQQpzcgr3XJ62/ICI+WRLM8qkV2pM3E+lyXgoJ5d4yQJeHOF1jEJrJBduk0qiAdD5T
         1X7rFkI8JHjSdKTfTN/HsqMRQEUlQQw9GjuG3WJDNwCXCp6E3EDPF9z5oT8xZF9KaFiO
         cQjVGZlg8Q2KIhS/3zK99gJ+UUAmRFO/SUi/5uNOckUWhswwjGuNzsIgVJRnrks4RaeD
         3KirrbEdA+UeqmUpuK490c/AVH3zMEA/d9ZkGnircrQy+APN/vpKtZRBR96Eeg5dQKKW
         v61g==
X-Gm-Message-State: AAQBX9devodFp7vI8R8xHmEEYRDfJUfDnYz5ZdLkNQu0/IHTu0ivPIW0
	rrGyT9PD0OSGR+a9mnYBazFd9qrJ4SOkcPD3NAM=
X-Google-Smtp-Source: AKy350afI88EHEr7UiRu7f4dljRh2Uv8JwAalBA/SzzxVy+38UtBAz0IEZzFqwObpXzmjtrmiYr3qQ==
X-Received: by 2002:a05:6a20:a10f:b0:ec:a118:6471 with SMTP id q15-20020a056a20a10f00b000eca1186471mr9689077pzk.50.1681572423447;
        Sat, 15 Apr 2023 08:27:03 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id u22-20020aa78496000000b0063b1e7ffc5fsm4824410pfn.39.2023.04.15.08.27.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Apr 2023 08:27:03 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 4/7] tiff: Add fix for CVE-2022-4645
Date: Sat, 15 Apr 2023 05:26:41 -1000
Message-Id: <d1aa26fe8170937508a4d2242001892cea84d29a.1681572283.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1681572283.git.steve@sakoman.com>
References: <cover.1681572283.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Apr 2023 15:27:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180014

From: Pawan Badganchi <Pawan.Badganchi@kpit.com>

Below patch fixes the CVE-2022-4645 as well.

0001-Revised-handling-of-TIFFTAG_INKNAMES-and-related-TIF.patch

Link: https://nvd.nist.gov/vuln/detail/CVE-2022-4645

Signed-off-by: Pawan Badganchi <Pawan.Badganchi@kpit.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...evised-handling-of-TIFFTAG_INKNAMES-and-related-TIF.patch | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-multimedia/libtiff/tiff/0001-Revised-handling-of-TIFFTAG_INKNAMES-and-related-TIF.patch b/meta/recipes-multimedia/libtiff/tiff/0001-Revised-handling-of-TIFFTAG_INKNAMES-and-related-TIF.patch
index 37859c9192..17b37be041 100644
--- a/meta/recipes-multimedia/libtiff/tiff/0001-Revised-handling-of-TIFFTAG_INKNAMES-and-related-TIF.patch
+++ b/meta/recipes-multimedia/libtiff/tiff/0001-Revised-handling-of-TIFFTAG_INKNAMES-and-related-TIF.patch
@@ -23,9 +23,10 @@ This MR will close the following issues:  #149, #150, #152, #168 (to be checked)
 
 It also fixes the old bug at http://bugzilla.maptools.org/show_bug.cgi?id=2599, for which the limitation of `NumberOfInks = SPP` was introduced, which is in my opinion not necessary and does not solve the general issue.
 
-CVE: CVE-2022-3599
-Upstream-Status: Backport
+CVE: CVE-2022-3599 CVE-2022-4645
+Upstream-Status: Backport [https://gitlab.com/libtiff/libtiff/-/commit/e813112545942107551433d61afd16ac094ff246.patch]
 Signed-off-by: Ross Burton <ross.burton@arm.com>
+Signed-off-by: Pawan Badganchi <Pawan.Badganchi@kpit.com>
 ---
  libtiff/tif_dir.c      | 119 ++++++++++++++++++++++++-----------------
  libtiff/tif_dir.h      |   2 +
-- 
2.34.1


