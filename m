Return-Path: <jacob.kroon@gmail.com>
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
	[209.85.166.68])
	by mail.openembedded.org (Postfix) with ESMTP id 3081779491
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Sep 2018 08:18:12 +0000 (UTC)
Received: by mail-io1-f68.google.com with SMTP id c22-v6so10763358iob.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Sep 2018 01:18:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=B3FnVIzEdC5vHC4X23KO7oDhUbyaZJqgZXuYs0Vsq5s=;
	b=I+LqvSkTir8ji7qwWAmjngJA7RJihTQW9L4kYJ5+I6h4T/Lvp97DnHdCE1mAwI0hmf
	qksSUlC/VOXyrCnB9IUOwU6vnrj45ZXBJ00wstjJPHJJy40FWZxDoBzMr7cw8hkRr3AJ
	+q+lrRC6rgRbL5aKQq+IDlVW+if92EF7M06GuQ5PbAeBta3qk/47UFYbedlbFPNGYAq2
	mvEk4iDCOWzQwbT/+sQ5R0Yske5IfP0hyseyYHnRlX7vp7IrNXeje3uCso4702x5bhbn
	E26KskBg2fVuK1Zw6R1KOzdbERHKg2NekJ8oBNVyKzjlubv5cHwFlxP7D3CwSavjFvIy
	tWpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=B3FnVIzEdC5vHC4X23KO7oDhUbyaZJqgZXuYs0Vsq5s=;
	b=O0qRbqs2+JeR/x08fEc/gWc377pMPab17a5u6990cEZQxuOalbPXV5PDYPDmZ/WNg4
	uTumBmCfqmbHoflprHaATYNg+x9eC2MzT7PEnoQo8dsmCMXMGB7iw+cSG3JyHFtMY/f3
	0FWPj22yP6uIGQDTFtGHTLSKir51+MQM0bv9QliBk4MO0Pz6a/Eh3f2ePINyw+PPghD2
	kb6BdWsOdqX+fjHl0Ojp3J27icrFXNKg1WBjIF6Oiky3cVH6Amh0SLzGnItEbLAaGJdl
	8w9682prhWY+oellnhJsivkOqoatd8SPdMfUM3Qbk4T19eWxv2K/N1Q2+Th9DnF2Cn7M
	fmmw==
X-Gm-Message-State: APzg51ASveWQygpWNnuHBXl7HwnpZpriJAZ0pSvB7FrXF65ahHW/DFPL
	BaM5vfEYlZod7mSMjIreFkEL8ysJT17zIf2PSP3iZQ==
X-Google-Smtp-Source: ANB0VdY6XFJ3XTEgerWeJiO6cwGT6I5YknTnwLWbH1xqu3KAgmj7WkT06nipRN/R24ShyZWt7PVxhM0Mrt5AHOrd7JQ=
X-Received: by 2002:a6b:9f46:: with SMTP id
	i67-v6mr18994686ioe.182.1537172293203; 
	Mon, 17 Sep 2018 01:18:13 -0700 (PDT)
MIME-Version: 1.0
References: <20180713124348.5067-1-martin@geanix.com>
In-Reply-To: <20180713124348.5067-1-martin@geanix.com>
From: Jacob Kroon <jacob.kroon@gmail.com>
Date: Mon, 17 Sep 2018 10:18:01 +0200
Message-ID: <CAPbeDCkvgvLnu8bEfvUsWJG5zFhN5=Dv539ysbsm1pAN_XbFKA@mail.gmail.com>
To: martin@geanix.com
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] initscripts: remove warnings on read-only-rootfs (again)
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
X-List-Received-Date: Mon, 17 Sep 2018 08:18:12 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 13, 2018 at 2:44 PM Martin Hundeb=C3=B8ll <martin@geanix.com> w=
rote:
>
> When the populate-volatile.sh initscript tests if a configured symlink
> is already in place, it uses readlink with the '-f' (follow) option:
>
> > [ "$(readlink -f $source)" =3D "$dest" ]
>
> If the test fails, it proceeds to delete the exisiting folder/file, and
> create the configured symlink.
>
> However, the '-f' option to readlink makes it follow symlinks pointing
> at symlinks. If the $dest argument is a symlink, the above test fails,
> and warnings are printed due to changing a read-only rootfs.
>
> This is the case for /tmp, and /etc/resolv.conf:
> > /tmp -> /var/tmp -> /var/volatile/tmp
> > /etc/resolv.conf -> /var/run/resolv.conf -> /run/resolv.conf
>
> Fix the warnings by removing the '-f' option, so that the test matches
> the configuration.
>
> Signed-off-by: Martin Hundeb=C3=B8ll <martin@geanix.com>
> ---
>  .../initscripts/initscripts-1.0/populate-volatile.sh            | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-core/initscripts/initscripts-1.0/populate-volat=
ile.sh b/meta/recipes-core/initscripts/initscripts-1.0/populate-volatile.sh
> index 35316ec2ba..e1fce02906 100755
> --- a/meta/recipes-core/initscripts/initscripts-1.0/populate-volatile.sh
> +++ b/meta/recipes-core/initscripts/initscripts-1.0/populate-volatile.sh
> @@ -80,7 +80,7 @@ mk_dir() {
>  link_file() {
>         EXEC=3D"
>         if [ -L \"$2\" ]; then
> -               [ \"\$(readlink -f \"$2\")\" !=3D \"$1\" ] && { rm -f \"$=
2\"; ln -sf \"$1\" \"$2\"; };
> +               [ \"\$(readlink \"$2\")\" !=3D \"$1\" ] && { rm -f \"$2\"=
; ln -sf \"$1\" \"$2\"; };
>         elif [ -d \"$2\" ]; then
>                 if awk '\$2 =3D=3D \"$2\" {exit 1}' /proc/mounts; then
>                         cp -a $2/* $1 2>/dev/null;
> --
> 2.18.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

ping ?
This patch prevents some warnings related to /tmp and /etc/resolv.conf
from being printed, when using read-only-rootfs. Would be nice to have
the same fix backported to sumo too.

/Jacob

