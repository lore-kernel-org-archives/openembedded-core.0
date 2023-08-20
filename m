Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9041EE49A4
	for <webhook@archiver.kernel.org>; Sun, 20 Aug 2023 11:19:57 +0000 (UTC)
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
 by mx.groups.io with SMTP id smtpd.web10.27188.1692530393369497878
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Aug 2023 04:19:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=WxYiqMpB;
 spf=softfail (domain: sakoman.com, ip: 209.85.219.47, mailfrom: steve@sakoman.com)
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-64a5bc52b0aso15124236d6.3
        for <openembedded-core@lists.openembedded.org>; Sun, 20 Aug 2023 04:19:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1692530392; x=1693135192;
        h=message-id:date:user-agent:to:from:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ABfGo4rrSG4uMKDz53e0ZbIXQ8pWCkN83Tg6URx5xDw=;
        b=WxYiqMpB22sKOtGlyujAliQXtgqgT/bK7B9rNPUw3XxkIl9XCueCmmLhgJI86Oe2n7
         5y4HIhMEvllRHyOVdaR2PaPnjr+C+or58o+ONZDqcAr/q+vE3aoWdbk/fn55kQwmL7UL
         rKLOGc5yI11LMHO1sbaTtP2UAWomglYda4RosfXAhstLHMTMbx9IKxBAA5Y9hTFsAOm9
         6pTZcD99maWEAmg1tecb+QFKv/JL9UFIsIDwBd4/P63shzKG9TP8R9EvGcWD8CfdPLC3
         nF53dPj0t4JWTBaI8NVyRMj3ob+M+RZTTHGI0yC+3tXOmL7ZH5oplmoqiwGqZbzJYLeB
         xRfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692530392; x=1693135192;
        h=message-id:date:user-agent:to:from:subject:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ABfGo4rrSG4uMKDz53e0ZbIXQ8pWCkN83Tg6URx5xDw=;
        b=K0i4oYrpdiwXM8egHNZONp86MOALUpLqRX0lMuvfKlDvSG40Qk2qmtXjS2x/yL3gh9
         ROtIKZevbvCZi7OQkz3MB6othfpMNq7h1XzJiGEYxXVkVNNOquWCECkHAe3YFkjmtawl
         Flk1wM430ddIOTbzAUWdIasX6mL/+dQOZoeLePRDgNzajtAV+oljsv+hARKA1MHOoGck
         q9h+BwnzhzGcYOirKzMMKRR0UcHCF700IsJ1EkAUwhIK/qop/oHk5a0lDPfD4gERlrUY
         4uQpH/GYngzhI39k0yunBxYoe+ZwZrN9LrRwowWdki0P983ucyg5F0Jqx8nXYR7o9E4Q
         bvcA==
X-Gm-Message-State: AOJu0Yy6iSa2jnXlDSCv4L4GPQZewIk04W3wzy0U9cnC1MheIDf/obPX
	9BDC2fC56UsMCWS8/pR689rhTLu0jnGjiMIZT6ronw==
X-Google-Smtp-Source: AGHT+IEtfbNHeK38gWmQQ5lSYLxT/CwdnwPbVJXflI4H56N5JlyiFzcRgddUbwkDPTCc0Ym3gMv91Q==
X-Received: by 2002:a0c:9c06:0:b0:64f:3e2d:93e3 with SMTP id v6-20020a0c9c06000000b0064f3e2d93e3mr1161349qve.53.1692530391998;
        Sun, 20 Aug 2023 04:19:51 -0700 (PDT)
Received: from builder.sakoman.com ([71.19.246.55])
        by smtp.gmail.com with ESMTPSA id z11-20020a0cf24b000000b0062fffa42cc5sm2091438qvl.79.2023.08.20.04.19.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Aug 2023 04:19:51 -0700 (PDT)
Received: by builder.sakoman.com (Postfix, from userid 1001)
	id 15E381070A5; Sun, 20 Aug 2023 01:19:50 -1000 (HST)
Subject: OE-core CVE metrics for master on Sun 20 Aug 2023 01:00:01 AM HST
FROM: steve@sakoman.com
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
User-Agent: mail (GNU Mailutils 3.14)
Date: Sun, 20 Aug 2023 01:19:50 -1000
Message-Id: <20230820111950.15E381070A5@builder.sakoman.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 20 Aug 2023 11:19:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186408

Branch: master

New this week: 3 CVEs
CVE-2023-0687 (CVSS3: 9.8 CRITICAL): glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-0687 *
CVE-2023-4128 (CVSS3: 7.8 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4128 *
CVE-2023-4147 (CVSS3: 7.8 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4147 *

Removed this week: 15 CVEs
CVE-2022-3533 (CVSS3: 5.7 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3533 *
CVE-2022-3606 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3606 *
CVE-2023-0160 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-0160 *
CVE-2023-2176 (CVSS3: 7.8 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-2176 *
CVE-2023-23039 (CVSS3: 5.7 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-23039 *
CVE-2023-2430 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-2430 *
CVE-2023-2975 (CVSS3: 5.3 MEDIUM): openssl:openssl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-2975 *
CVE-2023-3446 (CVSS3: 5.3 MEDIUM): openssl:openssl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3446 *
CVE-2023-35827 (CVSS3: 7.0 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-35827 *
CVE-2023-3618 (CVSS3: 6.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3618 *
CVE-2023-37453 (CVSS3: 4.6 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-37453 *
CVE-2023-37454 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-37454 *
CVE-2023-3817 (CVSS3: 5.3 MEDIUM): openssl:openssl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3817 *
CVE-2023-4132 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4132 *
CVE-2023-4133 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4133 *

Full list:  Found 29 unpatched CVEs
CVE-2019-14899 (CVSS3: 7.4 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-14899 *
CVE-2021-3714 (CVSS3: 7.5 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3714 *
CVE-2021-3864 (CVSS3: 7.0 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3864 *
CVE-2022-0400 (CVSS3: 7.5 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0400 *
CVE-2022-1247 (CVSS3: 7.0 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1247 *
CVE-2022-3219 (CVSS3: 3.3 LOW): gnupg:gnupg-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3219 *
CVE-2022-33065 (CVSS3: 7.8 HIGH): libsndfile1 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-33065 *
CVE-2022-36402 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-36402 *
CVE-2022-38096 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-38096 *
CVE-2022-4543 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-4543 *
CVE-2022-46456 (CVSS3: 6.1 MEDIUM): nasm:nasm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-46456 *
CVE-2023-0687 (CVSS3: 9.8 CRITICAL): glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-0687 *
CVE-2023-1206 (CVSS3: 5.7 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-1206 *
CVE-2023-1386 (CVSS3: 7.8 HIGH): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-1386 *
CVE-2023-3019 (CVSS3: 6.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3019 *
CVE-2023-3180 (CVSS3: 6.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3180 *
CVE-2023-3354 (CVSS3: 7.5 HIGH): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3354 *
CVE-2023-3640 (CVSS3: 7.8 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3640 *
CVE-2023-36632 (CVSS3: 7.5 HIGH): python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-36632 *
CVE-2023-36664 (CVSS3: 7.8 HIGH): ghostscript https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-36664 *
CVE-2023-3772 (CVSS3: 4.4 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3772 *
CVE-2023-3773 (CVSS3: 4.4 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3773 *
CVE-2023-37769 (CVSS3: 6.5 MEDIUM): pixman:pixman-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-37769 *
CVE-2023-4004 (CVSS3: 7.8 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4004 *
CVE-2023-4010 (CVSS3: 4.6 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4010 *
CVE-2023-4016 (CVSS3: 5.5 MEDIUM): procps https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4016 *
CVE-2023-4128 (CVSS3: 7.8 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4128 *
CVE-2023-4135 (CVSS3: 6.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4135 *
CVE-2023-4147 (CVSS3: 7.8 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4147 *

For further information see: https://autobuilder.yocto.io/pub/non-release/patchmetrics/

