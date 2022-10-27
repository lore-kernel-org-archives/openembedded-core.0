Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04024ECAAA1
	for <webhook@archiver.kernel.org>; Thu, 27 Oct 2022 20:16:30 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
 by mx.groups.io with SMTP id smtpd.web11.2198.1666901785877338429
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Oct 2022 13:16:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ex52vYC8;
 spf=pass (domain: gmail.com, ip: 209.85.208.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f54.google.com with SMTP id v27so4802582eda.1
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Oct 2022 13:16:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oCDQqYeXxF/9cAIUuRcGYGL4/5/IfwKmwrj0VUCpHHM=;
        b=ex52vYC8GjFzmakOG6RWTlu6Xo3FlByWzWG1M3A+DUJ43Slf7Rjr2e4YLWTRXkblJc
         /Um1Jb7rvpRmXmYWfhFEhHegC3p8PbxH1xXOvYUcj/6NbLcJcAP6v0w88QUWLBo+EjNv
         v+0yTnwx7Fc6USrs9LSMQFgFpQtUVlDhLj4t6mTchGV8iIC2R57vvYISo1i43+sPXDRK
         5WRjnb90fSoM2HC1/tFeV4a7ol15aZoeXW39TaYRETb8UFJ+9gkcUebCLaNxvp/6bLNH
         q4mj2+rl7ra9FOzNifhuOwoi1uR5Q4aY+HddkG9O4dQL+BC3GIrfeHaIUGCPSZs0oCYy
         P87Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oCDQqYeXxF/9cAIUuRcGYGL4/5/IfwKmwrj0VUCpHHM=;
        b=4XCIC/k/viJfWZsVrsH/bCX8mmnEtJDgBV38ukKeuFLNnDu4VytNLxrdFRRzPodxgp
         3pnAvgo2VXrxdaDdya2Gri/o3zzC8PqdhjtDmZsZOJGutdpeR4IJHPnTM9kOhEhU2IQ2
         Wi9XEm6CyGcidq2lALZ07TncKiM1s9tqh7vxc2xtgyUMbFfqLmBlU+lWL2f5KygrBKMN
         V4GhAIyaq6pVjxknM9oikFe/xC8dSJ6iGUz7edSuS1Gqso0bBVg/doo+SMuynel+21eD
         gazqCShxlE2/LB6RNtRaoMJuQICfBb2U00GKnW4GESmKeb/nwQpWn0Xicd38rEZS4pJ8
         Rslw==
X-Gm-Message-State: ACrzQf1DfiJibL7fazbfm6yLwyplSKFMkmrdG4/fVXm5bjsqVovALDNL
	+622uN7ZOuaFyxZ9dXn3dkffVLlFSU+wFg==
X-Google-Smtp-Source: AMsMyM6I/MCtdtt3hdw5nSp+3b4i/B8VllpIta4IOvU6MXL/B8ZHo0+vc/uI0JQGI9yW36zIkMMEVA==
X-Received: by 2002:aa7:d059:0:b0:460:9021:73cd with SMTP id n25-20020aa7d059000000b00460902173cdmr38396833edo.55.1666901784169;
        Thu, 27 Oct 2022 13:16:24 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id la19-20020a170907781300b0077b2b0563f4sm1267225ejc.173.2022.10.27.13.16.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Oct 2022 13:16:23 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 01/23] unfs3: correct upstream version check
Date: Thu, 27 Oct 2022 22:15:49 +0200
Message-Id: <20221027201611.3644334-1-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Oct 2022 20:16:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172205

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-devtools/unfs3/unfs3_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/unfs3/unfs3_git.bb b/meta/recipes-devtools/unfs3/unfs3_git.bb
index 7a5d273851..66016a2949 100644
--- a/meta/recipes-devtools/unfs3/unfs3_git.bb
+++ b/meta/recipes-devtools/unfs3/unfs3_git.bb
@@ -28,7 +28,7 @@ SRC_URI = "git://github.com/unfs3/unfs3.git;protocol=https;branch=master \
            file://no-yywrap.patch \
           "
 SRCREV = "c12a5c69a8d59be6916cbd0e0f41c159f1962425"
-UPSTREAM_CHECK_GITTAGREGEX = "unfs3\-(?P<pver>.+)"
+UPSTREAM_CHECK_GITTAGREGEX = "unfs3\-(?P<pver>\d+(\.\d+)+)"
 
 PV = "0.9.22+${SRCPV}"
 
-- 
2.30.2


