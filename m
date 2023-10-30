Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2674C4332F
	for <webhook@archiver.kernel.org>; Mon, 30 Oct 2023 02:21:18 +0000 (UTC)
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
 by mx.groups.io with SMTP id smtpd.web11.140924.1698632470461841533
 for <openembedded-core@lists.openembedded.org>;
 Sun, 29 Oct 2023 19:21:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=xDzuZsM5;
 spf=softfail (domain: sakoman.com, ip: 209.85.160.46, mailfrom: steve@sakoman.com)
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-1e10ba12fd3so2683154fac.1
        for <openembedded-core@lists.openembedded.org>; Sun, 29 Oct 2023 19:21:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1698632469; x=1699237269; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=6GLNY34wTHZxX3aDUKgHpz5HjzBjdSisczizIVAn8vg=;
        b=xDzuZsM5+XNN0mcY1HrVuM6/HOVzPl8WosUW4ITNX7a0BPhzADBaQSUZj4sv9IoQKj
         ERrJEBkGmOO64e7SyjbiPPm2YCJ1R6aj3lNLi4hjjW425x3jXrwPKhjhjjMuCkcC9E2q
         OTNmRZZrnKmeiL7mFS2hkEeLb6s8wxk7JbZYBi7o9ydNq02LuPzQjeD0xiK+kzedwjVY
         Uj6dzS5JPq5aSnXEA7ghtgyPvk8IjS7kgByUUuu2Pim/hDCAGfTJPCBR34n9hOO6CPgf
         OJnhhxSmSzn8cj77SGYgtSkco6rSJDdBuHwjyzrbWNxLkdmv20jp+yawFZJJeDnEuSqI
         iqXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698632469; x=1699237269;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6GLNY34wTHZxX3aDUKgHpz5HjzBjdSisczizIVAn8vg=;
        b=ltqmyTUzzEtcKxgLJEhKUUJeznyDKVIDOAjVtHC3xgCetKmlUWpF18FOEpmf9pC+jB
         yDlzLLFgXipz28nJq4O0zTmJVGG8aIu5Dd8caX+a3Sef7w644/0YnFPMQ/Bfq/1bqqhe
         NakZjnigkWLLrMSOT//VHZrvFDpUtdhTlKw2mNJhmkDb/6TJnZZkTH8bNehjD5Z4Qj62
         JfmvsdJOZmO4GOOsOj39O4SiEVQi4Nc70eDM11aTgkf8qHwgNUa1XSiryuUOIWCV9Lxq
         hpFCsjPBEwlwEq33bGVZuJnd54zwVaKjoR6XMn2JPo0HDSd32rw46ZM8Xf66zKJ12uE2
         BQxw==
X-Gm-Message-State: AOJu0YwcLh3ozN3qmpoJz4CPrBczVshnuwNwjthE6a9toyzYqRmz9crq
	W6niCrpnkUEUN5es94NbfIOo+QVXqRVDVUuvo8CNiA==
X-Google-Smtp-Source: AGHT+IEe+V2HhG1zc+CQBW8omIaj1zMC9HoNmdb9n4UHMJS1Vnctdm9+PVr/BE4busR0+qAJwXItEw==
X-Received: by 2002:a05:6870:4593:b0:1d5:8e6c:1794 with SMTP id y19-20020a056870459300b001d58e6c1794mr9205382oao.58.1698632469222;
        Sun, 29 Oct 2023 19:21:09 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id k2-20020a637b42000000b0057412d84d25sm3900046pgn.4.2023.10.29.19.21.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Oct 2023 19:21:08 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 0/7] Patch review
Date: Sun, 29 Oct 2023 16:20:51 -1000
Message-Id: <cover.1698632320.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Oct 2023 02:21:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189780

Please review this set of changes for kirkstone and have comments back by
end of day Tuesday, October 31

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/6115

The following changes since commit 7681436190354b5c5b6c3a82b3094badd81113de:

  vim: Upgrade 9.0.2009 -> 9.0.2048 (2023-10-20 06:38:00 -1000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/kirkstone-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-nut

Archana Polampalli (2):
  curl: fix CVE-2023-38545
  curl: fix CVE-2023-38546

Fahad Arslan (2):
  linux-firmware: create separate package for cirrus and cnm firmwares
  linux-firmware: create separate packages

Niko Mauno (1):
  package_rpm: Allow compression mode override

Peter Marko (1):
  openssl: Upgrade 3.0.11 -> 3.0.12

Steve Sakoman (1):
  cve-exclusion_5.10.inc: update for 5.10.197

 meta/classes/package_rpm.bbclass              |   6 +-
 .../{openssl_3.0.11.bb => openssl_3.0.12.bb}  |   2 +-
 .../linux-firmware/linux-firmware_20230804.bb | 260 +++++++++++++++++-
 .../linux/cve-exclusion_5.10.inc              | 123 +++++++--
 .../curl/curl/CVE-2023-38545.patch            | 133 +++++++++
 .../curl/curl/CVE-2023-38546.patch            | 137 +++++++++
 meta/recipes-support/curl/curl_7.82.0.bb      |   2 +
 7 files changed, 633 insertions(+), 30 deletions(-)
 rename meta/recipes-connectivity/openssl/{openssl_3.0.11.bb => openssl_3.0.12.bb} (99%)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2023-38545.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2023-38546.patch

-- 
2.34.1


