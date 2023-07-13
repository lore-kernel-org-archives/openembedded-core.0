Return-Path: <Wolfgang.Brehm@karlstorz.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B51BC0015E
	for <webhook@archiver.kernel.org>; Thu, 13 Jul 2023 14:26:24 +0000 (UTC)
Received: from mx07-0040c702.pphosted.com (mx07-0040c702.pphosted.com [205.220.184.135])
 by mx.groups.io with SMTP id smtpd.web10.9688.1689258373258215118
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Jul 2023 07:26:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@karlstorz.com header.s=s-dkim-20210427 header.b=F1kZuLT7;
 spf=pass (domain: karlstorz.com, ip: 205.220.184.135, mailfrom: wolfgang.brehm@karlstorz.com)
Received: from pps.filterd (m0267679.ppops.net [127.0.0.1])
	by mx07-0040c702.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36DDkQe1001481;
	Thu, 13 Jul 2023 14:26:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=karlstorz.com; h=from : to : cc :
 date : message-id : references : in-reply-to : content-type : mime-version
 : subject; s=S-DKIM-20210427;
 bh=TikltWxFdrldrGaF3a4YNiwNV31yPDOLtw1jyormIs8=;
 b=F1kZuLT7wM1/WlwgMTfKCTQ/sIXKa3KjhJx0rlebbbml4QUBNRQCYnHTBDtsAk6zVI8Q
 AiWqbfhf9ptoTw2qfbGLl0U39LN+KPZ1vapJpfTCHxovzfGBHHkerQUnsBvFrd4gSWJn
 MLnRg27ZuCAvrgE6CL896b4wXhe/yLE7hJaW7CAwPJsPAfw31q2r3XJr/alAN/26Z7N0
 l8epNVxFyL8qZgn/EW4krp+eoP/37b9c6y1LUQctEJG7y++d897sy2yMKatIHLxxxcy2
 CcdVDpBRADenxvel2wP1p+6WylGBABymZGs2vbJeHKwTT8oBsSTH2Q3xKpgt2JxrhTlI nQ== 
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam04lp2043.outbound.protection.outlook.com [104.47.73.43])
	by mx07-0040c702.pphosted.com (PPS) with ESMTPS id 3rt6bxa4r1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Jul 2023 14:26:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IcNFjK33m3IWpv6X/jJAjX7LE5tSbpDy5+F/ehSXhXJJ1O03MOCg0KOkj/UP//t/5iz15NbvYHruxfXI8WsdEp7p4IixTyJY6H2bup5y2FsTjPpbWCCSWj7GCuike6UqeWSvCjNjPeUbFiJX+iUCI9H9JOqVeYEYVNtMtdJwplcI/hGF3yDaTkI3kNZ2V2JAYclmoY/X45W/DGTR9XTRVJE9a7vAX9WhT9m6gjagi5KFshD5FjIfhM+v2eX+AsZP1k+TJGdAjS8Zk5g6HDoP/m41QPWNXysQ6FmwVbu2ibCd8F92uIwIC1bfLZ+Atmuedquv6XV36cF+2XoqxdOwoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TikltWxFdrldrGaF3a4YNiwNV31yPDOLtw1jyormIs8=;
 b=Z6Rr1nlALjC8hn+oC9T/IH2jBJJRt86JuPogD3QokEPt+M2HeAu4czKmOD17ndX5KyGLubLTSwQb5XTrjCk2uNBrV4uw3NvVQftUs1JoJiUW+WJ0FeTfSFC4VE/njZ62UHoABhic8vTuHw8jHdq6tljBwI0GjJsShZ2GGZGGBATIUtP4RIrRuVzPubzXY7eFigdCOn2QgU6kX/keXMA44wzFhh6qqdIR0VCFTubaFoeXd15wBcuhfXJT5uTIwGYNqDQ6Tj1p0ua7KxfgqNsuWU04aLwxHj+Qf10Kti2okEN4LwvopVXvCbgYhl9yNaIivi+IJrbiy/z8eggVkaUQ1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=karlstorz.com; dmarc=pass action=none
 header.from=karlstorz.com; dkim=pass header.d=karlstorz.com; arc=none
Received: from SN7PR19MB7573.namprd19.prod.outlook.com (2603:10b6:806:34e::15)
 by PH0PR19MB4908.namprd19.prod.outlook.com (2603:10b6:510:92::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.24; Thu, 13 Jul
 2023 14:25:53 +0000
Received: from SN7PR19MB7573.namprd19.prod.outlook.com
 ([fe80::363d:2141:a4e1:6bb9]) by SN7PR19MB7573.namprd19.prod.outlook.com
 ([fe80::363d:2141:a4e1:6bb9%5]) with mapi id 15.20.6565.034; Thu, 13 Jul 2023
 14:25:53 +0000
From: "Brehm, Wolfgang" <Wolfgang.Brehm@karlstorz.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
        "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: Joshua Watt <JPEWhacker@gmail.com>
Thread-Topic: [Ext] Re: [OE-core] extractedText for every License in SPDX
Thread-Index: AQHZtWxjZo9z0ErBekC6rUua5Zu7d6+3iA4AgAAUiXw=
Date: Thu, 13 Jul 2023 14:25:53 +0000
Message-ID: 
 <SN7PR19MB7573B5E21F72B13803E161728237A@SN7PR19MB7573.namprd19.prod.outlook.com>
References: 
 <SN7PR19MB757312F779E1255862F293EE8237A@SN7PR19MB7573.namprd19.prod.outlook.com>
 <ab9c16fb53d525f3f0e3afaaaa30dc9e78c403d0.camel@linuxfoundation.org>
In-Reply-To: 
 <ab9c16fb53d525f3f0e3afaaaa30dc9e78c403d0.camel@linuxfoundation.org>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR19MB7573:EE_|PH0PR19MB4908:EE_
x-ms-office365-filtering-correlation-id: 06d03d0a-66cd-4222-3858-08db83ad10a4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 5THd02xl3nBEOCnEaN+JHiNgQGjbNTIVHKxrKRwKADpYh1KCWS0ZGm2ZcjZjHiPkLl0OmJwvKtPgmVz13Qc8hAD5HJ0JjCeG0FEp2r4zqRzGmlRwC1DtefZdHaSLr54WfD2fLYqzgbsntIeykhD7YPsdizfROT2G40NojuU+Ajglb5X3IQAM8A3ggFLNsElU75KEEvbpUKoWL1syYkJjJfkKTbj1mX+0J41X1jDApe8t1I8QjVsCUmmdkCwksaeUxIO9ARHL1qq3SbWNEpXX1lKxO7D+/FIEzRx/coL17+N2v7vKQbVq7vkgw5cbZ8yDIwk/FhTpBX9CzRaoBTl/bR6IYxAWFkhdCvM2PqaH0DRIZqV+E43ZnKyDLuO+wapb39tIQ7R0j3Cj1trmlEbMGG0Wr9oyIy/64zqIG3nLjUuoccapLwvCIG+v+njDmwezE9smeH4we73P7wE/DESVbvR4LPLIIunUqqpADGz8v5AganL+yx+W7wAExawVyrJjtcmaggkl9mepe3lc/mCMkKcP3SZx54reFWBUDHhrhpg7TF2AVys4+94ssdOVElOW7se/5merUcRkVjQBQOc1Lrk4ydnq2Op1s1GayJhkWQY=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR19MB7573.namprd19.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(376002)(39850400004)(366004)(136003)(396003)(451199021)(52536014)(5660300002)(66556008)(66446008)(64756008)(8676002)(4326008)(19627405001)(8936002)(41300700001)(316002)(66476007)(2906002)(76116006)(66946007)(91956017)(110136005)(71200400001)(7696005)(966005)(9686003)(6506007)(186003)(53546011)(83380400001)(33656002)(86362001)(38100700002)(38070700005)(55016003)(478600001)(166002)(122000001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?toc99mhFkQNwcVQkDw5dcEzNVGy55I7S7Emk2dJtbZYAeFzDROPPSBZ9blED?=
 =?us-ascii?Q?RSGQa29YwfGSxSfj2RrKduLY5xZTXKqKjxPQ6XEhWfv1LmsaDyc2oCZyhRQM?=
 =?us-ascii?Q?glNbHhOIlMJuFmJiiBfPMlZfrZ5xmwNwIVM08XepdvjzjofsEJMwLm2gKLWc?=
 =?us-ascii?Q?AeVJbbqCPrGHyxLWxXil0r77MH64oJICIB7G41GNDDMvRSEEyOLvCpbFJdg1?=
 =?us-ascii?Q?4nGPDzT1Sk2QloZc2WkBLNeH/hMM8rqBCat+iybz4/OWcKmI8WFVkQzvtRJT?=
 =?us-ascii?Q?ZvGQ9kPOqlJ+9b7uUt0mSEVBMdA73Z0ZleodgXABnFNiZxkOVizr5acmo530?=
 =?us-ascii?Q?IEhpxy1pOMPDOWvHl5+nAQo/MP8GB+PURKP+HOG9eE70049o8oWeKtdSHvrz?=
 =?us-ascii?Q?94NxiYTs8slccvhooxkStDJHIVL5KO8HQPnCw3ZPIv/EOYvju4kdmgZGElQU?=
 =?us-ascii?Q?caWCKRAS+2pS+isO9/f+dcg645hEYrXOGOIJT/fNZnPPGt8lwvEq/0HT/0Hc?=
 =?us-ascii?Q?1A0dtGgIq5EWpdpq1hxspSWwk00nsKiq+Mlwta1pgaZon7ScHB7/M6UMyGGj?=
 =?us-ascii?Q?FHvR/4gwgQY6nb3o2+jlpTCOzG/TRI5ks9p2CbivV/FPfMGVTNpDO9MLyl5G?=
 =?us-ascii?Q?Ymt5nlynTIePz9UrUjdMGnmNnkOLn4i6AcnZoejkp9qhQDz46rPRJL8Sbbfk?=
 =?us-ascii?Q?WV3z5/Jhy5OBe4NS9ksZnJaTBCTgxs334pr1HpLhg3p8aExcgwtVtbA3uLgj?=
 =?us-ascii?Q?jdyi83RuLV+eSHxi0x4mhTRel/1tnAweWE0EZBDE3WMpYELBwGL1RV/ANAcr?=
 =?us-ascii?Q?Pqlox+0URFqzKh3jzQggGJ2QEgVSKejLedpGt3etrJoNs7wEzBuxzye6mMbY?=
 =?us-ascii?Q?kJWwxttyHlvX8jZV5dGiIIH72u2kltIt+qLYVVm23kqtT+1zRN1MY3U9sD+C?=
 =?us-ascii?Q?1fM6Q2QQl4GXUxlQ8R2mucCnome3u67uBNJId9BvbLL6Vvhbc/kzsFoUXDe0?=
 =?us-ascii?Q?IClLNykcmI8gTU+QrstcnMGq586jDb++95ri6iDjl/OYWtOlXSavzLo8QWY6?=
 =?us-ascii?Q?IKODuUgrh3s1Wmw8hyvRDQE1K+n9xE6XfOrSHCUuQJGxx0R5zg5t4p6qXW49?=
 =?us-ascii?Q?27LPzR9Uih4nGuCCVujgmo327M0BeJpHd3nY+PDgqHiylQWUcmdJXNIkAZp3?=
 =?us-ascii?Q?tJt4eb37scAzs+Ahn7WPO5Pl1JB32NEOpbwF5Lw4wyORHgsKELX7JxOUCzpv?=
 =?us-ascii?Q?ZrVBW6bxdh6Ms7pSEvb/tJxnKzCi/xaXCDo59GzlrXwkdeX42vguZjIhnMnS?=
 =?us-ascii?Q?QC5w9Cx7lywZMOEgIac/H2sA1uLsQ60RBphgVHIkcp4i2onT9v4XusPtrqTW?=
 =?us-ascii?Q?5WJKmJXSERVkDYB1j8lsne49z3WyYtWVzTNIBc7BTGdUTFliVEHodnJNQldw?=
 =?us-ascii?Q?gXtg4Tybg/XqmULAzNCY16faYrgfQfixixADbfsX57uRK7kFwnDT1hiKGkEQ?=
 =?us-ascii?Q?zwU8MGFgHbUD4qkseohxtQOF9eY0lDhPJLbRNivCZ8SSKI7GGLWYqsB3eD1q?=
 =?us-ascii?Q?UslZk/oCsvsKCEKQjCHE7z6wzDzVDwYXI5o7jMC2SvYuJMFBvejfXKmZKxpF?=
 =?us-ascii?Q?zaL2hxTSheOgtMX7TEGkWr+ZMs68cXX5fTKh09h4w60z?=
Content-Type: multipart/alternative;
	boundary="_000_SN7PR19MB7573B5E21F72B13803E161728237ASN7PR19MB7573namp_"
MIME-Version: 1.0
X-OriginatorOrg: karlstorz.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR19MB7573.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 06d03d0a-66cd-4222-3858-08db83ad10a4
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jul 2023 14:25:53.4394
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4a0b6f21-e6e1-4ed6-9dcf-e60e7190f648
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nRRaWzHjEURTSHQVELeLCWJNPqWZ7AWqtOE+6pVrpGOrVhJP+kHkOgoV3Dm/SMdFhZAML8iZoJF1hTON1SjNNzbrkASxaNgOnm3GaUDNSuE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR19MB4908
X-Proofpoint-ORIG-GUID: dXBNfpJtfxlGrdrdA9KlFfQq9EmAL6ZG
X-Proofpoint-GUID: dXBNfpJtfxlGrdrdA9KlFfQq9EmAL6ZG
Subject: Re:  Re: [OE-core] extractedText for every License in SPDX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-13_05,2023-07-13_01,2023-05-22_02
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Jul 2023 14:26:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184246

--_000_SN7PR19MB7573B5E21F72B13803E161728237ASN7PR19MB7573namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Dear Richard,

Thank you for your reply and for including Joshua.

For us at Karl Storz it would be most convenient to have the extratedText a=
lways populated, but in my opinion this can't be the default behaviour beca=
use it would go against the SPDX standard, or at least its intent. The extr=
actedText is part of section 10 - Other licensing information, where it say=
s:
...to refer to licenses that are not found on the SPDX License List.
What I was proposing is to add as switch like SPDX_ALWAYS_EXTRACT_LICENSE ?=
?=3D "0", that, if enabled, would override the standard behaviour and sligh=
tly abuse said property by always including the extracted license, even if =
the license has been identified as one of the known licenses.

Then, how strict the license matching should be, can be another discussion.=
 On the other hand, if it were at least as strict as the regulatory bodies,=
 we could reconstruct the license text close enough, and that would be a so=
lution too.

Best Regards,
Wolfgang Brehm
________________________________
From: Richard Purdie <richard.purdie@linuxfoundation.org>
Sent: 13 July 2023 13:02
To: Brehm, Wolfgang <Wolfgang.Brehm@karlstorz.com>; openembedded-core@lists=
.openembedded.org <openembedded-core@lists.openembedded.org>
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [Ext] Re: [OE-core] extractedText for every License in SPDX

Hi,

I've copied Joshua on this so he sees it since he's done a lot of work
on that class.

On Thu, 2023-07-13 at 09:29 +0000, Brehm, Wolfgang wrote:
> We at Karl Storz need to provide the literal license text for each
> software component we use, for legal reasons. There is a property
> "extractedText" in the SPDX documents, but it is only meant to be
> populated when the license is not a standard license. However even
> for non-standard licenses like MIT, the license text can differ from
> project to project.
> I'm about to modify create-spdx-2.2.bbclass so that it would always
> extract the license no matter what, similar to what they did in Mend
> (formerly WhiteSource):
> https://urldefense.com/v3/__https://github.com/whitesource-ps/ws-sbom-gen=
erator/issues/96__;!!Lw1uGqvHvtJ_psGG2Et-1voSwbo!c72CXUOogiQCPQrUf2WMXpPxSY=
vvWpPhGXfxRbBUipMXsJAgTUwZ0W0gK4b3F54M7jiL0bX5fKkST6flNevCrfnxW7KjAWdjYe1gv=
xl1nA$
> Would you be open for a patch and what do I need to do to improve the
> chances of a patch being accepted, other than sticking to the style
> obviously?

I think the challenge will be knowing if the text differs from the
standard license. Is this a word for word comparison or a byte for
byte, i.e. does whitespace matter? What about things like copyright
dates?

The net end result will likely be that the that the comparison will be
pessimistic and end up including it most of the time. That will then
mean larger SPDX files and more data for people to process.

I'm not necessarily against that but I do worry that if we dump all
this information at the end users, it is going to make it hard to them
to work out the things they really need to pay attention to.

I appreciate there are regulatory requirements and legal departments
which will require the exact text but we also need to consider the
actions people take based upon this. The likely action is to map it
back to some known "good" list :/. The end next result is a lot more
data passing around which nobody will actually need to use in reality.

So I'm not against patches being proposed or merged but I worry about
the overall effect on the ecosystem.

Cheers,

Richard






--_000_SN7PR19MB7573B5E21F72B13803E161728237ASN7PR19MB7573namp_
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
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
Dear Richard,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof ContentPasted0 Conten=
tPasted1">
<br>
Thank you for your reply and for including Joshua.<br>
<br>
For us at Karl Storz it would be most convenient to have the extratedText a=
lways populated, but in my opinion this can't be the default behaviour beca=
use it would go against the SPDX standard, or at least its intent. The extr=
actedText is part of section&nbsp;10
 - Other licensing information, where it says:<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof ContentPasted0 Conten=
tPasted1">
<div>
<blockquote itemscope=3D"" itemtype=3D"https://schemas.microsoft.com/Quoted=
Text" style=3D"border-left: 3px solid rgb(200, 200, 200); border-top-color:=
 rgb(200, 200, 200); border-right-color: rgb(200, 200, 200); border-bottom-=
color: rgb(200, 200, 200); padding-left: 1ex; margin-left: 0.8ex;">
<div>
<div><span>...to refer to licenses that are not found on the SPDX License L=
ist.</span></div>
</div>
</blockquote>
</div>
<div class=3D"ContentPasted2">What I was proposing is to add as switch like=
 <span style=3D"font-family: Consolas, Courier, monospace;">
SPDX_ALWAYS_EXTRACT_LICENSE ??=3D &quot;0&quot;,</span>&nbsp;that, if enabl=
ed, would override the standard behaviour and slightly abuse said property =
by always including the extracted license, even if the license has been ide=
ntified as one of the known licenses.<br>
<br>
Then, how strict the license matching should be, can be another discussion.=
 On the other hand, if it were at least as strict as the regulatory bodies,=
 we could reconstruct the license text close enough, and that would be a so=
lution too.<br>
<br>
Best Regards,</div>
<div class=3D"ContentPasted2">Wolfgang Brehm</div>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Richard Purdie &lt;ri=
chard.purdie@linuxfoundation.org&gt;<br>
<b>Sent:</b> 13 July 2023 13:02<br>
<b>To:</b> Brehm, Wolfgang &lt;Wolfgang.Brehm@karlstorz.com&gt;; openembedd=
ed-core@lists.openembedded.org &lt;openembedded-core@lists.openembedded.org=
&gt;<br>
<b>Cc:</b> Joshua Watt &lt;JPEWhacker@gmail.com&gt;<br>
<b>Subject:</b> [Ext] Re: [OE-core] extractedText for every License in SPDX=
</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">Hi,<br>
<br>
I've copied Joshua on this so he sees it since he's done a lot of work<br>
on that class.<br>
<br>
On Thu, 2023-07-13 at 09:29 +0000, Brehm, Wolfgang wrote:<br>
&gt; We at Karl Storz need to provide the literal license text for each<br>
&gt; software component we use, for legal reasons. There is a property<br>
&gt; &quot;extractedText&quot; in the SPDX documents, but it is only meant =
to be<br>
&gt; populated when the license is not a standard license. However even<br>
&gt; for non-standard licenses like MIT, the license text can differ from<b=
r>
&gt; project to project.<br>
&gt; I'm about to modify create-spdx-2.2.bbclass so that it would always<br=
>
&gt; extract the license no matter what, similar to what they did in Mend<b=
r>
&gt; (formerly WhiteSource):<br>
&gt; <a href=3D"https://urldefense.com/v3/__https://github.com/whitesource-=
ps/ws-sbom-generator/issues/96__;!!Lw1uGqvHvtJ_psGG2Et-1voSwbo!c72CXUOogiQC=
PQrUf2WMXpPxSYvvWpPhGXfxRbBUipMXsJAgTUwZ0W0gK4b3F54M7jiL0bX5fKkST6flNevCrfn=
xW7KjAWdjYe1gvxl1nA$">
https://urldefense.com/v3/__https://github.com/whitesource-ps/ws-sbom-gener=
ator/issues/96__;!!Lw1uGqvHvtJ_psGG2Et-1voSwbo!c72CXUOogiQCPQrUf2WMXpPxSYvv=
WpPhGXfxRbBUipMXsJAgTUwZ0W0gK4b3F54M7jiL0bX5fKkST6flNevCrfnxW7KjAWdjYe1gvxl=
1nA$</a>
<br>
&gt; Would you be open for a patch and what do I need to do to improve the<=
br>
&gt; chances of a patch being accepted, other than sticking to the style<br=
>
&gt; obviously?<br>
<br>
I think the challenge will be knowing if the text differs from the<br>
standard license. Is this a word for word comparison or a byte for<br>
byte, i.e. does whitespace matter? What about things like copyright<br>
dates?<br>
<br>
The net end result will likely be that the that the comparison will be<br>
pessimistic and end up including it most of the time. That will then<br>
mean larger SPDX files and more data for people to process.<br>
<br>
I'm not necessarily against that but I do worry that if we dump all<br>
this information at the end users, it is going to make it hard to them<br>
to work out the things they really need to pay attention to.<br>
<br>
I appreciate there are regulatory requirements and legal departments<br>
which will require the exact text but we also need to consider the<br>
actions people take based upon this. The likely action is to map it<br>
back to some known &quot;good&quot; list :/. The end next result is a lot m=
ore<br>
data passing around which nobody will actually need to use in reality.<br>
<br>
So I'm not against patches being proposed or merged but I worry about<br>
the overall effect on the ecosystem.<br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
<br>
<br>
<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_SN7PR19MB7573B5E21F72B13803E161728237ASN7PR19MB7573namp_--

