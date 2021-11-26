Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D487C4332F
	for <webhook@archiver.kernel.org>; Fri, 26 Nov 2021 04:36:23 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com
 [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web10.20375.1637901382942504845
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Nov 2021 20:36:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=cxVWPFE3;
 spf=pass (domain: gmail.com, ip: 209.85.210.171,
 mailfrom: ticotimo@gmail.com)
Received: by mail-pf1-f171.google.com with SMTP id g18so7717223pfk.5
        for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Nov 2021 20:36:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=hji0Nnp7v6IeFcv1EBmdMErsdva/9sqEuusGCzWqUKA=;
        b=cxVWPFE3cfUIAQIl/ZlLT8fCfDqqLXHfmsa5zWzjcFztH5B1WZYgxB/cYQGM/zkUyh
         EvhK31wwuVmtKaHh0LnA8mHB/PqETbvXj/9SYvrv77bzPQCQqMwRGig1W/pfEJ+yMFjt
         ql4GIgamkl5kCiB/EHc8M/O/P/BYXbntFIAfVzhGK8nzrl67fD/HuFSFbn8cyxSMVIMJ
         5xryEJrv7T8smwhEfTschmGfgH/LM95EFGm9MjqxdFYi7lXbqYOk1Xu2yBZbnDiwLDYP
         atKWPoCPRqMV94CvJIDl6O7XhzlH8g9s7O8AvyxgbqSgagHqIoLzUTnG+Z8wku9OfphX
         zfYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hji0Nnp7v6IeFcv1EBmdMErsdva/9sqEuusGCzWqUKA=;
        b=TtqjNsa6Lcnj1TqLwGUKDs4lVs+zN8UXKZtsYrZ7qkU0DlZqE5pBtDHtwshG4EpJFi
         TE86//4n/ysDHVInu54Ub5SSGeeUQ3mDpOe5AGGZ2uZ4ffHYCEYi3MaKYrp81KYbST7O
         tJ3k1rQo/Vk6qtSye4C8GHj1lCB5I6O5emXYYrpVxpEh73T35ewK5ChCiKD1EAru9gLz
         LKlkBrpbuVLC3zMBfTEEbMdSWh931Ph7CeRzt/gzvIHerWH4LXPbIVlCe3kJjZR+YRrm
         QoYkb7SOO4G9F85pagiS3hNH53jhGvsnbFQCc1bwIRmE5AC0n/Meaa7P/yY8TZNrbyL9
         rw6A==
X-Gm-Message-State: AOAM532ecItbjyP4gH0Prvduf2oOU7QbOhualfeThi9oTvjzYCH3mnCY
	+TmeDtB2o2XhM13p+v45F0HAkG6+pEA=
X-Google-Smtp-Source: 
 ABdhPJyhy2X1TNmx/VAm9+CDO3wCIhYLIObcWTd0ceGPtWi6xL/07TEsHnAR4d3R1mCtrYF63eocgA==
X-Received: by 2002:a63:d915:: with SMTP id r21mr20016651pgg.40.1637901382310;
        Thu, 25 Nov 2021 20:36:22 -0800 (PST)
Received: from nereus.local ([2601:1c0:6000:1830:2111:e66e:a58a:6736])
        by smtp.gmail.com with ESMTPSA id
 fw21sm8909282pjb.25.2021.11.25.20.36.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Nov 2021 20:36:21 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <timothy.t.orling@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [RFC PATCH 10/26] libcomps: inherit setuptools3-base not distutils
Date: Thu, 25 Nov 2021 20:35:49 -0800
Message-Id: 
 <6ed2a48c9a5c9109db2b889be7779727e04854af.1637900380.git.timothy.t.orling@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1637900380.git.timothy.t.orling@intel.com>
References: <cover.1637900380.git.timothy.t.orling@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Nov 2021 04:36:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158806

[YOCTO #14610]

Signed-off-by: Tim Orling <timothy.t.orling@intel.com>
---
 meta/recipes-devtools/libcomps/libcomps_0.1.18.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/libcomps/libcomps_0.1.18.bb b/meta/recipes-devtools/libcomps/libcomps_0.1.18.bb
index 3fd4d5b83d4..5fa7fd3e35f 100644
--- a/meta/recipes-devtools/libcomps/libcomps_0.1.18.bb
+++ b/meta/recipes-devtools/libcomps/libcomps_0.1.18.bb
@@ -13,7 +13,7 @@ SRCREV = "dee4ae37f7818709802de28c4d16fa823bd83ae2"
 
 S = "${WORKDIR}/git"
 
-inherit cmake distutils3-base
+inherit cmake setuptools3-base
 
 DEPENDS += "libxml2 expat libcheck"
 
-- 
2.30.2


