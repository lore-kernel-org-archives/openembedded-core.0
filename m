Return-Path: <Mats.Karrman@tritech.se>
Received: from tritech.se (tritech.se [46.59.120.190])
	by mail.openembedded.org (Postfix) with ESMTP id DD29A6D3BB
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Nov 2013 09:17:56 +0000 (UTC)
Received: from post.tritech.se (post.tritech.se [10.75.60.100])
	by tritech.se (8.14.3/8.14.3) with ESMTP id rAJ9HqVg029214;
	Tue, 19 Nov 2013 10:17:57 +0100
Received: from POST.tritech.se ([fe80::b4fc:968e:bbef:54cb]) by
	post.tritech.se ([fe80::b4fc:968e:bbef:54cb%10]) with mapi id
	14.02.0347.000; Tue, 19 Nov 2013 10:17:51 +0100
From: =?iso-8859-1?Q?Mats_K=E4rrman?= <Mats.Karrman@tritech.se>
To: Phil Blundell <pb@pbcl.net>
Thread-Topic: [OE-core] RPROVIDES not package specific with native and added
	package
Thread-Index: Ac7kW/uiPKrHrTmoRhqqcp3NSngBhv//9ZWAgAARVBj///D2AIAAE45pgABDrgCAAPlJPQ==
Date: Tue, 19 Nov 2013 09:17:50 +0000
Message-ID: <ED3E0BCACD909541BA94A34C4A164D4C4FD50B06@post.tritech.se>
References: <ED3E0BCACD909541BA94A34C4A164D4C4FD50595@post.tritech.se>
	,<1384780059.23724.26.camel@phil-desktop.brightsign>
	<ED3E0BCACD909541BA94A34C4A164D4C4FD505BB@post.tritech.se>
	,<1384780550.23724.29.camel@phil-desktop.brightsign>
	<ED3E0BCACD909541BA94A34C4A164D4C4FD505D5@post.tritech.se>,
	<1384799284.23724.60.camel@phil-desktop.brightsign>
In-Reply-To: <1384799284.23724.60.camel@phil-desktop.brightsign>
Accept-Language: en-US, sv-SE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [194.132.137.82]
MIME-Version: 1.0
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: RPROVIDES not package specific with native and added package
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
X-List-Received-Date: Tue, 19 Nov 2013 09:17:57 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi Phil,=0A=
=0A=
On Monday, November 18, 2013 7:28 PM, Phil Blundell wrote:=0A=
> On Mon, 2013-11-18 at 13:28 +0000, Mats K=E4rrman wrote:=0A=
> > On Monday, November 18, 2013 2:15 PM, Phil Blundell wrote:=0A=
> > >> Subject: Re: [OE-core] RPROVIDES not package specific with native an=
d added package=0A=
> > >>=0A=
> > >> Oh, right, I see.  Does it help if you use "PACKAGES =3D+ .." rather=
 than=0A=
> > >> "PACKAGES_prepend =3D "?=0A=
> >=0A=
> > Yes it does!!=0A=
> >=0A=
> > Could you tell me why?=0A=
> > Er... better could you tell me where's the best place to read so I don'=
t have to make these mistakes again?=0A=
> =0A=
> The code in insane.bbclass will give you a diagnostic if ${RPROVIDES} is=
=0A=
> set and PACKAGES isn't blank.  (The actual check that it uses for=0A=
> PACKAGES is slightly obscure and involves split(), but the net effect=0A=
> seems to be that it's testing for the variable being set to something=0A=
> other than "".)=0A=
> =0A=
> native.bbclass sets PACKAGES=3D"" and RPROVIDES=3D"${PN}".  This violates=
=0A=
> insane.bbclass's usual idea of what RPROVIDES should be, but since=0A=
> PACKAGES is blank the check is inhibited and you don't get an error.=0A=
>=0A=
> However, your recipe is defeating this by prepending to PACKAGES and=0A=
> causing it to end up not blank.  This turns the insane.bbclass check=0A=
> back on and the error reappears.=0A=
> =0A=
> p.=0A=
=0A=
Thanks a lot for the explanation, it explains how the warnings came to be b=
ut=0A=
it's still a bit unclear to me why "=3D+" works while "_prepend" doesn't.=
=0A=
My guess is it's a question about order of evaluation; inherit native.bbcla=
ss takes=0A=
precedence over recipe assignment to PACKAGES, but PACKAGES_prepend is=0A=
another variable and that is prepended to PACKAGES later, but still before=
=0A=
insane.bbclass gets to do it's work, right?=0A=
=0A=
Something that adds to the confusion is that it's not clear where in the ch=
ain=0A=
the "-e" option gets its output. Would it be possible to draw some kind of =
picture=0A=
that shows the basic steps of processing or is it all too complicated?=0A=
=0A=
Are there any good sources of documentation apart from the Yocto project=0A=
documents and http://docs.openembedded.org or is it only the source code=0A=
itself that goes further in detail?=0A=
=0A=
BR // Mats=0A=

