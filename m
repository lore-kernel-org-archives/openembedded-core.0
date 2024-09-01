Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 259E5CA101E
	for <webhook@archiver.kernel.org>; Sun,  1 Sep 2024 11:19:01 +0000 (UTC)
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
 by mx.groups.io with SMTP id smtpd.web10.14316.1725189533178508145
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Sep 2024 04:18:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=s9UxWxmM;
 spf=softfail (domain: sakoman.com, ip: 209.85.217.44, mailfrom: steve@sakoman.com)
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-498d14b9b8cso1121786137.3
        for <openembedded-core@lists.openembedded.org>; Sun, 01 Sep 2024 04:18:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1725189532; x=1725794332; darn=lists.openembedded.org;
        h=message-id:date:user-agent:to:from:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wxGLV/54LIeCNI1a9JR5VTB0BvV5XaWcKGJU9rDqAt4=;
        b=s9UxWxmMxViFSbjbIGYXfsscuSJSlMF3gXdQtt37Wqe3q7Ja8/CRHm8wBJhu4f34tE
         qwX/vVOxY5KPXr/5X8mn79BYVAaAo4DF2+YzBmrQoIMf6SpZKtPS9UnkDjsl5aLnp5GQ
         +cygYbAJpEVHlYeK1fXKEXb2dKiaKKT94Su0lDart2JkYjlHXyKpy/b9rg8dhWBn503r
         uVhbIlAoEKN+JmkF3b8fIYHjXFMMQYNL2Wl2x3bDYa8VhZJr/fYnYpzDGXgRRtzuD/J5
         5aFrD0XYmva0ylcOPGe1h+t+sVrzkeldbQauwqKHHMfB3zvhlb2win1/hcDdeOXvXM+Y
         MMcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725189532; x=1725794332;
        h=message-id:date:user-agent:to:from:subject:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wxGLV/54LIeCNI1a9JR5VTB0BvV5XaWcKGJU9rDqAt4=;
        b=J/W74K9AW0YlWMw5sdIMXPkJAS94yTwBtRwo3TDa9iIpJbe/VWzwtid61OJy/0TU1j
         JQUh36tbtUlwtM7noLpmEsj2KF3VNz9dY1o0/c52QgXVeTVEuZ30nqtD/Z1UvowlDLOd
         bbOR9WHoKtlAYzAharsxbkZ1d0nXPJfzFaJYmLEMFe4plK+HjnOXU5J66xba1YncwpG5
         SWvRG6HS2YbWEnFDr8CGSTdmBnqafiOc2Drh0+J2a6OiptI1LARZpBdNV6FQduX+PmA4
         jCD8S791/F8u5xVTa8AvNZIORPByw4Ax4XuiYybL2BGZxYBZ0TSs1Cc2qC8HVsnQDkRe
         lVvQ==
X-Gm-Message-State: AOJu0Yx09iyH7a9bTCxK1AR/QapvFTAlUwsBpBaqWv8Sm1OhuTe35IlI
	hlvg+cGTLucZYM9jEtXfxqwvwFPULU7n56WrSSegPxFZRPxr4mD+tirZWxI/mILAc3X02CXzla4
	6
X-Google-Smtp-Source: AGHT+IFZSmeE0AZYhSAbFfKUT932e+U6o7DmVWb8qOj8qX9FnntrMIDo9q/bqmLtoBhvCvYjRZMxUg==
X-Received: by 2002:a05:6102:4428:b0:493:b719:efaf with SMTP id ada2fe7eead31-49a5af35cd5mr14571524137.20.1725189531949;
        Sun, 01 Sep 2024 04:18:51 -0700 (PDT)
Received: from builder.sakoman.com ([71.19.246.55])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a806c255d6sm319393285a.45.2024.09.01.04.18.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Sep 2024 04:18:51 -0700 (PDT)
Received: by builder.sakoman.com (Postfix, from userid 1001)
	id 70472100436; Sun,  1 Sep 2024 01:18:50 -1000 (HST)
Subject: OE-core CVE metrics for master on Sun 01 Sep 2024 01:00:01 AM HST
FROM: steve@sakoman.com
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
User-Agent: mail (GNU Mailutils 3.14)
Date: Sun,  1 Sep 2024 01:18:50 -1000
Message-Id: <20240901111850.70472100436@builder.sakoman.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Sep 2024 11:19:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204044

Branch: master

New this week: 0 CVEs

Removed this week: 25 CVEs
CVE-2019-14899 (CVSS3: 7.4 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-14899 *
CVE-2021-3714 (CVSS3: 5.9 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3714 *
CVE-2021-3864 (CVSS3: 7.0 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3864 *
CVE-2022-0400 (CVSS3: 7.5 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0400 *
CVE-2022-1247 (CVSS3: 7.0 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1247 *
CVE-2022-38096 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-38096 *
CVE-2022-4543 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-4543 *
CVE-2023-1386 (CVSS3: 7.8 HIGH): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-1386 *
CVE-2023-3397 (CVSS3: 6.3 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3397 *
CVE-2023-3640 (CVSS3: 7.8 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3640 *
CVE-2023-4010 (CVSS3: 4.6 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4010 *
CVE-2023-51767 (CVSS3: 7.0 HIGH): openssh https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-51767 *
CVE-2023-6238 (CVSS3: 6.7 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6238 *
CVE-2023-6240 (CVSS3: 6.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6240 *
CVE-2023-6535 (CVSS3: 7.5 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6535 *
CVE-2024-32928 (CVSS3: 5.9 MEDIUM): curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-32928 *
CVE-2024-35325 (CVSS3: N/A): libyaml:libyaml-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-35325 *
CVE-2024-42262 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-42262 *
CVE-2024-42263 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-42263 *
CVE-2024-42268 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-42268 *
CVE-2024-42269 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-42269 *
CVE-2024-42270 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-42270 *
CVE-2024-42271 (CVSS3: 7.8 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-42271 *
CVE-2024-6505 (CVSS3: 6.8 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-6505 *
CVE-2024-7592 (CVSS3: 7.5 HIGH): python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-7592 *

Full list:  Found 0 unpatched CVEs

Summary of CVE counts by recipe:

For further information see: https://autobuilder.yocto.io/pub/non-release/patchmetrics/

