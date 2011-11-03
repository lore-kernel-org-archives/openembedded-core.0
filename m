Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RLzji-0000aK-5a
	for openembedded-core@lists.openembedded.org;
	Thu, 03 Nov 2011 17:01:50 +0100
Received: by ggnj1 with SMTP id j1so1390609ggn.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 Nov 2011 08:55:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=QZNZTcmU423I3peBPtv2oQEBaxkZxHmO1srfHJFt2I4=;
	b=jZd/KjmcYnDpMSKxAm9/U9bzOhcaDCVxwGT3nfG2uLrtzOApDN/3CC25BYcFw+Mn/2
	fqmsZ9ue/BuXBgTD8EMXuzBesvc1orTvmbwTrHEjh8UeWy0lTV0w9dEnkXeGK+WoPCIO
	CNKug1FCPeBJXyNFhY1MvGCDz5DYfWuJCr7Q0=
MIME-Version: 1.0
Received: by 10.151.86.7 with SMTP id o7mr10162312ybl.69.1320335734664; Thu,
	03 Nov 2011 08:55:34 -0700 (PDT)
Received: by 10.151.13.21 with HTTP; Thu, 3 Nov 2011 08:55:34 -0700 (PDT)
In-Reply-To: <e4dbd916c029abca10e538f70fb06380c21bdd83.1318570250.git.sgw@linux.intel.com>
References: <cover.1318570250.git.sgw@linux.intel.com>
	<e4dbd916c029abca10e538f70fb06380c21bdd83.1318570250.git.sgw@linux.intel.com>
Date: Thu, 3 Nov 2011 16:55:34 +0100
Message-ID: <CA+chaQfT08+Vd7JyB4wZO8eF13HbY1Z_TiY8MVBV76vPsxd5fw@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [CONSOLIDATED PULL 12/28] libnl2: Fix a race on route/pktloc_syntax.h
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
X-List-Received-Date: Thu, 03 Nov 2011 16:01:50 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 14, 2011 at 7:33 AM, Saul Wold <sgw@linux.intel.com> wrote:
> From: Tom Rini <tom_rini@mentor.com>
>
> At issue is that route/pktloc.c (not generated) depends on
> route/pktloc_syntax.h (generated).
>
> Signed-off-by: Tom Rini <tom_rini@mentor.com>
> Signed-off-by: Matthew McClintock <msm@freescale.com>
> ---
> =C2=A0.../libnl/fix-pktloc_syntax_h-race.patch =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 | =C2=A0 26 ++++++++++++++++++++
> =C2=A0meta/recipes-support/libnl/libnl_2.0.bb =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0| =C2=A0 =C2=A03 +-
> =C2=A02 files changed, 28 insertions(+), 1 deletions(-)
> =C2=A0create mode 100644 meta/recipes-support/libnl/fix-pktloc_syntax_h-r=
ace.patch
>
> diff --git a/meta/recipes-support/libnl/fix-pktloc_syntax_h-race.patch b/=
meta/recipes-support/libnl/fix-pktloc_syntax_h-race.patch
> new file mode 100644
> index 0000000..05d75db
> --- /dev/null
> +++ b/meta/recipes-support/libnl/fix-pktloc_syntax_h-race.patch
> @@ -0,0 +1,26 @@
> +Upstream-Status: Inappropriate [configuration]
> +
> +libnl has progressed to 0.3.2 and there does not appear to be any
> +"make -j" issues with this build after my limited testing on that
> +newer version so we can assume this issue is fixed upstream
> +
> +Index: libnl-2.0/lib/Makefile.am
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- libnl-2.0.orig/lib/Makefile.am
> ++++ libnl-2.0/lib/Makefile.am
> +@@ -27,11 +27,15 @@ CLEANFILES =3D \
> + =C2=A0 =C2=A0 =C2=A0 route/pktloc_grammar.c route/pktloc_grammar.h \
> + =C2=A0 =C2=A0 =C2=A0 route/pktloc_syntax.c route/pktloc_syntax.h
> +
> ++BUILT_SOURCES =3D route/pktloc_syntax.h route/pktloc_grammar.h
> ++
> + # Hack to avoid using ylwrap. It does not function correctly in combina=
tion
> + # with --header-file=3D
> ++route/pktloc_grammar.h: route/pktloc_grammar.c
> + route/pktloc_grammar.c: route/pktloc_grammar.l
> + =C2=A0 =C2=A0 =C2=A0 $(LEX) --header-file=3Droute/pktloc_grammar.h $(LF=
LAGS) -o $@ $^
> +
> ++route/pktloc_syntax.h: route/pktloc_syntax.c
> + route/pktloc_syntax.c: route/pktloc_syntax.y
> + =C2=A0 =C2=A0 =C2=A0 $(YACC) -d $(YFLAGS) -o $@ $^
> +
> diff --git a/meta/recipes-support/libnl/libnl_2.0.bb b/meta/recipes-suppo=
rt/libnl/libnl_2.0.bb
> index 0dfcaf6..5339846 100644
> --- a/meta/recipes-support/libnl/libnl_2.0.bb
> +++ b/meta/recipes-support/libnl/libnl_2.0.bb
> @@ -6,10 +6,11 @@ LICENSE =3D "LGPLv2.1"
> =C2=A0LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D2b41e13261a330ee784153ec=
bb6a82bc"
>
> =C2=A0DEPENDS =3D "flex-native bison-native"
> -PR =3D "r2"
> +PR =3D "r3"
>
> =C2=A0SRC_URI=3D "http://www.infradead.org/~tgr/libnl/files/${BPN}-${PV}.=
tar.gz \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://fix-makefile.patch \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://fix-pktloc_syntax_h-race.patch \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0"
>
> =C2=A0SRC_URI[md5sum] =3D "6aaf1e9802a17a7d702bb0638044ffa7"
> --
> 1.7.6.2

Why is this fix-pktloc_syntax_h-race.patch in
meta/recipes-support/libnl/fix-pktloc_syntax_h-race.patch
instead of more common location
meta/recipes-support/libnl/libnl-2.0/fix-pktloc_syntax_h-race.patch

and why is this separate from fix-makefile.patch when they both are
trying to fix same issue?

I'll send patch for this..


