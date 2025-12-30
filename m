Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3322BE95A98
	for <webhook@archiver.kernel.org>; Tue, 30 Dec 2025 14:05:42 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.64615.1767103539813190077
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Dec 2025 06:05:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=kwapLfen;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=54595b53fe=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BUE1pPl4084547
	for <openembedded-core@lists.openembedded.org>; Tue, 30 Dec 2025 06:05:39 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=0JtnWsHREjvloll3lEtPqq
	62ZiM7+nPt+QwKZZycTJo=; b=kwapLfenGy8dud4d9p//xwNTnn2alIAYZlUuBR
	gqCKRDUJnnGpCu0TBwMZKuNz24Vl2hxWopOM3cvzW5ooflvWqdV5YDk2/xGjI8Tp
	2exGxdqz+E+kJEhd62aNyMXGOaTwqOC1ohvLk+2FFvn90kd/hR3nO0MIwMRgOS00
	eJUeRr2OZM9LGeth/RYk0mR5FOV7hKFpSrfiOLWdH5UhK4nbnq3eydcUIDjP3rlA
	4nmEzJPXeBT3Wxl7Ee+UtFlgXr7T7+Vw/O36p1Le9hDQ9yXLKczWlQFLNFQjToPz
	7cV4IaYWpcwJ1UoTl+rG7kB/G59WXpBLWkkGdgbgXGVyY3kA==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11010011.outbound.protection.outlook.com [52.101.201.11])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4babm22r89-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 30 Dec 2025 06:05:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RyxKLRmnTlhgca1AQtPpq8EwU7QPRtBf2hAGVK3egLe8RLJZj51DTVfTRkHhDwm7u5HjgrWTV5bufsSm50r4OxGWlQUZGHnG6jYNkxDG1VO++fee6R+nPwELhTWjjc+R4CIZLHy2lZIvk+zNhcNO3RliuaDWKxeBvdYP8VaMFFztOovHL+qbJcESDCH4z7FEFkQrAV0SqAaJ4IW9+7YeO8LF1iXcmJ03h6l3mKCA9GK79/B4bB1kq6TjsJbZ8qeO2j2EtIFxHtFCqMudlncIFb3H7boToyjedq3OoRg/rRHXk/Hn6wgUbhYcDEBjNUon96+7UotXpvsXoUEmdErPhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0JtnWsHREjvloll3lEtPqq62ZiM7+nPt+QwKZZycTJo=;
 b=leEHviUhahsy6Ms9aNsYivXJWsT4nNp4+RJ3SD6REfo3yp7KklpPh/U9wXf9zQo6R/mk/27kzQpnRifBfW6Iypp4jEMqbJY6RbaracPe29dH8ctAahPnIuHyalRyd5NJNDT28fzaGwuL/h3XHIqV7AO+2bXky5Pzw5IUqzVUGdN90+K4d2SW66PizvVLpvbd5nWAtqoJ9kJrbfutairzbEJOpcDLpSkjOxmhb6LFaQb6kF67mzlCFKu7BaI6ETuhev1mSP1qZUF9d2LXEks9oHs/B/TqH4WWKE7ZeE6ZDzVui+bZLHySxKHLMFn4sCvcxNGg6kU/NHkXAuOvtg+F6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5651.namprd11.prod.outlook.com (2603:10b6:5:356::20)
 by MN0PR11MB6255.namprd11.prod.outlook.com (2603:10b6:208:3c4::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.14; Tue, 30 Dec
 2025 14:05:36 +0000
Received: from CO6PR11MB5651.namprd11.prod.outlook.com
 ([fe80::ff15:8168:45e5:396a]) by CO6PR11MB5651.namprd11.prod.outlook.com
 ([fe80::ff15:8168:45e5:396a%6]) with mapi id 15.20.9456.013; Tue, 30 Dec 2025
 14:05:36 +0000
From: "Sadineni, Harish" <Harish.Sadineni@windriver.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "MacLeod, Randy" <Randy.MacLeod@windriver.com>,
        "Kokkonda, Sundeep"
	<Sundeep.Kokkonda@windriver.com>,
        "bruce.ashfield@gmail.com"
	<bruce.ashfield@gmail.com>,
        "yoann.congal@smile.fr" <yoann.congal@smile.fr>,
        "elmehdi.younes@smile.fr" <elmehdi.younes@smile.fr>
Subject: Re: [PATCH 00/15] Enable rust support for linux kernel
Thread-Topic: [PATCH 00/15] Enable rust support for linux kernel
Thread-Index: AQHceZTVmynICLWVK0e0hAsueIVCAbU6N0dd
Date: Tue, 30 Dec 2025 14:05:36 +0000
Message-ID: 
 <CO6PR11MB5651E6AE0BF13BE0BFA11B42EFBCA@CO6PR11MB5651.namprd11.prod.outlook.com>
References: <20251230135734.1973083-1-Harish.Sadineni@windriver.com>
In-Reply-To: <20251230135734.1973083-1-Harish.Sadineni@windriver.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Enabled=True;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_SiteId=8ddb2873-a1ad-4a18-ae4e-4644631433be;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_SetDate=2025-12-30T14:05:35.172Z;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Name=INTERNAL;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_ContentBits=1;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Method=Standard;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO6PR11MB5651:EE_|MN0PR11MB6255:EE_
x-ms-office365-filtering-correlation-id: 109d4b46-918e-4a6b-d04d-08de47ac8191
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|366016|1800799024|7053199007|13003099007|38070700021|8096899003;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?V8Mpz7a0ANcu0KHomzzOtCU6NsvOD+ERFmCYy2ReOiUniUali0q2UX4blq5N?=
 =?us-ascii?Q?NaveFJeOOXW+PCJtM1zhU5IOgq85fN49crEum2U0GSWo6uQns6Q7p+QyzbV7?=
 =?us-ascii?Q?1CUfdsUIdWi08yguPer1bo0WjyH/IhmlmCXa4/2WtJNUYxZ2NI0Ivn680V/3?=
 =?us-ascii?Q?QiOAqCcWoou9TcZsHxQL2dlMGu+159Eg22XiWBkdwQL0JQ63YmTlZyoYnwe2?=
 =?us-ascii?Q?v6uDmbegFZ20nCe3u0TkvoxN1xtks2K6PuDtbEjGSZ1w0lnzCRUZstQqsIRu?=
 =?us-ascii?Q?R3cfyG1CP+c0toj/gqrKG993NbZ89jeO7/BG/8sYzK3iR77I7il3ss9IrexW?=
 =?us-ascii?Q?Z8L0z3IM1wXrnY97b1byumvKSqN/BpAqZ4ens98yIudNVUcAA41vWJiyrkvJ?=
 =?us-ascii?Q?0U9cUher+p48amzM3ZRT9/smYfFqB98Gn6K6OMKSqk9loRBMrWVSg5y5VYho?=
 =?us-ascii?Q?+tVUEIY+J+GHfhm8DOOmnBXBIf6pXv2on7VSxqrawW++bcv7KvkJhO3EZDbX?=
 =?us-ascii?Q?WuiNhO1tBWvgB7ZBloNAkzAZH2zjRGq4E5Y9wVsfzPEztkWhTRtJ8ou0IXvJ?=
 =?us-ascii?Q?oiEnOomr5vpHcVX9c4De8Ru7E7+zdJ/muVK4VurRuzMG01uf9ThuA8kTs9B3?=
 =?us-ascii?Q?GX3C9/J0tSYUZlOtr/kRWv7AnbX9gVFB8S626xN6vD2AoIIEBT/V9IDhEEsn?=
 =?us-ascii?Q?08hoizIELlZN8h/l9a0+h68X3DEX5jtBgHyYm7B4xWCAGcbnOP5rVWBp5731?=
 =?us-ascii?Q?6hO5eqmwD3OoNmzl3KLxT7tN6cLps5tiG/+CUwXnq28OZUuWAcYfr23BdrdX?=
 =?us-ascii?Q?MiiOeUf/g6P/CoII76SLwlAOqBrkCdi6hPg3ASfSjOPmx6UD2TboWzG5884S?=
 =?us-ascii?Q?pmqBvVrnhidNRgVIZYr8lmwYtUL7X0pD5kWM2v9a4/gZk0r1Unadd40n8t7X?=
 =?us-ascii?Q?2zI1VUnSi+Hyp2WZz+HJUSW2RkHsB6EVkv8Hv87OtlRpaB/biWuBcKWlhPKE?=
 =?us-ascii?Q?2l3mbxA9d4r9nGYu5E/sIjqxV2o0gTgeu3/YrwTROosbQocAozgaPHwM00CK?=
 =?us-ascii?Q?gJCfEECR+uJ1IMaIgaVncqFvOYQojuJEJmxBl+Fl3NbThyGovY15uq9FvAZG?=
 =?us-ascii?Q?5qYylhimjHVetJ7Ry19jupQqYaXJn2rbFOqpaxWJrWLdcEoUDPwjpaywJQsX?=
 =?us-ascii?Q?jtCWvZ7CPKQ0qY18I0EvoqHMLAs2QJSEQ1miPh9kjGRDqkO1wvtV6ptkjgXt?=
 =?us-ascii?Q?lttupWjW4IunPLPLKipX5kEhtm96ebXw6NYoRsMOuAr674FjsQZUgZQO6t4Z?=
 =?us-ascii?Q?tq57LOe2yk8czD5+Ly+DDSDGYmvLf+QBa+Itp0uTZKJgkl4RWkpmrqcD4U0R?=
 =?us-ascii?Q?BKVL09ENif35rT0BtpH5UVdapHjuuwh5ZtEF+pw2okfVNP63uYjmtcWXajOl?=
 =?us-ascii?Q?Heb486d1PYn0kaKYJgZFUI92+hZa/OzWF5cXl5M/4OIL3+9QYXPoxE1NUXDL?=
 =?us-ascii?Q?p3sJS8YWNE7CNm4r9WDJbQK4wNWFdZ2f6KmxflXaxKbqcCf0ERaul2e4RQ?=
 =?us-ascii?Q?=3D=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5651.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007)(13003099007)(38070700021)(8096899003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?aF8T7A2nJw6GFxz4fxc+vf8YdLyqolWjsJeHdXH4jzz8SiJRzgvZNUqx3SWm?=
 =?us-ascii?Q?0+ENYuMe4IBMqD+iM8YzTThQpVrZy968HjrK0ypEnfkGXLG5Le0Xg0B/9Dgy?=
 =?us-ascii?Q?BlSzUthPinVsOJ+prfOVXcsW1LmfdfboOLdSTNg4JR44tOz5a2vfmjk/IGNl?=
 =?us-ascii?Q?0pvBBIJMxfS0APuAA+/qRhId5sJxpGnrnrwtzu1vQtW+NJPO19oO6CwfYSVB?=
 =?us-ascii?Q?n/hvBB0XqEOvVk9PEVSq9jIJJr0nfFSkQxHixQ6QRf7xj4Mei72XsI0VnlFo?=
 =?us-ascii?Q?UKayWwb54epcDzCjfDvWHqaFi1ajjGmi4xwwbSO9O2cmVNsBkcorGGVhmy++?=
 =?us-ascii?Q?7Ddqzg1Wgvog9tQkEZCouv2rUT+cMZoV0aT6AVhu0qs3hQfN03srqhL6ph+0?=
 =?us-ascii?Q?SQW9V8IyYWZGQgLZ2ojO0RnUgjMVJsRR5wegm37OrGkSjgOsrrfqmYliCN5+?=
 =?us-ascii?Q?5T+3TLhXQacx1lWE49c3c9Ist7gohQTpWeYbumO+CLuny+UHPzbo2gIitx3X?=
 =?us-ascii?Q?v6hcGsHnF+k5/iYWdy7W2xNYGCGSV2Ily1RpLi1vC2HIdEX/MI0Q/IVS0jAh?=
 =?us-ascii?Q?Hb60evPqgnjwqNdqxfhhC9qoUflDROce45K+Kr5rFjbP5w6gpv2ggrTyx8V/?=
 =?us-ascii?Q?JJXf+lw4N3EmuYSxxV4LMxV9W+H42YkxMeWWx8j4LBKsyFFtrwcGd+KcQpEY?=
 =?us-ascii?Q?8oPxu1jN8vJKQvpdUaAoL62MU++3kOriBbt6LgHLbFqFt+bUIKwia2cFAbRW?=
 =?us-ascii?Q?eqgsr6htw0E+TIqsnMGy9nH5KzgHmmh5LjOpJXJkRSegAzn23KLrTDqkJQof?=
 =?us-ascii?Q?JF8q/M75l7OUBlnffFQsEZtxDW85h4ZPiIfX/aMThDVAwgn4x45QlATDqVVZ?=
 =?us-ascii?Q?YSmZ9cYg7NSPL4sjpXEA+yIfnBmPeJa1HIlkJtSF0Yx01hJBD7oXSOFT0fj6?=
 =?us-ascii?Q?fUyzapwAx1NzoQaXeeLyaEY10rclNPmycwH4fIDsJ6737/uZgFET/FgQT94F?=
 =?us-ascii?Q?okSO2SfpNa644H/R87I7vR79K7B3HqJGB0aNAuL97UXBfoE1QLFpmTRb3Q4F?=
 =?us-ascii?Q?NZvaTvVYAz+sB6yABPZoVotJpEeuyGagwwJPMk5SECWO1m/f76KZAOTiJ695?=
 =?us-ascii?Q?iM9bM8mq3x5rMF5S6nhG9LjRE4fqTBrQgJ6KgkU1VkmUgeQnnK3+BXqf0+Mf?=
 =?us-ascii?Q?23Li7LXF25YaZq++wfy/CHo7Blbor84dengFXOJ25ScJFnP2UzQ82yW4s/MC?=
 =?us-ascii?Q?ayL7aKW1Wcv8llsTVd2BCN8sT33Ao93v4Kc+O805/HAe4BG5x0w0pEIbMJCB?=
 =?us-ascii?Q?mV+jAr3NC+KIfQbIUMNyni+BSZs8yxMLjJJYw48+6qFlaiefZzw18H/ie6gS?=
 =?us-ascii?Q?Gi96ryEzg9fcor5sOVMWzVkrq0fcursXSuSrcq5YUZxv389c14hB6scP/tdz?=
 =?us-ascii?Q?Ano3u7NKhQTO5EKljuQUSrODKwid1nJHqqIoTBuomCCNqo3Yh9SncaPC+SWA?=
 =?us-ascii?Q?Gt6OxJO8UChXMO7uy11e/qjZ6cJHMpPpMNtAFd8YziiDxYlttcsJ/vUoF22E?=
 =?us-ascii?Q?Zze60T0fTVXHyN4DInCjZsVp1imSZoOrkd7Cqkd5VSf2cudkiCIBQlKHo7Tr?=
 =?us-ascii?Q?z1Lw/cgIg2/MJI1xWvauCNdON5OojH2kpO2MfEqUQMcH83plotpjhdWRI0ga?=
 =?us-ascii?Q?BOztIotI2gYt02aTGMKfh2YKr0yKlRlqr4YGKZ6kE2RYxtL+8DObSeXIR5ub?=
 =?us-ascii?Q?HTFqOC0RgRDkNuVsye50q8ZzdnHWiqA=3D?=
Content-Type: multipart/alternative;
	boundary="_000_CO6PR11MB5651E6AE0BF13BE0BFA11B42EFBCACO6PR11MB5651namp_"
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5651.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 109d4b46-918e-4a6b-d04d-08de47ac8191
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Dec 2025 14:05:36.6570
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qVCryyedSQ1dwgr0RjgMRsU7UvgerVuKouYwSELRHKLnkoLYq2qJWhnzfyMpMbhutTOEsK0GOBx7mpB0jOTSxJCaS9t1Z8fLhHUeezaGgpw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6255
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: PT7SFsbXcEYeUQ2CPfFxvcc7TGKnq8P6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMwMDEyNiBTYWx0ZWRfX9CVuax5LtmYn
 uimWLJJkugmgy3MPGawKamPzlwhF6lOFkeB2hJIs9zecMyu1rZnSkmpu/2GwI9Kd/2uUZdfHz/o
 kTckOlbHwdsNmxR9yuey9/rDC9dVN8nzyqW/q6kHtT0DfHkCEgOpHkmyonDCTRFY8nA4b6YqsM4
 +zba1ClAB6nEeqE4kgTPoyH0JUc7rgBoUizmJrizr9WCuWTPsRQEsor5PcR62SiOlx/7kMhjZDe
 2efubTU6BN6P/+DczBRgTblh5jktRxuBVXLu7bza2vchnZT4JERu5+PR9MUOc3o8RuDVCDHMjmH
 jQHpV+HqaisqwlkdMGdHmh8iL0UJWC1xFpx+Zybgku9WUpQdwwheIpcZYUOvA4cZ8oiY1UrEAz1
 YZjqzRyVnspZoqkPmoYlByIZVTZjB+nevorNLd73e4ustQH3fd/TWGVZF8HFKkAecCQxXWZapR/
 6ylCKe/kr/y4EK3w7XQ==
X-Proofpoint-GUID: aN8ozU0IL2Pm3H__C3fG_ojlyaGmSCOm
X-Authority-Analysis: v=2.4 cv=bN0b4f+Z c=1 sm=1 tr=0 ts=6953dc33 cx=c_pps
 a=WfYMUjdTTdEkkNza/pHfSQ==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=wP3pNCr1ah4A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8
 a=ktMQgidfe3c9mytpCMkA:9 a=CjuIK1q_8ugA:10 a=cEz68A5hvIyNGeyW:21
 a=frz4AuCg-hUA:10 a=_W_S_7VecoQA:10 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-30_01,2025-12-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 bulkscore=0 suspectscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512300126
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Dec 2025 14:05:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228665

--_000_CO6PR11MB5651E6AE0BF13BE0BFA11B42EFBCACO6PR11MB5651namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi all,

Please ignore this series, I forgot to add v2 in the subject line.

Thanks,
Harish
________________________________
From: Sadineni, Harish
Sent: Tuesday, December 30, 2025 7:31 PM
To: openembedded-core@lists.openembedded.org <openembedded-core@lists.opene=
mbedded.org>
Cc: MacLeod, Randy <Randy.MacLeod@windriver.com>; Kokkonda, Sundeep <Sundee=
p.Kokkonda@windriver.com>; bruce.ashfield@gmail.com <bruce.ashfield@gmail.c=
om>; yoann.congal@smile.fr <yoann.congal@smile.fr>; elmehdi.younes@smile.fr=
 <elmehdi.younes@smile.fr>
Subject: [PATCH 00/15] Enable rust support for linux kernel

From: Harish Sadineni <Harish.Sadineni@windriver.com>

v2:
- combined [PATCH 05/16][0] & [PATCH 06/16][1] from v1.
- updated commit message and added in code comments for patch "[PATCH 09/15=
] kernel-devsrc: copying
  rust-kernel source to $kerneldir/build"

[0] https://lists.openembedded.org/g/openembedded-core/message/228559
[1] https://lists.openembedded.org/g/openembedded-core/message/228560

v1:
The previous series was RFC v4, "Enable Rust support for Linux kernel"
(https://lists.openembedded.org/g/openembedded-core/message/226623).

In addition, Yoann Congal posted RFC v2, "Kernel Rust out-of-tree module su=
pport"
(https://lists.openembedded.org/g/openembedded-core/message/227281), which =
builds on top of RFC v4.

The current patch series is a unified version that combines both efforts.
Compared to the earlier series, the main changes are:

-Kernel configuration fragments have been moved to yocto-kernel-cache.
-The kernel fragments have been removed from SRC_URI and from the files dir=
ectory previously stored under
 recipes-kernel/linux/files.
-Updated the "[PATCH 11/16] selftest/cases/runtime_test: Add test for Linux=
 Rust sample" by appending
 KERNEL_EXTRA_FEATURES:append =3D ' features/kernel-sample/kernel-rust-samp=
le.scc' instead of adding this
 directly in the linux-yocto recipe.


This patch series introduces Rust support into the linux-yocto kernel recip=
e
and related build infrastructure in the Yocto Project. The goal is to enabl=
e
building the Linux kernel with Rust components and provide support for buil=
ding
kernel module which is written in rust and also provide support to build
rust kernel modules in sdk.

And this series adds test for Linux Rust sample and also added support for =
out-of-tree kernel
module written in Rust as well as associated test.

Summary of patches:

- Patch 01: Extend 'bindgen-cli' to support 'nativesdk', allowing it to be =
available in the SDK environment.
- Patch 02: Add required dependencies ('clang-native', 'rust-native', 'bind=
gen-cli-native') to the kernel to support Rust binding generation.
- Patch 03: Install the Rust standard library source ('library/') into `wor=
k-shared` and which will be later copied to
           linux-yocto recipe-sysroot-native.
- Patch 04: Added 'rust-kernel' to DISTRO_FEATURES_FILTER_NATIVE and DISTRO=
_FEATURES_FILTER_NATIVESDK, the 'rust-kernel' feature automatically
           propagates from target DISTRO_FEATURES to native/nativesdk build=
s
- Patch 05: Stage the Rust sources into `recipe-sysroot-native` for kernel =
build compatibility, making them visible during native builds
            and Updated `kernel-yocto.bbclass` to invoke `make rustavailabl=
e` during 'do_kernel_configme', ensuring Rust readiness.
- Patch 06: Add kernel configuration support for Rust (via 'kernel-rust.scc=
'), enabling the Rust build options in kernel config.
- Patch 07: Fixed buildpaths errors when rust is enabled for kernel by appe=
nding --remap-path-prefix to RUST_DEBUG_REMAP
- Patch 08: Disabling ccache when rust-kernel is enabled for linux-yocto.
- Patch 09: Copy Rust kernel sources into kernel-devsrc build directory whi=
ch will be required while running 'make prepare' in sdk.
- Patch 10: Added oe-selftest case for the Linux Rust sample.
- patch 11: Copying include/config/auto.conf in STAGING_KERNEL_BUILDDIR
- patch 12: Export artifacts needed for out-of-tree Rust compilation
- patch 13: Prepare out-of-tree rust module compilation
- patch 14: Added rust-out-of-tree-module recipe in meta-skeleton layer
- patch 15: Added rust-out-of-tree selftest

Patches have been build-tested successfully on:
- qemuarm64
- qemux86-64

Benchmark test-result for x86-64:
+-------------------------------+------------+-----------+-----------+-----=
------+
| DISTRO_FEATURES               |   real     |   user    |    sys    |  FS =
usage |
+-------------------------------+------------+-----------+-----------+-----=
------+
| rust-kernel (enabled)         | 46m1.720s  | 0m28.864s | 0m3.696s  |   58=
 GB   |
| rust-kernel (disabled)        | 30m1.053s  | 0m20.091s | 0m2.748s  |   33=
 GB   |
+-------------------------------+------------+-----------+-----------+-----=
------+

The increased in time & fs is due to kernel rust dependencies in
linux-yocto.

Harish Sadineni (8):
  bindgen-cli: extend BBCLASSEXTEND to include nativesdk
  linux-yocto: conditionally add clang/rust/bindgen-cli-native to
    DEPENDS
  rust: install Rust library sources for 'make rustavailable' support
  bitbake.conf: Include "rust-kernel" in native/nativesdk feature
    filters
  kernel-yocto: enable Rust kernel support via rustavailable and staged
    rustlib sources
  linux-yocto: enable Rust support in kernel configuration
  kernel-yocto: Fix for buildpaths errors when rust is enabled for
    kernel
  kernel-devsrc: copying rust-kernel source to $kerneldir/build

Yoann Congal (7):
  kernel-yocto.bbclass: Disable ccache when rust-kernel is enabled
  selftest/cases/runtime_test: Add test for Linux Rust sample
  kernel.bbclass: Copy include/config/auto.conf in
    STAGING_KERNEL_BUILDDIR
  kernel.bbclass: Export artifacts needed for out-of-tree Rust
    compilation
  module.bbclass: Prepare out-of-tree rust module compilation
  meta-skeleton: Add rust-out-of-tree-module recipe
  runtime_test: Add rust-out-of-tree selftest

 .../rust-out-of-tree-module_git.bb            | 18 ++++++++++
 meta/classes-recipe/kernel-yocto.bbclass      | 28 +++++++++++++++
 meta/classes-recipe/kernel.bbclass            | 19 ++++++++++
 meta/classes-recipe/module.bbclass            |  8 +++++
 meta/conf/bitbake.conf                        |  4 +--
 meta/lib/oeqa/selftest/cases/runtime_test.py  | 35 +++++++++++++++++++
 .../bindgen-cli/bindgen-cli_0.72.1.bb         |  2 +-
 meta/recipes-devtools/rust/rust_1.91.1.bb     | 17 +++++++++
 meta/recipes-kernel/linux/kernel-devsrc.bb    |  9 +++++
 meta/recipes-kernel/linux/linux-yocto.inc     |  2 ++
 meta/recipes-kernel/linux/linux-yocto_6.16.bb |  1 +
 meta/recipes-kernel/linux/linux-yocto_6.18.bb |  1 +
 12 files changed, 141 insertions(+), 3 deletions(-)
 create mode 100644 meta-skeleton/recipes-kernel/rust-out-of-tree-module/ru=
st-out-of-tree-module_git.bb

--
2.49.0


--_000_CO6PR11MB5651E6AE0BF13BE0BFA11B42EFBCACO6PR11MB5651namp_
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
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Hi all,<br>
<br>
Please ignore this series, I forgot to add v2 in the subject line.<br>
<br>
Thanks,<br>
Harish&nbsp;</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Sadineni, Harish<br>
<b>Sent:</b> Tuesday, December 30, 2025 7:31 PM<br>
<b>To:</b> openembedded-core@lists.openembedded.org &lt;openembedded-core@l=
ists.openembedded.org&gt;<br>
<b>Cc:</b> MacLeod, Randy &lt;Randy.MacLeod@windriver.com&gt;; Kokkonda, Su=
ndeep &lt;Sundeep.Kokkonda@windriver.com&gt;; bruce.ashfield@gmail.com &lt;=
bruce.ashfield@gmail.com&gt;; yoann.congal@smile.fr &lt;yoann.congal@smile.=
fr&gt;; elmehdi.younes@smile.fr &lt;elmehdi.younes@smile.fr&gt;<br>
<b>Subject:</b> [PATCH 00/15] Enable rust support for linux kernel</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">From: Harish Sadineni &lt;Harish.Sadineni@windrive=
r.com&gt;<br>
<br>
v2:<br>
- combined [PATCH 05/16][0] &amp; [PATCH 06/16][1] from v1.<br>
- updated commit message and added in code comments for patch &quot;[PATCH =
09/15] kernel-devsrc: copying
<br>
&nbsp; rust-kernel source to $kerneldir/build&quot;<br>
<br>
[0] <a href=3D"https://lists.openembedded.org/g/openembedded-core/message/2=
28559">https://lists.openembedded.org/g/openembedded-core/message/228559</a=
><br>
[1] <a href=3D"https://lists.openembedded.org/g/openembedded-core/message/2=
28560">https://lists.openembedded.org/g/openembedded-core/message/228560</a=
><br>
<br>
v1:<br>
The previous series was RFC v4, &quot;Enable Rust support for Linux kernel&=
quot;<br>
(<a href=3D"https://lists.openembedded.org/g/openembedded-core/message/2266=
23">https://lists.openembedded.org/g/openembedded-core/message/226623</a>).=
<br>
<br>
In addition, Yoann Congal posted RFC v2, &quot;Kernel Rust out-of-tree modu=
le support&quot;<br>
(<a href=3D"https://lists.openembedded.org/g/openembedded-core/message/2272=
81">https://lists.openembedded.org/g/openembedded-core/message/227281</a>),=
 which builds on top of RFC v4.<br>
<br>
The current patch series is a unified version that combines both efforts.<b=
r>
Compared to the earlier series, the main changes are:<br>
<br>
-Kernel configuration fragments have been moved to yocto-kernel-cache.<br>
-The kernel fragments have been removed from SRC_URI and from the files dir=
ectory previously stored under<br>
&nbsp;recipes-kernel/linux/files.<br>
-Updated the &quot;[PATCH 11/16] selftest/cases/runtime_test: Add test for =
Linux Rust sample&quot; by appending
<br>
&nbsp;KERNEL_EXTRA_FEATURES:append =3D ' features/kernel-sample/kernel-rust=
-sample.scc' instead of adding this<br>
&nbsp;directly in the linux-yocto recipe.<br>
<br>
<br>
This patch series introduces Rust support into the linux-yocto kernel recip=
e<br>
and related build infrastructure in the Yocto Project. The goal is to enabl=
e<br>
building the Linux kernel with Rust components and provide support for buil=
ding <br>
kernel module which is written in rust and also provide support to build<br=
>
rust kernel modules in sdk. <br>
<br>
And this series adds test for Linux Rust sample and also added support for =
out-of-tree kernel
<br>
module written in Rust as well as associated test.<br>
<br>
Summary of patches:<br>
<br>
- Patch 01: Extend 'bindgen-cli' to support 'nativesdk', allowing it to be =
available in the SDK environment.<br>
- Patch 02: Add required dependencies ('clang-native', 'rust-native', 'bind=
gen-cli-native') to the kernel to support Rust binding generation.<br>
- Patch 03: Install the Rust standard library source ('library/') into `wor=
k-shared` and which will be later copied to<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; linux-yocto re=
cipe-sysroot-native.<br>
- Patch 04: Added 'rust-kernel' to DISTRO_FEATURES_FILTER_NATIVE and DISTRO=
_FEATURES_FILTER_NATIVESDK, the 'rust-kernel' feature automatically<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; propagates fro=
m target DISTRO_FEATURES to native/nativesdk builds<br>
- Patch 05: Stage the Rust sources into `recipe-sysroot-native` for kernel =
build compatibility, making them visible during native builds<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; and Upda=
ted `kernel-yocto.bbclass` to invoke `make rustavailable` during 'do_kernel=
_configme', ensuring Rust readiness.<br>
- Patch 06: Add kernel configuration support for Rust (via 'kernel-rust.scc=
'), enabling the Rust build options in kernel config.<br>
- Patch 07: Fixed buildpaths errors when rust is enabled for kernel by appe=
nding --remap-path-prefix to RUST_DEBUG_REMAP<br>
- Patch 08: Disabling ccache when rust-kernel is enabled for linux-yocto.<b=
r>
- Patch 09: Copy Rust kernel sources into kernel-devsrc build directory whi=
ch will be required while running 'make prepare' in sdk.<br>
- Patch 10: Added oe-selftest case for the Linux Rust sample.<br>
- patch 11: Copying include/config/auto.conf in STAGING_KERNEL_BUILDDIR<br>
- patch 12: Export artifacts needed for out-of-tree Rust compilation<br>
- patch 13: Prepare out-of-tree rust module compilation<br>
- patch 14: Added rust-out-of-tree-module recipe in meta-skeleton layer<br>
- patch 15: Added rust-out-of-tree selftest<br>
<br>
Patches have been build-tested successfully on:<br>
- qemuarm64<br>
- qemux86-64<br>
<br>
Benchmark test-result for x86-64:<br>
+-------------------------------+------------+-----------+-----------+-----=
------+<br>
| DISTRO_FEATURES&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; real&nbsp;&nbsp;&nbsp;&nbsp; |&nbs=
p;&nbsp; user&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp; sys&nbsp;&nbsp;&nbsp; |=
&nbsp; FS usage |<br>
+-------------------------------+------------+-----------+-----------+-----=
------+<br>
| rust-kernel (enabled)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 4=
6m1.720s&nbsp; | 0m28.864s | 0m3.696s&nbsp; |&nbsp;&nbsp; 58 GB&nbsp;&nbsp;=
 |<br>
| rust-kernel (disabled)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 30m1.0=
53s&nbsp; | 0m20.091s | 0m2.748s&nbsp; |&nbsp;&nbsp; 33 GB&nbsp;&nbsp; |<br=
>
+-------------------------------+------------+-----------+-----------+-----=
------+<br>
<br>
The increased in time &amp; fs is due to kernel rust dependencies in<br>
linux-yocto.<br>
<br>
Harish Sadineni (8):<br>
&nbsp; bindgen-cli: extend BBCLASSEXTEND to include nativesdk<br>
&nbsp; linux-yocto: conditionally add clang/rust/bindgen-cli-native to<br>
&nbsp;&nbsp;&nbsp; DEPENDS<br>
&nbsp; rust: install Rust library sources for 'make rustavailable' support<=
br>
&nbsp; bitbake.conf: Include &quot;rust-kernel&quot; in native/nativesdk fe=
ature<br>
&nbsp;&nbsp;&nbsp; filters<br>
&nbsp; kernel-yocto: enable Rust kernel support via rustavailable and stage=
d<br>
&nbsp;&nbsp;&nbsp; rustlib sources<br>
&nbsp; linux-yocto: enable Rust support in kernel configuration<br>
&nbsp; kernel-yocto: Fix for buildpaths errors when rust is enabled for<br>
&nbsp;&nbsp;&nbsp; kernel<br>
&nbsp; kernel-devsrc: copying rust-kernel source to $kerneldir/build<br>
<br>
Yoann Congal (7):<br>
&nbsp; kernel-yocto.bbclass: Disable ccache when rust-kernel is enabled<br>
&nbsp; selftest/cases/runtime_test: Add test for Linux Rust sample<br>
&nbsp; kernel.bbclass: Copy include/config/auto.conf in<br>
&nbsp;&nbsp;&nbsp; STAGING_KERNEL_BUILDDIR<br>
&nbsp; kernel.bbclass: Export artifacts needed for out-of-tree Rust<br>
&nbsp;&nbsp;&nbsp; compilation<br>
&nbsp; module.bbclass: Prepare out-of-tree rust module compilation<br>
&nbsp; meta-skeleton: Add rust-out-of-tree-module recipe<br>
&nbsp; runtime_test: Add rust-out-of-tree selftest<br>
<br>
&nbsp;.../rust-out-of-tree-module_git.bb&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 18 ++++++++++<br>
&nbsp;meta/classes-recipe/kernel-yocto.bbclass&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; | 28 +++++++++++++++<br>
&nbsp;meta/classes-recipe/kernel.bbclass&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 19 ++++++++++<br>
&nbsp;meta/classes-recipe/module.bbclass&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 8 +++++<br>
&nbsp;meta/conf/bitbake.conf&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; |&nbsp; 4 +--<br>
&nbsp;meta/lib/oeqa/selftest/cases/runtime_test.py&nbsp; | 35 +++++++++++++=
++++++<br>
&nbsp;.../bindgen-cli/bindgen-cli_0.72.1.bb&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; |&nbsp; 2 +-<br>
&nbsp;meta/recipes-devtools/rust/rust_1.91.1.bb&nbsp;&nbsp;&nbsp;&nbsp; | 1=
7 +++++++++<br>
&nbsp;meta/recipes-kernel/linux/kernel-devsrc.bb&nbsp;&nbsp;&nbsp; |&nbsp; =
9 +++++<br>
&nbsp;meta/recipes-kernel/linux/linux-yocto.inc&nbsp;&nbsp;&nbsp;&nbsp; |&n=
bsp; 2 ++<br>
&nbsp;meta/recipes-kernel/linux/linux-yocto_6.16.bb |&nbsp; 1 +<br>
&nbsp;meta/recipes-kernel/linux/linux-yocto_6.18.bb |&nbsp; 1 +<br>
&nbsp;12 files changed, 141 insertions(+), 3 deletions(-)<br>
&nbsp;create mode 100644 meta-skeleton/recipes-kernel/rust-out-of-tree-modu=
le/rust-out-of-tree-module_git.bb<br>
<br>
-- <br>
2.49.0<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_CO6PR11MB5651E6AE0BF13BE0BFA11B42EFBCACO6PR11MB5651namp_--

