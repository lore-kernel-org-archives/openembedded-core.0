Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08AEBC4332F
	for <webhook@archiver.kernel.org>; Wed,  4 Jan 2023 15:47:24 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web11.15532.1672847242538559780
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jan 2023 07:47:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=cT2WIspQ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f46.google.com with SMTP id t15so24551591wro.9
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 07:47:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Vgrd8iDV0v+d1l6C0+GMdBNGx1e5cY7gNjIKrOovpCc=;
        b=cT2WIspQr8GL/mxdd91oONOsscJzxoXuyXVpZ1VUMsvHfkNV59S/jWEvU/3g8ba3aO
         eT2sBBp7L+BWF770FaokYb/mUygzjHsXpqbUJxJzEfdNeWPhQI2o+i7nDdpP87Sj+VIq
         8Q5EGLz/0NlEUWG6wcn716JuO0UoQ/EdtMKs0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Vgrd8iDV0v+d1l6C0+GMdBNGx1e5cY7gNjIKrOovpCc=;
        b=gc8vO56q3qA/FhUlGPQKDJpklcg77lSRDM3+7D4xHoDsSoE1MFnbE63csMZegAo3Cb
         b8ie6khhZnOLU3bBMv4Ctb1tLM4Wnaoac+2lZpLolsiYk+D9CujcvPGdMODtj+E32HEh
         6KAGGPsgx3ajJJqManPOiMI+O8cWbW0+LjfYYpCFL7jHxGKf1m76aVu6wZNSqzTYJMWt
         GwOXaovhk0wkYaO8/G8beQMJm7lwH9CLDvYONetLkzofY14EC0AC7N85VjzoBr6pZdGo
         AKUbADanMNfNEsYP+wRC9G2XN69pP5mUpi2fDySqNnM8RVuYXdl5h9ONZu+BSaVEKrZd
         lomw==
X-Gm-Message-State: AFqh2krIrd4haBgG/AEcR/0AEVPUXGo5M7HOkK4w5m7NwMDry8oscRKG
	2FWAOkFnsvw7iNh/vZdAOTXa88PS8NHC8e1W
X-Google-Smtp-Source: AMrXdXvLBTghgnpUwYYDp2tAeDE4S2EgLCioAm4wc2c4Qgj6YzIdiv7l5nroAHKo1L532Y2F3fBgCw==
X-Received: by 2002:adf:e48d:0:b0:27b:86ef:be7d with SMTP id i13-20020adfe48d000000b0027b86efbe7dmr20599072wrm.42.1672847240834;
        Wed, 04 Jan 2023 07:47:20 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:fcc2:4e85:26d2:6527])
        by smtp.gmail.com with ESMTPSA id u3-20020adff883000000b002423edd7e50sm34812560wrp.32.2023.01.04.07.47.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jan 2023 07:47:20 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 08/10] python3-cython: Use PACKAGE_PREPROCESS_FUNCS instead of PACKAGEBUILDPKGD
Date: Wed,  4 Jan 2023 15:47:12 +0000
Message-Id: <20230104154714.1168535-8-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230104154714.1168535-1-richard.purdie@linuxfoundation.org>
References: <20230104154714.1168535-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 15:47:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175495

The recipe can use the more commonly used PACKAGE_PREPROCESS_FUNCS instead
of PACKAGEBUILDPKGD which is likely to be removed soon, there should be
no change in behaviour.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/python/python3-cython_0.29.32.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-cython_0.29.32.bb b/meta/recipes-devtools/python/python3-cython_0.29.32.bb
index 8fed1cf94d0..1c4853e14af 100644
--- a/meta/recipes-devtools/python/python3-cython_0.29.32.bb
+++ b/meta/recipes-devtools/python/python3-cython_0.29.32.bb
@@ -17,7 +17,7 @@ do_install:append() {
     mv ${D}${bindir}/cygdb ${D}${bindir}/cygdb3
 }
 
-PACKAGEBUILDPKGD += "cython_fix_sources"
+PACKAGE_PREPROCESS_FUNCS += "cython_fix_sources"
 
 cython_fix_sources () {
 	for f in ${PKGD}/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}/Cython/Compiler/FlowControl.c \
-- 
2.37.2


