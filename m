Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9D07EB64D9
	for <webhook@archiver.kernel.org>; Fri, 30 Jun 2023 02:33:34 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web10.3934.1688092411474183345
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Jun 2023 19:33:31 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=TP56+EKX;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.176, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-666ed230c81so1287544b3a.0
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Jun 2023 19:33:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1688092410; x=1690684410;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=6VA2YQ9n7NyuZwhYQkl8EElxuabijCsWGYAQjfyPbpE=;
        b=TP56+EKXvNdVESqSrwSI93HtkCdpI6zznqctGmlNQSiTsDLhH2uXZ0KFq4rANBt2W3
         bAPAKYsgB4CzGyawYCHwp5QOpzUcX5WarZMzhaceeF7fIBxLbU/ECRxchWxbC0ucZ0Cp
         Toq8z/APFuHggJQzcvukQDyxrTDksudlpGmZPjgzig8MlA9XnlFjyWGrK5oO7n9gErRP
         3frkh804hroNjz9bFG1kGaXCUWjpTWAv1x6qtpKSUUClLrJ21Wk0t0KT6/Eud3JpYM7n
         qro2RNxFL2iXQy41auZFIW2AlxUMhxfngVQudbjNmQ/g5f/n18AoQry1aUzCT7ujjpQE
         mXrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688092410; x=1690684410;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6VA2YQ9n7NyuZwhYQkl8EElxuabijCsWGYAQjfyPbpE=;
        b=BzCxjP6zC4h4TgEI8Q/fwGNRjt6puXW85I9QlbjOBt+EOSCFLieldD9cLZVy0itCET
         2rh+fxN+R7QarHsCLxIkPNCDg78XcPFCnqukg58xdLf3TerLrdV3wHZlXh3xfA5cODNg
         P4UTDpHvJiXa3jXXpL1BtWcqOShFAHtFQEnhXqKf5kXDvht18Oungx2trxFXQCfG3lEy
         cSF/cFQzF6s7kh+cKal2dUNR6tyMADH59cnPRbXko+Fom2VhZa+rcViOxz5rMpxPxePP
         rmJn9sEYxNhNawU5geoJU6nO6sjfVteQx7ESr8wGyot//ysTj2hEQN8Z5VBxnh4HBMln
         G4YA==
X-Gm-Message-State: ABy/qLbcyUuNyKzqyhyIW95QKidzm1AbWk8IXHbIHOqI5uegJVosFwXV
	tDD97CZOuVyLC9xGGczLbI4A634ansKP+jOpQLX+Nw==
X-Google-Smtp-Source: APBJJlFcNlLgoA77Yv/7mi4y1c9mBr5et1iO3hjZeZTSDAkLODtz8DN1ezhZ5UFaAUb1BhrojEDaMg==
X-Received: by 2002:a62:7b07:0:b0:668:82fe:16f1 with SMTP id w7-20020a627b07000000b0066882fe16f1mr1791734pfc.1.1688092410606;
        Thu, 29 Jun 2023 19:33:30 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id l22-20020a62be16000000b006815fbe3245sm3028607pff.37.2023.06.29.19.33.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jun 2023 19:33:30 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 00/10] Patch review
Date: Thu, 29 Jun 2023 16:33:13 -1000
Message-Id: <cover.1688092252.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 Jun 2023 02:33:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183671

Please review this set of changes for dunfell and have comments back by
end of day Monday.

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/5542

The following changes since commit 2aa82324d43467e7c8bfbbb59570ee3306264b75:

  systemd-systemctl: support instance expansion in WantedBy (2023-06-19 06:23:31 -1000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/dunfell-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-nut

Ashish Sharma (1):
  go: Backport fix CVE-2023-29405

Bruce Ashfield (5):
  linux-yocto/5.4: update to v5.4.246
  linux-yocto/5.4: update to v5.4.247
  linux-yocto/5.4: update to v5.4.248
  linux-yocto-rt/54: fix 5.4-rt build breakage
  linux-yocto/5.4: cfg: fix DECNET configuration warning

Hitendra Prajapati (1):
  go: fix CVE-2023-29402 & CVE-2023-29404

Ross Burton (1):
  ninja: Whitelist CVE-2021-4336, wrong ninja

Vijay Anusuri (2):
  libjpeg-turbo: CVE-2020-35538 Null pointer dereference in
    jcopy_sample_rows() function
  libcap: backport Debian patches to fix CVE-2023-2602 and CVE-2023-2603

 meta/recipes-devtools/go/go-1.14.inc          |   4 +
 .../go/go-1.14/CVE-2023-29402.patch           | 201 ++++++++
 .../go/go-1.14/CVE-2023-29404.patch           |  84 ++++
 .../go/go-1.14/CVE-2023-29405-1.patch         | 112 +++++
 .../go/go-1.14/CVE-2023-29405-2.patch         |  38 ++
 meta/recipes-devtools/ninja/ninja_1.10.0.bb   |   3 +
 .../jpeg/files/CVE-2020-35538-1.patch         | 457 ++++++++++++++++++
 .../jpeg/files/CVE-2020-35538-2.patch         | 400 +++++++++++++++
 .../jpeg/libjpeg-turbo_2.0.4.bb               |   2 +
 .../linux/linux-yocto-rt_5.4.bb               |   6 +-
 .../linux/linux-yocto-tiny_5.4.bb             |   8 +-
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  |  22 +-
 .../libcap/files/CVE-2023-2602.patch          |  52 ++
 .../libcap/files/CVE-2023-2603.patch          |  58 +++
 meta/recipes-support/libcap/libcap_2.32.bb    |   2 +
 15 files changed, 1431 insertions(+), 18 deletions(-)
 create mode 100644 meta/recipes-devtools/go/go-1.14/CVE-2023-29402.patch
 create mode 100644 meta/recipes-devtools/go/go-1.14/CVE-2023-29404.patch
 create mode 100644 meta/recipes-devtools/go/go-1.14/CVE-2023-29405-1.patch
 create mode 100644 meta/recipes-devtools/go/go-1.14/CVE-2023-29405-2.patch
 create mode 100644 meta/recipes-graphics/jpeg/files/CVE-2020-35538-1.patch
 create mode 100644 meta/recipes-graphics/jpeg/files/CVE-2020-35538-2.patch
 create mode 100644 meta/recipes-support/libcap/files/CVE-2023-2602.patch
 create mode 100644 meta/recipes-support/libcap/files/CVE-2023-2603.patch

-- 
2.34.1


