Return-Path: <jpewhacker@gmail.com>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 080247FC1F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Nov 2019 01:40:21 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id g206so5520704wme.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Nov 2019 17:40:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=fdSaAcwI1XsRGUJoqePCcQSCritemp9CxgHF0fr7iMw=;
	b=a3CQarBbbHLmpounn1T0WEBM2xFt0BYyVVRia761lPb+0i+DXaE9LpOMM4+IScLhfr
	9aO4WKdfgSNC0bZGZvokZHMSrTKyW7HNlnElGOQ7JXDUHzb7Yc0Mg03kCD5zDDzG9Yrw
	DFJv1Q3gJRw7Mierh7/wwq6FNjnRcXnhouU5Nx0d2m0PslSoEPUe2d961jBfE6SQjHC6
	hgqLY4/PVjP0Mqe0dF/OZtdTXYbWDrWkIiJYlGQkEqPxsFqKRMGxXv/V2Bzgo6uxCQOL
	t6N2GCezRLIv51zKVW+8e7Dnp7ya4UB0aqCNf7p3rHKrHKFD2gJ3yS5eP1a8ovA5Ejmy
	L/Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=fdSaAcwI1XsRGUJoqePCcQSCritemp9CxgHF0fr7iMw=;
	b=lIbMdGzCr5Qf85pPBujrEV9J5mVxgIKjZ7xAQyCoHfip0i16r+8VgEBbjlvdtcbo9I
	uKJNmVqsQiQyVQz0I/G+0+ClUzIvrVpnJSXq47CH2XyECuPbrUT5ejoS69DCy2TRN+m8
	3KfmrfOLxKK+7Fmo7ERUQ7ojuVyhutYqPkLCgYmqdO9tvcCaCTcbhYxWGlugM57pcMgS
	Z+tTNa72mfWaD0rcWhn/XFZC82hHo4STqMVsqr2Qafzbhi/RT2pGQE9Yrb4JIZn8p0T5
	CuLa40IKO//ZrHHUxiDWq0LW+4dxsbrRM3YtgG/LD78qexO4q548vQGfuRmirR9IikyI
	Z5fg==
X-Gm-Message-State: APjAAAUVLPiqSjsbs7IpZLyfbaAjwUIu6mTXUq8zjBscwM+/15RLTY/5
	M3gePtdrrzY3XCakS70XaAz9+BmqYt09B3I0V1s=
X-Google-Smtp-Source: APXvYqyCTA7u73SGohn3phbGZDbQcKQGrRRPt+skKtG9JNeO3enH668BaGjnBoFI6Gbhv4o+JiCuVqhvOLeODP6cnvQ=
X-Received: by 2002:a1c:7e91:: with SMTP id z139mr13594281wmc.15.1574386822535;
	Thu, 21 Nov 2019 17:40:22 -0800 (PST)
MIME-Version: 1.0
References: <20191121165824.1220075-1-JPEWhacker@gmail.com>
	<b8353d8a56480ad4eb725933e3f9c93e5c79d68f.camel@gmail.com>
In-Reply-To: <b8353d8a56480ad4eb725933e3f9c93e5c79d68f.camel@gmail.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Thu, 21 Nov 2019 19:40:11 -0600
Message-ID: <CAJdd5GZAEX_tUx7MaKffyUZnCtLB52hTO4p8wHNB0kOu61qYDg@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] librsvg: Fix build reproducibility
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
X-List-Received-Date: Fri, 22 Nov 2019 01:40:22 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Nov 21, 2019 at 7:14 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> On Thu, 2019-11-21 at 10:58 -0600, Joshua Watt wrote:
> > librsvg was encoding the path to the build directory in order to find
> > a
> > font file for testing. This wouldn't work in OE anyway since the
> > build
> > directory isn't present at that exact location on the target, so
> > remove
> > the offending path to make the build reproducible.
> >
> > Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> > ---
> >  .../0001-Remove-non-reproducible-SRCDIR.patch | 30
> > +++++++++++++++++++
> >  meta/recipes-gnome/librsvg/librsvg_2.40.20.bb |  1 +
> >  2 files changed, 31 insertions(+)
> >  create mode 100644 meta/recipes-gnome/librsvg/librsvg/0001-Remove-
> > non-reproducible-SRCDIR.patch
> >
> > diff --git a/meta/recipes-gnome/librsvg/librsvg/0001-Remove-non-
> > reproducible-SRCDIR.patch b/meta/recipes-gnome/librsvg/librsvg/0001-
> > Remove-non-reproducible-SRCDIR.patch
> > new file mode 100644
> > index 00000000000..75fc7f9d0b9
> > --- /dev/null
> > +++ b/meta/recipes-gnome/librsvg/librsvg/0001-Remove-non-
> > reproducible-SRCDIR.patch
> > @@ -0,0 +1,30 @@
> > +From bea5156cd7e7122715b26c769c35928141a1da2c Mon Sep 17 00:00:00
> > 2001
> > +From: Joshua Watt <JPEWhacker@gmail.com>
> > +Date: Mon, 18 Nov 2019 14:46:34 -0600
> > +Subject: [PATCH] Remove non-reproducible SRCDIR
> > +
> > +Removes SRCDIR as the prefix for finding the test font. This
> > wouldn't
> > +work anyway, since that path is not present on the target.
> > +
> > +This patch is specific to OE, since it appears that this entire
> > method
> > +of testing was removed when upstream was re-written in rust
> > +
> > +Upstream-Status: Inappropriate [OE-specific, no longer present
> > upstream]
>
> what replaced it ( just curious ), can we backport the fix that removed
> it or made obsolete ?

A significant portion of the library was re-written in rust. This code
appears to be only for internal testing and wasn't preserved when it
was re-written (at least I couldn't find it in my cursory inspection).
We haven't been able to upgrade the library due to lack of rust
support in oe-core.

>
> > +Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> > +---
> > + rsvg-cairo-draw.c | 2 +-
> > + 1 file changed, 1 insertion(+), 1 deletion(-)
> > +
> > +diff --git a/rsvg-cairo-draw.c b/rsvg-cairo-draw.c
> > +index caa9104..cfb7ed2 100644
> > +--- a/rsvg-cairo-draw.c
> > ++++ b/rsvg-cairo-draw.c
> > +@@ -398,7 +398,7 @@ set_font_options_for_testing (PangoContext
> > *context)
> > + static void
> > + create_font_config_for_testing (RsvgCairoRender *render)
> > + {
> > +-    const char *font_path = SRCDIR
> > "/tests/resources/LiberationSans-Regular.ttf";
> > ++    const char *font_path = "/tests/resources/LiberationSans-
> > Regular.ttf";
> > +
> > +     if (render->font_config_for_testing != NULL)
> > +         return;
> > diff --git a/meta/recipes-gnome/librsvg/librsvg_2.40.20.bb
> > b/meta/recipes-gnome/librsvg/librsvg_2.40.20.bb
> > index 7f98127fd01..6dd0533a5de 100644
> > --- a/meta/recipes-gnome/librsvg/librsvg_2.40.20.bb
> > +++ b/meta/recipes-gnome/librsvg/librsvg_2.40.20.bb
> > @@ -20,6 +20,7 @@ inherit gnomebase gtk-doc pixbufcache upstream-
> > version-is-even gobject-introspec
> >
> >  SRC_URI += "file://gtk-option.patch \
> >              file://0001-Auto-detect-Bsymbolic-fixes-configure-on-
> > macOS.patch \
> > +            file://0001-Remove-non-reproducible-SRCDIR.patch \
> >  "
> >
> >  SRC_URI[archive.md5sum] = "4949d313b0c5d9161a5c259104af5568"
> > --
> > 2.23.0
> >
>

