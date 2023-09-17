Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F978CD37B3
	for <webhook@archiver.kernel.org>; Sun, 17 Sep 2023 13:17:31 +0000 (UTC)
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
 by mx.groups.io with SMTP id smtpd.web10.29384.1694956642192548575
 for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Sep 2023 06:17:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=OnC4EHKY;
 spf=softfail (domain: sakoman.com, ip: 209.85.222.180, mailfrom: steve@sakoman.com)
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-770ef903e80so232365385a.3
        for <openembedded-core@lists.openembedded.org>; Sun, 17 Sep 2023 06:17:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1694956641; x=1695561441; darn=lists.openembedded.org;
        h=message-id:date:user-agent:to:from:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t560E+DzbPexif7UchHSBZB0euaO9/KBn2ORrhVX3tY=;
        b=OnC4EHKYHxfmzufn8Jo/FAlMvXDUICbtTkmwGT9Y7PZa3PqnopKUp7rrl3LLJAu4A/
         lC/p6QlKToV6cLdJh4AMsD4rmTRmBowv7dGL9VXNOqAHLXP4lqz4a/uWh7/K+xq+QwX1
         I9GzY1Vr7TVzXOpLGLhzQoSeqFDjbzn4HmHpRIlms61ash5fkBS2zHmqZDBpj1w0/g3B
         8petxNF9IkxOUSWtTgjaJQ7kVMHpHABinafDk8ysuq5cioxFhlRby0hm9ecYSgWOHACm
         Zl07jEwPtc1H4bQzzgCMWnegne9pRmSq0rc+Zy8wOCa7WxmdjzDKzDJhzlLQYJEkE08b
         is7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694956641; x=1695561441;
        h=message-id:date:user-agent:to:from:subject:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=t560E+DzbPexif7UchHSBZB0euaO9/KBn2ORrhVX3tY=;
        b=joq+oJl6nMTPBi62ZsGxQD/mMTH+UKxLtvUAMANgZgBlzlfPuZv1hQGQwlVnL6QoH1
         UNPhqf7M2yRtz4JUdZ4ostQnlORummCVsxvqhvEsvHvsUKMiyMvh7p/BYz3KPCev9KqE
         Pv+amusdmXR0WjnGAXDHQSRjjJ2tXPrnIwFfkcN4I0q99VL0DkBiVYu0ckkV0pXUgKFi
         gTs/2nzaG9ZJoXUay1DBsETFfQswQJCwiAMFp3KDJ7Lc3sdVD+3ImmL6E8ZtW/YZ8v64
         IurMjlGk8C30/IwchUmjSq4T6A8KvV8FTBeV3IPj44FfraEwHiOxKHet21WaFqdpo4qP
         83gQ==
X-Gm-Message-State: AOJu0YxSQUQ2BaDzrF0chQf7DUVtDgiyOI+7rgK7jxHM0PGKUbTqBx4U
	bpIoFeDeoCVk4oR5A9kSX3uj5pToY2mbxuPXNJ8Mmw==
X-Google-Smtp-Source: AGHT+IHa7+/SgdGfXoUU7Rk/HlI8iXJ5K1P1cmta8mE8vpdvIvssiO6C5tguNv2fPnetoHrllELNKA==
X-Received: by 2002:a0c:e183:0:b0:64f:4c7c:2e13 with SMTP id p3-20020a0ce183000000b0064f4c7c2e13mr5540375qvl.9.1694956640777;
        Sun, 17 Sep 2023 06:17:20 -0700 (PDT)
Received: from builder.sakoman.com ([71.19.246.55])
        by smtp.gmail.com with ESMTPSA id i4-20020a0cf104000000b00656506a1881sm808042qvl.74.2023.09.17.06.17.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Sep 2023 06:17:20 -0700 (PDT)
Received: by builder.sakoman.com (Postfix, from userid 1001)
	id 29CBD106A1A; Sun, 17 Sep 2023 03:17:19 -1000 (HST)
Subject: OE-core CVE metrics for kirkstone on Sun 17 Sep 2023 03:00:01 AM HST
FROM: steve@sakoman.com
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
User-Agent: mail (GNU Mailutils 3.14)
Date: Sun, 17 Sep 2023 03:17:19 -1000
Message-Id: <20230917131719.29CBD106A1A@builder.sakoman.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 17 Sep 2023 13:17:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187806

Branch: kirkstone

New this week: 5 CVEs
CVE-2023-39318 (CVSS3: 6.1 MEDIUM): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-39318 *
CVE-2023-39319 (CVSS3: 6.1 MEDIUM): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-39319 *
CVE-2023-4039 (CVSS3: 4.8 MEDIUM): gcc:gcc-cross-x86_64:gcc-runtime:gcc-sanitizers:gcc-source-11.4.0:libgcc:libgcc-initial https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4039 *
CVE-2023-42467 (CVSS3: 5.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-42467 *
CVE-2023-4807 (CVSS3: 7.8 HIGH): openssl:openssl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4807 *

Removed this week: 0 CVEs

Full list:  Found 56 unpatched CVEs
CVE-2020-22219 (CVSS3: 7.8 HIGH): flac https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-22219 *
CVE-2021-35937 (CVSS3: 6.4 MEDIUM): rpm:rpm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-35937 *
CVE-2021-35938 (CVSS3: 6.7 MEDIUM): rpm:rpm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-35938 *
CVE-2021-35939 (CVSS3: 6.7 MEDIUM): rpm:rpm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-35939 *
CVE-2022-3219 (CVSS3: 3.3 LOW): gnupg:gnupg-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3219 *
CVE-2022-33065 (CVSS3: 7.8 HIGH): libsndfile1 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-33065 *
CVE-2022-3515 (CVSS3: 9.8 CRITICAL): gnupg:gnupg-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3515 *
CVE-2022-3553 (CVSS3: 6.5 MEDIUM): xserver-xorg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3553 *
CVE-2022-3563 (CVSS3: 5.7 MEDIUM): bluez5 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3563 *
CVE-2022-3637 (CVSS3: 5.5 MEDIUM): bluez5 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3637 *
CVE-2022-36648 (CVSS3: 10.0 CRITICAL): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-36648 *
CVE-2022-3872 (CVSS3: 8.6 HIGH): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3872 *
CVE-2022-3964 (CVSS3: 8.1 HIGH): ffmpeg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3964 *
CVE-2022-3965 (CVSS3: 8.1 HIGH): ffmpeg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3965 *
CVE-2022-40090 (CVSS3: 6.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-40090 *
CVE-2022-4055 (CVSS3: 7.4 HIGH): xdg-utils https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-4055 *
CVE-2022-44840 (CVSS3: 7.8 HIGH): binutils:binutils-cross-testsuite:binutils-cross-x86_64 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-44840 *
CVE-2022-45703 (CVSS3: 7.8 HIGH): binutils:binutils-cross-testsuite:binutils-cross-x86_64 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-45703 *
CVE-2022-47007 (CVSS3: 5.5 MEDIUM): binutils:binutils-cross-testsuite:binutils-cross-x86_64 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-47007 *
CVE-2022-47008 (CVSS3: 5.5 MEDIUM): binutils:binutils-cross-testsuite:binutils-cross-x86_64 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-47008 *
CVE-2022-47010 (CVSS3: 5.5 MEDIUM): binutils:binutils-cross-testsuite:binutils-cross-x86_64 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-47010 *
CVE-2022-47011 (CVSS3: 5.5 MEDIUM): binutils:binutils-cross-testsuite:binutils-cross-x86_64 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-47011 *
CVE-2022-47673 (CVSS3: 7.8 HIGH): binutils:binutils-cross-testsuite:binutils-cross-x86_64 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-47673 *
CVE-2022-47695 (CVSS3: 7.8 HIGH): binutils:binutils-cross-testsuite:binutils-cross-x86_64 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-47695 *
CVE-2022-47696 (CVSS3: 7.8 HIGH): binutils:binutils-cross-testsuite:binutils-cross-x86_64 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-47696 *
CVE-2022-48063 (CVSS3: 5.5 MEDIUM): binutils:binutils-cross-testsuite:binutils-cross-x86_64 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-48063 *
CVE-2022-48064 (CVSS3: 5.5 MEDIUM): binutils:binutils-cross-testsuite:binutils-cross-x86_64 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-48064 *
CVE-2022-48065 (CVSS3: 5.5 MEDIUM): binutils:binutils-cross-testsuite:binutils-cross-x86_64 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-48065 *
CVE-2023-1386 (CVSS3: 7.8 HIGH): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-1386 *
CVE-2023-1544 (CVSS3: 6.3 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-1544 *
CVE-2023-1916 (CVSS3: 6.1 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-1916 *
CVE-2023-24532 (CVSS3: 5.3 MEDIUM): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-24532 *
CVE-2023-27043 (CVSS3: 5.3 MEDIUM): python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-27043 *
CVE-2023-2731 (CVSS3: 5.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-2731 *
CVE-2023-28736 (CVSS3: 6.7 MEDIUM): mdadm https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-28736 *
CVE-2023-28938 (CVSS3: 4.4 MEDIUM): mdadm https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-28938 *
CVE-2023-29403 (CVSS3: 7.8 HIGH): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-29403 *
CVE-2023-3019 (CVSS3: 6.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3019 *
CVE-2023-37769 (CVSS3: 6.5 MEDIUM): pixman:pixman-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-37769 *
CVE-2023-38560 (CVSS3: 5.5 MEDIUM): ghostscript:ghostscript-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-38560 *
CVE-2023-39318 (CVSS3: 6.1 MEDIUM): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-39318 *
CVE-2023-39319 (CVSS3: 6.1 MEDIUM): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-39319 *
CVE-2023-39533 (CVSS3: 7.5 HIGH): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-39533 *
CVE-2023-40360 (CVSS3: 5.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-40360 *
CVE-2023-4039 (CVSS3: 4.8 MEDIUM): gcc:gcc-cross-x86_64:gcc-runtime:gcc-sanitizers:gcc-source-11.4.0:libgcc:libgcc-initial https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4039 *
CVE-2023-4135 (CVSS3: 6.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4135 *
CVE-2023-42467 (CVSS3: 5.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-42467 *
CVE-2023-4733 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4733 *
CVE-2023-4734 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4734 *
CVE-2023-4735 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4735 *
CVE-2023-4736 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4736 *
CVE-2023-4738 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4738 *
CVE-2023-4750 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4750 *
CVE-2023-4752 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4752 *
CVE-2023-4781 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4781 *
CVE-2023-4807 (CVSS3: 7.8 HIGH): openssl:openssl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4807 *

For further information see: https://autobuilder.yocto.io/pub/non-release/patchmetrics/

