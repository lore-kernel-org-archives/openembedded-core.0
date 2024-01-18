Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3685C47258
	for <webhook@archiver.kernel.org>; Thu, 18 Jan 2024 02:51:51 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.web11.2800.1705546304634072845
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Jan 2024 18:51:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=jOnCKRHZ;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.175, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-5ce6b5e3c4eso5640355a12.2
        for <openembedded-core@lists.openembedded.org>; Wed, 17 Jan 2024 18:51:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1705546303; x=1706151103; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=dhDCXdg6H7RlqQv4A1/xKm/7BeqVpyPkDh4MtYNVn/g=;
        b=jOnCKRHZDcuE/eVE2PoOrSga3yHTEVYqcqjkZFPS0ak+aSLLN0GGIw6kFGiTWMQoJy
         pFmZ/60lhArGeimb13iya0xtDOnkSn1126xsfVMnCfCrOMxO2aeuyRrXMQLsPDjoNYhr
         vIHlXVFUt0wCD3hGkKzo2pg2gouvuzli7UlQrMbz46J1csLDhWCfwAFAtfgUaj9vY92P
         saDPQdB5q2yyqpw62in6i8VzSnVty+BIrpj+D0LXkuZv3eu1QnMyXqVnV3ZR1YOfavsf
         G3pmlbweiYEPESoDXYz2/M20rp/ZAHZLTIiLmL9zT2Lf1QfoPy3cPffElIOE+DfneJb6
         RvhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705546303; x=1706151103;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dhDCXdg6H7RlqQv4A1/xKm/7BeqVpyPkDh4MtYNVn/g=;
        b=WHDLei+jrwBm3gaWi4DHjSIBCIqdACtbBXtXurBHSGUXc1dLvmcMuExiuwMWMiKc0s
         SkkUtAHTCKqz4IKORzBeGQwn8vd1JEuuNjFKBdlDL3waut78HN7DiMmi21X7dW+SesrR
         dfk5GwFlVrZJIxUJc6qi0Ci2PwsVBnE6CIgKyMGSckCtQVXUkrwQF3eONjsxGb5r5AK2
         MT5tbO23kOzmBWha+hmvUwli33RRH4mvK3q6hRzloJp0e6dkfzPGkmRJJ7ZQRdOcNcrB
         +Ji0wD8WUuc5YRDVmLjpPfF7Eh0aSc4rNX23yJd0iQ4drC212dONs8stg2gheNEuxj3B
         KUtw==
X-Gm-Message-State: AOJu0YwGUPvkdVeePLSl/UhIWJpr0EEiIeZgYk3DPJ9ZLIS+dacKsESF
	fkLhRB1dfGanjBWlLPybRfIgX3ivObTSk0pYX6sZkd3v2nS+/3dtjRfleq/CxGFVNIdW+m/dkyB
	GaEU=
X-Google-Smtp-Source: AGHT+IF5Zpj7MQaKWKecj4VKwV6YYtIhMGt95FSsi4RBxDhqjlzVAVhtjepmZoGT7CUhoeNpt+JUag==
X-Received: by 2002:a17:90a:f015:b0:290:9b:252f with SMTP id bt21-20020a17090af01500b00290009b252fmr175296pjb.18.1705546302913;
        Wed, 17 Jan 2024 18:51:42 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id qb2-20020a17090b280200b0028dd956835bsm441844pjb.2.2024.01.17.18.51.42
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jan 2024 18:51:42 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 0/6] Patch review
Date: Wed, 17 Jan 2024 16:51:32 -1000
Message-Id: <cover.1705546122.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Jan 2024 02:51:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193955

Please review this set of changes for dunfell and have comments back by
end of day Friday, January 19

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/6460

The following changes since commit b3dd6852c0d6b8aa9b36377d7024ac95062e8098:

  linux-firmware: upgrade 20230804 -> 20231030 (2024-01-04 07:24:12 -1000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/dunfell-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-nut

Peter Marko (1):
  zlib: ignore CVE-2023-6992

Vijay Anusuri (5):
  go: Backport fix for CVE-2023-45287
  xserver-xorg: Fix for CVE-2023-6377 and CVE-2023-6478
  libxml2: Fix for CVE-2023-45322
  qemu: Backport fix for CVE-2023-2861
  libtiff: Fix for CVE-2023-6228

 .../libxml/libxml2/CVE-2023-45322-1.patch     |   50 +
 .../libxml/libxml2/CVE-2023-45322-2.patch     |   80 +
 meta/recipes-core/libxml/libxml2_2.9.10.bb    |    2 +
 meta/recipes-core/zlib/zlib_1.2.11.bb         |    3 +
 meta/recipes-devtools/go/go-1.14.inc          |    4 +
 .../go/go-1.14/CVE-2023-45287-pre1.patch      |  393 ++++
 .../go/go-1.14/CVE-2023-45287-pre2.patch      |  401 ++++
 .../go/go-1.14/CVE-2023-45287-pre3.patch      |   86 +
 .../go/go-1.14/CVE-2023-45287.patch           | 1697 +++++++++++++++++
 meta/recipes-devtools/qemu/qemu.inc           |    2 +
 ...x-libcap-header-issue-on-some-distro.patch |    9 +-
 ...e-O_NOATIME-if-we-don-t-have-permiss.patch |   63 +
 .../qemu/qemu/CVE-2023-2861.patch             |  178 ++
 .../xserver-xorg/CVE-2023-6377.patch          |   79 +
 .../xserver-xorg/CVE-2023-6478.patch          |   63 +
 .../xorg-xserver/xserver-xorg_1.20.14.bb      |    2 +
 .../libtiff/files/CVE-2023-6228.patch         |   30 +
 meta/recipes-multimedia/libtiff/tiff_4.1.0.bb |    1 +
 18 files changed, 3140 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2023-45322-1.patch
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2023-45322-2.patch
 create mode 100644 meta/recipes-devtools/go/go-1.14/CVE-2023-45287-pre1.patch
 create mode 100644 meta/recipes-devtools/go/go-1.14/CVE-2023-45287-pre2.patch
 create mode 100644 meta/recipes-devtools/go/go-1.14/CVE-2023-45287-pre3.patch
 create mode 100644 meta/recipes-devtools/go/go-1.14/CVE-2023-45287.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/9pfs-local-ignore-O_NOATIME-if-we-don-t-have-permiss.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2023-2861.patch
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2023-6377.patch
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2023-6478.patch
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2023-6228.patch

-- 
2.34.1


