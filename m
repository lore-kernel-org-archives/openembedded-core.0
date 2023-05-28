Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11067C77B7C
	for <webhook@archiver.kernel.org>; Sun, 28 May 2023 11:09:47 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web11.27020.1685272181907557804
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 May 2023 04:09:42 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=GyPo2H6p;
 spf=pass (domain: gmail.com, ip: 209.85.208.49, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-51403554f1dso3586078a12.1
        for <openembedded-core@lists.openembedded.org>; Sun, 28 May 2023 04:09:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685272180; x=1687864180;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zV/JwTeEKzJPpTNEajB7z60+5d9PFz/zWbN+0PkP5gM=;
        b=GyPo2H6piV7KcE8DydIiedy13nbm/xQaEWRTb5S3cDpWmB8Ez+z/xPQH7NtABYUt8r
         cyYjOJx66deruIPEmKtoRNfUj3xPY2qQhQjQrlRW6rdo28T8WR8rs0uX+YExJjWCHhGL
         QNpJJfSo163qIc5sPPYzwd8MPoqCO80CttCaOWI5uSqE6sv0eUcjtdxDyD9kiya04v3N
         o2pzkrNRgsQegWExAQGsznyoPjqC4aio3n4EKTDPVyJZztvsuDgA+jAdV2J9ewN2XetD
         AvqR08kS6v4ypJXgkc1zIiIaX59bTCYr59UPo4PMLLOXv3WMBBAJ8VlpOa+NYmpF1QYC
         5qsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685272180; x=1687864180;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zV/JwTeEKzJPpTNEajB7z60+5d9PFz/zWbN+0PkP5gM=;
        b=QvJ040ZJf5pRWT4ceGAX9iGs92S60UWq4yP+3PqsFihcQp/9X9pVHLRubX/C5MTrJW
         oSEysbjPB8gdcSYQG+YmiHLUJzdmT2QDr1oUxVbFm1VDgIs4oM/mb2A28ZgPqYkMey7H
         IOe2U3t5+xRnS3r5GPTSopK3UKT6IGVezFZxm1K/oOyicqS4mjmy4lDGcruiKRKxueAZ
         zaoeOOJgFQL37S0+yBg1iadjNzUjr5D9G3TluPiStbN5UizqBzNzzeGcyuEPApRQJYei
         IBdsIeV1Ruot0U/JoQykw7tUVNRfl6Yc3ZUHTsStdXYhI9pIz2xzQrawY2jcGUeUihYC
         LwPg==
X-Gm-Message-State: AC+VfDwwFuW9U6bhtTjvb+56EzTZYpPDJcAfiIAo5aQ4oWqz5uqwZyVS
	yDj+Gb3zgcBquzwaNiK9VRDdwaNwo+E=
X-Google-Smtp-Source: ACHHUZ53NIS+583PHi6GMUN6wff7MClWvxxjODfpdFM0LNTMCdbgmyCjDYqodIqYWtJmRKBnBzjHog==
X-Received: by 2002:a05:6402:32b:b0:514:95d5:3994 with SMTP id q11-20020a056402032b00b0051495d53994mr2160368edw.32.1685272180093;
        Sun, 28 May 2023 04:09:40 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id z25-20020aa7cf99000000b00509dfb39b52sm1923940edx.37.2023.05.28.04.09.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 May 2023 04:09:39 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [mickledore][PATCH] populate_sdk_base.bbclass: respect MLPREFIX for ptest-pkgs's ptest-runner
Date: Sun, 28 May 2023 13:09:29 +0200
Message-Id: <20230528110929.4175431-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 28 May 2023 11:09:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181815

* since "populate_sdk_base: ensure ptest-pkgs pulls in ptest-runner" change:
  https://git.openembedded.org/openembedded-core/commit/?id=ecff0642be5781f7f6cca617158b04ac9a0e85f0
  in multilib build when building lib32-foo-image it can pick wrong
  ptest-runner package if it was built in the same TMPDIR before the
  image, do_rootfs then fails to find it, if the package manager config
  doesn't have 64-bit feed enabled:

  opkg_prepare_url_for_install: Couldn't find anything to satisfy 'ptest-runner'

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
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


