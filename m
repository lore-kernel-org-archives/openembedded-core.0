Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1F1FC982DA
	for <webhook@archiver.kernel.org>; Mon, 21 Sep 2026 04:37:13 +0000 (UTC)
Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.42636.1789965423317213006
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Sep 2026 21:37:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=g3KV3DLm;
 spf=pass (domain: smile.fr, ip: 74.125.225.99, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-4885a1480a2so271396f8f.3
        for <openembedded-core@lists.openembedded.org>; Sun, 20 Sep 2026 21:37:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1789965421; x=1790570221; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=N6V7V6uPdeIRHlFGIGkEkd39c8vqqJepDwUqQJ3xuaI=;
        b=g3KV3DLmZ4VNLfFVV8q0DdM2OBxVxToRb9XOlBZg1YmwNOfpulRRqgNAlY4bheavxV
         DSVef87MnbZaT2LVT2Jt2WvuAt/jHAfLI47TE7hNnWUziqtcLaqx00l4Q0p+gIcDBU6+
         kmrKnZbiyTtbU5jeXsUsxbRmsWgqyeyzfb2mY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789965421; x=1790570221;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=N6V7V6uPdeIRHlFGIGkEkd39c8vqqJepDwUqQJ3xuaI=;
        b=ayLIGa0O4FiL/3fe3n7+30G2RXR8NPTUQRoQLYrFpUDvOBx4xPuMnAkUvD5xvW8bdP
         sED3HH+oakQ/mrWPrrtdox0WRettyQZhdtmyLlF2wRP0qlA/4H8SXf/fkbbLV44bKdY0
         sgqVA8PZeayMr19Y9OsXUX2XPFcCsXLbwJkV/hWupiCXW9Aw+FdT0SGoHiexR2qxsH48
         CP85FZ18asaZWz6ZJbzb2JFe4i10UQCajQPEiH1KuCmP7WciOcjNmN45fWdcrle8Jx3m
         aw0+3sIumRTMhXDgfxHItPgSFtuw8JrKFgXUIux+7E4aZHqnHV0Tzqyhy0R94wTs5KSY
         1Apg==
X-Gm-Message-State: AFuF++nEDvI3//V1giAUdPIwidjK6zn4UBeTMOuQmfzu5B7dRbArBqx5
	1zuwMnQOM4YtKC+0weRrGk6qXO7GRCpXjVbD9Hw5fd8Dp/e3gelp51LVHgIepGxOwKdQRhmPl96
	Ez+Q6jEs=
X-Gm-Gg: AYBFou0LEGHLNmNo/BBHYpe8Bhwyv/oWU04tY/jEinePhHjnAnve76WpOmy98ZJEocQ
	g3FWYcRNixrrvocNqv0NFSDPzTBTYzjWagGyyZ4IS8jRBY0akMxSlhsD4juUFbKpV8DNa1sW98b
	OgMy3XoFmzE+tpBn4rXE0PIJWhMdEZnFQ28KJLYsOJwVv8Ryekh6vBrk3jeRoXvBI+fhoBTYsNo
	rBKCtkOrl5HLLo/ZkCg//4y1AYXBINezdILbFjn7YNe5cF/iyAELJZMQtSUvXMHsj9oojjfnzgH
	CldiChqQSOtl7FwKqWx0QU0KxHrus+oIlpfxzQas1C3foCmbtJvq0dNnbXYXOv7D1EYbx2lrcS3
	H81FXAsYx3EBUazCP6oX9EScvyrVdENpT96/NNi4HfyskMOwaXY5AmwgIcrm82A5+cjMGMJbLF/
	nf0EDKncq3n7wh+HzwXHwKRCom15LZHb1MEDhPMzukQtSkIN1T63cybT3RYxjfWxnuTlMKpQDI6
	X0Va/55pHuALtRtC6BEYWSTq7SqgUVz+e3b6GOK2Hmqiih/wIraRVR+cOeoL8auwEorg35UY1ge
	Z5W/kTk7lgMr7WWT7sp7BerhpzOXLPKkEffsE8W/pWQTgxAq46hJLY8=
X-Received: by 2002:a05:6000:310e:b0:487:ffe:7219 with SMTP id ffacd0b85a97d-4871e268375mr13644677f8f.27.1789965421204;
        Sun, 20 Sep 2026 21:37:01 -0700 (PDT)
Received: from runner-sindu79iq-project-19509-concurrent-0.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-487244608a3sm18947882f8f.8.2026.09.20.21.37.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 21:37:00 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: OE-Core ML <openembedded-core@lists.openembedded.org>,
	Yocto Security ML <yocto-security@lists.yoctoproject.org>
Subject: OE-core CVE metrics for master on Mon Sep 21 03:04:37 2026
Date: Mon, 21 Sep 2026 04:36:58 +0000
Message-ID: <20260921043700.24-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Sep 2026 04:37:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246270

Branch: master

New this week: 36 CVEs
CVE-2020-27748 (CVSSv2: 4.3, CVSSv3: 6.5): xdg-utils https://nvd.nist.gov/vuln/detail/CVE-2020-27748 *
CVE-2026-8674 (CVSSv3: 5.3): glibc https://nvd.nist.gov/vuln/detail/CVE-2026-8674 *
CVE-2026-19033 (CVSSv3: 6.5): bind https://nvd.nist.gov/vuln/detail/CVE-2026-19033 *
CVE-2026-19499 (CVSSv3: 7.7): glibc https://nvd.nist.gov/vuln/detail/CVE-2026-19499 *
CVE-2026-19542 (CVSSv3: 5.6): glibc https://nvd.nist.gov/vuln/detail/CVE-2026-19542 *
CVE-2026-19662 (CVSSv3: 5.9): bind https://nvd.nist.gov/vuln/detail/CVE-2026-19662 *
CVE-2026-19666 (CVSSv3: 7.5): bind https://nvd.nist.gov/vuln/detail/CVE-2026-19666 *
CVE-2026-19667 (CVSSv3: 7.5): bind https://nvd.nist.gov/vuln/detail/CVE-2026-19667 *
CVE-2026-19668 (CVSSv3: 5.3): bind https://nvd.nist.gov/vuln/detail/CVE-2026-19668 *
CVE-2026-19774 (CVSSv3: 7.1): bluez5 https://nvd.nist.gov/vuln/detail/CVE-2026-19774 *
CVE-2026-19941 (CVSSv3: 5.9): bind https://nvd.nist.gov/vuln/detail/CVE-2026-19941 *
CVE-2026-39919 (CVSSv3: 9.8, CVSSv4: 9.3): ghostscript https://nvd.nist.gov/vuln/detail/CVE-2026-39919 *
CVE-2026-75029 (CVSSv3: 5.3): bind https://nvd.nist.gov/vuln/detail/CVE-2026-75029 *
CVE-2026-76163 (CVSSv3: 7.5): bind https://nvd.nist.gov/vuln/detail/CVE-2026-76163 *
CVE-2026-77117 (CVSSv3: 5.9): glibc https://nvd.nist.gov/vuln/detail/CVE-2026-77117 *
CVE-2026-77119 (CVSSv3: 5.9): bind https://nvd.nist.gov/vuln/detail/CVE-2026-77119 *
CVE-2026-77692 (CVSSv3: 7.5): bind https://nvd.nist.gov/vuln/detail/CVE-2026-77692 *
CVE-2026-78301 (CVSSv3: 5.8): bind https://nvd.nist.gov/vuln/detail/CVE-2026-78301 *
CVE-2026-80274 (CVSSv3: 7.5): bind https://nvd.nist.gov/vuln/detail/CVE-2026-80274 *
CVE-2026-80489 (CVSSv3: 5.9): glibc https://nvd.nist.gov/vuln/detail/CVE-2026-80489 *
CVE-2026-81563 (CVSSv3: 7.5): bind https://nvd.nist.gov/vuln/detail/CVE-2026-81563 *
CVE-2026-81736 (CVSSv3: 7.5): bind https://nvd.nist.gov/vuln/detail/CVE-2026-81736 *
CVE-2026-82560 (CVSS: N/A): perl:perl-native https://nvd.nist.gov/vuln/detail/CVE-2026-82560 *
CVE-2026-90801 (CVSSv2: 4.3, CVSSv3: 5.3, CVSSv4: 4.8): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://nvd.nist.gov/vuln/detail/CVE-2026-90801 *
CVE-2026-90802 (CVSSv2: 3.2, CVSSv3: 4.4, CVSSv4: 4.8): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://nvd.nist.gov/vuln/detail/CVE-2026-90802 *
CVE-2026-90803 (CVSSv2: 4.3, CVSSv3: 5.3, CVSSv4: 4.8): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://nvd.nist.gov/vuln/detail/CVE-2026-90803 *
CVE-2026-90804 (CVSSv2: 4.3, CVSSv3: 4.8, CVSSv4: 2.4): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://nvd.nist.gov/vuln/detail/CVE-2026-90804 *
CVE-2026-90828 (CVSSv2: 4.3, CVSSv3: 5.3, CVSSv4: 4.8): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://nvd.nist.gov/vuln/detail/CVE-2026-90828 *
CVE-2026-90829 (CVSSv2: 4.3, CVSSv3: 5.3, CVSSv4: 4.8): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://nvd.nist.gov/vuln/detail/CVE-2026-90829 *
CVE-2026-90830 (CVSSv2: 4.3, CVSSv3: 5.3, CVSSv4: 4.8): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://nvd.nist.gov/vuln/detail/CVE-2026-90830 *
CVE-2026-90831 (CVSSv2: 4.3, CVSSv3: 5.3, CVSSv4: 4.8): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://nvd.nist.gov/vuln/detail/CVE-2026-90831 *
CVE-2026-91779 (CVSSv2: 1.7, CVSSv3: 3.3, CVSSv4: 4.8): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://nvd.nist.gov/vuln/detail/CVE-2026-91779 *
CVE-2026-91780 (CVSSv2: 1.7, CVSSv3: 3.3, CVSSv4: 4.8): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://nvd.nist.gov/vuln/detail/CVE-2026-91780 *
CVE-2026-91781 (CVSSv2: 1.7, CVSSv3: 3.3, CVSSv4: 4.8): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://nvd.nist.gov/vuln/detail/CVE-2026-91781 *
CVE-2026-91782 (CVSSv2: 1.7, CVSSv3: 3.3, CVSSv4: 4.8): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://nvd.nist.gov/vuln/detail/CVE-2026-91782 *
CVE-2026-93990 (CVSSv3: 7.5, CVSSv4: 8.7): expat:expat-native https://nvd.nist.gov/vuln/detail/CVE-2026-93990 *

Removed this week: 1 CVEs
CVE-2026-80926 (CVSSv3: 9.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-80926 *

Full list: Found 103 unpatched CVEs
CVE-2019-14899 (CVSSv2: 4.9, CVSSv3: 7.4): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2019-14899 *
CVE-2020-10774 (CVSSv2: 2.1, CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2020-10774 *
CVE-2020-27748 (CVSSv2: 4.3, CVSSv3: 6.5): xdg-utils https://nvd.nist.gov/vuln/detail/CVE-2020-27748 *
CVE-2021-3714 (CVSSv3: 5.9): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2021-3714 *
CVE-2021-3864 (CVSSv3: 7.0): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2021-3864 *
CVE-2022-4543 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2022-4543 *
CVE-2023-3397 (CVSSv3: 7.0): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2023-3397 *
CVE-2023-3640 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2023-3640 *
CVE-2023-6238 (CVSSv3: 6.7): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2023-6238 *
CVE-2023-6240 (CVSSv3: 6.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2023-6240 *
CVE-2024-2236 (CVSSv3: 5.9): libgcrypt:libgcrypt-native https://nvd.nist.gov/vuln/detail/CVE-2024-2236 *
CVE-2024-47850 (CVSSv3: 7.5): cups https://nvd.nist.gov/vuln/detail/CVE-2024-47850 *
CVE-2024-50613 (CVSSv3: 6.5): libsndfile1 https://nvd.nist.gov/vuln/detail/CVE-2024-50613 *
CVE-2025-15367 (CVSSv4: 5.9): python3:python3-native https://nvd.nist.gov/vuln/detail/CVE-2025-15367 *
CVE-2025-50422 (CVSSv3: 2.9): cairo:cairo-native https://nvd.nist.gov/vuln/detail/CVE-2025-50422 *
CVE-2025-52194 (CVSSv3: 7.5): libsndfile1 https://nvd.nist.gov/vuln/detail/CVE-2025-52194 *
CVE-2026-3099 (CVSSv3: 7.3): libsoup https://nvd.nist.gov/vuln/detail/CVE-2026-3099 *
CVE-2026-3441 (CVSSv3: 7.1): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://nvd.nist.gov/vuln/detail/CVE-2026-3441 *
CVE-2026-3442 (CVSSv3: 7.1): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://nvd.nist.gov/vuln/detail/CVE-2026-3442 *
CVE-2026-3632 (CVSSv3: 5.5): libsoup https://nvd.nist.gov/vuln/detail/CVE-2026-3632 *
CVE-2026-3633 (CVSSv3: 6.5): libsoup https://nvd.nist.gov/vuln/detail/CVE-2026-3633 *
CVE-2026-3634 (CVSSv3: 6.5): libsoup https://nvd.nist.gov/vuln/detail/CVE-2026-3634 *
CVE-2026-5673 (CVSSv3: 7.1): libtheora https://nvd.nist.gov/vuln/detail/CVE-2026-5673 *
CVE-2026-6844 (CVSSv3: 5.5): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://nvd.nist.gov/vuln/detail/CVE-2026-6844 *
CVE-2026-6845 (CVSSv3: 5.0): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://nvd.nist.gov/vuln/detail/CVE-2026-6845 *
CVE-2026-8674 (CVSSv3: 5.3): glibc https://nvd.nist.gov/vuln/detail/CVE-2026-8674 *
CVE-2026-12548 (CVSSv3: 4.2): libsoup https://nvd.nist.gov/vuln/detail/CVE-2026-12548 *
CVE-2026-12549 (CVSSv3: 4.8): libsoup https://nvd.nist.gov/vuln/detail/CVE-2026-12549 *
CVE-2026-15310 (CVSSv4: 2.1): python3:python3-native https://nvd.nist.gov/vuln/detail/CVE-2026-15310 *
CVE-2026-15534 (CVSSv3: 5.7): perl:perl-native https://nvd.nist.gov/vuln/detail/CVE-2026-15534 *
CVE-2026-15806 (CVSSv4: 6.0): python3:python3-native https://nvd.nist.gov/vuln/detail/CVE-2026-15806 *
CVE-2026-17084 (CVSSv4: 6.0): python3:python3-native https://nvd.nist.gov/vuln/detail/CVE-2026-17084 *
CVE-2026-18374 (CVSSv3: 4.9): glibc https://nvd.nist.gov/vuln/detail/CVE-2026-18374 *
CVE-2026-18477 (CVSSv3: 4.4): tar https://nvd.nist.gov/vuln/detail/CVE-2026-18477 *
CVE-2026-18487 (CVSSv3: 5.4): epiphany https://nvd.nist.gov/vuln/detail/CVE-2026-18487 *
CVE-2026-18508 (CVSSv3: 4.4): tar https://nvd.nist.gov/vuln/detail/CVE-2026-18508 *
CVE-2026-18739 (CVSSv3: 2.5): popt:popt-native https://nvd.nist.gov/vuln/detail/CVE-2026-18739 *
CVE-2026-18743 (CVSSv3: 2.5): popt:popt-native https://nvd.nist.gov/vuln/detail/CVE-2026-18743 *
CVE-2026-18839 (CVSSv3: 2.2): popt:popt-native https://nvd.nist.gov/vuln/detail/CVE-2026-18839 *
CVE-2026-19033 (CVSSv3: 6.5): bind https://nvd.nist.gov/vuln/detail/CVE-2026-19033 *
CVE-2026-19499 (CVSSv3: 7.7): glibc https://nvd.nist.gov/vuln/detail/CVE-2026-19499 *
CVE-2026-19542 (CVSSv3: 5.6): glibc https://nvd.nist.gov/vuln/detail/CVE-2026-19542 *
CVE-2026-19662 (CVSSv3: 5.9): bind https://nvd.nist.gov/vuln/detail/CVE-2026-19662 *
CVE-2026-19666 (CVSSv3: 7.5): bind https://nvd.nist.gov/vuln/detail/CVE-2026-19666 *
CVE-2026-19667 (CVSSv3: 7.5): bind https://nvd.nist.gov/vuln/detail/CVE-2026-19667 *
CVE-2026-19668 (CVSSv3: 5.3): bind https://nvd.nist.gov/vuln/detail/CVE-2026-19668 *
CVE-2026-19672 (CVSSv4: 6.3): python3:python3-native https://nvd.nist.gov/vuln/detail/CVE-2026-19672 *
CVE-2026-19774 (CVSSv3: 7.1): bluez5 https://nvd.nist.gov/vuln/detail/CVE-2026-19774 *
CVE-2026-19941 (CVSSv3: 5.9): bind https://nvd.nist.gov/vuln/detail/CVE-2026-19941 *
CVE-2026-28529 (CVSSv3: 7.8, CVSSv4: 8.5): cryptodev-linux https://nvd.nist.gov/vuln/detail/CVE-2026-28529 *
CVE-2026-38752 (CVSSv3: 7.5): busybox https://nvd.nist.gov/vuln/detail/CVE-2026-38752 *
CVE-2026-38753 (CVSSv3: 7.5): busybox https://nvd.nist.gov/vuln/detail/CVE-2026-38753 *
CVE-2026-38755 (CVSSv3: 7.5): busybox https://nvd.nist.gov/vuln/detail/CVE-2026-38755 *
CVE-2026-39919 (CVSSv3: 9.8, CVSSv4: 9.3): ghostscript https://nvd.nist.gov/vuln/detail/CVE-2026-39919 *
CVE-2026-44950 (CVSSv3: 9.0, CVSSv4: 9.5): libxfont2 https://nvd.nist.gov/vuln/detail/CVE-2026-44950 *
CVE-2026-55654 (CVSSv3: 3.7): openssh https://nvd.nist.gov/vuln/detail/CVE-2026-55654 *
CVE-2026-55655 (CVSSv3: 6.1): openssh https://nvd.nist.gov/vuln/detail/CVE-2026-55655 *
CVE-2026-56390 (CVSSv3: 6.3, CVSSv4: 4.6): bison:bison-native https://nvd.nist.gov/vuln/detail/CVE-2026-56390 *
CVE-2026-58049 (CVSSv3: 8.6, CVSSv4: 8.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-58049 *
CVE-2026-59679 (CVSSv3: 9.0, CVSSv4: 9.2): libxfont2 https://nvd.nist.gov/vuln/detail/CVE-2026-59679 *
CVE-2026-66337 (CVSSv3: 6.5): libsoup https://nvd.nist.gov/vuln/detail/CVE-2026-66337 *
CVE-2026-66338 (CVSSv3: 7.2): libsoup https://nvd.nist.gov/vuln/detail/CVE-2026-66338 *
CVE-2026-66339 (CVSSv3: 6.5): libsoup https://nvd.nist.gov/vuln/detail/CVE-2026-66339 *
CVE-2026-68086 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-68086 *
CVE-2026-75029 (CVSSv3: 5.3): bind https://nvd.nist.gov/vuln/detail/CVE-2026-75029 *
CVE-2026-75141 (CVSSv3: 7.8, CVSSv4: 8.5): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-75141 *
CVE-2026-75142 (CVSSv3: 7.8, CVSSv4: 8.5): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-75142 *
CVE-2026-75143 (CVSSv3: 9.8, CVSSv4: 9.3): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-75143 *
CVE-2026-75144 (CVSSv3: 7.8, CVSSv4: 8.5): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-75144 *
CVE-2026-75145 (CVSSv3: 5.8, CVSSv4: 5.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-75145 *
CVE-2026-75146 (CVSSv3: 8.1, CVSSv4: 7.2): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-75146 *
CVE-2026-75147 (CVSSv3: 7.1, CVSSv4: 6.9): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-75147 *
CVE-2026-76163 (CVSSv3: 7.5): bind https://nvd.nist.gov/vuln/detail/CVE-2026-76163 *
CVE-2026-77117 (CVSSv3: 5.9): glibc https://nvd.nist.gov/vuln/detail/CVE-2026-77117 *
CVE-2026-77119 (CVSSv3: 5.9): bind https://nvd.nist.gov/vuln/detail/CVE-2026-77119 *
CVE-2026-77692 (CVSSv3: 7.5): bind https://nvd.nist.gov/vuln/detail/CVE-2026-77692 *
CVE-2026-78301 (CVSSv3: 5.8): bind https://nvd.nist.gov/vuln/detail/CVE-2026-78301 *
CVE-2026-78376 (CVSSv3: 8.8): webkitgtk https://nvd.nist.gov/vuln/detail/CVE-2026-78376 *
CVE-2026-80274 (CVSSv3: 7.5): bind https://nvd.nist.gov/vuln/detail/CVE-2026-80274 *
CVE-2026-80489 (CVSSv3: 5.9): glibc https://nvd.nist.gov/vuln/detail/CVE-2026-80489 *
CVE-2026-81281 (CVSSv3: 6.5): graphene https://nvd.nist.gov/vuln/detail/CVE-2026-81281 *
CVE-2026-81563 (CVSSv3: 7.5): bind https://nvd.nist.gov/vuln/detail/CVE-2026-81563 *
CVE-2026-81736 (CVSSv3: 7.5): bind https://nvd.nist.gov/vuln/detail/CVE-2026-81736 *
CVE-2026-82474 (CVSSv3: 7.8, CVSSv4: 8.5): sudo https://nvd.nist.gov/vuln/detail/CVE-2026-82474 *
CVE-2026-82560 (CVSS: N/A): perl:perl-native https://nvd.nist.gov/vuln/detail/CVE-2026-82560 *
CVE-2026-83596 (CVSSv3: 8.8): webkitgtk https://nvd.nist.gov/vuln/detail/CVE-2026-83596 *
CVE-2026-85091 (CVSSv3: 7.4, CVSSv4: 8.3): zlib:zlib-native https://nvd.nist.gov/vuln/detail/CVE-2026-85091 *
CVE-2026-87910 (CVSSv4: 5.7): python3:python3-native https://nvd.nist.gov/vuln/detail/CVE-2026-87910 *
CVE-2026-89092 (CVSSv3: 4.2): glibc https://nvd.nist.gov/vuln/detail/CVE-2026-89092 *
CVE-2026-90781 (CVSSv3: 4.4, CVSSv4: 4.8): alsa-lib:alsa-lib-native https://nvd.nist.gov/vuln/detail/CVE-2026-90781 *
CVE-2026-90801 (CVSSv2: 4.3, CVSSv3: 5.3, CVSSv4: 4.8): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://nvd.nist.gov/vuln/detail/CVE-2026-90801 *
CVE-2026-90802 (CVSSv2: 3.2, CVSSv3: 4.4, CVSSv4: 4.8): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://nvd.nist.gov/vuln/detail/CVE-2026-90802 *
CVE-2026-90803 (CVSSv2: 4.3, CVSSv3: 5.3, CVSSv4: 4.8): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://nvd.nist.gov/vuln/detail/CVE-2026-90803 *
CVE-2026-90804 (CVSSv2: 4.3, CVSSv3: 4.8, CVSSv4: 2.4): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://nvd.nist.gov/vuln/detail/CVE-2026-90804 *
CVE-2026-90828 (CVSSv2: 4.3, CVSSv3: 5.3, CVSSv4: 4.8): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://nvd.nist.gov/vuln/detail/CVE-2026-90828 *
CVE-2026-90829 (CVSSv2: 4.3, CVSSv3: 5.3, CVSSv4: 4.8): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://nvd.nist.gov/vuln/detail/CVE-2026-90829 *
CVE-2026-90830 (CVSSv2: 4.3, CVSSv3: 5.3, CVSSv4: 4.8): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://nvd.nist.gov/vuln/detail/CVE-2026-90830 *
CVE-2026-90831 (CVSSv2: 4.3, CVSSv3: 5.3, CVSSv4: 4.8): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://nvd.nist.gov/vuln/detail/CVE-2026-90831 *
CVE-2026-91779 (CVSSv2: 1.7, CVSSv3: 3.3, CVSSv4: 4.8): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://nvd.nist.gov/vuln/detail/CVE-2026-91779 *
CVE-2026-91780 (CVSSv2: 1.7, CVSSv3: 3.3, CVSSv4: 4.8): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://nvd.nist.gov/vuln/detail/CVE-2026-91780 *
CVE-2026-91781 (CVSSv2: 1.7, CVSSv3: 3.3, CVSSv4: 4.8): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://nvd.nist.gov/vuln/detail/CVE-2026-91781 *
CVE-2026-91782 (CVSSv2: 1.7, CVSSv3: 3.3, CVSSv4: 4.8): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://nvd.nist.gov/vuln/detail/CVE-2026-91782 *
CVE-2026-93990 (CVSSv3: 7.5, CVSSv4: 8.7): expat:expat-native https://nvd.nist.gov/vuln/detail/CVE-2026-93990 *

Summary of CVE counts by recipe:
  binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite: 16
  bind: 14
  linux-yocto: 10
  libsoup: 9
  ffmpeg: 8
  glibc: 7
  python3:python3-native: 6
  popt:popt-native: 3
  busybox: 3
  libsndfile1: 2
  perl:perl-native: 2
  tar: 2
  libxfont2: 2
  openssh: 2
  webkitgtk: 2
  xdg-utils: 1
  libgcrypt:libgcrypt-native: 1
  cups: 1
  cairo:cairo-native: 1
  libtheora: 1
  epiphany: 1
  bluez5: 1
  cryptodev-linux: 1
  ghostscript: 1
  bison:bison-native: 1
  graphene: 1
  sudo: 1
  zlib:zlib-native: 1
  alsa-lib:alsa-lib-native: 1
  expat:expat-native: 1

For further information see: https://valkyrie.yocto.io/pub/non-release/patchmetrics/

