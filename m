Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1QoniK-0002Pr-Tp
	for openembedded-core@lists.openembedded.org;
	Thu, 04 Aug 2011 04:31:13 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 03 Aug 2011 19:26:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,314,1309762800"; 
   d="scan'208";a="3973841"
Received: from pgsmsx601.gar.corp.intel.com ([10.221.43.69])
	by AZSMGA002.ch.intel.com with ESMTP; 03 Aug 2011 19:26:48 -0700
Received: from pgsmsx509.gar.corp.intel.com (172.30.13.17) by
	pgsmsx601.gar.corp.intel.com (10.221.43.69) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Thu, 4 Aug 2011 10:25:21 +0800
Received: from shsmsx601.ccr.corp.intel.com (10.239.4.112) by
	PGSMSX509.gar.corp.intel.com (172.30.13.17) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Thu, 4 Aug 2011 10:25:20 +0800
Received: from shsmsx502.ccr.corp.intel.com ([10.239.4.96]) by
	shsmsx601.ccr.corp.intel.com ([10.239.4.112]) with mapi; Thu, 4 Aug 2011
	10:25:19 +0800
From: "Cui, Dexuan" <dexuan.cui@intel.com>
To: Darren Hart <dvhart@linux.intel.com>
Date: Thu, 4 Aug 2011 10:25:18 +0800
Thread-Topic: [OE-core] [PATCH 1/1] oe-init-build-env,
	scripts/oe-buildenv-internal: add error detecting for $BDIR
Thread-Index: AcxR5FpRUvLv/HF1QzaRk1DQsXrSegAZQV0w
Message-ID: <1865303E0DED764181A9D882DEF65FB6B3044150C6@shsmsx502.ccr.corp.intel.com>
References: <cover.1312265186.git.dexuan.cui@intel.com>
	<6def4624e63c8c7cf439dff32cb155dd2bba0ebe.1312265186.git.dexuan.cui@intel.com>
	<1312285430.2344.582.camel@rex> <4E38C941.30805@linux.intel.com>
	<1865303E0DED764181A9D882DEF65FB6B304414CE2@shsmsx502.ccr.corp.intel.com>
	<4E395235.9010709@linux.intel.com>
In-Reply-To: <4E395235.9010709@linux.intel.com>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: zh-CN, en-US
MIME-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] oe-init-build-env, scripts/oe-buildenv-internal: add error detecting for $BDIR
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
X-List-Received-Date: Thu, 04 Aug 2011 02:31:13 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Darren Hart wrote on 2011-08-03:
> On 08/02/2011 11:46 PM, Cui, Dexuan wrote:
>> Hi Darren, thanks for the suggestion! I considered the idea too,
>> however, if we use the idea, it looks not that simple to gracefully
>> and concisely handle the case if a user (by accident or by prank)
>> passes / as $1 here, i.e., "readlink -f" would fail. So I didn't do
>> that.
>=20
> Hi Dexuan,=20
> I had not considered that case, good catch. I can't think of a valid
> use case for BDIR=3D"/". Not only are write permissions unlikely, but
Agree.

> the build would conflict with /tmp as well.
>=20
> if [ "$BDIR" =3D=3D "/" ]; then
> 	echo "ERROR: / is not supported as a build directory."
> 	exit 1
> fi
> BDIR=3D${BDIR%/}
Hi Darren,
This seems good to me.
Looks ${BDIR%/} can only remove one trailing slash. Do we need to consider =
more-than-one-slashes, e.g., $BDIR is /home/poky/build///? :-)   (We could =
use sed:  BDIR=3D`echo $BDIR | sed -re 's|/+$||'` , but I'm not sure if it =
deserves the complexity)
Darren, could you please help to make a patch?=20
I really have few experience about how to validate a user's input. :-)

> I would be happy with something like the above (untested). It seems a
> lot more clear and direct to me.
>=20
> In any case, I don't see any reason to bail out and ask the user to
> remove a trailing slash. We should just do this and move on. There is
> no semantic difference from the user's perspective, and the blame is
> to be placed on readlink, not the user.
I agree.

Thanks,
-- Dexuan




