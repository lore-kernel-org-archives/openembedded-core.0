Return-Path: <tim.orling@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26FF0C27C50
	for <webhook@archiver.kernel.org>; Sun,  2 Jun 2024 21:01:22 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web10.68312.1717362077845721227
 for <openembedded-core@lists.openembedded.org>;
 Sun, 02 Jun 2024 14:01:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=I/sG+DXn;
 spf=pass (domain: konsulko.com, ip: 209.85.210.176, mailfrom: tim.orling@konsulko.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-7025e7a42dcso623342b3a.1
        for <openembedded-core@lists.openembedded.org>; Sun, 02 Jun 2024 14:01:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1717362077; x=1717966877; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CqlND7bL7s655x+MLP0BXo8/vfcDoaDxZbQIDzLYffk=;
        b=I/sG+DXnxmBoEmiiWnuEu1Pxm+5JsI1EPPsj5XU1yirWESalDtPE14SB9aGmSaLqXR
         +TnMPGRWyJkNoi+GpwNqQ237guU1UNMRYzOOBJp05T7kTeNFSZJgc1cmgmTUid025rkK
         rgrMeWndiCsNz5jNTcsMZmlHgfb66gG94Ui9A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717362077; x=1717966877;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CqlND7bL7s655x+MLP0BXo8/vfcDoaDxZbQIDzLYffk=;
        b=E8+U2ClyiCkdDW0nDq6MMJmCsBg5S0JEpFvujIKiS8MPSCZTPp7xXmjmgyraKnKfNq
         WJOmPiYTe7GoMfWdNlAeMxfB6pyyK7D1mq7gDFWXiMIYNKx+Y1I/Fp4nwegS/jAsapeR
         s+x21plFZhsKxN3KGdQVluVGLELE7yJ6fQny3P15fcXP2euYqb8t9z9i+UYRBOWe4w7U
         1lvdpkb/6L13DJZHeci6/ERHIjSvDdQTBm6fjosVx7TerRt5jlwZm4QBzUG7cRcdrD53
         ExPFYhoCR6j/NsrjZIOKOl7ZMuWSQd3RT4gq8cdtimTWgVVJjtGE6Zgnojg22g61dPco
         T0lw==
X-Gm-Message-State: AOJu0Yz11/TsczS99EdGy6nHGBQjET4XCcRaRvGq0R8Spo8RbOZ48LpH
	rqzGK3dsOLSUh9uSB1xnJhUjn1rfaQewYnncouSf+9M1HDU6ykm6sZHf8ZevFnsaKasJ1SKWeA/
	sleY=
X-Google-Smtp-Source: AGHT+IGmv8qFOV2y9qqCGT9LvHEZf+jiQs1pGLjZ5Q1JNv4okom2RlnlgcTMz+3Fy1pJjV6z9RE60g==
X-Received: by 2002:a05:6a00:3d12:b0:6fc:fcc8:cb38 with SMTP id d2e1a72fcca58-702478c7fa8mr8642717b3a.33.1717362076575;
        Sun, 02 Jun 2024 14:01:16 -0700 (PDT)
Received: from localhost ([2601:1c0:ca00:bd60:3fc2:5771:b380:483a])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7024898c3e5sm4002928b3a.108.2024.06.02.14.01.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Jun 2024 14:01:16 -0700 (PDT)
From: tim.orling@konsulko.com
To: openembedded-core@lists.openembedded.org
Cc: bluelightning@bluelightning.org
Subject: [RFC PATCH 3/5] ref-manual: add RECIPE_UPDATE_EXTRA_TASKS variable
Date: Sun,  2 Jun 2024 14:00:40 -0700
Message-ID: <ca613a3e7d6e24814ec56c444bb4f60164a4779b.1717361301.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.1717361301.git.tim.orling@konsulko.com>
References: <cover.1717361301.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 02 Jun 2024 21:01:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200219

From: Tim Orling <tim.orling@konsulko.com>

Document the new RECIPE_UPDATE_EXTRA_TASKS variable
and give cargo-update-recipe-crates as a concrete
example.

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 documentation/ref-manual/variables.rst | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 07b5b6f95cf..255de3e396a 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -7080,6 +7080,13 @@ system and gives an overview of their function and contents.
       The default value is ``"${WORKDIR}/recipe-sysroot-native"``.
       Do not modify it.
 
+   :term:`RECIPE_UPDATE_EXTRA_TASKS`
+      For some recipes, after the new source has been unpacked, additional tasks
+      may need to be run during an upgrade. A good example of this is recipes
+      which inherit :ref:`ref-classes-cargo-update-recipe-crates`, where the
+      `do_update_crates` task needs to be run whenever Cargo.toml/Cargo.lock have
+      changed in the source.
+
    :term:`REPODIR`
       See :term:`bitbake:REPODIR` in the BitBake manual.
 
-- 
2.45.2


