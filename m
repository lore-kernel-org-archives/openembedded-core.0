Received: from mail-lb0-f175.google.com ([209.85.217.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@gmail.com>) id 1TjgZX-0005wj-PD
	for openembedded-core@lists.openembedded.org;
	Sat, 15 Dec 2012 02:29:48 +0100
Received: by mail-lb0-f175.google.com with SMTP id gg13so3291196lbb.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Dec 2012 17:15:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=znHB5QI37w9iAMi4pIopMvxJKFNf+De7wOrR55MmuDk=;
	b=PTevwwEUv2li73ihdBRWD4CwmgQAdmDMTn1z6jlcBY/be/qDw7QL6T1ZEAEzrwWsum
	KnctCvF4nHFdHYiSx12q/HenUqBREY1CcbioS0Dj1x/DIM2IKtmJMPwRvHZB33MLcShN
	//j+YPZEaJOAU2zpmphkWUEMkbuYTA0fyy+Q101yfzCArcfEhs0itF4J10gXmmI0o2tH
	HkDwy/Jx+79FOVCefNIS5T25jQ7cqv4HzTB+M62gThRPHN2ulGCJLs8UOsMapF5h1FZC
	pT6Dtw8rQ7l6bmYvGhZXUGv7UP/ZQuqBn7TxdKXOmTrcPS6O0vrAKJqzJ01LyMci6SUv
	xwog==
MIME-Version: 1.0
Received: by 10.152.148.129 with SMTP id ts1mr4243165lab.19.1355534110634;
	Fri, 14 Dec 2012 17:15:10 -0800 (PST)
Received: by 10.112.127.35 with HTTP; Fri, 14 Dec 2012 17:15:10 -0800 (PST)
In-Reply-To: <85c9d0997a3446625d74b890d722f039345b6a9e.1355475937.git.Martin.Jansa@gmail.com>
References: <cover.1355475937.git.Martin.Jansa@gmail.com>
	<85c9d0997a3446625d74b890d722f039345b6a9e.1355475937.git.Martin.Jansa@gmail.com>
Date: Fri, 14 Dec 2012 20:15:10 -0500
Message-ID: <CADkTA4Py2VRePEsx+57fU4mrqw2O6Fwhofhi5up2ax1Kahui8w@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 06/10] kernel.bbclass: use the same versioning schema for modules.tgz and provide link to latest
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 15 Dec 2012 01:29:50 -0000
Content-Type: multipart/alternative; boundary=e89a8f22c7012530ea04d0d9e142

--e89a8f22c7012530ea04d0d9e142
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Dec 14, 2012 at 6:40 PM, Martin Jansa <martin.jansa@gmail.com>wrote:

> * so it will work look KERNEL_IMAGE
> * also we were recreating modules.tgz with every kernel build, but
>   overwritting the same output file
>

And I recall that no one ever showed a strong preference for keeping the old
name around via a symlink. So I know that I don't have any objections to
changing
the naming.

Cheers,

Bruce


>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta/classes/kernel.bbclass | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index ee59aaf..9c70e70 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -497,6 +497,10 @@ KERNEL_IMAGE_BASE_NAME ?=
> "${KERNEL_IMAGETYPE}-${PE}-${PV}-${PR}-${MACHINE}-${DA
>  # Don't include the DATETIME variable in the sstate package signatures
>  KERNEL_IMAGE_BASE_NAME[vardepsexclude] = "DATETIME"
>  KERNEL_IMAGE_SYMLINK_NAME ?= "${KERNEL_IMAGETYPE}-${MACHINE}"
> +MODULE_TARBALL_BASE_NAME ?=
> "modules-${PE}-${PV}-${PR}-${MACHINE}-${DATETIME}.tgz"
> +# Don't include the DATETIME variable in the sstate package signatures
> +MODULE_TARBALL_BASE_NAME[vardepsexclude] = "DATETIME"
> +MODULE_TARBALL_SYMLINK_NAME ?= "modules-${MACHINE}.tgz"
>
>  do_uboot_mkimage() {
>         if test "x${KERNEL_IMAGETYPE}" = "xuImage" ; then
> @@ -526,7 +530,8 @@ addtask uboot_mkimage before do_install after
> do_compile
>  kernel_do_deploy() {
>         install -m 0644 ${KERNEL_OUTPUT}
> ${DEPLOYDIR}/${KERNEL_IMAGE_BASE_NAME}.bin
>         if (grep -q -i -e '^CONFIG_MODULES=y$' .config); then
> -               tar -cvzf
> ${DEPLOYDIR}/modules-${KERNEL_VERSION}-${PR}-${MACHINE}.tgz -C ${D} lib
> +               tar -cvzf ${DEPLOYDIR}/${MODULE_TARBALL_BASE_NAME} -C ${D}
> lib
> +               ln -sf ${MODULE_TARBALL_BASE_NAME}.bin
> ${MODULE_TARBALL_SYMLINK_NAME}
>         fi
>
>         cd ${DEPLOYDIR}
> --
> 1.8.0.2
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--e89a8f22c7012530ea04d0d9e142
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<br><div class=3D"gmail_extra"><br><br><div class=3D"gmail_quote">On Fri, D=
ec 14, 2012 at 6:40 PM, Martin Jansa <span dir=3D"ltr">&lt;<a href=3D"mailt=
o:martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com</a>&gt;<=
/span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">* so it will work look KERNEL_IMAGE<br>
* also we were recreating modules.tgz with every kernel build, but<br>
=A0 overwritting the same output file<br></blockquote><div><br></div><div>A=
nd I recall that no one ever showed a strong preference for keeping the old=
</div><div>name around via a symlink. So I know that I don&#39;t have any o=
bjections to changing</div>
<div>the naming.</div><div><br></div><div>Cheers,</div><div><br></div><div>=
Bruce</div><div>=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:=
0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
Signed-off-by: Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@gmail.com">M=
artin.Jansa@gmail.com</a>&gt;<br>
---<br>
=A0meta/classes/kernel.bbclass | 7 ++++++-<br>
=A01 file changed, 6 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass<br>
index ee59aaf..9c70e70 100644<br>
--- a/meta/classes/kernel.bbclass<br>
+++ b/meta/classes/kernel.bbclass<br>
@@ -497,6 +497,10 @@ KERNEL_IMAGE_BASE_NAME ?=3D &quot;${KERNEL_IMAGETYPE}-=
${PE}-${PV}-${PR}-${MACHINE}-${DA<br>
=A0# Don&#39;t include the DATETIME variable in the sstate package signatur=
es<br>
=A0KERNEL_IMAGE_BASE_NAME[vardepsexclude] =3D &quot;DATETIME&quot;<br>
=A0KERNEL_IMAGE_SYMLINK_NAME ?=3D &quot;${KERNEL_IMAGETYPE}-${MACHINE}&quot=
;<br>
+MODULE_TARBALL_BASE_NAME ?=3D &quot;modules-${PE}-${PV}-${PR}-${MACHINE}-$=
{DATETIME}.tgz&quot;<br>
+# Don&#39;t include the DATETIME variable in the sstate package signatures=
<br>
+MODULE_TARBALL_BASE_NAME[vardepsexclude] =3D &quot;DATETIME&quot;<br>
+MODULE_TARBALL_SYMLINK_NAME ?=3D &quot;modules-${MACHINE}.tgz&quot;<br>
<br>
=A0do_uboot_mkimage() {<br>
=A0 =A0 =A0 =A0 if test &quot;x${KERNEL_IMAGETYPE}&quot; =3D &quot;xuImage&=
quot; ; then<br>
@@ -526,7 +530,8 @@ addtask uboot_mkimage before do_install after do_compil=
e<br>
=A0kernel_do_deploy() {<br>
=A0 =A0 =A0 =A0 install -m 0644 ${KERNEL_OUTPUT} ${DEPLOYDIR}/${KERNEL_IMAG=
E_BASE_NAME}.bin<br>
=A0 =A0 =A0 =A0 if (grep -q -i -e &#39;^CONFIG_MODULES=3Dy$&#39; .config); =
then<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 tar -cvzf ${DEPLOYDIR}/modules-${KERNEL_VERSI=
ON}-${PR}-${MACHINE}.tgz -C ${D} lib<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 tar -cvzf ${DEPLOYDIR}/${MODULE_TARBALL_BASE_=
NAME} -C ${D} lib<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 ln -sf ${MODULE_TARBALL_BASE_NAME}.bin ${MODU=
LE_TARBALL_SYMLINK_NAME}<br>
=A0 =A0 =A0 =A0 fi<br>
<br>
=A0 =A0 =A0 =A0 cd ${DEPLOYDIR}<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
1.8.0.2<br>
<br>
<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded=
-core" target=3D"_blank">http://lists.linuxtogo.org/cgi-bin/mailman/listinf=
o/openembedded-core</a><br>
</font></span></blockquote></div><br><br clear=3D"all"><div><br></div>-- <b=
r>&quot;Thou shalt not follow the NULL pointer, for chaos and madness await=
 thee at its end&quot;<br>
</div>

--e89a8f22c7012530ea04d0d9e142--
