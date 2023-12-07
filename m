Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73E9AC4167B
	for <webhook@archiver.kernel.org>; Thu,  7 Dec 2023 20:53:40 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web10.103709.1701982414189961902
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Dec 2023 12:53:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HEtVuCaH;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-40c0a074e71so14205725e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 07 Dec 2023 12:53:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701982412; x=1702587212; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XLNyDKm3dcWJBmJuDUQQ3AefYl+J4tad/WlxXVHQAB4=;
        b=HEtVuCaH8rbOI5GaADkvq2z1N+38QRbuMQ86qneCWAdyy1eymLLWslH1/S0r3Hu3qU
         iaCVWF6eY7qugCIMC3OMI060rL1HiWLN/2f8nAwOjXKPtikwH/wtzt75XIWM+qYOZ3Fd
         Go+PoosStbwk0sVZvuaqt4hJuECHybiay3uYEKE5/nqlHq86AHSScShubRkLkNgxijw4
         xypS/HaSjVQYbsUOs1TSuWYV8I/3+Ui7yOFLseaE42eP1H4aN8Q3EE2Y/sp6bQpXeaOk
         Efy2Rtml6EFYBQ1Z19vbqgD835KWnjpSkZkYznVtKkc/Kvqt+XlbEk03atMR8Ctr24k1
         1Dsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701982412; x=1702587212;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XLNyDKm3dcWJBmJuDUQQ3AefYl+J4tad/WlxXVHQAB4=;
        b=TxVGRFGpgL0pWZfcotQCaQl52wXdZG6sDYXNEAhVKghpMYvxcA/wdZ4YuPkwGC/NLc
         Sck7XOzhTtFqppSJmvDHZqF77rXnqMcaVDdWFC9k6d7laHMj+1oPArzcodOArfciNVpm
         CDdr6X0IbZmz/OuEC9Bjn/9KAaA0o6JbDtB8VVxqf8EH2To07Kg8OFYkh+Z3IlEIFKSS
         P/jBLUwvDIDfmAa6HtciPED0y4x2Ey5srqbszj6EgKO5H4h0eJqDqXmBB5xyJzwqzc+Q
         T3GCj47WUnPeQbhtxjdM0fwQwSNFh4aykfLoLapuVuNj4j15k2GuhQXbtEswTm7f4FYx
         ZE5w==
X-Gm-Message-State: AOJu0YxFbAzGWCihDa8oFOU5d1H2YDsyAINmJEz8XXpFV/N2hic+TZvM
	CT5XcVGUFw/jPBRMrq9d4OcpP0Th3Oc=
X-Google-Smtp-Source: AGHT+IFX4pN4DyPJLa9yGbruMIJ3d8vsUHrYJFqphUiaSesFofT3oZ7nkNFgxwgEaPeoyHuialAfqg==
X-Received: by 2002:a05:600c:468e:b0:40b:5e1b:54a7 with SMTP id p14-20020a05600c468e00b0040b5e1b54a7mr1869025wmo.51.1701982412155;
        Thu, 07 Dec 2023 12:53:32 -0800 (PST)
Received: from wsadrian16.fritz.box ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id ay41-20020a05600c1e2900b004063cd8105csm3032484wmb.22.2023.12.07.12.53.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 12:53:31 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 3/4] oeqa/core/decorator: add skip if not qemu-usermode
Date: Thu,  7 Dec 2023 21:52:50 +0100
Message-ID: <20231207205251.4152034-3-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231207205251.4152034-1-adrian.freihofer@siemens.com>
References: <20231207205251.4152034-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Dec 2023 20:53:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191975

Add a decorator to skip tests which require the qemu-usermode machine
feature.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/lib/oeqa/core/decorator/data.py | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/meta/lib/oeqa/core/decorator/data.py b/meta/lib/oeqa/core/decorator/data.py
index de881e097ab..5444b2cb751 100644
--- a/meta/lib/oeqa/core/decorator/data.py
+++ b/meta/lib/oeqa/core/decorator/data.py
@@ -185,6 +185,16 @@ class skipIfNotQemu(OETestDecorator):
         if not self.case.td.get('MACHINE', '').startswith('qemu'):
             self.case.skipTest('Test only runs on qemu machines')
 
+@registerDecorator
+class skipIfNotQemuUsermode(OETestDecorator):
+    """
+    Skip test if MACHINE_FEATURES does not contain qemu-usermode
+    """
+    def setUpDecorator(self):
+        self.logger.debug("Checking if MACHINE_FEATURES does not contain qemu-usermode")
+        if 'qemu-usermode' not in self.case.td.get('MACHINE_FEATURES', '').split():
+            self.case.skipTest('Test requires qemu-usermode in MACHINE_FEATURES')
+
 @registerDecorator
 class skipIfQemu(OETestDecorator):
     """
-- 
2.43.0


