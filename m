Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DD3EC282C1
	for <webhook@archiver.kernel.org>; Fri, 28 Feb 2025 14:43:29 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web10.17284.1740753801294257268
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Feb 2025 06:43:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Q6n48ta2;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.178, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2234bec7192so4359985ad.2
        for <openembedded-core@lists.openembedded.org>; Fri, 28 Feb 2025 06:43:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1740753800; x=1741358600; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=a62ooKZIvxWUKTJLLT5CyG4TWPBnjCBtxZRC6CwKupw=;
        b=Q6n48ta2RR3ROBEzE1I7C/jrMI233f9u2lHHKc+q0K7gtNRKj3YSBhVQ7RPkRlE2rR
         mfmCd5UVBJhkL47wvm0mQVPbszO6l76lRm1QTKkeqyML0KqRCr4+KxQ90cCXMxd80DTJ
         Fmfb2Z8VZ1H/q2kzQ5xp2o4DI+7hInUKEEFW8vPP3+a3t8Day2I547toFIfJwiQpXVMT
         TT7gv4LIPv+2wemA/aKI6Fz+tQ9NV3FYhQXTyJyGIQlGBbZOKuq59pDgDea1Myu0bA1j
         Eq5F0O5lZFeUEnvo7kGJn47aR0Zy3h720jRzaVOA3iZP+wyXvcSafldMSQqWAjRNTjTy
         yqtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740753800; x=1741358600;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=a62ooKZIvxWUKTJLLT5CyG4TWPBnjCBtxZRC6CwKupw=;
        b=AciW4/gO1MOeBzbuqSx16OPioda7hsMILGk50Zozy3jRfeuVHJ1+hIOWNUb2U8xPFS
         5Q250PDp2U7qIB/3hZ2kOpbEaloKeaS3hvoSsonXwVc70QeqOxgu7sFiVAyhLArVbCTe
         Sg+HArlENnxazV8XMqkrel/wBC2Vh0Wh0eofeZk33KDIC+2a9EqwKyqIpJU9x8JTr+9K
         p/dHlfa3AebeqdH35kcBYrCiznB8vMubDFC5V/fXoJ23wktDE3T+m5SIGRFAkfC6CfeU
         +xzaXFbZwv0c9wH5mDOPqM94N7M3AJeEbXRe1RSqDea+sTnU0TeKnsTOpFyoVU4lJITk
         PsxA==
X-Gm-Message-State: AOJu0YzvhxE1QRd8QN1i4nyUZp3gxGiC/tApH0+/J6bHhopFPF4ttR9v
	phaja4/2jD+ilWkDzgG/apuNPkabcUpIv9Vh/43ILG0xIZ1P5/u2FIncDH7SsHbMGF83kGKaxP2
	+
X-Gm-Gg: ASbGncvs8/7g1HxyHtAQ5OZ+Ioc0Rf9vFL0NZOaTvYc+4pcpoRFc74UNBaqyu0/ICAh
	nYdklXykkkp1yEqp/dZv8xtQ5JHRyswdgnvw4+OjrSgg7oPkr7J9uHAUFcLPd+rIbxemlKWT11s
	X+zrXOjC9ZFHP62EbFZHSwocFISPPlWYCrZ5lPvhynT1KFrmK+lVtdRV8TuqLVYbBSvXjvI3r6m
	0s63t4oltoFJvQVBlp55Ew8TGK6S07BYKpe2jqiTjNFHwy2Fl7ngjgwY2bWhj/dFXwJ9iaASmZz
	umwG4J7ir7VsACk=
X-Google-Smtp-Source: AGHT+IEbZheRy3jej4+IEfjT1OLOv3Mo8UwSwv9TmEnOHACvhJ5ozdgJm1bTgXsalqTFWXSPtMSnFA==
X-Received: by 2002:a05:6a00:464f:b0:730:9a85:c940 with SMTP id d2e1a72fcca58-734ac467393mr6203800b3a.20.1740753800293;
        Fri, 28 Feb 2025 06:43:20 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7349fe6cd66sm3806559b3a.74.2025.02.28.06.43.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2025 06:43:19 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 0/4] Patch review
Date: Fri, 28 Feb 2025 06:42:56 -0800
Message-ID: <cover.1740753632.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Feb 2025 14:43:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212060

Please review this set of changes for scarthgap and have comments back by
end of day Tuesday, March 4

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/1099

The following changes since commit 369eebad4f38c3641be73dbc0490c87636e0912d:

  python3-setuptools-scm: respect GIT_CEILING_DIRECTORIES (2025-02-25 06:38:02 -0800)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/scarthgap-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/scarthgap-nut

Fabio Berton (1):
  ccache.conf: Add include_file_ctime to sloppiness

Hitendra Prajapati (1):
  elfutils: Fix multiple CVEs

Marek Vasut (1):
  u-boot: kernel-fitimage: Restore FIT_SIGN_INDIVIDUAL="1" behavior

Moritz Haase (1):
  meta: Enable '-o pipefail' for the SDK installer

 meta/classes-recipe/uboot-sign.bbclass        |  60 +++++--
 meta/conf/ccache.conf                         |   6 +
 meta/files/toolchain-shar-extract.sh          |   5 +
 .../elfutils/elfutils_0.191.bb                |   3 +
 .../elfutils/files/CVE-2025-1352.patch        | 153 ++++++++++++++++++
 .../elfutils/files/CVE-2025-1365.patch        | 151 +++++++++++++++++
 .../elfutils/files/CVE-2025-1372.patch        |  50 ++++++
 7 files changed, 419 insertions(+), 9 deletions(-)
 create mode 100644 meta/recipes-devtools/elfutils/files/CVE-2025-1352.patch
 create mode 100644 meta/recipes-devtools/elfutils/files/CVE-2025-1365.patch
 create mode 100644 meta/recipes-devtools/elfutils/files/CVE-2025-1372.patch

-- 
2.43.0


