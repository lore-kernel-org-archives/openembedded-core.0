Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 934B1E69194
	for <webhook@archiver.kernel.org>; Fri, 22 Nov 2024 21:26:48 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web11.35740.1732310807195375062
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Nov 2024 13:26:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=zMM2rRXL;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.175, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-720c2db824eso2622317b3a.0
        for <openembedded-core@lists.openembedded.org>; Fri, 22 Nov 2024 13:26:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1732310806; x=1732915606; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=6cUz7hgBxtkMWBbWldvrmh7pshR8an5wBkQMBX0oKI0=;
        b=zMM2rRXLKicf70lZeXzNV4dcnW50JcuoR2lj0BAvLamXfaThEYHpVLVTuaZ3j0S6Mp
         TIFfQMrSvvRSt8XwsPmzMvSa7A80KE/42WsfaZaUXqilQdmfbZCu/oHNoImgM5H+zVs1
         lB6FGcosIiXIMcA8k8J0AEMJbmODXi3j/FnBdeOaoDeIAzkAqSXfmEi5TAFxzEFjSA0T
         yB8KIESRLhEoSxyg35J+DMNRa820vdrj2HZ7fjE2DKwz6DSdwHqik1vIJx8Vv3x/rc4u
         UgKLU+4b8ZQU/jz0biUNQbuotwtO8No/aDOyCZxU18eQrlDNMsHdxwTzq/YDMqC9RlhT
         qt9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732310806; x=1732915606;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6cUz7hgBxtkMWBbWldvrmh7pshR8an5wBkQMBX0oKI0=;
        b=FU9JqPNg98m/eACngg5/2kUlxJsxac3WB7ey3C2fAR7gmkzyExpGxP57AT8zNBGyH7
         5V+ZUw+CKkkfXW+mtXQMZOsFkmdK5LkCNI0ZbtqshlUilEIdTGVekU9Y+3HTJsvIUmy/
         iF8AmJS8dhv0AWHNgUYKJHFDhoHy8F4QSAurlt1xNvHAO0O0vz51E0IUo0XC9fJv90RB
         hpoTg0diS+B1so2SCU8YUURRA3f1tn6c5VvZGIa0x1jS7zEerL5Kuync6t/V0cdIYyyR
         28OvHUAmpoIR5eSsTFpUIyXPvf3kNK7JjrSAI6616ptbh/KZ5HMNxLYhgtchLDCQXE4A
         KKcw==
X-Gm-Message-State: AOJu0YyIa4KanYLaNtVmzC14pgoPgk+0EZgFZHGFrhSEWmnLVSYl11YI
	ZtSNnikLWI1oNwAmeVapLh3fkIhO7wDvr9UG4rNQyI2ytnzZ3BwXVpWUfl5m+MUHgATXSNA0tgC
	g
X-Gm-Gg: ASbGnctyVRXuHwnkazTqMhSNafbjA8qhQ0zEJJYGnKcLd6/q8F1+5T3cCEyDE5uhyXh
	NjbL10ZVuaaK+Pg9USw8IimDMuRewxVQv719XOG6zchHZ0COVwEfQJ9FOEPzc6yLB57TBPJsyN+
	c+eWE2LeL9OyQyc4jC00bB1efGFBFfI9rBtPgbK7LwGoCJE7Qr9fYeRDlSyob0aVxEa0XQbQ8E4
	XFXtIbxFZ0o4s4J8xK94jwvUXFw6wBbLkubDrs=
X-Google-Smtp-Source: AGHT+IEnQDph4CvtFfKg2Hww7J+y/udLp9Djb+w15NRNEHla6ltHzHnKQL3uKkN3WcGV5JqDtoqYNg==
X-Received: by 2002:a17:902:ea11:b0:20c:ecc9:c50b with SMTP id d9443c01a7336-2129fd5c7d6mr54054395ad.42.1732310805978;
        Fri, 22 Nov 2024 13:26:45 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2129dbfe6fasm20814095ad.160.2024.11.22.13.26.45
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2024 13:26:45 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 00/19] Patch review
Date: Fri, 22 Nov 2024 13:26:19 -0800
Message-Id: <cover.1732310669.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Nov 2024 21:26:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207650

Please review this set of changes for kirkstone and have comments back by
end of day Tuesday, November 26

Passed a-full on autobuilder:

https://valkyrie.yoctoproject.org/#/builders/29/builds/505

The following changes since commit fb45c5cf8c2b663af293acb069d446610f77ff1a:

  build-appliance-image: Update to kirkstone head revision (2024-11-15 12:18:46 -0800)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/kirkstone-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-nut

Aleksandar Nikolic (1):
  scripts/install-buildtools: Update to 4.0.22

Archana Polampalli (6):
  ffmpeg: fix CVE-2024-32230
  ffmpeg: fix CVE-2023-51793
  ffmpeg: fix CVE-2023-50008
  ffmpeg: fix CVE-2024-31582
  ffmpeg: fix CVE-2024-31578
  ffmpeg: fix CVE-2023-51794

Chen Qi (1):
  toolchain-shar-extract.sh: exit when post-relocate-setup.sh fails

Khem Raj (1):
  webkitgtk: Fix build on 32bit arm

Liyin Zhang (1):
  lttng-modules: fix build error after kernel update to 5.15.171

Ovidiu Panait (1):
  webkitgtk: fix perl-native dependency

Regis Dargent (1):
  udev-extraconf: fix network.sh script did not configure hotplugged
    interfaces

Ross Burton (1):
  webkitgtk: reduce size of -dbg package

Steve Sakoman (1):
  llvm: reduce size of -dbg package

Vijay Anusuri (4):
  ghostscript: Backport fix for multiple CVE's
  libsoup: Fix for CVE-2024-52530 and CVE-2024-52532
  libsoup-2.4: Backport fix for CVE-2024-52530 and CVE-2024-52532
  glib-2.0: Backport fix for CVE-2024-52533

Wang Mingyu (1):
  wireless-regdb: upgrade 2024.07.04 -> 2024.10.07

 meta/files/toolchain-shar-extract.sh          |   4 +
 .../glib-2.0/glib-2.0/CVE-2024-52533.patch    |  49 +++
 meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb |   1 +
 .../udev/udev-extraconf/network.sh            |  32 --
 meta/recipes-devtools/llvm/llvm_git.bb        |   2 +
 .../ghostscript/CVE-2024-46951.patch          |  31 ++
 .../ghostscript/CVE-2024-46952.patch          |  62 ++++
 .../ghostscript/CVE-2024-46953.patch          |  67 ++++
 .../ghostscript/CVE-2024-46955.patch          |  60 ++++
 .../ghostscript/CVE-2024-46956.patch          |  30 ++
 .../ghostscript/ghostscript_9.55.0.bb         |   5 +
 ...c-fix-tracepoint-mm_page_alloc_zone_.patch |  61 ++++
 .../lttng/lttng-modules_2.13.14.bb            |   1 +
 ....07.04.bb => wireless-regdb_2024.10.07.bb} |   2 +-
 .../ffmpeg/ffmpeg/CVE-2023-50008.patch        |  29 ++
 .../ffmpeg/ffmpeg/CVE-2023-51793.patch        |  67 ++++
 .../ffmpeg/ffmpeg/CVE-2023-51794.patch        |  35 +++
 .../ffmpeg/ffmpeg/CVE-2024-31578.patch        |  49 +++
 .../ffmpeg/ffmpeg/CVE-2024-31582.patch        |  34 ++
 .../ffmpeg/ffmpeg/CVE-2024-32230.patch        |  35 +++
 .../recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb |   6 +
 ...44e17d258106617b0e6d783d073b188a2548.patch | 296 ++++++++++++++++++
 meta/recipes-sato/webkit/webkitgtk_2.36.8.bb  |   7 +-
 .../libsoup/libsoup-2.4/CVE-2024-52530.patch  | 149 +++++++++
 .../libsoup-2.4/CVE-2024-52532-1.patch        |  36 +++
 .../libsoup-2.4/CVE-2024-52532-2.patch        |  42 +++
 .../libsoup/libsoup-2.4_2.74.2.bb             |   3 +
 .../libsoup/libsoup/CVE-2024-52530.patch      | 149 +++++++++
 .../libsoup/libsoup/CVE-2024-52532-1.patch    |  36 +++
 .../libsoup/libsoup/CVE-2024-52532-2.patch    |  42 +++
 meta/recipes-support/libsoup/libsoup_3.0.7.bb |   6 +-
 scripts/install-buildtools                    |   4 +-
 32 files changed, 1395 insertions(+), 37 deletions(-)
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2024-52533.patch
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2024-46951.patch
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2024-46952.patch
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2024-46953.patch
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2024-46955.patch
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2024-46956.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0001-fix-mm-page_alloc-fix-tracepoint-mm_page_alloc_zone_.patch
 rename meta/recipes-kernel/wireless-regdb/{wireless-regdb_2024.07.04.bb => wireless-regdb_2024.10.07.bb} (94%)
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2023-50008.patch
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2023-51793.patch
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2023-51794.patch
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-31578.patch
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-31582.patch
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-32230.patch
 create mode 100644 meta/recipes-sato/webkit/webkitgtk/0d3344e17d258106617b0e6d783d073b188a2548.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2024-52530.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2024-52532-1.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2024-52532-2.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup/CVE-2024-52530.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup/CVE-2024-52532-1.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup/CVE-2024-52532-2.patch

-- 
2.34.1


