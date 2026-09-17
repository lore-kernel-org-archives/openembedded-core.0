Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F364C982E2
	for <webhook@archiver.kernel.org>; Thu, 17 Sep 2026 22:08:05 +0000 (UTC)
Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1566.1789682877584025511
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Sep 2026 15:07:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Y2tlkAsV;
 spf=pass (domain: smile.fr, ip: 74.125.225.140, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49e69b9e16aso1211625e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 15:07:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1789682876; x=1790287676; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=bTO2/rq1NEhkpRBDYxxW1LxS2GV319zCXXzq65qQ5mM=;
        b=Y2tlkAsVwydDA8qcOACvR+iFyv+Y6jJn2/jG8UF7wCtwSa8+V5MDSqzsnGXICOj19r
         KD+qzbuqzxJb3Y6u1hckYc6efO3koskM9cqhEt652TND5Q7TYNhs95n4U3WBWffzuUFJ
         aQENlY1B3tGReL6zNBiW+nxrX0FkmWXPeSL3Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789682876; x=1790287676;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=bTO2/rq1NEhkpRBDYxxW1LxS2GV319zCXXzq65qQ5mM=;
        b=HFoIE0j6RK0CEav8g/leiTTDb+ZFViTR4xm6IWq6hvN1Q5ivZiTRkT9LLfe/p/493f
         pIH2ZWqisTiOeA5VHvMM2u4MeAIfD8YZdRXmcwWJH8lhFKcn4gvihsky3Rg0jKZL4ypG
         VOHYkZzs/B3/2UKWgXbzs3Lq76OijGSYRyxmSbRDc1pOZUyrTMnKLMPH84vk1XyKrVxi
         k5M2wRryM5Lbxrl0vRdHVmgDyZH3hbZt453NUTRRIy3CBxy4GuvMAuUxuLdvHSfj97/7
         gnSAI3kvIgC3lu9dKDD/ynUI5UB3vdvNGETQKCL8TyBFNGLnSBsVKUi2BhwPwzwozw0I
         NQag==
X-Gm-Message-State: AFuF++mF04c0M8a95UIOExFMz5rleaI+sQsElGzsqqW9ArxZwOaUI5LA
	o/TV/fxOiOLdQcNW9OwFhkm+Z2k4bApxttb5tDer+VAIdepff27QfCMalYs2k01iypDm0ABvnUb
	e4ZWJmKQ=
X-Gm-Gg: AYBFou0TjEgPE8G/pyhUQ186tAS/9XtUf4e41TSiDay5F0BuP4uJBJH533GH5/yi+h8
	trBUKg0jZjzcyIbLrnFe8KfspjXWMh4NPNom/VO/NOY8d7D4dNw8asWUHBOTNhKcTxTrzOd+i+O
	7/ozJTOfOA6jm28TsQxpUMu1ZH4FdYe7ecNyLWfQMDOlZ2ejb0VndgNaOC3Fhl2rN+FIDANYwck
	OrOgpTxbX9rwIAim7TpgWqYyPxGebFXZXYUaTHkU8rNd37kMr8eqwCBNpPQcO5NsxHfAfsoAgG7
	Y29kB/n8mxw95yTQevy5bR4W4U8Yk0icAwFapws8RnVO7DCBZq3yklqk5T28u4FFKyqDNPxkN+4
	WxAswM4A2W3Vrx5b3IzqWeXqLRyEH8sAhabGDLQrM9GI5geD1hqE8/MMvhXscbVmc9gX/KJjwQa
	Sw9zZD4fUlDcp+njaaVPK/REeGizaof4jpMeYiwlZrqtSprMeKHD0LYT8japnsFG9XCggYdB26S
	sVuEHc/ZRC16OWLqbVMPDen+RwzABhZ6AIuSCdn1nY6uALi+GCFnsDdIJgwdCeaXN7E0Cttx0A=
X-Received: by 2002:a05:600c:3585:b0:49c:cee0:f383 with SMTP id 5b1f17b1804b1-49fc5734ef6mr4319615e9.16.1789682875807;
        Thu, 17 Sep 2026 15:07:55 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc471b9a2sm8984075e9.0.2026.09.17.15.07.55
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 15:07:55 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 12/79] python3-certifi: fix homepage
Date: Fri, 18 Sep 2026 00:05:57 +0200
Message-ID: <e9672d5ccfc9d11cefbc514fe212da613fcb5e15.1789681419.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1789681419.git.yoann.congal@smile.fr>
References: <cover.1789681419.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 22:08:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246107

From: Peter Marko <peter.marko@siemens.com>

Leading space leads to SPDX document validation errors in some tools.

Example:
SchemaError: \" http://certifi.io/\" is not valid under any of the
schemas listed in the 'anyOf' keyword
(components -> ... -> externalReferences -> 0 -> url)

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(From OE-Core rev: ee556d1e1cc16327e0a11207e90ac61d9f1577f3)
Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-devtools/python/python3-certifi_2026.2.25.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-certifi_2026.2.25.bb b/meta/recipes-devtools/python/python3-certifi_2026.2.25.bb
index 0425f3544fa..fb08bff815f 100644
--- a/meta/recipes-devtools/python/python3-certifi_2026.2.25.bb
+++ b/meta/recipes-devtools/python/python3-certifi_2026.2.25.bb
@@ -2,7 +2,7 @@ SUMMARY = "Python package for providing Mozilla's CA Bundle."
 DESCRIPTION = "This installable Python package contains a CA Bundle that you can reference in your \
 Python code. This is useful for verifying HTTP requests, for example.  This is the same CA Bundle \
 which ships with the Requests codebase, and is derived from Mozilla Firefox's canonical set."
-HOMEPAGE = " http://certifi.io/"
+HOMEPAGE = "http://certifi.io/"
 
 LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=11618cb6a975948679286b1211bd573c"

