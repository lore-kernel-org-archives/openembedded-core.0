Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57216C28B30
	for <webhook@archiver.kernel.org>; Fri,  7 Mar 2025 21:50:25 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web11.99.1741384218320399332
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Mar 2025 13:50:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=jfk0n5vs;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.169, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-223f4c06e9fso43193845ad.1
        for <openembedded-core@lists.openembedded.org>; Fri, 07 Mar 2025 13:50:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1741384217; x=1741989017; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=CMFG7G12jMO6eui9y7nQdAF+aQo6syfM3cU+5UUkaic=;
        b=jfk0n5vsQBxdRxsxIxv+3dWwASP/c0Z6eRTK0F6Suqsh+Ip154HJny2NzTOCOZbZsx
         mBnUhUKLMJ9XQwg/aP6iABhCOLnNGCHmU6L8I15XG+W+HX4bjdaJj7qywB+8jb/k+6u4
         9pANUJ/0b2wEMJjI8M254c7NBpB09EvtiVLhrzAxWXuGyUdGJfx6n/1KGICIKspgDmDj
         H4G1MuVREY+fXAKUdEcwxeAnrBpBY56ZWmFPhd3aFE4adYGOnj6UHsOh8iiObybhmlWy
         z5EKQuCXb/RmfUVuybIN0PauSAML/6YynEsMkGz3CxOK7cXbAJ4gx1zdZLsvpQVkDyBS
         8aFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741384217; x=1741989017;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CMFG7G12jMO6eui9y7nQdAF+aQo6syfM3cU+5UUkaic=;
        b=CTqiQn3KI5JmWZXNBlcjNU0ujpHqzsNN1/0droygweeJWqGN2api9myieQXmaHJiBz
         C+Adfgo+yMOzTJAAG3PjQNQCBUFX1bxSPnbWnIepRtofFiEq/2Tqq5MYQRH2NzPM5IMX
         /K94VyctAcYIyf5bpnWNoISQ922YgOWoJ56/uZnD7gQCWP+UKi2nsFKF/Sb7Mnl0MsB0
         S47dlElrOBoJD0MBjHEK1FMpUqoiG6dk8/eXYuQ0Qc/E9QsLf23vLlUen99VWvNRELWY
         zX8aPi75ceV1WbrphCzc44SOuPru0hL8VyDeqPwXV1e8esw3TqGefxLqkKHu0TSm2uoB
         y30Q==
X-Gm-Message-State: AOJu0YzKLpm3V/urpu0TgFs7y9Ef+E93Zr/NXcIRTm1/CiX9I8tlaTMi
	NmFapowwKfHFEbaFSf7GLYyAXanFq5kJvjdjh0Ffh9tdcwFx0cL6G3US3u/T8xQXivBsxuv0G6+
	d
X-Gm-Gg: ASbGncvBDGbGTJV2xoycT9hL2rUkpf3jfI7T+lVHMKb3UTXkFI/CQnywiJqrZv9NDTs
	xPN6RPzccB5PTpaqVL2lN5Yb5xLoBpdRYUQNt5lZmYm8r/19h7F3C06huJHNQ65ATCYC6yY9G55
	IoAdmv1lrsk+Bm48VTXbEiESbC6ySgXtDo7wi20aOSJyS4Gqc2QCHXDfT1i2de5LrHuyhqxcZQ9
	gg2zbOeGoEQ6H2Yusg8Q1Ew8TuLh0XBaQP+21PjhHK50xPrBfhhNGKPlDSP/FbqqzIn8Z3AX/OD
	OLO8GiU0uXpa3NZ5XBi/6M0vMHaC8hLaN/Ht
X-Google-Smtp-Source: AGHT+IFp5i+UErfqqkUdIBl4tIDLxlI1Zn/On0wLgeQddjC++GaEwuxKV//e+9Kr5JjdPFSu/bEFYA==
X-Received: by 2002:a17:903:1c5:b0:21f:1348:10e6 with SMTP id d9443c01a7336-22463c6b664mr20925255ad.13.1741384217362;
        Fri, 07 Mar 2025 13:50:17 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:cfcd:40b4:f918:b895])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22410aa8a86sm35008645ad.240.2025.03.07.13.50.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Mar 2025 13:50:16 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 0/3] Patch review
Date: Fri,  7 Mar 2025 13:50:09 -0800
Message-ID: <cover.1741384034.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Mar 2025 21:50:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212468

Please review this set of changes for scarthgap and have comments back by
end of day Monday, March 10

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/1146

The following changes since commit 45fc7048c511c433ecc23840fe6fdd61f6366a47:

  systemd: add libpcre2 as RRECOMMENDS if pcre2 is enabled (2025-03-06 06:53:50 -0800)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/scarthgap-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/scarthgap-nut

Alessio Cascone (1):
  tzcode-native: Fix compiler setting from 2023d version

Priyal Doshi (1):
  tzdata/tzcode-native: upgrade 2024b -> 2025a

Vijay Anusuri (1):
  libtasn1: upgrade 4.19.0 -> 4.20.0

 meta/recipes-extended/timezone/timezone.inc                | 6 +++---
 meta/recipes-extended/timezone/tzcode-native.bb            | 2 +-
 .../gnutls/{libtasn1_4.19.0.bb => libtasn1_4.20.0.bb}      | 7 +++----
 3 files changed, 7 insertions(+), 8 deletions(-)
 rename meta/recipes-support/gnutls/{libtasn1_4.19.0.bb => libtasn1_4.20.0.bb} (63%)

-- 
2.43.0


