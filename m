Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A9581125879
	for <webhook@archiver.kernel.org>; Wed, 11 Mar 2026 19:27:43 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4758.1773257258901706470
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Mar 2026 12:27:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=WDLuClt3;
 spf=pass (domain: smile.fr, ip: 209.85.221.48, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-439b611274bso157788f8f.3
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Mar 2026 12:27:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1773257257; x=1773862057; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=GkqIq5hZbIx6c9SaPpqAhkN1uozN865bHyNqAcOyUd4=;
        b=WDLuClt3hWXkgAvQVWx6WkaYqHHtK2qT6gj+CH4dHJwvjmOhlJ6OhGSJwdCQv60YaN
         K81i4+N/nwBljspgXGcdu8rkNKhf8zHc7zrfGdLIluKEqfMhQU+FHPPz81mzK8662hFe
         MLViPUh7hGfg2BXcpkYMTzPHs9ll3cGpQorig=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773257257; x=1773862057;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GkqIq5hZbIx6c9SaPpqAhkN1uozN865bHyNqAcOyUd4=;
        b=ERgW+lTDQmESUi9Ck4f5l3GfJDpyZs7ma9OsC+HOzjgPQjsJxjdDh75conYaex4v4K
         yd94RZZptJaymWOeYbRR8WxEJnLz2QNgZmZeV2immrADaT3/3hfN/PUwTb6jgvvafY/c
         dFPKl/ik5E9rV0M7XQ8q98y5rApGakraqVZL8oucnbX9cK8AV/5ixS3Yf1NZg2in0kHj
         VupSoIdEJtn12u8RtxvE0ESVdT04gXcVnyS0G01VEdZTKvJzTUzheVFnOiAcYw0WxPRE
         pQfHeO6pXdmWLLbX+0HyecLXR7jqaZGICdNkd1he0aavZ4PAJ1Lhrg06De3OXBbaOSwe
         yD3Q==
X-Gm-Message-State: AOJu0Yx/r5V2vz43fgEC+xlQP6ZtbikskPZhMqry9McIRGN0Kp7SHCC/
	m5yiabB5MyM4RqmRoHM+wVbTal7m6zSxh1lrT7mdZ9gbU98dsRttktgAeQRGe7g0/I8KqYA740W
	+Nbpp
X-Gm-Gg: ATEYQzw21+/BzDCmmLKC9bb5TG00/IHGPBDDBjmeMEu49tmAzj5XybD8547+QdztLls
	TmZEJ2/y1M6ZlGsyvxiZJk5mBAEP0/AbP68LOw1h9m51t2ZeuJjU2/hM1OYiQnDK/6qsVb8MBqo
	NEDokUEKUaPenizfiZUcgmACIUXChhSbpOeH3T4tjXxr02xu97fn+SwITXe4Rw2GmxsI7z/kIZh
	cv2gwDquc1WsQ/3Whqp2loZ66dUxt9HvrooNnt0H8Y6PHr6sCifqLHxpGN7+HK97JuH/KU+ft8d
	bq5sZryiniq+xQLEoU6HryZlxVcaUfDfCD8uK8EuL/1skJJXSK53b8AeP4xnODmHhWS6yTTvZak
	7ptrBWxr6U2Uzcz1C0H6lHzM83B7/F0EGyEG60mWfgeMoG05JZnnx4IHIn5zscw/8UXJzxnxRaB
	+j/oJo6dZniI24EEO8jJK3DgZY62Ud9FsaCNuIIYh0yO/BvFKdUd4KGX9B6ladQ9EO/A6VOUaGq
	cqQR4aOv9sRuAw7AqVc4xQkcqU=
X-Received: by 2002:a05:6000:2c01:b0:439:beee:43ab with SMTP id ffacd0b85a97d-439f81dedc4mr7269516f8f.9.1773257256814;
        Wed, 11 Mar 2026 12:27:36 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe22f3a4sm1452450f8f.38.2026.03.11.12.27.36
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 12:27:36 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter 0/6] Patch review
Date: Wed, 11 Mar 2026 20:27:02 +0100
Message-ID: <cover.1773257124.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Mar 2026 19:27:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232899

Please review this set of changes for whinlatter and have comments back by
end of day Friday, March 13.

Passed a-full on autobuilder:
https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/3380

The following changes since commit 96d653f64e6eaa919dd1f62193a5a96f43430dc4:

  build-appliance-image: Update to whinlatter head revisions (2026-03-10 11:53:11 +0000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/whinlatter-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/whinlatter-nut

for you to fetch changes up to b37db2db1a03c856f7b4cc94e70b7e6c1ef437b5:

  lsb.py: strip ' from os-release file (2026-03-11 01:09:19 +0100)

----------------------------------------------------------------

Livin Sunny (1):
  busybox: Fixes CVE-2025-60876

Martin Jansa (1):
  lsb.py: strip ' from os-release file

Peter Marko (3):
  inetutils: patch CVE-2026-28372
  libpam: set status for CVE-2024-10041
  go: upgrade 1.25.7 -> 1.25.8

Vijay Anusuri (1):
  freetype: Fix CVE-2026-23865

 meta/lib/oe/lsb.py                            |  2 +-
 .../inetutils/inetutils/CVE-2026-28372.patch  | 86 +++++++++++++++++++
 .../inetutils/inetutils_2.6.bb                |  1 +
 .../busybox/busybox/CVE-2025-60876.patch      | 42 +++++++++
 meta/recipes-core/busybox/busybox_1.37.0.bb   |  1 +
 .../go/{go-1.25.7.inc => go-1.25.8.inc}       |  2 +-
 ...e_1.25.7.bb => go-binary-native_1.25.8.bb} |  6 +-
 ..._1.25.7.bb => go-cross-canadian_1.25.8.bb} |  0
 ...{go-cross_1.25.7.bb => go-cross_1.25.8.bb} |  0
 ...osssdk_1.25.7.bb => go-crosssdk_1.25.8.bb} |  0
 ...runtime_1.25.7.bb => go-runtime_1.25.8.bb} |  0
 .../go/{go_1.25.7.bb => go_1.25.8.bb}         |  0
 meta/recipes-extended/pam/libpam_1.7.1.bb     |  2 +
 .../freetype/freetype/CVE-2026-23865.patch    | 54 ++++++++++++
 .../freetype/freetype_2.13.3.bb               |  4 +-
 15 files changed, 194 insertions(+), 6 deletions(-)
 create mode 100644 meta/recipes-connectivity/inetutils/inetutils/CVE-2026-28372.patch
 create mode 100644 meta/recipes-core/busybox/busybox/CVE-2025-60876.patch
 rename meta/recipes-devtools/go/{go-1.25.7.inc => go-1.25.8.inc} (91%)
 rename meta/recipes-devtools/go/{go-binary-native_1.25.7.bb => go-binary-native_1.25.8.bb} (79%)
 rename meta/recipes-devtools/go/{go-cross-canadian_1.25.7.bb => go-cross-canadian_1.25.8.bb} (100%)
 rename meta/recipes-devtools/go/{go-cross_1.25.7.bb => go-cross_1.25.8.bb} (100%)
 rename meta/recipes-devtools/go/{go-crosssdk_1.25.7.bb => go-crosssdk_1.25.8.bb} (100%)
 rename meta/recipes-devtools/go/{go-runtime_1.25.7.bb => go-runtime_1.25.8.bb} (100%)
 rename meta/recipes-devtools/go/{go_1.25.7.bb => go_1.25.8.bb} (100%)
 create mode 100644 meta/recipes-graphics/freetype/freetype/CVE-2026-23865.patch


