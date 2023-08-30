Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED09DC83F18
	for <webhook@archiver.kernel.org>; Wed, 30 Aug 2023 17:49:09 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web11.1285.1693417742353137599
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Aug 2023 10:49:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=2kmdsY7h;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.169, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-68bed286169so4989368b3a.1
        for <openembedded-core@lists.openembedded.org>; Wed, 30 Aug 2023 10:49:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1693417741; x=1694022541; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7ikBdKbffiMK3Hqf8Y6j/StX2Tmh0ZiMYRNalirBmew=;
        b=2kmdsY7hFzX4qpH8qO9XRQ4qLpvzB+DY2kO7estV5Ye/1tyftJ0zqmc8tYYXLFutXM
         0cxtmjmkewVvWgUPAGjGs+FdNvzThoTMMAiqvF97hPveLrDlFcMalxMzT7LCukjGnQds
         yTmJXpH5pPrQBRuNX4N7Bgo8HSAgNwZH3UBa90T/rRQpS39cPWh0EcGojwP3wK6JZK8W
         oUcfydIOI+f2yenc4VYV/0xiIcfCOb3ubnLyvAJ8nV1sIG0c9LvUB34YXdTpXowuz5sg
         vByBYiL0KyJfUBaQTbYSpS0GOFzIN4XCCiVDMZPOt+VV8yby3cJpj89Lqj0JNL4cdO3F
         GrOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693417741; x=1694022541;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7ikBdKbffiMK3Hqf8Y6j/StX2Tmh0ZiMYRNalirBmew=;
        b=kALBd9xURaY4ByJ35/BPXVTR3FP6H4iuu4abd9qHmwS4XI/oFf/vHyCGReTC7ZAwa8
         GLHemDDQpVhgnJ8uAhLvomHqnAKuNNabw6AiD/pEYDlkJvTAai2HqlrswKZWh44kbjfh
         +0CoOTRGpMrTK3O0cNJX0ObA7Hd1wquUvZzM4apgcLThiVmTyVfWSbC05idiglO//c5W
         L0IPQWaEfleMirQ/pAdEiGEO+d2cBDQueyuYD1rhu9UkH91gWqRNQxOYkwV7qZ7QWoyC
         HZrusHlN4hfdzo7ESYSmZFYPCs6eo3jJd1r15l1sjrHN3BYVg00nn8Nzj9ZMKrQdyXcM
         A+lQ==
X-Gm-Message-State: AOJu0YyK87K6oO5bG6DcQnju615zurW3tvPk9X7NZORd+Jc/mR+oC9N+
	MXl71COHHcMpdRx/YoAwr6JVHdkj1zHu1Ko05VE=
X-Google-Smtp-Source: AGHT+IFGuajK70a5znh0Q7dYt6NOJB0zW3N/s83vt2jgTVhBqrE/ayNGi39g5deEm4HqMde1DICI1g==
X-Received: by 2002:a05:6a00:1406:b0:68b:e801:e34d with SMTP id l6-20020a056a00140600b0068be801e34dmr3113484pfu.29.1693417741503;
        Wed, 30 Aug 2023 10:49:01 -0700 (PDT)
Received: from xps13.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id fm14-20020a056a002f8e00b006889348ba6dsm10567578pfb.93.2023.08.30.10.49.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Aug 2023 10:49:01 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 14/20] build-sysroots: Add SUMMARY field
Date: Wed, 30 Aug 2023 07:48:18 -1000
Message-Id: <ff7bb864d89ec8c2da707cc7d3cce8336357955e.1693417541.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1693417541.git.steve@sakoman.com>
References: <cover.1693417541.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Aug 2023 17:49:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186916

From: Khem Raj <raj.khem@gmail.com>

Fixes build QA warning about [missing-metadata]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 4f4c7130f11c069ab18c374dcbfb1276ef37be60)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/meta/build-sysroots.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/meta/build-sysroots.bb b/meta/recipes-core/meta/build-sysroots.bb
index ad22a75eb2..72da88921a 100644
--- a/meta/recipes-core/meta/build-sysroots.bb
+++ b/meta/recipes-core/meta/build-sysroots.bb
@@ -1,5 +1,6 @@
-INHIBIT_DEFAULT_DEPS = "1"
 LICENSE = "MIT"
+SUMMARY = "Build old style sysroot based on everything in the components directory that matches the current MACHINE"
+INHIBIT_DEFAULT_DEPS = "1"
 
 STANDALONE_SYSROOT = "${STAGING_DIR}/${MACHINE}"
 STANDALONE_SYSROOT_NATIVE = "${STAGING_DIR}/${BUILD_ARCH}"
-- 
2.34.1


