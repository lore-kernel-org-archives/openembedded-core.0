Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BB01F3C254
	for <webhook@archiver.kernel.org>; Mon,  9 Mar 2026 13:22:46 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14078.1773062559052841023
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Mar 2026 06:22:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=wZQqeO6q;
 spf=pass (domain: smile.fr, ip: 209.85.128.42, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4853aec185aso9198835e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 09 Mar 2026 06:22:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1773062557; x=1773667357; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RLW0L5xQeqHoP7oEvJ+Da5UWvKl7xxh2bcCObEVkbyw=;
        b=wZQqeO6qS6t3hkVUofXa/ueXIPJHkhJsxuaGWW6xwo3WcDpcYbHieHbHbnnziAthgu
         igMFmNajVet3mPpyN5a5WmkEy6keTcRAjVQYUJ4+AdzlpLrTCJaJEGtW2vxpfRvkTlJb
         wdI9VgqzyVlHKG8qqCl+u0yqPWS8tJl/2XXVA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773062557; x=1773667357;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RLW0L5xQeqHoP7oEvJ+Da5UWvKl7xxh2bcCObEVkbyw=;
        b=hYqS3BN/F6qua7Lkazk93ehIdWw9+Z8Sn6Q6sTHfkJHsWSpxkBOHZfuBuXFQHTHQun
         UlwsOXkosDta5xpZ2SFor7mgVtDMFkVFkC1NIIpb1o40gjizQEe/uqisysxmmZ/WZ9LB
         uCpFF2B8NwDlwmUsY7nwf2fbsNTRHG7ToUacv+I/InebsGge1SQ3E+tv+jKVbjW6j+RN
         +RcqD89bMd20yGFqlFQi5Ot8ToZ1OXn72L8mludcLuto15h1NfyCQWAOgz1/WFn0Mps5
         hsu/bPMKW5/mnh98jnuYyGP0vP01aSa0qQsifac/7UEUiPuLn7tFp0e0fJ29WIa22hDQ
         fkyg==
X-Gm-Message-State: AOJu0YzfIMA2S/alr0/DqYqfdZtQzHCvc4vRrpBGasZc2WhXKAXwApwU
	2ajeEiKuP/gsdruTECTP8aFJcRvgSMBRIC8A3XuBhDcbpBmUIfm0/bDtPjsdwfFGp+EP8Uu377Z
	T4Iri
X-Gm-Gg: ATEYQzwnf1a883gVgbqA8Qz3KZhQBAJSm7XDZ7TJApXtvNpbC28apI4gS0Lr56av1Sg
	yw+sd8K2kScHOnR+oX7LJk6PiVyx66xrmGMfdoYPcrwpRqbBBvwUPWPiGXNdui3C+vl8spPw/2D
	N1JCxCDDwEgTjUFrlGve63HOefv7AJrh8cePrXCxLt7EG+hV6a8Wu4h1M808w0Q8RIWpDVBeVsr
	qbP7J2QlOZeZmM9GeHoNhlqx3yOrp9ZEFycgr8p5T1VCScXTLz9PbO8OnHWvCuIYZpiI3zGAM9Q
	5c1U3b71SHHBp7RzGjMj8T9krQDp7h0CgPpft++z+xNsZQ6YHrCJPjpGYC9D+XBdYX5RJb4YFuO
	y2mSrDqEjMAE8WNxa5gQdquFHbEuC+/39Ibu/Bg0oRCRzU7AAqw3xbytuVt2jxbXczfZ2hp03vv
	V0CLUVMHcQgpIK5njbOHgPpODQvqiVfQiJ7lPpeqsjrV7hqidRZyZqVC5Qhm0XhN38Q0tawBgrW
	CRJHckHBv+ahpe/Sws0BOBlzJ1HgryoxA==
X-Received: by 2002:a05:600c:c4b7:b0:485:3fc8:de9c with SMTP id 5b1f17b1804b1-4853fc8e5f5mr18260065e9.12.1773062557046;
        Mon, 09 Mar 2026 06:22:37 -0700 (PDT)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4852e38c013sm368465445e9.8.2026.03.09.06.22.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 06:22:36 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: OE-Core ML <openembedded-core@lists.openembedded.org>,
	Yocto Security ML <yocto-security@lists.yoctoproject.org>
Subject: OE-core CVE metrics for master on Mon Mar  9 09:55:53 2026
Date: Mon,  9 Mar 2026 14:21:54 +0100
Message-ID: <20260309132154.3566407-4-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260309132154.3566407-1-yoann.congal@smile.fr>
References: <20260309132154.3566407-1-yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Mar 2026 13:22:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232706

Branch: master

New this week: 7 CVEs
CVE-2026-28372 (CVSS3: N/A): inetutils https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-28372 *
CVE-2026-28417 (CVSS3: N/A): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-28417 *
CVE-2026-28418 (CVSS3: N/A): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-28418 *
CVE-2026-28419 (CVSS3: N/A): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-28419 *
CVE-2026-28420 (CVSS3: N/A): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-28420 *
CVE-2026-28421 (CVSS3: N/A): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-28421 *
CVE-2026-28422 (CVSS3: N/A): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-28422 *

Removed this week: 3 CVEs
CVE-2025-12343 (CVSS3: N/A): ffmpeg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-12343 *
CVE-2025-60876 (CVSS3: N/A): busybox https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-60876 *
CVE-2026-26269 (CVSS3: N/A): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-26269 *

Full list:  Found 23 unpatched CVEs
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
CVE-2024-10041 (CVSS3: N/A): libpam https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-10041 *
CVE-2024-50613 (CVSS3: N/A): libsndfile1 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-50613 *
CVE-2024-6519 (CVSS3: N/A): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-6519 *
CVE-2025-52194 (CVSS3: N/A): libsndfile1 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-52194 *
CVE-2025-59529 (CVSS3: N/A): avahi https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-59529 *
CVE-2026-28372 (CVSS3: N/A): inetutils https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-28372 *
CVE-2026-28417 (CVSS3: N/A): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-28417 *
CVE-2026-28418 (CVSS3: N/A): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-28418 *
CVE-2026-28419 (CVSS3: N/A): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-28419 *
CVE-2026-28420 (CVSS3: N/A): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-28420 *
CVE-2026-28421 (CVSS3: N/A): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-28421 *
CVE-2026-28422 (CVSS3: N/A): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-28422 *

Summary of CVE counts by recipe:
  linux-yocto: 11
  vim: 6
  libsndfile1: 2
  avahi: 1
  inetutils: 1
  libpam: 1
  qemu:qemu-native:qemu-system-native: 1

For further information see: https://valkyrie.yocto.io/pub/non-release/patchmetrics/

