Return-Path: <johannes.schneider@leica-geosystems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED3C0C27C6E
	for <webhook@archiver.kernel.org>; Fri, 14 Jun 2024 09:36:07 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.72])
 by mx.groups.io with SMTP id smtpd.web11.7614.1718357763334459320
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Jun 2024 02:36:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@leica-geosystems.com header.s=selector1 header.b=iYlhUZbd;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: leica-geosystems.com, ip: 40.107.22.72, mailfrom: johannes.schneider@leica-geosystems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MFbj/HLDW4mzw0OpheZPOCCO2qIjrjsaaLjATGUKOtyS3mxskt+iBMT4HQZiOJoWs/twcdaBubxR1QCcHXGpYXX+t9Gavzm4wS181cBouTtvAaONGyErkdDp2OnmCtuOiqDN35Bk48jRNTE/VHF5l2XQGn84agwretLjFK4x2GbfMASTHg+xjqeihbiZecDxWNdiU6tOpt9AqITRLJPZaJlQFrLLGtzN29UNlOLFXf5hvH4rmu1IyMrkRusylkuTa8NEVqQqwDJuWU844gJt2gIRam9sCDzFpwZ/0AiEn3ra8s/MS45h6a2XLo6jxT66XZk9tIUbD1EMbEjp9IGv2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CKJK6zh6sMtMGY3PJzc9qOCLWHv0UMQIWQwOB3GPVDw=;
 b=NneaVtCmq/q03vbZlqhlFcmhePf0dFfvOVlnVPNlyBC5TDJ8/3g6T6tkWjyuOOCnDwRY/W5GNJ7GUqPVRM2eYWekmzLsA0PRowZC3grePPZJiyux6vqLlrhon9H2v13sMNYKn6SqiFKH7BKzHtMMnv9B2Pr//CEA1/UsZ7qsuK0oVz826WBSweWmiX7/KamCo1rdNqG4lJK7g6BscmCr1WRa9Y04wDKThT3PeJ4F3moXkGmDv+UkvwZxmS7ywjyI+8ATL6Hw7lNr0CnQS2Qz+71TcJMoVX/xzBv1Y4ofG68tdM5Ppp5rAQTZPWk6sJ/3gadIaX7sPxD5jCsVRCqEoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=leica-geosystems.com; dmarc=pass action=none
 header.from=leica-geosystems.com; dkim=pass header.d=leica-geosystems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CKJK6zh6sMtMGY3PJzc9qOCLWHv0UMQIWQwOB3GPVDw=;
 b=iYlhUZbdBR3iZuPGqD68Yb0gorliscg1BL1iGOQJ/OHD82gHqs4hHdiYPjhDd19iBLJ2BKiu5Z6+tzv8XUCJtGAh1P+ellzUS0r9p+ENQWTpxYtWwYwo4wuEwdrloDDkG6L1qOkdWRMoYLRlz8DKMYrsvs4EUBxPP1qHHS1FpDY=
Received: from AM8PR06MB7521.eurprd06.prod.outlook.com (2603:10a6:20b:355::8)
 by PA2PR06MB9587.eurprd06.prod.outlook.com (2603:10a6:102:41a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.25; Fri, 14 Jun
 2024 09:36:00 +0000
Received: from AM8PR06MB7521.eurprd06.prod.outlook.com
 ([fe80::570d:8853:c13b:c7d3]) by AM8PR06MB7521.eurprd06.prod.outlook.com
 ([fe80::570d:8853:c13b:c7d3%7]) with mapi id 15.20.7677.024; Fri, 14 Jun 2024
 09:35:59 +0000
From: SCHNEIDER Johannes <johannes.schneider@leica-geosystems.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Richard Purdie
	<richard.purdie@linuxfoundation.org>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "alex.kanavin@gmail.com"
	<alex.kanavin@gmail.com>
Subject: Re: [OE-core] [PATCH v11 0/3] pkg-database and systemd-sysext image
Thread-Topic: [OE-core] [PATCH v11 0/3] pkg-database and systemd-sysext image
Thread-Index: AQHatkuG6tJYTBgkAEaiQQnk04K8i7HFTdSAgABpJACAAI3fiA==
Date: Fri, 14 Jun 2024 09:35:59 +0000
Message-ID: 
 <PAXPR06MB75346D4EB374F60FC978E6ABBCC12@PAXPR06MB7534.eurprd06.prod.outlook.com>
References: <20240604065040.2771-1-johannes.schneider@leica-geosystems.com>
 <4a6b60ec8200956e25e031cd28bf1023cf02df3f.camel@linuxfoundation.org>
 <20240613130118d23ee04e@mail.local>
In-Reply-To: <20240613130118d23ee04e@mail.local>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=leica-geosystems.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM8PR06MB7521:EE_|PA2PR06MB9587:EE_
x-ms-office365-filtering-correlation-id: 00b083c5-32ee-45c8-7eb1-08dc8c55661a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230035|1800799019|366011|376009|38070700013;
x-microsoft-antispam-message-info: 
 =?iso-8859-1?Q?3BFB66x6isKmjXK/B51Eso3CJpfTvmuEk0U6Dzk4ZgsfOI7HYnARm8dfbl?=
 =?iso-8859-1?Q?hyirna5xsyMeHcbdX5DAL2kmq+44xDGTg5YfvOK1TMQaxE5+kMDYy6YvNi?=
 =?iso-8859-1?Q?nRPtbv8sd4axDlAS55NZnQ/dMs30dM547ZjhoAa/hpAz6XOCTJ7pJGxWqw?=
 =?iso-8859-1?Q?qvHfqhs+wJMBRqn+baG23TzF8EWBjWUr0Mi3EV8iB9CzoJo6FuTwBWnCZq?=
 =?iso-8859-1?Q?Ao3it6FHQNpCMezTrO3uNxoUY1xYM1KQaL+GgfRqShYqV703XyRfh6dkvc?=
 =?iso-8859-1?Q?+Y0KKApbbpfAmGKB23lZsAi40qDWoLdsk4o0bM/gcNeWOQa8wzEdZhUuXG?=
 =?iso-8859-1?Q?fGigKETuRaPtJfAylmR/8wxP43Wxam3oRRLXialZ5QDLMfzBhZG+dQ7Se7?=
 =?iso-8859-1?Q?gIgu/LbIarU9SFk7gb7KZcFCwW9tcNAnbS9HQzK6xV3o2laeTho+Dlxmcv?=
 =?iso-8859-1?Q?toTJd4vKVY0ZFPvM/kZYBG3WxGZuqlvC8pAgSz/icXs9XIqu4EtmWuaKZ3?=
 =?iso-8859-1?Q?9FuGNDdSs3MF5lva3Objqe3wL/+SEsy4Ga1qvghvFv/x/Nnxp+rfkuwE5p?=
 =?iso-8859-1?Q?6/hu8YDtgF35wN1CbEZ6ZBIaFUl6zLCWpPfn2OY8F5lLja6nmEsts+FlLL?=
 =?iso-8859-1?Q?IxCIhX80W3xuiRz/0296CZ9B0LkwgbimubmxF/+wBQYlnPx+j05u+Auaem?=
 =?iso-8859-1?Q?rG6WAR68QFXBZQrgq7rUbwomrUFkBV4seX8+3G6ArPAjNlEuyPc9K/7oNG?=
 =?iso-8859-1?Q?GDdMS/aPnVJCTIHd+ZqJHnTAOjN+iWWXTdCHRKvxwXmGF0bpiv1NMIBlBr?=
 =?iso-8859-1?Q?u9M5Fd7HCBOROnLFFcCZLNJcNSBMCUuc71PZdFDKWzr2UipEN48zl1DLSo?=
 =?iso-8859-1?Q?8fr6i1yg8pudbyqKJ9rwratcexKUwjjUpprF3x9Qkpfw1jPUz35wNFl3Gw?=
 =?iso-8859-1?Q?BdNw/pmtEcLLokqlrzThrpEANGKjxh+supKG/MnIOCHLn+y/nGdIwOvR8c?=
 =?iso-8859-1?Q?/2hqkLfN8g0CThxfVlwIQTnAfF5QP+EeeaSwBFIrYymov04crOxDbPwiq4?=
 =?iso-8859-1?Q?qYWgLnZnYUzGfILu0xqx5Zh7fDko1pVAKsJ1WToW+Chss25WR/gnv7pAgm?=
 =?iso-8859-1?Q?kD3hjXfV9cEQ6pkzQJkjv3tiJCtHl2R8uxyf8Y4cxPqIL10g6XScKFHH3v?=
 =?iso-8859-1?Q?q2ExJjCYB/G83rl2ILtOxt4LO2KkaMzmewZ+tVUeI8+v1lmHcPkq0ugRuT?=
 =?iso-8859-1?Q?Zq2Zo12U7ZkMrQjJyS/UA1X83KIZIJt/U/mugtAe7sMP+kZLVWrk6jd4QY?=
 =?iso-8859-1?Q?XeLAeGCkql9lWYm4EGjd7Y6PhHYjX/M2E5Tk2LSA31eeLETxO/hUUcsjHK?=
 =?iso-8859-1?Q?MnnfZKNFb/bjHBI8PLsXYlvRAKxKmkqZfakY+ySaBdE/3ZYNdaHKg=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR06MB7521.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230035)(1800799019)(366011)(376009)(38070700013);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?gsexNCygE9ggTyio8ZdybcUSNpBxBi42WxUeVuqTSF0KvVYiGLmGMTviXE?=
 =?iso-8859-1?Q?lhSRied7cmGkDlKJJz+K2XSjjXsD2xoyQ6XEa+ceHg8leDRtiSRlLU+qjq?=
 =?iso-8859-1?Q?HKvtlZX2e4BXHY5o2T8N+ijXqIgUHDoxrNb8U3PLHr895Dbl7Nut4wj6rC?=
 =?iso-8859-1?Q?SeYQ8iMU4rNukAdJbJ1NV3HiyRcztJ6DP/81tTJV6OWeEycoALfdMk2ty8?=
 =?iso-8859-1?Q?twl57l9ygoCRnEMkBHAss7GFyev7HfEHtrNa1ALnFxWuI/Q4BLACmz+Wa1?=
 =?iso-8859-1?Q?GGsW/pCwDlDq9SGwpRj5zdb11uTRCCjJ93ae0YfWc8MHrxIL2xxnIDrCI1?=
 =?iso-8859-1?Q?ICxZXkimWbbBnY2aq5+GBNJNwTeJIpXYnJAxwAsowliZI6tI+kkWrzyb/D?=
 =?iso-8859-1?Q?VbOfU8I6xKK9EKsb13ZFvx08qvv6R6pq9SMPz7GBbOAFAMjKD3Pj3n2aNl?=
 =?iso-8859-1?Q?9JtvCYibL5WWaFkecl87TD0zmnIomHYOg8Jq9as4J8pfNamMfAUUJavb0r?=
 =?iso-8859-1?Q?N9GTnDlpAPQq722BEH/x6LXoYNoSxlHGZPI4ew1VJppOfNlaiqSFD9UvbU?=
 =?iso-8859-1?Q?grxYrjVOT21uVFHEeg/n5olxYLw3JvsrIZsiFeOcxh4KQ4YZ0gBbkl2D2L?=
 =?iso-8859-1?Q?juukKeGyLNO5FU6VhOq1wPfQSeOWydOGyfuCXmO1skmmdcj3kMD8yl9q2T?=
 =?iso-8859-1?Q?HwGMM7csB27wdMZl1Z69ZXeCV3UTpl7q29S3VMOVpbbSZ0yp1fENQGkK7G?=
 =?iso-8859-1?Q?/rp5zkq1ASD4VlxbOS2Jmfrh3tAwEsOaqBNx8pHv0KuVFw7YdyTpGBeDth?=
 =?iso-8859-1?Q?qstHzZiodTmcILltfNWPJo6tYMpr7rYBazTgee6Y4hWVA1Ja+HliYJ9Fr0?=
 =?iso-8859-1?Q?iP4l/1T7h/W3AdVTIGPcBAVvjKt6DASXDzUtSFSOic5EaQdtIKPjw7oHNV?=
 =?iso-8859-1?Q?33QJ578pwGYmw/Yr5s7sDsMOnXbc4tGWd3rWS3HeutQSXQownXxzyopBaY?=
 =?iso-8859-1?Q?xcODXvw2sptUjvY/m3+VDP8xO+W3rv/5+eWo6DMsmBs33e6N/nyQHZObo5?=
 =?iso-8859-1?Q?wx51NRGxGu19LhmqpcHOtChZ0yLQkT19CMYvrMYZS2m/tmM7JDqld5uuUI?=
 =?iso-8859-1?Q?0sN0/zJEX3PtfLsOtt/qclTYREi09o1lkzTvhlKnL/BG14j6TidxxSqT2p?=
 =?iso-8859-1?Q?et/+G2xWKLX4T3TYgU9QNUmS16UvPAMbPoVDWe8AvgiRBzz/bgoYkLuByf?=
 =?iso-8859-1?Q?xfHJwP3hITMUmoTqY0U0M5pswVI+QGGHEusAySXV1Po0RtwafB177nXfUq?=
 =?iso-8859-1?Q?3d2fTZkoVvTnz+hG4cd0lTnpOikAQSIWsp86hBUNNS1g0+8YoihXXPpIff?=
 =?iso-8859-1?Q?nBWk4SLPNiQm7HKMGgC1F4JcdtRhHtCgUnuWF6WBeXhtVQ8RqddlsoDkwW?=
 =?iso-8859-1?Q?EEt0MBaX0nItktj9YcKsC5DoPS06QC+gqVEl3AUcLiWIJkAdCOaYuf0tT7?=
 =?iso-8859-1?Q?90/jfpgOdB/Iq0nWAIDR4AahHw7i9LiYD2VV7udkj40h8JGv2iVBnKygIL?=
 =?iso-8859-1?Q?a+5ImsC3sdsxV8Ql4Amq2kGI6BLMj5a+BW+CEfgJFoDt4XOL94f155+Byb?=
 =?iso-8859-1?Q?jsHbnUnk74XW7TjyothEd0Fq+jbExkAq89ui7jryuKX/mHf5XnhqQAZbWu?=
 =?iso-8859-1?Q?7/UGQh+aSr4JMqqz9VMBBco802WQg4zcmQgcFYJ8Q5c/UwJv7JRY59zYRT?=
 =?iso-8859-1?Q?C9LmRLPtyKFylFDNavRWbJHuQ=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM8PR06MB7521.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00b083c5-32ee-45c8-7eb1-08dc8c55661a
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jun 2024 09:35:59.2108
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: F3erLujVq5frypUqP1aPefoBvBdU0aPYqjxHwpwTIcn7pC3amheZ8jlbbYQJjCoE+lbuWbblVclU8L0+xfKOMeB6Ej6ksv5RJfrlMiL6QjDkFDHoamaT5eyCQs7cSynF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR06MB9587
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Jun 2024 09:36:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200654

=0A=
Hoi,=0A=
=0A=
=0A=
and thanks for taking the time to look into this patch-set!=0A=
=0A=
>=0A=
> Hello,=0A=
>=0A=
> On 13/06/2024 07:44:59+0100, Richard Purdie wrote:=0A=
> > On Tue, 2024-06-04 at 08:50 +0200, Johannes Schneider wrote:=0A=
> > > systemd-sysext allows to overlay another image (or multiple) ontop of=
=0A=
> > > a "base-image" =3D the current rootfs, via the use of overlayfs; to a=
dd=0A=
> > > tools and features meant for development purposes.=0A=
> > >=0A=
> > > To quote the documentation on systemd-sysext:=0A=
> > > " ...addition in order to make debugging/development easier). System=
=0A=
> > > extension images should not be misunderstood as a generic software=0A=
> > > packaging framework, ..."=0A=
> > >=0A=
> > > To build a lean image, that only holds packages that are not already=
=0A=
> > > part of the base-image, a snapshot of the package-database is taken=
=0A=
> > > after the installation of the base-rootfs is done, and picked up=0A=
> > > again=0A=
> > > when collecting the rootfs of such a extension image.=0A=
> > >=0A=
> > > with all this in place an example usage could look like this:=0A=
> > > some-core-image.bb=0A=
> > >   inherit core-image=0A=
> > >   IMAGE_GEN_PKGDBFS =3D "1"=0A=
> > >=0A=
> > > extending-image.bb=0A=
> > >   inherit image-sysext=0A=
> > >   IMAGE_FSTYPES =3D "squashfs"=0A=
> > >   IMAGE_BASE_PKGDB =3D "some-core-image"=0A=
> > >   # the above pointing at a package-db similar to:=0A=
> > >   # build/deploy/images/$MACHINE/some-core-image-$MACHINE-=0A=
> > > 20240210172305-pkgdb.rootfs.tar.gz=0A=
> > >=0A=
> > > then on the device, running some-core-image, with the extension image=
=0A=
> > > placed at FN:=0A=
> > > $> ln -s "$FN" /run/extensions/$(basename $FN).raw=0A=
> > > $> systemd-sysext list=0A=
> > > $> SYSTEMD_LOG_LEVEL=3Ddebug systemd-sysext merge=0A=
> > >=0A=
> > > As long as the VERSION_ID of the extension image matches the os-=0A=
> > > release=0A=
> > > in the base image, the above commands return sucessfully;=0A=
> > > for details on the compativility check see the docs for systemd-=0A=
> > > sysext.=0A=
> >=0A=
> > I'm unsure what to so with this series/change. I'm a bit worried that=
=0A=
> > it is copy and pasting the debugfs image code to another form and once=
=0A=
> > we have this form, I suspect others will then also want things to be=0A=
> > added for other image update use cases or similar. That code is already=
=0A=
> > hard to read and this is not going to improve that. I can understand=0A=
> > the use case for the code though and I can certainly see why you'd want=
=0A=
> > this code upstream as it would be hard to maintain standalone. Having=
=0A=
> > the tests do help but the also illustrate this all feels a bit fragile.=
=0A=
> >=0A=
=0A=
IIRC you mentioned in a past mail that you're not "too fond" of the debug-f=
s or=0A=
it's (current] implementation - is it an inherited/legacy functionality tht=
at's=0A=
hard to move elsewhere or what is the background/history there?=0A=
=0A=
Granted, the code looks similar because it hooks in at the same point in th=
e=0A=
image generation, also operates on the package(s) level, and was in part ba=
sed on=0A=
how the debug data is handled.=0A=
=0A=
The "feels a bit fragile" is most likely because i have/had to iterate a=0A=
lot over these patches because i've got not a full/good grasph of the compl=
ex=0A=
test&build infrastructure (and can't easily replicate/reproduce it locally =
:-S)=0A=
At the last iteration almost all build variants where 'Ok', with one except=
ion=0A=
around an "already present" ipkg in the build environment image.=0A=
=0A=
> >=0A=
> > I've just seen further failures in testing:=0A=
<snip>mangled links</snip>=0A=
> > will probably fail too but is currently still building.=0A=
> >=0A=
> > What really worries me about these failures is that there isn't a good=
=0A=
> > error message, so if this happens some time in the future we're going=
=0A=
> > to be scratching our heads wondering what is wrong. I'm worrying this=
=0A=
> > is going to be particularly hard to maintain and keep working in the=0A=
> > future.=0A=
> >=0A=
=0A=
Im very open for suggestions on how to increase the verbosity =3D pointers/=
hints=0A=
are appreciated :-) I've tried to be verbose/to the point with error messag=
es in=0A=
the actual code; or are you looking for more verbosity or different message=
s in=0A=
the tests (what and how? - since i'm unsure what would be helpful in the=0A=
build/test infrastructure; it seems to me that not all messages make it thr=
ough=0A=
to the logs visible in the web-ui).=0A=
=0A=
> >=0A=
> > In many ways I'm wishing there was an API you could hook into so that=
=0A=
> > the core project didn't need to take on the responsibility for this=0A=
> > complexity.=0A=
> >=0A=
=0A=
Like "image generation step hooks"? im not sure that all necessary informat=
ion=0A=
can easily be exposed, passed along, or tested! - that code could end up be=
ing=0A=
more complicated than the current form that does it "just in place directly=
".=0A=
=0A=
If there where an API, where would the code then live - if not in the core?=
 (and=0A=
who would test it how?)=0A=
=0A=
> > Regardless, unfortunately we're still not to the bottom of the failures=
=0A=
> > as evidenced above :(=0A=
>=0A=
> I'm actually surprised it failed for you as v11 was successful on the AB=
=0A=
> for me. Anyway, In the meantime, I dropped the series.=0A=
=0A=
Aww, we were getting close; so the last iteration fixed the one=0A=
remaining/troubling exception with the arm64+ipk? :-)=0A=
=0A=
=0A=
gru=DF=0A=
Johannes=

