Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RZWS8-0007aU-9y
	for openembedded-core@lists.openembedded.org;
	Sun, 11 Dec 2011 00:35:36 +0100
Received: by lahd3 with SMTP id d3so1501082lah.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 10 Dec 2011 15:28:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=0qBvxsaWOGUimcVfTxkFS6eTlY3PdFVaUVlXQG32TNE=;
	b=Pg2c3rYgUCXBT0zfW4ePUfgr8UyC5LVQcc0XC7MH/6o7nu9zLMWqGEtg0YwRvnYSOQ
	qSDPepenwg2FlcKrMPYVb0U9VbbjjJOUq4WZ3RMI6exA2KDxLo7K6kegMz1mzgSVnBE5
	Hle29se4dhf1Mh+MRH61IuVpsMvj4HSPGa1hY=
Received: by 10.152.134.179 with SMTP id pl19mr8545631lab.13.1323559723322;
	Sat, 10 Dec 2011 15:28:43 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.24.36 with HTTP; Sat, 10 Dec 2011 15:28:12 -0800 (PST)
In-Reply-To: <1323477267.5309.206.camel@ted>
References: <1323477267.5309.206.camel@ted>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 10 Dec 2011 15:28:12 -0800
Message-ID: <CAMKF1sre0Wk1C_m6sS8yM4-apZYeOYp=Va-Mm19jpXqukUjFBA@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: "Ashfield, Bruce" <Bruce.Ashfield@windriver.com>, "Hart,
	Darren" <darren.hart@intel.com>
Subject: Re: [PATCH] kernel.bbclass: Allow do_compile_kernelmodules to use PARALLEL_MAKE
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
X-List-Received-Date: Sat, 10 Dec 2011 23:35:36 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 9, 2011 at 4:34 PM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> Without this we don't take advantage of any configured multiple CPU
> cores which seems a shame.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index d0cc279..120a524 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -89,7 +89,7 @@ kernel_do_compile() {
> =C2=A0do_compile_kernelmodules() {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS MACHINE
> =C2=A0 =C2=A0 =C2=A0 =C2=A0if (grep -q -i -e '^CONFIG_MODULES=3Dy$' .conf=
ig); then
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 oe_runmake modules =C2=
=A0CC=3D"${KERNEL_CC}" LD=3D"${KERNEL_LD}"
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 oe_runmake ${PARALLEL_=
MAKE} modules =C2=A0CC=3D"${KERNEL_CC}" LD=3D"${KERNEL_LD}"
> =C2=A0 =C2=A0 =C2=A0 =C2=A0else
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bbnote "no modules=
 to compile"
> =C2=A0 =C2=A0 =C2=A0 =C2=A0fi


in base.bbclass oe_runmake says

${MAKE} ${EXTRA_OEMAKE} "$@"

and

conf/bitbake.conf says

EXTRA_OEMAKE_prepend_task-compile =3D "${PARALLEL_MAKE} "

hmmm so we dont parallel make if task is not called do_compile ?


