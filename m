Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B1E6C001B1
	for <webhook@archiver.kernel.org>; Wed, 14 Jun 2023 09:29:54 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web10.7365.1686734991435759451
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Jun 2023 02:29:51 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=FGKWhfTZ;
 spf=pass (domain: gmail.com, ip: 209.85.208.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-51640b9ed95so11048913a12.2
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Jun 2023 02:29:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686734990; x=1689326990;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m+l3xFG0xAUDfkrH1Oud2mm9OlFVYSRMCErlHVtcVaY=;
        b=FGKWhfTZPTHtXLkgM2nkTFr6ewIva+XtpC6k5T5gLwR/YeuhgwPvdgF8IxToEiK39O
         1dCYH3avHXiu+zw5zRxFaR6jUPA5EnG55oymSkKiwyR4/Svm/+e93xNBUmVgBb9qyyU5
         IgwXG+IFZ3rZmQ9Wgk1Hl72v7JzWfSM8fbUbcj6Zy0pudBdmcmnUuzNsEFeBmcrHGZAb
         AdfqI+LRrkN7FXnXLubMyZdlchQn69eZshZYRJakNWf8aKAPE8sjKCIK4zpZPZlnn1uO
         7gcl6+jm6TjZUPp1S7W5jLAxrzznV1gzirNjJDwqKczcqohIp1fGjWTAszR1kD+2dyRD
         W0Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686734990; x=1689326990;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m+l3xFG0xAUDfkrH1Oud2mm9OlFVYSRMCErlHVtcVaY=;
        b=EEhwjKG1zRe4CeTllnh9LWBaE7RxonRr9uBEQ/bb/MgHKxmXzrl9qVnj77B3yc4Z6y
         teXZ72zUT0DAqimuoMmpfy4j8UNBK+1JUI/VU4Y+m9Sl1tHL3qqRzwpC3Y4nK8W/RTP7
         rh4S/yCAsfxoZkDWWHcUSMReViUU5KVA0eQQ8ACZaaZBk1iZVWWiigR8tphsyZnd9Pb3
         mRr2AVy2OfDa1476SQSJzw5UVgfQw8nZuOg3aBXRP2DhblCwCh3mB4KHwpCuJXh4Wy0F
         Y7IgOmFGszCR5wQLeimNg48xdCAp0tQ/iSpFY5Pod0Q7FDQTp5VrfFofZElvq6DCRlCX
         eyhQ==
X-Gm-Message-State: AC+VfDy8pR6WBfR/CzqDsOqWHeuvFpvrqDOp+v/Wr+IR6ujapgYtaYFq
	UXpxaky9nqbvYV53/4H4YUsvzcGYU0I=
X-Google-Smtp-Source: ACHHUZ4Bew7wNDehJ3Hj3BFBqN4MZFURb4WkS750Qrnf56jiFuxp4Rwu6+dwHZX6P3UM+lBLL7dGbg==
X-Received: by 2002:a17:907:5c6:b0:974:1d8b:ca5e with SMTP id wg6-20020a17090705c600b009741d8bca5emr15445449ejb.14.1686734989884;
        Wed, 14 Jun 2023 02:29:49 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id k19-20020a170906129300b0097381fe7aaasm7747375ejb.180.2023.06.14.02.29.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jun 2023 02:29:49 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 41/55] python3-importlib-metadata: upgrade 6.2.0 -> 6.6.0
Date: Wed, 14 Jun 2023 11:29:04 +0200
Message-Id: <20230614092918.4065570-41-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230614092918.4065570-1-alex@linutronix.de>
References: <20230614092918.4065570-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Jun 2023 09:29:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182786

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...ib-metadata_6.2.0.bb => python3-importlib-metadata_6.6.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-importlib-metadata_6.2.0.bb => python3-importlib-metadata_6.6.0.bb} (88%)

diff --git a/meta/recipes-devtools/python/python3-importlib-metadata_6.2.0.bb b/meta/recipes-devtools/python/python3-importlib-metadata_6.6.0.bb
similarity index 88%
rename from meta/recipes-devtools/python/python3-importlib-metadata_6.2.0.bb
rename to meta/recipes-devtools/python/python3-importlib-metadata_6.6.0.bb
index 3e9b40ee9d4..34bc55b0e13 100644
--- a/meta/recipes-devtools/python/python3-importlib-metadata_6.2.0.bb
+++ b/meta/recipes-devtools/python/python3-importlib-metadata_6.6.0.bb
@@ -8,7 +8,7 @@ inherit pypi python_setuptools_build_meta
 PYPI_PACKAGE = "importlib_metadata"
 UPSTREAM_CHECK_REGEX = "/importlib-metadata/(?P<pver>(\d+[\.\-_]*)+)/"
 
-SRC_URI[sha256sum] = "9127aad2f49d7203e7112098c12b92e4fd1061ccd18548cdfdc49171a8c073cc"
+SRC_URI[sha256sum] = "92501cdf9cc66ebd3e612f1b4f0c0765dfa42f0fa38ffb319b6bd84dd675d705"
 
 S = "${WORKDIR}/importlib_metadata-${PV}"
 
-- 
2.30.2


