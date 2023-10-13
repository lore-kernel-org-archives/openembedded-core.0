Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93E2CCDB482
	for <webhook@archiver.kernel.org>; Fri, 13 Oct 2023 21:53:23 +0000 (UTC)
Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
 by mx.groups.io with SMTP id smtpd.web10.51140.1697233994775813719
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Oct 2023 14:53:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=x1Wfz0Cu;
 spf=softfail (domain: sakoman.com, ip: 209.85.161.43, mailfrom: steve@sakoman.com)
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-5815818406dso1391244eaf.2
        for <openembedded-core@lists.openembedded.org>; Fri, 13 Oct 2023 14:53:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1697233993; x=1697838793; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PMw7lAA4+7b1Li64sg8sOdu0NKrVOVompYgl9JZVdqk=;
        b=x1Wfz0CuIuoVqiTp+a71x6YhbZ/NH7/5tGufUXE06lfY1HmLtOYH8qIwnizIlxRFe9
         KPmXZAyTBD9EtrQcZ2nR/ofkT5hSiAgG1QfxMyL1UnUMUtMEaeFFY+SyGEmSYJLaNo87
         5be27Tz5jU0MSMQXR6on5rd8XO58pAx7Da7k/zMtVfUshyNFLsF0lXj/wjiBglHqv//5
         R34h1EwYuD9OCONyNopOkDgkkq4OH891lS+vwuggs0BBBPahOCKGspg00W73LtYAygFq
         SyiTmvGMNOx55CIrzMMU2t0pF80R8LvMitPDdraw+aYG24kdvKW2jKu8wN7JiQD09ZNP
         KbgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697233994; x=1697838794;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PMw7lAA4+7b1Li64sg8sOdu0NKrVOVompYgl9JZVdqk=;
        b=TWNAx/d5rK1U7EXk3+e+vm2nmayGroo9o1BXW9lgq8SzxZrYjZw3JwU5/2X+E9thkV
         NF51cwBDaK0CACaIA8Wx1U8AYPwfLMPneJTv4BpsL/jleMTztSBPFCHgcSpdqR31Ya2H
         ZXyHUjJ1NNlEZq+5WAFjLHTUHpgJF+AxQ1ZatJ/6/0sY/s1ZiAyY/1PCVpxTcjW7qFjl
         1gubG2VvTd0SdfVs/k1yJCcUfH1Dt+cz69PJ4ntbxt6Z8j1GKuLXjDTwDtwtyNiAJM8Q
         Ul/HzrDIKP2qWGvjPxt12ZvJal+NEWNHPiY0Ekzspfv6OTZoHjCfHUXBYkEihUzXnuqb
         xTFA==
X-Gm-Message-State: AOJu0YyU4tyXOZqD9KxIKR2bAZqQ1GniaLGgmdveNsKiV2AYA7gT9tSB
	n9uHns8Scxi9SBZxj9P4bJbd4V7ejeSaklNKPVw=
X-Google-Smtp-Source: AGHT+IEsuS4zxjYcHO5XzE9ctN5goW/TYIF3jIssDgPj1/DU2Ylo5+vbMiD08u69WZAk1FDfKRQG2w==
X-Received: by 2002:a05:6358:e49d:b0:133:a8e:6feb with SMTP id by29-20020a056358e49d00b001330a8e6febmr28774848rwb.12.1697233993721;
        Fri, 13 Oct 2023 14:53:13 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id u22-20020a62ed16000000b00690fe1c928csm14307334pfh.147.2023.10.13.14.53.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Oct 2023 14:53:13 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 07/27] wireless-regdb: upgrade 2023.05.03 -> 2023.09.01
Date: Fri, 13 Oct 2023 11:52:31 -1000
Message-Id: <c1ae47b562460e82d94a94a2009c4cb50aa1daa9.1697233866.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1697233866.git.steve@sakoman.com>
References: <cover.1697233866.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Oct 2023 21:53:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189084

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


