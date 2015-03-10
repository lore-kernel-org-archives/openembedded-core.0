Return-Path: <armccurdy@gmail.com>
Received: from mail-ob0-f173.google.com (mail-ob0-f173.google.com
	[209.85.214.173])
	by mail.openembedded.org (Postfix) with ESMTP id BD7F173A9A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Mar 2015 22:32:28 +0000 (UTC)
Received: by obcva8 with SMTP id va8so5083304obc.8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Mar 2015 15:32:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=7XOzgkIjCV2HUsxf1zNBeN7q1mSZtNBgrfVdhR4Ajhw=;
	b=pnrmzmoLRnD7sphS0GQe/E8OJG6+hasrKX+z7QCDjsbRG8klwwuxj+B7tsforGUMad
	8UKyuz5Msrd7ra5IhxC16HqcIvXEOrFHfZQv+8DKDhcd0NRdrvUzhX618gWbeB2sYah6
	jij0xLX6bVyLBAWK8jL5mVZbNLxjKHLjboYZi9/JkHKVKkBFx9G9CB6pMf67y3mwBvb6
	nY6BEtxMa0Sxt59oxDcJCjS1+pJoyRwK5ZqSUOHg3wnP+nNjGGHeatW7BUaOqy4p0eKX
	gJlE8/Ei+KhDXGDEB0u6ltBF1Lf8trDIMF6nSCEX+tC8puW0qsRxYn/HcICOYru5mv78
	GkEg==
MIME-Version: 1.0
X-Received: by 10.60.134.237 with SMTP id pn13mr18356296oeb.59.1426026749481; 
	Tue, 10 Mar 2015 15:32:29 -0700 (PDT)
Received: by 10.202.217.69 with HTTP; Tue, 10 Mar 2015 15:32:29 -0700 (PDT)
In-Reply-To: <1426025096-24078-1-git-send-email-florian.boor@kernelconcepts.de>
References: <1426025096-24078-1-git-send-email-florian.boor@kernelconcepts.de>
Date: Tue, 10 Mar 2015 15:32:29 -0700
Message-ID: <CAJ86T=WvZ=cU2GCQ=P3XPar-WhQvhZFX0MbPcL7ahtkiW8xrhA@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
To: Florian Boor <florian.boor@kernelconcepts.de>
Cc: Florian Boor <florian@kernelconcepts.de>,
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] directfb: Allow native builds of directfb 1.7.6
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
X-List-Received-Date: Tue, 10 Mar 2015 22:32:28 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Mar 10, 2015 at 3:04 PM, Florian Boor
<florian.boor@kernelconcepts.de> wrote:
> From: Florian Boor <florian@kernelconcepts.de>
>
> Required by some DirectFB applications like dfbsee.
>
> Signed-off-by: Florian Boor <florian@kernelconcepts.de>
> ---
>  meta/recipes-graphics/directfb/directfb_1.7.6.bb |   14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>
> diff --git a/meta/recipes-graphics/directfb/directfb_1.7.6.bb b/meta/recipes-graphics/directfb/directfb_1.7.6.bb
> index d25d987..7acb7e6 100644
> --- a/meta/recipes-graphics/directfb/directfb_1.7.6.bb
> +++ b/meta/recipes-graphics/directfb/directfb_1.7.6.bb
> @@ -19,3 +19,17 @@ LEAD_SONAME = "libdirectfb-1.7.so.0"
>
>  SRC_URI[md5sum] = "8a7bb06b3f58599b230b4cf314004512"
>  SRC_URI[sha256sum] = "44f32bacfb842ea234599532f8481fe41b5bd2310d2bd101508eb3a5df26c9e1"
> +
> +BBCLASSEXTEND = "native"
> +DEPENDS_class-native = "jpeg-native libpng-native"

Are you sure that excluding tslib-native from DEPENDS works? Since
-lts is hardcoded in LDFLAGS (see directfb.inc) the linker won't run
unless libts.so is found in sysroot (regardless of whether or not you
configure with "--with-inputdrivers=none"). That being said, I don't
know if -lts really needs to be hardcoded in LDFLAGS, it's been there
since directfb was first imported into oe-core, with no explanation of
comment.

> +EXTRA_OECONF_class-native = "\
> +  --enable-freetype=no \
> +  --disable-zlib \
> +  --with-gfxdrivers=none \
> +  --disable-sdl \
> +  --disable-vnc \
> +  --disable-x11 \
> +  --disable-imlib2 \
> +  --disable-mesa \
> +  --with-inputdrivers=none \
> +"
> --
> 1.7.10.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

