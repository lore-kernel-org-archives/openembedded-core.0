Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f174.google.com (mail-wi0-f174.google.com
	[209.85.212.174])
	by mail.openembedded.org (Postfix) with ESMTP id 3856F736BA
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Jun 2015 08:37:11 +0000 (UTC)
Received: by wibut5 with SMTP id ut5so13586096wib.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Jun 2015 01:37:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	bh=2Zj4RES9r1NmK8eAHz15kYWJQHrVDjXPugRXwodFlws=;
	b=YJ4qmF87mJ+7JYDywxThq9Lb1rfQB6oeq47SVAjY+SR40g9gF1yDYQ88MmT3IdEvmM
	1Qm0Y43Beus1pniAPek4xQIjA18pvzWyH041OInDN+hZJUiSpSfeT8wJVIky68woDJHf
	89mPAfejAgvFvDNTT21BEaPcZ1304pgvoX7jYNfGaGnXSjO4AD7XPFREWIlfoJngfYmz
	VTGRXKY1zIt3qCG7Zb8TVjZ9oF7myNfzMzQHY5m0t+gZd0IysW5lftMRdU3WrfOoxdEH
	hGLJHsML+5Dh9emE7AqWz9+4l4J6pFQcKKeekVg3sKhrMrX5BOIYc2MC7BzQy8TnkKTD
	yxEQ==
X-Received: by 10.194.77.211 with SMTP id u19mr65621293wjw.19.1433407032895;
	Thu, 04 Jun 2015 01:37:12 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by mx.google.com with ESMTPSA id nb9sm5251198wic.10.2015.06.04.01.37.11
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 04 Jun 2015 01:37:12 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 4 Jun 2015 10:37:33 +0200
To: openembedded-core@lists.openembedded.org
Message-ID: <20150604083733.GD2376@jama>
References: <1432744427-16447-1-git-send-email-Martin.Jansa@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1432744427-16447-1-git-send-email-Martin.Jansa@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [dizzy][PATCH] perf: add LIBNUMA_DEFINES
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
X-List-Received-Date: Thu, 04 Jun 2015 08:37:13 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 27, 2015 at 06:33:47PM +0200, Martin Jansa wrote:
> From: Robert Yang <liezhi.yang@windriver.com>

ping

> Fixed:
> WARNING: QA Issue: perf rdepends on numactl, but it isn't a build depende=
ncy? [build-deps]
>=20
> The numactl is in meta-oe.
>=20
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>  meta/recipes-kernel/perf/perf.bb | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/=
perf.bb
> index 19772d8..1f1f552 100644
> --- a/meta/recipes-kernel/perf/perf.bb
> +++ b/meta/recipes-kernel/perf/perf.bb
> @@ -65,6 +65,7 @@ B =3D "${WORKDIR}/${BPN}-${PV}"
>  SCRIPTING_DEFINES =3D "${@perf_feature_enabled('perf-scripting', '', 'NO=
_LIBPERL=3D1 NO_LIBPYTHON=3D1',d)}"
>  TUI_DEFINES =3D "${@perf_feature_enabled('perf-tui', '', 'NO_NEWT=3D1',d=
)}"
>  LIBUNWIND_DEFINES =3D "${@perf_feature_enabled('perf-libunwind', '', 'NO=
_LIBUNWIND=3D1 NO_LIBDW_DWARF_UNWIND=3D1',d)}"
> +LIBNUMA_DEFINES =3D "${@perf_feature_enabled('perf-libnuma', '', 'NO_LIB=
NUMA=3D1',d)}"
> =20
>  # The LDFLAGS is required or some old kernels fails due missing
>  # symbols and this is preferred than requiring patches to every old
> @@ -80,7 +81,8 @@ EXTRA_OEMAKE =3D '\
>      AR=3D"${AR}" \
>      EXTRA_CFLAGS=3D"-ldw" \
>      perfexecdir=3D${libexecdir} \
> -    NO_GTK2=3D1 ${TUI_DEFINES} NO_DWARF=3D1 ${LIBUNWIND_DEFINES} ${SCRIP=
TING_DEFINES} \
> +    NO_GTK2=3D1 ${TUI_DEFINES} NO_DWARF=3D1 ${LIBUNWIND_DEFINES} \
> +    ${SCRIPTING_DEFINES} ${LIBNUMA_DEFINES} \
>  '
> =20
>  EXTRA_OEMAKE +=3D "\
> --=20
> 2.4.1
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

