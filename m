Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54423C7EE39
	for <webhook@archiver.kernel.org>; Sun, 29 Jun 2025 11:47:20 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web11.15641.1751197638324218682
 for <openembedded-core@lists.openembedded.org>;
 Sun, 29 Jun 2025 04:47:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Os7lP2bX;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.177, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-74b27c1481bso33868b3a.2
        for <openembedded-core@lists.openembedded.org>; Sun, 29 Jun 2025 04:47:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1751197637; x=1751802437; darn=lists.openembedded.org;
        h=message-id:date:user-agent:to:from:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sVESM/ejw6kJn+BqF8A7YnKkI44T2Z3ssvh9FW0bIWQ=;
        b=Os7lP2bXlqtEPNQqqo5gSJEPoNtajRzAajmV6PyTlC/KAirZb0aUIoJK6gwhaal0xm
         aZ0Tsb8m5U5ch+TILTeivrbpzibVas9T8Li2KGkOLsyCgwzVrTN0YlOmsvG5oQst6QtJ
         F2rFbdkuPppB6O/chYJob9WdTfbP3orNmAvzAD2fGHAatHH+wxrNJfXqCTxFyqSKKFvz
         zPFA8nfDacYzRfL0LG3osZumM0qj6aIBLQjbQpWmTHdlXxpLPY+GyAXv2B5NHYJminxk
         xD3oUuWmIeeH4tkMR/+RDL+rQwwtY0qMGaDxgsVPiQ3ByCjOTs+epFOSa8SaThm/JZ1i
         r+Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751197637; x=1751802437;
        h=message-id:date:user-agent:to:from:subject:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sVESM/ejw6kJn+BqF8A7YnKkI44T2Z3ssvh9FW0bIWQ=;
        b=T075CKeERfi+WYcdu6U+P04jfWnmMtQLnaHWrJd4+Khw/21Slu+vSvBSDr9mvwzD8B
         WNTWdic1Wx59wCgg15mLoTAo6ALtgGAmrVkEddoR8e4KkxDMZs1bCZozUaOs4NiDzmLJ
         mAbby/+2XKBZP+ir223kbGsneVK6/GNZ1+MCo7jcFwTKIH3kAL/houPbS2rDwx/p5ycs
         QvsFJUzmid6SYPwsJejYbLD7RJj8k4RjUuUrWkIgwsa/D8fzoBsAGS6NdKABw7xIhE7C
         /kJoNKmJs5qXp1B/woBk+PjkCK+BAsj6ShELHKZe6N5jlAKHdwEMfW6gmRjve4axUVZv
         +jog==
X-Gm-Message-State: AOJu0YzZIDafr3kJi9pz2gOuUbaaJzr/Tfm4SbTKE3rl5pcKgmpIkmkc
	wVtEBi5jzMmuQyXTnLGEypj4TT9OH819N8XArMDgn1xHknWPfDJNXllGuNASGK4VS5bEMdzfIGa
	h/EGiaqQ=
X-Gm-Gg: ASbGnctG+MWLd7tnKcPvSLarFOAVh7kT/yoTd40Se8AlBh2mY+YEMkVU+ZxjpWgDeGR
	bg/GsS6jVCNGoa9KZ+94J61XwVzXIyxzn2b86+OVUJVSF6SzBLoXjJJPRPYNqbtSTK3oELcfeaN
	my9BQb/3INKXw0uh+QJP/x5m63nC24swX0ZGAKxrBZPe5yPUceTo3jz7Rj9RusXVD8Vlpa2RUo+
	Obl3qlq6fQiunNZMMA7F2jDsk+PFnnTz7trog5Z63Fc5thvmyk3g+E9xRtW25j8oqT3vl1wadar
	/J77bs2yqQ+5r0IQbAoFIy4gnnGsL8lgptwbcyf8YY1vzFOJ1tmsKBRBAeZ5UaPR194=
X-Google-Smtp-Source: AGHT+IElHBe5LuDRllT/d/LyEoQv7+Bjv8KlfjlSDFhZhCf4dmT4pMAynhXGX2RtGM4VxS6aPalIVw==
X-Received: by 2002:a05:6a00:1a8f:b0:748:f6a0:7731 with SMTP id d2e1a72fcca58-74af6fcd495mr15557041b3a.23.1751197637606;
        Sun, 29 Jun 2025 04:47:17 -0700 (PDT)
Received: from builder.sakoman.com ([71.19.246.55])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74af557b3a2sm6429681b3a.104.2025.06.29.04.47.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jun 2025 04:47:17 -0700 (PDT)
Received: by builder.sakoman.com (Postfix, from userid 1001)
	id 75F161002B2; Sun, 29 Jun 2025 01:47:16 -1000 (HST)
Subject: OE-core CVE metrics for walnascar on Sun 29 Jun 2025 01:44:29 AM HST
FROM: steve@sakoman.com
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
User-Agent: mail (GNU Mailutils 3.14)
Date: Sun, 29 Jun 2025 01:47:16 -1000
Message-Id: <20250629114716.75F161002B2@builder.sakoman.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 29 Jun 2025 11:47:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219443

Branch: walnascar

New this week: 1 CVEs
CVE-2023-52979 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-52979 *

Removed this week: 1 CVEs
CVE-2024-3566 (CVSS3: N/A): go:go-binary-native:go-cross-core2-64:go-runtime https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-3566 *

Full list:  Found 31 unpatched CVEs
CVE-2019-14899 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-14899 *
CVE-2021-3714 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3714 *
CVE-2021-3864 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3864 *
CVE-2022-0400 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0400 *
CVE-2022-1247 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1247 *
CVE-2022-38096 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-38096 *
CVE-2022-4543 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-4543 *
CVE-2023-3079 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3079 *
CVE-2023-3397 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3397 *
CVE-2023-3640 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3640 *
CVE-2023-4010 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4010 *
CVE-2023-52904 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-52904 *
CVE-2023-52979 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-52979 *
CVE-2023-6238 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6238 *
CVE-2023-6240 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6240 *
CVE-2023-6535 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6535 *
CVE-2024-50613 (CVSS3: N/A): libsndfile1 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-50613 *
CVE-2024-56738 (CVSS3: N/A): grub:grub-efi:grub-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-56738 *
CVE-2024-57995 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-57995 *
CVE-2024-58097 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-58097 *
CVE-2024-8354 (CVSS3: N/A): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-8354 *
CVE-2025-21751 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-21751 *
CVE-2025-21833 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-21833 *
CVE-2025-21949 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-21949 *
CVE-2025-23137 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-23137 *
CVE-2025-37803 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-37803 *
CVE-2025-37860 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-37860 *
CVE-2025-37925 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-37925 *
CVE-2025-40014 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-40014 *
CVE-2025-47273 (CVSS3: N/A): python3-setuptools:python3-setuptools-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-47273 *
CVE-2025-5914 (CVSS3: N/A): libarchive:libarchive-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-5914 *

Summary of CVE counts by recipe:
  linux-yocto: 26
  grub:grub-efi:grub-native: 1
  libarchive:libarchive-native: 1
  libsndfile1: 1
  python3-setuptools:python3-setuptools-native: 1
  qemu:qemu-native:qemu-system-native: 1

For further information see: https://valkyrie.yocto.io/pub/non-release/patchmetrics/

