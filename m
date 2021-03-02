Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by mx.groups.io with SMTP id smtpd.web11.6343.1614678562959063349
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Mar 2021 01:49:23 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.31, mailfrom: naveen.kumar.saini@intel.com)
IronPort-SDR: KM6hKPlivQMy4kNLVO7ESg4zUFwmBmco1LGLypc6356p1VLUa9AJSj8+QbEBZgZ8pQ39DA9b2v
 1bIYc3MZgpbw==
X-IronPort-AV: E=McAfee;i="6000,8403,9910"; a="248168595"
X-IronPort-AV: E=Sophos;i="5.81,216,1610438400"; 
   d="scan'208";a="248168595"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2021 01:49:22 -0800
IronPort-SDR: FCQWIjIqm2wU2j/WAum+jiMWZTR8SIB4ay/qjgXGrJsFoLdtcu9WGX41u7TMG3nBeuHN/dkruw
 qTKVMnE7fIIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,216,1610438400"; 
   d="scan'208";a="434750266"
Received: from pgsmsx602.gar.corp.intel.com ([10.108.199.137])
  by FMSMGA003.fm.intel.com with ESMTP; 02 Mar 2021 01:49:21 -0800
Received: from kmsmsx603.gar.corp.intel.com (172.21.219.143) by
 pgsmsx602.gar.corp.intel.com (10.108.199.137) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Tue, 2 Mar 2021 17:49:20 +0800
Received: from kmsmsx603.gar.corp.intel.com ([172.21.219.143]) by
 kmsmsx603.gar.corp.intel.com ([172.21.219.143]) with mapi id 15.01.2106.002;
 Tue, 2 Mar 2021 17:49:20 +0800
From: "Naveen Saini" <naveen.kumar.saini@intel.com>
To: Khem Raj <raj.khem@gmail.com>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v2 3/3] go-helloworld: Turn into a go module enabled build
Thread-Topic: [OE-core] [PATCH v2 3/3] go-helloworld: Turn into a go module
 enabled build
Thread-Index: AQHXCmNvGErokeVD3UG4Z1/5CzFaGqpwfZsg
Date: Tue, 2 Mar 2021 09:49:20 +0000
Message-ID: <5baa9e0336304fa281deaf975e3f1191@intel.com>
References: <20210224041320.3968776-1-raj.khem@gmail.com>
 <20210224041320.3968776-3-raj.khem@gmail.com>
In-Reply-To: <20210224041320.3968776-3-raj.khem@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-reaction: no-action
dlp-product: dlpe-windows
dlp-version: 11.5.1.3
x-originating-ip: [10.108.32.68]
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

This is now failing when you are behind a proxy because it's trying to fetc=
h those modules during do_compile().
https://github.com/golang/example/commit/bcf50bfd7dcd8020c90965747d857ae428=
02e0c5

Error log:

| ERROR: Execution of '~/build/tmp/work/corei7-64-poky-linux/go-helloworld/=
0.1-r0/temp/run.do_compile.26031' failed with exit code 1:
| go: golang.org/x/tools@v0.0.0-20210112183307-1e6ecd4bf1b0: Get "https://p=
roxy.golang.org/golang.org/x/tools/@v/v0.0.0-20210112183307-1e6ecd4bf1b0.mo=
d": dial tcp 216.58.196.49:443: i/o timeout
| go: golang.org/x/tools@v0.0.0-20210112183307-1e6ecd4bf1b0: Get "https://p=
roxy.golang.org/golang.org/x/tools/@v/v0.0.0-20210112183307-1e6ecd4bf1b0.mo=
d": dial tcp 216.58.196.49:443: i/o timeout

Regards,
Naveen

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-
> core@lists.openembedded.org> On Behalf Of Khem Raj
> Sent: Wednesday, February 24, 2021 12:13 PM
> To: openembedded-core@lists.openembedded.org
> Cc: Khem Raj <raj.khem@gmail.com>
> Subject: [OE-core] [PATCH v2 3/3] go-helloworld: Turn into a go module
> enabled build
>=20
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-extended/go-examples/go-helloworld_0.1.bb | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/recipes-extended/go-examples/go-helloworld_0.1.bb
> b/meta/recipes-extended/go-examples/go-helloworld_0.1.bb
> index ab70ea98a3..d3f7525dc9 100644
> --- a/meta/recipes-extended/go-examples/go-helloworld_0.1.bb
> +++ b/meta/recipes-extended/go-examples/go-helloworld_0.1.bb
> @@ -6,13 +6,14 @@ LICENSE =3D "MIT"
>  LIC_FILES_CHKSUM =3D
> "file://${COMMON_LICENSE_DIR}/MIT;md5=3D0835ade698e0bcf8506ecda2f7b
> 4f302"
>=20
>  SRC_URI =3D "git://${GO_IMPORT}"
> -SRCREV =3D "46695d81d1fae905a270fb7db8a4d11a334562fe"
> +SRCREV =3D "bcf50bfd7dcd8020c90965747d857ae42802e0c5"
>  UPSTREAM_CHECK_COMMITS =3D "1"
>=20
>  GO_IMPORT =3D "github.com/golang/example"
>  GO_INSTALL =3D "${GO_IMPORT}/hello"
> +GO_WORKDIR =3D "${GO_INSTALL}"
>=20
> -inherit go
> +inherit go-mod
>=20
>  # This is just to make clear where this example is
>  do_install_append() {
> --
> 2.30.1

