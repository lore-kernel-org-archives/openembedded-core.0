Return-Path: <stondo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59456C5DF84
	for <webhook@archiver.kernel.org>; Sat, 21 Feb 2026 04:25:33 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14457.1771647925294410553
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Feb 2026 20:25:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FXMqD/05;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: stondo@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-48371119eacso26848395e9.2
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Feb 2026 20:25:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771647923; x=1772252723; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ojOcrmoGUXPXvC78AazSF8+Ka8dEGTxSYjqrZQrl6cI=;
        b=FXMqD/05OhnTspArooJkq6CTtvB8Kp7Nycjqw4yEVhlVt6QD1TkXxozE4hgmHDofsw
         5mIOv+T/haeQvGWinJvdKS/w+nfFWREWDPCYup1fvtJrOJ/tvX0Gjr4COYNuGHaBnSXD
         CTE4u31xccntWXxEp9ipotHAbpKrFr7hLl8qauNZllFzsDuVZgCu1dlqUbqHnXyxGivT
         AVzwn87MUGqktV9HbPJq+60oW3wtM5K+Jlk4hBmfW4O8ZCfczRWhVZCyh3oD6idmFnuq
         5UktUzAJcC0z+/Ol+F6Pxad9VE/eML5KnyQ1o41r+merUYPDsEhOFLjFVICOCLSEycYW
         4yuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771647923; x=1772252723;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ojOcrmoGUXPXvC78AazSF8+Ka8dEGTxSYjqrZQrl6cI=;
        b=M8TWlGRTZ38Y6RgBx7ekozZ6C/jSLPUmJ3UA/2Tr+cbDLnS5FA4tO4IEY5M1ndftPd
         4M74F55jQaMSCrF+4aC1+2pq9i+eii491grBT+qufQVH1QEyNHcpk8NKXa3UshasSmwX
         MUgdGGA1XZAr1sRPPJdkwNDDSWJ68q2BiQnAcyeVhzOBMWLG7wGq3SO1/ugR7DX4ONXt
         VsG+44suF+wAXyaUw9/YWROnTIg3gTWkYhsAxqk+4fqCyVoRlOjRfsUVJ0GWfn+imWZH
         rXhJMdInI2e3wxo6tHc5WynIDjWVg9ommE7Ku2+T6Kk/l3sHnedCMemJzUMIUr1JLdaV
         ya8w==
X-Gm-Message-State: AOJu0Yy6E0geplgA2hveoqcvp6rloCsgTWEjO4VvjrIl4NyiFA5OVhKq
	oxUyCikzoOVL+8I0WNOSfMHCk7hM9bpUBGn8ccWjsurlrkSZbpjOyze5tATgwQ==
X-Gm-Gg: AZuq6aJKbvflLb3lfH1e1WaftMqJuOKH2hI9hIVeT6Tv87EoD9JnO++XuJXu9fX/cs8
	NC8bsR7FVzogSsuf6cZmrY6k7oueQgeWxgq98NooqAcVkAFErC9ZODpMLtEowKdnw/wRtVos0n2
	JxiNTmcmY9EPSNfSLt8k+rFMp5h6fI359+tLYvovu2R7vSm8CQTDlX9nzGsheks7bnvMXhvzZo3
	KzhFEKhi9dnc8LVDe8oo5idr43TDP5inYNFYYQA1b+lsIL8D3utOhWobMEhxxiALMDYq7PcFQ4G
	olK9v3QZ3qIg6ibz6AY9TY6YDpxyW2w1cbZOR8ploYIVjGomvB7OrdCULjrY6pxk1Ojhse4s1MD
	FitUV0jknvRtzKbcPll048DNxfPmaaE8T+wuPWvh3C5GQ3Tv3bMGypqyM4IKybWHdlU8BkGCwB3
	5zV4tQNG80mHtzb4SI/tVuF29mMPJio8aojabC9rTBmBxaUw==
X-Received: by 2002:a05:600c:5020:b0:47e:e2ec:995b with SMTP id 5b1f17b1804b1-483a95fb29cmr32507355e9.9.1771647923374;
        Fri, 20 Feb 2026 20:25:23 -0800 (PST)
Received: from fedora ([81.6.40.67])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a3ddd3c8sm47955095e9.2.2026.02.20.20.25.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Feb 2026 20:25:22 -0800 (PST)
From: Stefano Tondo <stondo@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: stefano.tondo.ext@siemens.com,
	adrian.freihofer@siemens.com,
	Peter.Marko@siemens.com,
	jpewhacker@gmail.com,
	Ross.Burton@arm.com
Subject: [PATCH 0/1] spdx30: Runtime dependency detection from package manifests
Date: Sat, 21 Feb 2026 05:25:20 +0100
Message-ID: <20260221042521.318013-1-stondo@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 21 Feb 2026 04:25:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231571

From: Stefano Tondo <stefano.tondo.ext@siemens.com>

This patch adds lifecycle scope classification for SPDX 3.0 dependency
relationships by reading runtime dependencies from package manifests.

Currently, SPDX 3.0 dependency relationships lack lifecycle scope
classification - all dependencies appear the same regardless of whether
they are build-time or runtime. This patch reads the package manager's
manifest files to determine which dependencies are actually needed at
runtime, enabling proper LifecycleScopeType annotation.

Key changes:
- Read runtime dependencies from package manifests (dpkg, rpm, ipk)
- Classify dependencies as runtime or build scope in SPDX relationships
- Add oe-selftest coverage for lifecycle scope classification
- Properly handle implicit shared library dependencies (e.g., glibc)

This enables downstream tools to distinguish build-time from runtime
dependencies for vulnerability analysis and compliance assessment.

Stefano Tondo (1):
  spdx30: Read runtime dependencies from package manifests

 meta/classes/spdx-common.bbclass     |  53 +++++++++----
 meta/lib/oe/spdx30_tasks.py          | 112 ++++++++++++++++++++++++++-
 meta/lib/oeqa/selftest/cases/spdx.py |  78 +++++++++++++++++++
 3 files changed, 227 insertions(+), 16 deletions(-)

-- 
2.53.0


