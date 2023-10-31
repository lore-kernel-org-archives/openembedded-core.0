Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 081C0C4332F
	for <webhook@archiver.kernel.org>; Tue, 31 Oct 2023 15:35:58 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web10.1940.1698766553444755259
 for <openembedded-core@lists.openembedded.org>;
 Tue, 31 Oct 2023 08:35:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=YrQ7jdqQ;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.182, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1cac80292aeso39681525ad.1
        for <openembedded-core@lists.openembedded.org>; Tue, 31 Oct 2023 08:35:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1698766552; x=1699371352; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=9TaYq2FZ3QjYfVoRmHVPqBwHT9VQjto10VysLcdwbl0=;
        b=YrQ7jdqQUBybsmLQE0qw/pf39QiA4e1laUYLvz7bhsNzyoyPj/FmGSGjnWFNR8AOLI
         Vp/LXXTGaQTBWzRL9q4S5TGK6lQ6aPvFJdkqT4bpH9T9FH64YdpDe7Qtqa8U2+xUwBM2
         0AdMjccD59N/Eann+JlfQgxeXkrvRTHqROdIuI4jMkkNufgSzx/pfTHBD+oncjGoepaY
         QQIh2/1ZHQjqmd0Q+mL9wT3DimfybsSx0otrqRLJz13MqSaf7uPrV/ldfKXAFje0VcF/
         fDf0lfqkzg8yqx3/4DAnXmeYPWr8Zw/0vRS86bOC/qjWJTjI05ewULGI8epyRCco58YW
         nhNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698766552; x=1699371352;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9TaYq2FZ3QjYfVoRmHVPqBwHT9VQjto10VysLcdwbl0=;
        b=Dnj9yQWzO9PMOhHzsGg+YRW+CeZU06XVSuHN0w2mdlPwy91rcUrfOB42L4XF2Jo/Q0
         1JcrD6XLbPA6ZjAEb3gtoizB2DuNGpfngXnYf8IQgC48Lvu2WXqrdBSwhIJqABOnvuSg
         rShnRTQKYNDI7xuoGDm+q8buc2ZVi46sErKF6bP6QEZFeRsBJ+rVDEq3T/b2xvft+dkf
         arCwvUF+rsdssLW2yVAB6xnC92arojDF0zVpYBloCN218SkTJJnkYTDr8tP3oI7/BTSM
         y7LDqqEA/Pg4/tTcsGuBVVeXV9jvCkYPP/nY4+Z1ZBYR4USs/5QZQBpzbFhWQ0T3zYvB
         H1OA==
X-Gm-Message-State: AOJu0YwbOCa8ev4A+4Fx31eBhCKD/YLN1+B9Ei4FB5Z17AZ1muwKPU7e
	9+GYj/J6O1uNh7ZxQGQokSQlgN8zym7Y1LCtLd5Qkw==
X-Google-Smtp-Source: AGHT+IHCkW3fXq1Mp3SZn7xUCeKm0uuiWPBRuf7ZVlVHzhifRhPlv+QWiWKoSsy3BPjC5KgfvQn6yg==
X-Received: by 2002:a17:902:c44c:b0:1cc:2f9d:6a57 with SMTP id m12-20020a170902c44c00b001cc2f9d6a57mr6870189plm.28.1698766552090;
        Tue, 31 Oct 2023 08:35:52 -0700 (PDT)
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id f10-20020a170902684a00b001ca21e05c69sm1498048pln.109.2023.10.31.08.35.51
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Oct 2023 08:35:51 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 0/5] Patch review
Date: Tue, 31 Oct 2023 05:35:39 -1000
Message-Id: <cover.1698766338.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 31 Oct 2023 15:35:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189852

Please review this set of patches for mickledore and have comments back by
end of day Thursday, November 2

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/6123

The following changes since commit e9ca1405b732720ff72d379e0262a78bfd2e7d53:

  busybox: Set PATH in syslog initscript (2023-10-19 04:34:38 -1000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/mickledore-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/mickledore-nut

Peter Marko (1):
  openssl: Upgrade 3.1.3 -> 3.1.4

Xiangyu Chen (4):
  grub2: fix CVE-2023-4692
  grub2: fix CVE-2023-4693
  shadow: Fix CVE-2023-4641
  linux-yocto: make sure the pahole-native available before
    do_kernel_configme

 .../grub/files/CVE-2023-4692.patch            |  98 ++++++++++++
 .../grub/files/CVE-2023-4693.patch            |  63 ++++++++
 meta/recipes-bsp/grub/grub2.inc               |   2 +
 .../{openssl_3.1.3.bb => openssl_3.1.4.bb}    |   2 +-
 .../shadow/files/CVE-2023-4641.patch          | 147 ++++++++++++++++++
 meta/recipes-extended/shadow/shadow.inc       |   1 +
 meta/recipes-kernel/linux/linux-yocto.inc     |   5 +-
 7 files changed, 316 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2023-4692.patch
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2023-4693.patch
 rename meta/recipes-connectivity/openssl/{openssl_3.1.3.bb => openssl_3.1.4.bb} (99%)
 create mode 100644 meta/recipes-extended/shadow/files/CVE-2023-4641.patch

-- 
2.34.1


