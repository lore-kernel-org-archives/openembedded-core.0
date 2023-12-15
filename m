Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF407C46CC6
	for <webhook@archiver.kernel.org>; Fri, 15 Dec 2023 07:52:26 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.web10.57793.1702626740180131918
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Dec 2023 23:52:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=l6oVE4tV;
 spf=pass (domain: gmail.com, ip: 209.85.208.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-54c79968ffbso348292a12.3
        for <openembedded-core@lists.openembedded.org>; Thu, 14 Dec 2023 23:52:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702626738; x=1703231538; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nYvjEETRNsI5ywXfBQQcZW6dgUKc8TfSVoG/DGbKmUk=;
        b=l6oVE4tVmRk9ZPQmban/TKrg2SPsnaW9TJbh4vjOikbE4WogjCoV8OS2YVFbgrd6eL
         Os6Sa09ybKCTX+96Zov47AqzI/K2bbOD4mhZi7TFNAWkxm2+LjTgh30EGMLM4yh2j2vg
         KPNWgBP4f5GOreXH7pZEgyuW5txm3JHsoNU2X/ief95gr1LS73TRtvF0Dh0d6Hn5RbvM
         NnEMhUXja1x08dk7DKSHyjnW8VN8VwdxQVDTlXZR0U3F63XUZBeKHlJKPhmdsiGfsB7x
         HNWltR0GNVnz/D6xoeoV3pNZMt1Di/rgvWtpx5NdEKuEapGeselOR1tso+kaks2fRw0p
         hPOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702626738; x=1703231538;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nYvjEETRNsI5ywXfBQQcZW6dgUKc8TfSVoG/DGbKmUk=;
        b=kf7VUIwT4tSJVskuegkCUitVSjlHyF0GnvyKOFUfvJ/xrIb1/HuMQnDoNjKOfhaOur
         8sAMBQtsXLjGUZTnt5O4s/yJdbQgw2M5d6LqrWMkRadH0e7Vj9WkN//Ze1UwF01iTiWc
         jJkHz0XGshHuPzkbJ94SyrfYQP6Bsjn2c2mjMPPSfMr3OFI91bgkmqNCEcx3ordxoDW2
         kCiOxuNaFs7QoxLd/jr2Ig3BhW/SuQ3tZsQJD7fi7aahr/VYkReF9sK0qV/QzsIpmY7u
         BL0LGV0ODH35H17xHkIj3EB5iAYsfR8Qon0S5LD6aWh5zq7s/EpjITPSijR7du6R6GHo
         /c3Q==
X-Gm-Message-State: AOJu0Yzrh7G95B7XpudSkCh1xOQQcCU7gtFE6W9P5AQyJiwd65C9E1tk
	/5mXzbDSuwdklHYtVMhqjHgiA70sIhs=
X-Google-Smtp-Source: AGHT+IFMjb158RR+brH7JP3k1ng7baw1joJefr5JTZUAup/9Yw9setW2tyL8/Z2bSEWH+9E5n7CSHQ==
X-Received: by 2002:a50:8a9a:0:b0:551:eedd:64f2 with SMTP id j26-20020a508a9a000000b00551eedd64f2mr2200657edj.61.1702626738667;
        Thu, 14 Dec 2023 23:52:18 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id bt13-20020a0564020a4d00b00551d6d51401sm2961885edb.53.2023.12.14.23.52.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Dec 2023 23:52:18 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 08/10] glib-2.0: replace distutils dependency with setuptools
Date: Fri, 15 Dec 2023 08:52:08 +0100
Message-Id: <20231215075210.3049785-8-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231215075210.3049785-1-alex@linutronix.de>
References: <20231215075210.3049785-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Dec 2023 07:52:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192419

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-core/glib-2.0/glib.inc | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
index fbf3a39b15f..eb292c51d44 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -146,7 +146,9 @@ do_install:append:mingw32() {
         rm -f ${D}${bindir}/gtester-report
 }
 
-CODEGEN_PYTHON_RDEPENDS = "python3 python3-distutils python3-xml"
+# remove setuptools dependency when usage of distutils is dropped in
+# https://gitlab.gnome.org/GNOME/glib/-/blob/main/gio/gdbus-2.0/codegen/utils.py
+CODEGEN_PYTHON_RDEPENDS = "python3 python3-setuptools python3-xml"
 CODEGEN_PYTHON_RDEPENDS:mingw32 = ""
 
 RDEPENDS:${PN}-codegen += "${CODEGEN_PYTHON_RDEPENDS}"
-- 
2.39.2


