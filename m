Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99490CCFA1E
	for <webhook@archiver.kernel.org>; Sun,  9 Nov 2025 11:46:35 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.23363.1762688793803000030
 for <openembedded-core@lists.openembedded.org>;
 Sun, 09 Nov 2025 03:46:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=dEanPnvj;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.177, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-76e2ea933b7so1942113b3a.1
        for <openembedded-core@lists.openembedded.org>; Sun, 09 Nov 2025 03:46:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1762688793; x=1763293593; darn=lists.openembedded.org;
        h=message-id:date:user-agent:to:from:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=botPGB0T8iJS+6CXrx9Uk4sz1a4ah6l4BTK1UYjENRs=;
        b=dEanPnvjxnacXWEk1Qhqk8EudmAObWFK8rvgQVnZCQ2Il+vxIQPOoeroZSAFtKpGJS
         clr6/0iZetO+VHOqAk92TYoMdxrCsFVOf3uQfiGo84jy8+j8XoEWtvWtbCkOQuuIZ+gg
         kEi8dtp8EicuNdDLqQ5O+x3zVgDsuMyUXJr43u6GHclW1XvS9uqIY6qn/XPiVGzouz6m
         LhfOZh/Cae8A9reJNy6+OqCE+i1J1m0T2EuCFvhu/uS/eTj65I/9jdOWK5ChdnE7Vu5I
         FvskfdlMOUsqudK0JcCWEP3McvbDJk+FTaAlZlMP7vYTIufO/upYnz43HxdkXv2/rIY3
         hE+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762688793; x=1763293593;
        h=message-id:date:user-agent:to:from:subject:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=botPGB0T8iJS+6CXrx9Uk4sz1a4ah6l4BTK1UYjENRs=;
        b=TFxSoTFBte/JtwbS1/v2lp/kLuCKr+q18mbltvfPFxSIwJhHbftgP+BHKeIzaPCSxN
         WtJsUq1aQxDP1dUUqC1UavxepGBz7h+8zqaOIKPmPa+C+mr5X24kI+HNPzWlMxykNhEc
         hvG3n590520RoZgVtIhPFv7vWWxop+GQ29TrlrBENKaIn3qRmvmk+VsgRoaLqlIbm6rd
         5cKYkefvwnGf70SCL4DB6W8QviwYx25Of28iZ2uzII5mAS1HW74OajEPvt+UQG9s3M8/
         iuJq/5BGadBziuRRnIieRz2HpJQFgch55hsW8eDh6NL1AYFl9m7PPOjtrF8LuU3S6du/
         cL0A==
X-Gm-Message-State: AOJu0YyQOlAGq5qxqFrVar9af0q3XrCLav2XgbvHyIkd0PWUEMHb0ihS
	EEZGbKJq4oPUhZNBtBZUJkRmcoTnvKHjz85gPIfjAU5EUJhlvkAIa/5Zg3XJQyWxa1Uh1hRB5gy
	tXZ3o9wc=
X-Gm-Gg: ASbGncsZklW2ziNgtff9Q6hM6CQ1zyhGxD1Vo6vMHWtoefHZg9qiH9zaJNg0jefP3o1
	5OCk5lDKDu/AMY+VmwEYzjH3rrm2CS5JEjzKIiCUyvIvYeRQTTlMXoRtq1X5nVzgxfFq0QZHYeP
	XJmLOg/WteAQdSyApVLutgyU272ByUrdEJzGq58YKGOFWH/qlbWn12qKyU3TwBuu4iNYgAAzKKa
	tNZNWVh/bNFWfUr2GVXNhI0v5lXwoQnaFq5n91ObyU+FrwuMfbybOqQzVt2P7lcC/V+0FgwKfv0
	5IoLypldLpaXIFCEBQ9IgK88BX2zmNIFrsbk6z9lV0y89PHowgk3QARFQJm4SQqE38KZ8TEkOz2
	xazvxFDZmBas2Tct1owYfIreYNU0iwOoi7cfRK9j8cHUOOiKZMG+lk8grRTiBN0laIiQJdQ9WZ0
	QPwtDEQYBOnd3/UyI=
X-Google-Smtp-Source: AGHT+IE7HinVt8G9mtWS8rrByDdmilmk0T/vwfABiqCyccP2LVAzJjbBZtK8uf4AFyOXSsi/FkCJiw==
X-Received: by 2002:a05:6a20:244d:b0:342:9223:e3 with SMTP id adf61e73a8af0-3538aa117d0mr7642917637.17.1762688792987;
        Sun, 09 Nov 2025 03:46:32 -0800 (PST)
Received: from builder.sakoman.com ([71.19.246.55])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ba900eab130sm9720902a12.25.2025.11.09.03.46.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Nov 2025 03:46:32 -0800 (PST)
Received: by builder.sakoman.com (Postfix, from userid 1001)
	id 331C31001C6; Sun,  9 Nov 2025 01:46:32 -1000 (HST)
Subject: OE-core CVE metrics for walnascar on Sun 09 Nov 2025 01:44:35 AM HST
FROM: steve@sakoman.com
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
User-Agent: mail (GNU Mailutils 3.14)
Date: Sun,  9 Nov 2025 01:46:32 -1000
Message-Id: <20251109114632.331C31001C6@builder.sakoman.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 09 Nov 2025 11:46:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226091

Branch: walnascar

New this week: 19 CVEs
CVE-2025-22104 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-22104 *
CVE-2025-22105 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-22105 *
CVE-2025-22106 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-22106 *
CVE-2025-22107 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-22107 *
CVE-2025-22108 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-22108 *
CVE-2025-22109 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-22109 *
CVE-2025-22111 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-22111 *
CVE-2025-22116 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-22116 *
CVE-2025-22117 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-22117 *
CVE-2025-22121 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-22121 *
CVE-2025-22127 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-22127 *
CVE-2025-23129 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-23129 *
CVE-2025-23130 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-23130 *
CVE-2025-23131 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-23131 *
CVE-2025-23132 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-23132 *
CVE-2025-23135 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-23135 *
CVE-2025-37743 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-37743 *
CVE-2025-37746 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-37746 *
CVE-2025-40325 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-40325 *

Removed this week: 34 CVEs
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
CVE-2024-50613 (CVSS3: N/A): libsndfile1 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-50613 *
CVE-2024-52560 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-52560 *
CVE-2024-58015 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-58015 *
CVE-2024-58074 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-58074 *
CVE-2024-58093 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-58093 *
CVE-2024-58094 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-58094 *
CVE-2024-58095 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-58095 *
CVE-2024-58096 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-58096 *
CVE-2024-58097 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-58097 *
CVE-2024-6519 (CVSS3: N/A): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-6519 *
CVE-2024-8354 (CVSS3: N/A): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-8354 *
CVE-2025-21709 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-21709 *
CVE-2025-21751 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-21751 *
CVE-2025-21752 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-21752 *
CVE-2025-21807 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-21807 *
CVE-2025-21949 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-21949 *
CVE-2025-46394 (CVSS3: N/A): busybox https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-46394 *
CVE-2025-52194 (CVSS3: N/A): libsndfile1 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-52194 *
CVE-2025-59800 (CVSS3: N/A): ghostscript https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-59800 *

Full list:  Found 27 unpatched CVEs
CVE-2023-6535 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6535 *
CVE-2024-57995 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-57995 *
CVE-2025-21833 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-21833 *
CVE-2025-22104 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-22104 *
CVE-2025-22105 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-22105 *
CVE-2025-22106 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-22106 *
CVE-2025-22107 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-22107 *
CVE-2025-22108 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-22108 *
CVE-2025-22109 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-22109 *
CVE-2025-22111 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-22111 *
CVE-2025-22116 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-22116 *
CVE-2025-22117 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-22117 *
CVE-2025-22121 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-22121 *
CVE-2025-22127 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-22127 *
CVE-2025-23129 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-23129 *
CVE-2025-23130 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-23130 *
CVE-2025-23131 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-23131 *
CVE-2025-23132 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-23132 *
CVE-2025-23135 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-23135 *
CVE-2025-37743 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-37743 *
CVE-2025-37746 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-37746 *
CVE-2025-37803 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-37803 *
CVE-2025-37860 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-37860 *
CVE-2025-40325 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-40325 *
CVE-2025-4598 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-4598 *
CVE-2025-59798 (CVSS3: N/A): ghostscript https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-59798 *
CVE-2025-59799 (CVSS3: N/A): ghostscript https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-59799 *

Summary of CVE counts by recipe:
  linux-yocto: 25
  ghostscript: 2

For further information see: https://valkyrie.yocto.io/pub/non-release/patchmetrics/

