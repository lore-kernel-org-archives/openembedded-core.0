Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 734D7CD4F3B
	for <webhook@archiver.kernel.org>; Fri, 22 Sep 2023 07:25:02 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web10.16016.1695367496152899788
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Sep 2023 00:24:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FqeuVSFw;
 spf=pass (domain: gmail.com, ip: 209.85.218.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-9ada2e6e75fso233371666b.2
        for <openembedded-core@lists.openembedded.org>; Fri, 22 Sep 2023 00:24:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695367494; x=1695972294; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5A/9MocIQNoItm4QhFxdXRVGmXxZHh/yWiKGNXafXYE=;
        b=FqeuVSFwAFOpC3jtKw6xzzM55khecNdWCxw94v3gwhvH40Sz0S7/GFmxTxfchmmHaA
         buH4OHU3dfciZSRPM/IyiWUWHuwvZdsm59FUGxcKUjPE/29boFyx2TYRbxtOa/u50p3C
         4c23yziaOiQOCkAIZW092Jm3mALUv4yfYMl9Gxpf4c3qZkFWLEjeCpLnEmIB3DR4wnpz
         iMktdDAaGkJgNXPcZUmZuYguGeWsycjoLQGs4VHEPUsawaRNmBVSL5wupUMcgebE5Ysp
         9HVHVlOpMfzuc11P9n9pqViQvo7L3T8wspfvEKCB18Vm7lRIor0cDdMG5JJVpUqzPeKQ
         Tmxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695367494; x=1695972294;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5A/9MocIQNoItm4QhFxdXRVGmXxZHh/yWiKGNXafXYE=;
        b=jas9eQdYjYIEpCTehDTeWYgAkQNgGMn38IEw7f6EJ0CZwAZ4adG5zn30nBa2+sL9M6
         L3wJqGFfKlS8W2cOReumEuJyVRA7rcToVW6hRdpQyvx+3vQed21LPFjCvHAAG5vhQyf2
         hkcJSgptt1g2YyBUOI8jbGbb/yro5R14JQKunxi2jAoBtimdw2m5HeBHK1kqmMcnF2r/
         /aBU3QwmJM+g5jFqe7W5vL6JxZEWgS97xhh9Ac6ZzKht/uH2IJtj0GSd6cm8k+NxTmMk
         BregXWoS5MEsDQPuMl3+AhqvdFYn97v++9ZmelAoFQYjf0YUQQ43252FLyiU1AqE/rk7
         xvrw==
X-Gm-Message-State: AOJu0YyD7YPdmVWDeczJYjhBXUuojqlRAjNipaZyeU9qlUX1UM7bDYNc
	KKgLl7e3tVSExQY20/U9qlDGWVwjDlA=
X-Google-Smtp-Source: AGHT+IHa9y84L9BFdv4f2/jAcb5pCss3DCNNu6cOmW6/KOpacSWcAuX+fwWZ3m49eiLAtqXio/6nnw==
X-Received: by 2002:a17:906:29e:b0:9ae:7527:cdba with SMTP id 30-20020a170906029e00b009ae7527cdbamr838573ejf.51.1695367494643;
        Fri, 22 Sep 2023 00:24:54 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id z23-20020a170906435700b00992f309cfe8sm2311330ejm.178.2023.09.22.00.24.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Sep 2023 00:24:54 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 32/40] python3-setuptools: upgrade 68.2.1 -> 68.2.2
Date: Fri, 22 Sep 2023 09:24:23 +0200
Message-Id: <20230922072431.1481743-32-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230922072431.1481743-1-alex@linutronix.de>
References: <20230922072431.1481743-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Sep 2023 07:25:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188074

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../0001-conditionally-do-not-fetch-code-by-easy_install.patch  | 2 +-
 ...ython3-setuptools_68.2.1.bb => python3-setuptools_68.2.2.bb} | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-setuptools_68.2.1.bb => python3-setuptools_68.2.2.bb} (95%)

diff --git a/meta/recipes-devtools/python/python3-setuptools/0001-conditionally-do-not-fetch-code-by-easy_install.patch b/meta/recipes-devtools/python/python3-setuptools/0001-conditionally-do-not-fetch-code-by-easy_install.patch
index 6b467184d77..9b17dba178e 100644
--- a/meta/recipes-devtools/python/python3-setuptools/0001-conditionally-do-not-fetch-code-by-easy_install.patch
+++ b/meta/recipes-devtools/python/python3-setuptools/0001-conditionally-do-not-fetch-code-by-easy_install.patch
@@ -1,4 +1,4 @@
-From c4a48e6a75a5865a7c8d61a0f060aca9ba92477b Mon Sep 17 00:00:00 2001
+From 519e2845014f04b4c23b5cf8f92fc4e5dcf40f20 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Tue, 17 Jul 2018 10:13:38 +0800
 Subject: [PATCH] conditionally do not fetch code by easy_install
diff --git a/meta/recipes-devtools/python/python3-setuptools_68.2.1.bb b/meta/recipes-devtools/python/python3-setuptools_68.2.2.bb
similarity index 95%
rename from meta/recipes-devtools/python/python3-setuptools_68.2.1.bb
rename to meta/recipes-devtools/python/python3-setuptools_68.2.2.bb
index e4aaa914a3c..06957d7000c 100644
--- a/meta/recipes-devtools/python/python3-setuptools_68.2.1.bb
+++ b/meta/recipes-devtools/python/python3-setuptools_68.2.2.bb
@@ -11,7 +11,7 @@ SRC_URI:append:class-native = " file://0001-conditionally-do-not-fetch-code-by-e
 SRC_URI += " \
             file://0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch"
 
-SRC_URI[sha256sum] = "56ee14884fd8d0cd015411f4a13f40b4356775a0aefd9ebc1d3bfb9a1acb32f1"
+SRC_URI[sha256sum] = "4ac1475276d2f1c48684874089fefcd83bd7162ddaafb81fac866ba0db282a87"
 
 DEPENDS += "${PYTHON_PN}"
 
-- 
2.30.2


