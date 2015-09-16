Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 8E73660053
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Sep 2015 10:34:31 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id t8GAYVER012563
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 16 Sep 2015 03:34:31 -0700 (PDT)
Received: from [128.224.162.200] (128.224.162.200) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.235.1;
	Wed, 16 Sep 2015 03:34:30 -0700
Message-ID: <55F945B5.9060007@windriver.com>
Date: Wed, 16 Sep 2015 18:34:29 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.8.0
MIME-Version: 1.0
To: Jussi Kukkonen <jussi.kukkonen@intel.com>
References: <cover.1442370259.git.liezhi.yang@windriver.com>
	<90e4a1064ea7dfa9be458d306bba765136b50306.1442370259.git.liezhi.yang@windriver.com>
	<CAHiDW_Gij3wQ0daYSBetKgBmz-E=DncKUvtP_WJ+O_g-T4vn_w@mail.gmail.com>
In-Reply-To: <CAHiDW_Gij3wQ0daYSBetKgBmz-E=DncKUvtP_WJ+O_g-T4vn_w@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/4] gtk+/cairo: enable x11 or directfb
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 16 Sep 2015 10:34:31 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 09/16/2015 06:25 PM, Jussi Kukkonen wrote:
> On 16 September 2015 at 05:28, Robert Yang <liezhi.yang@windriver.com
> <mailto:liezhi.yang@windriver.com>> wrote:
>  >
>  > The gtk+2 requires whether x11 or directfb to build, so we need enable
>  > either of them. The cairo can be built without x11 or directfb, but gtk+
>  > requires cairo, so enable x11 or directfb for cairo, too.
>
> What is the issue being fixed here? I can see how current config can go wrong in

Make the world build OK when possible, for example, when no x11 in
DISTRO_FEATURE.

> some situations but I'm not sure if the approach "if x11 is not a
> DISTRO_FEATURE, then automatically use direcfb" is much better. Especially for
> cairo: I would have thought building multiple surface backends is a valid choice
> there?

Yes, this is not a perfect solution, I don't like to pull in directfb either.
We can override PACKAGECONFIG to custom the build.

// Robert

>
> Jussi
>
>  > Signed-off-by: Robert Yang <liezhi.yang@windriver.com
> <mailto:liezhi.yang@windriver.com>>
>  > ---
>  >  meta/recipes-gnome/gtk+/gtk+.inc      |    5 ++---
>  >  meta/recipes-graphics/cairo/cairo.inc |    8 ++++++--
>  >  2 files changed, 8 insertions(+), 5 deletions(-)
>  >
>  > diff --git a/meta/recipes-gnome/gtk+/gtk+.inc b/meta/recipes-gnome/gtk+/gtk+.inc
>  > index be5273d..9d697cdb 100644
>  > --- a/meta/recipes-gnome/gtk+/gtk+.inc
>  > +++ b/meta/recipes-gnome/gtk+/gtk+.inc
>  > @@ -17,9 +17,8 @@ X11DEPENDS = "virtual/libx11 libxext libxcursor libxrandr
> libxdamage libxrender
>  >  DEPENDS = "glib-2.0 pango atk jpeg libpng gdk-pixbuf-native
> docbook-utils-native \
>  >   cairo gdk-pixbuf"
>  >
>  > -PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '',
> d)} \
>  > -           ${@bb.utils.contains('DISTRO_FEATURES', 'directfb', 'directfb',
> '', d)} \
>  > -"
>  > +# Requires x11 or directfb
>  > +PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11',
> 'directfb', d)}"
>  >
>  >  PACKAGECONFIG[x11] = "--with-x=yes
> --with-gdktarget=x11,--with-x=no,${X11DEPENDS}"
>  >  # without --with-gdktarget=directfb it will check for cairo-xlib which isn't
> available without X11 DISTRO_FEATURE
>  > diff --git a/meta/recipes-graphics/cairo/cairo.inc
> b/meta/recipes-graphics/cairo/cairo.inc
>  > index 1e45318..f6474bc 100644
>  > --- a/meta/recipes-graphics/cairo/cairo.inc
>  > +++ b/meta/recipes-graphics/cairo/cairo.inc
>  > @@ -17,8 +17,12 @@ LICENSE_${PN}-perf-utils = "GPLv3+"
>  >  X11DEPENDS = "virtual/libx11 libsm libxrender libxext"
>  >  DEPENDS = "libpng fontconfig pixman glib-2.0 zlib"
>  >
>  > -PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11 xcb',
> '', d)} \
>  > -           ${@bb.utils.contains('DISTRO_FEATURES', 'directfb', 'directfb',
> '', d)}"
>  > +# Build cairo-xlib or cairo-directfb for gtk+
>  > +PACKAGECONFIG ??= " ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11
> xcb', 'directfb', d)} \
>  > +                    "
>  > +
>  > +# No directfb-native, so set PACKAGECONFIG to null when no x11
>  > +PACKAGECONFIG_class-native ??= "${@bb.utils.contains('DISTRO_FEATURES',
> 'x11', 'x11', '', d)}"
>  >
>  >  PACKAGECONFIG[x11] = "--with-x=yes -enable-xlib,--with-x=no
> --disable-xlib,${X11DEPENDS}"
>  >  PACKAGECONFIG[xcb] = "--enable-xcb,--disable-xcb,libxcb"
>  > --
>  > 1.7.9.5
>  >
>  > --
>  > _______________________________________________
>  > Openembedded-core mailing list
>  > Openembedded-core@lists.openembedded.org
> <mailto:Openembedded-core@lists.openembedded.org>
>  > http://lists.openembedded.org/mailman/listinfo/openembedded-core

