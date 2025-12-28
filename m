Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9181DD3B7E5
	for <webhook@archiver.kernel.org>; Sun, 28 Dec 2025 11:02:14 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.22960.1766919726488336328
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Dec 2025 03:02:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=YAZ4z/aq;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.182, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-7b8e49d8b35so10183743b3a.3
        for <openembedded-core@lists.openembedded.org>; Sun, 28 Dec 2025 03:02:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1766919726; x=1767524526; darn=lists.openembedded.org;
        h=message-id:date:user-agent:to:from:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FjcirkFXwfIeJETml2b0lPTSupH9vSUAkgu7sAAIQj0=;
        b=YAZ4z/aqulr5oRCx59r/6Wu0tmsxjIwLPX9G+qEHGPJ0dDWXx/WF6gUnhUWXrWHap3
         gT7MvY95KrH/Y583qHso0KMH6cxNye/O6G4cTE+6+QYDi0wX0JfELNLr1IJ9qn09DKjC
         ikKNM4HicPjgzX4FKJQMgAEbtrhCA/nHa3eTroKr9PCZeM7lRZpoRqDvlz4kqODVx1H8
         ZhAWq6Mf2Vbo4t8rR6wc5Dn0lfBXjjrn91vgMPF86EWbHoGQYfEnb8X5+6Fd0jd6VDdl
         z5t8gx6ah5X9vhSWh6ZqaYSVF2tHA4r4pXeo2+TNtROBcX9Vr5ShqXh1Ae/fK9fm6PbZ
         YDVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766919726; x=1767524526;
        h=message-id:date:user-agent:to:from:subject:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FjcirkFXwfIeJETml2b0lPTSupH9vSUAkgu7sAAIQj0=;
        b=OUDcwt9+8tgLdqHGuVnjRK157MJReo+MwULSW2RpUWrS6Y7DyJ056+eLARZaQ8QFo1
         Og7xhMUe45RpbhTPU4+/qegu5UanhJkbqFJECaZ4+VJ05xza4cyDoOMns/NPsqspeUGN
         ezvw95URhoo3ZKVMh1btSjAvphJsYLKCroKZG9lLiuhCNIBLuA8jUOwdw0nohSqobiib
         S3GWJNCF+rOqjCWh9Q82AiN8os8Mz/iYMwhyGz/lkJ6qdrhB3qX0Ee3qVsc6Fs/5HHsX
         xU0OnGjd2YBoSghfeenyu6vWlvoBkfMZ+1JqQY9JntWEifW56dpIsvp2p+D+aUVw1urV
         c/hQ==
X-Gm-Message-State: AOJu0YyU7h98KdGxCY9YJ3+VbS5zrAOOt2m24juDF8+zN1LEBxAFxt0C
	J5OqbMvXezeCIud9OyrQukohZsp6OBiGfOPIJIFZw5q66IP1QO5hwaYwhcoZCBKEWVO5aChBGYM
	TFZ4j
X-Gm-Gg: AY/fxX5I0CW4kkVJX0qtOpHbkfzr4cP6AQ81M2ag8/W9Q1vFo6lValtFuKukL0fvWn3
	RLVqXhq0Cnuebp9iUGLV9U40lft2Amt7b5RnDsV3K4H3UU+77wHOCJxNGKPYx7rghtgkHLADmBI
	qaYY+Pe1NENGY7xvhMIJ0sBGZmTJ14EKsXdII36B7b9mNNPcxAhI+ph3VxaHuMXVM9K4ENr5LXR
	5Lup3j+ZtNjqccWZYWEzoqYLhwE1hyZg66vBDym56Rpp/cgHZLpmRoqMICoHSAiFY6YRuMYDpQc
	+0OvlnIz/fFZPNVRB9Q0C4gbcvExrX3XEnAPgBg4O2Qwwjtii907wCa7jSS7zDWj8rSKV+MgG/o
	/dqF/AbQbkThZRD9OpXrEUJET4lYM4o9SsTJ6aLJF5PdenKLencTRPe6+9tqV2Ir96TP46uQ8ZV
	L2oWUQIYPDtqakZNk=
X-Google-Smtp-Source: AGHT+IHSO5EsWZzV7ylGUFqmpdmcdK73XkeiXoZGYYWGLZNoTp1RSO0O4KpG8qteJqIyeRJzPES6hA==
X-Received: by 2002:a05:6a00:348d:b0:7e8:43f5:bd0d with SMTP id d2e1a72fcca58-7ff66f590fdmr24282660b3a.34.1766919725456;
        Sun, 28 Dec 2025 03:02:05 -0800 (PST)
Received: from builder.sakoman.com ([71.19.246.55])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7dfabcbcsm26728310b3a.31.2025.12.28.03.02.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Dec 2025 03:02:04 -0800 (PST)
Received: by builder.sakoman.com (Postfix, from userid 1001)
	id 791F21004AB; Sun, 28 Dec 2025 01:02:04 -1000 (HST)
Subject: OE-core CVE metrics for master on Sun 28 Dec 2025 01:00:01 AM HST
FROM: steve@sakoman.com
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
User-Agent: mail (GNU Mailutils 3.14)
Date: Sun, 28 Dec 2025 01:02:04 -1000
Message-Id: <20251228110204.791F21004AB@builder.sakoman.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 28 Dec 2025 11:02:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228582

Branch: master

New this week: 0 CVEs

Removed this week: 1 CVEs
CVE-2025-66293 (CVSS3: N/A): libpng:libpng-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-66293 *

Full list:  Found 23 unpatched CVEs
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
CVE-2025-12084 (CVSS3: N/A): python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-12084 *
CVE-2025-52194 (CVSS3: N/A): libsndfile1 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-52194 *
CVE-2025-66382 (CVSS3: N/A): expat:expat-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-66382 *
CVE-2025-66418 (CVSS3: N/A): python3-urllib3:python3-urllib3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-66418 *
CVE-2025-66471 (CVSS3: N/A): python3-urllib3:python3-urllib3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-66471 *

Summary of CVE counts by recipe:
  linux-yocto: 16
  libsndfile1: 2
  python3-urllib3:python3-urllib3-native: 2
  expat:expat-native: 1
  python3:python3-native: 1
  qemu:qemu-native:qemu-system-native: 1

For further information see: https://valkyrie.yocto.io/pub/non-release/patchmetrics/

