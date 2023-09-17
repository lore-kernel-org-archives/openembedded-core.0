Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 094F4CD37B3
	for <webhook@archiver.kernel.org>; Sun, 17 Sep 2023 09:39:16 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web10.27132.1694943548072323988
 for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Sep 2023 02:39:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=P0G9TrrC;
 spf=pass (domain: gmail.com, ip: 209.85.218.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-9aa0495f9cfso1007671266b.1
        for <openembedded-core@lists.openembedded.org>; Sun, 17 Sep 2023 02:39:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1694943546; x=1695548346; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mYeJ1ij2R8jG8j2AcDrMxvj7BXDMpkI+ORnKjhm3HmQ=;
        b=P0G9TrrCg/eGbnTsnnhAXOJBu8GEO+Hfb9Ii9nIS04NYAD9upvCoaOkUY5+4U+jK4j
         mG78NuS19OD9ujmq4rYPmRITL4/9czkhduWsj8pVXGxQduA3XSge+tm1EveMZb9+dLxd
         jriLVYhtNzB79viVuv2fIQ/hHd+mytV7sRRjKF0JSWc3LJZuMST8133wLO+iGkKdXqdP
         UJdkH8/zh8JnhC3gkMtMsQppv0CyEydS3AhVAkzsGisbQqFi0Rz00cjFsNdOgvLd1c1/
         RVBSqsTGNPi/qT5crMZXwS0P0jOrVClJRUgoAZzdyO136YXbVKTge4OxZVCm71lHQVcs
         MZsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694943546; x=1695548346;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mYeJ1ij2R8jG8j2AcDrMxvj7BXDMpkI+ORnKjhm3HmQ=;
        b=Ts/SHOoH/LX+Yp/FDsc6ocPrtqVh5/OlZQSYt6dSS6gx+ebERKuNaNmjSBveqa+JX+
         GDlDuTeFJhZk8uGYA/HmZQHMcckcwxBNeMBJwKlMe4lIOH3x8CsxIaZL8fRxXVucrPiw
         xP1KvCOdDKdZOQK0GfSx0fAkJr9u+xgMe/+2Cx9adcG32nzWtoykWYwfkkFKsUbDRDfs
         Pn1ctJrQfzg9H1Jt94muOTEAO5QNaoWVV1ChNE5ezRlscgX/YYqf2L709p/v/Yne+MVk
         6jYaap9d6Re+YJLvqQb37VU/qS0rUyLSPgb6UXr//hx1VwrOBDZjf7eyqJ5oHiWddQYT
         Dqug==
X-Gm-Message-State: AOJu0Yw+smwEOkvAUN4Dz9je7QdvgHYQ8QHi9ufQKgTXxYb5Sx5oDIf7
	oaCaxSseUgULPsRrkQgUkCMumKXowdo=
X-Google-Smtp-Source: AGHT+IGDZCZLcI6BgbPWtw96LUVNbeIu64Mdz2v8m/qL5vMPtMuOgXIobVJ0GaRspOSupdzCvr6HMw==
X-Received: by 2002:a17:907:c27:b0:9ad:8641:e91b with SMTP id ga39-20020a1709070c2700b009ad8641e91bmr14857636ejc.11.1694943546007;
        Sun, 17 Sep 2023 02:39:06 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id d8-20020a17090694c800b0099ce188be7fsm4779683ejy.3.2023.09.17.02.39.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Sep 2023 02:39:05 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 01/29] sstate.bbclass: setscene_depvalid(): do not exclude shadow-native from task dependency resolution
Date: Sun, 17 Sep 2023 11:38:33 +0200
Message-Id: <20230917093901.428214-1-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 17 Sep 2023 09:39:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187774

This results in executables from shadow-native, such as useradd, falling through
to host libraries instead of using native ones that they were linked with,
because the native libraries would not be installed because of this dependency
exclusion.

Until now that could be coincidentally fulfilled with host libattr (which is
present on all hosts), but latest useradd also wants libbsd and libmd, and those
are not typically installed.

The original reason to add this exclusion was:
https://git.yoctoproject.org/poky/commit/?id=0d2a301bca4eb9d43243f1a03c1cd1ab3f27f30a

While I can't be sure the reason no longer applies, sstate and sysroot handling
has changed massively since early 2013, testing on a-full revealed
no issues, and avoiding incorrect fall-through to host libraries
is better than pulling unneeded dependencies.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/classes-global/sstate.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-global/sstate.bbclass b/meta/classes-global/sstate.bbclass
index c50198449c2..5f8c9c1f809 100644
--- a/meta/classes-global/sstate.bbclass
+++ b/meta/classes-global/sstate.bbclass
@@ -1137,7 +1137,7 @@ def setscene_depvalid(task, taskdependees, notneeded, d, log=None):
 
         # This is due to the [depends] in useradd.bbclass complicating matters
         # The logic *is* reversed here due to the way hard setscene dependencies are injected
-        if (taskdependees[task][1] == 'do_package' or taskdependees[task][1] == 'do_populate_sysroot') and taskdependees[dep][0].endswith(('shadow-native', 'shadow-sysroot', 'base-passwd', 'pseudo-native')) and taskdependees[dep][1] == 'do_populate_sysroot':
+        if (taskdependees[task][1] == 'do_package' or taskdependees[task][1] == 'do_populate_sysroot') and taskdependees[dep][0].endswith(('shadow-sysroot', 'base-passwd', 'pseudo-native')) and taskdependees[dep][1] == 'do_populate_sysroot':
             continue
 
         # Consider sysroot depending on sysroot tasks
-- 
2.30.2


