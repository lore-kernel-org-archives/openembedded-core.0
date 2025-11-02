Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82860CCFA02
	for <webhook@archiver.kernel.org>; Sun,  2 Nov 2025 11:02:34 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8070.1762081350032949495
 for <openembedded-core@lists.openembedded.org>;
 Sun, 02 Nov 2025 03:02:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=imO/irNt;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.179, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-782e93932ffso3431023b3a.3
        for <openembedded-core@lists.openembedded.org>; Sun, 02 Nov 2025 03:02:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1762081349; x=1762686149; darn=lists.openembedded.org;
        h=message-id:date:user-agent:to:from:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ebJvmrZyGs3mNUVV4JKm4o/biihlnpxdW3dmjFQ0cLo=;
        b=imO/irNtdn2cIqHOCxcyF61F2h4Zu19G39ck2PQ+IxA7lUWgIHWYrL82rMZ9to/kGG
         SDeieOVJmhCe2IuqMS/yLNwb6nHDFaMXSpWjlzXspcofIQfIoANlg0b0Sscym/WRdyGg
         3p9u7VBeWUFC0C92uEPF2hf3/bnWYI5R04YFN8ZhOO7F1urNvdYYfUTzSxi9NixAGuKl
         PemqqxMntoZySBFXMrILhGv1OwkNLixY8usAxFYYUjiy11+WB9Q8/iQbzztKirBT7Irn
         eNR2oQ2NQnh7PpKifZit5wFGRJyJ9NcKuwJFjSV9jvgt/IK43lqtDdzSBiMyT8j3lqPt
         F2Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762081349; x=1762686149;
        h=message-id:date:user-agent:to:from:subject:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ebJvmrZyGs3mNUVV4JKm4o/biihlnpxdW3dmjFQ0cLo=;
        b=YTD6/zcdbO1NXha154CI6e0WA0vRA0XuZsh3o9kitkB56HIYvIriABXWxO8XFthrCo
         xBmd0R9D2c58JmUGpawpcdMka3DQbCQTvnLLSa5taYX3RlzDv9VXVXEGP4SjcWhmc0vw
         ByAA+zP10LMZtlfkYGs7b5IPaQrldj/yy/C3kMT5PeNbWoANxYUGdHGaLL6PdrXQpnh7
         ji84v2HTTHEfMv28jxKiyvspc6k6Z+/QPYM3Qbq4r4fs9XmHqTlyCgEPQ3oXLpW/Os7i
         el6u/hgHN0H6si2ZwZO5Js0/cbk8hC1bpgHQnxIyddnic3KWX62NpC9p074ScWJoHz8G
         +4WA==
X-Gm-Message-State: AOJu0YwJS0EGkapKzoo9OEy+96Qe1clV3zovTi1nc6v89gO+K0nwk35G
	1afnNz+M2IhJM03JYNvdsVylm0Frcf895004hteveSKO64QdY1ZySAcPLEZGi05ZEkp5RR7gL9x
	GCXyg
X-Gm-Gg: ASbGncvu58mQmzEqXrcChmGQpXN9mpJKOTtlO9a05KQmQh5Aw8Gu5UMQkitV3re6oZJ
	i3mRsHw1igL5TCKWFeRwmuJQJXqolPilGn7EEb4voy5O0ut95/PUXupiSs0or7SExediVf20dzA
	icNsmx9rL4+50RFgd0VKcWcsfu1vql9Eja68TOPanQ4o3AWZJ3PuvtD6TzOrJcllcIqrdMUauf2
	z0hvoI1yGGMsBe17RJoF9bJzzjGyLZYeiMcy59IIVmNd7ck3rgWfNcqhUGVvECI91nlb71Jhorx
	mfZUy/Zi5cA/bmCTYM6a5w7JV1kRTkF0PE2xphJEP7bYiSVwpPaToS847OVXAQOIOc024D1AcF1
	TVUYUD1EEvI1O/2AIdMgJ1q9K96P6RGwn5qHNTVKWzj+d+CZAfphwWdHjkEqJ1e9LYcAkhbifzs
	IiewltMpU44ZDEim5qFXFaqXERXQ==
X-Google-Smtp-Source: AGHT+IG2XRGOmpvXcYTu83BM8FTuz14Hrtz4SFOEg6GAtSsZAWgCZHGIQdvsqIjIj4zTo+wYd1+7Pg==
X-Received: by 2002:a05:6a00:92a4:b0:7a2:7157:6d95 with SMTP id d2e1a72fcca58-7a777952b44mr11932631b3a.14.1762081348685;
        Sun, 02 Nov 2025 03:02:28 -0800 (PST)
Received: from builder.sakoman.com ([71.19.246.55])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7aa46f0e679sm1685378b3a.5.2025.11.02.03.02.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Nov 2025 03:02:28 -0800 (PST)
Received: by builder.sakoman.com (Postfix, from userid 1001)
	id C5DE51003DE; Sun,  2 Nov 2025 01:02:27 -1000 (HST)
Subject: OE-core CVE metrics for master on Sun 02 Nov 2025 01:00:01 AM HST
FROM: steve@sakoman.com
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
User-Agent: mail (GNU Mailutils 3.14)
Date: Sun,  2 Nov 2025 01:02:27 -1000
Message-Id: <20251102110227.C5DE51003DE@builder.sakoman.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 02 Nov 2025 11:02:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225573

Branch: master

New this week: 0 CVEs

Removed this week: 5 CVEs
CVE-2024-8354 (CVSS3: N/A): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-8354 *
CVE-2025-11412 (CVSS3: N/A): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-11412 *
CVE-2025-11413 (CVSS3: N/A): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-11413 *
CVE-2025-11414 (CVSS3: N/A): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-11414 *
CVE-2025-11495 (CVSS3: N/A): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-11495 *

Full list:  Found 25 unpatched CVEs
CVE-2019-14899 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-14899 *
CVE-2021-3714 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3714 *
CVE-2021-3864 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3864 *
CVE-2022-0400 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0400 *
CVE-2022-1247 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1247 *
CVE-2022-38096 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-38096 *
CVE-2022-4543 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-4543 *
CVE-2023-3397 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3397 *
CVE-2023-3640 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3640 *
CVE-2023-39176 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-39176 *
CVE-2023-39179 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-39179 *
CVE-2023-39180 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-39180 *
CVE-2023-4010 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4010 *
CVE-2023-6238 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6238 *
CVE-2023-6240 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6240 *
CVE-2023-6535 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6535 *
CVE-2024-50613 (CVSS3: N/A): libsndfile1 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-50613 *
CVE-2024-6519 (CVSS3: N/A): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-6519 *
CVE-2025-11494 (CVSS3: N/A): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-11494 *
CVE-2025-11839 (CVSS3: N/A): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-11839 *
CVE-2025-11840 (CVSS3: N/A): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-11840 *
CVE-2025-29087 (CVSS3: N/A): sqlite3:sqlite3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-29087 *
CVE-2025-3277 (CVSS3: N/A): sqlite3:sqlite3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-3277 *
CVE-2025-52194 (CVSS3: N/A): libsndfile1 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-52194 *
CVE-2025-6965 (CVSS3: N/A): sqlite3:sqlite3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-6965 *

Summary of CVE counts by recipe:
  linux-yocto: 16
  binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite: 3
  sqlite3:sqlite3-native: 3
  libsndfile1: 2
  qemu:qemu-native:qemu-system-native: 1

For further information see: https://valkyrie.yocto.io/pub/non-release/patchmetrics/

