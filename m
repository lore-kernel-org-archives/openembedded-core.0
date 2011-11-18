Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RRC67-00048n-NT
	for openembedded-core@lists.openembedded.org;
	Fri, 18 Nov 2011 01:14:27 +0100
Received: by bkbzs2 with SMTP id zs2so2752752bkb.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Nov 2011 16:08:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=ORZ/+WGvJz7UUFiCLODovIz21tIWgMFPl2IsLt8XSo8=;
	b=TmE+TWgICOM3z3p0W39jhVgu0G7wglwLQjUxrGW5WiXaXLPtQeqQ1g8pnnOVlN3ax5
	nU29ugBEU123XNBYk69C1y98CWXEZ7DxvZtg0qxtxiu2bjOmfKUsL5s+m5jrYVx88k++
	YFXOyFCdMaGztMFpI5wZ5nQFgr8O1RWremUU8=
MIME-Version: 1.0
Received: by 10.204.156.6 with SMTP id u6mr640844bkw.135.1321574882358; Thu,
	17 Nov 2011 16:08:02 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.204.26.143 with HTTP; Thu, 17 Nov 2011 16:08:02 -0800 (PST)
In-Reply-To: <1321570027-29390-1-git-send-email-msm@freescale.com>
References: <1321570027-29390-1-git-send-email-msm@freescale.com>
Date: Thu, 17 Nov 2011 22:08:02 -0200
X-Google-Sender-Auth: Iqd4i6dAJnd7kFrpRMUjOSF2vUY
Message-ID: <CAP9ODKqjGqLg3u-VzFBAqhVSDUBUwG5eFSTtZcv+Zo7mnPLEAQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Remove ttyS* from /etc/inittab that are not present
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 18 Nov 2011 00:14:27 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

NACK!


This enforces online use so won't work for read-only-fs.

Please use SERIAL_CONSOLE value to write iniitab but supporting offline use

On Thu, Nov 17, 2011 at 20:47, Matthew McClintock <msm@freescale.com> wrote=
:
> This will prevent error message that pop up when the serial
> port is not present
> ---
> This seems quite hacky to me, but we have an issue where if we remove
> a serial port from the device tree the serial port won't work.
>
> It seems link it's still in /dev/ttySN but it's not configured properly.
> I looked for udev rules and items in /proc and /sys to try to use but
> I did not see anything...
>
> Is there a better approach than this?
>
> =A0.../sysvinit/sysvinit-inittab_2.88dsf.bb =A0 =A0 =A0 =A0 =A0 | =A0 19 =
++++++++++++++++++-
> =A01 files changed, 18 insertions(+), 1 deletions(-)
>
> diff --git a/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb b/met=
a/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb
> index 3a716d7..3031442 100644
> --- a/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb
> +++ b/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb
> @@ -2,7 +2,7 @@ DESCRIPTION =3D "Inittab for sysvinit"
> =A0LICENSE =3D "GPLv2"
> =A0LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D751419260aa954499f7abaabaa8=
82bbe"
>
> -PR =3D "r6"
> +PR =3D "r7"
>
> =A0SRC_URI =3D "file://COPYING \
> =A0 =A0 =A0 =A0 =A0 =A0file://inittab"
> @@ -56,6 +56,23 @@ EOF
> =A0 =A0 fi
> =A0}
>
> +pkg_postinst_${PN} () {
> +# run this on the target
> +if [ "x$D" =3D=3D "x" ]; then
> + =A0 =A0 =A0 tmp=3D"${SERIAL_CONSOLES}"
> + =A0 =A0 =A0 for i in $tmp
> + =A0 =A0 =A0 do
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 j=3D`echo ${i} | sed s/^.*\;//g`
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if [ -z "`dmesg | grep ${j}`" ]; then
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 sed -i /^.*${j}$/d /etc/ini=
ttab
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 fi
> + =A0 =A0 =A0 done
> + =A0 =A0 =A0 kill -HUP 1
> +fi
> +
> +exit 1
> +}
> +
> =A0# USE_VT and SERIAL_CONSOLE are generally defined by the MACHINE .conf=
.
> =A0# Set PACKAGE_ARCH appropriately.
> =A0PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> --
> 1.7.6.1
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>



--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


