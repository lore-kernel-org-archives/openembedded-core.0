Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F22F3C47DB7
	for <webhook@archiver.kernel.org>; Sun, 21 Jan 2024 18:58:04 +0000 (UTC)
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
 by mx.groups.io with SMTP id smtpd.web11.54142.1705863481560100668
 for <openembedded-core@lists.openembedded.org>;
 Sun, 21 Jan 2024 10:58:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=HWtJKfF3;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.46, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-6e0eed0427cso91871a34.0
        for <openembedded-core@lists.openembedded.org>; Sun, 21 Jan 2024 10:58:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1705863480; x=1706468280; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Y5gXefvVJZZU4GvURjM/WIiFeOhIt8ODgRWZWWf2QYs=;
        b=HWtJKfF3q7uOGHMrlR9ZWZNE8akZ4iL7b6oUS+h/G95w6mAJB7S65h+SctvEWFk1aK
         9gxSVi8Q6cblo5VpzZ166EXHIJu8+WhRhz6Gd9KZ6+UA+PqRvcxBWg45t2Y07DkLbimY
         YlRNYsqFFvExc1jkMKt0UINI+Z6WZSQPFRqUumTN8nA5Gy09UogW/oyIYwcSNGnBPjBI
         CGTXuk2hHoTY2lGTTTCnLQuRAM0t51EGD56dEodM3J2liossdvnDNjX7sK0cxpKl0/9q
         YVw5ntLInlBuTHbqNceGANrqDn+sAsczQr1ZRtsvopJWVKj+j8KU2B8NQ7KcNuDK/Rj+
         eK7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705863480; x=1706468280;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Y5gXefvVJZZU4GvURjM/WIiFeOhIt8ODgRWZWWf2QYs=;
        b=upFo+FEn9HPe2Agsf6vl+IE0SSb3vK4EL0m4h51sBwqRtD/BSJkjhU+fqS4VfMREcv
         a0Re9WMnU6lrtFXcU4fEBfAd0aKliAWj7osNXDUF2X6GoRmBUAonO6m8p2XUJ4pTM9CU
         wPH9dhcQbZlHfNXq7h6gojN3nd13l2W5LNMN4CLkDUyhdQUyQ06VG4yQsLKB8x91uQpP
         IgM9nVYvIuh8WJxGFxtu0lgcNEOHEcvWZXogrBKDMkhPpItGTtxmqKhTfFVJxGAe91Xd
         gskfp72vaoYsoducvEUt+fGs8jGwE2N/3GZnNYxGEwyy0NYSjMTcQVAfr3dbHiK44PLk
         bDKg==
X-Gm-Message-State: AOJu0Yyj/41Z/4Qr/nkGfjxw9Xh2DHKUpbcrtZBpjL6rzqwP2Qi0WR4r
	M0zjWTZyrWICNZTpzwJ7qkCAbCLIpu5YSf/8UcDLVr8LcD40T8GC9NnMmwnRaBRPeOeDaPgjV6Y
	5GKaCHw==
X-Google-Smtp-Source: AGHT+IEIonqxflegN2qR52mVlkx7Hdk7dAd2L8VBUpj9/WiZUdc9wqGMS2dD4OAq4Ri2GdXncbPYcQ==
X-Received: by 2002:a9d:61c2:0:b0:6e0:ee22:3630 with SMTP id h2-20020a9d61c2000000b006e0ee223630mr220995otk.33.1705863480062;
        Sun, 21 Jan 2024 10:58:00 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id t187-20020a6281c4000000b006d99125b114sm8675277pfd.65.2024.01.21.10.57.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jan 2024 10:57:59 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 0/6] Patch review
Date: Sun, 21 Jan 2024 08:57:49 -1000
Message-Id: <cover.1705863274.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 21 Jan 2024 18:58:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194094

Please review this set of changes for kirkstone and have comments back by
end of day Tuesday, January 23

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/6471

The following changes since commit ebd61290a644a6d9f2b3701e0e7ea050636da76c:

  pybootchartgui: fix 2 SyntaxWarnings (2024-01-16 04:10:03 -1000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/kirkstone-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-nut

Hitendra Prajapati (2):
  openssl: fix CVE-2023-6237 Excessive time spent checking invalid RSA
    public keys
  pam: fix CVE-2024-22365 pam_namespace misses

Peter Marko (1):
  dropbear: backport patch for CVE-2023-48795

Vijay Anusuri (2):
  gnutls: Fix for CVE-2024-0553 and CVE-2024-0567
  xserver-xorg: Multiple CVE fixes

Yogita Urade (1):
  tiff: fix CVE-2023-6228

 .../openssl/openssl/CVE-2023-6237.patch       | 127 ++++++++++
 .../openssl/openssl_3.0.12.bb                 |   1 +
 meta/recipes-core/dropbear/dropbear.inc       |   1 +
 .../dropbear/dropbear/CVE-2023-48795.patch    | 234 ++++++++++++++++++
 .../pam/libpam/CVE-2024-22365.patch           |  62 +++++
 meta/recipes-extended/pam/libpam_1.5.2.bb     |   1 +
 .../xserver-xorg/CVE-2023-6816.patch          |  55 ++++
 .../xserver-xorg/CVE-2024-0229-1.patch        |  87 +++++++
 .../xserver-xorg/CVE-2024-0229-2.patch        | 221 +++++++++++++++++
 .../xserver-xorg/CVE-2024-0229-3.patch        |  41 +++
 .../xserver-xorg/CVE-2024-0229-4.patch        |  45 ++++
 .../xserver-xorg/CVE-2024-0408.patch          |  64 +++++
 .../xserver-xorg/CVE-2024-0409.patch          |  46 ++++
 .../xserver-xorg/CVE-2024-21885.patch         | 113 +++++++++
 .../xserver-xorg/CVE-2024-21886-1.patch       |  74 ++++++
 .../xserver-xorg/CVE-2024-21886-2.patch       |  57 +++++
 .../xorg-xserver/xserver-xorg_21.1.8.bb       |  10 +
 .../libtiff/tiff/CVE-2023-6228.patch          |  31 +++
 meta/recipes-multimedia/libtiff/tiff_4.3.0.bb |   1 +
 .../gnutls/gnutls/CVE-2024-0553.patch         | 125 ++++++++++
 .../gnutls/gnutls/CVE-2024-0567.patch         | 184 ++++++++++++++
 meta/recipes-support/gnutls/gnutls_3.7.4.bb   |   2 +
 22 files changed, 1582 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2023-6237.patch
 create mode 100644 meta/recipes-core/dropbear/dropbear/CVE-2023-48795.patch
 create mode 100644 meta/recipes-extended/pam/libpam/CVE-2024-22365.patch
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2023-6816.patch
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2024-0229-1.patch
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2024-0229-2.patch
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2024-0229-3.patch
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2024-0229-4.patch
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2024-0408.patch
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2024-0409.patch
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2024-21885.patch
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2024-21886-1.patch
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2024-21886-2.patch
 create mode 100644 meta/recipes-multimedia/libtiff/tiff/CVE-2023-6228.patch
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2024-0553.patch
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2024-0567.patch

-- 
2.34.1


