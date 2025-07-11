Return-Path: <Moritz.Haase@bmw.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EAC2C83F1A
	for <webhook@archiver.kernel.org>; Fri, 11 Jul 2025 10:25:37 +0000 (UTC)
Received: from esa2.hc324-48.eu.iphmx.com (esa2.hc324-48.eu.iphmx.com [207.54.68.120])
 by mx.groups.io with SMTP id smtpd.web10.10581.1752229529636261977
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Jul 2025 03:25:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bmw.de header.s=mailing1 header.b=KGqigiXY;
 dkim=pass header.i=@bmw.de header.s=selector1 header.b=GSYEJz9V;
 spf=pass (domain: bmw.de, ip: 207.54.68.120, mailfrom: prvs=28004f72d=moritz.haase@bmw.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
  t=1752229529; x=1783765529;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=1Q2tB1GNs0YUvraWQLHDp79obVIJvDWrMlthr4SNx8M=;
  b=KGqigiXYZSsg+vcfvwxZs2Q5vhw5NVklkATFfc4yf0LBdFnyqkwnvaWi
   C2mkGlNlhVa6BY9WO7g+Tt0Dv4F6A4lZ1u0RV9hFv+J51ja6+P9Gxfg9N
   wICTuhk0uU7S10+x1a2MQ4KA3ICdcMl4r+O+RZKIYp5CivQW48ZS/mygd
   E=;
X-CSE-ConnectionGUID: vtAPiXBxRJO3Dq59MRhIoQ==
X-CSE-MsgGUID: LNUeyzcDSwi9onx8mnl0ag==
Received: from esagw5.bmwgroup.com (HELO esagw5.muc) ([160.46.252.46]) by
 esa2.hc324-48.eu.iphmx.com with ESMTP/TLS; 11 Jul 2025 12:25:27 +0200
Received: from esabb1.muc ([160.50.100.31])  by esagw5.muc with ESMTP/TLS;
 11 Jul 2025 12:25:27 +0200
Received: from smucmp16e.bmwgroup.net (HELO smucmp16e.europe.bmw.corp)
 ([10.30.13.147]) by esabb1.muc with ESMTP/TLS; 11 Jul 2025 12:25:27 +0200
Received: from SMUCMP12E.europe.bmw.corp (2a03:1e80:a15:58f::1:320) by
 smucmp16e.europe.bmw.corp (2a03:1e80:a15:58f::1:147) with Microsoft SMTP
 Server (version=TLS; Fri, 11 Jul 2025 12:25:26 +0200
Received: from SMUCDZMP08.europe.bmw.corp (192.109.190.51) by
 SMUCMP12E.europe.bmw.corp (10.30.13.97) with Microsoft SMTP Server
 (version=TLS; Fri, 11 Jul 2025 12:25:26 +0200
Received: from PA4PR04CU001.outbound.protection.outlook.com (192.109.190.1) by
 smtpedge.bmwgroup.net (192.109.190.51) with Microsoft SMTP Server
 (version=TLS; Fri, 11 Jul 2025 12:25:26 +0200
Received: from DB3PR09MB6202.eurprd09.prod.outlook.com (2603:10a6:10:43a::13) by
 PA3PR09MB8169.eurprd09.prod.outlook.com (2603:10a6:102:4ad::11) with
 Microsoft SMTP Server (version=TLS; Fri, 11 Jul 2025 10:25:25 +0000
Received: from DB3PR09MB6202.eurprd09.prod.outlook.com
 ([fe80::ce00:c6f4:8427:f779]) by DB3PR09MB6202.eurprd09.prod.outlook.com
 ([fe80::ce00:c6f4:8427:f779%6]) with mapi id 15.20.8857.026; Fri, 11 Jul 2025
 10:25:25 +0000
X-CSE-ConnectionGUID: O7PB1cQeQNuS/RGlJcTc2g==
X-CSE-MsgGUID: ropxhc1gROWOs1nCyMm4iw==
X-CSE-ConnectionGUID: 0fcW0EuWSr2J/A6rar+fYw==
X-CSE-MsgGUID: kfrRYYn3Spu+SgpuMeTEQw==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oqKCFoMizzaLmMlIfwFvjUlCUqvVmQo88b8D8FPg6CyP02pt2hnw5Lw9b2rRapUXvHphGIzNG+EH5cTXeFIFZKAaZRAOTR9UPoADIAIs2LECaa30i/HHfxD8JkQNGyxVLtpIGwzrJgUJGwl7XmoD0I8O9Qw77xjO1bvUKajTJsfII+TMRV2sP6OvCpTtA5fkVSHXYpxIGHUBMzhfCLUvdnCZWu3vMWvcxGVHIswxRzctEGGaARnTZRHS1fmTr3uJw6cyOhROIa/zx1PfTfTn4NbFKBHRO+lClLT3Cqn2ywuxfjARenxghBf2gtHcS4A3f27ZHCBOJKWle2urzt6bYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1Q2tB1GNs0YUvraWQLHDp79obVIJvDWrMlthr4SNx8M=;
 b=UwwOaejwv+Z9r8Gty3N2m6YWdwKsV9bUGTO/79biAOvI30D1c4bPTytpkUjj7Mg+/9/QHJdIryCfUc3FKVfqSN0gEqTJUv8tHNvqD7nTz3uiPkHS90lH8zbEkb5dGuViyGUWeYYrDJVbC/KF/jbupBcy3uAUeDkoE+DwQhuh4u3HX3K8hKX+EXRLsTjOie9Z4tAl4mg2VTt4PzPvx0+h9aVV4ATK+6yUIj4KV2xwsj4+OTNVCCaPWM8r7pwUucFP1mXBTEnV8I4KBY/5BrJ5Kej6U45iHlYw8xQo+MYePL7lN4WtNsLjzbhaa8QsBrI7PigPCDEpEGn4PCicfdtIbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bmw.de; dmarc=pass action=none header.from=bmw.de; dkim=pass
 header.d=bmw.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bmw.de; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1Q2tB1GNs0YUvraWQLHDp79obVIJvDWrMlthr4SNx8M=;
 b=GSYEJz9Vp/2jN1yhlOOGSxvWdfrdRvvN1kKKWq1Vv9cph9byVrDytVoep5PviqvZTO44U4KLsGV6mq6chjUgpEECf1251W37z1epV2B1IXhYiRhYWdv934TSNAPX7mxnQo00JSldECyWzTaQn6nmfUa4RzJP3iuczMyDW9YPHPZ0PW0GWK2fLHIi/+1zqMXxWNfYe0F3WfQCOu0FsZnHyTOSOFdhC7JjL/inXf7begRoqQsWG5QU4LpYrIRTvlLR0qgGQnlJ/h1HJOcenH/AI3DofYV2nqJpUlkvlHcLPrqytzLaY1Ib9+tajwUAuLN2GGf++v61EtNDoAYeezNU6Q==
From: "Haase Moritz, JD-62" <Moritz.Haase@bmw.de>
To: Alper Ak <alperyasinak1@gmail.com>, "raj.khem@gmail.com"
	<raj.khem@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Alexander Kanavin
	<alex.kanavin@gmail.com>, "f_l_k@t-online.de" <f_l_k@t-online.de>
Subject: Re: [OE-core] [PATCH v5 0/7] cmake: Major version bump to 4.0.3
Thread-Topic: [OE-core] [PATCH v5 0/7] cmake: Major version bump to 4.0.3
Thread-Index: AQHb7B5CjI6NXM094ECHIurQrbECvLQm5xCAgADTGm6AAIG1gIACr0YbgADAFICAABk0gIAAdSmAgACJpNY=
Date: Fri, 11 Jul 2025 10:25:25 +0000
Message-ID: <DB3PR09MB620227B14CC05C925B253B93EA4BA@DB3PR09MB6202.eurprd09.prod.outlook.com>
References: <DB3PR09MB62022D923A65D95B35ADAF69EA4EA@DB3PR09MB6202.eurprd09.prod.outlook.com>
 <8340.1751980391085408362@lists.openembedded.org>
 <DB3PR09MB6202D15953E63F9683D3A14EEA48A@DB3PR09MB6202.eurprd09.prod.outlook.com>
 <CAMKF1spsAzE8MKQeemmi2Gs5PTSB4-KfdkRNo8P7KAUhbF1Znw@mail.gmail.com>
 <CAGpma=4Kr8D_R7Sn3mQNc5Eg-06DwK2fAmuunXZyESemFx1+VQ@mail.gmail.com>
 <CAMKF1sqm+88C1s0M7p4YQAFzFfY_6SZPjh+CvpvD87JkHb4bGg@mail.gmail.com>
In-Reply-To: <CAMKF1sqm+88C1s0M7p4YQAFzFfY_6SZPjh+CvpvD87JkHb4bGg@mail.gmail.com>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bmw.de;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB3PR09MB6202:EE_|PA3PR09MB8169:EE_
x-ms-office365-filtering-correlation-id: d65af1cb-508c-4701-46d6-08ddc0654019
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|19092799006|366016|38070700018;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?P7ggkvEWbQ4tGBjjSBb7XF41Nxq/5J54UwM6NuMU0J76rADaa9/pQwV7Oy?=
 =?iso-8859-1?Q?ZzxABv0EkGVl7wXVDcFi9PQ6BbbMxtph0jQcjSIbmq0WNwBENiCbSEn81x?=
 =?iso-8859-1?Q?yTwQLc5ez33nuXk9/CqOEKHMMr/g7gRTRHOwL3WJROA7fDFtahF6eKDEgd?=
 =?iso-8859-1?Q?eyOJl39mVWt5ZxYOcoJ7okheDOJF8iSQ8xI+eFDzAYolDwK+3n30FqF3K6?=
 =?iso-8859-1?Q?y4hnk3tLxIFPYg382ADIT00tDNMgF86GtLRIztgGRP0Lm7LH1tXMuYc48Q?=
 =?iso-8859-1?Q?5D7QY/tn7UPt7D0JzpsB7p5XqY43kRdcFUpXi2homesI0hlj7zJBL2O9/y?=
 =?iso-8859-1?Q?s92R0bkCP9iXKJlTDVQfcGjtJNelAozoI3ZASuAy5NLTqRbt72enQH7pff?=
 =?iso-8859-1?Q?XW5hTkFPiEhjJ9jYjPRF09XNGVHTD2G7oENF7GVFgjK+70GBwoZsASxLsd?=
 =?iso-8859-1?Q?MFf+f02GT7KaaqFj5Ruv6UfGfUvFBu+QLWKDNT/pTrW0KO/7NJx8QnsyaP?=
 =?iso-8859-1?Q?/1+s0tOLSna+h69ixLRpbzqy7LPBZNvRqfTmoMztIOgFPyDkYvOHc7WsCg?=
 =?iso-8859-1?Q?xYTOydcsgLqoPa2uZ47EMwAhWl9wgjXFIFNKJ5YvVTmq3VgNYiIQ2TerFu?=
 =?iso-8859-1?Q?M8YGHofh+wWzIOCQO7i0XSs/s+6V1v2KLmQA6MZbdC/yNe9DTsJoyxHJ5P?=
 =?iso-8859-1?Q?RuB/CQdAcmuLAtPNY99TwXY2Y4FWXzmTFvSVeALcD4KeVMdgUhebAJ/XnO?=
 =?iso-8859-1?Q?88/iqFwZg6g7777wR72ISJbyQex471doOIMDh+6ihgsv92lCubL+KYzOtw?=
 =?iso-8859-1?Q?s+mCaj1bw9Cflkm8qer3wsnsMmcL2JpXryuvtMd04nEa+HYYVQtd4pyzd1?=
 =?iso-8859-1?Q?boMvJ2D+E05R4s62QF85DipPQQZyz6qcEepaO5KDjSuRFaOQy3sBGliFcJ?=
 =?iso-8859-1?Q?0kEPkFE/8u2e/lPHHFfg+o4RhmoN8N9SQyeqGYpcvacclojIM4uN456aW2?=
 =?iso-8859-1?Q?ro/nTwPBw2OPzJyiVhSospU44ycnnOhhXf8TGDRefDkJ41MRsyb1mfbzIr?=
 =?iso-8859-1?Q?8npbWHf9Qvku7KEX9psrl1LwyLryHEiNcfChfli+5S1RLUgmz6NWpx4laL?=
 =?iso-8859-1?Q?RC5ehTKcyq5NGY3ngOAh3FgRXUUn/5Wyb07uwgVKBmtDbxFzGQoOSwrFhG?=
 =?iso-8859-1?Q?K29EpGdzOXG8XjG9EkLBKXpxTA83bJkDyju7J2AHm6XJlB/6ZQb9gpJIjo?=
 =?iso-8859-1?Q?Cw6qXC1D7v87VAu9Bsr86TwQJHDEWcATs+FcXbOaKWOjRHq5GO8UBikPlR?=
 =?iso-8859-1?Q?rliKJYS9uBe8Il49ko5u4jkUPerQpnscs7eqenY48oMV0q3Jrei3U4jara?=
 =?iso-8859-1?Q?oRaLCkl1CkNbMqKZc6KmZqGCRIna401iqbSoxCqx/yjCUX/OsF3eLJEVj+?=
 =?iso-8859-1?Q?oV0l6CVKGeM860PbpvQGKIAQJbLFmY2knFBJcSLoE4FbqwjuVxu+MU/ClI?=
 =?iso-8859-1?Q?8=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB3PR09MB6202.eurprd09.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(19092799006)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?O2HbthpA06dRKSkD7lcu7tefSRgvQAKanFnFKtZkStheA/jd5OWAMdgsHS?=
 =?iso-8859-1?Q?dMs39lVh1IF5TwB0HD+xIUuZnj6qYT5R5DyomjdhALSab8jG9CHbITidsM?=
 =?iso-8859-1?Q?FEElwAqN+MevQglWl2LfYCeY3di9y6gXuvQE9tKcv+OjVslzOz6O3DTlFK?=
 =?iso-8859-1?Q?iEd5I6R57OupJW4lJzNiR9TKgw7LGqV+q3EIZ5oJLx54xDI7kJjWclddRl?=
 =?iso-8859-1?Q?HFFtNuE/xsAwWCwrbB3vNFhVFcBn8gQ8LZTRlUb5BMzmDye/iZGW3dRm9T?=
 =?iso-8859-1?Q?BgAcDQKH87QnkqrrgcK06jUzkZ2Umqy7uRSiiLoBdsfQOE7h9epp/3brxY?=
 =?iso-8859-1?Q?jlbh7cQ0MW55Me6aE8tPlwQdM6coOzsSGN70gcBTS9yTGI83w31/J4o89b?=
 =?iso-8859-1?Q?EegQKEbGRKW0BCT6C6L8XUB9QX54aD8j7PqoXP0BS58VJcPiss1Rahk1CS?=
 =?iso-8859-1?Q?SsdqkUC/NLr4+eqFZx+Q/E8JVnyNzY+Mq8m/fui2sw1vw5WZhWcZgnpuek?=
 =?iso-8859-1?Q?v+RfSsz2VDXIrrc4i6/INsF1/Ni8Plxdj7hZ+ZicLSJjf/9Pt3KnaJUzyf?=
 =?iso-8859-1?Q?hDafWew0dBFxiieeaZJjofZSn3h/brwbsu8Nuzd/GARNRkNDIvKPCLEuhp?=
 =?iso-8859-1?Q?1uuG3Z47WD8hORjNQt+4MPLYV5M9g8JpwYhsx9JYV0kBKaoKa/3/QJgoZH?=
 =?iso-8859-1?Q?SOQK0KXjHXLtxhvYJAlTAJmuB63v1EqF09BB/F2XpZfkuA/rMTcDoBhcnM?=
 =?iso-8859-1?Q?+bizV5xa8J/1q6/6zUuWcyJyvvxjZcWlWQMdUZGO32+xvN3bPn1u5uxTi/?=
 =?iso-8859-1?Q?KUfbLmW9AxnzoFecjaaXoxTS8ozOFgOvREGlNtAF6xek7C3tjxXKtlddWM?=
 =?iso-8859-1?Q?hQ31Y19oTBGuavS0/RU73zrukZq7JPQE7waekDah3WCfDI5kAZu6kyEkwS?=
 =?iso-8859-1?Q?JlpJU2JV514tllLI+eLfITQrw+By5ItnyW04U8Js0VgjJWg6Vd9ttAazTs?=
 =?iso-8859-1?Q?JkUgJBGunX9WzIPE5rwHCTO2/rTs0CFQvZAqV/r7i/QqTFk4a7SPTZEXrp?=
 =?iso-8859-1?Q?dzUnd9sjabFQZiE5CTTt+4Ts9p5VhK7GP1qXkjX+9MNaqXaqyaFUV/haFz?=
 =?iso-8859-1?Q?Rs04f+/szs0PEJaWFUIxLPMdUkqi3M4sa0KmixL0M2aCkSiAfs7s5MC6E4?=
 =?iso-8859-1?Q?gnrm0Q44Vj75fCbA71s6G3ryQmuidw98+FZIWRF4RRPUPotrtiBd1pKeVM?=
 =?iso-8859-1?Q?i4u1Tr/SKYGIrKXWTXcnxvD9/osj1NWuVQTl46WC1m3gdaDkFCOJjwHQzS?=
 =?iso-8859-1?Q?Brbs8YygV0aH0xLh9+h41zcqp8VmyeZXTXPQ0oT1ZzoS8yvla6NKWgftQn?=
 =?iso-8859-1?Q?0ftNoQ4ilyiD5c7T71WJhTU5t+N0toobQRKwIhUwAO7oAZg7slHVONiamR?=
 =?iso-8859-1?Q?hzDaszJEfBYQA5tgpnet/U4xkYs+YLwYioRia0PssIQXdmw0R49MdLhAsL?=
 =?iso-8859-1?Q?Oh+XI1IoFJH+3agaUr5TiIYXKVzJWryDvgP/t+3FoR9VZIDtSws7lI3WdG?=
 =?iso-8859-1?Q?FQaFi7NtaCFfIBjykCy3fP2hu5SIRrqc2jsT50i+jobdSjLGwpiXgJFsl3?=
 =?iso-8859-1?Q?9Ip0o48e/sV9nxX+6Q1Vu/Bf13UWNQbWQW?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB3PR09MB6202.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d65af1cb-508c-4701-46d6-08ddc0654019
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jul 2025 10:25:25.5413
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: ce849bab-cc1c-465b-b62e-18f07c9ac198
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: S4Y9tfmBFNsyC48i36E85MqIFoyR98YZXeu2vgI6r4qoJNXeK3elKr5cHx7tzzJJw7l6Ed1O9GJjkh7Xl4NSFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA3PR09MB8169
X-OriginatorOrg: bmw.de
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Jul 2025 10:25:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220139

Hi,=0A=
=0A=
awesome, we are closing the gap :) I just sent another 10 patches to the ma=
iling=0A=
list via [0]. Hope to get some more done today, will keep the shared spread=
sheet=0A=
(very good idea BTW) updated.=0A=
=0A=
[0]: https://lists.openembedded.org/g/openembedded-devel/topic/meta_oe_patc=
h_00_10/114097827=0A=
=0A=
Moritz=0A=

