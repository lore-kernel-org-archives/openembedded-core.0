Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BBEAC5516F
	for <webhook@archiver.kernel.org>; Mon,  3 Aug 2026 04:18:26 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.36433.1785730699053014994
 for <openembedded-core@lists.openembedded.org>;
 Sun, 02 Aug 2026 21:18:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Ti4CNbvR;
 spf=pass (domain: smile.fr, ip: 209.85.128.43, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-493f6de72faso10873645e9.0
        for <openembedded-core@lists.openembedded.org>; Sun, 02 Aug 2026 21:18:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1785730697; x=1786335497; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=51thqw9UTOX3ClI9Ata3R9/7Zv4G3E/qNutrEhFdMZA=;
        b=Ti4CNbvRsPN5zwMI52fazMsIHbR2NZLqlT1WdcAAokFB0LtUxp1ZcLqaEMctmZGfyJ
         3n64zTaayfW4zkNawS0b+f9liEygWoOZwaB5BHh9/A1Qulx6tfr63dEWsWjnWTGmremO
         RzRA842sSBfep//xcax0BIfYZBv7ZDw7F9GeU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785730697; x=1786335497;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=51thqw9UTOX3ClI9Ata3R9/7Zv4G3E/qNutrEhFdMZA=;
        b=I5uIkArwD0zWGxjQQZLwzvP8ipdRIMW3TsNM2igjtPkl+Pd9TWRF8E0AZF3ppdQI6g
         u1kz90Eunb84JuYc8BVJTa2aUeD3/gADzqt02uQ0+FPmK7/s5/DfU1JLxuOQZxY8mbkE
         8gKt/rEf3V9qz+mLD84B46kTTVLwXdlJc63DEgOtGBJcZoExK9Rzlh6UBTDHBgvn/IFj
         iTcC/+4w/KeXvjQcNAytL0KPkItTw2OVTNHPBcMCbeBN+mbBCJIo+TCxihTsyLCFux7M
         d07dgasZPwNeTyo8eNIQrBAQSHBVSEzhVN46pAw+0WSJd+XnwC2SJ+4MoFColz2mrP9E
         wOXg==
X-Gm-Message-State: AOJu0Yxb8EM/lLvAqNs+dHbfuWyFnBv6kEx/fhWI3Mn+C+xTLdXyaSSO
	tb7IPZW+rXmI5vLoO84exJKOEZQptpViyBHzYPhw3+7JDqTl2V6mQzUVFzDiHbUu1VtWvm2hQx9
	T0A9ISIk=
X-Gm-Gg: AR+sD12AiyCUG14A9UH5NjHqMMxVJDQlexnk8THyPuiFGSxs2wOfgq9e7z+hpI9JKpG
	+wKRWmNBDXLC1rWekO8H6R4Z5NJDUYH/XSJElLtftzOV71w9QxlWZ3tE8eyrk14dlIvrx5M1OY7
	C2mVxntUxMnt2nogXNIpBCC/5QdD6rx8x1emZdf8vcQpcm81f1VqOXZ2TWYZE+rKHfm2C+7Nsly
	DGu0vIZ9/key+0Ifhk2WCMGF2WFWwaDv41uDhhPRDZNsi8AFr4D37r9Y3OVv+4dKWctGSsBZccU
	1ZTX1cNUbLyXX+DSgOHgerDMdKuETD1lVRP5Dxjz1Ipcd7pGC9hY7Ggf2KhC6KV0Rek2IrirS/B
	6XGRTxZOIauJPr/tyenOc3bw3yCJ/wBxRwUCgoJXThbtuFvRQgA/AZvnuFoYGLl3qADF4OJNBZ+
	BDzaej4YFQbZVYpopc/6xvJhbftZEWss62OZi1BLrzOONmQ0gU66YUdBMRgr8OGWK0Z4XEvRf2P
	p6/w04NMzq353lXJ5vrBoMxQyfowcFlF89y602/ZbpDRIx4SlWJQxEcGYJPWixHHWfiDrkHh67U
	lAMXa9q7IJXJYON9233QZbnBTtG/BXld
X-Received: by 2002:a05:600d:8653:20b0:495:636b:e50b with SMTP id 5b1f17b1804b1-4980eb9f521mr132431995e9.6.1785730695873;
        Sun, 02 Aug 2026 21:18:15 -0700 (PDT)
Received: from runner-glrt-sin-project-19509-concurrent-0.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd41cfde0sm27089008f8f.3.2026.08.02.21.18.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 21:18:15 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: OE-Core ML <openembedded-core@lists.openembedded.org>,
	Yocto Security ML <yocto-security@lists.yoctoproject.org>
Subject: OE-core CVE metrics for wrynose on Mon Aug 03 03:04:56 2026
Date: Mon,  3 Aug 2026 04:18:13 +0000
Message-ID: <20260803041813.20-3-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260803041813.20-1-yoann.congal@smile.fr>
References: <20260803041813.20-1-yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Aug 2026 04:18:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242600

Branch: wrynose

New this week: 40 CVEs
CVE-2025-56005 (CVSSv3: 9.8): python3-ply https://nvd.nist.gov/vuln/detail/CVE-2025-56005 *
CVE-2026-5056 (CVSSv3: 7.8): gstreamer1.0 https://nvd.nist.gov/vuln/detail/CVE-2026-5056 *
CVE-2026-6879 (CVSSv4: 2.0): python3:python3-native https://nvd.nist.gov/vuln/detail/CVE-2026-6879 *
CVE-2026-13595 (CVSSv3: 6.8): util-linux:util-linux-libuuid:util-linux-libuuid-native:util-linux-native https://nvd.nist.gov/vuln/detail/CVE-2026-13595 *
CVE-2026-30922 (CVSSv3: 7.5): python3-pyasn1 https://nvd.nist.gov/vuln/detail/CVE-2026-30922 *
CVE-2026-34073 (CVSSv3: 5.3, CVSSv4: 1.7): python3-cryptography https://nvd.nist.gov/vuln/detail/CVE-2026-34073 *
CVE-2026-39892 (CVSSv3: 9.8, CVSSv4: 6.9): python3-cryptography https://nvd.nist.gov/vuln/detail/CVE-2026-39892 *
CVE-2026-56389 (CVSSv4: 6.8): bison:bison-native https://nvd.nist.gov/vuln/detail/CVE-2026-56389 *
CVE-2026-56390 (CVSSv4: 4.6): bison:bison-native https://nvd.nist.gov/vuln/detail/CVE-2026-56390 *
CVE-2026-59884 (CVSSv3: 7.5): python3-pyasn1 https://nvd.nist.gov/vuln/detail/CVE-2026-59884 *
CVE-2026-59885 (CVSSv3: 7.5): python3-pyasn1 https://nvd.nist.gov/vuln/detail/CVE-2026-59885 *
CVE-2026-59886 (CVSSv3: 7.5): python3-pyasn1 https://nvd.nist.gov/vuln/detail/CVE-2026-59886 *
CVE-2026-64531 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64531 *
CVE-2026-64532 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64532 *
CVE-2026-64533 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64533 *
CVE-2026-64534 (CVSSv3: 9.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64534 *
CVE-2026-64535 (CVSSv3: 9.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64535 *
CVE-2026-64537 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64537 *
CVE-2026-64538 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64538 *
CVE-2026-64539 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64539 *
CVE-2026-64540 (CVSSv3: 8.1): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64540 *
CVE-2026-64541 (CVSSv3: 9.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64541 *
CVE-2026-64542 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64542 *
CVE-2026-64543 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64543 *
CVE-2026-64544 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64544 *
CVE-2026-64545 (CVSSv3: 7.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64545 *
CVE-2026-64546 (CVSSv3: 7.1): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64546 *
CVE-2026-64547 (CVSSv3: 8.1): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64547 *
CVE-2026-64548 (CVSSv3: 8.4): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64548 *
CVE-2026-64549 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64549 *
CVE-2026-64550 (CVSSv3: 7.3): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64550 *
CVE-2026-64551 (CVSSv3: 9.1): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64551 *
CVE-2026-64552 (CVSSv3: 8.4): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64552 *
CVE-2026-64553 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64553 *
CVE-2026-64554 (CVSSv3: 8.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64554 *
CVE-2026-64555 (CVSSv3: 8.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64555 *
CVE-2026-64557 (CVSSv3: 8.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64557 *
CVE-2026-64558 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64558 *
CVE-2026-64559 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64559 *
CVE-2026-64560 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64560 *

Removed this week: 552 CVEs
CVE-2025-15661 (CVSSv3: 6.5, CVSSv4: 8.3): libssh2:libssh2-native https://nvd.nist.gov/vuln/detail/CVE-2025-15661 *
CVE-2026-3832 (CVSSv3: 3.7): gnutls:gnutls-native https://nvd.nist.gov/vuln/detail/CVE-2026-3832 *
CVE-2026-3833 (CVSSv3: 7.4): gnutls:gnutls-native https://nvd.nist.gov/vuln/detail/CVE-2026-3833 *
CVE-2026-5545 (CVSSv3: 6.5): curl:curl-native https://nvd.nist.gov/vuln/detail/CVE-2026-5545 *
CVE-2026-6253 (CVSSv3: 5.9): curl:curl-native https://nvd.nist.gov/vuln/detail/CVE-2026-6253 *
CVE-2026-6429 (CVSSv3: 5.3): curl:curl-native https://nvd.nist.gov/vuln/detail/CVE-2026-6429 *
CVE-2026-7168 (CVSSv3: 5.3): curl:curl-native https://nvd.nist.gov/vuln/detail/CVE-2026-7168 *
CVE-2026-10536 (CVSSv3: 9.8): curl:curl-native https://nvd.nist.gov/vuln/detail/CVE-2026-10536 *
CVE-2026-11822 (CVSSv3: 7.8, CVSSv4: 8.5): sqlite3:sqlite3-native https://nvd.nist.gov/vuln/detail/CVE-2026-11822 *
CVE-2026-11824 (CVSSv3: 7.8, CVSSv4: 8.5): sqlite3:sqlite3-native https://nvd.nist.gov/vuln/detail/CVE-2026-11824 *
CVE-2026-16768 (CVSSv3: 5.3): gdk-pixbuf:gdk-pixbuf-native https://nvd.nist.gov/vuln/detail/CVE-2026-16768 *
CVE-2026-34757 (CVSSv3: 5.1): libpng:libpng-native https://nvd.nist.gov/vuln/detail/CVE-2026-34757 *
CVE-2026-40467 (CVSSv3: 7.5, CVSSv4: 5.1): gawk:gawk-native https://nvd.nist.gov/vuln/detail/CVE-2026-40467 *
CVE-2026-40468 (CVSSv3: 9.1, CVSSv4: 2.1): gawk:gawk-native https://nvd.nist.gov/vuln/detail/CVE-2026-40468 *
CVE-2026-40469 (CVSSv3: 9.1, CVSSv4: 5.1): gawk:gawk-native https://nvd.nist.gov/vuln/detail/CVE-2026-40469 *
CVE-2026-40553 (CVSSv3: 7.5, CVSSv4: 5.1): gawk:gawk-native https://nvd.nist.gov/vuln/detail/CVE-2026-40553 *
CVE-2026-40930 (CVSSv3: 5.4): libpng:libpng-native https://nvd.nist.gov/vuln/detail/CVE-2026-40930 *
CVE-2026-41989 (CVSSv3: 6.7): libgcrypt:libgcrypt-native https://nvd.nist.gov/vuln/detail/CVE-2026-41989 *
CVE-2026-41990 (CVSSv3: 4.0): libgcrypt:libgcrypt-native https://nvd.nist.gov/vuln/detail/CVE-2026-41990 *
CVE-2026-41991 (CVSSv3: 4.7, CVSSv4: 2.0): gzip https://nvd.nist.gov/vuln/detail/CVE-2026-41991 *
CVE-2026-42307 (CVSSv3: 4.4): vim https://nvd.nist.gov/vuln/detail/CVE-2026-42307 *
CVE-2026-45850 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-45850 *
CVE-2026-45945 (CVSSv3: 8.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-45945 *
CVE-2026-46054 (CVSSv3: 7.1): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-46054 *
CVE-2026-46203 (CVSSv3: 7.1): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-46203 *
CVE-2026-46252 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-46252 *
CVE-2026-46320 (CVSSv3: 7.4): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-46320 *
CVE-2026-46331 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-46331 *
CVE-2026-47162 (CVSSv3: 8.8, CVSSv4: 7.3): vim https://nvd.nist.gov/vuln/detail/CVE-2026-47162 *
CVE-2026-47167 (CVSSv3: 5.3, CVSSv4: 5.1): vim https://nvd.nist.gov/vuln/detail/CVE-2026-47167 *
CVE-2026-52908 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-52908 *
CVE-2026-52909 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-52909 *
CVE-2026-52910 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-52910 *
CVE-2026-52917 (CVSSv3: 7.1): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-52917 *
CVE-2026-52924 (CVSSv3: 9.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-52924 *
CVE-2026-52929 (CVSSv3: 7.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-52929 *
CVE-2026-52930 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-52930 *
CVE-2026-52935 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-52935 *
CVE-2026-52939 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-52939 *
CVE-2026-52940 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-52940 *
CVE-2026-52942 (CVSSv3: 7.1): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-52942 *
CVE-2026-52946 (CVSSv3: 7.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-52946 *
CVE-2026-52947 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-52947 *
CVE-2026-52948 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-52948 *
CVE-2026-53027 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53027 *
CVE-2026-53070 (CVSSv3: 7.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53070 *
CVE-2026-53131 (CVSSv3: 9.4): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53131 *
CVE-2026-53132 (CVSSv3: 7.1): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53132 *
CVE-2026-53133 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53133 *
CVE-2026-53134 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53134 *
CVE-2026-53135 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53135 *
CVE-2026-53136 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53136 *
CVE-2026-53137 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53137 *
CVE-2026-53138 (CVSSv3: 7.1): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53138 *
CVE-2026-53139 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53139 *
CVE-2026-53140 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53140 *
CVE-2026-53141 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53141 *
CVE-2026-53142 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53142 *
CVE-2026-53143 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53143 *
CVE-2026-53144 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53144 *
CVE-2026-53145 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53145 *
CVE-2026-53146 (CVSSv3: 7.1): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53146 *
CVE-2026-53147 (CVSSv3: 8.1): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53147 *
CVE-2026-53148 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53148 *
CVE-2026-53149 (CVSSv3: 7.1): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53149 *
CVE-2026-53150 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53150 *
CVE-2026-53151 (CVSSv3: 9.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53151 *
CVE-2026-53152 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53152 *
CVE-2026-53153 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53153 *
CVE-2026-53154 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53154 *
CVE-2026-53156 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53156 *
CVE-2026-53157 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53157 *
CVE-2026-53158 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53158 *
CVE-2026-53159 (CVSSv3: 8.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53159 *
CVE-2026-53160 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53160 *
CVE-2026-53161 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53161 *
CVE-2026-53162 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53162 *
CVE-2026-53163 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53163 *
CVE-2026-53164 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53164 *
CVE-2026-53167 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53167 *
CVE-2026-53168 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53168 *
CVE-2026-53175 (CVSSv3: 9.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53175 *
CVE-2026-53176 (CVSSv3: 9.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53176 *
CVE-2026-53177 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53177 *
CVE-2026-53179 (CVSSv3: 7.1): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53179 *
CVE-2026-53180 (CVSSv3: 7.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53180 *
CVE-2026-53181 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53181 *
CVE-2026-53182 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53182 *
CVE-2026-53183 (CVSSv3: 7.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53183 *
CVE-2026-53184 (CVSSv3: 7.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53184 *
CVE-2026-53185 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53185 *
CVE-2026-53186 (CVSSv3: 9.1): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53186 *
CVE-2026-53187 (CVSSv3: 7.1): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53187 *
CVE-2026-53188 (CVSSv3: 8.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53188 *
CVE-2026-53189 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53189 *
CVE-2026-53190 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53190 *
CVE-2026-53191 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53191 *
CVE-2026-53192 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53192 *
CVE-2026-53193 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53193 *
CVE-2026-53194 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53194 *
CVE-2026-53195 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53195 *
CVE-2026-53196 (CVSSv3: 6.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53196 *
CVE-2026-53197 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53197 *
CVE-2026-53198 (CVSSv3: 8.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53198 *
CVE-2026-53199 (CVSSv3: 7.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53199 *
CVE-2026-53202 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53202 *
CVE-2026-53203 (CVSSv3: 7.1): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53203 *
CVE-2026-53205 (CVSSv3: 7.1): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53205 *
CVE-2026-53207 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53207 *
CVE-2026-53208 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53208 *
CVE-2026-53209 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53209 *
CVE-2026-53210 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53210 *
CVE-2026-53211 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53211 *
CVE-2026-53212 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53212 *
CVE-2026-53213 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53213 *
CVE-2026-53214 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53214 *
CVE-2026-53215 (CVSSv3: 9.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53215 *
CVE-2026-53216 (CVSSv3: 9.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53216 *
CVE-2026-53217 (CVSSv3: 8.6): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53217 *
CVE-2026-53218 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53218 *
CVE-2026-53219 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53219 *
CVE-2026-53220 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53220 *
CVE-2026-53221 (CVSSv3: 9.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53221 *
CVE-2026-53223 (CVSSv3: 7.1): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53223 *
CVE-2026-53224 (CVSSv3: 9.1): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53224 *
CVE-2026-53225 (CVSSv3: 9.1): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53225 *
CVE-2026-53226 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53226 *
CVE-2026-53227 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53227 *
CVE-2026-53228 (CVSSv3: 9.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53228 *
CVE-2026-53229 (CVSSv3: 7.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53229 *
CVE-2026-53230 (CVSSv3: 8.7): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53230 *
CVE-2026-53232 (CVSSv3: 8.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53232 *
CVE-2026-53233 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53233 *
CVE-2026-53234 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53234 *
CVE-2026-53235 (CVSSv3: 7.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53235 *
CVE-2026-53236 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53236 *
CVE-2026-53237 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53237 *
CVE-2026-53238 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53238 *
CVE-2026-53239 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53239 *
CVE-2026-53240 (CVSSv3: 8.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53240 *
CVE-2026-53241 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53241 *
CVE-2026-53242 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53242 *
CVE-2026-53245 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53245 *
CVE-2026-53246 (CVSSv3: 9.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53246 *
CVE-2026-53247 (CVSSv3: 9.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53247 *
CVE-2026-53248 (CVSSv3: 8.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53248 *
CVE-2026-53249 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53249 *
CVE-2026-53250 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53250 *
CVE-2026-53251 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53251 *
CVE-2026-53252 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53252 *
CVE-2026-53253 (CVSSv3: 7.1): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53253 *
CVE-2026-53254 (CVSSv3: 8.1): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53254 *
CVE-2026-53255 (CVSSv3: 7.1): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53255 *
CVE-2026-53256 (CVSSv3: 8.0): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53256 *
CVE-2026-53258 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53258 *
CVE-2026-53259 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53259 *
CVE-2026-53261 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53261 *
CVE-2026-53262 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53262 *
CVE-2026-53263 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53263 *
CVE-2026-53264 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53264 *
CVE-2026-53265 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53265 *
CVE-2026-53266 (CVSSv3: 8.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53266 *
CVE-2026-53267 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53267 *
CVE-2026-53268 (CVSSv3: 8.2): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53268 *
CVE-2026-53269 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53269 *
CVE-2026-53270 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53270 *
CVE-2026-53271 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53271 *
CVE-2026-53272 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53272 *
CVE-2026-53273 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53273 *
CVE-2026-53274 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53274 *
CVE-2026-53275 (CVSSv3: 8.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53275 *
CVE-2026-53277 (CVSSv3: 8.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53277 *
CVE-2026-53325 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53325 *
CVE-2026-53327 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53327 *
CVE-2026-53328 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53328 *
CVE-2026-53329 (CVSSv3: 7.0): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53329 *
CVE-2026-53330 (CVSSv3: 7.1): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53330 *
CVE-2026-53331 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53331 *
CVE-2026-53332 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53332 *
CVE-2026-53333 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53333 *
CVE-2026-53334 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53334 *
CVE-2026-53335 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53335 *
CVE-2026-53336 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53336 *
CVE-2026-53337 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53337 *
CVE-2026-53338 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53338 *
CVE-2026-53339 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53339 *
CVE-2026-53340 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53340 *
CVE-2026-53341 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53341 *
CVE-2026-53342 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53342 *
CVE-2026-53343 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53343 *
CVE-2026-53345 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53345 *
CVE-2026-53346 (CVSSv3: 7.1): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53346 *
CVE-2026-53347 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53347 *
CVE-2026-53349 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53349 *
CVE-2026-53350 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53350 *
CVE-2026-53352 (CVSSv3: 4.7): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53352 *
CVE-2026-53353 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53353 *
CVE-2026-53354 (CVSSv3: 8.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53354 *
CVE-2026-53355 (CVSSv3: 9.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53355 *
CVE-2026-53356 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53356 *
CVE-2026-53359 (CVSSv3: 8.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53359 *
CVE-2026-53361 (CVSSv3: 7.1): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53361 *
CVE-2026-53362 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53362 *
CVE-2026-53363 (CVSSv3: 9.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53363 *
CVE-2026-53366 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53366 *
CVE-2026-53381 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53381 *
CVE-2026-53382 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53382 *
CVE-2026-53383 (CVSSv3: 7.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53383 *
CVE-2026-53384 (CVSSv3: 9.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53384 *
CVE-2026-53385 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53385 *
CVE-2026-53386 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53386 *
CVE-2026-53387 (CVSSv3: 7.1): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53387 *
CVE-2026-53388 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53388 *
CVE-2026-53389 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53389 *
CVE-2026-53390 (CVSSv3: 8.1): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53390 *
CVE-2026-53391 (CVSSv3: 7.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53391 *
CVE-2026-53392 (CVSSv3: 7.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53392 *
CVE-2026-53393 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53393 *
CVE-2026-53394 (CVSSv3: 7.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53394 *
CVE-2026-53397 (CVSSv3: 7.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53397 *
CVE-2026-53398 (CVSSv3: 9.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53398 *
CVE-2026-53399 (CVSSv3: 9.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53399 *
CVE-2026-53400 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53400 *
CVE-2026-53402 (CVSSv3: 7.1): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53402 *
CVE-2026-53403 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53403 *
CVE-2026-55653 (CVSSv3: 6.5): openssh https://nvd.nist.gov/vuln/detail/CVE-2026-55653 *
CVE-2026-55654 (CVSSv3: 3.7): openssh https://nvd.nist.gov/vuln/detail/CVE-2026-55654 *
CVE-2026-55655 (CVSSv3: 6.1): openssh https://nvd.nist.gov/vuln/detail/CVE-2026-55655 *
CVE-2026-55892 (CVSSv3: 5.5): vim https://nvd.nist.gov/vuln/detail/CVE-2026-55892 *
CVE-2026-56132 (CVSSv3: 6.9): expat:expat-native https://nvd.nist.gov/vuln/detail/CVE-2026-56132 *
CVE-2026-56403 (CVSSv3: 6.9): expat:expat-native https://nvd.nist.gov/vuln/detail/CVE-2026-56403 *
CVE-2026-56404 (CVSSv3: 6.9): expat:expat-native https://nvd.nist.gov/vuln/detail/CVE-2026-56404 *
CVE-2026-56405 (CVSSv3: 6.9): expat:expat-native https://nvd.nist.gov/vuln/detail/CVE-2026-56405 *
CVE-2026-56406 (CVSSv3: 6.9): expat:expat-native https://nvd.nist.gov/vuln/detail/CVE-2026-56406 *
CVE-2026-56407 (CVSSv3: 6.9): expat:expat-native https://nvd.nist.gov/vuln/detail/CVE-2026-56407 *
CVE-2026-56408 (CVSSv3: 6.9): expat:expat-native https://nvd.nist.gov/vuln/detail/CVE-2026-56408 *
CVE-2026-56409 (CVSSv3: 6.5): expat:expat-native https://nvd.nist.gov/vuln/detail/CVE-2026-56409 *
CVE-2026-56410 (CVSSv3: 6.9): expat:expat-native https://nvd.nist.gov/vuln/detail/CVE-2026-56410 *
CVE-2026-56411 (CVSSv3: 6.9): expat:expat-native https://nvd.nist.gov/vuln/detail/CVE-2026-56411 *
CVE-2026-57452 (CVSSv3: 5.5): vim https://nvd.nist.gov/vuln/detail/CVE-2026-57452 *
CVE-2026-58010 (CVSSv3: 8.2): glib-2.0:glib-2.0-initial:glib-2.0-native https://nvd.nist.gov/vuln/detail/CVE-2026-58010 *
CVE-2026-58011 (CVSSv3: 7.5): glib-2.0:glib-2.0-initial:glib-2.0-native https://nvd.nist.gov/vuln/detail/CVE-2026-58011 *
CVE-2026-58012 (CVSSv3: 8.2): glib-2.0:glib-2.0-initial:glib-2.0-native https://nvd.nist.gov/vuln/detail/CVE-2026-58012 *
CVE-2026-58013 (CVSSv3: 8.2): glib-2.0:glib-2.0-initial:glib-2.0-native https://nvd.nist.gov/vuln/detail/CVE-2026-58013 *
CVE-2026-58014 (CVSSv3: 8.6): glib-2.0:glib-2.0-initial:glib-2.0-native https://nvd.nist.gov/vuln/detail/CVE-2026-58014 *
CVE-2026-58015 (CVSSv3: 7.5): glib-2.0:glib-2.0-initial:glib-2.0-native https://nvd.nist.gov/vuln/detail/CVE-2026-58015 *
CVE-2026-59890 (CVSSv3: 6.1): python3-setuptools:python3-setuptools-native https://nvd.nist.gov/vuln/detail/CVE-2026-59890 *
CVE-2026-59995 (CVSSv3: 5.4): openssh https://nvd.nist.gov/vuln/detail/CVE-2026-59995 *
CVE-2026-59996 (CVSSv3: 5.4): openssh https://nvd.nist.gov/vuln/detail/CVE-2026-59996 *
CVE-2026-59997 (CVSSv3: 5.4): openssh https://nvd.nist.gov/vuln/detail/CVE-2026-59997 *
CVE-2026-59998 (CVSSv3: 6.5): openssh https://nvd.nist.gov/vuln/detail/CVE-2026-59998 *
CVE-2026-59999 (CVSSv3: 7.5): openssh https://nvd.nist.gov/vuln/detail/CVE-2026-59999 *
CVE-2026-60000 (CVSSv3: 7.5): openssh https://nvd.nist.gov/vuln/detail/CVE-2026-60000 *
CVE-2026-60001 (CVSSv3: 6.5): openssh https://nvd.nist.gov/vuln/detail/CVE-2026-60001 *
CVE-2026-60002 (CVSSv3: 9.4): openssh https://nvd.nist.gov/vuln/detail/CVE-2026-60002 *
CVE-2026-63794 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-63794 *
CVE-2026-63795 (CVSSv3: 10.0): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-63795 *
CVE-2026-63796 (CVSSv3: 8.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-63796 *
CVE-2026-63797 (CVSSv3: 8.4): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-63797 *
CVE-2026-63798 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-63798 *
CVE-2026-63800 (CVSSv3: 9.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-63800 *
CVE-2026-63801 (CVSSv3: 8.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-63801 *
CVE-2026-63802 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-63802 *
CVE-2026-63803 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-63803 *
CVE-2026-63804 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-63804 *
CVE-2026-63805 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-63805 *
CVE-2026-63806 (CVSSv3: 7.1): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-63806 *
CVE-2026-63807 (CVSSv3: 8.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-63807 *
CVE-2026-63808 (CVSSv3: 9.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-63808 *
CVE-2026-63809 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-63809 *
CVE-2026-63810 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-63810 *
CVE-2026-63812 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-63812 *
CVE-2026-63814 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-63814 *
CVE-2026-63815 (CVSSv3: 8.4): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-63815 *
CVE-2026-63816 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-63816 *
CVE-2026-63817 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-63817 *
CVE-2026-63818 (CVSSv3: 8.4): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-63818 *
CVE-2026-63819 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-63819 *
CVE-2026-63821 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-63821 *
CVE-2026-63822 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-63822 *
CVE-2026-63823 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-63823 *
CVE-2026-63824 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-63824 *
CVE-2026-63825 (CVSSv3: 9.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-63825 *
CVE-2026-63826 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-63826 *
CVE-2026-63827 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-63827 *
CVE-2026-63828 (CVSSv3: 8.4): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-63828 *
CVE-2026-63829 (CVSSv3: 8.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-63829 *
CVE-2026-63830 (CVSSv3: 9.4): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-63830 *
CVE-2026-63831 (CVSSv3: 8.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-63831 *
CVE-2026-63832 (CVSSv3: 8.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-63832 *
CVE-2026-63833 (CVSSv3: 7.1): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-63833 *
CVE-2026-63834 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-63834 *
CVE-2026-63835 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-63835 *
CVE-2026-63836 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-63836 *
CVE-2026-63867 (CVSSv3: 8.2): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-63867 *
CVE-2026-63868 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-63868 *
CVE-2026-63869 (CVSSv3: 7.6): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-63869 *
CVE-2026-63870 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-63870 *
CVE-2026-63871 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-63871 *
CVE-2026-63873 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-63873 *
CVE-2026-63874 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-63874 *
CVE-2026-64187 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64187 *
CVE-2026-64188 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64188 *
CVE-2026-64189 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64189 *
CVE-2026-64191 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64191 *
CVE-2026-64205 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64205 *
CVE-2026-64206 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64206 *
CVE-2026-64207 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64207 *
CVE-2026-64244 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64244 *
CVE-2026-64245 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64245 *
CVE-2026-64246 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64246 *
CVE-2026-64247 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64247 *
CVE-2026-64248 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64248 *
CVE-2026-64249 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64249 *
CVE-2026-64250 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64250 *
CVE-2026-64251 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64251 *
CVE-2026-64252 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64252 *
CVE-2026-64253 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64253 *
CVE-2026-64254 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64254 *
CVE-2026-64255 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64255 *
CVE-2026-64256 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64256 *
CVE-2026-64258 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64258 *
CVE-2026-64259 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64259 *
CVE-2026-64260 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64260 *
CVE-2026-64261 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64261 *
CVE-2026-64262 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64262 *
CVE-2026-64263 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64263 *
CVE-2026-64264 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64264 *
CVE-2026-64265 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64265 *
CVE-2026-64266 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64266 *
CVE-2026-64267 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64267 *
CVE-2026-64268 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64268 *
CVE-2026-64269 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64269 *
CVE-2026-64270 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64270 *
CVE-2026-64271 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64271 *
CVE-2026-64272 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64272 *
CVE-2026-64273 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64273 *
CVE-2026-64274 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64274 *
CVE-2026-64275 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64275 *
CVE-2026-64276 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64276 *
CVE-2026-64277 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64277 *
CVE-2026-64278 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64278 *
CVE-2026-64279 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64279 *
CVE-2026-64280 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64280 *
CVE-2026-64282 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64282 *
CVE-2026-64284 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64284 *
CVE-2026-64286 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64286 *
CVE-2026-64288 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64288 *
CVE-2026-64289 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64289 *
CVE-2026-64290 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64290 *
CVE-2026-64291 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64291 *
CVE-2026-64293 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64293 *
CVE-2026-64294 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64294 *
CVE-2026-64295 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64295 *
CVE-2026-64296 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64296 *
CVE-2026-64297 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64297 *
CVE-2026-64298 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64298 *
CVE-2026-64299 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64299 *
CVE-2026-64300 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64300 *
CVE-2026-64301 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64301 *
CVE-2026-64302 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64302 *
CVE-2026-64303 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64303 *
CVE-2026-64304 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64304 *
CVE-2026-64305 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64305 *
CVE-2026-64306 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64306 *
CVE-2026-64307 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64307 *
CVE-2026-64308 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64308 *
CVE-2026-64309 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64309 *
CVE-2026-64310 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64310 *
CVE-2026-64311 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64311 *
CVE-2026-64312 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64312 *
CVE-2026-64313 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64313 *
CVE-2026-64314 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64314 *
CVE-2026-64315 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64315 *
CVE-2026-64316 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64316 *
CVE-2026-64317 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64317 *
CVE-2026-64318 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64318 *
CVE-2026-64319 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64319 *
CVE-2026-64320 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64320 *
CVE-2026-64321 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64321 *
CVE-2026-64322 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64322 *
CVE-2026-64323 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64323 *
CVE-2026-64324 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64324 *
CVE-2026-64326 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64326 *
CVE-2026-64327 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64327 *
CVE-2026-64328 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64328 *
CVE-2026-64329 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64329 *
CVE-2026-64330 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64330 *
CVE-2026-64331 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64331 *
CVE-2026-64332 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64332 *
CVE-2026-64333 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64333 *
CVE-2026-64334 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64334 *
CVE-2026-64335 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64335 *
CVE-2026-64336 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64336 *
CVE-2026-64337 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64337 *
CVE-2026-64338 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64338 *
CVE-2026-64339 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64339 *
CVE-2026-64340 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64340 *
CVE-2026-64342 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64342 *
CVE-2026-64343 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64343 *
CVE-2026-64344 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64344 *
CVE-2026-64345 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64345 *
CVE-2026-64346 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64346 *
CVE-2026-64347 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64347 *
CVE-2026-64348 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64348 *
CVE-2026-64350 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64350 *
CVE-2026-64351 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64351 *
CVE-2026-64354 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64354 *
CVE-2026-64355 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64355 *
CVE-2026-64356 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64356 *
CVE-2026-64357 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64357 *
CVE-2026-64358 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64358 *
CVE-2026-64359 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64359 *
CVE-2026-64360 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64360 *
CVE-2026-64362 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64362 *
CVE-2026-64363 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64363 *
CVE-2026-64364 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64364 *
CVE-2026-64365 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64365 *
CVE-2026-64366 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64366 *
CVE-2026-64367 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64367 *
CVE-2026-64368 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64368 *
CVE-2026-64369 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64369 *
CVE-2026-64370 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64370 *
CVE-2026-64372 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64372 *
CVE-2026-64373 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64373 *
CVE-2026-64374 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64374 *
CVE-2026-64376 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64376 *
CVE-2026-64377 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64377 *
CVE-2026-64378 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64378 *
CVE-2026-64379 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64379 *
CVE-2026-64380 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64380 *
CVE-2026-64381 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64381 *
CVE-2026-64382 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64382 *
CVE-2026-64383 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64383 *
CVE-2026-64384 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64384 *
CVE-2026-64385 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64385 *
CVE-2026-64386 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64386 *
CVE-2026-64387 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64387 *
CVE-2026-64391 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64391 *
CVE-2026-64392 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64392 *
CVE-2026-64393 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64393 *
CVE-2026-64394 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64394 *
CVE-2026-64395 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64395 *
CVE-2026-64396 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64396 *
CVE-2026-64397 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64397 *
CVE-2026-64398 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64398 *
CVE-2026-64399 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64399 *
CVE-2026-64400 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64400 *
CVE-2026-64401 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64401 *
CVE-2026-64402 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64402 *
CVE-2026-64403 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64403 *
CVE-2026-64404 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64404 *
CVE-2026-64405 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64405 *
CVE-2026-64406 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64406 *
CVE-2026-64407 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64407 *
CVE-2026-64408 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64408 *
CVE-2026-64409 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64409 *
CVE-2026-64411 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64411 *
CVE-2026-64412 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64412 *
CVE-2026-64413 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64413 *
CVE-2026-64414 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64414 *
CVE-2026-64415 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64415 *
CVE-2026-64416 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64416 *
CVE-2026-64417 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64417 *
CVE-2026-64418 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64418 *
CVE-2026-64419 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64419 *
CVE-2026-64420 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64420 *
CVE-2026-64422 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64422 *
CVE-2026-64423 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64423 *
CVE-2026-64424 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64424 *
CVE-2026-64425 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64425 *
CVE-2026-64426 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64426 *
CVE-2026-64428 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64428 *
CVE-2026-64429 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64429 *
CVE-2026-64430 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64430 *
CVE-2026-64432 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64432 *
CVE-2026-64433 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64433 *
CVE-2026-64434 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64434 *
CVE-2026-64435 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64435 *
CVE-2026-64436 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64436 *
CVE-2026-64439 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64439 *
CVE-2026-64440 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64440 *
CVE-2026-64442 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64442 *
CVE-2026-64443 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64443 *
CVE-2026-64444 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64444 *
CVE-2026-64445 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64445 *
CVE-2026-64446 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64446 *
CVE-2026-64447 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64447 *
CVE-2026-64448 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64448 *
CVE-2026-64449 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64449 *
CVE-2026-64450 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64450 *
CVE-2026-64452 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64452 *
CVE-2026-64453 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64453 *
CVE-2026-64454 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64454 *
CVE-2026-64455 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64455 *
CVE-2026-64456 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64456 *
CVE-2026-64457 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64457 *
CVE-2026-64458 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64458 *
CVE-2026-64459 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64459 *
CVE-2026-64460 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64460 *
CVE-2026-64461 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64461 *
CVE-2026-64462 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64462 *
CVE-2026-64463 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64463 *
CVE-2026-64464 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64464 *
CVE-2026-64465 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64465 *
CVE-2026-64466 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64466 *
CVE-2026-64467 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64467 *
CVE-2026-64468 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64468 *
CVE-2026-64469 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64469 *
CVE-2026-64470 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64470 *
CVE-2026-64471 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64471 *
CVE-2026-64473 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64473 *
CVE-2026-64474 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64474 *
CVE-2026-64475 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64475 *
CVE-2026-64476 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64476 *
CVE-2026-64477 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64477 *
CVE-2026-64478 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64478 *
CVE-2026-64479 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64479 *
CVE-2026-64480 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64480 *
CVE-2026-64481 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64481 *
CVE-2026-64482 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64482 *
CVE-2026-64483 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64483 *
CVE-2026-64484 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64484 *
CVE-2026-64485 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64485 *
CVE-2026-64486 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64486 *
CVE-2026-64487 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64487 *
CVE-2026-64488 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64488 *
CVE-2026-64489 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64489 *
CVE-2026-64490 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64490 *
CVE-2026-64491 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64491 *
CVE-2026-64492 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64492 *
CVE-2026-64493 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64493 *
CVE-2026-64494 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64494 *
CVE-2026-64495 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64495 *
CVE-2026-64496 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64496 *
CVE-2026-64497 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64497 *
CVE-2026-64499 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64499 *
CVE-2026-64500 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64500 *
CVE-2026-64501 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64501 *
CVE-2026-64502 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64502 *
CVE-2026-64503 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64503 *
CVE-2026-64504 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64504 *
CVE-2026-64505 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64505 *
CVE-2026-64507 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64507 *
CVE-2026-64508 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64508 *
CVE-2026-64509 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64509 *
CVE-2026-64511 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64511 *
CVE-2026-64512 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64512 *
CVE-2026-64513 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64513 *
CVE-2026-64514 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64514 *
CVE-2026-64529 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64529 *
CVE-2026-64600 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64600 *

Full list: Found 337 unpatched CVEs
CVE-2011-3374 (CVSSv2: 4.3, CVSSv3: 3.7): apt https://nvd.nist.gov/vuln/detail/CVE-2011-3374 *
CVE-2013-10036 (CVSSv4: 8.4): connman https://nvd.nist.gov/vuln/detail/CVE-2013-10036 *
CVE-2019-14899 (CVSSv2: 4.9, CVSSv3: 7.4): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2019-14899 *
CVE-2021-3714 (CVSSv3: 5.9): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2021-3714 *
CVE-2021-3864 (CVSSv3: 7.0): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2021-3864 *
CVE-2022-0400 (CVSSv3: 7.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2022-0400 *
CVE-2022-1247 (CVSSv3: 7.0): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2022-1247 *
CVE-2022-4543 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2022-4543 *
CVE-2023-3397 (CVSSv3: 7.0): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2023-3397 *
CVE-2023-3640 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2023-3640 *
CVE-2023-4010 (CVSSv3: 4.6): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2023-4010 *
CVE-2023-6238 (CVSSv3: 6.7): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2023-6238 *
CVE-2023-6240 (CVSSv3: 6.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2023-6240 *
CVE-2024-2236 (CVSSv3: 5.9): libgcrypt:libgcrypt-native https://nvd.nist.gov/vuln/detail/CVE-2024-2236 *
CVE-2024-43802 (CVSSv3: 4.5): vim https://nvd.nist.gov/vuln/detail/CVE-2024-43802 *
CVE-2024-47850 (CVSSv3: 7.5): cups https://nvd.nist.gov/vuln/detail/CVE-2024-47850 *
CVE-2024-50613 (CVSSv3: 6.5): libsndfile1 https://nvd.nist.gov/vuln/detail/CVE-2024-50613 *
CVE-2024-52005 (CVSSv3: 8.8, CVSSv4: 7.5): git:git-native https://nvd.nist.gov/vuln/detail/CVE-2024-52005 *
CVE-2025-15366 (CVSSv4: 5.9): python3:python3-native https://nvd.nist.gov/vuln/detail/CVE-2025-15366 *
CVE-2025-15367 (CVSSv4: 5.9): python3:python3-native https://nvd.nist.gov/vuln/detail/CVE-2025-15367 *
CVE-2025-50422 (CVSSv3: 2.9): cairo:cairo-native https://nvd.nist.gov/vuln/detail/CVE-2025-50422 *
CVE-2025-52194 (CVSSv3: 7.5): libsndfile1 https://nvd.nist.gov/vuln/detail/CVE-2025-52194 *
CVE-2025-56005 (CVSSv3: 9.8): python3-ply https://nvd.nist.gov/vuln/detail/CVE-2025-56005 *
CVE-2025-59529 (CVSSv3: 5.5): avahi https://nvd.nist.gov/vuln/detail/CVE-2025-59529 *
CVE-2025-66382 (CVSSv3: 5.5): expat:expat-native https://nvd.nist.gov/vuln/detail/CVE-2025-66382 *
CVE-2025-69693 (CVSSv3: 5.4): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2025-69693 *
CVE-2025-71074 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2025-71074 *
CVE-2025-71306 (CVSSv3: 7.1): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2025-71306 *
CVE-2025-71308 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2025-71308 *
CVE-2025-71313 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2025-71313 *
CVE-2026-0864 (CVSSv4: 4.1): python3:python3-native https://nvd.nist.gov/vuln/detail/CVE-2026-0864 *
CVE-2026-2625 (CVSSv3: 5.5): rpm-sequoia https://nvd.nist.gov/vuln/detail/CVE-2026-2625 *
CVE-2026-3099 (CVSSv3: 7.3): libsoup https://nvd.nist.gov/vuln/detail/CVE-2026-3099 *
CVE-2026-3184 (CVSSv3: 5.3): util-linux:util-linux-libuuid:util-linux-libuuid-native:util-linux-native https://nvd.nist.gov/vuln/detail/CVE-2026-3184 *
CVE-2026-3195 (CVSSv3: 7.4): qemu:qemu-native:qemu-system-native https://nvd.nist.gov/vuln/detail/CVE-2026-3195 *
CVE-2026-3196 (CVSSv3: 5.5): qemu:qemu-native:qemu-system-native https://nvd.nist.gov/vuln/detail/CVE-2026-3196 *
CVE-2026-3441 (CVSSv3: 7.1): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://nvd.nist.gov/vuln/detail/CVE-2026-3441 *
CVE-2026-3442 (CVSSv3: 7.1): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://nvd.nist.gov/vuln/detail/CVE-2026-3442 *
CVE-2026-3632 (CVSSv3: 5.5): libsoup https://nvd.nist.gov/vuln/detail/CVE-2026-3632 *
CVE-2026-3633 (CVSSv3: 6.5): libsoup https://nvd.nist.gov/vuln/detail/CVE-2026-3633 *
CVE-2026-3634 (CVSSv3: 6.5): libsoup https://nvd.nist.gov/vuln/detail/CVE-2026-3634 *
CVE-2026-3842 (CVSSv3: 7.8): qemu:qemu-native:qemu-system-native https://nvd.nist.gov/vuln/detail/CVE-2026-3842 *
CVE-2026-4271 (CVSSv3: 7.5): libsoup https://nvd.nist.gov/vuln/detail/CVE-2026-4271 *
CVE-2026-4360 (CVSSv3: 5.3, CVSSv4: 2.0): python3:python3-native https://nvd.nist.gov/vuln/detail/CVE-2026-4360 *
CVE-2026-4873 (CVSSv3: 5.9): curl:curl-native https://nvd.nist.gov/vuln/detail/CVE-2026-4873 *
CVE-2026-5056 (CVSSv3: 7.8): gstreamer1.0 https://nvd.nist.gov/vuln/detail/CVE-2026-5056 *
CVE-2026-5201 (CVSSv3: 7.5): gdk-pixbuf:gdk-pixbuf-native https://nvd.nist.gov/vuln/detail/CVE-2026-5201 *
CVE-2026-5435 (CVSSv3: 7.3): glibc https://nvd.nist.gov/vuln/detail/CVE-2026-5435 *
CVE-2026-5450 (CVSSv3: 9.8): glibc https://nvd.nist.gov/vuln/detail/CVE-2026-5450 *
CVE-2026-5673 (CVSSv3: 7.1): libtheora https://nvd.nist.gov/vuln/detail/CVE-2026-5673 *
CVE-2026-5928 (CVSSv3: 7.5): glibc https://nvd.nist.gov/vuln/detail/CVE-2026-5928 *
CVE-2026-6238 (CVSSv3: 6.5): glibc https://nvd.nist.gov/vuln/detail/CVE-2026-6238 *
CVE-2026-6732 (CVSSv3: 7.5): libxml2:libxml2-native https://nvd.nist.gov/vuln/detail/CVE-2026-6732 *
CVE-2026-6844 (CVSSv3: 5.5): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://nvd.nist.gov/vuln/detail/CVE-2026-6844 *
CVE-2026-6845 (CVSSv3: 5.0): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://nvd.nist.gov/vuln/detail/CVE-2026-6845 *
CVE-2026-6879 (CVSSv4: 2.0): python3:python3-native https://nvd.nist.gov/vuln/detail/CVE-2026-6879 *
CVE-2026-7009 (CVSSv3: 5.3): curl:curl-native https://nvd.nist.gov/vuln/detail/CVE-2026-7009 *
CVE-2026-8286 (CVSSv3: 8.1): curl:curl-native https://nvd.nist.gov/vuln/detail/CVE-2026-8286 *
CVE-2026-8458 (CVSSv3: 6.5): curl:curl-native https://nvd.nist.gov/vuln/detail/CVE-2026-8458 *
CVE-2026-8461 (CVSSv3: 8.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-8461 *
CVE-2026-8924 (CVSSv3: 9.1): curl:curl-native https://nvd.nist.gov/vuln/detail/CVE-2026-8924 *
CVE-2026-8925 (CVSSv3: 9.8): curl:curl-native https://nvd.nist.gov/vuln/detail/CVE-2026-8925 *
CVE-2026-8926 (CVSSv3: 9.1): curl:curl-native https://nvd.nist.gov/vuln/detail/CVE-2026-8926 *
CVE-2026-8927 (CVSSv3: 9.1): curl:curl-native https://nvd.nist.gov/vuln/detail/CVE-2026-8927 *
CVE-2026-8932 (CVSSv3: 7.5): curl:curl-native https://nvd.nist.gov/vuln/detail/CVE-2026-8932 *
CVE-2026-9079 (CVSSv3: 9.8): curl:curl-native https://nvd.nist.gov/vuln/detail/CVE-2026-9079 *
CVE-2026-9080 (CVSSv3: 7.3): curl:curl-native https://nvd.nist.gov/vuln/detail/CVE-2026-9080 *
CVE-2026-9539 (CVSSv3: 6.5): libslirp:libslirp-native https://nvd.nist.gov/vuln/detail/CVE-2026-9539 *
CVE-2026-9545 (CVSSv3: 7.5): curl:curl-native https://nvd.nist.gov/vuln/detail/CVE-2026-9545 *
CVE-2026-9546 (CVSSv3: 7.5): curl:curl-native https://nvd.nist.gov/vuln/detail/CVE-2026-9546 *
CVE-2026-9547 (CVSSv3: 7.4): curl:curl-native https://nvd.nist.gov/vuln/detail/CVE-2026-9547 *
CVE-2026-10723 (CVSSv3: 6.8): bind https://nvd.nist.gov/vuln/detail/CVE-2026-10723 *
CVE-2026-10822 (CVSSv3: 6.5): bind https://nvd.nist.gov/vuln/detail/CVE-2026-10822 *
CVE-2026-11331 (CVSSv3: 7.5): bind https://nvd.nist.gov/vuln/detail/CVE-2026-11331 *
CVE-2026-11352 (CVSSv3: 7.5): curl:curl-native https://nvd.nist.gov/vuln/detail/CVE-2026-11352 *
CVE-2026-11564 (CVSSv3: 9.1): curl:curl-native https://nvd.nist.gov/vuln/detail/CVE-2026-11564 *
CVE-2026-11586 (CVSSv3: 7.5): curl:curl-native https://nvd.nist.gov/vuln/detail/CVE-2026-11586 *
CVE-2026-11605 (CVSSv3: 7.5): bind https://nvd.nist.gov/vuln/detail/CVE-2026-11605 *
CVE-2026-11622 (CVSSv3: 7.5): bind https://nvd.nist.gov/vuln/detail/CVE-2026-11622 *
CVE-2026-11721 (CVSSv3: 7.5): bind https://nvd.nist.gov/vuln/detail/CVE-2026-11721 *
CVE-2026-11856 (CVSSv3: 9.8): curl:curl-native https://nvd.nist.gov/vuln/detail/CVE-2026-11856 *
CVE-2026-12003 (CVSSv4: 5.3): python3:python3-native https://nvd.nist.gov/vuln/detail/CVE-2026-12003 *
CVE-2026-12064 (CVSSv3: 7.5): curl:curl-native https://nvd.nist.gov/vuln/detail/CVE-2026-12064 *
CVE-2026-12549 (CVSSv3: 4.8): libsoup https://nvd.nist.gov/vuln/detail/CVE-2026-12549 *
CVE-2026-12617 (CVSSv3: 7.5): bind https://nvd.nist.gov/vuln/detail/CVE-2026-12617 *
CVE-2026-12891 (CVSSv3: 4.3): gstreamer1.0 https://nvd.nist.gov/vuln/detail/CVE-2026-12891 *
CVE-2026-12892 (CVSSv3: 4.4): gstreamer1.0 https://nvd.nist.gov/vuln/detail/CVE-2026-12892 *
CVE-2026-13204 (CVSSv3: 7.5): bind https://nvd.nist.gov/vuln/detail/CVE-2026-13204 *
CVE-2026-13221 (CVSSv3: 9.1): perl:perl-native https://nvd.nist.gov/vuln/detail/CVE-2026-13221 *
CVE-2026-13321 (CVSSv3: 8.6): bind https://nvd.nist.gov/vuln/detail/CVE-2026-13321 *
CVE-2026-13595 (CVSSv3: 6.8): util-linux:util-linux-libuuid:util-linux-libuuid-native:util-linux-native https://nvd.nist.gov/vuln/detail/CVE-2026-13595 *
CVE-2026-13757 (CVSSv3: 6.2): p11-kit:p11-kit-native https://nvd.nist.gov/vuln/detail/CVE-2026-13757 *
CVE-2026-15308 (CVSSv3: 7.5, CVSSv4: 8.7): python3:python3-native https://nvd.nist.gov/vuln/detail/CVE-2026-15308 *
CVE-2026-23328 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-23328 *
CVE-2026-23374 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-23374 *
CVE-2026-23377 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-23377 *
CVE-2026-23459 (CVSSv3: 8.2): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-23459 *
CVE-2026-28529 (CVSSv4: 8.5): cryptodev-linux https://nvd.nist.gov/vuln/detail/CVE-2026-28529 *
CVE-2026-29518 (CVSSv3: 7.8, CVSSv4: 7.3): rsync:rsync-native https://nvd.nist.gov/vuln/detail/CVE-2026-29518 *
CVE-2026-30922 (CVSSv3: 7.5): python3-pyasn1 https://nvd.nist.gov/vuln/detail/CVE-2026-30922 *
CVE-2026-30997 (CVSSv3: 7.5): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-30997 *
CVE-2026-30998 (CVSSv3: 7.5): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-30998 *
CVE-2026-30999 (CVSSv3: 7.5): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-30999 *
CVE-2026-31501 (CVSSv3: 9.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-31501 *
CVE-2026-31771 (CVSSv3: 8.1): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-31771 *
CVE-2026-31777 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-31777 *
CVE-2026-33845 (CVSSv3: 9.1): gnutls:gnutls-native https://nvd.nist.gov/vuln/detail/CVE-2026-33845 *
CVE-2026-34073 (CVSSv3: 5.3, CVSSv4: 1.7): python3-cryptography https://nvd.nist.gov/vuln/detail/CVE-2026-34073 *
CVE-2026-38752 (CVSSv3: 7.5): busybox https://nvd.nist.gov/vuln/detail/CVE-2026-38752 *
CVE-2026-38753 (CVSSv3: 7.5): busybox https://nvd.nist.gov/vuln/detail/CVE-2026-38753 *
CVE-2026-38754 (CVSSv3: 7.5): busybox https://nvd.nist.gov/vuln/detail/CVE-2026-38754 *
CVE-2026-38755 (CVSSv3: 7.5): busybox https://nvd.nist.gov/vuln/detail/CVE-2026-38755 *
CVE-2026-39892 (CVSSv3: 9.8, CVSSv4: 6.9): python3-cryptography https://nvd.nist.gov/vuln/detail/CVE-2026-39892 *
CVE-2026-40962 (CVSSv3: 9.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-40962 *
CVE-2026-41035 (CVSSv3: 7.8): rsync:rsync-native https://nvd.nist.gov/vuln/detail/CVE-2026-41035 *
CVE-2026-41066 (CVSSv3: 7.5): python3-lxml:python3-lxml-native https://nvd.nist.gov/vuln/detail/CVE-2026-41066 *
CVE-2026-43009 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-43009 *
CVE-2026-43022 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-43022 *
CVE-2026-43042 (CVSSv3: 7.1): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-43042 *
CVE-2026-43045 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-43045 *
CVE-2026-43053 (CVSSv3: 4.7): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-43053 *
CVE-2026-43095 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-43095 *
CVE-2026-43115 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-43115 *
CVE-2026-43131 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-43131 *
CVE-2026-43174 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-43174 *
CVE-2026-43191 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-43191 *
CVE-2026-43204 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-43204 *
CVE-2026-43228 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-43228 *
CVE-2026-43299 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-43299 *
CVE-2026-43308 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-43308 *
CVE-2026-43310 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-43310 *
CVE-2026-43311 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-43311 *
CVE-2026-43326 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-43326 *
CVE-2026-43344 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-43344 *
CVE-2026-43391 (CVSSv3: 8.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-43391 *
CVE-2026-43414 (CVSSv3: 9.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-43414 *
CVE-2026-43443 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-43443 *
CVE-2026-43617 (CVSSv3: 4.8, CVSSv4: 6.3): rsync:rsync-native https://nvd.nist.gov/vuln/detail/CVE-2026-43617 *
CVE-2026-43618 (CVSSv3: 8.1, CVSSv4: 6.1): rsync:rsync-native https://nvd.nist.gov/vuln/detail/CVE-2026-43618 *
CVE-2026-43619 (CVSSv3: 6.3, CVSSv4: 7.2): rsync:rsync-native https://nvd.nist.gov/vuln/detail/CVE-2026-43619 *
CVE-2026-43620 (CVSSv3: 6.5, CVSSv4: 6.9): rsync:rsync-native https://nvd.nist.gov/vuln/detail/CVE-2026-43620 *
CVE-2026-44432 (CVSSv3: 7.5, CVSSv4: 8.9): python3-urllib3 https://nvd.nist.gov/vuln/detail/CVE-2026-44432 *
CVE-2026-45232 (CVSSv3: 3.7, CVSSv4: 2.1): rsync:rsync-native https://nvd.nist.gov/vuln/detail/CVE-2026-45232 *
CVE-2026-45897 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-45897 *
CVE-2026-45901 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-45901 *
CVE-2026-45961 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-45961 *
CVE-2026-45963 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-45963 *
CVE-2026-45991 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-45991 *
CVE-2026-46008 (CVSSv3: 4.7): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-46008 *
CVE-2026-46017 (CVSSv3: 4.7): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-46017 *
CVE-2026-46032 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-46032 *
CVE-2026-46130 (CVSSv3: 7.1): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-46130 *
CVE-2026-46153 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-46153 *
CVE-2026-46210 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-46210 *
CVE-2026-46245 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-46245 *
CVE-2026-46298 (CVSSv3: 4.7): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-46298 *
CVE-2026-46302 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-46302 *
CVE-2026-46311 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-46311 *
CVE-2026-46330 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-46330 *
CVE-2026-46727 (CVSSv3: 8.1): ruby:ruby-native https://nvd.nist.gov/vuln/detail/CVE-2026-46727 *
CVE-2026-48863 (CVSSv3: 7.5): libsolv https://nvd.nist.gov/vuln/detail/CVE-2026-48863 *
CVE-2026-48914 (CVSSv3: 6.7): qemu:qemu-native:qemu-system-native https://nvd.nist.gov/vuln/detail/CVE-2026-48914 *
CVE-2026-50219 (CVSSv3: 5.9): expat:expat-native https://nvd.nist.gov/vuln/detail/CVE-2026-50219 *
CVE-2026-50256 (CVSSv3: 7.8): xserver-xorg:xwayland https://nvd.nist.gov/vuln/detail/CVE-2026-50256 *
CVE-2026-50257 (CVSSv3: 7.8): xserver-xorg:xwayland https://nvd.nist.gov/vuln/detail/CVE-2026-50257 *
CVE-2026-50258 (CVSSv3: 7.8): xserver-xorg:xwayland https://nvd.nist.gov/vuln/detail/CVE-2026-50258 *
CVE-2026-50259 (CVSSv3: 7.8): xserver-xorg:xwayland https://nvd.nist.gov/vuln/detail/CVE-2026-50259 *
CVE-2026-50260 (CVSSv3: 7.8): xserver-xorg:xwayland https://nvd.nist.gov/vuln/detail/CVE-2026-50260 *
CVE-2026-50261 (CVSSv3: 7.8): xserver-xorg:xwayland https://nvd.nist.gov/vuln/detail/CVE-2026-50261 *
CVE-2026-50262 (CVSSv3: 5.5): xserver-xorg:xwayland https://nvd.nist.gov/vuln/detail/CVE-2026-50262 *
CVE-2026-50263 (CVSSv3: 5.5): xserver-xorg:xwayland https://nvd.nist.gov/vuln/detail/CVE-2026-50263 *
CVE-2026-50264 (CVSSv3: 7.8): xserver-xorg:xwayland https://nvd.nist.gov/vuln/detail/CVE-2026-50264 *
CVE-2026-52949 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-52949 *
CVE-2026-52956 (CVSSv3: 7.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-52956 *
CVE-2026-52960 (CVSSv3: 7.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-52960 *
CVE-2026-52965 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-52965 *
CVE-2026-52988 (CVSSv3: 7.1): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-52988 *
CVE-2026-53005 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53005 *
CVE-2026-53007 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53007 *
CVE-2026-53008 (CVSSv3: 4.7): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53008 *
CVE-2026-53009 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53009 *
CVE-2026-53017 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53017 *
CVE-2026-53024 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53024 *
CVE-2026-53025 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53025 *
CVE-2026-53078 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53078 *
CVE-2026-53089 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53089 *
CVE-2026-53090 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53090 *
CVE-2026-53091 (CVSSv3: 8.4): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53091 *
CVE-2026-53102 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53102 *
CVE-2026-53106 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53106 *
CVE-2026-53108 (CVSSv3: 4.7): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53108 *
CVE-2026-53113 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53113 *
CVE-2026-53124 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53124 *
CVE-2026-53178 (CVSSv3: 8.1): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53178 *
CVE-2026-53222 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53222 *
CVE-2026-53257 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53257 *
CVE-2026-53260 (CVSSv3: 9.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53260 *
CVE-2026-53285 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53285 *
CVE-2026-53292 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53292 *
CVE-2026-53308 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53308 *
CVE-2026-53313 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53313 *
CVE-2026-53401 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53401 *
CVE-2026-53910 (CVSSv4: 2.1): diffutils https://nvd.nist.gov/vuln/detail/CVE-2026-53910 *
CVE-2026-54369 (CVSSv3: 7.1, CVSSv4: 8.4): acl:acl-native https://nvd.nist.gov/vuln/detail/CVE-2026-54369 *
CVE-2026-54370 (CVSSv3: 6.3, CVSSv4: 7.2): acl:acl-native https://nvd.nist.gov/vuln/detail/CVE-2026-54370 *
CVE-2026-54371 (CVSSv3: 7.1, CVSSv4: 8.4): attr:attr-native https://nvd.nist.gov/vuln/detail/CVE-2026-54371 *
CVE-2026-55693 (CVSSv3: 7.8, CVSSv4: 5.7): vim https://nvd.nist.gov/vuln/detail/CVE-2026-55693 *
CVE-2026-55895 (CVSSv3: 7.8, CVSSv4: 5.7): vim https://nvd.nist.gov/vuln/detail/CVE-2026-55895 *
CVE-2026-55999 (CVSSv3: 8.5): xserver-xorg:xwayland https://nvd.nist.gov/vuln/detail/CVE-2026-55999 *
CVE-2026-56000 (CVSSv3: 7.8, CVSSv4: 9.0): xserver-xorg:xwayland https://nvd.nist.gov/vuln/detail/CVE-2026-56000 *
CVE-2026-56001 (CVSSv3: 8.8): libxfont2 https://nvd.nist.gov/vuln/detail/CVE-2026-56001 *
CVE-2026-56002 (CVSSv3: 8.8): libxfont:libxfont2 https://nvd.nist.gov/vuln/detail/CVE-2026-56002 *
CVE-2026-56003 (CVSSv3: 8.8): libxfont2 https://nvd.nist.gov/vuln/detail/CVE-2026-56003 *
CVE-2026-56109 (CVSSv3: 6.8, CVSSv4: 7.0): alsa-lib:alsa-lib-native https://nvd.nist.gov/vuln/detail/CVE-2026-56109 *
CVE-2026-56131 (CVSSv3: 4.9): expat:expat-native https://nvd.nist.gov/vuln/detail/CVE-2026-56131 *
CVE-2026-56288 (CVSSv3: 5.5, CVSSv4: 4.6): patch https://nvd.nist.gov/vuln/detail/CVE-2026-56288 *
CVE-2026-56289 (CVSSv3: 5.5, CVSSv4: 4.6): patch https://nvd.nist.gov/vuln/detail/CVE-2026-56289 *
CVE-2026-56389 (CVSSv4: 6.8): bison:bison-native https://nvd.nist.gov/vuln/detail/CVE-2026-56389 *
CVE-2026-56390 (CVSSv4: 4.6): bison:bison-native https://nvd.nist.gov/vuln/detail/CVE-2026-56390 *
CVE-2026-56391 (CVSSv4: 4.6): coreutils:coreutils-native https://nvd.nist.gov/vuln/detail/CVE-2026-56391 *
CVE-2026-56392 (CVSSv4: 1.8): coreutils:coreutils-native https://nvd.nist.gov/vuln/detail/CVE-2026-56392 *
CVE-2026-56412 (CVSSv3: 5.9): expat:expat-native https://nvd.nist.gov/vuln/detail/CVE-2026-56412 *
CVE-2026-57432 (CVSSv3: 8.4): perl:perl-native https://nvd.nist.gov/vuln/detail/CVE-2026-57432 *
CVE-2026-57451 (CVSSv3: 6.1): vim https://nvd.nist.gov/vuln/detail/CVE-2026-57451 *
CVE-2026-57453 (CVSSv3: 7.3): vim https://nvd.nist.gov/vuln/detail/CVE-2026-57453 *
CVE-2026-57454 (CVSSv3: 6.1, CVSSv4: 6.8): vim https://nvd.nist.gov/vuln/detail/CVE-2026-57454 *
CVE-2026-57455 (CVSSv3: 7.8, CVSSv4: 4.0): vim https://nvd.nist.gov/vuln/detail/CVE-2026-57455 *
CVE-2026-57456 (CVSSv3: 7.8, CVSSv4: 8.4): vim https://nvd.nist.gov/vuln/detail/CVE-2026-57456 *
CVE-2026-58050 (CVSSv3: 7.5, CVSSv4: 8.3): libssh2:libssh2-native https://nvd.nist.gov/vuln/detail/CVE-2026-58050 *
CVE-2026-58051 (CVSSv3: 6.5, CVSSv4: 8.3): libssh2:libssh2-native https://nvd.nist.gov/vuln/detail/CVE-2026-58051 *
CVE-2026-58055 (CVSSv3: 5.4, CVSSv4: 6.3): nghttp2 https://nvd.nist.gov/vuln/detail/CVE-2026-58055 *
CVE-2026-58469 (CVSSv3: 7.5, CVSSv4: 8.7): wget https://nvd.nist.gov/vuln/detail/CVE-2026-58469 *
CVE-2026-58470 (CVSSv3: 5.3, CVSSv4: 6.9): wget https://nvd.nist.gov/vuln/detail/CVE-2026-58470 *
CVE-2026-58471 (CVSSv3: 7.1, CVSSv4: 6.0): wget https://nvd.nist.gov/vuln/detail/CVE-2026-58471 *
CVE-2026-58472 (CVSSv3: 7.1, CVSSv4: 6.0): wget https://nvd.nist.gov/vuln/detail/CVE-2026-58472 *
CVE-2026-59856 (CVSSv3: 7.8, CVSSv4: 8.4): vim https://nvd.nist.gov/vuln/detail/CVE-2026-59856 *
CVE-2026-59857 (CVSSv3: 5.5, CVSSv4: 5.6): vim https://nvd.nist.gov/vuln/detail/CVE-2026-59857 *
CVE-2026-59858 (CVSSv3: 7.8, CVSSv4: 8.4): vim https://nvd.nist.gov/vuln/detail/CVE-2026-59858 *
CVE-2026-59884 (CVSSv3: 7.5): python3-pyasn1 https://nvd.nist.gov/vuln/detail/CVE-2026-59884 *
CVE-2026-59885 (CVSSv3: 7.5): python3-pyasn1 https://nvd.nist.gov/vuln/detail/CVE-2026-59885 *
CVE-2026-59886 (CVSSv3: 7.5): python3-pyasn1 https://nvd.nist.gov/vuln/detail/CVE-2026-59886 *
CVE-2026-63811 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-63811 *
CVE-2026-63839 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-63839 *
CVE-2026-63872 (CVSSv3: 7.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-63872 *
CVE-2026-63879 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-63879 *
CVE-2026-63923 (CVSSv3: 8.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-63923 *
CVE-2026-63941 (CVSSv3: 8.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-63941 *
CVE-2026-63977 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-63977 *
CVE-2026-63978 (CVSSv3: 9.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-63978 *
CVE-2026-63979 (CVSSv3: 9.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-63979 *
CVE-2026-63983 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-63983 *
CVE-2026-64013 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64013 *
CVE-2026-64019 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64019 *
CVE-2026-64020 (CVSSv3: 7.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64020 *
CVE-2026-64040 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64040 *
CVE-2026-64057 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64057 *
CVE-2026-64067 (CVSSv3: 9.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64067 *
CVE-2026-64068 (CVSSv3: 9.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64068 *
CVE-2026-64070 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64070 *
CVE-2026-64079 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64079 *
CVE-2026-64082 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64082 *
CVE-2026-64117 (CVSSv3: 8.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64117 *
CVE-2026-64146 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64146 *
CVE-2026-64154 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64154 *
CVE-2026-64160 (CVSSv3: 9.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64160 *
CVE-2026-64192 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64192 *
CVE-2026-64210 (CVSSv3: 7.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64210 *
CVE-2026-64227 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64227 *
CVE-2026-64283 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64283 *
CVE-2026-64287 (CVSSv3: 8.2): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64287 *
CVE-2026-64292 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64292 *
CVE-2026-64325 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64325 *
CVE-2026-64341 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64341 *
CVE-2026-64349 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64349 *
CVE-2026-64352 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64352 *
CVE-2026-64353 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64353 *
CVE-2026-64361 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64361 *
CVE-2026-64371 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64371 *
CVE-2026-64375 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64375 *
CVE-2026-64388 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64388 *
CVE-2026-64389 (CVSSv3: 8.2): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64389 *
CVE-2026-64390 (CVSSv3: 8.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64390 *
CVE-2026-64421 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64421 *
CVE-2026-64438 (CVSSv3: 8.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64438 *
CVE-2026-64441 (CVSSv3: 8.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64441 *
CVE-2026-64472 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64472 *
CVE-2026-64510 (CVSSv3: 7.0): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64510 *
CVE-2026-64523 (CVSSv3: 9.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64523 *
CVE-2026-64530 (CVSSv3: 9.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64530 *
CVE-2026-64531 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64531 *
CVE-2026-64532 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64532 *
CVE-2026-64533 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64533 *
CVE-2026-64534 (CVSSv3: 9.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64534 *
CVE-2026-64535 (CVSSv3: 9.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64535 *
CVE-2026-64537 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64537 *
CVE-2026-64538 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64538 *
CVE-2026-64539 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64539 *
CVE-2026-64540 (CVSSv3: 8.1): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64540 *
CVE-2026-64541 (CVSSv3: 9.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64541 *
CVE-2026-64542 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64542 *
CVE-2026-64543 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64543 *
CVE-2026-64544 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64544 *
CVE-2026-64545 (CVSSv3: 7.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64545 *
CVE-2026-64546 (CVSSv3: 7.1): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64546 *
CVE-2026-64547 (CVSSv3: 8.1): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64547 *
CVE-2026-64548 (CVSSv3: 8.4): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64548 *
CVE-2026-64549 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64549 *
CVE-2026-64550 (CVSSv3: 7.3): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64550 *
CVE-2026-64551 (CVSSv3: 9.1): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64551 *
CVE-2026-64552 (CVSSv3: 8.4): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64552 *
CVE-2026-64553 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64553 *
CVE-2026-64554 (CVSSv3: 8.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64554 *
CVE-2026-64555 (CVSSv3: 8.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64555 *
CVE-2026-64557 (CVSSv3: 8.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64557 *
CVE-2026-64558 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64558 *
CVE-2026-64559 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64559 *
CVE-2026-64560 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64560 *
CVE-2026-64830 (CVSSv3: 8.8, CVSSv4: 8.7): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-64830 *
CVE-2026-64831 (CVSSv3: 8.8, CVSSv4: 8.7): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-64831 *
CVE-2026-64832 (CVSSv3: 8.8, CVSSv4: 8.7): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-64832 *
CVE-2026-64833 (CVSSv3: 7.1, CVSSv4: 7.1): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-64833 *
CVE-2026-64834 (CVSSv3: 7.5, CVSSv4: 8.7): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-64834 *
CVE-2026-64835 (CVSSv3: 8.8, CVSSv4: 8.7): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-64835 *
CVE-2026-65703 (CVSSv3: 7.8, CVSSv4: 8.5): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-65703 *
CVE-2026-65704 (CVSSv3: 7.8, CVSSv4: 7.3): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-65704 *
CVE-2026-65705 (CVSSv3: 7.8, CVSSv4: 7.3): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-65705 *
CVE-2026-65706 (CVSSv3: 7.8, CVSSv4: 8.5): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-65706 *
CVE-2026-66032 (CVSSv3: 8.8, CVSSv4: 8.7): libssh2:libssh2-native https://nvd.nist.gov/vuln/detail/CVE-2026-66032 *
CVE-2026-66033 (CVSSv3: 7.5, CVSSv4: 8.7): libssh2:libssh2-native https://nvd.nist.gov/vuln/detail/CVE-2026-66033 *
CVE-2026-66034 (CVSSv3: 7.5, CVSSv4: 7.7): libssh2:libssh2-native https://nvd.nist.gov/vuln/detail/CVE-2026-66034 *
CVE-2026-66035 (CVSSv3: 7.5, CVSSv4: 7.7): libssh2:libssh2-native https://nvd.nist.gov/vuln/detail/CVE-2026-66035 *
CVE-2026-66036 (CVSSv3: 8.8, CVSSv4: 7.7): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-66036 *
CVE-2026-66037 (CVSSv3: 6.5, CVSSv4: 7.1): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-66037 *
CVE-2026-66038 (CVSSv3: 6.5, CVSSv4: 7.1): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-66038 *
CVE-2026-66039 (CVSSv3: 8.8, CVSSv4: 8.7): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-66039 *
CVE-2026-66040 (CVSSv3: 8.8, CVSSv4: 8.7): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-66040 *
CVE-2026-66041 (CVSSv3: 8.8, CVSSv4: 7.7): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-66041 *

Summary of CVE counts by recipe:
  linux-yocto: 165
  ffmpeg: 22
  curl:curl-native: 19
  vim: 11
  xserver-xorg:xwayland: 11
  bind: 9
  python3:python3-native: 7
  rsync:rsync-native: 7
  libsoup: 6
  libssh2:libssh2-native: 6
  expat:expat-native: 4
  qemu:qemu-native:qemu-system-native: 4
  binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite: 4
  glibc: 4
  python3-pyasn1: 4
  busybox: 4
  wget: 4
  gstreamer1.0: 3
  libsndfile1: 2
  util-linux:util-linux-libuuid:util-linux-libuuid-native:util-linux-native: 2
  perl:perl-native: 2
  python3-cryptography: 2
  acl:acl-native: 2
  libxfont2: 2
  patch: 2
  bison:bison-native: 2
  coreutils:coreutils-native: 2
  apt: 1
  connman: 1
  libgcrypt:libgcrypt-native: 1
  cups: 1
  git:git-native: 1
  cairo:cairo-native: 1
  python3-ply: 1
  avahi: 1
  rpm-sequoia: 1
  gdk-pixbuf:gdk-pixbuf-native: 1
  libtheora: 1
  libxml2:libxml2-native: 1
  libslirp:libslirp-native: 1
  p11-kit:p11-kit-native: 1
  cryptodev-linux: 1
  gnutls:gnutls-native: 1
  python3-lxml:python3-lxml-native: 1
  python3-urllib3: 1
  ruby:ruby-native: 1
  libsolv: 1
  diffutils: 1
  attr:attr-native: 1
  libxfont:libxfont2: 1
  alsa-lib:alsa-lib-native: 1
  nghttp2: 1

For further information see: https://valkyrie.yocto.io/pub/non-release/patchmetrics/

