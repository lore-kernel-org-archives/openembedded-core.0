Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A77DCC4167B
	for <webhook@archiver.kernel.org>; Sun,  3 Dec 2023 12:19:43 +0000 (UTC)
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
 by mx.groups.io with SMTP id smtpd.web10.38142.1701605974360266125
 for <openembedded-core@lists.openembedded.org>;
 Sun, 03 Dec 2023 04:19:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=bStifDHZ;
 spf=softfail (domain: sakoman.com, ip: 209.85.222.173, mailfrom: steve@sakoman.com)
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-77f0479029cso53584485a.2
        for <openembedded-core@lists.openembedded.org>; Sun, 03 Dec 2023 04:19:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1701605972; x=1702210772; darn=lists.openembedded.org;
        h=message-id:date:user-agent:to:from:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YOB4B11Vvrv8fOn1So2WF00es8fpXCz1m/UCLQluc6w=;
        b=bStifDHZJSmYH2WDa+q8spyMIrUQQWOWaMTNPbO06r9D2vzy36S/oaT2W8n2oCWbcM
         U4nqVol5PA+OWF8+d9X6kY2G1cWkPkDku5QZQTv1pVDKXY/F5obHacrPIuaXLbbPhnMP
         iPeudayNDD4ll7QEdYAeGSI7Fs9BGjrWfbfufJvbbRpsOulhNUTaq7rcMCL/IMS7ham3
         Yxi3BU4pgY4C9iayhZv7GS7J1bo6oLMsJRWNzqtELr72Enx8allRqosOR/9KxNlgpRy6
         /v56tIrsHeynysK+mUX5hKW8+bmae0a5ldKl8myzGLsncJgMwcWaNi8iueGZmA5CcyzC
         oIvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701605972; x=1702210772;
        h=message-id:date:user-agent:to:from:subject:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YOB4B11Vvrv8fOn1So2WF00es8fpXCz1m/UCLQluc6w=;
        b=CQRp8rlZil0UrX8Rg24mI5FMMmbDExItJMl5DfqiwTpGkopHReL6AnT7VIvgx3TGih
         V283Rarx21h2uAfZy7OQJSVrrfl4Wdt08pdK4XJPOVhr5ODOnNv1PHZkAlUEF4uKRwtR
         y+f+dSXZq+YPACFZeh0e7RujSQLsSy+wWWKMjJg9i7fLmlFEKOzS5UMYpe8jsd4loaDD
         BEwO2QHN5P1fQYv1shNUZNlM1UXovgg4SQMs4rQGMUaW/TWEp2Xh+PlOeEROseQZRgTO
         4tiK6UA4DBijl1oP9CkZGW+Qhv0tVEYSA8zqexzCS5DoU36lw9p5efH0/XbSABjnZ2Qi
         0LxQ==
X-Gm-Message-State: AOJu0YxgWkNIFvql76RH7MILkd9lq522h3RnEqwNDDFRDj6uY3n1Q+t5
	gTJ2yUkweo9bzlmEZ4l7SLFIkiADi22LzIA+pMC2Ig==
X-Google-Smtp-Source: AGHT+IHvJKTkD6IqUH4eKzmWm+birP/O4/6w5W7+Vd1SLVcfS/nWywgWCnlRgCr+/wvAUNuBFIOIqQ==
X-Received: by 2002:a05:620a:8227:b0:77d:645a:85e7 with SMTP id ow39-20020a05620a822700b0077d645a85e7mr2774436qkn.42.1701605972290;
        Sun, 03 Dec 2023 04:19:32 -0800 (PST)
Received: from builder.sakoman.com ([71.19.246.55])
        by smtp.gmail.com with ESMTPSA id q9-20020a05620a0d8900b0077d8a162babsm3322859qkl.13.2023.12.03.04.19.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Dec 2023 04:19:31 -0800 (PST)
Received: by builder.sakoman.com (Postfix, from userid 1001)
	id 3DFD11068CE; Sun,  3 Dec 2023 02:19:30 -1000 (HST)
Subject: OE-core CVE metrics for dunfell on Sun 03 Dec 2023 02:00:01 AM HST
FROM: steve@sakoman.com
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
User-Agent: mail (GNU Mailutils 3.14)
Date: Sun,  3 Dec 2023 02:19:30 -1000
Message-Id: <20231203121930.3DFD11068CE@builder.sakoman.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 03 Dec 2023 12:19:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191712

Branch: dunfell

New this week: 2 CVEs
CVE-2023-48706 (CVSS3: 4.7 MEDIUM): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-48706 *
CVE-2023-6277 (CVSS3: 6.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6277 *

Removed this week: 17 CVEs
CVE-2021-3782 (CVSS3: 6.6 MEDIUM): wayland:wayland-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3782 *
CVE-2022-40090 (CVSS3: 6.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-40090 *
CVE-2022-40897 (CVSS3: 5.9 MEDIUM): python3-setuptools:python3-setuptools-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-40897 *
CVE-2023-28321 (CVSS3: 5.9 MEDIUM): curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-28321 *
CVE-2023-28322 (CVSS3: 3.7 LOW): curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-28322 *
CVE-2023-3341 (CVSS3: 7.5 HIGH): bind https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3341 *
CVE-2023-38469 (CVSS3: 5.5 MEDIUM): avahi https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-38469 *
CVE-2023-38470 (CVSS3: 5.5 MEDIUM): avahi https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-38470 *
CVE-2023-38471 (CVSS3: 5.5 MEDIUM): avahi https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-38471 *
CVE-2023-38472 (CVSS3: 5.5 MEDIUM): avahi https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-38472 *
CVE-2023-38473 (CVSS3: 5.5 MEDIUM): avahi https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-38473 *
CVE-2023-43785 (CVSS3: 5.5 MEDIUM): libx11:libx11-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-43785 *
CVE-2023-43786 (CVSS3: 5.5 MEDIUM): libx11:libx11-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-43786 *
CVE-2023-43787 (CVSS3: 7.8 HIGH): libx11:libx11-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-43787 *
CVE-2023-46246 (CVSS3: 5.5 MEDIUM): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-46246 *
CVE-2023-4692 (CVSS3: 7.8 HIGH): grub:grub-efi:grub-efi-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4692 *
CVE-2023-4693 (CVSS3: 4.6 MEDIUM): grub:grub-efi:grub-efi-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4693 *

Full list:  Found 121 unpatched CVEs
CVE-2020-15705 (CVSS3: 6.4 MEDIUM): grub:grub-efi:grub-efi-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-15705 *
CVE-2020-25742 (CVSS3: 3.2 LOW): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-25742 *
CVE-2020-25743 (CVSS3: 3.2 LOW): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-25743 *
CVE-2020-27918 (CVSS3: 7.8 HIGH): webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-27918 *
CVE-2020-29623 (CVSS3: 3.3 LOW): webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-29623 *
CVE-2020-35503 (CVSS3: 6.0 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-35503 *
CVE-2020-35506 (CVSS3: 6.7 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-35506 *
CVE-2020-9948 (CVSS3: 8.8 HIGH): webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-9948 *
CVE-2020-9951 (CVSS3: 8.8 HIGH): webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-9951 *
CVE-2020-9952 (CVSS3: 7.1 HIGH): webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-9952 *
CVE-2021-1765 (CVSS3: 6.5 MEDIUM): webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-1765 *
CVE-2021-1789 (CVSS3: 8.8 HIGH): webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-1789 *
CVE-2021-1799 (CVSS3: 6.5 MEDIUM): webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-1799 *
CVE-2021-1801 (CVSS3: 6.5 MEDIUM): webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-1801 *
CVE-2021-1870 (CVSS3: 9.8 CRITICAL): webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-1870 *
CVE-2021-20295 (CVSS3: 6.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-20295 *
CVE-2021-27097 (CVSS3: 7.8 HIGH): u-boot https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-27097 *
CVE-2021-27138 (CVSS3: 7.8 HIGH): u-boot https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-27138 *
CVE-2021-31879 (CVSS3: 6.1 MEDIUM): wget https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-31879 *
CVE-2021-3418 (CVSS3: 6.4 MEDIUM): grub:grub-efi:grub-efi-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3418 *
CVE-2021-3445 (CVSS3: 7.5 HIGH): libdnf https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3445 *
CVE-2021-35937 (CVSS3: 6.4 MEDIUM): rpm:rpm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-35937 *
CVE-2021-35938 (CVSS3: 6.7 MEDIUM): rpm:rpm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-35938 *
CVE-2021-35939 (CVSS3: 6.7 MEDIUM): rpm:rpm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-35939 *
CVE-2021-3611 (CVSS3: 6.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3611 *
CVE-2021-42762 (CVSS3: 5.3 MEDIUM): webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-42762 *
CVE-2021-45085 (CVSS3: 6.1 MEDIUM): epiphany https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45085 *
CVE-2021-45086 (CVSS3: 6.1 MEDIUM): epiphany https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45086 *
CVE-2021-45087 (CVSS3: 6.1 MEDIUM): epiphany https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45087 *
CVE-2021-45088 (CVSS3: 6.1 MEDIUM): epiphany https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45088 *
CVE-2021-45481 (CVSS3: 6.5 MEDIUM): webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45481 *
CVE-2021-45482 (CVSS3: 6.5 MEDIUM): webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45482 *
CVE-2021-45483 (CVSS3: 6.5 MEDIUM): webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45483 *
CVE-2021-46174 (CVSS3: 7.5 HIGH): binutils:binutils-cross-testsuite:binutils-cross-x86_64:binutils-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-46174 *
CVE-2022-0358 (CVSS3: 7.8 HIGH): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0358 *
CVE-2022-2294 (CVSS3: 8.8 HIGH): webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2294 *
CVE-2022-2347 (CVSS3: 7.1 HIGH): u-boot https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2347 *
CVE-2022-23773 (CVSS3: 7.5 HIGH): go:go-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-23773 *
CVE-2022-24765 (CVSS3: 7.8 HIGH): git https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-24765 *
CVE-2022-2953 (CVSS3: 5.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2953 *
CVE-2022-29536 (CVSS3: 7.5 HIGH): epiphany https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-29536 *
CVE-2022-2962 (CVSS3: 7.8 HIGH): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2962 *
CVE-2022-30293 (CVSS3: 7.5 HIGH): webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-30293 *
CVE-2022-30767 (CVSS3: 9.8 CRITICAL): u-boot https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-30767 *
CVE-2022-3219 (CVSS3: 3.3 LOW): gnupg:gnupg-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3219 *
CVE-2022-32893 (CVSS3: 8.8 HIGH): webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-32893 *
CVE-2022-33065 (CVSS3: 7.8 HIGH): libsndfile1 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-33065 *
CVE-2022-34835 (CVSS3: 9.8 CRITICAL): u-boot https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-34835 *
CVE-2022-3515 (CVSS3: 9.8 CRITICAL): gnupg:gnupg-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3515 *
CVE-2022-3563 (CVSS3: 5.7 MEDIUM): bluez5 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3563 *
CVE-2022-36648 (CVSS3: 10.0 CRITICAL): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-36648 *
CVE-2022-3872 (CVSS3: 8.6 HIGH): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3872 *
CVE-2022-39253 (CVSS3: 5.5 MEDIUM): git https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-39253 *
CVE-2022-39260 (CVSS3: 8.8 HIGH): git https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-39260 *
CVE-2022-41720 (CVSS3: 7.5 HIGH): go:go-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-41720 *
CVE-2022-41724 (CVSS3: 7.5 HIGH): go:go-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-41724 *
CVE-2022-44840 (CVSS3: 7.8 HIGH): binutils:binutils-cross-testsuite:binutils-cross-x86_64:binutils-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-44840 *
CVE-2022-45703 (CVSS3: 7.8 HIGH): binutils:binutils-cross-testsuite:binutils-cross-x86_64:binutils-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-45703 *
CVE-2022-47007 (CVSS3: 5.5 MEDIUM): binutils:binutils-cross-testsuite:binutils-cross-x86_64:binutils-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-47007 *
CVE-2022-47008 (CVSS3: 5.5 MEDIUM): binutils:binutils-cross-testsuite:binutils-cross-x86_64:binutils-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-47008 *
CVE-2022-47010 (CVSS3: 5.5 MEDIUM): binutils:binutils-cross-testsuite:binutils-cross-x86_64:binutils-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-47010 *
CVE-2022-47011 (CVSS3: 5.5 MEDIUM): binutils:binutils-cross-testsuite:binutils-cross-x86_64:binutils-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-47011 *
CVE-2022-47673 (CVSS3: 7.8 HIGH): binutils:binutils-cross-testsuite:binutils-cross-x86_64:binutils-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-47673 *
CVE-2022-47695 (CVSS3: 7.8 HIGH): binutils:binutils-cross-testsuite:binutils-cross-x86_64:binutils-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-47695 *
CVE-2022-47696 (CVSS3: 7.8 HIGH): binutils:binutils-cross-testsuite:binutils-cross-x86_64:binutils-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-47696 *
CVE-2022-48063 (CVSS3: 5.5 MEDIUM): binutils:binutils-cross-testsuite:binutils-cross-x86_64:binutils-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-48063 *
CVE-2022-48064 (CVSS3: 5.5 MEDIUM): binutils:binutils-cross-testsuite:binutils-cross-x86_64:binutils-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-48064 *
CVE-2022-48065 (CVSS3: 5.5 MEDIUM): binutils:binutils-cross-testsuite:binutils-cross-x86_64:binutils-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-48065 *
CVE-2022-48554 (CVSS3: 5.5 MEDIUM): file:file-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-48554 *
CVE-2023-1386 (CVSS3: 7.8 HIGH): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-1386 *
CVE-2023-1544 (CVSS3: 6.3 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-1544 *
CVE-2023-24532 (CVSS3: 5.3 MEDIUM): go:go-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-24532 *
CVE-2023-25358 (CVSS3: 8.8 HIGH): webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-25358 *
CVE-2023-25360 (CVSS3: 8.8 HIGH): webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-25360 *
CVE-2023-25361 (CVSS3: 8.8 HIGH): webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-25361 *
CVE-2023-25362 (CVSS3: 8.8 HIGH): webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-25362 *
CVE-2023-25363 (CVSS3: 8.8 HIGH): webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-25363 *
CVE-2023-25584 (CVSS3: 7.1 HIGH): binutils:binutils-cross-testsuite:binutils-cross-x86_64:binutils-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-25584 *
CVE-2023-26081 (CVSS3: 7.5 HIGH): epiphany https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-26081 *
CVE-2023-2680 (CVSS3: 8.2 HIGH): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-2680 *
CVE-2023-27043 (CVSS3: 5.3 MEDIUM): python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-27043 *
CVE-2023-2731 (CVSS3: 5.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-2731 *
CVE-2023-28198 (CVSS3: 8.8 HIGH): webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-28198 *
CVE-2023-28319 (CVSS3: 7.5 HIGH): curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-28319 *
CVE-2023-28938 (CVSS3: 4.4 MEDIUM): mdadm https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-28938 *
CVE-2023-29403 (CVSS3: 7.8 HIGH): go:go-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-29403 *
CVE-2023-29491 (CVSS3: 7.8 HIGH): ncurses:ncurses-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-29491 *
CVE-2023-3019 (CVSS3: 6.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3019 *
CVE-2023-31484 (CVSS3: 8.1 HIGH): perl:perl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-31484 *
CVE-2023-31486 (CVSS3: 8.1 HIGH): perl:perl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-31486 *
CVE-2023-3164 (CVSS3: 7.1 HIGH): gawk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3164 *
CVE-2023-32370 (CVSS3: 5.3 MEDIUM): webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-32370 *
CVE-2023-3255 (CVSS3: 6.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3255 *
CVE-2023-3301 (CVSS3: 5.6 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3301 *
CVE-2023-37769 (CVSS3: 6.5 MEDIUM): pixman:pixman-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-37769 *
CVE-2023-38560 (CVSS3: 5.5 MEDIUM): ghostscript:ghostscript-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-38560 *
CVE-2023-38633 (CVSS3: 5.5 MEDIUM): librsvg:librsvg-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-38633 *
CVE-2023-39323 (CVSS3: 9.8 CRITICAL): go:go-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-39323 *
CVE-2023-40360 (CVSS3: 5.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-40360 *
CVE-2023-4039 (CVSS3: 4.8 MEDIUM): gcc:gcc-cross-x86_64:gcc-runtime:gcc-sanitizers:libgcc:libgcc-initial https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4039 *
CVE-2023-40397 (CVSS3: 9.8 CRITICAL): webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-40397 *
CVE-2023-4135 (CVSS3: 6.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4135 *
CVE-2023-42467 (CVSS3: 5.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-42467 *
CVE-2023-44487 (CVSS3: 7.5 HIGH): go:go-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-44487 *
CVE-2023-45283 (CVSS3: 7.5 HIGH): go:go-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-45283 *
CVE-2023-45284 (CVSS3: 5.3 MEDIUM): go:go-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-45284 *
CVE-2023-45322 (CVSS3: 6.5 MEDIUM): libxml2:libxml2-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-45322 *
CVE-2023-4813 (CVSS3: 5.9 MEDIUM): glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4813 *
CVE-2023-48231 (CVSS3: 4.3 MEDIUM): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-48231 *
CVE-2023-48232 (CVSS3: 4.3 MEDIUM): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-48232 *
CVE-2023-48233 (CVSS3: 4.3 MEDIUM): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-48233 *
CVE-2023-48234 (CVSS3: 4.3 MEDIUM): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-48234 *
CVE-2023-48235 (CVSS3: 4.3 MEDIUM): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-48235 *
CVE-2023-48236 (CVSS3: 4.3 MEDIUM): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-48236 *
CVE-2023-48237 (CVSS3: 4.3 MEDIUM): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-48237 *
CVE-2023-48706 (CVSS3: 4.7 MEDIUM): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-48706 *
CVE-2023-5088 (CVSS3: 7.0 HIGH): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-5088 *
CVE-2023-5156 (CVSS3: 7.5 HIGH): glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-5156 *
CVE-2023-5574 (CVSS3: 7.0 HIGH): xserver-xorg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-5574 *
CVE-2023-5678 (CVSS3: 5.3 MEDIUM): openssl:openssl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-5678 *
CVE-2023-6277 (CVSS3: 6.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6277 *

For further information see: https://autobuilder.yocto.io/pub/non-release/patchmetrics/

