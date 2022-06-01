Return-Path: <jpuhlman@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26E82C433EF
	for <webhook@archiver.kernel.org>; Wed,  1 Jun 2022 20:55:36 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
 [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web12.3394.1654116908657744206
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jun 2022 13:55:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=LNARXXvn;
 spf=pass (domain: mvista.com, ip: 209.85.210.176,
 mailfrom: jpuhlman@mvista.com)
Received: by mail-pf1-f176.google.com with SMTP id 187so3000033pfu.9
        for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jun 2022 13:55:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=uQVkMTLI/fGOTuriO2gJTuD5iqB8buc1URtLfxctt8c=;
        b=LNARXXvn8PF8MzxGQTQ3Om9qMYZW6gfSxc87Ivv5Jsp7lHBQgl4LsZ2S7JwXIIh/DM
         WKPWriNZxSa2wtjtjZIi2zFY0Vr0dP+dj5fjKJ1qu0MuJhqdjH8pJXRjdVXas+n8Qq2k
         Nu4HYyNgTQq5LfoIvwiXswCO2VuExwC/YSrug=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=uQVkMTLI/fGOTuriO2gJTuD5iqB8buc1URtLfxctt8c=;
        b=xKB5MACFm/WakeThYUIl6xU8JeA6YB8Vv6EBPnNoRDOXvCYccMboJLZEzCZ3durfVg
         iFW+tNsL73FnoI706lSximjRoFeck03SyqADsfhnTt/JLeFws9RYflY7XoiD0sGEwcRN
         EJHobGFC9nsFY9Ok+iLFXskFU6Hce2MS9Qu9g1hDF1bkAzwlwXlSUx7I+mTuXiaP8tmx
         doRyQCXG5uO4xo+BmglhSIb0X56nyG650QpLmlWB48tFv4f5NtiXXEXthKlW4TrT//f4
         V+8szb3tiEunIbSwHG8fa5wWMcnJbSAgMqmQTnkypJuecXjlq1j33zfY1rLxO3kdnSc6
         YqoA==
X-Gm-Message-State: AOAM533HgvQZIok6alpuX6AyWrK+gBSg93F8shl7k6omi0u4V41Fn+MA
	eaqvs2mtJc1niffhOj8gBJG3GvA+kYricQ==
X-Google-Smtp-Source: 
 ABdhPJz1i7cs5jwyBiSdIj6pgqnb/+sV+Ve7S8xBMtEG/4EAD3Hn7x0Zw2WKkpI6lrm+kKFTdIZlaw==
X-Received: by 2002:a05:6a00:1902:b0:4fa:fa9e:42e6 with SMTP id
 y2-20020a056a00190200b004fafa9e42e6mr29549375pfi.1.1654116908043;
        Wed, 01 Jun 2022 13:55:08 -0700 (PDT)
Received: from red (99-14-97-149.lightspeed.frokca.sbcglobal.net.
 [99.14.97.149])
        by smtp.gmail.com with ESMTPSA id
 x42-20020a056a0018aa00b0050dc762815esm1920502pfh.56.2022.06.01.13.55.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jun 2022 13:55:07 -0700 (PDT)
Received: by red (sSMTP sendmail emulation); Wed, 01 Jun 2022 16:55:05 -0400
From: "Jeremy A. Puhlman" <jpuhlman@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: "Jeremy A. Puhlman" <jpuhlman@mvista.com>
Subject: [kirkstone][PATCH] gcc: depend on zstd-native
Date: Wed,  1 Jun 2022 16:55:04 -0400
Message-Id: <20220601205504.3464879-1-jpuhlman@mvista.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Jun 2022 20:55:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166442

Sharing sstate cache binaries between two systems, one with libzstd installed
and the other without, leads to various gcc components being linked against
the system libzstd and failing to run on the system with out it installed.

Make zstd-native from our system available.

Signed-off-by: Jeremy A. Puhlman <jpuhlman@mvista.com>
---
 meta/recipes-devtools/gcc/gcc-11.2.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/gcc/gcc-11.2.inc b/meta/recipes-devtools/gcc/gcc-11.2.inc
index 68e0d203fc..e2a28468f5 100644
--- a/meta/recipes-devtools/gcc/gcc-11.2.inc
+++ b/meta/recipes-devtools/gcc/gcc-11.2.inc
@@ -11,7 +11,7 @@ BINV = "11.2.0"
 FILESEXTRAPATHS =. "${FILE_DIRNAME}/gcc:${FILE_DIRNAME}/gcc/backport:"
 
 DEPENDS =+ "mpfr gmp libmpc zlib flex-native"
-NATIVEDEPS = "mpfr-native gmp-native libmpc-native zlib-native flex-native"
+NATIVEDEPS = "mpfr-native gmp-native libmpc-native zlib-native flex-native zstd-native"
 
 LICENSE = "GPL-3.0-with-GCC-exception & GPL-3.0-only"
 
-- 
2.31.1


