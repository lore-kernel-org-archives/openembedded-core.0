Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76FAEC6FD1F
	for <webhook@archiver.kernel.org>; Wed, 20 Mar 2024 16:10:33 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web10.49260.1710951029214878254
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Mar 2024 09:10:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=AoQ16KNs;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.177, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1dddb160a37so50161765ad.2
        for <openembedded-core@lists.openembedded.org>; Wed, 20 Mar 2024 09:10:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1710951028; x=1711555828; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5TVSUgBG3OdQoN8sz4qt1bkOjb7zd40el4oOJemiZno=;
        b=AoQ16KNs8dfTxFP0ntBPjtRTBMAtfLXZvlBre1mqKCgpe/29OHYnkNCWPPfKHqxuEp
         rKP/wD/UU+zYFFOyPP2dIugmry28nnkhsJBhJRxa3prTJiLKOVjL7MiConqcLW2dKd0A
         CAGt7cUfwrdiN6xEEJFFEUhxu3Pabz2qr/GzQQ/U/+Eg23P89dJGXEYRKZ9zIsDfP/WA
         rwYNwH8rPF+dso39Mlz7S7a6etizfoSxVLGKMvTtNyqbcog89eHCTfYTfrgQcmkJMvg2
         VEwTF+TZFv14G77isFt/ojcDmVNlo2XvuGOLjeK0uL/7oYbXjsZjoah/ghg2PR0V3TL8
         w5Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710951028; x=1711555828;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5TVSUgBG3OdQoN8sz4qt1bkOjb7zd40el4oOJemiZno=;
        b=UAIZ3HNxobai5f5Yr9TeCTNVqNHXrlSDiGSASQ4JwbS/uKyp1NA+waP4o4FimzgdMO
         5kykFzHZab1DTnaPk7xlbW3EhCxjwWI0octgk+x9l8eETTk/ENh+seB1nNm4T+JAB6XI
         6JaKFO627uT0iez6jfYWAB5GqCKx4+ChnlKT57A+7x4dXEL8WY/xZCAcYVTg/fonu+CB
         MLPc6JtRdjgOvuU8GWBm5zVrWvGCnYWSFTQzF8m0abjSlB0Iduj24ygHHMfING9S/ePJ
         063DTcuD/Oj69a07X5+CoIiemSBtHCjge4clqIEy+QlJzaHxkbAAPIOMaLFukjkKN/ea
         iLYw==
X-Gm-Message-State: AOJu0YxwWWBL37qD3dLKkz+aimzxdV9t8FLeFdW83iFtfUcWErcZYsS3
	xZPPO5RANvZ8obWm2kMgACl/h9eRhbaxUA/3IcvrB9johmdcYsyblJf0k2q+dWBg6ymqheraZlM
	GYrE=
X-Google-Smtp-Source: AGHT+IEoe2d7E226qE9Q7k78QH6kTtjcl0YaGBiBMtAuVfZh2bk7oL78Rod/xLLzjb6Rl1VIwPHywQ==
X-Received: by 2002:a17:902:a507:b0:1e0:30ca:61e with SMTP id s7-20020a170902a50700b001e030ca061emr6304056plq.5.1710951028446;
        Wed, 20 Mar 2024 09:10:28 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id l18-20020a170903121200b001ddc93c5759sm13775694plh.196.2024.03.20.09.10.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Mar 2024 09:10:28 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 06/15] cve-update-nvd2-native: Remove duplicated CVE_CHECK_DB_FILE definition
Date: Wed, 20 Mar 2024 06:09:44 -1000
Message-Id: <b6285f0549d1c708adfe147c63eb6cda24462ff3.1710950846.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1710950846.git.steve@sakoman.com>
References: <cover.1710950846.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Mar 2024 16:10:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197377

From: Yoann Congal <yoann.congal@smile.fr>

CVE_CHECK_DB_FILE is already defined in cve-check.bbclass which is
always inherited in cve-update-nvd2-native (There is a check line 40).

Remove it to avoid confusion. Otherwise, this should not change
anything.

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit e5f3f223885c17b7007c310273fc7c80b90a4105)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/meta/cve-update-nvd2-native.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-core/meta/cve-update-nvd2-native.bb b/meta/recipes-core/meta/cve-update-nvd2-native.bb
index af21989d58..506b4b6bbf 100644
--- a/meta/recipes-core/meta/cve-update-nvd2-native.bb
+++ b/meta/recipes-core/meta/cve-update-nvd2-native.bb
@@ -37,8 +37,6 @@ CVE_DB_UPDATE_ATTEMPTS ?= "5"
 
 CVE_DB_TEMP_FILE ?= "${CVE_CHECK_DB_DIR}/temp_nvdcve_2.db"
 
-CVE_CHECK_DB_FILE ?= "${CVE_CHECK_DB_DIR}/nvdcve_2.db"
-
 python () {
     if not bb.data.inherits_class("cve-check", d):
         raise bb.parse.SkipRecipe("Skip recipe when cve-check class is not loaded.")
-- 
2.34.1


