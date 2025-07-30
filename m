Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0F0FC87FD2
	for <webhook@archiver.kernel.org>; Wed, 30 Jul 2025 21:29:14 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web10.47205.1753910950326026713
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Jul 2025 14:29:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=TnhLvny3;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.182, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-23ffa7b3b30so3725885ad.1
        for <openembedded-core@lists.openembedded.org>; Wed, 30 Jul 2025 14:29:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1753910949; x=1754515749; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=dmdLm8CgxOoXRPiB6Gm8CuJvqeWzNhgRpIznNY02ltA=;
        b=TnhLvny38t7wGF1ConHLzxgWiMROX/AJ5WRs8axKvdXXcD5OVvzcapacWfrLJGz5t9
         zK5Z4ZBkqh73OZG3p2sK9XHWLnCMFW/V5JDAaXUvxqvZWAdOa1Dw9yseeyLG7g21A2o7
         R53idC7xzh9z+RzumDF1gv60GvIi3XELL58+cRx4eySrRyT1HLBUR8+z79rXyxbfNdA0
         PUmD0c99FaP7vkjX6t+gTv89DdP7C6oQfpymsLNLJ2pgFmVvrGuQ7uBDBur6tdBt75Sv
         LzUKlXG9Gs7fw54NQNp08i8fjNWvfNDMVrnQ0beJc3rjIa52fsdWCMuGj7slQABhusQ7
         k/Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753910949; x=1754515749;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dmdLm8CgxOoXRPiB6Gm8CuJvqeWzNhgRpIznNY02ltA=;
        b=i17EAscwkZAJcjLFq7AiCv8cySQJ4NLoFunkQJOIVApFjrraDv2i7YUiAsAl/mEulr
         6S9d/bCaAlIr1oXHUKmgZdBXCN7+BJ8cjGGrgARRR1Fgx5trHhQh1DdkkkvcpECrc42K
         8wCBNjg2gG5uRkHfvBwAOznAFy+KYw1vSUh8zmdtRxJFZ+AIDjbB+5p7UGJTdDEdG6mP
         a9m4GTppDxxoFJh4V1HlPhFBr/oD2ZqXByKu3/PRa7HJciDO7ywRAY7YwAnqPtu+oBFp
         YqShWycIU2Qs9ITWtFoSi9JVnOb1MobtEjhmTnBKwBbyRuklS6NgJSKiyOu7a2j20kYp
         RvoA==
X-Gm-Message-State: AOJu0Yy20EOBYr278Cx2payNdnO4rSzx26vg7DQQqQfuGGFbcn6tOVEz
	63OfNoCsyNMH3TF/hHmTAfiXRvJi6bjLjQAdOuuaUU/RR2g9lzeRvvLR8serPDqpXyB899sf09d
	r0nBQ
X-Gm-Gg: ASbGncuvP6AeHuEgXcA1IU7RaJVdKfYeNcktDk2LU35LXYqajtTrYfKBtuVc113dsOU
	7bPmdXcOfVTRUBPq05RrT+TMrUUousY1xGfcRKs2erE2aTsaKof298gn0pjjhD9L0kLCSQU4vBZ
	/IpGKG4fq90Fh5jJRePVrrlXLu38J70caGXT6J3ZvUIxVO3mwmuLEWOcapvPuUI87r4q5N7QYSf
	wtRK0AouQSLNj+JYmwfURT8OTBWC3dI8QvmauhJnR6w9jgJJ2cXZ80ZlJPlM9c2Rs8Y5kEARpK/
	41c/WUBflPwji08hyVv6WFVYMu2l0NNa9qsLRbn/qAkeCTlmVGJCBy9wLl0K5SJvbnAqlneH21O
	YAgq4F6yOg2ph
X-Google-Smtp-Source: AGHT+IE1gDvdVWBHfkXiCp2DOMi6I5J+ugYM9HpbijLwabFhCU7n2FIEAwqkfQXPuGpkFSRd9qCzMQ==
X-Received: by 2002:a17:902:d4ca:b0:240:c678:c1ee with SMTP id d9443c01a7336-240c678c2a1mr18494945ad.11.1753910949462;
        Wed, 30 Jul 2025 14:29:09 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:58fd:da9:30d5:829a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241e899b4adsm576365ad.132.2025.07.30.14.29.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Jul 2025 14:29:09 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 00/11] Patch review
Date: Wed, 30 Jul 2025 14:28:51 -0700
Message-ID: <cover.1753910853.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Jul 2025 21:29:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221159

Please review this set of changes for scarthgap and have comments back by
end of day Friday, August 1

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/2114

The following changes since commit c374e6cfcdd2c8ba17d82ffcfdeb97d21144e2bf:

  mtools: upgrade 4.0.48 -> 4.0.49 (2025-07-25 06:13:34 -0700)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/scarthgap-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/scarthgap-nut

Aleksandar Nikolic (1):
  scripts/install-buildtools: Update to 5.0.11

Fabio Berton (1):
  linux-libc-headers: Fix invalid conversion in cn_proc.h

Peter Marko (9):
  gnutls: patch CVE-2025-32989
  gnutls: patch read buffer overrun in the "pre_shared_key" extension
  gnutls: patch reject zero-length version in certificate request
  gnutls: patch CVE-2025-32988
  gnutls: patch CVE-2025-32990
  gnutls: patch CVE-2025-6395
  ncurses: patch CVE-2025-6141
  libxml2: patch CVE-2025-6170
  glibc: fix CVE-2025-8058

 meta/recipes-core/glibc/glibc-version.inc     |    2 +-
 meta/recipes-core/glibc/glibc_2.39.bb         |    2 +-
 .../libxml/libxml2/CVE-2025-6170.patch        |  103 +
 meta/recipes-core/libxml/libxml2_2.12.10.bb   |    1 +
 .../ncurses/files/CVE-2025-6141.patch         |   25 +
 meta/recipes-core/ncurses/ncurses_6.4.bb      |    1 +
 ...-Fix-invalid-conversion-in-cn_proc.h.patch |   40 +
 .../linux-libc-headers_6.6.bb                 |    1 +
 ...fer-overrun-in-the-pre_shared_key-ex.patch |   34 +
 ...-length-version-in-certificate-reque.patch |   37 +
 .../04939b75417cc95b7372c6f208c4bda4579bdc34  |  Bin 0 -> 1782 bytes
 .../3e94dcdff862ef5d6db8b5cc8e59310b5f0cdfe2  |  Bin 0 -> 830 bytes
 .../5477db1bb507a35e8833c758ce344f4b5b246d8e  |  Bin 0 -> 111 bytes
 .../gnutls/gnutls/CVE-2025-32988.patch        |   58 +
 .../gnutls/gnutls/CVE-2025-32989.patch        |   50 +
 .../gnutls/gnutls/CVE-2025-32990.patch        | 2109 +++++++++++++++++
 .../gnutls/gnutls/CVE-2025-6395.patch         |  299 +++
 meta/recipes-support/gnutls/gnutls_3.8.4.bb   |   15 +
 scripts/install-buildtools                    |    4 +-
 19 files changed, 2777 insertions(+), 4 deletions(-)
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2025-6170.patch
 create mode 100644 meta/recipes-core/ncurses/files/CVE-2025-6141.patch
 create mode 100644 meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0001-connector-Fix-invalid-conversion-in-cn_proc.h.patch
 create mode 100644 meta/recipes-support/gnutls/gnutls/0001-psk-fix-read-buffer-overrun-in-the-pre_shared_key-ex.patch
 create mode 100644 meta/recipes-support/gnutls/gnutls/0001-x509-reject-zero-length-version-in-certificate-reque.patch
 create mode 100644 meta/recipes-support/gnutls/gnutls/04939b75417cc95b7372c6f208c4bda4579bdc34
 create mode 100644 meta/recipes-support/gnutls/gnutls/3e94dcdff862ef5d6db8b5cc8e59310b5f0cdfe2
 create mode 100644 meta/recipes-support/gnutls/gnutls/5477db1bb507a35e8833c758ce344f4b5b246d8e
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2025-32988.patch
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2025-32989.patch
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2025-32990.patch
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2025-6395.patch

-- 
2.43.0


