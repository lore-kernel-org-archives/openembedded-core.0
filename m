Return-Path: <juro.bystricky@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 4FE2377D85
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Apr 2017 15:14:51 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	27 Apr 2017 08:14:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.37,384,1488873600"; d="scan'208";a="1140901357"
Received: from orsmsx103.amr.corp.intel.com ([10.22.225.130])
	by fmsmga001.fm.intel.com with ESMTP; 27 Apr 2017 08:14:49 -0700
Received: from orsmsx112.amr.corp.intel.com ([169.254.3.213]) by
	ORSMSX103.amr.corp.intel.com ([169.254.5.97]) with mapi id
	14.03.0319.002; Thu, 27 Apr 2017 08:14:49 -0700
From: "Bystricky, Juro" <juro.bystricky@intel.com>
To: Joshua Lock <joshua.g.lock@linux.intel.com>, Martin Jansa
	<martin.jansa@gmail.com>
Thread-Topic: [OE-core] [PATCH 0/4] Reproducible binaries
Thread-Index: AQHSve/H0RnFKsoUjUy3r4mWvWsL7aHW3z0A//+V67OAAUWMAIAAHehwgACMewCAAAt5AP//nTrggAFjAAD//+OgFw==
Date: Thu, 27 Apr 2017 15:14:47 +0000
Message-ID: <6E51916E4A1F32428260031F4C7CD2B61194E6CB@ORSMSX112.amr.corp.intel.com>
References: <1493144048-12455-1-git-send-email-juro.bystricky@intel.com>
	<CA+chaQfX1iYsYwqx4CMKuADmW75_VZStzZpdE-hw=ahtsDvdwg@mail.gmail.com>
	<6E51916E4A1F32428260031F4C7CD2B61194BE74@ORSMSX112.amr.corp.intel.com>
	<20170426074212.GB3258@jama>
	<6E51916E4A1F32428260031F4C7CD2B61194DCC6@ORSMSX112.amr.corp.intel.com>
	<CA+chaQe4o+LKRV5voXOhoPoWEGjx2cmXedsagmQEgouAP6jMvQ@mail.gmail.com>
	<20170426183306.GF3258@jama>
	<6E51916E4A1F32428260031F4C7CD2B61194DECB@ORSMSX112.amr.corp.intel.com>,
	<1493286610.26953.1.camel@linux.intel.com>
In-Reply-To: <1493286610.26953.1.camel@linux.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.3.86.139]
MIME-Version: 1.0
Cc: "jurobystricky@hotmail.com" <jurobystricky@hotmail.com>, Patches and
	discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/4] Reproducible binaries
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
X-List-Received-Date: Thu, 27 Apr 2017 15:14:52 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

SOURCE_DATE_EPOCH is not the issue here. There are few other places that re=
quire timestamps.=0A=
SOURCE_DATE_EPOCH is determined as the mktime of the youngest source file o=
r if git repo present=0A=
as the time of the top commit. (Otherwise it defaults to 0). This needs to =
be done per package.=0A=
I'll send in a new set of patches, with additional timestamps related varia=
bles that will allow user customization.=0A=
=0A=
=0A=
=0A=
________________________________________=0A=
From: Joshua Lock [joshua.g.lock@linux.intel.com]=0A=
Sent: Thursday, April 27, 2017 2:50 AM=0A=
To: Bystricky, Juro; Martin Jansa=0A=
Cc: jurobystricky@hotmail.com; Patches and discussions about the oe-core la=
yer=0A=
Subject: Re: [OE-core] [PATCH 0/4] Reproducible binaries=0A=
=0A=
On Wed, 2017-04-26 at 19:50 +0000, Bystricky, Juro wrote:=0A=
> > I wasnted to say "passing the seed value" through some separate=0A=
> > variable=0A=
> > which is easy to override from somewhere else.=0A=
> >=0A=
> > e.g.=0A=
> > export PRELINK_TIMESTAMP=3D`git log -1 --pretty=3D%ct `=0A=
> >=0A=
> > in image-prelink.bbclass:prelink_image() is a bit difficult to=0A=
> > override.=0A=
> >=0A=
>=0A=
> I think it is best to keep all reproducible build related variables=0A=
> gathered together,=0A=
> so bitbake.conf seems like a natural place (same place as the=0A=
> variable BUILD_REPRODUCIBLE_BINARIES),=0A=
> i.e something like:=0A=
>=0A=
> PRELINK_TIMESTAMP ??=3D`git log -1 --pretty=3D%ct `=0A=
>=0A=
> A single "general purpose" fallback timestamp variable (not specific=0A=
> to prelinking) would be my=0A=
> preference. Unfortunately, the timestamps may need to come in various=0A=
> different formats...=0A=
=0A=
One option for a single general purpose timestamp variable is just to=0A=
use a static value. Guix[1] just set the value of SOURCE_DATE_EPOCH to=0A=
1[2].=0A=
=0A=
Joshua=0A=
=0A=
1. https://www.gnu.org/software/guix/=0A=
2. http://git.savannah.gnu.org/cgit/guix.git/tree/guix/build/gnu-build-=0A=
system.scm#n42=0A=

