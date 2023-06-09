Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AF63C7EE29
	for <webhook@archiver.kernel.org>; Fri,  9 Jun 2023 07:39:47 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.65])
 by mx.groups.io with SMTP id smtpd.web11.7927.1686296378014890482
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Jun 2023 00:39:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@navimatix.de header.s=selector1 header.b=uqDdMzD5;
 spf=pass (domain: navimatix.de, ip: 40.107.22.65, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KvaPxocOudEHslNP9653b/15sc6Sq0vX8XD+a/QpmSxf0CzcsO0ywZQu0TspdUjwDHYlX7a7DDhDLCc4x8cVJCb6BHvEdJ5749J62f9C0I5V6AzbbOxpl1sv60TYO8cSyPflWoRaj8LS9UXt29Y0CsDC5K+UdktWD5jzKlISA/ZGjVJso4n9tTbH/947+6DGmZCUUZf3Bnb2ReTgKDm0yrVADIGqUg2B9Y4aaVmiRHMNntoAwdkHb9wBrssnZuEzHkrazF0k/d50gtBzPLn5iAJMJ/p3gkSiUl4HSht9yK35iPOueONXd7g5E7MYuTSe2acBe6DYJ9NEMCRu6WYlAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZHRAHkueWGj4jF+Dvu3FQb30m0UFGfZPZE0n8gdt3QQ=;
 b=FncNtjpgPvHgqK7KxwXHVpjZuA6hrQ4z9m0KiCbvNcdClBQTYsUANe4I0xFcEIfrYM8mRzs7wF448t7tCNRmpjC3oC/Vdd64zVFgvlMCyaoKukk/nCsteWRVwzBCqgTsOnDELohqu5e8sinOf4lW/q6AX+17tObh0OFkk9LB8UviSMulxsIhk2ErgEdDuywKbxPrMIJBs+qkL5zSWFTdKgMz10oWSaF2ht5iUhj7S5goTgHewWpjv66ku8CXM92E2rAjRt1OXbXxv9B5kY+LlQSfS37TUjTEoE7onjYJO9N5XyDU7RcC1LltGei38T5YayeR+ElfXs3DtXNqTmyDKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZHRAHkueWGj4jF+Dvu3FQb30m0UFGfZPZE0n8gdt3QQ=;
 b=uqDdMzD5cQC0l37i5MnHInhwADGhcy7XJcZn9QHKe3V8gvS4C6tupYycB05R/4EJ4F03BRUu+qyStE1AbuW5ljS2tZgMmPmmX8U/J+C2ZDc2igq/jde0S7X4vA3vcaOFZPRR37yJz6v4G7q74xflPeI9gs81lVAJ9Yfmw6yBqRE=
Received: from VI1PR0102MB3136.eurprd01.prod.exchangelabs.com
 (2603:10a6:803:5::26) by PA4PR01MB9972.eurprd01.prod.exchangelabs.com
 (2603:10a6:102:269::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.41; Fri, 9 Jun
 2023 07:39:33 +0000
Received: from VI1PR0102MB3136.eurprd01.prod.exchangelabs.com
 ([fe80::1549:2f60:3152:7383]) by
 VI1PR0102MB3136.eurprd01.prod.exchangelabs.com
 ([fe80::1549:2f60:3152:7383%6]) with mapi id 15.20.6455.030; Fri, 9 Jun 2023
 07:39:31 +0000
From: =?iso-8859-1?Q?J=F6rg_Sommer?= <joerg.sommer@navimatix.de>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Fw: [poky] [PATCH] runqemu-ifupdown: Add support for ip tuntap
Thread-Topic: [poky] [PATCH] runqemu-ifupdown: Add support for ip tuntap
Thread-Index: AQHZmgo+56awOkkXV0OJ+e17T0iB2q+BWKIAgAC1QQ6AAAiD+g==
Date: Fri, 9 Jun 2023 07:39:31 +0000
Message-ID: 
 <VI1PR0102MB3136F869DD65A14BC39D4F6EFC51A@VI1PR0102MB3136.eurprd01.prod.exchangelabs.com>
References: 
 <cc9a474aa35bc29c00dc7ed216f697a8ccbb0f6e.1686229638.git.joerg.sommer@navimatix.de>
 <5968fd664354f0ef7a8f41e93ddb6ff211016f0d.camel@linuxfoundation.org>
 <VI1PR0102MB3136877E03064F5A6FB075DDFC51A@VI1PR0102MB3136.eurprd01.prod.exchangelabs.com>
In-Reply-To: 
 <VI1PR0102MB3136877E03064F5A6FB075DDFC51A@VI1PR0102MB3136.eurprd01.prod.exchangelabs.com>
Accept-Language: en-DE, de-DE, en-US
Content-Language: aa
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR0102MB3136:EE_|PA4PR01MB9972:EE_
x-ms-office365-filtering-correlation-id: f6818d17-062c-43d7-391f-08db68bca9fa
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 7bVhC4DN3cgyuGlGXnjr6Trgais3dWCK7Uohbv7aFThuDbEQiNmZ1kHXUWFjzcaamMpsbY12CUuVtQaxyodmfdVkV/nL+ZHLHulPdeJJkbE0+jzo02FrMrjCJlr5PtEFqNazu7FNKC32hivDTqKGN1fAtlEfzgBzuMbUDIauESMkIBu3yASlF3OalogtV6xxyLMne31NSzb4yWrHQVbF0MZp7HxrySERaEpINh7UwwwWUC+eiQZ22ibaGUaEXBA5gkJ7I7qIu2BZKNYY7XSbEvVmPPDWGyNAzUWi7QnupDc/Z9QtE3hPhpNXfnT1eF+mJR7CozISiogMwA7oGXMRIZL/V4EV7ZmWJhLcuL/CvOPNza/WRcSbYf1AFRYYfBbgdF3pFk9FMbivCfjm5cLwIwRAgmoUdGIEiOARCKQJImeRX7+kv9hlQ3L/1vpw8TKKtEbNMwS6E5nwQUjSz4yYM2Y5K9lI3Hp4Hpf8BZf2nQan3+sfLwBqYHNJWG2HwGMu9fLamvEoJg0yp+h2aO/eyBgBnDuChwtnV175M/hzX5dnwGY3Qt8dvV1drwy6pCSkTVhXR95EoUseUDTjxveq8hgi5/YH2N/XaejAasWQQUs=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR0102MB3136.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(39840400004)(346002)(366004)(396003)(376002)(451199021)(2906002)(53546011)(9686003)(26005)(6506007)(186003)(2940100002)(33656002)(38100700002)(86362001)(38070700005)(122000001)(55016003)(83380400001)(41300700001)(966005)(71200400001)(316002)(7696005)(19627405001)(508600001)(91956017)(76116006)(66556008)(66946007)(66446008)(64756008)(66476007)(6916009)(8936002)(8676002)(52536014)(5660300002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?9j+sUlK2x5I5ndSyyVk69S+pmzcX6WqhwATJGoPT+znWPuoKjb7LySWjtl?=
 =?iso-8859-1?Q?CC/Bm9Q3MQDjzblons7DLtvFgviOndwul0GSvhTY6b72nXWDqG0RJGwYoo?=
 =?iso-8859-1?Q?cQGL3/93hLWgMzZjsxMIWqx0aly9cr2QZp0+zRBRcGobod5NqNXDGlR27h?=
 =?iso-8859-1?Q?lfSXKrjhgOIjSmx+BwOBCeb8Jf0jYf4rsTuYgLcQVfXlv6SsU1lfPzYZgA?=
 =?iso-8859-1?Q?Ghzlvzl/GSIpQzr4gv/ZSo7fNROMNIjhVzH/5l5geilc4gJP0dWbV5deYO?=
 =?iso-8859-1?Q?MEk2A6zmKc8hvzUNIEBhYzAdOTjmnTLHW99fc+322wdFEVlr0fkbR8lqvL?=
 =?iso-8859-1?Q?2ruWNQiyZ1mzYif3zPDGyhOYRQxefk8h7uWjB6vQcMJF6OZ2TmJAYDwfgg?=
 =?iso-8859-1?Q?JoJ1GcHk3LqcC26GgXdorGyWUAzo9wCVeiP0odDnBep2yWhMpyySOl4Ti7?=
 =?iso-8859-1?Q?JIQ4kM3uNT023NiFTKxIH1IZ/Ehiiqx2xzpvMpt+IgLb9AFKEXmvOFf7Oy?=
 =?iso-8859-1?Q?Y4UcapRhn7J/m2oz98Ni70ikdGXoEG4LgYzkuQ2fb6ykoBXWI3yb0BFqr6?=
 =?iso-8859-1?Q?iMFm2fylrJzY3QmYsmkQ7SCDP7XhikaZL2hr8KtvYxr03a8Be6PioXtz0u?=
 =?iso-8859-1?Q?/0MVduvEK9FfCXl6tJcpnoIC9pq1D68ULqTNRcbwbazxMkMyEd2M+5hR76?=
 =?iso-8859-1?Q?ajqpmOf28yd31Ijdxvu05KrzEKPNI8hIFv8YqY7W4DyvOY0uEvCx3Zw4Nj?=
 =?iso-8859-1?Q?pNOf7d2VOPx/FAMxl+wTYwC+j+yfWAj93kmrL2MSOFDPke7iXGE8jPAmUV?=
 =?iso-8859-1?Q?XGdsNHXxVhEpjuxX5QKqssPkokSWK97SEl40osTHQLxepX0MYtkTHLJqvA?=
 =?iso-8859-1?Q?BW0ZHGVlZBIVNA2g4Qk/6Vu0ol42fo5GkPEHBEcY9kAnsxUKw/bPrq1ZbS?=
 =?iso-8859-1?Q?ewLVw+PscOUn96Mkol5ljnlEXQLa2179OOnbxbbVqShdL9rZy6mveTtssT?=
 =?iso-8859-1?Q?lqwQO7bI0rlwNBa7sz+mADClJz7D+dYcJ9ImbkjL8QY/zVhJy0tW3ngIsZ?=
 =?iso-8859-1?Q?+uoZhwxgXWBZDMTm5vXYeWOxQPy3aCSHv+abKh1wfiqXqUprRtRVa7UUFW?=
 =?iso-8859-1?Q?Aapvpl7/fRzfG5/ygiKQcUNjObeDyKMGRi2C0k9VQgJn96DU+sCP1TX1y/?=
 =?iso-8859-1?Q?/4+Ui9/YdqbyRFshwbI+WLFRmkC7/IuSzHZKUtL3vGMqWWkyfB0s5Oh5F+?=
 =?iso-8859-1?Q?zQZZcX7eeENgVMr6ZbRtTQDWswXk5uk5Pt4252Fo/LGbpgAt4bd9GqfE35?=
 =?iso-8859-1?Q?IyWUYMK5xe5d7DusUPjozlCn4x6cRltyv4pSHml2wIsa++V8oJI1/QinV0?=
 =?iso-8859-1?Q?M0h1/QlrnRk7/nrb1vkDmlECMXb5lVf8hAGLmINqd0/YFmAO+Us3eK586m?=
 =?iso-8859-1?Q?XfS41fTM1y+IYS19hFEhxiqjTFArczcjRiiSi31jTouhFYrVt1OU4z0Hyv?=
 =?iso-8859-1?Q?053yL8w7VJ+ssQ5tZ9RcxFzadYbv2MiIebNTr9hKFWsF2zAGjBG4JPYXEU?=
 =?iso-8859-1?Q?urX0pI0EDwEy4Lnt30+8spstx2Q0ijvyadIGwVNln3GX0XIYU4JXPOw7OR?=
 =?iso-8859-1?Q?M8lB9U8fsxI//G9wFSX5HTx0fkeAK9DxrI?=
Content-Type: multipart/alternative;
	boundary="_000_VI1PR0102MB3136F869DD65A14BC39D4F6EFC51AVI1PR0102MB3136_"
MIME-Version: 1.0
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0102MB3136.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6818d17-062c-43d7-391f-08db68bca9fa
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jun 2023 07:39:31.7839
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0s+fQlWQzMmk8LlwTU85phItawpGcdKEcIUCMutuWmuhe4qcLGLCYZDKpChEmjcsASdoJl3ei6CR4yaXmM+2DfwEWr7w8/B0otWH7QA8/iw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR01MB9972
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Jun 2023 07:39:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182543

--_000_VI1PR0102MB3136F869DD65A14BC39D4F6EFC51AVI1PR0102MB3136_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Sorry, I have to resend this message, because I wasn't subscribed to oe-cor=
e.

________________________________
From: J=F6rg Sommer <joerg.sommer@navimatix.de>
Sent: Friday, 9 June 2023 09:30
To: Richard Purdie <richard.purdie@linuxfoundation.org>; poky@lists.yoctopr=
oject.org <poky@lists.yoctoproject.org>; openembedded-core@lists.openembedd=
ed.org <openembedded-core@lists.openembedded.org>
Subject: Re: [poky] [PATCH] runqemu-ifupdown: Add support for ip tuntap

@openembedded: I have proposed a patch to runqemu-ifup/down to use `ip tunt=
ap` as an alternative to tunctl for setting up the tap interface. Now the q=
uestion came up if tunctl could be fully dropped.

On 8 June 2023 22:18, Richard Purdie wrote:
> On Thu, 2023-06-08 at 15:07 +0200, J=F6rg Sommer via
> lists.yoctoproject.org wrote:
> > The *ip* command supports the creation and destruction of TAP devices s=
ince
> > 2009 and might be more likely installed on systems then *tunctl*. There=
fore
> > it should be tried to setup or teardown the TAP interface with *ip* bef=
ore
> > falling back to *tunctl*.
> >
> > https://git.kernel.org/pub/scm/network/iproute2/iproute2.git/commit/?id=
=3D580fbd88f75cc9eea0d28a48c025b090eb9419a7
> >
> > Signed-off-by: J=F6rg Sommer <joerg.sommer@navimatix.de>
> > ---
> >  scripts/runqemu-ifdown | 14 ++++++++------
> >  scripts/runqemu-ifup   | 31 +++++++++++++++++++------------
> >  2 files changed, 27 insertions(+), 18 deletions(-)
>
> This does make me wonder if we could just drop tunctl now?

I think so. But do all systems support ip, now? If so, the part for ifconfi=
g could be dropped.

> We originally had this as ifconfig couldn't do what we needed and ip
> was comparatively rare on systems. Things have changed and moved on!
>
> Did the gen-tap-devs script also need updating?

Yeah, you're right. I forgot about it.

> Also, this patch does need to go to the openembedded-core list as it is
> changing that repository which poky is built from.

Thanks for the pointing.

Mit freundlichen Gr=FC=DFen


J=F6rg Sommer

Software Developer / Programmierer



--

Navimatix GmbH

Tatzendpromenade 2

07745 Jena


T: 03641 - 327 99 0

F: 03641 - 526 306

M: joerg.sommer@navimatix.de

www.navimatix.de






Gesch=E4ftsf=FChrer: Steffen Sp=E4the, Jan Rommeley

Registergericht: Amtsgericht Jena, HRB 501480



--_000_VI1PR0102MB3136F869DD65A14BC39D4F6EFC51AVI1PR0102MB3136_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
Sorry, I have to resend this message, because I wasn't subscribed to oe-cor=
e.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font style=3D"font-size: 11pt; color=
: rgb(0, 0, 0);" face=3D"Calibri, sans-serif"><b>From:</b> J=F6rg Sommer &l=
t;joerg.sommer@navimatix.de&gt;<br>
<b>Sent:</b> Friday, 9 June 2023 09:30<br>
<b>To:</b> Richard Purdie &lt;richard.purdie@linuxfoundation.org&gt;; poky@=
lists.yoctoproject.org &lt;poky@lists.yoctoproject.org&gt;; openembedded-co=
re@lists.openembedded.org &lt;openembedded-core@lists.openembedded.org&gt;<=
br>
<b>Subject:</b> Re: [poky] [PATCH] runqemu-ifupdown: Add support for ip tun=
tap</font>
<div>&nbsp;</div>
</div>
<div dir=3D"ltr">
<div class=3D"x_elementToProof" style=3D"font-family: Calibri, Arial, Helve=
tica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
@openembedded: I have proposed a patch to runqemu-ifup/down to use `ip tunt=
ap` as an alternative to tunctl for setting up the tap interface. Now the q=
uestion came up if tunctl could be fully dropped.<br>
</div>
<div class=3D"x_elementToProof" style=3D"font-family: Calibri, Arial, Helve=
tica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"x_elementToProof elementToProof">On 8 June 2023 22:18, Richar=
d Purdie wrote:</div>
<div class=3D"x_elementToProof">&gt; On Thu, 2023-06-08 at 15:07 +0200, J=
=F6rg Sommer via</div>
<div class=3D"x_elementToProof">&gt; lists.yoctoproject.org wrote:</div>
<div>&gt; &gt; The *ip* command supports the creation and destruction of TA=
P devices since</div>
<div>&gt; &gt; 2009 and might be more likely installed on systems then *tun=
ctl*. Therefore</div>
<div>&gt; &gt; it should be tried to setup or teardown the TAP interface wi=
th *ip* before</div>
<div>&gt; &gt; falling back to *tunctl*.</div>
<div class=3D"x_elementToProof">&gt; &gt;</div>
<div>&gt; &gt; https://git.kernel.org/pub/scm/network/iproute2/iproute2.git=
/commit/?id=3D580fbd88f75cc9eea0d28a48c025b090eb9419a7</div>
<div>&gt; &gt;</div>
<div class=3D"x_elementToProof">&gt; &gt; Signed-off-by: J=F6rg Sommer &lt;=
joerg.sommer@navimatix.de&gt;</div>
<div>&gt; &gt; ---</div>
<div>&gt; &gt; &nbsp;scripts/runqemu-ifdown | 14 ++++++++------</div>
<div class=3D"x_elementToProof">&gt; &gt; &nbsp;scripts/runqemu-ifup &nbsp;=
 | 31 +++++++++++++++++++------------</div>
<div>&gt; &gt; &nbsp;2 files changed, 27 insertions(+), 18 deletions(-)</di=
v>
<div>&gt; </div>
<div>&gt; This does make me wonder if we could just drop tunctl now?</div>
<div class=3D"x_elementToProof" style=3D"font-family: Calibri, Arial, Helve=
tica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"x_elementToProof" style=3D"font-family: Calibri, Arial, Helve=
tica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
I think so. But do all systems support ip, now? If so, the part for ifconfi=
g could be dropped.<br>
</div>
<div class=3D"x_elementToProof" style=3D"font-family: Calibri, Arial, Helve=
tica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
&gt; We originally had this as ifconfig couldn't do what we needed and ip
<div>&gt; was comparatively rare on systems. Things have changed and moved =
on!</div>
<div class=3D"x_elementToProof">&gt; </div>
<div class=3D"x_elementToProof">&gt; Did the gen-tap-devs script also need =
updating?</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"x_elementToProof" style=3D"font-family: Calibri, Arial, Helve=
tica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Yeah, you're right. I forgot about it.</div>
<div class=3D"x_elementToProof" style=3D"font-family: Calibri, Arial, Helve=
tica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
&gt; Also, this patch does need to go to the openembedded-core list as it i=
s
<div class=3D"x_elementToProof">&gt; changing that repository which poky is=
 built from.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"x_elementToProof" style=3D"font-family: Calibri, Arial, Helve=
tica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<span style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-siz=
e: 12pt; color: rgb(0, 0, 0);">Thanks for the
</span><span style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; f=
ont-size: 12pt; color: rgb(0, 0, 0);"><span class=3D"x_b5 x_ContentPasted0"=
>p</span></span><span style=3D"font-family: Calibri, Arial, Helvetica, sans=
-serif; font-size: 12pt; color: rgb(0, 0, 0);"><span class=3D"x_b4 x_Conten=
tPasted0">oin</span></span><span style=3D"font-family: Calibri, Arial, Helv=
etica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);"><span class=3D"x_=
b3 x_ContentPasted0">ting.</span></span><br>
</div>
<div class=3D"x_elementToProof" style=3D"font-family: Calibri, Arial, Helve=
tica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div>Mit freundlichen Gr=FC=DFen</div>
<div><br>
</div>
<div><br>
</div>
<div class=3D"x_elementToProof">J=F6rg Sommer</div>
<div><br>
</div>
<div>Software Developer / Programmierer</div>
<div><br>
</div>
<div class=3D"x_elementToProof"><br>
</div>
<div><br>
</div>
<div class=3D"x_elementToProof" style=3D"font-family: Calibri, Arial, Helve=
tica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
--&nbsp;<br>
</div>
<div class=3D"x_elementToProof"><br>
</div>
<div>Navimatix GmbH</div>
<div><br>
</div>
<div>Tatzendpromenade 2</div>
<div><br>
</div>
<div>07745 Jena</div>
<div><br>
</div>
<div><br>
</div>
<div>T: 03641 - 327 99 0</div>
<div><br>
</div>
<div>F: 03641 - 526 306</div>
<div><br>
</div>
<div>M: joerg.sommer@navimatix.de</div>
<div><br>
</div>
<div>www.navimatix.de</div>
<div><br>
</div>
<div><br>
</div>
<div><br>
</div>
<div><br>
</div>
<div><br>
</div>
<div><br>
</div>
<div>Gesch=E4ftsf=FChrer: Steffen Sp=E4the, Jan Rommeley</div>
<div><br>
</div>
<div>Registergericht: Amtsgericht Jena, HRB 501480</div>
<div><br>
</div>
<div><br>
</div>
</div>
</body>
</html>

--_000_VI1PR0102MB3136F869DD65A14BC39D4F6EFC51AVI1PR0102MB3136_--

