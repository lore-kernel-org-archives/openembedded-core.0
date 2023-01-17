Return-Path: <kubiznak@2n.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5AFBC63797
	for <webhook@archiver.kernel.org>; Tue, 17 Jan 2023 12:58:14 +0000 (UTC)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web11.195394.1673960286515673371
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Jan 2023 04:58:07 -0800
Authentication-Results: mx.groups.io;
 dkim=fail, err=mail: missing word in phrase: charset not supported: "iso-8859-2";
 spf=pass (domain: 2n.com, ip: 195.60.68.17, mailfrom: kubiznak@2n.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VTlXk+zzvQ+uItltu3rjwe2H9hvxVnUYbfD0anVuEYzElj2NtTtrlbFrpzdWfcCC4VbaC0ufkwPU/Gktv0rEbLK8xOb7f8WdGyyXhY1z5g969f1HhHwZX7Hy95KY28JvGJq6FpdwcosSAAidp76mEFngWz2OWNGx3MvYqT11M/vP3xKDdzMNBIwXEh142Pp9hgy4UZSRfRcU9wqk/Q/dJgBpBD3ulB2Jiu3K64TaxmnQVypOirAQM+I55717OIvC9gHwhsapq6HqwubrFX5Hhiues3qfMCZpM16bbzqk2NHTUFdGJe6XGpjKwdo4TUOYyqiel7T08dh3KnBo/OtIhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8Gvjx+fDGZJfQdjSHw1ppBPu/nLxT1gy2IqCGhs7/SQ=;
 b=XitmwuxERH+pgMr0aLF+rFf+ouC7CzfD/ZWRwvi2Bzq2vtFoNJZoFrcPH1ahY61OmvousrwFBYWbqo1ci2V53xGY+rh3nXT+h+WQakEmsyz7/l/wmdlVJAffVAZjQ23wZcqXvoY8iWNJOcuLO7mI/eU18moOSQiXHJg1queNoCMw5BSjdKjJfto6PpqXUCPC5e5nio8IcU4gycT+xLG7GBaycefARw1IQzrBQGllUeN57KgrzRaa04DT55wNR0yQKq7RN9W4/6fsxCelNHWNR5VcXB9OkPFm2pWcbsxAU8BgiCAvu/xmB3sHxqJKjtZqXQyKrqOCU3sAlkWwlfB5Gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=2n.com; dmarc=pass action=none header.from=2n.com; dkim=pass
 header.d=2n.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=axis365.onmicrosoft.com; s=selector2-axis365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8Gvjx+fDGZJfQdjSHw1ppBPu/nLxT1gy2IqCGhs7/SQ=;
 b=vn5vucu6fwP5L/Nu86geIkia0tFo5fZ73MyWB+ATd87mPO3HaZHHH3bWsnhyCnoXKkX5kBSOlhpRIvTZqoj37D6wGIllWwXO5nh5RZhusj591V0lapcctqokkTgLGPX9q2o2jPLHF9Pr+4hRMT0N/k+026fVoEM2H6qDatdZCC0=
From: =?iso-8859-2?Q?Petr_Kubiz=F2=E1k_-_2N?= <Kubiznak@2n.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][PATCH 1/2] gobject-introspection: check for
 GI_DATA_ENABLED
Thread-Topic: [OE-core][PATCH 1/2] gobject-introspection: check for
 GI_DATA_ENABLED
Thread-Index: AQHZIDIvVR7HPOD4Nkm3C4IeSj1LKa6OJ86sgAACnh////a/gIABuyOagBLIh4CAAADWUQ==
Date: Tue, 17 Jan 2023 12:58:02 +0000
Message-ID: <DB4PR02MB100307DAFF17C02D888D5BFFDE2C69@DB4PR02MB10030.eurprd02.prod.outlook.com>
References: <20230104114555.575278-1-kubiznak@2n.com>
 <17371904FDF90491.29426@lists.openembedded.org>
 <CANNYZj8Qfcs+X8yGRiHZJygZ0RH4n=KDsKXkXO-+duY=ycRS5A@mail.gmail.com>
 <35848697143b4b3a8612c027d8852575@2n.com>
 <CANNYZj9eVWdxkuSVgur0WvTd3xNLECWS5mZ1nZg+q=WPO8PBGQ@mail.gmail.com>
 <6351b082f6b748b7bf01d4313c648861@2n.com>
 <CAO5Uq5RTENq4mFXVHf5qpG2+Le2OnM_4C48TAV4c5_t7+NvdAQ@mail.gmail.com>
In-Reply-To: <CAO5Uq5RTENq4mFXVHf5qpG2+Le2OnM_4C48TAV4c5_t7+NvdAQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=2n.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB4PR02MB10030:EE_|DBAPR02MB6456:EE_
x-ms-office365-filtering-correlation-id: b9e096bc-863a-40ab-70ed-08daf88a77c6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: WuCZQ4JUHF1F/tTO6KUAOqKU0Oa9l3Y5THm0J2SD/gNwHXbyt7gcweJa3G0k4mllB2FjBV2w9vnSiQ5OHZPf3/Zcm4x5GFz8dm34ZqBzvaZ+FzmuJ5FJajRsuDCaY68z3b/S0/jDlypMcv8+Fp9DA1bby5P4XhyOdD0aTaHD9mGEcIfEgxXVHll/+19g9yitPQsylZdEm0PtQwavG4jUWwIJaOka+ld+AwjUcbWPW5I4ZJ1xDg5qXvp71LKHwoUnU8Pyz443TIV+nUM1LDrlJhBiKHIsgSCn3y+ePHywhpr4MyFvvYtU5hfyb5+XHG2+Xhj8wHKlkPmL26dYj56tdCjYZTrokU8qP3oG2q0iCTxxi3bRCiUBuwFNgZWLvimfeYHtMWWKGzHR/g/WeuKH5DzSrfAN1O9LuJljKtpTQ00ixuXLr26laVocMwL6KmAlIahXFsHQ9RNbubHUXoqIuREpZXoAJNJZ6pfX2SxD2RXdFwdL1FTBetEdo8kuosodjJPsjzJyreVatRELoTepJ5aDCWwfLCHmrE5RoK0Qjg6092a+nMbhZJgAEJwKsW2fNOImfrIleA4TJfHLE1GANTPfcw5od03nYd04ca5INkan/fCZmTdPzoN6emykTMOt8hZOge5oOChiEScuA31f+r/MqUiWi2BlHZkIgFIb8JsOM9zpfmC6lbjZJksjRDdX3m8AAM3UAzjV9gTaRl2c3pw9UJV7kkJtrArOJ3xixDU=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB4PR02MB10030.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39850400004)(346002)(366004)(136003)(396003)(376002)(451199015)(2906002)(66899015)(41300700001)(6506007)(5660300002)(19627405001)(52536014)(8936002)(83380400001)(53546011)(66556008)(8676002)(71200400001)(76116006)(6916009)(122000001)(166002)(38100700002)(38070700005)(66476007)(316002)(66946007)(64756008)(478600001)(66446008)(91956017)(7696005)(86362001)(55016003)(966005)(33656002)(186003)(26005)(9686003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-2?Q?Q4bZnpsjtXyeK2/a038h8CoXeXR2oUqXS5rjJeMYODWDKidtl9kMX/GfzL?=
 =?iso-8859-2?Q?CrkfU9cPQbTwD72cw2czypb6j2qk3NdM4UCqRk36ReNtT1aM0HYEvZbCqZ?=
 =?iso-8859-2?Q?eDhrqv8ywSuvBd/+hL5Ph9OYobKU5Egj+UwbW+nPy4vsWFC0DtVyJcqZzw?=
 =?iso-8859-2?Q?kkY6HfiQA5hdlXv/LC/Hcrjfzrnaq7frseLeNxrwJ9WKqluRLZk9HGyYZd?=
 =?iso-8859-2?Q?QMLW6t5BVNOxl5uWivDE/YR9fiO0GDRuOcRls2MxGqk/jN+7KK4uq2+NQv?=
 =?iso-8859-2?Q?k7bMWUUokkXcsEuD/o51h8uVIFtHOGCjhNjNkPxQAW2TNjNMVOdXwOibJl?=
 =?iso-8859-2?Q?xBycDGIb66t5lRrmc4aT4sMEODc51qgtrt3ZZsA5pd54tC0dIM7qRDXXTL?=
 =?iso-8859-2?Q?R23GkZeGKN5bFaZCIgKInIkBGjOxq4SirUMgxl8dwM0eKlOaptwwHyPE6i?=
 =?iso-8859-2?Q?6eSXMX+ihoYJo2d/GQtIfAIPkmF2iw47q4Bi3v3B2AKWet0NXJqnyyGqLU?=
 =?iso-8859-2?Q?eNjrq0O4gdoWb0yOKi6BYefTvlr7KvzeLwMYn7VSMaOTk32fUuILPxQDif?=
 =?iso-8859-2?Q?uapzOPvrAV/jN/Bul4KFRoZg2er9OQK3GVO/qh6j0iglW2KmpisgcvVZ8w?=
 =?iso-8859-2?Q?oSiKicC8Q8K4zoNIwn4EMAeGVzRC5AZyNIP7wFqs2Ns8bpfz/bYkRY0OZ0?=
 =?iso-8859-2?Q?GQHF9y7snsQJegk8YGUvUWQVtbyyDyFSJ1b3bji8g9r7wwyRQ+KNsRZZvr?=
 =?iso-8859-2?Q?u6oxvOlwDE8Gus3S6miCWrxOay4wmUJQsphMieWBPZxfqaeNs6UFZ3YQyj?=
 =?iso-8859-2?Q?ekF1vqX+ASI0fcy70jmmW5HOXiKubte+OkmB/GCG8nHkk2fhaz5QQULukY?=
 =?iso-8859-2?Q?+ZgMk6pXUoWDhXcjJfMCoPwJTf5gO2nrQD8tVP05HKSh1SNvwVNWXLDh9K?=
 =?iso-8859-2?Q?d++5oHU6lpLmQKQs4ICdoi+MGe3TPrLqjXrHrMkZ8jesKQAxQH5K9/0Rgp?=
 =?iso-8859-2?Q?sVuc8WBWp3m2gp0/iri/FpsZRNQS9tYbBMRBbonTSdREj0Hewg+YQwyzhQ?=
 =?iso-8859-2?Q?AwEUEewOIKNyTzL42SFJ7STN2MCTcZQ5wQIg0S2WUyKbt/k0blyLtY/ROz?=
 =?iso-8859-2?Q?bQ1EjURjParVqR3QAKNuG8N8obdNUiQtk4xaJpr0/bPo7S8/n5fQ6DJuAj?=
 =?iso-8859-2?Q?Do3pTzyLORMSWpzopfJWwNosH38QxrXivGs4b/KQ3NFBx6Lb8tt1yfgYTA?=
 =?iso-8859-2?Q?VJPd00DKQdg9+JH8T3+aOSK70ioi7buTrxJUchUvJGxgNX9eJVqKQ0xwgX?=
 =?iso-8859-2?Q?pXCtHWQrVQ24ei98PM78R603Bg8RQzVxCfM8FBJnOLyZC9/HvYCokjiInt?=
 =?iso-8859-2?Q?dsYcQJ8hFVXnpU5Mh56aBU9GyaFqNYYD95Zp5R5+3HDeJYHEPViSK/1yEB?=
 =?iso-8859-2?Q?qh6smHgih2RI6TsowVs8yyQCLC+ZeTT6/7xNJLHuwg3R1sBhxSHZIQVygS?=
 =?iso-8859-2?Q?8kOGqXwBu9xSOalqhaJ3o9SNA+gjwVi9WdQ9CVMUraoi1hefnRI9fuxbPs?=
 =?iso-8859-2?Q?+KnH6oG8qKZmGmDQuwgm/i5jD/AazGhRK9I0vUb7U0W+PIQEZeBNYeRqcy?=
 =?iso-8859-2?Q?yt1TiZyOYkMqI=3D?=
Content-Type: multipart/alternative;
	boundary="_000_DB4PR02MB100307DAFF17C02D888D5BFFDE2C69DB4PR02MB10030eu_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB4PR02MB10030.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b9e096bc-863a-40ab-70ed-08daf88a77c6
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jan 2023 12:58:02.4546
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cmHucYG95Ne/QgijxJQDlr3TtlTzhRngQeiiV8WfQsNYbxEivhebzYRpv7YsXLNd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR02MB6456
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Jan 2023 12:58:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176036

--_000_DB4PR02MB100307DAFF17C02D888D5BFFDE2C69DB4PR02MB10030eu_
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable

This issue was actually caused by missing host dependencies. Shame on me...
________________________________
From: Alex Kiernan <alex.kiernan@gmail.com>
Sent: Tuesday, January 17, 2023 1:52 PM
To: Petr Kubiz=F2=E1k - 2N <Kubiznak@2n.com>
Cc: openembedded-core@lists.openembedded.org <openembedded-core@lists.opene=
mbedded.org>
Subject: Re: [OE-core][PATCH 1/2] gobject-introspection: check for GI_DATA_=
ENABLED

On Thu, Jan 5, 2023 at 2:13 PM Petr Kubiz=F2=E1k <kubiznak@2n.com> wrote:
>
> Is the `bitbake world` command guaranteed to succeed for every commit in =
the repository? In my case, I end up with failures even with _default_ setu=
p. My point is whether this has to be an issue on my machine (e.g. native t=
ools?), or I should just try a different commit.
>
>
> Build Configuration:
> BB_VERSION           =3D "2.2.0"
> BUILD_SYS            =3D "x86_64-linux"
> NATIVELSBSTRING      =3D "universal"
> TARGET_SYS           =3D "x86_64-poky-linux"
> MACHINE              =3D "qemux86-64"
> DISTRO               =3D "poky"
> DISTRO_VERSION       =3D "4.1"
> TUNE_FEATURES        =3D "m64 core2"
> TARGET_FPU           =3D ""
> meta
> meta-poky
> meta-yocto-bsp       =3D "HEAD:2c6f0b9228b47459dd1b67d578792cd017006128"
> ...
> ERROR: rust-1.66.0-r0 do_compile: ExecutionError('/home/kubiznak/projects=
/poky/builds/test-gi/tmp/work/core2-64-poky-linux/rust/1.66.0-r0/temp/run.d=
o_compile.1080378', 1, None, None)
> ERROR: Logfile of failure stored in: /home/kubiznak/projects/poky/builds/=
test-gi/tmp/work/core2-64-poky-linux/rust/1.66.0-r0/temp/log.do_compile.108=
0378
> NOTE: recipe rust-1.66.0-r0: task do_compile: Failed
> ERROR: Task (/home/kubiznak/projects/poky/meta/recipes-devtools/rust/rust=
_1.66.0.bb:do_compile) failed with exit code '1'
>
> The first error in rust log:
>
> error: /home/kubiznak/projects/poky/builds/test-gi/tmp/work/core2-64-poky=
-linux/rust/1.66.0-r0/rustc-1.66.0-src/build/x86_64-unknown-linux-gnu/stage=
1-rustc/release/deps/libunic_langid_macros_impl-09018f99e8b09dcb.so: undefi=
ned symbol: _Ungind_Resume
>  --> /home/kubiznak/projects/poky/builds/test-gi/tmp/work/core2-64-poky-l=
inux/rust/1.66.0-r0/rustc-1.66.0-src/vendor/unic-langid-macros/src/lib.rs:5=
:9
>   |
> 5 | pub use unic_langid_macros_impl::langid;
>   |         ^^^^^^^^^^^^^^^^^^^^^^^
>

Are you building with `DEBUG_BUILD =3D "1"`? There seem to be a number
of tickets out there for this failure if the optimiser isn't running.

> Full logs attached.
>
>
> Petr
>
> ________________________________
> From: Alexander Kanavin <alex.kanavin@gmail.com>
> Sent: Wednesday, January 4, 2023 1:36:27 PM
> To: Petr Kubiz=F2=E1k - 2N
> Cc: openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core][PATCH 1/2] gobject-introspection: check for GI_DAT=
A_ENABLED
>
> On Wed, 4 Jan 2023 at 13:24, Petr Kubiz=F2=E1k <kubiznak@2n.com> wrote:
> > Yes, that's exactly the reason. I'm particularly concerned about depend=
ency on glib, but other dependencies are unnecessary, too.
> >
> >
> > This change was sufficient to remove the dependency from the target. I =
am not aware of potential consequences of removing the -native dependencies=
, but if you think it should also be done, I'm happy to update the patch. P=
lease let me know.
>
> I'd suggest that you remove all three, then set up a plain poky master
> build with gobject-introspection-data disabled, and issue bitbake
> world.
>
> Component upstreams generally only test the gi-enabled configuration,
> so this may reveal incorrect upstream logic when g-i is disabled.
>
> Alex
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#175529): https://lists.openembedded.org/g/openembedde=
d-core/message/175529
> Mute This Topic: https://lists.openembedded.org/mt/96048399/3618097
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kiernan@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--
Alex Kiernan

--_000_DB4PR02MB100307DAFF17C02D888D5BFFDE2C69DB4PR02MB10030eu_
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
<div class=3D"elementToProof"><span style=3D"font-family: Calibri, Arial, H=
elvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0); background-colo=
r: rgb(255, 255, 255);">This issue was actually caused by missing host depe=
ndencies. Shame on me...</span></div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Alex Kiernan &lt;alex=
.kiernan@gmail.com&gt;<br>
<b>Sent:</b> Tuesday, January 17, 2023 1:52 PM<br>
<b>To:</b> Petr Kubiz=F2=E1k - 2N &lt;Kubiznak@2n.com&gt;<br>
<b>Cc:</b> openembedded-core@lists.openembedded.org &lt;openembedded-core@l=
ists.openembedded.org&gt;<br>
<b>Subject:</b> Re: [OE-core][PATCH 1/2] gobject-introspection: check for G=
I_DATA_ENABLED</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">On Thu, Jan 5, 2023 at 2:13 PM Petr Kubiz=F2=E1k &=
lt;kubiznak@2n.com&gt; wrote:<br>
&gt;<br>
&gt; Is the `bitbake world` command guaranteed to succeed for every commit =
in the repository? In my case, I end up with failures even with _default_ s=
etup. My point is whether this has to be an issue on my machine (e.g. nativ=
e tools?), or I should just try a different
 commit.<br>
&gt;<br>
&gt;<br>
&gt; Build Configuration:<br>
&gt; BB_VERSION&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 =3D &quot;2.2.0&quot;<br>
&gt; BUILD_SYS&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; =3D &quot;x86_64-linux&quot;<br>
&gt; NATIVELSBSTRING&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D &quot;universal&quot=
;<br>
&gt; TARGET_SYS&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 =3D &quot;x86_64-poky-linux&quot;<br>
&gt; MACHINE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; =3D &quot;qemux86-64&quot;<br>
&gt; DISTRO&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; =3D &quot;poky&quot;<br>
&gt; DISTRO_VERSION&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D &quot;4.1&quot;=
<br>
&gt; TUNE_FEATURES&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D &quot;m64 =
core2&quot;<br>
&gt; TARGET_FPU&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 =3D &quot;&quot;<br>
&gt; meta<br>
&gt; meta-poky<br>
&gt; meta-yocto-bsp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D &quot;HEAD:2c6f=
0b9228b47459dd1b67d578792cd017006128&quot;<br>
&gt; ...<br>
&gt; ERROR: rust-1.66.0-r0 do_compile: ExecutionError('/home/kubiznak/proje=
cts/poky/builds/test-gi/tmp/work/core2-64-poky-linux/rust/1.66.0-r0/temp/ru=
n.do_compile.1080378', 1, None, None)<br>
&gt; ERROR: Logfile of failure stored in: /home/kubiznak/projects/poky/buil=
ds/test-gi/tmp/work/core2-64-poky-linux/rust/1.66.0-r0/temp/log.do_compile.=
1080378<br>
&gt; NOTE: recipe rust-1.66.0-r0: task do_compile: Failed<br>
&gt; ERROR: Task (/home/kubiznak/projects/poky/meta/recipes-devtools/rust/r=
ust_1.66.0.bb:do_compile) failed with exit code '1'<br>
&gt;<br>
&gt; The first error in rust log:<br>
&gt;<br>
&gt; error: /home/kubiznak/projects/poky/builds/test-gi/tmp/work/core2-64-p=
oky-linux/rust/1.66.0-r0/rustc-1.66.0-src/build/x86_64-unknown-linux-gnu/st=
age1-rustc/release/deps/libunic_langid_macros_impl-09018f99e8b09dcb.so: und=
efined symbol: _Ungind_Resume<br>
&gt;&nbsp; --&gt; /home/kubiznak/projects/poky/builds/test-gi/tmp/work/core=
2-64-poky-linux/rust/1.66.0-r0/rustc-1.66.0-src/vendor/unic-langid-macros/s=
rc/lib.rs:5:9<br>
&gt;&nbsp;&nbsp; |<br>
&gt; 5 | pub use unic_langid_macros_impl::langid;<br>
&gt;&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ^^^^^^^^=
^^^^^^^^^^^^^^^<br>
&gt;<br>
<br>
Are you building with `DEBUG_BUILD =3D &quot;1&quot;`? There seem to be a n=
umber<br>
of tickets out there for this failure if the optimiser isn't running.<br>
<br>
&gt; Full logs attached.<br>
&gt;<br>
&gt;<br>
&gt; Petr<br>
&gt;<br>
&gt; ________________________________<br>
&gt; From: Alexander Kanavin &lt;alex.kanavin@gmail.com&gt;<br>
&gt; Sent: Wednesday, January 4, 2023 1:36:27 PM<br>
&gt; To: Petr Kubiz=F2=E1k - 2N<br>
&gt; Cc: openembedded-core@lists.openembedded.org<br>
&gt; Subject: Re: [OE-core][PATCH 1/2] gobject-introspection: check for GI_=
DATA_ENABLED<br>
&gt;<br>
&gt; On Wed, 4 Jan 2023 at 13:24, Petr Kubiz=F2=E1k &lt;kubiznak@2n.com&gt;=
 wrote:<br>
&gt; &gt; Yes, that's exactly the reason. I'm particularly concerned about =
dependency on glib, but other dependencies are unnecessary, too.<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; This change was sufficient to remove the dependency from the targ=
et. I am not aware of potential consequences of removing the -native depend=
encies, but if you think it should also be done, I'm happy to update the pa=
tch. Please let me know.<br>
&gt;<br>
&gt; I'd suggest that you remove all three, then set up a plain poky master=
<br>
&gt; build with gobject-introspection-data disabled, and issue bitbake<br>
&gt; world.<br>
&gt;<br>
&gt; Component upstreams generally only test the gi-enabled configuration,<=
br>
&gt; so this may reveal incorrect upstream logic when g-i is disabled.<br>
&gt;<br>
&gt; Alex<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#175529): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/175529">
https://lists.openembedded.org/g/openembedded-core/message/175529</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/96048399=
/3618097">https://lists.openembedded.org/mt/96048399/3618097</a><br>
&gt; Group Owner: openembedded-core+owner@lists.openembedded.org<br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
core/unsub">
https://lists.openembedded.org/g/openembedded-core/unsub</a> [alex.kiernan@=
gmail.com]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
<br>
<br>
-- <br>
Alex Kiernan<br>
</div>
</span></font></div>
</body>
</html>

--_000_DB4PR02MB100307DAFF17C02D888D5BFFDE2C69DB4PR02MB10030eu_--

