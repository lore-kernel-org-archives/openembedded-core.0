Return-Path: <peter.kjellerstedt@axis.com>
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
	by mail.openembedded.org (Postfix) with ESMTP id 0D8037F971
	for <Openembedded-core@lists.openembedded.org>;
	Wed, 11 Dec 2019 16:25:41 +0000 (UTC)
IronPort-SDR: puzCQwrH8/qwYG+P7FgfAkt69DunTwKnYFa6v6TxMWD+AMar9rdplTvxCEco/LALaPP7IM+A+d
	g0EVyOpeEQeFATL31QnK81xNL7M6OjQ8l0pHWKIWF6e/Lv3/GMwXZiSdIZqPL6buI1eK6GlVbs
	hG8RUji/zWTjST7Qz9uUBBdA5iAWjAxFvBuG0PiGWh3TzDRF5BVaTc3qJXNAh6QWdGeYkiBCiY
	qSCrEzPU2euw4y4gzJdYbJS49n8KI1BklJeq1dTaVzpDHeBre1WFLiUZQ5t8lH6Sqs7KUKyd/u
	t48=
X-IronPort-AV: E=Sophos;i="5.69,301,1571695200"; 
   d="scan'208";a="3494126"
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: "chris.laplante@agilent.com" <chris.laplante@agilent.com>, Joshua Watt
	<jpewhacker@gmail.com>
Thread-Topic: [bitbake-devel] hashequiv, pseudo, and GIDs
Thread-Index: AQHVsDYLm74OpLmGakKsrD4IfcF0Sqe1GqRg
Date: Wed, 11 Dec 2019 16:25:42 +0000
Message-ID: <318f567345524ba08950eb1c0daa3ec6@XBOX03.axis.com>
References: <CY4PR12MB16537AC33CB9D19F94A126458B5A0@CY4PR12MB1653.namprd12.prod.outlook.com>
	<CAJdd5GZ0LTrTtU=gYMp0ZqTwQA9UQyU7WMx6mNG2scv--7wNVw@mail.gmail.com>
	<CY4PR12MB16536C79902AB2538F4206508B5A0@CY4PR12MB1653.namprd12.prod.outlook.com>
In-Reply-To: <CY4PR12MB16536C79902AB2538F4206508B5A0@CY4PR12MB1653.namprd12.prod.outlook.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
Cc: "Openembedded-core@lists.openembedded.org"
	<Openembedded-core@lists.openembedded.org>
Subject: Re: [bitbake-devel] hashequiv, pseudo, and GIDs
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
X-List-Received-Date: Wed, 11 Dec 2019 16:25:43 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: bitbake-devel-bounces@lists.openembedded.org <bitbake-devel-
> bounces@lists.openembedded.org> On Behalf Of chris.laplante--- via
> bitbake-devel
> Sent: den 11 december 2019 16:17
> To: Joshua Watt <jpewhacker@gmail.com>
> Cc: bitbake-devel@lists.openembedded.org; Openembedded-
> core@lists.openembedded.org
> Subject: Re: [bitbake-devel] hashequiv, pseudo, and GIDs
>=20
> > > So why is the group name used in the hash, as opposed to the GID?=20
> > > (I also have the same question regarding user name vs UID). If
> > > the GID was used we wouldn't have this issue.
> >
> > That was done in response to this mailing list thread:
> > http://lists.openembedded.org/pipermail/openembedded-core/2019-January/=
277755.html
> >
> > Basically, the GID and UID aren't stable values across builds so the
> > suggestion was to use the names. My understanding was that this
> > corresponded to how the user and groups are dealt with in general.
>=20
> That doesn't make sense (intuitively) to me. If I have a file with owner
> GID 1000, and copy it to some system, then the group name is defined by
> whatever groups happen to exist on the system. If I copy it to a differen=
t
> system, the owner group name might be different, depending on /etc/group.
> In both cases, it is the GID of 1000 that is stable.

That depends on how you copy the files. E.g., if you use a `tar | ssh tar`=
=20
pipeline to copy the files between the systems, it will be the user/group=20
names that are used. If on the other hand you do it using an SD-card, then=
=20
it will be the UIDs/GIDs that are used.

> From a caching point of view, it seems incorrect to care about what the
> corresponding group name happened to be at the time when the cache was
> created.

On the contrary. For almost all practical use cases you care about what=20
user/group owns a file, not what UID/GID they happen to be. E.g., in the=20
recipe (or Makefile or whatever) you typically want to specify that a=20
file shall be owned by user foo, not UID 1234. Then, either you do not=20
care about the actual UIDs used, or if you do, you use statically assigned=
=20
UIDs/GIDs for all users/groups. This is typically necessary if you want=20
to be able to support upgrading your product, and it is very well=20
supported by the useradd-staticids.bbclass.

> Chris

//Peter


