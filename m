Return-Path: <ecordonnier@snap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C837BC47077
	for <webhook@archiver.kernel.org>; Tue, 16 Jan 2024 09:02:33 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web10.8977.1705395747991501433
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Jan 2024 01:02:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@snap.com header.s=google header.b=fNof1Niq;
 spf=pass (domain: snapchat.com, ip: 209.85.208.49, mailfrom: ecordonnier@snapchat.com)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-554fe147ddeso10753044a12.3
        for <openembedded-core@lists.openembedded.org>; Tue, 16 Jan 2024 01:02:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snap.com; s=google; t=1705395746; x=1706000546; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lvm+AnnVHRizXBVHagn0fLyUgJKuQDenQ/t2jdC8ePs=;
        b=fNof1NiqIglAQA1OwKC63Z9wSpt4awLkhwG2hH8Y0HmOym2DRCqbdJPnVKKaJVRSmm
         kXaFKdqgQKMA+Xle2nAzj3RCuSgBoY3FEilOvIml4G1VErbBKuNBW4nJjoLgt2PovZ6k
         BMlwsitFWB05BWHqlDEH3fSLtnDc9G7Q3q628=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705395746; x=1706000546;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lvm+AnnVHRizXBVHagn0fLyUgJKuQDenQ/t2jdC8ePs=;
        b=f9v4EQd5Y8EZyAAV993K8UeMiyZE0SGQ9nrjywtnHPGxkjKIq7uOnMMqMTZ2KFhBVV
         pXwBdM4DqFnDt/r1G9YcDgWHFFkeIs4wXx90eKxGRqvF3zxJvHN4QVOizT5NW+aZzoiD
         00UP53l3W2a1Xf4TmnIMvE1dioQwCEz1wzlV+RivsVTun7bjUyikiXYYJa8hNT7A+vuj
         9RrPMh6dCkZ8kUcqim1GGrYZTXHM5LDpq1c7x7hq1z6/XIl+6c3b72pyAQ9m6zlF1vKr
         f3Ng09CdrIaQVprRzNR6aagVuBtSUe6Ij6nIx7taLBGMR+k+3Kexo/GUrZ9zkfdSoFtr
         AqWw==
X-Gm-Message-State: AOJu0Ywwanp3tG6RBLoMLBugpskjMiP1fkLITONCYEnL9vlpPOWq0o9f
	vjuoBB8KgN/nQV17LBfN6EnljL99jWxE2XNLG7md5cq/eOkqBxEn
X-Google-Smtp-Source: AGHT+IGNuJyXHviFSUC64tVkc7hW8oqyI4jQsvQX1V9wChIWzYCk7FM/4u9idRVG9FPqca9jpKwz9g==
X-Received: by 2002:a17:906:3e04:b0:a28:c180:b079 with SMTP id k4-20020a1709063e0400b00a28c180b079mr1854189eji.129.1705395745703;
        Tue, 16 Jan 2024 01:02:25 -0800 (PST)
Received: from lj8k2dq3.sc-core.net ([213.249.125.50])
        by smtp.gmail.com with ESMTPSA id v7-20020a1709063bc700b00a29bd8f9edbsm6220569ejf.72.2024.01.16.01.02.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jan 2024 01:02:25 -0800 (PST)
From: ecordonnier@snap.com
To: openembedded-core@lists.openembedded.org
Cc: Etienne Cordonnier <ecordonnier@snap.com>,
	Dominik Schnitzer <dominik@snap.com>
Subject: [OE-core][PATCH v2] cmake.bbclass: add Darwin support
Date: Tue, 16 Jan 2024 10:02:19 +0100
Message-Id: <20240116090219.220432-1-ecordonnier@snap.com>
X-Mailer: git-send-email 2.36.1.vfs.0.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Jan 2024 09:02:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193842

From: Etienne Cordonnier <ecordonnier@snap.com>

This was initially added by https://git.yoctoproject.org/meta-darwin/commit/?id=97a84e083d0c2812e44231d48fb478e9a9cfac79
to the meta-darwin repository, however having it directly in openembedded-core will make the maintenance of meta-darwin easier.

Signed-off-by: Dominik Schnitzer <dominik@snap.com>
Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
---
 meta/classes-recipe/cmake.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes-recipe/cmake.bbclass b/meta/classes-recipe/cmake.bbclass
index d978b88944..1e353f660f 100644
--- a/meta/classes-recipe/cmake.bbclass
+++ b/meta/classes-recipe/cmake.bbclass
@@ -72,6 +72,8 @@ OECMAKE_TARGET_COMPILE ?= "all"
 OECMAKE_TARGET_INSTALL ?= "install"
 
 def map_host_os_to_system_name(host_os):
+    if host_os.startswith('darwin'):
+        return 'Darwin'
     if host_os.startswith('mingw'):
         return 'Windows'
     if host_os.startswith('linux'):
-- 
2.36.1.vfs.0.0


