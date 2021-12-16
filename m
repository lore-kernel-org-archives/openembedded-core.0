Return-Path: <abrodkin@synopsys.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02244C433F5
	for <webhook@archiver.kernel.org>; Thu, 16 Dec 2021 10:50:33 +0000 (UTC)
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com
 [149.117.73.133])
 by mx.groups.io with SMTP id smtpd.web12.9139.1639651830899904907
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Dec 2021 02:50:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@synopsys.com header.s=mail header.b=mXs/7Gzx;
 spf=pass (domain: synopsys.com, ip: 149.117.73.133,
 mailfrom: alexey.brodkin@synopsys.com)
Received: from mailhost.synopsys.com (sv1-mailhost1.synopsys.com
 [10.205.2.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 2D0CB47722;
	Thu, 16 Dec 2021 10:50:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1639651830; bh=R3pb9Sx9bt72uC/Bn6f+lX9o0c+rsEf4vfCt1TfPZA4=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=mXs/7GzxynSuxvJamrslrGfUdZ4xTYTEl55OiwBvpQ/bdmRpDpw+M+HUI5isN6qOr
	 z7E6SjFvta5SCN5Ls+pXzhdZRjmuIornsVEi81eZN1noCPrFnKA3FsMAOM6eScpnyt
	 14Zuw9sHrvkuGaQ8qV1vjQmX8OFdWDFBWseUTqnTxo5IH1fDEiDFSdhEEaao8xjh1b
	 j7msp0j7SAeZYt91xpA2AgRNEjvQslRWDoEEGYNBg+jB7k15/tIte5rLQCF81FTch6
	 pqfAcIMpjxR1vJUq/z0Z7JVG2yMgcRQWxUwSgF+9Nf9q/KVguPYqNK9JX3bf0akFVD
	 WMcDnDTIxUnCA==
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com
 [10.4.161.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com",
 Issuer "Entrust Certification Authority - L1K" (verified OK))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 249F5A005F;
	Thu, 16 Dec 2021 10:50:28 +0000 (UTC)
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2168.outbound.protection.outlook.com [104.47.59.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "mail.protection.outlook.com",
 Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id D78F3801F0;
	Thu, 16 Dec 2021 10:50:26 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
 spf=pass smtp.mailfrom=abrodkin@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com
 header.b="EW90Fzv7";
	dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mI7jkCJXxsJX9fIWgBls7klC/veY2FiZvNzoufVaw3wddOwmtzQhHSQxghO6ywk1+lBbmVRorY1nyJxJ+xBIDeLfTdoRJsxaEC5mdBoKnu/LBREd9SdyLGtnIjTvOdBxW32lh2Wkxodu1qeg3JBgZ+Xz+iS5fhHteQfJnl16CPM3IvrRXPYTPHbJjpA7eS3Ppo9KVn7UYmrnsKFSinV/YZ33d+r5eihg6dtJ3iAHwyvK5r86jSuR1+oxm87GH4lDbvBAWVbhJnFqKpSFm6D/kXL21LsWyMsA22RWVnsjuedc0sjBvqb2bSU6C20kZmVwKdHvX1nL8gJfglEZZrXwew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R3pb9Sx9bt72uC/Bn6f+lX9o0c+rsEf4vfCt1TfPZA4=;
 b=i//ux5xnK+3JlEtLKvLO9wPsYp3cdwYYqDKQu4pV3w1qxvnLaU6psr7sCaQDEl4Do3zdUFrh/Pp99ZSyyayIiJBc6mbx+1w+D+ucosvYblIYAsiqfTqfxh/wGJGwvTL7q5pse730Q57kdoXuMRLdaz6P8FfvFHFQLF3k+Jdr4zUtVBKNmHaWA/7NTdAmpGnNJ2auOcUWdEX2UzreWyqwVRkmjUctLk54BahHMNup3sEa94gh/OdHc2SHj0znV6RTyQBVnFllgHYf7Dw/ZXuPLxo63OhIjxbxOnKxKvhhloWEedQ9GMSjMBKLveIgGyRk5K0FAGx7sJRvkTxHx5p6qA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R3pb9Sx9bt72uC/Bn6f+lX9o0c+rsEf4vfCt1TfPZA4=;
 b=EW90Fzv7OsmohMTnEWBp0Af9Ynx1nhsrGV3U9kz4r81wBworVWNm1DohuxblVAQ1oC2So7tB+a6vmJGsGsqmHK+vaAUX3VBwfj5ytPjsDDO2gdaq/YP/+FKgH6Td/KLLFa5HiEVojpiOsjGwXrI/1obqM1ktDWkF/5KKeSInWYU=
Received: from PH0PR12MB5401.namprd12.prod.outlook.com (2603:10b6:510:d4::13)
 by PH0PR12MB5420.namprd12.prod.outlook.com (2603:10b6:510:e8::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.17; Thu, 16 Dec
 2021 10:50:21 +0000
Received: from PH0PR12MB5401.namprd12.prod.outlook.com
 ([fe80::2ca5:cf5a:857e:4061]) by PH0PR12MB5401.namprd12.prod.outlook.com
 ([fe80::2ca5:cf5a:857e:4061%5]) with mapi id 15.20.4755.028; Thu, 16 Dec 2021
 10:50:21 +0000
X-SNPS-Relay: synopsys.com
From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: Alexander Kanavin <alex@linutronix.de>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 15/26] dpkg: update 1.20.9 -> 1.21.1
Thread-Topic: [PATCH 15/26] dpkg: update 1.20.9 -> 1.21.1
Thread-Index: AQHX8gTRMLqlPKaohUe0ynJ6SiGc0qw08HtU
Date: Thu, 16 Dec 2021 10:50:20 +0000
Message-ID: 
 <PH0PR12MB54018F04F7B248612D71BC27A1779@PH0PR12MB5401.namprd12.prod.outlook.com>
References: <20211215224034.1814148-1-alex@linutronix.de>
 <20211215224034.1814148-15-alex@linutronix.de>
In-Reply-To: <20211215224034.1814148-15-alex@linutronix.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
suggested_attachment_session_id: 8e8f7698-83b4-dc92-4fd5-3547de146c8d
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=synopsys.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d62e063e-4708-47a0-0310-08d9c081db35
x-ms-traffictypediagnostic: PH0PR12MB5420:EE_
x-microsoft-antispam-prvs: 
 <PH0PR12MB54200C36161776BCF947F35DA1779@PH0PR12MB5420.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:813;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 Jer/Yk64TnzL/Siii9LWChxpIQHg+BOyGVVk/k4ycULl+2t3n2OINIYO988iJZjyZnj9TL4pGVjV/oGsyYT0Uz7z7K9N8o77zgcM02vGc0/u+46FlZW2l4iI9zBhaVGmtr5E8LXBqVg2n+zJBu2HekclVrFfC6dU1iAmP1u/07B9oJg5FecY1fOxZp34G4m1sIyOjHp8Yr8vrT9VSy+p5WIg8rrSMkayF711fg/RPIrwy0++5XZlot+tNRTRQf4pbvUMRJcd/FTe6rmPwbYJDQAK2+xCHJX8FUsXtgb1waLtplFDoAw43zC30CbgKdmzTYQgeVRe3AaVfWpiVf818fr7ojzCFu/KjJdl9d+rzockI2DH7ZfGuYHgwmrqQkDsTDY9KI241cR0zYyYFKfPH8TAfvuZoof4yQ03ntJtrypDKiqj0HYBaSoZIcIzG/DCqlZkULUCzCfOZ3gpwVtfClDAad0lU5Qd7iI3+MX8ZrzZr2RLpKAr2FRQSnEkEN3oQ1f+TajcrtVNoVTWYv+E8grCEikZxNDeQs9wTVJk6ignWoo/XNLD2wwB6qEm4BRNubUhzefrjLLhLuEpxjKBrhUDMTfIKqaYzi9E8cl6vaPV2PQKz9fYw8PJmpcK7hlw/+/wL35lOTN6PvAcd2oZqzGNKDvVNLJtGllHWCXpfD5LLUzR5U2lvmgKL8Inv3zv0vayW69grZN35tBtXXwc+Q==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5401.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(122000001)(66446008)(76116006)(8676002)(86362001)(91956017)(9686003)(38100700002)(4744005)(2906002)(4326008)(54906003)(26005)(38070700005)(7696005)(15650500001)(316002)(66946007)(5660300002)(186003)(508600001)(55016003)(33656002)(64756008)(19627235002)(8936002)(83380400001)(6506007)(52536014)(6916009)(66476007)(71200400001)(66556008)(53546011);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?UvRDpdOK9xZ4DffS6+4KioDPCV3NnaOVgSlpMgRvTMZDgXfAQX6nq98jFw?=
 =?iso-8859-1?Q?5xjGDW/mrd4EBRzNR1Z2dJB2tL4S56m3085aPH9HT2/bVfDFk4zsX1jA9/?=
 =?iso-8859-1?Q?tcTtAf7QrA3QdR/aYEUxi73kUeZiBDR6towO16NrvKxPViXUrlw6L0eq3V?=
 =?iso-8859-1?Q?DbUHKvl1Mbviz2d0RVukdj7zdY/bRXybXJ3FexTUw2QzpucHM7M0ENxkwC?=
 =?iso-8859-1?Q?k/Hs5C2fyB0BpM3vodo+ytiNRH1CnBGnuEbwMMGLYS4aPSEsYR5FER1aKB?=
 =?iso-8859-1?Q?hnmpB4947ig+CGXM1SPh+p2i5c1yvcHo9hDRfherkqLnBjM+2grMOdICEk?=
 =?iso-8859-1?Q?OA59kL7IvhyOP/3jaI+hdAWEBtvm5p4sCCd/nWuXXmxhHNzUrDs9TyKe9e?=
 =?iso-8859-1?Q?mPetmi2bRsy6+a+7GkbqVc8C1B4WeLd4seup82u7Z8WdAtzG6ZuxLZv5s+?=
 =?iso-8859-1?Q?GIOEpQPHR6ZqOKHfHjxTcKOSWz8eEuLhPASLe13DYLkexrG3oOpuwkeJDO?=
 =?iso-8859-1?Q?/VCHgNduLOUpETmsarolOWfH+Jf5bdzp2l5eK88Vr2aYAPLuSGiDD2/iDf?=
 =?iso-8859-1?Q?YNBK92CkGlJ4BQTYA7Ca5rFk2ln+SNCDQjqmmpDi2xHQjGROcTT7aPP3ki?=
 =?iso-8859-1?Q?jHdyss8y2D86BG0MOh19Y4Jq5BXaFciYSHq4S+DL5tPzVUwIkeb10Ii71U?=
 =?iso-8859-1?Q?pLiQ4xKmelteiPw0jdZCO8DxmQiOdgyKlKXiBE0H52nw1iHpfNxtStOZQd?=
 =?iso-8859-1?Q?RJq889nSZ4LUqol9NF84nUmhwT4sBiHCjx2S4v/jWOU4hwxJ4u3kbUIx02?=
 =?iso-8859-1?Q?Ud+Fzt4dvhO/Dl1e9vYY23ja91bzuwgqXV6F3e7SfcfBnOtOAkJ9VzVuR0?=
 =?iso-8859-1?Q?1ANiufS8ciMwcVQ1Mita0lzGHeoexr/dpbv119gBAe489jc9cqiHbwOtIi?=
 =?iso-8859-1?Q?ZNqM4XJ33HzqT9gd3lwWZqwDeTE2fWZgfA5IBzdujqxSQaGZLxArSld43b?=
 =?iso-8859-1?Q?dy8xynFq0Qy5cLXWyAWndOrJ6JRM6CjnL2f4FeiAFZg1BoHAS6YzaAwWn4?=
 =?iso-8859-1?Q?PLPIY36NofOfXljVOgRJgPg0VAEodtQKEIYscFlTR9vT+75m8tnRypzscv?=
 =?iso-8859-1?Q?SOJqMTGj3x0FWUBb/bQZrqx1gpeq+xXDDlcvTVbcuJ6AeeCjwoYsz3IC5w?=
 =?iso-8859-1?Q?LpFL/h9iwKxRzM0uPJmq9xqBqw705cSXxfZpMQV6cSs71i37rFOYIjtYs3?=
 =?iso-8859-1?Q?CowP1dyt7fP8jleJM7NbqIUCspqZl1o3NjVj4O8JhcZPKmNvCLOC+EtZCC?=
 =?iso-8859-1?Q?Bqerdok/g0UfIjI2M86/C69wpIdra65WV80mCut0knaBMa43k/Xy105eb6?=
 =?iso-8859-1?Q?O9oju6C9bZPRNa6NGyGkbx2eK/zINcuROv4yDU74+kciMACwGrzjGsWdhx?=
 =?iso-8859-1?Q?gpttnZmWPPgSEJ/rJIQetHD500pxY2O6kjO1OQEbV/+3Y6IU/ny94Ka/1R?=
 =?iso-8859-1?Q?ZT2CTAeIx+/yAKiRZxItWL7v1R0rR+OKh0kx0mNefzEBqU7XCrtTNYp4qz?=
 =?iso-8859-1?Q?bkrrEs2T0aHrRpnkrWPU/ogIkS67U9AbYkwRupilmCCwDuodBsDNhEctsl?=
 =?iso-8859-1?Q?8EKMSlu/u9+0LaAqbPrp2OXt9MUBL1O2wJYn1+Nu4IRSKidEwd78LAGA?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5401.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 d62e063e-4708-47a0-0310-08d9c081db35
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Dec 2021 10:50:20.8915
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 BXvxJQRsbZHoa3injiX6Nyn1In4fQyUIcAjTWDeQBtIr2URFK+RxonCrwNXrgiDTXNb6bNrBza8+uouiTTb5cA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB5420
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Dec 2021 10:50:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159780

Hi Alexander,=0A=
=0A=
> From: Alexander Kanavin <alex.kanavin@gmail.com>=0A=
> Sent: Thursday, December 16, 2021 1:40 AM=0A=
> To: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org>=0A=
> Cc: Alexander Kanavin <alex@linutronix.de>; Alexey Brodkin <abrodkin@syno=
psys.com>=0A=
> Subject: [PATCH 15/26] dpkg: update 1.20.9 -> 1.21.1 =0A=
> =A0=0A=
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>=0A=
> ---=0A=
> =A0meta/recipes-devtools/dpkg/dpkg.inc=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 |=A0=
 2 +=0A=
> =A0...ild.c-ignore-return-of-1-from-tar-cf.patch |=A0 8 +--=0A=
> =A0.../0014-arch-Add-support-for-ARCv2-CPU.patch | 68 -------------------=
=0A=
> =A0.../dpkg/{dpkg_1.20.9.bb =3D> dpkg_1.21.1.bb}=A0=A0 |=A0 5 +-=0A=
> =A04 files changed, 8 insertions(+), 75 deletions(-)=0A=
> =A0delete mode 100644 meta/recipes-devtools/dpkg/dpkg/0014-arch-Add-suppo=
rt-for-ARCv2-CPU.patch=0A=
> =A0rename meta/recipes-devtools/dpkg/{dpkg_1.20.9.bb =3D> dpkg_1.21.1.bb}=
 (88%)=0A=
=0A=
...=0A=
=0A=
> --- a/meta/recipes-devtools/dpkg/dpkg/0014-arch-Add-support-for-ARCv2-CPU=
.patch=0A=
> +++ /dev/null=0A=
=0A=
Thanks for taking care of that and ...=0A=
=0A=
Reviewed-by: Alexey Brodkin <abrodkin@synopsys.com>=

