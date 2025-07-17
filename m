Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E28CC83F1A
	for <webhook@archiver.kernel.org>; Thu, 17 Jul 2025 09:56:24 +0000 (UTC)
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
 by mx.groups.io with SMTP id smtpd.web10.44723.1752746183411985943
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Jul 2025 02:56:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LKHwefmW;
 spf=pass (domain: gmail.com, ip: 209.85.219.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-6fabb948e5aso8557056d6.1
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Jul 2025 02:56:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752746182; x=1753350982; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=D3QgfZt9hhiZOxRWADOUHXWAoHN0z/IPvH7/q9yPkmQ=;
        b=LKHwefmWxXjST8VOxxwmQVpKia3wXqogf6KN2EBFwI+OaOjhn3h96+P3tZs2XLdrpJ
         cUzY6ryG1pKEgUiKIhdWNrod9RlRuNkA1A28YgmYyFDwN0epDMLGOQmXuHQhDdXhodsB
         Ur+NKzBxOykfVqXgYMn2B1Ogs1ilDaCJd72T2KHgovZFlckcPb3clCqXOf/kvoE7iD2m
         qfPX0oNTN87fLEt5OjCwxlpVt47uZI+1FNMFWHdKh3+STjuK1Gfj2O9WzqUzeTqHi5xs
         oWBl1pG3J9DOP7wS2V5pWhvWmlXHjdFbKz/sPF3dIBSndxoiM3CPq2X291si576K1jT4
         ahyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752746182; x=1753350982;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D3QgfZt9hhiZOxRWADOUHXWAoHN0z/IPvH7/q9yPkmQ=;
        b=d2kCcPiWGCAqyYPasTmJUTbUmDUhd5ZeHwvID04iQoXn61tHZZZoardvWHT9yXlD0i
         CZokbD0j++SS5c2ZCLn/gdFJBw6dhSGlisJZiotGCmnWZjeceDifVh6GmmDSu+8hL88J
         Gjqd0ERdiUQjlKXs3aGFeAZVzYyM9XoAM8T6cEhoOY2M19kT9EnDQPnDEcXPmxg7lh6R
         qkU7p9AzYtUyblzBbIrKn/yLuJXNQC6kviHRGe/OSl1diBPIFCQvXa7TejOAaIC54tj+
         hESBoNla3CFpJ1N+iDP0hgAJlxykqzynWI4Zb45PYTLaUAhDgmDFkfwEN9XREM+xJOoe
         xl5Q==
X-Forwarded-Encrypted: i=1; AJvYcCWTb7prOV0Rfp1VMdAWIrDyQqeOSSqz9bR5SUvHCmRryHdcIA9GaxQm7ndenmzCw4TtMqN9DgKLQdouXHpQiJv+EQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwdV+SaMjOYUsn0R8rirRloqwCj5YXOQZVc8ddrdimp2niV3VSG
	+IBRFRJZEfbt3cv0Ol07mU/hVkzl5tlo0GHDQqzr3Jy6wMhdBniZWGS0L/EpIC2NeoBVvO72oym
	Q2FoUXOx6cwDNEGfcP6ZsGxjJvQvu3dk=
X-Gm-Gg: ASbGncvtcNJ6i1VNJXsv1jp7Sr3BRpA0JCwe71yS2DOBPk5XlWmbyO9HxQM/kAcEz8T
	4bYicaGKD9JdZRkjnYEcgX29VhfoGGlGnJw+cR3j/lUTGZWXleLyOTX5tQyJbhjOAfVhAOEtq7j
	BPDJnnt5w4uZrJruPA69AF+5jko20juPgJjDAsX9RFYpsYWNgU1NMSI0hqXHKXPETQSTk0EdX7+
	HI+
X-Google-Smtp-Source: AGHT+IGUsD2RvNb+/kSXvxLqcD1Xh46YEZ8wi3sUEIDaui2ZEhbqRDnaYgGpt3LyUm5I/Nqu6cePN+Kw8a3PswSrGPk=
X-Received: by 2002:a05:6214:4498:b0:704:f103:4e52 with SMTP id
 6a1803df08f44-704f6ae2111mr111736076d6.23.1752746182102; Thu, 17 Jul 2025
 02:56:22 -0700 (PDT)
MIME-Version: 1.0
References: <20250716232931.127811-1-hiagofranco@gmail.com>
 <20250716232931.127811-2-hiagofranco@gmail.com> <1853013D626CB3EF.8991@lists.openembedded.org>
In-Reply-To: <1853013D626CB3EF.8991@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 17 Jul 2025 11:56:10 +0200
X-Gm-Features: Ac12FXwC8PcpdZQxxhiWp4GTWRznnmbJNWR7jI_xwQx4scCNyxFLRjuQaN1hFxw
Message-ID: <CANNYZj8ea7jCLUjeu9oUz6itjS2M3fvxPHf6J_ZJTs2CpEjRFA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] systemd: drop build dependency on util-linux
To: alex.kanavin@gmail.com
Cc: Hiago De Franco <hiagofranco@gmail.com>, openembedded-core@lists.openembedded.org, 
	Chen Qi <Qi.Chen@windriver.com>, Hiago De Franco <hiago.franco@toradex.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Jul 2025 09:56:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220529

Ah nevermind. The dependency was already there, it's just converted
from floating to explicit?

Alex

On Thu, 17 Jul 2025 at 11:54, Alexander Kanavin via
lists.openembedded.org <alex.kanavin=gmail.com@lists.openembedded.org>
wrote:
>
> I don't understand. The backported patch adds a meson option, but not
> any uses of it. Why is it needed?
>
> Alex
>
> On Thu, 17 Jul 2025 at 01:29, Hiago De Franco <hiagofranco@gmail.com> wrote:
> >
> > From: Hiago De Franco <hiago.franco@toradex.com>
> >
> > The libmount dependency was made optional on systemd upstream [2]. By
> > backporting this upstream change, we can drop util-linux as a build
> > dependency for systemd, making it only as a runtime dependency.
> >
> > This is important to fix a circular dependency between util-linux and
> > systemd when util-linux is built with the systemd PACKAGECONFIG enabled.
> > Without this change, each recipe depends on the other, triggering the
> > circular dependency error.
> >
> > [1] https://github.com/systemd/systemd/blob/main/README#L216
> > [2] https://github.com/systemd/systemd/commit/d1ee3889cf8e8a9edc82e41d306155fb4c531c8f
> >
> > Signed-off-by: Hiago De Franco <hiago.franco@toradex.com>
> > ---
> >  .../0001-meson-Add-libmount-feature.patch     | 58 +++++++++++++++++++
> >  meta/recipes-core/systemd/systemd_257.6.bb    |  7 ++-
> >  2 files changed, 63 insertions(+), 2 deletions(-)
> >  create mode 100644 meta/recipes-core/systemd/systemd/0001-meson-Add-libmount-feature.patch
> >
> > diff --git a/meta/recipes-core/systemd/systemd/0001-meson-Add-libmount-feature.patch b/meta/recipes-core/systemd/systemd/0001-meson-Add-libmount-feature.patch
> > new file mode 100644
> > index 000000000000..b04acd6fef08
> > --- /dev/null
> > +++ b/meta/recipes-core/systemd/systemd/0001-meson-Add-libmount-feature.patch
> > @@ -0,0 +1,58 @@
> > +From 821c809e1e1e449f5a2fe591d6aae1343b141b6c Mon Sep 17 00:00:00 2001
> > +From: Daan De Meyer <daan.j.demeyer@gmail.com>
> > +Date: Thu, 5 Jun 2025 11:05:08 +0200
> > +Subject: [PATCH] meson: Add libmount feature
> > +
> > +Let's reduce the dependencies required to build just libsystemd by
> > +making libmount optional. The meson disabler feature makes this quite
> > +trivial.
> > +
> > +Upstream-Status: Backport [d1ee3889cf8e8a9edc82e41d306155fb4c531c8f]
> > +Signed-off-by: Hiago De Franco <hiago.franco@toradex.com>
> > +---
> > + meson.build       | 4 +++-
> > + meson_options.txt | 2 ++
> > + tools/oss-fuzz.sh | 2 +-
> > + 3 files changed, 6 insertions(+), 2 deletions(-)
> > +
> > +diff --git a/meson.build b/meson.build
> > +index 957e00ecad..594fadbb37 100644
> > +--- a/meson.build
> > ++++ b/meson.build
> > +@@ -1179,7 +1179,9 @@ else
> > + endif
> > +
> > + libmount = dependency('mount',
> > +-                      version : fuzzer_build ? '>= 0' : '>= 2.30')
> > ++                      version : fuzzer_build ? '>= 0' : '>= 2.30',
> > ++                      disabler : true,
> > ++                      required : get_option('libmount'))
> > +
> > + libfdisk = dependency('fdisk',
> > +                       version : '>= 2.32',
> > +diff --git a/meson_options.txt b/meson_options.txt
> > +index f30b3f5238..f292732d62 100644
> > +--- a/meson_options.txt
> > ++++ b/meson_options.txt
> > +@@ -471,6 +471,8 @@ option('dbus', type : 'feature', deprecated : { 'true' : 'enabled', 'false' : 'd
> > +        description : 'libdbus support (for tests only)')
> > + option('libarchive', type : 'feature',
> > +        description : 'libarchive support')
> > ++option('libmount', type : 'feature',
> > ++       description : 'libmount support')
> > +
> > + option('bootloader', type : 'feature', deprecated : { 'true' : 'enabled', 'false' : 'disabled' },
> > +        description : 'sd-boot/stub and userspace tools')
> > +diff --git a/tools/oss-fuzz.sh b/tools/oss-fuzz.sh
> > +index df3d39eba6..b7a70207df 100755
> > +--- a/tools/oss-fuzz.sh
> > ++++ b/tools/oss-fuzz.sh
> > +@@ -32,7 +32,7 @@ meson_args=("-Db_lundef=false")
> > + if [ -z "$FUZZING_ENGINE" ]; then
> > +     meson_args+=("-Dllvm-fuzz=true")
> > + else
> > +-    meson_args+=("-Doss-fuzz=true" "--auto-features=disabled")
> > ++    meson_args+=("-Doss-fuzz=true" "--auto-features=disabled" "-Dlibmount=enabled")
> > +
> > +     apt-get update
> > +     apt-get install -y gperf m4 gettext python3-pip \
> > diff --git a/meta/recipes-core/systemd/systemd_257.6.bb b/meta/recipes-core/systemd/systemd_257.6.bb
> > index 9092d02c5109..d73c0cfe0d8b 100644
> > --- a/meta/recipes-core/systemd/systemd_257.6.bb
> > +++ b/meta/recipes-core/systemd/systemd_257.6.bb
> > @@ -4,7 +4,7 @@ PROVIDES = "udev"
> >
> >  PE = "1"
> >
> > -DEPENDS = "gperf-native libcap util-linux python3-jinja2-native"
> > +DEPENDS = "gperf-native libcap python3-jinja2-native"
> >
> >  SECTION = "base/shell"
> >
> > @@ -29,6 +29,7 @@ SRC_URI += " \
> >             file://0001-binfmt-Don-t-install-dependency-links-at-install-tim.patch \
> >             file://0002-implment-systemd-sysv-install-for-OE.patch \
> >             file://0001-Do-not-create-var-log-README.patch \
> > +           file://0001-meson-Add-libmount-feature.patch \
> >             "
> >
> >  # patches needed by musl
> > @@ -81,6 +82,7 @@ PACKAGECONFIG ??= " \
> >      idn \
> >      ima \
> >      kmod \
> > +    libmount \
> >      localed \
> >      logind \
> >      machined \
> > @@ -172,6 +174,7 @@ PACKAGECONFIG[kmod] = "-Dkmod=enabled,-Dkmod=disabled,kmod,libkmod"
> >  PACKAGECONFIG[ldconfig] = "-Dldconfig=true,-Dldconfig=false,,ldconfig"
> >  PACKAGECONFIG[libidn] = "-Dlibidn=enabled,-Dlibidn=disabled,libidn,,libidn"
> >  PACKAGECONFIG[libidn2] = "-Dlibidn2=enabled,-Dlibidn2=disabled,libidn2,,libidn2"
> > +PACKAGECONFIG[libmount] = "-Dlibmount=enabled,-Dlibmount=disabled,util-linux,util-linux-mount util-linux-umount"
> >  # Link udev shared with systemd helper library.
> >  # If enabled the udev package depends on the systemd package (which has the needed shared library).
> >  PACKAGECONFIG[link-udev-shared] = "-Dlink-udev-shared=true,-Dlink-udev-shared=false"
> > @@ -742,7 +745,7 @@ FILES:${PN} = " ${base_bindir}/* \
> >
> >  FILES:${PN}-dev += "${base_libdir}/security/*.la ${datadir}/dbus-1/interfaces/ ${sysconfdir}/rpm/macros.systemd"
> >
> > -RDEPENDS:${PN} += "kmod ${VIRTUAL-RUNTIME_dbus} util-linux-mount util-linux-umount udev (= ${EXTENDPKGV}) systemd-udev-rules util-linux-agetty util-linux-fsck util-linux-swaponoff util-linux-mkswap"
> > +RDEPENDS:${PN} += "kmod ${VIRTUAL-RUNTIME_dbus} udev (= ${EXTENDPKGV}) systemd-udev-rules util-linux-agetty util-linux-fsck util-linux-swaponoff util-linux-mkswap"
> >  RDEPENDS:${PN} += "systemd-serialgetty"
> >  RDEPENDS:${PN} += "volatile-binds"
> >
> > --
> > 2.39.5
> >
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#220528): https://lists.openembedded.org/g/openembedded-core/message/220528
> Mute This Topic: https://lists.openembedded.org/mt/114194829/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

