Return-Path: <danismostlikely@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BC99C02192
	for <webhook@archiver.kernel.org>; Wed,  5 Feb 2025 17:05:39 +0000 (UTC)
Received: from mail-io1-f50.google.com (mail-io1-f50.google.com [209.85.166.50])
 by mx.groups.io with SMTP id smtpd.web10.17671.1738775134951440474
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Feb 2025 09:05:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kEZj3oXU;
 spf=pass (domain: gmail.com, ip: 209.85.166.50, mailfrom: danismostlikely@gmail.com)
Received: by mail-io1-f50.google.com with SMTP id ca18e2360f4ac-844ce213af6so1076939f.1
        for <openembedded-core@lists.openembedded.org>; Wed, 05 Feb 2025 09:05:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738775134; x=1739379934; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nz4E6aoqnuSY0l5h427r+kmFYXgX+ptIwJ6/t2cwuQI=;
        b=kEZj3oXU0nRXcCL8y7O0NmYb++y3/zu3KtitcKXnPBUyr6EKPiR8BLMIqu9XbX6UGD
         QavYHNUXWuCSLmb0sF720NOAAp+855wkadVI4rSW1RNGJ3oXDAMqnsWc2wxuKCjJH8Fg
         Gg+VW2tPv6GTsuTr/uEuEOtMx86EMlpFc88t8v6J0kQsakExVgLTGS0DoMiCWo1Fi5jo
         Z48EcJAnw8pfgLbs6sksuF+POwQs0ZmcvJ5kadvL+28xIkwIVki2oUT5I+Q/ERgrsIAt
         ZRwqJ8ocLFzMgcKFP+OUDXbCsq08VgPPupwuJ+3TKPWhIjQiZ8+xPGc3UxMZ0MK3GGZ1
         IGAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738775134; x=1739379934;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nz4E6aoqnuSY0l5h427r+kmFYXgX+ptIwJ6/t2cwuQI=;
        b=EQuLErr+YGisdygk3XirHeMaQj5Nd0o93rXnZJUHCn6fR3HnQNPAy/yadyef2NfJXq
         XbMjCaNaqoBmoEdDptFVV3X9c35UC5jEcFTAg2kI4biaSXDD0F+OSzmxZUs/UbOl3ryg
         GJ3YqGRG81IXa5iHWDocLWKwUlu8B42j3KarmiK4Z0KALnP52pEAxmF06Szh3zz6VL5j
         Q/3/UxCNgTlZ0VskgIVD6YDYXRPmHGgLvhRAon14DuJsBMe+XwxME4ANA36NeohamDIr
         qcO7cF+LUoTSA4MEmEgcpWE/uys4Cd5wSIC1puIDZDTgR/8Twdzy92KsDPaDvPDHgpyO
         ay4Q==
X-Gm-Message-State: AOJu0YyKnTUCOtTGkNt7QwmU9KmIGpF9Alw6W1oM5Y8Km/mdLZqzka+6
	XPakBDq6+8AJHoZfIKjkuBJcOh4nmvd48BO3Wq6lntrlxYBP6bbH4KkhxQ==
X-Gm-Gg: ASbGncseTGftIA51DfSIZC5Qoi8W9CvCCWmT3S3WO/QZHRdBez1fM8Y/4QdHH17tTk7
	Q7VntfhCn2CqFNNElmFGuF3BvUWI8mmsslAI2x3M7QQTi1MZE8Y0BcLzxfSQCRcRxI9YPGA2URB
	tMmuKs4mpcUYWINpW3kNBeO0Gd6EzTAKvMuzZ7i54uhN1zLj1Tf67zLzpucf6Gl0sf9eC36Md8W
	hp84Q1/22NTWrCozSx4m322nQAOieBQjSS71jg9FQb9eAMt6rh5KYl8hZGoWxJsS26v44Q2JHIO
	IATsAMe/4Oscw8PACPhyCqyDab7+OaB2RNMYMTEF
X-Google-Smtp-Source: AGHT+IET2RfSwsgEROWJexqrdc9ATEz5bTuyyoI8eIRhyrMKqYSuchQVuzLeAwqarD09abqnuqhwQQ==
X-Received: by 2002:a05:6e02:f:b0:3ce:7fc3:9f76 with SMTP id e9e14a558f8ab-3d04f427293mr38213445ab.6.1738775132134;
        Wed, 05 Feb 2025 09:05:32 -0800 (PST)
Received: from nebuchadnezzar.home.arpa ([204.83.204.143])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3d00a4fd6aasm34929795ab.15.2025.02.05.09.05.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 09:05:31 -0800 (PST)
From: Dan McGregor <danismostlikely@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Daniel McGregor <daniel.mcgregor@vecima.com>
Subject: [PATCH] rpm: add PACKAGECONFIG dependencies
Date: Wed,  5 Feb 2025 11:05:27 -0600
Message-ID: <20250205170527.11723-1-danismostlikely@gmail.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Feb 2025 17:05:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210870

From: Daniel McGregor <daniel.mcgregor@vecima.com>

The cap and acl configs were missing dependency specifications. They
could get satisfied transitively if archive was also used, but alone
get missed.

Signed-off-by: Daniel McGregor <daniel.mcgregor@vecima.com>
---
 meta/recipes-devtools/rpm/rpm_4.20.0.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/rpm/rpm_4.20.0.bb b/meta/recipes-devtools/rpm/rpm_4.20.0.bb
index 6c995ff50c3..45487ad32c4 100644
--- a/meta/recipes-devtools/rpm/rpm_4.20.0.bb
+++ b/meta/recipes-devtools/rpm/rpm_4.20.0.bb
@@ -70,8 +70,8 @@ PACKAGECONFIG[testsuite] = "-DENABLE_TESTSUITE=ON,-DENABLE_TESTSUITE=OFF"
 # has replaced openpgp support and is written in rust: https://fedoraproject.org/wiki/Changes/RpmSequoia
 PACKAGECONFIG[sequoia] = "-DWITH_SEQUOIA=ON,-DWITH_SEQUOIA=OFF,rpm-sequoia"
 
-PACKAGECONFIG[cap] = "-DWITH_CAP=ON,-DWITH_CAP=OFF"
-PACKAGECONFIG[acl] = "-DWITH_ACL=ON,-DWITH_ACL=OFF"
+PACKAGECONFIG[cap] = "-DWITH_CAP=ON,-DWITH_CAP=OFF,libcap"
+PACKAGECONFIG[acl] = "-DWITH_ACL=ON,-DWITH_ACL=OFF,acl"
 PACKAGECONFIG[archive] = "-DWITH_ARCHIVE=ON,-DWITH_ARCHIVE=OFF,libarchive"
 PACKAGECONFIG[selinux] = "-DWITH_SELINUX=ON,-DWITH_SELINUX=OFF,libselinux"
 PACKAGECONFIG[dbus] = "-DWITH_DBUS=ON,-DWITH_DBUS=OFF"
-- 
2.47.0


