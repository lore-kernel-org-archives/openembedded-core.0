Received: from mail-la0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@gmail.com>) id 1TczHk-0006ZY-Fj
	for openembedded-core@lists.openembedded.org;
	Mon, 26 Nov 2012 15:03:47 +0100
Received: by mail-la0-f47.google.com with SMTP id u2so8041998lag.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Nov 2012 05:49:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=lG3K1gnnEQbs6ur8HS4O3Rw5Hwba+JnyVUkkqTs5YMY=;
	b=GmeartsYAzucvX7xUzIimKEWGbeA6ambpLPQzC6XcsI5KzJwxjMfeaHqEkZEGuMPKU
	T+a1hQKaNvQkGv684RLDEk74pZce7hPl3cOAAMDbAzAD/t7S7giRVZC6k6ZHtWcFIZyR
	xx5Yzx8Mb9uUmuaF0PKtJwYIAnkH1PefrmmSWTFVCYkWTYlInRt3jbH1pf5Pa0095NTJ
	LqI3k5G3CFYIEuQXm3HstLVwclN01hA2jhgbiVKbt7dkMaDnvNjbv4FV3on+uMW+JMsh
	WoapTHaHYBR2Ge7PUcBLDml2LFfbjLIooX+RpM2aq5/CaKMsdSXtsP5GobREaQ0PDuhv
	lsqg==
MIME-Version: 1.0
Received: by 10.112.17.234 with SMTP id r10mr5155786lbd.72.1353937772460; Mon,
	26 Nov 2012 05:49:32 -0800 (PST)
Received: by 10.114.17.8 with HTTP; Mon, 26 Nov 2012 05:49:32 -0800 (PST)
In-Reply-To: <1353933452-13251-1-git-send-email-Martin.Jansa@gmail.com>
References: <1348318001-18232-1-git-send-email-Martin.Jansa@gmail.com>
	<1353933452-13251-1-git-send-email-Martin.Jansa@gmail.com>
Date: Mon, 26 Nov 2012 08:49:32 -0500
Message-ID: <CADkTA4N2mbhBgh4o3W9mwa3Jg7ohZEB13FsEGoOLQZ04t1fAcQ@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] kernel.bbclass: use the same versioning schema for modules.tgz and provide link to latest
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
X-List-Received-Date: Mon, 26 Nov 2012 14:03:47 -0000
Content-Type: multipart/alternative; boundary=bcaec5540740f9bcc804cf663386

--bcaec5540740f9bcc804cf663386
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Nov 26, 2012 at 7:37 AM, Martin Jansa <martin.jansa@gmail.com>wrote:

> * so it will work look KERNEL_IMAGE
> * also we were recreating modules.tgz with every kernel build, but
>   overwritting the same output file
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
>

Just a quick question, are there any concerns about existing users of the
old tgz name ? Obviously, if they were in oe-core, we'd know about them
and update them, but I have no idea myself how much (if anything) was based
on the old name. I'm not sure of the best practices oe-core/oe uses for
cases
like this in the past, so I thought I'd ask.

The old shorter name was nice, but I agree that having it different than
the image
name makes it non obvious how to associate the image and modules, and that's
a nice thing to fix.

Since we are already making a symlink, I guess we could consider
a transnational
symlink with the old name ? (but then again, if the link is there, people
will continue
to have dependencies on it and not update their own code).

Cheers,

Bruce


>         fi
>
>         cd ${DEPLOYDIR}
> --
> 1.8.0
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

--bcaec5540740f9bcc804cf663386
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 26, 2012 at 7:37 AM, Martin Jansa <span dir=3D"ltr">&lt;<a href=
=3D"mailto:martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com=
</a>&gt;</span> wrote:<br><div class=3D"gmail_extra"><div class=3D"gmail_qu=
ote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-le=
ft:1px #ccc solid;padding-left:1ex">
* so it will work look KERNEL_IMAGE<br>
* also we were recreating modules.tgz with every kernel build, but<br>
=A0 overwritting the same output file<br>
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
LE_TARBALL_SYMLINK_NAME}<br></blockquote><div><br></div><div>Just a quick q=
uestion, are there any concerns about existing users of the</div><div>old t=
gz name ?=A0Obviously,=A0if they were in oe-core, we&#39;d know about them<=
/div>
<div>and update them, but I have no idea myself how much (if anything) was =
based</div><div>on the old name. I&#39;m not sure of the best=A0practices o=
e-core/oe uses for cases</div><div>like this in the past, so I thought I&#3=
9;d ask.=A0</div>
<div><br></div><div>The old shorter name was nice, but I agree that having =
it different than the image</div><div>name makes it non obvious how to asso=
ciate the image and modules, and that&#39;s</div><div>a nice thing to fix.<=
/div>
<div><br></div><div>Since we are already making a symlink, I guess we could=
 consider a=A0transnational</div><div>symlink with the old name ? (but then=
 again, if the link is there, people will continue</div><div>to have depend=
encies on it and not update their own code).</div>
<div><br></div><div>Cheers,</div><div><br></div><div>Bruce</div><div>=A0</d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left=
:1px #ccc solid;padding-left:1ex">
=A0 =A0 =A0 =A0 fi<br>
<br>
=A0 =A0 =A0 =A0 cd ${DEPLOYDIR}<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
1.8.0<br>
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

--bcaec5540740f9bcc804cf663386--
