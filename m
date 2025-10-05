Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF416CAC5B8
	for <webhook@archiver.kernel.org>; Sun,  5 Oct 2025 11:48:09 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.web11.9103.1759664880383740303
 for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Oct 2025 04:48:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=FFEp4hit;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.179, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-b551350adfaso3583451a12.3
        for <openembedded-core@lists.openembedded.org>; Sun, 05 Oct 2025 04:48:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1759664880; x=1760269680; darn=lists.openembedded.org;
        h=message-id:date:user-agent:to:from:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uRXpgVi8LPqazmE1K3dm7wH8qJjrn7sIgeFwJUL71/8=;
        b=FFEp4hitlczCHuHnNWmJDZKz2SMt8gHlqEtgPznrZ2/47SBqSyLl3VeRhbsAx3gQZJ
         W+qENj5Q63ETs3g1VQ1TWekAnXnRdOkjmwqeA470VdATKSqhZAeC+jC5x55ESCj6Z/m7
         gqJCJJ2OQTDYPsqW+12W8k2uGjsKO6ptyrH0YOdp0j4VPR49qmBE45606tcK9akJirnh
         0jODUcTfdoFyB982t19Dq1kJzCFka4vqXZvNuYW1EA9v6Mt205V6cdNvGZzh2e6J2Q0F
         SF7WFyPu7vtMGSqNkZ0bmF7ykNSy4uddZ4cacUqXpk8iFR/73Tm+RhT4PaMxoJF6NlHw
         Ay0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759664880; x=1760269680;
        h=message-id:date:user-agent:to:from:subject:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uRXpgVi8LPqazmE1K3dm7wH8qJjrn7sIgeFwJUL71/8=;
        b=hEJdWO9q52OWy3L9So+jiEBtq/qHdSM0vvjmK1asszo2chW8OSvbikhZxA5Q/ulbFm
         QvCqwJs2PAkuODJ1JxnnOrA8V0caSgklK6iSqcdwLHsm2ZMNZGfjyzQAW8l1/GklaMcv
         PkDemya20VSoaPc+Ff/p7yr0ETLa+CM7xYNI9YGC1xWxZjzb9H+WRk7KDyk+ioKvyDMN
         k5Qv5XZgb1PjQxnG7KwZFZUCHe9NlF6/V1aHZ6NvOMKeZmBqEJdKMmgPcpsY/gccC8hY
         6bTApk5Qg2LqsDdG8zkQ56uWzZQJhA/3em0leEXFu4olNJDeaftHEBVPRQOFgN80NT24
         sT4Q==
X-Gm-Message-State: AOJu0YyL9RjiJdF1rd+Zv2LM6HRpxmVWDohE8Q0dyESxyxj9+BJfSKpt
	BhQMNi9AZc3EodmYvybvj/wXtLDtRU6dz5rBgRPJcJ43dNMKunLg7B2AJYfpEOngSNHqbtOIobf
	EYmCd+Pk=
X-Gm-Gg: ASbGnct86GgOiGRF4cEZh6p6SMuvYLIuc/3GUiy5afvomJnUK08LYIlmHZw49ppGRWO
	r7cg6w2Ft67Ue8jKuXDfxXwTO/OQ0JqotGwJxbou381v/ltK08gPOZURnWLlhleGTUEZedKPm9i
	JJPi4sQTzQaeAsH37/5mVL88/zfu40aNMYOThKD0H+DXcAZaXvoHpTyj43nnlQS6h8IorBhtaJT
	/qo9UKB0ovzoT3twrO9ALZiIpYaX/6FVn3qNuhaSMKkJeBY3szcFyHpklrur1P17ipWc865CdSs
	Xkjg4FzFqin8qzn3+Yqo+0kD9BRrkhqi6kbgk9T2b7FKomk+U0WciF3H5D/OD/BjbUQxFJ8QqMq
	Hp0H39G5IOD8demWEUZkO6xpPntVnbZ9aCzvsCbGpxJFbne0BSaLG9gNk5DUhIQ==
X-Google-Smtp-Source: AGHT+IFmKxWtapdr9vrh9hm422bXFnhivAPFlGcgKvERCDF+Agb/ru5saqs9lgR94TcDSYi6fstBuQ==
X-Received: by 2002:a17:903:3c24:b0:263:b8f:77dd with SMTP id d9443c01a7336-28e9a6b1caemr110343015ad.57.1759664879688;
        Sun, 05 Oct 2025 04:47:59 -0700 (PDT)
Received: from builder.sakoman.com ([71.19.246.55])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-28e8d1b9e44sm101008935ad.67.2025.10.05.04.47.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Oct 2025 04:47:59 -0700 (PDT)
Received: by builder.sakoman.com (Postfix, from userid 1001)
	id 06A921003DE; Sun,  5 Oct 2025 01:47:58 -1000 (HST)
Subject: OE-core CVE metrics for walnascar on Sun 05 Oct 2025 01:45:35 AM HST
FROM: steve@sakoman.com
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
User-Agent: mail (GNU Mailutils 3.14)
Date: Sun,  5 Oct 2025 01:47:58 -1000
Message-Id: <20251005114759.06A921003DE@builder.sakoman.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 05 Oct 2025 11:48:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224437

Branch: walnascar

New this week: 0 CVEs

Removed this week: 0 CVEs

Full list:  Found 33 unpatched CVEs
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
CVE-2024-57995 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-57995 *
CVE-2024-58097 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-58097 *
CVE-2024-6519 (CVSS3: N/A): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-6519 *
CVE-2024-8354 (CVSS3: N/A): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-8354 *
CVE-2025-21751 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-21751 *
CVE-2025-21833 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-21833 *
CVE-2025-21949 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-21949 *
CVE-2025-37803 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-37803 *
CVE-2025-37860 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-37860 *
CVE-2025-40014 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-40014 *
CVE-2025-4598 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-4598 *
CVE-2025-46394 (CVSS3: N/A): busybox https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-46394 *
CVE-2025-52194 (CVSS3: N/A): libsndfile1 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-52194 *
CVE-2025-59798 (CVSS3: N/A): ghostscript https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-59798 *
CVE-2025-59799 (CVSS3: N/A): ghostscript https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-59799 *
CVE-2025-59800 (CVSS3: N/A): ghostscript https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-59800 *

Summary of CVE counts by recipe:
  linux-yocto: 25
  ghostscript: 3
  libsndfile1: 2
  qemu:qemu-native:qemu-system-native: 2
  busybox: 1

For further information see: https://valkyrie.yocto.io/pub/non-release/patchmetrics/

