Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C92E9E70715
	for <webhook@archiver.kernel.org>; Fri, 22 Sep 2023 07:24:51 +0000 (UTC)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
 by mx.groups.io with SMTP id smtpd.web10.15998.1695367484609524832
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Sep 2023 00:24:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kELa/LQ5;
 spf=pass (domain: gmail.com, ip: 209.85.208.175, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2bb9a063f26so28226131fa.2
        for <openembedded-core@lists.openembedded.org>; Fri, 22 Sep 2023 00:24:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695367483; x=1695972283; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dTi7iNaktSUybg8QTqRXhMevtDsZicGzvR+3HWx8+bA=;
        b=kELa/LQ59j1mg8EXeRCPeKiZ9RXuRLlSiL1QQEq/3uozT7G7Tdaf5ZR405h7ulEGgj
         mBG1jfXW1Yo6kD/bO6akl0WRLhhZk0pK5dCFMgL4U9wQpGqqyjgkdipbdAOH/hPrFLY0
         Sb/Lom/e8g6NdQppgGQC9UNlsNU0E4xWaUXSq09ZuamAEAQrwUizKeG73bn7kNDESo7w
         jhQWK86A5i3uVaKBeAIKqxGNrxa6pIO8eGEJGmxD0J+Cb9xuSvDZ3DB+O11ichzchdmT
         Xor9bfxH1cpOxn2wt1hJHHIYIIFVNiQPqFtDylYdRk0K8niDaeFk4pA5gZJ5K/JLGmti
         G3SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695367483; x=1695972283;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dTi7iNaktSUybg8QTqRXhMevtDsZicGzvR+3HWx8+bA=;
        b=Xb17/ENMTMSo/iLlfFNvEt2lH+OPTyXI6pLz7kaEIw2b5eauZFpPtGh4el77S3bVBl
         oqO/49iy6TvhdSQa/hffATJh1tt315VAjK8sAAkvmGjyoFkdGxy00nHK/0oOA6IbjU2P
         rSm+CMBEUBWL0RmUvqAWfwWLfCmlyQ38qf4CUsD7iZU0ELVebodTpZj62tI6mBQalGU1
         WPt49jTdfYOUG/8nSPGxXBEWsLcI7V+FtT44T5iOHFiAItIExmzfURc5Biisa1hICmpj
         nFw/02qhLkFhaqh9/YRyjNFD+ijNkmzEUO0dBlxW14+be76RKaJsPDjgfr63RPzUGGMh
         G5bQ==
X-Gm-Message-State: AOJu0YxjIHJHWpFcu99fiojBwuaTR240FAEQk7zB8+XqzncjCVwAWdIv
	kU8HS9eLlxS6buOLnQPARJSH086BX0Y=
X-Google-Smtp-Source: AGHT+IGZp7jX9pyVJ85KOu9xeczNJjISgH+1b6oeO/Jvcmc7QFSs7YyNKGmQibHUOq+uiWYlXn+E7Q==
X-Received: by 2002:a2e:b784:0:b0:2bd:1cd0:6041 with SMTP id n4-20020a2eb784000000b002bd1cd06041mr6742266ljo.0.1695367482559;
        Fri, 22 Sep 2023 00:24:42 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id z23-20020a170906435700b00992f309cfe8sm2311330ejm.178.2023.09.22.00.24.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Sep 2023 00:24:42 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 13/40] diffoscope: upgrade 244 -> 249
Date: Fri, 22 Sep 2023 09:24:04 +0200
Message-Id: <20230922072431.1481743-13-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230922072431.1481743-1-alex@linutronix.de>
References: <20230922072431.1481743-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Sep 2023 07:24:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188056

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../diffoscope/{diffoscope_244.bb => diffoscope_249.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/diffoscope/{diffoscope_244.bb => diffoscope_249.bb} (93%)

diff --git a/meta/recipes-support/diffoscope/diffoscope_244.bb b/meta/recipes-support/diffoscope/diffoscope_249.bb
similarity index 93%
rename from meta/recipes-support/diffoscope/diffoscope_244.bb
rename to meta/recipes-support/diffoscope/diffoscope_249.bb
index c17bd81f5b1..b6791036942 100644
--- a/meta/recipes-support/diffoscope/diffoscope_244.bb
+++ b/meta/recipes-support/diffoscope/diffoscope_249.bb
@@ -12,7 +12,7 @@ PYPI_PACKAGE = "diffoscope"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "8bee8bbb144cdb7ddfa21886d5ce1822220139241c9a53def09b4adc3340db93"
+SRC_URI[sha256sum] = "bc4d8cb3198025013784ef7e3fa61b7a642de39e5b790c45d7c29d153306fbdd"
 
 RDEPENDS:${PN} += "\
         binutils \
-- 
2.30.2


