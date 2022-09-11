Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C18AECAAD3
	for <webhook@archiver.kernel.org>; Sun, 11 Sep 2022 15:03:03 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com
 [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web09.10829.1662908578855010866
 for <openembedded-core@lists.openembedded.org>;
 Sun, 11 Sep 2022 08:02:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=mSzanMvm;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.51,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f51.google.com with SMTP id o23so4487019pji.4
        for <openembedded-core@lists.openembedded.org>;
 Sun, 11 Sep 2022 08:02:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=date:message-id:to:from:subject:from:to:cc:subject:date;
        bh=TzeDfi7P4CJoQBqjnhE7rvmYGf9xu9vn9VJoO6+53tI=;
        b=mSzanMvm7G20I5Qi5nEws5aXZrD4ou1VyKAVourUypExx7HFnkXr5xAAMNxsBBq2sx
         KLSgR8dJgg7YKlTvOO5HtI5KQuWbki+8jrubNpxWNcxjPiQdw58mcvoc/OdqtlyyL+1g
         lfHEVR4/AKr3Q0JnjltUNzl+BJOjGcWPnzm69pt+Xe4WHoHjf6ZdDG1x5nlEayP2l7bT
         RiXDz4pyWSIz3z7JMDK3vY3ylSuC3sZ5yPRfSptpTY/x8rffpqetAVCJcl8Lp7NlB+ER
         aHfIJS20zizvYm8H6NMXFhASjUx6m3qHIyEMsle83S3CfRCKuZ/m4zg8PI32x+DaNUNi
         qp4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=date:message-id:to:from:subject:x-gm-message-state:from:to:cc
         :subject:date;
        bh=TzeDfi7P4CJoQBqjnhE7rvmYGf9xu9vn9VJoO6+53tI=;
        b=b2crUcTACyuM51M8hE55zspRPZaPFkUgP6DITwazMx2zLS+ij/RJF4vsDdLPjBr0tA
         8z08hNrocbbEL9Gfpf1CbbK5kLnX+KCmiXNhunJwQxTxjlkzie6iQQyMLJNqcJDL7PbH
         K1Yj4NRkogIlpJETI9qaURiLX42QpH9M10yTtDnS5MEwDfy/5Uq2MRkmIoWoFBsmt7SP
         cT7q0LnfP9D/zr6UYIIVc3qNfBwIBdSShaBSz7ivmydZ4mCtnsIgNNAkelyI5rcZEOzz
         eS9mXr4QNa0M+yACXvsSh1ObZOEX2xZOA8kaG+QescU+tWspWJ+xuKaQq1Lwz7lvJ07/
         6qgA==
X-Gm-Message-State: ACgBeo1I/WxQjZdhQketxvhN1zBj4Ivsw3ngUrq2XicqPrGDXDogpvx9
	hmaAV3+8V+S6R7d/N+ZuQrvasS0HMmaqcxzy
X-Google-Smtp-Source: 
 AA6agR6gEtwz7nP5hKkpuYJSSqDnz6l1h9jq8xI6uKc4U1k6ni+I4bMsKI3H72M4pYbIcEd5VQnMSQ==
X-Received: by 2002:a17:902:ef4e:b0:175:3798:626f with SMTP id
 e14-20020a170902ef4e00b001753798626fmr22684273plx.82.1662908577428;
        Sun, 11 Sep 2022 08:02:57 -0700 (PDT)
Received: from nuc.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 x20-20020aa78f14000000b0052d2b55be32sm3522279pfr.171.2022.09.11.08.02.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Sep 2022 08:02:56 -0700 (PDT)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id A737996238B; Sun, 11 Sep 2022 05:02:54 -1000 (HST)
Subject: OE-core CVE metrics for kirkstone on Sun 11 Sep 2022 05:00:01 AM HST
FROM: steve@sakoman.com
To: 
 <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
X-Mailer: mail (GNU Mailutils 3.7)
Message-Id: <20220911150254.A737996238B@nuc.router0800d9.com>
Date: Sun, 11 Sep 2022 05:02:54 -1000 (HST)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 11 Sep 2022 15:03:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170520

Branch: kirkstone

New this week: 5 CVEs
CVE-2020-35538 (CVSS3: 5.5 MEDIUM): libjpeg-turbo:libjpeg-turbo-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-35538 *
CVE-2022-27664 (CVSS3: 7.5 HIGH): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-27664 *
CVE-2022-3099 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3099 *
CVE-2022-3134 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3134 *
CVE-2022-39028 (CVSS3: 7.5 HIGH): inetutils https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-39028 *

Removed this week: 0 CVEs

Full list:  Found 24 unpatched CVEs
CVE-2018-25032 (CVSS3: 7.5 HIGH): python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-25032 *
CVE-2020-35538 (CVSS3: 5.5 MEDIUM): libjpeg-turbo:libjpeg-turbo-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-35538 *
CVE-2021-35937 (CVSS3: 6.4 MEDIUM): rpm:rpm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-35937 *
CVE-2021-35938 (CVSS3: 7.8 HIGH): rpm:rpm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-35938 *
CVE-2021-35939 (CVSS3: 7.8 HIGH): rpm:rpm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-35939 *
CVE-2021-3611 (CVSS3: 6.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3611 *
CVE-2021-3750 (CVSS3: 8.2 HIGH): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3750 *
CVE-2022-27664 (CVSS3: 7.5 HIGH): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-27664 *
CVE-2022-2867 (CVSS3: 8.8 HIGH): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2867 *
CVE-2022-2868 (CVSS3: 8.1 HIGH): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2868 *
CVE-2022-2869 (CVSS3: 8.8 HIGH): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2869 *
CVE-2022-29154 (CVSS3: 7.4 HIGH): rsync:rsync-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-29154 *
CVE-2022-2946 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2946 *
CVE-2022-2953 (CVSS3: 5.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2953 *
CVE-2022-2980 (CVSS3: 5.5 MEDIUM): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2980 *
CVE-2022-2982 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2982 *
CVE-2022-3016 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3016 *
CVE-2022-3037 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3037 *
CVE-2022-3099 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3099 *
CVE-2022-3134 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3134 *
CVE-2022-32893 (CVSS3: 8.8 HIGH): webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-32893 *
CVE-2022-35737 (CVSS3: 7.5 HIGH): sqlite3:sqlite3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-35737 *
CVE-2022-38533 (CVSS3: 5.5 MEDIUM): binutils:binutils-cross-testsuite:binutils-cross-x86_64 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-38533 *
CVE-2022-39028 (CVSS3: 7.5 HIGH): inetutils https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-39028 *

For further information see: https://autobuilder.yocto.io/pub/non-release/patchmetrics/

