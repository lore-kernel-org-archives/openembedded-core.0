Return-Path: <thakur.virendra1810@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBC55EB64DC
	for <webhook@archiver.kernel.org>; Tue, 27 Jun 2023 07:26:35 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web11.7633.1687850793064724235
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Jun 2023 00:26:33 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=WyZnLT/M;
 spf=pass (domain: gmail.com, ip: 209.85.210.180, mailfrom: thakur.virendra1810@gmail.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-666ecb21f86so4112849b3a.3
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Jun 2023 00:26:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687850791; x=1690442791;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JJ4JpnkVBDl3/oFy+3vBA/8ohYHP9Hcwa8om48XBUTg=;
        b=WyZnLT/MkE1it0CAtw3fZNL5GBdwp10Um04tX6bc7PL5pMSXXI1W6NpL+UOaFZW+2D
         BMxta7T/s0ba/9gDMsRghec57XBfzxoauLzrUlvZWa1WwzYkR4w6P1mihu6vs1ZkWB8T
         4TRP4dgAxh6xM8htWcIvboPEs3mMX7O6ydzSiRV/JDCjUWjlexkm2GrwRsaw9qVTSPDx
         Pp6ex/IaY201eIJGyyKu5sxa/65bU7fiZ8cWY+BJRkILzwTE1QElg6TktA6ard5L20JW
         0wSaMgwHMN4PX5KD9zPIEEsfc8l34uQVA8ESM7T0Btd+NjWycxT5mQjGZuDTryt5NXIz
         DSrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687850791; x=1690442791;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JJ4JpnkVBDl3/oFy+3vBA/8ohYHP9Hcwa8om48XBUTg=;
        b=LC6OdWc74cNrLnqEgQO+uDTtjxuhwYpXmK8XQqLJOegHuGjWiVemhqujCIcR78UMVl
         pnOAkfeYqmK0JnUYUNyz85aJY/HFMaUtniA31TOx2Pa1NaWlh/SPKqALYuNg2gnNY+p3
         1JphhXn200vFpAx4D+MCaRBvq8TpMlf9dNieRatFNVBwCGwe+/POLQXDRoUfb+UJZxfp
         EepPPxZHpJZewiViB6J7xBG8CYTzEnOObkjAVBE0OYy47jHi4ysIL5I8ifcZA56qjNOs
         Kt9FGqsKVReD2rdcUg+ee7CTIy58NRUDuz35ajmc1q/mxjqscRFovhuc9cVSlbnymT3S
         QjAA==
X-Gm-Message-State: AC+VfDym06dF0tEW83MaKynHX5ef3kQQWfGV3O4rzZES2Cc0lc0J2vqS
	Y9YNgDIXfwd3wW3BMOUUv3rVU97/W1g=
X-Google-Smtp-Source: ACHHUZ55d5yT3ylwh/cwD/taLleBr2KGW/r6j5SzTKpRYfM7ixbKrjaHslcgnx90+Hq4oLm0dPNjQg==
X-Received: by 2002:a05:6a20:4287:b0:12b:6898:2989 with SMTP id o7-20020a056a20428700b0012b68982989mr626423pzj.28.1687850791373;
        Tue, 27 Jun 2023 00:26:31 -0700 (PDT)
Received: from localhost.localdomain ([223.233.81.169])
        by smtp.gmail.com with ESMTPSA id q10-20020a170902daca00b001b694130c05sm5327286plx.1.2023.06.27.00.26.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jun 2023 00:26:30 -0700 (PDT)
From: virendra thakur <thakur.virendra1810@gmail.com>
X-Google-Original-From: virendra thakur <virendrak@kpit.com>
To: openembedded-core@lists.openembedded.org,
	Khem Raj <raj.khem@gmail.com>
Cc: Ross Burton <ross.burton@arm.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [OE-core][kirkstone][PATCH] ninja: ignore CVE-2021-4336, wrong ninja
Date: Tue, 27 Jun 2023 12:55:13 +0530
Message-Id: <20230627072513.22484-1-virendrak@kpit.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Jun 2023 07:26:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183475

From: Ross Burton <ross.burton@arm.com>

(From OE-Core rev: c2dd2c13ff26c3f046e35a2f6b8afeb099ef422a)

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 9a106486ad7900924a87c5869702903204a35b54)
Signed-off-by: virendra thakur <virendrak@kpit.com>
---
 meta/recipes-devtools/ninja/ninja_1.10.2.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/ninja/ninja_1.10.2.bb b/meta/recipes-devtools/ninja/ninja_1.10.2.bb
index 7270321d6e..1509a54c9e 100644
--- a/meta/recipes-devtools/ninja/ninja_1.10.2.bb
+++ b/meta/recipes-devtools/ninja/ninja_1.10.2.bb
@@ -29,3 +29,6 @@ do_install() {
 }
 
 BBCLASSEXTEND = "native nativesdk"
+
+# This is a different Ninja
+CVE_CHECK_IGNORE += "CVE-2021-4336"
-- 
2.25.1


