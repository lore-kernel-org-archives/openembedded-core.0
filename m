Return-Path: <chris.laplante@agilent.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 329D8C3F6B0
	for <webhook@archiver.kernel.org>; Wed,  3 Aug 2022 21:02:21 +0000 (UTC)
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (NAM11-CO1-obe.outbound.protection.outlook.com [40.107.220.54])
 by mx.groups.io with SMTP id smtpd.web12.156.1659560537846335342
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Aug 2022 14:02:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@agilent.com header.s=selector1 header.b=zw4/4ITV;
 spf=permerror,
 err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}:
 invalid domain name (domain: agilent.com, ip: 40.107.220.54,
 mailfrom: chris.laplante@agilent.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kV469kR9akH0kLMERjxXcLAz8/2HFmvOTuy9+T6chqy+8eyCIjNd6y5KxmX6Cx1ppd40oWCoist8BiDaSSWHKfFTPFWSo2wRiqPKYb6rCIA5VGTjbQe2Z0AUXwZ5n4nSbS6WFGjUzX0CQ3LdYd9yV4rpu1ApV+wZlp3pICicD2L2kTnAHsegj13jfEDXV40OzwK/JdOq8lGDRYm3z36s8SVMSTbjVKfobTmyms4rmB2L3OhISnBq4lYu0tvNc3Obh0wzmrq9bKhJXJUJ7MiCCiT0x5N//W964lBGRLzr62s0L3VFUR+2O7G2+L9qJzMI1c9CMEsW3x4UoxugHPcTyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n8A7VifzSnOOlY7ZO2M+zghqMYsViFkw2op89CmH4LU=;
 b=ofo7k+/llZCR964xFnaYiIBQTYuRXPVb2OhSXjzR2Rir2cYuOYU/o3uVFAXGKzcotpSuKtvNBEbw9xxZhmdNGlAothMYPuRtApSnRlBDYO5urVsMAG6vzOqvG52btjdIpy7DCEDYULQeqiAQkYZ1XTl36Q5rQzzObBBQbUJNtvLqUV78WKuH93wWcutqrq4qZDmpm7DTFhZ6m8DTon9xxTRH/CaLIRudUu3lJMJyckCSXknuH3sxYTeBxms9Cb197GzWHMr02bE6x2480tv0qCvB3H75NXj+cBwTRtGSCsYS4Jk2dW4tshM1XWHHk3IPiAgswxDfF76Cb6pFIvn86Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=agilent.com; dmarc=pass action=none header.from=agilent.com;
 dkim=pass header.d=agilent.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agilent.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n8A7VifzSnOOlY7ZO2M+zghqMYsViFkw2op89CmH4LU=;
 b=zw4/4ITVrgywAlYAtLHWZ3WrtNV31cuPFZckukoHqKLttFyoyw29+WFbQK9jXDRIKbdcE4nbS27hh35y+Z4enpiWP+Px2heQ5p20vVXZYELMXHQqfgAZb0IrQQWLjFm76VEKRzNmzV1CQou6kgtPkN7YEFFDXS6GcKPM+Ts9mNh0Ot7u0qE0uY08BRA2Buyubc8IuC70lNkUDAKBdU3SxzccPt14st69kh+aDNcuNiVfbbG12Eoh6ZCtrHhl7o/lWuHgrB+EIHbPh3NNOLZZjEIWMjsOjRMjftCy1Z/pSIm1RSCozz7i+zuam9VsM5wxUjZj4nOF4WlEYN+Mq8dGfQ==
Received: from DM8PR12MB5430.namprd12.prod.outlook.com (2603:10b6:8:28::6) by
 BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.12; Wed, 3 Aug
 2022 21:02:15 +0000
Received: from DM8PR12MB5430.namprd12.prod.outlook.com
 ([fe80::a588:9ba:3cdb:7324]) by DM8PR12MB5430.namprd12.prod.outlook.com
 ([fe80::a588:9ba:3cdb:7324%3]) with mapi id 15.20.5504.014; Wed, 3 Aug 2022
 21:02:15 +0000
From: "chris.laplante@agilent.com" <chris.laplante@agilent.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: "Openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: RE: [OE-core] Introducing yb - a new tool for Yocto environment
 setup/management
Thread-Topic: [OE-core] Introducing yb - a new tool for Yocto environment
 setup/management
Thread-Index: AdinQOzDt2w3R+XrRs2owi5G2reWzQAOGaoAAAAKQcA=
Date: Wed, 3 Aug 2022 21:02:15 +0000
Message-ID: 
 <DM8PR12MB54301DF4A7AADD3F59F00B668B9C9@DM8PR12MB5430.namprd12.prod.outlook.com>
References: 
 <DM8PR12MB54305682E3F7A0E3C8D480DB8B9C9@DM8PR12MB5430.namprd12.prod.outlook.com>
 <CANNYZj_z_sBEfsHWkNeBwbY5M+rMPowB4wX-ArSzjnM5rkea9A@mail.gmail.com>
In-Reply-To: 
 <CANNYZj_z_sBEfsHWkNeBwbY5M+rMPowB4wX-ArSzjnM5rkea9A@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=agilent.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ffe797c7-b961-4f39-a944-08da759371b5
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 4+WsAyDFiaXWmTunEf4GhH2W6J80z15KyBMCBCt+aTJLkm1Z++AoaodG06+KEvmvYnlEUEKXLh4VNrWyylrb0hqFdHeDXvOiJOCOAGru0RYzoDSnBPH+lr2cvJ49ZCTw3Ev53xlBHcco5ruzmHyp3pismCTgIh7/H6XgBMDrKqIesMFePGo/2kqIjmtK4E25rGGQwK0cNOhH8bkLjsV28V84FqpHY+AMmBx2T/9rUq8vjF9AH4rW5jS7Op2sZAUBqXD1mI3Oqzzll/3DYWjnz2t7DTNgZT+eb9/EMaqjerERAMPZw3hWiAjjQvXqLl3uABi5/aUE4b456zvy12LrXHsCTTr5UKkOsXrF3UPZ3Uk576GRdGsGhd5/5MfU/zjsBh3H6NZDCUiu4mTI+K4GKJfFIHFyvkhspK5OI2hAPKLpxwcmrYHk9kBMPLb997/NUO/F/5uQc7VGZvsOqPX0Mnfw/27jJnFmpEpV3wNsY+7UKP1WY0aYzL6RYEAgox83/Cj1JE18fNXinW45zb1+/R0J7z1UZnari6YTKmWPIedb5TPqQ7G92R4D1prLtTzMW/R2DsP5bzjQFfzWEzRSErerBo+KxGv6VLbzg37Rbdr8AlYgSHIjTHmY/KP2BmcUN3YoJYRlK5D5R0dEstylqu5SYS+T6xiXZeNtGiWY30oyTDzpgnzF5kWcv7E0UuB1hQOwi711xEgoWGOoQu0lczxi4q/rSEHbc1sXqAFZXx+6rEfDqiUzunp+s2cItmlnf28bAddPPz23s4IFxtx5O7RFa3LjVMlun97FeqrDqKggEK0QqWfr4fth+2aqaVRNc+TUk+0WMAcWF4ytm8DDjw==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR12MB5430.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(39860400002)(396003)(136003)(346002)(366004)(29502001)(26005)(41300700001)(38100700002)(7696005)(6506007)(86362001)(54906003)(6916009)(316002)(33656002)(478600001)(966005)(9686003)(45080400002)(71200400001)(55016003)(38070700005)(122000001)(186003)(83380400001)(66476007)(76116006)(2906002)(5660300002)(66446008)(52536014)(64756008)(8936002)(66946007)(66556008)(8676002)(4326008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?qHTT8l88A6OLbaYMk+rgKT5/HR6r09DwLpm07TE2cAEi2DKRJrQJl81ItQHd?=
 =?us-ascii?Q?5SWjcShidUUlazIkrdz9k7+WkO6K24x01uUNIEW1CuAvdByYKnzjkks+c7de?=
 =?us-ascii?Q?OLsggjuJ41Lb8BA0ZxnR46wmbsJOF7IqjHgJyBcgyJVTQlQs5mvihN4pnlE7?=
 =?us-ascii?Q?9Ga8r0IQFe3DSXVjFmGV098n+qPPH7JVjgMBGnOSxVokCDavijHHFOBFztsy?=
 =?us-ascii?Q?ycgrgPAqiHcauRdxU20I6yXeqhfbI+bQ58n8cMOOZ3AIR4VYsxWeiyXemJH7?=
 =?us-ascii?Q?Pfz1hNC3JrY2aMrWk/R/Dp7R/ANrXeDw28cfbJKszIoKZQbPk+BjQm1FN7N2?=
 =?us-ascii?Q?bJVVXHETZV93xveIzoI6lU8n0jRdd4f5PNo5MJWLnUXl3AvuvHH6Q5fX2I80?=
 =?us-ascii?Q?HXMBWGidCx6ZQDaxImp7E8+Gv8IGa5gatkeRLweBGcHex6+zMVdQExlgYnH6?=
 =?us-ascii?Q?WfqawwtbOdUqPFfRlqBVb2mPgGMhVf9+/grhwb63FYekAs6mGLZNlMdu4vCO?=
 =?us-ascii?Q?2VxbPWU1C+GObXICSyZahCpk0xg/hE5gbHGdBn4CKDykb30e/Q8m4/yCO1G8?=
 =?us-ascii?Q?olGG3dEs77+WDAVF7mx+UL6HkWG7Wbx3HALo1HtSpW4kXujIxXU0gzDukCal?=
 =?us-ascii?Q?phI6JCznAYR8ifMUJgADAzl0y+yc8HgiOqLqAe0AvOUnBp3wua66WsTCpVgo?=
 =?us-ascii?Q?h/1cptbOPuLWi6iKtXsP2MzwfeyJo0WQ+IONgDQj6lUFnz2WDp2h4re+WIGf?=
 =?us-ascii?Q?oyLrRpwNyLidrHFhwQ8PrBMttvzJIuh1hPZKZWQ9nYLzFdEe04cruuGoVDKT?=
 =?us-ascii?Q?fKDhdIx4VYS1lFsHKwkljvupNQbC42GUa61/CQ66vC0Gr0VAdS0qs/niOyK1?=
 =?us-ascii?Q?oNJkEkf131MJJRJz8ESjmiASwcKFXHUKsOZpEoW4/faRpgQUg8YCgE+Kaxem?=
 =?us-ascii?Q?C7lueXT5h5YtjYhwFS716vDYFbvMhWLx+QHRaIXxmfkpxv8l0uE0Bf6B3GM+?=
 =?us-ascii?Q?CcrP+GloNINd58HXnPigAmCOV6H4i3p4Q6nGWPajuHXDlmcTn4xD9Gr1G8I5?=
 =?us-ascii?Q?OyJ3ZiE4r8FmztkVHuC1drhtbjdclGqEIr0YUpFiR8DGRO2TSzw8vVnso1xL?=
 =?us-ascii?Q?uU5IKHr1mLLdLk3EfzdSDL/3e7hEydDqvm7lGzyS6v8MCwA0oVi7bnL2AlAM?=
 =?us-ascii?Q?4BxOG8qYYxU3ygA5qDJI9ubSCjF7JgauwqQLw7xW4zAyBehf/0TlCUvvZFap?=
 =?us-ascii?Q?LJH2yaZUh1TtmwJO0BN8w+n2gV7wGfmBdPv2t5GV3TzZxE4BhzIzilNhWwJV?=
 =?us-ascii?Q?LKE7qkrbxVOK/aTSWmvVgmSn4r4+TzPhuJCMdHdIeoqueNIeX3yuqCr6ilpl?=
 =?us-ascii?Q?iouTLizEjNBOOG7Mg/bxIVeRq+esjxaWpukZqYL6/kVx/p9tZs7ocsnOv9Tu?=
 =?us-ascii?Q?+tzYaBaptXftcDBnNhAHegzpc60KAEV3pnUenQBRxUZBmmOaDHWIgxQ8FJsY?=
 =?us-ascii?Q?jc2yPqtm9wycr28qN5BBiAYtsO54DtwZGjsD0mN4HqzO8Ezmlr57BZfJ3T0I?=
 =?us-ascii?Q?Z3oQMmadFvgGItwIIwGiggo38JKBfmu0ZnFjRn7l?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: agilent.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR12MB5430.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 ffe797c7-b961-4f39-a944-08da759371b5
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Aug 2022 21:02:15.4094
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a9c0bc09-8b46-4206-9351-2ba12fb4a5c0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 L0Sr+anzpu5FjPe7ahEb7KL8u7uH/YwVDR87tOBXu9QQVLgmqJmrsySdVOKUxBg+GuBUYs7heHvCG3FFk6ppeenxuYzCiTO2LZuUJ41CQV0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5849
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Aug 2022 21:02:21 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168827

Hi Alex,

> do you think any of these pieces could be moved to 'official yocto',
> specifically as bitbake-layers subcommands? I read through the README, an=
d
> it seems that things like 'status' and 'run' would fit very well there.

I would agree that 'status' and 'run' would be useful additions, though I c=
an't say I'll have time to volunteer to do it :(.=20

> Also note that there's a proposal for a json schema and layer tooling tha=
t
> would be provided directly in oe-core:
> https://nam12.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgit.y
> octoproject.org%2Fpoky-contrib%2Flog%2F%3Fh%3Dakanavin%2Fsetup-
> layers&amp;data=3D05%7C01%7Cchris.laplante%40agilent.com%7C533ad5afc07
> 54a885d7808da75907dff%7Ca9c0bc098b46420693512ba12fb4a5c0%7C0%7C0
> %7C637951560728773611%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjA
> wMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C
> %7C&amp;sdata=3DhN7QRlYqAPxigCSQfNlaCM7nWZ4vvSLv5IWzckYWAFU%3D
> &amp;reserved=3D0

I saw that a few weeks ago and it is certainly good work :).  (as are the o=
ther existing solutions, like kas, whisk, etc.)=20

But IMHO bundling the layer setup tool inside bitbake itself feels a bit li=
ke the chicken-and-egg problem. I'd like my spec file (or JSON file, kas co=
nfiguration file, whatever) to be a complete manifest of things to download=
. But with bitbake-layers, first I need to know the right version of poky a=
nd where to get it. Also, I think it would be hard to implement 'yb sync'-l=
ike functionality there, specifically if we wanted to be able to change bet=
ween poky branches.

Overall the thing I like about yb is that it is independent of Yocto/BitBak=
e and easier to setup. Like an IDE, I can install it once and use it across=
 multiple projects.

> I can't help but say that there's a certain bit of irony in referring to
> https://nam12.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fxkcd
> .com%2F1987%2F&amp;data=3D05%7C01%7Cchris.laplante%40agilent.com%7C
> 533ad5afc0754a885d7808da75907dff%7Ca9c0bc098b46420693512ba12fb4a5c0
> %7C0%7C0%7C637951560728773611%7CUnknown%7CTWFpbGZsb3d8eyJWIj
> oiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3
> 000%7C%7C%7C&amp;sdata=3DuTq3p2HeA0Xfe3DMZ1fxkAxlHfOJNXM4za2XIC
> v5OcA%3D&amp;reserved=3D0 - when introducing yet another external tool
> for yocto layer management :-)

The irony is not lost on me :), especially given the layer setup tool conve=
rsation last month.

Chris

