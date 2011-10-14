Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1REj78-0007d4-5R
	for openembedded-core@lists.openembedded.org;
	Fri, 14 Oct 2011 16:51:58 +0200
Received: by bkat8 with SMTP id t8so2064993bka.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Oct 2011 07:46:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=iIf8fkYhi+tf3ApWS41pE60kz4pgzMp0nyjyYLDxEtY=;
	b=vCRhe8Z8HdUhrrbxKjqyxU8RwFmXfvle4XLqTzh5mPAP8HQEQJGO+9Ww99EXa/Qb/q
	6hbXQ4YqcJqjb08x4MEJ+X9cooa/I5R5OoMbodPFOliLRJ5SF1mTwAuntueTdbOe3LY/
	46dbbcfdmVCNKKvQ7HAoqft62dzUMwrsOoSQA=
MIME-Version: 1.0
Received: by 10.204.135.65 with SMTP id m1mr7044952bkt.85.1318603571979; Fri,
	14 Oct 2011 07:46:11 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.204.138.72 with HTTP; Fri, 14 Oct 2011 07:46:11 -0700 (PDT)
In-Reply-To: <1318603356.2342.20.camel@ted>
References: <1318603356.2342.20.camel@ted>
Date: Fri, 14 Oct 2011 11:46:11 -0300
X-Google-Sender-Auth: AXTpuC7G6oaOfi-HuG6d-pBYoQw
Message-ID: <CAP9ODKod1GCk5gFPq0YkEPb0rZ3NHsD6YBu7cAQVDPLW0PN7xA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] mesa-dri: Enable swrast only by default and intel drivers only on IA platform
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
X-List-Received-Date: Fri, 14 Oct 2011 14:51:58 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

+1

Just another thing, I'd prefer to have DRIDRIVERS as ?=3D so machine can
override it.

On Fri, Oct 14, 2011 at 11:42, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
> diff --git a/meta/recipes-graphics/mesa/mesa-dri.inc b/meta/recipes-graph=
ics/mesa/mesa-dri.inc
> index 603438e..795144a 100644
> --- a/meta/recipes-graphics/mesa/mesa-dri.inc
> +++ b/meta/recipes-graphics/mesa/mesa-dri.inc
> @@ -4,7 +4,11 @@ LIB_DEPS +=3D "libdrm expat"
> =A0# most of our targets do not have DRI so will use mesa-xlib
> =A0DEFAULT_PREFERENCE =3D "-1"
>
> -EXTRA_OECONF +=3D "--with-driver=3Ddri --disable-egl --disable-gallium -=
-without-gallium-drivers"
> +DRIDRIVERS =3D "swrast"
> +DRIDRIVERS_x86 =3D "swrast,i915,i965"
> +DRIDRIVERS_x86-64 =3D "swrast,i915,i965"
> +
> +EXTRA_OECONF +=3D "--with-driver=3Ddri --disable-egl --disable-gallium -=
-without-gallium-drivers --with-dri-drivers=3D${DRIDRIVERS}"
>
> =A0python populate_packages_prepend() {
> =A0 =A0 =A0 =A0import os.path
> diff --git a/meta/recipes-graphics/mesa/mesa-dri_7.11.bb b/meta/recipes-g=
raphics/mesa/mesa-dri_7.11.bb
> index 6a4f9a9..5d25127 100644
> --- a/meta/recipes-graphics/mesa/mesa-dri_7.11.bb
> +++ b/meta/recipes-graphics/mesa/mesa-dri_7.11.bb
> @@ -2,7 +2,3 @@ include mesa-common.inc
> =A0include mesa-${PV}.inc
> =A0include mesa-dri.inc
> =A0PR =3D "${INC_PR}.0"
> -
> -EXTRA_OECONF +=3D "--with-dri-drivers=3Dswrast,i915,i965"
> -
> -COMPATIBLE_HOST =3D '(i.86.*-linux|x86_64.*-linux)'
> diff --git a/meta/recipes-graphics/mesa/mesa-dri_git.bb b/meta/recipes-gr=
aphics/mesa/mesa-dri_git.bb
> index 15cde60..a0e1945 100644
> --- a/meta/recipes-graphics/mesa/mesa-dri_git.bb
> +++ b/meta/recipes-graphics/mesa/mesa-dri_git.bb
> @@ -7,5 +7,3 @@ DEFAULT_PREFERENCE =3D "-2"
>
> =A0PR =3D "${INC_PR}.0"
>
> -COMPATIBLE_HOST =3D '(i.86|x86_64).*-linux'
> -
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


