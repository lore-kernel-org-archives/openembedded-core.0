Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61B26CF9C6B
	for <webhook@archiver.kernel.org>; Tue, 24 Sep 2024 11:55:13 +0000 (UTC)
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
 by mx.groups.io with SMTP id smtpd.web11.11909.1727178906370128298
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Sep 2024 04:55:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=xuY693Ao;
 spf=pass (domain: baylibre.com, ip: 209.85.160.171, mailfrom: tgamblin@baylibre.com)
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-45815723c87so43109631cf.0
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Sep 2024 04:55:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1727178905; x=1727783705; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=gx51ud7t/LgXK0e7BQQ8I2cHToZ9pNUPz2wMYVKxZzk=;
        b=xuY693AoYMY46BVjffspFL1s2kqFtoTsKEcv+asxWAKDRqC51/9IcuIoAak6yONkWF
         nyI5NrVlS7zQYPmxXIruh/8SMYHROmJSHykyWx0gExk00/wEHzl1z6RnbfZ/g6iV7kzi
         KgNoUATGLP7RKaSocxBalQMcQf4XQuv+03kkL49Bb19zKkEV1zD8pUcmCtpiicMkzpee
         NnBbkdoQVgPtuQh4uCQ7KndGTk+Of1EfO+L9GtS3KeAvIFmHXEAG5eQNRcfF+tP25VUI
         SeWD0Y+dSYVywjo0rOzu/IebOtDDx0CYDa3AY7jPtb053G1NmJPXdE3Z/el2QZ1jtSza
         l6lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727178905; x=1727783705;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gx51ud7t/LgXK0e7BQQ8I2cHToZ9pNUPz2wMYVKxZzk=;
        b=PmIdbrPuorMVJyv+01VSD/1WW1+SnceUzT2kHKxPeqhysq9VR9TLSjF8injX6bmtsl
         T+pLZU2cIidspGuZ9kV32fLO2UcH7h8WQ15fC5OnocKMF8UyxetqsRF58pMogbOcm8UZ
         /AkW5zQI6vY8/Mg3Y7AwxMTPpzVodd/rJhjEtTxMXkO2J14hoetlAXfBC+yfEkEcUUnc
         z5ezmaZdyOWUHtDXlq733SG6XgORj0dwyPHFyzZq+r9P3W8VUTp7UmdsHXUFZ0vFduMz
         ekelN7jtD2AvYdz0SzMTsr2muS8bWYKt/iE7xMVAvANqLV0Mv1dhNzXQx9EEmp0EljIB
         BaRw==
X-Gm-Message-State: AOJu0YwGdPqzgaXqKFx/5eGdXc0d8x9pDaTLk48KuJdLlVjiNS1T/4ro
	/Tf3smoTYAmf9LGk5XGoBvUmfqTFpUlup8rjvmL3V0GMQNWpGsCmpJs1rNLY1qxBWF5sOQDkzPz
	mJ0s=
X-Google-Smtp-Source: AGHT+IFtM+0UxoZvEn5iuz45XBw8WEYRdtM/rTW1M9h7gWKDr2tsc8jmyK5gAT3fas+vpmwNspgvdQ==
X-Received: by 2002:a05:622a:1212:b0:458:31ae:d45 with SMTP id d75a77b69052e-45b4f9f9e2emr43915291cf.26.1727178905202;
        Tue, 24 Sep 2024 04:55:05 -0700 (PDT)
Received: from megalith.oryx-coho.ts.net (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-45b525456d3sm5553611cf.13.2024.09.24.04.55.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Sep 2024 04:55:04 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 0/6] patchtest: some refactor and simplification
Date: Tue, 24 Sep 2024 07:54:57 -0400
Message-Id: <20240924115503.1599651-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Sep 2024 11:55:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204850

Another smaller patch set for cleaning up the patchtest code. There are
no major functional differences here, but a lot of code has been moved
around, and some unused stuff was removed entirely. This also includes a
reformat of all the relevant patchtest components with black for
readability.

Trevor Gamblin (6):
  patchtest: patterns: add module, refactor
  patchtest: mbox.py: new data implementation
  patchtest: test_mbox: change ismerged -> canbemerged
  patchtest: simplify, rename modules
  scripts/patchtest: split out result messages
  patchtest: use black to format libraries

 meta/lib/patchtest/data.py                    |  86 -------
 meta/lib/patchtest/mbox.py                    | 112 ++++++++
 meta/lib/patchtest/patch.py                   |  43 ----
 meta/lib/patchtest/patchtest_parser.py        | 102 ++++++++
 meta/lib/patchtest/patchtest_patterns.py      | 122 +++++++++
 meta/lib/patchtest/repo.py                    |  81 ++----
 meta/lib/patchtest/selftest/selftest          |  92 +++++--
 meta/lib/patchtest/tests/base.py              | 141 +++++-----
 meta/lib/patchtest/tests/pyparsing/common.py  |  26 --
 .../tests/pyparsing/parse_cve_tags.py         |  18 --
 .../tests/pyparsing/parse_shortlog.py         |  14 -
 .../tests/pyparsing/parse_signed_off_by.py    |  22 --
 .../tests/pyparsing/parse_upstream_status.py  |  24 --
 meta/lib/patchtest/tests/test_mbox.py         | 241 ++++++++++++------
 meta/lib/patchtest/tests/test_metadata.py     | 191 ++++++++------
 meta/lib/patchtest/tests/test_patch.py        | 135 ++++++----
 .../lib/patchtest/tests/test_python_pylint.py |  47 ++--
 meta/lib/patchtest/utils.py                   |  61 -----
 scripts/patchtest                             | 185 +++++++++-----
 scripts/patchtest-get-branch                  |  54 ++--
 scripts/patchtest-send-results                |  66 +++--
 21 files changed, 1108 insertions(+), 755 deletions(-)
 delete mode 100644 meta/lib/patchtest/data.py
 create mode 100644 meta/lib/patchtest/mbox.py
 delete mode 100644 meta/lib/patchtest/patch.py
 create mode 100644 meta/lib/patchtest/patchtest_parser.py
 create mode 100644 meta/lib/patchtest/patchtest_patterns.py
 delete mode 100644 meta/lib/patchtest/tests/pyparsing/common.py
 delete mode 100644 meta/lib/patchtest/tests/pyparsing/parse_cve_tags.py
 delete mode 100644 meta/lib/patchtest/tests/pyparsing/parse_shortlog.py
 delete mode 100644 meta/lib/patchtest/tests/pyparsing/parse_signed_off_by.py
 delete mode 100644 meta/lib/patchtest/tests/pyparsing/parse_upstream_status.py
 delete mode 100644 meta/lib/patchtest/utils.py

-- 
2.39.5


