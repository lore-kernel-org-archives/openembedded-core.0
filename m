Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B5DCC05027
	for <webhook@archiver.kernel.org>; Sun, 12 Feb 2023 13:32:45 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web10.10791.1676208760627821428
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Feb 2023 05:32:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=dSdRSDE0;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.170, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f170.google.com with SMTP id r8so11092058pls.2
        for <openembedded-core@lists.openembedded.org>; Sun, 12 Feb 2023 05:32:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=date:message-id:to:from:subject:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fkkn/FDUfgNlVpjuXX6sqsiSxmnfWWbjLfqqgbpl1eM=;
        b=dSdRSDE0rrldaxyiGs9u3F6XXXcquDLThbeljPFStphrU12nhKNqITrLSwM99HT1qv
         J5NSGXA1xArfKHKFPztc+CatdKUi8oGmrYB3KO/Je16hLbcJ7KA9Oirev5vX+Ndzj35a
         oCpjDU81QW0c0SsuKAH8y/tVBrNWxF7Srn8BHkxkA/gwyHqDskGi7c/UsOS3E+xNTe98
         5+fGdA1OtBlNSD0sEimC0mv7H+t5rPNr8TMIIeJXBv3Ox61ZyWNgZSslfWNcmTXlBWhV
         7RYpTXBp9NCjQ5JOAn7HuyvVzWOfKjWWkpXgh1BJhGsiWN0qpHLNYd702eNCOlX/kejT
         NlXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=date:message-id:to:from:subject:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fkkn/FDUfgNlVpjuXX6sqsiSxmnfWWbjLfqqgbpl1eM=;
        b=dSgwSPZOmR2rEfHvLZoG8Y3Zcy9DLgLH1CYtOl0fl8bHRkX1YGT9lFS5YMPeAYd49O
         G+Ge6YSMSRmHIj8Fm274nZL9Q4GO4ZKI2T0dlFKdWAorILgndwYdgIV2HLbASvBBw/yU
         fuP3O8aijaMFwzEU5R4CYFep1iHee97qox0a+gIbofOHEsvF+JBbKTujfpHNwBfS59lL
         6E8s673dL0NtBS5VQ7cYLjlwvhojP+NAfwuy8XU8oUU4dynwt03V+79scj1SHnJGm5CX
         MAkH/0YLG/eNpw5FyFFlqJFxmfhPw7bTG2WmNXLB5HdsIFQURCXZrkMVQCmkxsampLXo
         WB9w==
X-Gm-Message-State: AO0yUKUUKlZSsMR9GgOiOHYsR4Ccn/dyCwMvB5ojRKXwF1AApNqaSgxP
	td/6Qn86HdF69w1OFiVAMJH3xu1hTAF/iEahRF4=
X-Google-Smtp-Source: AK7set9LQuNWNDLCtUPsie/fAp4qwXogOZQYQ1YRk8tnFKp9GhUIHmq2w3xK7pujXmiT+Yr5bS/JIA==
X-Received: by 2002:a17:902:ecc2:b0:19a:968d:2713 with SMTP id a2-20020a170902ecc200b0019a968d2713mr2584685plh.48.1676208759457;
        Sun, 12 Feb 2023 05:32:39 -0800 (PST)
Received: from nuc.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id s17-20020a170902c65100b0019309be03e7sm6368349pls.66.2023.02.12.05.32.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Feb 2023 05:32:39 -0800 (PST)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id 611AE960403; Sun, 12 Feb 2023 03:32:37 -1000 (HST)
Subject: OE-core CVE metrics for langdale on Sun 12 Feb 2023 03:30:01 AM HST
FROM: steve@sakoman.com
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
X-Mailer: mail (GNU Mailutils 3.7)
Message-Id: <20230212133237.611AE960403@nuc.router0800d9.com>
Date: Sun, 12 Feb 2023 03:32:37 -1000 (HST)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 12 Feb 2023 13:32:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177042

Branch: langdale

New this week: 1 CVEs
CVE-2022-48303 (CVSS3: 7.8 HIGH): tar https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-48303 *

Removed this week: 2 CVEs
CVE-2022-3550 (CVSS3: 8.8 HIGH): xserver-xorg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3550 *
CVE-2022-3551 (CVSS3: 6.5 MEDIUM): xserver-xorg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3551 *

Full list:  Found 24 unpatched CVEs
CVE-2020-10735 (CVSS3: 7.5 HIGH): python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-10735 *
CVE-2022-23521 (CVSS3: 9.8 CRITICAL): git https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-23521 *
CVE-2022-3094 (CVSS3: 7.5 HIGH): bind https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3094 *
CVE-2022-3515 (CVSS3: 9.8 CRITICAL): gnupg:gnupg-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3515 *
CVE-2022-3736 (CVSS3: 7.5 HIGH): bind https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3736 *
CVE-2022-37454 (CVSS3: 9.8 CRITICAL): python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-37454 *
CVE-2022-3872 (CVSS3: 8.6 HIGH): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3872 *
CVE-2022-3924 (CVSS3: 7.5 HIGH): bind https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3924 *
CVE-2022-40303 (CVSS3: 7.5 HIGH): libxml2:libxml2-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-40303 *
CVE-2022-40304 (CVSS3: 7.8 HIGH): libxml2:libxml2-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-40304 *
CVE-2022-4055 (CVSS3: 7.4 HIGH): xdg-utils https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-4055 *
CVE-2022-40897 (CVSS3: 5.9 MEDIUM): python3-setuptools:python3-setuptools-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-40897 *
CVE-2022-4144 (CVSS3: 6.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-4144 *
CVE-2022-41903 (CVSS3: 9.8 CRITICAL): git https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-41903 *
CVE-2022-41953 (CVSS3: 7.8 HIGH): git https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-41953 *
CVE-2022-42919 (CVSS3: 7.8 HIGH): python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-42919 *
CVE-2022-45061 (CVSS3: 7.5 HIGH): python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-45061 *
CVE-2022-46908 (CVSS3: 7.3 HIGH): sqlite3:sqlite3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-46908 *
CVE-2022-4743 (CVSS3: 7.5 HIGH): libsdl2:libsdl2-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-4743 *
CVE-2022-48281 (CVSS3: 5.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-48281 *
CVE-2022-48303 (CVSS3: 7.8 HIGH): tar https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-48303 *
CVE-2023-0433 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-0433 *
CVE-2023-0512 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-0512 *
CVE-2023-22742 (CVSS3: 5.9 MEDIUM): libgit2 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-22742 *

For further information see: https://autobuilder.yocto.io/pub/non-release/patchmetrics/

