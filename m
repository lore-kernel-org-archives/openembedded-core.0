Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C54F4C02194
	for <webhook@archiver.kernel.org>; Fri, 31 Jan 2025 14:15:41 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web10.20048.1738332938518845339
 for <openembedded-core@lists.openembedded.org>;
 Fri, 31 Jan 2025 06:15:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=I3U19k4r;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.176, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-21680814d42so34421535ad.2
        for <openembedded-core@lists.openembedded.org>; Fri, 31 Jan 2025 06:15:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1738332938; x=1738937738; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=8aXLtSgg4k41rEQEu3DlDvUD3YnRr2iSf94vLbWuim8=;
        b=I3U19k4rHyt267hYVTNJbOeW5pPVivsbHJeVepoxRMZ9nN3zjF5HnhCM8FQ8KTZU7k
         MH0WDfM/jliC7Vvksz7caLKGmrNBWceYJIzUWO0PZ6xEEejYvsUMPPDb9qFg3WolJfN8
         MeqEyHlaq4gJ0idulV9+RWM2q6sQjK9+yMJgbPXs8RAQ/PXYyQEX8K0KIK3g9znLRpwa
         4l2ERvK2/ULuwbRGfVGeNb1JzeirVjv+lSUfx2eRE8BdcENvuxiiF+JB9DN/c6eSa4cU
         3/WwRAhXQMBxxlGB5e7r6IaJq41yt9NKsLt18JxQgi+30RGgKMTfsYFdqe4XCQ27WEYF
         RM3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738332938; x=1738937738;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8aXLtSgg4k41rEQEu3DlDvUD3YnRr2iSf94vLbWuim8=;
        b=L8PIt9G3zly6H/ye7OLrGhSQEPr4/renlgvN3v+jsbMl6hLqJa3BXaqJeEOL2MNVtG
         m17p6OzheQTgafuO52YDuwfQeuQdE4Qf4EVcNBirjc7axVkVWRLEkP7rma7236BMpsiu
         03j8H9vG2u3udR9wEuBnITW2BJRpS/pQLL+Atgx/lWvYOaXvyUYC58nt4+dMP6ayL/Lf
         B39uKBR05wG5xfHfkA9fr8dzwM4J9dafU138NxUDiISeDgZ4GD+ZMjFywPtRtW7YjzOt
         RGhxbN3yK/wxp7/disFe6LpDB3jaCOQ9KGtXAD6PBNYF5qWeamwqj11eUkQUysyz0WkQ
         Gqtg==
X-Gm-Message-State: AOJu0Yyf6Na83mCg/LYmHi/aIjMxcqtCO1zLTJ6FB6xrbXVaAZZmzNjP
	yaE4ArbcDpmIpIsvdhXzhcoyFKxPGCRKGOJkXTP+k1j6FsFB3Ex7C0su1WltEehl/t1LyNn7okG
	dbFQ=
X-Gm-Gg: ASbGnctMmyypGJYyLe4rGAy5SZ0VC1NZ5lfiQnpNPaxq2NtJb/TB1gXwqiFIZ7Z/BT5
	yz7jbdk/ofsq3AgZoL2j2cdQ5dKZhvoV+bQHYw9MdtGRVq1/GT4nfM/NrQoF2cpUyeeWn9a20FM
	c9rLJ4ohx6zy4/Owsiein+158QcuJhOB9ri1hmQJMcXjO6fe9gkH5PSCzTMk6nUHJO6Nav38Nkm
	oRfxivVZTDhARZ59DQCjIKnoVMW+WjNyULmMZwkXX+sb2wY72fh4XKPKCSPzpqgf1lprzxCc2uM
	tDKQ
X-Google-Smtp-Source: AGHT+IFjAv9r+iBH5nebYvIwgB6sUvWszNHKXDHf2EloVKIX2aXvSGtaJYFsbHP7o6SdVfGyxhwekg==
X-Received: by 2002:a05:6a20:72aa:b0:1e1:9f57:eacb with SMTP id adf61e73a8af0-1ed7a5f907cmr20640585637.14.1738332937429;
        Fri, 31 Jan 2025 06:15:37 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72fe6a1a958sm3412644b3a.172.2025.01.31.06.15.36
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jan 2025 06:15:37 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 0/4] Patch review
Date: Fri, 31 Jan 2025 06:15:26 -0800
Message-ID: <cover.1738332771.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 31 Jan 2025 14:15:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210482

Please review this set of changes for kirkstone and have comments back by
end of day Tuesday, February 3

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/911

The following changes since commit 077aab43f2c928eb8da71934405c62327010f552:

  classes/qemu: use tune to select QEMU_EXTRAOPTIONS, not package architecture (2025-01-20 06:06:07 -0800)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/kirkstone-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-nut

Deepesh Varatharajan (1):
  glibc: stable 2.35 branch updates

Peter Marko (1):
  openssl: patch CVE-2024-13176

Yash Shinde (2):
  binutils: internal gdb: Fix CVE-2024-53589
  gdb: Fix CVE-2024-53589

 .../openssl/openssl/CVE-2024-13176.patch      | 125 ++++++++++++++++++
 .../openssl/openssl_3.0.15.bb                 |   1 +
 meta/recipes-core/glibc/glibc-version.inc     |   2 +-
 .../binutils/binutils-2.38.inc                |   1 +
 .../binutils/0037-CVE-2024-53589.patch        |  92 +++++++++++++
 meta/recipes-devtools/gdb/gdb.inc             |   1 +
 .../gdb/gdb/0014-CVE-2024-53589.patch         |  92 +++++++++++++
 7 files changed, 313 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2024-13176.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/0037-CVE-2024-53589.patch
 create mode 100644 meta/recipes-devtools/gdb/gdb/0014-CVE-2024-53589.patch

-- 
2.43.0


