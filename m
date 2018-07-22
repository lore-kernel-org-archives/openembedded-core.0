Return-Path: <juro.bystricky@intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 516AF74553
	for <openembedded-core@lists.openembedded.org>;
	Sun, 22 Jul 2018 16:47:00 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
	by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	22 Jul 2018 09:47:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.51,389,1526367600"; d="scan'208";a="56966704"
Received: from orsmsx106.amr.corp.intel.com ([10.22.225.133])
	by fmsmga008.fm.intel.com with ESMTP; 22 Jul 2018 09:46:15 -0700
Received: from orsmsx111.amr.corp.intel.com (10.22.240.12) by
	ORSMSX106.amr.corp.intel.com (10.22.225.133) with Microsoft SMTP Server
	(TLS) id 14.3.319.2; Sun, 22 Jul 2018 09:46:15 -0700
Received: from orsmsx112.amr.corp.intel.com ([169.254.3.12]) by
	ORSMSX111.amr.corp.intel.com ([169.254.12.141]) with mapi id
	14.03.0319.002; Sun, 22 Jul 2018 09:46:14 -0700
From: "Bystricky, Juro" <juro.bystricky@intel.com>
To: Andre McCurdy <armccurdy@gmail.com>
Thread-Topic: [OE-core] [PATCH] openssl_1.0.2n: improve reproducibility
Thread-Index: AQHUIG3ghalEHVp0QU2PrYY2xo8G3aSbc3e5
Date: Sun, 22 Jul 2018 16:46:13 +0000
Message-ID: <6E51916E4A1F32428260031F4C7CD2B64E54169C@ORSMSX112.amr.corp.intel.com>
References: <1520710049-85318-1-git-send-email-juro.bystricky@intel.com>,
	<CAJ86T=WQy=Zn5Nmy5n6voqw4vhgwJt6+vskX4R8ZdiB5HG4FJQ@mail.gmail.com>
In-Reply-To: <CAJ86T=WQy=Zn5Nmy5n6voqw4vhgwJt6+vskX4R8ZdiB5HG4FJQ@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.19.9.46]
MIME-Version: 1.0
Cc: Juro Bystricky <jurobystricky@hotmail.com>,
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] openssl_1.0.2n: improve reproducibility
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
X-List-Received-Date: Sun, 22 Jul 2018 16:47:00 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

No, not on purpose, the word "prepend" should be taken out.  =0A=
Although running "make" the second time does no harm (should do nothing, in=
 fact) it needs to be fixed, =0A=
I'll send in a fix.=0A=
=0A=
Thanks=0A=
Juro=0A=
________________________________________=0A=
From: Andre McCurdy [armccurdy@gmail.com]=0A=
Sent: Friday, July 20, 2018 2:08 PM=0A=
To: Bystricky, Juro=0A=
Cc: OE Core mailing list; Juro Bystricky=0A=
Subject: Re: [OE-core] [PATCH] openssl_1.0.2n: improve reproducibility=0A=
=0A=
On Sat, Mar 10, 2018 at 11:27 AM, Juro Bystricky=0A=
<juro.bystricky@intel.com> wrote:=0A=
> Improve reproducible build of:=0A=
>=0A=
> openssl-staticdev=0A=
> openssl-dbg=0A=
> libcrypto=0A=
>=0A=
> There are two main causes that prevent reproducible build, both related t=
o=0A=
> the generated file "buildinf.h":=0A=
>=0A=
> 1. "buildinf.h" contains build host CFLAGS, containing various build=0A=
>    host references.  We need to pass sanitized CFLAGS to the script=0A=
>    generating this file ("mkbuildinf.pl". )=0A=
>=0A=
> 2. We also need to modify the script "mkbuildinf.pl" itsel in order to=0A=
>    generate a build timestamp based on SOURCE_DATE_EPOCH, if present in=
=0A=
>    the environment.=0A=
>=0A=
> Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>=0A=
> ---=0A=
>  .../openssl-1.0.2n/reproducible-cflags.patch        | 20 +++++++++++++++=
+++++=0A=
>  .../openssl-1.0.2n/reproducible-mkbuildinf.patch    | 21 +++++++++++++++=
++++++=0A=
>  meta/recipes-connectivity/openssl/openssl10.inc     |  3 +++=0A=
>  meta/recipes-connectivity/openssl/openssl_1.0.2n.bb |  5 +++++=0A=
>  4 files changed, 49 insertions(+)=0A=
>  create mode 100644 meta/recipes-connectivity/openssl/openssl-1.0.2n/repr=
oducible-cflags.patch=0A=
>  create mode 100644 meta/recipes-connectivity/openssl/openssl-1.0.2n/repr=
oducible-mkbuildinf.patch=0A=
>=0A=
> diff --git a/meta/recipes-connectivity/openssl/openssl10.inc b/meta/recip=
es-connectivity/openssl/openssl10.inc=0A=
> index 02a0e16..0598195 100644=0A=
> --- a/meta/recipes-connectivity/openssl/openssl10.inc=0A=
> +++ b/meta/recipes-connectivity/openssl/openssl10.inc=0A=
> @@ -162,6 +162,9 @@ do_configure () {=0A=
>=0A=
>  do_compile_prepend_class-target () {=0A=
>      sed -i 's/\((OPENSSL=3D\)".*"/\1"openssl"/' Makefile=0A=
> +    oe_runmake depend=0A=
> +       cc_sanitized=3D`echo "${CC} ${CFLAG}" | sed -e 's,--sysroot=3D${S=
TAGING_DIR_TARGET},,g' -e 's|${DEBUG_PREFIX_MAP}||g'`=0A=
> +       oe_runmake CC_INFO=3D"${cc_sanitized}"=0A=
=0A=
Here calls to "oe_runmake depend" and "oe_runmake" are made from the=0A=
target specific do_compile_prepend(), but the original calls (without=0A=
sanitised CC_INFO) are then run again from do_compile(), ie:=0A=
=0A=
  do_compile() {=0A=
    sed -i 's/\((OPENSSL=3D\)".*"/\1"openssl"/' Makefile=0A=
    oe_runmake depend=0A=
    cc_sanitized=3D`echo ...`=0A=
    oe_runmake CC_INFO=3D"${cc_sanitized}"=0A=
    oe_runmake depend=0A=
    oe_runmake=0A=
  }=0A=
=0A=
Is the intention really to run "oe_runmake depend" and "oe_runmake" twice?=
=0A=
=0A=
>  }=0A=
>=0A=
>  do_compile () {=0A=
> diff --git a/meta/recipes-connectivity/openssl/openssl_1.0.2n.bb b/meta/r=
ecipes-connectivity/openssl/openssl_1.0.2n.bb=0A=
> index 32444c6..f07289d 100644=0A=
> --- a/meta/recipes-connectivity/openssl/openssl_1.0.2n.bb=0A=
> +++ b/meta/recipes-connectivity/openssl/openssl_1.0.2n.bb=0A=
> @@ -43,6 +43,11 @@ SRC_URI +=3D "file://find.pl;subdir=3Dopenssl-${PV}/ut=
il/ \=0A=
>             file://0001-Fix-build-with-clang-using-external-assembler.pat=
ch \=0A=
>             file://0001-openssl-force-soft-link-to-avoid-rare-race.patch =
\=0A=
>             "=0A=
> +=0A=
> +SRC_URI_append_class-target =3D "\=0A=
> +           file://reproducible-cflags.patch \=0A=
> +           file://reproducible-mkbuildinf.patch \=0A=
> +           "=0A=
>  SRC_URI[md5sum] =3D "13bdc1b1d1ff39b6fd42a255e74676a4"=0A=
>  SRC_URI[sha256sum] =3D "370babb75f278c39e0c50e8c4e7493bc0f18db6867478341=
a832a982fd15a8fe"=0A=
>=0A=

