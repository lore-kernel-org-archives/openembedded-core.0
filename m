Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F15FCC61D97
	for <webhook@archiver.kernel.org>; Sun, 29 Jan 2023 12:03:50 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web11.14812.1674993823809610672
 for <openembedded-core@lists.openembedded.org>;
 Sun, 29 Jan 2023 04:03:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=Bd5hUvgB;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.45, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f45.google.com with SMTP id v6-20020a17090ad58600b00229eec90a7fso11567501pju.0
        for <openembedded-core@lists.openembedded.org>; Sun, 29 Jan 2023 04:03:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=date:message-id:to:from:subject:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nysf7pCjMkzVHIrwNwN5NILUAZ4KIj9JmbNKDx2Wu4Q=;
        b=Bd5hUvgB93dXz/30YFUlTyAMqUfWHMoUap3EwqJp4lnl//U0rLM6RQzJRikdLYL5CD
         l4B04uyhby8suoLxFr9BR22qLdl3e510KByPsaVDm6wdOphScThNzo7Q63vpDTYPPDZ8
         3aUwWV0/VhyfdYeW8s3pPH8Wy1eHsThi5TMYqMBivLUqFCuBVI394cf/Hicamonj0O38
         gllYRwRaCUF5VPwbKyayaXRBiMveCJ/4fLFrFq43gFvz71pC+PDZn6Nid8ES/fu0GRoq
         z3CKAeU4+28ewFU+Qbwh51Pw/A97znX2gajazivg687cUXyCvgI9DxGMoh9c+ySgkAYV
         1Rkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=date:message-id:to:from:subject:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nysf7pCjMkzVHIrwNwN5NILUAZ4KIj9JmbNKDx2Wu4Q=;
        b=woSlfPU78azrw/aSexw12uzxpCYxkWa87XUqDtRzWoXovyMsnz0ajFripRFwFzBCQD
         05Tb8ipssl0sKFDT+96OuplFJRdfS1K0ReEspNKTA6C4DffIDBJCktIJ2Im8ARxsDmnp
         AsqHY4Y95+rfZQr/VLERijjwbCgeUJNnQzTMrLTUTf1hvuoLgTMvQID1na+GOLEb33N/
         dlSSUFeMmyeyLAGBx/d0DtknIMqYi+uqCtmuKCd/Ls79G8yiX/bWAcCQ4Amv9aEDEzQq
         bquFjbdiWKJD7iYhJcftYjU/J8+4cQDg0sUjSa8I+tCYXr0/RMtmM/3fTxB51URy4rot
         UOqg==
X-Gm-Message-State: AO0yUKX4rFgxFp5gKUHiFqipd0hgOXLibee/pPaYsCPgI1rcLOTc2YBT
	Uo2tXKR84mGl55J4U3idgSMT8x6J/J5z3U16gFs=
X-Google-Smtp-Source: AK7set+xUfE9SZkbFmTrM8mrKIp2s9Z3x+N/GsYqPqxHz/k6+7JpCgrJs5hnEQKBQZD5CUkm2k8tcA==
X-Received: by 2002:a17:90b:3cc:b0:22c:816e:d67d with SMTP id go12-20020a17090b03cc00b0022c816ed67dmr2925032pjb.24.1674993822537;
        Sun, 29 Jan 2023 04:03:42 -0800 (PST)
Received: from nuc.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id a4-20020a17090a740400b0022bab07f578sm7795471pjg.11.2023.01.29.04.03.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jan 2023 04:03:41 -0800 (PST)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id 90B80960377; Sun, 29 Jan 2023 02:03:39 -1000 (HST)
Subject: OE-core CVE metrics for master on Sun 29 Jan 2023 02:00:01 AM HST
FROM: steve@sakoman.com
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
X-Mailer: mail (GNU Mailutils 3.7)
Message-Id: <20230129120339.90B80960377@nuc.router0800d9.com>
Date: Sun, 29 Jan 2023 02:03:39 -1000 (HST)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 29 Jan 2023 12:03:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176472

Branch: master

New this week: 3 CVEs
CVE-2022-23521 (CVSS3: 9.8 CRITICAL): git https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-23521 *
CVE-2022-41903 (CVSS3: 9.8 CRITICAL): git https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-41903 *
CVE-2022-41953 (CVSS3: 7.8 HIGH): git https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-41953 *

Removed this week: 1 CVEs
CVE-2022-4603 (CVSS3: 8.8 HIGH): ppp https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-4603 *

Full list:  Found 9 unpatched CVEs
CVE-2022-23521 (CVSS3: 9.8 CRITICAL): git https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-23521 *
CVE-2022-3550 (CVSS3: 8.8 HIGH): xserver-xorg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3550 *
CVE-2022-3551 (CVSS3: 6.5 MEDIUM): xserver-xorg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3551 *
CVE-2022-3996 (CVSS3: 7.5 HIGH): openssl:openssl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3996 *
CVE-2022-4055 (CVSS3: 7.4 HIGH): xdg-utils https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-4055 *
CVE-2022-41903 (CVSS3: 9.8 CRITICAL): git https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-41903 *
CVE-2022-41953 (CVSS3: 7.8 HIGH): git https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-41953 *
CVE-2022-46456 (CVSS3: 6.1 MEDIUM): nasm:nasm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-46456 *
CVE-2022-46457 (CVSS3: 5.5 MEDIUM): nasm:nasm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-46457 *

For further information see: https://autobuilder.yocto.io/pub/non-release/patchmetrics/

