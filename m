Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-pa0-f45.google.com (mail-pa0-f45.google.com
	[209.85.220.45])
	by mail.openembedded.org (Postfix) with ESMTP id 573C473425
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Feb 2015 07:55:46 +0000 (UTC)
Received: by mail-pa0-f45.google.com with SMTP id rd3so10497502pab.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Feb 2015 23:55:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=oxaNCpBZlW3g3hYE7rsWtAS6g0PeWWF3MEHIt+nEouM=;
	b=vBe6BMBqr5ASF0dzIUa2gdh8n2v6ElO5btYnWxGKyyI5gRyu4N+YDEaejzFeWjgU5J
	ep54NGgRAMV7BqrOn302bFvKyIIH47xb54AQIGfibovF+93vB4PJFIYf99dBYxmwpmFC
	gNQPO1lV+fekZN3eFg2xEqTKj8EryjOH4roRPOV20zqqGAZia7nKyFgDAwHULpXqAs5o
	6qqBXUp1sW8MjrLKICmOTkphI1EVWceRSx4P3Vf3FQzPJxZKdMqMZst1hpE91r8VH3ok
	OxvCq2uRFowNRElJRfkmrUYT5uAYmKsqlNwJYHYtAGQfafMokHfgrn50paeovbhp1M9u
	+Q/g==
MIME-Version: 1.0
X-Received: by 10.66.124.137 with SMTP id mi9mr13058698pab.144.1423814147833; 
	Thu, 12 Feb 2015 23:55:47 -0800 (PST)
Received: by 10.70.36.36 with HTTP; Thu, 12 Feb 2015 23:55:47 -0800 (PST)
In-Reply-To: <1423807195-7087-5-git-send-email-schnitzeltony@googlemail.com>
References: <1423807195-7087-1-git-send-email-schnitzeltony@googlemail.com>
	<1423807195-7087-5-git-send-email-schnitzeltony@googlemail.com>
Date: Fri, 13 Feb 2015 08:55:47 +0100
Message-ID: <CALbNGRS7v=no8hJMsoLJrQmd8tyPCmUJC7gaHM8jXCUV3b3U9w@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/6] initial add fontforge(-native) 20141126
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
X-List-Received-Date: Fri, 13 Feb 2015 07:55:47 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 13, 2015 at 6:59 AM, Andreas M=C3=BCller
<schnitzeltony@googlemail.com> wrote:
> had this in my private layer but think it could be useful here.
>
> Native tests: liberation-fonts (follow-up patch) / oxygen-fonts
> Target test: gumstix overo / xfce image
>
> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
> ---
>  .../fontforge/fontforge_20141126.bb                | 43 ++++++++++++++++=
++++++
>  1 file changed, 43 insertions(+)
>  create mode 100644 meta/recipes-graphics/fontforge/fontforge_20141126.bb
>
> diff --git a/meta/recipes-graphics/fontforge/fontforge_20141126.bb b/meta=
/recipes-graphics/fontforge/fontforge_20141126.bb
> new file mode 100644
> index 0000000..835aa9b
> --- /dev/null
> +++ b/meta/recipes-graphics/fontforge/fontforge_20141126.bb
> @@ -0,0 +1,43 @@
> +SUMMARY =3D "A font editor"
> +HOMEPAGE =3D "http://fontforge.github.io/en-US/"
> +LICENSE =3D "GPLv3"
> +LIC_FILES_CHKSUM =3D " \
> +    file://COPYING.gplv3;md5=3Dd32239bcb673463ab874e80d47fae504 \
> +    file://LICENSE;md5=3D71d636ba7678baa1573e1b531041386e \
> +"
> +
> +inherit autotools pkgconfig pythonnative mime
> +
> +DEPENDS =3D "glib-2.0 pango giflib tiff libxml2 jpeg python libtool"
Oops - just noticed that tiff is in meta-oe and even worse there was a
discussion about moving tiff to oe-core long time ago [1]. Now the
situation has changed slightly: To open upgrade path for
liberation-fonts we need fontforge.

I see 3 ways to go:

1. Have tiff in oe-core
2. Have fontforge without tiff in oe-core. There seems to be a
configure option disabling tiiff. This could be overridden in meta-oe.
I have no idea if disabling tiff turns fontforge to useless condition
from liberation-fonts's perspective.
3. Have fontforge in meta-oe and forget about upgrading liberation-fonts.

Thoughts?

Andreas

