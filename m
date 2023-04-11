Return-Path: <lrannou@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D2D8C77B73
	for <webhook@archiver.kernel.org>; Tue, 11 Apr 2023 15:05:32 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web10.16459.1681225523451157093
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Apr 2023 08:05:24 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@baylibre-com.20210112.gappssmtp.com header.s=20210112 header.b=074IE/eZ;
 spf=pass (domain: baylibre.com, ip: 209.85.128.48, mailfrom: lrannou@baylibre.com)
Received: by mail-wm1-f48.google.com with SMTP id l16so4270637wms.1
        for <openembedded-core@lists.openembedded.org>; Tue, 11 Apr 2023 08:05:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1681225521; x=1683817521;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xfeSFRp8fMiKd717FYDARPqIRWbJeMu5bWfpelKNux8=;
        b=074IE/eZAAKJ7pvnnClaK7ejzoLJFPNiBobU+hyILIaSIgGONfmbSOTX1MQ75upgfk
         4tEoazPqpjTVoGBNBmWbsJM/zqV5nb5iveHhM0DVGWgrccfdlAUxqouiL/SX5Gbny2BJ
         SFzrniI3AGxHqRff89SQOMRXiNvmzLxoMLQnOZPuH+XD4IDLLzMMdgGnjjuhwo5GEpsV
         OqFxAzk+X8AQ2M8Rx6f/PDe5uDrDBMAjaoYTgiNRheCNCgqpZHcB3xFNuZ0yFKk+hTlh
         lVSYcy4vMPW2eJYPo5AWDgdFKmq8pNMnuxBZhWeAGbEw4PxVxYYoBFlPcHoaLXlci7xn
         lq7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681225521; x=1683817521;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xfeSFRp8fMiKd717FYDARPqIRWbJeMu5bWfpelKNux8=;
        b=r+WiKqBuaaho+XcX4vs1f72jxQutSTpw0KX3CSHfrDDXD1pNHyFHAwXux9RQfZRZXY
         SKySHxiuSTeqHZgZ21yAbFRoPaSX5Cp58aBnSwLa2hpcp/9c3CNdcOCSLnoKP+Rsx4UW
         wPDGLwDMirkCu+nAuYKapvxnNi5H3bLF9yqeBGUwokH7ytMw75vHvxGR51lM57fx6Ht5
         YefxR7H9tDu4W4uUifHftdqk27c9LcPyjj6xosOAmY+GlVogGsGMAayl8U/t+Ykrpuhq
         er/l9RIgm9x/UdFWGsfUZcQiZ6yr2BDe6YI78c+RrT1yag+qYpbuCXu4hjVBu4P6LddR
         8Wnw==
X-Gm-Message-State: AAQBX9dKklu+qlNBsI5obhrSj/QrmwGJhBivVJc5DILeDZeyhC6XM1AT
	8r1Eg3iMx/0Ru5t3208xKk9XOHjG5FGY/YGOl2k=
X-Google-Smtp-Source: AKy350bl8Go7v6Y5aNqQastkrJbXgwf4/Wu8QmqLHyT5fGy5UxChyiHfmwPAnMPGVP03QDTt0NC6Wg==
X-Received: by 2002:a1c:f70c:0:b0:3ee:4dc0:d4f2 with SMTP id v12-20020a1cf70c000000b003ee4dc0d4f2mr2127613wmh.41.1681225521570;
        Tue, 11 Apr 2023 08:05:21 -0700 (PDT)
Received: from midgar.. ([2001:912:1480:1c0::1])
        by smtp.gmail.com with ESMTPSA id n6-20020a7bc5c6000000b003f072b22dbbsm16324161wmk.16.2023.04.11.08.05.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Apr 2023 08:05:21 -0700 (PDT)
From: Louis Rannou <lrannou@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: khilman@baylibre.com,
	Louis Rannou <lrannou@baylibre.com>
Subject: [PATCH v4 0/2] oeqa: Change the serial runner
Date: Tue, 11 Apr 2023 17:05:01 +0200
Message-Id: <20230411150503.2105880-1-lrannou@baylibre.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Apr 2023 15:05:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179927

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
 meta/lib/oeqa/selftest/cases/package.py    |  7 +--
 meta/lib/oeqa/selftest/cases/runqemu.py    |  2 +-
 meta/lib/oeqa/targetcontrol.py             |  3 ++
 meta/lib/oeqa/utils/qemurunner.py          | 57 ++++++++++++++++++++++
 7 files changed, 75 insertions(+), 12 deletions(-)

-- 
2.40.0


