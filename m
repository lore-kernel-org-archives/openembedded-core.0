Return-Path: <virendra.thakur@kpit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54FCDD6ACD4
	for <webhook@archiver.kernel.org>; Wed, 27 Nov 2024 13:39:40 +0000 (UTC)
Received: from MA0PR01CU012.outbound.protection.outlook.com (MA0PR01CU012.outbound.protection.outlook.com [40.107.57.112])
 by mx.groups.io with SMTP id smtpd.web11.72001.1732714776878716371
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Nov 2024 05:39:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=w+qgFN4N;
 spf=pass (domain: kpit.com, ip: 40.107.57.112, mailfrom: virendra.thakur@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RNb7onaJk5rSUtA+h+t/oJUwF9D/CfH+zGL4Xo6p4Mwos31W4iA2BpvMTT1xOCWchICVp0d9oHs5D72kwsvTMtIRMwdYP9q0hKYtnET0Z9rDcr+jkcN3QT6AZXl6A3Wsyar3ixjFzHf1Mg5hkvrKecorw4DIQMIeZ3ZlNzeHHZx6cxRjFSKYbOXRtlMYuMgea0/qiJxsqS7Lq3pehq3gfZ9VbQ5jN/otAR8NuZJFQQwG0tDgQAEPXRkw7cmvhYdInRkl/ognzHXsAalGRSuhXUPPxWhUrfokkEUm0s396/NMlEGRRF3U7cfSaa7HM+AmIFwxR4NAQNZFgBXaK8SRFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AQsgS9S5bZHh8JoSwiKky8zsDVk+C5uEEVZar01kwYQ=;
 b=T9Mwtcg5vEIa4gPSrpD+8YYLAZ7MX5tlQ/M/Dbu5R92f0NVlS0w7pkT+UNAQxpFa4PDgn27Ss3kzuBpZId8G4uMAM883dEkfYch9m3D4XLvZVYEIfSQopLEp6djn0zvTu9S7fdfaCvkmg6OO7pO9FxGV0w8Q/5WAV07W9MPICBdJRdgnRH9oOkK+wW3Rc8CRzW4GADX/AcXPieHHLFw4HsvXf2yN0LU2u1VYqxC7bQy0FX5NMXtNeqVBvVV6lGvp1pQ9tTJ2vh8fa1CJOzN+yOIROZAHRrIqRonCW6c1rwR/k2AGG7OoNCqKPrx16yrwvgZpJadwf4siP2gJHREbHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AQsgS9S5bZHh8JoSwiKky8zsDVk+C5uEEVZar01kwYQ=;
 b=w+qgFN4NuhfgA/YiPVl3aGqupJ0xUrETgXeRgAKKfCsTOPrCJJyvSDZfkOw5nP7MOTdUt8YwcIPvsWnf4cpk/FKeCj91w/G5b9BvUe28wntqxpvREO7ZNOpuk258eScanVPtfLze9/qOBlNmuntJqLEz9qyR1HUNDZtnf1GHJjQ=
Received: from PN2PPF882B3C2CA.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c04:1::1b9) by PN0PR01MB5746.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:65::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.13; Wed, 27 Nov
 2024 13:39:31 +0000
Received: from PN2PPF882B3C2CA.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::2ba8:7e6f:a1d6:faa4]) by PN2PPF882B3C2CA.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::2ba8:7e6f:a1d6:faa4%3]) with mapi id 15.20.8207.010; Wed, 27 Nov 2024
 13:39:31 +0000
From: Virendra Kumar Thakur <Virendra.Thakur@kpit.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: "thakur.virendra1810@gmail.com" <thakur.virendra1810@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "wangmy@fujitsu.com"
	<wangmy@fujitsu.com>
Subject: Re: [OE-core] [master][PATCH] libyaml: Add libyaml ptest
Thread-Topic: [OE-core] [master][PATCH] libyaml: Add libyaml ptest
Thread-Index: 
 AQHbJFpbHy++pk2/YUSzB73vGbvKOLKSbr6AgCw8pKKAAAMkAIAAESqvgABBo4CABGqvG4AAA38AgAAEW9KAAAKKgIAH41g9
Date: Wed, 27 Nov 2024 13:39:30 +0000
Message-ID: 
 <PN2PPF882B3C2CA099C2B8D534947AB18D69D282@PN2PPF882B3C2CA.INDPRD01.PROD.OUTLOOK.COM>
References: <20241022081140.1464860-1-thakur.virendra1810@gmail.com>
 <CANNYZj8VR90wUtudX4FiA-teKaJFrkgK_hohmb2o6iNXeGL96w@mail.gmail.com>
 <MA0PR01MB9355C27D944D288DF19DEE389D202@MA0PR01MB9355.INDPRD01.PROD.OUTLOOK.COM>
 <CANNYZj9n-DiX3WfUJTqa=s_iKAfLSuNJZ7QuD6+H+PW9_m3ZrQ@mail.gmail.com>
 <MA0PR01MB935507E141ADD1CD9E3A28839D202@MA0PR01MB9355.INDPRD01.PROD.OUTLOOK.COM>
 <CANNYZj-qHdsNbqKy7bCNn4jx4T5Hc37qdZqgHHWeu5OCzTAi6A@mail.gmail.com>
 <MA0PR01MB93553EC00CC06C983FA1BCF19D232@MA0PR01MB9355.INDPRD01.PROD.OUTLOOK.COM>
 <CANNYZj_1jNg5tFdpx4Zo4ZMLF_KWWjj60f2YZQeWjAtjaDtiJA@mail.gmail.com>
 <MA0PR01MB9355C978E83C2F793FA49D539D232@MA0PR01MB9355.INDPRD01.PROD.OUTLOOK.COM>
 <CANNYZj_gaDoHSsDKaQajaJxqQU6ug7=MVrCY0_Fp_k7dHiAvEA@mail.gmail.com>
In-Reply-To: 
 <CANNYZj_gaDoHSsDKaQajaJxqQU6ug7=MVrCY0_Fp_k7dHiAvEA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kpit.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN2PPF882B3C2CA:EE_|PN0PR01MB5746:EE_
x-ms-office365-filtering-correlation-id: b2e3a5a2-6c9e-4c7e-a362-08dd0ee8ebf2
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|1800799024|366016|8096899003|7053199007|38070700018;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?Yh260NHTaKo8q/HYhqTkCyFRaXM1tJWJm7pOHA2cMQwpDcV7omm0XSs1Q8nt?=
 =?us-ascii?Q?pNIUqMWDmjDB0Vy3C5oOjwC6Y3nl4JXzwymWR5up1J0sHSGF4h5jHHWYlI+k?=
 =?us-ascii?Q?+mm3YCf9R+nK+ccdhlxee0w8foQIzt1EfgJ1f8kiU4addScfPwvhgTio927O?=
 =?us-ascii?Q?zuVW+RRzqQhyTv/gQnQBwAhH8TzFEE+Oj1sk3tNo8G/8VyokSq823dtEU4HP?=
 =?us-ascii?Q?IHfA01SV2mYeWl2CSP2esTPDy/MkejDGRKXgUEC6fCTrCdZ/BtY9xCBEmTji?=
 =?us-ascii?Q?FTfdsxftbYTMbmtPl5oaZyYjm20uooMMkQFvlQXESd/Ep1qIjb9JysQ4S7it?=
 =?us-ascii?Q?gYA+jt3G9EkHU/JP9GaRDsh3/gznINq4ayBRMvN31wyoJpi89CHV/D9l5mcl?=
 =?us-ascii?Q?gGf13WcVLBm2MWzJmhqRIKvG3iEjxB9gfR5/Jg08h3YCWPcWP96YKQZQDT+B?=
 =?us-ascii?Q?9xBfCiqECs6tm5ePDTduSN0EOA9FQKrg9oMAH8tC9lhYsZCP+GmkktixvL6b?=
 =?us-ascii?Q?k1F+/JxhCBpthwdbruuiYj+hvgVEelf7ZPEl7Rlghe4SgXw0Opo8HH2Q4xOs?=
 =?us-ascii?Q?uHK+ZMbj2aDlCwqvXiNrhTTvTd+aCVCWHp7NGi3gte76O7ITpaUoORbQ1QNR?=
 =?us-ascii?Q?9Ti5wKANYD5ptkjonsChZbaSWG8CNJ2X1Iighb8Nkln+THBi2F7n+5KfbcJh?=
 =?us-ascii?Q?WIoGfO/BzssTSuRS86KY7yQQCBwSMZcD2BYlgT55kdtfzpAqY3tx51COFO5k?=
 =?us-ascii?Q?t9fNkW1xQRgvcCL72EjGlCXf6FMWol73GSg+ZM6KDJANOcpMliSr7GxExEeE?=
 =?us-ascii?Q?uOXafQk+Jd2hgc/vjRCVhZe44a7Ij/ru9q2jrgJg43Hu+vYa2mQKD1Od1ACW?=
 =?us-ascii?Q?FoKiW48pduNa61fwjY480OgL9L2iEQxXd96VJHYz2tgdzimiHDoo89fGs5A8?=
 =?us-ascii?Q?zmHMPrKwFfzdPd3r78rphsU2juPGZOwy/cFB7goUWTq+Gj0J36Edhy7lI6XC?=
 =?us-ascii?Q?udpOlzzUoi324HpIiBNNkydzSTU8wVF1Frm+qmFp39tw00+RwdxONptt4i1k?=
 =?us-ascii?Q?LfqPa8yZC9GWmuPGuX7Si9aErxnkXHiwU2Eo3ewlrOqYQkFNRFL3xVRVrZR4?=
 =?us-ascii?Q?3cI/uYvPLKwSbrU7wQni+nPh0mEGxXOuVwU1knziy7Si3JacciVi8fEMOMPH?=
 =?us-ascii?Q?v52ildpt9lwf1j3h8Imk1HtfJFliRzOmRZH3FvLrNuJigRZJTPa/13FnrK+s?=
 =?us-ascii?Q?CEm7Tkp0p5qKDqJXnn50lXymz5AlStIN1xdiTE23Bx2elt6ySBE1BxlOgM3z?=
 =?us-ascii?Q?RC2RoA9bV7YpmR+8RwtVHNvAB5LmugVmhizZGsShPoIKfuDQVFsWzFr92doS?=
 =?us-ascii?Q?8F178urQVnFDcU5F6zO461U89OiwxXQHCbczE+Fj9ikJoHwkOiIZpbW7KM0P?=
 =?us-ascii?Q?iY1jXoco8U8=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN2PPF882B3C2CA.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(8096899003)(7053199007)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?anTUYke7q+OWAnH0X9PXdSHYAxX4/fEvxPJr1L8/Sg7BKGSz1gOqj77VjGbQ?=
 =?us-ascii?Q?5aktOt1FWlIotWJ3LiJyEJG+kEP55wPukgkDPGta6Tl8WPPDGvZa27vFbHLt?=
 =?us-ascii?Q?FafAqpz1OCxOFIIxve1AhvqbYzveK7jYEkvBkllgDRwu61pvtIXR0Zj1TLuG?=
 =?us-ascii?Q?n57Zr/hdASLpA6rJ//+sSAeAIqzLpfYN9FzR9bV72/ZucmIIOZLG9kxQQK2a?=
 =?us-ascii?Q?ydwVyVQR4Sa8f84OfcS2ypHtxb6/6DENiM5k+5IudZP5MJPXC50a2A0xjO9N?=
 =?us-ascii?Q?5b6F6p6nUx/Xq4g08uQLMQLWhK40krLV7e2dh2cxK32y8P6DwaWoYuv68U5s?=
 =?us-ascii?Q?V4Rg8fIpYzGWWagOctIs17V8WXF0uvIvzy2RC9zXQXYWr7ZEfesi6uJmpkAP?=
 =?us-ascii?Q?JqGbegVuQaqFUriTYqqROJ9CWMH+EEndo5MBpvHvhaztzGHgGLlDgtkSPSyQ?=
 =?us-ascii?Q?HZ91xRErPBUb2S+t38TAHw7zEpILuTBYX2KJFRitZti6qhUbxiKMhfVV/zi+?=
 =?us-ascii?Q?fLX/M+uLaqNK/cuHGnS5g/zVbDEph1omEJ2WdMG8dBK2cH2PeFs6Ea8zKQoC?=
 =?us-ascii?Q?RD5Z+Z4V44vFt/qz6OPxCx6pt9aUkwENHCY+YSD4pe7Vn6WY0jB4ijrO5lLZ?=
 =?us-ascii?Q?X9LRTlXZRQTmoQ7hVdBfFYX5Dp8DitK5IfOByvPT7pP2mg7Ls1O/elKdHkLo?=
 =?us-ascii?Q?LUZi/wKhsHvaEKmDUSTZvZTqXtAPQDl0QdpgUVzPuLZRNWeCBq72rmTFZFB5?=
 =?us-ascii?Q?jX008d72LeuE8gnCyzoQctwxc8VJFrq7AQNLxC2nsQN2CRd2MpR2zJ5TRS3P?=
 =?us-ascii?Q?oFG5VpAHY+8HsAfyRme+WTib+menfoO3qlx4K4j5A+ESb1SPLcVpFx/Dkrna?=
 =?us-ascii?Q?6lFlh9cjGTeHCAce4ddksxs57o+er4JVR9aWZXL63KLR2bl1g1ArtP9szGNA?=
 =?us-ascii?Q?cO5sQK2+dp/3Rlj1PoJY3OXGUAx1qldGGFCgeLQIjQ11m+zPZIKO8ZJVCyE1?=
 =?us-ascii?Q?NjJ8/wospb7ZBpZbyAoQknROjac//lptPDFQ4pvv/VG0kLsf826wEfuX1IQg?=
 =?us-ascii?Q?q2Tx09ceg1EygpFUdGd5DvWUFFPlL8nL4BQ7xDrvDF5nqwKHMJ6aZKQeXsnU?=
 =?us-ascii?Q?smx4R2xL34/OWpKk4ymPvjXPG6tD5oR51kSFrHNK9QZBj8cHFMKDXa4FiaIc?=
 =?us-ascii?Q?q15sQDRKDrW3kmSmMLx56qr+XpQS8eJZrGz05py84YN6WN1i8F7AXahdrx5k?=
 =?us-ascii?Q?H2lmmyiRC3qGALlTV1EfZ7iBltSyF6k43Gp8M/3jkXesSuwcTLFIWpPtk65T?=
 =?us-ascii?Q?fzFaL8QgJHgWAWr9I3GyqUxK+BHAU5ucCuYgPkIT+sZjGu6VK209hMvb/ZOb?=
 =?us-ascii?Q?Py0PrMWe0YGakb66MbQ1blwYnVUjrWbK5bM2X62kDHSG3JA+BvA2zNnQGja6?=
 =?us-ascii?Q?adVh3Tik1bIdiNlpjrKli3SjxLdLT87OXgPRVWhCAivWCDh8v4iebgK3y1P+?=
 =?us-ascii?Q?xIKfaoEV/7MkvfqeU/L2R7iwJPFReOD2Mx2CYF3UvAbWP4PI+l1bzBFILjr4?=
 =?us-ascii?Q?J1ws0PWW0Th82kTQBZs=3D?=
Content-Type: multipart/related;
	boundary="_004_PN2PPF882B3C2CA099C2B8D534947AB18D69D282PN2PPF882B3C2CA_";
	type="multipart/alternative"
MIME-Version: 1.0
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PN2PPF882B3C2CA.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: b2e3a5a2-6c9e-4c7e-a362-08dd0ee8ebf2
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Nov 2024 13:39:30.9679
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: J+408ffyVYiVEMbgiefl6SGF3lcQggefpeLLbJ8UntzRvhmUGwQ6SaOvE0eGxika/Sjw7kdtJP2eJ9QKcjDwtg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN0PR01MB5746
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Nov 2024 13:39:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207930

--_004_PN2PPF882B3C2CA099C2B8D534947AB18D69D282PN2PPF882B3C2CA_
Content-Type: multipart/alternative;
	boundary="_000_PN2PPF882B3C2CA099C2B8D534947AB18D69D282PN2PPF882B3C2CA_"

--_000_PN2PPF882B3C2CA099C2B8D534947AB18D69D282PN2PPF882B3C2CA_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable


Hello Alexander,

Test which I have added is addressing our purpose.
Not working on this topic now. I will work on your suggestion If i will get=
 some time.


[cid:8de35c11-2683-4bee-816d-79b5c95da7c9]<https://outlook.office.com/bookw=
ithme/user/fcab7d9903984b91a5841c51f49bd5ec@kpit.com?anonymous&ep=3DbwmEmai=
lSignature>         Book time to meet with me<https://outlook.office.com/bo=
okwithme/user/fcab7d9903984b91a5841c51f49bd5ec@kpit.com?anonymous&ep=3DbwmE=
mailSignature>
________________________________
From: Alexander Kanavin <alex.kanavin@gmail.com>
Sent: Friday, November 22, 2024 6:37 PM
To: Virendra Kumar Thakur <Virendra.Thakur@kpit.com>
Cc: thakur.virendra1810@gmail.com <thakur.virendra1810@gmail.com>; openembe=
dded-core@lists.openembedded.org <openembedded-core@lists.openembedded.org>=
; wangmy@fujitsu.com <wangmy@fujitsu.com>
Subject: Re: [OE-core] [master][PATCH] libyaml: Add libyaml ptest

Caution: This email originated from outside of the KPIT. Do not click links=
 or open attachments unless you recognize the sender and know the content i=
s safe.

On Fri, 22 Nov 2024 at 14:00, Virendra Kumar Thakur
<Virendra.Thakur@kpit.com> wrote:
> With code from github it works fine. make test-all is working.
>
> I am attaching here with the output file.
>
> 1..214
> ok
> All tests successful.
> Files=3D3, Tests=3D452, 12 wallclock secs ( 0.12 usr  0.03 sys +  3.22 cu=
sr  5.92 csys =3D  9.29 CPU)
> Result: PASS

Right. Then your next task is to figure out where those tests obtain
the needed data, and then replicate that in oe-core, possibly by
adding needed repositories to SRC_URI, and then copying bits of them
into the ptest package.

The key sequence in the log seems to be this:

git branch --track run-test-suite origin/run-test-suite
Branch 'run-test-suite' set up to track remote branch 'run-test-suite'
from 'origin'.
git worktree prune
git worktree add tests/run-test-suite run-test-suite
Preparing worktree (checking out 'run-test-suite')
HEAD is now at cc9cb7b More bin/pin debug messages
make -C tests/run-test-suite test
make[1]: Entering directory
'/home/virendrak/libyaml-github/libyaml/tests/run-test-suite'
git clone https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F=
%2Fgithub.com%2Fyaml%2Fyaml-test-suite&data=3D05%7C02%7CVirendra.Thakur%40k=
pit.com%7C95cf470d5bd5418cd92d08dd0af6b84d%7C3539451eb46e4a26a242ff61502855=
c7%7C0%7C0%7C638678776970522379%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnR=
ydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7=
C0%7C%7C%7C&sdata=3D8Sy0Oywh1sU%2BHHwcY8u53%2FCwX4fMF3aBrVLjbUvDShA%3D&rese=
rved=3D0<https://github.com/yaml/yaml-test-suite> data --branch=3Ddata
Cloning into 'data'...
remote: Enumerating objects: 17410, done.
remote: Counting objects: 100% (1134/1134), done.
remote: Compressing objects: 100% (555/555), done.
remote: Total 17410 (delta 675), reused 580 (delta 579), pack-reused
16276 (from 1)
Receiving objects: 100% (17410/17410), 4.57 MiB | 9.07 MiB/s, done.
Resolving deltas: 100% (11215/11215), done.
(cd data && git reset --hard data-2020-02-11)
HEAD is now at a12ee724 Regenerated data from master v2020-02-11
git branch --track run-test-suite-code origin/run-test-suite-code
Branch 'run-test-suite-code' set up to track remote branch
'run-test-suite-code' from 'origin'.
git worktree prune
[[ -d test ]] || \
    git worktree add test run-test-suite-code
Preparing worktree (checking out 'run-test-suite-code')
HEAD is now at 67365dd Remove tests for PR#162
(cd test && git reset --hard 67365dd2af265f17ba6ee0832c1411e4fd80ac0b)
HEAD is now at 67365dd Remove tests for PR#162
prove -lv test



Alex
This message contains information that may be privileged or confidential an=
d is the property of the KPIT Technologies Ltd. It is intended only for the=
 person to whom it is addressed. If you are not the intended recipient, you=
 are not authorized to read, print, retain copy, disseminate, distribute, o=
r use this message or any part thereof. If you receive this message in erro=
r, please notify the sender immediately and delete all copies of this messa=
ge. KPIT Technologies Ltd. does not accept any liability for virus infected=
 mails.

--_000_PN2PPF882B3C2CA099C2B8D534947AB18D69D282PN2PPF882B3C2CA_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Hello Alexander,</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Test which I have added is addressing our purpose.&nbsp;</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Not working on this topic now. I will work on your suggestion If i will get=
 some time.&nbsp;&nbsp;</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div id=3D"Signature" class=3D"elementToProof">
<table id=3D"pbpsiglinktable">
<tbody>
<tr>
<td><a href=3D"https://outlook.office.com/bookwithme/user/fcab7d9903984b91a=
5841c51f49bd5ec@kpit.com?anonymous&amp;ep=3DbwmEmailSignature" id=3D"OWA742=
4d635-d073-f9e0-06c3-4f539fc5cdab" class=3D"OWAAutoLink"><img data-outlook-=
trace=3D"F:1|T:1" src=3D"cid:8de35c11-2683-4bee-816d-79b5c95da7c9"></a></td=
>
<td></td>
<td><span style=3D"color: rgb(0, 120, 212);"><a href=3D"https://outlook.off=
ice.com/bookwithme/user/fcab7d9903984b91a5841c51f49bd5ec@kpit.com?anonymous=
&amp;ep=3DbwmEmailSignature" style=3D"color: rgb(0, 120, 212); text-decorat=
ion: none;" id=3D"OWA615144ed-afed-29ce-e5f2-0ebdc531a2d6" class=3D"OWAAuto=
Link">Book
 time to meet with me</a></span></td>
<td></td>
</tr>
</tbody>
</table>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Alexander Kanavin &lt=
;alex.kanavin@gmail.com&gt;<br>
<b>Sent:</b> Friday, November 22, 2024 6:37 PM<br>
<b>To:</b> Virendra Kumar Thakur &lt;Virendra.Thakur@kpit.com&gt;<br>
<b>Cc:</b> thakur.virendra1810@gmail.com &lt;thakur.virendra1810@gmail.com&=
gt;; openembedded-core@lists.openembedded.org &lt;openembedded-core@lists.o=
penembedded.org&gt;; wangmy@fujitsu.com &lt;wangmy@fujitsu.com&gt;<br>
<b>Subject:</b> Re: [OE-core] [master][PATCH] libyaml: Add libyaml ptest</f=
ont>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">Caution: This email originated from outside of the=
 KPIT. Do not click links or open attachments unless you recognize the send=
er and know the content is safe.<br>
<br>
On Fri, 22 Nov 2024 at 14:00, Virendra Kumar Thakur<br>
&lt;Virendra.Thakur@kpit.com&gt; wrote:<br>
&gt; With code from github it works fine. make test-all is working.<br>
&gt;<br>
&gt; I am attaching here with the output file.<br>
&gt;<br>
&gt; 1..214<br>
&gt; ok<br>
&gt; All tests successful.<br>
&gt; Files=3D3, Tests=3D452, 12 wallclock secs ( 0.12 usr&nbsp; 0.03 sys +&=
nbsp; 3.22 cusr&nbsp; 5.92 csys =3D&nbsp; 9.29 CPU)<br>
&gt; Result: PASS<br>
<br>
Right. Then your next task is to figure out where those tests obtain<br>
the needed data, and then replicate that in oe-core, possibly by<br>
adding needed repositories to SRC_URI, and then copying bits of them<br>
into the ptest package.<br>
<br>
The key sequence in the log seems to be this:<br>
<br>
git branch --track run-test-suite origin/run-test-suite<br>
Branch 'run-test-suite' set up to track remote branch 'run-test-suite'<br>
from 'origin'.<br>
git worktree prune<br>
git worktree add tests/run-test-suite run-test-suite<br>
Preparing worktree (checking out 'run-test-suite')<br>
HEAD is now at cc9cb7b More bin/pin debug messages<br>
make -C tests/run-test-suite test<br>
make[1]: Entering directory<br>
'/home/virendrak/libyaml-github/libyaml/tests/run-test-suite'<br>
git clone <a href=3D"https://github.com/yaml/yaml-test-suite">https://apc01=
.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgithub.com%2Fyaml%2F=
yaml-test-suite&amp;data=3D05%7C02%7CVirendra.Thakur%40kpit.com%7C95cf470d5=
bd5418cd92d08dd0af6b84d%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C638678=
776970522379%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMD=
AwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&amp;sda=
ta=3D8Sy0Oywh1sU%2BHHwcY8u53%2FCwX4fMF3aBrVLjbUvDShA%3D&amp;reserved=3D0</a=
>
 data --branch=3Ddata<br>
Cloning into 'data'...<br>
remote: Enumerating objects: 17410, done.<br>
remote: Counting objects: 100% (1134/1134), done.<br>
remote: Compressing objects: 100% (555/555), done.<br>
remote: Total 17410 (delta 675), reused 580 (delta 579), pack-reused<br>
16276 (from 1)<br>
Receiving objects: 100% (17410/17410), 4.57 MiB | 9.07 MiB/s, done.<br>
Resolving deltas: 100% (11215/11215), done.<br>
(cd data &amp;&amp; git reset --hard data-2020-02-11)<br>
HEAD is now at a12ee724 Regenerated data from master v2020-02-11<br>
git branch --track run-test-suite-code origin/run-test-suite-code<br>
Branch 'run-test-suite-code' set up to track remote branch<br>
'run-test-suite-code' from 'origin'.<br>
git worktree prune<br>
[[ -d test ]] || \<br>
&nbsp;&nbsp;&nbsp; git worktree add test run-test-suite-code<br>
Preparing worktree (checking out 'run-test-suite-code')<br>
HEAD is now at 67365dd Remove tests for PR#162<br>
(cd test &amp;&amp; git reset --hard 67365dd2af265f17ba6ee0832c1411e4fd80ac=
0b)<br>
HEAD is now at 67365dd Remove tests for PR#162<br>
prove -lv test<br>
<br>
<br>
<br>
Alex<br>
</div>
</span></font></div>
This message contains information that may be privileged or confidential an=
d is the property of the KPIT Technologies Ltd. It is intended only for the=
 person to whom it is addressed. If you are not the intended recipient, you=
 are not authorized to read, print,
 retain copy, disseminate, distribute, or use this message or any part ther=
eof. If you receive this message in error, please notify the sender immedia=
tely and delete all copies of this message. KPIT Technologies Ltd. does not=
 accept any liability for virus
 infected mails.
</body>
</html>

--_000_PN2PPF882B3C2CA099C2B8D534947AB18D69D282PN2PPF882B3C2CA_--

--_004_PN2PPF882B3C2CA099C2B8D534947AB18D69D282PN2PPF882B3C2CA_
Content-Type: image/png; name="Outlook-gp00w1lc.png"
Content-Description: Outlook-gp00w1lc.png
Content-Disposition: inline; filename="Outlook-gp00w1lc.png"; size=528;
	creation-date="Wed, 27 Nov 2024 13:39:30 GMT";
	modification-date="Wed, 27 Nov 2024 13:39:30 GMT"
Content-ID: <8de35c11-2683-4bee-816d-79b5c95da7c9>
Content-Transfer-Encoding: base64

iVBORw0KGgoAAAANSUhEUgAAABQAAAAUCAYAAACNiR0NAAAAAXNSR0IArs4c6QAAAcpJREFUOE9j
ZAABr6aJDHqhuQwMDIxgPrHg19d3DLP91Bk+P3sD08IIN2x1hjPDy7NXiDWL4T8nM0NA33wGWRMP
hg5NJgYGhv8gvYwMFdf/MYAMu3twP9GGISssv/qLYVdzMsP5FYthBv5nmO2pyfDzzVuyDEw/eJ3h
xNyJDEenNSMMJMskJE2Hp9YxHJ2CZOBUM1GGz5/hAUuS+UVnXjOcXDCJygbOm4TqZUpcGDJjJcPz
S1eoYyAvrzDD58/vGRgY/iHSYcX1/wykupBXWpghe89reEbY0RjNcGHFMkQsk2pgwYkXDBz84iiR
16EJzmWghE26C8uv/mZgZGJBM5AZ5HXyDPRo7GMwCCuEG/jj40uGCRYS5LsQpNM6q4TBOLqE4emF
gwxrs8NRI2WynSTD19cvSErQOBQzMhSdecvw8vophqWxngQNBCWTrBMvMMIPpnF7dQQjA6+UCEP2
3tcM//7+Zvjx8QNOQydZizFk7bvNwCepgs9iWIHKyGAYEcPALaQEUQwq3mBplQmi5siUBoa0bRcZ
hBT18Bj4n7QSWlhGmiF19xOcBh6aVEyagSCTQEEUNf8Ag6CcFjyn/Pz8hmF9cQjDg8MHAaiKxp0e
iZJ4AAAAAElFTkSuQmCC

--_004_PN2PPF882B3C2CA099C2B8D534947AB18D69D282PN2PPF882B3C2CA_--

