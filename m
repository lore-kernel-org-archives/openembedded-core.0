Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C548C433F5
	for <webhook@archiver.kernel.org>; Sun,  9 Oct 2022 13:02:44 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
 [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web08.2202.1665320557061350974
 for <openembedded-core@lists.openembedded.org>;
 Sun, 09 Oct 2022 06:02:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=rV4ldU/o;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.175,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f175.google.com with SMTP id i6so3233485pli.12
        for <openembedded-core@lists.openembedded.org>;
 Sun, 09 Oct 2022 06:02:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=date:message-id:to:from:subject:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aO3ECZjFS1B5XI9Nh2RWX5dDE4l3e1Mm7liUQ8ppj84=;
        b=rV4ldU/olR2RwsVEo7QEkjKsmSV03C3YUuOiAYQIGzpuWqS5mZxU3wqyv5IK65vovF
         WSj5A98RhJ0Xbar+V82Tb8OlLNEAYanaudXlpJfaYcz/m4YgO2OAIiw4HzOLSGTC2DFm
         bq224U8VZngPGE0OzzH1bEXbKynOwPv0t13Eih5Ol81YSDPvJE8uNsqVtLqWVPkqC40s
         RIHqA6UlCSo1ne5EmPLSFNqkLwC02qVxVeE9AWtt0LvJwsA6TXp0RBi+/OodxWGxao6S
         OpN/JBzvVTZ0K1EGweoAhmvvDrp2ZtkKUKBeKLGYHmfKI5pXwMHc3aVIfoP8ry01EYE2
         Th/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=date:message-id:to:from:subject:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aO3ECZjFS1B5XI9Nh2RWX5dDE4l3e1Mm7liUQ8ppj84=;
        b=nsUPt4aCodUX/2IiUJN6PHJUZbkCaU21AIqaJuuexPussrCqpIzIZ1GPjLqZKFvgqE
         8Jj61HDqUmDWvwbEznCTjHGIFK3KkzKI1U6NZqAJcBULXjzRPwer4LBcnya4JqdlB2/Z
         tO35j/QNKJC7vCgXXgLCw+o1mfZ10++XmnlEpU4zQxINAPZ2olwjqoTtdzaxgmncmLy2
         X17Jk7NgQXArrF46NhhZvOJ6GdySgn8Fc3EQI3oaYXONzi74QUs57X5fnfWeDaMnUxow
         zrdYZ8vwfHaD+cmFpwE6FW333bSLK/F1mPGH36vTPC/99iciLx8NozMypxE8s6IblPzV
         Ha2w==
X-Gm-Message-State: ACrzQf0vECebPKqQOYZO0xPZeOPdY/4keB4PGn2fthzzcqIMQIG5vhz5
	q/a2LKP2m+LCilraj3Nr9QUQatG3DOOEFID8
X-Google-Smtp-Source: 
 AMsMyM4/3LJoQ/uolhdzhgJJThuPeopeU+OXupNJrGo97yvvynJtVP4QqZCABmMEUnMkVwj7fMGfpw==
X-Received: by 2002:a17:903:18b:b0:178:1c0d:da22 with SMTP id
 z11-20020a170903018b00b001781c0dda22mr14550987plg.95.1665320555948;
        Sun, 09 Oct 2022 06:02:35 -0700 (PDT)
Received: from nuc.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 n12-20020a170902e54c00b0017ca9f4d22fsm4732102plf.209.2022.10.09.06.02.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Oct 2022 06:02:35 -0700 (PDT)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id 94DAB960832; Sun,  9 Oct 2022 03:02:33 -1000 (HST)
Subject: OE-core CVE metrics for kirkstone on Sun 09 Oct 2022 03:00:01 AM HST
FROM: steve@sakoman.com
To: 
 <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
X-Mailer: mail (GNU Mailutils 3.7)
Message-Id: <20221009130233.94DAB960832@nuc.router0800d9.com>
Date: Sun,  9 Oct 2022 03:02:33 -1000 (HST)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 09 Oct 2022 13:02:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171551

Branch: kirkstone

New this week: 2 CVEs
CVE-2021-28861 (CVSS3: 7.4 HIGH): python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-28861 *
CVE-2022-41556 (CVSS3: 7.5 HIGH): lighttpd https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-41556 *

Removed this week: 0 CVEs

Full list:  Found 27 unpatched CVEs
CVE-2018-25032 (CVSS3: 7.5 HIGH): python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-25032 *
CVE-2021-28861 (CVSS3: 7.4 HIGH): python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-28861 *
CVE-2021-35937 (CVSS3: 6.4 MEDIUM): rpm:rpm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-35937 *
CVE-2021-35938 (CVSS3: 7.8 HIGH): rpm:rpm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-35938 *
CVE-2021-35939 (CVSS3: 7.8 HIGH): rpm:rpm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-35939 *
CVE-2021-3611 (CVSS3: 6.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3611 *
CVE-2021-3750 (CVSS3: 8.2 HIGH): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3750 *
CVE-2021-3782 (CVSS3: 9.8 CRITICAL): wayland:wayland-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3782 *
CVE-2022-2795 (CVSS3: 7.5 HIGH): bind https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2795 *
CVE-2022-2867 (CVSS3: 8.8 HIGH): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2867 *
CVE-2022-2868 (CVSS3: 8.1 HIGH): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2868 *
CVE-2022-2869 (CVSS3: 8.8 HIGH): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2869 *
CVE-2022-2881 (CVSS3: 8.2 HIGH): bind https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2881 *
CVE-2022-2906 (CVSS3: 7.5 HIGH): bind https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2906 *
CVE-2022-29154 (CVSS3: 7.4 HIGH): rsync:rsync-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-29154 *
CVE-2022-2953 (CVSS3: 5.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2953 *
CVE-2022-2962 (CVSS3: 7.8 HIGH): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2962 *
CVE-2022-3080 (CVSS3: 7.5 HIGH): bind https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3080 *
CVE-2022-3278 (CVSS3: 5.5 MEDIUM): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3278 *
CVE-2022-32893 (CVSS3: 8.8 HIGH): webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-32893 *
CVE-2022-3296 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3296 *
CVE-2022-3297 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3297 *
CVE-2022-3324 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3324 *
CVE-2022-3352 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3352 *
CVE-2022-38127 (CVSS3: 5.5 MEDIUM): binutils:binutils-cross-testsuite:binutils-cross-x86_64 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-38127 *
CVE-2022-38128 (CVSS3: 5.5 MEDIUM): binutils:binutils-cross-testsuite:binutils-cross-x86_64 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-38128 *
CVE-2022-41556 (CVSS3: 7.5 HIGH): lighttpd https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-41556 *

For further information see: https://autobuilder.yocto.io/pub/non-release/patchmetrics/

