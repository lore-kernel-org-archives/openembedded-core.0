Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07311CD11DF
	for <webhook@archiver.kernel.org>; Wed, 20 Mar 2024 16:44:34 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web10.50324.1710953066702142158
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Mar 2024 09:44:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=etwyADcq;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.177, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-6e74bd85f26so91303b3a.1
        for <openembedded-core@lists.openembedded.org>; Wed, 20 Mar 2024 09:44:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1710953066; x=1711557866; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5TVSUgBG3OdQoN8sz4qt1bkOjb7zd40el4oOJemiZno=;
        b=etwyADcqKOUv1Xy8wQFl/NRvdCgg+P8LzZwsAUhFW0MiNkPQSCZKBYSxF80Sa3dbW2
         gVD52kNf4+DsmZBK5WBYeELdKKFWFLm4jSQr22I+oW/viy5ygHx3RDZ3bh9qQRVxz61F
         igpMWTybUQmr8Ny05X4GOnAWDjhNxEbwRjGkSw34IOAFrtbmFklyxym3NfqlzAz2lS2d
         Q4K1FPYatI6+wN1BXadgtcqFJq7YzY4VvAd5Xjg9xWQMZaxvHKlr01nSx4QseeHzvDVl
         nVgtS0dLv237vOZk3ByLuIQxt+NEfHPrMYV1v3k0vtx4OPkCGV+h3nYOjp395Pf6mWWV
         1Pbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710953066; x=1711557866;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5TVSUgBG3OdQoN8sz4qt1bkOjb7zd40el4oOJemiZno=;
        b=BYcHGK18giUUJ7szMLJafVfpgFO4qvneymohtdYy83XAYwxVqvzbe0iIaiziJHOAHI
         H00UMTpyC6eiFPoMphw43qkl33Yc724H69tR+ftP7vDoXPqHJMCU9i+3PaPCsBmS2Ezw
         4qkBCYFJ72SzWvGcZyiIoRNPH+IzBG316wqx6WCpd5Yuc3rvXLf7twGHmWioCWnmkLnJ
         juvxxzczmMLb9134wKXzc5FNVobRcE1GUY7JBOhSmGX08YPgNo7zyyJNWtXYj/YN+7P9
         Gk51DYTLOOubzGaWDVZ4uu7Jbo3mVQBKSCfsFXJmnwYmlXUgWTb7C0x1J6OK2r6dBWUg
         jQvQ==
X-Gm-Message-State: AOJu0Yy8XFQWAceij8tKTQ5rMdQOoIcnsnBhffoqLqJspNEs4WgC6xsT
	PF7fWMAc5N1nGgKms17KGGJnLIe538gVtR2SvF3mTor0OOeyUWPGyaW4Ab6P7yJlZyuGMTdAYZ5
	purY=
X-Google-Smtp-Source: AGHT+IGx94DuRudOaeigOC0KDroYfhOy8H8zMU0okgbIW32KNUGPu4kcDLB4OKiOlnZNtLXtLSq4GQ==
X-Received: by 2002:a62:d153:0:b0:6e6:fcd4:5a23 with SMTP id t19-20020a62d153000000b006e6fcd45a23mr12363114pfl.32.1710953065796;
        Wed, 20 Mar 2024 09:44:25 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id a3-20020a62d403000000b006e6bfff6085sm12725437pfh.143.2024.03.20.09.44.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Mar 2024 09:44:25 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 04/12] cve-update-nvd2-native: Remove duplicated CVE_CHECK_DB_FILE definition
Date: Wed, 20 Mar 2024 06:43:58 -1000
Message-Id: <4268128167386298c8a7777ce3d3b5e7517bb366.1710952928.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1710952928.git.steve@sakoman.com>
References: <cover.1710952928.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Mar 2024 16:44:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197391

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


