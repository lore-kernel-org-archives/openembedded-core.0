Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C13ACD8CB9
	for <webhook@archiver.kernel.org>; Wed, 10 Jun 2026 14:59:09 +0000 (UTC)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21656.1781101678181439562
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Jun 2026 07:27:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=UMAl/CO1;
 spf=pass (domain: gmail.com, ip: 209.85.215.178, mailfrom: leoreis.costa@gmail.com)
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-c858cc9870aso3404146a12.0
        for <openembedded-core@lists.openembedded.org>; Wed, 10 Jun 2026 07:27:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781101677; x=1781706477; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oQxGJCGi6dgKHmRgXI8hTSoZ23B4b1kfLjL2aAcmZAU=;
        b=UMAl/CO1+M0m1bHumB4RdNDZfyNjKUH8swnHYsiPiBJtpE0s9/iiIuOJ/bG/6snzXZ
         IB0sHlkJU/+pfTqXMnvkOHFr6HvmrKz9n/Re70ZQi5PolD5kJBPMUncw8a4lhHspxR31
         yXsR/LLxVcDsBlRbXRv8wMx0uaCSqJTXLjDKChNkMAneynaeJ6mg+kZdS/3PVGJtSPA/
         LDEz2CGRW6bWrup+Pzs3BPLq+sokLHgYc2VC8Jd3ndiIcAOBnmH33fm1JXHvH/AAIa94
         TvRXyaZllxXS1irq0JQuehPClqwG5JOeFxVgdiwYoODSJw9Wb8IO64OaJuJ6U2h4kH9n
         QIyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781101677; x=1781706477;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oQxGJCGi6dgKHmRgXI8hTSoZ23B4b1kfLjL2aAcmZAU=;
        b=b9TcJb4n0SMY//gXLiTarcDwGo1oMz7NJvBrzjzH0I+jGcHObb0y0BtwBEidyURiGr
         r9q3HYoxC6/KQmdJjnbgY/EsTeLsroOtCs9H4b79xifZdmBDa+a2S/E0opeNOzIthSFZ
         zqpdD4LdFyiDM+g6jNmEL9coynW1P4Sk8P+1hDyFK1dD5JuJinz/E87rbTpDR1tAAFmH
         TZtqLUjVTHoS/GWssvoR1vyN3lBmwjVKbvSTtNEUUsO3D1AavWGApysiFHEsg64vTF0z
         04WuKJU+dd3VB7mgzpjNaUtEgD5+RIAyy0cMJFm7VLn3/y2TmOM0ZMZRAnP1PzQfhCti
         l4MQ==
X-Forwarded-Encrypted: i=1; AFNElJ8QixGYqFCr5ELKficyUqNY2bZWlh7Ko90Ql1i1jWJrdVHk+nw1mlCEjG2ICYAFbloC9j5ODNdraT7m7WusNBnbjg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YySaJtO24IcnMqIQJhNZV+5FSYE+Y5cVRUmXJQ3+mhAdWNb8srg
	UcQtZL3UXy76z3AAM1FAh/he6jmkSRVzykgtLfPy4plyigFNECitnlRN
X-Gm-Gg: Acq92OHPWSAlM3Nn4D+acZ2aWvohfzQW0V0QpBnOrqsTDKsOV9l56cgSscha6HLl18x
	mRizt0RiAhQUHcjRzH4VQtnWiSCjKcKidZfTKsutr4FL/Ra7hrbt12hO2S+VzVVL0a7p3gsqmBs
	ELQZsHjcjnoo+AvSP2AUcou3spQmiD6btaPnL3FH9qxfN2nXaTcJDl3m2ZysDsuh7i5g+wlDrLK
	nTr9seX5G/WR/NVdF31fkp670vx5YRufehJUFCvaTdwhuYZhykO1qCZbZ0hc3HY5xhKRmpwdngD
	/qKMes6+uvAzNabzONXJo20khfgw4CtfiRRZHNQpyECF6IcOQH6UxLIlVUZz+G+Tqjps0nR/xA7
	+Yz+qKnZnlgbcy/5+lSat2DJO1XAD/g5AxnvToJnKRp5WUMPH1sL9ydbJrDwCyNwAPD9yveNSeE
	J/lSM9L5vr2D+B3J5DdE3YlTPkMQVtzayiJsmlJ9YPGveO8xlt2co8oNIUE46wLIaVnTETwEB4h
	RGwxENDwKBPkBRgs1nG4yHRQKkoXb/97CPnKaid
X-Received: by 2002:a17:90b:2f0d:b0:368:3830:a8bd with SMTP id 98e67ed59e1d1-37131041514mr19588950a91.7.1781101677280;
        Wed, 10 Jun 2026 07:27:57 -0700 (PDT)
Received: from leonardoc-nb ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36f6bf82fecsm23224274a91.3.2026.06.10.07.27.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 07:27:56 -0700 (PDT)
From: Leonardo Costa <leoreis.costa@gmail.com>
To: jpewhacker@gmail.com
Cc: leonardo.costa@toradex.com,
	leoreis.costa@gmail.com,
	openembedded-core@lists.openembedded.org
Subject: [PATCH] [OE-core] [RFC] spdx: Add ability to change the deploy SBoM name
Date: Wed, 10 Jun 2026 11:26:53 -0300
Message-ID: <20260610142658.10318-1-leoreis.costa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260610141128.6606-1-leoreis.costa@gmail.com>
References: <20260610141128.6606-1-leoreis.costa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Jun 2026 14:59:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238367

From: Leonardo Costa <leonardo.costa@toradex.com>

Allow "deploy" tasks that have set SPDX_DEPLOY_TASKS to choose a custom
name for their deploy SBoM.

Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>
---
 meta/classes/create-spdx-3.0.bbclass | 4 ++++
 meta/lib/oe/spdx30_tasks.py          | 2 +-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/classes/create-spdx-3.0.bbclass b/meta/classes/create-spdx-3.0.bbclass
index f915f5cfd5..1444816530 100644
--- a/meta/classes/create-spdx-3.0.bbclass
+++ b/meta/classes/create-spdx-3.0.bbclass
@@ -178,6 +178,10 @@ SPDX_DEPLOY_TASKS[doc] = "A space separated list of sstate tasks that produce \
     'after do_create_spdx'.\
     "
 
+SPDX_DEPLOY_SBOM_NAME ?= "${PN}-deploy-sbom"
+SPDX_DEPLOY_SBOM_NAME[doc] = "The name of the output deploy SBoM when using \
+    create_deploy_sbom"
+
 SPDX_DEPLOY_ARTIFACTS = "AUTO"
 SPDX_DEPLOY_ARITFACTS[doc] = "A space separated list of deployed artifacts, \
     relative to SPDX_DEPLOY_ARTIFACTS_DIR that should be included in the SBoM. \
diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
index b69f79eae9..d56cbe543e 100644
--- a/meta/lib/oe/spdx30_tasks.py
+++ b/meta/lib/oe/spdx30_tasks.py
@@ -1885,7 +1885,7 @@ def create_deploy_spdx(d, spdxdeploydir, artifactsdir, artifacts):
 
 def create_deploy_sbom(d, deploydir, deploy_tasks):
     pn = d.getVar("PN")
-    sbom_name = f"{pn}-deploy-sbom"
+    sbom_name = d.getVar("SPDX_DEPLOY_SBOM_NAME")
 
     objsets = []
     for t in deploy_tasks:

