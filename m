Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59763C3DA6E
	for <webhook@archiver.kernel.org>; Sun, 17 Dec 2023 11:17:57 +0000 (UTC)
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
 by mx.groups.io with SMTP id smtpd.web10.16939.1702811866882778294
 for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Dec 2023 03:17:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=x26qxPks;
 spf=softfail (domain: sakoman.com, ip: 209.85.219.41, mailfrom: steve@sakoman.com)
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-67f27a4c6fbso13163676d6.1
        for <openembedded-core@lists.openembedded.org>; Sun, 17 Dec 2023 03:17:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1702811865; x=1703416665; darn=lists.openembedded.org;
        h=message-id:date:user-agent:to:from:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tceA3z8Zu5oHguPKBRID1W0kQT+mGErxBxGw8eKZpBY=;
        b=x26qxPksc464pX920mv6CooYpOH+BR/kR6usn1kqKsZAWJipueAD7R4wZuXxDyylRH
         j9gVpzVJwhpxTjDXt4NLbVkf4AtolOrFfw14GUqbdWPKu+nnJSLZm1NITPK7I7OLYWL4
         k+T6usCFU4zaAV72+tB2shy3yQKKO2yHLLtD5aDoKgxuGWtF8vZFQicjZZ4Pr1xkoqUs
         qvNx9ViqVz4NiC2mCdPKQFzyB0ZsxQ+K8YQLxDnVZjXPeBfUzyoxQnG03TMnD93HY3ZT
         u4pYM+eqkEsI0LXI0vyo73OBA43CrdLWxYq6HlDuXRNbY0Loj3SlaqOtFeor0bPJhuFk
         sLsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702811865; x=1703416665;
        h=message-id:date:user-agent:to:from:subject:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tceA3z8Zu5oHguPKBRID1W0kQT+mGErxBxGw8eKZpBY=;
        b=G9riYOJad8ajORyJco1Xgo7sR7nNWCogpOqq1WSO0jjsxSbpISFyFAXerX0333u+FF
         zoUuRQ+k40V9nASs2aRPhVZv5KzrfbhwSIDtWgdtNvixKQPDVxoE8CZLUTT/N2weyGTL
         9yplPV85MOQyhVhphP6AUH/KhLaV4rL6VSv1ONwXWVKEwzQegMsUZ+vuH6y6mh9AmMrl
         fZQsssBHrfNGcmBxWlLdu6APMvNw27g99WF3dknJ0AMfS+Ac6K0CJcvj4HbWEQkerXfN
         ljweRh8p4hRXkMzu1PU0eIpHxGGF6eVLVtBxmV/eLQl10PVuQXlSZ8yvTMb54bOrEbaA
         owFA==
X-Gm-Message-State: AOJu0Ywvhb3lByOuy8B5jMHHTOtQfjeniq8DudECZsEaiZxXbD3b9CrK
	3hRzabytb5ZqF1bJtP40irEQZHA9yZEOX5x/3ro=
X-Google-Smtp-Source: AGHT+IGfPPJX159MOnkPY9jDQXFa+vtnQvdY7cLd8Uh6lVHDbqvScqBRvQjzhQN0PPZTzKX7wiIjKg==
X-Received: by 2002:a05:6214:1c4a:b0:67f:56e:c8fb with SMTP id if10-20020a0562141c4a00b0067f056ec8fbmr9520610qvb.49.1702811864931;
        Sun, 17 Dec 2023 03:17:44 -0800 (PST)
Received: from builder.sakoman.com ([71.19.246.55])
        by smtp.gmail.com with ESMTPSA id k15-20020ad4420f000000b0067f38dd31c8sm493864qvp.17.2023.12.17.03.17.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Dec 2023 03:17:44 -0800 (PST)
Received: by builder.sakoman.com (Postfix, from userid 1001)
	id 34234106A09; Sun, 17 Dec 2023 01:17:43 -1000 (HST)
Subject: OE-core CVE metrics for master on Sun 17 Dec 2023 01:00:01 AM HST
FROM: steve@sakoman.com
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
User-Agent: mail (GNU Mailutils 3.14)
Date: Sun, 17 Dec 2023 01:17:43 -1000
Message-Id: <20231217111743.34234106A09@builder.sakoman.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 17 Dec 2023 11:17:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192586

Branch: master

New this week: 8 CVEs
CVE-2023-46218 (CVSS3: 6.5 MEDIUM): curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-46218 *
CVE-2023-46219 (CVSS3: 5.3 MEDIUM): curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-46219 *
CVE-2023-50431 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-50431 *
CVE-2023-6560 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6560 *
CVE-2023-6606 (CVSS3: 7.1 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6606 *
CVE-2023-6610 (CVSS3: 7.1 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6610 *
CVE-2023-6622 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6622 *
CVE-2023-6679 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6679 *

Removed this week: 1 CVEs
CVE-2023-49292 (CVSS3: 4.8 MEDIUM): go:go-binary-native:go-cross-core2-64:go-runtime https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-49292 *

Full list:  Found 37 unpatched CVEs
CVE-2019-14899 (CVSS3: 7.4 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-14899 *
CVE-2021-3714 (CVSS3: 7.5 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3714 *
CVE-2021-3864 (CVSS3: 7.0 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3864 *
CVE-2022-0400 (CVSS3: 7.5 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0400 *
CVE-2022-1247 (CVSS3: 7.0 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1247 *
CVE-2022-3219 (CVSS3: 3.3 LOW): gnupg:gnupg-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3219 *
CVE-2022-36402 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-36402 *
CVE-2022-38096 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-38096 *
CVE-2022-4543 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-4543 *
CVE-2022-46456 (CVSS3: 6.1 MEDIUM): nasm:nasm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-46456 *
CVE-2023-0687 (CVSS3: 9.8 CRITICAL): glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-0687 *
CVE-2023-1386 (CVSS3: 7.8 HIGH): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-1386 *
CVE-2023-25584 (CVSS3: 7.1 HIGH): binutils:binutils-cross-testsuite:binutils-cross-x86_64:binutils-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-25584 *
CVE-2023-3019 (CVSS3: 6.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3019 *
CVE-2023-3397 (CVSS3: 6.3 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3397 *
CVE-2023-3640 (CVSS3: 7.8 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3640 *
CVE-2023-38559 (CVSS3: 5.5 MEDIUM): ghostscript https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-38559 *
CVE-2023-40030 (CVSS3: 6.1 MEDIUM): rust:rust-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-40030 *
CVE-2023-4010 (CVSS3: 4.6 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4010 *
CVE-2023-4039 (CVSS3: 4.8 MEDIUM): gcc:gcc-cross-x86_64:gcc-runtime:gcc-sanitizers:libgcc:libgcc-initial https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4039 *
CVE-2023-42363 (CVSS3: 5.5 MEDIUM): busybox https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-42363 *
CVE-2023-42364 (CVSS3: 5.5 MEDIUM): busybox https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-42364 *
CVE-2023-42365 (CVSS3: 5.5 MEDIUM): busybox https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-42365 *
CVE-2023-42366 (CVSS3: 5.5 MEDIUM): busybox https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-42366 *
CVE-2023-46218 (CVSS3: 6.5 MEDIUM): curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-46218 *
CVE-2023-46219 (CVSS3: 5.3 MEDIUM): curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-46219 *
CVE-2023-46407 (CVSS3: 5.5 MEDIUM): ffmpeg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-46407 *
CVE-2023-47100 (CVSS3: 9.8 CRITICAL): perl:perl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-47100 *
CVE-2023-50431 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-50431 *
CVE-2023-5088 (CVSS3: 7.0 HIGH): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-5088 *
CVE-2023-5156 (CVSS3: 7.5 HIGH): glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-5156 *
CVE-2023-6238 (CVSS3: 7.8 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6238 *
CVE-2023-6560 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6560 *
CVE-2023-6606 (CVSS3: 7.1 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6606 *
CVE-2023-6610 (CVSS3: 7.1 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6610 *
CVE-2023-6622 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6622 *
CVE-2023-6679 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6679 *

For further information see: https://autobuilder.yocto.io/pub/non-release/patchmetrics/

