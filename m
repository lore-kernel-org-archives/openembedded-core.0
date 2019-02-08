Return-Path: <obi@opendreambox.org>
X-Greylist: delayed 367 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 08 Feb 2019 17:53:03 UTC
Received: from mail.dream-property.net (mail.dream-property.net
	[82.149.226.172])
	by mail.openembedded.org (Postfix) with ESMTP id CB0227C3D9
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Feb 2019 17:53:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id 31E8931E71E1;
	Fri,  8 Feb 2019 18:46:57 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id zg8bFOKb6Q4p; Fri,  8 Feb 2019 18:46:55 +0100 (CET)
Received: from localhost (ip-88-152-37-227.hsi03.unitymediagroup.de
	[88.152.37.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id 4E20631E0D76;
	Fri,  8 Feb 2019 18:46:55 +0100 (CET)
Date: Fri, 8 Feb 2019 18:46:53 +0100
From: Andreas Oberritter <obi@opendreambox.org>
To: =?UTF-8?B?QW5kcsOp?= Draszik <git@andred.net>
Message-ID: <20190208184653.33267c90@opendreambox.org>
In-Reply-To: <20190208164832.6047-1-git@andred.net>
References: <20190208164832.6047-1-git@andred.net>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] sysvinit-inittab: support non-busybox-getty on serial consoles
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
X-List-Received-Date: Fri, 08 Feb 2019 17:53:04 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Andr=C3=A9,

On Fri,  8 Feb 2019 16:48:32 +0000
Andr=C3=A9 Draszik <git@andred.net> wrote:

> From: Andr=C3=A9 Draszik <andre.draszik@jci.com>
>=20
> Busybox' getty has code to try to make itself a session leader,
> whereas util-linux' agetty doesn't. It expects this to happen
> from outside.
> When getty is not a session leader, many things don't work on
> the serial console, e.g. setting the terminal process group,
> job control doesn't work, etc.
>=20
> Executing image tests also fails with AssertionErrors, because
>     Feb  5 16:12:55 qemuarm getty[590]: /dev/ttyAMA1: cannot get controll=
ing tty: Operation not permitted
>     Feb  5 16:12:55 qemuarm getty[590]: /dev/ttyAMA1: cannot set process =
group: Inappropriate ioctl for device
>=20
> Update the start_getty script to invoke getty via the setsid
> utility if needed, i.e. if /sbin/getty is not busybox getty.
>=20
> [YOCTO #13058]
>=20
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@jci.com>
>=20
> ---
> v2: fork fewer processes
> ---
>  .../sysvinit/sysvinit-inittab/start_getty          | 14 +++++++++++++-
>  .../sysvinit/sysvinit-inittab_2.88dsf.bb           |  1 +
>  2 files changed, 14 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-core/sysvinit/sysvinit-inittab/start_getty b/me=
ta/recipes-core/sysvinit/sysvinit-inittab/start_getty
> index e15ae35f90..d3ebb84e18 100644
> --- a/meta/recipes-core/sysvinit/sysvinit-inittab/start_getty
> +++ b/meta/recipes-core/sysvinit/sysvinit-inittab/start_getty
> @@ -13,6 +13,18 @@ active_serial=3D$(grep "serial" /proc/tty/drivers | cu=
t -d/ -f1 | sed "s/ *$//")
>  # Rephrase input parameter from ttyS target index (ttyS1, ttyS2, ttyAMA0=
, etc).
>  runtime_tty=3D$(echo $2 | grep -oh '[0-9]')
> =20
> +# busybox' getty does this itself, util-linux' agetty needs extra help
> +getty=3D"/sbin/getty"
> +case $(readlink -f "${getty}") in
> +    */busybox*)
> +        ;;
> +    *)
> +        if [ -x "/usr/bin/setsid" ] ; then
> +            getty=3D"/usr/bin/setsid ${getty}"
> +        fi
> +        ;;
> +esac
> +
>  # Backup $IFS.
>  DEFAULT_IFS=3D$IFS
>  # Customize Internal Field Separator.
> @@ -31,7 +43,7 @@ for line in $active_serial; do
>  			then
>  				if [ -c /dev/$2 ]
>  				then
> -				    /sbin/getty -L $1 $2 $3
> +				    eval ${getty} -L $1 $2 $3

I think using eval isn't necessary.

Best regards,
Andreas

