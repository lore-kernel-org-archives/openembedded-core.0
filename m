Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C96ADE70719
	for <webhook@archiver.kernel.org>; Fri, 22 Sep 2023 07:24:51 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web11.16351.1695367488915922183
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Sep 2023 00:24:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GstFKD1s;
 spf=pass (domain: gmail.com, ip: 209.85.218.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-99c93638322so435994466b.1
        for <openembedded-core@lists.openembedded.org>; Fri, 22 Sep 2023 00:24:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695367487; x=1695972287; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7KdZTwkLI2R/kpZCuENqoeSvPCy5cxoOEFG4XmY2j7w=;
        b=GstFKD1sIreRR9Vt2MiYUCyC1zSeDocn5T1+1f5sLqO7hAcS61RRQDSwAi6VumOZkI
         BxEFRXizdzimg67JJJsu4SiLAP0ekeao1PlTK1Ovp/ZigUocTQTGo19esQ4VWZUj/tYa
         Lo3qmYRygbNU2KPTzPyrPeqM1o1sJle2yLJ8Mmy5Zua9WwnQ4DLkwTIyS6OZ7KoxFbSu
         uIYtealUnuacfA9W56NM9LsprL5dxN2CxNx1ltf+xnbSnOGy9Digiv+x6/5k+1S4DpQw
         +lwBm03mfYsgEFgeIH7nJiVhxXIToyQJQvDH7Bpl5c3+67yMdyVOL5XkCTzS+YtTefBh
         Xi8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695367487; x=1695972287;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7KdZTwkLI2R/kpZCuENqoeSvPCy5cxoOEFG4XmY2j7w=;
        b=gZM8JGb6po450ZYhmXjjxqFQUFQWAbtVGO4rD2+t6OPLwNyPKk+EfPkn2cCKG8XMv+
         YxvAOQSXcO/cZgcd1QtLhNee0mvDbcyOm9qiy6ENjRjH+w8Ux8d11qCywVoMF2bi5AXA
         +Q7AIC8ffpVCbaVJ/lr1xPDuTesDkj3cvBC7FUqoo3hILfuaaojvjCWm2MfFBg+alxyo
         o97FjMnMm8UlZuuVURpgSiQIcoJbyZf+Grdrstk0yXoZMDn/I1YWhvwwe4Pk77GtSZcU
         MjIXln0s3hVbYLV2vLM7K0D5kz02VAcoDermlGmfMFf1F2JtywKPuBMfPS2HXrWVjGQf
         mZkg==
X-Gm-Message-State: AOJu0YzItt0ozcIjfNdNmBODY3DDjNjbgFQ3ey5kKRVAXNT9gvP4DTzO
	IBSAENW1GBPM/TZ2OiWm+NiuZewxj70=
X-Google-Smtp-Source: AGHT+IFwTbW5d0MaqgNFFKkcBZtpr8Gx+SExdEWs0Hi6qnX7wtzKg3b6rHz16zt1j5Eg6/UWINGKAQ==
X-Received: by 2002:a17:906:7492:b0:9a1:f1b2:9f2e with SMTP id e18-20020a170906749200b009a1f1b29f2emr2481957ejl.2.1695367487377;
        Fri, 22 Sep 2023 00:24:47 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id z23-20020a170906435700b00992f309cfe8sm2311330ejm.178.2023.09.22.00.24.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Sep 2023 00:24:47 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 20/40] kmscube: upgrade to latest revision
Date: Fri, 22 Sep 2023 09:24:11 +0200
Message-Id: <20230922072431.1481743-20-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230922072431.1481743-1-alex@linutronix.de>
References: <20230922072431.1481743-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Sep 2023 07:24:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188063

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-graphics/kmscube/kmscube_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/kmscube/kmscube_git.bb b/meta/recipes-graphics/kmscube/kmscube_git.bb
index b385ff7452d..4cdc0f06bb8 100644
--- a/meta/recipes-graphics/kmscube/kmscube_git.bb
+++ b/meta/recipes-graphics/kmscube/kmscube_git.bb
@@ -10,7 +10,7 @@ DEPENDS = "virtual/libgles3 virtual/libgles2 virtual/egl libdrm virtual/libgbm"
 
 LIC_FILES_CHKSUM = "file://kmscube.c;beginline=1;endline=23;md5=8b309d4ee67b7315ff7381270dd631fb"
 
-SRCREV = "53ea71efe63470cf698726d983e9da5748a754a1"
+SRCREV = "ea6c5d1eeefbfb0a1c27ab74a6e4621f1d9adf4c"
 SRC_URI = "git://gitlab.freedesktop.org/mesa/kmscube;branch=master;protocol=https"
 
 UPSTREAM_CHECK_COMMITS = "1"
-- 
2.30.2


