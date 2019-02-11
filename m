Return-Path: <armccurdy@gmail.com>
Received: from mail-ua1-f65.google.com (mail-ua1-f65.google.com
	[209.85.222.65])
	by mail.openembedded.org (Postfix) with ESMTP id DBD017C4A0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Feb 2019 18:11:32 +0000 (UTC)
Received: by mail-ua1-f65.google.com with SMTP id j3so3742330uap.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Feb 2019 10:11:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=ky2LWj68Kdcr54hJLeLlaixQw50MhLLvGU8lkKujO6o=;
	b=I35zMPStAia+n446In4W0b+u5WAARMOrnM9ifTT+g9EwcD6b24m4TmabtOdaYpe0dQ
	jg3B3WKxwv8SCix+LAiX6AD8OpympRBnoCv4U6jOlpd+eFMoXXKq/HHqy77sG2ndhvu2
	EMrtNzXfrZ+KrVHHMvWd1CTUexeueZs3CwtiJrU3Bbfz4pwdC7/F2DXwuxt8CAJPUgry
	OSzGBBfRYI+wyGV3zsuv33wPUD72A2Snujc6ehhL4rReZ/Ccqq2BkW2Xk51tO2+IIDeI
	lH/Ycu+hgeh3YjQBoStbozdJuhJ3vaM9Q8Pt4WEkEhLllprcKDJb/jgVDuYuK+qu/j5X
	IMAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=ky2LWj68Kdcr54hJLeLlaixQw50MhLLvGU8lkKujO6o=;
	b=KcPPJcGjSd6ib2UY2gps03i5Ke028DKL+EQyC3Xg5iSvds4V+oNplOYS31G8n83k4q
	7OQ4un0LmO1wb+VNEHLlKwzPwtIGdMbFOPwWG+rvCgatA3oLhLFRqR93OhyRseQPP2JY
	t5xPK4fCzR40d1FtPVe+maXKw6DxhQqylIPVoOKQUKAY25kjNBKjKowWrTGVDF2RuWer
	3sXDZNX/HImwpVBtc/1ig+IwQ2SxcMnYYZYCCPSybXjj+hpfcm8NkTZxHm15g8eQNf1Z
	/KSX10vBk8gGEkZ3BEv0vOIfLvm+X62ubRsVtpFXDxJ03eI4zYtJPCc2ZwxqRRu3oV9C
	k1qw==
X-Gm-Message-State: AHQUAuYqRKXRfwyg10awES7ww76CY1kNquiiG8BgBuoLE9UseWjblOkp
	M1kMFEE6tTfQaDhs+3ClB+aF5sAPAu2cXuvQ8+98EdHd
X-Google-Smtp-Source: AHgI3IZMnvcfdmQOvkdlqI4M4LkKvoFXRQJHIyulK1ErhWVssH1/DUZn9n05Dpm+tvvyF73IIFzTfE3okMZOOdBjV/0=
X-Received: by 2002:a9f:3f41:: with SMTP id i1mr13367846uaj.42.1549908693575; 
	Mon, 11 Feb 2019 10:11:33 -0800 (PST)
MIME-Version: 1.0
References: <20190211112106.4530-1-git@andred.net>
In-Reply-To: <20190211112106.4530-1-git@andred.net>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Mon, 11 Feb 2019 10:11:24 -0800
Message-ID: <CAJ86T=VvSJ1NrRxv8YCjPozcHRCzGN-q=zX0gDiMUS70_ysKvw@mail.gmail.com>
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <git@andred.net>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3] sysvinit-inittab: support non-busybox-getty on serial consoles
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
X-List-Received-Date: Mon, 11 Feb 2019 18:11:33 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 11, 2019 at 3:21 AM Andr=C3=A9 Draszik <git@andred.net> wrote:
> From: Andr=C3=A9 Draszik <andre.draszik@jci.com>
> Busybox' getty has code to try to make itself a session leader,
> whereas util-linux' agetty doesn't. It expects this to happen
> from outside.
> When getty is not a session leader, many things don't work on
> the serial console, e.g. setting the terminal process group,
> job control doesn't work, etc.
>
> Executing image tests also fails with AssertionErrors, because
>     Feb  5 16:12:55 qemuarm getty[590]: /dev/ttyAMA1: cannot get controll=
ing tty: Operation not permitted
>     Feb  5 16:12:55 qemuarm getty[590]: /dev/ttyAMA1: cannot set process =
group: Inappropriate ioctl for device
>
> Update the start_getty script to invoke getty via the setsid
> utility if needed, i.e. if /sbin/getty is not busybox getty.
>
> [YOCTO #13058]
>
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@jci.com>
>
> ---
> v3: also get rid of eval
> v2: fork fewer processes
> ---
>  .../sysvinit/sysvinit-inittab/start_getty          | 14 +++++++++++++-
>  .../sysvinit/sysvinit-inittab_2.88dsf.bb           |  1 +
>  2 files changed, 14 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-core/sysvinit/sysvinit-inittab/start_getty b/me=
ta/recipes-core/sysvinit/sysvinit-inittab/start_getty
> index e15ae35f90..96fd6cfcfd 100644
> --- a/meta/recipes-core/sysvinit/sysvinit-inittab/start_getty
> +++ b/meta/recipes-core/sysvinit/sysvinit-inittab/start_getty
> @@ -13,6 +13,18 @@ active_serial=3D$(grep "serial" /proc/tty/drivers | cu=
t -d/ -f1 | sed "s/ *$//")
>  # Rephrase input parameter from ttyS target index (ttyS1, ttyS2, ttyAMA0=
, etc).
>  runtime_tty=3D$(echo $2 | grep -oh '[0-9]')
>
> +# busybox' getty does this itself, util-linux' agetty needs extra help
> +getty=3D"/sbin/getty"
> +case $(readlink -f "${getty}") in

Maybe directly checking the output of "getty --version" would be even
more efficient than trying to infer busybox -vs- util-linux based on
symlinks?

Checking symlinks will fail if busybox is built with
CONFIG_FEATURE_INDIVIDUAL (which we do have support for in the busybox
recipe... even if no one actually uses it).

> +    */busybox*)
> +        ;;
> +    *)
> +        if [ -x "/usr/bin/setsid" ] ; then
> +            setsid=3D"/usr/bin/setsid"
> +        fi
> +        ;;
> +esac
> +
>  # Backup $IFS.
>  DEFAULT_IFS=3D$IFS
>  # Customize Internal Field Separator.
> @@ -31,7 +43,7 @@ for line in $active_serial; do
>                         then
>                                 if [ -c /dev/$2 ]
>                                 then
> -                                   /sbin/getty -L $1 $2 $3
> +                                   ${setsid:-} ${getty} -L $1 $2 $3
>                                 fi
>                                 break
>                         fi
> diff --git a/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb b/met=
a/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb
> index 8585a418ab..bfd890d924 100644
> --- a/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb
> +++ b/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb
> @@ -20,6 +20,7 @@ do_install() {
>      install -m 0644 ${WORKDIR}/inittab ${D}${sysconfdir}/inittab
>      install -d ${D}${base_bindir}
>      install -m 0755 ${WORKDIR}/start_getty ${D}${base_bindir}/start_gett=
y
> +    sed -e 's,/usr/bin,${bindir},g' -i ${D}${base_bindir}/start_getty
>
>      set -x
>      tmp=3D"${SERIAL_CONSOLES}"
> --
> 2.20.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

