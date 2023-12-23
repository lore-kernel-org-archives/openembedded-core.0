Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC15CC3DA6E
	for <webhook@archiver.kernel.org>; Sat, 23 Dec 2023 19:14:32 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web11.12811.1703358863483005431
 for <openembedded-core@lists.openembedded.org>;
 Sat, 23 Dec 2023 11:14:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=jgXemAQ1;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A7C6260005;
	Sat, 23 Dec 2023 19:14:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1703358861;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mGJuRmyFOeqlnMWfXHpkLd7wfu3UuX1EMdrqRN4mZpw=;
	b=jgXemAQ1jTPWt530lXrOzDa8hDY/x82zCsb8bFQTvCEE4DPQnn24QaF3LUV+XQ92rgLmvJ
	MokjXaO/mtEjQSxFD8qeIWBdzOSKmFlcKtKoD9arWtSBqleHwrokt2+t2eO24bUXn2mD94
	vFRlJEyzjpFuF/CTA4Z5pq/dtYZOjq+dC0mLLK/82+ppyJHCfjKVD6+udNNc/ChotId9QW
	aBloX2p0UMP/mPGACVyXgl5wZTunPjml22zR/FYnMZTBuBDhVPOW5hwIPRaDeQJdixer5L
	bFI6eEDIZrZOohx6q6mx3W2hzkiDS1RlwtNQoIxtku6H7ipL4LiAZVnn8GL02A==
Date: Sat, 23 Dec 2023 20:14:20 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
	Alexander Kanavin <alex@linutronix.de>
Subject: Re: [OE-core] [PATCH 2/2] appstream: update 0.16.3 -> 1.0.1
Message-ID: <202312231914204d4fef80@mail.local>
References: <20231222104631.3810007-1-alex@linutronix.de>
 <20231222104631.3810007-2-alex@linutronix.de>
 <2023122304561596a0e7fb@mail.local>
 <CANNYZj_vi5MSHMSEDhXmoK_w55Voh_ZsO-05eX96=zsH565wtA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANNYZj_vi5MSHMSEDhXmoK_w55Voh_ZsO-05eX96=zsH565wtA@mail.gmail.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 23 Dec 2023 19:14:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192885

On 23/12/2023 09:57:51+0100, Alexander Kanavin wrote:
> Thanks, there's a working patch from Markus that just landed in master.
> 

Yes, I tested it earlier but you had a better version ;)

> Alex
> 
> On Sat, 23 Dec 2023 at 05:56, Alexandre Belloni
> <alexandre.belloni@bootlin.com> wrote:
> >
> >
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/108/builds/5512/steps/12/logs/errors
> >
> > On 22/12/2023 11:46:31+0100, Alexander Kanavin wrote:
> > > Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> > > ---
> > >  ...-meson-do-not-rely-on-an-exe-wrapper.patch | 36 -------------------
> > >  .../0001-remove-hardcoded-path.patch          | 28 ++++++++-------
> > >  ...appstream_0.16.3.bb => appstream_1.0.1.bb} | 10 +++---
> > >  3 files changed, 19 insertions(+), 55 deletions(-)
> > >  delete mode 100644 meta/recipes-support/appstream/appstream/0001-meson-do-not-rely-on-an-exe-wrapper.patch
> > >  rename meta/recipes-support/appstream/{appstream_0.16.3.bb => appstream_1.0.1.bb} (78%)
> > >
> > > diff --git a/meta/recipes-support/appstream/appstream/0001-meson-do-not-rely-on-an-exe-wrapper.patch b/meta/recipes-support/appstream/appstream/0001-meson-do-not-rely-on-an-exe-wrapper.patch
> > > deleted file mode 100644
> > > index d4f2951e7a9..00000000000
> > > --- a/meta/recipes-support/appstream/appstream/0001-meson-do-not-rely-on-an-exe-wrapper.patch
> > > +++ /dev/null
> > > @@ -1,36 +0,0 @@
> > > -From 79bf322768990b28c29a9d907edcca52ff48e0b8 Mon Sep 17 00:00:00 2001
> > > -From: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
> > > -Date: Wed, 26 Jul 2023 23:21:10 +0400
> > > -Subject: meson: do not rely on an exe wrapper
> > > -MIME-Version: 1.0
> > > -Content-Type: text/plain; charset=UTF-8
> > > -Content-Transfer-Encoding: 8bit
> > > -
> > > -Signed-off-by: Marc-Andr� Lureau <marcandre.lureau@redhat.com>
> > > -
> > > -Upstream-Status: Backport [https://github.com/ximion/appstream/commit/79bf322768990b28c29a9d907edcca52ff48e0b8]
> > > ----
> > > - data/meson.build | 7 +++++++
> > > - 1 file changed, 7 insertions(+)
> > > -
> > > -diff --git a/data/meson.build b/data/meson.build
> > > -index aea0cb25..ec0e434f 100644
> > > ---- a/data/meson.build
> > > -+++ b/data/meson.build
> > > -@@ -7,6 +7,13 @@ install_data('its/metainfo.its',
> > > - install_data('its/metainfo.loc',
> > > -               install_dir: join_paths(get_option('datadir'), 'gettext', 'its'))
> > > -
> > > -+# Do not rely on an exe wrapper for rel-info, use the system one in that case
> > > -+if meson.is_cross_build()
> > > -+    dependency('appstream', version: '>=' + as_version, native: true,
> > > -+               not_found_message: 'Native appstream required for cross-building')
> > > -+    ascli_exe = find_program('appstreamcli')
> > > -+endif
> > > -+
> > > - # NOTE: We do not translate the release notes on purpose here.
> > > - # If you do want to give translators a chance to translate them,
> > > - # ascli news-to-metainfo needs to produce a temporary file to translate
> > > ---
> > > -2.41.0
> > > -
> > > diff --git a/meta/recipes-support/appstream/appstream/0001-remove-hardcoded-path.patch b/meta/recipes-support/appstream/appstream/0001-remove-hardcoded-path.patch
> > > index 9cbfaca82f1..8f4cf1b82a4 100644
> > > --- a/meta/recipes-support/appstream/appstream/0001-remove-hardcoded-path.patch
> > > +++ b/meta/recipes-support/appstream/appstream/0001-remove-hardcoded-path.patch
> > > @@ -1,4 +1,4 @@
> > > -From 6ab00a4279823829a9b82dc9e4d055da4de88c6e Mon Sep 17 00:00:00 2001
> > > +From 93bc5c1b221e5a10c65d4a055181dc818dfe1aa8 Mon Sep 17 00:00:00 2001
> > >  From: Markus Volk <f_l_k@t-online.de>
> > >  Date: Mon, 12 Dec 2022 15:42:42 +0100
> > >  Subject: [PATCH] remove hardcoded path
> > > @@ -9,23 +9,25 @@ Dont include hardcoded path. This fixes:
> > >  | cc1: error: include location "/usr/include" is unsafe for cross-compilation [-Werror=poison-system-directories]
> > >
> > >  Upstream-Status: Inappropriate [oe-specific]
> > > +
> > >  ---
> > > - meson.build       | 2 +-
> > > - 1 files changed, 1 insertions(+), 1 deletions(-)
> > > + meson.build | 4 ++--
> > > + 1 file changed, 2 insertions(+), 2 deletions(-)
> > >
> > >  diff --git a/meson.build b/meson.build
> > > -index fd0e3373..2f273ada 100644
> > > +index 0556b1e..d66919f 100644
> > >  --- a/meson.build
> > >  +++ b/meson.build
> > > -@@ -124,7 +124,7 @@ if get_option ('gir')
> > > -     dependency('gobject-introspection-1.0', version: '>=1.56')
> > > - endif
> > > -
> > > --stemmer_inc_dirs = include_directories(['/usr/include'])
> > > -+stemmer_inc_dirs = include_directories([''])
> > > +@@ -185,10 +185,10 @@ endif
> > > + stemmer_inc_dirs = include_directories()
> > >   if get_option('stemming')
> > >       stemmer_lib = cc.find_library('stemmer', required: true)
> > > +-    stemmer_inc_dirs = include_directories(['/usr/include'])
> > > ++    stemmer_inc_dirs = include_directories()
> > >       if not cc.has_header('libstemmer.h')
> > > ---
> > > -2.34.1
> > > -
> > > +         if cc.has_header('libstemmer/libstemmer.h')
> > > +-            stemmer_inc_dirs = include_directories('/usr/include/libstemmer')
> > > ++            stemmer_inc_dirs = include_directories()
> > > +         else
> > > +             error('Unable to find Snowball header "libstemmer.h". Please ensure libstemmer/Snowball is installed properly in order to continue.')
> > > +         endif
> > > diff --git a/meta/recipes-support/appstream/appstream_0.16.3.bb b/meta/recipes-support/appstream/appstream_1.0.1.bb
> > > similarity index 78%
> > > rename from meta/recipes-support/appstream/appstream_0.16.3.bb
> > > rename to meta/recipes-support/appstream/appstream_1.0.1.bb
> > > index bde679e256a..7723800bab8 100644
> > > --- a/meta/recipes-support/appstream/appstream_0.16.3.bb
> > > +++ b/meta/recipes-support/appstream/appstream_1.0.1.bb
> > > @@ -24,12 +24,10 @@ inherit meson gobject-introspection gettext gtk-doc pkgconfig vala
> > >  GIR_MESON_OPTION = "gir"
> > >  GTKDOC_MESON_OPTION = "apidocs"
> > >
> > > -SRC_URI = " \
> > > -     https://www.freedesktop.org/software/appstream/releases/AppStream-${PV}.tar.xz \
> > > -     file://0001-remove-hardcoded-path.patch \
> > > -     file://0001-meson-do-not-rely-on-an-exe-wrapper.patch \
> > > -"
> > > -SRC_URI[sha256sum] = "081c917646e94d7221c9e4aae54dacda95a27c607fa93cd8e6344a2b318b98b1"
> > > +SRC_URI = "https://www.freedesktop.org/software/appstream/releases/AppStream-${PV}.tar.xz \
> > > +           file://0001-remove-hardcoded-path.patch \
> > > +           "
> > > +SRC_URI[sha256sum] = "fa4d5994e5c6f22e9b66cb0b52e8b5f5d96e7353ea5528b56436e0150829203b"
> > >
> > >  S = "${WORKDIR}/AppStream-${PV}"
> > >
> > > --
> > > 2.39.2
> > >
> >
> > >
> > > 
> > >
> >
> >
> > --
> > Alexandre Belloni, co-owner and COO, Bootlin
> > Embedded Linux and Kernel engineering
> > https://bootlin.com

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#192881): https://lists.openembedded.org/g/openembedded-core/message/192881
> Mute This Topic: https://lists.openembedded.org/mt/103316474/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

