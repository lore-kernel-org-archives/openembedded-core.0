Return-Path: <otavio.salvador@gmail.com>
Received: from mail-oa0-f42.google.com (mail-oa0-f42.google.com
	[209.85.219.42])
	by mail.openembedded.org (Postfix) with ESMTP id 899876BF4E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jan 2014 11:22:45 +0000 (UTC)
Received: by mail-oa0-f42.google.com with SMTP id n16so1026195oag.15
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jan 2014 03:22:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=kn1HclNL+7RAyUT8TH9moYqBcUFaZeqmPAV5hagsw0I=;
	b=PjT/hjn45ENajzsV+++Xvqb+OJjpBoG+c9JjYoV8vijy6Qu8iu2fHUQiYDzblUZASg
	Kwxvrpag26io1lyfmMIanNVJqd5ts8UIVhJ6DluEUbM74Gp75oG7tgGhnZzNXEog/Kch
	LKPB/PSF3+vVZzeeVf8O7FQD00ztt88pIhpRNS5LVlLMAGmB1ueQEStr/oB5PLg9r1r+
	ZM/uLL9+yyswJ1ZmKL7Nd3l3YVlXl3v0dpl8HVMKNFYi66k4nfQu/d1FCncU4qYDZ/Gt
	0uXst5qTlKCRUd34j4g/0imRpoVgKmd1DACUGw6SWJe05ufUpqmGqa3U3WvNENiefeFS
	7ZZA==
MIME-Version: 1.0
X-Received: by 10.60.99.8 with SMTP id em8mr1362906oeb.8.1389784966362; Wed,
	15 Jan 2014 03:22:46 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.182.232.166 with HTTP; Wed, 15 Jan 2014 03:22:46 -0800 (PST)
In-Reply-To: <1389780926-20901-1-git-send-email-koen.kooi@linaro.org>
References: <1389780926-20901-1-git-send-email-koen.kooi@linaro.org>
Date: Wed, 15 Jan 2014 09:22:46 -0200
X-Google-Sender-Auth: H0MdpLDO5tP5TsTYgtzFvWNjWO4
Message-ID: <CAP9ODKoCuuPHq2OyktCAX9C5tpWwjStJR4qJMEq8_fCheb2Y6g@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Koen Kooi <koen.kooi@linaro.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] grub git: workaround debugedit problems for 64 bit targets
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
X-List-Received-Date: Wed, 15 Jan 2014 11:22:45 -0000
Content-Type: multipart/alternative; boundary=047d7b33cad23bfa1304f00087e3

--047d7b33cad23bfa1304f00087e3
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Jan 15, 2014 at 8:15 AM, Koen Kooi <koen.kooi@linaro.org> wrote:

> I've limited it to 64bit targets, but to be honest debug splitting doesn't
> make sense for grub since it won't run in your rootfs and attaching gdb is
> pretty much impossible.
>
> Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
>

I'd prefer to remove the debug systems than skip the split. What others
think?


> ---
>  meta/recipes-bsp/grub/grub_git.bb | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/meta/recipes-bsp/grub/grub_git.bb b/meta/recipes-bsp/grub/
> grub_git.bb
> index 1796e7f..bc79cfa 100644
> --- a/meta/recipes-bsp/grub/grub_git.bb
> +++ b/meta/recipes-bsp/grub/grub_git.bb
> @@ -51,8 +51,13 @@ do_configure_prepend() {
>  do_install_append () {
>      install -d ${D}${sysconfdir}/grub.d
>      install -m 0755 ${WORKDIR}/40_custom
> ${D}${sysconfdir}/grub.d/40_custom
> +
>  }
>

Please remove this.


> +# debugedit chokes on 64 bit platforms
> +INHIBIT_PACKAGE_DEBUG_SPLIT_aarch64 = "1"
> +INHIBIT_PACKAGE_DEBUG_SPLIT_x86-64 = "1"
> +
>  RDEPENDS_${PN} = "diffutils freetype"
>  FILES_${PN}-dbg += "${libdir}/${BPN}/*/.debug"
>
> --
> 1.8.4.2
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>



-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

--047d7b33cad23bfa1304f00087e3
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><br><div class=3D"gmail=
_quote">On Wed, Jan 15, 2014 at 8:15 AM, Koen Kooi <span dir=3D"ltr">&lt;<a=
 href=3D"mailto:koen.kooi@linaro.org" target=3D"_blank">koen.kooi@linaro.or=
g</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">I&#39;ve limited it to 64bit targets, but to=
 be honest debug splitting doesn&#39;t make sense for grub since it won&#39=
;t run in your rootfs and attaching gdb is pretty much impossible.<br>

<br>
Signed-off-by: Koen Kooi &lt;<a href=3D"mailto:koen.kooi@linaro.org">koen.k=
ooi@linaro.org</a>&gt;<br></blockquote><div><br></div><div>I&#39;d prefer t=
o remove the debug systems than skip the split. What others think?</div>
<div>=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;=
border-left:1px #ccc solid;padding-left:1ex">
---<br>
=A0meta/recipes-bsp/grub/<a href=3D"http://grub_git.bb" target=3D"_blank">g=
rub_git.bb</a> | 5 +++++<br>
=A01 file changed, 5 insertions(+)<br>
<br>
diff --git a/meta/recipes-bsp/grub/<a href=3D"http://grub_git.bb" target=3D=
"_blank">grub_git.bb</a> b/meta/recipes-bsp/grub/<a href=3D"http://grub_git=
.bb" target=3D"_blank">grub_git.bb</a><br>
index 1796e7f..bc79cfa 100644<br>
--- a/meta/recipes-bsp/grub/<a href=3D"http://grub_git.bb" target=3D"_blank=
">grub_git.bb</a><br>
+++ b/meta/recipes-bsp/grub/<a href=3D"http://grub_git.bb" target=3D"_blank=
">grub_git.bb</a><br>
@@ -51,8 +51,13 @@ do_configure_prepend() {<br>
=A0do_install_append () {<br>
=A0 =A0 =A0install -d ${D}${sysconfdir}/grub.d<br>
=A0 =A0 =A0install -m 0755 ${WORKDIR}/40_custom ${D}${sysconfdir}/grub.d/40=
_custom<br>
+<br>
=A0}<br></blockquote><div><br></div><div>Please remove this.</div><div>=A0<=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-le=
ft:1px #ccc solid;padding-left:1ex">
+# debugedit chokes on 64 bit platforms<br>
+INHIBIT_PACKAGE_DEBUG_SPLIT_aarch64 =3D &quot;1&quot;<br>
+INHIBIT_PACKAGE_DEBUG_SPLIT_x86-64 =3D &quot;1&quot;<br>
+<br>
=A0RDEPENDS_${PN} =3D &quot;diffutils freetype&quot;<br>
=A0FILES_${PN}-dbg +=3D &quot;${libdir}/${BPN}/*/.debug&quot;<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
1.8.4.2<br>
<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" target=3D"_blank">http://lists.openembedded.org/mailman/listinfo/openembe=
dded-core</a><br>
</font></span></blockquote></div><br><br clear=3D"all"><div><br></div>-- <b=
r>Otavio Salvador =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 O=
.S. Systems<br><a href=3D"http://www.ossystems.com.br" target=3D"_blank">ht=
tp://www.ossystems.com.br</a> =A0 =A0 =A0 =A0<a href=3D"http://code.ossyste=
ms.com.br" target=3D"_blank">http://code.ossystems.com.br</a><br>
<span>Mobile: +55 (53) 9981-7854 =A0 =A0 =A0 =A0 =A0 =A0Mobile: <span id=3D=
"gc-number-4" class=3D"gc-cs-link" title=3D"Call with Google Voice">+1 (347=
) 903-9750</span></span><br>
</div></div>

--047d7b33cad23bfa1304f00087e3--
