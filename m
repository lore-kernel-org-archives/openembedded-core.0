Return-Path: <Moritz.Haase@bmw.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9F4BC77B7C
	for <webhook@archiver.kernel.org>; Thu,  3 Jul 2025 11:31:25 +0000 (UTC)
Received: from esa5.hc324-48.eu.iphmx.com (esa5.hc324-48.eu.iphmx.com [207.54.71.60])
 by mx.groups.io with SMTP id smtpd.web10.20209.1751542276347423160
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Jul 2025 04:31:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bmw.de header.s=mailing1 header.b=QmdNXRzI;
 dkim=pass header.i=@bmw.de header.s=selector2 header.b=goBvgYOu;
 spf=pass (domain: bmw.de, ip: 207.54.71.60, mailfrom: prvs=2724bd385=moritz.haase@bmw.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
  t=1751542276; x=1783078276;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=nbIuaLwCUHxXkI+3sXwHSFgqOjOl+jl17z+XkvTqw8k=;
  b=QmdNXRzIm9pLC04euYyPDXwYYI2x/yrX+7UKzn0TFlC09SdTbIQOpKNF
   BXMGKxGRdGw2FdnBxMWM5wX7zlnoACLBhjDDEBvjRjSh2tCTU8wLhxc4V
   53y9UVufeyn9mlO62FaIBm2AVcYcf6j9WfStwHPOV1uyzDzaHnpbgQ8zO
   8=;
X-CSE-ConnectionGUID: N48PWZBnTp+rDM/5jD5u2A==
X-CSE-MsgGUID: 37sMiw1ATiiqp4RroZGeoQ==
Received: from 160.46.252.35.spf.bmwgroup.com.bmwgroup.com (HELO esagw3.muc)
 ([160.46.252.35]) by esa5.hc324-48.eu.iphmx.com with ESMTP/TLS;
 03 Jul 2025 13:31:14 +0200
Received: from unknown (HELO esabb3.muc) ([10.31.187.134]) by esagw3.muc with
 ESMTP/TLS; 03 Jul 2025 13:31:14 +0200
Received: from smucmp18b.bmwgroup.net (HELO smucmp18b.europe.bmw.corp)
 ([10.30.13.160]) by esabb3.muc with ESMTP/TLS; 03 Jul 2025 13:31:14 +0200
Received: from smucmp09a.europe.bmw.corp (2a03:1e80:a15:58f::2029) by
 smucmp18b.europe.bmw.corp (2a03:1e80:a15:58f::1:51) with Microsoft SMTP
 Server (version=TLS; Thu, 3 Jul 2025 13:31:14 +0200
Received: from smucdzmp11.europe.bmw.corp (192.109.190.46) by
 smucmp09a.europe.bmw.corp (10.30.13.75) with Microsoft SMTP Server
 (version=TLS; Thu, 3 Jul 2025 13:31:14 +0200
Received: from AM0PR83CU005.outbound.protection.outlook.com (192.109.190.1) by
 smtpedge.bmwgroup.net (192.109.190.46) with Microsoft SMTP Server
 (version=TLS; Thu, 3 Jul 2025 13:31:14 +0200
Received: from DB3PR09MB6202.eurprd09.prod.outlook.com (2603:10a6:10:43a::13) by
 DB8PR09MB3980.eurprd09.prod.outlook.com (2603:10a6:10:128::18) with
 Microsoft SMTP Server (version=TLS; Thu, 3 Jul 2025 11:31:12 +0000
Received: from DB3PR09MB6202.eurprd09.prod.outlook.com
 ([fe80::ce00:c6f4:8427:f779]) by DB3PR09MB6202.eurprd09.prod.outlook.com
 ([fe80::ce00:c6f4:8427:f779%6]) with mapi id 15.20.8857.026; Thu, 3 Jul 2025
 11:31:12 +0000
X-CSE-ConnectionGUID: B86W9tIhQp+LxGwg0ttCQg==
X-CSE-MsgGUID: FINsv29tRVm1FBGPt5LXPw==
X-CSE-ConnectionGUID: /Ch7woGgRy2DkJwLC3AFEA==
X-CSE-MsgGUID: aV62OkWkTH6wKg1BUkJMpw==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zQPJL3+kpDmK1V63sV3fWLuwG4Bwu5Fnr6dNyhRs0wi0JN6w8V18EZhza6pCnP+Wz/WnZvC3SOvSiBtt5nAmNDlWY2p8dBc6cb17qoX0A3l+0w8CgwYVc82CtFY+V9kT2ymXC0NJ05fElYLR4/C63tEJesmoNC4cU/v0OnWkLJO+SmWzBKJKK6zzFJTmS2IDdGMWsKGJoN38ga0i0PC9o3b8q9jac497KgY9Zze39svm6CT5tPxxtdQ5Y+gc1sL4wjyqhleEdcl/BtX0a5a8Uk0TLmcPZSb2W45zBfWZf6cZZ4P11/7qCeEkLLSDZIGaM4kkrKxYB03HPxhO4L4t+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nbIuaLwCUHxXkI+3sXwHSFgqOjOl+jl17z+XkvTqw8k=;
 b=Hi6fKDJYwIbbi0onF5VNHPr+cn0bpUtADy1Vg3UkCEetoitJw3OZViw7bG3xdf9y2SGi/93RHjzXzwihFg9QVIneyK8vvFvDBKux5VO0WL1C2Mu0JdOKEaiZhMunbjUrJpUE7y8FmKOtzVUnLhVkP9q0a9WfNFgE+Jrn7XPR1rhjI/+ysqZPNCADOhZEB5kGTPhdTefX+nrVQatRlcs+M+LiER2XwB/i3iMZyHzn6/Y3Q9NH24KE5gnA1q6CccV99E2Fx42RGUg4KQ5l9xNysQ2dh96xQUHgsVW+UrQ7T6Y8Ezcl1OeCBkInYc36TDWy3W+3OxeMPoDd6HOJOZuRjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bmw.de; dmarc=pass action=none header.from=bmw.de; dkim=pass
 header.d=bmw.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bmw.de; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nbIuaLwCUHxXkI+3sXwHSFgqOjOl+jl17z+XkvTqw8k=;
 b=goBvgYOuym17aEaKaOYKauTo8TdQaME+4L1JvxWE5aLR5hPNomGyPBQ1NlyiBxpwF6cK9XGa8imByMgl83m0ISibJnhuKpLqmIsilV26VDl3gFHsIOiZ3xH+NNdUh9CLrIoPkljxmis/EqvN7MwfRldu/KaFmXD28H9lUU5gFwGzNQ9Twd5GvLkIizvAG7ooXqFtLjNDIEUFLZNa3159TjtORgJfIyNDkOrFRUGAbUFSzpyLbLxlV98PRtAJalU9t1ruA3zoeZrDylk5s3QGU5TJYvaSp6MWHAFm2CJqDDPSe+GDjKgLARKZmEQDC1gWDvtr/c2ZuuYzJYt1dNth/Q==
From: "Haase Moritz, JD-62" <Moritz.Haase@bmw.de>
To: Antonin Godard <antonin.godard@bootlin.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "alex.kanavin@gmail.com" <alex.kanavin@gmail.com>,
	"quentin.schulz@cherry.de" <quentin.schulz@cherry.de>,
	"Peter.Marko@siemens.com" <Peter.Marko@siemens.com>
Subject: Re: [PATCH v4 0/7] cmake: Major version bump to 4.0.3
Thread-Topic: [PATCH v4 0/7] cmake: Major version bump to 4.0.3
Thread-Index: AQHb600fLio3jY5m9kWhi9e6NU7Es7QgCZOAgAA5wIE=
Date: Thu, 3 Jul 2025 11:31:12 +0000
Message-ID: <DB3PR09MB6202B2D5111AEFDF2561F1F7EA43A@DB3PR09MB6202.eurprd09.prod.outlook.com>
References: <20250702123005.1233743-1-Moritz.Haase@bmw.de>
 <DB29D6KE7N6X.EA0WFHWLYJIQ@bootlin.com>
In-Reply-To: <DB29D6KE7N6X.EA0WFHWLYJIQ@bootlin.com>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bmw.de;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB3PR09MB6202:EE_|DB8PR09MB3980:EE_
x-ms-office365-filtering-correlation-id: fae531f7-8960-472f-f826-08ddba251d79
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|19092799006|376014|38070700018;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?aOZBjh8yQLxte1DHvVvWlzmZdRvqEPdsPWJoafHoXhnMtjXkedWFEmAlpE?=
 =?iso-8859-1?Q?XN1ZvH6xl/X+ClQWF0+g3Yi/WLPEdtvydajp/0tjcKa80zI6nkDuHBRMtd?=
 =?iso-8859-1?Q?hU+4KtX1dWhje1QHLsZs6ySJEWq7MHCIyFpI6vxs0vKnlvn8TuLn4c0VGB?=
 =?iso-8859-1?Q?hPuBf5Ejf24cj+4C/xQfX+K2dWulkIJNqIfi6XnPT4FORp2wCercYfZqSG?=
 =?iso-8859-1?Q?7hxL/wWlD1PXzOpRO2hejqYjiA65lXtErcyVmiuPo+TPya2Rkge0JuiVvr?=
 =?iso-8859-1?Q?Y29inseZ8t4/pRY5s9z//IxCqp1dIOzILc0vPajxMhbp0Wcdugk3IHfmP/?=
 =?iso-8859-1?Q?aokFxwDPZ6ARue43et5dtfIi5jf96p9+4bQDcthFBABCoIf/96KDMlkCD6?=
 =?iso-8859-1?Q?LQ94kXo76f37Azy+AxuVoz40dS+EYbsXzlVS/xEjX9Y2IL8IsMkpPLEorU?=
 =?iso-8859-1?Q?dqsVnvvZO3pGEbk7y19enkKep4DHd9aX2JkaThT+JjfcJ9KshckWvZbo0Q?=
 =?iso-8859-1?Q?xW0rd2BJrgiunSv4zIg2uvi2KYJjK+R4oh2MnS5vx1rzRi7y7HgWb+xxDF?=
 =?iso-8859-1?Q?DzJafOdUXgZa11EAgyZwUmGTiRM8i0fHqFvwn9LzyOJPDkpWgv9gLTOxU5?=
 =?iso-8859-1?Q?3dlcD3A+N6VdYP03zSCDlWTeH19DSpn9CTDPqaYELDSTpd5LHBCUzYdBws?=
 =?iso-8859-1?Q?A8rA39qyWrkQ5bg2JGWK5kJUoaRsb3nb/PWJ/O67ZRrDEnNjnOgxFUTcyI?=
 =?iso-8859-1?Q?wK8qpKDM9wFlMYM71pGIvRJKNcp15AR9jXDlbA7XedcqoEUXTKpOahz0Be?=
 =?iso-8859-1?Q?RvJMTy0RI9dpSYX3dmnTIw6BOS7/pN1/KMeeKQJ0KODDqtnvcFdOmO5vUO?=
 =?iso-8859-1?Q?s04EX2bAGdeHkNUNvwHHMfH1SkTKSZOwr+nz568ooNWA9IdIK43t5jn5gT?=
 =?iso-8859-1?Q?EiPvMJs3TMcsqDYXDfDlWOB2zz7wK2bne5suuhw2CLKEXTx81TQXuxC99T?=
 =?iso-8859-1?Q?H2rm2xCa9xg3ogNHJjAb+RWYYrCR5dlai4ZUlIgJ8oeySunl+YRf8mIXbj?=
 =?iso-8859-1?Q?uT0kTiAZBbmp/Uuk22ZEAFY6MSnBVA+LYa3wNKhs5g+/yy/IV0QVTo2rb2?=
 =?iso-8859-1?Q?NB77RSZ9rH0s4XnushQek5XavjJLNTWR9DwnKX3592iy+glvieMz+FjyQT?=
 =?iso-8859-1?Q?PiJ3RdXufcGfaKINUsy2ITqUWx4lP1+LdgkLVwKBO+Dy9KXnR/xGEqr8AU?=
 =?iso-8859-1?Q?aXTdmaeqdx8bNiJMAYz2CradVS8D9aq3CyL8RFdW7Dvv1OGdQv6W6wVMm6?=
 =?iso-8859-1?Q?ScCFLtVJX5CYz3tQ5aRZiQg3qW5Kl26EvHE2cqMpLx4RCbE3jiN6wJkQLG?=
 =?iso-8859-1?Q?7zChpfd6h26TwGOeBt4n89V/KFSFtZeHcjZdRsKKZ/DKv4Fn9RsnUCSqoY?=
 =?iso-8859-1?Q?DXmOeV74jboNbLDJSIb/314Arpmvh6ccKWGyHLVsvpcRPJbUwr/EnfhgkT?=
 =?iso-8859-1?Q?jNhjVBRcF5KiWtgrkTgBR7iMWZFoakpD3Uh8bs84Fb8Q=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB3PR09MB6202.eurprd09.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?R2N5QZFVP8Q+N+i80xkJydulcBGsREc8JH2OBMdv/64v0Nx2fAj2NdOQhJ?=
 =?iso-8859-1?Q?6RyGH+WjdqyXT3rgXwwSwmSKhFTkZtKmcKiHABx7E5fGqg+OLI4dH5xKvl?=
 =?iso-8859-1?Q?Sf0VdYdI5gFCiWuEGHLS2yn66J+WwqlMbjyk/raFDXvSWvSkpzJWCN3L9D?=
 =?iso-8859-1?Q?9rUlUKqq4r5MqfubhNCN0DdguKspGADrE+7L1U3xxMMuaSqlJDg1HvuD7P?=
 =?iso-8859-1?Q?nttNvHGWFDyF1PTyDzm949lbkh9j5Jf7iTdWOoctUUoX0/uVotHqQm5mWW?=
 =?iso-8859-1?Q?7bqgjF5JiWvgoUU5VWMQtkgA72VgBoTDvRI0VC40/9OLWeuJ/hof+Tofva?=
 =?iso-8859-1?Q?Lax9Y6Dkzd1d0J1uNmJSQdry5uPCwobyZv/E3QomwG6pc3qeeNUdKkmwqy?=
 =?iso-8859-1?Q?LrUQ1s45foahZrpVMIw/2yxezRgPtCUAobBIGcv7+kQz7lK+dlQogKu4Dp?=
 =?iso-8859-1?Q?+NEL4woEx1Fzq4zuOzBnIOTJgnqwDpD7zEstUT0Qc82r/YzXADRMP8CU44?=
 =?iso-8859-1?Q?EuzneSdw6OcRHbj9yZn4oVIa4lyP5aEyH2GS+nFC8YXhwvI0Th/FKX6P9p?=
 =?iso-8859-1?Q?6J9rEBYTVWj1mEt1kd3P1az19dobgXeZ/PFqGT+PI8HXsTlRXuPtAJitF+?=
 =?iso-8859-1?Q?0NTD76l0LnP6yl14vyWGeSOzr48askg8YXfpk89R6hLg80Rw03MBHskH6T?=
 =?iso-8859-1?Q?NaVHD9nbxUw8ICwYb1/j13a24cV5014vfg0psVPZSTlN6Xp8emshG5JeRq?=
 =?iso-8859-1?Q?1A6KKr0n2LXN8Xei/Dczk6x1ydMlDXUIrUwxdQVCrk9I+sBl8hxDJL3vo4?=
 =?iso-8859-1?Q?Kk45HX47S/frMuZjERdkyvx2fo1GOSZDsyvYDKfFBD9ug1iDPNq4ZpsK9U?=
 =?iso-8859-1?Q?Q347UyHHAM7a7yWyF7aKkjltn4ySRcf4SWqsCeb9WKiF0mCOm35OUfi7S6?=
 =?iso-8859-1?Q?o5/wVDT3lSwDpzN/3zxMaJehKxXHhJybvVhoPypNoO9Z6fNuIaW7O/T2jA?=
 =?iso-8859-1?Q?nXb13XlqN4x+8VmstXgelGPAIM+XNagt1zuC7nb5s9ROVexNNHXl9rGzrt?=
 =?iso-8859-1?Q?X1wwGL2eavA8bC8plXWKU9G7dgEKmcL++lTSZ7c7eYIa3NqhoLb04drmWY?=
 =?iso-8859-1?Q?vNN50flcxYykv04QgYKK3levHDnaxSM+JuOjHXEB0UQ5wMxy3aeVKBFUYC?=
 =?iso-8859-1?Q?6vv6B6jencKtnv1hB1ck17Tm5WH/9awF4sORCmmRORF+yAuMzP6gO1/p9T?=
 =?iso-8859-1?Q?HKatGQ3dn9YyUNFyUgoCcSFevS6KoKf7rZrGhEMQf0jvYLrX8TzI5amIyX?=
 =?iso-8859-1?Q?Z1d5lDLtzCXlnMfQKZa89787Y5cbiEm/P9m0YPJ9XV4SXxtzlLg2r92D7z?=
 =?iso-8859-1?Q?9ZBEKx0K+QZ9TEVl8OQQ38nFEN8qUwBDe1RhDxRs+xY9X1xCGAK23gpJKQ?=
 =?iso-8859-1?Q?ke48na3ilUzpUGwIpNBh4nhZkNx7CvBmmXKg56Wneo8kKnH6Nl/ZjZ0qFD?=
 =?iso-8859-1?Q?0PlNRZ+BMSMh9EyXf5QLVcSifbd+SetI+USQdGVoQekKn4Z5TQj7AZNKNo?=
 =?iso-8859-1?Q?QvBI3Vb1BwoVVdfCBpxcfFBo67gAy7RmQPURa0P6nOnWzqOW0HwsuRbdPG?=
 =?iso-8859-1?Q?iJs2D6N8pgWBM4DGepqS7K/WuHXmTJmpCE?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB3PR09MB6202.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fae531f7-8960-472f-f826-08ddba251d79
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jul 2025 11:31:12.6814
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: ce849bab-cc1c-465b-b62e-18f07c9ac198
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: i0vc3M/mpkLylouP9MQWIIe+vUd6ViU5iwBRFbufUR3xw/7zozsX5Q/+8lIKFH4j4Q8YzcqpqTsMtDyObtqwyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR09MB3980
X-OriginatorOrg: bmw.de
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Jul 2025 11:31:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219874

Hi Antonin,=0A=
=0A=
> It looks like libfdti also requires tweaking.=0A=
=0A=
I added meta-openembedded locally, created a patch and sent [0]. Hope that'=
s the=0A=
correct approach.=0A=
=0A=
> I didn't spot any other issue related to Cmake, so hopefully the last one=
!=0A=
=0A=
That'd be great... Fingers crossed :)=0A=
=0A=
Moritz=0A=
=0A=
[0]: https://lists.openembedded.org/g/openembedded-devel/message/118222=0A=

