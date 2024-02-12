Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5072DC4829B
	for <webhook@archiver.kernel.org>; Mon, 12 Feb 2024 13:54:39 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.web11.6801.1707746071691425054
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Feb 2024 05:54:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=FolPjeeM;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.175, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-5cf2d73a183so2832516a12.1
        for <openembedded-core@lists.openembedded.org>; Mon, 12 Feb 2024 05:54:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1707746071; x=1708350871; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=cwZTdDj9Pc3Ke6s8QtTOCVby/FM9QRHH7qdyvQY2aGA=;
        b=FolPjeeMAMXqoTbzlzOla4qoObp/CWgAQOWRsgeDebo8EMhXmc7pRTspzDHOd1Doiz
         Uar5tiTdGabWNi1hKAHv/mfH8FGDxye8SHXuxvkrOWLNIOtIWucJnj3F/ogBidH+RCO6
         edpOUvfNVceK1cRYNpeL2C8Em/nbU7mr0EZn4LEixx8TfakvaW1/8lmf0CP76PMNq3H/
         voBajx+8F3//vfDWGbFxbJhO17g5OZ/sj+Sjdz3BAdxXdBYdrCpm7ir1ma9eXIN5gTum
         2bSWNlndHlw86138yK2l2EiCRrQBlxOtRTxyfda/tSp+xxO1522Dxwk0LIpFSoxUHeIE
         Ay0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707746071; x=1708350871;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cwZTdDj9Pc3Ke6s8QtTOCVby/FM9QRHH7qdyvQY2aGA=;
        b=qAZGMj2k2Hr7csIy0meIVHhv6guyYLuF8ZOo2TYqzy27xnZK8g4YTYIbeNaFCkzn65
         JxSjWg68qLcQduEoCc2YY99QXKkxWOSCkOFeMnxGt2AaTHdUEXidM9dU5USiI2CwB9z6
         PVsyEQaLtUaGiHBa1nZYNqD6u6hnkSB5lgMPki0OOQF84uUOd/6p5HvIHhRhC3O2Amyp
         LNEJxTT+Ev4+aEodD5nOiUxQ7gluQwZu50BL4wa2vW/h1vRtGzyUoUpnpWdO2WZSTYlC
         Kh5x9I2o7nehAJ4QyvIOamoDmw4x4cFFONTsSuCYFYT/EVRQWL3ZAzQSDeWUvKyOYF3/
         69+A==
X-Gm-Message-State: AOJu0YwuHzF986eJixQD3NacKsjbgCs7uz9xAUjv0vDU7DRLLB+tHg9H
	6AmLDoo7t9kDfs7JlBux4+iUlcaVJUh74mmBIEZsGlRTn6RX+tZX2ANQeU8Q8nKy/Z1qXzweRJj
	DnyE=
X-Google-Smtp-Source: AGHT+IEL2UcEYoTjP/IZRedvJecZHFAiMCBkqisxbSlEoDoqYdFkZOAQgKGsRMHs0aHBWLC/oIY22g==
X-Received: by 2002:a17:90a:948b:b0:296:2358:6e28 with SMTP id s11-20020a17090a948b00b0029623586e28mr11833391pjo.14.1707746070858;
        Mon, 12 Feb 2024 05:54:30 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id k69-20020a638448000000b005dc421f8889sm439889pgd.26.2024.02.12.05.54.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Feb 2024 05:54:30 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 0/8] Patch review
Date: Mon, 12 Feb 2024 03:54:11 -1000
Message-Id: <cover.1707745886.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Feb 2024 13:54:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195321

Please review this set of changes for kirkstone and have comments back by
end of day Wednesday, February 14

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/6556

The following changes since commit 2bdae590ab20dc4518ba247c903060fa67ed0fc4:

  openssl: Upgrade 3.0.12 -> 3.0.13 (2024-02-05 03:56:38 -1000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/kirkstone-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-nut

Archana Polampalli (1):
  curl: Fix CVE-2023-46219

Bruce Ashfield (1):
  kernel: fix localversion in v6.3+

Jermain Horsman (1):
  systemd: Only add myhostname to nsswitch.conf if in PACKAGECONFIG

Kai Kang (1):
  ghostscript: correct LICENSE with AGPLv3

Narpat Mali (1):
  python3-pycryptodome: Fix CVE-2023-52323

Soumya Sambu (2):
  go: Fix CVE-2023-45285 and CVE-2023-45287
  libgit2: Fix CVE-2024-24575 and CVE-2024-24577

Vijay Anusuri (1):
  libxml2: Fix for CVE-2024-25062

 meta/classes/kernel-arch.bbclass              |    7 +
 meta/classes/kernel.bbclass                   |   10 +-
 .../libxml/libxml2/CVE-2024-25062.patch       |   33 +
 meta/recipes-core/libxml/libxml2_2.9.14.bb    |    1 +
 meta/recipes-core/systemd/systemd_250.5.bb    |   16 +-
 meta/recipes-devtools/go/go-1.17.13.inc       |    2 +
 .../go/go-1.20/CVE-2023-45285.patch           |  110 ++
 .../go/go-1.20/CVE-2023-45287.patch           | 1695 +++++++++++++++++
 .../python3-pycryptodome/CVE-2023-52323.patch |  436 +++++
 .../python/python3-pycryptodome_3.14.1.bb     |    1 +
 .../CVE-2023-52323.patch                      |  436 +++++
 .../python/python3-pycryptodomex_3.14.1.bb    |    2 +
 .../ghostscript/ghostscript_9.55.0.bb         |    2 +-
 .../curl/curl/CVE-2023-46219-0001.patch       |   42 +
 .../curl/curl/CVE-2023-46219-0002.patch       |  133 ++
 .../curl/curl/CVE-2023-46219-0003.patch       |   81 +
 meta/recipes-support/curl/curl_7.82.0.bb      |    3 +
 .../libgit2/libgit2/CVE-2024-24575.patch      |   56 +
 .../libgit2/libgit2/CVE-2024-24577.patch      |   52 +
 meta/recipes-support/libgit2/libgit2_1.4.5.bb |    5 +-
 20 files changed, 3113 insertions(+), 10 deletions(-)
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2024-25062.patch
 create mode 100644 meta/recipes-devtools/go/go-1.20/CVE-2023-45285.patch
 create mode 100644 meta/recipes-devtools/go/go-1.20/CVE-2023-45287.patch
 create mode 100644 meta/recipes-devtools/python/python3-pycryptodome/CVE-2023-52323.patch
 create mode 100644 meta/recipes-devtools/python/python3-pycryptodomex/CVE-2023-52323.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2023-46219-0001.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2023-46219-0002.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2023-46219-0003.patch
 create mode 100644 meta/recipes-support/libgit2/libgit2/CVE-2024-24575.patch
 create mode 100644 meta/recipes-support/libgit2/libgit2/CVE-2024-24577.patch

-- 
2.34.1


