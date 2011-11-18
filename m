Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RRUwa-0002pF-Ke
	for openembedded-core@lists.openembedded.org;
	Fri, 18 Nov 2011 21:21:53 +0100
Received: by faat2 with SMTP id t2so4906720faa.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Nov 2011 12:15:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=jCsfeAJ7DICKjbbN8D8hyPaYwU7LU4sUJeq5lynIZ2c=;
	b=i9u/npnuF5kaphmw5T/o9dLs90NRx59r8I83zr6poRZJyUsl299DXmQqiO1dp7VPdN
	jUDDinQROLjqT9uUUyEh9epjIlA1P0PncseluSVFZGE5uN6MqG7hVXmXDOL+tJL8Jodd
	z1nalR5ExMuptXM57C2SAJv1OsQT9Zo77y9PI=
Received: by 10.152.102.148 with SMTP id fo20mr2912064lab.51.1321647326223;
	Fri, 18 Nov 2011 12:15:26 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.24.36 with HTTP; Fri, 18 Nov 2011 12:14:54 -0800 (PST)
In-Reply-To: <4E4787E2B8CABC46A0EF2ED925CDD8DD08FF5B@DFLE30.ent.ti.com>
References: <AcyeIrWWrQbxrcnUTeiV6gfV9UFbBg==>
	<4E4787E2B8CABC46A0EF2ED925CDD8DD08FF5B@DFLE30.ent.ti.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 18 Nov 2011 12:14:54 -0800
Message-ID: <CAMKF1sour_8rk2RTEMFPXLjmidmVFcinYVCeCb0AD1XmfAgM3A@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: uClibc Errors
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
X-List-Received-Date: Fri, 18 Nov 2011 20:21:53 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 8, 2011 at 6:28 AM, Ambrose, Martin <martin@ti.com> wrote:
> Hello.
>
> My goal is to get a baseline uClibc image for an arm architecture.
> I've tried various mechanisms but eventually end up with build/run-time e=
rrors.
>
> First attempt was to only use oe-core and specify the following in local.=
conf
> =C2=A0 =C2=A0TCLIBC =3D "uclibc"

generally above setting should only be what you need.

e.g.

$ TCLIBC=3Duclibc bitbake core-image-minimal

> =C2=A0 =C2=A0USE_NLS =3D "no"
> =C2=A0 =C2=A0USE_NLS_glib-2.0 =3D "no"
> =C2=A0 =C2=A0USE_NLS_glib-2.0-native =3D "yes"
> =C2=A0 =C2=A0USE_NLS_gcc-cross =3D "no"
>
> I try to build core-image-minimal but get an armv5te-oe-linux-uclibceabi/=
glib-2.0-1_2.30.0-r2/glib-2.30.0 build error:
> =C2=A0 =C2=A0 =C2=A0 =C2=A0./.libs/libglib-2.0.so: undefined reference to=
 `qsort_r'

uclibc does not have qsort_r implemented so I think glib is being built wro=
ngly

>
> I'm surprised this is even trying to build given my settings in local.con=
f.
>
> Next I tried with the meta-micro layer and replace the above conf changes=
 with just
> =C2=A0 =C2=A0DISTRO=3D "micro-uclibc"
>
> Then build micro-base-image and get this packaging error
> =C2=A0 =C2=A0 =C2=A0 =C2=A0ERROR: QA Issue: non -dev/-dbg/-nativesdk pack=
age contains symlink .so: uclibc-thread-db path \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0'/work/armv5te-oe-linux-uclibceabi/uclibc-0.9.=
32-r4.3/packages-split/uclibc-thread-db/lib/libthread_db.so'

this should be fixed seems like a bug in uclibc packaging

>
> I worked around this by overriding the OE packaging variables in local.co=
nf (moved dev-so).
> =C2=A0 =C2=A0 =C2=A0 =C2=A0WARN_QA =3D "ldflags useless-rpaths rpaths dev=
-so"
> =C2=A0 =C2=A0 =C2=A0 =C2=A0ERROR_QA =3D "debug-deps dev-deps debug-files =
arch la2 pkgconfig la perms"
>
> Once built I get an immediate error on boot
> =C2=A0 =C2=A0 =C2=A0 =C2=A0/sbin/init: can't resolve symbol '__register_f=
rame_info'
> =C2=A0 =C2=A0 =C2=A0 =C2=A0Kernel panic - not syncing: Attempted to kill =
init!
>
> I'm wondering if there is a simple mechanism to clean up the unwind bindi=
ngs via OE settings.
>
> In general, is there a "known-good" procedure for building/using uClibc v=
ia oe-core +/- layers?

oe-core should be able to build working images with uclibc for all
supported architectures like eglibc
however its not tested as much as eglibc images are. I will try to
spin builds using uclibc and see
how it goes.

>
> Regards,
> Martin
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


