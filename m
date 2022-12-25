Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1819EC4332F
	for <webhook@archiver.kernel.org>; Sun, 25 Dec 2022 12:03:13 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web10.116334.1671969788502748953
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Dec 2022 04:03:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=ByDIBZeM;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.41, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f41.google.com with SMTP id v23so8665984pju.3
        for <openembedded-core@lists.openembedded.org>; Sun, 25 Dec 2022 04:03:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=date:message-id:to:from:subject:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BHRF4SM2TOhX6ZGDa4ctsdyjOhlyiLkjI3Ou0LguO/I=;
        b=ByDIBZeM/G15i/cU7g+riMRwRe6XODhuJmORc1k9GadP9P8gIhPe+1HqKZz8VgGogp
         JJmXNwuHK0A3wjJ+yJGiF0ScG570Q+31uVpaucD6JnEdaRkMB34g+zJTpd0xpRLv0vgX
         DV5p1qQOdW7kxAq5XWhfBJoATCoLyzan+OywpjM0klVp0vU82NXvA6XczuGBQMtkUmnL
         kNv3Hxb9GBlCJ9V13MUsnK6yG3ciXrk43lR4aDe8UHDF13KphRv5b6cI1SwiB2eVqvJy
         /bKmTrznoNA4hxmaWu6JUXPMjU5v1vFVvD65fsHwn96gKk45EXAyON4edInyBrpMgdcr
         dR6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=date:message-id:to:from:subject:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BHRF4SM2TOhX6ZGDa4ctsdyjOhlyiLkjI3Ou0LguO/I=;
        b=KasoalX1OTi8dYSNtZkNq8/3W3+TMWBlQuDzhCq5KpEPsWpusCPas70wQvP2yaDHZp
         zrGlQL22cIs5Gf+sXK37LUEDsOzGfnWGI8FAJw4MnTsxHlNiPGKfcmRZsx+HE677RJCc
         0MJAyGgXdwN8b6yLuGBNVgJXKk/2ypPmBYNXx5XwAz5r1O+6tz6axtlRehyeA3hNDJAn
         0aLPWiZyNEe1hrDNd41Rnoj8acgbMSRwK6m7FuZ5+fmPPfv6Lsf/lSnFhs3iQbJvZODN
         FiN/M+YIltdgjcQw43aFe8NF4l8A4GR0DN6SNkf3CbqqLTybEHChPpicvVSEeDcoMv/X
         ca+A==
X-Gm-Message-State: AFqh2koOG5zWrjLJ3yr/5VBy4GeAwTH6fiHYvS5fTc8ay7ufAZmiVZwh
	cgV7o2mqmVoUqHyjMPzTzz+l7btcd671pX8MANc=
X-Google-Smtp-Source: AMrXdXt2dDI5AHGeuNz1S0xGq98OAo78VZEH21czlg7eszEW+cdmkW9kh9r2+Pdx59G9HmRswmOUCw==
X-Received: by 2002:a05:6a20:3b9c:b0:ac:94a1:8afb with SMTP id b28-20020a056a203b9c00b000ac94a18afbmr14700491pzh.13.1671969787115;
        Sun, 25 Dec 2022 04:03:07 -0800 (PST)
Received: from nuc.router0800d9.com (dhcp-72-253-5-74.hawaiiantel.net. [72.253.5.74])
        by smtp.gmail.com with ESMTPSA id c13-20020a63ea0d000000b00478ac3c34f3sm4691766pgi.93.2022.12.25.04.03.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Dec 2022 04:03:06 -0800 (PST)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id 950AF9602C2; Sun, 25 Dec 2022 02:03:04 -1000 (HST)
Subject: OE-core CVE metrics for master on Sun 25 Dec 2022 02:00:01 AM HST
FROM: steve@sakoman.com
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
X-Mailer: mail (GNU Mailutils 3.7)
Message-Id: <20221225120304.950AF9602C2@nuc.router0800d9.com>
Date: Sun, 25 Dec 2022 02:03:04 -1000 (HST)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 25 Dec 2022 12:03:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174990

Branch: master

New this week: 1 CVEs
CVE-2022-4603 (CVSS3: 8.8 HIGH): ppp https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-4603 *

Removed this week: 0 CVEs

Full list:  Found 10 unpatched CVEs
CVE-2022-2601 (CVSS3: 8.6 HIGH): grub:grub-efi:grub-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2601 *
CVE-2022-3872 (CVSS3: 8.6 HIGH): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3872 *
CVE-2022-3996 (CVSS3: 7.5 HIGH): openssl:openssl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3996 *
CVE-2022-4055 (CVSS3: 7.4 HIGH): xdg-utils https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-4055 *
CVE-2022-4144 (CVSS3: 6.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-4144 *
CVE-2022-41717 (CVSS3: 5.3 MEDIUM): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-41717 *
CVE-2022-41720 (CVSS3: 7.5 HIGH): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-41720 *
CVE-2022-45061 (CVSS3: 7.5 HIGH): python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-45061 *
CVE-2022-4603 (CVSS3: 8.8 HIGH): ppp https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-4603 *
CVE-2022-46908 (CVSS3: 7.3 HIGH): sqlite3:sqlite3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-46908 *

For further information see: https://autobuilder.yocto.io/pub/non-release/patchmetrics/

