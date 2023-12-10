Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10638C10DCE
	for <webhook@archiver.kernel.org>; Sun, 10 Dec 2023 11:18:27 +0000 (UTC)
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
 by mx.groups.io with SMTP id smtpd.web10.52670.1702207098885889738
 for <openembedded-core@lists.openembedded.org>;
 Sun, 10 Dec 2023 03:18:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=XM7cR3ca;
 spf=softfail (domain: sakoman.com, ip: 209.85.222.175, mailfrom: steve@sakoman.com)
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-77f524597c3so126324685a.3
        for <openembedded-core@lists.openembedded.org>; Sun, 10 Dec 2023 03:18:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1702207097; x=1702811897; darn=lists.openembedded.org;
        h=message-id:date:user-agent:to:from:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2PwuuCMZiSrv0afAwGEexrHPL6dBO7sMTVxgNRauvQ0=;
        b=XM7cR3ca+NDR1xGy6CEAKnvomw2GCnpNY3XU9FbkWG8q2EH/CvR0crGgYzWQV0pe99
         NLWP8MXbJdrCaVz9toLIzRNZl0VqUN/ET8pMAr27NoadraAnEzH3GQP4NhVgoqIB2Kua
         XA+YX9nl6K1BiprXvymbJ4ycFFt3z/e5xYssr6jcE76FesrFJCOoE334OIDcrwdBvVd9
         9TNnVHEyNkEk9wka/pR4mYbI+Kh3sZEjiZVmmaOLPOz/fNS0n7xNsGl898wfLjQ4Z1OG
         UZeKuERBnnB/tIQbYEPu+tgeAUSSJmn3EK9DU4eZHdCumg8Fd/c0IrNUU6c8R/v38aeg
         29Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702207097; x=1702811897;
        h=message-id:date:user-agent:to:from:subject:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2PwuuCMZiSrv0afAwGEexrHPL6dBO7sMTVxgNRauvQ0=;
        b=feVO5F1mPzHmOcnjzlcV9YmTUns6GTM6IWYI/yuyTKU4m0W4qs8DJVHn3TtdzUbz1y
         ioJkb97f1pyREBk7r4h7uRFwLRmYRtbZkQp+p7EU2moVxEbNZsP4Ot++zKiolZ7JuYw5
         QU6eJm/dsxyfLUuyoeK40iJ2yd5DOFFQE4Slr754R9aV1kAH1Zp1h+8Lq7XpwVT3yCce
         H10/6b32eZ/OePDRaDgaRP+HDPj9ccJXhDmr8XxaQ5shYGKZw9cL4C/cGsLoWm4XmIoz
         tLH7IltwmSB6XdUM6ff6EYKAMkeBBbruOmPy2wXRhDIULUS8d1EJ5YLWvgQ3HMuU5PJd
         ycuw==
X-Gm-Message-State: AOJu0Yywt6LD+gajk5UfsVRFv2NNfI9/b6G1q4C7oL4vbolgkSKqBiP9
	EVVESOCPg+GdEbhcAJyPDh1avs3hG0an7T/Rzm0=
X-Google-Smtp-Source: AGHT+IF8Z0XtCzdvplOZbIEiSBnJcklqf+TBFy6l3DIUUmSA2uTL7bdUmJFlh3E9TKODeAHZq8GDQQ==
X-Received: by 2002:ae9:c006:0:b0:77f:338c:a713 with SMTP id u6-20020ae9c006000000b0077f338ca713mr3564031qkk.62.1702207097203;
        Sun, 10 Dec 2023 03:18:17 -0800 (PST)
Received: from builder.sakoman.com ([71.19.246.55])
        by smtp.gmail.com with ESMTPSA id tq6-20020a05620a3d0600b0077d93c7c785sm2072492qkn.119.2023.12.10.03.18.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Dec 2023 03:18:16 -0800 (PST)
Received: by builder.sakoman.com (Postfix, from userid 1001)
	id 79336106A24; Sun, 10 Dec 2023 01:18:15 -1000 (HST)
Subject: OE-core CVE metrics for master on Sun 10 Dec 2023 01:00:01 AM HST
FROM: steve@sakoman.com
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
User-Agent: mail (GNU Mailutils 3.14)
Date: Sun, 10 Dec 2023 01:18:15 -1000
Message-Id: <20231210111815.79336106A24@builder.sakoman.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 10 Dec 2023 11:18:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192110

Branch: master

New this week: 2 CVEs
CVE-2023-47100 (CVSS3: 9.8 CRITICAL): perl:perl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-47100 *
CVE-2023-49292 (CVSS3: 4.8 MEDIUM): go:go-binary-native:go-cross-core2-64:go-runtime https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-49292 *

Removed this week: 7 CVEs
CVE-2023-45283 (CVSS3: 7.5 HIGH): go:go-binary-native:go-cross-core2-64:go-runtime https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-45283 *
CVE-2023-45284 (CVSS3: 5.3 MEDIUM): go:go-binary-native:go-cross-core2-64:go-runtime https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-45284 *
CVE-2023-47233 (CVSS3: 4.3 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-47233 *
CVE-2023-5678 (CVSS3: 5.3 MEDIUM): openssl:openssl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-5678 *
CVE-2023-5972 (CVSS3: 7.8 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-5972 *
CVE-2023-6176 (CVSS3: 7.8 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6176 *
CVE-2023-6277 (CVSS3: 6.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6277 *

Full list:  Found 30 unpatched CVEs
CVE-2019-14899 (CVSS3: 7.4 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-14899 *
CVE-2021-3714 (CVSS3: 7.5 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3714 *
CVE-2021-3864 (CVSS3: 7.0 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3864 *
CVE-2022-0400 (CVSS3: 7.5 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0400 *
CVE-2022-1247 (CVSS3: 7.0 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1247 *
CVE-2022-3219 (CVSS3: 3.3 LOW): gnupg:gnupg-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3219 *
CVE-2022-36402 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-36402 *
CVE-2022-38096 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-38096 *
CVE-2022-4543 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-4543 *
CVE-2022-46456 (CVSS3: 6.1 MEDIUM): nasm:nasm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-46456 *
CVE-2023-0687 (CVSS3: 9.8 CRITICAL): glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-0687 *
CVE-2023-1386 (CVSS3: 7.8 HIGH): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-1386 *
CVE-2023-25584 (CVSS3: 7.1 HIGH): binutils:binutils-cross-testsuite:binutils-cross-x86_64:binutils-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-25584 *
CVE-2023-3019 (CVSS3: 6.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3019 *
CVE-2023-3397 (CVSS3: 6.3 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3397 *
CVE-2023-3640 (CVSS3: 7.8 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3640 *
CVE-2023-38559 (CVSS3: 5.5 MEDIUM): ghostscript https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-38559 *
CVE-2023-40030 (CVSS3: 6.1 MEDIUM): rust:rust-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-40030 *
CVE-2023-4010 (CVSS3: 4.6 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4010 *
CVE-2023-4039 (CVSS3: 4.8 MEDIUM): gcc:gcc-cross-x86_64:gcc-runtime:gcc-sanitizers:libgcc:libgcc-initial https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4039 *
CVE-2023-42363 (CVSS3: 5.5 MEDIUM): busybox https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-42363 *
CVE-2023-42364 (CVSS3: 5.5 MEDIUM): busybox https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-42364 *
CVE-2023-42365 (CVSS3: 5.5 MEDIUM): busybox https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-42365 *
CVE-2023-42366 (CVSS3: 5.5 MEDIUM): busybox https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-42366 *
CVE-2023-46407 (CVSS3: 5.5 MEDIUM): ffmpeg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-46407 *
CVE-2023-47100 (CVSS3: 9.8 CRITICAL): perl:perl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-47100 *
CVE-2023-49292 (CVSS3: 4.8 MEDIUM): go:go-binary-native:go-cross-core2-64:go-runtime https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-49292 *
CVE-2023-5088 (CVSS3: 7.0 HIGH): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-5088 *
CVE-2023-5156 (CVSS3: 7.5 HIGH): glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-5156 *
CVE-2023-6238 (CVSS3: 7.8 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6238 *

For further information see: https://autobuilder.yocto.io/pub/non-release/patchmetrics/

