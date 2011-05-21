Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QNvJ4-0004ie-O1
	for openembedded-core@lists.openembedded.org;
	Sun, 22 May 2011 01:10:03 +0200
Received: by eye27 with SMTP id 27so1543503eye.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 21 May 2011 16:07:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=u38tzynnys2D0TYKi9PugtqcIYSy++FixoEEGv2reCs=;
	b=XbpBiFKlGGP0Nixpn1ZvRFE9aVg5TSJLMMrx3A07zAmhheWvmxCw2AInil9ILH9Xr5
	EipKJu6bl09BIGJrFMClDMFgijwdphKknxe7sbXv98G6bTgWhuJYkQB3q4Cn5L+L8SfV
	Q15lbOXJMsPgGSHWV9hubrQMaLOdmfaBTBwmE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	b=Dk/GfaJ31+xS+jE3mgPRmw5Cd+EXkhzk8rx/FcKV5pH8sx2NU4SORoa2EB8mGgJVZw
	JyEf8RT6MgvBfb0kzm69ACNazmH/MTTYvPWoZfesWCaEUQL8+a1gD8nkAB1P+eKeLJ2u
	usnVgzEJje161PsrsAwLpLrcnxfkdvKElVSN4=
Received: by 10.14.11.203 with SMTP id 51mr298652eex.204.1306019222373; Sat,
	21 May 2011 16:07:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.53.78 with HTTP; Sat, 21 May 2011 16:06:32 -0700 (PDT)
In-Reply-To: <92c28973316e62fd2e4054fe3bab85685c5acc3e.1306002889.git.sgw@linux.intel.com>
References: <cover.1306002889.git.sgw@linux.intel.com>
	<92c28973316e62fd2e4054fe3bab85685c5acc3e.1306002889.git.sgw@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 21 May 2011 16:06:32 -0700
Message-ID: <BANLkTi=y+5qqFiZfrXCcOQ9CtTYdzh0GCw@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 8/8] distcc_2.18.3.bb: Fix compilation on uclibc
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
X-List-Received-Date: Sat, 21 May 2011 23:10:03 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sat, May 21, 2011 at 11:38 AM, Saul Wold <sgw@linux.intel.com> wrote:
> From: Khem Raj <raj.khem@gmail.com>
>
> We enable gtk/gnome in distcc that code uses loadavg()
> a function unimplemented in uclibc. Therefore for uclibc
> we disable gnome and gtk+ features in distcc
>


This patch had reviews to be addressed which I have done
the patch is updated in pull branch. Use that one

> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
> =C2=A0meta/recipes-devtools/distcc/distcc_2.18.3.bb | =C2=A0 17 +++++++++=
+++-----
> =C2=A01 files changed, 12 insertions(+), 5 deletions(-)
>
> diff --git a/meta/recipes-devtools/distcc/distcc_2.18.3.bb b/meta/recipes=
-devtools/distcc/distcc_2.18.3.bb
> index 1f5c2af..34b04a5 100644
> --- a/meta/recipes-devtools/distcc/distcc_2.18.3.bb
> +++ b/meta/recipes-devtools/distcc/distcc_2.18.3.bb
> @@ -6,7 +6,10 @@ LICENSE =3D "GPLv2"
> =C2=A0LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D94d55d512a9ba36caa9b7df0=
79bae19f"
> =C2=A0PR =3D "r6"
>
> -DEPENDS =3D "avahi gtk+"
> +DEPENDS =3D "avahi ${GTKDEP}"
> +GTKDEP_libc-uclibc =3D ""
> +GTKDEP =3D "gtk+"
> +
> =C2=A0RRECOMMENDS_${PN} =3D "avahi-daemon"
>
> =C2=A0# Upstream change this patch periodically so store locally
> @@ -24,17 +27,21 @@ inherit autotools pkgconfig update-rc.d
>
> =C2=A0INITSCRIPT_NAME =3D "distcc"
>
> -EXTRA_OECONF =3D " --with-gtk "
> -
> +EXTRA_OECONF_libc-glibc =3D " --with-gtk "
> +EXTRA_OECONF_libc-uclibc =3D " --without-gtk --without-gnome "
> =C2=A0do_install_append() {
> =C2=A0 =C2=A0 install -d ${D}${sysconfdir}/init.d/
> =C2=A0 =C2=A0 install -d ${D}${sysconfdir}/default
> =C2=A0 =C2=A0 install -m 0755 ${WORKDIR}/distcc ${D}${sysconfdir}/init.d/
> =C2=A0 =C2=A0 install -m 0755 ${WORKDIR}/default ${D}${sysconfdir}/defaul=
t/distcc
> + =C2=A0 =C2=A0${DESKTOPINSTALL}
> +}
> +DESKTOPINSTALL =3D ""
> +DESKTOPINSTALL_libc-glibc () {
> + =C2=A0 =C2=A0install -d ${D}${datadir}/distcc/
> =C2=A0 =C2=A0 install -m 0644 ${WORKDIR}/distccmon-gnome.desktop ${D}${da=
tadir}/distcc/
> =C2=A0}
> -
> -PACKAGES +=3D "distcc-distmon-gnome"
> +PACKAGES_append_libc-glibc =3D " distcc-distmon-gnome"
>
> =C2=A0FILES_${PN} =3D " ${sysconfdir} \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${bindir}/distcc \
> --
> 1.7.3.4
>
>


