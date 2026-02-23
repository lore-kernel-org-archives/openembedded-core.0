Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2C4EE98E0F
	for <webhook@archiver.kernel.org>; Mon, 23 Feb 2026 08:55:53 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.31672.1771836943873395876
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Feb 2026 00:55:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=ZvLg075D;
 spf=pass (domain: smile.fr, ip: 209.85.221.42, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-436263e31abso3721684f8f.1
        for <openembedded-core@lists.openembedded.org>; Mon, 23 Feb 2026 00:55:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1771836942; x=1772441742; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+aVNlTDBP4+fRqRh33BZ4yT0YCEaNdDyBlX3NQ1rhv4=;
        b=ZvLg075DCB8cHPRvQ/AH/k43CnnO0cPUAOb4Z/OFsmkcYZgWZjv/GC201rr2s1yXJa
         kg6l6wKW6HoOExcArFU+GHBDYytq0G0BpWeQtMz3ce0fmOuq/WwrGxNOJ2MuBqNa8fvn
         xYzdjVAxtcgld1GkNOhcvPgG5X0PBKKsGSGBk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771836942; x=1772441742;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+aVNlTDBP4+fRqRh33BZ4yT0YCEaNdDyBlX3NQ1rhv4=;
        b=qCjykya6FCe/oosFBx4FrDJlokkCVBLVo8wt5sGV6tzN4Xk2wINIHss/H8OMdRdogf
         JYsZ8QoIIZgUZazXLOFAOv/6djJ2oxrwWst1SY/h220jGKqE3j/19jW/ChDvEw78vUrm
         DjhlN+KNLwjm0j3CfVxwPZ5YgcGnhnJj7Zd0519tUthiDBLjzK+K3REO/pkmXNX1yzq3
         mYztpcHbl56fPjImgulWtIVP9/FW8HsJk2r210Ut616qxlMQZhLsXXITR84QgpFl5AB8
         wKvc/J8QK1Dsqc8h4kZyIUiqYHf8OY179WDX4qn/jPFLX0VbZl5RVmYWMtWQdBZTel6C
         X6IQ==
X-Gm-Message-State: AOJu0YwibI8YeNBWJIntDtdbRNgZabOV0t3vezIQFdFoQ3FbwSTe7qoJ
	/hQ2WikZhos2PtoA9Cb4t2xr3YD6xtQhPngnRoGyvYGtBBAwxhHXDv10xtaMVpL2mvC8vcUTJ/Z
	DSWky
X-Gm-Gg: ATEYQzz5OgkmOKe41ACC/UpcURonEpdYEGG+ARVTCpjRV5aCmqCZYG/bYR2zKpFFo+y
	znJ5VltSC+sm+glHrWgLfgWl6LgZSLLxobfrkTJVaerj+5Ceo+6iE4HCOSpmkCNv8unJGcrk1ti
	zgs6RAYO4UOMz2UyaT2ie8B+o12watGyNP7rUXnLj/WC8ZAfZH5MmWn12biN5f8FvTwhiqY72dF
	2xNo7aUSOnY8PT2n8ltetzDIn55e00vWY0JnWPLl5QyGrleFa3VNULWaQRL2s0JE3pJmjxthNoF
	XCjIqEglsbaebWGiwHAt54NUPG86pB3AK56KUWFhnxcWiZOy620gU7SDBSBnSKWfrMFN815wtGY
	M7lYVnzNE0cDG+eVoT/SXVjzjovKTxyV1LF/isYqS8IfJILT9YoLaKnuVMuGKVDVfhvAghC7ebI
	Zj3NtgyLTBkjZM6DzYow9uattJNYl2dBaZs6abZphs2jdIcavlJ5iWxNXKMwJnAuZofCg/a1Q5B
	kk3PsqAnJS82cLb03z/lB+J24P9
X-Received: by 2002:a5d:588a:0:b0:435:9144:1417 with SMTP id ffacd0b85a97d-4396f183942mr12486901f8f.49.1771836941937;
        Mon, 23 Feb 2026 00:55:41 -0800 (PST)
Received: from FRSMI25-LASER.home (2a01cb001331aa00f13df544104db802.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:f13d:f544:104d:b802])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970d3ff1csm16424077f8f.20.2026.02.23.00.55.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 00:55:41 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: OE-Core ML <openembedded-core@lists.openembedded.org>,
	Yocto Security ML <yocto-security@lists.yoctoproject.org>
Subject: OE-core CVE metrics for whinlatter on Sun Feb 22 22:56:01 2026
Date: Mon, 23 Feb 2026 09:55:06 +0100
Message-ID: <20260223085507.17802-3-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260223085507.17802-1-yoann.congal@smile.fr>
References: <20260223085507.17802-1-yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Feb 2026 08:55:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231657

Branch: whinlatter

New this week: 4 CVEs
CVE-2026-22693 (CVSS3: N/A): harfbuzz:harfbuzz-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-22693 *
CVE-2026-25749 (CVSS3: N/A): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-25749 *
CVE-2026-26269 (CVSS3: N/A): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-26269 *
CVE-2026-27171 (CVSS3: N/A): zlib:zlib-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-27171 *

Removed this week: 30 CVEs
CVE-2023-51791 (CVSS3: N/A): ffmpeg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-51791 *
CVE-2023-51793 (CVSS3: N/A): ffmpeg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-51793 *
CVE-2023-51794 (CVSS3: N/A): ffmpeg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-51794 *
CVE-2023-51795 (CVSS3: N/A): ffmpeg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-51795 *
CVE-2023-51796 (CVSS3: N/A): ffmpeg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-51796 *
CVE-2023-51797 (CVSS3: N/A): ffmpeg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-51797 *
CVE-2023-51798 (CVSS3: N/A): ffmpeg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-51798 *
CVE-2025-11187 (CVSS3: N/A): openssl:openssl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-11187 *
CVE-2025-15467 (CVSS3: N/A): openssl:openssl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-15467 *
CVE-2025-15468 (CVSS3: N/A): openssl:openssl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-15468 *
CVE-2025-15469 (CVSS3: N/A): openssl:openssl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-15469 *
CVE-2025-22921 (CVSS3: N/A): ffmpeg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-22921 *
CVE-2025-25468 (CVSS3: N/A): ffmpeg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-25468 *
CVE-2025-25469 (CVSS3: N/A): ffmpeg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-25469 *
CVE-2025-56226 (CVSS3: N/A): libsndfile1 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-56226 *
CVE-2025-61732 (CVSS3: N/A): go:go-binary-native:go-cross-x86-64-v3:go-runtime https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-61732 *
CVE-2025-66199 (CVSS3: N/A): openssl:openssl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-66199 *
CVE-2025-66476 (CVSS3: N/A): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-66476 *
CVE-2025-68121 (CVSS3: N/A): go:go-binary-native:go-cross-x86-64-v3:go-runtime https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-68121 *
CVE-2025-68160 (CVSS3: N/A): openssl:openssl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-68160 *
CVE-2025-68276 (CVSS3: N/A): avahi https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-68276 *
CVE-2025-68468 (CVSS3: N/A): avahi https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-68468 *
CVE-2025-68471 (CVSS3: N/A): avahi https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-68471 *
CVE-2025-69418 (CVSS3: N/A): openssl:openssl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-69418 *
CVE-2025-69419 (CVSS3: N/A): openssl:openssl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-69419 *
CVE-2025-69420 (CVSS3: N/A): openssl:openssl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-69420 *
CVE-2025-69421 (CVSS3: N/A): openssl:openssl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-69421 *
CVE-2026-22795 (CVSS3: N/A): openssl:openssl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-22795 *
CVE-2026-22796 (CVSS3: N/A): openssl:openssl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-22796 *
CVE-2026-24401 (CVSS3: N/A): avahi https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-24401 *

Full list:  Found 27 unpatched CVEs
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
CVE-2025-52194 (CVSS3: N/A): libsndfile1 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-52194 *
CVE-2025-59529 (CVSS3: N/A): avahi https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-59529 *
CVE-2025-60876 (CVSS3: N/A): busybox https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-60876 *
CVE-2025-66471 (CVSS3: N/A): python3-urllib3:python3-urllib3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-66471 *
CVE-2026-22693 (CVSS3: N/A): harfbuzz:harfbuzz-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-22693 *
CVE-2026-25646 (CVSS3: N/A): libpng:libpng-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-25646 *
CVE-2026-25749 (CVSS3: N/A): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-25749 *
CVE-2026-26269 (CVSS3: N/A): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-26269 *
CVE-2026-27171 (CVSS3: N/A): zlib:zlib-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-27171 *

Summary of CVE counts by recipe:
  linux-yocto: 16
  libsndfile1: 2
  vim: 2
  avahi: 1
  busybox: 1
  harfbuzz:harfbuzz-native: 1
  libpng:libpng-native: 1
  python3-urllib3:python3-urllib3-native: 1
  qemu:qemu-native:qemu-system-native: 1
  zlib:zlib-native: 1

For further information see: https://valkyrie.yocto.io/pub/non-release/patchmetrics/

