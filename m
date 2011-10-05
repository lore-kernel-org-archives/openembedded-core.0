Received: from mail-qw0-f47.google.com ([209.85.216.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RBWzM-0006p5-Gn
	for openembedded-core@lists.openembedded.org;
	Wed, 05 Oct 2011 21:18:44 +0200
Received: by qadc1 with SMTP id c1so1558283qad.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Oct 2011 12:13:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=1fZHOhMH1+m/jsjfwpClZi2hdG1kfoldyDum3+zwbQk=;
	b=JOWstIpxDEOMBzqYDcpBSwuXpXmikdtB77Yz465FcSFj9L9yKdbhwYUx2cUwexdgIl
	TfKal5cWgGU+dvogUEZnJgHmeZlPgNQ29FPieowKMq5LPyKXuAdjrAKwlrAeGV0wbfO/
	F1jZQsjqK6bqg5iru0VqHzeD+jXr2dkH/6fWM=
Received: by 10.68.19.196 with SMTP id h4mr21019909pbe.39.1317841989057; Wed,
	05 Oct 2011 12:13:09 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.68.49.129 with HTTP; Wed, 5 Oct 2011 12:12:39 -0700 (PDT)
In-Reply-To: <1317841365-32051-1-git-send-email-msm@freescale.com>
References: <1317841365-32051-1-git-send-email-msm@freescale.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 5 Oct 2011 12:12:39 -0700
Message-ID: <CAMKF1spPPnQiOddrG9S7PGPwAXYA4RNgcPrS6f0_o83V-1NrmA@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 5/6] Fix sysprof for powerpc64
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
X-List-Received-Date: Wed, 05 Oct 2011 19:18:44 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 5, 2011 at 12:02 PM, Matthew McClintock <msm@freescale.com> wro=
te:
> __ppc64__ is not defined on powerpc64, rather __powerpc64__ is, this
> uses a patch that is already upstream to fix builds for powerpc64
>
> Signed-off-by: Matthew McClintock <msm@freescale.com>
> ---
> =C2=A0...PowerPC-checks-for-__NR_perf_counter_open.patch | =C2=A0 35 ++++=
++++++++++++++++
> =C2=A0meta/recipes-kernel/sysprof/sysprof_git.bb =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | =C2=A0 =C2=A01 +
> =C2=A02 files changed, 36 insertions(+), 0 deletions(-)
> =C2=A0create mode 100644 meta/recipes-kernel/sysprof/files/0001-Fix-Power=
PC-checks-for-__NR_perf_counter_open.patch
>
> diff --git a/meta/recipes-kernel/sysprof/files/0001-Fix-PowerPC-checks-fo=
r-__NR_perf_counter_open.patch b/meta/recipes-kernel/sysprof/files/0001-Fix=
-PowerPC-checks-for-__NR_perf_counter_open.patch
> new file mode 100644
> index 0000000..041054e
> --- /dev/null
> +++ b/meta/recipes-kernel/sysprof/files/0001-Fix-PowerPC-checks-for-__NR_=
perf_counter_open.patch
> @@ -0,0 +1,35 @@
> +Upstream-Status: Backport
> +
> +From 4708a509aa9d65ae93e9824e42ddbc6e8d42d90c Mon Sep 17 00:00:00 2001
> +From: =3D?UTF-8?q?Michel=3D20D=3DC3=3DA4nzer?=3D <michel@daenzer.net>
> +Date: Sat, 27 Aug 2011 20:04:44 +0200
> +Subject: [PATCH] Fix PowerPC checks for __NR_perf_counter_open.
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +__ppc__ isn't defined here on Debian powerpc. Grepping through the heade=
rs
> +installed in /usr/include, there are a few references to __ppc__ and
> +__ppc64__, but I suspect they're for other OSs.
> +

is sysprof linux specific? if not then this change will mean that it wont w=
ork
on other OSes which dont define __powerpc64__ e.g. darwin. Better solution =
is to
check for both __ppc64__ and __powerpc64__

but thats something for sysprof upstream to consider. For OE this
patch is sufficient

> +Signed-off-by: Michel D=C3=A4nzer <michel@daenzer.net>
> +---
> + collector.c | =C2=A0 =C2=A02 +-
> + 1 files changed, 1 insertions(+), 1 deletions(-)
> +
> +diff --git a/collector.c b/collector.c
> +index b28964f..fe16967 100644
> +--- a/collector.c
> ++++ b/collector.c
> +@@ -175,7 +175,7 @@ sysprof_perf_counter_open (struct perf_counter_attr =
*attr,
> + #define __NR_perf_counter_open 337
> + #elif defined(__hppa__)
> + #define __NR_perf_counter_open 318
> +-#elif defined(__ppc__) || defined(__ppc64__)
> ++#elif defined(__powerpc__) || defined(__powerpc64__)
> + #define __NR_perf_counter_open 319
> + #elif defined(__s390__)
> + #define __NR_perf_counter_open 331
> +--
> +1.7.6.1
> +
> diff --git a/meta/recipes-kernel/sysprof/sysprof_git.bb b/meta/recipes-ke=
rnel/sysprof/sysprof_git.bb
> index 10bde04..c553263 100644
> --- a/meta/recipes-kernel/sysprof/sysprof_git.bb
> +++ b/meta/recipes-kernel/sysprof/sysprof_git.bb
> @@ -10,6 +10,7 @@ PV =3D "1.1.8+git${SRCPV}"
>
> =C2=A0SRC_URI =3D "git://git.gnome.org/sysprof;protocol=3Dgit \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://define-NT_GNU_BUILD_ID.pa=
tch \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Fix-PowerPC-checks-for-__=
NR_perf_counter_open.patch \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "
>
> =C2=A0SRC_URI_append_arm =C2=A0=3D " file://rmb-arm.patch"
> --
> 1.7.6.1
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


