Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A755C54E58
	for <webhook@archiver.kernel.org>; Mon, 18 Mar 2024 10:16:54 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web10.39887.1710757012828241252
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Mar 2024 03:16:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=bWNSWTvl;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4140efa16caso6646335e9.0
        for <openembedded-core@lists.openembedded.org>; Mon, 18 Mar 2024 03:16:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1710757011; x=1711361811; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=WQqfBxLJjk+PAJq8y+aliBfRVjBkX6B6Av9UZQSkws8=;
        b=bWNSWTvlPm+X5ZSHyOpW1fV8qU56QkiXn2Xad835DsuW88cJ/N1SvxkOGLzGyW+5UE
         XrgOJ8y8wpuMv1g5md92JFQ0/yTIQCob/UM4vJxK0tXpihBkn4qL25VV+Z3EFKe4/6IG
         Vo/kTmI0GQRpXWHnV+MMzYdqvPrJjFM/5Ji/M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710757011; x=1711361811;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WQqfBxLJjk+PAJq8y+aliBfRVjBkX6B6Av9UZQSkws8=;
        b=bKxdGOPAQD4Uoi/jwZYngjWEXbAAwTrI/ViHKG1a/TZNXOMK3Y44FwUCu7BEZxC8IP
         dJn3I5TFuw5O2I6w7XwqI214Too5BtL8bAwCwo6TNYMUzUDD1+O46uwC6cpdUhqTLHeM
         eb7+iCrDaMRbVwQmtWs7Oxbnk69ubOuwekPYPFcsV6aWGXsfW9iaqWINCZB6np/8PsxX
         fH3M7mvIIov8c66FXT25vixciJrQerZ3GyDWORt4/YxGCsaAPE01Ww0/i3wsHPspdJu3
         6k5f9susRJO+RD/cca1pQdZjiawfXhDb2fNujjSTMDXOAw7TfhPOnsPmUPtuK9OJz+h7
         l6BA==
X-Gm-Message-State: AOJu0Yy1923cDCCmBjoiXb+E0Q0pwviyQ/aDBlJpwwEd7WbTHZ1+joh6
	5eDJfWJYtyGovjuQzVjAwpOf02XpLzfNPQjofzYs8nknsQoQUHZfta2GVY4y+CaUw/5VWRv6bGg
	f
X-Google-Smtp-Source: AGHT+IFvl17DTQvapbtmouPp3MvMqwQaRIoBgFp6uGKk5WSqsHZASCE3g+nonUpXdKlQTyEIxGhfvw==
X-Received: by 2002:a05:600c:4e89:b0:414:1fc:1081 with SMTP id f9-20020a05600c4e8900b0041401fc1081mr5563935wmq.36.1710757010918;
        Mon, 18 Mar 2024 03:16:50 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:f362:1430:f91a:ffbf])
        by smtp.gmail.com with ESMTPSA id r7-20020a05600c35c700b0041409fa57c4sm5947042wmq.34.2024.03.18.03.16.50
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Mar 2024 03:16:50 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2] uninative: Add pthread linking workaround
Date: Mon, 18 Mar 2024 10:16:49 +0000
Message-Id: <20240318101649.1322238-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Mar 2024 10:16:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197300

With newer glibc versions, pthread was merged into the main library so there is
no longer any need to link with -lpthread. On newer systems this means that linker
flag is dropped from places like pkgconfig .pc files. If uninative then uses this
newer library on an older system, the flag is missing and linker errors about missing
symbols occur.

Adding the linkage unconditionally to our uninative linking flags avoids that problem
at a potential cost of slight over linking.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes-global/uninative.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes-global/uninative.bbclass b/meta/classes-global/uninative.bbclass
index 9b8b4565dd4..d2297b53f55 100644
--- a/meta/classes-global/uninative.bbclass
+++ b/meta/classes-global/uninative.bbclass
@@ -143,8 +143,8 @@ def enable_uninative(d):
         d.setVar("NATIVELSBSTRING", "universal%s" % oe.utils.host_gcc_version(d))
         d.appendVar("SSTATEPOSTUNPACKFUNCS", " uninative_changeinterp")
         d.appendVarFlag("SSTATEPOSTUNPACKFUNCS", "vardepvalueexclude", "| uninative_changeinterp")
-        d.appendVar("BUILD_LDFLAGS", " -Wl,--allow-shlib-undefined -Wl,--dynamic-linker=${UNINATIVE_LOADER}")
-        d.appendVarFlag("BUILD_LDFLAGS", "vardepvalueexclude", "| -Wl,--allow-shlib-undefined -Wl,--dynamic-linker=${UNINATIVE_LOADER}")
+        d.appendVar("BUILD_LDFLAGS", " -Wl,--allow-shlib-undefined -Wl,--dynamic-linker=${UNINATIVE_LOADER} -pthread")
+        d.appendVarFlag("BUILD_LDFLAGS", "vardepvalueexclude", "| -Wl,--allow-shlib-undefined -Wl,--dynamic-linker=${UNINATIVE_LOADER} -pthread")
         d.appendVarFlag("BUILD_LDFLAGS", "vardepsexclude", "UNINATIVE_LOADER")
         d.prependVar("PATH", "${UNINATIVE_STAGING_DIR}-uninative/${BUILD_ARCH}-linux${bindir_native}:")
 
-- 
2.40.1


