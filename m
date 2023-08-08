Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39F81C001DB
	for <webhook@archiver.kernel.org>; Tue,  8 Aug 2023 03:36:07 +0000 (UTC)
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
 by mx.groups.io with SMTP id smtpd.web11.53941.1691465757405435780
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Aug 2023 20:35:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=OwEHaGuK;
 spf=pass (domain: gmail.com, ip: 209.85.222.174, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-76af2cb7404so369171285a.0
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Aug 2023 20:35:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691465756; x=1692070556;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=97jXpYpXQWC58zfvkjZxbjVHecHfv8590Ygb/+YtI6Q=;
        b=OwEHaGuKVgVi+zRE1bpSji2YSQr+YJnHfMUxn35VoyevFzSwK7blJ9v94h3Im60V0h
         1ppf7hEJQDKIcX4hWLwQMG/bHZgWRxPV6ewlqZvsuKvz9xDq8jlENNKZ3/io/WkFaERN
         XNdV32yV9QT4n/J/TEfyJdMCCCph3ndvFEjrk6MCXCoJb7UsSVpOD/5a5RXSdluLTHjG
         xSEjvBUNKCZwqkQ8b7BpYB5Uq/e9DJCbEMn1FW1qO4qWd2NXYtoV5iC/J1yHqd0qO4YG
         gu7ElzGrtJpnWVNgq9DvTJktFfS0akua34TLow9zmBDE62YTZPwSzICmGJecgx6i2Sy5
         KoXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691465756; x=1692070556;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=97jXpYpXQWC58zfvkjZxbjVHecHfv8590Ygb/+YtI6Q=;
        b=NJuHgVxZQbnRp/ZZS2YahWRYXEdcKMW373FdRTearYdujEbs8wdzv0ZTS36cwQRlT/
         3qHNy0slDZXdSRHgykiqmjjGI5srf4sGxvt/cqdF7O4lQi2N/i1zbt3y5rNLM1Iul/2Z
         mzi4ZqbT5ThVCCCHji5M5qZVW3JY1rQ9biuY4KW+IhzQ+oNhAJG9EvNwREsYMYz8BMUl
         AXfWBntqKCQ8RyZSpoqkrBcYNrcjAea+RF9OGVBQ/qrHeB7pv/Lf15iJv1JtLQ+yad/B
         +9D8Gx2iVZuapV0HpR4zrZH3RYEoiTee7mbLUx5rdR237MdQWqi1PwapdJscEXWJFb9n
         KMCQ==
X-Gm-Message-State: AOJu0YzUCqsdZ0nv+hu1/+/uuZDhn5/g3PgJt6W2nRepIMTpEu3SAmlY
	FE0vz7th9FwhUmdM0tIPHYI=
X-Google-Smtp-Source: AGHT+IHPsI7oyDBj+g2i9/WwJ1yxhk5a9GNI7bKPFAbr56g7faDrnuTP1kHwJykgWioOha4N+p7a6A==
X-Received: by 2002:a05:620a:1269:b0:76c:bb4d:97cf with SMTP id b9-20020a05620a126900b0076cbb4d97cfmr11222350qkl.24.1691465756332;
        Mon, 07 Aug 2023 20:35:56 -0700 (PDT)
Received: from build.lan ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id g16-20020ae9e110000000b0076cb0ed2d7asm3033840qkm.24.2023.08.07.20.35.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Aug 2023 20:35:56 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/7] linux-yocto: consolidated kernel pull request
Date: Mon,  7 Aug 2023 23:35:46 -0400
Message-Id: <cover.1691465503.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Aug 2023 03:36:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185630

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Richard,

Here's my queued set of -stable updates (as well as a -dev kernel bump).

I've got another round of updates under test, and will send them when
ready.

6.4 marches along, it'll be up to date when those last issues keeping
it from being the default are resolved.

Bruce

The following changes since commit 058a44165ce375f405063e73a9fcd1b2757ef8da:

  bitbake: fetch2: Check if path is 'None' before calculating checksums (2023-08-04 11:48:26 +0100)

are available in the Git repository at:

  https://git.yoctoproject.org/poky-contrib zedd/kernel
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (7):
  linux-yocto/6.4: fix CONFIG_LEDS_TRIGGER_GPIO kernel audit warning
  linux-yocto/6.4: update to v6.4.6
  linux-yocto/6.1: update to v6.1.41
  linux-yocto/6.4: update to v6.4.7
  linux-yocto-dev: bump to v6.5+
  linux-yocto/6.4: update to v6.4.8
  linux-yocto/6.1: update to v6.1.43

 meta/recipes-kernel/linux/linux-yocto-dev.bb  |  4 +--
 .../linux/linux-yocto-rt_6.1.bb               |  6 ++--
 .../linux/linux-yocto-rt_6.4.bb               |  6 ++--
 .../linux/linux-yocto-tiny_6.1.bb             |  6 ++--
 .../linux/linux-yocto-tiny_6.4.bb             |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.1.bb  | 28 +++++++++----------
 meta/recipes-kernel/linux/linux-yocto_6.4.bb  | 28 +++++++++----------
 7 files changed, 42 insertions(+), 42 deletions(-)

-- 
2.34.1


