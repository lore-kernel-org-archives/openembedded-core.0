Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83A5BC77B61
	for <webhook@archiver.kernel.org>; Sun,  9 Apr 2023 13:03:43 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web11.18952.1681045413465695832
 for <openembedded-core@lists.openembedded.org>;
 Sun, 09 Apr 2023 06:03:33 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=Y0Ao0uR6;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.54, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f54.google.com with SMTP id j8so247225pjy.4
        for <openembedded-core@lists.openembedded.org>; Sun, 09 Apr 2023 06:03:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1681045412; x=1683637412;
        h=message-id:date:user-agent:to:from:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X9RcRvp6PW3GGN9liPbyy7fEvbx0pK1O3JPrNj6aNz0=;
        b=Y0Ao0uR6HSGEx1NhvaB0XvOHxigibAxiHAfH+caK6QHupFOHvq9PMVhDWRjD4294UU
         pqdWkQoOKZb0dxBiAnEjJjtrJrrSJkwf230GvYCO/WbW4sbWt8ZUDkIMil4gRXysPBzB
         uA6SspkSBm4J/Q2ib/BGkJtHos+KCVyF2vUUNfnSQ5HkLDDFvGjwLl8+jwcU5e+DFAVi
         ixMVbNgc1AsPmC/iZTzGZu5zX/2SDtj/dlzmHBgVhqY/1BotKr0UORHmo+Crgh5miq8H
         IAMwpLRcJxeITssHwJxNWbYwdB5MTNG7c+WJB9tix7wCBM0lhAumH5O9qVjkqXQ/8ZMQ
         ku7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681045412; x=1683637412;
        h=message-id:date:user-agent:to:from:subject:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=X9RcRvp6PW3GGN9liPbyy7fEvbx0pK1O3JPrNj6aNz0=;
        b=l9VJ22tHJfmRkR/kSuKU9KuDUV8/QXnN4mYgzgJsZ0Ptt+tXLgcyIdTCwuDqvNfqMT
         aFNXwY8RpynFKrMw6uPdmI+O4+CiwJBqK7ZSDr94Pns9q2IHM+0S8XxbvLITlfMbWTt3
         yvA107auA1v539zZhBoQEjyLQiM/R0ShF9xE2pKteSMHkZdmKLMOMASINyZ5QuxIHKQ4
         bBiTdNDW52aUbZLT1A+Vn78YHlYSZTUDJ8NmBJJIlIWmNbj+Sk2VWN+L8xe7MTPb8Qkh
         3FDjb9m65jAxFxF/+pc2yNpU565SBlOGiv/H1lw3M1rQw5NFxW21AFjNYxWIdNEUJFpV
         YuRA==
X-Gm-Message-State: AAQBX9fQoYaTKjZIXE/UFS7wpjFa5UBqJE14GY8NvHuF+vM3oe8O919I
	FNlI+/DWeloUEdMqK0LVXPjDf5fXvcXD/iGC+BU=
X-Google-Smtp-Source: AKy350Zpmuy/s58UWoWqghHwtdPaSGLPsxFZbifrjACyWoEkHHkz7smlAr4tjaI4m9m+/nm0zDoQrw==
X-Received: by 2002:a17:903:228d:b0:1a1:f5dd:2dde with SMTP id b13-20020a170903228d00b001a1f5dd2ddemr6097631plh.44.1681045412104;
        Sun, 09 Apr 2023 06:03:32 -0700 (PDT)
Received: from nuc.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id x14-20020a170902b40e00b001a63ba28053sm329684plr.68.2023.04.09.06.03.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Apr 2023 06:03:31 -0700 (PDT)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id 05322963476; Sun,  9 Apr 2023 03:03:29 -1000 (HST)
Subject: OE-core CVE metrics for kirkstone on Sun 09 Apr 2023 03:00:01 AM HST
FROM: steve@sakoman.com
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
User-Agent: mail (GNU Mailutils 3.14)
Date: Sun,  9 Apr 2023 03:03:29 -1000
Message-Id: <20230409130330.05322963476@nuc.router0800d9.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 09 Apr 2023 13:03:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179839

Branch: kirkstone

New this week: 7 CVEs
CVE-2022-44370 (CVSS3: 7.8 HIGH): nasm:nasm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-44370 *
CVE-2023-0465 (CVSS3: 5.3 MEDIUM): openssl:openssl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-0465 *
CVE-2023-0466 (CVSS3: 5.3 MEDIUM): openssl:openssl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-0466 *
CVE-2023-0664 (CVSS3: 7.8 HIGH): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-0664 *
CVE-2023-27533 (CVSS3: 8.8 HIGH): curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-27533 *
CVE-2023-27534 (CVSS3: 8.8 HIGH): curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-27534 *
CVE-2023-28879 (CVSS3: 9.8 CRITICAL): ghostscript:ghostscript-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-28879 *

Removed this week: 0 CVEs

Full list:  Found 36 unpatched CVEs
CVE-2021-35937 (CVSS3: 6.4 MEDIUM): rpm:rpm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-35937 *
CVE-2021-35938 (CVSS3: 6.7 MEDIUM): rpm:rpm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-35938 *
CVE-2021-35939 (CVSS3: 6.7 MEDIUM): rpm:rpm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-35939 *
CVE-2022-2879 (CVSS3: 7.5 HIGH): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2879 *
CVE-2022-3219 (CVSS3: 5.5 MEDIUM): gnupg:gnupg-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3219 *
CVE-2022-3515 (CVSS3: 9.8 CRITICAL): gnupg:gnupg-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3515 *
CVE-2022-3553 (CVSS3: 6.5 MEDIUM): xserver-xorg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3553 *
CVE-2022-3872 (CVSS3: 8.6 HIGH): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3872 *
CVE-2022-4055 (CVSS3: 7.4 HIGH): xdg-utils https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-4055 *
CVE-2022-41716 (CVSS3: 7.5 HIGH): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-41716 *
CVE-2022-41720 (CVSS3: 7.5 HIGH): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-41720 *
CVE-2022-41722 (CVSS3: 7.5 HIGH): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-41722 *
CVE-2022-41723 (CVSS3: 7.5 HIGH): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-41723 *
CVE-2022-41724 (CVSS3: 7.5 HIGH): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-41724 *
CVE-2022-41725 (CVSS3: 7.5 HIGH): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-41725 *
CVE-2022-44370 (CVSS3: 7.8 HIGH): nasm:nasm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-44370 *
CVE-2022-44617 (CVSS3: 7.5 HIGH): libxpm https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-44617 *
CVE-2022-46285 (CVSS3: 7.5 HIGH): libxpm https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-46285 *
CVE-2022-4645 (CVSS3: 5.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-4645 *
CVE-2022-4883 (CVSS3: 8.8 HIGH): libxpm https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-4883 *
CVE-2023-0464 (CVSS3: 7.5 HIGH): openssl:openssl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-0464 *
CVE-2023-0465 (CVSS3: 5.3 MEDIUM): openssl:openssl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-0465 *
CVE-2023-0466 (CVSS3: 5.3 MEDIUM): openssl:openssl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-0466 *
CVE-2023-0664 (CVSS3: 7.8 HIGH): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-0664 *
CVE-2023-0795 (CVSS3: 5.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-0795 *
CVE-2023-0796 (CVSS3: 5.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-0796 *
CVE-2023-0797 (CVSS3: 5.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-0797 *
CVE-2023-0798 (CVSS3: 5.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-0798 *
CVE-2023-0799 (CVSS3: 5.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-0799 *
CVE-2023-1544 (CVSS3: 6.3 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-1544 *
CVE-2023-23916 (CVSS3: 7.5 HIGH): curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-23916 *
CVE-2023-24532 (CVSS3: 5.3 MEDIUM): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-24532 *
CVE-2023-27533 (CVSS3: 8.8 HIGH): curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-27533 *
CVE-2023-27534 (CVSS3: 8.8 HIGH): curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-27534 *
CVE-2023-28531 (CVSS3: 9.8 CRITICAL): openssh https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-28531 *
CVE-2023-28879 (CVSS3: 9.8 CRITICAL): ghostscript:ghostscript-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-28879 *

For further information see: https://autobuilder.yocto.io/pub/non-release/patchmetrics/

