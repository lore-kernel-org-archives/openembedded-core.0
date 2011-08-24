Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dongxiao.xu@intel.com>) id 1Qw2ev-0001Mh-Rb
	for openembedded-core@lists.openembedded.org;
	Wed, 24 Aug 2011 03:53:38 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 23 Aug 2011 18:48:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,272,1312182000"; d="scan'208";a="10406954"
Received: from pgsmsx602.gar.corp.intel.com ([10.221.43.81])
	by AZSMGA002.ch.intel.com with ESMTP; 23 Aug 2011 18:48:48 -0700
Received: from pgsmsx102.gar.corp.intel.com (10.221.44.80) by
	pgsmsx602.gar.corp.intel.com (10.221.43.81) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Wed, 24 Aug 2011 09:47:18 +0800
Received: from shsmsx601.ccr.corp.intel.com (10.239.4.112) by
	PGSMSX102.gar.corp.intel.com (10.221.44.80) with Microsoft SMTP Server
	(TLS) id 14.1.323.3; Wed, 24 Aug 2011 09:47:17 +0800
Received: from shsmsx501.ccr.corp.intel.com ([10.239.4.141]) by
	shsmsx601.ccr.corp.intel.com ([10.239.4.112]) with mapi;
	Wed, 24 Aug 2011 09:47:16 +0800
From: "Xu, Dongxiao" <dongxiao.xu@intel.com>
To: Kumar Gala <galak@kernel.crashing.org>
Date: Wed, 24 Aug 2011 09:47:15 +0800
Thread-Topic: why do we poison -Os?
Thread-Index: Acxh/axOpf1xDCLTRmuUjX3r5WHu9wAANWDQ
Message-ID: <D5AB6E638E5A3E4B8F4406B113A5A19A12D724C949@shsmsx501.ccr.corp.intel.com>
References: <A182C128-8E5F-48F0-B72B-39DA62E6E1F4@kernel.crashing.org>
	<D5AB6E638E5A3E4B8F4406B113A5A19A12D724C903@shsmsx501.ccr.corp.intel.com>
	<0597F428-97F2-461F-804B-FE793E911BD4@kernel.crashing.org>
In-Reply-To: <0597F428-97F2-461F-804B-FE793E911BD4@kernel.crashing.org>
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
X-List-Received-Date: Wed, 24 Aug 2011 01:53:38 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: Kumar Gala [mailto:galak@kernel.crashing.org]
>=20
> If tinylogin is the only issue why modify/patch gcc?  I see we have
> meta/recipes-core/tinylogin/tinylogin-1.4/use_O2_option.patch to deal wit=
h
> this?

Yes, patch for tinylogin is to deal with the issue.
Besides that, we added this poison detection mechanism and suppose it shoul=
d not affect functionality.
My understanding is that, if GCC is not configured with the ability of code=
 space optimization, target recipes will not have code size benefit even if=
 adding "-Os" option.

>=20
> Not allowing -Os at all, which is our current situation on PPC is problem=
atic.
> So trying to see if this issue is really limited to gcc 4.5 or not.  How =
can I
> reproduce it with current poky.git?

Not allowing -Os for PPC is because --enable-target-optspace is not enabled=
 for PPC GCC. This is a known issue for PPC GCC 4.5.x.

I wonder if GCC 4.6.x has fixed this issue. If so, we should add "--enable-=
target-optspace" for PPC GCC again, thus -Os will be allowed for recipes.

Thanks,
Dongxiao

>=20
> - k
>=20
> On Aug 23, 2011, at 8:16 PM, Xu, Dongxiao wrote:
>=20
> > Hi Kumar,
> >
> > The background of this commit is, when I upgraded PowerPC gcc to 4.5,
> tinylogin would crash with certain GCC build parameters.
> >
> > The root cause for that bug is, if enabled both "-frename-registers" an=
d "-Os"
> options to build tinylogin in powerpc architecture, the tinylogin/getty
> application will encounter segmentation fault. Other combinations like
> "-frename-registers and -O2" or only "-Os" will not trigger this issue.
> >
> > Poky cross environment provides the "-frename-registers" parameter,
> however it does not provide -Os option since "--enable-target-optspace" o=
ption
> is disabled for powerpc gcc. The "-Os" option in tinylogin is added by it=
s own
> Makefile.
> >
> > This commit is to prevent the above case. If --enable-target-optspace i=
s
> disabled for GCC, "-Os" should not be added by recipe.
> >
> > Thanks,
> > Dongxiao
> >
> >> -----Original Message-----
> >> From: Kumar Gala [mailto:galak@kernel.crashing.org]
> >> Sent: Wednesday, August 24, 2011 8:53 AM
> >> To: Xu, Dongxiao
> >> Cc: Patches and discussions about the oe-core layer; Khem Raj
> >> Subject: why do we poison -Os?
> >>
> >> Dongxiao,
> >>
> >> Can you explain why this was needed:
> >>
> >> commit ce456306dad3fdf42494830011dacae213c48edf
> >> Author: Dongxiao Xu <dongxiao.xu@intel.com>
> >> Date:   Sat Sep 25 10:16:26 2010 +0800
> >>
> >>    gcc: enable poison parameters detection
> >>
> >>    If not configured with --enable-target-optspace, gcc will report
> >>    errors if there is '-Os' optimization in parameters.
> >>
> >>    This fixes [BUGID #342]
> >>
> >>    Also add "--enable-target-optspace" option to arm gcc configuration=
.
> >>
> >>    Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
> >>
> >>
> >> - k



