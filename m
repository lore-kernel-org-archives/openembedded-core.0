Received: from mail-lb0-f175.google.com ([209.85.217.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SJfgi-0001Yy-Q9
	for openembedded-core@lists.openembedded.org;
	Mon, 16 Apr 2012 08:45:24 +0200
Received: by lbjn8 with SMTP id n8so288384lbj.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 Apr 2012 23:36:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=7YXeIlnk2FLJ1yOzTOCA8GbZ9iwdgjA2T9uFP2Ggfb4=;
	b=kcWFb95edbSyyWCVoDqBEQBdMKGm7n+XvfOpdqQvUujrG7ngwxrDjg4G7e0jfuaYtM
	eyFNgxkXpx2rohS36PEW1hTQdd17d4Fnw61rinU++9rcrzXqghD0jUJ5bAXT0tNQUOIg
	qi7irFC1oHGSy7/x8YnodY8nVuLUh6/SndMUHJ2zEAq03mfFcQqW4rmQ39ANACxPsRDD
	3La8eKU5rHStdPD3UjGNe2vmNA2UZ9jLn7+KguxWfJ6G7GZZYPwJCsM0CYxYf2x0mRjg
	Y+cBXnU18aLefOv1Vy6RXw6zs6v3bBsNnIFTowG8UCkVHXVxT+w/rchwSHOaUJecgQHz
	OU/A==
Received: by 10.112.83.105 with SMTP id p9mr4625725lby.43.1334558160041; Sun,
	15 Apr 2012 23:36:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.152.129.134 with HTTP; Sun, 15 Apr 2012 23:35:29 -0700 (PDT)
In-Reply-To: <1334494922.16992.10.camel@ted>
References: <1334494922.16992.10.camel@ted>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 15 Apr 2012 23:35:29 -0700
Message-ID: <CAMKF1spBFF9wPSKRbq9BK0B7+1H8pmO=4=Js866MUQexsohapw@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] unfs-server: Fix do_configure so it can be re-executed safely
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
X-List-Received-Date: Mon, 16 Apr 2012 06:45:25 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 15, 2012 at 6:02 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> [YOCTO #2194]
>

this was my issue I guess too since I was chosing gold for default
linker on arm and x86
and that was causing issues of rexecuting this. This was due to the
fact that I had a variabled called
LDISGOLD which differed in sstate signatures between mips and x86

> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
> diff --git a/meta/recipes-devtools/unfs-server/unfs-server_2.1+2.2beta47.=
bb b/meta/recipes-devtools/unfs-server/unfs-server_2.1+2.2beta47.bb
> index 4e619c5..d03c153 100644
> --- a/meta/recipes-devtools/unfs-server/unfs-server_2.1+2.2beta47.bb
> +++ b/meta/recipes-devtools/unfs-server/unfs-server_2.1+2.2beta47.bb
> @@ -62,7 +62,9 @@ do_configure_prepend () {
> =C2=A0 =C2=A0 # 64-bit architectures:
> =C2=A0 =C2=A0 rm -f *_xdr.c
>
> - =C2=A0 =C2=A0mv aclocal.m4 acinclude.m4
> + =C2=A0 =C2=A0if [ ! -f ${S}/acinclude.m4 ]; then
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0mv ${S}/aclocal.m4 ${S}/acinclude.m4
> + =C2=A0 =C2=A0fi
> =C2=A0}
>
> =C2=A0# This recipe is intended for -native and -nativesdk builds only,
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


