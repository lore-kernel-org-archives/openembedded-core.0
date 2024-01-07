Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18ED3C47073
	for <webhook@archiver.kernel.org>; Sun,  7 Jan 2024 13:19:42 +0000 (UTC)
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
 by mx.groups.io with SMTP id smtpd.web11.14771.1704633572444483810
 for <openembedded-core@lists.openembedded.org>;
 Sun, 07 Jan 2024 05:19:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=NCYUFXZR;
 spf=softfail (domain: sakoman.com, ip: 209.85.222.171, mailfrom: steve@sakoman.com)
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-78315243c11so76662185a.3
        for <openembedded-core@lists.openembedded.org>; Sun, 07 Jan 2024 05:19:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1704633571; x=1705238371; darn=lists.openembedded.org;
        h=message-id:date:user-agent:to:from:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tk9Opqlq7YGpU8sYs1SCLbd4kPb/apiTRiZ6ETN1yvM=;
        b=NCYUFXZROSbb4K/aD42zoLg+WA+oyYXs0ZR6wHjzEmUlf+XdQPIgdWVKOGPrMsU3P3
         +KdUOYpS5VwQ7JdEPI2O6JqXrbKVQeQww4l+J1UBmRlug1k/vBd+2JIxfsvClnLDHhZn
         TJoF08Sa5otgb1M5rvs1BKYEpHFjt+ldCUKfJGNqlYg95T6jZqPuk7XG2+tUkYfkiQ9L
         6wN1Wnccx1tVGJrDts4NbjbXAN8yx23yzmwQZY6fFh61MHipsCJHM+CHJaw6RGxFhWv3
         GXtHsI59raKIRxoDADFCrMyM5RTmst2uI3Hoa9mMDbLzZD8VsJHfSPQ8axupHorctr3g
         n4yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704633571; x=1705238371;
        h=message-id:date:user-agent:to:from:subject:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tk9Opqlq7YGpU8sYs1SCLbd4kPb/apiTRiZ6ETN1yvM=;
        b=oiaAQy2KmT5crMF2G+JO9afHcU8GMi8lJv1GbbiF4Ba+ex8V40ZrjV5vq0ddHu2OTR
         sOYjq/Yt76eK1NsCDQC2Uj1d3F54Qd8lf24z7B406r5qRLG0yvlskvs28hpj91pipS94
         NMr/MC28HEviyCc4Tee9U2t9KzQt6aYUAu3bPGYYNmLfDacAMC3reoVIzFgRJ4vUozUS
         Y/NQLqaxNMlmm6YIqfQtJetrue+6jEygaDt7QB+6KRVdR8B57oJDYZBHcOGqwEM9fImC
         nT/A6ban0HA5Oex1WjtCAGadvxLRfud9JfCQtFg+5rnm0iT/k+/ZH04OMsm4tCt47BmN
         pbCQ==
X-Gm-Message-State: AOJu0YyFLkOXwq//K+QMr25AKa2KUtEI1vnAnrdfm//Uvc6h6hBRy3PD
	ktTTjyddH1/0X4o0pff40IKzkRBXt077eN2RPuw/osFo7sq1Rw==
X-Google-Smtp-Source: AGHT+IG4X82IKFml/YB9/eE/qu0ypVq5C6p2XSsNx0DRXMQyW5cqVLKHGAMTdAjn1a1+ZnbNLlZs7w==
X-Received: by 2002:ae9:f20d:0:b0:781:5844:aa45 with SMTP id m13-20020ae9f20d000000b007815844aa45mr2271981qkg.108.1704633570561;
        Sun, 07 Jan 2024 05:19:30 -0800 (PST)
Received: from builder.sakoman.com ([71.19.246.55])
        by smtp.gmail.com with ESMTPSA id 22-20020a05620a04d600b007831b08c01fsm478007qks.109.2024.01.07.05.19.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jan 2024 05:19:30 -0800 (PST)
Received: by builder.sakoman.com (Postfix, from userid 1001)
	id 09777106961; Sun,  7 Jan 2024 03:19:29 -1000 (HST)
Subject: OE-core CVE metrics for kirkstone on Sun 07 Jan 2024 03:00:01 AM HST
FROM: steve@sakoman.com
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
User-Agent: mail (GNU Mailutils 3.14)
Date: Sun,  7 Jan 2024 03:19:29 -1000
Message-Id: <20240107131929.09777106961@builder.sakoman.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 07 Jan 2024 13:19:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193386

Branch: kirkstone

New this week: 3 CVEs
CVE-2023-51767 (CVSS3: 7.0 HIGH): openssh https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-51767 *
CVE-2023-6918 (CVSS3: 5.3 MEDIUM): libssh2:libssh2-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6918 *
CVE-2023-7104 (CVSS3: 9.8 CRITICAL): sqlite3:sqlite3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-7104 *

Removed this week: 2 CVEs
CVE-2023-51384 (CVSS3: 5.5 MEDIUM): openssh https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-51384 *
CVE-2023-51385 (CVSS3: 6.5 MEDIUM): openssh https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-51385 *

Full list:  Found 38 unpatched CVEs
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
CVE-2023-6377 (CVSS3: 7.8 HIGH): xserver-xorg:xwayland https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6377 *
CVE-2023-6478 (CVSS3: 7.5 HIGH): xserver-xorg:xwayland https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6478 *
CVE-2023-6918 (CVSS3: 5.3 MEDIUM): libssh2:libssh2-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6918 *
CVE-2023-7104 (CVSS3: 9.8 CRITICAL): sqlite3:sqlite3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-7104 *

For further information see: https://autobuilder.yocto.io/pub/non-release/patchmetrics/

