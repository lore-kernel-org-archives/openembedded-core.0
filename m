Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58677C76196
	for <webhook@archiver.kernel.org>; Sun,  2 Apr 2023 13:03:18 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web11.43966.1680440596766997296
 for <openembedded-core@lists.openembedded.org>;
 Sun, 02 Apr 2023 06:03:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=sJ7b4dhJ;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.176, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f176.google.com with SMTP id o2so25570680plg.4
        for <openembedded-core@lists.openembedded.org>; Sun, 02 Apr 2023 06:03:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1680440596; x=1683032596;
        h=message-id:date:user-agent:to:from:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hzoiE6wHJPBzI1iEsgm4v3vHMvvkyvYM/7iEy+wWrxc=;
        b=sJ7b4dhJPFYhHb3K7O9TmHQFZTnWYU4LmD7VjFwOfb5sLWFaxvn+pkNxZVVRgQvDQn
         MuZ54d4RhjZe7BXglkZXshCkgxJBTLwv/9/nmL0z3FpgIlp+hB3dNH5TB1JirSf2g3Jr
         EI7b/tNHmU/mETgLiaPgMPBPhhyPmc4Yt3gE3i9Cpbwdy1w+X3DVPvvAHI9Fo2UC0LiP
         ILpnjlRnzYZI4ZTeQosyGZGYhjLgtbGmzz4n10ggx0bl944d747e0qOuREywBptsaQHe
         0hV/DMU4AdMjEuCKZPFFdvdwix8sCEI+W3g38VBdqjpA5tgK8Rg0viJgtuzLGiaT2fjH
         noFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680440596; x=1683032596;
        h=message-id:date:user-agent:to:from:subject:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hzoiE6wHJPBzI1iEsgm4v3vHMvvkyvYM/7iEy+wWrxc=;
        b=49JwIQtls35t1FlxhGZ/L/nBzzUF4VvCVt1g5BN2GRyslDL1Fcz2rBu52e7rnb+fYL
         V7IKY7VxOLnME8NYOpbA8TW1eb59H0tBo+sQH6lhnoTC7BaD/wW6k6hsILMxJKp8gYOb
         z9AleoDGAGTYJLqw1CR91mrOguM6driHzLlu3c2ASoeXtvpKbG7Ah3IE5yIkMVFWdswV
         h8KqDwz1z/xaCMorJRLCGTSm8Ys/NvU3DZMAkAFkCy4Wim3JdjZCPUWX9jcHFu1OueCC
         Yj2wLpd+WNIb+C23YwX5X7XeAVkYkaE8UKOLcRJXcqJyod9ynrFGEEXDhttY8eUsazZI
         U1iA==
X-Gm-Message-State: AAQBX9fVXoDMay22BeW8giV1MquCFRgzfe3F5hmx3IwlQDGK/JLmpqXP
	UJXOi+B6rYSaauSZppw8aHGTVcKP/gnl4DkRPf0=
X-Google-Smtp-Source: AKy350aNOvcd5YDFLcfmnpssaJXgCz2HjMTNnW/ophe6dvghVzkoESAaC9EpnPe7mmsHUkbD3cf/7g==
X-Received: by 2002:a05:6a20:5483:b0:da:d4eb:9e07 with SMTP id i3-20020a056a20548300b000dad4eb9e07mr15725041pzk.30.1680440595753;
        Sun, 02 Apr 2023 06:03:15 -0700 (PDT)
Received: from nuc.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id n12-20020a63ee4c000000b00502f1256674sm4478245pgk.41.2023.04.02.06.03.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Apr 2023 06:03:15 -0700 (PDT)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id AE17D960320; Sun,  2 Apr 2023 03:03:13 -1000 (HST)
Subject: OE-core CVE metrics for kirkstone on Sun 02 Apr 2023 03:00:01 AM HST
FROM: steve@sakoman.com
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
User-Agent: mail (GNU Mailutils 3.14)
Date: Sun,  2 Apr 2023 03:03:13 -1000
Message-Id: <20230402130313.AE17D960320@nuc.router0800d9.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 02 Apr 2023 13:03:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179578

Branch: kirkstone

New this week: 2 CVEs
CVE-2023-0464 (CVSS3: 7.5 HIGH): openssl:openssl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-0464 *
CVE-2023-1544 (CVSS3: 5.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-1544 *

Removed this week: 5 CVEs
CVE-2005-1796 (CVSS3: N/A): ncurses:ncurses-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2005-1796 *
CVE-2023-22743 (CVSS3: 7.3 HIGH): git https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-22743 *
CVE-2023-22795 (CVSS3: 7.5 HIGH): ruby:ruby-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-22795 *
CVE-2023-23914 (CVSS3: 9.1 CRITICAL): curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-23914 *
CVE-2023-23915 (CVSS3: 6.5 MEDIUM): curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-23915 *

Full list:  Found 29 unpatched CVEs
CVE-2021-35937 (CVSS3: 6.4 MEDIUM): rpm:rpm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-35937 *
CVE-2021-35938 (CVSS3: 6.7 MEDIUM): rpm:rpm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-35938 *
CVE-2021-35939 (CVSS3: 6.7 MEDIUM): rpm:rpm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-35939 *
CVE-2022-2879 (CVSS3: 7.5 HIGH): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2879 *
CVE-2022-3219 (CVSS3: 5.5 MEDIUM): gnupg:gnupg-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3219 *
CVE-2022-3515 (CVSS3: 9.8 CRITICAL): gnupg:gnupg-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3515 *
CVE-2022-3553 (CVSS3: 6.5 MEDIUM): xserver-xorg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3553 *
CVE-2022-3872 (CVSS3: 8.6 HIGH): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3872 *
CVE-2022-4055 (CVSS3: 7.4 HIGH): xdg-utils https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-4055 *
CVE-2022-41716 (CVSS3: 7.5 HIGH): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-41716 *
CVE-2022-41720 (CVSS3: 7.5 HIGH): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-41720 *
CVE-2022-41722 (CVSS3: 7.5 HIGH): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-41722 *
CVE-2022-41723 (CVSS3: 7.5 HIGH): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-41723 *
CVE-2022-41724 (CVSS3: 7.5 HIGH): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-41724 *
CVE-2022-41725 (CVSS3: 7.5 HIGH): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-41725 *
CVE-2022-44617 (CVSS3: 7.5 HIGH): libxpm https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-44617 *
CVE-2022-46285 (CVSS3: 7.5 HIGH): libxpm https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-46285 *
CVE-2022-4645 (CVSS3: 5.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-4645 *
CVE-2022-4883 (CVSS3: 8.8 HIGH): libxpm https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-4883 *
CVE-2023-0464 (CVSS3: 7.5 HIGH): openssl:openssl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-0464 *
CVE-2023-0795 (CVSS3: 5.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-0795 *
CVE-2023-0796 (CVSS3: 5.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-0796 *
CVE-2023-0797 (CVSS3: 5.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-0797 *
CVE-2023-0798 (CVSS3: 5.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-0798 *
CVE-2023-0799 (CVSS3: 5.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-0799 *
CVE-2023-1544 (CVSS3: 5.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-1544 *
CVE-2023-23916 (CVSS3: 7.5 HIGH): curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-23916 *
CVE-2023-24532 (CVSS3: 5.3 MEDIUM): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-24532 *
CVE-2023-28531 (CVSS3: 9.8 CRITICAL): openssh https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-28531 *

For further information see: https://autobuilder.yocto.io/pub/non-release/patchmetrics/

