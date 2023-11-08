Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6487EC4167B
	for <webhook@archiver.kernel.org>; Wed,  8 Nov 2023 22:53:20 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web11.107100.1699483994591510500
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Nov 2023 14:53:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=jf6NEpj8;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.176, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-6b44befac59so1027933b3a.0
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Nov 2023 14:53:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1699483993; x=1700088793; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=HFRqJtAHe+lD+640H154LRNMmRUoayM0A2K+zSabm88=;
        b=jf6NEpj8PW8CPq82/BXRIcNz6yr4K+aNM45Yz8GkCSMAf2FzfVAN88rz0JC1MEh7IJ
         aAm4Jid29qjUcff7t0WcGbqilkkkznx9jrlMOzutRRIt8qSg3/X5NKSsdjEwKKTAvsrg
         XS75unCP16Qle8+Wejkyxq1IW4IzHBfNOozEYB5jyYBziyr1kByjrvOWsaabQATl5JH7
         SKtdnfU300iyB85yg5opu/wvz78b2KeY4BefRmLuEy6Y8pQF4FRyQ3oFCKqHPUluVqlM
         +bWeVU/N5DLI0esyElALBCTtFbw1UFnI+1clGyZv1t+yXsxpkWbaoig03rYL6asvoX7o
         Q6FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699483993; x=1700088793;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HFRqJtAHe+lD+640H154LRNMmRUoayM0A2K+zSabm88=;
        b=MebLGcEEQi09APW53YI+DRp0z2+l2RmAFJ9AxEgXN1sCtHNJbs0YhpfcQKJn1Ay38a
         8zEJOCo56ADwmaSeJ5i6Jy36d45/yzELOYzfQB7tKMLXnddXfXTDr3HKQOUmDmmPWt4P
         sSeprpldJirzhEMhNnzR/e3tK4tq807MZwFqrXOPY4sb5kNy0fomO2BqeGDsb2CBCZKx
         /NN4hLVCPzUllPIybo5gfftmThLCsoQ7luu+zDCbxcEMNQELXZR1jednT6Tvi+KBEbus
         N6L2DTlZHvupwouA0gKiWBh7CAhlI5cH9JvdlkUHSNPZLPfspkb3c1bRf2I4aEC0rXUB
         0QJQ==
X-Gm-Message-State: AOJu0YwJBYl/XS2lCt2lCy3GmPf3qq2X0xNny14fCbiSzRzcpPntle7x
	AonD2n4r7PSahDEqp2WC+tfOgLoW5SEnvyBeeqat6g==
X-Google-Smtp-Source: AGHT+IFpM6TUB7KJmgvY910BbHEIm7GkX5axkEe+F/RDdoXByTLhMkVct3tKwxsQfrCOSwGp31qULA==
X-Received: by 2002:a05:6a20:6a20:b0:181:7d6d:c10b with SMTP id p32-20020a056a206a2000b001817d6dc10bmr4950759pzk.7.1699483992760;
        Wed, 08 Nov 2023 14:53:12 -0800 (PST)
Received: from hexa.lan (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id du4-20020a056a002b4400b006884844dfcdsm9467883pfb.55.2023.11.08.14.53.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Nov 2023 14:53:12 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 0/7] Patch review
Date: Wed,  8 Nov 2023 12:52:59 -1000
Message-Id: <cover.1699483825.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Nov 2023 22:53:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190358

Please review this set of changes for kirkstone and have comments back by
end of day Friday, November 10

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/6158

The following changes since commit 0eb8e67aa6833df0cde29833568a70e65c21d7e5:

  build-appliance-image: Update to kirkstone head revision (2023-11-03 04:27:49 -1000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/kirkstone-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-nut

Narpat Mali (1):
  python3-jinja2: Fixed ptest result output as per the standard

Ross Burton (3):
  cve-check: sort the package list in the JSON report
  cve-check: slightly more verbose warning when adding the same package
    twice
  cve-check: don't warn if a patch is remote

Sanjana (1):
  binutils: Fix CVE-2022-47010

Soumya Sambu (1):
  libwebp: Fix CVE-2023-4863

Vijay Anusuri (1):
  xserver-xorg: Fix for CVE-2023-5367 and CVE-2023-5380

 meta/classes/cve-check.bbclass                |   2 +
 meta/lib/oe/cve_check.py                      |  13 +--
 .../binutils/binutils-2.38.inc                |   1 +
 .../binutils/0032-CVE-2022-47010.patch        |  38 +++++++
 .../python/python3-jinja2/run-ptest           |   2 +-
 .../xserver-xorg/CVE-2023-5367.patch          |  84 +++++++++++++++
 .../xserver-xorg/CVE-2023-5380.patch          | 102 ++++++++++++++++++
 .../xorg-xserver/xserver-xorg_21.1.8.bb       |   2 +
 ...23-5129.patch => CVE-2023-4863-0001.patch} |  20 ++--
 .../webp/files/CVE-2023-4863-0002.patch       |  53 +++++++++
 meta/recipes-multimedia/webp/libwebp_1.2.4.bb |   3 +-
 11 files changed, 303 insertions(+), 17 deletions(-)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0032-CVE-2022-47010.patch
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2023-5367.patch
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2023-5380.patch
 rename meta/recipes-multimedia/webp/files/{CVE-2023-5129.patch => CVE-2023-4863-0001.patch} (97%)
 create mode 100644 meta/recipes-multimedia/webp/files/CVE-2023-4863-0002.patch

-- 
2.34.1


