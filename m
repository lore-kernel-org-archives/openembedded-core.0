Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00F74C77B7C
	for <webhook@archiver.kernel.org>; Sun, 21 May 2023 13:04:05 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web11.7236.1684674237907938020
 for <openembedded-core@lists.openembedded.org>;
 Sun, 21 May 2023 06:03:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=j5+FT0Sk;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.179, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1ae4c5e12edso37946545ad.3
        for <openembedded-core@lists.openembedded.org>; Sun, 21 May 2023 06:03:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1684674237; x=1687266237;
        h=message-id:date:user-agent:to:from:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WKyyUcdEwt61T1jBbyqmYh9zgatT6P3Lpx6qnZq9ves=;
        b=j5+FT0SkPTDgkMJ6Rnrpk7J299BSOcQxRyo21qwA89LE/f3jMgXAY6SoBzgr5En+HB
         Vz6Ru66rCOnGkuGT5tfsag58eJ7OkvSXrCdV4T3A7e/4Nwc3zM1CeXh0vXqhIghNBLgu
         5tBf5lfkNW+0enCYcyKJCYIBVEIhsFtelwdagk6wUAb0g+XntZayP0sUvDOOxa4CKjw+
         Bf0xcvZqzRDWngu8gUtIDisqydTmEpAbBouCMwrk5p9mISjD8ykqHvqmvsxWJBcRW9cr
         S3DxulbKu0pCwHyJSQq4o4fH+PnJP+1x2V6e0ZHRysum09K1UNxB/oPV6gfKEqjhe9xj
         +1IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684674237; x=1687266237;
        h=message-id:date:user-agent:to:from:subject:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WKyyUcdEwt61T1jBbyqmYh9zgatT6P3Lpx6qnZq9ves=;
        b=cQSuYMj/87vmCkKo1TV9HqKiaxVa7TsL6SSBHR4YbWwTiwP0R0vFUwpNR18FSKvUV+
         4NZdxoY3gkNRe1++4DJ/FJeVZaRwgpteWBcLw7eIzpd0mYFjSuW3glF0RKpjUTY0CQmz
         mhqoKaCvDfvnfe4LNouHJqJRn5O/laX3TuxnZdNAchBlLNCkS8RJmL9/RpWuiFBjxmj9
         ckRebHk0M+O7uyaebejDgdmKEGt3QWcvTqXGI4I6IeMPZx5nYr7cS6kq76QcbCkyDYtU
         e/3Kl5EbE8PEjxj68I5RjgNe6yIneAXoKMfClwBAhQwMaIs1KrHqZtRe3OyPhqL4Y6kv
         TnLQ==
X-Gm-Message-State: AC+VfDxe35rSqACemQlB8ZqqEmIYcoQODv/Sa7yJwLnUexIiV7HOUUZh
	FZKp8UWg15vOR+75BWbsdTan6JAXkefBdW7XBsM=
X-Google-Smtp-Source: ACHHUZ4oqIKU+92akOBotqkmhDiISr/+VZMJsiDtu1OezgpqyrUAXn93//DHp3gN/iyh3i+9e2nq9g==
X-Received: by 2002:a17:902:fe18:b0:1aa:e5cd:6478 with SMTP id g24-20020a170902fe1800b001aae5cd6478mr8369155plj.58.1684674236879;
        Sun, 21 May 2023 06:03:56 -0700 (PDT)
Received: from nuc.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id v3-20020a170902d68300b001aad4be4503sm2960042ply.2.2023.05.21.06.03.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 May 2023 06:03:56 -0700 (PDT)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id 5509A96044D; Sun, 21 May 2023 03:03:54 -1000 (HST)
Subject: OE-core CVE metrics for kirkstone on Sun 21 May 2023 03:00:01 AM HST
FROM: steve@sakoman.com
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
User-Agent: mail (GNU Mailutils 3.14)
Date: Sun, 21 May 2023 03:03:54 -1000
Message-Id: <20230521130354.5509A96044D@nuc.router0800d9.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 21 May 2023 13:04:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181578

Branch: kirkstone

New this week: 1 CVEs
CVE-2023-2609 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-2609 *

Removed this week: 0 CVEs

Full list:  Found 27 unpatched CVEs
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
CVE-2023-2609 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-2609 *
CVE-2023-2610 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-2610 *
CVE-2023-27043 (CVSS3: 5.3 MEDIUM): python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-27043 *
CVE-2023-28531 (CVSS3: 9.8 CRITICAL): openssh https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-28531 *
CVE-2023-29491 (CVSS3: 7.8 HIGH): ncurses:ncurses-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-29491 *
CVE-2023-30630 (CVSS3: 7.8 HIGH): dmidecode https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-30630 *

For further information see: https://autobuilder.yocto.io/pub/non-release/patchmetrics/

