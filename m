Return-Path: <tim.orling@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1516C54FB3
	for <webhook@archiver.kernel.org>; Sun,  1 Jun 2025 22:26:30 +0000 (UTC)
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com [209.85.214.195])
 by mx.groups.io with SMTP id smtpd.web10.37008.1748816787407990769
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Jun 2025 15:26:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=orxNld8W;
 spf=pass (domain: konsulko.com, ip: 209.85.214.195, mailfrom: tim.orling@konsulko.com)
Received: by mail-pl1-f195.google.com with SMTP id d9443c01a7336-23539a1a421so14896625ad.0
        for <openembedded-core@lists.openembedded.org>; Sun, 01 Jun 2025 15:26:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1748816786; x=1749421586; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=tXSC0Y2g31YDsq4CdxLQovnrEJy+FL4MQoFPBUZt3dM=;
        b=orxNld8W/E7ARFe/b6xk6XPztJA4l9dhqJ7JOczqkkfrkYWCBL98bt75sfG4Nz33B3
         KoGeIEb9LOIjBxIKvMC3jeKAztW7ZJd8JLwsgjwqILWpQTZCT8refsMfsTGf0W0XCmRN
         tOSf0OuaYf7OrmqvGcaisAPc5HgS3la3P9Cdg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748816786; x=1749421586;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tXSC0Y2g31YDsq4CdxLQovnrEJy+FL4MQoFPBUZt3dM=;
        b=LCZ6FYAOquiMmyYEfAeDspchW2/C9vegtyATH3JVlhnpecXuhviznLs90x+V3tSu2a
         y1xAdKLcfp1zaBzKQYqzjmyrBkxs8D8WnAFxwIfluJaz6e1I6zrKbNspTi9WlXna+V+d
         C8HGVoLYWGjEn0IfV7oOzp5RWRAerV4NJMGGZQUqKf+p0GohdTE258K8niV6jNpvfU3N
         YiU1pNzqIL6+zZUpg+eCP00H7RD+asXXa7N55g7oY7UL+WscqWHM/i/VD38ZzWUyzuKL
         09mZ8C149ZT+tsV8LjRMNQB1kAzYtehn3vshyG8Sfw+v7EEy2Ghrhy9XEqQT7lF0t+w5
         PCLg==
X-Gm-Message-State: AOJu0YwaTUtQTwAVNmN9/BkfXUPw+AOoSrDDpPP28yhzqdwTqJVoh40o
	I2hcS7QPO+gIIWOp4gdvyev+La4rTxcwlxwksYIDQJPe9H5WDERW7od1nj4B11dY+GDfyYrIXVg
	0RaYWoFmkdM1M
X-Gm-Gg: ASbGncsQj4L1BOcyzBnhgxNDQcPbV8FIIst/krvW5wdr8CSEnkvWtBuJWX6l9lhiOLw
	Pp9Eo/NCgcLejSyYqh9hAh/xfDRhBH+ii9diAgLkK0WZDgfFajxQGnOsKnvfRxnbSPUy3lL54ez
	DcNGY+mrOZ+4/kwNIX0QV4pATBAFMfd0Fb3NT7mCKnUMNTKGV82it9BhfLo5zhWxfheYIZ6ahBR
	uFXrGVlR15EkJVm5mgUTC7qLczqpmrqu8Z6EI+eUiVUXtLkYQujJcWWcA3Cmw+tqKiF2H6ObiYC
	v8q+5g/6PveBpdTL5+oxVLPxDBDFR27rM6ksdQjtgmPlQ1xW9b8esOYLMmTlQHaINb8whl1Av5+
	2dM118JnOWkksx9sBdJoaIDQJRg==
X-Google-Smtp-Source: AGHT+IGMhFvIuud9JE7m+X9qli+inGP9THgVdQXvXpqeSnaHjLicIZw4lBNrAGpjgoNJXe6JSn9coA==
X-Received: by 2002:a17:903:1c6:b0:234:ba37:879e with SMTP id d9443c01a7336-2355f781dadmr95267475ad.38.1748816786288;
        Sun, 01 Jun 2025 15:26:26 -0700 (PDT)
Received: from localhost (c-98-232-159-17.hsd1.or.comcast.net. [98.232.159.17])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506d14aa7sm59122315ad.223.2025.06.01.15.26.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Jun 2025 15:26:25 -0700 (PDT)
From: tim.orling@konsulko.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/8] AUH upgrades for 2025-06-01
Date: Sun,  1 Jun 2025 15:26:13 -0700
Message-ID: <cover.1748816484.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Jun 2025 22:26:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217678

From: Tim Orling <tim.orling@konsulko.com>

AUH upgrades for my maintained recipes in oe-core

The following changes since commit 8b69db7b58f5eed90624b0f3c06161d71fd815dc:

  python3-wheel: upgrade 0.45.1 -> 0.46.1 (2025-06-01 11:33:36 -0700)

are available in the Git repository at:

  https://git.yoctoproject.org/poky-contrib timo/upgrades-2025-06-01
  https://git.yoctoproject.org/poky-contrib/log/?h=timo/upgrades-2025-06-01

Tim Orling (8):
  python3-setuptools-rust: upgrade 1.11.0 -> 1.11.1
  python3-maturin: upgrade 1.8.3 -> 1.8.6
  python3-pluggy: upgrade 1.5.0 -> 1.6.0
  python3-cryptography,python3-cryptography-vectors: upgrade 44.0.2 ->
    45.0.3
  python3-pyopenssl: upgrade 25.0.0 -> 25.1.0
  python3-rpds-py: upgrade 0.24.0 -> 0.25.1
  python3-urllib3: upgrade 2.3.0 -> 2.4.0
  python3-snowballstemmer: upgrade 2.2.0 -> 3.0.1

 .../python/python3-cryptography-common.inc    |   2 +-
 .../python/python3-cryptography-crates.inc    | 100 ++---
 .../python/python3-cryptography-vectors.bb    |   2 +-
 .../python/python3-cryptography.bb            |   2 +-
 ...toml-remove-benchmark-disable-option.patch |   6 +-
 .../python/python3-maturin-crates.inc         |  20 +-
 ...l-codes-on-riscv32gc-unknown-linux-g.patch | 110 -----
 .../python/python3-maturin_1.8.3.bb           |  43 --
 .../python/python3-maturin_1.8.6.bb           | 405 ++++++++++++++++++
 ...luggy_1.5.0.bb => python3-pluggy_1.6.0.bb} |   2 +-
 ..._25.0.0.bb => python3-pyopenssl_25.1.0.bb} |   2 +-
 .../python/python3-rpds-py-crates.inc         |  80 ++--
 ...py_0.24.0.bb => python3-rpds-py_0.25.1.bb} |   2 +-
 ...0.bb => python3-setuptools-rust_1.11.1.bb} |   2 +-
 ....0.bb => python3-snowballstemmer_3.0.1.bb} |   4 +-
 ...lib3_2.3.0.bb => python3-urllib3_2.4.0.bb} |   2 +-
 16 files changed, 518 insertions(+), 266 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3-maturin/0001-Define-more-ioctl-codes-on-riscv32gc-unknown-linux-g.patch
 delete mode 100644 meta/recipes-devtools/python/python3-maturin_1.8.3.bb
 create mode 100644 meta/recipes-devtools/python/python3-maturin_1.8.6.bb
 rename meta/recipes-devtools/python/{python3-pluggy_1.5.0.bb => python3-pluggy_1.6.0.bb} (80%)
 rename meta/recipes-devtools/python/{python3-pyopenssl_25.0.0.bb => python3-pyopenssl_25.1.0.bb} (85%)
 rename meta/recipes-devtools/python/{python3-rpds-py_0.24.0.bb => python3-rpds-py_0.25.1.bb} (85%)
 rename meta/recipes-devtools/python/{python3-setuptools-rust_1.11.0.bb => python3-setuptools-rust_1.11.1.bb} (91%)
 rename meta/recipes-devtools/python/{python3-snowballstemmer_2.2.0.bb => python3-snowballstemmer_3.0.1.bb} (68%)
 rename meta/recipes-devtools/python/{python3-urllib3_2.3.0.bb => python3-urllib3_2.4.0.bb} (87%)

-- 
2.43.0


