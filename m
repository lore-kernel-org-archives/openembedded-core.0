Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9241AC6FD1F
	for <webhook@archiver.kernel.org>; Wed, 20 Mar 2024 16:10:43 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web10.49267.1710951036979369345
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Mar 2024 09:10:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=AWGOfTLQ;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.178, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1e00896dfdcso25669075ad.1
        for <openembedded-core@lists.openembedded.org>; Wed, 20 Mar 2024 09:10:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1710951036; x=1711555836; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PMw7lAA4+7b1Li64sg8sOdu0NKrVOVompYgl9JZVdqk=;
        b=AWGOfTLQmL2ekZwPBmwN3bSbnZ0KdZmo7/oA9YMsy3lrI3ylbPccPkaTWgBFDp7i4c
         7MG8VMMGolkPLnbonsoE+22QG/DUuXQ7TIK9aPfQjD8whz7mX2IYLjRWOD3K+FdBLrrB
         phy3xIA1UuP+o9OZIqwo3uO3CFBLcJeeEnREXT1Ufc3bDoBO4Ii7AEn9PHYkh+hWj7Ha
         UDzB0uq61zCC6t00ZFbrHdeQ1IIS6jgVv13JM8N/+dhxeLXPv69ECXPru/+F8kDnMCDv
         iUXUcL9gHaEFpo1TLBQKEDykBQkqEtMYABAFYe3J0FGc6eteVbXpZW5fpJ1fLg5av+ad
         lSrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710951036; x=1711555836;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PMw7lAA4+7b1Li64sg8sOdu0NKrVOVompYgl9JZVdqk=;
        b=uBzSOh71SRu3/LYW3b6bOSVsX1XqND3esmysG2TJ3bfEGz56qtV8RxSctEiVZtA3C0
         S3nvlJPg9pu4a5lYbJ1/HkgpPLNmXhX1EaHjQ3E6/r56SnFr5MFXeASYR7p9nkPucK9s
         TiGkuktq9UDw+GpzdBW/Y2ke7nnhwxLte+6bs8h+YfHOuehaZOvDI/0IPY6u+cHA1FzN
         6bY5+alsMwW/H7UKKBUYbVoNEC3gOVnJoNSdNyUYqWAo1avi3x0UZjSdGe4jqDvPNhfl
         e6geZpWqjcS8cU98hGtRJ4bp2DH1VUdX14HzNcR9ej9c7sOeB5Arwx7782QZKLQGheW4
         oZ5A==
X-Gm-Message-State: AOJu0Yz2SpttfpIId6f8qX7utKdVWlNApsoFAETFDNyO7hqDFjX7pYO9
	X5y/n4S6Yn6mEwYfEmjli91cwGB10jlU0dMeD/YJoBENhtdfHK9D3T/ON6enI3fcMuz2CyAGZTS
	fehg=
X-Google-Smtp-Source: AGHT+IFXO1P8NZFne5k017z01cqVco6yFMnABwVjBt5przQ4PmU5/ZMkIIoV2t0XyjbK9GqgkM2BLQ==
X-Received: by 2002:a17:902:934c:b0:1dd:50f0:3e72 with SMTP id g12-20020a170902934c00b001dd50f03e72mr5431026plp.26.1710951036307;
        Wed, 20 Mar 2024 09:10:36 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id l18-20020a170903121200b001ddc93c5759sm13775694plh.196.2024.03.20.09.10.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Mar 2024 09:10:35 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 10/15] wireless-regdb: upgrade 2023.05.03 -> 2023.09.01
Date: Wed, 20 Mar 2024 06:09:48 -1000
Message-Id: <3af65ed130493e14a87818b76b06f9ca7c717874.1710950846.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1710950846.git.steve@sakoman.com>
References: <cover.1710950846.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Mar 2024 16:10:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197381

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
wireless-regdb: update regulatory database based on preceding changes
wireless-regdb: Update regulatory rules for Australia (AU) for June 2023
wireless-regdb: Update regulatory info for Türkiye (TR)
wireless-regdb: Update regulatory rules for Egypt (EG) from March 2022 guidel...
wireless-regdb: Update regulatory rules for Philippines (PH)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 2f5edb6904bf16a9c52a9b124aeb5297487cd716)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...ireless-regdb_2023.05.03.bb => wireless-regdb_2023.09.01.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-kernel/wireless-regdb/{wireless-regdb_2023.05.03.bb => wireless-regdb_2023.09.01.bb} (94%)

diff --git a/meta/recipes-kernel/wireless-regdb/wireless-regdb_2023.05.03.bb b/meta/recipes-kernel/wireless-regdb/wireless-regdb_2023.09.01.bb
similarity index 94%
rename from meta/recipes-kernel/wireless-regdb/wireless-regdb_2023.05.03.bb
rename to meta/recipes-kernel/wireless-regdb/wireless-regdb_2023.09.01.bb
index cd3f52fc76..c09600ecbe 100644
--- a/meta/recipes-kernel/wireless-regdb/wireless-regdb_2023.05.03.bb
+++ b/meta/recipes-kernel/wireless-regdb/wireless-regdb_2023.09.01.bb
@@ -5,7 +5,7 @@ LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=07c4f6dea3845b02a18dc00c8c87699c"
 
 SRC_URI = "https://www.kernel.org/pub/software/network/${BPN}/${BP}.tar.xz"
-SRC_URI[sha256sum] = "f254d08ab3765aeae2b856222e11a95d44aef519a6663877c71ef68fae4c8c12"
+SRC_URI[sha256sum] = "26d4c2a727cc59239b84735aad856b7c7d0b04e30aa5c235c4f7f47f5f053491"
 
 inherit bin_package allarch
 
-- 
2.34.1


