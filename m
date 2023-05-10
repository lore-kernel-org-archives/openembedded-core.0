Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1238C7EE22
	for <webhook@archiver.kernel.org>; Wed, 10 May 2023 14:21:29 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web11.18555.1683728483577402042
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 May 2023 07:21:23 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=HSBg6vGe;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-3f42ba32e24so14645865e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 10 May 2023 07:21:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683728482; x=1686320482;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iM2I1j1TwWmqjtMJc/71L4qlVN0ueG/U5O7TySoYPm4=;
        b=HSBg6vGeVB2xtx/WnXw70o/y580JpqO03QO/1CYaMbeN2K+vDSrPDi021p7lUEycCB
         YHfAhbHxlytMmYQFCbKgd1XnhjbgYysDqDskr7REKB7jd4yFTNgHdG1PnRwGatW5OX75
         GCp/RpiJXqv6LlJHl+Ms/6HKetp9xrl/rTwwP1nyDiz95ujo5odFER9jdlbzsfXOeZRB
         NWCA4Kwk0tNGZ0UGUNNEg9Qaa5wPLjZH2z7bRs0iOAFZrQnJECNz3+6XhQOybwuXiSGF
         bPD8KTXMV3WkQyXl9O2O5dfb8YX6Potsl0+LOTJp+LLJcyieaCo3XvHovCktLbnCPsDb
         DJrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683728482; x=1686320482;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iM2I1j1TwWmqjtMJc/71L4qlVN0ueG/U5O7TySoYPm4=;
        b=Uqm5vvDdPjrUbfe/7mSqmZzu8rB8Qo9pAk6Wbdip1gguyeqBAhJ5xQ7wc4wgZDv36v
         tAIyAUDVx6zpA0k6BZ8GqyroVBslek0pqa/EA5PBp9CeSteiy7D6PBhZieTIRnesuB21
         Qsc8lA6btTtC3NqCfcgzYtCE7QgCnE6wAWfF7b3BJqId1ErR/PBDZU6+7AMe7jlVfDZa
         VOGlit6Fzz7BVOf3wguStQ+bYYOTvwqc8e4kWupIfl2YTMXpic5DT9m8E8dUhTltr9QK
         Xz9n3YfOHK2Q+X4+hwoGo1wqJsnNFCRfjox5r04xCepcggPagnsBLPNROJEBUj3SGBGN
         TuBQ==
X-Gm-Message-State: AC+VfDzOUL1Tuh9Csstu6Aj2z1m99XCb1RIkp2Ta66y7V0Tg04vmon6P
	NNlok/jnpONGnAjhqrv4qUu8s9h8GTg=
X-Google-Smtp-Source: ACHHUZ7dmJRkfIVK61IxtZs8jZuUJ4+TaN2DjcNMOidjPrV+Hr/DmtJrLJblFt9ZDMe4tnCqA3WaCA==
X-Received: by 2002:a7b:cb89:0:b0:3f4:2174:b29b with SMTP id m9-20020a7bcb89000000b003f42174b29bmr8935494wmi.2.1683728481718;
        Wed, 10 May 2023 07:21:21 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id d10-20020a1c730a000000b003f325f0e020sm22803074wmb.47.2023.05.10.07.21.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 May 2023 07:21:21 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Ross Burton <ross.burton@arm.com>,
	Martin Jansa <Martin.Jansa@gmail.com>
Subject: [PATCH] populate_sdk_base.bbclass: respect MLPREFIX for ptest-pkgs's ptest-runner
Date: Wed, 10 May 2023 16:21:14 +0200
Message-Id: <20230510142114.2244860-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 May 2023 14:21:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181111

* since "populate_sdk_base: ensure ptest-pkgs pulls in ptest-runner" change:
  https://git.openembedded.org/openembedded-core/commit/?id=ecff0642be5781f7f6cca617158b04ac9a0e85f0
  in multilib build when building lib32-foo-image it can pick wrong
  ptest-runner package if it was built in the same TMPDIR before the
  image, do_rootfs then fails to find it, if the package manager config
  doesn't have 64-bit feed enabled:

  opkg_prepare_url_for_install: Couldn't find anything to satisfy 'ptest-runner'

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes-recipe/populate_sdk_base.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/populate_sdk_base.bbclass b/meta/classes-recipe/populate_sdk_base.bbclass
index 1c619ef3cf..b23ea26d40 100644
--- a/meta/classes-recipe/populate_sdk_base.bbclass
+++ b/meta/classes-recipe/populate_sdk_base.bbclass
@@ -15,7 +15,7 @@ COMPLEMENTARY_GLOB[staticdev-pkgs] = '*-staticdev'
 COMPLEMENTARY_GLOB[doc-pkgs] = '*-doc'
 COMPLEMENTARY_GLOB[dbg-pkgs] = '*-dbg'
 COMPLEMENTARY_GLOB[src-pkgs] = '*-src'
-COMPLEMENTARY_GLOB[ptest-pkgs] = '*-ptest ptest-runner'
+COMPLEMENTARY_GLOB[ptest-pkgs] = '*-ptest ${MLPREFIX}ptest-runner'
 COMPLEMENTARY_GLOB[bash-completion-pkgs] = '*-bash-completion'
 
 def complementary_globs(featurevar, d):
-- 
2.40.1


