Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FF36CCA48C
	for <webhook@archiver.kernel.org>; Wed, 20 Jul 2022 08:45:35 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com
 [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web08.51509.1658306726895752504
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Jul 2022 01:45:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=P5to6xra;
 spf=pass (domain: gmail.com, ip: 209.85.208.51,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f51.google.com with SMTP id g1so22821515edb.12
        for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Jul 2022 01:45:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SkB6EkkRYKxkRBtZX1W+ZIqu2i9sXrSaYbQjKWNdfkw=;
        b=P5to6xra+yGdIbM3lw13G+cBmabgWE5mWJrQRZ9xfDakIt4qCxcUkqpz+mVCuw31Sy
         g5Pg+9NEIXDWTbvKmEht+lTD5+nySmqH4yk6x0e/3Pq6GsxN0C+nZIqIsUwbD9zlYKZf
         mlzjLjQ/XSZpL2Ice4KQcKiJKKwlQzEay82qAjytZ2dKtHEen8F8iZQv2CSPIV7YxxeB
         bnEz0yEpJUvgAoSojWax39X9ePzs3cKnmwMjbOpcHqnkW+L8wFk79VwtSbA6Hu9NXpmm
         Gwwo/khq9hug/bIFXkXwsMnGLBclrWbpuc64fqq1gqkTxBcePUIfbdCKjvYmBoha8zI1
         AENA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SkB6EkkRYKxkRBtZX1W+ZIqu2i9sXrSaYbQjKWNdfkw=;
        b=hZFXN5PWsmdysY5Z/P4QedyL2nN3QaBoQqPY7IFc8GRluw8hafS2ibD3ct9szkdMPh
         f9TlJrh3OeS83gIKfxcdSEspmNPFZR65eLMi6UtPU6XQFbgte8vXztJUbu4ehF1pLPCv
         I5+NJPJc3HbvTu3Bu7Nhx8lNbaz7jNaXSfEEieRMz/wn6vQYcxwokTpTH7o6yERomitT
         U4W1jin1lRlUyrPSFgHFFJrBwBpXonBQJaslpOiaaPlGnBO5vlX2m4+Qa8PUCqqMPMY6
         x3nlSRy5JdxbpiQdFop7KzKp908x+xCQxRbbbf3g9HdOqMwpW1EpH90LD+KM84qO0+wa
         zWRA==
X-Gm-Message-State: AJIora8CMyEn/G8HhGDSK+aGWvfNox4l+IfK1luGoh2gZZNsYWevJtPi
	vpAvPmjypbR2sMk9a504q7fc2KhC8c8=
X-Google-Smtp-Source: 
 AGRyM1vdEMhA5U9+JckNTgb1Efg9p2Yg8RlCNgdi8MUmn5FkqM91ex1ZUTrCr8gZqfnGLUfp18dgiA==
X-Received: by 2002:a05:6402:2b8f:b0:43a:66d4:a025 with SMTP id
 fj15-20020a0564022b8f00b0043a66d4a025mr48642146edb.121.1658306725471;
        Wed, 20 Jul 2022 01:45:25 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 s9-20020a170906a18900b00722e5b234basm7781784ejy.179.2022.07.20.01.45.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jul 2022 01:45:24 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 36/51] mmc-utils: upgrade to latest revision
Date: Wed, 20 Jul 2022 10:44:27 +0200
Message-Id: <20220720084442.2940187-36-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220720084442.2940187-1-alex@linutronix.de>
References: <20220720084442.2940187-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Jul 2022 08:45:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168331

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-devtools/mmc/mmc-utils_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/mmc/mmc-utils_git.bb b/meta/recipes-devtools/mmc/mmc-utils_git.bb
index 3e611d1306..0bb94ab93a 100644
--- a/meta/recipes-devtools/mmc/mmc-utils_git.bb
+++ b/meta/recipes-devtools/mmc/mmc-utils_git.bb
@@ -5,7 +5,7 @@ LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://mmc.c;beginline=1;endline=20;md5=fae32792e20f4d27ade1c5a762d16b7d"
 
 SRCBRANCH ?= "master"
-SRCREV = "b7e4d5a6ae9942d26a11de9b05ae7d52c0802802"
+SRCREV = "d7b343fd262880994f041ce2335442e7bd1071f5"
 
 PV = "0.1+git${SRCPV}"
 
-- 
2.30.2


