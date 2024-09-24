Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93B2ECF9C72
	for <webhook@archiver.kernel.org>; Tue, 24 Sep 2024 21:37:30 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web10.1020.1727213843561266364
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Sep 2024 14:37:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ftepekFP;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2068acc8a4fso56106275ad.1
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Sep 2024 14:37:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727213843; x=1727818643; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VkPirGttmjL2rO8xPQtod8mNWC7gvrmrzykUE5bz7tc=;
        b=ftepekFPQ1mPaSjw269wngvohAqaoVg2eE0gbzQqBpKoeNRWmlQQnX739PZwyKA/pR
         vGbH67egs6GQT+Gl27vSqLyRgFd0DdY7+GdTontUelvDhi7D4AfXs3hdXeTxg5S38HPN
         is4tPVtTDRe+TOXGV4eBUXpkJi6FQBjns/fQuW02+AntRlRHrIPzYnBkPdqiBwn4a1nd
         TWXUAsaoZO6r9GR0q4urviGIpSOl8QHHpvhr4ckniwCBLZEeqRpfa93SPCRHVMhJEGGI
         SD8MIl0ZCMWjYqRDhTDbwmpErezfiesH+n2Vm6oaYpDIAHdVZWr9qTdceKM6+TJwS70C
         UpNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727213843; x=1727818643;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VkPirGttmjL2rO8xPQtod8mNWC7gvrmrzykUE5bz7tc=;
        b=XyA/LyS5J/U4HFHS8xlWN935dUto0wdXNpOICzV8Z1ejY6ebCE0BC+Yc2+y/2yRsng
         VDjNoVfdjj/jfapS/IOcZuc8QVVaXQFQb6FW1LbCrQQc1rt/cxl4J3hI9n1RuhTTUKEn
         2LutRGC3yhFtGoal9wLRBtisK45NqKQSj6TSEYSBiJESCjxUeg/2UdwoUiH+kWKnFmHk
         kECNDje5O6h0H3hMZW5erYq4J0rW0ooKuwzkqLd0vAm94QC6eHvVPfzGLRPsO50R8NL5
         FaJkJHwR+SQn6Qz7uGS8bsZT0DqlqEv8AM3UhGNU2+8nos4FZRcUs9HQMs0nm3dNkwFm
         59Sw==
X-Gm-Message-State: AOJu0YwTXqPuvpNcG3q5d26+pRfucQnWKO2kBGGhOBKZ5qY6YAU9HIHu
	Hsquma6rFz/Qy2gW2D/2WI/VrcHGSDVGJTu3zNqtWi1PxTzvfHl59plaz8t/
X-Google-Smtp-Source: AGHT+IHG/Osy2mhmI3IWoQhjQxleLNTcoCf6mwlk19aA6pShc7OhSjjm4ccw078USUkTJhFAT7qCIw==
X-Received: by 2002:a17:902:d2cd:b0:206:8c18:a538 with SMTP id d9443c01a7336-20afc47eaa4mr7229075ad.32.1727213842687;
        Tue, 24 Sep 2024 14:37:22 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::7062])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20af1854c32sm13897485ad.268.2024.09.24.14.37.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Sep 2024 14:37:22 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH v2] systemd-boot: Enable on RISCV
Date: Tue, 24 Sep 2024 14:37:19 -0700
Message-ID: <20240924213720.2885798-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.46.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Sep 2024 21:37:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204881

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
---
v2: Add riscv to working arches instead of opening all up

 meta/recipes-core/systemd/systemd-boot_256.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd-boot_256.5.bb b/meta/recipes-core/systemd/systemd-boot_256.5.bb
index 9a6d8e9d6e3..b00e0ddc536 100644
--- a/meta/recipes-core/systemd/systemd-boot_256.5.bb
+++ b/meta/recipes-core/systemd/systemd-boot_256.5.bb
@@ -49,7 +49,7 @@ RDEPENDS:${PN} += "virtual-systemd-bootconf"
 
 CFLAGS:append:libc-musl = " -D__DEFINED_wchar_t"
 
-COMPATIBLE_HOST = "(aarch64.*|arm.*|x86_64.*|i.86.*)-linux"
+COMPATIBLE_HOST = "(aarch64.*|arm.*|x86_64.*|i.86.*|riscv*)-linux"
 COMPATIBLE_HOST:x86-x32 = "null"
 
 do_install() {

