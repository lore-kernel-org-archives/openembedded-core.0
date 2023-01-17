Return-Path: <kubiznak@2n.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A720C63797
	for <webhook@archiver.kernel.org>; Tue, 17 Jan 2023 10:57:54 +0000 (UTC)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web10.193317.1673953072394596393
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Jan 2023 02:57:53 -0800
Authentication-Results: mx.groups.io;
 dkim=fail, err=mail: missing word in phrase: charset not supported: "iso-8859-2";
 spf=pass (domain: 2n.com, ip: 195.60.68.17, mailfrom: kubiznak@2n.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kEVMPwMLyplxS3Te2WVrRQSRAhStqSL8YnIOrJm4DCchTUh10JfS13JXN3bXT5kel2p7cuq9WT1hhIqTsdY/MbR/fvt/k8cbbbpw27Dl7liwOsXfEbdWiJrpAZ7cyeea3/GHwa7AOlCIJEkCV6jXHTJdj+7woOtpyl+68COa831xpXRM75hPaq7mP3++thAQGulpJB6qvcLDJmiqXR4gosqWU7plDhMgpOJyoLPwplLuriDrSHnJm1cRWHTegiyN0v3xWC7iBCZT1RSTmiB/4+h3KzpBp138Wsb4tMcTyUrNvq3KREC6AGmF3F/TxAtkcWmnT86WqDCTMqU4rELP0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oNNE5q4r1nceNxPnPWAdTnN29Z34fjVKEhtLPqXH1XA=;
 b=BRog4Z4umOGu7fjioV8Y+eGx3DoW3sQ3UcqhIh0AGk+bem7RuRab51rtgDdDLPqGxUFFUyLjRM7K+yLCZrLqnAGbllvkbulc9a5CuOxcHslsPecNJTdX0Hn61aAapKvzxgW0DGs98WvNudJ4R84SBLQgxHAJyrjsyWzwxPieQKY6nIDA6TAG/0MLAMhmXlw5H61vXOh61rP6Az2rtaBPr1XDiMCC7DrdusTYbL1kcr0USy7hVAxY6f3eSU8CNsTdmcbJR29isiMZzJl6Rkhsv8zEzGCKviAn5UI8SFYYQHFQLVxppQ6PMes1rnpM7RtWVVthrrrZeVQ3VSV4wpQiUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=2n.com; dmarc=pass action=none header.from=2n.com; dkim=pass
 header.d=2n.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=axis365.onmicrosoft.com; s=selector2-axis365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oNNE5q4r1nceNxPnPWAdTnN29Z34fjVKEhtLPqXH1XA=;
 b=Z7xsCqqdLUwm9sSrkxIxHI25wy0OUKtADuuempIu2dCOA4I6lnlSF3SQ9DuzSFG1JvIi/++xWVngEiB48t0ySnW3fWtIr5SOJD6yUMwpKRglcLxD9q+GSS5GmZsw8yAYhtDDTQ5cr7PR8KvO/D45659Wtsw7KNAD/qBwe9iYiu8=
From: =?iso-8859-2?Q?Petr_Kubiz=F2=E1k_-_2N?= <Kubiznak@2n.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][PATCH 1/2] gobject-introspection: check for
 GI_DATA_ENABLED
Thread-Topic: [OE-core][PATCH 1/2] gobject-introspection: check for
 GI_DATA_ENABLED
Thread-Index: AQHZIDIvVR7HPOD4Nkm3C4IeSj1LKa6OJ86sgAACnh////a/gIABuyOa///zXQCAAcyOyIAEOpwAgAUAbDw=
Date: Tue, 17 Jan 2023 10:57:48 +0000
Message-ID: <DB4PR02MB10030E1A4CEFF3F064DF2F2EBE2FD9@DB4PR02MB10030.eurprd02.prod.outlook.com>
References: <20230104114555.575278-1-kubiznak@2n.com>
 <17371904FDF90491.29426@lists.openembedded.org>
 <CANNYZj8Qfcs+X8yGRiHZJygZ0RH4n=KDsKXkXO-+duY=ycRS5A@mail.gmail.com>
 <35848697143b4b3a8612c027d8852575@2n.com>
 <CANNYZj9eVWdxkuSVgur0WvTd3xNLECWS5mZ1nZg+q=WPO8PBGQ@mail.gmail.com>
 <6351b082f6b748b7bf01d4313c648861@2n.com>
 <CANNYZj9sEYON_ymHC8-8hyu8kq4jspCHDEF2TyxU1qCcOu3+kQ@mail.gmail.com>
 <e46977d84bbc4fd6ba7966b02937e8e9@2n.com>
 <CANNYZj8LTq_oXKzZUGYjjU0AU=Q8rXvaM0ne0xvz_CaNAV0NjQ@mail.gmail.com>
In-Reply-To: <CANNYZj8LTq_oXKzZUGYjjU0AU=Q8rXvaM0ne0xvz_CaNAV0NjQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=2n.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB4PR02MB10030:EE_|AS8PR02MB7174:EE_
x-ms-office365-filtering-correlation-id: 3ae29d55-71ca-42ff-5f97-08daf879ac0c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: xStGjXG6MSitmxZywdp1NU0qCz73O9/JW+f371IbKppcX3dyIcL8bV7NB3svc2ZSoSeaguZ2yFABBFT8qEx+IVKmx01sDb4U6CoGOF7UM3DhcUA/yBKchLlO+M/gFLOKGquUkQkfEYBt0HSpit2j5Id3VBj1mbX5UE+gqbj7W6gIb70WQ1Jayx3rcwwzFGDVFAVEbximIALUs60cY4tepMAqMZDJwGSykdaPgYlEq9FW02fvxzth86fAUZp7U+WNGZRDMuXEh4zuyp1Z57g/vNpGxilxlVda/eY/EpZcuz/tuRZK4wSWh7nzFaYwa17uN7coAu3I+b0joUdiWzuaALJme+dkwBwoH1q3qGWUEEMHH49xDrrgdMd1t3USdmY99eKNbbZORhyG8aFkdC9tjJ2ekcfX34ICVkQYvqchWZnCCEumjkiGTASmoMUgie3/aeHGwOfgOf1mEuiobkD970EU1JctgfGTOpe6mJTC5q5Lva4BDtFXUTB6X4GLhtpN3LAb2nFqbgNnMEowkF4fQlEuZDWAmCvZplDKnyUFaN7zxbQVXoUiQ87rsw5frEd6a8LoZ4yzIej//jaEd1hi7ezLZYxyx8o0bsbGRumNdWQ/VYq9mc3ScLXg49Qi5dv/n/fkIGfKAk0Dpng6rkTEWHPpfsHkcOMWYkblgWv/CrG3DcRPeVz3n4gqc4+OTTkwMv2cdmSq1UaAPP7SWqzrsg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB4PR02MB10030.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(346002)(39860400002)(376002)(136003)(396003)(451199015)(83380400001)(33656002)(122000001)(86362001)(38070700005)(38100700002)(8676002)(76116006)(5660300002)(8936002)(55016003)(6916009)(52536014)(66556008)(66946007)(66446008)(64756008)(66476007)(2906002)(91956017)(41300700001)(9686003)(53546011)(26005)(6506007)(186003)(316002)(7696005)(478600001)(71200400001)(19627405001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-2?Q?80GEY082/+AyZSDPCn2lS4PI1mvMV7EYtc57GduJcWzDXI2b1/9mdxMqK8?=
 =?iso-8859-2?Q?55Bk0TF4qrEn54/lvwNv4wyEOIMw8FTl0nnkjBJKc1f7UZZztvac5ayXxe?=
 =?iso-8859-2?Q?NtwJ8I5QcvHtsjGYHOdMZcAjzg361kHwfOxijy8Ug649ymQOt0W0yH5A8q?=
 =?iso-8859-2?Q?z/h9mU2uxHMqlkzBKErcFNtsmjfVluOxF5OZRK46KVic6os4v6IbbEdX1K?=
 =?iso-8859-2?Q?rYYhlZi/ufNnZg4SXBCmVunzLhJUx2h+XPhgD1bozLP+TCMf44TFo8GInQ?=
 =?iso-8859-2?Q?EnJEN9P/7hNueZyxXeLqXmpuIrWs3T3iAHjVfEox8U82giDAPrpCnpzSSc?=
 =?iso-8859-2?Q?z8VXFbKFKfQ7JdNq654IJau7KgDf9R0XXukJCt37fW1e5OCwTrE4/9froD?=
 =?iso-8859-2?Q?za96GhR8yafrCTMIr4o1394FTDKWKKDU2MsNmP1oF1vNDn/CxTGvE0QxFc?=
 =?iso-8859-2?Q?drK1L5lbaI4m6gI6UFUc5GrGkEH/n8dQuoXpjuORFzEvUtO9wJsxP1x6/3?=
 =?iso-8859-2?Q?3lbNDGV1csRVIera++mgCdM3RZcW7ATorxXBHJHyx89yr96ogllQZFBIZ4?=
 =?iso-8859-2?Q?exEs/Ys5Wo3tdKDpqcWWW5KK/OYbJGCNrxjsTk6V9JnitEkyCp0+IY0Zit?=
 =?iso-8859-2?Q?I4BLeeUJd0Zjv5LH/SQ0PEOEDLGtsq2jOQrmeLBSPkpxR33B/xAfvvoNS3?=
 =?iso-8859-2?Q?AAqWaWI5frj/eAmMaVfZynXAkh6Cv5sXQFyIII6hHCsDYzoLEgy8BRd/T6?=
 =?iso-8859-2?Q?keTibV89CtQnXBG5n641BxYQodS+O3UUnWOd1QZvjON6yXM0SDLwdZ9+ai?=
 =?iso-8859-2?Q?GeH/BTnIv5kzYAr+GJgI1Qy2cDFZiWTl2M7UhIcO0C7UZnNZzn1mh/jAft?=
 =?iso-8859-2?Q?+btydKCw5//qJtTeiKJGh2BTWopuNiXdiZ+uzXWwPtA19GMZiEt0RYhIy5?=
 =?iso-8859-2?Q?troo9689P/x6IEun+YTLiQmKyxm4mro7a6EC1nzP4JIxl1KWFM9mxVMCI7?=
 =?iso-8859-2?Q?bwqwHaFjTWnPu3iujRP2E9Uo3jHYKfcXsHuE1kbK54LxkwuGXW5Q9P65iP?=
 =?iso-8859-2?Q?7BxLlPJ9ko10fFL34LFVSu3MwSnzB1wVsClYv38pUjI03iphwCn0WNp56Z?=
 =?iso-8859-2?Q?H6WVK9cylU5nBceFE/kATCwbHaG0FfhOiYOJIvK+3KsMQ8D5tNWk3MTNlc?=
 =?iso-8859-2?Q?MmKPh1qLi5BVuHJNowIX7M5YqJjxqJEJ5fm88GkyHcpejf4o2ZNp0B3AwE?=
 =?iso-8859-2?Q?++xqYVdXN4SyJcbiPgW075pTfJm/HaIbAY46A2/BjBaZ1JhG+MymS2d4mq?=
 =?iso-8859-2?Q?MMVRGdlT/YVpLF6vlGtcDboWRfi8aNIP8n6LQvbUdlE+8wAMCOPK9Enw60?=
 =?iso-8859-2?Q?J5f7d8B4BuKx4DwI3NYWEnOYpEZJ35QdXcoLbUSVy2l1C64h1wS9ruEO74?=
 =?iso-8859-2?Q?JkTtNuGUMsGrjnvg0/uTD7w0hPxfnRjUdl68x6gvrchCjuWzfMP1bADrMJ?=
 =?iso-8859-2?Q?BfsyI+9yYqcuuLspNVkLr5Ac96Mfjg3a3jhxow3NdFJP0uRMFXYpkSDP5Y?=
 =?iso-8859-2?Q?+v71YiALEU5EnpF53zy97W2/ilcA5cZZ88TFtJeh/nI6sre3wBxjYJc6By?=
 =?iso-8859-2?Q?C8vMWGLXz8GWU=3D?=
Content-Type: multipart/alternative;
	boundary="_000_DB4PR02MB10030E1A4CEFF3F064DF2F2EBE2FD9DB4PR02MB10030eu_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB4PR02MB10030.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ae29d55-71ca-42ff-5f97-08daf879ac0c
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jan 2023 10:57:48.7413
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sLM9nSUMC6VFqA6xkusLZS27am3i2r9ZZKqwkhWZYHWbOFgvnmItBuQeuMGXtE7V
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR02MB7174
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Jan 2023 10:57:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176030

--_000_DB4PR02MB10030E1A4CEFF3F064DF2F2EBE2FD9DB4PR02MB10030eu_
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable

If you have a bit of time, I'd suggest that you check the failures one
by one. Some of it, like missing glib-* executables seems like a
trivial missing dependency which was previously pulled in indirectly.
Others, like python3-pygobject probably have a hard dependency on g-i.
I'm slowly progressing with the patch but always end up at the principal is=
sue of hard dependency on g-i being enabled.

For example, graphene recipe does not reflect on "gobject-introspection-dat=
a" being/not being in distro features, claiming gtk4 requires build with in=
trospection. Graphene can be patched to be buildable under both circumstanc=
es but gtk4 then (unsurprisingly) fails in do_configure step due to missing=
 graphene-gobject-1.0 if g-i is disabled.

I don't think gtk4 can be patched to build with g-i disabled, do you?

If you agree with me, how can we proceed with the fact that some packages (=
namely gtk4) basically cannot be built without the feature, while still all=
owing to disable that feature? Is it really necessary to have everything bu=
ildable with g-i disabled? Apparently, it's not buildable now.

Petr


________________________________
From: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org> on behalf of Alexander Kanavin <alex.kanavin@gmail.com>
Sent: Monday, January 9, 2023 10:20 AM
To: Petr Kubiz=F2=E1k - 2N <Kubiznak@2n.com>
Cc: openembedded-core@lists.openembedded.org <openembedded-core@lists.opene=
mbedded.org>
Subject: Re: [OE-core][PATCH 1/2] gobject-introspection: check for GI_DATA_=
ENABLED

On Fri, 6 Jan 2023 at 19:52, Petr Kubiz=F2=E1k <kubiznak@2n.com> wrote:
> When the patch is _applied_ and g-i is _disabled_, graphene does build, b=
ut some other packages don't:

...

> This shows that these packages depend on gobject-introspection and/or its=
 dependencies no matter whether introspection is enabled or disabled. I don=
't know these packages so I don't think I'm able to patch them properly. On=
 the other hand, I still believe it is incorrect to pull in the unnecessary=
 dependencies when g-i is disabled. What do you think?
>

This is what I was worried about. It uncovers a whole list of
failures, and creates a new maintenance burden going forward, as
fixing them will be an ongoing activity in the absence of an
unconditional g-i dependecy..

If you have a bit of time, I'd suggest that you check the failures one
by one. Some of it, like missing glib-* executables seems like a
trivial missing dependency which was previously pulled in indirectly.
Others, like python3-pygobject probably have a hard dependency on g-i.

It does require navigating your way around unfamiliar source code,
which is a useful skill in yocto regardless.

Alex

--_000_DB4PR02MB10030E1A4CEFF3F064DF2F2EBE2FD9DB4PR02MB10030eu_
Content-Type: text/html; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
2">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<blockquote itemscope=3D"" itemtype=3D"https://schemas.microsoft.com/Quoted=
Text" style=3D"border-left:3px solid rgb(200,200,200); border-top-color:rgb=
(200,200,200); border-right-color:rgb(200,200,200); border-bottom-color:rgb=
(200,200,200); padding-left:1ex; margin-left:0.8ex; color:rgb(102,102,102)"=
>
<div class=3D"" style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; fo=
nt-size:12pt; color:rgb(0,0,0); background-color:rgb(255,255,255)">
<span style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12=
pt; color:rgb(0,0,0); background-color:rgb(255,255,255)"><span class=3D"Flu=
idPluginCopy ContentPasted0" style=3D"font-size:14.6667px; background-color=
:rgb(255,255,255); display:inline!important">If
 you have a bit of time, I'd suggest that you check the failures one</span>=
<br class=3D"FluidPluginCopy ContentPasted0" style=3D"font-size:14.6667px; =
background-color:rgb(255,255,255)">
</span></div>
<div class=3D"" style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; fo=
nt-size:12pt; color:rgb(0,0,0); background-color:rgb(255,255,255)">
<span style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12=
pt; color:rgb(0,0,0); background-color:rgb(255,255,255)"><span class=3D"Flu=
idPluginCopy ContentPasted0" style=3D"font-size:14.6667px; background-color=
:rgb(255,255,255); display:inline!important">by
 one. Some of it, like missing glib-* executables seems like a</span><br cl=
ass=3D"FluidPluginCopy ContentPasted0" style=3D"font-size:14.6667px; backgr=
ound-color:rgb(255,255,255)">
<span class=3D"FluidPluginCopy ContentPasted0" style=3D"font-size:14.6667px=
; background-color:rgb(255,255,255); display:inline!important">trivial miss=
ing dependency which was previously pulled in indirectly.</span><br class=
=3D"FluidPluginCopy ContentPasted0" style=3D"font-size:14.6667px; backgroun=
d-color:rgb(255,255,255)">
</span></div>
<div class=3D"" style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; fo=
nt-size:12pt; color:rgb(0,0,0); background-color:rgb(255,255,255)">
<span style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12=
pt; color:rgb(0,0,0); background-color:rgb(255,255,255)"><span class=3D"Flu=
idPluginCopy ContentPasted0" style=3D"font-size:14.6667px; background-color=
:rgb(255,255,255); display:inline!important">Others,
 like python3-pygobject probably have a hard dependency on g-i.</span><br>
</span></div>
</blockquote>
<div class=3D"elementToProof" style=3D""><span style=3D""><span style=3D"di=
splay:inline!important">I'm slowly progressing with the patch but always en=
d up at the principal issue of hard dependency on g-i being enabled.</span>=
</span></div>
<div class=3D"elementToProof" style=3D""><span style=3D""><span style=3D"di=
splay:inline!important"><br>
</span></span></div>
<div class=3D"elementToProof" style=3D""><span style=3D""><span style=3D"di=
splay:inline!important">For example, graphene recipe does not reflect on &q=
uot;gobject-introspection-data&quot; being/not being in distro features, cl=
aiming</span></span>&nbsp;gtk4 requires build with introspection.
 Graphene can be patched to be buildable under both circumstances but gtk4 =
then (unsurprisingly) fails in do_configure step due to missing graphene-go=
bject-1.0 if g-i is disabled.</div>
<div class=3D"elementToProof" style=3D""><br>
</div>
<div class=3D"elementToProof" style=3D"">I don't think gtk4 can be patched =
to build with g-i disabled, do you?</div>
<div class=3D"elementToProof ContentPasted2" style=3D""><br>
</div>
<div class=3D"elementToProof ContentPasted1" style=3D"">
<div class=3D"FluidPluginCopy ContentPasted1">If you agree with me, how can=
 we proceed with the fact that some packages (namely gtk4) basically cannot=
 be built without the feature, while still allowing to disable that feature=
? Is it really necessary to have everything
 buildable with g-i disabled? Apparently, it's not buildable now.</div>
<div class=3D"FluidPluginCopy ContentPasted1"><br>
</div>
<div class=3D"FluidPluginCopy ContentPasted1">Petr</div>
<br>
</div>
<div id=3D"appendonsend"></div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" co=
lor=3D"#000000" style=3D"font-size:11pt"><b>From:</b> openembedded-core@lis=
ts.openembedded.org &lt;openembedded-core@lists.openembedded.org&gt; on beh=
alf of Alexander Kanavin &lt;alex.kanavin@gmail.com&gt;<br>
<b>Sent:</b> Monday, January 9, 2023 10:20 AM<br>
<b>To:</b> Petr Kubiz=F2=E1k - 2N &lt;Kubiznak@2n.com&gt;<br>
<b>Cc:</b> openembedded-core@lists.openembedded.org &lt;openembedded-core@l=
ists.openembedded.org&gt;<br>
<b>Subject:</b> Re: [OE-core][PATCH 1/2] gobject-introspection: check for G=
I_DATA_ENABLED</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt"=
>
<div class=3D"PlainText">On Fri, 6 Jan 2023 at 19:52, Petr Kubiz=F2=E1k &lt=
;kubiznak@2n.com&gt; wrote:<br>
&gt; When the patch is _applied_ and g-i is _disabled_, graphene does build=
, but some other packages don't:<br>
<br>
...<br>
<br>
&gt; This shows that these packages depend on gobject-introspection and/or =
its dependencies no matter whether introspection is enabled or disabled. I =
don't know these packages so I don't think I'm able to patch them properly.=
 On the other hand, I still believe
 it is incorrect to pull in the unnecessary dependencies when g-i is disabl=
ed. What do you think?<br>
&gt;<br>
<br>
This is what I was worried about. It uncovers a whole list of<br>
failures, and creates a new maintenance burden going forward, as<br>
fixing them will be an ongoing activity in the absence of an<br>
unconditional g-i dependecy..<br>
<br>
If you have a bit of time, I'd suggest that you check the failures one<br>
by one. Some of it, like missing glib-* executables seems like a<br>
trivial missing dependency which was previously pulled in indirectly.<br>
Others, like python3-pygobject probably have a hard dependency on g-i.<br>
<br>
It does require navigating your way around unfamiliar source code,<br>
which is a useful skill in yocto regardless.<br>
<br>
Alex<br>
</div>
</span></font></div>
</body>
</html>

--_000_DB4PR02MB10030E1A4CEFF3F064DF2F2EBE2FD9DB4PR02MB10030eu_--

