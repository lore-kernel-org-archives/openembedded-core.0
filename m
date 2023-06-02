Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 881D3C7EE33
	for <webhook@archiver.kernel.org>; Fri,  2 Jun 2023 02:22:39 +0000 (UTC)
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
 by mx.groups.io with SMTP id smtpd.web10.3368.1685672554288969939
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Jun 2023 19:22:34 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=IQ6T9Ayy;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.178, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-39a3f26688bso1235671b6e.2
        for <openembedded-core@lists.openembedded.org>; Thu, 01 Jun 2023 19:22:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1685672553; x=1688264553;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TtVKa6S3TAv2DI2HoEceOlhvOKsO2BV+AHjciFSe7Dg=;
        b=IQ6T9AyyOmqfM/yBLF1qOJnt0hRpUglqvC70y0PnP7B+wkGWVcmIxU0Sol/ciNpxYP
         w8kpkYW4wF/ktgX3Agx8iTcBd7m5T6YLLOXB+jWHHmvO2uqXzlBH24T1eaqOyNYyD3FD
         nbp5+cww1yMMXTG/J0b+h7C/Myo7huo31iKZS0WsEbGJq+bq+JVG4MgqQy5M7pKzptTC
         DBYWTHIapTyeYSoqnZAk1eAskNmjkccJhh2/wPgmH5B80n6Qoi70FGJ/VtumBCIhp/ZJ
         1f9DcuTjrl+dIsD2OowqrTR6g8qvpkHy8O1KnW6UDMgVvpCJCknAujVDJ36/FYoakZuA
         CLtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685672553; x=1688264553;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TtVKa6S3TAv2DI2HoEceOlhvOKsO2BV+AHjciFSe7Dg=;
        b=Qmbv+z6HNDfHZckYTCouVQwOpOv5pytJA17HYgz2BVHvJtR43homywsCmwF/OuZfqI
         ZG17xriJQq6qAStf9KstdnmRwM0DwGYby7MAjq701dEDa24lPeJPlPCjP3chCoMPVnSN
         0vWmRg9evB2qeWSqPm82vuDT9nX++OP93qciurqk9Lbz5P0palLDWSmnf60q/eAdzOmZ
         ekDwfvPBGoO8xYnLNqAe2RQKPo0itF45Fmhr85Q0DNtAULWz0w1XOxvpBrMN3rQoikiC
         dXLlyJPJRkis583HYldq3x45SiYrlzW0kUxzUxKuGBLwyoOexlJZ1iwcPsUWptVCwOn5
         nc4g==
X-Gm-Message-State: AC+VfDyyLuTdpaDspo8VZ58629dnSOhXBPtpFF/TUZcstvD/gMbL9PMG
	Da1jgy/E94OK9NfCjsivhtCK1a0KzLzwnDRKeFk=
X-Google-Smtp-Source: ACHHUZ4SQfFIKUWlFjrQJF7bACIttWMc4wEA2K6FrVg2OrxgqlSn3ptMa8Nip7VIL/xx2LpFIu5LHA==
X-Received: by 2002:aca:d1a:0:b0:397:f858:c670 with SMTP id 26-20020aca0d1a000000b00397f858c670mr1074314oin.3.1685672553264;
        Thu, 01 Jun 2023 19:22:33 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id z16-20020aa785d0000000b0064fc715b380sm5850234pfn.176.2023.06.01.19.22.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jun 2023 19:22:32 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 06/13] git: ignore CVE-2023-25815
Date: Thu,  1 Jun 2023 16:22:05 -1000
Message-Id: <0bdeec9951e8e2c4f645475be98b7a0176438c9b.1685672395.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1685672395.git.steve@sakoman.com>
References: <cover.1685672395.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Jun 2023 02:22:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182129

From: Archana Polampalli <archana.polampalli@windriver.com>

This is specific to Git-for-Windows.

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/git/git_2.39.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/git/git_2.39.2.bb b/meta/recipes-devtools/git/git_2.39.2.bb
index 222e545f60..9fac9d13f8 100644
--- a/meta/recipes-devtools/git/git_2.39.2.bb
+++ b/meta/recipes-devtools/git/git_2.39.2.bb
@@ -33,6 +33,8 @@ CVE_PRODUCT = "git-scm:git"
 CVE_CHECK_IGNORE += "CVE-2022-24975"
 # This is specific to Git-for-Windows
 CVE_CHECK_IGNORE += "CVE-2022-41953"
+# This is specific to Git-for-Windows
+CVE_CHECK_IGNORE += "CVE-2023-25815"
 
 PACKAGECONFIG ??= "expat curl"
 PACKAGECONFIG[cvsserver] = ""
-- 
2.34.1


