Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69EEFC4345F
	for <webhook@archiver.kernel.org>; Tue, 30 Apr 2024 21:24:18 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web10.197.1714512252400122209
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Apr 2024 14:24:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=at3rD0r7;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.171, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1e83a2a4f2cso41019835ad.1
        for <openembedded-core@lists.openembedded.org>; Tue, 30 Apr 2024 14:24:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1714512251; x=1715117051; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=b9AMSD1/yVKb7/1J/qw40v1xtKGuLhPmtxqCFu1LoLU=;
        b=at3rD0r7xMf9S0NDdhRklf80UDUPIMv6yodS2HIqd0J9x8mE3VqG03x6aK/KONHhAW
         9vnu8aoIlE1U6IW2T8i6Ksdhw7V7P/DBdhv3WA9fO6DtGmL7osTYaoRkwxf1OUGY9IX5
         JQoeNLJK9Wel/U9FFmmO4UFwbclP2l+BVTNjtRpvlpkCWne924uMA0wbME1f2gN6JdVd
         dqh/GdCfdY0TrnBghjq6H0l4n6vPkx7n5HW1tWceCDikGXfhcYIlawVpS2QuZ/TZ7b4V
         laumE1NG9ZRlAW1vy24BeWYpEvVlUygdnkx4VsqmKyX754HpUOV3A8VCC6nx+Ssex9fj
         FYdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714512251; x=1715117051;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=b9AMSD1/yVKb7/1J/qw40v1xtKGuLhPmtxqCFu1LoLU=;
        b=ec+du1t1SFSrU23kBJiLZ/pH+Vb7grbeXUqElelC2fBkhk+BhyfHUURLVAw8nc82DF
         qob/BpCeufob1C2xj4iFqYx2M0jaYg0JLxXO194hgC1Lbvivqr4ONJZ0WxV+R5i2olB0
         l2nHGllGzQ24MPml2RpeLvRDsURpcjIph81VpOEqni2urNKvfAyg09JyKKqvVbsiw1Iq
         zKA5Jf6MOo8yjLZ/sLUH6yQAQxSEWMxk3nqPRjGQchMwJL9slCwuXMfBqPeWcXpaBLyF
         Omz7ETSLTjT8JMkpy6d7xSGsuEeJYmRCJrJ66kz/MshxKkdW+GP6CNxQuGBffNnYYt78
         KG4A==
X-Gm-Message-State: AOJu0YxyoNG1o5Vryj79NVYyHbKQU8TXd1gwU9YezkmQbYp2/QcctJRb
	gFPNWmQvyGhHgJHXY86KH2KjzIbndEYWADY2FPb3QsubsxxjTUN8wQeztv/x8oJhu+xu4H/L0m8
	UXHM=
X-Google-Smtp-Source: AGHT+IEomnqr49AVWdfssIRy3ujp5t3JM77Y8M7pQ2VimewO0iKz3Lg3X6lJ8gRwkEP2F8oZ9NTKkg==
X-Received: by 2002:a17:902:f7c2:b0:1ec:304e:90c4 with SMTP id h2-20020a170902f7c200b001ec304e90c4mr610484plw.17.1714512251313;
        Tue, 30 Apr 2024 14:24:11 -0700 (PDT)
Received: from xps13.. ([209.237.67.158])
        by smtp.gmail.com with ESMTPSA id l8-20020a170903244800b001ea9580e6a0sm11193133pls.20.2024.04.30.14.24.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Apr 2024 14:24:10 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 00/17] Patch review
Date: Tue, 30 Apr 2024 14:23:45 -0700
Message-Id: <cover.1714511660.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Apr 2024 21:24:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198764

Please review this set of changes for scarthgap and have comments back by
end of day Thursday, May 2

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/6864

with the exception of a known intermittent issue (also present on master):

https://bugzilla.yoctoproject.org/show_bug.cgi?id=15185

The following changes since commit b65b4e5a8e4473d8ca43835ba17bc8bd4bdca277:

  build-appliance-image: Update to scarthgap head revision (2024-04-18 17:08:51 +0100)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/scarthgap-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/scarthgap-nut

Alexander Kanavin (2):
  icu: update 74-1 -> 74-2
  rpm: update 4.19.1 -> 4.19.1.1

Michael Glembotzki (1):
  rootfs-postcommands.bbclass: Only set DROPBEAR_RSAKEY_DIR once

Wang Mingyu (14):
  gcr: upgrade 4.2.0 -> 4.2.1
  libsdl2: upgrade 2.30.0 -> 2.30.1
  libxcursor: upgrade 1.2.1 -> 1.2.2
  pango: upgrade 1.52.0 -> 1.52.1
  bind: upgrade 9.18.24 -> 9.18.25
  libxml2: upgrade 2.12.5 -> 2.12.6
  mesa: upgrade 24.0.2 -> 24.0.3
  babeltrace2: upgrade 2.0.5 -> 2.0.6
  ell: upgrade 0.63 -> 0.64
  libdnf: upgrade 0.73.0 -> 0.73.1
  libx11: upgrade 1.8.7 -> 1.8.9
  lttng-tools: upgrade 2.13.11 -> 2.13.13
  mpg123: upgrade 1.32.5 -> 1.32.6
  ttyrun: upgrade 2.31.0 -> 2.32.0

 .../rootfs-postcommands.bbclass               |  4 +-
 .../bind/{bind_9.18.24.bb => bind_9.18.25.bb} |  2 +-
 .../ell/{ell_0.63.bb => ell_0.64.bb}          |  2 +-
 .../{libxml2_2.12.5.bb => libxml2_2.12.6.bb}  |  2 +-
 .../{ttyrun_2.31.0.bb => ttyrun_2.32.0.bb}    |  2 +-
 .../{libdnf_0.73.0.bb => libdnf_0.73.1.bb}    |  2 +-
 ...olor-setting-for-mips64_n32-binaries.patch |  3 +-
 ...ook-for-lua-with-pkg-config-rather-t.patch |  7 +--
 ...estore-readline-support-as-an-explic.patch | 42 --------------
 ...satisfiable-dependency-when-building.patch |  3 +-
 ...lib-rpm-as-the-installation-path-for.patch |  9 ++-
 ...1-Do-not-read-config-files-from-HOME.patch |  9 ++-
 ...-PATH-environment-variable-before-ru.patch |  5 +-
 ...l-dependency-on-non-POSIX-GLOB_ONLYD.patch | 56 -------------------
 ...lling-execute-package-scriptlets-wit.patch |  5 +-
 ...not-insert-payloadflags-into-.rpm-me.patch |  3 +-
 ....c-fix-file-conflicts-for-MIPS64-N32.patch |  3 +-
 .../files/0001-perl-disable-auto-reqs.patch   |  3 +-
 ...prefixing-etc-from-RPM_ETCCONFIGDIR-.patch | 13 ++---
 ...txt-do-not-install-non-existent-docs.patch | 26 ---------
 ...avoid-using-GLOB_BRACE-if-undefined-.patch |  2 +-
 ...ge-logging-level-around-scriptlets-t.patch |  5 +-
 .../rpm/{rpm_4.19.1.bb => rpm_4.19.1.1.bb}    |  7 +--
 .../gcr/{gcr_4.2.0.bb => gcr_4.2.1.bb}        |  2 +-
 .../{libsdl2_2.30.0.bb => libsdl2_2.30.1.bb}  |  2 +-
 ...-meson-do-not-pull-in-clc-for-clover.patch | 13 ++---
 .../{mesa-gl_24.0.2.bb => mesa-gl_24.0.3.bb}  |  0
 meta/recipes-graphics/mesa/mesa.inc           |  2 +-
 .../mesa/{mesa_24.0.2.bb => mesa_24.0.3.bb}   |  0
 .../{pango_1.52.0.bb => pango_1.52.1.bb}      |  2 +-
 .../{libx11_1.8.7.bb => libx11_1.8.9.bb}      |  2 +-
 ...ibxcursor_1.2.1.bb => libxcursor_1.2.2.bb} |  2 +-
 ...eltrace2_2.0.5.bb => babeltrace2_2.0.6.bb} |  2 +-
 ...-tests-do-not-strip-a-helper-library.patch |  9 +--
 ...ools_2.13.11.bb => lttng-tools_2.13.13.bb} |  2 +-
 .../{mpg123_1.32.5.bb => mpg123_1.32.6.bb}    |  2 +-
 .../0001-Disable-LDFLAGSICUDT-for-Linux.patch | 11 ++--
 .../icu/0001-icu-Added-armeb-support.patch    |  9 ++-
 .../icu/icu/fix-install-manx.patch            |  7 +--
 .../icu/{icu_74-1.bb => icu_74-2.bb}          |  4 +-
 40 files changed, 70 insertions(+), 216 deletions(-)
 rename meta/recipes-connectivity/bind/{bind_9.18.24.bb => bind_9.18.25.bb} (97%)
 rename meta/recipes-core/ell/{ell_0.63.bb => ell_0.64.bb} (89%)
 rename meta/recipes-core/libxml/{libxml2_2.12.5.bb => libxml2_2.12.6.bb} (97%)
 rename meta/recipes-core/ttyrun/{ttyrun_2.31.0.bb => ttyrun_2.32.0.bb} (93%)
 rename meta/recipes-devtools/libdnf/{libdnf_0.73.0.bb => libdnf_0.73.1.bb} (97%)
 delete mode 100644 meta/recipes-devtools/rpm/files/0001-CMakeLists.txt-restore-readline-support-as-an-explic.patch
 delete mode 100644 meta/recipes-devtools/rpm/files/0001-Fix-unconditional-dependency-on-non-POSIX-GLOB_ONLYD.patch
 delete mode 100644 meta/recipes-devtools/rpm/files/0002-docs-CMakeLists.txt-do-not-install-non-existent-docs.patch
 rename meta/recipes-devtools/rpm/{rpm_4.19.1.bb => rpm_4.19.1.1.bb} (96%)
 rename meta/recipes-gnome/gcr/{gcr_4.2.0.bb => gcr_4.2.1.bb} (95%)
 rename meta/recipes-graphics/libsdl2/{libsdl2_2.30.0.bb => libsdl2_2.30.1.bb} (97%)
 rename meta/recipes-graphics/mesa/{mesa-gl_24.0.2.bb => mesa-gl_24.0.3.bb} (100%)
 rename meta/recipes-graphics/mesa/{mesa_24.0.2.bb => mesa_24.0.3.bb} (100%)
 rename meta/recipes-graphics/pango/{pango_1.52.0.bb => pango_1.52.1.bb} (94%)
 rename meta/recipes-graphics/xorg-lib/{libx11_1.8.7.bb => libx11_1.8.9.bb} (92%)
 rename meta/recipes-graphics/xorg-lib/{libxcursor_1.2.1.bb => libxcursor_1.2.2.bb} (87%)
 rename meta/recipes-kernel/lttng/{babeltrace2_2.0.5.bb => babeltrace2_2.0.6.bb} (98%)
 rename meta/recipes-kernel/lttng/{lttng-tools_2.13.11.bb => lttng-tools_2.13.13.bb} (99%)
 rename meta/recipes-multimedia/mpg123/{mpg123_1.32.5.bb => mpg123_1.32.6.bb} (96%)
 rename meta/recipes-support/icu/{icu_74-1.bb => icu_74-2.bb} (96%)

-- 
2.34.1


