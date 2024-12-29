Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E843EE7718B
	for <webhook@archiver.kernel.org>; Sun, 29 Dec 2024 11:19:53 +0000 (UTC)
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
 by mx.groups.io with SMTP id smtpd.web10.43236.1735471192263142566
 for <openembedded-core@lists.openembedded.org>;
 Sun, 29 Dec 2024 03:19:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=hq8aE11J;
 spf=softfail (domain: sakoman.com, ip: 209.85.222.171, mailfrom: steve@sakoman.com)
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-7b6f0afda3fso856329085a.2
        for <openembedded-core@lists.openembedded.org>; Sun, 29 Dec 2024 03:19:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1735471191; x=1736075991; darn=lists.openembedded.org;
        h=message-id:date:user-agent:to:from:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c3PHGTHnMTYtC8j/6RMczlrL9TpZYi+H/TFKMWdRV4c=;
        b=hq8aE11JaXr5LLhSlISZdd/AEPMmCpxXn5bLYocgCIOZ9TqJdUwBmBOtjeET9b6Gwr
         EFnIxDRj3f68FwbVzOn8qX8QiR6U5bIlaMv1rjRei5u8ahL5PD+tsFvM10HHFj2niv39
         eW8otHeHjS6EP7Qbd7eOXoUNWJU/hl1f5RfIlhOu1RYVEduHP12aeKTZ1FEY/d3EqOps
         Yr/ELwQ3cv/qAdrGNexirrwOAs+N53MWAkFVbS0/ybVldVohKqXwBz0koobLkvvbnxeo
         IfLmmnHRTCGpTbaahhw/cdXcDNe+M2NO3k1SOyBblXXQ0GLZPw0sap4tZutoJoZsXHfb
         jZBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735471191; x=1736075991;
        h=message-id:date:user-agent:to:from:subject:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=c3PHGTHnMTYtC8j/6RMczlrL9TpZYi+H/TFKMWdRV4c=;
        b=lqld9g+7GhmY2EkSd1c5oIlFXhCfqjcKLFLgXzgnkcfB88UozZjJVWmgfY8CV8hAZU
         LIZNGrEM5KgpycoNCsGghltYj1Saato0PQekeWGQ3Vz9xbxEZLwy6Gh9xVxHKAetPyxS
         h0yBgnQ56YP0odIKgI60ZQjdRjb9sS/0xGZ4w8TNS1lqF4uofrOlKrAJQR70Wj85zr+q
         fUr/+c31UCDKn05lOcNu8SyABNWCUQwUV9yQYNwKQshX3u1uITYe261zeZ/ZWBTbzU9a
         YO3rN2ELC4STrHy9z3qcOOvthbF78cBnVJWVNC5nUJ0fvKq10qZxKtYW47t/tU/lR2je
         wAsQ==
X-Gm-Message-State: AOJu0Yy/zjdCZ0TQRsjJXQSX37CXt49mWkkQOgZgjnDjZ0hy0EGOy9NJ
	DzDvA8IrnG2UHzwFexk6X9ATiNQWPYPqVfg5h2u45WNWIheyM3orqZv30oWEYfh2odz7rFNn4VF
	3
X-Gm-Gg: ASbGncuTpRyvW/IFM0eAOQVSswkqjiivqlUgZfgRDbAmutuIKuj3AufxADdQ5Z9z3Ap
	K5POFcKrnFDbeGopzGl1TlfgichWB9q63rg5IcChQnypISGjh68ZAaKBfozL/AXz9UsPgVnFc+r
	9vHacFklRZlPQqe1KdnmmbT/xm94IlzMm/5Pz93RVLZW74ENKe7JQ6fgwdA0GNHrB6ogMSd2djh
	0R8syUP6EcruXEBKhmc8synIYpV1dtimyJD4H2sDkE8ipmquWVBZACPntSVnA==
X-Google-Smtp-Source: AGHT+IHINdzsCSaQC4xB6PpAVBme7TSE9Gwe7N3dQIz4sw3jplkL+b3f3F+fXoxfhL9yDDW33kzpag==
X-Received: by 2002:a05:620a:1790:b0:7b6:cb4c:10e8 with SMTP id af79cd13be357-7b9ba716c09mr5039504185a.11.1735471190885;
        Sun, 29 Dec 2024 03:19:50 -0800 (PST)
Received: from builder.sakoman.com ([71.19.246.55])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b9ac4cc3c7sm837918685a.111.2024.12.29.03.19.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Dec 2024 03:19:50 -0800 (PST)
Received: by builder.sakoman.com (Postfix, from userid 1001)
	id 0628A10024C; Sun, 29 Dec 2024 01:19:49 -1000 (HST)
Subject: OE-core CVE metrics for master on Sun 29 Dec 2024 01:00:02 AM HST
FROM: steve@sakoman.com
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
User-Agent: mail (GNU Mailutils 3.14)
Date: Sun, 29 Dec 2024 01:19:48 -1000
Message-Id: <20241229111949.0628A10024C@builder.sakoman.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 29 Dec 2024 11:19:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209128

Branch: master

New this week: 0 CVEs

Removed this week: 0 CVEs

Full list:  Found 18 unpatched CVEs
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
CVE-2023-52904 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-52904 *
CVE-2023-6238 (CVSS3: 6.7 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6238 *
CVE-2023-6240 (CVSS3: 6.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6240 *
CVE-2023-6535 (CVSS3: 7.5 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6535 *
CVE-2024-38381 (CVSS3: 7.1 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-38381 *
CVE-2024-50613 (CVSS3: 6.5 MEDIUM): libsndfile1 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-50613 *
CVE-2024-8354 (CVSS3: 5.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-8354 *

Summary of CVE counts by recipe:
  linux-yocto: 15
  qemu:qemu-native:qemu-system-native: 2
  libsndfile1: 1

For further information see: https://autobuilder.yocto.io/pub/non-release/patchmetrics/

