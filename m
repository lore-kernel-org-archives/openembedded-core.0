Return-Path: <schnitzeltony@gmail.com>
Received: from mail-it1-f193.google.com (mail-it1-f193.google.com
	[209.85.166.193])
	by mail.openembedded.org (Postfix) with ESMTP id 1787C7D670
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Apr 2019 20:25:08 +0000 (UTC)
Received: by mail-it1-f193.google.com with SMTP id z17so11705362itc.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 05 Apr 2019 13:25:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=e162lC8Bveo2w+KnxPmhW/8lWoX2xhLVr2mgq9e+QVI=;
	b=UmQ8JXZeN4wDAVLIkg61n98g3DW4bScs1nHbzhykqSSt/jd7lDF/UV5B3K26L1+9IL
	KXuOAp3IdH6Pu18ahAYYf75SW+XShoMV9dy+25LySGo3fYMV4pRSYPuDzzu0OE6+d77A
	CcCdrEj7uWs756UgZ3qkQWNPv2BIC8+/1DEyIGhQ6HzwOMyqRC6DTthsx3CgZqJKH7z0
	vLPL1STEQo/Y/clxqiFE9wvJ46EEC8sy6G48tLAwaB1TIDw0ZEhdT1JRZWbOgxvY5ckh
	nhPQRc9ycY70NoNWQYCy14XKfhzgY3wJCU8kU0a4lUKgt+otuZ9CyzVoH/wLJpbS+vH8
	eXXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=e162lC8Bveo2w+KnxPmhW/8lWoX2xhLVr2mgq9e+QVI=;
	b=dsIZJOQGW84wkqUEoFDa0VzC1ZdUG5lsw68bcUBGl0RUg9kk1XTEkQd684wlTN9R5G
	9XaKjl2vBy1PUgvdjB3CjMgaLrZjg+n4GO6yDnLJQpEfm8gMwFz/4xO/n+nI4jPp4s4h
	xf8vabyhI44UWwbbUYxc1e7Y8Srs42IdsHaTpzmyX28f7TGPs6V37mt80TKsUDiWyDpj
	mnlS3U7jO0Hb+MkmuDc4jFvvfu4uN0b+Ql2K9zfGghPEXbMDUhzJTfZmoC3GbaMUFNjA
	OVHas4nk7XbaLBRlNEwsXoa8Pia7/atzJbTUXG2rGHT1W1pPikAr4+VdzMB8dRTkDQM9
	+Chg==
X-Gm-Message-State: APjAAAVVuYslzOgcLU5Uf7BwywDHHhIStwbL7RpQRjF3qNH7ku5GadnG
	Yv/TKM+O1sPVgpljwazEWKNQwUQeywY3XzHZp6I=
X-Google-Smtp-Source: APXvYqwQSpTfMrlglmcaiBbhujGdmLF4BVml82mKD3NjvIng4fRtRr12aJVumpxu67v3H1+ygbUAeFQFcVTdKjg5N/w=
X-Received: by 2002:a24:f802:: with SMTP id a2mr9671441ith.24.1554495910152;
	Fri, 05 Apr 2019 13:25:10 -0700 (PDT)
MIME-Version: 1.0
References: <20190405192835.8080-1-schnitzeltony@gmail.com>
	<20190405200546.GB1614@jama>
In-Reply-To: <20190405200546.GB1614@jama>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Fri, 5 Apr 2019 22:24:58 +0200
Message-ID: <CALbNGRR768BW6ePYNr1nS8eLVy7G8CztpGsT6t45ss33BFtS0w@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gstreamer1.0-python: rework gobject-introspection handling
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
X-List-Received-Date: Fri, 05 Apr 2019 20:25:09 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 5, 2019 at 10:05 PM Martin Jansa <martin.jansa@gmail.com> wrote=
:
>
> On Fri, Apr 05, 2019 at 09:28:35PM +0200, Andreas M=C3=BCller wrote:
> > gobject-introspection is mandatory for gstreamer1.0-python - there is n=
o
> > configure option to enable or disable it.
> >
> > To handle properly, this patch does:
> >
> > * Make 'gobject-introspection-data' a required distro feature
> > * Add
> >   'UNKNOWN_CONFIGURE_WHITELIST_append =3D " --enable-introspection --di=
sable-introspection"'
> >    - it was removed in gobject-introspection.bbclass to avoid
> >   | ERROR: libgee-0.18.0-r0 do_configure: QA Issue: libgee: configure w=
as passed unrecognised options: --disable-schemas-install [unknown-configur=
e-option]
> >
> > Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> > ---
> >  .../gstreamer/gstreamer1.0-python_1.14.4.bb                   | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.14=
.4.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.14.4.bb
> > index 8d45ca2668..fb76a37b92 100644
> > --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.14.4.bb
> > +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.14.4.bb
> > @@ -16,6 +16,10 @@ PNREAL =3D "gst-python"
> >
> >  S =3D "${WORKDIR}/${PNREAL}-${PV}"
> >
> > +# gobject-introspection is mandatory and cannot be configured
> > +REQUIRED_DISTRO_FEATURES =3D "gobject-introspection-data"
>
> Is distro_features_check inherited somewhere? I don't see it in this
> part and the above IIRC doesn't work without distro_features_check
> inherit.
>
> Cheers,

At the time you wrote that V2 was prepared :)

I tend to forget that - need to check my meta-gnome patches for that...

Andreas

