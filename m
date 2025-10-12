Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B22AECCD184
	for <webhook@archiver.kernel.org>; Sun, 12 Oct 2025 11:02:40 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web10.16667.1760266952443756053
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Oct 2025 04:02:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=lbXDSRRB;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.176, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-781db5068b8so2734981b3a.0
        for <openembedded-core@lists.openembedded.org>; Sun, 12 Oct 2025 04:02:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1760266952; x=1760871752; darn=lists.openembedded.org;
        h=message-id:date:user-agent:to:from:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vp5WXV2SiOW4aPE3zDFABEofaj3TUpHEM5chDSGQgMI=;
        b=lbXDSRRBCJJZreIw3u7wt12YOEBomZjWkFrbmQewdGJDeJ4kyECcwycYSFEJpXk6Wg
         KALBBxG2uxmVnE+qJOXVZrjt+TEjO8jAyqZg0A/cfq0C3ltYKZDTW761V5q89+yNuy8V
         0H/ZhL95s0uGvomuXP8TLe4pkqA4P1Bgvf8dD8GPxibT2dMBf00pbnhghDNkmVOfoQtq
         K/78uKE1rEruICtm6HRFMDXQYbIehvnEAq6DoKwFfJ0m0UO+jU6manqxO/gMupXwYzxv
         NHQ2wQ6aA2F7ZxMwTHPsVLIC+FDOSgmwNKGs0n0weARiyeONVQ7el9QbPKDLywA8GETh
         pYDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760266952; x=1760871752;
        h=message-id:date:user-agent:to:from:subject:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Vp5WXV2SiOW4aPE3zDFABEofaj3TUpHEM5chDSGQgMI=;
        b=gxRk3apmY4qDZUNKa2ixS8/XvI+8nF6DQTWPJN+dHtCJQEZT27mD7itggwjQHpUQfS
         zaapaE8FDuzzXCK0ZQk2RqJ9L5qaU1vu6N4+Xna5dfZXv/S70srAwTxgmDHXx/8BXb7Q
         /dDCvewi2YbwjZfHLU4oK+7Eb3vEI2fQeTzZOx0Pm4gyqa9KCLQCDzi8IE3jCgvKjKY5
         ZjrGJxsCEwn6UNg8lKyEmvCyCkdAvBKFXinGQwSOu+vQnhYcMMUzuAG9wXP5QXF4CZ3C
         KYkaVv3F/A0o3suuNNtCgSHvqom/HPWLhrf1VQRs/+eW1fhrceoQRHRfJit8y4+Zx3ue
         qPBw==
X-Gm-Message-State: AOJu0YycMMQgxZWMMakP2l1pFuMEc+bjEcE7HjYwNuhzqEm66Zc6RaUI
	XlufkId+pK8Yg3w6Y4Hrzn1kY5pRk+4mJzReR9Dk5cpA4KLmARRqMbPyAjcgcHh82RcNfVFvR+5
	hzl80
X-Gm-Gg: ASbGncvevNl5XaH10Wm9ScbLlW24NAmzD7O889y62pqMMilLQl4cuK5dUlrSKyEOj9C
	ys7Ahbm0snapFLqtrOjSP181mn9SGW9T+MaPkRQNJa4UglFRLzYTaAwX0/yIN2yxyzrzspsB3UE
	j880oGjtsuejcJI8PPnKI1/D+D77kjwoVinuqmxvxydopIRz2JMg8v1ubRv9ZJVHZ4rB7IAIUEs
	5D+KHU6e97bGtiox99uOfvjgPnCmNvdY+mFKTJG2srsas4bxBxfhy2opDv3MkPt+oRwWutsf2Fp
	wMjOPPAGzMLGmlwDQ9ojD1hA8JTIs2lsXW1BPqhBRuoP+rcMZ8FjVUmSmDHU553M+7FqL4sGvLr
	IoLsNikZqVUBv/Gtv2K59WsLb6/ufL6TiX9aLIEMD14hrAg==
X-Google-Smtp-Source: AGHT+IE34U1dNUrb9e/qemO7F0MiacQnW5mnAEZiS+h8a4rblqwCQ22nsu72ej9wViwQGSTGgQc+SQ==
X-Received: by 2002:a05:6a00:2e92:b0:77f:1ef8:8acb with SMTP id d2e1a72fcca58-79385ed596bmr22432334b3a.13.1760266951555;
        Sun, 12 Oct 2025 04:02:31 -0700 (PDT)
Received: from builder.sakoman.com ([71.19.246.55])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992d993f7bsm8111865b3a.78.2025.10.12.04.02.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Oct 2025 04:02:31 -0700 (PDT)
Received: by builder.sakoman.com (Postfix, from userid 1001)
	id 90D641003D1; Sun, 12 Oct 2025 01:02:30 -1000 (HST)
Subject: OE-core CVE metrics for master on Sun 12 Oct 2025 01:00:01 AM HST
FROM: steve@sakoman.com
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
User-Agent: mail (GNU Mailutils 3.14)
Date: Sun, 12 Oct 2025 01:02:30 -1000
Message-Id: <20251012110230.90D641003D1@builder.sakoman.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 12 Oct 2025 11:02:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224731

Branch: master

New this week: 0 CVEs

Removed this week: 1 CVEs
CVE-2025-46394 (CVSS3: N/A): busybox https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-46394 *

Full list:  Found 26 unpatched CVEs
CVE-2019-14899 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-14899 *
CVE-2021-3714 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3714 *
CVE-2021-3864 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3864 *
CVE-2022-0400 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0400 *
CVE-2022-1247 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1247 *
CVE-2022-38096 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-38096 *
CVE-2022-4543 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-4543 *
CVE-2023-3397 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3397 *
CVE-2023-3640 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3640 *
CVE-2023-39176 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-39176 *
CVE-2023-39179 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-39179 *
CVE-2023-39180 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-39180 *
CVE-2023-4010 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4010 *
CVE-2023-6238 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6238 *
CVE-2023-6240 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6240 *
CVE-2023-6535 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6535 *
CVE-2024-50613 (CVSS3: N/A): libsndfile1 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-50613 *
CVE-2024-6519 (CVSS3: N/A): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-6519 *
CVE-2024-8354 (CVSS3: N/A): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-8354 *
CVE-2025-11081 (CVSS3: N/A): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-11081 *
CVE-2025-11082 (CVSS3: N/A): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-11082 *
CVE-2025-11083 (CVSS3: N/A): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-11083 *
CVE-2025-29087 (CVSS3: N/A): sqlite3:sqlite3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-29087 *
CVE-2025-3277 (CVSS3: N/A): sqlite3:sqlite3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-3277 *
CVE-2025-52194 (CVSS3: N/A): libsndfile1 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-52194 *
CVE-2025-6965 (CVSS3: N/A): sqlite3:sqlite3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-6965 *

Summary of CVE counts by recipe:
  linux-yocto: 16
  binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite: 3
  sqlite3:sqlite3-native: 3
  libsndfile1: 2
  qemu:qemu-native:qemu-system-native: 2

For further information see: https://valkyrie.yocto.io/pub/non-release/patchmetrics/

