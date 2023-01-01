Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99B0BC4332F
	for <webhook@archiver.kernel.org>; Sun,  1 Jan 2023 12:03:24 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web11.9692.1672574600132322354
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Jan 2023 04:03:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=PC/mRIBo;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.170, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f170.google.com with SMTP id w203so510626pfc.12
        for <openembedded-core@lists.openembedded.org>; Sun, 01 Jan 2023 04:03:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=date:message-id:to:from:subject:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WKPuUa5a1vYz3LxmQxBLCjlSW3uj3u82uRps76uYd3g=;
        b=PC/mRIBoeghYpUo0PGQNrJPIxP7m76r5cWZ3tb5cLCB9BEEca0T+ryd6ohzIRRbWQ0
         mruazhKCwsHQ9aUxF84s1ijGcnWyGyUi0i9V5wcFBNjok9NfL3bB5HP7B3e1j7gjRMR8
         dMZtPHJb+bhbH8RDvkgsFFWykN1CzOIhWO6sjs512jRCqhSdARr13MyzTTcZVGE5tNxa
         mL44IAvrcjShZ8s56zlap+vzVMKkyoNLuDTMt2BTISrbBscSHbS3k7x8x3G7+dPKx1D9
         C+X5cMhRd/Na+3ulkW2EeHeD3slGORbcv34ACN/IYDdqhIw9u6j5jQKilDOVAL7IRbHY
         8o7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=date:message-id:to:from:subject:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WKPuUa5a1vYz3LxmQxBLCjlSW3uj3u82uRps76uYd3g=;
        b=g9xbrl2Ftnvha2mlNGgXClQ7RCBN86elX36dyXUsL5IL1I+IQK4qKHd04y5De6QJ4d
         S255UHlntIxIg00bONV1jIVHAk54Kti9Sn5Le+FJAnxv0rYzbtrhFE01Guws7U1prRgs
         oqkUrdEAgCsZOmUN+XnrhexCiL8nlOnonfTUdaf83nIknWqNmPZPjT1mR29bSHVHNFr7
         eVxMDANsox9mRC8/mYtDuaoIlQCAqDqJFJ92svx9c6MBQrWR5OxnW6/54OJQd5PzWAly
         juNZ3lJ3fbIotjbEn3u26uS9NnRQgPcU/hLYoaGbiqEZGpG7ss1/jZ2Hcd8O3Jk0iTOZ
         OnWw==
X-Gm-Message-State: AFqh2ko6J6DyWwlvhyKCBGvoN4omxwETmNPfRBEGUZkE3fTn/Krah6LM
	VXsi7nPveAReh3SnddB1bXVro04cv18lvoPX0Gg=
X-Google-Smtp-Source: AMrXdXtkHAG4fmFhDO0U2vfB1Ju14y3k8lzvbUL59Ea/9vO7dlBsSLsrFTXk/qwhzkwzj+619Ty1NA==
X-Received: by 2002:aa7:91d9:0:b0:575:2337:17bf with SMTP id z25-20020aa791d9000000b00575233717bfmr46240760pfa.12.1672574598972;
        Sun, 01 Jan 2023 04:03:18 -0800 (PST)
Received: from nuc.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id i13-20020a62870d000000b00581d7ef91b2sm5673831pfe.20.2023.01.01.04.03.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Jan 2023 04:03:18 -0800 (PST)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id 57FBA960350; Sun,  1 Jan 2023 02:03:16 -1000 (HST)
Subject: OE-core CVE metrics for master on Sun 01 Jan 2023 02:00:01 AM HST
FROM: steve@sakoman.com
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
X-Mailer: mail (GNU Mailutils 3.7)
Message-Id: <20230101120316.57FBA960350@nuc.router0800d9.com>
Date: Sun,  1 Jan 2023 02:03:16 -1000 (HST)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Jan 2023 12:03:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175182

Branch: master

New this week: 0 CVEs

Removed this week: 6 CVEs
CVE-2022-2601 (CVSS3: 8.6 HIGH): grub:grub-efi:grub-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2601 *
CVE-2022-3872 (CVSS3: 8.6 HIGH): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3872 *
CVE-2022-4144 (CVSS3: 6.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-4144 *
CVE-2022-41717 (CVSS3: 5.3 MEDIUM): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-41717 *
CVE-2022-41720 (CVSS3: 7.5 HIGH): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-41720 *
CVE-2022-45061 (CVSS3: 7.5 HIGH): python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-45061 *

Full list:  Found 4 unpatched CVEs
CVE-2022-3996 (CVSS3: 7.5 HIGH): openssl:openssl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3996 *
CVE-2022-4055 (CVSS3: 7.4 HIGH): xdg-utils https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-4055 *
CVE-2022-4603 (CVSS3: 8.8 HIGH): ppp https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-4603 *
CVE-2022-46908 (CVSS3: 7.3 HIGH): sqlite3:sqlite3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-46908 *

For further information see: https://autobuilder.yocto.io/pub/non-release/patchmetrics/

