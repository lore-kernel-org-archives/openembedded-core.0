Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF215C4167B
	for <webhook@archiver.kernel.org>; Thu,  7 Dec 2023 23:13:51 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web11.106722.1701990827623054507
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Dec 2023 15:13:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=i7zJvp1q;
 spf=pass (domain: gmail.com, ip: 209.85.210.178, mailfrom: ticotimo@gmail.com)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-6ce33234fd7so983888b3a.0
        for <openembedded-core@lists.openembedded.org>; Thu, 07 Dec 2023 15:13:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701990827; x=1702595627; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=av+HRH1GfQnInCMJeP0AXh/Izn6WGufR4m07+ICgtJE=;
        b=i7zJvp1qVaYPDF+dor69dYAJ/BWR3YCN+qYvBpP4/QI4jh/YXhW2BY7dIqjkf7Nr/K
         2E3UiV5wg0ko0E8pKUIb1UEWVqgCow2r1Y6D05al2wy/mpd9Tdnwyiqa6lodL4Ayx7Ap
         n2+Seg9mVFF3i5x+8rWrC+URuKkiFvpJkYaT26shDKZdxmF714BCbqwbYwo7qD5GAqqo
         pi3omMW4sKq0KpmxAvFd1Zdr1JIwQab50h5eQ+AC0mHP4058etOkhHJrE/3jJfA4Lje0
         rnotKcb8dhuyx/mWT7RxsCmtsvaGni0PT7EjBHfKZad2/VAej819fhPu3FJm26k4vVVw
         cEUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701990827; x=1702595627;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=av+HRH1GfQnInCMJeP0AXh/Izn6WGufR4m07+ICgtJE=;
        b=U3FpzBTny0qFpdrv92hDlb3lTrlb9I7RQF9SFC+8Hdodx9z886/UhW3Lan2nyOxm2+
         LpjrQf9dmM4zK/wXBBiwsX1qbyk5Gc8jWRrvYyyBIy7Y9r5xVgh71RK/W7Yos7Xh8tFV
         beeLJBp0jpKPhEUw2+I6faPnj3XrOsd9O6jQg7wF9pHadudNuhanUkCjkT0QP3Xo8aSH
         Oqcu2e2/UjkpfDoE1dkDnqEf1/bybGHJ6A4k/Ob7FFSYQR9Rhk6QMrFho2Dvy280Fr9V
         7bsJ4hN/YwoaKmiAza5oj/UM/OqYJ0mRSKcmO1Is52YvB6rEuSmaAlxZiDJwTz229st2
         VYjg==
X-Gm-Message-State: AOJu0YxkzHP1sQQQNUwxNF0VBXQpfPkNuz6ZFa1nQa+LN9YbEPWcAt32
	HuGgR6E5uCIR50+1gDvngVACgFd7Hvs=
X-Google-Smtp-Source: AGHT+IGnIiT5DIcE9GX+cnhBOgNKN7GrgAa+6HLSRTMY/uDFtpBMsnMXONHy4UfISjJkIV10JdZhlA==
X-Received: by 2002:a05:6a20:8410:b0:18c:52d:8f79 with SMTP id c16-20020a056a20841000b0018c052d8f79mr2419501pzd.62.1701990826448;
        Thu, 07 Dec 2023 15:13:46 -0800 (PST)
Received: from chiron.hsd1.or.comcast.net ([2601:1c0:ca00:cea0:f523:dc1d:b135:87b9])
        by smtp.gmail.com with ESMTPSA id o12-20020a170902bccc00b001d0696e9237sm349695pls.118.2023.12.07.15.13.45
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 15:13:45 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/6] Add 'maturin' python backend support
Date: Thu,  7 Dec 2023 15:13:17 -0800
Message-Id: <cover.1701989368.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Dec 2023 23:13:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191981

We are increasingly seeing Rust extensions for Python added in the
ecosystem. The current best practices approach has moved from using
'setuptools-rust' to using 'maturin'.

* Add python3-maturin, including 'native' and 'nativesdk' support.
* Add a 'python_maturin' bbclass for the PEP-517 backend.
* Add recipetool support for the 'maturin' PEP-517 backend.
* Add a very basic 'maturin list-python' smoke test added to oeqa for
  both 'runtime' (-c testimage) and 'sdk' (-c testsdk).

The following changes since commit 70ad9b9b309575134834757468cb32c9e3b87448:

  bitbake: hashserv: sqlite: Ensure sync propagates to database connections (2023-12-04 22:36:09 +0000)

are available in the Git repository at:

  https://git.yoctoproject.org/poky-contrib timo/maturin_1.3.2
  https://git.yoctoproject.org/poky-contrib/log/?h=timo/maturin_1.3.2

Tim Orling (6):
  python3-setuptools-rust: BBCLASSEXTEND + nativesdk
  python3-maturin: add v1.3.2
  classes-recipe: add python_maturin.bbclass
  recipetool: add python_maturin support
  oe-selfest: add maturn runtime (testimage) test
  python3-maturin: add sdk (testsdk) test case

 meta/classes-recipe/python_maturin.bbclass    |  17 +
 meta/conf/distro/include/maintainers.inc      |   1 +
 meta/lib/oeqa/runtime/cases/maturin.py        |  23 +
 meta/lib/oeqa/sdk/cases/maturin.py            |  33 +
 meta/lib/oeqa/selftest/cases/recipetool.py    |  34 ++
 .../python/python3-maturin-crates.inc         | 572 ++++++++++++++++++
 .../python/python3-maturin_1.3.2.bb           |  40 ++
 .../python/python3-setuptools-rust_1.8.1.bb   |   2 +-
 .../lib/recipetool/create_buildsys_python.py  |   1 +
 9 files changed, 722 insertions(+), 1 deletion(-)
 create mode 100644 meta/classes-recipe/python_maturin.bbclass
 create mode 100644 meta/lib/oeqa/runtime/cases/maturin.py
 create mode 100644 meta/lib/oeqa/sdk/cases/maturin.py
 create mode 100644 meta/recipes-devtools/python/python3-maturin-crates.inc
 create mode 100644 meta/recipes-devtools/python/python3-maturin_1.3.2.bb

-- 
2.34.1


