Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA0DDEB64D8
	for <webhook@archiver.kernel.org>; Thu, 22 Jun 2023 17:09:18 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web10.13138.1687444943123563763
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Jun 2023 07:42:23 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@baylibre-com.20221208.gappssmtp.com header.s=20221208 header.b=HqSfLUn8;
 spf=pass (domain: baylibre.com, ip: 209.85.128.42, mailfrom: pidge@baylibre.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-3f90a7325f6so62139665e9.3
        for <openembedded-core@lists.openembedded.org>; Thu, 22 Jun 2023 07:42:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1687444941; x=1690036941;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=DLe29jG+WZRvVYF+cOuopDkxEB9sSWkE4c0tLTIPnf0=;
        b=HqSfLUn8cHtzEk6IBzEBSOZZF1R+zfRYCdmxiTVh/Iijx1wkeUbxZaHvtL5jjmsk9z
         AVHBXotV6GDpnhA34vz3f36PDFQ8MFjvywd65Zhgu7MJMTkrHqcC8fexVzTftjDuiuWn
         qPmzdXMf5AKnJIt8+h5oYSrIeRYi0kK0Bw+E6qkCOGLDZeZvA4e6TBQ8kVMTGTfOtTlO
         vbFijlyA2fKBpyrhqxKkFH/XjAOfN2osVEaYMiJP5lLgcmSycdDqeEW8YO9CkuYOYALq
         aWgrIKgj1fGfimjP0YXiGYeqH78GQm5uipJ/N1QsT7m7n895YAO+6Z4pvJm7amYiO3RP
         g37A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687444941; x=1690036941;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DLe29jG+WZRvVYF+cOuopDkxEB9sSWkE4c0tLTIPnf0=;
        b=PYl2H96RvLiVsW+7+Yvxn1OwEhkLwaT3sDxvpb7tyVjQCmIoQuHcCJJME1S+xSjTUM
         69LBVFuXrvJI33EaptdHgE+Gn27AoGxYWTzr9qfRGHOhqlrKSxLic9UgQEjCvcvCAZEc
         7M1PxkUzAcZ11HB7Ttq4BoCTsLNsYQH9WS7aFe77W1harf8RNyIBGV+FnsnvipYcXtK5
         nH+erNuLEHsYJtFA7ro4E2qqYEs0coEKo3hNPRgOHRnUsXT6S3aB5s4gH+kLZqpZlh2k
         I8BrLZTdD/+cWZpNGtenWX8aeH11kwk6qzyLXmM0wpHunE6CrNu148pXTK3HUdvS76xb
         Nh+A==
X-Gm-Message-State: AC+VfDzhZrgbVJhLT5jirJkGpvfvQoAIj1jUKErEstCABFR/mjt/6dh7
	WAUZV6btmdiUREu9+M+oEizoXlnCnjBbe9I5ON8=
X-Google-Smtp-Source: ACHHUZ4gPgM2E31A1nM6mpef0JCA5Q3hCJc6/TDnfzYPMYzSz8kzCOscl6ek2mkChXN6lhOExwqnyw==
X-Received: by 2002:a7b:cd08:0:b0:3f7:e8e2:f377 with SMTP id f8-20020a7bcd08000000b003f7e8e2f377mr15384868wmj.12.1687444940994;
        Thu, 22 Jun 2023 07:42:20 -0700 (PDT)
Received: from tapa.fritz.box ([194.110.145.167])
        by smtp.gmail.com with ESMTPSA id f20-20020a1c6a14000000b003f8f884ebe5sm7968951wmc.2.2023.06.22.07.42.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jun 2023 07:42:20 -0700 (PDT)
From: =?UTF-8?B?RWlsw61zICdwaWRnZScgTsOtIEZobGFubmFnw6Fpbg==?= <pidge@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 0/3] wayland/weston upgrades
Date: Thu, 22 Jun 2023 15:42:14 +0100
Message-Id: <cover.1687444823.git.pidge@baylibre.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 Jun 2023 17:09:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183272

Nothing really surprising here, except we should note that launcher-logind is 
being depreciated so some thought on how that is dealt with will need to occur
and that we'll need to pull xcb-util-cursor from meta-openembedded as it's
needed here for weston's ptest now.

Eilís 'pidge' Ní Fhlannagáin (3):
  wayland-utils: Upgrade 1.1.0 -> 1.2.0
  weston: Upgrade 11.0.1 -> 12.0.1
  xwayland: Upgrade 23.1.1 -> 23.1.2

 ...ayland-info-Fix-build-without-libdrm.patch | 42 -------------------
 ...-utils_1.1.0.bb => wayland-utils_1.2.0.bb} |  3 +-
 .../{weston_11.0.1.bb => weston_12.0.1.bb}    | 11 +++--
 .../xorg-lib/xcb-util-cursor_0.1.4.bb         | 10 +++++
 ...{xwayland_23.1.1.bb => xwayland_23.1.2.bb} |  2 +-
 5 files changed, 20 insertions(+), 48 deletions(-)
 delete mode 100644 meta/recipes-graphics/wayland/files/0001-wayland-info-Fix-build-without-libdrm.patch
 rename meta/recipes-graphics/wayland/{wayland-utils_1.1.0.bb => wayland-utils_1.2.0.bb} (82%)
 rename meta/recipes-graphics/wayland/{weston_11.0.1.bb => weston_12.0.1.bb} (90%)
 create mode 100644 meta/recipes-graphics/xorg-lib/xcb-util-cursor_0.1.4.bb
 rename meta/recipes-graphics/xwayland/{xwayland_23.1.1.bb => xwayland_23.1.2.bb} (95%)

-- 
2.34.1


