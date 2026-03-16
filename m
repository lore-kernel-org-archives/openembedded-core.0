Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 782AEEFCBD4
	for <webhook@archiver.kernel.org>; Mon, 16 Mar 2026 07:24:23 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.45138.1773645853629978490
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Mar 2026 00:24:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=K3bmZa9c;
 spf=pass (domain: smile.fr, ip: 209.85.128.42, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4853c1ca73aso34370825e9.2
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Mar 2026 00:24:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1773645852; x=1774250652; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8/VXIR6QXZb/N8OWnRckTM90kXGZR2LhT9JDRnMaifc=;
        b=K3bmZa9ceG3w3kwILGKAD11WBkcgFYmL+KlQNIiKTclCyBeYg+ItmFwzylZBkl0yWk
         NHYDyl/SGEuIYaqz1Qo78vWpkbklYhMNzm0UmdZ30lmwz9/nIvYIb5C46gWc75Ysxopq
         GJajQ0Z1wXzi1fxxZBI0DgsgqXrfBUHT+GsMM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773645852; x=1774250652;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8/VXIR6QXZb/N8OWnRckTM90kXGZR2LhT9JDRnMaifc=;
        b=oqCOyrSFhWTjx6cGpAL82hZ7e4GE0IWXnRVsZg+JjHylaarvHUiGf9YBnFHrbLXHni
         jT6iLJY/DVa3BZFbh8MWkMmxikLIFapG3B/rXsEn1QPoNzZcPWhARumJxTq7qNQ6Qq0s
         9/WvoeCrfmLLgX+vTmC7TvXd8L7hwdHD6Z99O1ecwjwFw22dBFVD+wjP2n19xhSC4Pzv
         KdZOWoK2YX9LALz04zkHRthaYLhQSV9yLq1F/VBqhl8akgzVXobsU6Htf9ZtT1zLTezN
         9ton2JDajDV0EuykbxbVPDbkTdnUj1uIjgPuPrxAwhAHo768+wwimmBBCCnGQNfYusQ9
         ea3g==
X-Gm-Message-State: AOJu0Ywo2WjkATEriX9vlJ71uEqsmjj/KNhfggKouxQ6uHzYBQggx44P
	6qyM1haT8DadSIbg+JOHOnNRNGZKBKJdBRE4rWKDbRvjONFu6bMOqN26gkVUmE4nGCwOeQ1IjsF
	h+K7rmEM=
X-Gm-Gg: ATEYQzyPRob6mWcffHDU4lXe3je64enVsWgug5LtCZeItBfj6o8xoOg66b/sZdE8D/P
	snHvsBVm88wzr4eA9mEt/1oFpfT0Yq/x+wrvePe/uMdRwaq2neey/FPhdCW+Fa2brXc8c1PkuUa
	tPCYgBWfvcZH2NdyZd2z/FIA3rkwiRu+dnM5Dwnl0dGdK8t3ZchNHlwj47PSnmt6J34YLrfV631
	7OCuo1klnDLl9N4J1DAUfwWo/I37jKyaVJbfpmekKW7Fn1FQV8SlAIA5Qw6Y31xfpNXMrRhowbM
	4sO8+FojOwON7yef3jIFpuBuNnZl6LAdk0wS41zlUavYJyVh6rBlsaqIrLH1Ih8wHwh7sYNbDwj
	uG/dTSFwxW1vMaAbuW8gv6zTf0SC2LTMz+Eck1JiivOz46BhBZ6OGNnIX5ekEPr9WSENbYAH3k8
	BeVqCTaYYHB7jqbC4LPtioc2RosY2Vlf4SHsUjE6VYi0BW/hFw+prUwZzDIF+9MOdm6x7n/llgO
	F3Ln/oyiuCHx2c2uyvFqPvvfQYzzg==
X-Received: by 2002:a05:600c:3145:b0:480:3ad0:93c0 with SMTP id 5b1f17b1804b1-4855671ead8mr182249515e9.23.1773645851618;
        Mon, 16 Mar 2026 00:24:11 -0700 (PDT)
Received: from localhost.localdomain (2a02-8440-2509-819e-bcc9-bfb5-d85a-bcf1.rev.sfr.net. [2a02:8440:2509:819e:bcc9:bfb5:d85a:bcf1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4854b5f6bb4sm392678775e9.4.2026.03.16.00.24.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 00:24:11 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: OE-Core ML <openembedded-core@lists.openembedded.org>,
	Yocto Security ML <yocto-security@lists.yoctoproject.org>
Subject: OE-core CVE metrics for whinlatter on Sun Mar 15 10:03:18 2026
Date: Mon, 16 Mar 2026 08:24:02 +0100
Message-ID: <20260316072404.1987656-3-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260316072404.1987656-1-yoann.congal@smile.fr>
References: <20260316072404.1987656-1-yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Mar 2026 07:24:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233218

Branch: whinlatter

New this week: 22 CVEs
CVE-2025-12801 (CVSS3: N/A): nfs-utils https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-12801 *
CVE-2025-69644 (CVSS3: N/A): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-69644 *
CVE-2025-69647 (CVSS3: N/A): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-69647 *
CVE-2025-69648 (CVSS3: N/A): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-69648 *
CVE-2025-69649 (CVSS3: N/A): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-69649 *
CVE-2025-69650 (CVSS3: N/A): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-69650 *
CVE-2025-69651 (CVSS3: N/A): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-69651 *
CVE-2025-69652 (CVSS3: N/A): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-69652 *
CVE-2026-1965 (CVSS3: N/A): curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-1965 *
CVE-2026-23060 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23060 *
CVE-2026-23061 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23061 *
CVE-2026-23062 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23062 *
CVE-2026-23063 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23063 *
CVE-2026-23064 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23064 *
CVE-2026-23065 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23065 *
CVE-2026-23066 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23066 *
CVE-2026-23067 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23067 *
CVE-2026-23068 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23068 *
CVE-2026-23069 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23069 *
CVE-2026-3783 (CVSS3: N/A): curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-3783 *
CVE-2026-3784 (CVSS3: N/A): curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-3784 *
CVE-2026-3805 (CVSS3: N/A): curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-3805 *

Removed this week: 9 CVEs
CVE-2022-38096 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-38096 *
CVE-2023-39176 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-39176 *
CVE-2023-39179 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-39179 *
CVE-2023-39180 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-39180 *
CVE-2023-6535 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6535 *
CVE-2025-12343 (CVSS3: N/A): ffmpeg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-12343 *
CVE-2025-66471 (CVSS3: N/A): python3-urllib3:python3-urllib3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-66471 *
CVE-2026-22693 (CVSS3: N/A): harfbuzz:harfbuzz-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-22693 *
CVE-2026-27171 (CVSS3: N/A): zlib:zlib-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-27171 *

Full list:  Found 103 unpatched CVEs
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
CVE-2025-40039 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-40039 *
CVE-2025-40040 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-40040 *
CVE-2025-40082 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-40082 *
CVE-2025-40149 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-40149 *
CVE-2025-40164 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-40164 *
CVE-2025-40251 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-40251 *
CVE-2025-52194 (CVSS3: N/A): libsndfile1 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-52194 *
CVE-2025-59529 (CVSS3: N/A): avahi https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-59529 *
CVE-2025-60876 (CVSS3: N/A): busybox https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-60876 *
CVE-2025-68211 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-68211 *
CVE-2025-68214 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-68214 *
CVE-2025-68223 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-68223 *
CVE-2025-68333 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-68333 *
CVE-2025-68340 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-68340 *
CVE-2025-68351 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-68351 *
CVE-2025-68358 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-68358 *
CVE-2025-68365 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-68365 *
CVE-2025-68725 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-68725 *
CVE-2025-68749 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-68749 *
CVE-2025-68817 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-68817 *
CVE-2025-68823 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-68823 *
CVE-2025-69644 (CVSS3: N/A): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-69644 *
CVE-2025-69647 (CVSS3: N/A): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-69647 *
CVE-2025-69648 (CVSS3: N/A): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-69648 *
CVE-2025-69649 (CVSS3: N/A): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-69649 *
CVE-2025-69650 (CVSS3: N/A): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-69650 *
CVE-2025-69651 (CVSS3: N/A): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-69651 *
CVE-2025-69652 (CVSS3: N/A): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-69652 *
CVE-2025-71089 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71089 *
CVE-2025-71147 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71147 *
CVE-2025-71148 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71148 *
CVE-2025-71149 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71149 *
CVE-2025-71150 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71150 *
CVE-2025-71151 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71151 *
CVE-2025-71152 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71152 *
CVE-2025-71153 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71153 *
CVE-2025-71154 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71154 *
CVE-2025-71156 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71156 *
CVE-2025-71157 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71157 *
CVE-2025-71158 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71158 *
CVE-2025-71160 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71160 *
CVE-2025-71161 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71161 *
CVE-2025-71162 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71162 *
CVE-2025-71163 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71163 *
CVE-2026-1965 (CVSS3: N/A): curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-1965 *
CVE-2026-22976 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-22976 *
CVE-2026-22977 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-22977 *
CVE-2026-22978 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-22978 *
CVE-2026-22979 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-22979 *
CVE-2026-22980 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-22980 *
CVE-2026-22981 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-22981 *
CVE-2026-22982 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-22982 *
CVE-2026-22984 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-22984 *
CVE-2026-22985 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-22985 *
CVE-2026-22986 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-22986 *
CVE-2026-22989 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-22989 *
CVE-2026-22990 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-22990 *
CVE-2026-22991 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-22991 *
CVE-2026-22992 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-22992 *
CVE-2026-22993 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-22993 *
CVE-2026-22994 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-22994 *
CVE-2026-22996 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-22996 *
CVE-2026-22997 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-22997 *
CVE-2026-22998 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-22998 *
CVE-2026-22999 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-22999 *
CVE-2026-23000 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23000 *
CVE-2026-23060 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23060 *
CVE-2026-23061 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23061 *
CVE-2026-23062 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23062 *
CVE-2026-23063 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23063 *
CVE-2026-23064 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23064 *
CVE-2026-23065 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23065 *
CVE-2026-23066 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23066 *
CVE-2026-23067 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23067 *
CVE-2026-23068 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23068 *
CVE-2026-23069 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23069 *
CVE-2026-23226 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23226 *
CVE-2026-25749 (CVSS3: N/A): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-25749 *
CVE-2026-26269 (CVSS3: N/A): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-26269 *
CVE-2026-28372 (CVSS3: N/A): inetutils https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-28372 *
CVE-2026-28417 (CVSS3: N/A): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-28417 *
CVE-2026-28418 (CVSS3: N/A): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-28418 *
CVE-2026-28419 (CVSS3: N/A): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-28419 *
CVE-2026-28420 (CVSS3: N/A): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-28420 *
CVE-2026-28421 (CVSS3: N/A): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-28421 *
CVE-2026-28422 (CVSS3: N/A): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-28422 *
CVE-2026-3783 (CVSS3: N/A): curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-3783 *
CVE-2026-3784 (CVSS3: N/A): curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-3784 *
CVE-2026-3805 (CVSS3: N/A): curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-3805 *

Summary of CVE counts by recipe:
  linux-yocto: 77
  vim: 8
  binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite: 7
  curl:curl-native: 4
  libsndfile1: 2
  avahi: 1
  busybox: 1
  inetutils: 1
  nfs-utils: 1
  qemu:qemu-native:qemu-system-native: 1

For further information see: https://valkyrie.yocto.io/pub/non-release/patchmetrics/

