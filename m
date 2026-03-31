Return-Path: <stondo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B73A109B474
	for <webhook@archiver.kernel.org>; Tue, 31 Mar 2026 14:20:12 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21554.1774966810696904508
 for <openembedded-core@lists.openembedded.org>;
 Tue, 31 Mar 2026 07:20:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=AzX+uiIC;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: stondo@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4887d4c6234so9138675e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 31 Mar 2026 07:20:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774966809; x=1775571609; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yvExhTQ+NfdM1BvpcUa4KVOWb7fkkQtN3qEXpN8eClg=;
        b=AzX+uiICXKh2oIzeQ2qox0xF7aLC9LgFRDhnE7CEiZCCtKT7QQY5B/7vjcT4758k/N
         iwG30CHGZ3cVMEFpnXLM5nG4IrAABpnGe656RrEIHbZIrKLh+fvMjw2weFVCFXLtFbYt
         V/j8RJ8cOjqEpgNwTCwZjLpIdl7iT2mHjLs0E5WnAZpmafnpks6afkP+JlJX68kNowBf
         bhBM4Hlz/zojNZOp7vpI/N41zkwmkyqXk8aWOJHOO45ZbCvRZiO+JdqK/Tg8yiax3gt+
         69Jb5DQKm72GRWfhp/y3IepRXNjcorsIYlBNIA2PQiBjFEsyrZPIL2U9aDwgQId+nXjR
         yjfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774966809; x=1775571609;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yvExhTQ+NfdM1BvpcUa4KVOWb7fkkQtN3qEXpN8eClg=;
        b=AjH+aLRuR+rOYQr1+HwW3j6o2UKOmBky6bomuKIim3+syY64rIWwOeQHfckGP182yK
         8rNvkqGY12e4SCoH8PjFXC7mP/J0RQFdD/z2sLPNIe0zVaWX6HEkQx90bXHT1Y9RWPxf
         aIV0z7bnMX1nTCnoUDmDusV6ZtrSRJ0EZPhkDv2D5mHMhN01+1Y6CfmVjEHSCqJyHJzb
         uurUHdE9furUZVGfY2mL+9Nay+8Zyqn8yS49zkpVh6oWqqKupXvP1hbbLxygmit3t7K0
         0cW4jv0lXFOmV0mRAdT4+ZezRzzbv1v8vA/PJSJsQs1Ez+SqS+uq5n37jJaPpSg/29jF
         doEQ==
X-Gm-Message-State: AOJu0Yw0o6TM/ZgsQ5NoXPiY5/YkKVHdqwHR/Fb+vdQcubvg+WI2G1Bc
	T9pEYQDtrxbCecIVaUs31QXI9U2ceWC/eS3nfvdmIlYxgcc0Cjdly+O214LkNMQAerQ=
X-Gm-Gg: ATEYQzyFYIdbarsjEBO5wfDSpQkdbG1imalApiIoJ1EB2sB0xxJ47+uy5KxEH3JDAke
	hkAPuEkU7+z4TOC9TpXVnPACLOSG82Ne3vDqAfXloiO29BxgOcDMkxYjgzp2aRam5sUy4VSfdFG
	RBdHo2zWkH9jf8FtvwSk5bCVP05RdSe5ebyghT1+x3JcCgh/zcoXLvXIYF0sBWq/ysAitaH7bHW
	4YnGt85a5HN64M8jPRkeGx0QqmcPGlCEh0kJdSSjJykiHH+mJbFIs6vZsRv/i7kf6zs5fQSR0TV
	rxR+tpGknk9vTV5YB1ur0m5uZSbs0IS7UuYzWVLzHrNQ52fmDmP0wmIc89cBE9ZL3ZNy9skLNxV
	19dRoqRkAIcJThR/tdK9h/MIurhxmniSAPLkWijnMvjXwKB/nikghftOc/WFEKwLfhtdpHCYSRJ
	pQdd3IpCdYqe+9C9OCve0T8RmVB8jU356zbzw5wQpDEFdnpg1mDlRuWNHn2FfMZhx6LhEOiiad6
	L8mgg==
X-Received: by 2002:a05:600c:4685:b0:485:3fa9:358c with SMTP id 5b1f17b1804b1-48727eeac8bmr291999305e9.17.1774966808243;
        Tue, 31 Mar 2026 07:20:08 -0700 (PDT)
Received: from fedora (mob-194-230-144-65.cgn.sunrise.net. [194.230.144.65])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887c536a7fsm40865415e9.1.2026.03.31.07.20.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 07:20:07 -0700 (PDT)
From: stondo@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: JPEWhacker@gmail.com,
	richard.purdie@linuxfoundation.org,
	ross.burton@arm.com,
	marta.rybczynska@syslinbit.com,
	benjamin.robin@bootlin.com,
	peter.marko@siemens.com,
	adrian.freihofer@siemens.com,
	mathieu.dubois-briand@bootlin.com,
	stefano.tondo.ext@siemens.com
Subject: [RFC PATCH 0/2] spdx30: Add OpenVEX standalone document generation
Date: Tue, 31 Mar 2026 16:19:54 +0200
Message-ID: <20260331141956.608976-1-stondo@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 31 Mar 2026 14:20:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234291

From: Stefano Tondo <stefano.tondo.ext@siemens.com>

Hi all,

Back at the end of December 2025, I had a conversation with Adrian
regarding OpenVEX. Following my SPDX 3.0 enhancement series that was
merged recently [1], I would like to propose adding OpenVEX [2]
standalone document generation to the SPDX 3.0 workflow.


Context: current VEX landscape in oe-core
-----------------------------------------

Yocto currently has three VEX-related mechanisms:

1. SPDX embedded VEX (Joshua's recipe-level architecture in
   create-spdx-3.0): VEX assessment relationships embedded inside SPDX
   3.0 documents, controlled by SPDX_INCLUDE_VEX. This is the richest
   VEX data source, now at recipe level after the package VEX
   removal [3].

2. vex.bbclass (Marta Rybczynska): A standalone do_generate_vex task
   that produces per-recipe JSON files and a rootfs manifest in a custom
   Yocto JSON format. Used for CVE reporting and consumed by external
   analysis tools.

3. sbom-cve-check (Benjamin Robin, under review [4]): Post-build CVE
   analysis using an external tool that reads SPDX SBOMs + vex.bbclass
   manifests, then re-exports enriched SPDX 3 data.

What is currently missing is output in the OpenVEX format (openvex.dev),
which is a lightweight, interoperable JSON format adopted by an
increasing number of vulnerability management tools.


Motivation
----------

The OpenVEX specification [2] is gaining adoption as the standard VEX
transport format. Several widely-used tools already consume OpenVEX
natively:

  - Grype (Anchore):       grype --vex openvex.json
  - Trivy (Aqua Security): trivy image --vex openvex.json
  - cosign/sigstore:       VEX attestation support

Having standalone OpenVEX files alongside SPDX SBOMs would enable:

  - Direct integration with the scanning tools listed above
  - Separate distribution of VEX data without shipping the full SBOM
  - Compliance with EU Cyber Resilience Act and US Executive Order 14028
    requirements for machine-readable vulnerability assessments
  - Decoupled VEX lifecycle: documents can be updated independently
    when vulnerability status changes

This implementation does NOT replace or conflict with the existing VEX
mechanisms. It is an additional optional output format that reuses the
VEX data already produced by Joshua's recipe-level SPDX architecture.


Implementation
--------------

The approach hooks into the existing create-spdx-3.0 workflow. When a
recipe has CVE data, the implementation reads the VEX assessment
relationships already present in the SPDX output and generates a
standalone .vex.json file in OpenVEX format alongside the SPDX
document. The SPDX VEX statuses (patched, unpatched, ignored, unknown)
are mapped to their OpenVEX equivalents, and product identification
uses PURLs from the SPDX packages. The feature is disabled by default
and opt-in via a single configuration variable.

The series is two patches (generation logic + selftests), both included
below for anyone who wants to look at the details.


Open questions
--------------

1. Should the OpenVEX document ID scheme use a different namespace
   than https://openvex.dev/docs/yocto/ ?

2. Is the SSTATE_ALLOW_OVERLAP_FILES += "${DEPLOY_DIR_SPDX}" approach
   acceptable for VEX file sharing between recipe and package sstate
   tasks?

Looking forward to your feedback.

[1] https://lists.openembedded.org/g/openembedded-core/message/213367
[2] https://openvex.dev/
[3] commit 6406240932 ("spdx30: Remove package VEX")
[4] https://patchwork.openembedded.org/project/oe-core/list/?series=&submitter=&state=&q=sbom-cve-check&archive=&delegate=

Stefano Tondo (2):
  spdx30: Add OpenVEX standalone document generation
  oeqa/selftest: Add tests for OpenVEX integration

 meta/classes/create-spdx-3.0.bbclass |  19 +++
 meta/classes/spdx-common.bbclass     |  15 +++
 meta/lib/oe/spdx30_tasks.py          | 193 +++++++++++++++++++++++++++
 meta/lib/oeqa/selftest/cases/spdx.py |  90 +++++++++++++
 4 files changed, 317 insertions(+)

-- 
2.53.0


