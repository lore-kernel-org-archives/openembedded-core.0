Return-Path: <matthias.schoepfer@googlemail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95413EDE9A4
	for <webhook@archiver.kernel.org>; Thu, 14 Sep 2023 10:51:07 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.web11.9007.1694688657054941045
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Sep 2023 03:50:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@googlemail.com header.s=20221208 header.b=sAi1S0D+;
 spf=pass (domain: googlemail.com, ip: 209.85.167.41, mailfrom: matthias.schoepfer@googlemail.com)
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5008d16cc36so1382264e87.2
        for <openembedded-core@lists.openembedded.org>; Thu, 14 Sep 2023 03:50:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20221208; t=1694688655; x=1695293455; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=C6oBj8kqnMqGyUpkywWaDsvZD5JJEQtW316rTvxgzEE=;
        b=sAi1S0D+MXqIhxblmtRUIH3eh6JtIe5OBCzBfC4IjpWNjNzTDH/qGUH61Td5OW9sUF
         hW/VA1JO0shRWJdhN0uddwdLqcSzSg2DMEObaZJNwWwKHHLhsi0G4HDFvC8q9uxBame6
         GYpejNjNqQweVasezPQn9mtT1J3GdR+7y/fSKgLyifM9kvZ72tfeXNcmdOpwAhmpqH6r
         u0jKg4klqbKergZKeTFgD5Dp53k0q/6dFrZotpaXw6KCLk73V5kfcWO7SAscsmM1A3/z
         1+CETswAtz0ZN0xtgZJWjUVR1a5CCVxr7FJVAETFCsSE+2KTwcjz90DHxSTvC2w9AW6N
         uKQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694688655; x=1695293455;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C6oBj8kqnMqGyUpkywWaDsvZD5JJEQtW316rTvxgzEE=;
        b=AhdgnsZNGZpAmIxUNB8cZlQn3YLjKzpwu+WzwD1cTvVB+GGk/yy7urrhsUiddw5cSy
         /o237K2C1Ss1Cfz0dH6R7SFfgSDPZaehp0UnOEP8GI2xSviZ9XzNuIjMfW177ZuPqZQ0
         +l39V420ECvdlJTiqBKFD0KwJFezP5YqBwPPv/5ya9rURYiyoxQ5JfiSKenIYn4DTmuA
         INPKd/rb2j6U13eqWwfqOd3VVndg9LtWGqznDqRxbztCbnEqmEDBCg2x/KqNeid506Ip
         0AkLbCCEEwjhjYXckIpnu1L0Swvj7MeEwh8hkcJcXfDJ5h1smxNO0v6SbQv6+3PINpuF
         j4yA==
X-Gm-Message-State: AOJu0YypHF/UBKKpRyxr1aM1ZI/xGpCsBp7DfvVYsk7icJL9h/kTeizO
	8inawuMvtGpsRruXpJGpBjzFLXGFPXQ=
X-Google-Smtp-Source: AGHT+IH7mi+Hfe5Ozr6Sr++xoiUHrGuBVY62ohYBn2uxh65wV6mPLt9feZYuAqBA6DSQFx+B3qr97A==
X-Received: by 2002:a05:6512:2521:b0:4fe:629:9265 with SMTP id be33-20020a056512252100b004fe06299265mr4537207lfb.20.1694688654781;
        Thu, 14 Sep 2023 03:50:54 -0700 (PDT)
Received: from charlotte.. (i689776AC.versanet.de. [104.151.118.172])
        by smtp.gmail.com with ESMTPSA id g12-20020aa7c84c000000b0052ff9bae873sm762318edt.5.2023.09.14.03.50.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Sep 2023 03:50:54 -0700 (PDT)
From: Matthias Schoepfer <matthias.schoepfer@googlemail.com>
X-Google-Original-From: Matthias Schoepfer <m.schoepfer@rethinkrobotics.com>
To: openembedded-core@lists.openembedded.org
Cc: Matthias Schoepfer <m.schoepfer@rethinkrobotics.com>
Subject: [PATCH] removing PN from BB_HASH_CODEPARSER_VALS
Date: Thu, 14 Sep 2023 12:50:52 +0200
Message-Id: <20230914105052.112829-1-m.schoepfer@rethinkrobotics.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Sep 2023 10:51:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187632

When using icecc.bbclass for builds, the build will break
due to the fact, that during parsing stage, PN is set to
no-pn, which leads to the issue that the ICECC_RECIPE_DISABLE
recipes (appended or within icecc.bbclass) are no longer
parsed / ignored correctly. This will lead to an error.

Unfortunately, it is not sufficient to set the
BB_HASH_CODEPARSER_VALS in the local.conf.

Fixes [YOCTO #15213]

Signed-off-by: Matthias Schoepfer <m.schoepfer@rethinkrobotics.com>
---
 meta/conf/bitbake.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 8b26461874..a9d851c87c 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -961,7 +961,7 @@ BB_SIGNATURE_EXCLUDE_FLAGS ?= "doc deps depends \
     sstate-lockfile-shared prefuncs postfuncs export_func deptask rdeptask \
     recrdeptask nodeprrecs stamp-extra-info sstate-outputdirs filename lineno \
     progress mcdepends number_threads"
-BB_HASH_CODEPARSER_VALS = "LOGFIFO=/ T=/ WORKDIR=/ DATE=1234 TIME=1234 PV=0.0-1 PN=no-pn METADATA_REVISION=1234 SRC_URI="
+BB_HASH_CODEPARSER_VALS = "LOGFIFO=/ T=/ WORKDIR=/ DATE=1234 TIME=1234 PV=0.0-1 METADATA_REVISION=1234 SRC_URI="
 
 MLPREFIX ??= ""
 MULTILIB_VARIANTS ??= ""
-- 
2.34.1


