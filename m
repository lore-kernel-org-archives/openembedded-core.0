Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 021B1C47422
	for <webhook@archiver.kernel.org>; Sun, 21 Jan 2024 11:18:53 +0000 (UTC)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
 by mx.groups.io with SMTP id smtpd.web10.45253.1705835924198178900
 for <openembedded-core@lists.openembedded.org>;
 Sun, 21 Jan 2024 03:18:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=ybwuCaGJ;
 spf=softfail (domain: sakoman.com, ip: 209.85.222.181, mailfrom: steve@sakoman.com)
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-7837ead0f53so135299685a.1
        for <openembedded-core@lists.openembedded.org>; Sun, 21 Jan 2024 03:18:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1705835922; x=1706440722; darn=lists.openembedded.org;
        h=message-id:date:user-agent:to:from:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gP+HdofuDXEUvkLclK3tzDbJGariiFYCjMd0LAHSfKE=;
        b=ybwuCaGJG4sStLggr6efoZewzanJLshMrK/nZRccACIrjHEDV2+e2AEHJouhxTg6xF
         XcPCpdFZyYIZjx07ChTvPnzO+gCUM39ayTMGo1z6UENzgkJ0mJbkalvr5dpVIGmSRY0p
         v/rfEPfBE1Iv/nG6DM8vVAxuGTtC9Zpjx3YXvzxqRItLL35jvg2gdhkmWHcYMTSOf7ns
         gDptSIvCVPvdAHPJMTONtWACrTMigE6ZP5fScyqv9iPaXzkY7oZwDPXw56zGYwtPmK7F
         GSa7bzulsXC8Ph2yo5Rr6avwtvuXcyrLeSBc+pdSCEpjvFZarzP7DZDUE4ZAnDrrX8jx
         COOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705835922; x=1706440722;
        h=message-id:date:user-agent:to:from:subject:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gP+HdofuDXEUvkLclK3tzDbJGariiFYCjMd0LAHSfKE=;
        b=VPvgHdlOrUU/pNY7/qm7n3mIg/+tlxEN6mk3qUlHfxTLAXmZ/hC9q73iKm0xK4sdHH
         ntFayF5onoi4hnQRdFRsVlOnHOZmZZsGb7Mj02lV9wEB4EXC9kJEnWi0V79rWgpTqiXF
         TT8uyhL9cM5ZG4IgVQLXBHbJZchT/DmTdEahb16CiYd6F0Qsd3fWUiEig+YD3XcluxFt
         m8BOmApPUxEhQ1FtWBb/2C5QMMsfO9GrUvqt3NcF/fJOVZirojEE5hcNB1myUu0p6KJG
         wPnJSiIKhG9J5oNF97B57Kn8CreVxtmI9oZvV7/iuLN+nXRHZs8KTIXYyC2R9BecVduG
         XxZw==
X-Gm-Message-State: AOJu0YyDbgA0WclMopfbXUeGyOHwfQVJXwEeaCg/85vrRoCuMf/Rgo3T
	b1CPwfwtoNbpYT/o9fYH9x8bDLqva14ERUQMHVNs/jbIyzHDLSmAP00VGCTB1fluVjq4cLP5228
	QnEE=
X-Google-Smtp-Source: AGHT+IFZlrK2OIAthjO583pjdWw98UtPK5MMYTcV/V6a3H6A6iCn6xc2RELQChw/qJhJh30NUOnbFQ==
X-Received: by 2002:a05:620a:2212:b0:783:3409:f6d with SMTP id m18-20020a05620a221200b0078334090f6dmr3242901qkh.134.1705835922344;
        Sun, 21 Jan 2024 03:18:42 -0800 (PST)
Received: from builder.sakoman.com ([71.19.246.55])
        by smtp.gmail.com with ESMTPSA id e5-20020a05620a12c500b007815e176d44sm1297775qkl.64.2024.01.21.03.18.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jan 2024 03:18:42 -0800 (PST)
Received: by builder.sakoman.com (Postfix, from userid 1001)
	id BFB881069A4; Sun, 21 Jan 2024 01:18:40 -1000 (HST)
Subject: OE-core CVE metrics for master on Sun 21 Jan 2024 01:00:01 AM HST
FROM: steve@sakoman.com
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
User-Agent: mail (GNU Mailutils 3.14)
Date: Sun, 21 Jan 2024 01:18:40 -1000
Message-Id: <20240121111840.BFB881069A4@builder.sakoman.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 21 Jan 2024 11:18:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194089

Branch: master

New this week: 0 CVEs

Removed this week: 2 CVEs
CVE-2023-6377 (CVSS3: 7.8 HIGH): xserver-xorg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6377 *
CVE-2023-6478 (CVSS3: 7.5 HIGH): xserver-xorg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6478 *

Full list:  Found 39 unpatched CVEs
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
CVE-2023-1386 (CVSS3: 7.8 HIGH): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-1386 *
CVE-2023-25584 (CVSS3: 7.1 HIGH): binutils:binutils-cross-testsuite:binutils-cross-x86_64:binutils-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-25584 *
CVE-2023-3019 (CVSS3: 6.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3019 *
CVE-2023-3397 (CVSS3: 6.3 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3397 *
CVE-2023-3640 (CVSS3: 7.8 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3640 *
CVE-2023-38559 (CVSS3: 5.5 MEDIUM): ghostscript https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-38559 *
CVE-2023-4010 (CVSS3: 4.6 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4010 *
CVE-2023-4039 (CVSS3: 4.8 MEDIUM): gcc:gcc-cross-x86_64:gcc-runtime:gcc-sanitizers:libgcc:libgcc-initial https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4039 *
CVE-2023-42363 (CVSS3: 5.5 MEDIUM): busybox https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-42363 *
CVE-2023-42364 (CVSS3: 5.5 MEDIUM): busybox https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-42364 *
CVE-2023-42365 (CVSS3: 5.5 MEDIUM): busybox https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-42365 *
CVE-2023-42366 (CVSS3: 5.5 MEDIUM): busybox https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-42366 *
CVE-2023-46407 (CVSS3: 5.5 MEDIUM): ffmpeg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-46407 *
CVE-2023-48795 (CVSS3: 5.9 MEDIUM): libssh2:libssh2-native:openssh https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-48795 *
CVE-2023-5088 (CVSS3: 7.0 HIGH): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-5088 *
CVE-2023-51384 (CVSS3: 5.5 MEDIUM): openssh https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-51384 *
CVE-2023-51385 (CVSS3: 6.5 MEDIUM): openssh https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-51385 *
CVE-2023-51767 (CVSS3: 7.0 HIGH): openssh https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-51767 *
CVE-2023-5574 (CVSS3: 7.0 HIGH): xserver-xorg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-5574 *
CVE-2023-6228 (CVSS3: 5.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6228 *
CVE-2023-6238 (CVSS3: 7.8 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6238 *
CVE-2023-6270 (CVSS3: 7.0 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6270 *
CVE-2023-6606 (CVSS3: 7.1 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6606 *
CVE-2023-6610 (CVSS3: 7.1 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6610 *
CVE-2023-6679 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6679 *
CVE-2023-6693 (CVSS3: 5.3 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6693 *
CVE-2023-6992 (CVSS3: 5.5 MEDIUM): zlib:zlib-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6992 *
CVE-2023-7042 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-7042 *
CVE-2024-0193 (CVSS3: 6.7 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-0193 *

For further information see: https://autobuilder.yocto.io/pub/non-release/patchmetrics/

