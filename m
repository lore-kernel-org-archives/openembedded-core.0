Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CD59C433FE
	for <webhook@archiver.kernel.org>; Fri, 26 Nov 2021 04:36:26 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com
 [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.web12.20167.1637901385132529026
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Nov 2021 20:36:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=NGWy1iV1;
 spf=pass (domain: gmail.com, ip: 209.85.215.175,
 mailfrom: ticotimo@gmail.com)
Received: by mail-pg1-f175.google.com with SMTP id f65so7100193pgc.0
        for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Nov 2021 20:36:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=DajzaPSEPKecU6XrL7zh27v4BqwIom8MKV6gvDv3kAU=;
        b=NGWy1iV1gRz9XtFsCkRt8cnJkpH5CyavFhFIl39wvZLmjmBzSwOmb8Mk76oBHjMYWi
         5dzb6s6esLiduLNil8YLhsKd5N4Pfe150q6u8WER3LrVEMsGizM6Afy66EdMbrqVTmdY
         2pg6z3KmrBAEBFjgF58rWsxNhHkFqMNUYhrndR6BSfFHtHaiNRDqqzw7EH6aGt/R2gkz
         lcJqoOE8Mx/k02QClsdkG+tlA5ClTaw/1oZjRvy+Y5I1fVeqZRSy1z8jm/GHAbxV2Vh/
         gh8I4h/UJX6UGSzVm7M8Q6mxtBpMa6ngsvDKa7nBrjX8HkweCigpN3pcDp379rLtjn3c
         coRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DajzaPSEPKecU6XrL7zh27v4BqwIom8MKV6gvDv3kAU=;
        b=jvnfWpUyDVJVen7KA/MY53bCD991hVYgiDJC88BAct9C9lSP64XSR9mW/buPC3xzfB
         V1QaEKGpzC866M2g0cDtWfvYPKbxY0lzsnYcLcKXNorKF1SiYuMgePp0YhgdiphS59jg
         zwbeUtWv4PrVgG1Nd6EG4Thxmphx3itVZs6GYok0K6NiU7u9rch1eNDh9zB13lD8fF/V
         EGCEAONMPfZjek1CULWiOPXrDsN9U1USN8KXn4uLy5wcqh0SZSXIzNqsQQT0mB3DRYQy
         tw7ycSVCjJguN6fUxyXCXyS4z7OepN3992Aq2mlXwIHZ8hK2ibjEVlY7eqxOqcr5TQu1
         ohxw==
X-Gm-Message-State: AOAM531mUW0FwiR2XNAH2JE13wTU8Y4gLRE71Q46oRuXjaundnsDgLpi
	PSpxyCYF3Tlbp4nTGAOpCwAWrfoCFj0=
X-Google-Smtp-Source: 
 ABdhPJzFmDHnp8V52svf9ePt3U8oxTRWOhqXAlUWvNi7chsozk0c9xBGpp7Xg03k4xIBBkXkPydNGA==
X-Received: by 2002:a63:6806:: with SMTP id d6mr19690301pgc.68.1637901384416;
        Thu, 25 Nov 2021 20:36:24 -0800 (PST)
Received: from nereus.local ([2601:1c0:6000:1830:2111:e66e:a58a:6736])
        by smtp.gmail.com with ESMTPSA id
 fw21sm8909282pjb.25.2021.11.25.20.36.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Nov 2021 20:36:23 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <timothy.t.orling@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [RFC PATCH 12/26] librepo: inherit setuptools3-base not distutils
Date: Thu, 25 Nov 2021 20:35:51 -0800
Message-Id: 
 <25502f1588a7b9e57ae9f2899c74491b1e8d187a.1637900380.git.timothy.t.orling@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1637900380.git.timothy.t.orling@intel.com>
References: <cover.1637900380.git.timothy.t.orling@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Nov 2021 04:36:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158808

[YOCTO #14610]

Signed-off-by: Tim Orling <timothy.t.orling@intel.com>
---
 meta/recipes-devtools/librepo/librepo_1.14.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/librepo/librepo_1.14.2.bb b/meta/recipes-devtools/librepo/librepo_1.14.2.bb
index 61a485cfe89..6cd8090b556 100644
--- a/meta/recipes-devtools/librepo/librepo_1.14.2.bb
+++ b/meta/recipes-devtools/librepo/librepo_1.14.2.bb
@@ -16,7 +16,7 @@ S = "${WORKDIR}/git"
 
 DEPENDS = "curl glib-2.0 openssl attr gpgme libxml2"
 
-inherit cmake distutils3-base pkgconfig
+inherit cmake setuptools3-base pkgconfig
 
 EXTRA_OECMAKE = " \
     -DPYTHON_INSTALL_DIR=${PYTHON_SITEPACKAGES_DIR} \
-- 
2.30.2


