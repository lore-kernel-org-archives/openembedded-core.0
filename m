Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B25ACC001B1
	for <webhook@archiver.kernel.org>; Thu, 22 Jun 2023 17:11:18 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web11.17334.1687453872299458015
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Jun 2023 10:11:12 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=WPA7RAw4;
 spf=pass (domain: gmail.com, ip: 209.85.218.50, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-98cd280cf94so239533466b.1
        for <openembedded-core@lists.openembedded.org>; Thu, 22 Jun 2023 10:11:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687453870; x=1690045870;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UJdi2W7eQjewNQILqxtGVlJpVZ+0LilyZ5SEztoHKLI=;
        b=WPA7RAw49WrZJM5iKAdOz7h3Oj/fj1t/ZlRhPQulmaNSY8jxZJDNGVXKFwvlQlUkqP
         HhEI2TcXGSrot5LxKGAGhc41EDVl/MrWVEDTgIeapZWJifBd//akhQT5I61wkfOHUYDy
         oKR2VzPvB57MSFucGKL7cPyaisWAyG7CvOpUlgu3mTODmQ7q5A6qw2lgrsVWZiq1dJa8
         7R5nRCpzCsRAOBsn692LKBlT5txveTYZUZ3DupkYehDClEhlizK4bjuD9JYsluUdwxuJ
         edhq2QPsLhiqfusdJ6AUPvuWHX5a6XglO+j+696oCJnKSYRNAA8ltRUrSiwFkkUM16+c
         CjVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687453870; x=1690045870;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UJdi2W7eQjewNQILqxtGVlJpVZ+0LilyZ5SEztoHKLI=;
        b=IeYTUPKoSjOjkhH2m1tobRZjICZlAM4PrPe+1mBZc6FDmzyK+DAvyFUmitozEgVGEE
         sXPgfLYLHy9hUxP/TJM7eAQKl/cDx3F2JQotyiY1RxfDeOFNtCnSnZmLqxdLdRJuolBV
         N8rgvQGDuYUiHlQVdpmsDVvxodnAn3a3a/DdiFFnXzpwuAVNwUhramgF1aWgEc95neoW
         Uc9iRMM6an2M3mG3I6MFoPn8ctc7goeDIXlM14seQnB5WQdFyLgPdBDWGXQE0bz4sJzo
         Xua4GwsiZRKgUXOOPVhr7EGGa01jumXj1hn6nAgAyANIhmhIIntgEj0wzJCxlfA6Wnr5
         yR2g==
X-Gm-Message-State: AC+VfDxdAi/4VBdxiPrvWHIcuKy+Xdr7TrYNOCeqm4+LUp7IwWhO+LjG
	Nv3FbXhYr4bTBlm4avkbV+6n/uMXeDU=
X-Google-Smtp-Source: ACHHUZ6HZHjO3yTmJubhFrijXGEMSBEzl36GMgvm9HbNn+qKBLWyaMtB3Y3oHiKu52ihvLTJ6d7XmQ==
X-Received: by 2002:a17:907:7faa:b0:988:2037:c688 with SMTP id qk42-20020a1709077faa00b009882037c688mr16444434ejc.65.1687453870383;
        Thu, 22 Jun 2023 10:11:10 -0700 (PDT)
Received: from t14s-af.fritz.box ([2a02:169:59a6:0:5488:f785:9061:cf6c])
        by smtp.gmail.com with ESMTPSA id m12-20020a1709062acc00b00982b8cd7a44sm4917053eje.139.2023.06.22.10.11.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jun 2023 10:11:09 -0700 (PDT)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 4/9] runqemu-ifup: remove only our taps
Date: Thu, 22 Jun 2023 19:01:24 +0200
Message-ID: <20230622170946.10082-5-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230622170946.10082-1-adrian.freihofer@siemens.com>
References: <20230622170946.10082-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 Jun 2023 17:11:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183281

If there are other tap interfaces than the interfaces created by the
runqemu-* scripts, these interfaces are not ignored. This is now fixed
by filtering the interfaces for a specific prefix in the interface name.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 scripts/runqemu-ifup | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/runqemu-ifup b/scripts/runqemu-ifup
index fe4492e78b7..c65ceaf1c83 100755
--- a/scripts/runqemu-ifup
+++ b/scripts/runqemu-ifup
@@ -45,7 +45,7 @@ if [ -z "$OE_TAP_NAME" ]; then
 fi
 
 if taps=$(ip tuntap list 2>/dev/null); then
-	tap_no_last=$(echo "$taps" |cut -f 1 -d ":" |sed "s/$OE_TAP_NAME//g" | sort -rn | head -n 1)
+	tap_no_last=$(echo "$taps" |cut -f 1 -d ":" |grep -E "^$OE_TAP_NAME.*" |sed "s/$OE_TAP_NAME//g" | sort -rn | head -n 1)
 	if [ -z "$tap_no_last" ]; then
 		tap_no=0
 	else
-- 
2.41.0


