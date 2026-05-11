Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA0C4CD37B7
	for <webhook@archiver.kernel.org>; Mon, 11 May 2026 07:13:00 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.44881.1778483573593539697
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 May 2026 00:12:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=DCFO4peZ;
 spf=pass (domain: smile.fr, ip: 209.85.128.41, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-48a7fe4f40bso45645245e9.0
        for <openembedded-core@lists.openembedded.org>; Mon, 11 May 2026 00:12:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1778483572; x=1779088372; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Fc5XHmMyKttsQVqjpDH5zv4NjG0XCc8TOhJ1JUMhi+I=;
        b=DCFO4peZnhnilACFz1E9JOAlkWQcJ30wnrZ4ltsVbrRz/jFThp6nAYhn92wxd1LTcn
         M3vwp/4ue+3ZqQysYVuVvGK7OWBRxJFE99Wg10d0WNh6wFh/t87OKhYcKvsTk3MmJ/Vs
         dx8flJ9ezAk81Kv1T5Y8OeZIgyqFzauVaTlsU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778483572; x=1779088372;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Fc5XHmMyKttsQVqjpDH5zv4NjG0XCc8TOhJ1JUMhi+I=;
        b=spPifK8lYB0iyfQmTBFyARkVPa5E15q8wvviyeimayomqmVLblKXTaVR6kxEalNk1X
         QHGMENiR86okUlx2VZMfR7f9X387hZn5gSf2bT6Ca7+6oOngw+taSJyvfH/qeS1ZYdVE
         gRPccXQ5e30ZMA9QDI3eKu4VlHfv/Wckwk1Z0sE75GP6HKWIfpd7n5uKGXSUi4fwHYGS
         DTwbGSgdGyJ0fA65O0ih8CN36tc3Z/LiFWd8i5A+vp+uVvtj39IcepjEdaGD95i6tjbA
         N/aV6H1C/IdKfjjICLKQ1dyfS9O71fTvWOGUsWe480A6mOVp0Fjt+k9fwhoVoqQ6sclq
         jNTw==
X-Gm-Message-State: AOJu0YwDRwbygUa3wuRl/fUHlbBPxGsyx7ijaxUFU/arbaVC9IQZ1GGW
	YDMagx01nFcYguEqXbvTjzaqu29NPk0VSDIMzcsk3XJkw4ghlj3zLo7s1fTxrl3eljkC0ylUNVM
	5uvZr4BI=
X-Gm-Gg: Acq92OH5WCVoXb2zVyBUOZRLotRlVXidUZ3KnoielAV6DjujhA4c2eMrnzeVZ6p2/0m
	90tJtBNi0eV/3l5OmduyoOv1BrSudtCV6t0q5eQhWwvWs8XsR55NiPCjQnZ4T+17FB8a2pq3IMM
	IP1/rAnEJRnJraseJQqjrK7KgtWWcbRZI5Mey0Q0oWKL0ytiXj/1m+U1IEoL/CJ9wbpAhEdB25D
	4EzQinCdb/NBfHKVeyM2tbIgCEzhi5S+aenczPQL57SIw3ZLNK1EwXD6KCg0IwN5c7hgwFOpvj1
	yDjxvwYxCDtJaZodmZ1tdvVYPbdHZQOl2lMDjF9TDoFVG7jsgbHq3lJqjwtBWt1rlKOAyCrtHVB
	gyeaBWuevvjidAhRgaGzS+H1wOEArlYSvcASK3teIUG36/d0N9KxUx0b1BheV+5QV9GSBNzJZaO
	RXn4MmP5Z9cWy1744VhSc8p5sUwmdlSRsPvSbKQ63cwQlqq21A9G4ywrWhzFxHWLwB81bkL8ERF
	CnFHhlBGpK5VQUwSs4/zIEL8TZSRQ==
X-Received: by 2002:a05:600d:18:b0:488:b811:51c4 with SMTP id 5b1f17b1804b1-48e51f3c4f4mr299863145e9.25.1778483571634;
        Mon, 11 May 2026 00:12:51 -0700 (PDT)
Received: from localhost.localdomain (2a02-8440-2506-3efd-308f-d2b7-a05a-6b0d.rev.sfr.net. [2a02:8440:2506:3efd:308f:d2b7:a05a:6b0d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e702e0c70sm182350035e9.6.2026.05.11.00.12.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 00:12:51 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: OE-Core ML <openembedded-core@lists.openembedded.org>,
	Yocto Security ML <yocto-security@lists.yoctoproject.org>
Subject: OE-core CVE metrics for master on Mon May 11 07:15:04 2026
Date: Mon, 11 May 2026 09:12:35 +0200
Message-ID: <20260511071235.2261075-4-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260511071235.2261075-1-yoann.congal@smile.fr>
References: <20260511071235.2261075-1-yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 May 2026 07:13:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236780

Branch: master

New this week: 45 CVEs
CVE-2025-71289 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71289 *
CVE-2026-2625 (CVSS3: N/A): rpm-sequoia https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-2625 *
CVE-2026-2708 (CVSS3: N/A): libsoup https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-2708 *
CVE-2026-3184 (CVSS3: N/A): util-linux:util-linux-libuuid:util-linux-libuuid-native:util-linux-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-3184 *
CVE-2026-33814 (CVSS3: N/A): go:go-binary-native:go-cross-x86-64-v3:go-runtime https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-33814 *
CVE-2026-33845 (CVSS3: N/A): gnutls:gnutls-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-33845 *
CVE-2026-34000 (CVSS3: N/A): xserver-xorg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-34000 *
CVE-2026-34002 (CVSS3: N/A): xserver-xorg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-34002 *
CVE-2026-37555 (CVSS3: N/A): libsndfile1 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-37555 *
CVE-2026-3832 (CVSS3: N/A): gnutls:gnutls-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-3832 *
CVE-2026-3833 (CVSS3: N/A): gnutls:gnutls-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-3833 *
CVE-2026-39817 (CVSS3: N/A): go:go-binary-native:go-cross-x86-64-v3:go-runtime https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-39817 *
CVE-2026-39819 (CVSS3: N/A): go:go-binary-native:go-cross-x86-64-v3:go-runtime https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-39819 *
CVE-2026-39823 (CVSS3: N/A): go:go-binary-native:go-cross-x86-64-v3:go-runtime https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-39823 *
CVE-2026-39825 (CVSS3: N/A): go:go-binary-native:go-cross-x86-64-v3:go-runtime https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-39825 *
CVE-2026-39826 (CVSS3: N/A): go:go-binary-native:go-cross-x86-64-v3:go-runtime https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-39826 *
CVE-2026-42307 (CVSS3: N/A): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-42307 *
CVE-2026-42501 (CVSS3: N/A): go:go-binary-native:go-cross-x86-64-v3:go-runtime https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-42501 *
CVE-2026-43088 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-43088 *
CVE-2026-43095 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-43095 *
CVE-2026-43115 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-43115 *
CVE-2026-43131 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-43131 *
CVE-2026-43174 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-43174 *
CVE-2026-43191 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-43191 *
CVE-2026-43204 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-43204 *
CVE-2026-43228 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-43228 *
CVE-2026-43284 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-43284 *
CVE-2026-43299 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-43299 *
CVE-2026-43308 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-43308 *
CVE-2026-43310 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-43310 *
CVE-2026-43311 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-43311 *
CVE-2026-43326 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-43326 *
CVE-2026-43344 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-43344 *
CVE-2026-43349 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-43349 *
CVE-2026-43350 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-43350 *
CVE-2026-43391 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-43391 *
CVE-2026-43414 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-43414 *
CVE-2026-43443 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-43443 *
CVE-2026-44656 (CVSS3: N/A): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-44656 *
CVE-2026-45130 (CVSS3: N/A): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-45130 *
CVE-2026-45186 (CVSS3: N/A): expat:expat-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-45186 *
CVE-2026-5201 (CVSS3: N/A): gdk-pixbuf:gdk-pixbuf-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-5201 *
CVE-2026-5673 (CVSS3: N/A): libtheora https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-5673 *
CVE-2026-6238 (CVSS3: N/A): glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-6238 *
CVE-2026-6732 (CVSS3: N/A): libxml2:libxml2-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-6732 *

Removed this week: 14 CVEs
CVE-2025-59777 (CVSS3: N/A): libmicrohttpd:libmicrohttpd-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-59777 *
CVE-2025-62689 (CVSS3: N/A): libmicrohttpd:libmicrohttpd-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-62689 *
CVE-2026-2369 (CVSS3: N/A): libsoup https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-2369 *
CVE-2026-32772 (CVSS3: N/A): inetutils https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-32772 *
CVE-2026-34757 (CVSS3: N/A): libpng:libpng-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-34757 *
CVE-2026-35444 (CVSS3: N/A): libsdl2:libsdl2-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-35444 *
CVE-2026-35535 (CVSS3: N/A): sudo https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-35535 *
CVE-2026-41035 (CVSS3: N/A): rsync:rsync-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-41035 *
CVE-2026-41066 (CVSS3: N/A): python3-lxml:python3-lxml-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-41066 *
CVE-2026-41989 (CVSS3: N/A): libgcrypt:libgcrypt-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-41989 *
CVE-2026-41990 (CVSS3: N/A): libgcrypt:libgcrypt-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-41990 *
CVE-2026-4426 (CVSS3: N/A): libarchive:libarchive-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-4426 *
CVE-2026-5745 (CVSS3: N/A): libarchive:libarchive-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-5745 *
CVE-2026-7598 (CVSS3: N/A): libssh2:libssh2-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-7598 *

Full list:  Found 145 unpatched CVEs
CVE-2011-3374 (CVSS3: N/A): apt https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2011-3374 *
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
CVE-2024-2236 (CVSS3: N/A): libgcrypt:libgcrypt-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-2236 *
CVE-2024-43802 (CVSS3: N/A): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-43802 *
CVE-2024-47850 (CVSS3: N/A): cups https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-47850 *
CVE-2024-50613 (CVSS3: N/A): libsndfile1 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-50613 *
CVE-2024-52005 (CVSS3: N/A): git:git-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-52005 *
CVE-2024-58251 (CVSS3: N/A): busybox https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-58251 *
CVE-2024-6519 (CVSS3: N/A): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-6519 *
CVE-2025-14876 (CVSS3: N/A): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-14876 *
CVE-2025-15366 (CVSS3: N/A): python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-15366 *
CVE-2025-15367 (CVSS3: N/A): python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-15367 *
CVE-2025-50422 (CVSS3: N/A): cairo:cairo-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-50422 *
CVE-2025-52194 (CVSS3: N/A): libsndfile1 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-52194 *
CVE-2025-59529 (CVSS3: N/A): avahi https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-59529 *
CVE-2025-69693 (CVSS3: N/A): ffmpeg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-69693 *
CVE-2025-71074 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71074 *
CVE-2025-71289 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71289 *
CVE-2026-0665 (CVSS3: N/A): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-0665 *
CVE-2026-1502 (CVSS3: N/A): python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-1502 *
CVE-2026-2243 (CVSS3: N/A): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-2243 *
CVE-2026-23327 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23327 *
CVE-2026-23328 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23328 *
CVE-2026-23371 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23371 *
CVE-2026-23374 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23374 *
CVE-2026-23377 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23377 *
CVE-2026-23442 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23442 *
CVE-2026-23459 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23459 *
CVE-2026-2625 (CVSS3: N/A): rpm-sequoia https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-2625 *
CVE-2026-2708 (CVSS3: N/A): libsoup https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-2708 *
CVE-2026-28529 (CVSS3: N/A): cryptodev-linux https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-28529 *
CVE-2026-3087 (CVSS3: N/A): python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-3087 *
CVE-2026-3099 (CVSS3: N/A): libsoup https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-3099 *
CVE-2026-30997 (CVSS3: N/A): ffmpeg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-30997 *
CVE-2026-30998 (CVSS3: N/A): ffmpeg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-30998 *
CVE-2026-30999 (CVSS3: N/A): ffmpeg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-30999 *
CVE-2026-31420 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-31420 *
CVE-2026-31501 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-31501 *
CVE-2026-31560 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-31560 *
CVE-2026-31574 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-31574 *
CVE-2026-31589 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-31589 *
CVE-2026-31688 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-31688 *
CVE-2026-31694 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-31694 *
CVE-2026-31696 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-31696 *
CVE-2026-31697 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-31697 *
CVE-2026-31698 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-31698 *
CVE-2026-31699 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-31699 *
CVE-2026-31700 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-31700 *
CVE-2026-31701 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-31701 *
CVE-2026-31702 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-31702 *
CVE-2026-31703 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-31703 *
CVE-2026-31704 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-31704 *
CVE-2026-31705 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-31705 *
CVE-2026-31706 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-31706 *
CVE-2026-31707 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-31707 *
CVE-2026-31708 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-31708 *
CVE-2026-31709 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-31709 *
CVE-2026-31711 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-31711 *
CVE-2026-31712 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-31712 *
CVE-2026-31713 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-31713 *
CVE-2026-31714 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-31714 *
CVE-2026-31715 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-31715 *
CVE-2026-31716 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-31716 *
CVE-2026-31717 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-31717 *
CVE-2026-31718 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-31718 *
CVE-2026-31719 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-31719 *
CVE-2026-31771 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-31771 *
CVE-2026-31777 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-31777 *
CVE-2026-31786 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-31786 *
CVE-2026-31787 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-31787 *
CVE-2026-3184 (CVSS3: N/A): util-linux:util-linux-libuuid:util-linux-libuuid-native:util-linux-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-3184 *
CVE-2026-3298 (CVSS3: N/A): python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-3298 *
CVE-2026-33814 (CVSS3: N/A): go:go-binary-native:go-cross-x86-64-v3:go-runtime https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-33814 *
CVE-2026-33845 (CVSS3: N/A): gnutls:gnutls-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-33845 *
CVE-2026-34000 (CVSS3: N/A): xserver-xorg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-34000 *
CVE-2026-34002 (CVSS3: N/A): xserver-xorg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-34002 *
CVE-2026-3441 (CVSS3: N/A): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-3441 *
CVE-2026-3442 (CVSS3: N/A): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-3442 *
CVE-2026-3632 (CVSS3: N/A): libsoup https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-3632 *
CVE-2026-3633 (CVSS3: N/A): libsoup https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-3633 *
CVE-2026-3634 (CVSS3: N/A): libsoup https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-3634 *
CVE-2026-37555 (CVSS3: N/A): libsndfile1 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-37555 *
CVE-2026-3832 (CVSS3: N/A): gnutls:gnutls-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-3832 *
CVE-2026-3833 (CVSS3: N/A): gnutls:gnutls-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-3833 *
CVE-2026-39817 (CVSS3: N/A): go:go-binary-native:go-cross-x86-64-v3:go-runtime https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-39817 *
CVE-2026-39819 (CVSS3: N/A): go:go-binary-native:go-cross-x86-64-v3:go-runtime https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-39819 *
CVE-2026-39823 (CVSS3: N/A): go:go-binary-native:go-cross-x86-64-v3:go-runtime https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-39823 *
CVE-2026-39825 (CVSS3: N/A): go:go-binary-native:go-cross-x86-64-v3:go-runtime https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-39825 *
CVE-2026-39826 (CVSS3: N/A): go:go-binary-native:go-cross-x86-64-v3:go-runtime https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-39826 *
CVE-2026-4046 (CVSS3: N/A): glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-4046 *
CVE-2026-40962 (CVSS3: N/A): ffmpeg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-40962 *
CVE-2026-41411 (CVSS3: N/A): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-41411 *
CVE-2026-42307 (CVSS3: N/A): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-42307 *
CVE-2026-42501 (CVSS3: N/A): go:go-binary-native:go-cross-x86-64-v3:go-runtime https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-42501 *
CVE-2026-4271 (CVSS3: N/A): libsoup https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-4271 *
CVE-2026-43009 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-43009 *
CVE-2026-43022 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-43022 *
CVE-2026-43042 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-43042 *
CVE-2026-43045 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-43045 *
CVE-2026-43053 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-43053 *
CVE-2026-43088 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-43088 *
CVE-2026-43095 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-43095 *
CVE-2026-43115 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-43115 *
CVE-2026-43131 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-43131 *
CVE-2026-43174 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-43174 *
CVE-2026-43191 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-43191 *
CVE-2026-43204 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-43204 *
CVE-2026-43228 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-43228 *
CVE-2026-43284 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-43284 *
CVE-2026-43299 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-43299 *
CVE-2026-43308 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-43308 *
CVE-2026-43310 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-43310 *
CVE-2026-43311 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-43311 *
CVE-2026-43326 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-43326 *
CVE-2026-43344 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-43344 *
CVE-2026-43349 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-43349 *
CVE-2026-43350 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-43350 *
CVE-2026-43391 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-43391 *
CVE-2026-43414 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-43414 *
CVE-2026-43443 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-43443 *
CVE-2026-44656 (CVSS3: N/A): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-44656 *
CVE-2026-45130 (CVSS3: N/A): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-45130 *
CVE-2026-45186 (CVSS3: N/A): expat:expat-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-45186 *
CVE-2026-4786 (CVSS3: N/A): python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-4786 *
CVE-2026-5201 (CVSS3: N/A): gdk-pixbuf:gdk-pixbuf-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-5201 *
CVE-2026-5435 (CVSS3: N/A): glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-5435 *
CVE-2026-5450 (CVSS3: N/A): glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-5450 *
CVE-2026-5673 (CVSS3: N/A): libtheora https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-5673 *
CVE-2026-5704 (CVSS3: N/A): tar https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-5704 *
CVE-2026-5713 (CVSS3: N/A): python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-5713 *
CVE-2026-5928 (CVSS3: N/A): glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-5928 *
CVE-2026-6019 (CVSS3: N/A): python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-6019 *
CVE-2026-6100 (CVSS3: N/A): python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-6100 *
CVE-2026-6238 (CVSS3: N/A): glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-6238 *
CVE-2026-6732 (CVSS3: N/A): libxml2:libxml2-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-6732 *

Summary of CVE counts by recipe:
  linux-yocto: 79
  python3:python3-native: 9
  go:go-binary-native:go-cross-x86-64-v3:go-runtime: 7
  libsoup: 6
  ffmpeg: 5
  glibc: 5
  vim: 5
  qemu:qemu-native:qemu-system-native: 4
  gnutls:gnutls-native: 3
  libsndfile1: 3
  binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite: 2
  xserver-xorg: 2
  apt: 1
  avahi: 1
  busybox: 1
  cairo:cairo-native: 1
  cryptodev-linux: 1
  cups: 1
  expat:expat-native: 1
  gdk-pixbuf:gdk-pixbuf-native: 1
  git:git-native: 1
  libgcrypt:libgcrypt-native: 1
  libtheora: 1
  libxml2:libxml2-native: 1
  rpm-sequoia: 1
  tar: 1
  util-linux:util-linux-libuuid:util-linux-libuuid-native:util-linux-native: 1

For further information see: https://valkyrie.yocto.io/pub/non-release/patchmetrics/

