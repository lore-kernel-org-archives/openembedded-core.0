Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FEA5CA0EE4
	for <webhook@archiver.kernel.org>; Sun, 17 Aug 2025 11:02:39 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web10.50978.1755428552286625485
 for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Aug 2025 04:02:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=vJsavhu3;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.178, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-76e2e5c0d4fso2445412b3a.0
        for <openembedded-core@lists.openembedded.org>; Sun, 17 Aug 2025 04:02:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1755428551; x=1756033351; darn=lists.openembedded.org;
        h=message-id:date:user-agent:to:from:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K5NNupvd7bBn2vzIHrJP0/6Zu+wohQHNqKQATbisU4c=;
        b=vJsavhu3zU5W7xqZJWagqCp+6c50ijsEZRzw+eGE/4Lp7YptpY7y6zhEzSkaxf66Jx
         S6SZXb8NzgTLxbNwqr5bpaBc+PEto4dB+0/08zrw/qfMLIa0GzZCue9YmtXKHli29s8O
         86HnNQAp13wr+1KvwoCU0W7noHVY04ztgbnwxv50YwyeF0wcBghvvcGHSNVFUrMHDpy3
         OyqbqrZLy9jtlQF5vc/TcrtpCm8qeZkx1b0/yAz8zT8J7xr5l1JTs7b03vTBbUeHKwox
         EQm3hVZhpRdR1Uz1zvSTHcYgCktffHnuDMQBYYg5Dc0HYchUkaA02DZo1hA4JPf8qQOk
         nx2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755428551; x=1756033351;
        h=message-id:date:user-agent:to:from:subject:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=K5NNupvd7bBn2vzIHrJP0/6Zu+wohQHNqKQATbisU4c=;
        b=WK/bhFEIiMH57kygQvb5vpg3OiUhJH5zvZRNjUCQAnFgYpHvD+m9asxY5Be53zeKku
         nHUX8CBwke+XOn4aftX8A5dqC2iidxCYvLXGcbUqBw72zgwnDUDimlVe8mqcANkvxx6t
         9VEqrR7tdc1KGmXMeoo5vAk7Y2GVgd8TPvKEFa8otuZPC4luYaHTKM7gJ2AeSAksyIW8
         Vep2iYu0GucJq8t9uUqojCef4CWwEG+4GDZUytZj/jB8Ko/FB8Fwu0Ug3/oFM+Ry1B6R
         6uonSNFxELD0b6pQgih2hnrnheCK2S/ir5QyRLDiXEftnhpsVy1oYgFW77iqwwyJbpAA
         8TsA==
X-Gm-Message-State: AOJu0Yz7EJc+2M1QQQ3rjKFR9JkJSce79dNtBNfI0aOVizewjgQVduD1
	4MAAEkLhOQU/md6l2qlsEcl/tMZWnCgQSDyrdAuxYI47Cw7sqPB3b/X0QaFDv7M3ocRvpoy3VKj
	rFX85
X-Gm-Gg: ASbGnctenctOOoNxOOywpBLLfgk89uFLx2op7vpkQfiFlwOY6nJuIv5zqLSV+iNdTI3
	D1Sf9EFMLTtqyj8lBERf+9tAuhSbCWKYjEHioB6RsP+TvfY+/+eq5yavjjkl2HVRn1ZzTKUrMsr
	q6OWapnk1WOjn7XYmLERMTeTNArnkIYUxHEKTuhWSYnh4bDbTFijbPxZipyOySuyit/Q6UwZqhm
	L8Wa9dXclMAMACPyFpW23B+IoU11o7gInYnYi1AWS4L7fqDakzE/yerlXHlfnAc19j8CSZL5Eyz
	B004CbzbgGz5sHHe79Gj9RzPBBfO1Q/5tSEWYAqZobUblD7Zm4zvMdhwmrzk0W7UusdF0TjW+5W
	3MoAF3eXXC26qqmbu9SFgZ9i7F/A=
X-Google-Smtp-Source: AGHT+IHUXNnvplAo75wTPDZpGXRhBf+EXGtMYRtTow3FI5LutjlKsSntyDzVQDwG9N1TEL23+9Kitg==
X-Received: by 2002:a05:6a21:6d94:b0:238:e08:f283 with SMTP id adf61e73a8af0-240e619b7b4mr8373812637.13.1755428551337;
        Sun, 17 Aug 2025 04:02:31 -0700 (PDT)
Received: from builder.sakoman.com ([71.19.246.55])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76e45268c18sm5069613b3a.5.2025.08.17.04.02.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Aug 2025 04:02:30 -0700 (PDT)
Received: by builder.sakoman.com (Postfix, from userid 1001)
	id 84A8710038E; Sun, 17 Aug 2025 01:02:30 -1000 (HST)
Subject: OE-core CVE metrics for master on Sun 17 Aug 2025 01:00:01 AM HST
FROM: steve@sakoman.com
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
User-Agent: mail (GNU Mailutils 3.14)
Date: Sun, 17 Aug 2025 01:02:30 -1000
Message-Id: <20250817110230.84A8710038E@builder.sakoman.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 17 Aug 2025 11:02:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222001

Branch: master

New this week: 5 CVEs
CVE-2025-32989 (CVSS3: N/A): gnutls:gnutls-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-32989 *
CVE-2025-32990 (CVSS3: N/A): gnutls:gnutls-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-32990 *
CVE-2025-53905 (CVSS3: N/A): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-53905 *
CVE-2025-53906 (CVSS3: N/A): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-53906 *
CVE-2025-6170 (CVSS3: N/A): libxml2:libxml2-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-6170 *

Removed this week: 1 CVEs
CVE-2025-37925 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-37925 *

Full list:  Found 41 unpatched CVEs
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
CVE-2023-4458 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4458 *
CVE-2023-6238 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6238 *
CVE-2023-6240 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6240 *
CVE-2023-6535 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6535 *
CVE-2024-50613 (CVSS3: N/A): libsndfile1 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-50613 *
CVE-2024-56738 (CVSS3: N/A): grub:grub-efi:grub-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-56738 *
CVE-2024-57995 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-57995 *
CVE-2024-58097 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-58097 *
CVE-2024-6519 (CVSS3: N/A): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-6519 *
CVE-2024-8354 (CVSS3: N/A): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-8354 *
CVE-2025-21751 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-21751 *
CVE-2025-21833 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-21833 *
CVE-2025-21949 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-21949 *
CVE-2025-29087 (CVSS3: N/A): sqlite3:sqlite3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-29087 *
CVE-2025-3277 (CVSS3: N/A): sqlite3:sqlite3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-3277 *
CVE-2025-32989 (CVSS3: N/A): gnutls:gnutls-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-32989 *
CVE-2025-32990 (CVSS3: N/A): gnutls:gnutls-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-32990 *
CVE-2025-37803 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-37803 *
CVE-2025-37860 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-37860 *
CVE-2025-40014 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-40014 *
CVE-2025-5222 (CVSS3: N/A): icu:icu-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-5222 *
CVE-2025-53905 (CVSS3: N/A): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-53905 *
CVE-2025-53906 (CVSS3: N/A): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-53906 *
CVE-2025-6170 (CVSS3: N/A): libxml2:libxml2-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-6170 *
CVE-2025-6297 (CVSS3: N/A): dpkg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-6297 *
CVE-2025-6965 (CVSS3: N/A): sqlite3:sqlite3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-6965 *
CVE-2025-7545 (CVSS3: N/A): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-7545 *
CVE-2025-7546 (CVSS3: N/A): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-7546 *

Summary of CVE counts by recipe:
  linux-yocto: 25
  sqlite3:sqlite3-native: 3
  binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite: 2
  gnutls:gnutls-native: 2
  qemu:qemu-native:qemu-system-native: 2
  vim: 2
  dpkg: 1
  grub:grub-efi:grub-native: 1
  icu:icu-native: 1
  libsndfile1: 1
  libxml2:libxml2-native: 1

For further information see: https://valkyrie.yocto.io/pub/non-release/patchmetrics/

