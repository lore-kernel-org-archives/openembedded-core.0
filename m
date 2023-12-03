Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35B01C4167B
	for <webhook@archiver.kernel.org>; Sun,  3 Dec 2023 14:18:44 +0000 (UTC)
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
 by mx.groups.io with SMTP id smtpd.web10.39787.1701613117279192110
 for <openembedded-core@lists.openembedded.org>;
 Sun, 03 Dec 2023 06:18:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=mG1NqlQ0;
 spf=softfail (domain: sakoman.com, ip: 209.85.219.42, mailfrom: steve@sakoman.com)
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-677fba00a49so31586456d6.1
        for <openembedded-core@lists.openembedded.org>; Sun, 03 Dec 2023 06:18:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1701613115; x=1702217915; darn=lists.openembedded.org;
        h=message-id:date:user-agent:to:from:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jgTFFsz/faM0KrU6vqbmL2nDVbSCn/EhZVmjK+wbK8I=;
        b=mG1NqlQ0fEVYt+DNGRSADiP6XWy1V2C3kMHc23XAGy1tTJyGfYyuwhJgOMBF02PZ0Z
         LqI0qlKromAlrrTzf6aR3zJiAlJoONV2rC4AWbZle6VtJYKca4DjVxusa1QNMlsz2rZo
         lC1T4B8EuHIxLt/jiielOj/Ubs0clEza/VqJlO0jw70xBND+o8yI2NaIUvWafR2mEfli
         wKBVY/IJJkzFEvJdY2KBl0tWf87ynEsNhopsUeNeh1/qg0ZU+3DETiuEskyCWYu6Msru
         9ohykUbF0lcdS0xItV9pq42JLhglReK7/GFiZYb9rlmTYO8rsukWLfkDmucOLa9gTQ+K
         3DeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701613115; x=1702217915;
        h=message-id:date:user-agent:to:from:subject:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jgTFFsz/faM0KrU6vqbmL2nDVbSCn/EhZVmjK+wbK8I=;
        b=FJ2TEXV6yUii5xOJVbHvLk1VZxs3Q3Uu+TU+bPtCWMiWGK+5gW408UNwEsXPKMD+vd
         sFbUhZO89BqN2p/wxWe0HMjEYz0QVelKfxUtseCDOD4d+uYoG9Jzj9ybbjfuphWPQ3zK
         egxqtXoR1/lapKIyhPvym2W7wkx0e/Kg8u+IfevLa3IUMgWNE2WIgpZXhSbpOr6M5OZ6
         CH8Jc+exn1N8rRmxDO5rUgDDbllc/0awDJSrF/ACVRKeZj1qpiyWmlN9PSwPTpzS/svP
         ueHdg6snIOIUx4DDGvPg5Maqaj+H0TSEB/rcWy4TiwnuaL6XeTUoUmuIu4fQU5M4REtR
         awmw==
X-Gm-Message-State: AOJu0YzX+GfSUq4X5DST2cmNghZ/41MgyHAEQA/mlibz/s7PtWQUlWkv
	Q2gmrWp722yHoQ2hnTSpcxpvkbOEi8qyXRImM0bxYA==
X-Google-Smtp-Source: AGHT+IHgKTzxfl8YVZog1C5rHMiRks/BptXw+FThZQIidBOMesUMUP5gJbqcKAk66oLZqwqXgLekUQ==
X-Received: by 2002:a0c:eace:0:b0:67a:a721:7222 with SMTP id y14-20020a0ceace000000b0067aa7217222mr3187893qvp.63.1701613115463;
        Sun, 03 Dec 2023 06:18:35 -0800 (PST)
Received: from builder.sakoman.com ([71.19.246.55])
        by smtp.gmail.com with ESMTPSA id pz3-20020a05620a640300b0076c8fd39407sm3383613qkn.113.2023.12.03.06.18.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Dec 2023 06:18:35 -0800 (PST)
Received: by builder.sakoman.com (Postfix, from userid 1001)
	id D7C78106C01; Sun,  3 Dec 2023 04:18:33 -1000 (HST)
Subject: OE-core CVE metrics for nanbield on Sun 03 Dec 2023 04:00:01 AM HST
FROM: steve@sakoman.com
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
User-Agent: mail (GNU Mailutils 3.14)
Date: Sun,  3 Dec 2023 04:18:33 -1000
Message-Id: <20231203141833.D7C78106C01@builder.sakoman.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 03 Dec 2023 14:18:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191715

Branch: nanbield

New this week: 9 CVEs
CVE-2023-42363 (CVSS3: 5.5 MEDIUM): busybox https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-42363 *
CVE-2023-42364 (CVSS3: 5.5 MEDIUM): busybox https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-42364 *
CVE-2023-42365 (CVSS3: 5.5 MEDIUM): busybox https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-42365 *
CVE-2023-42366 (CVSS3: 5.5 MEDIUM): busybox https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-42366 *
CVE-2023-47470 (CVSS3: 7.8 HIGH): ffmpeg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-47470 *
CVE-2023-48706 (CVSS3: 4.7 MEDIUM): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-48706 *
CVE-2023-5972 (CVSS3: 7.8 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-5972 *
CVE-2023-6238 (CVSS3: 7.8 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6238 *
CVE-2023-6277 (CVSS3: 6.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6277 *

Removed this week: 0 CVEs

Full list:  Found 72 unpatched CVEs
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
CVE-2023-38469 (CVSS3: 5.5 MEDIUM): avahi https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-38469 *
CVE-2023-38470 (CVSS3: 5.5 MEDIUM): avahi https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-38470 *
CVE-2023-38471 (CVSS3: 5.5 MEDIUM): avahi https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-38471 *
CVE-2023-38472 (CVSS3: 5.5 MEDIUM): avahi https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-38472 *
CVE-2023-38473 (CVSS3: 5.5 MEDIUM): avahi https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-38473 *
CVE-2023-38559 (CVSS3: 5.5 MEDIUM): ghostscript https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-38559 *
CVE-2023-39189 (CVSS3: 6.0 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-39189 *
CVE-2023-39192 (CVSS3: 6.0 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-39192 *
CVE-2023-39193 (CVSS3: 6.0 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-39193 *
CVE-2023-39928 (CVSS3: 8.8 HIGH): webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-39928 *
CVE-2023-40030 (CVSS3: 6.1 MEDIUM): rust:rust-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-40030 *
CVE-2023-4010 (CVSS3: 4.6 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4010 *
CVE-2023-4039 (CVSS3: 4.8 MEDIUM): gcc:gcc-cross-x86_64:gcc-runtime:gcc-sanitizers:libgcc:libgcc-initial https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4039 *
CVE-2023-42363 (CVSS3: 5.5 MEDIUM): busybox https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-42363 *
CVE-2023-42364 (CVSS3: 5.5 MEDIUM): busybox https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-42364 *
CVE-2023-42365 (CVSS3: 5.5 MEDIUM): busybox https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-42365 *
CVE-2023-42366 (CVSS3: 5.5 MEDIUM): busybox https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-42366 *
CVE-2023-42752 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-42752 *
CVE-2023-42753 (CVSS3: 7.8 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-42753 *
CVE-2023-42754 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-42754 *
CVE-2023-42756 (CVSS3: 4.7 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-42756 *
CVE-2023-45283 (CVSS3: 7.5 HIGH): go:go-binary-native:go-cross-core2-64:go-runtime https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-45283 *
CVE-2023-45284 (CVSS3: 5.3 MEDIUM): go:go-binary-native:go-cross-core2-64:go-runtime https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-45284 *
CVE-2023-45803 (CVSS3: 4.2 MEDIUM): python3-urllib3 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-45803 *
CVE-2023-4623 (CVSS3: 7.8 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4623 *
CVE-2023-46407 (CVSS3: 5.5 MEDIUM): ffmpeg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-46407 *
CVE-2023-46813 (CVSS3: 7.0 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-46813 *
CVE-2023-46862 (CVSS3: 4.7 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-46862 *
CVE-2023-4692 (CVSS3: 7.8 HIGH): grub:grub-efi:grub-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4692 *
CVE-2023-4693 (CVSS3: 4.6 MEDIUM): grub:grub-efi:grub-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4693 *
CVE-2023-47233 (CVSS3: 4.3 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-47233 *
CVE-2023-47470 (CVSS3: 7.8 HIGH): ffmpeg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-47470 *
CVE-2023-48231 (CVSS3: 4.3 MEDIUM): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-48231 *
CVE-2023-48232 (CVSS3: 4.3 MEDIUM): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-48232 *
CVE-2023-48233 (CVSS3: 4.3 MEDIUM): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-48233 *
CVE-2023-48234 (CVSS3: 4.3 MEDIUM): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-48234 *
CVE-2023-48235 (CVSS3: 4.3 MEDIUM): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-48235 *
CVE-2023-48236 (CVSS3: 4.3 MEDIUM): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-48236 *
CVE-2023-48237 (CVSS3: 4.3 MEDIUM): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-48237 *
CVE-2023-48706 (CVSS3: 4.7 MEDIUM): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-48706 *
CVE-2023-4921 (CVSS3: 7.8 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4921 *
CVE-2023-5088 (CVSS3: 7.0 HIGH): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-5088 *
CVE-2023-5156 (CVSS3: 7.5 HIGH): glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-5156 *
CVE-2023-5178 (CVSS3: 8.8 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-5178 *
CVE-2023-5197 (CVSS3: 6.6 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-5197 *
CVE-2023-5345 (CVSS3: 7.8 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-5345 *
CVE-2023-5367 (CVSS3: 7.8 HIGH): xserver-xorg:xwayland https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-5367 *
CVE-2023-5380 (CVSS3: 4.7 MEDIUM): xserver-xorg:xwayland https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-5380 *
CVE-2023-5574 (CVSS3: 7.0 HIGH): xserver-xorg:xwayland https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-5574 *
CVE-2023-5633 (CVSS3: 7.8 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-5633 *
CVE-2023-5678 (CVSS3: 5.3 MEDIUM): openssl:openssl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-5678 *
CVE-2023-5717 (CVSS3: 7.8 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-5717 *
CVE-2023-5972 (CVSS3: 7.8 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-5972 *
CVE-2023-6176 (CVSS3: 7.8 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6176 *
CVE-2023-6238 (CVSS3: 7.8 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6238 *
CVE-2023-6277 (CVSS3: 6.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6277 *

For further information see: https://autobuilder.yocto.io/pub/non-release/patchmetrics/

