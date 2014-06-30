Return-Path: <fabien.chereau@intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 27B5C60889
	for <Openembedded-core@lists.openembedded.org>;
	Mon, 30 Jun 2014 14:11:17 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 30 Jun 2014 07:11:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,575,1400050800"; d="scan'208";a="451624942"
Received: from fmsmsx107.amr.corp.intel.com ([10.19.9.54])
	by azsmga001.ch.intel.com with ESMTP; 30 Jun 2014 07:10:39 -0700
Received: from FMSMSX109.amr.corp.intel.com (10.18.116.9) by
	FMSMSX107.amr.corp.intel.com (10.19.9.54) with Microsoft SMTP Server
	(TLS) id 14.3.123.3; Mon, 30 Jun 2014 07:10:38 -0700
Received: from lcsmsx154.ger.corp.intel.com (10.186.165.229) by
	fmsmsx109.amr.corp.intel.com (10.18.116.9) with Microsoft SMTP Server
	(TLS) id 14.3.123.3; Mon, 30 Jun 2014 07:10:38 -0700
Received: from hasmsx104.ger.corp.intel.com ([169.254.4.246]) by
	LCSMSX154.ger.corp.intel.com ([169.254.7.206]) with mapi id
	14.03.0123.003; Mon, 30 Jun 2014 17:10:36 +0300
From: "Chereau, Fabien" <fabien.chereau@intel.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Thread-Topic: [OE-core] [PATCH] libusb: add missing build dependency on udev
Thread-Index: AQHPkShb551mDAbNZEW7r9BxyYHpcZuHnfQAgAHV2ek=
Date: Mon, 30 Jun 2014 14:10:35 +0000
Message-ID: <6816AE45C2DEF9439D8C51920E8B705127C2FA0A@HASMSX104.ger.corp.intel.com>
References: <1403778002-10155-1-git-send-email-fabien.chereau@intel.com>,
	<1404032732.28648.30.camel@ted>
In-Reply-To: <1404032732.28648.30.camel@ted>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.3.86.137]
MIME-Version: 1.0
Cc: "Openembedded-core@lists.openembedded.org"
	<Openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libusb: add missing build dependency on udev
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
X-List-Received-Date: Mon, 30 Jun 2014 14:11:30 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Richard,

In fact I had an issue in case systemd was used instead of sysV but I can't=
 reproduce this anymore after a full sstate clean.. I also had the same iss=
ue as you mention when using sysV.

So I clearly didn't tested the patch enough, sorry about that.

Fabien

________________________________________
From: Richard Purdie [richard.purdie@linuxfoundation.org]
Sent: Sunday, June 29, 2014 11:05 AM
To: Chereau, Fabien
Cc: Openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] libusb: add missing build dependency on udev

On Thu, 2014-06-26 at 12:20 +0200, Fabien Chereau wrote:
> This fixes the ./configure error in case libusb is built before udev/syst=
emd.
>
> Signed-off-by: Fabien Chereau <fabien.chereau@intel.com>
> ---
>  meta/recipes-support/libusb/libusb1_1.0.19.bb | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta/recipes-support/libusb/libusb1_1.0.19.bb b/meta/recipes=
-support/libusb/libusb1_1.0.19.bb
> index a20e1fc..be2be9d 100644
> --- a/meta/recipes-support/libusb/libusb1_1.0.19.bb
> +++ b/meta/recipes-support/libusb/libusb1_1.0.19.bb
> @@ -6,6 +6,8 @@ SECTION =3D "libs"
>  LICENSE =3D "LGPLv2.1+"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dfbc093901857fcd118f065f900982=
c24"
>
> +DEPENDS_append =3D " udev"
> +
>  BBCLASSEXTEND =3D "native nativesdk"
>
>  SRC_URI =3D "${SOURCEFORGE_MIRROR}/libusb/libusb-${PV}.tar.bz2 \

This causes the build to explode with circular dependency issues. How
did you test this?

https://autobuilder.yoctoproject.org/main/builders/nightly-ppc-lsb/builds/1=
47/steps/BuildImages/logs/stdio

There is a second error about a missing nativesdk-udev dependency (to
build nativesdk-libusb1) too.

Cheers,

Richard

---------------------------------------------------------------------
Intel Corporation SAS (French simplified joint stock company)
Registered headquarters: "Les Montalets"- 2, rue de Paris, =

92196 Meudon Cedex, France
Registration Number:  302 456 199 R.C.S. NANTERRE
Capital: 4,572,000 Euros

This e-mail and any attachments may contain confidential material for
the sole use of the intended recipient(s). Any review or distribution
by others is strictly prohibited. If you are not the intended
recipient, please contact the sender and delete all copies.


