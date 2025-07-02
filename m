Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DF02C83013
	for <webhook@archiver.kernel.org>; Wed,  2 Jul 2025 07:25:32 +0000 (UTC)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
 by mx.groups.io with SMTP id smtpd.web10.17997.1751441131840692413
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Jul 2025 00:25:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=JlNWjQ5c;
 spf=pass (domain: linaro.org, ip: 209.85.208.176, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-32aabfd3813so41698091fa.3
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Jul 2025 00:25:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751441130; x=1752045930; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uSj2Ct90fH7vaoQLhRE4RZBzxvgiSrYd8XVNiQwgRO8=;
        b=JlNWjQ5cibKQdOis+w134ktOElv8HPB4rOWGz7iYruburFUz+nivX3b61BmJCmd7bP
         kYFwfZFyprfZpeAvgQWw2dJT3VF2tVGfcmQpgmDuUCDAIYIQJr68fHeEGFDnBuSVGXVI
         YDt6gSUtVyGf9AxzranHIMV+bSRwyUr+hwgga9RDcIegQqhGFSs/J9VjnVW6J8auFQ5P
         jNpHt4syAkbDlHFOFsnyFnBdw6V7vdpyJneOFi6PT3G00F9vrXRwfxQdftsYp1hj41hU
         ZeUMzF/IdvSgsnu2otHL5FTnjev/VwnVEhKnAx7/cDOcB29EoXucywMypUrQmCvKoycs
         GhYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751441130; x=1752045930;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uSj2Ct90fH7vaoQLhRE4RZBzxvgiSrYd8XVNiQwgRO8=;
        b=tLWRS96KS1E40H6/AUEOOXx2DL6VNrdZqOhRt1TqIFf2rkkcWr0SanJTbXvV2SKb6q
         KRpnR3ySOuqFRvCs3Nw8QMSNblluNE95hOp4h6VwRwh4xguSL7ETGabw7ZjlLcZdqval
         eq6WMdj6BD53EV61ZFgfg+RYOQS70B+f/cyLudEyeOckHRKkdJ6sAzsjJNt9rpQbDm1U
         jv9LdqrxU2LoKhy9aIB9Pxl1KIxZY8BdGTFJQt/BWyBsPYHBIvW+fkKj9Jm3i1bjBNji
         mrLRQ8C85YQYY58qK23VF8INWHnqcHkS7DfLb6ZnRgSkctG9Eq7wLGl+Oucm7Xdcu87t
         SApQ==
X-Gm-Message-State: AOJu0YwnUDqQ/LlAACSz2cc+HXufXhSZrN4cHZnZ4PDl62zKCr8vIwzr
	U2gD2ppZ9zye8Ri3QR17JQeZCqalamIQcSq5JguGjafPm6Yq4ledcwFOVZtUpRD71B57YJPnkM3
	R4POS
X-Gm-Gg: ASbGnctjne2DmUkUyYqdk++kxLFqtKBtZMpe1DKJxN3X5FIQz/lNRqpsFUpGXf2Hoyn
	QYGXs35jk5ZUVzjkEAFwUlX/WFChv9LV4KqsSPCQPpv/7Lt9EY1YyWnSRyydx8v+eUhK2BSk8fb
	RhUA8JMyi8Dz1av1iDQP1aM9BvVdRhvVadkd37jv5uF3+bIOqvTPtjjbNxgy6pMDTL9y1FZ90XL
	TrFIwUdk1o/4hyV90O3lWPMTueAqUzq5tOp4NIWfH3xtrhJqYd5unxSDMrMpHm6dXRTdOHFSDjO
	cf6Xr3yI84q0kLVnO0hEJGSmyURreX8cUXN7+f0VCYvD+1hdnZJSHoW87AGCbEl3S++/mMeds1k
	z8lgHcgPD0oE/toJ/VcsH6JxQ2CeKf0pEYRAa3dU=
X-Google-Smtp-Source: AGHT+IE37R78erHZ3MU8t12cQVAnkWZcGbxmfJ2ioVJd+YJ5AjsUgwHyAvJZRmKdlskqGC9YT1Dxhg==
X-Received: by 2002:a2e:a590:0:b0:32b:4932:d328 with SMTP id 38308e7fff4ca-32e00094cc3mr5845911fa.32.1751441129750;
        Wed, 02 Jul 2025 00:25:29 -0700 (PDT)
Received: from localhost.localdomain (87-100-218-141.bb.dnainternet.fi. [87.100.218.141])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32cd2f0c7d7sm18781181fa.102.2025.07.02.00.25.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 00:25:29 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH v3 1/5] oeqa runtime: set self.runner and handle None
Date: Wed,  2 Jul 2025 10:25:12 +0300
Message-ID: <20250702072516.1075450-1-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Jul 2025 07:25:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219789

Set default self.runner to None. qemu target sets
the runner to qemu. Then handle self.runner None in
run_network_serialdebug(). This way ssh runner
and failing ping or ssh tests handle the error cases.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 meta/lib/oeqa/core/target/__init__.py | 1 +
 meta/lib/oeqa/runtime/case.py         | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/meta/lib/oeqa/core/target/__init__.py b/meta/lib/oeqa/core/target/__init__.py
index 1382aa9b5239..177f648fe358 100644
--- a/meta/lib/oeqa/core/target/__init__.py
+++ b/meta/lib/oeqa/core/target/__init__.py
@@ -10,6 +10,7 @@ class OETarget(object):
 
     def __init__(self, logger, *args, **kwargs):
         self.logger = logger
+        self.runner = None
 
     @abstractmethod
     def start(self):
diff --git a/meta/lib/oeqa/runtime/case.py b/meta/lib/oeqa/runtime/case.py
index 9515ca2f3d62..2a47771a3d47 100644
--- a/meta/lib/oeqa/runtime/case.py
+++ b/meta/lib/oeqa/runtime/case.py
@@ -23,6 +23,8 @@ class OERuntimeTestCase(OETestCase):
         uninstall_package(self)
 
 def run_network_serialdebug(runner):
+    if not runner:
+        return
     status, output = runner.run_serial("ip addr")
     print("ip addr on target: %s %s" % (output, status))
     status, output = runner.run_serial("ping -c 1 %s" % self.target.server_ip)
-- 
2.43.0


