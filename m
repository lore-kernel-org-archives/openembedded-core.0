Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65BF4E77180
	for <webhook@archiver.kernel.org>; Wed, 11 Dec 2024 14:47:45 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web11.12559.1733928462650266121
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Dec 2024 06:47:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=krcfIRr/;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.172, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2166022c5caso26661885ad.2
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Dec 2024 06:47:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1733928462; x=1734533262; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=YG4ddvXnq+SUPGvFlJ7GxNmsFzBo9YdHM2G6lG1Qq9o=;
        b=krcfIRr/UVfJHqF/++FQs9C0bDI+XunVEAW41QfwNFzbBK47sTCnQxBqKdOHLyoD1p
         83OH+q9ZdyK/j+W62IuCtomvg07L+Pty2BViLt9cDXB2NyrN6e22f+FFBALYuQgZqCH1
         Dlr2eluo8ZIqxrISg9BHGDky8Ed+DCfk/JdK8UVIa0K9/FbXEP0zq0JjQzeBybeHuogR
         8wCyKwTAo1Q7DFxtoXYM6v8oex0jvuv7PGy6G+ViaoChDf1uBpv6lsjt5dUNlXdOe7oc
         56Z/nRsZdAXxmtTDE80TSySdcP8ZrsgKdQB4X3+8oMP4G/VdDlhdZtdRclNyJUryHROm
         TrIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733928462; x=1734533262;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YG4ddvXnq+SUPGvFlJ7GxNmsFzBo9YdHM2G6lG1Qq9o=;
        b=ZPKVJUaAE21OPs+9w3A8/vfJEnEmDWf+JlBK3Hzvv1/Wkt9rWzByhWHKKO8TOgVEwh
         LzoVrOAKMLI74phCZo9YaxXwV1KWK0/IecI7VD/otdVdHzSR4kn0aQxOuOG7d37wFl2E
         sIib3ZDz2wNzeF6tz2ZxXeq0ES8TbOaqcxerMJqmrmXG2BIapAbW2q/iH9hnkB9CTnnP
         s1qSVCUWp4F9yXPSeGdWNDvsTnzRkQuRCA/hEvx2mTuWx85KL8pN9hGmWf0YmGqE0SNe
         +aZPkhZ9/A9lBefGJm9DYgmsmJqczUtM4O972d/AqaQjFtwv30FlVY73bOR6gI/BEqZu
         Rsfg==
X-Gm-Message-State: AOJu0YxUygIgH59L/UGcuO4Ka0o6H3rO7gRgmNNhb1+j2Z20GzSh+Irq
	Tl3RWu+9i1R24f2MjzW1aFpHH98E3JYjJG5OXj5tJ/BEeQU45e0W2hMPHqja7/jNeG60EIt+qhq
	4
X-Gm-Gg: ASbGncscdgtIPsY9P8HEGV4UGxOpY4lco3V2NylUClIFT6A1zxVHtcFfKldRLv7cP8p
	kbEmzKgd07VFLJltboS3xzmon/f9CWwExDN1a2nKp9vMRb3G9xGM0oAxjsF2ttg3kFZvagC7Q2d
	Rsjw896ao/4tA/cFXSzgxGRautO1ynBKcgCNtMqwOuJVaAukWGtrkIGFTi2zfr5svTVv8gVQsYp
	MbX/XZi08RCtM2aJF5+818WpxpqwlrUMW+o6kLWIMg=
X-Google-Smtp-Source: AGHT+IFksxkMueFV3FY9J9eU6JP9KI4zZn12vmpPNmfTiB1CfkXuC6GRsNyZssxCfaNkj6mXA9EU0Q==
X-Received: by 2002:a17:902:d48c:b0:215:b9a6:5cb9 with SMTP id d9443c01a7336-2178ae4c25dmr1286065ad.5.1733928461805;
        Wed, 11 Dec 2024 06:47:41 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7fd3891dc95sm7494377a12.42.2024.12.11.06.47.41
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2024 06:47:41 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 0/7] Patch review
Date: Wed, 11 Dec 2024 06:47:30 -0800
Message-Id: <cover.1733928291.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Dec 2024 14:47:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208585

Please review this set of changes for kirkstone and have comments back by
end of day Friday, December 13

Passed a-full on autobuilder:

https://valkyrie.yoctoproject.org/#/builders/29/builds/615

The following changes since commit e42b6a40a3a01e328966bb5ee1bb3e0993975b15:

  resulttool: Improve repo layout for oeselftest results (2024-12-04 05:50:49 -0800)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/kirkstone-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-nut

Alexander Kanavin (1):
  dbus: disable assertions and enable only modular tests

Divya Chellam (1):
  libpam: fix CVE-2024-10041

Jiaying Song (1):
  python3-requests: fix CVE-2024-35195

Khem Raj (1):
  unzip: Fix configure tests to use modern C

Peter Marko (2):
  libsdl2: ignore CVE-2020-14409 and CVE-2020-14410
  rootfs-postcommands.bbclass: make opkg status reproducible

Ross Burton (1):
  sanity: check for working user namespaces

 meta/classes/rootfs-postcommands.bbclass      |   4 +
 meta/classes/sanity.bbclass                   |  24 ++++
 meta/recipes-core/dbus/dbus_1.14.8.bb         |   3 +-
 .../python3-requests/CVE-2024-35195.patch     | 121 ++++++++++++++++++
 .../python/python3-requests_2.27.1.bb         |   4 +-
 .../pam/libpam/CVE-2024-10041.patch           |  98 ++++++++++++++
 meta/recipes-extended/pam/libpam_1.5.2.bb     |   1 +
 ...rrect-system-headers-and-prototypes-.patch | 112 ++++++++++++++++
 meta/recipes-extended/unzip/unzip_6.0.bb      |   1 +
 .../libsdl2/libsdl2_2.0.20.bb                 |   3 +
 10 files changed, 368 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-devtools/python/python3-requests/CVE-2024-35195.patch
 create mode 100644 meta/recipes-extended/pam/libpam/CVE-2024-10041.patch
 create mode 100644 meta/recipes-extended/unzip/unzip/0001-configure-Add-correct-system-headers-and-prototypes-.patch

-- 
2.34.1


