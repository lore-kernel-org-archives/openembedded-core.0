Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E642C54764
	for <webhook@archiver.kernel.org>; Mon, 19 Feb 2024 17:30:56 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web11.80.1708363851885830685
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Feb 2024 09:30:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=m3DrKhUF;
 spf=pass (domain: gmail.com, ip: 209.85.214.179, mailfrom: ticotimo@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1dc0e5b223eso3070435ad.1
        for <openembedded-core@lists.openembedded.org>; Mon, 19 Feb 2024 09:30:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708363851; x=1708968651; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=oXe+FFAoxSccZpp+GjLO4NJfLFrkHuxL/9JdO6yh9As=;
        b=m3DrKhUFGPoFxz6kux90B7jje4NJwFEiY206wsEuHNieR5bthqI6v9O3S+KgKWciZ2
         bKFIs9GGenIkE4U/Fo8R2Hr5E4sxnhMXcy4Oz1EIOE9e569P4KQw24tU8n6NlPmehdWQ
         GR68RsMMcpQKcKyfvmMaGQ0B8J51+CLNADmAj14stGJN5j+iRwrixgAWJGBfhzjkw8l0
         5IrPzMUssu9gT0Hf3UWT0xtz8W6zP+TdmVb2xoU4y4Lfy8ayzymLMtkbADFtRn3/DVX8
         EZH5+PdpSCP5y+qzvtSnbpohwlWQ3IeWvGp/m3Qs9/qnYGZpXJlRRHHSsWC/o5H0rNCp
         eUtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708363851; x=1708968651;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oXe+FFAoxSccZpp+GjLO4NJfLFrkHuxL/9JdO6yh9As=;
        b=aJXWq7fG/fdRruDPhD+qKEbte1V+J4g0lR4lkRKty5X05r6lOfPEOFmTB5IQClkLP+
         foAYGThFV+dWW+GO7XYNRC08M+Ve2XYH3QGs0RPTZfRzVRXrrZsKITpnQ+ge7xSMobI6
         3CEHJYWBlWNEMeVzLwunsqEsfuQYrxOiNtqLePLAa1MMil32HBeqx/+lEJk+e5615Ur7
         AkBhPOPd9gu4AyOxGjFfGNxHATCtfoXrhSFor9aaiie9WJQ8CukYXE8tx31qTlReA61z
         yg9XX/ZOUBW1kk04TncRkXbk71mW12NMqiwl0v2xioZo/SLKJrsFlhyp+uGSCLPcq7YN
         ZL6Q==
X-Gm-Message-State: AOJu0Yx7sIvmmuDo9MRi4khD5p7eAaJJ4+gWBS1W0rRgNnG/6T87W22j
	/2vfVULT3QkwS8MMbTGFNBdB6cCIzKJ57DMOCiilftASCY7EAI12maFwE9Sn
X-Google-Smtp-Source: AGHT+IG+XaEnlqpj4PYTIRKXiGmjSoBfLTS5tvx8i2ZEKYu+0gYr+/lQIY0noP4ea7TmeAMCYzLRmg==
X-Received: by 2002:a17:902:9302:b0:1d8:cd7b:85fa with SMTP id bc2-20020a170902930200b001d8cd7b85famr11229174plb.68.1708363850699;
        Mon, 19 Feb 2024 09:30:50 -0800 (PST)
Received: from chiron.hsd1.or.comcast.net ([2601:1c0:ca01:19f0:7caf:da97:8daf:f655])
        by smtp.gmail.com with ESMTPSA id w3-20020a170903310300b001d965e737f2sm4630428plc.268.2024.02.19.09.30.50
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Feb 2024 09:30:50 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/4] Add python_mesonpy ("mesonpy") PEP-517 backend support
Date: Mon, 19 Feb 2024 09:30:20 -0800
Message-Id: <cover.1708363628.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Feb 2024 17:30:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195891

Move the python_mesonpy bbclass and python3-meson-python recipe from meta-python.

https://meson-python.readthedocs.io/en/latest/

This is the declared backend for python-numpy, so it is time to move it to oe-core.

The following changes since commit 4cfd0f7e4e2db19344677999572e5b71ae97dfc4:

  lib/oe/patch: Use git notes to store the filenames for the patches (2024-02-19 16:03:22 +0000)

are available in the Git repository at:

  https://git.yoctoproject.org/poky-contrib timo/python_mesonpy
  https://git.yoctoproject.org/poky-contrib/log/?h=timo/python_mesonpy

Tim Orling (4):
  python3-meson-python: move from meta-python
  python_mesonpy.bbclass: move from meta-python
  python3-numpy: inherit python_mesonpy
  recipetool; add support for python_mesonpy class

 meta/classes-recipe/python_mesonpy.bbclass    | 52 ++++++++++++++++++
 meta/conf/distro/include/maintainers.inc      |  1 +
 meta/lib/oeqa/selftest/cases/recipetool.py    | 19 +++++++
 .../python/python3-meson-python_0.15.0.bb     | 27 ++++++++++
 .../python/python3-numpy_1.26.4.bb            | 54 ++++++++++---------
 .../lib/recipetool/create_buildsys_python.py  |  4 ++
 6 files changed, 131 insertions(+), 26 deletions(-)
 create mode 100644 meta/classes-recipe/python_mesonpy.bbclass
 create mode 100644 meta/recipes-devtools/python/python3-meson-python_0.15.0.bb

-- 
2.34.1


