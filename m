Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dongxiao.xu@intel.com>) id 1Qw2AZ-0000Ha-Ux
	for openembedded-core@lists.openembedded.org;
	Wed, 24 Aug 2011 03:22:16 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 23 Aug 2011 18:17:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="41201223"
Received: from pgsmsx602.gar.corp.intel.com ([10.221.43.81])
	by orsmga002.jf.intel.com with ESMTP; 23 Aug 2011 18:17:28 -0700
Received: from pgsmsx509.gar.corp.intel.com (172.30.13.17) by
	pgsmsx602.gar.corp.intel.com (10.221.43.81) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Wed, 24 Aug 2011 09:16:19 +0800
Received: from shsmsx602.ccr.corp.intel.com (10.239.4.104) by
	PGSMSX509.gar.corp.intel.com (172.30.13.17) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Wed, 24 Aug 2011 09:16:19 +0800
Received: from shsmsx501.ccr.corp.intel.com ([10.239.4.141]) by
	SHSMSX602.ccr.corp.intel.com ([10.239.4.104]) with mapi;
	Wed, 24 Aug 2011 09:16:18 +0800
From: "Xu, Dongxiao" <dongxiao.xu@intel.com>
To: Kumar Gala <galak@kernel.crashing.org>
Date: Wed, 24 Aug 2011 09:16:17 +0800
Thread-Topic: why do we poison -Os?
Thread-Index: Acxh+C9AS7lvFJugThCEc1VDh5xrqAAAb1tg
Message-ID: <D5AB6E638E5A3E4B8F4406B113A5A19A12D724C903@shsmsx501.ccr.corp.intel.com>
References: <A182C128-8E5F-48F0-B72B-39DA62E6E1F4@kernel.crashing.org>
In-Reply-To: <A182C128-8E5F-48F0-B72B-39DA62E6E1F4@kernel.crashing.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: why do we poison -Os?
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
X-List-Received-Date: Wed, 24 Aug 2011 01:22:16 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Kumar,

The background of this commit is, when I upgraded PowerPC gcc to 4.5, tinyl=
ogin would crash with certain GCC build parameters.

The root cause for that bug is, if enabled both "-frename-registers" and "-=
Os" options to build tinylogin in powerpc architecture, the tinylogin/getty=
 application will encounter segmentation fault. Other combinations like "-f=
rename-registers and -O2" or only "-Os" will not trigger this issue.

Poky cross environment provides the "-frename-registers" parameter, however=
 it does not provide -Os option since "--enable-target-optspace" option is =
disabled for powerpc gcc. The "-Os" option in tinylogin is added by its own=
 Makefile.

This commit is to prevent the above case. If --enable-target-optspace is di=
sabled for GCC, "-Os" should not be added by recipe.

Thanks,
Dongxiao

> -----Original Message-----
> From: Kumar Gala [mailto:galak@kernel.crashing.org]
> Sent: Wednesday, August 24, 2011 8:53 AM
> To: Xu, Dongxiao
> Cc: Patches and discussions about the oe-core layer; Khem Raj
> Subject: why do we poison -Os?
>=20
> Dongxiao,
>=20
> Can you explain why this was needed:
>=20
> commit ce456306dad3fdf42494830011dacae213c48edf
> Author: Dongxiao Xu <dongxiao.xu@intel.com>
> Date:   Sat Sep 25 10:16:26 2010 +0800
>=20
>     gcc: enable poison parameters detection
>=20
>     If not configured with --enable-target-optspace, gcc will report
>     errors if there is '-Os' optimization in parameters.
>=20
>     This fixes [BUGID #342]
>=20
>     Also add "--enable-target-optspace" option to arm gcc configuration.
>=20
>     Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
>=20
>=20
> - k


