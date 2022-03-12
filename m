Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65866C433EF
	for <webhook@archiver.kernel.org>; Sat, 12 Mar 2022 19:18:26 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com
 [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web12.7937.1647112705743235761
 for <openembedded-core@lists.openembedded.org>;
 Sat, 12 Mar 2022 11:18:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=owLgcMw5;
 spf=pass (domain: gmail.com, ip: 209.85.210.181,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f181.google.com with SMTP id u17so8600405pfk.11
        for <openembedded-core@lists.openembedded.org>;
 Sat, 12 Mar 2022 11:18:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XP8FF8A6e406Dgtt5UGgg0R957eqr4LnP4827z7XPGU=;
        b=owLgcMw55U3gspPEfTwij+DmBjhou4ftE591IiXL4Uf7g7MDIXgvnaq/pSBQUkhfKq
         lIEYlDOrkDBx9b/idY6vZNyHAJdGg8BF3BtI+8jwrudzMHFaCpjxIE6P8qv7kQVm1GWc
         B7wJpwE5dJoWfc6qV6dqCqWBLm3fwSWJInv1Y96U2vzsjL13+KFXGvljy4JEj8cEJANf
         vKLwhRPMbQjvAwIGELE82Cm6gGdM9NqVpASebjAH9hTRZJVI7UrLyWVFmtvQAsnZAwtU
         JwdQiR/K9GYSEXAhpWTgCV80MM4ycpocHtVNPAzjt4Imb4zLrNMCR7INwzvyVTjP5MU1
         lKjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XP8FF8A6e406Dgtt5UGgg0R957eqr4LnP4827z7XPGU=;
        b=hXaU5VRx+PEA+wM+fcjJWYAuHRsBMr5oXLwZBJCiT03rofFsA7Y0HPYNUF55iLA+Wd
         SY16YLDl/2ot5FBGH4mGSHVcsctPn7tpA1lM7fbI3LtSUKwZ+S2KY5hmesqUSTOXAHZF
         kG1fKkVlRhqfQk7h1fnqf8omCxk8ZxH8fjbU1iROaVa5FETf25zI55XjaNH+B8peDLzz
         BKVzO3jEkif1fyeyS4lrPDVzKHxVzScEprKUFTosMoghHYHHxHirf8yRxj1DwbolWUi3
         yb4NzbUUjOsHYf1oURaoTAWSP9Px35rKflx85uogjLtRT7Bm6oM5qckkZBZvu6/cROLy
         OWTg==
X-Gm-Message-State: AOAM531T3xlfo6YYwBujURGad45u/fcTpuasg/LY5QKp37kbFNirsHyK
	OpgRHue9nYiyjMdLnL+2ghR8q2Eqyq3X/w==
X-Google-Smtp-Source: 
 ABdhPJwe8ea1vVpN7/c/VfeStIVDpM1N4gQhbCZ07b0kAqCz5lKdpG6PYvY28AXAMHxnsFC3giPJaw==
X-Received: by 2002:a05:6a00:238f:b0:4f7:78b1:2f6b with SMTP id
 f15-20020a056a00238f00b004f778b12f6bmr13682780pfc.17.1647112704896;
        Sat, 12 Mar 2022 11:18:24 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::781b])
        by smtp.gmail.com with ESMTPSA id
 f10-20020a056a00228a00b004f769b40bd6sm12339989pfe.103.2022.03.12.11.18.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Mar 2022 11:18:24 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 1/2] powerpc32-linux: Remove libc cached variables
Date: Sat, 12 Mar 2022 11:18:21 -0800
Message-Id: <20220312191822.546798-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 12 Mar 2022 19:18:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163098

libc_cv_ppc_machine and no longer exists in glibc
others are detected correctly in configure. They
perhaps made sense in past when the toolchain build has several
bootstrap stages

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/site/powerpc32-linux | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/meta/site/powerpc32-linux b/meta/site/powerpc32-linux
index accd048a6a3..f8200ce5029 100644
--- a/meta/site/powerpc32-linux
+++ b/meta/site/powerpc32-linux
@@ -241,10 +241,3 @@ samba_cv_have_setresuid=${samba_cv_have_setresuid=yes}
 # mysql
 mysql_cv_func_atomic_sub=${mysql_cv_func_atomic_sub=no}
 mysql_cv_func_atomic_add=${mysql_cv_func_atomic_add=no}
-
-
-# libc
-libc_cv_ppc_machine=${libc_cv_ppc_machine=yes}
-libc_cv_mlong_double_128ibm=${libc_cv_mlong_double_128ibm=yes}
-libc_cv_mabi_ibmlongdouble=${libc_cv_mabi_ibmlongdouble=yes}
-libc_cv_mlong_double_128=${libc_cv_mlong_double_128=yes}
-- 
2.35.1


