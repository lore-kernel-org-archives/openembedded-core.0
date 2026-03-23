Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3391DD58CDF
	for <webhook@archiver.kernel.org>; Mon, 23 Mar 2026 06:03:03 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11280.1774245778912205004
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 Mar 2026 23:02:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=O6SAUrJs;
 spf=pass (domain: smile.fr, ip: 209.85.221.46, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-43b527ac5d0so1135151f8f.2
        for <openembedded-core@lists.openembedded.org>; Sun, 22 Mar 2026 23:02:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1774245777; x=1774850577; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1m8cGRjNmaJW8pS3BU7d6CWEGjQrvPT7cQjIiA80Y5g=;
        b=O6SAUrJsMRGJd4lH3qxdXc5pWDpN0MlbPqByEV5twChkdgO1Fw0cEu4ujfrizpCo5s
         gwcybxtCfwRXU/Si/zY8sEHBPD3Ca8fRCuMeraZpKgvByIIZNUo3nsdIGKzwZz5VsPbd
         WBJsdVKuzwjVgNt63IksBmS1Z92ltHWqHuJDw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774245777; x=1774850577;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1m8cGRjNmaJW8pS3BU7d6CWEGjQrvPT7cQjIiA80Y5g=;
        b=V4yyTytRYRz6DFua6qzlJhTW9pj4BV/D/Aqo0q96brxGNPtvD31LBZzwOSle0qSbTF
         gJZsZ67lI8mwM/GgbZj7JSy/62nIYYrjContV6sRnEd7jaosQuUU+RkXEk9a01Q3rlBp
         zV+8N01tK76R3KSM0o7pgMI/Vi4sKP/ZdQjZ0/f8dPvF4zLkGMnQvEHupupwvvRFqT0g
         AI4Dsrb2Ywvnxi2avXy+wziijPgYUFJQNawtIJfxIg6lISxJwWQG6ShgM5I0g042cwT5
         0bGYlECZEYhWnhfqgrrdWoDL0GuKzqtjkevnMANIhfIZezXT1YgMly1Ef5Vt9rDECQPq
         lcpg==
X-Gm-Message-State: AOJu0YxeZYGYKqP7N0AEtT61FfaE1pYHJ3CVP7YCl/SD8NtTEXptyNJV
	XsS4L75oQIqJCAeletQa6f10rjfogcwQsVQjo3PcSXz+ECbpk+3eQhI5o+67YzoDSn79NT48U35
	yrNlB
X-Gm-Gg: ATEYQzwBeQzhGHStYBlOhdUCsMhcceCDXL/zHARscipavwzzBTSjAKK5tLEmCV4pBSr
	9C5Q/6z2wlWAoMfsdTI5StsT7GQO+xp2enP6h3Vi9agmh7UKdvC+c0yRlg3GkE5+ohSTRBloAf8
	hUu0bP8vfXghOtqCPbFcUeMu6t9ovlNbstw2/N2JZ7rggKYw20858AcFrdfL6qCDDepSU/lpfkr
	uf0FlBsyDkqrts9fchCUhejDLLkdy1i8PotD+By2Xifm7UKIZHv625Rs1we/Wmr9NQMdr4ulGvZ
	3Gg/Y67k7YJX7M0DV4GiwW7NWfpE2ucu1LRRcQ6rEDP2421G+KaryXvPAZndHjFaCvA4qyJoF/8
	1ib2ZyxS1dVDx+omfQwgi3xgrzi758e5iTygG7WKeVLjItnzOA/Wow64i2n77+DbmxXP+Qtw6vc
	+G8scF5uhXHBgaHRvdXAU3XkYI6UVlLYvym7gzs1LpDot4yet2KZtUwtdaFLi1fIPIseIsrXLGf
	7n+2Alvu041p4u7Gj6jvjO6rP8=
X-Received: by 2002:a5d:5f55:0:b0:43b:45f5:eec with SMTP id ffacd0b85a97d-43b6423fc34mr17390605f8f.4.1774245776894;
        Sun, 22 Mar 2026 23:02:56 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b646b0d3dsm25959551f8f.16.2026.03.22.23.02.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Mar 2026 23:02:56 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: OE-Core ML <openembedded-core@lists.openembedded.org>,
	Yocto Security ML <yocto-security@lists.yoctoproject.org>
Subject: OE-core CVE metrics for master on Sun Mar 22 23:46:56 2026
Date: Mon, 23 Mar 2026 07:02:13 +0100
Message-ID: <20260323060213.17514-4-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260323060213.17514-1-yoann.congal@smile.fr>
References: <20260323060213.17514-1-yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Mar 2026 06:03:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233700

Branch: master

New this week: 21 CVEs
CVE-2025-69693 (CVSS3: N/A): ffmpeg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-69693 *
CVE-2026-23231 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23231 *
CVE-2026-2920 (CVSS3: N/A): gstreamer1.0 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-2920 *
CVE-2026-2921 (CVSS3: N/A): gstreamer1.0 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-2921 *
CVE-2026-2922 (CVSS3: N/A): gstreamer1.0 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-2922 *
CVE-2026-2923 (CVSS3: N/A): gstreamer1.0 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-2923 *
CVE-2026-3081 (CVSS3: N/A): gstreamer1.0 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-3081 *
CVE-2026-3082 (CVSS3: N/A): gstreamer1.0 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-3082 *
CVE-2026-3083 (CVSS3: N/A): gstreamer1.0 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-3083 *
CVE-2026-3084 (CVSS3: N/A): gstreamer1.0 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-3084 *
CVE-2026-3085 (CVSS3: N/A): gstreamer1.0 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-3085 *
CVE-2026-3086 (CVSS3: N/A): gstreamer1.0 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-3086 *
CVE-2026-32776 (CVSS3: N/A): expat:expat-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-32776 *
CVE-2026-32777 (CVSS3: N/A): expat:expat-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-32777 *
CVE-2026-32778 (CVSS3: N/A): expat:expat-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-32778 *
CVE-2026-3441 (CVSS3: N/A): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-3441 *
CVE-2026-3442 (CVSS3: N/A): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-3442 *
CVE-2026-3632 (CVSS3: N/A): libsoup https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-3632 *
CVE-2026-3633 (CVSS3: N/A): libsoup https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-3633 *
CVE-2026-3634 (CVSS3: N/A): libsoup https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-3634 *
CVE-2026-4271 (CVSS3: N/A): libsoup https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-4271 *

Removed this week: 3 CVEs
CVE-2026-1965 (CVSS3: N/A): curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-1965 *
CVE-2026-3783 (CVSS3: N/A): curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-3783 *
CVE-2026-3805 (CVSS3: N/A): curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-3805 *

Full list:  Found 42 unpatched CVEs
CVE-2019-14899 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-14899 *
CVE-2021-3714 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3714 *
CVE-2021-3864 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3864 *
CVE-2022-0400 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0400 *
CVE-2022-1247 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1247 *
CVE-2022-4543 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-4543 *
CVE-2023-3397 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3397 *
CVE-2023-3640 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3640 *
CVE-2023-4010 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4010 *
CVE-2023-6238 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6238 *
CVE-2023-6240 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6240 *
CVE-2024-50613 (CVSS3: N/A): libsndfile1 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-50613 *
CVE-2024-6519 (CVSS3: N/A): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-6519 *
CVE-2025-12801 (CVSS3: N/A): nfs-utils https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-12801 *
CVE-2025-52194 (CVSS3: N/A): libsndfile1 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-52194 *
CVE-2025-59529 (CVSS3: N/A): avahi https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-59529 *
CVE-2025-61662 (CVSS3: N/A): grub:grub-efi:grub-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-61662 *
CVE-2025-69649 (CVSS3: N/A): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-69649 *
CVE-2025-69650 (CVSS3: N/A): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-69650 *
CVE-2025-69651 (CVSS3: N/A): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-69651 *
CVE-2025-69652 (CVSS3: N/A): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-69652 *
CVE-2025-69693 (CVSS3: N/A): ffmpeg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-69693 *
CVE-2026-23231 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23231 *
CVE-2026-2920 (CVSS3: N/A): gstreamer1.0 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-2920 *
CVE-2026-2921 (CVSS3: N/A): gstreamer1.0 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-2921 *
CVE-2026-2922 (CVSS3: N/A): gstreamer1.0 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-2922 *
CVE-2026-2923 (CVSS3: N/A): gstreamer1.0 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-2923 *
CVE-2026-3081 (CVSS3: N/A): gstreamer1.0 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-3081 *
CVE-2026-3082 (CVSS3: N/A): gstreamer1.0 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-3082 *
CVE-2026-3083 (CVSS3: N/A): gstreamer1.0 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-3083 *
CVE-2026-3084 (CVSS3: N/A): gstreamer1.0 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-3084 *
CVE-2026-3085 (CVSS3: N/A): gstreamer1.0 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-3085 *
CVE-2026-3086 (CVSS3: N/A): gstreamer1.0 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-3086 *
CVE-2026-32776 (CVSS3: N/A): expat:expat-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-32776 *
CVE-2026-32777 (CVSS3: N/A): expat:expat-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-32777 *
CVE-2026-32778 (CVSS3: N/A): expat:expat-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-32778 *
CVE-2026-3441 (CVSS3: N/A): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-3441 *
CVE-2026-3442 (CVSS3: N/A): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-3442 *
CVE-2026-3632 (CVSS3: N/A): libsoup https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-3632 *
CVE-2026-3633 (CVSS3: N/A): libsoup https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-3633 *
CVE-2026-3634 (CVSS3: N/A): libsoup https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-3634 *
CVE-2026-4271 (CVSS3: N/A): libsoup https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-4271 *

Summary of CVE counts by recipe:
  linux-yocto: 12
  gstreamer1.0: 10
  binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite: 6
  libsoup: 4
  expat:expat-native: 3
  libsndfile1: 2
  avahi: 1
  ffmpeg: 1
  grub:grub-efi:grub-native: 1
  nfs-utils: 1
  qemu:qemu-native:qemu-system-native: 1

For further information see: https://valkyrie.yocto.io/pub/non-release/patchmetrics/

