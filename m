Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 844E0C25B7C
	for <webhook@archiver.kernel.org>; Thu, 23 May 2024 15:05:57 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web11.908.1716476747917016789
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 May 2024 08:05:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CagS3Qu3;
 spf=pass (domain: gmail.com, ip: 209.85.210.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-6f44dc475f4so3086191b3a.2
        for <openembedded-core@lists.openembedded.org>; Thu, 23 May 2024 08:05:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716476747; x=1717081547; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YlNT2lPvdKCUs//4yFCH5xQzinMQ1uz6NJBOJVu5AOc=;
        b=CagS3Qu38PmKguefPjjv67n+7ScdJS+VA6SVLgIAkK6vYTQGSemCiExtZYY5f3me8S
         bBSaraW51CaOb4Wf68D2oALA3rwSTWJ/pHtxaPIZ/oQ+uhCCMNEeHgYYLHw/w7fRiG0a
         zSP5oOEnehQRPz8GjcAW+KpfKzSDfiO7idsON9Fq4usVZ7iEtI6DuFYk8R8R6NgXG+qB
         Ipg7N6EUZfBahndDaZAXxEyYLP7tGncideeqbZ+QKNgrRAseG45JTefrPMdRRmEWooTL
         hPe0CtfaTBkUSGaAPo4WrkBXRpuvnSDKVpk+dl6Sqnxy0v/dqoXUwHJtD+LgMxgjZQi5
         9auQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716476747; x=1717081547;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YlNT2lPvdKCUs//4yFCH5xQzinMQ1uz6NJBOJVu5AOc=;
        b=XCOM/1h/KrOtMiAdcH3jQdg72LY179KAShGRY+8DWo7FJpZM8ft3qiE0+Ch/2lS+Uk
         TX5tsgpkixEXw0OsgHCPYjEnPPL/IAPMORTcdWKaSUOLVnkpJviGAUDHK8IC32b3RMCp
         6LuPBhfA10MlBN7piWh9YEKP2w5SzCiX6vJm8arbkD2Tw1dL3ajCNi2/qxgeznpipc1O
         s2yeQeJy2FYlnh79Tu4oaXAl1LUaEy8IHLNur+EO4abqNEQAFBBMSmaMMs2mqzvWUZ/y
         higrP5rWhPKRcoyN3ONqyZpcT9CdmxizGkA8bTT62fJbrIaNenmSf/UVBkerOBAVEZ8Y
         gqIw==
X-Gm-Message-State: AOJu0YyCtVKUENZYBQuDOaVco2JBRiX2su8YFpBYbjz02ZVHJhmJiZjv
	p51GmbXJ5/MwtgoEPDFiIbORYAJMta/iKUpO4X/86NEhxddV2fRqI2gZnWbI9pU=
X-Google-Smtp-Source: AGHT+IF+bzhBk5c7OqYnxJoAwvwqRn0htrh8uEY4OrzusIUGpnrI6G0Rqz/n2ReI5O9kWfh0S9+fCQ==
X-Received: by 2002:a05:6a00:4f8b:b0:6f3:f05c:d2d7 with SMTP id d2e1a72fcca58-6f6d604307cmr5674629b3a.2.1716476747049;
        Thu, 23 May 2024 08:05:47 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::e8eb])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-6f4d2aa01dasm24806479b3a.92.2024.05.23.08.05.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 May 2024 08:05:46 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] systemd.bbclass: Clarify error message
Date: Thu, 23 May 2024 08:05:44 -0700
Message-ID: <20240523150544.3028067-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 May 2024 15:05:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199808

When this error is triggered, its a bit vague in specifying where the
issue is e.g.

ERROR: nbd-3.26.1-r0 do_package: nbd does not appear in package list, please add it

Some packages may intentionally remove PN from packages and find it
confusing as to why the system is still asking this to be in PACKAGES

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes-recipe/systemd.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/systemd.bbclass b/meta/classes-recipe/systemd.bbclass
index 48b364c1d4d..6043fb6667d 100644
--- a/meta/classes-recipe/systemd.bbclass
+++ b/meta/classes-recipe/systemd.bbclass
@@ -85,7 +85,7 @@ python systemd_populate_packages() {
     def systemd_check_package(pkg_systemd):
         packages = d.getVar('PACKAGES')
         if not pkg_systemd in packages.split():
-            bb.error('%s does not appear in package list, please add it' % pkg_systemd)
+            bb.error('%s marked for systemd files, does not appear in package list, please add it to PACKAGES' % pkg_systemd)
 
 
     def systemd_generate_package_scripts(pkg):
-- 
2.45.1


