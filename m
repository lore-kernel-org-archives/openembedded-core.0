Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1C4CC4828E
	for <webhook@archiver.kernel.org>; Thu,  1 Feb 2024 19:37:52 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web11.4926.1706816267118801636
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Feb 2024 11:37:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=iqIW5M8o;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.175, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-6da6b0eb2d4so1036139b3a.1
        for <openembedded-core@lists.openembedded.org>; Thu, 01 Feb 2024 11:37:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1706816266; x=1707421066; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=f7JWtc00ZDZAd32zc5dp4MTZYtIk3uOUyu2gVr9nfa8=;
        b=iqIW5M8oBq8xgWq942GBXTu1g+XYnwJO+QuKFliTgmtjJKJPbjtsfpptJqtoWqfDcp
         7VR8ftvMVfPb35xOyovoFf0q0m4FWbOrY63q89MbH1VwivXEyfahbkCU0Zve/pEZtH0W
         zvtLEj0Bv0Z6VzT1m2wSJ8OFIjL7IEd0iQB8Klt5GUfs4foiWxy8UJSbepPPEy8C93Fl
         tuqQtHIaUhLjaKH8qOJJ0B+bB8/ZRNz963mpX1mrzu0fDO04PXBS8JBeyQ45eEyWpCBR
         3DzzRsoWfT4ihJJPW8m+rCWtltVf2CfyxeGd5BrYAEtOx7U77QNwFOv5KDBXkaWdvPNG
         qr3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706816266; x=1707421066;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=f7JWtc00ZDZAd32zc5dp4MTZYtIk3uOUyu2gVr9nfa8=;
        b=Ry19zWX1Bk3S6j4nC22K7LXQES5OZGFMuGPmy61Qcp/cYF3f1HrD21CYNzqXbdC655
         iYaykg0iCb6UEdYw1iDVpGPpRSq88M/hGGnZgvr+JgMTngPvgokV/32+YAOJqOwhTR/h
         LYySGD9NiXvqtWzx9GtvuKX5Qk6phSEBoKergvsQqbCey8C6R6ASHF+U4SCRDDht03Gm
         bexPtpLvSJIWg9G2uxfS9+ooV1flCBo/pawNF6hHsmRMPa+co1YdQhkQ1UDD8b6iKmLR
         nYpbIva6jxMUwN5FBajP6K0yKCP1z5jP7WK+T4VYy/A1iwI+bf3M9Fm/LTdohxZYEUrW
         7ong==
X-Gm-Message-State: AOJu0YyOK56hDewWMyne2ZC02qydZO8291S1OY3EeM4qEHKRMePXRFxJ
	gI1CgSHDlaX1YJqiXROcO7Awgheo+GsxdPC7ltiUaaJZMTLEXghrmB93SQ+189hBXau2t+8k364
	xcKE=
X-Google-Smtp-Source: AGHT+IEPFR6Ntck0XmhfBpayZQcV+r8bqlQcJXi6JxCMvh44nndM4ueASo6/cRYBpnsKKLuPZhgNLg==
X-Received: by 2002:a05:6a00:bd4:b0:6dd:83a5:a893 with SMTP id x20-20020a056a000bd400b006dd83a5a893mr5247576pfu.5.1706816265853;
        Thu, 01 Feb 2024 11:37:45 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id e10-20020a056a001a8a00b006dbdbe7f71csm109717pfv.98.2024.02.01.11.37.45
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Feb 2024 11:37:45 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 0/4] Patch review
Date: Thu,  1 Feb 2024 09:37:38 -1000
Message-Id: <cover.1706815725.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Feb 2024 19:37:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194734

Please review this set of changes for kirkstone and have comments back by
end of day Monday, February 5

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/6513

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/6513

The following changes since commit a744a897f0ea7d34c31c024c13031221f9a85f24:

  build-appliance-image: Update to kirkstone head revision (2024-01-25 04:06:50 -1000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/kirkstone-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-nut

Alexander Kanavin (1):
  python3-jinja2: upgrade 3.1.1 -> 3.1.2

Lee Chee Yang (1):
  xwayland: Fix CVE-2023-6377 CVE-2023-6478

Ludovic Jozeau (1):
  image-live.bbclass: LIVE_ROOTFS_TYPE support compression

Wang Mingyu (1):
  python3-jinja2: upgrade 3.1.2 -> 3.1.3

 meta/classes/image-live.bbclass               |  2 +-
 ...inja2_3.1.1.bb => python3-jinja2_3.1.3.bb} |  2 +-
 .../xwayland/xwayland/CVE-2023-6377.patch     | 82 +++++++++++++++++++
 .../xwayland/xwayland/CVE-2023-6478.patch     | 66 +++++++++++++++
 .../xwayland/xwayland_22.1.8.bb               |  2 +
 5 files changed, 152 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-jinja2_3.1.1.bb => python3-jinja2_3.1.3.bb} (92%)
 create mode 100644 meta/recipes-graphics/xwayland/xwayland/CVE-2023-6377.patch
 create mode 100644 meta/recipes-graphics/xwayland/xwayland/CVE-2023-6478.patch

-- 
2.34.1


