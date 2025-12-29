Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BAD6E92FFA
	for <webhook@archiver.kernel.org>; Mon, 29 Dec 2025 23:03:36 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.53769.1767049406864225328
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Dec 2025 15:03:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=jgy64lTB;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.170, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2a0d67f1877so120802755ad.2
        for <openembedded-core@lists.openembedded.org>; Mon, 29 Dec 2025 15:03:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1767049406; x=1767654206; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=/NbeNiERNltBVOnllc/93KXsJk748OKmFhHdW6/AWsw=;
        b=jgy64lTBOx+DP03+XnFI/3m7XhNpiIaNEOndUkV8lBnuQD+aRG9j5uMbqZMzc52Xxh
         HPwMHNHB5nnE8deEe9rDSZjUGwFHL5xh1J2feIx1JqQ58MBsova2gvgb4GaMJMvRx1xh
         5uQ9uHzuI8VerY/wRhR7WF9Vpx1sDaFVYnyjHv/+tl5LmWfUjJ+weewDwFKKVf4gqsXZ
         BJddQwKYXuLv4GA9qSlF9s4UnFC8HoD1UQxRORs7ztVCHxwjqG6KhvMLBmF7vu2rqLaJ
         +cCkG4wJre2XbBAVY9VyJlM9+labvL7wAyQPKBwoGNYEJkh9hWEkmwLke4B4YnwS+w2M
         KZHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767049406; x=1767654206;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/NbeNiERNltBVOnllc/93KXsJk748OKmFhHdW6/AWsw=;
        b=pB2WcOP35VQ02O2aYL9Founu2eBQgCbyl4xRMFKyUTGAdURAZs1qrnIYBZZ4mA3BGM
         kO3kerU9EXP7Uo92up6B3vYU5HSD5YGaPRpdv4J8lfnQs/PWrAaRV1J6hMFXxUB38xQ9
         3rM1i35fVdyOANHNw+iA7tFQxQw6tGohhNoI6vdpKN65mH258O/oOTEWfXyFa4jC449E
         Czv/6rN3U4nAplBNk5TEoFWngYZF70fzAcG8FmVKRNSwU+Hz+UZT1Uood6ETY/LL21lb
         bYoXxQIbblRnEMRDMl8iElUHPQnL0HQliLrQdcLuZB/UyaJxKTY3jKkq38S5v3aO+cRG
         xq7A==
X-Gm-Message-State: AOJu0YyKOX7Z71tv+Hy4h50+K1TmSG+c2n2XM+diQvr0d/Mpfh8XwWbV
	kzwTQ1Dl4JNYJn52G7tCZSdKeFLkHvoTw+gxCADi9dp6XTinGvCcZ+9eQdcubINOSXAVDqgL2ki
	odNBI
X-Gm-Gg: AY/fxX7iPKrWsgWDimCk8Q2eNp4Be/0zYNS307PSXAX1IJ+14XyMR7MW5Q7BWX44KwZ
	3e9SpDz8IegMRuJD86FX5S4tPoECmBjmR3NQgvrDNmjRRby/HqnSiwIEWFkFt3fmcgZpgS46vv/
	qOPeOb+lyZ7U+4tJYRcJOcuI37j6i2//NvbvEzd52YZeSrt5gRIM3J6PVTQfhm10llfGmfuTL+5
	nGbDwuc7mG1mFr9wQgdQxfXCAgniwPAV8CHHvDrzVc0XFmQV4LZUuHTCpBLpqZ4ubVrks+z6FiI
	TH8afx2QrhFsDJSm+RuRGgIQVWWthDrJ0KeDq/j/6/rQ5QSUaXHWW5onYc5SswoM5XIaih4y78p
	ETDiesUNGrdwZmPW+xgy0m5z8KewSwr2Lf8GWoR20dbEsNkeqKq7pxBexkgNW5XNpcwCw+6+zG8
	dMFA==
X-Google-Smtp-Source: AGHT+IEy6bTjZpjKLTwBtcccIf76iBP+VCuZQ/IkBqmq/ch+hx7oO+4OZ905geCQBznpmJfEEAcHeQ==
X-Received: by 2002:a17:903:249:b0:2a1:4293:beb9 with SMTP id d9443c01a7336-2a2f293e220mr232248565ad.58.1767049405818;
        Mon, 29 Dec 2025 15:03:25 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:c013:8f5c:baf3:22c3])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3c8d10esm277796855ad.42.2025.12.29.15.03.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Dec 2025 15:03:25 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 0/4] Patch review
Date: Mon, 29 Dec 2025 15:03:15 -0800
Message-ID: <cover.1767048412.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Dec 2025 23:03:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228616

Please review this set of changes for kirkstone and have comments back by
end of day Wednesday, December 31

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/2953

The following changes since commit c15faee8854e85e02693a041d88326f30b24ee92:

  cross.bbclass: Propagate dependencies to outhash (2025-12-29 08:40:22 -0800)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/kirkstone-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-nut

Jiaying Song (1):
  grub: fix CVE-2025-61661 CVE-2025-61662 CVE-2025-61663 CVE-2025-61664

Vijay Anusuri (3):
  go: Update CVE-2025-58187
  go: Fix CVE-2025-61727
  go: Fix CVE-2025-61729

 .../grub/files/CVE-2025-61661.patch           |  40 ++
 .../grub/files/CVE-2025-61662.patch           |  72 +++
 .../grub/files/CVE-2025-61663_61664.patch     |  64 +++
 meta/recipes-bsp/grub/grub2.inc               |   3 +
 meta/recipes-devtools/go/go-1.17.13.inc       |   5 +-
 ...025-58187.patch => CVE-2025-58187-1.patch} |   0
 .../go/go-1.18/CVE-2025-58187-2.patch         | 516 ++++++++++++++++++
 .../go/go-1.18/CVE-2025-61727.patch           | 229 ++++++++
 .../go/go-1.18/CVE-2025-61729.patch           | 172 ++++++
 9 files changed, 1100 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2025-61661.patch
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2025-61662.patch
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2025-61663_61664.patch
 rename meta/recipes-devtools/go/go-1.18/{CVE-2025-58187.patch => CVE-2025-58187-1.patch} (100%)
 create mode 100644 meta/recipes-devtools/go/go-1.18/CVE-2025-58187-2.patch
 create mode 100644 meta/recipes-devtools/go/go-1.18/CVE-2025-61727.patch
 create mode 100644 meta/recipes-devtools/go/go-1.18/CVE-2025-61729.patch

-- 
2.43.0


