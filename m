Return-Path: <Moritz.Haase@bmw.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CECF2C83F1A
	for <webhook@archiver.kernel.org>; Thu, 10 Jul 2025 06:35:11 +0000 (UTC)
Received: from esa10.hc324-48.eu.iphmx.com (esa10.hc324-48.eu.iphmx.com [207.54.69.29])
 by mx.groups.io with SMTP id smtpd.web10.2230.1752129300687043464
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Jul 2025 23:35:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bmw.de header.s=mailing1 header.b=OUu4O/sj;
 dkim=pass header.i=@bmw.de header.s=selector1 header.b=AuAdvWTM;
 spf=pass (domain: bmw.de, ip: 207.54.69.29, mailfrom: prvs=2798cc1d2=moritz.haase@bmw.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
  t=1752129300; x=1783665300;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=SqCut0SOIQhUsJjVCzZxS46EYL0lNeDQ6NGoR29+5X4=;
  b=OUu4O/sjOGeidBVoiAFcmkt7dYtZYGTrde3BvhZQsaCfudTOnpcIZSuO
   m6cssZdkmt8n2Mvuape3XktNkTYuFBHftBMHpGLHJ/g9oM48yjEYMFTeJ
   N5y4BEhWtQiNOQPtyi9g1FQHM9CVrglJ+Oq+WsisXEfVDYBBi+QngJDaa
   E=;
X-CSE-ConnectionGUID: yAVw4PsSTu65FnL8pa1M5g==
X-CSE-MsgGUID: EjoKmHtRRyqZH+fAN0fcUw==
Received: from 160.46.252.46.spf.bmwgroup.com (HELO esagw5.muc) ([160.46.252.46]) by
 esa10.hc324-48.eu.iphmx.com with ESMTP/TLS; 10 Jul 2025 08:34:58 +0200
Received: from esabb1.muc ([160.50.100.31])  by esagw5.muc with ESMTP/TLS;
 10 Jul 2025 08:34:58 +0200
Received: from smucmp17f.bmwgroup.net (HELO smucmp17f.europe.bmw.corp)
 ([10.30.13.156]) by esabb1.muc with ESMTP/TLS; 10 Jul 2025 08:34:58 +0200
Received: from SMUCMP11E.europe.bmw.corp (2a03:1e80:a15:58f::22f8) by
 smucmp17f.europe.bmw.corp (2a03:1e80:a15:58f::1:64) with Microsoft SMTP
 Server (version=TLS; Thu, 10 Jul 2025 08:34:57 +0200
Received: from smucdzmp14.europe.bmw.corp (192.109.190.59) by
 SMUCMP11E.europe.bmw.corp (10.30.13.93) with Microsoft SMTP Server
 (version=TLS; Thu, 10 Jul 2025 08:34:57 +0200
Received: from DU2PR03CU002.outbound.protection.outlook.com (192.109.190.1) by
 smtpedge.bmwgroup.net (192.109.190.59) with Microsoft SMTP Server
 (version=TLS; Thu, 10 Jul 2025 08:34:57 +0200
Received: from DB3PR09MB6202.eurprd09.prod.outlook.com (2603:10a6:10:43a::13) by
 AM0PR09MB3762.eurprd09.prod.outlook.com (2603:10a6:208:17f::10) with
 Microsoft SMTP Server (version=TLS; Thu, 10 Jul 2025 06:34:55 +0000
Received: from DB3PR09MB6202.eurprd09.prod.outlook.com
 ([fe80::ce00:c6f4:8427:f779]) by DB3PR09MB6202.eurprd09.prod.outlook.com
 ([fe80::ce00:c6f4:8427:f779%6]) with mapi id 15.20.8857.026; Thu, 10 Jul 2025
 06:34:55 +0000
X-CSE-ConnectionGUID: Ik8qdoz3Ryqa8D/m6Mh4rA==
X-CSE-MsgGUID: qHzHfOqrS9Okgt5C9Kpd9Q==
X-CSE-ConnectionGUID: 96ZomuzxRL6bSw/bizsCqQ==
X-CSE-MsgGUID: jIerveRGSvm2+LYHhcjjaQ==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iHxAEgydkxlMy9iJkS5h3uwDxFu5GCkU2zv6TdPBlHXAyoufHYhWnssFit9XLG9FGY+0yZG8EMpxRmxucgkiJTWjFABe3jmtwsVSgAB5Vy2PpoEE47dFEGiHoBxVWJGHsDDK7U32t3mWDoGMbEEDxOGBdPC1OKd54dL12KErDMz3oO4kJHNInYjxhwTC69wq9jJfLgnwfc/bJfRJzQB2RN2PkAPGbGv5QuBSaZ1q8z47TIaQedwIQxsE1cm9Wl2UdbC1e7hAgxjf7xGww6Jita+/n/He8MqzBFPixVuwYDjuSazrgEMtjnNaLb1sfO63Yf7Nri6LcAtLDGm71FHeww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SqCut0SOIQhUsJjVCzZxS46EYL0lNeDQ6NGoR29+5X4=;
 b=SDuYZJHcu+tPE/Wom6oocBGK3E1Wo79L4arMWl0mnjP8TXTPoC/x2vTe08fTmNhEumXzblEGHkajxkPefobOqgwd4UFw1ENSeqA96NOCtkid5Nw1R5+HRu0OD3yW+j6zjJ7NE9yFiZ7z4eSri97GIsU+SvxIoUrMxSxISGDT4wHrtBPt1b5W7FY3J1xZ8CoWr3sZKDzUys70E/cv6Oe/s7j4j9wL04LLbLZDS0/e3HRXtFFjkOB9zWJIQmZSfsppkuAAh5a1YLheKU9Q2T4EONQJSZ84oW3u9fcUNuJQev+Qlx7LuHKW1OsqHURIuK/cwP0lyGcPP/J+D2AdnXm7wQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bmw.de; dmarc=pass action=none header.from=bmw.de; dkim=pass
 header.d=bmw.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bmw.de; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SqCut0SOIQhUsJjVCzZxS46EYL0lNeDQ6NGoR29+5X4=;
 b=AuAdvWTMi+bwaBu4qV+IFD4s/SNDVEjiW0zG7d/0R5x2Vggah5UEUFlNQjre974IWIDWWbiJuoBUn1CWuNoUad1nNc2x7VeUCxBzV7i0+v/E0lz0+LDRTRmIwPPX7JsHWOWdSWtmYs9HggmAl3/Aw0sR1FrhtI0iwKc1K7mzZiPRIwA+NagK1wUwuXXLV25RRDg+DybmVk+hwS/aw7q3s1I1p1UJj0NQs/+FwLuwUzXQVgcTy/TZCLdLNMavtsZavxBSz3HltC9q/vV3x9WQfPyDMQFeuwoiXxGumgXMiGbXG60uHJGPYeu0hI1JEG/fpFhSEauH4mzhpomXz7YlfQ==
From: "Haase Moritz, JD-62" <Moritz.Haase@bmw.de>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "alperyasinak1@gmail.com"
	<alperyasinak1@gmail.com>
CC: Alexander Kanavin <alex.kanavin@gmail.com>, Khem Raj <raj.khem@gmail.com>
Subject: Re: [OE-core] [PATCH v5 0/7] cmake: Major version bump to 4.0.3
Thread-Topic: [OE-core] [PATCH v5 0/7] cmake: Major version bump to 4.0.3
Thread-Index: AQHb7B5CjI6NXM094ECHIurQrbECvLQm5xCAgADTGm6AAIG1gIACr0Yb
Date: Thu, 10 Jul 2025 06:34:55 +0000
Message-ID: <DB3PR09MB6202D15953E63F9683D3A14EEA48A@DB3PR09MB6202.eurprd09.prod.outlook.com>
References: <DB3PR09MB62022D923A65D95B35ADAF69EA4EA@DB3PR09MB6202.eurprd09.prod.outlook.com>
 <8340.1751980391085408362@lists.openembedded.org>
In-Reply-To: <8340.1751980391085408362@lists.openembedded.org>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bmw.de;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB3PR09MB6202:EE_|AM0PR09MB3762:EE_
x-ms-office365-filtering-correlation-id: aa9bcfb4-d948-4001-9cd1-08ddbf7be236
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|19092799006|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?10/m2Lpp7qe9uFwHDFpskENK42i0zErAXC+1Dp4brqpw5ZKyc86iQSVsVl?=
 =?iso-8859-1?Q?uR0fZCmSG/oiGFloeuNt8WCdrHE+2H5nrhIHc7IOjiV5YdGtd074jcqbtd?=
 =?iso-8859-1?Q?pJaJ6D+i6HQgrXQvCbQK/5sUZJD+4myetCyV/qBCienIA2fSyySbECsY6w?=
 =?iso-8859-1?Q?M50woQxxOujvOjeMRx2AhxsDwFZUxOwB2JtyFpihRx453dCv37WJ9ld6qA?=
 =?iso-8859-1?Q?yt1l2KEpg1UuOFbNEGj/fI5hXDR4hOzqLCTo5TBzYJTCuUXXAbGzDcssHJ?=
 =?iso-8859-1?Q?tBktnTWAsxFYkHCEDHbilfV1zwsdqcT2ReFR9pnGg02FawWc8gtvohpatJ?=
 =?iso-8859-1?Q?qbHLVcqp7vKz3jSskXE1ZIkXPsA69dWcYiB3Wzt41W3tDhQctbf+H+PAB+?=
 =?iso-8859-1?Q?FiaPfWkgpxbgMLxvHrG4igUs6jeaE/idYOrr0INP4sXd8eTEBp4ulYgqC0?=
 =?iso-8859-1?Q?7Go11ZZRflkhXCqFylrM9Mxx4uRFpiR0Paa8R8wxkfH/8BAgWfabdm8Fov?=
 =?iso-8859-1?Q?Zo+4nd13Vb3pRGB/6pWT1iHyCdyr4ogbOMoIt4aXYhapBh0Ffcv1UYX9se?=
 =?iso-8859-1?Q?nXFFKl3+ngXQY1ZietNuvMBQbpXd1OLRTRNfWPSfLJd4FVJ2zYfrQRRUqV?=
 =?iso-8859-1?Q?6EQE8Wb9+0doH89/sQt952NLyephlwe6HQIAHdzvr+XU6NsgWLjfjk3XhS?=
 =?iso-8859-1?Q?lAdm5BZb8Arx6ZBgeCN/hbCCgZ6WUw+ZcuQo8Gsr1AHtKgyMK5E3A6cxqn?=
 =?iso-8859-1?Q?TqtadQwISGm5ehSRdAAr10oZVjqbwyuS17jOxE43EA9a14zSCMFY38dgVJ?=
 =?iso-8859-1?Q?IOwHmZzj1tbaEQqP7bXHoZ1VIufhwBYweVtpi/jg4Jl5A1mF/kYNEyX/AA?=
 =?iso-8859-1?Q?Qratn+84J8woch4YxgL10n99QdZ/ehrnA/6d/esKdOIKhJ+Wn4Jx5BCGrg?=
 =?iso-8859-1?Q?e1YgXtUM3tYaoTiFxkpNAfq5ut4GIR1GU8stgDiI0X13rGC/FMamCz5tiH?=
 =?iso-8859-1?Q?MaFrLnKruWOL9lBzPqTqNVwvrsg31PpaBxID1Uoro0D6WmFrdUAReuNHEq?=
 =?iso-8859-1?Q?4bQdrxPr+3eJQgeR9UiBG6AhvbI301wufINL4xoAe5+j9jxvuz8b/QdZHg?=
 =?iso-8859-1?Q?5GGl5tQwYdfwdQh5BNZhDfm5ChA6QIjWTNnKNLULna1cRD0QUFj4dVTs2v?=
 =?iso-8859-1?Q?WKNPgi0L49DyVuLXK6mr2lAPlGCSq+1B6tN0X7lU1xp4QPcqbp/emjP/2x?=
 =?iso-8859-1?Q?byLDtXa2UFlVb4a5AWfwYkfTQNl6H8EneGvKDoABRdC54Gm99qy+73nvAB?=
 =?iso-8859-1?Q?ZKm+13ypvfLOBSRF502ZQ5wCkJOBrLrdNRyoxBD4bc9/GvWCkwkDbdf9ls?=
 =?iso-8859-1?Q?Au1JM+fMcREvSt5/mixsNw6FxNn1EAWyJ1Qsc0pqHsFY38edW3/gWyOAl2?=
 =?iso-8859-1?Q?ti/nDxhfltbNsIieJFXfHpXFAcgqIx8GDLqh2hf/zw2jTW8WeN00Sy3aCE?=
 =?iso-8859-1?Q?wZdX50uvaqsQO7FjHsWJkHseEd1sSyJvLxL6s63X9mxg=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB3PR09MB6202.eurprd09.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?VnpWBvDzWp73ACUutHw6eg65al0hYqESqFgzCdIDYAVELg77x5r44qtIRA?=
 =?iso-8859-1?Q?r2gwVzWBn8MswXRSeJklposBF0vL8U+UNJRPgel8+w7vUeRfZsFeZcmz1C?=
 =?iso-8859-1?Q?3U/ollnaZbxRI+1or0YxBcw/VrFNyP1XLo7FW9ZBpOuKT8GaDuJRANPPYK?=
 =?iso-8859-1?Q?jqk2x6ysw+NvB6jOwRcwxUm2n5BeAtfJokfbGQwHeyoqQQ1v9H1FMcqtKI?=
 =?iso-8859-1?Q?iu3u7uhVI6bByoOMF2Vbi8UJ2gOkiELw/DPduik52A6mTJpIIA2+NaMVSE?=
 =?iso-8859-1?Q?T9huyqzFAP9gyPTd8WEO/DLoSBpqIxOdHQF/DvNBxWlgSL2HLxV/xg71N9?=
 =?iso-8859-1?Q?EViQk0VpIHxf2J8xsWCo/49z8Nn2Ad79ciQpEjtoYHC+DYPQb6i+nGDY3W?=
 =?iso-8859-1?Q?SU1LhRISwutaphoF4KejBWCtE8VbrLyPZfEPOuMtbQN3/hAZSnsYS7lvt7?=
 =?iso-8859-1?Q?pm9jTHPKN/1sM3il6RqDATAYdDS+Mwj1Eqp+wlDy+LNX+V1RpRGVukgvKF?=
 =?iso-8859-1?Q?moJSQhfcC3bnMOXbxpeRYgV00EXb/e4iKA5Q2ipstq3ucS8RdBEnsbD0VZ?=
 =?iso-8859-1?Q?/MkHXL5tMIMtqkB9CZsjDA0mU9a9Cy+LCuRSwkKI5R8hgtw0lD+SQIzHge?=
 =?iso-8859-1?Q?gw0v/RT193wZ2XYH/ORPsDPk8Ljq2hyAKXdt1oGGADF4lIVvozidh2EJFo?=
 =?iso-8859-1?Q?Cvlm04ubvxg9yH79tb5texHIJF6tpsVQ1fJdeeqmlje/lxL0IhReHkO/m/?=
 =?iso-8859-1?Q?aT+po0W5JeCQkrP5NquEHHN0o2Vp+B+bD56Oa8TxUL6/dRWex4T7aY7WTu?=
 =?iso-8859-1?Q?E2vAoyvfekM9WgtDsJ1DP6tNYAjBfjKG413njmsMxOkS/46cWPGW1TgOje?=
 =?iso-8859-1?Q?BTAkbXh/lVnmEJdBpgbHySFQoLLOc2ythS21W2ATGz1hC5khAa4vChX2+R?=
 =?iso-8859-1?Q?BypV8Gz8DTDh6o96t9vfNsKVKOC1bGNVLki7YUeIByKumGFbENNE/jMU17?=
 =?iso-8859-1?Q?Qfsu13h36s+5QM4pfR+jKxCbTFBq2dyezLNNSl6qGAe3tjq1wvAlLBoJXa?=
 =?iso-8859-1?Q?Rs5bmN0Kj//hhId0/NyZUyrjEMUuE2mIQThEx+YdBaNqb8FR7byB57CZ91?=
 =?iso-8859-1?Q?2GcJ/SHPIi7p3+mFFhgW8tq5sM1L5FyqB4iCjB26vz0XdGjkPM3aqYUs+0?=
 =?iso-8859-1?Q?5Bh0JYfq689rWd8SqXqKc6Gl+lggKLZhgYLNPCQAdik6ek/9iWD6bGZvgP?=
 =?iso-8859-1?Q?IvRjT+1G70ww8QNV8uT3e59jwWAZ3fzqLEQ4WvXgu7M4kO1Pky31pjh3oi?=
 =?iso-8859-1?Q?U07ntnlkdAQbKG/f44zet9Uc1Mp0eWIhuyIJqLdLRD+ASZlLnmsXQiO0Sj?=
 =?iso-8859-1?Q?su1y4ho97DTJYYqL3s+3HATc3H/I10ELYFbxP3+ADU9BbRlEFY3kNxtpS6?=
 =?iso-8859-1?Q?Ia+PsTYgpaIzX/S8ELrKn/6Y3v8zS8YprFKIbn6nw/glh4LWtT/T+WAAns?=
 =?iso-8859-1?Q?qS/7efJT+vb6mBMF4Q6g/uMbVb4fA8xJ6vTzpQATfpjom7df38NMLWbTll?=
 =?iso-8859-1?Q?Uela8C7L6KA+KOksV5EDpgoGc8lXym1vgjAq6JyBxVEUQUDyFfsO6+heLk?=
 =?iso-8859-1?Q?6pFRDti243vPlp610uQjAfqXiEnMMTV5/8?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB3PR09MB6202.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa9bcfb4-d948-4001-9cd1-08ddbf7be236
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jul 2025 06:34:55.3511
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: ce849bab-cc1c-465b-b62e-18f07c9ac198
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 22m1NTbLYcmnf13twl7PD2kJpOCzP5Fqv4arhUDINviYgH3GKPZDm2UkHHWicVvPH4i5ilkeCtu0zpdc709xlg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR09MB3762
X-OriginatorOrg: bmw.de
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Jul 2025 06:35:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220113

Hi,=0A=
=0A=
> I also considered the idea of temporarily using=0A=
> -DCMAKE_POLICY_VERSION_MINIMUM=3D3.5 to quickly work around the CMake 4 i=
ssues=0A=
> across multiple recipes. Then, I thought that directly upgrading recipes =
where=0A=
> the upstream version could be updated was more sustainable solution. I=0A=
> believed this would resolve many compatibility issues by relying on upstr=
eam=0A=
> fixes and encourage the community to use the latest versions.=0A=
>=0A=
> [...]=0A=
=0A=
I totally agree. Updating should be the preferred approach, followed by pat=
ching=0A=
and the policy workaround.=0A=
=0A=
> Before our conversation I made a few things and sent them to meta-openemb=
edded=0A=
> and Khem accepted them to master-next, but I still had the feeling that m=
aybe=0A=
> something better could be done.=0A=
=0A=
Awesome, thanks!=0A=
=0A=
> As I said, I have the feeling that it can be done better, so I will wait =
for=0A=
> your answers before I do anything.=0A=
=0A=
How about splitting the remaining build failures in half (after sorting the=
m=0A=
alphabetically by recipe name?). Would start working on the *second* half t=
hen.=0A=
In case of dependency issues we can sync here.=0A=
=0A=
@Khem: Would you mind sharing a link to the failures of the latest 'master-=
next'=0A=
build?=0A=
=0A=
Moritz=0A=
=0A=

