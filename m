Return-Path: <pidge@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 007B1C54798
	for <webhook@archiver.kernel.org>; Thu, 29 Feb 2024 12:05:13 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web10.23105.1709208307421204794
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Feb 2024 04:05:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=dJNoqRwS;
 spf=pass (domain: baylibre.com, ip: 209.85.210.169, mailfrom: pidge@baylibre.com)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-6e558a67f70so737408b3a.0
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Feb 2024 04:05:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1709208307; x=1709813107; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KCqKOc70QQpmkWrhA58mE9NEe5dsMJuo9Vo8kH07yaA=;
        b=dJNoqRwS9cnBbjBF79FP9qQsUiJeCR1BXNRSD8DR/z81cuE5VwBmSGCXGN5HcXbWW+
         PhBR8eTCrFGctsFDOgppjV4eYDmKjR0UJWgsmOCoZVvluL9nWv//POLZ7EsX6bWgOJZC
         sNDgxzbN625xdP49kR4Ra67324Z4DVrjsTuOHRJbDhK8iOTcXlOMdxp2gtvYJX0vyjhL
         b2bhRNfGswmZNgGJV5WAD+E6c/aSFPQ4fjOOd1AZuqX6BZsLu7plKdwPI3K6bsrkaqQg
         lcsDJC9KgW/BD+N3uEXcI60E67gVymKD6k+QqrDYN6nEKgIY81BDfHD/xk0v4FQxcfpc
         yExA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709208307; x=1709813107;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KCqKOc70QQpmkWrhA58mE9NEe5dsMJuo9Vo8kH07yaA=;
        b=O5HbHRB5MzrkYqY+RnwDtujiYOkIA0rQdozMeMxrd79220Ie8vaxSEI+rDBOu0nPKr
         Wq5ga2CYKkOeUtC5EAe2nKFKJ4+ISsVIkKe7kZ3EHnOOpxN2E69XKs6l/SWeNCkAt4Bc
         Y9PIWF2PR+dTpP/pN513UlBfpkHy8LOG2kEaP83OYXgH4+Gi6DS1y09PlmjdrqfPzup/
         l6qWtoyz2Hm+LzEDdRT/c06bzsZOAiOqD+sDZYLihy0xVm5jqyQbPMhZ1S5e2STZXdWH
         jwPR6l6xZELr93jOM37cMIhztpR4t+UKNfR6QyzRFYurdY1gNDL7q6XRu/eKPtisP+H2
         Ku8w==
X-Gm-Message-State: AOJu0YwKRwaztmvj0UvpO0XuvXm3P9KD6JV46PCuxC7+m24FMlCxVIIi
	BbVlGcZTug/sgu8Am7SG9sZtBvsr7c5t63/pg+qVQyJyv9JriidP9OFFoabpGpXeMRwMabAXr2c
	5aeU=
X-Google-Smtp-Source: AGHT+IHL4Y56p/KCsFb3unE43oQREPp/EvBemnoFE33omo9pSCWOlt2Iboi8NsaHbCnDsQqtaiKM8Q==
X-Received: by 2002:a62:d444:0:b0:6e5:9342:f0fb with SMTP id u4-20020a62d444000000b006e59342f0fbmr1029540pfl.14.1709208306677;
        Thu, 29 Feb 2024 04:05:06 -0800 (PST)
Received: from orm.fritz.box ([194.110.145.164])
        by smtp.gmail.com with ESMTPSA id d20-20020aa78694000000b006e54423e006sm1133677pfo.179.2024.02.29.04.05.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Feb 2024 04:05:06 -0800 (PST)
From: =?UTF-8?q?Eil=C3=ADs=20=27pidge=27=20N=C3=AD=20Fhlannag=C3=A1in?= <pidge@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Eil=C3=ADs=20pidge=20N=C3=AD=20Fhlannag=C3=A1in?= <pidge@baylibre.com>
Subject: [PATCH 0/4] image-tests and sstate permissions testing
Date: Thu, 29 Feb 2024 12:04:57 +0000
Message-Id: <cover.1709207755.git.pidge@baylibre.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Feb 2024 12:05:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196430

This patch series implements image-testing proof of concept and 
sstate permissions testing for self test. It fixes an issue in qemurunner due to
changes in QEMUMonitorProtocol.cmd() and adds test png images to compare against
for the image-testing.

Eilís 'pidge' Ní Fhlannagáin (4):
  sstatetests.py: Add testing for correct sstate permissions
  qemurunner.py: Fix error on calls to run_monitor
  image-tests: Add initial image test png files
  login.py: Proof of concept for screenshot testcases

 .../image-tests/core-image-sato-qemuarm.png   | Bin 0 -> 52405 bytes
 .../image-tests/core-image-sato-qemuarm64.png | Bin 0 -> 47505 bytes
 .../image-tests/core-image-sato-qemumips.png  | Bin 0 -> 46634 bytes
 .../core-image-sato-qemumips64.png            | Bin 0 -> 46053 bytes
 .../image-tests/core-image-sato-qemuppc.png   | Bin 0 -> 52232 bytes
 .../core-image-sato-qemuriscv64.png           | Bin 0 -> 38806 bytes
 .../image-tests/core-image-sato-qemux86.png   | Bin 0 -> 46548 bytes
 meta/lib/oeqa/runtime/cases/login.py          | 107 ++++++++++++++++++
 meta/lib/oeqa/selftest/cases/sstatetests.py   |  28 ++++-
 meta/lib/oeqa/utils/qemurunner.py             |   4 +-
 10 files changed, 136 insertions(+), 3 deletions(-)
 create mode 100644 meta/files/image-tests/core-image-sato-qemuarm.png
 create mode 100644 meta/files/image-tests/core-image-sato-qemuarm64.png
 create mode 100644 meta/files/image-tests/core-image-sato-qemumips.png
 create mode 100644 meta/files/image-tests/core-image-sato-qemumips64.png
 create mode 100644 meta/files/image-tests/core-image-sato-qemuppc.png
 create mode 100644 meta/files/image-tests/core-image-sato-qemuriscv64.png
 create mode 100644 meta/files/image-tests/core-image-sato-qemux86.png
 create mode 100644 meta/lib/oeqa/runtime/cases/login.py

-- 
2.34.1


