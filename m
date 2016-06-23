Return-Path: <joe.slater@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 941DB60851
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jun 2016 16:39:52 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u5NGdqLB023895
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 23 Jun 2016 09:39:52 -0700 (PDT)
Received: from ALA-MBB.corp.ad.wrs.com ([169.254.1.50]) by
	ALA-HCB.corp.ad.wrs.com ([147.11.189.41]) with mapi id 14.03.0248.002;
	Thu, 23 Jun 2016 09:39:52 -0700
From: "Slater, Joseph" <joe.slater@windriver.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [oe-core][PATCH 0/1] blacklist: add BPNBLACKLIST
	support
Thread-Index: AQHRzNFXgkcZQlaJh0GUM1SGzyNKHp/2iJaAgAACy4CAAD61gIAAdLjw
Date: Thu, 23 Jun 2016 16:39:50 +0000
Message-ID: <007BD92917A2324FA403BCF9A464CF84A6F851D2@ALA-MBB.corp.ad.wrs.com>
References: <1466632764-22540-1-git-send-email-jslater@windriver.com>
	<CAMKF1soa5wBYFyFV0sqxsN_0bpjTjpQ==Aow0Ui7ZAAhh-Mp=g@mail.gmail.com>
	<6ea53ae7-5516-a991-f9f6-111db319e5dc@windriver.com>
	<2774839.1y5EqQaVkY@peggleto-mobl.ger.corp.intel.com>
In-Reply-To: <2774839.1y5EqQaVkY@peggleto-mobl.ger.corp.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [147.11.216.160]
MIME-Version: 1.0
Subject: Re: [PATCH 0/1] blacklist: add BPNBLACKLIST support
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
X-List-Received-Date: Thu, 23 Jun 2016 16:39:54 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Paul Eggleton [mailto:paul.eggleton@linux.intel.com]
> Sent: Wednesday, June 22, 2016 7:30 PM
> To: openembedded-core@lists.openembedded.org
> Cc: Hatle, Mark; Slater, Joseph; Khem Raj
> Subject: Re: [OE-core] [oe-core][PATCH 0/1] blacklist: add BPNBLACKLIST s=
upport
>=20
> On Wed, 22 Jun 2016 17:45:55 Mark Hatle wrote:
> > On 6/22/16 5:35 PM, Khem Raj wrote:
> > > On Jun 22, 2016 2:59 PM, "Joe Slater" <jslater@windriver.com
> > >
> > > <mailto:jslater@windriver.com>> wrote:
> > >> We have encountered some issues with the use of PNBLACKLIST in recip=
es.
> > >> In particular, PNBLACKLIST[pkg] will not suppress building of lib32-=
pkg
> > >> or lib64-pkg so world builds can fail unexpectedly.
> > >>
> > >> One solution could be to implement BPNBLACKLIST[] which checks BPN
> > >> instead
> > >> of PN when a recipe is being parsed.  I have included a patch to do =
this.
> > >>
> > >> If this were adopted, there are many recipes under meta-openembedded=
 that
> > >> should probably changed to use BPNBLACKLIST instead of PNBLACKLIST.
> > >
> > > Bpn will also mean native and nativesdk among others. I think its bet=
ter
> > > to list multilibs explicitly.
> >
> > This is intentional.
> >
> > The problem with saying we have to list multilibs explicitly.  multilib
> > naming is arbitrary.  I can say that it probably fits the pattern of li=
b64,
> > lib32, libn32 and libx32.... but it doesn't have to.
> >
> > But then I'd also need to blacklist native and nativesdk versions as we=
ll..
> > so for a simple recipe that for some reason I want blacklisted, it's ea=
sier
> > to hack the recipe to just blacklist itself -- then enter 7 or more
> > blacklists.
> >
> > Using the BPNBLACKLIST I can blacklist a single recipe with one command=
 and
> > not worry about multilibs, class extensions, etc.
> >
> > (The patch leave PNBLACKLIST, specifically so that in the case where yo=
u
> > want only partial usage blacklisted you can.)
>=20
> So blacklist.bbclass already has code to extend PNBLACKLIST with multilib
> variants - so we don't actually need this for multilib, right? It only he=
lps
> cover multilib and native/nativesdk AFAICT.

But the original problem was that PNBLACKLIST[] does not create more varfla=
gs
for multilib when used in a recipe.  Anyway, I like your approach.  Of cour=
se, I also liked
introducing a variable named SELFBLACKLIST, too.  I guess, then,

PNBLACKLIST_class-target in a recipe would be the same as
PNBLACKLIST[pkg] in a conf file is today (if pkg is a "vanilla" name).

Maybe the old syntax could be deprecated and the eventhandler in the class =
ditched at some point?

Joe

>=20
> If we are going to make changes here I do have an alternative suggestion =
-
> a while ago I wrote this patch but never got around to sending it because
> I wasn't quite sure if it's the right approach. It makes PNBLACKLIST work
> a bit more like other variables where you use overrides rather than
> varflags to make it specific to a recipe:
>=20
>   http://git.yoctoproject.org/cgit/cgit.cgi/poky-
> contrib/commit/?h=3Dpaule/stuff3&id=3D7383419cbe69c4d62b9695e6ae65adc8b54=
741f7
>=20
> Does anyone else see value in this?
>=20
> Cheers,
> Paul
>=20
> --
>=20
> Paul Eggleton
> Intel Open Source Technology Centre

