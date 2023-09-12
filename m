Return-Path: <sweng5080@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63696CA0ED6
	for <webhook@archiver.kernel.org>; Tue, 12 Sep 2023 13:44:38 +0000 (UTC)
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
 by mx.groups.io with SMTP id smtpd.web11.25428.1694526269932094958
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Sep 2023 06:44:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=ly8n1An8;
 spf=pass (domain: gmail.com, ip: 209.85.167.174, mailfrom: sweng5080@gmail.com)
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-3a8614fe8c4so4216549b6e.1
        for <openembedded-core@lists.openembedded.org>; Tue, 12 Sep 2023 06:44:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694526269; x=1695131069; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3EymYErvgBrmEDwj/bTztSZln5hGG4nq20Blg4JZi+o=;
        b=ly8n1An8xj50HLsHouDDgrQjc7SkL05Qi5DLWUYXQS3q06qdufQSm48LXpB9q9ghd0
         hun9dEVTmPMRH5xR91xbNpzyY1mGBHDhonlQ+l5vEC98vvD311Uld7xv4vv1pR/pIoBx
         iSX1d0G1bZXV24Ez0bE9mCf9MSTkPIi6BIuB8JoLcQGmhZ9fWY3sfeMMtXct+bfTCTXm
         kAmPx9I9ams0LdszEgEi/0vlebKnrROOqA0BcfgTg+Vh7eut80GtA5/tPKOeQDmOBiXX
         vc+75Y2lUCMonh7L1fNpxEqY+JV/iiK/HTz3Kq7HC7O6p+r1M/Wip/Pte+xC7PwjHJbK
         0yHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694526269; x=1695131069;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3EymYErvgBrmEDwj/bTztSZln5hGG4nq20Blg4JZi+o=;
        b=IJJtFmBbwfvhV6g4/UaxOg93GwkTm15C9Wj9ujCGWGgqzP5kfB6AAia7etv4aOxVd3
         fc59xc0fB0S/KcSqs0sHujlnXZCBduGFdGb+XV/ip0JOWqL7CSPnVd6FPdVbTlUaqbCh
         Rp2wtC6BVZ9yzaJqPTLBa6hCAWl+13t9ONstPnYykeitUkTOH+RHnePGrDgOzHxsbJZw
         4lylh+sMiMAHmmtDeuFXiJX8mx2hzRDIlbfSQzg87SxEYUvh7r9cHbqamqzcMIgEGSvG
         Vc+fWXGoF+DYN4qymm35sNwjyVn0GUSMdArkd+ZEKcJ6hASK7jGdODGY/nQ+61bwAP1P
         L+nw==
X-Gm-Message-State: AOJu0YxDYfTzK+ovx7ugMChJTUsh44gzfLW3Vr7qR7eOkPWdeLYuC66D
	TmwaWE8P723z5gMdlI9VnG1BFXygGPc=
X-Google-Smtp-Source: AGHT+IFw6fKDO9pru21e2hQQUW4XKDNcjtAQCcqIlrjOVnGr4pLb5tCram0r0UFoZ2+3Mz8PwbBGEQ==
X-Received: by 2002:a05:6808:1449:b0:3a3:95f9:c99b with SMTP id x9-20020a056808144900b003a395f9c99bmr16930463oiv.35.1694526268879;
        Tue, 12 Sep 2023 06:44:28 -0700 (PDT)
Received: from OLA-8C2DT13.ad.garmin.com ([204.77.163.55])
        by smtp.gmail.com with ESMTPSA id 22-20020aca1216000000b003aa191afcc3sm4181934ois.50.2023.09.12.06.44.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Sep 2023 06:44:28 -0700 (PDT)
From: JD Schroeder <sweng5080@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: JD Schroeder <sweng5080@gmail.com>
Subject: [PATCH 1/3] meta-selftest/staticids: add nogroup group for distcc
Date: Tue, 12 Sep 2023 08:43:45 -0500
Message-Id: <20230912134347.3355-1-sweng5080@gmail.com>
X-Mailer: git-send-email 2.37.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Sep 2023 13:44:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187512

This patch adds the nogroup to the staticids to help address the
warning about changing the nogroup's gid.

Signed-off-by: JD Schroeder <sweng5080@gmail.com>
---
 meta-selftest/files/static-group | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-selftest/files/static-group b/meta-selftest/files/static-group
index af2fa0f016..4471feb688 100644
--- a/meta-selftest/files/static-group
+++ b/meta-selftest/files/static-group
@@ -26,3 +26,4 @@ wayland:x:526:
 render:x:527:
 sgx:x:528:
 ptest:x:529:
+nogroup:x:530:
-- 
2.37.0


