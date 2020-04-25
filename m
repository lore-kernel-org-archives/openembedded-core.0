Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web10.3176.1587803358525350453
 for <openembedded-core@lists.openembedded.org>;
 Sat, 25 Apr 2020 01:29:20 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@axis.com header.s=axis-central1 header.b=igvNNS3g;
 spf=pass (domain: axis.com, ip: 195.60.68.17, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; l=4309; q=dns/txt; s=axis-central1;
  t=1587803358; x=1619339358;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=8dCAGQ/03IEnsycTbqCDRIUTKe6BHqqXF4ad6TLw/OU=;
  b=igvNNS3gBnzsTgBoTkarKcEtveH4VG5aDKyW4gLGjBm8bYZev29Tj2DN
   mN0VLSZ5K+UcGAVQOaUlnklqUpj9GPgbgQszyjoYqqi69qMJGGMJ41ioo
   TGfqF4coTK2ej7RcWcYr8eV5tpwWgqdxld92VP8STTFTBKN13vojmelEI
   q9fHNolK1kLBmQVPgOwgnAhXo6n5LaPZ6CrVwW0JxUJLANbDLYQ0Ulbvv
   J1/IPxysmGWWxf/UxxOVHpukGQ16dn3vTn+IOC7xGc+XualR2fIBFhLnq
   /I5MF9UmF4Er513LomnnWW+LoCF/XUguMMewH8JzxP5tRe+2qLknHkhbh
   A==;
IronPort-SDR: JSiIyY3zvPh+zHNZKQZjGebRIoZlDxVQuY9IZrRdGFvqV5rBkQcpCg0hSVD7VN3bq2kzDraEh8
 k5vc+lPO1pa2372KpSYMu4VCY92D864BgB+BSF5lY8LniGs4vuh7EmtMxCQotJVQPuY7ZeO9QJ
 cKHIt1C9buUR65RSIx8T4SO4f/XydBJomySh7GEGsXYNiTMv/GF3pLI/CR76h/VF9X8fAE/BCG
 OV0x1WVHEkmXIhUGME2PGuJtEs3B2wjmllKVjB1z1tBkJOYlF7+LtQvldvs7ZYoM5R7P2q/vnj
 Q8s=
X-IronPort-AV: E=Sophos;i="5.73,315,1583190000"; 
   d="scan'208";a="8079922"
From: "Peter Kjellerstedt" <peter.kjellerstedt@axis.com>
To: Andrew Geissler <geissonator@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v3] boost: revert 1.72.0 regression
Thread-Topic: [OE-core] [PATCH v3] boost: revert 1.72.0 regression
Thread-Index: AQHWGDutWSuq2jR8LEiXVTIbaO9I7qiJhjYg
Date: Sat, 25 Apr 2020 08:29:15 +0000
Message-ID: <c957b9af19d744c8b5780540c9db1cbe@XBOX03.axis.com>
References: <FMfcgxwHMsVFPnVQgdLQQLSjJbLpgsnJ>
 <20200422001911.54795-1-geissonator@gmail.com>
In-Reply-To: <20200422001911.54795-1-geissonator@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-
> core@lists.openembedded.org> On Behalf Of Andrew Geissler
> Sent: den 22 april 2020 02:19
> To: openembedded-core@lists.openembedded.org
> Cc: Andrew Geissler <geissonator@gmail.com>
> Subject: [OE-core] [PATCH v3] boost: revert 1.72.0 regression
>=20
> https://www.boost.org/users/history/version_1_72_0.html documents a
> "Known Issue" and has a revert patch for an issue that causes code to
> fail to compile that includes the coroutine function. Without this
> patch, code which includes the asymmetric_coroutine.hpp will fail to
> compile.
>=20
> Signed-off-by: Andrew Geissler <geissonator@gmail.com>
>=20
> v2: added Signed-off-by to patch
>     added Upstream-Status tag
> v3: moved Upstream-status tag to the patch file

The v2 and v3 info above belongs below the --- line below as it=20
relates to the review process, not the commit itself.

//Peter

> ---
>  meta/recipes-support/boost/boost_1.72.0.bb    |  1 +
>  ...001-revert-cease-dependence-on-range.patch | 53 +++++++++++++++++++
>  2 files changed, 54 insertions(+)
>  create mode 100644 meta/recipes-support/boost/files/0001-revert-cease-
> dependence-on-range.patch
>=20
> diff --git a/meta/recipes-support/boost/boost_1.72.0.bb b/meta/recipes-
> support/boost/boost_1.72.0.bb
> index 5e9e0d87d7..0b7badbc76 100644
> --- a/meta/recipes-support/boost/boost_1.72.0.bb
> +++ b/meta/recipes-support/boost/boost_1.72.0.bb
> @@ -7,4 +7,5 @@ SRC_URI +=3D "file://arm-intrinsics.patch \
>             file://0001-Apply-boost-1.62.0-no-forced-flags.patch.patch \
>             file://0001-Don-t-set-up-arch-instruction-set-flags-we-do-
> that-o.patch \
>             file://0001-dont-setup-compiler-flags-m32-m64.patch \
> +           file://0001-revert-cease-dependence-on-range.patch \
>             "
> diff --git a/meta/recipes-support/boost/files/0001-revert-cease-
> dependence-on-range.patch b/meta/recipes-support/boost/files/0001-revert-
> cease-dependence-on-range.patch
> new file mode 100644
> index 0000000000..d6d09a23a5
> --- /dev/null
> +++ b/meta/recipes-support/boost/files/0001-revert-cease-dependence-on-
> range.patch
> @@ -0,0 +1,53 @@
> +From 436e1dbe6fcd31523d261d18ad011392f1d6fbbc Mon Sep 17 00:00:00 2001
> +From: Oliver Kowalke <oliver.kowalke@gmail.com>
> +Date: Sun, 1 Dec 2019 20:40:28 +0100
> +Subject: [PATCH] Revert "Cease dependence on Range"
> +
> +This reverts commit 0c556bb59241e682bbcd3f572815149c5a9b17db.
> +
> +see #44 (One test fails to compile after boostorg/coroutine submodule
> updated)
> +
> +Upstream-Status: Backport
> [https://github.com/boostorg/coroutine/commit/9c73b2f7c1759a9508ba8780b38
> dc15f07f1a447]
> +
> +Signed-off-by: Andrew Geissler <geissonator@gmail.com>
> +---
> + boost/coroutine/asymmetric_coroutine.hpp | 12 +++---------
> + 1 file changed, 3 insertions(+), 9 deletions(-)
> +
> +diff --git a/boost/coroutine/asymmetric_coroutine.hpp
> b/boost/coroutine/asymmetric_coroutine.hpp
> +index ea96981..640896f 100644
> +--- a/boost/coroutine/asymmetric_coroutine.hpp
> ++++ b/boost/coroutine/asymmetric_coroutine.hpp
> +@@ -14,6 +14,7 @@
> + #include <boost/assert.hpp>
> + #include <boost/config.hpp>
> + #include <boost/move/move.hpp>
> ++#include <boost/range.hpp>
> + #include <boost/throw_exception.hpp>
> + #include <boost/utility/explicit_operator_bool.hpp>
> +
> +@@ -2354,19 +2355,12 @@ end( push_coroutine< R > & c)
> +
> + }
> +
> +-// forward declaration of Boost.Range traits to break dependency on it
> +-template<typename C, typename Enabler>
> +-struct range_mutable_iterator;
> +-
> +-template<typename C, typename Enabler>
> +-struct range_const_iterator;
> +-
> + template< typename Arg >
> +-struct range_mutable_iterator< coroutines::push_coroutine< Arg >, void
> >
> ++struct range_mutable_iterator< coroutines::push_coroutine< Arg > >
> + { typedef typename coroutines::push_coroutine< Arg >::iterator type; };
> +
> + template< typename R >
> +-struct range_mutable_iterator< coroutines::pull_coroutine< R >, void >
> ++struct range_mutable_iterator< coroutines::pull_coroutine< R > >
> + { typedef typename coroutines::pull_coroutine< R >::iterator type; };
> +
> + }
> +--
> +2.24.1
> +
> --
> 2.21.0 (Apple Git-122)

