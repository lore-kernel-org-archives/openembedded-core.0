Return-Path: <jonas.gorski@bisdn.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAB59E77184
	for <webhook@archiver.kernel.org>; Tue, 17 Dec 2024 11:12:47 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web10.79049.1734433966796098195
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Dec 2024 03:12:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bisdn-de.20230601.gappssmtp.com header.s=20230601 header.b=Zat1bAXa;
 spf=none, err=SPF record not found (domain: bisdn.de, ip: 209.85.221.48, mailfrom: jonas.gorski@bisdn.de)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-385e971a2a0so316630f8f.1
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Dec 2024 03:12:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bisdn-de.20230601.gappssmtp.com; s=20230601; t=1734433965; x=1735038765; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=SKF/lwMq6q6iLFDQdqfKiOQR5H7Rhufh8RRQBjh6ayc=;
        b=Zat1bAXaLrJ4wXVVxOng85JSQlyFeL1Z9wdl+U0wqB8oHYlzZkGvtmPmmJ/AsyzxOz
         aYn+aAYlL/xnwr8SXmZp4xMCJkBif/TST//Yqzuaz9qfiFpktrw3Hzo7aDCS9ziM/7nu
         uq77I8av8j/vkg2a1pB4aFGIVUnzbMdYzbLLh8OXM8QcamD5Y81DqST9Vq4dR8VEGtaX
         khU/IFiAkyBnfSeV12L8pp/RZ8dQ1wNaX5zs7ZikjohheKSxtYweTMOmiBSUnPZwgrIk
         qTrsVUFDr93qGCZZrnRcsYKbl5R4B30NZdYRCEWnxUEn6nPm2+zLlFq+hTDCUYxZ9ctO
         AyPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734433965; x=1735038765;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SKF/lwMq6q6iLFDQdqfKiOQR5H7Rhufh8RRQBjh6ayc=;
        b=PpIoLtNK2uSABDWAV0A4W0H6TmILkvY18F9yO1GXX4RrfZC1ax20hgrGRff87+lu4+
         pUbg+xZjVFldBCo9efJCL8J8XXRuS6FzRtJQjMADtotUfPNZo11D4Av3WT/I06hMjg9Y
         svZgQdlhiIw9PRzq0Nrn9g3NbSOg54Cu3Rbo/bMQtnitLPU7bzsPWo2FU0YtCDfMaase
         m6SRMZ6wxEt1VADzBHuEjxkXL/APw8sNQqjnn6iXLDpFq0l92A603A1uklRh0Hu14Qfb
         Z0e887o/S7K71kxUI40Y6MXiUcNrhU+XygbkxN6wetIukH9lAbbheyEk5zC2GYMyzssY
         Ae9Q==
X-Gm-Message-State: AOJu0YxZLdZxj3a6AGqJ4cBK/JI6LibfonGmPU0juxxs2VIiDtu4C3mK
	XuzDuP4hv1cJT7A7jf4EWKaNv1nxplsFylkxTkgLYKOx3KS4yXfN8Dkla0gEHpnnP0IkPd0tdKY
	+3XRRsEYIGKROXPBDCfidV2dfviYJpcfx5MNM9CM2BcUdxtCy0qO+iEf8B0sJDNpbtGmKNM4JG5
	GInrnWHKVi
X-Gm-Gg: ASbGnctUSvKL6IWv/V96B+JNR/TX3Yrc2dzt4RupRnC4pOAelkMQ7lXEj4Z1tqw4f8z
	/uHAcqaF5PJEMqmKCu5trLUzSa3jzxHMg3a1e5VOZNwEHCd+mqifAMwIdrt6NT/noOkF4znCbBR
	HiFC8CNWgAKGv+z17g2Pxpp8xSmPehBtBgCfDcsatWpZgQqMS+unDdFVdCRlZXqlx1TcMfR20Xp
	Qsz0nsoarGAKAZyBpwWuid6qiCHEFeEdtJFdpF+o46v0exnUq0SAVmkNsaSC1YtltQD0nH1JYRx
	HiJz8cf1dCRcBUL+R5H+CIAkkw4RwZV3nQ==
X-Google-Smtp-Source: AGHT+IEmz1t3dwEORcB17rbmVxndioRRQMmDcls0PVgSjEreFi95pnIO/i/ZPkWb7Wz/lAl7EVLvtw==
X-Received: by 2002:a05:6000:481c:b0:386:3c21:b1f7 with SMTP id ffacd0b85a97d-3888e0bb65cmr5087156f8f.7.1734433964802;
        Tue, 17 Dec 2024 03:12:44 -0800 (PST)
Received: from localhost (dslb-084-060-024-069.084.060.pools.vodafone-ip.de. [84.60.24.69])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-388c80120f9sm10856885f8f.15.2024.12.17.03.12.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Dec 2024 03:12:44 -0800 (PST)
From: Jonas Gorski <jonas.gorski@bisdn.de>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH kirkstone 0/6] base-passwd: backport fixes from master
Date: Tue, 17 Dec 2024 12:12:23 +0100
Message-ID: <20241217111229.60698-1-jonas.gorski@bisdn.de>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="ISO-8859-1"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Dec 2024 11:12:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208832

Backport updates for base-passwd to 3.5.52 and fixes to kirkstone.

Adds default wheel and sgx groups instead of letting systemd creating
them dynamically.

Mostly identical except where patches needed renumbering due to
targeting base-passwd 3.6.

Backport done as part of [ Yocto #15680 ].

Alex Kiernan (1):
  base-passwd: Add the sgx group

Alexandre Belloni (1):
  base-passwd: fix patchreview warning

Louis Rannou (1):
  base-passwd: add the wheel group

Peter Kjellerstedt (3):
  base-passwd: Regenerate the patches
  base-passwd: Update to 3.5.52
  base-passwd: Update the status for two patches

 .../0001-Add-a-shutdown-group.patch           |  26 ++++
 .../0001-base-passwd-Add-the-sgx-group.patch  |  30 ++++
 ...nstead-of-bin-bash-for-the-root-user.patch |  23 ++++
 ...t-since-we-do-not-have-an-etc-shadow.patch |  21 +++
 ...nput-group-for-the-dev-input-devices.patch |  23 ++++
 .../{kvm.patch =3D> 0005-Add-kvm-group.patch}   |   2 +-
 ...ble-to-build-without-debconf-support.patch | 129 ++++++++++++++++++
 ...-to-disable-the-generation-of-the-do.patch |  46 +++++++
 .../base-passwd/0008-Add-wheel-group.patch    |  20 +++
 .../base-passwd/add_shutdown.patch            |  19 ---
 .../base-passwd/disable-docs.patch            |  24 ----
 .../base-passwd/disable-shell.patch           |  57 --------
 .../base-passwd/base-passwd/input.patch       |  22 ---
 .../base-passwd/base-passwd/nobash.patch      |  15 --
 .../base-passwd/base-passwd/noshadow.patch    |  14 --
 ...passwd_3.5.29.bb =3D> base-passwd_3.5.52.bb} |  30 ++--
 16 files changed, 337 insertions(+), 164 deletions(-)
 create mode 100644 meta/recipes-core/base-passwd/base-passwd/0001-Add-a-sh=
utdown-group.patch
 create mode 100644 meta/recipes-core/base-passwd/base-passwd/0001-base-pas=
swd-Add-the-sgx-group.patch
 create mode 100644 meta/recipes-core/base-passwd/base-passwd/0002-Use-bin-=
sh-instead-of-bin-bash-for-the-root-user.patch
 create mode 100644 meta/recipes-core/base-passwd/base-passwd/0003-Remove-f=
or-root-since-we-do-not-have-an-etc-shadow.patch
 create mode 100644 meta/recipes-core/base-passwd/base-passwd/0004-Add-an-i=
nput-group-for-the-dev-input-devices.patch
 rename meta/recipes-core/base-passwd/base-passwd/{kvm.patch =3D> 0005-Add-=
kvm-group.patch} (88%)
 create mode 100644 meta/recipes-core/base-passwd/base-passwd/0006-Make-it-=
possible-to-build-without-debconf-support.patch
 create mode 100644 meta/recipes-core/base-passwd/base-passwd/0007-Make-it-=
possible-to-disable-the-generation-of-the-do.patch
 create mode 100644 meta/recipes-core/base-passwd/base-passwd/0008-Add-whee=
l-group.patch
 delete mode 100644 meta/recipes-core/base-passwd/base-passwd/add_shutdown.=
patch
 delete mode 100644 meta/recipes-core/base-passwd/base-passwd/disable-docs.=
patch
 delete mode 100644 meta/recipes-core/base-passwd/base-passwd/disable-shell=
.patch
 delete mode 100644 meta/recipes-core/base-passwd/base-passwd/input.patch
 delete mode 100644 meta/recipes-core/base-passwd/base-passwd/nobash.patch
 delete mode 100644 meta/recipes-core/base-passwd/base-passwd/noshadow.patc=
h
 rename meta/recipes-core/base-passwd/{base-passwd_3.5.29.bb =3D> base-pass=
wd_3.5.52.bb} (79%)

--=20
2.47.1


--=20
BISDN GmbH
K=F6rnerstra=DFe 7-10
10785 Berlin
Germany


Phone:=20
+49-30-6108-1-6100


Managing Directors:=A0
Dr.-Ing. Hagen Woesner, Andreas=20
K=F6psel


Commercial register:=A0
Amtsgericht Berlin-Charlottenburg HRB 141569=20
B
VAT ID No:=A0DE283257294


