Return-Path: <beniamin.sandu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25EF2C0218A
	for <webhook@archiver.kernel.org>; Mon, 27 Jan 2025 16:40:44 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.15.1737996037521355838
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Jan 2025 08:40:37 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=31228da853=beniamin.sandu@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50R9t2gT005483
	for <openembedded-core@lists.openembedded.org>; Mon, 27 Jan 2025 08:40:37 -0800
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44cv48hrrv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 27 Jan 2025 08:40:36 -0800 (PST)
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 50RGeaFW012051;
	Mon, 27 Jan 2025 08:40:36 -0800
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2175.outbound.protection.outlook.com [104.47.59.175])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44cv48hrru-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 Jan 2025 08:40:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YvhYr2IyiEn/5aFVbCtOFRQjYSRXJh1ObwfjQapglYHP4EsX6bJ7ODhkWmA2vPnLI1aJw+FQBQC4N4iLd5MQ1EKIIfKU03LZ9z6qEwg7JNXMhPjC6lyBjDnw8Le6MOpoSXDNZqyhLsIUjkAaGiDzgKxG4nFabAwZBmtTmYQyBjjPLp3wsdUWMDrPWGXAv0U3y5um3VTbHmQ80/lRc/yB8J87uJM38oj5NWUz4NBkrbFzxIFO9EK7ZnOqp47Ml6PhYWcgPVaQp60l1cQAGfcUnZ+O/EHKXtMMeMCA9SHQkBYfNde5xTEyXyu/0Gd9VEekyKfKVnNypx0Fp9kY0K0oig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NdbWAGiYRutBqssojJ0ZvEpOxu7v2ZupeGUkNN9YiSU=;
 b=ikM3VKAyBG2JkPgW7P/DuOL/iXGlinoW/0uxdylLwRiNUY4EvOux0yW8cy3yADW84uLB+C0kmUovZ9TAV2JR7DqoNa+0hfV2j7PFAi41FeA1eqpaiWJWdzg3wOL1PiftJUbNoix8YxsigHJ1Ha/v9j3toa4/ZoQaWNz+H2jXj3IVaoFw/as51jKpIaPZ80qrhojg+mqeuwvUIgfzlYLqVhU+czfFfk2SyKYm7nIrn+pE0xiosuFNIPwguqqMRt13kmVSKMRGVCqMCprbrDj8Hl+AAP9NHtFcqpRUCqfczMiSEFeNFlIvCaRgg/9w/g9APivzJgjNgzohxFe98rYtFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM4PR11MB6067.namprd11.prod.outlook.com (2603:10b6:8:63::20) by
 PH7PR11MB6929.namprd11.prod.outlook.com (2603:10b6:510:204::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8377.22; Mon, 27 Jan 2025 16:40:31 +0000
Received: from DM4PR11MB6067.namprd11.prod.outlook.com
 ([fe80::295d:bdbf:742f:7bf3]) by DM4PR11MB6067.namprd11.prod.outlook.com
 ([fe80::295d:bdbf:742f:7bf3%7]) with mapi id 15.20.8377.021; Mon, 27 Jan 2025
 16:40:31 +0000
From: "Sandu, Beniamin" <Beniamin.Sandu@windriver.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: Adrian Freihofer <adrian.freihofer@gmail.com>,
        OE-core
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] classes: add rootfs-footprint
Thread-Topic: [OE-core] [PATCH] classes: add rootfs-footprint
Thread-Index: AQHbbmrtpKWuaWCQMkeSfsWEZApt1bMmT/IAgAADFICAAA0yY4AAFByAgARixJs=
Date: Mon, 27 Jan 2025 16:40:31 +0000
Message-ID: 
 <DM4PR11MB60673BD20D1D510AA50DEF2F93EC2@DM4PR11MB6067.namprd11.prod.outlook.com>
References: <20250124141852.2089467-1-beniamin.sandu@windriver.com>
 <CANNYZj8v_gbjquwKafQHcczz7JX6v7HWmqKBi4WkAiucBKT-wQ@mail.gmail.com>
 <CAB3asfiqa5Qc_e5kYbXqXUsFLNiEjKwHXUZUHSovTqhxmfT3eA@mail.gmail.com>
 <DM4PR11MB6067DF326AC69B39476ED5A893E32@DM4PR11MB6067.namprd11.prod.outlook.com>
 <CANNYZj8fHvF5Xi4ZyNSdjZiOUP_n3CHM2t5q5=KpvHzF5Fey2Q@mail.gmail.com>
In-Reply-To: 
 <CANNYZj8fHvF5Xi4ZyNSdjZiOUP_n3CHM2t5q5=KpvHzF5Fey2Q@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6067:EE_|PH7PR11MB6929:EE_
x-ms-office365-filtering-correlation-id: aa5acb01-1295-4351-b666-08dd3ef1503d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|4022899009|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: 
 =?iso-8859-1?Q?s3gIcl0VsgzAhX3iQ+JrYuDAux+hgVzPFufTD1XmzJalpbLtZglhcUDTCg?=
 =?iso-8859-1?Q?KkUImNV7V8eJhxrNcp9qgjc07ISErEV/3r3CmaWCcSOCV05kOfrX6Ayd5S?=
 =?iso-8859-1?Q?nSHjR0MvrQPl3vfsEGD9EG5MqU7Z7zuqwyg4V+/J0fQ2lVGtX7JryiR8qI?=
 =?iso-8859-1?Q?zKDFv0eD3Iuy4IgNPsloF8bygRvqCJPP0v1ldQenufFkV2xhx6NheusYFO?=
 =?iso-8859-1?Q?LBkPppz4gc5liVAC6Fcy1dkHAGy4QJcnB7Ki5Ul+mtZxSm7XElrjX4D2jc?=
 =?iso-8859-1?Q?qz4K+GcEwt5ec4+lKHJ1dRFTWTJY1ez7IcZ0TeZo/0I/Nli/PnqsyupwET?=
 =?iso-8859-1?Q?i/hBoPQBQNc3T1Crz5ZRJjkzqyNN/P2tnyZarq9kQ/33+csD2lmDJ/UTtL?=
 =?iso-8859-1?Q?Ia7KP1PrW4eKjPC3I00YfrqiTUU0Mr5gvXciB0uG1PJJ9YxiVcTMmYe4nV?=
 =?iso-8859-1?Q?QmK5IcbMKSriC6zxEa6zZX/juqbp4y7HPf1dtQOUStUp+15S4xcL7uaSb9?=
 =?iso-8859-1?Q?Ji/5Ncf2qci7MUyGP2u/DKfcHLaik9l5rV9ZisHppMO9zC8l3hhZMqhGup?=
 =?iso-8859-1?Q?eEm2jlzoOhsrLvlCVDPKKLDHzHKLW1RWdZay7J62XjhvH7CcrBjvg14tLR?=
 =?iso-8859-1?Q?o2ymX4kud0WRv8dxLfShJlyVXBVCwkLQtVyDo3HSakI2of8cJ/T+LO8qe4?=
 =?iso-8859-1?Q?7Cy9Ftl+NnWeW4gTFp0AHI5PDVNhdcQh+2kocunIE9EPeOML6fcqJ6NQbF?=
 =?iso-8859-1?Q?tV0X+kE9v3CgojLqma/1MOzV+NZvlifdsYC1hfc6RJQYrbIOhS2McgMdbe?=
 =?iso-8859-1?Q?raAw3Y8fy0pIl/zGUP97KnWwReeED5u6TOAre/ZNWVjmeWxndMFyRBr5tU?=
 =?iso-8859-1?Q?2PSkiOun/c/VTAa40QePCXFosQqO6GWhKcTuzwAlSvkm0NeFWxVXNOhK0Z?=
 =?iso-8859-1?Q?mGfCVrkqfL2quaSKbqLTAf+zelS/nt4lyR5/y97YqVOOJSreua07TtVY/y?=
 =?iso-8859-1?Q?6PSrPq3uCnNH9VQPAYDrHOsPFODmvnnyw+7tVQpJxr3lPwdvMAXrUGeX42?=
 =?iso-8859-1?Q?ckQ3egWaBrYO6okUb+9Brq04L5wJJI73K/LIOxEo+tL5UnrSVZkE7WRHJz?=
 =?iso-8859-1?Q?Yf6HbrGPa3466leHcS1dQAzisbH7ETPFYoWtik7BR+/wDMMqBbRfCnpHuz?=
 =?iso-8859-1?Q?nmdPw5kWbyqqXiMYh0qM2hR8J+evJrOkj5/TCjIV1E+U5NzCTgqijmyTji?=
 =?iso-8859-1?Q?sv1BynAoReB/hP+YpyTl9LH8PQRCRZliL/D4uAXK7TpQo6z4x/mkixkNxg?=
 =?iso-8859-1?Q?E92Z1kqyty/YNsabybExD5vsLCyHQCCPe78DWI1L5zMKSFqYrs9RAgckV4?=
 =?iso-8859-1?Q?aGO0JxfJfhZ733E2QG3oucjrYq4G/JCGKTJbe7tsVJoKaDaR6sT2uK2g44?=
 =?iso-8859-1?Q?bXZfBLvXGOPpeSs5M6BabaKRi2VaT4Jd/yxuEQ=3D=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6067.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?Hv1yJ+l0HMhTuOkx/yZoMYTDOJjXbK5LsbBuCtnadee6uY7xv5hPrP3wY8?=
 =?iso-8859-1?Q?YqreI2G6QkBXGyCpUYC/2cfEsXUBkDl9oPAZc10DgnD1zmk6mzTxs+bxBJ?=
 =?iso-8859-1?Q?NaUwhtAPLRsZ/xsWpeNofMC8EDWSeptu7pfdee1Txy6SaKq47Br+BhRXCD?=
 =?iso-8859-1?Q?w/kUYLkj0i71rjOfxDJQkfZaDXov3f15qs+Bm7jEYbGKCjWMTwBG/A1HX+?=
 =?iso-8859-1?Q?hH/dbk49mvpfdOZpLTCTYCoFT2CvUA2LJMrkh6CUlblRORwxzNiPp+czv3?=
 =?iso-8859-1?Q?idNjm64uxI7TzulJ2ggCDABhb8RACwxfuGDMCkIv2+DkBhgQGfK0oEqCcM?=
 =?iso-8859-1?Q?FSdQLZTNbB/E2yLxlbrZYcC5W5Tb7clXdpR8U5S2odjD/B89SY0XdD0Rfn?=
 =?iso-8859-1?Q?g3E3N//4pMwZP+vNGxWKUtYGKlBdsYhVwJfNcXI78BOEK6Dbst51+D0ujs?=
 =?iso-8859-1?Q?b9R47aT2466yjF39/1QJZs6Wbw24hyibXA5xvvkXxM7UBiaK/f7r2pRBp/?=
 =?iso-8859-1?Q?DIEZviWwm0oZbhIQMcHsjEjIq19mSLLjPXP9YBcYjyk/nH00taWiU0seFl?=
 =?iso-8859-1?Q?uk9IsWjgfs0waNuiaxOq4RH/vfXsiRUVoJXrPPV+Pfp0RVKoTwBuaoesiu?=
 =?iso-8859-1?Q?yglllKpdCKTR84oWsyM2zmbs4ryBdsqI7td32HKspuxzM5HEKGgw3hO2Lj?=
 =?iso-8859-1?Q?hZa3UEkFAF/jduRbHWSu6GgFOgaBaOEXZP9u38nxWsXCx/NEwHqa6w62oA?=
 =?iso-8859-1?Q?iTv+echY9r+tDwRU0HiSbQ7ZTmVReSpMC0LMB/DjBEeAkOGVimAJfH9VeH?=
 =?iso-8859-1?Q?+30e9WHD0paxfMzApGmf8BupY+vgyXw8HehRHU3e4PDnZz+2izl6XKK1e6?=
 =?iso-8859-1?Q?tzsMQ4Prh18iKgvNU3/Djj9RNLwVdSiAyr8/4AyOF7vVLH6gWQJdVfYl38?=
 =?iso-8859-1?Q?uR7Id7u768sFCNKJlkG5CX1DDnBeQ5MIHn8miqWJf6khN99hKooh3BDrCV?=
 =?iso-8859-1?Q?xPtBoGMjP+mnrSmROq19t/IeSUP8kMvT6NFRsQpoHitFwo5jXFdFF//pkv?=
 =?iso-8859-1?Q?P1Y7hvJe/HmBw/o6qbRbAFEathOaPQ82tOghsN462jnrnxH1lsCEsRANne?=
 =?iso-8859-1?Q?qyP1UjFGEyjp+dTPnS4O2frqKkRV8fXqVCQP75Ctm+FTgJB+hZ9lkWm9eJ?=
 =?iso-8859-1?Q?FupHJT3cAs/ukQZYHz5GeHl3h6x+NgNuwPlJIgTjSRwrZWaGasoOJQLqD7?=
 =?iso-8859-1?Q?xOYu1oiEm+KGse3safJyZe8F1W6YSv+ZBbuPtS8yxEpko1hRu/odKGIekd?=
 =?iso-8859-1?Q?qHjF17y/O01PUuGAE0rcD3b0m/3RsJFHcJQ0w1FvlgplJojymlV8sLBjqc?=
 =?iso-8859-1?Q?F+sbmP4KNqJH2Y1HRNubMKvFJnfM9P9e4VnAc73TauW1j86zs9F2MEqX4a?=
 =?iso-8859-1?Q?JHNQTkZyn8FZrwVlmR/JbiEkLrGy3PgYVJv1tE65V/NRWsVNnqyYVUKHiv?=
 =?iso-8859-1?Q?4q/fAes2gB/UN5S4drHS45x9cnP+rtsq2xEomNwadrQIagCga3qILh4lKl?=
 =?iso-8859-1?Q?2V/AhZp74S8eGSAq4bcZlWxSGsGmYish1ynmkcA5riry7ju169X6V0ztx7?=
 =?iso-8859-1?Q?7HTnu/Fq+qG9z44Ta8buXoCQDzECeaVNdC?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6067.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa5acb01-1295-4351-b666-08dd3ef1503d
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jan 2025 16:40:31.0599
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Fdzhf2f6jGS04haEOHAvI4Kl3tS7bLOSEvhdYQn9QCXtTh9A6u4QaZLzU1y/QN6m2FtKDyT/L0xddt7wKtwUHb/JuGFQW659xASQR4UwQ7g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6929
X-Authority-Analysis: v=2.4 cv=Rd9qC0tv c=1 sm=1 tr=0 ts=6797b704 cx=c_pps a=c8UlD/aNTkVRGuk1JCy5IQ==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10 a=VdSt8ZQiCzkA:10 a=bRTqI5nwn0kA:10
 a=Q4-j1AaZAAAA:8 a=pGLkceISAAAA:8 a=t7CeM3EgAAAA:8 a=iZg6KIAPuL177FU5U68A:9 a=PRpDppDLrCsA:10 a=wPNLvfGTeEIA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: etppxvTKh6MDQq3PC5Y3LdqS_5OYxFF0
X-Proofpoint-GUID: palJg4-ATZDC3eG0U3nm4jCszGq-t8dC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-27_08,2025-01-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 phishscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 clxscore=1015
 adultscore=0 bulkscore=0 impostorscore=0 spamscore=0 mlxlogscore=999
 malwarescore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2411120000 definitions=main-2501270132
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Jan 2025 16:40:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210306

Fair point, I can look into that.=0A=
=0A=
Thanks,=0A=
Beni=0A=
________________________________________=0A=
From:=A0Alexander Kanavin <alex.kanavin@gmail.com>=0A=
Sent:=A024 January 2025 23:40=0A=
To:=A0Sandu, Beniamin <Beniamin.Sandu@windriver.com>=0A=
Cc:=A0Adrian Freihofer <adrian.freihofer@gmail.com>; OE-core <openembedded-=
core@lists.openembedded.org>=0A=
Subject:=A0Re: [OE-core] [PATCH] classes: add rootfs-footprint=0A=
=0A=
You probably should look into improving buildhistory. Or-core needs maintai=
ners for things that already exist, not addition of new things that partial=
ly overlap in functionality.=0A=
=0A=
Alex=0A=
=0A=
On Fri 24. Jan 2025 at 22.25, Sandu, Beniamin <Beniamin.Sandu@windriver.com=
> wrote:=0A=
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
rmation on added/removed pacakges or files,=A0 other changes in list of ins=
talled files for a specific package, etc.=0A=
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
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=

