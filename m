Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBFA3C4167B
	for <webhook@archiver.kernel.org>; Tue, 31 Oct 2023 15:28:17 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (EUR03-DBA-obe.outbound.protection.outlook.com [40.107.104.76])
 by mx.groups.io with SMTP id smtpd.web11.1604.1698766089779988808
 for <openembedded-core@lists.openembedded.org>;
 Tue, 31 Oct 2023 08:28:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=NOeaI0OV;
 spf=pass (domain: axis.com, ip: 40.107.104.76, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fz1F9iv+PAIZsoyn4RtUmKFYb/eQyFgtjl0vIlaDHtErDOaZA7F4sZ8KTU/Z2h+AD62FE1WHX/LZ93uPM2fQgz6eQOwqQXAMbjSpZ+Bwwi7saF5UjwZCYluHz3OxGNwEMYW3x6EdL03bAYpasJgaLYHMD5rTNIECuqDntO3KJxeckXkMNwKQNQc2oxWagd+NcupxZdMR/sIJjzJNFXyb+R1OLIXuBassw5i00DyLvgQVhjj6cfgqQSASRiM5HQfrV7rDehuWhjDavuSjD9fTGNQiQnYBmhvVzoIEYktop07O7w1zav8Ib4ST9gzjIlObdiLOOB95EUH0XzBJ/v0/zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ALiKSG4rGwDF5FX++Q63FL0AvPChP70dVeZfpbcGp0M=;
 b=hlQjIXsRPwWhh1SGul6OQ1Rk1cV/sydI6WcgGVkMx5FQZpBlIFMoOASi1bpatW7r4EHQFl+Oge2lANIA75vfRRiTtIokLuVQjvmRnXLE56YzrAq4f2LS30Q6G/yLFQ4bmEv8ux94AfQWwaQsToCZxrv0prCTNjnuMSdbIJT5QBu/kwscAs4JbcHDYZKg7Xj1PEiHVRGD3RmafOQfiAcm67HCqcw8XIk3VeG2mtlIn0PVXt9PI5g935wdpcjj+V6tyLrViV3f2cF5v34sMxski2Ef6jwpUcHIr5ddqfYGooaC4AeHgij1gVZS7t5yYcoFAYqMInsSH0eRdEky/Ykd9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ALiKSG4rGwDF5FX++Q63FL0AvPChP70dVeZfpbcGp0M=;
 b=NOeaI0OVkI9psgLHwWkj8/2ZX3gSS1ieUwsilwIKQVemiKML9DtKQO4NM1/++Fto4z0wbPTtEZzwH79mMw5llzW1AkhAYyODhYXeGN3o7ijkQO4IkJ8bVY4iesZ/KYiF3CJFGpO596Wjd0xU01KsikviG7BkxXmlNtDw9oakDZU=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by DU2PR02MB10088.eurprd02.prod.outlook.com (2603:10a6:10:499::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.29; Tue, 31 Oct
 2023 15:28:05 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1b86:94ad:137d:4093]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1b86:94ad:137d:4093%7]) with mapi id 15.20.6933.029; Tue, 31 Oct 2023
 15:28:03 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH] oeqa/selftest/context: Rely on bitbake-getvar
 --value to only return value
Thread-Topic: [OE-core] [PATCH] oeqa/selftest/context: Rely on bitbake-getvar
 --value to only return value
Thread-Index: AQHZ7dNQBuGOE7P8TkCgeq0+pXQXJbA8+WHQgCdIXoA=
Date: Tue, 31 Oct 2023 15:28:03 +0000
Message-ID: 
 <DB5PR02MB10213271109D5913473D58455EFA0A@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <17876B7DACCED7E9.31286@lists.openembedded.org>
 <178B8EC90B7BB2A5.10810@lists.openembedded.org>
In-Reply-To: <178B8EC90B7BB2A5.10810@lists.openembedded.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|DU2PR02MB10088:EE_
x-ms-office365-filtering-correlation-id: 1f6e8f74-25b0-483d-851f-08dbda25f93a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 f307zTPAN1ZVBe8vEHYgEcw5WJ04B4RfZD28//ApuKMy8UpHD+5cokaL7RGhF8vq49HgNM+kXcoIEwPmeKrKKpEXgBmYFu6qJcbT8mTm/LrcJmlzRGbBgAwFJB8wfF1CL9uHOVdhHrC5s6Bwm7gWX8FJUH/RfB1Gdz5UvfqIzV/4QpCkv6OkkJ56I2q+/FyT7FQaxkQYc3FOWOXRza4AwteOy+OWNpHpn+5mqNKdCYkQhy1Glt/u6XUTBYpcW4aUooJVHOYxOHEFIutc8Ufh5V5A0hBD/qJ6MZMhnEo6IpZVlVIYbgJk+htOPzybqx0IdFQUHigHHhwTZoK5rYrUevPVjgJ8rHK2cpCeD0evvUAJI6P8rmMcrOU7YPHqEW7CdtjGENCGK29xopVq1U4jVHo7aiBtwAoB5yjFX9bqwnOTS3a58fwsubTFO8wwifVi++yVPg4D25b8TczLSUHjg3YuIh6wU1IzwgkCUq2V01hiq565EZMAN705CIbJNJgX1/DRZp+r1RqWCITcp7F+V1ko2cpe30m+hOa8lFsAO6ZD33UrFjAbZLQsWXOG+i0kjtuf77MYeO4Xf3O4SyTXq9RnkeaS9nG1XmyRrOJLJiH/ZAfcYIRTEb1CHbUHDmYP
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(396003)(136003)(366004)(376002)(39850400004)(230922051799003)(451199024)(64100799003)(1800799009)(186009)(2906002)(8936002)(8676002)(44832011)(52536014)(71200400001)(478600001)(41300700001)(6916009)(316002)(66446008)(66476007)(64756008)(5660300002)(55016003)(66556008)(76116006)(66946007)(6506007)(7696005)(53546011)(26005)(9686003)(83380400001)(38070700009)(86362001)(122000001)(33656002)(38100700002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?bqNTnM87bCkI9NOEIBsJt3EKXGOXsz1kiBJxEp3KZ3Oceq4RmDcH0njv7ho7?=
 =?us-ascii?Q?OStiu3mK+MFlmKyHAHznc7z5ecoddOsfnD4cIl4c/G174sljFuJg1Luxw5yP?=
 =?us-ascii?Q?vwQ96+4sepgGFkaO9DvKO7y94cxrg5JN19rx8MPeXaB/53CIKHFlIqPyBV0f?=
 =?us-ascii?Q?hNuEv69G287P3ODazC2Eyd5hwcr6OPMy7OmTK+eGA+Yh6kdQIxbxRyW6sKvj?=
 =?us-ascii?Q?HZzGdJMAL1WWe0or/zhRWkhtmJrMrYjhlcbgXGAMg01MGTWW8tHM0kPaVPdk?=
 =?us-ascii?Q?PSk1ixP0UxjKw+4Mx/S6aTDcYQghduAlV+1Xll3F45fUoWWWXVtDhnmtdiJr?=
 =?us-ascii?Q?DeCDHE7GfPpoT0P1psgNglApbFmtwMwVgBKH2BzHoH8m7yR6fFuPyxP/kUwl?=
 =?us-ascii?Q?Jric7wz2Ze53al1gIVA7xBsdeiw1kqpPUT8SOfTg9cavENvs2aON4R7TbdsE?=
 =?us-ascii?Q?D0QBZCyZ5zsDwtG1Y9drJHnUVpJW0575bhXQ9LdCuVK9nYOa4sDWuOWAgREC?=
 =?us-ascii?Q?ZZ/TmalvrbdykLqzTyNGLpBPhlu+otVKlyeiXb4D5NB8ERs2Q9+++PMtfqOT?=
 =?us-ascii?Q?dAZ1tfzYlsA6vNDrp26i7jFKj9osmL10jZyMai7OsWUzyKgPDEl8u0lP+NeH?=
 =?us-ascii?Q?QvuxNKVw4z0u36GeXMJmX1W2PYM8CbZ/qgqNCpFTXOWHOI1KF7w7oKXuM9YJ?=
 =?us-ascii?Q?THOh8McbiRmGCCS/Y2vrZcJPxhLQZFtMoBQ94D9l2I6aFZxB8xYiXJehZMU2?=
 =?us-ascii?Q?HuEJmVzem5nmcJ2CSch5Fja9XdJXXPA1NGz9LHJ8yfrjMYDSDy1utVrE3QOm?=
 =?us-ascii?Q?BG2RL4k/+OwDoEI9CUUBgiQb6XLX7Y+WM/6dqTvBbDDhEP/mdhDRoHNS4+4X?=
 =?us-ascii?Q?fmSd6MYDMVkM/PaBk8pBEw74IATIsQvuPrHC1CqLypXp+6cImGvf701JJkjE?=
 =?us-ascii?Q?Uw2BCeLCnVOAb6kFcYnPPgfH1j4cUdIL7L1rVFFDl2yOzjjgwi8R+qAi9Q08?=
 =?us-ascii?Q?vPOuOz9ke2gZzBrpMh1Uk14W3YDOt6Zk2gAgWWK6r+MxsE/EONiV37n2a4IZ?=
 =?us-ascii?Q?4EUxRkVxvV3JuccYj/YaQ8C85d93ktYh5hGa0cnCEAafBo6TOz+775Qg+SEk?=
 =?us-ascii?Q?5140IvvpbiGWJYnpyQ749iH4C85eeulMT0FjpvQfyfDiDPD4JcZ5P+lct7R8?=
 =?us-ascii?Q?GzPU0UffL4253PX6W5pwF1zVAaIS4JAXYNouRk6uVYkSDZbvl9hHPww75UJK?=
 =?us-ascii?Q?6NZ0JKsiQSOUHcu6k+jpBprZtejfVXbVqIHfTjR7aby1AeEHXMYPGg2I6lba?=
 =?us-ascii?Q?POKUPnZdjnsodcyLWHrAztnoQpcU3mfHe0LH8H5hTjqAj3PBQbyf8ktocH7o?=
 =?us-ascii?Q?a0Jm6E/8sJyg9BLVZoldn7q3VZMVIS4TpDhfKDnivuM7x5IbAJKtskyXtSXu?=
 =?us-ascii?Q?pspMfNkHjJH3sfyCZ5nd4uHo8PMSYtu626chAfezaQGfwC+xx389w4EZ3fbT?=
 =?us-ascii?Q?F/qujqz5KgwlI2YtQJYNPrIFLFlfzF8EhcDDHf+i2k0BqKn/9f4LjyHSaj2R?=
 =?us-ascii?Q?rsE+SczRaod/hqGUpVA=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f6e8f74-25b0-483d-851f-08dbda25f93a
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Oct 2023 15:28:03.2593
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: U+q59SQ+s25pSwgHMGpQt4KBizD3+np68c5DGfKx7KFnJcc7EioyIuczjPkvZc/n
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR02MB10088
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 31 Oct 2023 15:28:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189850

*ping*

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.o=
penembedded.org> On Behalf Of Peter Kjellerstedt
> Sent: den 6 oktober 2023 17:38
> To: openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core] [PATCH] oeqa/selftest/context: Rely on bitbake-get=
var --value to only return value
>=20
> > -----Original Message-----
> > From: openembedded-core@lists.openembedded.org <openembedded-core@lists=
.openembedded.org> On Behalf Of Peter Kjellerstedt
> > Sent: den 23 september 2023 06:06
> > To: openembedded-core@lists.openembedded.org
> > Subject: [OE-core] [PATCH] oeqa/selftest/context: Rely on bitbake-getva=
r --value to only return value
> >
> > Before, "bitbake-getvar --value <var>" would include log output togethe=
r
> > with the value. This was handled by piping the output to "tail -1".
> > Now, "bitbake-getvar --value" will no longer output any logs so the
> > piping to "tail" is no longer needed.
> >
> > Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> > ---
> >
> > This of course relies on the corresponding patch for bitbake-getvar to
> > have been applied first.
> >
> >  meta/lib/oeqa/selftest/context.py | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta/lib/oeqa/selftest/context.py b/meta/lib/oeqa/selftest=
/context.py
> > index 5a09aeedff..c148aa5aab 100644
> > --- a/meta/lib/oeqa/selftest/context.py
> > +++ b/meta/lib/oeqa/selftest/context.py
> > @@ -111,7 +111,7 @@ class OESelftestTestContext(OETestContext):
> >
> >          # Relative paths in BBLAYERS only works when the new build dir=
 share the same ascending node
> >          if self.newbuilddir:
> > -            bblayers =3D subprocess.check_output("bitbake-getvar --val=
ue BBLAYERS | tail -1", cwd=3Dbuilddir, shell=3DTrue, text=3DTrue)
> > +            bblayers =3D subprocess.check_output("bitbake-getvar --val=
ue BBLAYERS", cwd=3Dbuilddir, shell=3DTrue, text=3DTrue)
> >              if '..' in bblayers:
> >                  bblayers_abspath =3D [os.path.abspath(path) for path i=
n bblayers.split()]
> >                  with open("%s/conf/bblayers.conf" % newbuilddir, "a") =
as f:
>=20
> Since the fixes to bitbake-getvalue have merged, it should be possible
> to merge this now.
>=20
> //Peter

//Peter


