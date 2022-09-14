Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6021BC6FA86
	for <webhook@archiver.kernel.org>; Wed, 14 Sep 2022 02:25:40 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web08.1740.1663122333128668180
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Sep 2022 19:25:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=C9pevFew;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.180,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f180.google.com with SMTP id k21so3165010pls.11
        for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Sep 2022 19:25:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date;
        bh=eEWIv814IE5Z8Qzx6AaDp9lvKzMO9MK/DO6sJtV0Dlo=;
        b=C9pevFewPhwSXd85gk5xwfLBn7w6jw3u0TAxSV36qWjnWBIU8qHxvIT0BVgO2Ljwv8
         93QqimcDNp35xj8mi6ZIZys0o9zGsZafZGDex2JfAfKUekxp+Dni9CpzW3B349g6Ea6T
         aBClldmSeaRAXISy4APNtFswt7dWzfN/V2zDgstRWREKHIwo9SGeb4JXJd8kgpIHONs3
         DriI9DwN/rrIdrpAr//Jy3KZuMZ3qtTdwPkE0cV2wq77p3K+10hqZrTcXRpM1nWTf5W5
         vCwuGr4u7l9OlIXI7fcoLWrhVioIyVEnPb+6qPDdMXBsWBQLAhRZqFGJIiLsc7O6C7cN
         iONg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date;
        bh=eEWIv814IE5Z8Qzx6AaDp9lvKzMO9MK/DO6sJtV0Dlo=;
        b=EIOvqJOJocnMipFKiZgdjJW+8f04bMFhBJA0qPM169xM+uBB6e33ktJ4sfrbMrELIY
         Q+SJ/ICGDcCkDJrZ8lwTfVGjuTKx+q9kqI7dmH4o0SsIcG7xJY5cTfLLPD6PMPnsvRTr
         rSPXCu4xbTXS99XY8WfFE98jqFOLKYSRVg7xZY6qUqBBGlxndHwZ9eFg/OFEodA/6NAZ
         zUlmpCxCDTU/uVQc8RvdtLu+FQRaHMk1HXBrEgcJ0Husk8ILX+2RvQTDi/VJyco+dJZq
         RjPj7ng1pxy5eg5vAUIm8RSXblc0E2cF4m/1ogcd3ipW4eF0gLDKjMXABRre9mv8YVPT
         wzHQ==
X-Gm-Message-State: ACrzQf0n48a0rO7TKLfScz+qm13e3NFPdfgTW1JB26d/zzLEwI8Endc4
	s804wkgZu6HTTugpdTt2aPyjcmsLmH8z6PAW
X-Google-Smtp-Source: 
 AMsMyM5taTwzTQPY7c/TXMZokyFlfyfRVg8yA8PFJztcgC8HdbttUdJfqVupjEGqK2dF6/b7zpWkPw==
X-Received: by 2002:a17:90b:4b49:b0:202:e09c:6662 with SMTP id
 mi9-20020a17090b4b4900b00202e09c6662mr2254751pjb.138.1663122331993;
        Tue, 13 Sep 2022 19:25:31 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 s14-20020a65644e000000b00438fe64d61esm5259871pgv.0.2022.09.13.19.25.30
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Sep 2022 19:25:31 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 0/9] Patch review
Date: Tue, 13 Sep 2022 16:25:10 -1000
Message-Id: <cover.1663122098.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Sep 2022 02:25:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170617

Please review this set of patches for dunfell and have comments back by end
of day Thursday.

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/4224

The following changes since commit c9a9d5a1f7fbe88422ccee542a89afbc4c5336e4:

  vim: Upgrade 9.0.0242 -> 9.0.0341 (2022-09-07 04:40:43 -1000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/dunfell-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-nut

Chee Yang Lee (3):
  connman: fix CVE-2022-32292
  gnutls: fix CVE-2021-4209
  virglrenderer: fix CVE-2022-0135

Florin Diaconescu (1):
  binutils : CVE-2022-38533

Khan@kpit.com (1):
  python3: Fix CVE-2021-28861 for python3

Virendra Thakur (1):
  tiff: Fix for CVE-2022-2867/8/9

Yi Zhao (1):
  tiff: Security fixes CVE-2022-1354 and CVE-2022-1355

niko.mauno@vaisala.com (2):
  systemd: Fix unwritable /var/lock when no sysvinit handling
  systemd: Add 'no-dns-fallback' PACKAGECONFIG option

 .../connman/connman/CVE-2022-32292.patch      |  37 +++
 .../connman/connman_1.37.bb                   |   1 +
 .../systemd/systemd/00-create-volatile.conf   |   1 +
 meta/recipes-core/systemd/systemd_244.5.bb    |   1 +
 .../binutils/binutils-2.34.inc                |   1 +
 .../binutils/binutils/CVE-2022-38533.patch    |  37 +++
 .../python/python3/CVE-2021-28861.patch       | 135 +++++++++++
 .../recipes-devtools/python/python3_3.8.13.bb |   1 +
 .../virglrenderer/CVE-2022-0135.patch         | 100 +++++++++
 .../virglrenderer/virglrenderer_0.8.2.bb      |   1 +
 ...022-2867-CVE-2022-2868-CVE-2022-2869.patch | 159 +++++++++++++
 .../libtiff/tiff/CVE-2022-1354.patch          | 212 ++++++++++++++++++
 .../libtiff/tiff/CVE-2022-1355.patch          |  62 +++++
 meta/recipes-multimedia/libtiff/tiff_4.1.0.bb |   3 +
 .../gnutls/gnutls/CVE-2021-4209.patch         |  37 +++
 meta/recipes-support/gnutls/gnutls_3.6.14.bb  |   1 +
 16 files changed, 789 insertions(+)
 create mode 100644 meta/recipes-connectivity/connman/connman/CVE-2022-32292.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2022-38533.patch
 create mode 100644 meta/recipes-devtools/python/python3/CVE-2021-28861.patch
 create mode 100644 meta/recipes-graphics/virglrenderer/virglrenderer/CVE-2022-0135.patch
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2022-2867-CVE-2022-2868-CVE-2022-2869.patch
 create mode 100644 meta/recipes-multimedia/libtiff/tiff/CVE-2022-1354.patch
 create mode 100644 meta/recipes-multimedia/libtiff/tiff/CVE-2022-1355.patch
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2021-4209.patch

-- 
2.25.1


