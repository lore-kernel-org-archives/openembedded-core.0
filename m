Return-Path: <radzy@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 9AE3C6FEFA
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Aug 2016 14:30:47 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u7CEUk8p013157
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 12 Aug 2016 07:30:46 -0700 (PDT)
Received: from ALA-MBA.corp.ad.wrs.com ([169.254.3.25]) by
	ALA-HCB.corp.ad.wrs.com ([147.11.189.41]) with mapi id 14.03.0248.002;
	Fri, 12 Aug 2016 07:30:45 -0700
From: "Radzykewycz, T (Radzy)" <radzy@windriver.com>
To: "Hatle, Mark" <mark.hatle@windriver.com>, Khem Raj <raj.khem@gmail.com>
Thread-Topic: [OE-core] [PATCH 1/1] bitbake.conf: change localedir
Thread-Index: AQHR8+0mtq59FkZPR0SBRs648x2U7qBEdGEAgAArnQCAAS5/AP//lOQQ
Date: Fri, 12 Aug 2016 14:30:44 +0000
Message-ID: <33006C99F5A5194A9B7A7715DFA3E3830110038191@ALA-MBA.corp.ad.wrs.com>
References: <cover.1470636212.git.Qi.Chen@windriver.com>
	<8374cee610f770f4e027f92785bc0bed13334fbb.1470636212.git.Qi.Chen@windriver.com>
	<CAJTo0LaULRXouHYMfKCMUmtFERseR9vZhWXeC-yK9GLrMTwofQ@mail.gmail.com>
	<6cac214c-b73f-af4d-655f-f911788cdc3e@windriver.com>
	<F7382BD1-F606-47F7-9EF2-7F347F9D06D7@gmail.com>,
	<72a12581-2f16-eb5b-185e-adc82ae5d262@windriver.com>
In-Reply-To: <72a12581-2f16-eb5b-185e-adc82ae5d262@windriver.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [147.11.216.87]
MIME-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] bitbake.conf: change localedir
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
X-List-Received-Date: Fri, 12 Aug 2016 14:30:50 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable


________________________________________
> From: openembedded-core-bounces@lists.openembedded.org [openembedded-core=
-bounces@lists.openembedded.org] on behalf of Mark Hatle [mark.hatle@windri=
ver.com]
> Sent: Friday, August 12, 2016 6:50 AM
> To: Khem Raj
> Cc: OE-core
> Subject: Re: [OE-core] [PATCH 1/1] bitbake.conf: change localedir
>=20
> On 8/11/16 2:47 PM, Khem Raj wrote:
> >
> >> On Aug 11, 2016, at 10:11 AM, Mark Hatle <mark.hatle@windriver.com> wr=
ote:
> >>
> >> On 8/11/16 11:26 AM, Burton, Ross wrote:
> >>>
> >>> On 8 August 2016 at 07:04, Chen Qi <Qi.Chen@windriver.com
> >>> <mailto:Qi.Chen@windriver.com>> wrote:
> >>>
> >>>    Previously, localedir is set to "${libdir}/locale". This would res=
ult
> >>>    in locale database installed in '/usr/lib64/locale' in some multil=
ib case.
> >>>    For example, if we build out a multilib x86-64 self-hosted image a=
nd we try
> >>>    to build projects on this host, things broke and the following err=
or appears.
> >>>
> >>>      Please use a locale setting which supports utf-8.
> >>>      Python can't change the filesystem locale after loading so we ne=
ed a utf-8
> >>>    when python starts or things won't work.
> >>>
> >>>    This is because '/usr/lib/locale' is the default one. And actually=
 the
> >>>    nativesdk-glibc is now set to use '/usr/lib/locale'.
> >>>
> >>>
> >>> This is irrelevant as nativesdk-glibc is configured to read the *host=
s* locale
> >>> directory.
> >>>
> >>>
> >>>    Thus, we change the setting of 'localedir' to '${nonarch_libdir}/l=
ocale' to
> >>>    fix the above problem.
> >>>
> >>>
> >>> I see two issues here:
> >>> 1) should binary locales be considered shared in multilib environment=
s? (libdir
> >>> vs nonarch_libdir)
> >>> 2) what packages are not respecting this variable and hard-coding /us=
r/lib/locale?
> >>>
> >>> I'm guessing WR think yes to (1), and is the glibc patch you also sen=
t the
> >>> fundamental fix to (2)?
> >>
> >> Binary locales have an endian and alignment setting to them.  If a pla=
tform
> >> supports both big and little endian, this common locale would not work=
.  (That
> >> is extremely rare....)  Also if a platform supports different alignmen=
ts in
> >> different libraries that could cause an impact as well.  (This is also=
 extremely
> >> unlikely.)
> >
> > Are there any practical existing usecases ?
>=20
> At one point there was talk about running little endian and big endian po=
wer on
> the same machine.  Same with ARM.  I've never actually seen this implemen=
ted.

I have seen it implemented, but it was an odd situation.

IIRC: on Android, an app used a native library in one endian
when the system was running the other.  The context was a bug
report, where the comment (and what brought it to my attention)
was disgust that this was being done.

Not sure this is relevant to this discussion, but it's one data
point to indicate that it was actually done, though not for a
normal Linux system.

Enjoy!

				-- radzy

> The alignment was an issue between different S/390 multilibs at one point=
.  But
> I've not followed it to see if that is still true.  (Not that S/390 is a =
target
> for what we're doing.)
>=20
> So to my knowledge I'm not aware of any use cases we regularly use in the=
 Yocto
> Project -- but I'm also not aware of -all- use-cases.
>=20
> I think the best compromise may be to ensure the value is configurable.  =
Set it
> to the combined location -- with a note that if the multilibs have a diff=
erent
> endian or alignment setting, to use the older setting breaking them into =
the
> multilibs.  (I don't know what, if any changes this would require in glib=
c to
> know when to use which dir...)
>=20
> Plan for the optimized case, support the unusual case.
>=20
> --Mark
>=20
> >>
> >> The not-binary locales have no such issues BTW.
> >>
> >> --Mark
> >>
> >>> Ross
> >>>
> >>>
> >>
> >> --
> >> _______________________________________________
> >> Openembedded-core mailing list
> >> Openembedded-core@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-core
> >
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

