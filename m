Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AA96C27C79
	for <webhook@archiver.kernel.org>; Mon, 17 Jun 2024 12:06:35 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web11.54607.1718625994337564095
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Jun 2024 05:06:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=uhsDuUdC;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.173, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-705c739b878so3428719b3a.1
        for <openembedded-core@lists.openembedded.org>; Mon, 17 Jun 2024 05:06:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1718625994; x=1719230794; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hjOKU/2ufrZjEEWSY3ztF62g3wX2XyN3DbEu/J+cLZo=;
        b=uhsDuUdCl7hViOx+Nwu8GgPdVjpJxBAaDXedliIdJNBg0vpV4H4Ikos209GVaA8uNh
         nhf/LB4dIhpMiJfvztHC4+IpH7+CxsW90qtWe34iJ7544yNcud5icxkNUNFKxfoOuzER
         7ZUDPphEVB0o+tpFtUlXcYU1kyjkU+jPYwRDRUXcmyNxKZJMPuPLYv71sG9oouHjT/GC
         IosHNgslZv8C461FCMXVF6ZgV5gWpPecfGVNx8n0A3bMQHSprlt6ccl7otm9GynGrQY7
         eKORPk3SJYld0651c4E1QHB5S/2qtrE5sRBxz9IBa5YuLvq/GF6rfJ+zccwwVS0bARuK
         Yjpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718625994; x=1719230794;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hjOKU/2ufrZjEEWSY3ztF62g3wX2XyN3DbEu/J+cLZo=;
        b=MMlkjFqZNySJdbJJaiq7YgIRFAfdGmRcPt+Ot+9MvmV80gisLlOaGwkLyo3/b/v/Me
         LbQRHS6oxr1BWkqc95QzeUhMrmTED3SQRjM7RC6pP9WqpzAVWuSovqnKhjmcu4uhjZJQ
         8U16vDz6Rm0ULhPCqryGD70Vgq+hcZenXyLiB3ZNSOI267SAp0/VcOgZRVmJkoqh7OPw
         AYBtCXvpltmcuYwK0LUD1V5rnI8ifNKb9+MHF2D492DauPYR0oJXlHm+DB8e5vuLXec6
         i2aAPZlA2axFcSyg0184WNYbwYFsRBp3+wnqeIbgStwEWu/9/J+jg38yHWkTEeRsX8ib
         YncA==
X-Gm-Message-State: AOJu0YxWB4GaXu/VUz9km4/MhQjvSaUi9Pw1kXtt+sr9SVxmJEfr+9Z+
	bmmILhEu4vdIzZ7bBx+t+KsavsVKKhNdDkhkNa4qVEs92BuSQPboGOqJbuhO3Zqx3PcnCMvQQ+z
	mjNY=
X-Google-Smtp-Source: AGHT+IFfSU6bFFUzNf2lmtKC0JUAwb/mhSUbOkZn5U3g43mHFqVrxr+GUA5hwOoXEGD7DTs+QuUzBA==
X-Received: by 2002:a05:6a20:9744:b0:1b6:dd1e:da51 with SMTP id adf61e73a8af0-1bae7f94344mr11904050637.21.1718625993617;
        Mon, 17 Jun 2024 05:06:33 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-705cc925fe7sm7482348b3a.19.2024.06.17.05.06.33
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 05:06:33 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 22/22] cups: Upgrade 2.4.7 -> 2.4.9
Date: Mon, 17 Jun 2024 05:05:00 -0700
Message-Id: <50563f0b77ca1239283604e82ada0db3dfda10d9.1718625680.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1718625680.git.steve@sakoman.com>
References: <cover.1718625680.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Jun 2024 12:06:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200833

From: Siddharth Doshi <sdoshi@mvista.com>

CVE's Fixed by upgrade:
CVE-2024-35235 cups: Cupsd Listen arbitrary chmod 0140777

Other Changes between 2.4.7 -> 2.4.9
====================================
https://github.com/OpenPrinting/cups/blob/2.4.x/CHANGES.md

Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-extended/cups/{cups_2.4.7.bb => cups_2.4.9.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/cups/{cups_2.4.7.bb => cups_2.4.9.bb} (51%)

diff --git a/meta/recipes-extended/cups/cups_2.4.7.bb b/meta/recipes-extended/cups/cups_2.4.9.bb
similarity index 51%
rename from meta/recipes-extended/cups/cups_2.4.7.bb
rename to meta/recipes-extended/cups/cups_2.4.9.bb
index f4b0282e4c..e0a3522004 100644
--- a/meta/recipes-extended/cups/cups_2.4.7.bb
+++ b/meta/recipes-extended/cups/cups_2.4.9.bb
@@ -2,4 +2,4 @@ require cups.inc
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRC_URI[sha256sum] = "dd54228dd903526428ce7e37961afaed230ad310788141da75cebaa08362cf6c"
+SRC_URI[sha256sum] = "38fbf4535a10554113e013d54fedda03ee88007ea6a9761d626a04e1e4489e8c"
-- 
2.34.1


