Return-Path: <pidge@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42E3FC19774
	for <webhook@archiver.kernel.org>; Wed, 13 Dec 2023 20:30:25 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web10.47319.1702499421065673928
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Dec 2023 12:30:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=c69eELSI;
 spf=pass (domain: baylibre.com, ip: 209.85.221.49, mailfrom: pidge@baylibre.com)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-333536432e0so6709290f8f.3
        for <openembedded-core@lists.openembedded.org>; Wed, 13 Dec 2023 12:30:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1702499419; x=1703104219; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=erywEslDER5N/gsFZQrQZn79Cb7W+3u5lUAUunnu/kk=;
        b=c69eELSIgIO4ESpBo9p0Wh/+/qO5P99+Za5pS+S5ZeA0qEuxxAOVCnbaMN0TAtoR0q
         Ys5UrpGPGgW91aqVOoW0zDpk+LHryBC6Xb8oEPImvxEHzb/5OMb6yFWJWCU17M3Vd4Pm
         S4tTymlqvLUXkXcIWLlKGcHjPhiGpKCGm8RYmvZfmQQ/JUAQNhio0jMG38r+xxhSKtjw
         Z6XH9Y8antB1bvCYPsyMjm7kYy9iKbMO85Lsk4DuS0Rik1utYR91fUnKjXkIkE3GfUvm
         +9kQj8G0mK0notXwlm8ghV0T9rHOrc4B13LblP7b2p0NQ8tCmjVBld/VorEQmfPVUlFn
         5lZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702499419; x=1703104219;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=erywEslDER5N/gsFZQrQZn79Cb7W+3u5lUAUunnu/kk=;
        b=QQ3xkQme3VI1UZ7gXY2HDU8s4BY3kqps6QQuCiBt2Ubn7xtiKnCO6cSCRqoZ0lRtP2
         6P1bqaEaHIl5j9mvVcLBerj4mGZ5CA3O5ZzEzfEhcv4/1HZtN8qvoYVPI+QmKk9cFhkF
         bK5fPwijc5EJaYJ68HNRhkF0jVykPuDhC3YlSzO2Jw6iNF5H/pOpf6CewIUz1lvLQPhn
         LBfsThfcOYxnIBMtg24IPO04ibVY5ueUJXaBQOJZCkQkOrmS0mw05ImGTinXWagONbaP
         3tQ4I5GI89m1A+4pNEK+PYHm3eTeGwIOFNUso+7m4LY/LdJaRLu3O+Xdy6f2/bbFveez
         PO9g==
X-Gm-Message-State: AOJu0YzfyZQcBDIH3lKotmwAUnSBYxWCCrzYWBMZjluXd4kvxzQgEjqH
	Ktex2Z2+CdBLyciw36pws3GVMfWVnbgwmf10xmq4yw==
X-Google-Smtp-Source: AGHT+IF+bEPvhSzxpKk/5JW8FoMoDYVgypUrYAS7mWhoh6l4yZJHyEtmv8FoqxZjLI1r+9Yg3DcDbA==
X-Received: by 2002:a05:6000:1183:b0:334:b2dc:dcd1 with SMTP id g3-20020a056000118300b00334b2dcdcd1mr4179214wrx.113.1702499419332;
        Wed, 13 Dec 2023 12:30:19 -0800 (PST)
Received: from orm.fritz.box ([194.110.145.184])
        by smtp.gmail.com with ESMTPSA id x10-20020a5d444a000000b00336371fafe6sm2945312wrr.16.2023.12.13.12.30.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 12:30:19 -0800 (PST)
From: =?UTF-8?q?Eil=C3=ADs=20=27pidge=27=20N=C3=AD=20Fhlannag=C3=A1in?= <pidge@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Eil=C3=ADs=20=27pidge=27=20N=C3=AD=20Fhlannag=C3=A1in?= <pidge@baylibre.com>
Subject: [PATCHv2 0/4] Proof of concept for screenshot testcases
Date: Wed, 13 Dec 2023 20:30:11 +0000
Message-Id: <cover.1702499299.git.pidge@baylibre.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Dec 2023 20:30:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192312

This takes the work rburton did on image screenshot testing and
expands it.

Right now this only works for qemux86-64. Some standardization
of screensize/resolution needs to happen with runqemu params for other
machines. There is an issue in qemux86-64 (and possibly others) where
the screenswitch icon is only half present. This causes the test to
fail.

This test takes a screendump of a qemu image (for now, just
core-image-sato for qemux86-64), and compares it to an image we
have on record. Some normalisation of the different qemu configs
need to happen to be able to support all machines. Example, the
qemuarm64 screen size is much larger than the qemux86-64.

The image we have on record contains a blanked out clock. We do
the same blanking out process for the screenshot, so the images should
have zero differences. If they do, we fail.

In order to enable this test, you will need meta-openembedded/meta-oe in
your bblayers.conf and the following in local.conf:

IMAGE_CLASSES += "testimage"
TEST_SUITES = "login"
IMAGE_INSTALL:append = " python3-qemu-qmp "
TESTIMAGEDEPENDS:append:qemuall = " imagemagick-native:do_populate_sysroot "

Eilís 'pidge' Ní Fhlannagáin (1):
  login.py: Proof of concept for screenshot testcases

Ross Burton (3):
  qemurunner: remove unused import
  python3-qemu-qmp: Add recipe
  runqemu: add qmp socket support

 .../core-image-sato-qemux86-64.png            | Bin 0 -> 46986 bytes
 meta/lib/oeqa/runtime/cases/login.py          |  34 ++++++++++++++++++
 meta/lib/oeqa/utils/qemurunner.py             |   1 -
 .../python/python3-qemu-qmp_0.0.2.bb          |  14 ++++++++
 scripts/runqemu                               |  11 ++++++
 5 files changed, 59 insertions(+), 1 deletion(-)
 create mode 100644 meta/files/image-tests/core-image-sato-qemux86-64.png
 create mode 100644 meta/lib/oeqa/runtime/cases/login.py
 create mode 100644 meta/recipes-devtools/python/python3-qemu-qmp_0.0.2.bb

-- 
2.34.1


