Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1114FC433FE
	for <webhook@archiver.kernel.org>; Sun, 13 Nov 2022 13:02:34 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web08.2274.1668344547442203906
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Nov 2022 05:02:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=iqCDTaEP;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.175, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f175.google.com with SMTP id y4so7861321plb.2
        for <openembedded-core@lists.openembedded.org>; Sun, 13 Nov 2022 05:02:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=date:message-id:to:from:subject:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3zkGIvmzBfsUozQ6NRCAiMwEQsJx5THNf7X7TeVu52M=;
        b=iqCDTaEPHruKqa6mR964oCl9Wm6rmX4Z/M+XGM/EiS5JmoErGxmUKdCLSEfIcwQWQ2
         41dzWCHt5+7mZsG2jHzThlxbrSaFSzOgiD2t71AEnegOxHzoP86LfCr6IQjj2j1qTdYh
         npX9njRBl/lbCIfunQFgIPQRQSnrV5M7mmQ9Cdg7TsxFs4FtWFl2GLo8DfgOhSd+QL5W
         5m0MJgrpuxV0QXXlRVMK6/n9Gp3VQYlFpKbBNHJWN8hIItEPk/GAVmdVpdgBKu+tBboh
         kmJ5LOOGMrYldZZVit5JCp7mPBQT0WhNejlKOCwFXpALgZGHD96aYNqx3A+RSv3sGamX
         znvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=date:message-id:to:from:subject:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3zkGIvmzBfsUozQ6NRCAiMwEQsJx5THNf7X7TeVu52M=;
        b=5HZZ15b9uKHkFrMojaU9WUbneGyTkq4OzIihP5fBOw+D5uzEdWLmknp4TuhB+79aH5
         ujLGISvIUuXgKsnpiwTmI8RmdIiFyapuj6EvBGLZ0RJglLqmAQts2M7VTOWZXtW+eCDv
         ZMS3NdgOQRz2kYBXtIj5CC3YQM+XqM6nHTBxToT8zcrv7lyGZTYqsjC8XvvJJ+OGrIih
         NsDLcPaUTwkAfjr+ecBVkaFmUOOTcfke+OS92Sx23OGVSdD1aikY0Gv9tXmFRWvP+P48
         nLRuEJ30Puds7QwgLdQJ+cpAEefjZAbSNvLOul3DlDZdvJZmWSBkWDzzG1iDLQjUKGOk
         XCZA==
X-Gm-Message-State: ANoB5plFBawLtLLPg7AmgAXRuxHODDFKHtMFVFlCiRd5TFGRXl72kBDm
	zdP7b06LofypPl2cddUOqJamELBQA7OAJ8XO
X-Google-Smtp-Source: AA0mqf5cLPWa2mROioPpAiyb03brGFxSPR/lr1Wb2iQGRBllu51wKIWGQDz6Qh0VhsbUROJREoaXzg==
X-Received: by 2002:a17:90a:ca91:b0:20a:f75d:b9af with SMTP id y17-20020a17090aca9100b0020af75db9afmr9607960pjt.222.1668344546043;
        Sun, 13 Nov 2022 05:02:26 -0800 (PST)
Received: from nuc.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id x13-20020a62860d000000b00562a526cd2esm4690939pfd.55.2022.11.13.05.02.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Nov 2022 05:02:25 -0800 (PST)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id 445169602F2; Sun, 13 Nov 2022 03:02:23 -1000 (HST)
Subject: OE-core CVE metrics for kirkstone on Sun 13 Nov 2022 03:00:01 AM HST
FROM: steve@sakoman.com
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
X-Mailer: mail (GNU Mailutils 3.7)
Message-Id: <20221113130223.445169602F2@nuc.router0800d9.com>
Date: Sun, 13 Nov 2022 03:02:23 -1000 (HST)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 13 Nov 2022 13:02:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173191

Branch: kirkstone

New this week: 3 CVEs
CVE-2022-3872 (CVSS3: 8.6 HIGH): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3872 *
CVE-2022-42919 (CVSS3: 7.8 HIGH): python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-42919 *
CVE-2022-45061 (CVSS3: 7.5 HIGH): python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-45061 *

Removed this week: 0 CVEs

Full list:  Found 26 unpatched CVEs
CVE-2021-35937 (CVSS3: 6.4 MEDIUM): rpm:rpm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-35937 *
CVE-2021-35938 (CVSS3: 7.8 HIGH): rpm:rpm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-35938 *
CVE-2021-35939 (CVSS3: 7.8 HIGH): rpm:rpm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-35939 *
CVE-2021-36369 (CVSS3: 7.5 HIGH): dropbear https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-36369 *
CVE-2022-2868 (CVSS3: 8.1 HIGH): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2868 *
CVE-2022-2879 (CVSS3: 7.5 HIGH): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2879 *
CVE-2022-2880 (CVSS3: 7.5 HIGH): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2880 *
CVE-2022-3165 (CVSS3: 6.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3165 *
CVE-2022-3550 (CVSS3: 9.8 CRITICAL): xserver-xorg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3550 *
CVE-2022-3551 (CVSS3: 7.5 HIGH): xserver-xorg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3551 *
CVE-2022-3553 (CVSS3: 7.5 HIGH): xserver-xorg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3553 *
CVE-2022-3570 (CVSS3: 9.8 CRITICAL): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3570 *
CVE-2022-3597 (CVSS3: 6.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3597 *
CVE-2022-3598 (CVSS3: 6.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3598 *
CVE-2022-3599 (CVSS3: 6.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3599 *
CVE-2022-3626 (CVSS3: 6.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3626 *
CVE-2022-3627 (CVSS3: 6.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3627 *
CVE-2022-3872 (CVSS3: 8.6 HIGH): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3872 *
CVE-2022-41715 (CVSS3: 7.5 HIGH): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-41715 *
CVE-2022-41716 (CVSS3: 7.5 HIGH): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-41716 *
CVE-2022-42915 (CVSS3: 9.8 CRITICAL): curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-42915 *
CVE-2022-42916 (CVSS3: 7.5 HIGH): curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-42916 *
CVE-2022-42919 (CVSS3: 7.8 HIGH): python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-42919 *
CVE-2022-43995 (CVSS3: 7.1 HIGH): sudo https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-43995 *
CVE-2022-44638 (CVSS3: 8.8 HIGH): pixman:pixman-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-44638 *
CVE-2022-45061 (CVSS3: 7.5 HIGH): python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-45061 *

For further information see: https://autobuilder.yocto.io/pub/non-release/patchmetrics/

