Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D067C77B7C
	for <webhook@archiver.kernel.org>; Sun, 28 May 2023 17:08:08 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web11.33133.1685293682160464495
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 May 2023 10:08:02 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=vdM4dOPv;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.170, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-64d3e5e5980so3057473b3a.2
        for <openembedded-core@lists.openembedded.org>; Sun, 28 May 2023 10:08:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1685293681; x=1687885681;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=/vfzcR38DmbBKl9PsJrSFodlIBrC3Zt2bZqmj5yWvBY=;
        b=vdM4dOPvYxPeDNe0I4P+bavrWaaz1OGPyIJpZ4teUAFmGwOCLXxgiOXJSdnAv7wtsw
         yZlz5vjh6iA4hIQ7hNO2C4leeN/z6JA++wvvXcAMAdiGVwik8O5Aitx942IZgJas5Twg
         57flIsMuGgr5a7OagqoPzgRzzEBxE5vQQ0YfH4lpOszWKtN4YMWs5tINXGye6C+0D/KJ
         bUnJhdBiX6J9co0YNJTTl2eklACavRDn9Ao16r2Aksk7buRht8SKSjazuIy8SZD2ZrtP
         +KkYytwmGwQbeJPbnIlFecqdyuWi+9E9KJ+0t7wXsZH2MPwr7X7o3yMIdrlReVHliMDb
         87WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685293681; x=1687885681;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/vfzcR38DmbBKl9PsJrSFodlIBrC3Zt2bZqmj5yWvBY=;
        b=F7lQVuI9DngXEUzdWg7qIugg5cA1989J3oxNo3450Vm9LnCmzmo/nuCO/DU4NeRtwX
         ppbPC4kLl1aUaiQZ7raaOipY/bDUS9aUIfB54Vb76jaBEHqJc4hRq2bierpKMfEUDPDr
         hy7yALtWHBshLHlzCEgtwGsF/YVqNm1k0eM28tgwuyKNkPR9UkQxiysWxFeN5K8QUx93
         jIsMB+q5XqkARIfKN69oHBBhQxTucry1ogWwXBo0BWQuJ8mmJ/irao9ZhQWn2LE6dlQV
         DD7Kpl5v0I6wMrzi9Kx35nKJTgi/VVEtAezzFuTVLCBNrnw0k8FAWFS+M8PS5diaI3on
         Fz3A==
X-Gm-Message-State: AC+VfDywZpww3P7pSzTPTqRH2I4CZ6Bwmhdl+LVCFiwNRQE4lcH2DFgL
	iuht05q4W2hPT5ipcl7gVYdSCknIX5o6OVXmVWk=
X-Google-Smtp-Source: ACHHUZ6iq4nxTehFG6OV1D4LEJtA907NNghl0IY0QcbILVWrZwaPpIWEYcVVNIn5BqJU6G1jzcIe0w==
X-Received: by 2002:a05:6a00:3924:b0:646:74ce:a36c with SMTP id fh36-20020a056a00392400b0064674cea36cmr12017867pfb.8.1685293680983;
        Sun, 28 May 2023 10:08:00 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id n23-20020a62e517000000b00625d84a0194sm5363425pff.107.2023.05.28.10.08.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 May 2023 10:08:00 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 00/12] Patch review
Date: Sun, 28 May 2023 07:07:43 -1000
Message-Id: <cover.1685291299.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 28 May 2023 17:08:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181835

Please review this set of patches for mickledore and have comments back by
end of day Tuesday.

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/5355

The following changes since commit ab232138f633b0521867216570ff81fcdceb3be1:

  build-appliance-image: Update to mickledore head revision (2023-05-19 04:25:36 -1000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/mickledore-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/mickledore-nut

Andrew Jeffery (1):
  Revert "ipk: Decode byte data to string in manifest handling"

Chi Xu (1):
  expect: Add ptest support

Khem Raj (2):
  piglit: Fix c++11-narrowing warnings in tests
  cpio: Run ptests under ptest user

Pablo Saavedra (1):
  gstreamer1.0: upgrade 1.22.0 -> 1.22.2

Paul Gortmaker (1):
  scripts: fix buildstats diff/summary hard bound to host python3

Ranjitsinh Rathod (1):
  libbsd: Add correct license for all packages

Ross Burton (1):
  gdb: fix crashes when debugging threads with Arm Pointer
    Authentication enabled

Sudip Mukherjee (3):
  libxfixes: Upgrade to v6.0.1
  xwininfo: upgrade to v1.1.6
  xinput: upgrade to v1.6.4

Tim Orling (1):
  libmodule-build-perl: upgrade 0.4232 -> 0.4234

 .../distro/include/ptest-packagelists.inc     |   1 +
 meta/lib/oe/package_manager/ipk/manifest.py   |   2 +-
 meta/recipes-devtools/expect/expect/run-ptest |   6 +
 meta/recipes-devtools/expect/expect_5.45.4.bb |   8 +-
 meta/recipes-devtools/gdb/gdb.inc             |   1 +
 ...r-valid-inferior-thread-regcache-bef.patch | 286 ++++++++++++++++++
 ...4232.bb => libmodule-build-perl_0.4234.bb} |   8 +-
 .../recipes-extended/cpio/cpio-2.13/run-ptest |   9 +-
 meta/recipes-extended/cpio/cpio-2.13/test.sh  |  10 +
 meta/recipes-extended/cpio/cpio_2.13.bb       |  18 +-
 ...Fix-narrowing-errors-seen-with-clang.patch |  53 ++++
 meta/recipes-graphics/piglit/piglit_git.bb    |   1 +
 .../{xinput_1.6.3.bb => xinput_1.6.4.bb}      |   5 +-
 .../{xwininfo_1.1.5.bb => xwininfo_1.1.6.bb}  |   7 +-
 ...{libxfixes_6.0.0.bb => libxfixes_6.0.1.bb} |   6 +-
 ...tools_1.22.0.bb => gst-devtools_1.22.2.bb} |   2 +-
 ...1.22.0.bb => gstreamer1.0-libav_1.22.2.bb} |   2 +-
 ...x_1.22.0.bb => gstreamer1.0-omx_1.22.2.bb} |   2 +-
 ....bb => gstreamer1.0-plugins-bad_1.22.2.bb} |   4 +-
 ...bb => gstreamer1.0-plugins-base_1.22.2.bb} |   4 +-
 ...bb => gstreamer1.0-plugins-good_1.22.2.bb} |   4 +-
 ...bb => gstreamer1.0-plugins-ugly_1.22.2.bb} |   4 +-
 ....22.0.bb => gstreamer1.0-python_1.22.2.bb} |   6 +-
 ....bb => gstreamer1.0-rtsp-server_1.22.2.bb} |   2 +-
 ...1.22.0.bb => gstreamer1.0-vaapi_1.22.2.bb} |   9 +-
 ...er1.0_1.22.0.bb => gstreamer1.0_1.22.2.bb} |   2 +-
 meta/recipes-support/libbsd/libbsd_0.11.7.bb  |   7 +
 scripts/buildstats-diff                       |   2 +-
 scripts/buildstats-summary                    |   2 +-
 29 files changed, 428 insertions(+), 45 deletions(-)
 create mode 100755 meta/recipes-devtools/expect/expect/run-ptest
 create mode 100644 meta/recipes-devtools/gdb/gdb/0001-aarch64-Check-for-valid-inferior-thread-regcache-bef.patch
 rename meta/recipes-devtools/perl/{libmodule-build-perl_0.4232.bb => libmodule-build-perl_0.4234.bb} (94%)
 mode change 100644 => 100755 meta/recipes-extended/cpio/cpio-2.13/run-ptest
 create mode 100644 meta/recipes-extended/cpio/cpio-2.13/test.sh
 create mode 100644 meta/recipes-graphics/piglit/piglit/0001-tests-Fix-narrowing-errors-seen-with-clang.patch
 rename meta/recipes-graphics/xorg-app/{xinput_1.6.3.bb => xinput_1.6.4.bb} (64%)
 rename meta/recipes-graphics/xorg-app/{xwininfo_1.1.5.bb => xwininfo_1.1.6.bb} (56%)
 rename meta/recipes-graphics/xorg-lib/{libxfixes_6.0.0.bb => libxfixes_6.0.1.bb} (71%)
 rename meta/recipes-multimedia/gstreamer/{gst-devtools_1.22.0.bb => gst-devtools_1.22.2.bb} (95%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-libav_1.22.0.bb => gstreamer1.0-libav_1.22.2.bb} (91%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-omx_1.22.0.bb => gstreamer1.0-omx_1.22.2.bb} (95%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-bad_1.22.0.bb => gstreamer1.0-plugins-bad_1.22.2.bb} (98%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-base_1.22.0.bb => gstreamer1.0-plugins-base_1.22.2.bb} (96%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-good_1.22.0.bb => gstreamer1.0-plugins-good_1.22.2.bb} (96%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-ugly_1.22.0.bb => gstreamer1.0-plugins-ugly_1.22.2.bb} (92%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-python_1.22.0.bb => gstreamer1.0-python_1.22.2.bb} (83%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-rtsp-server_1.22.0.bb => gstreamer1.0-rtsp-server_1.22.2.bb} (90%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-vaapi_1.22.0.bb => gstreamer1.0-vaapi_1.22.2.bb} (86%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0_1.22.0.bb => gstreamer1.0_1.22.2.bb} (97%)

-- 
2.34.1


