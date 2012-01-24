Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Rpk2I-0006x7-St
	for openembedded-core@lists.openembedded.org;
	Tue, 24 Jan 2012 18:19:58 +0100
Received: by lags15 with SMTP id s15so2449169lag.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Jan 2012 09:12:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=BjwFn0P9XEJhNJc1krlE3TmDS1n43mqunUBDSVX/+/c=;
	b=cVHbbzGbhRhb9bAelHWVO6B5QKhCFn1B3KkZ9sCvdAc1RqSOTG6VjnzO6XXlMrf9My
	qfT0le5O4Ceyw95NZXF/ldnAVWpIjPOygKXxf9Iksd3KDRjLmngmI8xio9g6V2gnHNxf
	jjoe8M/GIIqFi2yNdJ1mXwqt1lI+Y9cJA4aHY=
Received: by 10.152.131.40 with SMTP id oj8mr7081426lab.24.1327425133261; Tue,
	24 Jan 2012 09:12:13 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.5.201 with HTTP; Tue, 24 Jan 2012 09:11:41 -0800 (PST)
In-Reply-To: <1327424970.19643.99.camel@ted>
References: <1327424970.19643.99.camel@ted>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 24 Jan 2012 09:11:41 -0800
Message-ID: <CAMKF1sqF3RrHEWaKCK0U5LX5VTVDfUBUVzsFXxacjx7PyF=nPQ@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gcc-cross: Don't reference machine specific variables
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
X-List-Received-Date: Tue, 24 Jan 2012 17:19:59 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 24, 2012 at 9:09 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> gcc-cross is installed into a package architecture specific directory
> and is not meant to be machine specific. This patch replaces MACHINE_ARCH
> with PACKAGE_ARCH to ensure this is really the case.
>
> This was found by examining sstate checksums.


This change is fine. Since its only a script name it does not matter
what its called.

Acked-by: Khem Raj <raj.khem@gmail.com>

>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
> diff --git a/meta/recipes-devtools/gcc/gcc-cross.inc b/meta/recipes-devto=
ols/gcc/gcc-cross.inc
> index 0b31a8c..6acf8c5 100644
> --- a/meta/recipes-devtools/gcc/gcc-cross.inc
> +++ b/meta/recipes-devtools/gcc/gcc-cross.inc
> @@ -87,12 +87,12 @@ then
> =C2=A0 =C2=A0 =C2=A0 =C2=A0exit 1
> =C2=A0fi
> =C2=A0 =C2=A0 =C2=A0 =C2=A0echo "lappend boards_dir [pwd]/../../.." > ${B=
}/site.exp
> - =C2=A0 =C2=A0 =C2=A0 echo "load_generic_config \"unix\"" > ${B}/${MACHI=
NE_ARCH}.exp
> - =C2=A0 =C2=A0 =C2=A0 echo "set_board_info username \$user" >> ${B}/${MA=
CHINE_ARCH}.exp
> - =C2=A0 =C2=A0 =C2=A0 echo "set_board_info rsh_prog ssh" >> ${B}/${MACHI=
NE_ARCH}.exp
> - =C2=A0 =C2=A0 =C2=A0 echo "set_board_info rcp_prog scp" >> ${B}/${MACHI=
NE_ARCH}.exp
> - =C2=A0 =C2=A0 =C2=A0 echo "set_board_info hostname \$target" >> ${B}/${=
MACHINE_ARCH}.exp
> - =C2=A0 =C2=A0 =C2=A0 DEJAGNU=3D${B}/site.exp make -k check RUNTESTFLAGS=
=3D"--target_board=3D${MACHINE_ARCH}\$@"
> + =C2=A0 =C2=A0 =C2=A0 echo "load_generic_config \"unix\"" > ${B}/${PACKA=
GE_ARCH}.exp
> + =C2=A0 =C2=A0 =C2=A0 echo "set_board_info username \$user" >> ${B}/${PA=
CKAGE_ARCH}.exp
> + =C2=A0 =C2=A0 =C2=A0 echo "set_board_info rsh_prog ssh" >> ${B}/${PACKA=
GE_ARCH}.exp
> + =C2=A0 =C2=A0 =C2=A0 echo "set_board_info rcp_prog scp" >> ${B}/${PACKA=
GE_ARCH}.exp
> + =C2=A0 =C2=A0 =C2=A0 echo "set_board_info hostname \$target" >> ${B}/${=
PACKAGE_ARCH}.exp
> + =C2=A0 =C2=A0 =C2=A0 DEJAGNU=3D${B}/site.exp make -k check RUNTESTFLAGS=
=3D"--target_board=3D${PACKAGE_ARCH}\$@"
>
> =C2=A0STOP
>
>
>


