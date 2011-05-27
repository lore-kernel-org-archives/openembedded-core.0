Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1QQ0ek-0002g0-Ih
	for openembedded-core@lists.openembedded.org;
	Fri, 27 May 2011 19:17:02 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 27 May 2011 10:13:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,281,1304319600"; 
   d="scan'208";a="3039738"
Received: from orsmsx603.amr.corp.intel.com ([10.22.226.49])
	by azsmga001.ch.intel.com with ESMTP; 27 May 2011 10:13:55 -0700
Received: from orsmsx504.amr.corp.intel.com ([10.22.226.207]) by
	orsmsx603.amr.corp.intel.com ([10.22.226.49]) with mapi;
	Fri, 27 May 2011 10:13:55 -0700
From: "Kamble, Nitin A" <nitin.a.kamble@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 27 May 2011 10:13:53 -0700
Thread-Topic: [OE-core] [bugfix 1/1] mesa-xlib: workaround gcc 4.6.0 ICE
Thread-Index: Acwcf7e4qQLvpoHOR6q+i0v/DZhbjgAEYD1A
Message-ID: <9DA5872FEF993D41B7173F58FCF6BE94D97FA611@orsmsx504.amr.corp.intel.com>
References: <cover.1306442263.git.nitin.a.kamble@intel.com>
	<03152273cac84eef23738c5f26c45b082194284f.1306442263.git.nitin.a.kamble@intel.com>
	<1306452822.27470.220.camel@rex>
	<1306508804.2525.460.camel@phil-desktop>
In-Reply-To: <1306508804.2525.460.camel@phil-desktop>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
Subject: Re: [bugfix 1/1] mesa-xlib: workaround gcc 4.6.0 ICE
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
X-List-Received-Date: Fri, 27 May 2011 17:17:02 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Phil,
  With your patch gcc 4.6.0 is not hitting the internal compiler error for =
this particular case. I could not do runtime testing as I don't have the hw=
. IMO This is a good patch to send to gcc upstream.

Thanks,
Nitin


> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> Phil Blundell
> Sent: Friday, May 27, 2011 8:07 AM
> To: Patches and discussions about the oe-core layer
> Subject: Re: [OE-core] [bugfix 1/1] mesa-xlib: workaround gcc 4.6.0 ICE
>=20
> On Fri, 2011-05-27 at 00:33 +0100, Richard Purdie wrote:
> > I talked about this on IRC but simply put, no way.
> >
> > The problem is:
> >
> > a) Arm specific
> > b) determined now to be armv7 specific
> > c) gcc version specific
> >
> > and the fix should reflect this.
>=20
> From a fairly superficial look at the crash I suspect you probably want
> something like:
>=20
> --- arm.md~	2011-05-27 15:18:31.916926254 +0100
> +++ arm.md	2011-05-27 15:31:57.331525688 +0100
> @@ -4213,7 +4213,9 @@
>     uxth%?\\t%0, %1
>     ldr%(h%)\\t%0, %1"
>    [(set_attr "type" "alu_shift,load_byte")
> -   (set_attr "predicable" "yes")]
> +   (set_attr "predicable" "yes")
> +   (set_attr "pool_range" "*,256")
> +   (set_attr "neg_pool_range" "*,244")]
>  )
>=20
>  (define_insn "*arm_zero_extendhisi2addsi"
>=20
> It also looks like this could happen on ARMv6 as well, for what that's
> worth, though I haven't tested to see whether it actually does or not.
>=20
> p.
>=20
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


