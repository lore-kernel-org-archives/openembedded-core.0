Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A22FC77B7F
	for <webhook@archiver.kernel.org>; Sun, 14 May 2023 13:03:56 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web10.66536.1684069426114272090
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 May 2023 06:03:46 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=hCDfq3Bk;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.175, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1aaf70676b6so83064205ad.3
        for <openembedded-core@lists.openembedded.org>; Sun, 14 May 2023 06:03:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1684069425; x=1686661425;
        h=message-id:date:user-agent:to:from:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ijE79nkq+udjqUp0/r/tdKZoTAdYb2linLagpmQvi2k=;
        b=hCDfq3BkO0sFjeCJXJJJyvMShT7wvrOEgj+6feIBQmzhcgAyOTCMoLyXrVW+JiF8xL
         DrMrm8GxFVTZ2eva6GTfUtLmk/HzKICd4rtYGyrBC9XRssX7V46XyE2gbxPziE+EH+he
         D/d4PIkR7CC52iZXPV5ucyijgZN56wHNJNrksw4GB1kqYL08gJ4EaV13rsffcLq2SX+f
         uSiXqt8+D2pJxaktbVqMBU0A7TcXJjNPyLKO6ulPWgr/4vmic8qGLhgsNwH3ky7z1/sp
         +jcQ5gmwCR8z/inoq1KWEKucKWI5tE212902RoaLo46e6VFxkLOHx0V/bG/KvuVruOXn
         abTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684069425; x=1686661425;
        h=message-id:date:user-agent:to:from:subject:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ijE79nkq+udjqUp0/r/tdKZoTAdYb2linLagpmQvi2k=;
        b=lRuB5Jp+4h/k9fltO+2JMUHIUCQaa2l+BeUJOGK7ZNeZpEbfvJ23Ja3ay+lAgsneGd
         BEfl/eyxiv25uENMcbyGcxYo7knAw8RiBnNA/IWV1QZPB6UsdKsJlmSuqvRXKaHL1S1s
         7VV4Ws1nfEy+fHzrZyIbfXVIFAxjzDg3gqMJZQ7gDvn61dDtXUifyOqFqR9EmTD05v1s
         pi0w9d71YN3HmaPnxgaF3Y5lYnw2khEE6VD0d++CP+qyOHb+4lW4mhJppKpzL2Wl1EQ4
         KurUQ9X4Mc1fWT5eNnV3a4u4NSkRZDyRYMZQ+AcLlVst4ywT4nHZF9Pl78b4JP7YjB32
         bnEg==
X-Gm-Message-State: AC+VfDyyCUq7nh0Bb6Xrx9YbyrrTga9FQDv8sYLXYg7Piq8H/eLd7Cq+
	jnfl5LPKSWyYgbo/2syDZ6z1dgRN2Yhh4g+7qyc=
X-Google-Smtp-Source: ACHHUZ6bSfMJTS2MlIRRXkC4Yzss0qWrv8+meh7aTUmVnFW2ByN7BT/1M27X7qA1VR0gkbiaVelcEg==
X-Received: by 2002:a17:903:64c:b0:1ab:107b:c127 with SMTP id kh12-20020a170903064c00b001ab107bc127mr28408921plb.59.1684069425088;
        Sun, 14 May 2023 06:03:45 -0700 (PDT)
Received: from nuc.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id y2-20020a17090a6c8200b0024e135c2ea1sm20746734pjj.18.2023.05.14.06.03.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 May 2023 06:03:44 -0700 (PDT)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id AC57E9603D3; Sun, 14 May 2023 03:03:42 -1000 (HST)
Subject: OE-core CVE metrics for kirkstone on Sun 14 May 2023 03:00:01 AM HST
FROM: steve@sakoman.com
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
User-Agent: mail (GNU Mailutils 3.14)
Date: Sun, 14 May 2023 03:03:42 -1000
Message-Id: <20230514130342.AC57E9603D3@nuc.router0800d9.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 14 May 2023 13:03:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181199

Branch: kirkstone

New this week: 2 CVEs
CVE-2023-2426 (CVSS3: 5.5 MEDIUM): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-2426 *
CVE-2023-2610 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-2610 *

Removed this week: 9 CVEs
CVE-2022-48434 (CVSS3: 8.1 HIGH): ffmpeg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-48434 *
CVE-2023-2004 (CVSS3: 7.5 HIGH): freetype:freetype-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-2004 *
CVE-2023-24534 (CVSS3: 7.5 HIGH): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-24534 *
CVE-2023-24538 (CVSS3: 9.8 CRITICAL): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-24538 *
CVE-2023-25652 (CVSS3: 7.5 HIGH): git https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-25652 *
CVE-2023-28484 (CVSS3: 6.5 MEDIUM): libxml2:libxml2-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-28484 *
CVE-2023-28488 (CVSS3: 6.5 MEDIUM): connman https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-28488 *
CVE-2023-29007 (CVSS3: 7.8 HIGH): git https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-29007 *
CVE-2023-29469 (CVSS3: 6.5 MEDIUM): libxml2:libxml2-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-29469 *

Full list:  Found 26 unpatched CVEs
CVE-2021-35937 (CVSS3: 6.4 MEDIUM): rpm:rpm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-35937 *
CVE-2021-35938 (CVSS3: 6.7 MEDIUM): rpm:rpm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-35938 *
CVE-2021-35939 (CVSS3: 6.7 MEDIUM): rpm:rpm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-35939 *
CVE-2022-3219 (CVSS3: 5.5 MEDIUM): gnupg:gnupg-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3219 *
CVE-2022-3515 (CVSS3: 9.8 CRITICAL): gnupg:gnupg-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3515 *
CVE-2022-3553 (CVSS3: 6.5 MEDIUM): xserver-xorg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3553 *
CVE-2022-3872 (CVSS3: 8.6 HIGH): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3872 *
CVE-2022-3964 (CVSS3: 8.1 HIGH): ffmpeg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3964 *
CVE-2022-3965 (CVSS3: 8.1 HIGH): ffmpeg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3965 *
CVE-2022-4055 (CVSS3: 7.4 HIGH): xdg-utils https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-4055 *
CVE-2023-0795 (CVSS3: 5.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-0795 *
CVE-2023-0796 (CVSS3: 5.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-0796 *
CVE-2023-0797 (CVSS3: 5.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-0797 *
CVE-2023-0798 (CVSS3: 5.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-0798 *
CVE-2023-0799 (CVSS3: 5.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-0799 *
CVE-2023-1255 (CVSS3: 5.9 MEDIUM): openssl:openssl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-1255 *
CVE-2023-1544 (CVSS3: 6.3 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-1544 *
CVE-2023-1916 (CVSS3: 6.1 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-1916 *
CVE-2023-2426 (CVSS3: 5.5 MEDIUM): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-2426 *
CVE-2023-24532 (CVSS3: 5.3 MEDIUM): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-24532 *
CVE-2023-24536 (CVSS3: 7.5 HIGH): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-24536 *
CVE-2023-2610 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-2610 *
CVE-2023-27043 (CVSS3: 5.3 MEDIUM): python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-27043 *
CVE-2023-28531 (CVSS3: 9.8 CRITICAL): openssh https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-28531 *
CVE-2023-29491 (CVSS3: 7.8 HIGH): ncurses:ncurses-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-29491 *
CVE-2023-30630 (CVSS3: 7.8 HIGH): dmidecode https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-30630 *

For further information see: https://autobuilder.yocto.io/pub/non-release/patchmetrics/

