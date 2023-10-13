Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F6A3CDB47E
	for <webhook@archiver.kernel.org>; Fri, 13 Oct 2023 15:42:41 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web11.42073.1697211755727741736
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Oct 2023 08:42:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SN87nzxQ;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-40566f8a093so22994045e9.3
        for <openembedded-core@lists.openembedded.org>; Fri, 13 Oct 2023 08:42:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697211754; x=1697816554; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dAakyF0WJSazGQpjuIls6uaPSJU9tMHekkoxWD1GwYI=;
        b=SN87nzxQJgfYEX2FeFrASbY8zbNc89GrXLOSq5M73bMDG/xd89SCi+H2PB25R20Wws
         FObGpBJY/wEEr49CaWyqbai6H0m7ffrAb+i4X6CoVwExq5WIxy9E5R6AiiYeCit2mYRz
         NN8luRqCVy+0Y4A/3x0y0zLDi26zJPYX/6CsGFs2ycdB6cGxz6MUlyhO7fBqJabDb27S
         lT+wrHS2nQzDZrbRbNHKA2QIzrBdaPS/yLkKd86yrG7iLvHY9wDUkWSDJkukIS8iQla5
         mu2taWlJ6iSGQYVZaMYNa+fKYIUZmBR7R981QRa4Pp3xrw6GYzLJcAqC09+A1AHA0BvJ
         TyvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697211754; x=1697816554;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dAakyF0WJSazGQpjuIls6uaPSJU9tMHekkoxWD1GwYI=;
        b=n5bqiT77K/sM4BfKrxrR7wnmdYKj8zIBzfVRkCp3UBdzSHsP2po8mQCqZNjQJb3e0O
         ybjQxuhbAecvSgV9SfM7fLjkctdU5zA8A+56gRh39fXyG5KzPi8fPKsQOwsj+sE9Bfcp
         qWkdHoHCenu2ugu8b17ZjhG9CkS2RN4xYBZhkpaPTIRpTlIy+D2z7mekBOULflU+7SRO
         CollXL5Gm0fn3PCIuZnlB44T4QxY/bgF9dRDohMXQt4inK07mmmIwOZ3ZL9eBiwWZq2W
         OoOymYctKptvQ2IQoTtZawNY1Ob300a6eEfnC+NWcDL26ZjwpMxC0CekrtwABU5glWGY
         BJfw==
X-Gm-Message-State: AOJu0YwS7ZcqNSFYNLASf5eA7JEESDdj/XuDNwxOfciff9GosLpvXT/2
	e4Zp9lz7a7ycVUhnILSRPd/vceq/EK4=
X-Google-Smtp-Source: AGHT+IHzeo13Vsv6MXPUDp+KjPf6yDUyewHTo586IJt1DzFUkzUvN19jdrgkBZcjXqM50SabHhUNuQ==
X-Received: by 2002:a05:600c:2304:b0:405:367d:4656 with SMTP id 4-20020a05600c230400b00405367d4656mr24243137wmo.29.1697211753789;
        Fri, 13 Oct 2023 08:42:33 -0700 (PDT)
Received: from og-worker-dev-01.infra.foundries.net ([2001:bc8:6005:6:8218:44ff:fef2:ade0])
        by smtp.gmail.com with ESMTPSA id z11-20020a1c4c0b000000b003fee6e170f9sm436162wmf.45.2023.10.13.08.42.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Oct 2023 08:42:33 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <jose.quaresma@foundries.io>
Subject: [OE-core][PATCH] create-spdx: fix do_create_spdx cannot find any SPDX file for recipe
Date: Fri, 13 Oct 2023 15:42:14 +0000
Message-Id: <20231013154214.2233184-1-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Oct 2023 15:42:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189071

Given that we need some SPDX files produced in other recipes by do_create_spdx task,
we need to ensure that any of this other do_create_spdx build-time dependencies
runs first to produce the artidacts we need in the do_create_spdx of the current recipe.

Fix the following which especially affects multiconfig machines:

| ERROR: flex-native-2.6.4-r0 do_create_spdx: Cannot find any SPDX file for recipe autoconf-native, True sstate:autoconf-native:x86_64-linux:2.72c:r0:x86_64:11: sstate:autoconf-native::2.72c:r0::11:

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
---
 meta/classes/create-spdx-2.2.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/create-spdx-2.2.bbclass b/meta/classes/create-spdx-2.2.bbclass
index b0aef80db1..a37245bdba 100644
--- a/meta/classes/create-spdx-2.2.bbclass
+++ b/meta/classes/create-spdx-2.2.bbclass
@@ -709,6 +709,7 @@ addtask do_create_spdx_setscene
 do_create_spdx[dirs] = "${SPDXWORK}"
 do_create_spdx[cleandirs] = "${SPDXDEPLOY} ${SPDXWORK}"
 do_create_spdx[depends] += "${PATCHDEPENDENCY}"
+do_create_spdx[recrdeptask] += "do_create_spdx"
 
 def collect_package_providers(d):
     from pathlib import Path
-- 
2.34.1


