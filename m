Return-Path: <beniamin.sandu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E665C02181
	for <webhook@archiver.kernel.org>; Fri, 24 Jan 2025 21:25:10 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.3818.1737753901815070665
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Jan 2025 13:25:02 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=31193392e9=beniamin.sandu@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50OLI33w011441
	for <openembedded-core@lists.openembedded.org>; Fri, 24 Jan 2025 21:25:01 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44aqfw3ac1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 24 Jan 2025 21:25:00 +0000 (GMT)
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 50OLP0Er021487;
	Fri, 24 Jan 2025 21:25:00 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2176.outbound.protection.outlook.com [104.47.56.176])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44aqfw3ac0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 Jan 2025 21:25:00 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WafQV9L/PRKJ+/eWLWPVJpMQZr2zJ1kKOsUUUpc55LJR9Z6rzLYmfrbssRBbZ22P8OtmAt81przjpUHtirUmpXwlgnZHyP9Mfpx5WCvIB/J3SzGsKrGW+nJpBdJwrNKhh/5TtMyiYaUeRrhl7Hfs8c/ncl7V0p4R0HqTloUF7EWoppmLUeiRfXqFA/zXvyqmRXiAMuS7NI0JzryFsEz3a21aCmm7p8PUBOJyNmTSDrFxhouZuDfJzxSq6HnUo3bmz8Lb7QeY9+Ik5p7gNocDSHMpubW1kRw2PWF0k7GWbmqzYI7SBkcN83Iep4gl8HprOh7B5NHu2Cms9/UADEto4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IdO1yx1c472pc6vxSETXzv15l/LkbTWK7PON2F8LYzE=;
 b=Dx91cCKdunDqcO4Z0VhziajA3Go8Mthg009iaxfeuwBoR5V7Po5vqp7jM9MZCxakj32RXI8lMFFvsZQ/kA/e42xyx032oVS4Rrpi//Pm0uJinRfM5nQPQLsJh6GLaORL6KrH3e14Bk7IUS8wWpQjUvCqYQgUI8IQYAI4m1SNy6c3w8rtmts9dZzi3mtlIdk8nv11AJmd289nfC3vgtT8kE1xpUknvPDOzKPz6uH4ZBf4QWNPwFGe/TL5vsUjS0C1QjtBktUpjTIUmweaxcwwzKWXBReZSIYKOA+KPjeW/eH7MvstH6HwRkF+CHdudimwlSNzRlK0X5XKCG6sNVPn/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM4PR11MB6067.namprd11.prod.outlook.com (2603:10b6:8:63::20) by
 SA1PR11MB6615.namprd11.prod.outlook.com (2603:10b6:806:256::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.20; Fri, 24 Jan
 2025 21:24:56 +0000
Received: from DM4PR11MB6067.namprd11.prod.outlook.com
 ([fe80::295d:bdbf:742f:7bf3]) by DM4PR11MB6067.namprd11.prod.outlook.com
 ([fe80::295d:bdbf:742f:7bf3%7]) with mapi id 15.20.8377.009; Fri, 24 Jan 2025
 21:24:56 +0000
From: "Sandu, Beniamin" <Beniamin.Sandu@windriver.com>
To: Adrian Freihofer <adrian.freihofer@gmail.com>,
        Alexander Kanavin
	<alex.kanavin@gmail.com>
CC: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] classes: add rootfs-footprint
Thread-Topic: [OE-core] [PATCH] classes: add rootfs-footprint
Thread-Index: AQHbbmrtpKWuaWCQMkeSfsWEZApt1bMmT/IAgAADFICAAA0yYw==
Date: Fri, 24 Jan 2025 21:24:56 +0000
Message-ID: 
 <DM4PR11MB6067DF326AC69B39476ED5A893E32@DM4PR11MB6067.namprd11.prod.outlook.com>
References: <20250124141852.2089467-1-beniamin.sandu@windriver.com>
 <CANNYZj8v_gbjquwKafQHcczz7JX6v7HWmqKBi4WkAiucBKT-wQ@mail.gmail.com>
 <CAB3asfiqa5Qc_e5kYbXqXUsFLNiEjKwHXUZUHSovTqhxmfT3eA@mail.gmail.com>
In-Reply-To: 
 <CAB3asfiqa5Qc_e5kYbXqXUsFLNiEjKwHXUZUHSovTqhxmfT3eA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6067:EE_|SA1PR11MB6615:EE_
x-ms-office365-filtering-correlation-id: 57017df1-984a-422c-781d-08dd3cbd8cba
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|366016|1800799024|4022899009|38070700018;
x-microsoft-antispam-message-info: 
 =?iso-8859-1?Q?tk7vsCgBjSZ6uMhJnWS2LWe9mryL4XSqtI5DBT54ts640eOpidZVczQEW5?=
 =?iso-8859-1?Q?MJLv+AMYA0iIh3UrIK64S348iVNHVUgQ1J8CIZ/rP3VnIcU8qDb+Wv9WD6?=
 =?iso-8859-1?Q?TLULdv2eYcLfp8frIiITCuSKqelejIz9g4IqMBBuF9tpW7G66p4c0S2jCe?=
 =?iso-8859-1?Q?EMchi0pzqdGAnwLShLW8dfFGuRCp6urSvjbbH9FFAmOhUVa+AU0EAaCMjk?=
 =?iso-8859-1?Q?ZY5Gv4xxbmRa9N+LoqQ62MZOSMlss4xva2PNeLOiIHSyas3/7NjscN6165?=
 =?iso-8859-1?Q?70QxYVyInht7Bwh9IuAiqKWGQTLHR5DvBhxzj86Ndck5t+TTQYKWUOya1E?=
 =?iso-8859-1?Q?tFI6qTve4Yl6Cqq2MSLxuG2r4/OJPihMBlqsmTf1/czpCxNGg0kXy/zYqn?=
 =?iso-8859-1?Q?7TFNPS2hPnyGsMDQxFtQKW1AK1hyyoDXamVohud9ojZmyc6N+vRwsQlWZh?=
 =?iso-8859-1?Q?puS2DzEFMg7js5m7Q8UD143YhZLzJxoKKmzq9PcgpvEEkncHE1gbaOSl4R?=
 =?iso-8859-1?Q?oft5y75kj53/yNeYDXXL4lzoDLfc8veoScHbpA+Cx0iweWoxlEIUgBPZZQ?=
 =?iso-8859-1?Q?UEDIobOSEPZfOg1gbuxnMrg3qrJTtuFydsU28PkYWCp58j86LlxzDJlxM9?=
 =?iso-8859-1?Q?ZZhS0HnG6RAYvJbBPyYyrYIG3hTl4yEuwSSe4andwq3/Sl4vo6MPSWdtm6?=
 =?iso-8859-1?Q?Q5dvclBt16A/2ozsns6OrGDEy0kbMELyOH2SfrvXfgK8vDGFR04S1yN9Uq?=
 =?iso-8859-1?Q?5UZ8ey8ImVT1W8D9XZYn8n3EsbqlNsnMUljUJL/5jxICpCAz/KHQdIsE6O?=
 =?iso-8859-1?Q?TWqs8rAhugpqu/iXn5Pzfwolur3P8JY4XbMhgA/Jl85ZSrrHnbQctDXTQv?=
 =?iso-8859-1?Q?1lc793oaoTUflhB+f/a+KfpxzYgN1kvTstf+FLthzCpvvBSrShS0vUJ5Np?=
 =?iso-8859-1?Q?lnRSRy0QTqV5/EL3tvO5lrFoN0fEfGBVgb9wendtC+D3X33hI9mVdzYv0H?=
 =?iso-8859-1?Q?/z1qHjs3mpAT+NUyTfVDqMNjG9VxV05rdNw4sGf3F6ostjFyUqQNnF6uxZ?=
 =?iso-8859-1?Q?3eztoihbI8dQVYh4yV1Uvi6XIRBsriVu5/B/rOy7OS2Y8iyUBa0DvrpMa7?=
 =?iso-8859-1?Q?jddbTJuo5oLTDq1rbiumge3HPrV6dvcqcLlgJ0ov+u/aR21c4obSRYBNjf?=
 =?iso-8859-1?Q?BayBHQbM18IFQC1BWZU/kg2UL7wFAVpsbJWj5GMcUUhHkqjxHdkWR9z8HX?=
 =?iso-8859-1?Q?Ob8SUB6zKJ+leOg5x1L9RRXQE0WgKOK0wYN1CiRBhfA4SVOkFKbZg9hDTT?=
 =?iso-8859-1?Q?8eLBr2cIQZj6QBkHRM48YmHdnePm73hWkiJYqkX0ZYVPgaCL+TNaVOU37W?=
 =?iso-8859-1?Q?FK9RqwEZ8fwOIMirLHIjO4i3UPXzoyCugToUDiTyPsqRYb7b2WuAeEOply?=
 =?iso-8859-1?Q?h5L2xAMNpsO0EFVQqnmY2L32a+2MZEvJnYPOFQ=3D=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6067.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(4022899009)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?dxasT57TPE4LxyRQ/3a0GnpLKrlGo9cdsNeWIREULcQffzCZ3X2nIq5Ue+?=
 =?iso-8859-1?Q?mwiHrzzVBF46fuk/Exwq05KkjUR4xIo6w3J+JIKmeqzDUS6SxSNG2HEoRs?=
 =?iso-8859-1?Q?ectEDhJfSW73HdLwPYW1oJUXg0S4Va7pW9sWByl5vT7z5nyPn6WyAmGrmN?=
 =?iso-8859-1?Q?e+Tg4lH8jR2zaw3roW7wxiKoshPufh7tuVsyPyp0+uXWH8K9ZHAInM+Z99?=
 =?iso-8859-1?Q?qnK4qfPyhGUI78eVpGhcVkDBEg8ibRoPvct5+JFHugod67J5tYZ4tLJpMa?=
 =?iso-8859-1?Q?tKGqz4W8rzWSozEeLcWV9u18KmmvbHc/C4gYhdT/OS8+GUlzHRMtNw7hpL?=
 =?iso-8859-1?Q?raYsFtS5IcK85ZTR6rzZBOvvl3Hg8G6ieLR92xyINwK2mnLZlD/OsfBfNW?=
 =?iso-8859-1?Q?h2Am6BzmCSo6pEhs70xkN3tyCC0KsGCRzjxWHtTFJO/WyFDinJ+I5gZog4?=
 =?iso-8859-1?Q?Rk1XCEqDmTbf+bcMm4zJPM/JJPV/q6nhOpK6OsYa8U4gNhzTjtN2CIauzt?=
 =?iso-8859-1?Q?vr2T0w9m+GLcxXQ4axdXlRxu56URCL9epaco4zpnyt4fFpOZXDbNXLNJ8H?=
 =?iso-8859-1?Q?m3eC4xEUBzClV6+xd4++LwsMDRJc5Kg0U2IKrM3GrE666L7tKDsvBQNz1M?=
 =?iso-8859-1?Q?bHyBsPB6YT3rJA4M1A4ZqFVCnBKOglQSaOV9ZR0tHqaJKGecWhepak/aeI?=
 =?iso-8859-1?Q?q/362UzDlU7YZ4OYXQ/UXSgAkWHI63qv9imT33eM+8Qj3iall/OzkXvdE2?=
 =?iso-8859-1?Q?7aUwBTumhZRwST86Swcapjd2x8RG+B31KNGKIWPQFFD7ewS5KTU5Ql+Dox?=
 =?iso-8859-1?Q?tG0iKoWuxrLbTJClmnL6eHQfPAma6sYI90xKcWE0pN1QzPYBjNWoXNk3WX?=
 =?iso-8859-1?Q?OsIiAfl3QHxdNnA5RNY41FR1vl0h/wNSWjzKWvFAZjFF40EZEY6EToHVMC?=
 =?iso-8859-1?Q?jqvFYRQR45mmHXSs/vPz39Eir/v0XupnoXPyCsQrFtc0xeBJTcuP69XZXc?=
 =?iso-8859-1?Q?bo/0UngarUD/RCWjJLRQM0SPdcJRUCoJ3a+6okeMjC8yDk0cDMuBKE+49a?=
 =?iso-8859-1?Q?icT1UfxFcf535I0hbOF7ruQgX3N4WkpJ4T4iHfvpXhJtn0QHY90CTmJmZe?=
 =?iso-8859-1?Q?nNV5ZSjGw8wbF4sVSg3HShvudxPjZkGmHiCkWljfMnu5HbnOE5t+kk5me9?=
 =?iso-8859-1?Q?qEWjCf4nSlXY/WXQ6eumlRVr/WzHInBWpIs65SWqbz0v9+Sn5sNPClP3Um?=
 =?iso-8859-1?Q?EKH62Kob9IqWh6ZoYQTbeCT+2Qw5D6P1thxW6J0f/Foz+/d3y8QLx2yxgx?=
 =?iso-8859-1?Q?MpX3oEoKAd80Do1UBREpOC09Udc46CmCkOXX0pqAYy/IxGSVO0Zcac56Fh?=
 =?iso-8859-1?Q?W2ip5E+LRJIzrRoDgB8I4rpnyXHfUJbUt1vmesJwIP/aNyf3BMr10O4YcC?=
 =?iso-8859-1?Q?LuVtc1MOU7vazRBjU+5PuK+pMgjKnO+wyp+rmNrDaAm9903/XtV9le1myF?=
 =?iso-8859-1?Q?GcR3FpaSEHXbbMzZgKSgFQAA5mKVIZdsiL3c7aiYLAOSsGfgOfPIeSqml5?=
 =?iso-8859-1?Q?MebkR3mzaiWDky0qKB+CKT8ABaAk5O1hoS9njdy+Ml7xo52RQORSLvQO/2?=
 =?iso-8859-1?Q?cojuzUly7UrISB0GLt1pFmOnNHYfDSp10P?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6067.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57017df1-984a-422c-781d-08dd3cbd8cba
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jan 2025 21:24:56.3849
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yGI2KpBxyOrgPglE1iboMyJMolLEfq/Z2T9ABmp2SQaQLd/V4ceJ/32AdElRcdM7wyl2cCJYk10zzM6Ud68TEU3EOt74fqk9a3noI73exV4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6615
X-Authority-Analysis: v=2.4 cv=b/xI4sGx c=1 sm=1 tr=0 ts=6794052c cx=c_pps a=/1KN1z/xraQh0Fnb7pnMZA==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10 a=VdSt8ZQiCzkA:10 a=bRTqI5nwn0kA:10
 a=Q4-j1AaZAAAA:8 a=pGLkceISAAAA:8 a=t7CeM3EgAAAA:8 a=uj6iAbY0QHvf4-CGi_sA:9 a=PRpDppDLrCsA:10 a=wPNLvfGTeEIA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: fNLUwf1UsYto79OWirZBJZ9VNV8KNDke
X-Proofpoint-ORIG-GUID: 5pW41j3YrdN4zVqHE8DYc4YL8VNk71dy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-24_09,2025-01-23_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 clxscore=1015 malwarescore=0 impostorscore=0 mlxscore=0
 bulkscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 mlxlogscore=999
 phishscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2411120000 definitions=main-2501240147
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Jan 2025 21:25:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210253

Hey folks,=0A=
=0A=
Thanks for the feedback.=0A=
=0A=
The main idea behind this class, was to have an easy way to extract rootfs =
information, mostly focused on sizes.=A0 A common scenario on my side was u=
pgrading a set of layers to a different yocto version, building for a syste=
m, and ending up with quite different and usually bigger final image. On sy=
stems where rootfs size is still a top priority, this can add on quite some=
 tedious extra work of identifying where all the extra space is coming from=
.=0A=
=0A=
I had a quick look at the current classes, and some issues that I found (es=
pecially for this use case), are:=0A=
=0A=
For spdx:=0A=
- there is a lot of information generated, and could not find any on packag=
e/file sizes=0A=
- spread over a lot of files=0A=
- impossible to read with the naked eye=0A=
=0A=
For buildhistory:=0A=
- a lot of information, spread over a lot of files=0A=
- different output formats in the generated data=0A=
=0A=
To that end, I wanted something that:=0A=
- is fast to generate=0A=
- is easy to read/follow with the naked eye if needed=0A=
- all the relevant information is in one file=0A=
- has a consistent and easy to parse format=0A=
=0A=
Now a script with relatively minimal logic (parsing a single json file) can=
 generate very detailed rootfs reports, e.g. sorting packages by size, info=
rmation on added/removed pacakges or files,  other changes in list of insta=
lled files for a specific package, etc.=0A=
=0A=
Let me know what you think.=0A=
=0A=
Cheers,=0A=
Beni=0A=
________________________________________=0A=
From:=A0Adrian Freihofer <adrian.freihofer@gmail.com>=0A=
Sent:=A024 January 2025 21:41=0A=
To:=A0Alexander Kanavin <alex.kanavin@gmail.com>=0A=
Cc:=A0Sandu, Beniamin <Beniamin.Sandu@windriver.com>; OE-core <openembedded=
-core@lists.openembedded.org>=0A=
Subject:=A0Re: [OE-core] [PATCH] classes: add rootfs-footprint=0A=
=0A=
Hi Beniamin=0A=
=0A=
I was also thinking about buildhistory and spdx when reading this.=0A=
=0A=
Regards,=0A=
Adrian=0A=
=0A=
Alexander Kanavin via lists.openembedded.org=A0<alex.kanavin=3Dgmail.com@li=
sts.openembedded.org> schrieb am Fr., 24. Jan. 2025, 20:30:=0A=
Isn't this what spdx already does?=0A=
E.g. tmp/deploy/spdx/3.0.1/qemux86_64/rootfs/core-image-full-cmdline-qemux8=
6-64-rootfs.spdx.json=0A=
=0A=
Alex=0A=
=0A=
On Fri, 24 Jan 2025 at 17:29, Beniamin Sandu via=0A=
lists.openembedded.org=0A=
<beniamin.sandu=3Dwindriver.com@lists.openembedded.org> wrote:=0A=
>=0A=
> The rootfs-footprint class can be inherited by image recipes to generate=
=0A=
> a .json footprint file. This file contains a list of all installed packag=
es,=0A=
> with the following format:=0A=
>=0A=
> {=0A=
>=A0 =A0 =A0"package_name": "busybox-udhcpc",=0A=
>=A0 =A0 =A0"version": "1.37.0",=0A=
>=A0 =A0 =A0"total_size": 2701,=0A=
>=A0 =A0 =A0"installed_files": {=0A=
>=A0 =A0 =A0 =A0 =A0"/etc/udhcpc.d/50default": 2652,=0A=
>=A0 =A0 =A0 =A0 =A0"/usr/share/udhcpc/default.script": 49=0A=
>=A0 =A0 =A0}=0A=
> }=0A=
>=0A=
> The data can be used with other tools/scripts to generate detailed=0A=
> rootfs reports or perform relevant comparisons.=0A=
>=0A=
> Signed-off-by: Beniamin Sandu <beniamin.sandu@windriver.com>=0A=
> ---=0A=
>=A0 meta/classes/rootfs-footprint.bbclass | 54 +++++++++++++++++++++++++++=
=0A=
>=A0 1 file changed, 54 insertions(+)=0A=
>=A0 create mode 100644 meta/classes/rootfs-footprint.bbclass=0A=
>=0A=
> diff --git a/meta/classes/rootfs-footprint.bbclass b/meta/classes/rootfs-=
footprint.bbclass=0A=
> new file mode 100644=0A=
> index 0000000000..247db0b709=0A=
> --- /dev/null=0A=
> +++ b/meta/classes/rootfs-footprint.bbclass=0A=
> @@ -0,0 +1,54 @@=0A=
> +# Generates a json footprint file with the list of packages installed in=
 the rootfs image,=0A=
> +# with the following format:=0A=
> +#=0A=
> +# {=0A=
> +#=A0 =A0 =A0"package_name": "busybox-syslog",=0A=
> +#=A0 =A0 =A0"version": "1.37.0",=0A=
> +#=A0 =A0 =A0"total_size": 2824,=0A=
> +#=A0 =A0 =A0"installed_files": {=0A=
> +#=A0 =A0 =A0 =A0 =A0"/etc/init.d/syslog": 2104,=0A=
> +#=A0 =A0 =A0 =A0 =A0"/etc/syslog-startup.conf": 651,=0A=
> +#=A0 =A0 =A0 =A0 =A0"/etc/syslog.conf": 69=0A=
> +#=A0 =A0 =A0}=0A=
> +# }=0A=
> +#=0A=
> +# Copyright (C) 2024 Wind River Systems, Inc.=0A=
> +# Author: Beniamin Sandu <beniamin.sandu@windriver.com>=0A=
> +#=0A=
> +# SPDX-License-Identifier: GPL-2.0-only=0A=
> +=0A=
> +ROOTFS_POSTPROCESS_COMMAND:append =3D " create_rootfs_footprint; "=0A=
> +ROOTFS_FOOTPRINT_FILE ?=3D "${IMGDEPLOYDIR}/${IMAGE_NAME}.footprint.json=
"=0A=
> +=0A=
> +python create_rootfs_footprint() {=0A=
> +=A0 =A0 from oe.rootfs import image_list_installed_packages=0A=
> +=A0 =A0 import oe.packagedata=0A=
> +=A0 =A0 import json=0A=
> +=0A=
> +=A0 =A0 footprint_file =3D d.getVar('ROOTFS_FOOTPRINT_FILE')=0A=
> +=A0 =A0 pkg_info_dic =3D {}=0A=
> +=A0 =A0 pkg_dic =3D dict(package_name=3D"", version=3D"", total_size=3D0=
, installed_files=3D"")=0A=
> +=A0 =A0 pkg_list =3D sorted(image_list_installed_packages(d))=0A=
> +=0A=
> +=A0 =A0 pkg_data_list =3D []=0A=
> +=0A=
> +=A0 =A0 for pkg in pkg_list:=0A=
> +=A0 =A0 =A0 =A0 pkg_info =3D os.path.join(d.getVar('PKGDATA_DIR'), 'runt=
ime-reverse', pkg)=0A=
> +=A0 =A0 =A0 =A0 pkg_name =3D os.path.basename(os.readlink(pkg_info))=0A=
> +=A0 =A0 =A0 =A0 pkg_info_dic[pkg_name] =3D oe.packagedata.read_pkgdatafi=
le(pkg_info)=0A=
> +=0A=
> +=A0 =A0 =A0 =A0 pkg_dic["package_name"] =3D pkg_name=0A=
> +=A0 =A0 =A0 =A0 pkg_dic["version"] =3D pkg_info_dic[pkg_name]["PV"]=0A=
> +=A0 =A0 =A0 =A0 pkg_dic["total_size"] =3D int(pkg_info_dic[pkg_name]["PK=
GSIZE:" + pkg_name])=0A=
> +=A0 =A0 =A0 =A0 pkg_dic["installed_files"] =3D json.loads(pkg_info_dic[p=
kg_name]["FILES_INFO:" + pkg_name])=0A=
> +=0A=
> +=A0 =A0 =A0 =A0 pkg_data_list.append(pkg_dic.copy())=0A=
> +=0A=
> +=A0 =A0 with open(footprint_file, 'w') as f:=0A=
> +=A0 =A0 =A0 =A0 json.dump(pkg_data_list, f, indent=3D4)=0A=
> +=0A=
> +=A0 =A0 footprint_link =3D os.path.join(d.getVar('IMGDEPLOYDIR'), "%s.fo=
otprint.json" % d.getVar('IMAGE_LINK_NAME'))=0A=
> +=A0 =A0 if os.path.lexists(footprint_link):=0A=
> +=A0 =A0 =A0 =A0 os.remove(footprint_link)=0A=
> +=A0 =A0 os.symlink(os.path.basename(footprint_file), footprint_link)=0A=
> +}=0A=
> --=0A=
> 2.39.5=0A=
>=0A=
>=0A=
>=0A=
>=0A=
=0A=
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=0A=
Links: You receive all messages sent to this group.=0A=
View/Reply Online (#210246): https://lists.openembedded.org/g/openembedded-=
core/message/210246=0A=
Mute This Topic: https://lists.openembedded.org/mt/110791960/4454582=0A=
Group Owner: openembedded-core+owner@lists.openembedded.org=0A=
Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub=A0[ad=
rian.freihofer@gmail.com]=0A=
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=0A=

