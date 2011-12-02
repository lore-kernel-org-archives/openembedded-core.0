Received: from tritech.se ([46.59.120.190])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Mats.Karrman@tritech.se>) id 1RWOyQ-0007Kl-78
	for openembedded-core@lists.openembedded.org;
	Fri, 02 Dec 2011 10:00:02 +0100
Received: from post.tritech.se (post.tritech.se [10.75.60.100])
	by tritech.se (8.14.3/8.14.3) with ESMTP id pB28ki5R005247
	for <openembedded-core@lists.openembedded.org>;
	Fri, 2 Dec 2011 09:46:49 +0100
Received: from POST.tritech.se ([fe80::b4fc:968e:bbef:54cb]) by
	post.tritech.se ([fe80::b4fc:968e:bbef:54cb%11]) with mapi id
	14.01.0270.001; Fri, 2 Dec 2011 09:46:44 +0100
From: =?iso-8859-1?Q?Mats_K=E4rrman?= <Mats.Karrman@tritech.se>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] Coordinating inter-layer dependencies
Thread-Index: AQHMsGiFaImQ9oKiA02Wci/z9HMLkJXILfFk
Date: Fri, 2 Dec 2011 08:46:43 +0000
Message-ID: <ED3E0BCACD909541BA94A34C4A164D4C401A404C@post.tritech.se>
References: <95547EE2-9E3E-4FB6-AA2A-A9653029F971@dominion.thruhere.net>
	<20111201122407.GB19917@jama.jama.net> <1322743071.17484.119.camel@ted>
	<CAP9ODKpnTxcRDJxZKe0bue4RDqydJ44TmEf0ukv43ATgBcDV7Q@mail.gmail.com>
	<20111201130733.GF19917@jama.jama.net>, <1322771625.17484.149.camel@ted>
In-Reply-To: <1322771625.17484.149.camel@ted>
Accept-Language: en-US, sv-SE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [194.132.137.34]
MIME-Version: 1.0
Subject: Re: Coordinating inter-layer dependencies
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
X-List-Received-Date: Fri, 02 Dec 2011 09:00:02 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

> From: openembedded-core-bounces@lists.openembedded.org [openembedded-core=
-bounces@lists.openembedded.org] on behalf of Richard Purdie [richard.purdi=
e@linuxfoundation.org]=0A=
> Sent: Thursday, December 01, 2011 9:33 PM=0A=
> To: Patches and discussions about the oe-core layer=0A=
> Subject: Re: [OE-core] Coordinating inter-layer dependencies=0A=
> =0A=
> On Thu, 2011-12-01 at 14:07 +0100, Martin Jansa wrote:=0A=
> > On Thu, Dec 01, 2011 at 10:59:03AM -0200, Otavio Salvador wrote:=0A=
> > > On Thu, Dec 1, 2011 at 10:37, Richard Purdie <=0A=
> > > richard.purdie@linuxfoundation.org> wrote:=0A=
> > >=0A=
> > > > On Thu, 2011-12-01 at 13:24 +0100, Martin Jansa wrote:=0A=
> > > > > A while back I've proposed to make .bbappend without correspondin=
g .bb=0A=
> > > > > only big fat warning, but not fatal to parse. Now you cannot even=
 build=0A=
> > > > > eglibc if there is libdrm bbappend you don't care at all about..=
=0A=
> > > >=0A=
> > > > You can do this by setting:=0A=
> > > >=0A=
> > > > BB_DANGLINGAPPENDS_WARNONLY=0A=
> > > >=0A=
> > >=0A=
> > > This is even worse; you end up with a package without the changes don=
e on=0A=
> > > the bbappend and as most bbappend files do not change PR, adding it l=
ater=0A=
> > > won't force a package update.=0A=
> >=0A=
> > If we find a way to allow PRINC in multiple bbappends for same .bb then=
=0A=
> > we can say that every .bbappend should use PRINC.=0A=
> >=0A=
> > For record I'll include my discussion about PRINC with RP and kergoth:=
=0A=
> > 10:47 < JaMa> RP__: is there any way to improve PRINC concept to allow =
multiple increments for same recipe while parsing multiple layers?=0A=
> > 10:48 < RP__> JaMa: PRINC_append =3D ".1" ?=0A=
> > 10:49 < JaMa> RP__: ie when meta-openmoko sets PRINC =3D "1" and meta-s=
hr sets PRINC =3D "2" then if you're unlucky meta-openmoko is parsed later =
and bumping PRINC in meta-shr won't help=0A=
> > 10:49 < RP__> JaMa: I wonder if you could do PRINC :=3D "${PRINC + 1}"=
=0A=
> > 10:50 < JaMa> and do we have default PRINC =3D 0 somewhere?=0A=
> > 10:50 < RP__> JaMa: you might need to add that=0A=
> > 10:50 < JaMa> ok, I'll try this, thanks=0A=
> > 10:51 < JaMa> currently I'm moving PRINC only to meta-shr layer.. but t=
hat breaks stuff if someone is using any BSP layer from meta-smartphone..=
=0A=
> >=0A=
> > 14:53 < JaMa> RP__: btw that PRINC trick didn't work (int type didn't l=
ike expresion :/)=0A=
> > 15:13 < RP__> JaMa: ah, try PRINC :=3D "${int(PRINC) + 1}"=0A=
> > 15:21 < JaMa> RP__: still ValueError: invalid literal for int() with ba=
se 10: '${int(PRINC) + 1}'=0A=
> > 15:21 < JaMa> with added PRINC :=3D 0 to bitbake.conf=0A=
> > 15:22 < RP__> PRINC :=3D "${int(d.getVar(PRINC)) + 1}" ? :/=0A=
> > 15:22 < JaMa> whole log http://paste.pocoo.org/show/514437/=0A=
> > 15:22  * RP__ was trying to be too clever I suspect=0A=
> > 15:23 < JaMa> ValueError: invalid literal for int() with base 10: '${in=
t(d.getVar(PRINC)) + 1}'=0A=
> > 15:41 < kergoth> PRINC is unquoted there, so it tries to get a value fo=
r a key of None=0A=
> > 16:24 < RP__> kergoth: right, trying to do too many things at once :/=
=0A=
> > 16:24 < RP__> kergoth: any thoughts on that knotty change to add the fo=
oter?=0A=
> > 17:05 < JaMa> kergoth: something like this? ValueError: invalid literal=
 for int() with base 10: "${int(d.getVar('PRINC')) + 1}"=0A=
> >=0A=
> > Maybe someone else has better idea?=0A=
> =0A=
> Looking at that I was missing something obvious. Try:=0A=
> =0A=
> PRINC :=3D "${@int(PRINC) + 1}"=0A=
> =0A=
> Cheers,=0A=
> =0A=
> Richard=0A=
> =0A=
=0A=
As I understand it, the PRINC increases the PR of the appended recipe. Then=
 the resulting package will have a version that is the same as "the next" v=
ersion of the base recipe. Since many people (me included) hardly remember =
what they did a month ago, isn't there a big risk of confusion in your depl=
oyed systems if packages are upgraded there?=0A=
=0A=
I do something like  PR .=3D ".local0"  where "local" is the name of the la=
yer containing the .bbappend.=0A=
Of course this will create extensive version strings if multiple .bbappends=
 are applied but the alternative is that you have no idea what layers that =
appended and what the the base version of the recipe really was.=0A=
=0A=
// Mats=0A=


