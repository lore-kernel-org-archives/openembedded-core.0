Return-Path: <michalwsieron@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 658F9FD875D
	for <webhook@archiver.kernel.org>; Tue, 17 Mar 2026 20:29:23 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.86038.1773779358584334043
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Mar 2026 13:29:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MRrRDL1X;
 spf=pass (domain: gmail.com, ip: 209.85.208.51, mailfrom: michalwsieron@gmail.com)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-66174cf4549so547676a12.0
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Mar 2026 13:29:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773779357; x=1774384157; darn=lists.openembedded.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qk309NV4qRE6s7c+gZaZ882zaudB3QB3JdZ0vncbqYQ=;
        b=MRrRDL1XtdUbpifU5eSWVvaRafXlxUWOR8LWfLW4ITrJNbgDFyg5S81WGGa0IXHXmK
         DkXgnOZQ8vSd51+3dm97143a4/N+ltk4hSqJrjgTrgo4jF3DmbhtWGJkhzcmCDC7zAE+
         2jzEjAPw2Gwts690nUVVUDanH2Pe8jW0vXSbaKSXqhk4ifg/9wtxslLDLefGJLv69Zcl
         f/eEVwEMB/AS52DISsYxdr6A/XnR3nm89ioxiNATFvahAqWG0BmFCQctzG/IAUZgnxZD
         ii9HAo5lx8nXRf0J47F0W7fEvS0sPfVOfKp82IPv3NnN9qgW7VyzejOCqhdZdu1PSFNE
         iq+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773779357; x=1774384157;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qk309NV4qRE6s7c+gZaZ882zaudB3QB3JdZ0vncbqYQ=;
        b=geMi2fmvA6WQTtpgcCx/OzXjT14D1UdBBTqNq5Mk8/cZNea6GHZMEy4Fp3HzOkqica
         RBu1kPJs5MuVzN0lMxVhdDBtTaRAxwPXoel38EiOz8W2vsdfqaFkN0OZ0YKPriYlmCXz
         FHmV37ZxNSflZvXSPRWjeQXZX/JEZgIb3r9NtuR+Y6ajNeRSuJ9jjnBdWlgqbYUQSPLg
         zMDALPwJBxGsGJw+EOg9DT5W+g3iz1xGKYb3QuHs1I5Q1GVnjTXN5pP1GGTOFM3qv00G
         k6yus5taoa4KKuLLBlZe5WicWj/MgdcY4n4tpERGVBHcuxny2s0QqyjtZE5Ol8Dfvaya
         L0MQ==
X-Gm-Message-State: AOJu0YxOgpF5b93IgBk7pIqrV1dqgIhrDkOW/W5zOM5ilcf3iDu1X9Bf
	U+j72eA8XNPbZs9tGLcWT9rj09wbZuUuYzYHKDuttLbItDWmOpTat0rQ
X-Gm-Gg: ATEYQzz3YGgEdUk8TBiH/hlXRGW9p0Ysk4kzsV83X2aPMmDbR8XISTWVX0M/J4T9XHi
	BeeS5jRwqvT/TrrsCdtfMjWLXJH0MZlfnUxM25Rc5vct7SMksRUb2a2O1JZ8a0vwzr5DFFlF7/9
	sOXC0wtkO6ZWM4tWV49OQlMz1XnmNzbNF24+2NDnqWDSAxeR/LBQOyqhbmCbhHHVCNYN4PCa7/G
	GtYvEtnjeWYBUmT+iHTpJ7DWIfosqyg13/s37k8l9+EuXmJlW2UlXLgqF8Xb4kDc9thPRJDqcm1
	QIkTY1M5+KEeDSgf28AOjH2zR97SnFUaQy1iS2e+JwMAKK5pw63JNzIMujKwBaYPL++/KjE/Lcq
	F95KdleTfYkqEREyeqzwarNgL89iVkfF1ZxBAPwi2R10U76oYxNxZsNYdo8wRZbRnowkaUdzpdz
	360nGaX+mB99ILX3/nFODb1oMiYJ8OFeK3cKmvBmF2tOzgXxajizbJH7PIeqYoAmw=
X-Received: by 2002:a05:6402:5342:10b0:665:33ea:255 with SMTP id 4fb4d7f45d1cf-667083aea2dmr2192914a12.6.1773779356680;
        Tue, 17 Mar 2026 13:29:16 -0700 (PDT)
Received: from [127.0.1.1] (185-164-141-154.cgnat.inetia.pl. [185.164.141.154])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-667b0eb9c02sm451909a12.19.2026.03.17.13.29.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 13:29:16 -0700 (PDT)
From: Michal Sieron <michalwsieron@gmail.com>
Subject: [PATCH v3 00/13] Confusing and invalid conditional appends
Date: Tue, 17 Mar 2026 21:28:59 +0100
Message-Id: <20260317-fix-invalid-appends-v3-0-59452f073f31@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/33NzQ7CIAzA8VdZOFsDbAznyfcwHhDK1mRfAUM0y
 95dttMOxuO/aX9dWMRAGNm1WFjARJGmMUd5KpjtzNgikMvNJJc1L0UFnt5AYzI9OTDzjKOLYL0
 SjUYvPdcsX84B89qu3h+5O4qvKXz2J0ls0/9eEiCAl2j50/u6qeStHQz1ZzsNbPOSPBr6tyGBg
 7K1Mqj0RbvmaKzr+gWyVnn5+gAAAA==
X-Change-ID: 20260314-fix-invalid-appends-cf5197ef2f07
To: openembedded-core@lists.openembedded.org
Cc: Michal Sieron <michalwsieron@gmail.com>
X-Mailer: b4 0.14.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Mar 2026 20:29:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233335

This patchset fixes several findings for variable assignments of form:
    A:someoverride += "foo"
and transforms them into:
    A:append:someoverride = " foo"

In most of those cases I assume the original intent was to have a
conditional append, but what was actually happening was append to
a conditional override.

I first noticed such problem in our internal recipes and bbappends, but
then I decided to check if similar issue exists upstream and turns out
it does.

---
Changes in v3:
- Use normal assignment in libffi and expat instead
- Fix package name typo in musl-locales
- Link to v2: https://lore.kernel.org/r/20260317-fix-invalid-appends-v2-0-5c65ae5787d9@gmail.com

Changes in v2:
- Split initial single commit into smaller ones
- Described actual impact on the overriden variables
- Added some recipes that I missed last time
- Link to v1: https://lore.kernel.org/r/20260314-fix-invalid-appends-v1-1-03ec0bff6942@gmail.com

---
Michal Sieron (13):
      libffi: Convert confusing append to assignment
      coreutils: Convert confusing append to override syntax
      expat: Convert confusing append to assignment
      tune-power[567]: Remove confusing overrides
      no-gplv3.inc: Convert confusing appends to override syntax
      bootchart2: Convert confusing appends to override syntax
      pigz: Convert confusing append to override syntax
      systemtap: Convert confusing append to override syntax
      ovmf: Convert confusing append to override syntax
      dnf: Convert confusing append to override syntax
      qemu: Convert confusing append to override syntax
      recipes-devtools/python: Convert confusing appends to override syntax
      musl-locales: Fix locale-base-sr-sr typo

 meta/conf/distro/include/no-gplv3.inc                    |  4 ++--
 meta/conf/machine/include/powerpc/tune-power5.inc        |  3 +--
 meta/conf/machine/include/powerpc/tune-power6.inc        |  3 +--
 meta/conf/machine/include/powerpc/tune-power7.inc        |  3 +--
 meta/recipes-core/coreutils/coreutils_9.10.bb            |  4 ++--
 meta/recipes-core/expat/expat_2.7.4.bb                   |  2 +-
 meta/recipes-core/musl/musl-locales_git.bb               |  2 +-
 meta/recipes-core/ovmf/ovmf_git.bb                       |  2 +-
 meta/recipes-devtools/bootchart2/bootchart2_0.14.9.bb    | 10 +++++-----
 meta/recipes-devtools/dnf/dnf_4.24.0.bb                  |  2 +-
 meta/recipes-devtools/python/python3-asn1crypto_1.5.1.bb |  2 +-
 meta/recipes-devtools/python/python3-bcrypt_5.0.0.bb     |  2 +-
 meta/recipes-devtools/python/python3-chardet_5.2.0.bb    |  2 +-
 meta/recipes-devtools/python/python3-cython_3.2.4.bb     |  4 ++--
 meta/recipes-devtools/python/python3-ply_3.11.bb         |  2 +-
 meta/recipes-devtools/python/python3-pyasn1_0.6.2.bb     |  2 +-
 meta/recipes-devtools/python/python3-pycparser_3.0.bb    |  4 ++--
 meta/recipes-devtools/python/python3-pysocks_1.7.1.bb    |  2 +-
 meta/recipes-devtools/python/python3-pytz_2025.2.bb      |  2 +-
 meta/recipes-devtools/qemu/qemu_10.2.0.bb                |  2 +-
 meta/recipes-extended/pigz/pigz_2.8.bb                   |  2 +-
 meta/recipes-kernel/systemtap/systemtap_5.4.bb           |  2 +-
 meta/recipes-support/libffi/libffi_3.5.2.bb              |  2 +-
 23 files changed, 31 insertions(+), 34 deletions(-)
---
base-commit: 2dc4d2f8b5c7a6e87291385fb860436593767199
change-id: 20260314-fix-invalid-appends-cf5197ef2f07

Best regards,
-- 
Michal Sieron <michalwsieron@gmail.com>


