Return-Path: <Moritz.Haase@bmw.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5882CC83013
	for <webhook@archiver.kernel.org>; Wed,  2 Jul 2025 12:29:34 +0000 (UTC)
Received: from esa1.hc324-48.eu.iphmx.com (esa1.hc324-48.eu.iphmx.com [207.54.68.119])
 by mx.groups.io with SMTP id smtpd.web11.22497.1751459363523474951
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Jul 2025 05:29:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bmw.de header.s=mailing1 header.b=bzFXFzpA;
 dkim=pass header.i=@bmw.de header.s=selector2 header.b=jAuGq6y3;
 spf=pass (domain: bmw.de, ip: 207.54.68.119, mailfrom: prvs=27128fcf3=moritz.haase@bmw.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
  t=1751459363; x=1782995363;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=emu7p1XluZYAFJpwAHbNlanYTJt8/GpImWgRNVPxmzY=;
  b=bzFXFzpAGizGiDJrELyMroQsmvp9/iKdg+lKDECgb/YDhckfqkbywdPS
   Q1DIxPC59n42YTyZRiK3kF5mX9NHTSOAFuE/PCh5XmEQtZXRog/XGkPy8
   V7xcL70fMvhhDHyjQCyyEBANSlP6n9s2sc939CyGqImedQZ4yiPG2yo5f
   w=;
X-CSE-ConnectionGUID: M6DnfHbFTNCWYdbz1O8IJg==
X-CSE-MsgGUID: 1xIYfr/cRuKLUAEhN+2L7g==
Received: from 160.46.252.35.spf.bmwgroup.com (HELO esagw3.muc) ([160.46.252.35]) by
 esa1.hc324-48.eu.iphmx.com with ESMTP/TLS; 02 Jul 2025 14:29:21 +0200
Received: from unknown (HELO esabb2.muc) ([10.31.187.133]) by esagw3.muc with
 ESMTP/TLS; 02 Jul 2025 14:29:20 +0200
Received: from smucmp19d.bmwgroup.net (HELO smucmp19d.europe.bmw.corp)
 ([10.30.13.170]) by esabb2.muc with ESMTP/TLS; 02 Jul 2025 14:29:21 +0200
Received: from smucmp09a.europe.bmw.corp (2a03:1e80:a15:58f::2029) by
 smucmp19d.europe.bmw.corp (2a03:1e80:a15:58f::205d) with Microsoft SMTP
 Server (version=TLS; Wed, 2 Jul 2025 14:29:20 +0200
Received: from smucdzmp10.europe.bmw.corp (192.109.190.44) by
 smucmp09a.europe.bmw.corp (10.30.13.75) with Microsoft SMTP Server
 (version=TLS; Wed, 2 Jul 2025 14:29:20 +0200
Received: from AS8PR03CU001.outbound.protection.outlook.com (192.109.190.1) by
 smtpedge.bmwgroup.net (192.109.190.44) with Microsoft SMTP Server
 (version=TLS; Wed, 2 Jul 2025 14:29:20 +0200
Received: from DB3PR09MB6202.eurprd09.prod.outlook.com (2603:10a6:10:43a::13) by
 AM7PR09MB3862.eurprd09.prod.outlook.com (2603:10a6:20b:122::19) with
 Microsoft SMTP Server (version=TLS; Wed, 2 Jul 2025 12:29:14 +0000
Received: from DB3PR09MB6202.eurprd09.prod.outlook.com
 ([fe80::ce00:c6f4:8427:f779]) by DB3PR09MB6202.eurprd09.prod.outlook.com
 ([fe80::ce00:c6f4:8427:f779%6]) with mapi id 15.20.8857.026; Wed, 2 Jul 2025
 12:29:14 +0000
X-CSE-ConnectionGUID: PpoORsZQRoCARwmfw5T84g==
X-CSE-MsgGUID: sb0zpw01TaWEyzEQs2NbzQ==
X-CSE-ConnectionGUID: A20Lt+QARJGogKfJyl3TpQ==
X-CSE-MsgGUID: l5WHNia+TQSz95kA+PB9vA==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cRmusDrOAVDlTIRv14bPc/AohXXYuO8vwsw5pSngzB4x++XT8OnLlwaaWNiBNskzpML8FrYoYtvCbrNNpD0bSCR9ELE+mcY+FxhzzXapo8qW9U4M56dx1NV7eXGeD5WdL44yiPhVQgNURvu7xQzn+5xcFUzAtlVm+dcOrluOKC+z8v7W1ThSrCNKgL3NOOQiNiPtRw5mNcWNhJnJL7JPh2S77ryYOqnVuRXsppiVkh8usCbShJlQAE44/8svM+/bhSOvQekdJyTwDLs/8xnjfdZAttpqQJjL+mxo3lUXsLNFgmkQApjU4bHor3U/T23EiSrpygrBgQqMPS0Ztyooqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=emu7p1XluZYAFJpwAHbNlanYTJt8/GpImWgRNVPxmzY=;
 b=GoBJeAnYRGkmeTLmjwzM5KxpHrK1WnP1qsE5pXcLX0HNlAGoTa6UDra/P2u3mrik4iwiIHasXj95bP/f8ZpcGv18gAfcQ0o7tmN/P2ajvzEDRrQdUtCz26PkRdQO0qYQWJbNPzY+lZgWiwHQtNEMyHReH2ys5in6BOFbN/KJ1IRfSIUVkut+J9eLc7hA+z7lrVv1kbV4JNcAck39FZz+W/ac3lg3lNv6Jjh1DWDAVYt8mGRYC1R2j7IwCxUqn0X48AVxrK8dsdxRYFW990ncPs5Oecpl34IaKohCafIT2ddhDIGJi2Sc/3ORhEv6LMAbYoTS1NHUIaHqcda4qG7Nsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bmw.de; dmarc=pass action=none header.from=bmw.de; dkim=pass
 header.d=bmw.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bmw.de; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=emu7p1XluZYAFJpwAHbNlanYTJt8/GpImWgRNVPxmzY=;
 b=jAuGq6y3I22BG/htiFIVXTQhCOBLWm/TYN+qB7c4r21izkiVsywIFESr5n7J6VUR+VTcsNSsJWcH03lGd5mTtX1vXDABDUgFK4jEV3HfEd8Ub9X1lTyDui6gI06TrPs3JXkMjGlBXOyxKFm/e7g0VaajP69T7RLjBryG0UTqe/uKG0a4qXgXCvc3o48UQB9Qvkh3DAi5Gwy+TU8HD/W8mAkesDzslJfM9eKcEVRC8DITsU4seWbtIjcoO9J0cZbkVFYeXWp2W5GbYhRDn4eaSkcOfn7zJzbWApk0E+0iJhlZO7Hflbgxi50hXBa8kZTSGRgjNNkbfwW43i3iRgvHBQ==
From: "Haase Moritz, JD-62" <Moritz.Haase@bmw.de>
To: Antonin Godard <antonin.godard@bootlin.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "alex.kanavin@gmail.com" <alex.kanavin@gmail.com>
Subject: Re: [OE-core] [PATCH v3 7/7] cmake: upgrade 3.31.6 -> 4.0.3
Thread-Topic: [OE-core] [PATCH v3 7/7] cmake: upgrade 3.31.6 -> 4.0.3
Thread-Index: AQHb6yv1AvNHGxtZVUS5TMU5oZJy5bQepBcAgAAeo3Q=
Date: Wed, 2 Jul 2025 12:29:14 +0000
Message-ID: <DB3PR09MB620210718C1ACA5494FFE771EA40A@DB3PR09MB6202.eurprd09.prod.outlook.com>
References: <20250702083148.3035805-1-Moritz.Haase@bmw.de>
 <20250702083148.3035805-8-Moritz.Haase@bmw.de>
 <DB1I4TNLB9MM.1N3LT4JJ0KPIL@bootlin.com>
In-Reply-To: <DB1I4TNLB9MM.1N3LT4JJ0KPIL@bootlin.com>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bmw.de;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB3PR09MB6202:EE_|AM7PR09MB3862:EE_
x-ms-office365-filtering-correlation-id: bfa43c2a-bd05-4ce2-a966-08ddb9640e3e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|19092799006|38070700018;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?qeuDby2MAsIgst80s/gRZrFp4F6q6chlJiNnl7N3eHikgt+MXxTla4Vpom?=
 =?iso-8859-1?Q?hWcPNzJ9skdFRKZnV7U0wa7NwvZKlsqPVOfjsaIF7kTaCc7StogBJw/w9J?=
 =?iso-8859-1?Q?pToQJHTwyADj1jJNGhqLpW7SKLULC0yUf76fq6uBO+NO4MwO/Sp041fops?=
 =?iso-8859-1?Q?UEpQGEhazEzcNNcUYAHqJ7/TpYJX/trQh2OUU/sUDzRulLrkUPYVUzQM8k?=
 =?iso-8859-1?Q?PtjrXJMxAK+xPVeA8nKqGI9eAY9y2tz6ojpHotzX7JRNB5XrnKMt+SEDUs?=
 =?iso-8859-1?Q?APBbySVSy+Z44Hv9Pp9I5amp9gcwa6fQdOPYjG8rEzH8XQ1SRKoFZbpvUv?=
 =?iso-8859-1?Q?KTskj18yl1f6kfPFHc2MZ5FE6JBfEWgpSdWzFqIYtkKjqPZGW3IIULk+lm?=
 =?iso-8859-1?Q?BwBn+vwvK3n6JrITzgUrWz2YyPHRzAX8mC5ToHUSAjvmLY90zNnw93AhEZ?=
 =?iso-8859-1?Q?D9VJi6x+bPmgeWqBo8kgQtOGuoEFrBczBZtVBXbbotGCbIQUT0qmVshdy5?=
 =?iso-8859-1?Q?iE5TqO33WTeRf5nsb+tCZrNJ8Msaq8ihl2n3lR4PYTaEg2KJxqqiirCiKy?=
 =?iso-8859-1?Q?3sPd3to+I6lkInw9Ngudbk9DFmPL/r/ZFPOVr5Fk3R3cFLnv3RzsrdSybn?=
 =?iso-8859-1?Q?L1Ens+1KeWwNrtFuDjk6g6HAohgdHfquRDGtCJ9MZSmcuTrXC3A0FGoDkR?=
 =?iso-8859-1?Q?qWgiLL3U5CyKPaKWkpqINlvzO9VfjOGo3WQf/dP98P4xH4ijNlerrRbrNS?=
 =?iso-8859-1?Q?JdYDffLEvFPDbjPWMowlOXJNSmWlb69sV5DLByVp+mfc+LbkluVKJjRGJU?=
 =?iso-8859-1?Q?D7qL3560/f4SOqMyOgOk+xA3YhR471wNtI66DonxCEtwDFBcPjTmgVt7/R?=
 =?iso-8859-1?Q?WvSnylY75m8l4lgiT4zNnhfGFEHYeQpz/6Alj0cR/2cBQp0uq7wjWmukHW?=
 =?iso-8859-1?Q?fbBvZ5FhBsZftinkrMIweymcqZsYEi3J1TQ6de8tXtI84nscxY57plhMvE?=
 =?iso-8859-1?Q?5DL1AHHVbqaX+rd5KyuK1dZ+wkR9gDwQqExfj8TpBI6VhhoWuH5ptm8Mn9?=
 =?iso-8859-1?Q?G7VpchEdDLmhxMSDBe8adcBzZXXcBRdQIYjQv4Cxzsz7VuI4DD2O/Bbdps?=
 =?iso-8859-1?Q?XZa9g9vx7c1FJfoA/beQHCwcgTI4TEbVQDFF2v8ZdNXQg54ggdsaYHBNSI?=
 =?iso-8859-1?Q?ryaY5/+DWyaehnUWJDkw0vC5HT8O0qIvFLtxuXYCCj4legrZfbcUEG3Smn?=
 =?iso-8859-1?Q?I7V3u8kyjJgyXpAb48yLtF1YC2dXevmgb3OSIlfvL28gR774biP6enWwIR?=
 =?iso-8859-1?Q?pzcP9rl/lP0LfcAOV2xh8cp4VAeuIAZE67orx0TqVQg/A7i9rFsuXGCTsS?=
 =?iso-8859-1?Q?CTwuvyknsIdRL0TYD75f12DLFo/GN1DoyBwUjgOTPc084sqVXd7FwrCTeW?=
 =?iso-8859-1?Q?F0kPKephGf0JJRWi1ZSvXsdI2jfdyO1Wjkvp2U8+NssFiOookLrOFcBiQN?=
 =?iso-8859-1?Q?a/Go4euTDwtSR9W5LbWkq36N6LykgH+NMcpoLA4cTtzA=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB3PR09MB6202.eurprd09.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(19092799006)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?W2olWOrGtGcAAmyVm2MXuO6S2bMgpvvUi9l6J0OPWoWE7hMU46A4r1E3Lg?=
 =?iso-8859-1?Q?6CKmHOMri6yWtHZES3QKZp+06O76xmjqcsh2dvTKXStkkGUQmWDN96zTwj?=
 =?iso-8859-1?Q?dPZL6eMvLJHXZkCJLnlu0gmRCuWvfXMmHfkAeeb3T8obZEqbKoPQ9mNh8B?=
 =?iso-8859-1?Q?RAx45UPrPZUo7d1CSwGBjbjh5+gWvRz1dAmvd/BXtBJRZJ9XWihSsDfipL?=
 =?iso-8859-1?Q?0HpUz69Fxg1jHT8wDoSqkldTgmGQcHpWijSqqt3hAoeu1TdStSRZ2MXuif?=
 =?iso-8859-1?Q?CLC1QjYuMm6V3hwBpZaEZ+p/QXlLOSR9HxapihW6ZeUCyrH1yeN8Zxs9jg?=
 =?iso-8859-1?Q?35RixAY8qVTR0FyfRYk2k5Gnu1jYRVgjB0QDO1835PEFs6Xo6oNQ1iqJ0C?=
 =?iso-8859-1?Q?unZKj6wdJZlwTb1CEe2APaIt/MxOnt4js8qXlVKshbyh9AWaycoy5vhUb9?=
 =?iso-8859-1?Q?v735QOfgnINtgP8uKmI9VDrDxmbbJxUjJiMztOZLnRYGeQVUPj9iqdZ6Wh?=
 =?iso-8859-1?Q?8wBroiH+JypMCiF2FA58rvHOFRQiprVCeZifKMg3wZz+XRhEoePBnOEQmf?=
 =?iso-8859-1?Q?rRgmv1L1B6WGFxi98XqD6xfAg0dMIZg2jtcb4Q0Lh26fH0f5sbqymAcb4d?=
 =?iso-8859-1?Q?tlRG5RaRHC2R4NLtgm0GKSMCUq1DuAh8za0dathQsXfrnMO/HAG9J0Ofp1?=
 =?iso-8859-1?Q?xVRwmfJYYs+DETrvJqtMuUNvyJVRz8SWSf+6uFDzF8gJcQ8epOoTC70ay1?=
 =?iso-8859-1?Q?dRaF5VittN7aQsLATmtSggZwKMjKaHXNd6bBxBTcpwxlYHfZys0r+4p+mS?=
 =?iso-8859-1?Q?9VqxZDAyXw/dlKo8wNr9z0blx3YdMxeaW+bN0ByUw/bBnvMQiUSG4Wmx1F?=
 =?iso-8859-1?Q?JeThDaVYLX46OY2j0xJGRz5YWzKkbaXwsyZisN15uOGiDC3okUpiT4WIi4?=
 =?iso-8859-1?Q?yn0xw3MUU2bLXkjj5I2EdGfnHOowtAEG1qOrcV4rio1aSiXiMrK5VxALfS?=
 =?iso-8859-1?Q?+WU316Le9a4mMrM1Dz5bKZkHNHsegUnlHIc6WLSBSsRQyfkbkQef1n+VVt?=
 =?iso-8859-1?Q?ZOGTtCKha72kjPbO2hYCNnULTjTn1+8LwRYn/AA2M0uPU2432yXyewStfi?=
 =?iso-8859-1?Q?zR7otyFGCDVmp7F50PyzjimWsE1nTnqzPn7KOurVTYS54ib83pUSEC/g2b?=
 =?iso-8859-1?Q?SV4Q2MAOP9we1YsMuO0Ng6euIcCcKMeG1kcnWFQnJ64cElh0iJBIqb07b3?=
 =?iso-8859-1?Q?1+s3vnST/i1637e7ll9gLL+COOMmGUfQ9RR4FK53s3w0RRgHH2SMM+9vrP?=
 =?iso-8859-1?Q?3jqJTbx5yJDsxYgw+hjItwYHxP6gh2hsjIxLRRBR+9xHN78EQ+EzwEUHPP?=
 =?iso-8859-1?Q?3By8eVWCbcMo7cPSGGMNnGxGkCm1E3lQ5vcgigfhSIW9nvjWBNmaytMopw?=
 =?iso-8859-1?Q?tfZ+o/KBmDzpiSeNm/LS2P8gPYEfYsZvo8XfiziEgWdSyqkDsQYP1nTeDT?=
 =?iso-8859-1?Q?9vMgeAMUVyIX1LthCVyTY73WMw+yT+DWQ3acPMmlY0S2toPfWudSzUSsN0?=
 =?iso-8859-1?Q?duZW37XQSIKNncPOQ8uNDNROcmhGxRZqWx+CubDOZwxnUVWL8MTI9Q9MwS?=
 =?iso-8859-1?Q?dTJt9dwERmYsshB4FhEXhs/yGUZQMCELm+?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB3PR09MB6202.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bfa43c2a-bd05-4ce2-a966-08ddb9640e3e
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jul 2025 12:29:14.3045
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: ce849bab-cc1c-465b-b62e-18f07c9ac198
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AGHAgVPcuLRz75zGQlfkWQksNv34IHAivp65eCIVArER6gjVmsa1OFNOvO04E+9x7OQRmgk8Z4iXTTUTrOnpyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR09MB3862
X-OriginatorOrg: bmw.de
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Jul 2025 12:29:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219821

Hi Antonin,=0A=
=0A=
> This last patch does not apply on master, maybe needs a rebase?=0A=
=0A=
sorry for that, my editor messed up the patch formatting when editing the=
=0A=
patches to include the changelogs. That happened for all of them, but seemi=
ngly=0A=
only broke the CMake patch. Will send an update shortly.=0A=
=0A=
Moritz=0A=

