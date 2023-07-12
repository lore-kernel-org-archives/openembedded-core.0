Return-Path: <jstephan@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65CDEEB64DA
	for <webhook@archiver.kernel.org>; Wed, 12 Jul 2023 15:59:33 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web10.11230.1689177565215932598
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Jul 2023 08:59:25 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@baylibre-com.20221208.gappssmtp.com header.s=20221208 header.b=xALU3Qp0;
 spf=pass (domain: baylibre.com, ip: 209.85.128.53, mailfrom: jstephan@baylibre.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-3fbc12181b6so76947785e9.2
        for <openembedded-core@lists.openembedded.org>; Wed, 12 Jul 2023 08:59:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1689177563; x=1691769563;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+5YaCb0DPm+bU/7yQXmu0sCdKTzG7ZZ4+0+GyG3X9t4=;
        b=xALU3Qp0784yQjWX0n16LaKT4ltpxZ61B51txz/Q2V5IlIqTNh/mg2xtFZCz+WmlrH
         i8jSf4rSLCw9kx/2C3dF/nLQbHD97X2G4d+cTI/zYErSlNEYaSmI/YrnSJWzB+unsJsR
         OBL6aicjxCJGgxYnSiBRpA42B3tby5E/8oLFgnX+CymasGc2bpYa71NTRALZB3epcrjT
         mg9o/DRJgmA7soG2N2DnabEiM0VWr3vKzVmtZGh26tIiDWXTmQUwLGe4XgJQCa5XX74E
         IOlR5b8SFX+ut+h03XvSXheXyNs5If+jk5IN68XMp3ZE1YrSTHPBJ4oJizFQriBitzgQ
         gPXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689177563; x=1691769563;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+5YaCb0DPm+bU/7yQXmu0sCdKTzG7ZZ4+0+GyG3X9t4=;
        b=GC64Au43E9Qm4IuRemPcTLM5IAfqGGP0m7nF49x/z0rY5vtMS2Jtd8RFP0i6kxsrd/
         VXbMa/I9wp4dFd+EIIjvVbid9JCzc1vpvKjkau37FONrB0qn+TsKq8+IIojUUaGMWCYU
         HfC451PAngsfQ9YQAl21PdP9hoGOpO6+FwVlkZjj1swpuMo/D3YYP06p+QKnCPLbn+uO
         MZlbHIvmWAU838FZFVXn/NXzgYYbG/tszQEdEYyGQFnBe9ZMH9LRELMeBe7253XwTzmH
         XteIrIg7yEo3ojnI++Vs1aOHiidRRPjd2vpWwsLW/n6TBi3VpEX9hgMgC6L9B+1wYvO9
         MBTQ==
X-Gm-Message-State: ABy/qLZzN8eu1lDt1H1TtstMx7lz8+fRlEBCy1PatEeG0sF/N+JX4IiS
	EeZzoEhpz4ocUi0MGUsK6HYJa29QVJXk7Lml4W/00Q==
X-Google-Smtp-Source: APBJJlHox36apOQHiSoRkxFXyelA+jXSi+6SiiWl8hbm2jAM/5gg3pC/X/tE/Giw2h5jJkuo8WZU1Q==
X-Received: by 2002:a05:600c:293:b0:3fb:e2af:49f6 with SMTP id 19-20020a05600c029300b003fbe2af49f6mr17958858wmk.39.1689177563124;
        Wed, 12 Jul 2023 08:59:23 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:55f:21e0:fd3b:9fed:e621:cc8f])
        by smtp.gmail.com with ESMTPSA id p6-20020a7bcc86000000b003fa95890484sm5412550wma.20.2023.07.12.08.59.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jul 2023 08:59:22 -0700 (PDT)
From: Julien Stephan <jstephan@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: Julien Stephan <jstephan@baylibre.com>
Subject: [PATCH 0/1] Add ptest support for libexif
Date: Wed, 12 Jul 2023 17:59:17 +0200
Message-ID: <20230712155918.415721-1-jstephan@baylibre.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Jul 2023 15:59:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184203

Hi all,

This series add ptest support for libexif.

This series depend on [1]. This fix is required here because one of the
test program, listed in check_PROGRAMS is not listed in TESTS, because
it is called through a wrapper script. So we are missing one binary and
we get a runtime error.

Ptest was executed on a core-image-minimal:
root@qemux86-64:~# ptest-runner libexif
START: ptest-runner
2023-07-12T15:45
BEGIN: /usr/lib/libexif/ptest
[...]
i====================
All 13 tests passed
(1 test was not run)
====================
[...]
DURATION: 35
END: /usr/lib/libexif/ptest
2023-07-12T15:45
STOP: ptest-runner
TOTAL: 1 FAIL: 0

My working branch is [2]

Best
Julien

[1]: https://lists.openembedded.org/g/openembedded-core/message/184201
[2]: https://git.yoctoproject.org/poky-contrib/log/?h=jstephan/add-libexif-ptest-support

Julien Stephan (1):
  libexif: add ptest support

 .../distro/include/ptest-packagelists.inc     |  1 +
 ...-serial-tests-config-needed-by-ptest.patch | 26 ++++++++++++++++
 .../recipes-support/libexif/libexif/run-ptest |  3 ++
 .../recipes-support/libexif/libexif_0.6.24.bb | 30 ++++++++++++++++++-
 4 files changed, 59 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/libexif/libexif/0001-Add-serial-tests-config-needed-by-ptest.patch
 create mode 100644 meta/recipes-support/libexif/libexif/run-ptest

--
2.41.0

