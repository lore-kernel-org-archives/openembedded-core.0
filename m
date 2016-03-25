Return-Path: <net147@gmail.com>
Received: from mail-ig0-f181.google.com (mail-ig0-f181.google.com
	[209.85.213.181])
	by mail.openembedded.org (Postfix) with ESMTP id 222056FEE0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Mar 2016 06:28:54 +0000 (UTC)
Received: by mail-ig0-f181.google.com with SMTP id l20so7975045igf.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Mar 2016 23:28:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=S2Lr3jeuG8XXab7n6ZXDvgNU6OM3s1tu1cuMBJRHp1c=;
	b=iyMV3ouadfIoeCK9o6pX1AaT0yi2WRH1ZcCKHtTAeiutrItX7TdUTj1q3tUL1+Tf+C
	ku2xpt7P+488PL8dHFBZHDKcCc4x4OGditqV4KqyHqZ0d8ZL9ZarnXnE+NWOiPuopgK3
	ZIVfVCD303FDWFo9y+hCN+EVisIc0gGtYrp4Ykthkj1qaky0zvy8FtiHXjHMsq75nqgq
	hb2pUs7Wkdaft4Pf+EgrjoAycFGs1zRrShywN7XGSoCCqFbXvfU71Ljau+Y1j8OCsUUs
	Y7Ns1BBYsoowN4tLcwLAOYO5qCHClYEZvthyGeFmFB1lsBO4iNGsw8hrysBFV1OibYb6
	E8GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=S2Lr3jeuG8XXab7n6ZXDvgNU6OM3s1tu1cuMBJRHp1c=;
	b=elqa9tY1R2jS8PPFH3H1dYpZG2Y5SeoJ/Bv4mD4yxe7k9p+Kgaw4xkTg48+SjkZzI+
	OS74cJ8DMNwoJsenCzg/hlw0ebjqnAcCWMJkGR4KHEiZFhOgVumJ0vkv32RA1jI9oD9z
	4FFiMGS9kOOMy+MtqGywK8Uv397dPSdTDfO/kJWtPKu6OLbNWw77ZgJiqkWMsF3MNO+Z
	VrZ89dUAF+Ef7rop/Ar40GGaNVVgkgmCClN2kXcRerrFygx34q7Fe2kGoLX6XW+L6F06
	emND5wLg8d3PH+3wqNN9Tb9fbvwKq/6ISwwRKEV77GaEeDW7gYI/oIg531UAV0qbSgtS
	e3yQ==
X-Gm-Message-State: AD7BkJLtvxOHb8aXFRtetthEC7y2qib5F+W2iaGJJwI+22tXjy2OytSAFGw9Z95BXNgpI25GkgfkXn7WLG91VQ==
MIME-Version: 1.0
X-Received: by 10.50.107.101 with SMTP id hb5mr28241948igb.7.1458887335307;
	Thu, 24 Mar 2016 23:28:55 -0700 (PDT)
Received: by 10.36.69.12 with HTTP; Thu, 24 Mar 2016 23:28:55 -0700 (PDT)
In-Reply-To: <1455460403.16142.405.camel@linuxfoundation.org>
References: <1455460403.16142.405.camel@linuxfoundation.org>
Date: Fri, 25 Mar 2016 17:28:55 +1100
Message-ID: <CANwerB0R-j5v2_vuSJHFvKOpLuvdxnw3X+2DQKDfoc258twH4w@mail.gmail.com>
From: Jonathan Liu <net147@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gdb: Rationalise PACKAGECONFIG
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
X-List-Received-Date: Fri, 25 Mar 2016 06:28:55 -0000
Content-Type: text/plain; charset=UTF-8

Hi Richard,

On 15 February 2016 at 01:33, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> Having two separate PACKAGECONFIG defaults and settings in two separate
> files is confusing. Move all to the common inc file.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>
> diff --git a/meta/recipes-devtools/gdb/gdb-common.inc b/meta/recipes-devtools/gdb/gdb-common.inc
> index 06272a9..0d28ee4 100644
> --- a/meta/recipes-devtools/gdb/gdb-common.inc
> +++ b/meta/recipes-devtools/gdb/gdb-common.inc
> @@ -45,6 +45,8 @@ EXTRA_OECONF = "--disable-gdbtk --disable-tui --disable-x --disable-werror \
>  PACKAGECONFIG ??= "readline"
>  # Use --without-system-readline to compile with readline 5.
>  PACKAGECONFIG[readline] = "--with-system-readline,--without-system-readline,readline"
> +PACKAGECONFIG[python] = "--with-python=${WORKDIR}/python,--without-python,python,python python-codecs"
> +PACKAGECONFIG[babeltrace] = "--with-babeltrace,--without-babeltrace,babeltrace"
>
>  GDBPROPREFIX = "--program-prefix=''"
>
> diff --git a/meta/recipes-devtools/gdb/gdb_7.10.1.bb b/meta/recipes-devtools/gdb/gdb_7.10.1.bb
> index cd52e27..f897e12 100644
> --- a/meta/recipes-devtools/gdb/gdb_7.10.1.bb
> +++ b/meta/recipes-devtools/gdb/gdb_7.10.1.bb
> @@ -3,10 +3,6 @@ require gdb-${PV}.inc
>
>  inherit python-dir
>
> -PACKAGECONFIG ??= ""
> -PACKAGECONFIG[python] = "--with-python=${WORKDIR}/python,--without-python,python,python python-codecs"
> -PACKAGECONFIG[babeltrace] = "--with-babeltrace,--without-babeltrace,babeltrace"
> -
>  do_configure_prepend() {
>         if [ -n "${@bb.utils.contains('PACKAGECONFIG', 'python', 'python', '', d)}" ]; then
>                 cat > ${WORKDIR}/python << EOF
>
>

This change causes Python support to not be enabled properly in
gdb-cross and gdb-cross-canadian as --without-python is now added to
the EXTRA_OECONF after --with-python=...

I have submitted patches to the mailing list to fix this.

Regards,
Jonathan

