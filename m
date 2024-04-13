Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDE97C4345F
	for <webhook@archiver.kernel.org>; Sat, 13 Apr 2024 11:08:37 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web11.9814.1713006509391162348
 for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Apr 2024 04:08:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=UxW+4HOy;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4181e10b352so2228995e9.1
        for <openembedded-core@lists.openembedded.org>; Sat, 13 Apr 2024 04:08:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1713006507; x=1713611307; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SRDvdvOy+kneIkYfKSeTftkYYZ7R0oVAOXaApMTt4GY=;
        b=UxW+4HOyCKuFJ+2WDq08XrB8p4rpYV9cCFxjlgwEL5/tYVkgzgX72ggidurJoFz+f+
         8xvmWfTw5TizhFZp+ep8EVytuzjE6ACGoL9i6qSNvdmUky+vtZOpB8wtov3AFNYBC/sK
         O63+W7ly8gWAU6ELcuGpVrLaDgsjK//a3J1wc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713006507; x=1713611307;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SRDvdvOy+kneIkYfKSeTftkYYZ7R0oVAOXaApMTt4GY=;
        b=qHjaBWRoObieuLYBhXrDNXkmYb9Y1UbYabFOidQaXy9JGdGeAdQJrw4dSAEqF3RB3h
         Q2OiEAWmTHnocnfVKoo1UKOIvxILgI/QwJoqdiPwVbqKZHE2Cg0NjdjwZ6JkzU+vzDEt
         +Ga60ul2gHw57lbN/hzcWtYonYQzRCWhVYz0TEc5T1Lan/DGSBBIkRKqUf2ucPupOnUh
         wJ/fW2GFW6V9elbjWyzvVOlzLKr3jOrAdEoXg3OvmHzcZ3bhsc8dEHBwnc9N2rXLHq8K
         cf30xDenfaNdDkB2bggLpzryEdvu+QPp9k8f5Lm2XzrzYvHUTdo57NX+/2BGzCYTH9pg
         uZoA==
X-Gm-Message-State: AOJu0YyPmcoRFobrpwAEDsoPW1FrS3MEoTzbt51WtqjnvsgI0EHO84tK
	+oqbiRmAiMcS9dZ0CkFic0iXZOttOe3o4vkPkTnqhnkWNV9X+gpCWjF08fjeTrKjMl/2S5c4k68
	BxBo=
X-Google-Smtp-Source: AGHT+IEO8jiOc69HLmLyFqEUec4KQ2RcvuTAIZYlYEdyb+prXDsEOQpJwHhxwNdUiqsfKqB+F75+1w==
X-Received: by 2002:a05:600c:3b1b:b0:417:d99f:1fef with SMTP id m27-20020a05600c3b1b00b00417d99f1fefmr5992804wms.3.1713006507595;
        Sat, 13 Apr 2024 04:08:27 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:5d2c:926b:df1b:3491])
        by smtp.gmail.com with ESMTPSA id m18-20020a05600c3b1200b0041668162b45sm11785566wms.26.2024.04.13.04.08.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Apr 2024 04:08:26 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/3] abi_version/sstate: Switch to a new version for the upcoming release
Date: Sat, 13 Apr 2024 12:08:23 +0100
Message-Id: <20240413110823.2433813-3-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240413110823.2433813-1-richard.purdie@linuxfoundation.org>
References: <20240413110823.2433813-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 13 Apr 2024 11:08:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198196

In testing websocket hashequivalence, corrupted sstate was injected into the
autobuilder extensively. With the new release/LTS, being able to clearly
differentiate between old and new sstate is probably desireable anyway
so bump the appropriate versions.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes-global/sstate.bbclass | 2 +-
 meta/conf/abi_version.conf         | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes-global/sstate.bbclass b/meta/classes-global/sstate.bbclass
index 96655ff24ff..04539bbb99a 100644
--- a/meta/classes-global/sstate.bbclass
+++ b/meta/classes-global/sstate.bbclass
@@ -4,7 +4,7 @@
 # SPDX-License-Identifier: MIT
 #
 
-SSTATE_VERSION = "11"
+SSTATE_VERSION = "12"
 
 SSTATE_ZSTD_CLEVEL ??= "8"
 
diff --git a/meta/conf/abi_version.conf b/meta/conf/abi_version.conf
index b6643ea60b3..13c2c45b42a 100644
--- a/meta/conf/abi_version.conf
+++ b/meta/conf/abi_version.conf
@@ -12,4 +12,4 @@ OELAYOUT_ABI = "15"
 # a reset of the equivalence, for example when reproducibility issues break the
 # existing match data. Distros can also append to this value for the same effect.
 #
-HASHEQUIV_HASH_VERSION  = "15"
+HASHEQUIV_HASH_VERSION  = "16"
-- 
2.40.1


