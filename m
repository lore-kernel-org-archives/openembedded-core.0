Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65388E92FFF
	for <webhook@archiver.kernel.org>; Mon, 29 Dec 2025 23:08:06 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.53834.1767049677710905097
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Dec 2025 15:07:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=lKo8E3b1;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.181, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-7baf61be569so9845059b3a.3
        for <openembedded-core@lists.openembedded.org>; Mon, 29 Dec 2025 15:07:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1767049677; x=1767654477; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=xTeHSYxAfpUH3fmGtdmRB3KpaUxIKIEJYwnNl+5WWxE=;
        b=lKo8E3b1Las62hzplirbKGIoAeV0MxEp4RLO8u+QXl6us5onm2+gt8s0dGQjj3ZD11
         cw6RqY1kt/PClzV0PjK85z3GSjWn7bsQHRyiXyVNEkqk++XelqRSlFDehduF6/kxowc+
         jDg8K/9+eG577FVSbfXn8SeO76labAjCp0Cl3uyUSYJPv3ltyI21ufY0sQWOs0NYbUXS
         ZJACqJd3fKlv962O9lYTgE1SJOh/zEWxkTL/VkypjhWNZ9v30ojZ8x4xte1wjOjt+WSE
         hvI5xHPFTVlyZ1Nghscj/tWdBVZM0I/GaJawqvHZP7e4TUsT4QRVg2u2dmXIGq+3Z6Z1
         aQWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767049677; x=1767654477;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xTeHSYxAfpUH3fmGtdmRB3KpaUxIKIEJYwnNl+5WWxE=;
        b=hwwIBQxRdOxSgqCTh2neWSKDCjCifHhjaMSnGSCjUCieeOFQ80+p58jTHfIamYeLIe
         SeWPrAWOn3/zwtvT3QzHUWRKhxyvlC2qkALEjc1cSVjij5/+kB84mSpJkZzk5OTvtKBU
         8qdRjqtdPX2mxTbzPiuZaxhQiqO6Jy4kSMbU1vybcB0OVokXI2SGWyAjlpLadiQU1GmD
         Y4U4Vv3Jkw9INgyk3qvMiro6qAYK1WD6WTeEHt13rSP+R55vaV2mPGsTQ/vEy/fWDyVa
         f0+JGvixV51p3oYAefHZp1hnVMrfq6163Y+PL/Wby0YlwIw4QERFkSo9s5U+OfQZaEh0
         +LcQ==
X-Gm-Message-State: AOJu0YywNtRdRZRp6OqpgSGdbRuZxMvGM09kEmOHeHZRfMuOMZs1mnbQ
	iGT2/15uFZ8aF+PihAWByj470h2fd43bvX7hYN7fF7cfFCnr/zdHhu/VFljrdNCRIGjyUXYHwel
	WM7MU
X-Gm-Gg: AY/fxX48rxVEBCF5W1ud2Od9uRHWxYHEdZNR3TRqSpMyaWBODerJFVy0r5hig7M6a1n
	A836j9NnpLup5WAxZxurlbHOj5bD7o4Mm7T7bMN4EH7EN1/qSueoz6LF/3oj/WglOamtopCdWbN
	+4eCZvJLrXJ2L2NiffxhSZ/IftQPhKEEDqvRDocbaHW5EWdJJvoPaK05KKalRMY6rFyqBC1qLua
	Ep6NJv8jHc1DILLxE1SQCVpvUjEDSBKiWFIV8yO+CAXgTkw4QEtIqlCSkYw87ECRjhygASSPAex
	wcQiIeLspxZyo16tYCiGsCZ+vkxdnm1IPuqYuConrLKHDo1EwU91jepVDYZejPrweyZsod9Pi/5
	9974AEyNy//5NKAokJUOKInqwHPNOv2bkujH5dFnv1rDe4V7ZlqPZ2iOd8PVj6+LUHru2niZbqm
	+w6A==
X-Google-Smtp-Source: AGHT+IEz22NlyI1KlZbd6k8GGNsOo3dv2BH5CRLE9Ues3ItC1LKrPM0kxPHBHrWEXrhELNc/g7MLng==
X-Received: by 2002:a05:6a00:e17:b0:7b9:ef46:ec70 with SMTP id d2e1a72fcca58-7ff65d7cdadmr26890862b3a.23.1767049676915;
        Mon, 29 Dec 2025 15:07:56 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:c013:8f5c:baf3:22c3])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7e493123sm30340938b3a.50.2025.12.29.15.07.56
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Dec 2025 15:07:56 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 0/5] Patch review
Date: Mon, 29 Dec 2025 15:07:34 -0800
Message-ID: <cover.1767049440.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Dec 2025 23:08:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228621

Please review this set of changes for scarthgap and have commments back by
end of day Wednesday, December 31

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/2954

The following changes since commit dccb7a185fe58a97f33e219b4db283ff4a2071d7:

  cross.bbclass: Propagate dependencies to outhash (2025-12-23 06:28:05 -0800)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/scarthgap-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/scarthgap-nut

Changqing Li (1):
  libsoup: fix CVE-2025-12105

Jiaying Song (1):
  grub: fix CVE-2025-54770 CVE-2025-61661 CVE-2025-61662 CVE-2025-61663
    CVE-2025-61664

Vijay Anusuri (3):
  go: Update CVE-2025-58187
  go: Fix CVE-2025-61727
  go: Fix CVE-2025-61729

 .../grub/files/CVE-2025-54770.patch           |  41 ++
 .../grub/files/CVE-2025-61661.patch           |  40 ++
 .../grub/files/CVE-2025-61662.patch           |  72 +++
 .../grub/files/CVE-2025-61663_61664.patch     |  64 +++
 meta/recipes-bsp/grub/grub2.inc               |   4 +
 meta/recipes-devtools/go/go-1.22.12.inc       |   5 +-
 ...025-58187.patch => CVE-2025-58187-1.patch} |   0
 .../go/go/CVE-2025-58187-2.patch              | 516 ++++++++++++++++++
 .../go/go/CVE-2025-61727.patch                | 226 ++++++++
 .../go/go/CVE-2025-61729.patch                | 174 ++++++
 .../libsoup-3.4.4/CVE-2025-12105.patch        |  34 ++
 meta/recipes-support/libsoup/libsoup_3.4.4.bb |   1 +
 12 files changed, 1176 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2025-54770.patch
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2025-61661.patch
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2025-61662.patch
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2025-61663_61664.patch
 rename meta/recipes-devtools/go/go/{CVE-2025-58187.patch => CVE-2025-58187-1.patch} (100%)
 create mode 100644 meta/recipes-devtools/go/go/CVE-2025-58187-2.patch
 create mode 100644 meta/recipes-devtools/go/go/CVE-2025-61727.patch
 create mode 100644 meta/recipes-devtools/go/go/CVE-2025-61729.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-12105.patch

-- 
2.43.0


