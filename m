Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 362DFC54736
	for <webhook@archiver.kernel.org>; Tue, 27 Aug 2024 05:24:09 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web10.71668.1724736245871587880
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Aug 2024 22:24:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OK5ExZbY;
 spf=pass (domain: gmail.com, ip: 209.85.218.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a866cea40c4so585814466b.0
        for <openembedded-core@lists.openembedded.org>; Mon, 26 Aug 2024 22:24:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724736244; x=1725341044; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HlBP0sfLZYjS55iuul0rZ4ukLMv1kcJdSwzMAnQtzb8=;
        b=OK5ExZbY3AwQ4g0vJAicZSdKzYv9HIHaJjLwF301arlHjE+y5P114QFPokThHROFLz
         AsmDFbFvqrP3PZJZZ65KovtXvNtImRiofN177FBQ5PrDd22Fp8Lz2A2TXZMbj4BH+i+n
         94pjnoLXlh34fKFj0c6spc0bK26umKwDt8A9cCdIoae6ZK3hJrb2lh+AmaejJJBJltBL
         iy0L1qVIRdx9MXesAfvd0hLRO9mNWYUD/86uDXH/fbfsjyscqmRqvGbM/G6MEOXre6ls
         slfbxl9EQNexJ1QxgD9W5uUS+N6USqCnEgVsqKU8SC83fsNVGFpABBArEp9Es4bVJKaN
         sM1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724736244; x=1725341044;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HlBP0sfLZYjS55iuul0rZ4ukLMv1kcJdSwzMAnQtzb8=;
        b=Iby6+flRnPPw3YI/2cLlduMYwqQWaT3zrSvoTsRgLmUO0jiGB9umUfNbETxxCLz2pf
         3bCSxIRwpmjnrCkunUcsqRE1mvUoRvztkz3p/CTaggLokZVMRHg3BAa84Gi7yOde15cX
         2wWl1K9dAwq78wb/SqDdQjv01mESBVI69KA2VjbVG1vrIDMw60ODk//POrrAv27S0QKU
         MuNJFxDTvujk0+o5KLSPhWwkPGQ5rBtCXMJo2iVezK5MZSe0HQDcVzvtICP/nvPUi2ld
         nPouUZKVtk5EL7WLMCoe16CV5gOLde9z38fC1krGNI4HlCW8haEbvQXiw9kzGZQnE/fk
         7oVQ==
X-Gm-Message-State: AOJu0YyBCaJkpGoWIQCBLQiiWMj4mzF5oggMFgfK71Duehx1fr2FXI/j
	+vjVuc0XQKHSczFXqDoRtHlPJmH9QwxHHomyHWDUfOhQKcWouQefhN+wLA==
X-Google-Smtp-Source: AGHT+IE3MlTn313//Juhir+Fgsq+IcuKa63+OAvHyz/79JT4XM6H+dkHJg0IG8PsCHZi1bgJl0u4kw==
X-Received: by 2002:a17:906:6a29:b0:a77:e48d:bc8 with SMTP id a640c23a62f3a-a86a51932eemr804421366b.21.1724736243958;
        Mon, 26 Aug 2024 22:24:03 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a86e675aa07sm57704166b.17.2024.08.26.22.24.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Aug 2024 22:24:03 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 11/34] gnu-config: update to latest revision
Date: Tue, 27 Aug 2024 07:23:31 +0200
Message-Id: <20240827052354.1319810-11-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240827052354.1319810-1-alex.kanavin@gmail.com>
References: <20240827052354.1319810-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Aug 2024 05:24:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203786

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-devtools/gnu-config/gnu-config_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/gnu-config/gnu-config_git.bb b/meta/recipes-devtools/gnu-config/gnu-config_git.bb
index 95a7d5485ba..60601d23e22 100644
--- a/meta/recipes-devtools/gnu-config/gnu-config_git.bb
+++ b/meta/recipes-devtools/gnu-config/gnu-config_git.bb
@@ -9,8 +9,8 @@ DEPENDS:class-native = "hostperl-runtime-native"
 
 INHIBIT_DEFAULT_DEPS = "1"
 
-SRCREV = "948ae97ca5703224bd3eada06b7a69f40dd15a02"
-PV = "20240101+git"
+SRCREV = "00b15927496058d23e6258a28d8996f87cf1f191"
+PV = "20240823+git"
 
 SRC_URI = "git://git.savannah.gnu.org/git/config.git;protocol=https;branch=master \
            file://gnu-configize.in"
-- 
2.39.2


