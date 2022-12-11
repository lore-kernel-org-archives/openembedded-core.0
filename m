Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D0ACC4332F
	for <webhook@archiver.kernel.org>; Sun, 11 Dec 2022 13:02:33 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web10.16370.1670763746914577011
 for <openembedded-core@lists.openembedded.org>;
 Sun, 11 Dec 2022 05:02:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=ukue7qmZ;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.171, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f171.google.com with SMTP id 4so3457583plj.3
        for <openembedded-core@lists.openembedded.org>; Sun, 11 Dec 2022 05:02:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=date:message-id:to:from:subject:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QwUo/XYc7Wu+BUjPC6J7//8bJE1K1r+k4DSHMwGoxmg=;
        b=ukue7qmZg25vTgk6upPQv6EMCoS34x/Q+xZkui7BakkpYlh13lAe3InrrKkT0wmUap
         U2CdO/rZ2e15zESWoJZIsVOvrHdFS6PJtganMUBVuiZvvdgHMolXdQE8K3ItuEBRxC7+
         IcEF5ZJSQFHG6tXekoLcbXMvtpeUB2UaU++W+dBx5OnPZRDVJR3TspokVMqrAsPXZ2rV
         VzvYsSqEwtliqwXJaTSLHpRLUftM5mSAmn81vdfgaKROPnLv1CkXlnYxK9OiJPYcDrNJ
         e/vrxuJML1u103SgTdpoyWYLZzXoYyL88iAde7ZRpWeJMqRYJUKFVf6+zM1Zu8iWlrKJ
         DcCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=date:message-id:to:from:subject:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QwUo/XYc7Wu+BUjPC6J7//8bJE1K1r+k4DSHMwGoxmg=;
        b=q6Lbi2Syl+kYgRQrCPPLcifNAPn8tlRlAVLBcZH8CrpR8OnMReXVE3lSQvWWfUajdC
         1peiFE6cAVCBwEVO+yvheXfyoincJGZhxrxZx+dSR1Gd8Yyi922Rg4i7riOFbj0yBzAE
         Ts+lmn82bdV/SmrVWJEXlCZcnAdmkkCJ7Qj8LYeppJ2dzQCwHmWqyZ1ozwux7otblRMy
         nc+GR8NuXao461GJUBJj/amtwlXLw+zH3q4THcI6Ql62hgsqmlcdQo5zgbuQAqAyiDLz
         GS5LnHjQQKh6hZJmSmziMifMde62rCsggoxvFpjWKNsiVa+/cm9WT9f2HcJ6x2acdl0U
         Kywg==
X-Gm-Message-State: ANoB5pkKgd7Xm2cHrM/sWVAA+RfwFnsyHbq1P55ZAMCJNaX1HVXpg3V7
	ldThTuA2jn66F6Ia/dx8JIFRgxumrL3MX/58ymZI4g==
X-Google-Smtp-Source: AA0mqf5NURWa5gF5AllPuwmlxs9le7bWt3QhxMkzsptUpobylDUg1e1UdPA9QEJ0p61z9jc5pifOHg==
X-Received: by 2002:a17:902:f54b:b0:188:5e99:d84f with SMTP id h11-20020a170902f54b00b001885e99d84fmr18653685plf.42.1670763745771;
        Sun, 11 Dec 2022 05:02:25 -0800 (PST)
Received: from nuc.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id u17-20020a17090341d100b00187033cac81sm4308212ple.145.2022.12.11.05.02.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Dec 2022 05:02:25 -0800 (PST)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id 7C0E09602A7; Sun, 11 Dec 2022 03:02:23 -1000 (HST)
Subject: OE-core CVE metrics for kirkstone on Sun 11 Dec 2022 03:00:01 AM HST
FROM: steve@sakoman.com
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
X-Mailer: mail (GNU Mailutils 3.7)
Message-Id: <20221211130223.7C0E09602A7@nuc.router0800d9.com>
Date: Sun, 11 Dec 2022 03:02:23 -1000 (HST)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 11 Dec 2022 13:02:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174473

Branch: kirkstone

New this week: 2 CVEs
CVE-2022-35260 (CVSS3: 6.5 MEDIUM): curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-35260 *
CVE-2022-4292 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-4292 *

Removed this week: 11 CVEs
CVE-2021-36369 (CVSS3: 7.5 HIGH): dropbear https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-36369 *
CVE-2022-2868 (CVSS3: 5.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2868 *
CVE-2022-3570 (CVSS3: 5.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3570 *
CVE-2022-3597 (CVSS3: 6.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3597 *
CVE-2022-3598 (CVSS3: 6.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3598 *
CVE-2022-3599 (CVSS3: 6.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3599 *
CVE-2022-3626 (CVSS3: 6.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3626 *
CVE-2022-3627 (CVSS3: 6.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3627 *
CVE-2022-3970 (CVSS3: 9.8 CRITICAL): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3970 *
CVE-2022-42915 (CVSS3: 9.8 CRITICAL): curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-42915 *
CVE-2022-42916 (CVSS3: 7.5 HIGH): curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-42916 *

Full list:  Found 21 unpatched CVEs
CVE-2021-35937 (CVSS3: 6.4 MEDIUM): rpm:rpm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-35937 *
CVE-2021-35938 (CVSS3: 6.7 MEDIUM): rpm:rpm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-35938 *
CVE-2021-35939 (CVSS3: 6.7 MEDIUM): rpm:rpm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-35939 *
CVE-2022-2879 (CVSS3: 7.5 HIGH): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2879 *
CVE-2022-35260 (CVSS3: 6.5 MEDIUM): curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-35260 *
CVE-2022-3550 (CVSS3: 8.8 HIGH): xserver-xorg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3550 *
CVE-2022-3551 (CVSS3: 6.5 MEDIUM): xserver-xorg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3551 *
CVE-2022-3553 (CVSS3: 6.5 MEDIUM): xserver-xorg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3553 *
CVE-2022-36227 (CVSS3: 9.8 CRITICAL): libarchive:libarchive-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-36227 *
CVE-2022-37454 (CVSS3: 9.8 CRITICAL): python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-37454 *
CVE-2022-3872 (CVSS3: 8.6 HIGH): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3872 *
CVE-2022-39377 (CVSS3: 9.8 CRITICAL): sysstat https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-39377 *
CVE-2022-40303 (CVSS3: 7.5 HIGH): libxml2:libxml2-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-40303 *
CVE-2022-40304 (CVSS3: 7.8 HIGH): libxml2:libxml2-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-40304 *
CVE-2022-4055 (CVSS3: 7.4 HIGH): xdg-utils https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-4055 *
CVE-2022-4141 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-4141 *
CVE-2022-4144 (CVSS3: 6.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-4144 *
CVE-2022-41715 (CVSS3: 7.5 HIGH): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-41715 *
CVE-2022-41716 (CVSS3: 7.5 HIGH): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-41716 *
CVE-2022-4292 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-4292 *
CVE-2022-45061 (CVSS3: 7.5 HIGH): python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-45061 *

For further information see: https://autobuilder.yocto.io/pub/non-release/patchmetrics/

