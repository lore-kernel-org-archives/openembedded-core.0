Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0A09E77188
	for <webhook@archiver.kernel.org>; Sun, 22 Dec 2024 11:21:06 +0000 (UTC)
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
 by mx.groups.io with SMTP id smtpd.web10.23169.1734866457538425836
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 Dec 2024 03:20:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=W0Bz8hL5;
 spf=softfail (domain: sakoman.com, ip: 209.85.160.176, mailfrom: steve@sakoman.com)
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-467b74a1754so43331131cf.1
        for <openembedded-core@lists.openembedded.org>; Sun, 22 Dec 2024 03:20:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1734866456; x=1735471256; darn=lists.openembedded.org;
        h=message-id:date:user-agent:to:from:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c3PHGTHnMTYtC8j/6RMczlrL9TpZYi+H/TFKMWdRV4c=;
        b=W0Bz8hL5H5cPJtWHgBJwn8K4q6Ivf6D9DNQgodPyauEvomh9ZynmFU7E4q3BmSihq/
         wxKi+ABTAOpcaIFM6HSKat/HTFJWJUR/Gi9vnb0NQtCwbQjsC9Fm+cEwOh+1hfVLgM1P
         uQQDPU1obSRizHV5Zdqbb2Kt+m+1jJ2r8ap6e1LlstekML1f1lndE0XlSi0CywnCcou6
         UhPVHCxs4t7ACMkNCawCebp12c9TzthIXYEBfWf8RUqoUki37bvH4i3bBcWg9aFFZf+6
         ZHEi2F18sC2x4olw0BVjud4KipUnLILebRYpK05BruhfJgktWbuz3sciteDa0vxAB3o3
         OE+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734866456; x=1735471256;
        h=message-id:date:user-agent:to:from:subject:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=c3PHGTHnMTYtC8j/6RMczlrL9TpZYi+H/TFKMWdRV4c=;
        b=U3rP+oS1+8swMLe/DSPyrFUzm2/gQDnYDpffsLGP6b5FtT4kedn7P0lQjuphXr+SAH
         AZo96O6zQExP28Td1+g+oshuBZPHNrUF05CCrQkQUxYVscQMzwJ9RPQrHrm2/0/+HaHW
         Ut2o40KdEzjtMOH5NnUg/abb9opPvAC8wYh0DtG7pzfAVyogELIXKB2L+gRVZKOhJc3S
         z6k5gegC70Yr3wYSlj64Pcyn0lEVuPDZqzf/tH6+LO/7JG+hzkdWsDm8QEJ5YL8mi2Vu
         hGbsmzkFy9klZyirANQg9hHD8XCAJd7WHcXf7Us/sq9nn6ELVnVoehpn5zO94MxX0AWE
         vzjw==
X-Gm-Message-State: AOJu0Yyg6qUXR6Kn0FAnTMfU5enqYZey3voT+w/RwjBOatAvyT/AJpIq
	WYQeDlT/9VfubUai+YAyqoD7EgjL27HAdITOHWR3Ih7LSeG3IRkmhOiBmHnc/FCe6uLXxIkPH6P
	DgYo=
X-Gm-Gg: ASbGncvn5YtcBHL2ceqQLnVL6IMjAIbSVh4kVXR8mRyl2Ne58/y3wnv+oHGgYkpR/O6
	18w0ABTyZN475ERSbjsYhj3iHrX9tTwj69d+9BbOQw86UhJKwIUOallTH9VTh0HOT9z9W4TAZK/
	2tyGhoVppMi/4oPagjJTC9N3iKHLxvqYKSASmbuF0DLB39I+89060+pDvEx4Ai3xB6UD+7cnjer
	W7vHUX0YZtj+SPm9/uf2Q07BRx2/8T2fs8NhorN5OvRU2S1Uo1LEEP3YAJh6A==
X-Google-Smtp-Source: AGHT+IGHXpM2rZaf4cfioAVUI/gFDlFMfl0SpL+Zrombhdirr/EiGAl8ZUqjAJTz3l2wbXPsASfkpA==
X-Received: by 2002:ac8:5992:0:b0:467:6833:e315 with SMTP id d75a77b69052e-46a4a8dcd54mr149057971cf.20.1734866456435;
        Sun, 22 Dec 2024 03:20:56 -0800 (PST)
Received: from builder.sakoman.com ([71.19.246.55])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b9ac30e30fsm294114585a.61.2024.12.22.03.20.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Dec 2024 03:20:56 -0800 (PST)
Received: by builder.sakoman.com (Postfix, from userid 1001)
	id BAED8100442; Sun, 22 Dec 2024 01:20:54 -1000 (HST)
Subject: OE-core CVE metrics for master on Sun 22 Dec 2024 01:00:01 AM HST
FROM: steve@sakoman.com
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
User-Agent: mail (GNU Mailutils 3.14)
Date: Sun, 22 Dec 2024 01:20:54 -1000
Message-Id: <20241222112054.BAED8100442@builder.sakoman.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 22 Dec 2024 11:21:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209001

Branch: master

New this week: 0 CVEs

Removed this week: 0 CVEs

Full list:  Found 18 unpatched CVEs
CVE-2019-14899 (CVSS3: 7.4 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-14899 *
CVE-2021-3714 (CVSS3: 5.9 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3714 *
CVE-2021-3864 (CVSS3: 7.0 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3864 *
CVE-2022-0400 (CVSS3: 7.5 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0400 *
CVE-2022-1247 (CVSS3: 7.0 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1247 *
CVE-2022-38096 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-38096 *
CVE-2022-4543 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-4543 *
CVE-2023-1386 (CVSS3: 7.8 HIGH): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-1386 *
CVE-2023-3397 (CVSS3: 6.3 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3397 *
CVE-2023-3640 (CVSS3: 7.8 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3640 *
CVE-2023-4010 (CVSS3: 4.6 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4010 *
CVE-2023-52904 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-52904 *
CVE-2023-6238 (CVSS3: 6.7 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6238 *
CVE-2023-6240 (CVSS3: 6.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6240 *
CVE-2023-6535 (CVSS3: 7.5 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6535 *
CVE-2024-38381 (CVSS3: 7.1 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-38381 *
CVE-2024-50613 (CVSS3: 6.5 MEDIUM): libsndfile1 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-50613 *
CVE-2024-8354 (CVSS3: 5.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-8354 *

Summary of CVE counts by recipe:
  linux-yocto: 15
  qemu:qemu-native:qemu-system-native: 2
  libsndfile1: 1

For further information see: https://autobuilder.yocto.io/pub/non-release/patchmetrics/

