Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web12.2224.1586226436145759244
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Apr 2020 19:27:16 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: randy.macleod@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 0372R3cS003997
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL);
	Mon, 6 Apr 2020 19:27:03 -0700 (PDT)
Received: from [172.25.44.3] (172.25.44.3) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.487.0; Mon, 6 Apr
 2020 19:27:02 -0700
Subject: Re: [OE-core] [PATCH 1/2 v5] coreutils: add ptest
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
        Khem Raj
	<raj.khem@gmail.com>, <bluelightning@bluelightning.org>
CC: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>,
        Trevor Gamblin
	<trevor.gamblin@windriver.com>
References: <20200311113235.61655-1-trevor.gamblin@windriver.com>
 <20200311113235.61655-2-trevor.gamblin@windriver.com>
 <CAMKF1spd-onZWc9j+Jx58zYtRUpAPC6X0wm+t0YSmgctmWD6Vg@mail.gmail.com>
 <5ebbb63be39a442c740660ff321338f522dc4b68.camel@linuxfoundation.org>
 <CAMKF1so-A14JBx3CBAed2+zeBYN_Z8khPAMiXhcwT4HO-ZdsGg@mail.gmail.com>
 <bbcedb53a9f5c5515acb5760237c5d3fe1f01e61.camel@linuxfoundation.org>
From: "Randy MacLeod" <randy.macleod@windriver.com>
Message-ID: <d9208881-1e10-9798-5730-f99a1ebc64a5@windriver.com>
Date: Mon, 6 Apr 2020 22:26:52 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <bbcedb53a9f5c5515acb5760237c5d3fe1f01e61.camel@linuxfoundation.org>
X-Originating-IP: [172.25.44.3]
X-MIME-Autoconverted: from 8bit to quoted-printable by mail1.windriver.com id 0372R3cS003997
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-CA
Content-Transfer-Encoding: quoted-printable

On 2020-04-06 12:47 p.m., Richard Purdie wrote:
> On Mon, 2020-04-06 at 07:32 -0700, Khem Raj wrote:
>> On Mon, Apr 6, 2020 at 4:58 AM Richard Purdie <richard.purdie@linuxfoun=
dation.org> wrote:
>>> On Sun, 2020-04-05 at 17:26 -0700, Khem Raj wrote:
>>>> On Wed, Mar 11, 2020 at 4:33 AM Trevor Gamblin
>>>> <trevor.gamblin@windriver.com> wrote:
>>>>> +inherit ptest
>>>>> +
>>>>> +RDEPENDS_${PN}-ptest +=3D "bash findutils gawk liberror-perl libmod=
ule-build-perl make perl perl-module-file-stat python3-core sed shadow"
>>>>> +
>>>>
>>>> Adding libmodule-build-perl to rdeps here is pulling in whole target
>>>> toolchain components now while building core-image-minimal
>>>> the dependency chain looks like, total task building for this image a=
re 3000+
>>>>
>>>> "coreutils.do_package_qa" -> "libmodule-build-perl.do_packagedata" ->
>>>> "packagegroup-core-buildessential.do_packagedata" ->
>>>> "gcc.do_packagedata"
>>>>
>>>> IMO, it's a bad experience for the user when building a simple minima=
l
>>>> image and it ends up building whole toolchain for target that
>>>> eventually won't even
>>>> be part of the image. perhaps make it dependent on ptest or some such
>>>> knob thats not commonly used.
>>>>
>>>> Please revert this patch series until we can find a way to not insert
>>>> these build-time dependencies in normal flow.
>>>
>>> We were aware of this when it merged. This should already only happen
>>> if ptest is enabled?
>>>
>>
>> I am seeing it with a fresh checkout of poky with no other changes
>=20
> Poky enables ptest by default:
>=20
> meta-poky/conf/distro/poky.conf:
> POKY_DEFAULT_DISTRO_FEATURES =3D "largefile opengl ptest multiarch wayla=
nd vulkan"
>=20
> so that is expected.

Makes sense to me and I'm glad it's not affecting oe-core by default.
FYI poky has had ptest enabled since at least 2016.

Since poky builds with coreutils will take a bit longer, we should
mention that in the release notes. Paul E added since I hear he
writes much of the release notes.


../Randy

>=20
>>> (else ${PN}-ptest isn't in PACKAGES and hence the RDEPENDS isn't seen)=
.
>>>
>>> I wish we had a better way of handling these dependencies but we sadly
>>> don't.
>>>
>>
>> Such changes should be left to users to enable imo may be a packageconf=
ig or so
>>
>> People have reputation of long build times and large disk space for OE =
this won=E2=80=99t help that cause
>=20
> Well, I tried to have this conversation when the patch was being
> reviewed and tested. Nobody seemed bothered then. I get tired of
> talking to myself in a vacuum and having a reputation about being
> difficult over patches when nobody seems to care (as no other voices
> came into the conversation). I've tried to minimise the impact which
> was the best we can do. We are trying to encourage people to add tests.
>=20
> Starting to revert things just before release is a really bad idea so
> we're not doing that.
>=20
> We can disable ptest in coreutils specifically if we wanted. Ultimately
> we need to find a better way in general of handling some of these
> runtime dependencies but at this point that is a 3.2 issue.
>=20
> Sorry, but if we were to have this discussion it should have been
> months ago :(.
>=20
> I'd also note that 3.1 rc1 is building now.
>=20
> Cheers,
>=20
> Richard
>=20
>=20
>=20
>=20


--=20
# Randy MacLeod
# Wind River Linux
