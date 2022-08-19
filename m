Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8163C28B2B
	for <webhook@archiver.kernel.org>; Fri, 19 Aug 2022 07:28:18 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web12.470.1660894068364851799
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Aug 2022 00:28:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=b0Rfs2Rk;
 spf=pass (domain: gmail.com, ip: 209.85.221.53,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id k16so4156849wrx.11
        for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Aug 2022 00:28:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=FaxWl0zY1nLgzqSKPuw3KruI6J24hfz1CybUdxuKMoE=;
        b=b0Rfs2RkCOMcjKA5nZiBzVjCyNDhgnvI8JgdgpEFIU0MKoeedyJUkTWQZZpW7uAPe1
         bRgccLND4hHLjlSmPCTCFOZt7FveYAe+/kBYARJ7myno0a4xseBDCqVJBrnPpTwD7j8j
         XXKCkbBDSxQ0L6F5iU36DfSV6zrvP6quSt0yO6acgcZSUL6NAcGdYTzZ2llM2cN1BRcD
         b8YnI1Yp6Bj/FJYDdnzFnztSjUpAcnHEUWexFVS3F3HIbt5l/MjYWhMmdIQkEzGabHYS
         gtlk+EP3Lry2AGNoIDAFwJzOQGnIhfAvrnidMCctR2kiVgJr3cRZ0bKAoNuYsuw9g2eu
         HH7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=FaxWl0zY1nLgzqSKPuw3KruI6J24hfz1CybUdxuKMoE=;
        b=6oBkkEV8ZOouRcMPGPI9zA2ipIvc10Lt/NHnXHCxnnvn4sRt1J+yx/+kz2QAVFJBwn
         hKGOkskvIXFkhlTKsANCBRVu1kAZLLtoRb2OGS00HIVEoEHymYoBTaafPIAmGTGQQiMm
         iXu7veY4Na05D0+ymNRJse1E4iFb2aTdN4yGQVQ2wsyuwlkgQ1WbqBE0JjqGeOYd6kIo
         DZqU7Q/C0tzq7F1nd8h9R63/DQmYqpyFrTe+2dENnPVpvSjT+Vd/x9IF3MgeSdIdF00/
         OkSMIcsPD2Bte9rzDZwqkr3Det8LJYZxn8qRQvTPy/oqylF7mLRyr9myARMFEBC4IBDr
         4OJw==
X-Gm-Message-State: ACgBeo0BrZTRkD8RO2MdHy18Eoh44qOzlYGvT6rrCJygB8jQC0NRi++G
	D1swOSvyYcN8zI1pJClj9dsAXwh9GRY=
X-Google-Smtp-Source: 
 AA6agR7JR2vk+LigZwsCOEIbwMS4DgF01JbDMTFg52ljqqT3CwioggJHp3KzcqhpP6Ad98A1/qbxLg==
X-Received: by 2002:a05:6000:2aa:b0:225:179a:80df with SMTP id
 l10-20020a05600002aa00b00225179a80dfmr3501195wry.599.1660894095263;
        Fri, 19 Aug 2022 00:28:15 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 ay15-20020a05600c1e0f00b003a604a29a34sm4650739wmb.35.2022.08.19.00.28.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Aug 2022 00:28:14 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 32/42] python3-pyelftools: upgrade 0.28 -> 0.29
Date: Fri, 19 Aug 2022 09:27:17 +0200
Message-Id: <20220819072727.2236928-32-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220819072727.2236928-1-alex@linutronix.de>
References: <20220819072727.2236928-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Aug 2022 07:28:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169603

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../{python3-pyelftools_0.28.bb => python3-pyelftools_0.29.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pyelftools_0.28.bb => python3-pyelftools_0.29.bb} (82%)

diff --git a/meta/recipes-devtools/python/python3-pyelftools_0.28.bb b/meta/recipes-devtools/python/python3-pyelftools_0.29.bb
similarity index 82%
rename from meta/recipes-devtools/python/python3-pyelftools_0.28.bb
rename to meta/recipes-devtools/python/python3-pyelftools_0.29.bb
index 0ceddcb68a..2199e9ff8e 100644
--- a/meta/recipes-devtools/python/python3-pyelftools_0.28.bb
+++ b/meta/recipes-devtools/python/python3-pyelftools_0.29.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "PD"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5ce2a2b07fca326bc7c146d10105ccfc"
 
-SRC_URI[sha256sum] = "53e5609cac016471d40bd88dc410cd90755942c25e58a61021cfdf7abdfeacff"
+SRC_URI[sha256sum] = "ec761596aafa16e282a31de188737e5485552469ac63b60cfcccf22263fd24ff"
 
 PYPI_PACKAGE = "pyelftools"
 
-- 
2.30.2


