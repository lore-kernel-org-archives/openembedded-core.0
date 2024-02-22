Return-Path: <pidge@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A5EBC54788
	for <webhook@archiver.kernel.org>; Thu, 22 Feb 2024 14:54:18 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web10.14604.1708613656293431443
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Feb 2024 06:54:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=pOpEawer;
 spf=pass (domain: baylibre.com, ip: 209.85.210.177, mailfrom: pidge@baylibre.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-6e471caaa71so2738139b3a.2
        for <openembedded-core@lists.openembedded.org>; Thu, 22 Feb 2024 06:54:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1708613656; x=1709218456; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2CFclcN12JTKAHVOE7eXKqbPuOKmNPtKLFSRNJbCnVY=;
        b=pOpEawer03dIO7yiJEgfMo3iJPP21vShGaWPyKPcyGsnfR28JAI8aeg8lIMc2HWQ40
         DbaZxaRyx0xKl8QSooN3VUVugQyxJlmVDXl5RU9f5jOVM7snfoyAC5F3yVw/L38x/SX4
         0JQKYmXJ/wuwgMbjo0LKiVEuNXJ7CCuBJhZ/kMmLkbn6gxRkkmdzNe9lRZTpB14TOWdI
         hugWK7FM8TfOkKh4JYsiNXhmWwbmrlYU43aOsllZzhNQaEP1kWhpYShgnrZzoaQcJQvN
         uJsffFVJwlqKAHsjuXKu7etMnx1VReidIREME5KtOz9HYGT9uMjpV1qwRI62QnIzbOzu
         iIDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708613656; x=1709218456;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2CFclcN12JTKAHVOE7eXKqbPuOKmNPtKLFSRNJbCnVY=;
        b=KWbK8te4UBvcGpLg2/CotYEtb3Hwrwu1NJRo9x+cXTSkgcZEfy+iMGOfdjPqwvfW5w
         TiYi/5vc8a/2chZJBr2CAgFqVUmi9BgJOHn5iHClWNlfQJUxOEelPXU48ZN3zEelSFB9
         c2Shru+I/AMnaCDbLrnDUpwfWwO+dOETXuOJ5DUHPe9WMwBP5cT7Hpl1EzMfoZmlg67y
         +FXRKF2YgFXINCtyIsflEJ5l7T7TOsBDfgvsD6J/gQscfOmvECLHmwYA4IJiB4xM/mos
         IcQNui6sOe8xCyjA10/0N2rm6MpLei/CP/fnInL6vU7rxCUS0+SCIZ8oaI7DSelvhmWW
         k+EQ==
X-Gm-Message-State: AOJu0YwaWdUITdzt+N6hSQiAGfNc6qwdJqWnswXM4Dw6hgtIo9PQqNnn
	Vj2TVAYbMeD2bB95/zIpiePjTEIRsL597hw7p9D7QELr9g6CY0dx++Zgvjsk+IGkET3PEVmHyDZ
	V5ms=
X-Google-Smtp-Source: AGHT+IEma1ZjwQFEcX8OqmxmGvwhBkpq1QKBGF4HZ1jLBqiOlgjXmtAGRMCkW52bVYbVcFbGbF5gNA==
X-Received: by 2002:a05:6a20:c890:b0:19b:a07a:344d with SMTP id hb16-20020a056a20c89000b0019ba07a344dmr21289739pzb.7.1708613655808;
        Thu, 22 Feb 2024 06:54:15 -0800 (PST)
Received: from orm.fritz.box ([194.110.145.164])
        by smtp.gmail.com with ESMTPSA id sz5-20020a17090b2d4500b00298cc4c56cdsm4067410pjb.22.2024.02.22.06.54.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Feb 2024 06:54:15 -0800 (PST)
From: =?UTF-8?q?Eil=C3=ADs=20=27pidge=27=20N=C3=AD=20Fhlannag=C3=A1in?= <pidge@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Piotr=20=C5=81obacz?= <p.lobacz@welotec.com>,
	=?UTF-8?q?Eil=C3=ADs=20=27pidge=27=20N=C3=AD=20Fhlannag=C3=A1in?= <pidge@baylibre.com>
Subject: [PATCH 3/3] creategroup*: Remove coreutils-native as a DEPENDS
Date: Thu, 22 Feb 2024 14:53:56 +0000
Message-Id: <97cfc595eab6c1a79a010719eee60c6fef96e998.1708613381.git.pidge@baylibre.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1708613381.git.pidge@baylibre.com>
References: <cover.1708613381.git.pidge@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 Feb 2024 14:54:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196033

There isn't any reason for coreutils-native as a DEPENDS, so
remove it to speed up tests.

Signed-off-by: Eilís 'pidge' Ní Fhlannagáin <pidge@baylibre.com>
---
 meta-selftest/recipes-test/selftest-users/creategroup1.bb | 2 --
 meta-selftest/recipes-test/selftest-users/creategroup2.bb | 1 -
 2 files changed, 3 deletions(-)

diff --git a/meta-selftest/recipes-test/selftest-users/creategroup1.bb b/meta-selftest/recipes-test/selftest-users/creategroup1.bb
index ebbbfaa83d..afd23ed1ee 100644
--- a/meta-selftest/recipes-test/selftest-users/creategroup1.bb
+++ b/meta-selftest/recipes-test/selftest-users/creategroup1.bb
@@ -3,8 +3,6 @@ LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda
 
 LICENSE = "MIT"
 
-DEPENDS = "coreutils-native"
-
 S = "${WORKDIR}"
 
 inherit useradd allarch
diff --git a/meta-selftest/recipes-test/selftest-users/creategroup2.bb b/meta-selftest/recipes-test/selftest-users/creategroup2.bb
index ef697f09b4..f776f43aed 100644
--- a/meta-selftest/recipes-test/selftest-users/creategroup2.bb
+++ b/meta-selftest/recipes-test/selftest-users/creategroup2.bb
@@ -3,7 +3,6 @@ LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda
 
 LICENSE = "MIT"
 
-DEPENDS = "coreutils-native"
 USERADD_DEPENDS = "creategroup1"
 
 S = "${WORKDIR}"
-- 
2.34.1


