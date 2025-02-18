Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A76AC021AD
	for <webhook@archiver.kernel.org>; Tue, 18 Feb 2025 21:10:18 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web11.7188.1739913011887511450
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Feb 2025 13:10:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=wrmUIBAU;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.53, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-2fbfe16cc39so11109588a91.3
        for <openembedded-core@lists.openembedded.org>; Tue, 18 Feb 2025 13:10:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1739913011; x=1740517811; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=BItcKphTuu1NIkv1+H1SbVocnIJ28G0Z09ZFFM3Mebk=;
        b=wrmUIBAUVz8SbTBE2zJcaOWAAXvbvLXnf69JINN8gY2AP7cUR1djd4UYTMrNQzqY0J
         9z0hDGosb5Z0zYdiCSSgA+QIe/0ymfshX/29HguT536hHHlx86c0t4kprLvFV4BEhA0G
         Nbw+DsnyxW7a4KmotcIJIo+T0hDBtwwP2XmwRigs9vY6/7X4tN+kZiq2mn9jYABeOhR0
         9ZqHJFeDODxA5/hn/mLVSAzR0x+qD1gmhYYuXbj1VDWqTZSLg6B1xr9aHyZ/NEdXPfME
         nLUeNIiOqwa4oFrEfYOZQsVE6DP0WzBfLoWEJopCMPm2AkfE9mGjhYat14WJgKG/dfzP
         aR4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739913011; x=1740517811;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BItcKphTuu1NIkv1+H1SbVocnIJ28G0Z09ZFFM3Mebk=;
        b=D+fJi2HLNlQdy72y5V9f1PR1pZedBk7kfvCxKKolYaiG7CSQxfSD2ib2S1WfzMEBn0
         5N9fEamajmsE4B5gLvNeaLXrGJq5E134YWPMYAVpiVIMT11LSfRej9oUjlKiDPuJ8UiU
         uzrCB3b8+vMv9xj6/RlbpIP8bxGGxARbllgZbc4XkOaUtiTQHJ/MtZ0D2cJFsZNlwodj
         2UbHVTeTVLT4cfrIc1YVAwTIJ1CjFSkanFI/WclOL5suHErpqiraiW49U97MRBnpCfMm
         qxan2QkqFaduZMHA7gmRcuiq3W1uEzIW4aejQJpy/V6F5NiEqUNA44jLrdMqLFFFiDwE
         ngtw==
X-Gm-Message-State: AOJu0YylmrvnSAzRNWkjhy4P0d6/QUA6FDoaoI5msJB084nHa4mRMs6Y
	DG0i1cDTbL6MYMhvVgBuKOKxGQ+Saw9Mjo323gpGI5PFkLe3Kh3Th7AJVXDw07U995tWiACKwvD
	l
X-Gm-Gg: ASbGncuImyUncaWRGs+uDN9m6AEv2hH2kT37MGqd/pVk51qtf9lnmf6Dq5QC8k0QLYq
	MFqJe8rX4LqIiBk74f4nYQ2HVeJqewIN6sUTvG+fhNyibiAEieYLnComxj2HJpnrZUcqaJEGRBM
	3DPh5sgieda72qiyCg2TpGOqkJ0/QnbbwxtzvBhZdnXNZeCkV/dEEeU0pd5Qxq41PGUrBVrPGl3
	DINqtsLMpADu7ANyqyzT8k0HbS6q84wVOsDiDqH/WBnO2XVufPdVLhFtqSaPXT53IYoK7TJcXzu
	j+/l6So=
X-Google-Smtp-Source: AGHT+IFZBrGz5ET0INarZEzwi8lSgZIdDeUTCSTWB9K/Dz6TGFjVR9cxlWXkoNMv5R2NVc62dodFfw==
X-Received: by 2002:a17:90b:164d:b0:2ee:aef4:2c5d with SMTP id 98e67ed59e1d1-2fc4103f4camr19639065a91.26.1739913010906;
        Tue, 18 Feb 2025 13:10:10 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:83c7:94a9:a555:bf05])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fbf98b326bsm12820720a91.1.2025.02.18.13.10.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2025 13:10:10 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 00/12] Patch review
Date: Tue, 18 Feb 2025 13:09:53 -0800
Message-ID: <cover.1739912869.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Feb 2025 21:10:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211639

Please review this set of changes for kirkstone and have comments back by
end of day Thursday, February 20

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/1038

The following changes since commit 5a794fd244f7fdeb426bd5e3def6b4effc0e8c62:

  build-appliance-image: Update to kirkstone head revision (2025-02-15 06:06:50 -0800)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/kirkstone-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-nut

Aleksandar Nikolic (1):
  scripts/install-buildtools: Update to 4.0.24

Archana Polampalli (5):
  gnutls: fix CVE-2024-12243
  ffmpeg: CVE-2025-0518
  ffmpeg: fix CVE-2024-36613
  ffmpeg: fix CVE-2024-36616
  ffmpeg: fix CVE-2024-36617

Divya Chellam (1):
  ruby: fix CVE-2024-41946

Mingli Yu (1):
  procps: replaced one use of fputs(3) with a write(2) call

Peter Marko (2):
  subversion: ignore CVE-2024-45720
  libpcre2: ignore CVE-2022-1586

Richard Purdie (1):
  scritps/runqemu: Ensure we only have two serial ports

Vijay Anusuri (1):
  libxml2: Fix for CVE-2022-49043

 .../libxml/libxml2/CVE-2022-49043.patch       |   38 +
 meta/recipes-core/libxml/libxml2_2.9.14.bb    |    1 +
 .../ruby/ruby/CVE-2024-41946.patch            |  117 ++
 meta/recipes-devtools/ruby/ruby_3.1.3.bb      |    1 +
 .../subversion/subversion_1.14.2.bb           |    3 +
 ...x-for-the-bye_bye-function-merge-127.patch |   58 +
 ...e-use-of-fputs-3-with-a-write-2-call.patch |   50 +
 meta/recipes-extended/procps/procps_3.3.17.bb |    2 +
 .../ffmpeg/ffmpeg/CVE-2024-36613.patch        |   38 +
 .../ffmpeg/ffmpeg/CVE-2024-36616.patch        |   37 +
 .../ffmpeg/ffmpeg/CVE-2024-36617.patch        |   38 +
 .../ffmpeg/ffmpeg/CVE-2025-0518.patch         |   34 +
 .../recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb |    4 +
 .../gnutls/gnutls/CVE-2024-12243.patch        | 1160 +++++++++++++++++
 meta/recipes-support/gnutls/gnutls_3.7.4.bb   |    1 +
 .../recipes-support/libpcre/libpcre2_10.40.bb |    4 +
 scripts/install-buildtools                    |    4 +-
 scripts/runqemu                               |   17 +-
 18 files changed, 1601 insertions(+), 6 deletions(-)
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2022-49043.patch
 create mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2024-41946.patch
 create mode 100644 meta/recipes-extended/procps/procps/0001-top-fix-a-fix-for-the-bye_bye-function-merge-127.patch
 create mode 100644 meta/recipes-extended/procps/procps/0001-top-replaced-one-use-of-fputs-3-with-a-write-2-call.patch
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-36613.patch
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-36616.patch
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-36617.patch
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2025-0518.patch
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2024-12243.patch

-- 
2.43.0


