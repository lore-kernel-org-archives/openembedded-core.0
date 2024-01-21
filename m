Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74DE3C47422
	for <webhook@archiver.kernel.org>; Sun, 21 Jan 2024 13:18:03 +0000 (UTC)
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
 by mx.groups.io with SMTP id smtpd.web11.46549.1705843078358365583
 for <openembedded-core@lists.openembedded.org>;
 Sun, 21 Jan 2024 05:17:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=a9LM70lp;
 spf=softfail (domain: sakoman.com, ip: 209.85.160.171, mailfrom: steve@sakoman.com)
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-42a029c8e76so18087081cf.2
        for <openembedded-core@lists.openembedded.org>; Sun, 21 Jan 2024 05:17:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1705843076; x=1706447876; darn=lists.openembedded.org;
        h=message-id:date:user-agent:to:from:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W5N5SFWX+b1BgN1zgprtl3+SMwj2HwmwoPPwk+l1L70=;
        b=a9LM70lpyoDXM2jhHF52fXxeJUWOsS9Rek75yFXl7KtCfOMDRHOEhW4L502wKLBBTn
         IY4oXDBUfIZ4vGUWC/uClDRHkqarPO9YBbI8PsReKfBeJkAzA0ALhGiXpv6geite306e
         1HVMZej/2E2aclO7WXbqgT3V5lRhAsGjd0PoGI3oFqdJIZbz4PMQyAoDm5vtrIblLtdW
         k0afXeLqzqdF8ZZLs/5wwAmAZHioNkEdeP5sNQ0Yr+eczIvfV5sJoCD5VvyM5jpxgBN+
         nYnP33S6/fHx7u8h25DSKesRVkTtFC+IEOSHBM5aiwboNW+zLkarDf0ktxWFkYVpjiS7
         FSEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705843076; x=1706447876;
        h=message-id:date:user-agent:to:from:subject:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=W5N5SFWX+b1BgN1zgprtl3+SMwj2HwmwoPPwk+l1L70=;
        b=s+SZXMV7eW3EgaUG6xpE7QwEDQo8EX/CfCXyW85KsFR3nh+Xv7/vkl1cJ9LTx0kFaa
         obUubGyJSKyq+o3gFfoSTMH/fYVoxzZC71yDmOtJ22wpZrNKWOxZzavzpWXhwsAOp53J
         6/LFDh/Q5V0OtDOgJ7VdBs9uUK1yIWM5euIGNd0DB+5YPwDgtBT/z0VBXOqMVs2E3cIv
         cQvSFAR0utZboa8sW/shrJCMtqje4ROLkYNeGfc9PRPrtv1HcjTzLRSaAEItBSwz/1FJ
         z0Jo2S7uOZu+HyFVi4TzNU8PgibWTI5t3zyJTtGW55ovQ4hhbhA7Y+uR2vGkzVg2vaZL
         cjGg==
X-Gm-Message-State: AOJu0Yyryebxb34vq08z7+1fFVUe5haAEAO7kHod+3dFeUvtGUY7WTfg
	8TJmWnwjusGanFgUg2rubFW8in4nNKVt/pMmt8ML1IyavexKkBTijJztxeBFWzZbq4ZlHDk4I1V
	hsQY=
X-Google-Smtp-Source: AGHT+IEt8bFzerZz5BIwR7vDnhm0croYRbtR6VyvZRhc5j0UUq7u+K9x4PfCRFBrjRMi2GL8Ha3biA==
X-Received: by 2002:a0c:aa58:0:b0:686:2ff1:8e81 with SMTP id e24-20020a0caa58000000b006862ff18e81mr2033547qvb.47.1705843076508;
        Sun, 21 Jan 2024 05:17:56 -0800 (PST)
Received: from builder.sakoman.com ([71.19.246.55])
        by smtp.gmail.com with ESMTPSA id mv1-20020a056214338100b006864f75c968sm899988qvb.5.2024.01.21.05.17.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jan 2024 05:17:56 -0800 (PST)
Received: by builder.sakoman.com (Postfix, from userid 1001)
	id F34EC10693A; Sun, 21 Jan 2024 03:17:54 -1000 (HST)
Subject: OE-core CVE metrics for kirkstone on Sun 21 Jan 2024 03:00:01 AM HST
FROM: steve@sakoman.com
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
User-Agent: mail (GNU Mailutils 3.14)
Date: Sun, 21 Jan 2024 03:17:54 -1000
Message-Id: <20240121131754.F34EC10693A@builder.sakoman.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 21 Jan 2024 13:18:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194091

Branch: kirkstone

New this week: 1 CVEs
CVE-2024-22195 (CVSS3: 6.1 MEDIUM): python3-jinja2:python3-jinja2-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-22195 *

Removed this week: 0 CVEs

Full list:  Found 40 unpatched CVEs
CVE-2021-35937 (CVSS3: 6.4 MEDIUM): rpm:rpm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-35937 *
CVE-2021-35938 (CVSS3: 6.7 MEDIUM): rpm:rpm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-35938 *
CVE-2021-35939 (CVSS3: 6.7 MEDIUM): rpm:rpm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-35939 *
CVE-2022-3219 (CVSS3: 3.3 LOW): gnupg:gnupg-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3219 *
CVE-2022-3515 (CVSS3: 9.8 CRITICAL): gnupg:gnupg-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3515 *
CVE-2022-36648 (CVSS3: 10.0 CRITICAL): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-36648 *
CVE-2022-3872 (CVSS3: 8.6 HIGH): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3872 *
CVE-2023-1386 (CVSS3: 7.8 HIGH): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-1386 *
CVE-2023-24532 (CVSS3: 5.3 MEDIUM): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-24532 *
CVE-2023-27043 (CVSS3: 5.3 MEDIUM): python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-27043 *
CVE-2023-2731 (CVSS3: 5.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-2731 *
CVE-2023-28198 (CVSS3: 8.8 HIGH): webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-28198 *
CVE-2023-29403 (CVSS3: 7.8 HIGH): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-29403 *
CVE-2023-3019 (CVSS3: 6.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3019 *
CVE-2023-32370 (CVSS3: 5.3 MEDIUM): webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-32370 *
CVE-2023-37769 (CVSS3: 6.5 MEDIUM): pixman:pixman-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-37769 *
CVE-2023-39323 (CVSS3: 8.1 HIGH): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-39323 *
CVE-2023-4039 (CVSS3: 4.8 MEDIUM): gcc:gcc-cross-x86_64:gcc-runtime:gcc-sanitizers:libgcc:libgcc-initial https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4039 *
CVE-2023-40397 (CVSS3: 9.8 CRITICAL): webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-40397 *
CVE-2023-42467 (CVSS3: 5.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-42467 *
CVE-2023-44487 (CVSS3: 7.5 HIGH): go:nghttp2 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-44487 *
CVE-2023-45285 (CVSS3: 7.5 HIGH): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-45285 *
CVE-2023-45287 (CVSS3: 7.5 HIGH): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-45287 *
CVE-2023-45803 (CVSS3: 4.2 MEDIUM): python3-urllib3 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-45803 *
CVE-2023-46407 (CVSS3: 5.5 MEDIUM): ffmpeg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-46407 *
CVE-2023-47100 (CVSS3: 9.8 CRITICAL): perl:perl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-47100 *
CVE-2023-47470 (CVSS3: 7.8 HIGH): ffmpeg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-47470 *
CVE-2023-48795 (CVSS3: 5.9 MEDIUM): dropbear:libssh2:libssh2-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-48795 *
CVE-2023-49292 (CVSS3: 4.8 MEDIUM): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-49292 *
CVE-2023-51767 (CVSS3: 7.0 HIGH): openssh https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-51767 *
CVE-2023-5380 (CVSS3: 4.7 MEDIUM): xwayland https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-5380 *
CVE-2023-5574 (CVSS3: 7.0 HIGH): xserver-xorg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-5574 *
CVE-2023-6228 (CVSS3: 5.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6228 *
CVE-2023-6277 (CVSS3: 6.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6277 *
CVE-2023-6377 (CVSS3: 7.8 HIGH): xwayland https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6377 *
CVE-2023-6478 (CVSS3: 7.5 HIGH): xwayland https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6478 *
CVE-2023-6693 (CVSS3: 5.3 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6693 *
CVE-2023-6992 (CVSS3: 5.5 MEDIUM): zlib:zlib-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6992 *
CVE-2023-7104 (CVSS3: 7.3 HIGH): sqlite3:sqlite3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-7104 *
CVE-2024-22195 (CVSS3: 6.1 MEDIUM): python3-jinja2:python3-jinja2-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-22195 *

For further information see: https://autobuilder.yocto.io/pub/non-release/patchmetrics/

