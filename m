Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0AA4C433FE
	for <webhook@archiver.kernel.org>; Thu, 17 Feb 2022 16:10:08 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com
 [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web11.1782.1645114207513619185
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Feb 2022 08:10:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=a38Xsa3p;
 spf=pass (domain: gmail.com, ip: 209.85.218.51,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id gb39so8487878ejc.1
        for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Feb 2022 08:10:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=D218w1z/PDsOtG6UTHhMSZm4Ki0hcJtMCHBcjgZr66U=;
        b=a38Xsa3pOX22BbpmUe1m2kwU/DyTxWexuSE+5/tOA1VN/DD7VZ3u4Z1tkAoppzW86z
         CxkDSVD7rxHkfn5ww4R2TyHFV65NhoU67znNnC4nzxSehVuw6OihNw/a7AIHOyAPv2Er
         nJ6ax2/lLPVXgzXPPhoR1Cz+WGnaqpdUNd7Ql1H4yqOgRfn125P7yJ/KDo4jdgleT1RF
         6W/GPOIwlBcnXFy+z7L7LzboG3/N5ZGQEFoT+splQ5AsZKL4u5IsbWCv8w6s8mUppjWm
         1D6gw8oWgaAbaSRV8H0rbdnV3K+vYUOJxQUCd4Blg+TyRerq1zT1kT429EyDFegM6BwH
         zIAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=D218w1z/PDsOtG6UTHhMSZm4Ki0hcJtMCHBcjgZr66U=;
        b=N5L8aj48TD7wJPhjg21gXoaibVQXWMYROtPxkmkULHM0bpeD3JUMOhnPWrTAPYPv3s
         hi+yMM+umRODEntuCzW6nv+BVYm3/5By5mNyll/58HfZXKlnp/wqzYreTYaypz7RkYpC
         1pwXDnXpvAEhpMWmM3aeteqF3XJncx4MkFPJelOM1LAWgFZDNEttnFxd9U9586XFA0X7
         Y3dkVUlhLaKMm2SFeEUrybLyFovew3625iFYssRilcOK8FuvtUMuykk7qYU0+pOQ6y6E
         hs2XQHJRTxIQ+9QP1VWhb/Rt7LNa3jAeELL8FHkDfQYze7CC8iU7JLOo8ohGkbVyvEcf
         fmKw==
X-Gm-Message-State: AOAM532+QWb9fmlfSD/pHE2xp/K6UV9y3pSIecUGEysLWmHadGy5Lx6n
	z/dPc+ajknbCP3EofOkYyHX2VY1FF7M=
X-Google-Smtp-Source: 
 ABdhPJyIoZKRJOswcU2WhL1O/axqwxsm7+a3RrsT5mQOs/+CX9+syvY3lTvnHgh8FOIIFNEdwPO0Ng==
X-Received: by 2002:a17:906:a19a:b0:6cc:7ef8:475a with SMTP id
 s26-20020a170906a19a00b006cc7ef8475amr3103671ejy.490.1645114206128;
        Thu, 17 Feb 2022 08:10:06 -0800 (PST)
Received: from nereus.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 n2sm1381297ejl.55.2022.02.17.08.10.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Feb 2022 08:10:05 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 18/28] mmc-utils: upgrade to latest revision
Date: Thu, 17 Feb 2022 17:09:29 +0100
Message-Id: <20220217160939.1424397-18-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220217160939.1424397-1-alex@linutronix.de>
References: <20220217160939.1424397-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Feb 2022 16:10:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161835

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/mmc/mmc-utils_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/mmc/mmc-utils_git.bb b/meta/recipes-devtools/mmc/mmc-utils_git.bb
index 918c0a429c..0cd25a507e 100644
--- a/meta/recipes-devtools/mmc/mmc-utils_git.bb
+++ b/meta/recipes-devtools/mmc/mmc-utils_git.bb
@@ -5,7 +5,7 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://mmc.c;beginline=1;endline=20;md5=fae32792e20f4d27ade1c5a762d16b7d"
 
 SRCBRANCH ?= "master"
-SRCREV = "fd41dca5b14df7faefdda5dc6c0bbcdc8f6facc0"
+SRCREV = "4637a7c0df49ba349f9f0e4ab0828133fc06cc81"
 
 PV = "0.1+git${SRCPV}"
 
-- 
2.20.1


