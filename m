Return-Path: <jstephan@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D60DEB64DD
	for <webhook@archiver.kernel.org>; Thu,  3 Aug 2023 13:29:18 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web11.14836.1691069356557374859
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Aug 2023 06:29:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20221208.gappssmtp.com header.s=20221208 header.b=5WfKBifd;
 spf=pass (domain: baylibre.com, ip: 209.85.128.50, mailfrom: jstephan@baylibre.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-3fe1e1142caso10116815e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Aug 2023 06:29:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1691069354; x=1691674154;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/gBdWNjcEJas+OH2etmWKgbm9ugIe3zwnPsHd00AClk=;
        b=5WfKBifdireJkNZ7zVO34GCFpHkP4I97Rc/+V85vaHvK1va2Mo91x5lxvAFNwnrUPc
         HvxWyNnaJZK1kOxhMvcrZCKjsF80TbcG2eDvpJhMWpEvFzqpy1x1k14TAZnI5rrBXBcW
         lIF0YiD4VsPv1CVy1P9D2c9dT9pt31y9UBkFARuu2EDCSigxpRR1plICWjfkcpRjBaqM
         gNlMh+0cJHhvhxR0OQOniwV7TdBOFp7K/azxZhIHXMTQZeWDdEOvajDnlIFQDrAJA23q
         05K3YQz7gSD4akSHFNFlb6poUfTZt32491lbLgAaGUaQZNMQLLKNjrUl1Cm1B5jNciZ1
         n8VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691069354; x=1691674154;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/gBdWNjcEJas+OH2etmWKgbm9ugIe3zwnPsHd00AClk=;
        b=BvJdkXnNjRqn1G2aXmm9SemfSG2maNXWgdgInj40rWHDIyV0YRLNBUqx1gyaiZjfiM
         WdUUWSez4FOJKH3wCrj50GRga0yR66cZgp/C4GI3r8bFstMnQxlxyS4heyN2DZS4YPL+
         crFo6v3MaS27uGa3/gJSqe96Dlgh9WG3CTEs3SyQSJKKQDx+nKKrUuISXS1+n3BovLOj
         Qw/SntwE0RC/8fT+rTs77LKDPRvH6zD9U485y6q4BLKWfw1FtGD01lc/mubzjp0CM/eU
         2Dtuw0YC7qBDVi7ayAIP2WbUN0t9wFFztqpiDIBzcuvACxs6mQMGtFPro6WW+Kto/H9Q
         ezPQ==
X-Gm-Message-State: ABy/qLY4CsfxpUVOvrWhlCLOV7Kbi10uPDcM6C7olMFgOlNdCwylr0Y2
	uDxdIVZ39GITY8X+smFQ6STF3TgYryZFvCyUQSY=
X-Google-Smtp-Source: APBJJlFshtB8r0iD0d07eEqmjgUzGcz4Oaaoj9H7dp0QeElFV+9DZDutLfVrSohRCwlJAf6CkIpIPA==
X-Received: by 2002:a7b:ce92:0:b0:3f9:b8df:26ae with SMTP id q18-20020a7bce92000000b003f9b8df26aemr7334511wmj.34.1691069354490;
        Thu, 03 Aug 2023 06:29:14 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:55f:21e0:9e19:4376:dea6:dbfa])
        by smtp.gmail.com with ESMTPSA id r18-20020adfce92000000b0031272fced4dsm21833072wrn.52.2023.08.03.06.29.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Aug 2023 06:29:14 -0700 (PDT)
From: Julien Stephan <jstephan@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: Julien Stephan <jstephan@baylibre.com>
Subject: [RESEND 0/1] Add ptest support for libexif
Date: Thu,  3 Aug 2023 15:29:07 +0200
Message-ID: <20230803132908.4134002-1-jstephan@baylibre.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Aug 2023 13:29:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185476

Hi all,

Resending this series. The required series [1] has been merged, so this one is now ready to be merged.

Previous message:

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

