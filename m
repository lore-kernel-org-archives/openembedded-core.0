Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84B7AC47422
	for <webhook@archiver.kernel.org>; Fri, 26 Jan 2024 14:21:02 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web10.17185.1706278861088994629
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Jan 2024 06:21:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=e3SC6fr+;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.42, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-2906dffd8ddso298693a91.3
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Jan 2024 06:21:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1706278859; x=1706883659; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=DqvPxh8fGoHkIIslQmWqPGg/wPIBAgSv8LJhr5uSfr4=;
        b=e3SC6fr+Q/IkbLEpwDmcfcpumdcSgRoMXajD+OaLoWkOnU78J1YDeCSAuA+Wj6nwTs
         HqDq4vHvXwBr6STsy1KjW6VjDm7NODBDvD7LfA67g7I5slYxVdtgFsGrSRRv8dh2oDCj
         v40IkJQb0tn1jcPck8LvmtZ64TCyCCP2QdIhio91aTLpb9YqnWG211VkxfKdi35JqJKj
         ZWN7M6d77j5ZmLqzGP5D5biieknLQXujhUUpS62vSQlrsQ5ijZ7BAgc8HMAFa/bjoDtX
         NEa3zJYp0hCs68IQj1aJe8d5MYz/H+1T/UBJ01933XNfwx2o4YDZ8nttaJ3UkfAAeNq6
         JGVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706278859; x=1706883659;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DqvPxh8fGoHkIIslQmWqPGg/wPIBAgSv8LJhr5uSfr4=;
        b=Eb+wk18TvXDXA0F5ROgeP3Aowtci8bi7B/FamFV+1OMY5mXmDAJVQVJj5XmtuizH31
         X0vXbL9kfll5SGa5rwTOFbVlkmjYMzuCVucPA0zTDmlne5zXvf9HCYQSHf/9kvqZEUjN
         zBrYEpqp4WQaZ1WO5KZfZCnAHfsEzQhufTaDLZRHQLM120t7L4vRWXI1yCb5BbC6CYFN
         VMR+1lZc2dLbqPW7zE8owPapk+93Il7G+6g9JPH21XDGjMpmsrKqXRomzuQdJ9qjaLuh
         IyJXGDhs5vTpHKr1P8uGvWjkI1dsn4qVFqm4LZJf3zcBbWXr3coN62xJ7inwHciGl7aw
         /NtA==
X-Gm-Message-State: AOJu0Yw81V3fuJXMNmonoUAFCj6COFxQrSTLhDd2HpkQnmHlHdjSewWb
	hSI55I267WMQxjPrS4tHW2+p2BgPVTi4BE0csHHkVQbZwpzPI7W0zyg+07kz9QHf+3B50YlSDA3
	BOVQ=
X-Google-Smtp-Source: AGHT+IEDkSoYe38GxDANVluqbE0bINzvg5Z0PAtCf0axvNup43mP3big3GfGhjc6dSu6+FKMSlHUow==
X-Received: by 2002:a17:90a:b97:b0:290:f68f:127f with SMTP id 23-20020a17090a0b9700b00290f68f127fmr1023233pjr.91.1706278859455;
        Fri, 26 Jan 2024 06:20:59 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id rr14-20020a17090b2b4e00b0029095a896c8sm1136458pjb.40.2024.01.26.06.20.58
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jan 2024 06:20:59 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 0/8] Patch review
Date: Fri, 26 Jan 2024 04:20:33 -1000
Message-Id: <cover.1706278642.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Jan 2024 14:21:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194374

Please review this set of changes for dunfell and have comments back by
end of day Tuesday, January 30

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/6495

The following changes since commit 82e67bd9c77f0c5cbb652ca91071b9e57bdcfb33:

  build-appliance-image: Update to dunfell head revision (2024-01-22 03:34:05 -1000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/dunfell-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-nut

Khem Raj (1):
  systemtap: Fix build with gcc-12

Ranjitsinh Rathod (1):
  openssh: Fix CVE-2023-51385

Vijay Anusuri (5):
  sqlite3: Backport fix for CVE-2023-7104
  gnutls: Backport fix for CVE-2023-5981
  gnutls: Backport fix for CVE-2024-0553
  pam: Fix for CVE-2024-22365
  xserver-xorg: Multiple CVE fixes

virendra thakur (1):
  opkg: Fix bad memory access error observe in file_read_line_alloc

 .../openssh/openssh/CVE-2023-51385.patch      |  95 ++++++++
 .../openssh/openssh_8.2p1.bb                  |   1 +
 ...possible-bad-memory-access-in-file_r.patch |  50 ++++
 meta/recipes-devtools/opkg/opkg_0.4.2.bb      |   1 +
 .../pam/libpam/CVE-2024-22365.patch           |  59 +++++
 meta/recipes-extended/pam/libpam_1.3.1.bb     |   1 +
 .../xserver-xorg/CVE-2023-6816.patch          |  55 +++++
 .../xserver-xorg/CVE-2024-0229-1.patch        |  87 +++++++
 .../xserver-xorg/CVE-2024-0229-2.patch        | 221 ++++++++++++++++++
 .../xserver-xorg/CVE-2024-0229-3.patch        |  41 ++++
 .../xserver-xorg/CVE-2024-0229-4.patch        |  45 ++++
 .../xserver-xorg/CVE-2024-0408.patch          |  64 +++++
 .../xserver-xorg/CVE-2024-0409.patch          |  46 ++++
 .../xserver-xorg/CVE-2024-21885.patch         | 113 +++++++++
 .../xserver-xorg/CVE-2024-21886-1.patch       |  74 ++++++
 .../xserver-xorg/CVE-2024-21886-2.patch       |  57 +++++
 .../xorg-xserver/xserver-xorg_1.20.14.bb      |  10 +
 ...ility-re-tweak-for-rhel6-use-functio.patch |  49 ++++
 .../recipes-kernel/systemtap/systemtap_git.bb |   4 +-
 .../gnutls/gnutls/CVE-2023-5981.patch         | 206 ++++++++++++++++
 .../gnutls/gnutls/CVE-2024-0553.patch         | 125 ++++++++++
 meta/recipes-support/gnutls/gnutls_3.6.14.bb  |   2 +
 .../sqlite/files/CVE-2023-7104.patch          |  46 ++++
 meta/recipes-support/sqlite/sqlite3_3.31.1.bb |   1 +
 24 files changed, 1452 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2023-51385.patch
 create mode 100644 meta/recipes-devtools/opkg/opkg/0001-file_util.c-fix-possible-bad-memory-access-in-file_r.patch
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
 create mode 100644 meta/recipes-kernel/systemtap/systemtap/0001-gcc12-c-compatibility-re-tweak-for-rhel6-use-functio.patch
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2023-5981.patch
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2024-0553.patch
 create mode 100644 meta/recipes-support/sqlite/files/CVE-2023-7104.patch

-- 
2.34.1


