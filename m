Return-Path: <corneliux.stoicescu@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 58A8065D00
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Aug 2014 06:43:02 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 24 Aug 2014 23:42:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.04,395,1406617200"; d="scan'208";a="589370898"
Received: from irsmsx102.ger.corp.intel.com ([163.33.3.155])
	by fmsmga002.fm.intel.com with ESMTP; 24 Aug 2014 23:42:50 -0700
Received: from irsmsx108.ger.corp.intel.com (163.33.3.3) by
	IRSMSX102.ger.corp.intel.com (163.33.3.155) with Microsoft SMTP Server
	(TLS) id 14.3.195.1; Mon, 25 Aug 2014 07:42:49 +0100
Received: from irsmsx103.ger.corp.intel.com ([169.254.3.112]) by
	IRSMSX108.ger.corp.intel.com ([169.254.11.157]) with mapi id
	14.03.0195.001; Mon, 25 Aug 2014 07:42:49 +0100
From: "Stoicescu, CorneliuX" <corneliux.stoicescu@intel.com>
To: "root@myhostname" <lpapp@kde.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "lpapp@kde.org" <lpapp@kde.org>
Thread-Topic: [OE-core] [PATCH] ptest-runner: return 1 instead of zero if
	any	test fails
Thread-Index: AQHPvhJJvoso9bJjEEGOoR+ilk5uxZvg4jmg
Date: Mon, 25 Aug 2014 06:42:48 +0000
Message-ID: <33115ABC4887814E8A92A08FBC93416B23C470D7@IRSMSX103.ger.corp.intel.com>
References: <1408716303-32264-1-git-send-email-root@pol-lx-007.polatis.com>
In-Reply-To: <1408716303-32264-1-git-send-email-root@pol-lx-007.polatis.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [163.33.239.182]
MIME-Version: 1.0
Subject: Re: [PATCH] ptest-runner: return 1 instead of zero if any	test fails
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
X-List-Received-Date: Mon, 25 Aug 2014 06:43:10 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello,

From my experience with ptest, there will always be a few tests failing, so=
 we will always get exit code 1. Should this better return exit code 0 if t=
he individual tests performed correctly(weather they passed or failed) and =
1 if there were any errors during the running of the tests?

Regards,
Corneliu
Yocto QA

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf
> Of root@myhostname
> Sent: Friday, August 22, 2014 5:05 PM
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH] ptest-runner: return 1 instead of zero if any =
test
> fails
>=20
> From: Laszlo Papp <lpapp@kde.org>
>=20
> It is better to know this information from the exit code rather than pars=
ing
> test specific outputs.
>=20
> Signed-off-by: Laszlo Papp <lpapp@kde.org>
> ---
>  meta/recipes-support/ptest-runner/files/ptest-runner | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/recipes-support/ptest-runner/files/ptest-runner
> b/meta/recipes-support/ptest-runner/files/ptest-runner
> index 3342413..c618f11 100644
> --- a/meta/recipes-support/ptest-runner/files/ptest-runner
> +++ b/meta/recipes-support/ptest-runner/files/ptest-runner
> @@ -1,5 +1,5 @@
>  #!/bin/sh
> -
> +ANYFAILED=3Dno
>  echo "START: $0"
>=20
>  for libdir in /usr/lib*
> @@ -15,9 +15,13 @@ do
>          date "+%Y-%m-%dT%H:%M"
>          echo "BEGIN: $x"
>          cd "$x"
> -        ./run-ptest
> +        ./run-ptest || ANYFAILED=3Dyes
>          echo "END: $x"
>          date "+%Y-%m-%dT%H:%M"
>      done
>  done
>  echo "STOP: $0"
> +if [ "$ANYFAILED" =3D "yes"  ]; then
> +    exit 1
> +fi
> +exit 0
> --
> 2.0.4
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

