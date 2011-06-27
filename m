Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dongxiao.xu@intel.com>) id 1Qb4lP-0000Jo-7z
	for openembedded-core@lists.openembedded.org;
	Mon, 27 Jun 2011 07:53:39 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 26 Jun 2011 22:49:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,430,1304319600"; d="scan'208";a="20919567"
Received: from pgsmsx601.gar.corp.intel.com ([10.221.43.69])
	by fmsmga002.fm.intel.com with ESMTP; 26 Jun 2011 22:49:53 -0700
Received: from shsmsx601.ccr.corp.intel.com (10.239.4.112) by
	pgsmsx601.gar.corp.intel.com (10.221.43.69) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Mon, 27 Jun 2011 13:49:13 +0800
Received: from shsmsx501.ccr.corp.intel.com ([10.239.4.141]) by
	shsmsx601.ccr.corp.intel.com ([10.239.4.112]) with mapi;
	Mon, 27 Jun 2011 13:49:07 +0800
From: "Xu, Dongxiao" <dongxiao.xu@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Mon, 27 Jun 2011 13:49:06 +0800
Thread-Topic: [OE-core] [PATCH 1/1] libc-locale: split locale handling from
	libc recipe.
Thread-Index: Acwx/0xk7wHS9yBjSLKkG8tGEM9wAgCiEBBg
Message-ID: <D5AB6E638E5A3E4B8F4406B113A5A19A12D6ADB765@shsmsx501.ccr.corp.intel.com>
References: <cover.1308732995.git.dongxiao.xu@intel.com>
	<d7c256ba838d05c85c6e7c2569f0a6c7b276ab17.1308732995.git.dongxiao.xu@intel.com>
	<1308743075.21613.82.camel@phil-desktop>
	<D5AB6E638E5A3E4B8F4406B113A5A19A12D6A3E0A9@shsmsx501.ccr.corp.intel.com>
	<1308822049.21613.128.camel@phil-desktop>	<1308824075.20015.109.camel@rex>
	<4E03CF74.7030702@gmail.com>
In-Reply-To: <4E03CF74.7030702@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
Subject: Re: [PATCH 1/1] libc-locale: split locale handling from libc recipe.
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
X-List-Received-Date: Mon, 27 Jun 2011 05:53:39 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> Khem Raj
> Sent: Friday, June 24, 2011 7:43 AM
> To: openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core] [PATCH 1/1] libc-locale: split locale handling fro=
m libc
> recipe.
>=20
> On 06/23/2011 03:14 AM, Richard Purdie wrote:
> > On Thu, 2011-06-23 at 10:40 +0100, Phil Blundell wrote:
> >> On Thu, 2011-06-23 at 12:08 +0800, Xu, Dongxiao wrote:
> >>>> -----Original Message-----
> >>>> From: openembedded-core-bounces@lists.openembedded.org
> >>>> [mailto:openembedded-core-bounces@lists.openembedded.org] On
> Behalf
> >>>> Of Phil Blundell
> >>>> Sent: Wednesday, June 22, 2011 7:45 PM
> >>>> To: Patches and discussions about the oe-core layer
> >>>> Subject: Re: [OE-core] [PATCH 1/1] libc-locale: split locale
> >>>> handling from libc recipe.
> >>>>
> >>>> I still don't quite understand why the virtual/libiconv provider
> >>>> has moved from eglibc to eglibc-locale.  Can you explain what's goin=
g on
> there?
> >>>
> >>> Generally, the purpose of this patch is to reduce eglibc's do_package=
 time.
> >>>
> >>> Since many other recipes' do_package have dependency on eglibc's
> do_package, thus the sooner eglibc could finish its do_package, the ealie=
r can
> other do_packages be executed, which improves the parallelism.
> >>>
> >>>  From our study, we found most of eglibc's do_package time is used to
> handle locale. Therefore we split all the locale related stuffs into a se=
parately
> recipe eglibc-locale.
> >>
> >> Yes, I understand that.  But I don't think this answers the question
> >> about why, specifically, glibc-locale is now PROVIDEing
> >> virtual/libiconv.  Does that recipe, in fact, implement libiconv?
> >
> > I must admit I was wondering about this too. Isn't the libiconv
> > functionality still packaged as part of the libc recipe, not the
> > locale part?
> >
> yes it should be in libc

Oh, it should be a mistake. I have changed that in my patch and doing test =
for it now.

Thanks,
Dongxiao

>=20
> > Cheers,
> >
> > Richard
> >
> >
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


