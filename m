Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9349EC35FFF
	for <webhook@archiver.kernel.org>; Wed, 19 Mar 2025 08:16:28 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web11.2948.1742372187089141737
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Mar 2025 01:16:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gewTxLvc;
 spf=pass (domain: gmail.com, ip: 209.85.214.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-223fd89d036so130931725ad.1
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Mar 2025 01:16:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742372186; x=1742976986; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Not2OL6jS1+oGzZ+d3jIQHLqET8KaVvwVrxHBriJkpg=;
        b=gewTxLvcOSC4bkqfxfnF4coAxnY3hZDzgzSQopR4Vd+RrsVOf20o/rM9PGoD9bsQYh
         bn3xDTTEjHT9DjrIHwncEBD2+a5XugsbYYEdfhOx/Qp04/MCU8BMHgNl/XkaOdtJNUMf
         GdcT3ed1FA8YYJIB4yTPseCEolnMy17tGncvBJo3JR37S1G1/XwZrtf/xraj59dFGz0x
         zNdOoKJv1HQnbFpNi4NC/582gkxDZxmVmNvu0mAP3A0TpZoDzY0bspBa2aoPvDPGU2+i
         i6JfyaZsZIl0O1i6iNI6/Dz/QsFYEmA6G4pNjBS6bFHFk42Vh2qjWk0Hxcbd0XVKRWIg
         SRrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742372186; x=1742976986;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Not2OL6jS1+oGzZ+d3jIQHLqET8KaVvwVrxHBriJkpg=;
        b=fF9vU9Z9bwD0Voo1zCKyi51rlOVrwUw+HulN8Ph+3kL+1WGocZxGeo6/sqkXq1NdwC
         M+YKca68Z+jfHPwNFgQinqCYHoOvn+qbGsOS8fHesCAUKPLuJ952AEC+CRPseFYJNvk5
         djghCEqgynoy/ReENfsvitlPdq4eqG0TfQzWZ++QK93+OdPzr9YHs1xqP2AyOwpv+hdQ
         PHcoErR5+wGT+Gh3o7k46hC6GqtJVAwYFygqH1fwdGrdtMcmITrAcZsn9RWtF9Art2vD
         VgkIOafXwP1ybKlhKDQ8YEpuImnmvSc2q4uq9rrt7dYBfAJoElbLqE1HEAcAZq3rsuSx
         iywA==
X-Gm-Message-State: AOJu0Yxkw6a4+uFu95F42AwVu+FJCFHQ5XR9HvJgn75KWaFwmB+vI7Oe
	gh6t6brafLUzA3N5o37opnL988wr2zTax84EnSP0tLwAROfAEqFJCLH+82tP
X-Gm-Gg: ASbGnct9+eXbHRO4olRfkYyBq/XPqY5RDUiSj/mBrR3afrfGCHN/b2UOxJE6VfEux9h
	5X32wmrkM/Tx4EDl9ojaomEtEEco3hR4hMo19ejxybiiQub6XO2aQJ+jiIf1nTBy+Vq6icpNoLk
	t2xQqOh3r5lQoFkuxu++LqhKo0w0E9TwYVTY1GcHWWVJaXVQmIcvPeuYX6DQ6ocifMKPTFYxrIQ
	BXSaElp7YdBd4qkjp2eAqr6MDgHPICU73lXxSkl2JhlAseu4Z+sge8qeLxhpHYQh+WY9qsyIMWL
	UrPDAuf4qUKZLFUnvjah8MgPz/T83LS9zfXl
X-Google-Smtp-Source: AGHT+IFPz7sfQE2qje/KA90Ry1U0MSsHF19K+7yJvxeHi8JPa4v4ABURf/b2gSel2r9PfnufOks0BA==
X-Received: by 2002:a05:6a20:3943:b0:1f5:59e5:8ade with SMTP id adf61e73a8af0-1fbecd425b0mr3118034637.29.1742372186303;
        Wed, 19 Mar 2025 01:16:26 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::ac74])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af56e9c95c5sm8704323a12.4.2025.03.19.01.16.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 01:16:25 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v3 13/27] libmatchbox: Fix build with gcc-15
Date: Wed, 19 Mar 2025 01:15:43 -0700
Message-ID: <20250319081610.3536475-15-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250319081610.3536475-1-raj.khem@gmail.com>
References: <20250319081610.3536475-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Mar 2025 08:16:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213281

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-graphics/libmatchbox/libmatchbox_1.12.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-graphics/libmatchbox/libmatchbox_1.12.bb b/meta/recipes-graphics/libmatchbox/libmatchbox_1.12.bb
index bf3f5c005d9..e99b66855e1 100644
--- a/meta/recipes-graphics/libmatchbox/libmatchbox_1.12.bb
+++ b/meta/recipes-graphics/libmatchbox/libmatchbox_1.12.bb
@@ -15,10 +15,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34 \
 
 DEPENDS = "virtual/libx11 libxext"
 
-#SRCREV for 1.12
-SRCREV = "e846ee434f8e23d9db38af13c523f791495e0e87"
+PV .= "+git"
+#SRCREV for 1.12 + 1 patch for gcc15
+SRCREV = "312c04b6ba60dca0d6c4a7d1393f0ec816a265e3"
 SRC_URI = "git://git.yoctoproject.org/${BPN};branch=master;protocol=https"
-
 S = "${WORKDIR}/git"
 
 inherit autotools pkgconfig features_check

