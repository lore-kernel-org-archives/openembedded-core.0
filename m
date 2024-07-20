Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54792C3DA70
	for <webhook@archiver.kernel.org>; Sat, 20 Jul 2024 12:42:54 +0000 (UTC)
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
 by mx.groups.io with SMTP id smtpd.web10.5372.1721479372224966879
 for <openembedded-core@lists.openembedded.org>;
 Sat, 20 Jul 2024 05:42:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=wL35ytYF;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.181, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-3d93147ac6bso1574306b6e.0
        for <openembedded-core@lists.openembedded.org>; Sat, 20 Jul 2024 05:42:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1721479371; x=1722084171; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=IywQ3scuj7pHxrR1Z+THhgg4M32iNJw9cZVRZmyFfl4=;
        b=wL35ytYFBdkQTUyr+JYtSCq3Cg1N7v88a+/79RbKp8adBHegZWLKiWEJ8se35nQRn1
         m4IFkhHZk8wigDL7orYWC7gHqtn9nnR2m8i0Sm361hrNAY4trjbg7fQmMp9yekgYAwt7
         KowAYbxMaTbyZhtHbPPJAa/DTN1R8Bp8ma3eTq43wqvM07FaFC3UWI42doRfr/WQsg2c
         XE/kMjeEqvDbGcWCHA3vpIZouP7ogE0YcBqi39svwGjGPx1Y3rWHjF3sDHLM5T5wBq31
         6FEp2A2xfYeZ95xLlAMnwEpaxZ815abrf1h8q7ERMsodrUeYdwfxmR7azdvUhrdzBZQy
         zy7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721479371; x=1722084171;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IywQ3scuj7pHxrR1Z+THhgg4M32iNJw9cZVRZmyFfl4=;
        b=GccE2HovLhHYlkxTIuqHUSRXZJGzvAG5V3fGHn4PMGVNldrZQcVPP+Jh2Fc2B0a8Rc
         zb4/44kDsC8t8yS1FusuW541BiFTBGgB/u0plGwRmE9CE03M7jyMj8mmY9T/7z1AE4uy
         TZT9slLD+XLk5yhGv1L+WSkFWPy7Gm1mbb5uNi/Jxc68YbBFTIsg1JjLNgLGhNMaQamg
         fA8ba+ieMcojdieVIscFU5fNmx7Ey1HeaGm+/5PXrSWWGKWeIv4VFpD0WTj9gqigqkB+
         bpN7bM/j6ZLpRhwPbCsSid5bdnyLGAFNIDAd4DKQ52AFG2jrEuCG4N93OZezaNT7KhH/
         YAPQ==
X-Gm-Message-State: AOJu0YxbEUCtMoYE/VwvrW3ZaGLCZMgPSThmhUKolIRhwwtnO1KUSDJR
	HxTHT8OtTSlTVgp46UOgELxIEiZa2jy6LDU5Ghemg3tBRjxR0ldAyzOSqsQCXJDVGnpL/ZdajEf
	P+Q4=
X-Google-Smtp-Source: AGHT+IGR2+v9q4PGb6rieRXKfSyTQinlkDC6aCVyp7pkldiJtIuq/1UcpapgaEnYqI2pFm8bIaa0WQ==
X-Received: by 2002:a05:6808:2225:b0:3d9:2c62:72b4 with SMTP id 5614622812f47-3dae97c7ffamr1746731b6e.19.1721479370883;
        Sat, 20 Jul 2024 05:42:50 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70d0fe2e2b4sm796604b3a.10.2024.07.20.05.42.50
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Jul 2024 05:42:50 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 0/6] Patch review
Date: Sat, 20 Jul 2024 05:42:41 -0700
Message-Id: <cover.1721479252.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 20 Jul 2024 12:42:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202277

Please review this set of changes for kirkstone and have comments back by
end of day Tuesday, July 23

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/7158

The following changes since commit 5d97b0576e98a2cf402abab1a1edcab223545d87:

  build-appliance-image: Update to kirkstone head revision (2024-07-15 10:31:11 -0700)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/kirkstone-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-nut

Ashish Sharma (1):
  ruby: backport fix for CVE-2024-27282

Florian Amstutz (1):
  uboot-sign: Fix index error in concat_dtb_helper() with multiple
    configs

Hitendra Prajapati (1):
  busybox: Fix CVE-2023-42363

Peter Marko (2):
  busybox: Patch CVE-2021-42380
  libarchive: ignore CVE-2024-37407

Vijay Anusuri (1):
  python3-jinja2: Upgrade 3.1.3 -> 3.1.4

 meta/classes/uboot-sign.bbclass               |   6 +-
 .../busybox/busybox/CVE-2021-42380.patch      | 151 ++++++++++++++++++
 .../busybox/busybox/CVE-2023-42363.patch      |  68 ++++++++
 meta/recipes-core/busybox/busybox_1.35.0.bb   |   2 +
 ...inja2_3.1.3.bb => python3-jinja2_3.1.4.bb} |   8 +-
 .../ruby/ruby/CVE-2024-27282.patch            |  29 ++++
 meta/recipes-devtools/ruby/ruby_3.1.3.bb      |   1 +
 .../libarchive/libarchive_3.6.2.bb            |   2 +
 8 files changed, 261 insertions(+), 6 deletions(-)
 create mode 100644 meta/recipes-core/busybox/busybox/CVE-2021-42380.patch
 create mode 100644 meta/recipes-core/busybox/busybox/CVE-2023-42363.patch
 rename meta/recipes-devtools/python/{python3-jinja2_3.1.3.bb => python3-jinja2_3.1.4.bb} (82%)
 create mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2024-27282.patch

-- 
2.34.1


