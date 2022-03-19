Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA630C433EF
	for <webhook@archiver.kernel.org>; Sat, 19 Mar 2022 07:16:17 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web12.4910.1647674176667661036
 for <openembedded-core@lists.openembedded.org>;
 Sat, 19 Mar 2022 00:16:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=UQYPUeVB;
 spf=pass (domain: gmail.com, ip: 209.85.128.53,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id r64so5906506wmr.4
        for <openembedded-core@lists.openembedded.org>;
 Sat, 19 Mar 2022 00:16:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UgzImfNClgXFcahJMHpxHrvkpTJL8r/uBF83+H1f7/Y=;
        b=UQYPUeVB0NWaZKlz38f74Nf/w95yS4JNoelnzfNsXVuCqMPvlculjD8PmCMws83i29
         8HiNeSfrYpD/TSYsJvrYVjDOUsgEkDyxduZibQBXnLaqJHjhiQsiEdSzKhFw3P0MGTwa
         f0INh5ShLAjJ5RGpA9RszGhyrVl/QAqmtA+16o7vaQUQFIAow7oaBCiTEykI2YDLUPr/
         j2uBduAPPZxLY9u4BsaP17q4x4MNnukedYbZ1kveaMjoSuJx4MpJXxh2DotRy/nJzxRq
         FIKCHdZxLUqcOXTzBMqBPARgF5USbcpQ7/KDaVhdEyknBYZjZegLFkuk5RQVlfk7NWHj
         iW3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UgzImfNClgXFcahJMHpxHrvkpTJL8r/uBF83+H1f7/Y=;
        b=lQbnsJn3Jih1glo/8l+yYSELEWn6TxjXlvt6wy+SytqZ3+X++WXsZccicPzuWdeTgP
         oioM+6gX9nMTZg+hnd6YQN4NqME5F4dClmzZ79Tx4CpWKcSQ8PaCP6tsM1p5yuCJbOqA
         fmdB/7/tnZwzFC+AHqn3BMXKy2gsQikW+0g2bxutwmuy8uEhL8tC1gTq1H8QUPIKadYj
         qD6BnZ5AHl1bq+nG3IbYAaq4tc5DfmcopiM9XwVgxG0/3QfeViNu+yBp41vrsO6hynP2
         mY2pPBS9uoRRnB0Wi5I4E5XqKrRBlXpMvPuGq5e9I1E1DZZFaQHZFrMaRylYQXxj6nrq
         Zf2A==
X-Gm-Message-State: AOAM533k6g0IMPSNEFdVbZC3GMMFWVEzy7fuMVna+f3VQ58ZwBrbTiRx
	eTwfsJekZZ88FHF4ObJyw/n5KFc5VEY=
X-Google-Smtp-Source: 
 ABdhPJz2A2mpDl9ag4xPrnaGX4WNFS5uTbXNfL0HP2/Ag75Ly2wVKUEy/ZyzSRFLkigoqiuuqZ7lAA==
X-Received: by 2002:a05:600c:22c4:b0:38c:70f5:25a9 with SMTP id
 4-20020a05600c22c400b0038c70f525a9mr11083159wmg.119.1647674175156;
        Sat, 19 Mar 2022 00:16:15 -0700 (PDT)
Received: from Zen2.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 i15-20020a05600011cf00b001edc2966dd4sm7656999wrx.47.2022.03.19.00.16.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Mar 2022 00:16:14 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 01/11] python3-semantic-version: fix upstream verison check
Date: Sat, 19 Mar 2022 08:15:55 +0100
Message-Id: <20220319071605.152904-1-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 19 Mar 2022 07:16:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163457

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-devtools/python/python3-semantic-version_2.9.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/python/python3-semantic-version_2.9.0.bb b/meta/recipes-devtools/python/python3-semantic-version_2.9.0.bb
index ee635871bf..4101f48043 100644
--- a/meta/recipes-devtools/python/python3-semantic-version_2.9.0.bb
+++ b/meta/recipes-devtools/python/python3-semantic-version_2.9.0.bb
@@ -10,3 +10,5 @@ PYPI_PACKAGE = "semantic_version"
 inherit pypi setuptools3
 
 BBCLASSEXTEND = "native nativesdk"
+
+UPSTREAM_CHECK_REGEX = "/semantic-version/(?P<pver>(\d+[\.\-_]*)+)/"
-- 
2.30.2


