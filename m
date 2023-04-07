Return-Path: <lrannou@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71ED3C6FD1D
	for <webhook@archiver.kernel.org>; Fri,  7 Apr 2023 14:27:05 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web10.9582.1680877615709574602
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Apr 2023 07:26:56 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@baylibre-com.20210112.gappssmtp.com header.s=20210112 header.b=Fp3Vjqb6;
 spf=pass (domain: baylibre.com, ip: 209.85.221.52, mailfrom: lrannou@baylibre.com)
Received: by mail-wr1-f52.google.com with SMTP id r29so42424315wra.13
        for <openembedded-core@lists.openembedded.org>; Fri, 07 Apr 2023 07:26:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1680877614; x=1683469614;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HElTeCkjUpyX95XfavtEm3ZQRFlMaEsl3dEopDQ4VBY=;
        b=Fp3Vjqb6/V/x2ZE7UpuFwU3PL5PtWK5LQ4oIPoKqbKzOluY7boJUBv1N6kU4ESdrLI
         nQUq0QGs45p89rvKOlzLTCsrPvnVYh/CKm5DSawnVxk1zrJFP2v6YJPiQVu30MSSeARH
         DCGFcBp/yYbTMfbQBmi15QSUhaqcaYZoGjxikx/10cjLbptDuzF5arvrcLjQB77JCcXy
         0ZP/G7sPHNH0Ld4OEfMH05QXxqf6Jwt2sE0DLjZC1k7xZA2bWPR1inMWe14SCwgHchR1
         UXXXM3U/IQ3613Vr8I9T7m2hn7NxbMuZwWBeU6jYNLhizyonUxx0imvF2o13wVE3PigN
         yeJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680877614; x=1683469614;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HElTeCkjUpyX95XfavtEm3ZQRFlMaEsl3dEopDQ4VBY=;
        b=CtQlSg/Gnjx9w0hdL8eBKTG7eyftUpCgGAQJl65eN/deg5bJtdoVmqsyq0+2uFuYuy
         OFPD/4a3J4bk5rwqx6BEIEstQHJmzNLRv7y5nrQw/UAHWlYitRKCJ+XiZUtnHsYk3Dgy
         hnnuSbqUa46bH4klHJuvxXBTGcO8GVCoeNAxolOpLaWZ2KWnvGGjqHgk7jvy3RS2EbMO
         CKJUGuCEVcrwmPOwz9K8pAmoLNtj9nIqVQY5L4YuI+OZMsxCwlqUtoHFaeV8xlmmdcDv
         it2adLfVw9o4+kvse//Q9jM7eZIxdSXEI2/LdKuyl0XaOzqjxupf393J97x7d2Qi/ZPW
         dz9g==
X-Gm-Message-State: AAQBX9ciDAozJZ9Q9lhc/pWp7r+ddbCZsJeYwnXvQF4R2h5Ec8uxTBDe
	yLmWjcNJHtm3Ldnlj5bFpAdRt/Wuq8GXjulg12YMiA==
X-Google-Smtp-Source: AKy350YYEOK8vrLwLSx5Oet6avyX2d40TuhGXFaXu3AWegRYDEeh7MkMp9/BC3ChtgKmA4tAROCUxg==
X-Received: by 2002:a5d:526b:0:b0:2ce:a835:83d4 with SMTP id l11-20020a5d526b000000b002cea83583d4mr1422951wrc.27.1680877614171;
        Fri, 07 Apr 2023 07:26:54 -0700 (PDT)
Received: from midgar.. ([193.33.56.84])
        by smtp.gmail.com with ESMTPSA id l13-20020a5d668d000000b002e61e002943sm4601403wru.116.2023.04.07.07.26.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Apr 2023 07:26:53 -0700 (PDT)
From: Louis Rannou <lrannou@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: khilman@baylibre.com,
	Louis Rannou <lrannou@baylibre.com>
Subject: [PATCH v3 0/2] oeqa: Change the serial runner
Date: Fri,  7 Apr 2023 16:26:20 +0200
Message-Id: <20230407142622.632035-1-lrannou@baylibre.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Apr 2023 14:27:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179823

The actual serial runner has a different usage compare to the ssh runner. The
return status is different and failure are not raised as exceptions.

Initially, I wanted to create a new run_serial_socket and modify the old
run_serial to use the former. And there was a second patch that changed every
call to run_serial to run_serial_socket. But that is not easy as each test can
have a different manner to handle the exception.

Therefore, the second patch only change dummy calls to the serial runner.

Louis Rannou (2):
  oeqa/utils/qemurunner: change the serial runner
  oeqa/selftest: change deprecated usage of run_serial

 meta/lib/oeqa/selftest/cases/debuginfod.py |  3 +-
 meta/lib/oeqa/selftest/cases/gdbserver.py  |  7 +--
 meta/lib/oeqa/selftest/cases/locales.py    |  8 +--
 meta/lib/oeqa/selftest/cases/overlayfs.py  | 42 ++++++++++------
 meta/lib/oeqa/selftest/cases/package.py    |  7 +--
 meta/lib/oeqa/selftest/cases/runqemu.py    |  2 +-
 meta/lib/oeqa/targetcontrol.py             |  3 ++
 meta/lib/oeqa/utils/qemurunner.py          | 57 ++++++++++++++++++++++
 8 files changed, 103 insertions(+), 26 deletions(-)

-- 
2.40.0


