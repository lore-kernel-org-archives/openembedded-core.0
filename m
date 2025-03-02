Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B59AC19F32
	for <webhook@archiver.kernel.org>; Sun,  2 Mar 2025 11:19:47 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web11.28521.1740914383996607082
 for <openembedded-core@lists.openembedded.org>;
 Sun, 02 Mar 2025 03:19:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=mjwS7Eme;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.173, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-22355618fd9so57872875ad.3
        for <openembedded-core@lists.openembedded.org>; Sun, 02 Mar 2025 03:19:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1740914383; x=1741519183; darn=lists.openembedded.org;
        h=message-id:date:user-agent:to:from:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ChtfZSerK7fTZEeH/ODPPGeJgnVf1wWbczXxIU5tEgQ=;
        b=mjwS7EmeI9AvEAXEU+UH0ylhzFQ8mHWmHUpeE+F9c7RvbY9qWegye/HMEcxhT7LMfe
         eokFHQJeJoDrqetLbDtBksxfToUvi+kH5KAPfke1xQuQNIIVMW6Clc2QfiOKN6J32y0L
         mkrwg33JEQe5QMaAo2QSX6SKnlFTTn5kZqcKCISx/nty00IxYxNeTuFMYtJT/xi3alDt
         BGKpWXwx0+k54c6MCtSeOw9hpeGiho8VeNMY+Kw2DOpjADB5cUuMBS6KkzSYE7JcOe5O
         7DhMgA/m6CvYThcYs42im9w3dh33Ga03PKobq++Qh1xmR7h7YDk8GUwLfwFcve5JsO41
         b6WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740914383; x=1741519183;
        h=message-id:date:user-agent:to:from:subject:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ChtfZSerK7fTZEeH/ODPPGeJgnVf1wWbczXxIU5tEgQ=;
        b=DmaM5fgyAcW69VtvbjvOGujVP4Ng6lEVwx1qqvriiKEtcP8kbGl72z+GNvWgBhhP3C
         h/oE6RFl9uiT1gQsAy/P4IteEBlGMYQ69wblEFvo1cQwhaVljTqnUIOGxVxpOmLiZlc+
         /3R0UIyKNQzemJFqWutOo4bhLiC8j5Htevoh/LUcd5ub9Rqax6zfCYVcF/vAepHOIgRS
         kzv7mpqcRDwq/s1fzbfy9GV9P1rs5vKZlF7KaMRBqobkv1FGNIxgluE9DgZir50maQhE
         NkxzuCOs08emBkWdcAV1ZQzCE9SvFwn7le8dzTyee/ffjvJEixOpOiGlZZ7SZAQ2zMde
         WLxQ==
X-Gm-Message-State: AOJu0Yylqu7rVNZbQPuxEx31pQqlnblO7kSQdc/3HZ+8Lqpl8G9d9LfE
	rL0efymbZNP7Z/foAjcW3KiqkwtJawYI59UTz8eTn3ZiHL/yD4FQSjNz4HPKw8kINs4fnNPd0m9
	+
X-Gm-Gg: ASbGncvlxG6oRX2jEWBne0AWNgQki/nu5ZucLpMFdLI24knWCAEQ8RIRcPt7bFMrNX6
	llbXl5VD/+tv/QyDI4vprchJSwlFmEPXt91BOuNCKkjZz+TlQ7PV90y0svLWoRPHy6k+APUJbu9
	JsV0NnYwthDRGsfsM2xVBSarbFDdHn/R+L0rjGafASjb7+ShcyudjQLlYgjqnewt9x/1ZTrvggN
	SDEofMpcmMlgnBNKlhi1RmvM5wP7m/uA78yA1z/8zsZdObKer6M6DCKoS76VuJZzLBlCWfA9Vqd
	y7jr9EqQ9bSc4aC6h7UQAdkQ9DTJf2/42rjhd3tSt4hVUI/hfQ==
X-Google-Smtp-Source: AGHT+IEqw0Gz1nHiivg0cH1R/tOYp7AGBJ3hyE5q5y3xZzY4x9VWUglP9cA7P3B148OcMEo5O4Fq8Q==
X-Received: by 2002:a05:6a00:1810:b0:736:401f:c7de with SMTP id d2e1a72fcca58-736401fc97fmr2944474b3a.1.1740914382992;
        Sun, 02 Mar 2025 03:19:42 -0800 (PST)
Received: from builder.sakoman.com ([71.19.246.55])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-734a002474esm6799262b3a.86.2025.03.02.03.19.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Mar 2025 03:19:42 -0800 (PST)
Received: by builder.sakoman.com (Postfix, from userid 1001)
	id EF831100445; Sun,  2 Mar 2025 01:19:41 -1000 (HST)
Subject: OE-core CVE metrics for master on Sun 02 Mar 2025 01:00:01 AM HST
FROM: steve@sakoman.com
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
User-Agent: mail (GNU Mailutils 3.14)
Date: Sun,  2 Mar 2025 01:19:41 -1000
Message-Id: <20250302111941.EF831100445@builder.sakoman.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 02 Mar 2025 11:19:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212188

Branch: master

New this week: 3 CVEs
CVE-2024-13769 (CVSS3: 5.4 MEDIUM): puzzles https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-13769 *
CVE-2024-13770 (CVSS3: 9.8 CRITICAL): puzzles https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-13770 *
CVE-2025-0837 (CVSS3: 5.4 MEDIUM): puzzles https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-0837 *

Removed this week: 0 CVEs

Full list:  Found 22 unpatched CVEs
CVE-2019-14899 (CVSS3: 7.4 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-14899 *
CVE-2021-3714 (CVSS3: 5.9 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3714 *
CVE-2021-3864 (CVSS3: 7.0 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3864 *
CVE-2022-0400 (CVSS3: 7.5 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0400 *
CVE-2022-1247 (CVSS3: 7.0 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1247 *
CVE-2022-38096 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-38096 *
CVE-2022-4543 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-4543 *
CVE-2023-1386 (CVSS3: 7.8 HIGH): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-1386 *
CVE-2023-3079 (CVSS3: 8.8 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3079 *
CVE-2023-3397 (CVSS3: 6.3 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3397 *
CVE-2023-3640 (CVSS3: 7.8 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3640 *
CVE-2023-4010 (CVSS3: 4.6 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4010 *
CVE-2023-52904 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-52904 *
CVE-2023-6238 (CVSS3: 6.7 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6238 *
CVE-2023-6240 (CVSS3: 6.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6240 *
CVE-2023-6535 (CVSS3: 7.5 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6535 *
CVE-2024-13769 (CVSS3: 5.4 MEDIUM): puzzles https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-13769 *
CVE-2024-13770 (CVSS3: 9.8 CRITICAL): puzzles https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-13770 *
CVE-2024-38381 (CVSS3: 7.1 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-38381 *
CVE-2024-50613 (CVSS3: 6.5 MEDIUM): libsndfile1 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-50613 *
CVE-2024-8354 (CVSS3: 5.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-8354 *
CVE-2025-0837 (CVSS3: 5.4 MEDIUM): puzzles https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-0837 *

Summary of CVE counts by recipe:
  linux-yocto: 16
  puzzles: 3
  qemu:qemu-native:qemu-system-native: 2
  libsndfile1: 1

For further information see: https://autobuilder.yocto.io/pub/non-release/patchmetrics/

