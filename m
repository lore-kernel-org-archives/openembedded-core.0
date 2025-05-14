Return-Path: <mark.jonas@de.bosch.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD8A5C3ABD8
	for <webhook@archiver.kernel.org>; Wed, 14 May 2025 16:45:21 +0000 (UTC)
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (EUR02-VI1-obe.outbound.protection.outlook.com [40.107.241.86])
 by mx.groups.io with SMTP id smtpd.web10.106853.1747241099019341625
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 May 2025 09:44:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@de.bosch.com header.s=selector2 header.b=UzDJ4tpR;
 spf=pass (domain: de.bosch.com, ip: 40.107.241.86, mailfrom: mark.jonas@de.bosch.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yp8Sv0i0bqfyVh9jPwUDuyKvGkqLVIhg6OcjglugvCR/wJmvdzBkHpeDHo/WPENQtaXTLI39h2KpwMWqfCc6/LRt8OEwFSERBx/7rSSyvm9rooXYvu08NluUIgKHiuqPbDNALAhLkQF8qZgNnyPAI4kL/utRa7Rvy/PaBs7+j0cTWHvOC4PE/a2OkBP7kGifEsHCFNJ+TBAxFUJOfrz7+0RxqNDejtQ83I5N87aWwtMUssuUc3Skd+2uf4J7BD1VCY4FHoV+q0/E0mMvmeX+aVQXT8INv37W0rN3DEKL2F6HCU5oKYq3R7VaHA7KL61YhdMj8TV0J8dL/xwmjJ4P3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XBY2VRH9qKGdz1Pidnr7qY8bejj8CmgQVIJIqVGBx38=;
 b=UQwmDokZIwAcfZN4TvBLlhybJA+MngBT7WnGbodr4Zg34G0Ar5I16EDYMnGLxLVCk04w+VJuDJpgk+jvtv3qn/wNPcWXuBgIxf7bZvC+aVE2fkcRAyUTF+ReCCYMBNe1GyaHa5bM0yf63WvAJUJxTjDo9A+zh5C79Y59gzEbMLq7fO7IZQBstE6Eq15FvHFL079tLej2I+YnUUtbH3xdwhfhwmdEFdMV1E1Rka/miUBgvQPvEdhvFgs1BrriYLIXK+EsJk7eze4TRbs4H0hYjRiiVUyHf6u2EkVnbZ17f49SRoJVRSzpCeqVjKrnk90UNSFFgEZ+8rUosMAANfevHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=de.bosch.com; dmarc=pass action=none header.from=de.bosch.com;
 dkim=pass header.d=de.bosch.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=de.bosch.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XBY2VRH9qKGdz1Pidnr7qY8bejj8CmgQVIJIqVGBx38=;
 b=UzDJ4tpR1LtCf3ewF/PnUVinanvK7mdFd1uxICHGVm61x3ZS0G6BrG3+zw9OMzN5nAP/XS0bZ1LlBHg95dOEZquZVOq6K9cgBysSykxvF4t7id3KWGQESRN0hv+HcXfl9wKToeiVNbyUYlmSUHc8xs5NHmKTLgKKIMGjTtrq18ux7gDKGoU73LxAlLfIkeu3a1fDAh3BHp/WefqAplC0Qi5vM2/2M1NyOtoEzH5+DFFFurP9OfOYHhE1SePVuY5TPa9FIq48O/s355rVt8lvFleIeGd6fVvD6/wCLNTPkcKTZyqfO1xhvkrUr1TDD8SNutCc2GRWg5XNKelh1IfWNQ==
Received: from DU0PR10MB7076.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:423::12)
 by DU0PR10MB6801.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:477::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.30; Wed, 14 May
 2025 16:44:54 +0000
Received: from DU0PR10MB7076.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::104a:4c1c:9bb3:3036]) by DU0PR10MB7076.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::104a:4c1c:9bb3:3036%4]) with mapi id 15.20.8722.024; Wed, 14 May 2025
 16:44:54 +0000
From: "Jonas Mark (BT-FS/ENG1-Mue)" <mark.jonas@de.bosch.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, Joshua Watt
	<jpewhacker@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "raj.khem@gmail.com"
	<raj.khem@gmail.com>, "Simoes Ricardo (BT-FS/ENG1.1-2)"
	<Ricardo.Simoes@pt.bosch.com>, "Jonas Mark (BT-FS/ENG1-Mue)"
	<Mark.Jonas@de.bosch.com>
Subject: AW: AW: [OE-core] [PATCH] udev-extraconf: Allow optionally skipping
 systemd-fsck
Thread-Topic: AW: [OE-core] [PATCH] udev-extraconf: Allow optionally skipping
 systemd-fsck
Thread-Index: 
 AQHbwMcK1P7LHOpPakmXu6OSbHJlDLPPOHqAgAAWCTCAAPbYAIAB+T8QgAALNICAAAkx4A==
Date: Wed, 14 May 2025 16:44:54 +0000
Message-ID: 
 <DU0PR10MB7076EA25CDAE9373D5294570AD91A@DU0PR10MB7076.EURPRD10.PROD.OUTLOOK.COM>
References: <20250509094421.20786-1-mark.jonas@de.bosch.com>
		 <CAJdd5GZ-LkBC-8iZXhAYvKsOhxCm2hYL5tCkTS9SOud-d5+ifg@mail.gmail.com>
		 <DU0PR10MB7076F9B59B85FEC850F9A8D9AD97A@DU0PR10MB7076.EURPRD10.PROD.OUTLOOK.COM>
	 <8bbbcfe81a99f36e90718015150e135a4ef8202b.camel@linuxfoundation.org>
	 <DU0PR10MB707667F8519C383B05E463FEAD91A@DU0PR10MB7076.EURPRD10.PROD.OUTLOOK.COM>
 <be86e243e0907f6ea6bc7dc51bb0759ed5fa1fbc.camel@linuxfoundation.org>
In-Reply-To: 
 <be86e243e0907f6ea6bc7dc51bb0759ed5fa1fbc.camel@linuxfoundation.org>
Accept-Language: en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=de.bosch.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU0PR10MB7076:EE_|DU0PR10MB6801:EE_
x-ms-office365-filtering-correlation-id: 9c5623f1-d64f-47c5-5ffb-08dd9306a784
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?E9c8uT08YlxAW7IIdwL1kRa7wcugR0IdDd6oF+pGPw9Evw5MXzTS5f5ZRGhx?=
 =?us-ascii?Q?A/Vj8SSxX2du8YCz8R/k/RaQdcPcazIMEhpgDIq7nw3CdlFdXTPU7rMlbBrI?=
 =?us-ascii?Q?M49rtl62Z0wq3f3IYzAm2QXYBfU8+vQln3ZZrozJcNPdqMVdsI7OHi5Scyj3?=
 =?us-ascii?Q?NWO7pMr9D8PHKXE5R6rKCH3dZeTuFGgqzzwXZANgZZhYbmKZl2EBUU/dS76A?=
 =?us-ascii?Q?Po1XaqGyABiN8jAPSvgB4L0yimdBVhbvglh7ilTYuOeKdm02B+tbkLJeYRWe?=
 =?us-ascii?Q?UtX6rKBAWhuhpBrdy3eYgg9oJ6cIgyl5XebJZMMiUbFR677tjKro3S/ETHiL?=
 =?us-ascii?Q?RRm1/Fs6tlYWyC6zCz4MJAEKae2Z0H7axNWzmVNftzDLx3ASjMwsCBE0BizR?=
 =?us-ascii?Q?bdnXr83Q0nLrDRT2//e+iyhehwbzTDFnjnmFFuv6WsB82HMfotEXdNVMaAnB?=
 =?us-ascii?Q?xOxNM5LuqXyQmMR6weYvEPZx8O9qvu4/pPlCN86LjHoHGwKqc3R9yq6Q5Ofo?=
 =?us-ascii?Q?Z6NFiU7tHP3k4YfrRvwGQJP25hiYafEiwqQwRX3M08rn1pSAa32QyH41gtlo?=
 =?us-ascii?Q?5/dEz5n/ikEGa+UsZZ9rWq9krUd1HpDnu1IzG0Yz7vCF7+a2KtiSo63dJBKj?=
 =?us-ascii?Q?iHz4akEbdu4XiUoRNYo7ssdS72+JkO8W5zgyljR0gEispG2G+FXDl/kbg4d3?=
 =?us-ascii?Q?h9sHkoxDsSqlGhuyFl+3t4Mk+4rkXJP8xlr2n2ZHZjNgJ9E7nmAK/q7tK9U5?=
 =?us-ascii?Q?fSvok1EdJiEKGpI9b5WJ4PpjIS/Ki+68hHe3V0FflV9eZVa1aDLGDLuDECrT?=
 =?us-ascii?Q?7jeh1z+fwGQdzqGHTfEnVCNGNBlcF2GPFnkjx9a5urfFVBqyVdnMzjOwP3Zp?=
 =?us-ascii?Q?Pte6ADjsr/isuarSWCbFM3MBvWu925JZQ/jGE3p0ry+M3Z1MmwKgCr3dfIzE?=
 =?us-ascii?Q?G7xBJx4jbHQtym3ZryTELPGN9In842bsrX7dZbp2ZgIe0o1bj+8mVkxE0wTy?=
 =?us-ascii?Q?b17fggOzguYnBnRyOj2BDtGCD35XGn5tNMXXsNm31/KKgjVR65EShtbKc/3l?=
 =?us-ascii?Q?UlOIR+JnotlSEV6tBcjugzMZucwI4Z+UinQg21AA+YXG5joCCGa84tMnr38S?=
 =?us-ascii?Q?+fqqS6PV6+9JooOzqCfsnCjmQxiUix99IKx5Y9D45HIbDRefI+P7inWoRKqI?=
 =?us-ascii?Q?vAnizVcwU/HzyCUP2BATYj+3qMtx60h8mOlnTloV+MWAA6UyczZPkULh6WeE?=
 =?us-ascii?Q?Ox8IBVecZmoljjTrQIZerg+jy0+reSsiqZIiTdEy1fVuDB7qihY5KzoLN67j?=
 =?us-ascii?Q?MfikooFtH4TFzCpbWGm+zgxu09nVNumvMzHziUM9h2BvUADIiqUdPH0t0ARv?=
 =?us-ascii?Q?tOayh8AbCSEXWBCDsGSdq1qbCQpu9UzbnU8XKSIzzxvZIlUgc0egpjoFISap?=
 =?us-ascii?Q?D8mwrkIMQEd3s1H5Lrfn3WdiqEhtvMliHJK0Mw4Q1UQUJL8vQ3SdXFpa7+3D?=
 =?us-ascii?Q?HsJ9uvh2Rx4be2A=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR10MB7076.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?oTpJayDcE0FiW8pugDKI4YH22/FXROPomzFo7jxu5sv17FRkj3STV1u9JkJg?=
 =?us-ascii?Q?C82WuIJfgq6K7CYB+zM84yGhqFIA/XkFyCdmGbBYYao0lcBSQch949vqc+Q9?=
 =?us-ascii?Q?5eBbUQJrrgkiToWCTwOXT4dEAEPcSDjPk1mknf9HCr1rP1Kka5JPL6CkosGj?=
 =?us-ascii?Q?PSxH2fIjpcn8lwV3gKN9WgEg7zzCSOL7Chy2kNBUCpxVUu6KaOiAAjnfFQic?=
 =?us-ascii?Q?BYAaGRsk82xlwB2FDuVH6IcCyVdWDnbySBatLhEbEzE+Q3nK7DnoBhFa6Vth?=
 =?us-ascii?Q?GlQazbNlxGvNWlQ8lYUV8MDxuUgDvtzXXC66EbtHRVq109Z3kZPUh+VKBZ3a?=
 =?us-ascii?Q?WIkA0i4ArOAaiaiKXTuTsXtWJMKaxBAvAc+dByu8Nn+J5gkX6W3ubqHQji7K?=
 =?us-ascii?Q?CeSdUJgXjdSJfcOLUdpYw90bFZKH3fD2QOlAUsMGHz0yp9TwV6B2kzwRHbOF?=
 =?us-ascii?Q?z/MFn4Y90r4vXTb1f7vXc9vMNZaksTGxOMOr5XEAg1z8+HnWitsYc6fSL+92?=
 =?us-ascii?Q?lb25Yja/cQv4OWYRISKtA/x1tNFNHa1oSZRItCMIqD6EqlIhg+Z0OZ85ymSi?=
 =?us-ascii?Q?nqyypVl6bYVYYPZgV4hmP9vIqwqyaaeYNpGnUAco+VCT5OEyp2HbvPsGqT8V?=
 =?us-ascii?Q?MVZ+Cw3P/PAiH+hSBU/e7eI/59CgfgdwHnyv+Naw5ailBtL0+HuzFzYWa7wn?=
 =?us-ascii?Q?lCqc9Srqnv83pcI00pDtr0XD1hZJrNtcfl8aZC/XGJAklMYwevLDMBT3zWU5?=
 =?us-ascii?Q?V8LLjs/20QzX+VTR+R+K4gxGtp3R+dJKpw3szYoi9JzUKm/PwcDqK8y8rJSU?=
 =?us-ascii?Q?3haFdJaqBqexezuG77xY+3G62c9anfAw6N/Sm/+WqR+ImtkdJs5aIBABEoFh?=
 =?us-ascii?Q?zXBqQsuS5SW4lZ/rh9lWAjNuqxq+Kt7RMQvbj/IGOtfYwO63t9mN2jeMvqe7?=
 =?us-ascii?Q?hlyw36OsQyGfPB8EzauGbQBChGRoHRxtbQT8mHP72iQpkuVVFyR+r90dB+bj?=
 =?us-ascii?Q?eumLHngps37m2cJP9fMeP7ruRq3xxBt321DEsRFxvsykqpAdToxeSTakGFHJ?=
 =?us-ascii?Q?VAfZIUlQ2yYOyZahAR75GsPZ+y9wCgFy2/5XADOsRqzo7VMsJpeYMs8IYjZ8?=
 =?us-ascii?Q?V2VIdPwDIckPuuUPQdwNQgj16+igjiUAZuWmkqP+x5/VWIvg1SDoGCP8qaeL?=
 =?us-ascii?Q?2ofYoUMjl0E5l9ry9UKZGZnCrB0oL3SWYlLdSZ+HYWShZpLRUgJ/mUp6CvqW?=
 =?us-ascii?Q?ydI8kQ54jS+0QpsIo39gdUeMv8Vd8dtgZJhd8GlGQ52Winy7/f9u/ew3RbdD?=
 =?us-ascii?Q?37iQj2AHlqV3nyhT6WsPz1+fXX2EBgW5jqPAMBP0qMrvKlo85vC9+2IyIOXB?=
 =?us-ascii?Q?wydqRoZkbd63qUi0d/4oOkpoB5vdGNVAI30vD3w2NYGJruKgSlZcDChcozH/?=
 =?us-ascii?Q?sGXYCIJs3R7pAisfknY8/odxeQdr8GRWlmarZaX1Fjr/rn8M2iog3cXOBdyh?=
 =?us-ascii?Q?wqfDogXFzWpLKbHC/UUwvYP9ZkJz45KciVENZjc0L7JIxeMG9fw//As5WvCi?=
 =?us-ascii?Q?Vb0Uby/yrvaTl6ER0hc=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: de.bosch.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU0PR10MB7076.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c5623f1-d64f-47c5-5ffb-08dd9306a784
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 May 2025 16:44:54.5900
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Zv5FREKnYJJXgzuGFzIb9pqKWrey0XUggXVlvsNzrcL+AM0eEjxoNzMVVA/8EGNxpsll8n3RoaaJEz4QGy8KWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB6801
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 May 2025 16:45:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216517

Hi Richard,

> > > > > > From: Ricardo Simoes <ricardo.simoes@pt.bosch.com>
> > > > > >
> > > > > > When the fsck backend does not respect the exit codes
> > > > > > predefined by fsck, systemd-fsck might not work as expected.
> > > > > >
> > > > > > This is the case for fsck.fat from dosfstools [1]. When a
> FAT
> > > > > > formatted and write protected partition is checked with
> > > > > > fsck.fat it will terminate with exit code '6' [2]. What
> > > > > > fsck.fat wants to signal is that a write protected device
> > > > > > cannot be checked.
> > > > > > However, that
> > > > > code
> > > > > > is interpreted by systemd-fsck as a bit mask:
> > > > > >
> > > > > > - 2: System should be rebooted
> > > > > > - 4: Filesystem errors left uncorrected
> > > > > >
> > > > > > As a practical example, a write-protected, FAT formatted SD-
> > > > > > card
> > > > > will
> > > > > > not be mounted in this case.
> > > > > >
> > > > > > This patch introduces the environment variable
> > > > > SKIP_SYSTEMD_MOUNT_FSCK.
> > > > > > When SKIP_SYSTEMD_MOUNT_FSCK exists systemd-mount will be
> > > > > > called
> > > > > with
> > > > > > the --fsck=3Dno option. Thus, the partition will be mounted
> > > without
> > > > > > running systemd-fsck.
> > > > > >
> > > > > > In general, this new feature is useful when the filesystem
> is
> > > > > > known
> > > > > to
> > > > > > be clean and the fsck backend does not respect the exit
> codes.
> > > > > >
> > > > > > Finally, one way to use this new feature would be to add
> > > > > > ENV{SKIP_SYSTEMD_MOUNT_FSCK}=3D"1" to the udev rule calling
> the
> > > > > > mount script.
> > > >
> > > >
> > > > > This is a pretty generic work around for a very specific
> problem
> > > in
> > > > > dosfstools. It would probably be better to patch dosfstools to
> > > have
> > > > > the expected error codes instead.
> > > >
> > > > You are right. We also thought at first that we should fix the
> > > problem
> > > > in dosfstools. But the project appears to be abandoned. The last
> > > > commit in the repository is from October 2023. And the last
> closed
> > > > issue is from August 2023. Lastly, there is an issue which
> sounds
> > > > as if the maintainer lost access to the repo
> > > >
> > > (
[..]
> > > > mS4B6Tatxhs28iLyT%2BWw%3D&reserved=3D0). But the
> > > > maintainer(s) did not even reply.
> > > >
> > > > Instead of fixing the problem upstream we could of course also
> add
> > > > a patch to the meta-layer. But the patch would be rather big
> > > > because
> > > the
> > > > overall exit code generation is spread over the code. There is
> > > > more
> > > to
> > > > fix than only this single situation to make dosfstools adhere to
> > > > the fsck standard return codes.
> > > >
> > > > We would definitely not be able to maintain a fork of
> dosfstools.
> > > >
> > > > How else could this be handled?
> > >
> > > I think we should probably carry a patch to dosfstools until the
> > > upstream situation gets resolved. I don't like doing that but
> > > ultimately it will lead to a better end result. It is likely other
> > > distros would be interested in such a patch too.
> > >
> > > Attaching that patch to the github dosfstools so there was a patch
> > > ready would also increase the chances of it merging too.
> >
> > We looked into dosfstools. For a complete fix of fsck.fat many
> places
> > with direct calls to exit() need changes. On top, some of that code
> is
> > shared between fsck.fat and other tools. And we are under the
> > impression it would not desirable to change the exit codes of these
> > tools, too. For example, the fixing the very problem which triggered
> > us would also change the return code of the fatlabel tool. On top,
> > just a simple change of the exit code would be "half wrong" because
> > the point where the exit is called does not exactly represent fsck
> "fs
> > left uncorrected" but is even hit when the fs is checked but does
> not
> > need fixing because it is just fine. But on a write-protected fs the
> > error occurs before the checking.
> >
> > see src/io.c line 63
> >
[..]
> >
> > Taking into account the time we have at hand and the complexity of
> the
> > undertaking we do not see ourselves in the position to supply a
> proper
> > fix for fsck. That is, dosfstools issue #89
> >
[..]
> qN199Aw%2FOtF6izexCFU%3D&reserved=3D0) cannot be tackled by us.
>=20
> I would probably suggest just changing fatlabel too, I think the fsck
> exit codes are much more important. As long as it is documented in
> release notes, I'd hope that would be ok.
>=20
> A quick count shows 33 exit codes in the dosfsutils sources so there
> aren't that many.

If it is as easy as documenting this in the release notes it sounds way mor=
e doable.

We will look into it and probably come back with the result next week.

> The trouble is if I take a workaround, this is never going to get
> fixed and the issues will just compound over time. I'm therefore still
> not really wanting to work around it, particularly as other systems
> will be similarly affected, not just us.

We understand your role and responsibilities and thus accept this decision.

> Failing that, could there be a wrapper added around the tool to
> convert to the right exit codes?

Yes, that would be possible, too. After looking at each of the individual e=
xit() calls we should have a better idea of the feasibility as well.

Cheers,
Mark



