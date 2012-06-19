Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Sh1V8-00047H-Ik
	for openembedded-core@lists.openembedded.org;
	Tue, 19 Jun 2012 18:41:58 +0200
Received: by eekd49 with SMTP id d49so2139169eek.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jun 2012 09:31:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=H7WD8ztXN4WFcMTHkJbsKpzP/8r8H6XUWzTB3T06YHw=;
	b=xJE1/hBDfLy6xGVG1QqeC3UYT4ggO4kAkrwmGuhpNEPUWWmnuBBxGoXxRGss4MVDaz
	jnT5JVbTs8tV1r8HR6pmoq3EbdMhKi5xGTkxdB23JiBP4k7yLIReINHPzLDJ6MWYP7P3
	208+53HXUCfAckJkehLwkSzjE4rWYtw75gK1Cxz4VThvsy0lSmVqY4FhuZesJxOa2BNc
	sa3Iqv3XlNsOwdKCZoi5QMxHIWKlaF2C/DCAEIOC6EpEFdYohdi4Tw1DIN77CDmuof7Q
	6cay0zvXaoHSo37+Bx4ffMpUMm6OllbXdodIJDc0aN2RNQzRT0lIeCjm5vEKCyBcJ+sI
	0EHw==
Received: by 10.14.97.16 with SMTP id s16mr4167976eef.117.1340123475023; Tue,
	19 Jun 2012 09:31:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.219.71 with HTTP; Tue, 19 Jun 2012 09:30:44 -0700 (PDT)
In-Reply-To: <1340104885-28752-1-git-send-email-marcin.juszkiewicz@linaro.org>
References: <1340104885-28752-1-git-send-email-marcin.juszkiewicz@linaro.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 19 Jun 2012 09:30:44 -0700
Message-ID: <CAMKF1spYWqcOYYFmCJekNc=5kgOAN9GkHwUVHQ1719K=CPnbSA@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] binutils: set sysroot for target
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
X-List-Received-Date: Tue, 19 Jun 2012 16:41:58 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 19, 2012 at 4:21 AM, Marcin Juszkiewicz
<marcin.juszkiewicz@linaro.org> wrote:
> "ld: this linker was not configured to use sysroots" was what I got on
> device instead of compiled binary.
>
> Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
> ---
> =C2=A0meta/recipes-devtools/binutils/binutils_2.22.bb | =C2=A0 =C2=A04 ++=
+-
> =C2=A01 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-devtools/binutils/binutils_2.22.bb b/meta/recip=
es-devtools/binutils/binutils_2.22.bb
> index 7b6adef..71523d7 100644
> --- a/meta/recipes-devtools/binutils/binutils_2.22.bb
> +++ b/meta/recipes-devtools/binutils/binutils_2.22.bb
> @@ -1,6 +1,6 @@
> =C2=A0require binutils.inc
>
> -PR =3D "r9"
> +PR =3D "r10"
>
> =C2=A0LIC_FILES_CHKSUM=3D"\
> =C2=A0 =C2=A0 file://src-release;endline=3D17;md5=3D4830a9ef968f3b18dd5e9=
f2c00db2d35\
> @@ -40,3 +40,5 @@ SRC_URI[sha256sum] =3D "6c7af8ed1c8cf9b4b9d6e6fe09a3e1d=
3d479fe63984ba8b9b26bf356b6
>
>
> =C2=A0BBCLASSEXTEND =3D "native"
> +
> +EXTRA_OECONF +=3D "--with-sysroot=3D/ "

this will break cross recipes. Since they require binutils_${PV}.bb
you can just add --with-sysroot without any argument that will be a bit saf=
er
but right thing to do is to make the recipes not include bb files
instead move the common bits in .inc file
and include that instead

> --
> 1.7.10.4
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


