Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C3DEC48BD1
	for <webhook@archiver.kernel.org>; Mon,  4 Apr 2022 18:46:43 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com
 [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web09.30302.1649039454370883881
 for <openembedded-core@lists.openembedded.org>;
 Sun, 03 Apr 2022 19:30:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=01F3MM/+;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.47,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f47.google.com with SMTP id
 nt14-20020a17090b248e00b001ca601046a4so3687810pjb.0
        for <openembedded-core@lists.openembedded.org>;
 Sun, 03 Apr 2022 19:30:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=AjLgRON4mJJ2GI5ptiUChR8TyjaiwT+LC/u5F5SHWvA=;
        b=01F3MM/+AS/N/0vyKU7oo40+0Hn07lkwj5ozm/+eha+9J37ULZhcxk4zo4gQRgi4sv
         7TbGOhWogyyn+ZEZ5M0x5oVZTEWoDnhy9YF3Jh3SVuSIYqh69s+mOWkc0R0vJP3JZ6UY
         kOID2p5E2BzelnPBKkLHLAfVcN3+lBmABqT54I10E8eVN/QmWaJ3pxx3qb1sdp49VlIY
         D0h+5lQ80OsAnSm77nbyJJ2xrQdlMHT0ndvn6JDShMHlEjTaXaKI1SGkKu3FjZ035vUP
         vK2Zk3dlmUBjViWEQ4Owa/qCG6HBkwpuyi3b1SFi6XYPtWdO03ELhVRoQJwfxl2WNMBi
         Cuyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=AjLgRON4mJJ2GI5ptiUChR8TyjaiwT+LC/u5F5SHWvA=;
        b=FnscEC1qgNoMssMMIAzMlBLWF8rUfQnqHJugcwGFdIa3tNiLQIaECX53+CUFPU9/lA
         Nt36QaRIbXphQk6gRLX+wEzL4NuseR8ga9Zo+dB7GFqElgto3e3KJL+locbKiijEBHLx
         WFqASn3GBt3FBBjB4DzG2eUfyjsXYMmlyEXeNHeB0q9OiGYnmcOgdkY6qlXOC14YBU9c
         Zr73+IEoJv9XhvddoWK5r0qsaIqLRBIW0wE0LW+Q8e6REFin8ZzSaWrthMvHI6FfMxMP
         EkxuuTKGF3JpIQcdDkGNXzSynCLIhqgPGAfT20b0Ud6gZM6w9Y0opvVJJdGU+ZfYqtN8
         q0zA==
X-Gm-Message-State: AOAM531hod/rVqBLT5/HRFlRaEOEv9aTelbMf5kXKb8tCghY+e4RP6+s
	+nIZ0We2SNn0gAFHg7k0tz+ANDpVMBYwawKeA5k=
X-Google-Smtp-Source: 
 ABdhPJyaAG7sh7Vc4gkdl02CFx59WY8ywVkT/3KjNuk8r1K/Ndib5ucZUmWkTXOi7rk2XhqJCYmWcg==
X-Received: by 2002:a17:90b:4a82:b0:1c7:5837:ab5c with SMTP id
 lp2-20020a17090b4a8200b001c75837ab5cmr23953729pjb.55.1649039453231;
        Sun, 03 Apr 2022 19:30:53 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 p26-20020a63951a000000b003826aff3e41sm8471117pgd.33.2022.04.03.19.30.51
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Apr 2022 19:30:52 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 0/8] Patch review
Date: Sun,  3 Apr 2022 16:30:21 -1000
Message-Id: <cover.1649026624.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Apr 2022 18:46:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163972

Please review this set of patches for dunfell and have comments back by end
of day Tuesday.

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/3472

The following changes since commit aa2bb4f62dd7e5c6fdf220264c3d62fbf2cc7d16:

  xserver-xorg: update to 1.20.14 (2022-03-29 11:43:54 -1000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/dunfell-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-nut

Davide Gardenal (1):
  go: backport patch fix for CVE-2021-38297

Martin Jansa (1):
  boost: fix native build with glibc-2.34

Oleksandr Kravchuk (1):
  tzdata: update to 2022a

Peter Kjellerstedt (1):
  python3-jinja2: Correct HOMEPAGE

Ralph Siemsen (2):
  bluez5: fix CVE-2022-0204
  bind: update to 9.11.37

Richard Purdie (1):
  mirrors: Add missing gitsm entries for yocto/oe mirrors

Ross Burton (1):
  grub: ignore CVE-2021-46705

 meta/classes/mirrors.bbclass                  |  2 +
 meta/recipes-bsp/grub/grub2.inc               |  2 +
 .../bind/{bind_9.11.36.bb => bind_9.11.37.bb} |  4 +-
 meta/recipes-connectivity/bluez5/bluez5.inc   |  1 +
 .../bluez5/bluez5/CVE-2022-0204.patch         | 66 +++++++++++++
 meta/recipes-devtools/go/go-1.14.inc          |  4 +
 .../go/go-1.14/CVE-2021-38297.patch           | 97 +++++++++++++++++++
 .../python/python3-jinja2_2.11.3.bb           |  2 +-
 meta/recipes-extended/timezone/timezone.inc   |  6 +-
 ...e-warning-with-glibc-2.34-on-Linux-p.patch | 32 ++++++
 ...-elide-a-warning-that-caused-Solaris.patch | 24 +++++
 meta/recipes-support/boost/boost_1.72.0.bb    |  2 +
 12 files changed, 236 insertions(+), 6 deletions(-)
 rename meta/recipes-connectivity/bind/{bind_9.11.36.bb => bind_9.11.37.bb} (97%)
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5/CVE-2022-0204.patch
 create mode 100644 meta/recipes-devtools/go/go-1.14/CVE-2021-38297.patch
 create mode 100644 meta/recipes-support/boost/boost/0001-Fix-Wsign-compare-warning-with-glibc-2.34-on-Linux-p.patch
 create mode 100644 meta/recipes-support/boost/boost/0001-Revert-change-to-elide-a-warning-that-caused-Solaris.patch

-- 
2.25.1


