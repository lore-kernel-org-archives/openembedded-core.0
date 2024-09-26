Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C925CCFA15
	for <webhook@archiver.kernel.org>; Thu, 26 Sep 2024 04:50:04 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web11.35721.1727326183356752689
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Sep 2024 21:49:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=T/dkzyO2;
 spf=pass (domain: gmail.com, ip: 209.85.210.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-718e285544fso471768b3a.1
        for <openembedded-core@lists.openembedded.org>; Wed, 25 Sep 2024 21:49:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727326182; x=1727930982; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=A87wFZcZsbgf2btZ6RnFO0FcfeaONnaRQXKYGQZFOpk=;
        b=T/dkzyO2mW8JNi/iKrxDEFOWuUdMpY0Wk/Mki5N4DLpogCWMFLXpdrlkkPM4CtMtwn
         SbUAqC5c7BFvTZHOsBQQqEwfM6bnVaqTqJkYckNICbjsUA52WEJQuBBkeYxnw/Xbt6QN
         jrFHtTEci/X8Tf8qzqIRC9lZmPo3dAqzDrKb6/TbRnTBRbHHhdQP4Fd+IqQsd3fE/xxF
         RDoaMzJBvoK67h8v6BC2sLF67TMBas2tmOM7PFw9CVW5JhrHUvb4BpQ/QnA1LieApjXt
         BbseuEN9qlCONB3OCMrOmiw0vYs6CUbRIO7OiZ+UV7L7cqr0z4VY/G0a15tCRnStAqeg
         5l+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727326182; x=1727930982;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A87wFZcZsbgf2btZ6RnFO0FcfeaONnaRQXKYGQZFOpk=;
        b=ZC92IW/z5IvBPckgTsokh83eOfXSfmk3e/JJm0R7Oj6FqlHW8Trq7HXlxlBavP8SVC
         2oszkz3eOlbm1tMwIu+qcsl+PnVatYldnTbQENyeCrsm0QmvbTBVsFeCv5jJ3aowDy2b
         LjLAGr6xiLY1Lw282rN+eRdeCgy5VDN/TtbX7ntAxfPWFZBinhI77XMIQqOhbd+1qCJB
         eSVcgHlUBTKqiqCViJVnVwFQshjhHQmNaX0OMWcWNICqs0r0uQ1XBvDlxFG5O2wWOJ7K
         bVhnUVq9CvipkQ+ftrdNLWejLrN+VqkNUbRYOX7cvbQ4Bdo8EHZrDqIEKI3aQ2O/9tYA
         +tsw==
X-Gm-Message-State: AOJu0YyLv/CccyiHoBCFr4A9KqkwvrDannCubc0FgdgfbbmJhntmj1eV
	NRr3hNN9TXfqDBOJVwnmk22FMoI1sUW65lEEbJkBqEQ7GYu5TyCak/r9HAjR
X-Google-Smtp-Source: AGHT+IF3jgH/NY8hsvl+UQ6WkfZS4hp7PeAms/g/IAL0H+4Q5Y3x+2kHA+9MqmqwpR+YqjKPO9pDLg==
X-Received: by 2002:a05:6a00:8d6:b0:717:8ab1:7bac with SMTP id d2e1a72fcca58-71b0ac5267dmr7172906b3a.20.1727326182517;
        Wed, 25 Sep 2024 21:49:42 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::c743])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71afc844ecfsm3489394b3a.68.2024.09.25.21.49.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Sep 2024 21:49:42 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] efivar: Drop addend to PV
Date: Wed, 25 Sep 2024 21:49:38 -0700
Message-ID: <20240926044938.3885631-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.46.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Sep 2024 04:50:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204967

We are at exact PR release point 39, drop the appends to PV

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-bsp/efivar/efivar_39.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-bsp/efivar/efivar_39.bb b/meta/recipes-bsp/efivar/efivar_39.bb
index aab319be91a..fe213326a4c 100644
--- a/meta/recipes-bsp/efivar/efivar_39.bb
+++ b/meta/recipes-bsp/efivar/efivar_39.bb
@@ -11,7 +11,6 @@ SRC_URI = "git://github.com/rhinstaller/efivar.git;branch=main;protocol=https \
            file://0001-docs-do-not-build-efisecdb-manpage.patch \
            "
 SRCREV = "c47820c37ac26286559ec004de07d48d05f3308c"
-PV .= "+39+git"
 
 S = "${WORKDIR}/git"
 

