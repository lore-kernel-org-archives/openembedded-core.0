Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33302E95A82
	for <webhook@archiver.kernel.org>; Sun,  8 Oct 2023 11:17:49 +0000 (UTC)
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
 by mx.groups.io with SMTP id smtpd.web10.36167.1696763860795599815
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 Oct 2023 04:17:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=lBvuxLJH;
 spf=softfail (domain: sakoman.com, ip: 209.85.222.179, mailfrom: steve@sakoman.com)
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-77433e7a876so246130985a.3
        for <openembedded-core@lists.openembedded.org>; Sun, 08 Oct 2023 04:17:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1696763859; x=1697368659; darn=lists.openembedded.org;
        h=message-id:date:user-agent:to:from:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GM/w8G1OcZPtCS+icBmMQX6k5C0/GhPV5qSDL6vF3Uo=;
        b=lBvuxLJHqv21TSOalQT6haoe5LFYN1vl3Iadctu+v02HuaIFAgvMwiyV4YMhmzU+h8
         RO35rL6pfSjZ9vnjrxB0Sxpk0Ygkdl2zAQlny9nkd8OXeOYMtEFRTOwpaLw1mbkBAGuz
         Rj1hoTHiZn0LtLAcNAMsCCPwiyDgmrfKKRt0VIXChEjrGEa0CI6OkeYL/LJrnFzbOV9x
         gwom+Zubhqn6erpBI3OnSKFexrZ+cnuguLRksOYO8KZK3heegTWTOq5Vr1gwG+8gaUED
         rap6zxsW1RwBaSJYF+c3wUmGADqZoE14mHE+g8QPBUn+xEBvOWOxSSViCUT2KYNeAN4C
         I6qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696763859; x=1697368659;
        h=message-id:date:user-agent:to:from:subject:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GM/w8G1OcZPtCS+icBmMQX6k5C0/GhPV5qSDL6vF3Uo=;
        b=tipiGGwu0d5HGS+tzHCeV9RKZWvaXPSfmxmNYis/vIOb2YnGLpje7t9WwypdAXcpuH
         r1qm1RBIykfU7Rn8XOdCK6/voHrv6NqjXlagx4O/iHsssgthrgpvSS5MGmRFe2pXUvxj
         Ge4ujGUt5q2VNmHRNICn5CbMakgG44Do9UjeOGr0B3pOV4sNTE9nwLC4Ze3GMPjV7LTg
         Dt6RjQGSUzLifS2J8nU5Kr+bSK3VbSumOl1cKzz59DcPaNYNN9Ae/NsBWjfz2WAEiglQ
         6a05ftz3z5QFXk2D+TwvHNRmXFq8WNpMUcD7a5MN6rGtx7HQMu8nfcn6CLqsGchLBxv5
         RAnA==
X-Gm-Message-State: AOJu0YwLwfhe8zy2Dk0b9+uDAB6Y5Fmtdf6q1Vv7xV8J060AJix0xHwr
	RiHbpj2xgFiHBzXfzQAPh9mdAuJT6xURGsORpK/lWQ==
X-Google-Smtp-Source: AGHT+IFZzIo/5gxX8elOl2TlqG8cjtEwJe/ti4yaxQ8sh248K/mzJnpw7oGXVEqEB/OvSQ1eGkS7XA==
X-Received: by 2002:ae9:e013:0:b0:76d:aa23:f8e1 with SMTP id m19-20020ae9e013000000b0076daa23f8e1mr11733271qkk.27.1696763859413;
        Sun, 08 Oct 2023 04:17:39 -0700 (PDT)
Received: from builder.sakoman.com ([71.19.246.55])
        by smtp.gmail.com with ESMTPSA id da6-20020a05620a360600b0076db5b792basm2701888qkb.75.2023.10.08.04.17.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Oct 2023 04:17:38 -0700 (PDT)
Received: by builder.sakoman.com (Postfix, from userid 1001)
	id 60E9F106A3B; Sun,  8 Oct 2023 01:17:37 -1000 (HST)
Subject: OE-core CVE metrics for master on Sun 08 Oct 2023 01:00:01 AM HST
FROM: steve@sakoman.com
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
User-Agent: mail (GNU Mailutils 3.14)
Date: Sun,  8 Oct 2023 01:17:37 -1000
Message-Id: <20231008111737.60E9F106A3B@builder.sakoman.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 08 Oct 2023 11:17:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188822

Branch: master

New this week: 4 CVEs
CVE-2023-42756 (CVSS3: 4.7 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-42756 *
CVE-2023-5197 (CVSS3: 7.8 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-5197 *
CVE-2023-5344 (CVSS3: 7.5 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-5344 *
CVE-2023-5345 (CVSS3: 7.8 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-5345 *

Removed this week: 0 CVEs

Full list:  Found 33 unpatched CVEs
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
CVE-2023-1386 (CVSS3: 7.8 HIGH): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-1386 *
CVE-2023-25584 (CVSS3: 7.1 HIGH): binutils:binutils-cross-testsuite:binutils-cross-x86_64:binutils-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-25584 *
CVE-2023-2680 (CVSS3: 8.2 HIGH): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-2680 *
CVE-2023-3019 (CVSS3: 6.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3019 *
CVE-2023-3180 (CVSS3: 6.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3180 *
CVE-2023-3354 (CVSS3: 7.5 HIGH): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3354 *
CVE-2023-3640 (CVSS3: 7.8 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3640 *
CVE-2023-37769 (CVSS3: 6.5 MEDIUM): pixman:pixman-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-37769 *
CVE-2023-38559 (CVSS3: 5.5 MEDIUM): ghostscript https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-38559 *
CVE-2023-39318 (CVSS3: 6.1 MEDIUM): go:go-binary-native:go-cross-core2-64:go-runtime https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-39318 *
CVE-2023-39319 (CVSS3: 6.1 MEDIUM): go:go-binary-native:go-cross-core2-64:go-runtime https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-39319 *
CVE-2023-40030 (CVSS3: 6.1 MEDIUM): rust:rust-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-40030 *
CVE-2023-4010 (CVSS3: 4.6 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4010 *
CVE-2023-4039 (CVSS3: 4.8 MEDIUM): gcc:gcc-cross-x86_64:gcc-runtime:gcc-sanitizers:libgcc:libgcc-initial https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4039 *
CVE-2023-4135 (CVSS3: 6.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4135 *
CVE-2023-42756 (CVSS3: 4.7 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-42756 *
CVE-2023-4921 (CVSS3: 7.8 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4921 *
CVE-2023-5156 (CVSS3: 7.5 HIGH): glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-5156 *
CVE-2023-5197 (CVSS3: 7.8 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-5197 *
CVE-2023-5344 (CVSS3: 7.5 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-5344 *
CVE-2023-5345 (CVSS3: 7.8 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-5345 *

For further information see: https://autobuilder.yocto.io/pub/non-release/patchmetrics/

