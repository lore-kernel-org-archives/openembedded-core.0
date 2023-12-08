Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A7EEC10DC1
	for <webhook@archiver.kernel.org>; Fri,  8 Dec 2023 10:15:32 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web10.17182.1702030530128216317
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Dec 2023 02:15:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Fa5DoLvW;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-40c2d50bfbfso6688155e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 08 Dec 2023 02:15:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702030528; x=1702635328; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z6bciA5/pYIvnnCvGHiH4xqsitz04m8Lld8j+9HBQ3s=;
        b=Fa5DoLvWz2E9MBozSEWlSD9ACTRA88Kyweoxcgwd3bVjdG2Vbr0+s6KemR0tVcYodH
         Va6cziH01au2f32rsHZ+CfFWGrxcQOCi185kYq+yZC+2lqFgNbWuYdYzCGDaHVXjj3pi
         /78DJl/vPCDH3Qb2ZO5kFqyctJ2A/499+glFyVPqGwu1dibn+4dmVI/VtR32z0KMjgoO
         TuPxH80weoi0WISx79FbRKsIIJFOct2tQmb9QvqCHtSeeXiWIoHlxDaScesI3lj8vt7z
         UaSykB5/UabQkiJzSEk/iWsUl2xYDy2ptoUxWHPbJn8rgDDTUig7j2qGdjjXCJbQjCOi
         kzwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702030528; x=1702635328;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z6bciA5/pYIvnnCvGHiH4xqsitz04m8Lld8j+9HBQ3s=;
        b=T6AHSI3kc/XUDtl0PTUYPjsRIS6CBbdJ8RAQsPJypmm+Vsoc7rWKyToyib2d5R25yx
         IHB6XDEm8cLLs/j51ynxQvAKEJCLD/XPJn5JErLPAT7IX8Dlw4c2cEK2371QJwrICgvh
         VvISL800b6JIn43uT0ZdGc4b0ucRuv1Ku71CQL2GoUcVvBweAorBSjMWvdwWsGXzx1DU
         B4S8VjfgYasUAGt2hOnhnCvVJXPxAswUzsRZQOI2bfJa3TaDMGY6UXiYUSGGHJLx+Pr+
         rx+GMuCTu0fVWiN/UOCWDZkjmdqXk5zlcW8pYu/jo09iDLjKXYI7mg35+9phmGME5x/a
         jPLw==
X-Gm-Message-State: AOJu0YxkoiA5fsGwJdjiJZ1DYC7gWOybauYE2aTTakukcVDIiiEVkxew
	XXDShCfYhvbjY7JLHOl31bv8F5Uzf+I=
X-Google-Smtp-Source: AGHT+IGKdWgNa+JG6CwIsjk1r7KTrA+e+BrcX99TTGplpF+uCBaK/phm0OzkzTLY9j+PqvIxc/IDFg==
X-Received: by 2002:a05:600c:1c93:b0:40c:255a:5e17 with SMTP id k19-20020a05600c1c9300b0040c255a5e17mr318495wms.38.1702030528352;
        Fri, 08 Dec 2023 02:15:28 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id b16-20020a05600c4e1000b0040c310abc4bsm2746707wmq.43.2023.12.08.02.15.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Dec 2023 02:15:28 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 3/6] sstatesig/find_siginfo: special-case gcc-source when looking in sstate caches
Date: Fri,  8 Dec 2023 11:15:19 +0100
Message-Id: <20231208101522.198832-3-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231208101522.198832-1-alex@linutronix.de>
References: <20231208101522.198832-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Dec 2023 10:15:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192030

This is already done for local stamps just above, and will allow enabling
the full selftest that compares gcc-source signatures via printdiff
(that is, both local stamp and sstate variants).

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/lib/oe/sstatesig.py | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
index e250f51c124..8a97fb0c04b 100644
--- a/meta/lib/oe/sstatesig.py
+++ b/meta/lib/oe/sstatesig.py
@@ -398,6 +398,9 @@ def find_siginfo(pn, taskname, taskhashlist, d):
             localdata.setVar('TARGET_VENDOR', '*')
             localdata.setVar('TARGET_OS', '*')
             localdata.setVar('PN', pn)
+            # gcc-source is a special case, same as with local stamps above
+            if pn.startswith("gcc-source"):
+                localdata.setVar('PN', "gcc")
             localdata.setVar('PV', '*')
             localdata.setVar('PR', '*')
             localdata.setVar('BB_TASKHASH', hashval)
-- 
2.39.2


