Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D587AC77B7C
	for <webhook@archiver.kernel.org>; Thu,  3 Jul 2025 04:58:33 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.15294.1751518711095109752
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Jul 2025 21:58:31 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=9279857999=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5634cVEQ006312
	for <openembedded-core@lists.openembedded.org>; Thu, 3 Jul 2025 04:58:30 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47j7c9d4fr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 03 Jul 2025 04:58:29 +0000 (GMT)
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 5634wTPI003626;
	Thu, 3 Jul 2025 04:58:29 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11on2057.outbound.protection.outlook.com [40.107.223.57])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47j7c9d4fq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 03 Jul 2025 04:58:29 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TVuzUVfteiYQM2g6w5GzS5dMQPoKdZJjGFplZ4K+X5nSzdHO+3TWQZOG+eURTLlkRb3842vEdbCcRoKQgsHpaCF36EfvAd9MQLsRIszjIQ1MTGEcxhxz7rBMsGPwh2yF9UqVJHAnyy03o6SZ7MsXroh8x2v5283PUKFkbTT3aBtDA1em8o3vMsn1L5uZbPo5nMHW1ndD+v4spTorr9Cq4mmDrOPG+IiAgs8uJhmfsSGnCxbi8SxvT5o/vn3fOETKxLMlzQgSJvZEttKa1mWRvsF2Dic5BGnSIGGJ+kgeRbrCiXW0/QnuwbGigp0EbtNA1CoebHePiIcStcJkvCStKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hLlMCbLPNbzI0rWbaXwwr2ekmXjHIiji8/SHQ+bX/i4=;
 b=eSLNWQT1OSPXmDAEqEUwx6Ly+bNVHN+tUIJ7f/ZlbhnPvs9lOVwCpRoiP1KS5O4u9lFrxcnHZSUg5H0NPohKcKT4aBbfhPq5v/yomE73su0dmCGzE5KTobSO/YU8CpZfn2HFWwaGqEQG4E5ovFf/61nfYJ3RN2VQgjbvqksZJN7AQJ+0vqjWWQn+BOaiuiT9WoOSYyROphjymL9OhdBvje6asq08ugd/svA8qmiv48QsIOann0uERDEvF/SUId16QSFqvtw412OssV/5zTfKGmyjvbIV6L5IyG0FLnxvhX4RHLVGj79A1Kql13OJvAkyz5F1o5uD58xEllsAruSa/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM8PR11MB5703.namprd11.prod.outlook.com (2603:10b6:8:22::5) by
 MN0PR11MB6229.namprd11.prod.outlook.com (2603:10b6:208:3c6::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.31; Thu, 3 Jul
 2025 04:58:25 +0000
Received: from DM8PR11MB5703.namprd11.prod.outlook.com
 ([fe80::f734:e507:3083:e454]) by DM8PR11MB5703.namprd11.prod.outlook.com
 ([fe80::f734:e507:3083:e454%3]) with mapi id 15.20.8901.018; Thu, 3 Jul 2025
 04:58:24 +0000
From: "Polampalli, Archana" <Archana.Polampalli@windriver.com>
To: Gyorgy Sarvari <skandigraun@gmail.com>,
        "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe-core][scarthgap][PATCH 6/6] xwayland: fix CVE-2025-49180
Thread-Topic: [oe-core][scarthgap][PATCH 6/6] xwayland: fix CVE-2025-49180
Thread-Index: AQHb64VYH8qwPnKeKEuvrBSH5mLIM7Qf0gaH
Date: Thu, 3 Jul 2025 04:58:24 +0000
Message-ID: 
 <DM8PR11MB57031452763A7210ED17ED698443A@DM8PR11MB5703.namprd11.prod.outlook.com>
References: <20250702154619.3765505-1-archana.polampalli@windriver.com>
 <20250702154619.3765505-6-archana.polampalli@windriver.com>
 <6cacbb1b-08f7-4566-a04b-25578f91c3d3@gmail.com>
In-Reply-To: <6cacbb1b-08f7-4566-a04b-25578f91c3d3@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5703:EE_|MN0PR11MB6229:EE_
x-ms-office365-filtering-correlation-id: ca81ece2-235e-42c9-e28e-08ddb9ee3d9b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|376014|1800799024|13003099007|8096899003|38070700018|7053199007;
x-microsoft-antispam-message-info: 
 =?iso-8859-1?Q?5hsFWq9TY+hJo9Ah9Ea4JZq6cmdJ8jUq2mjNXDpdeXt3Vh1WZvwWehX+LI?=
 =?iso-8859-1?Q?nnPfZDdmNohVRrG64P8iBrcqpNE+BBGlm4T8YH9gHq+T0BFCDyVaq9o+S7?=
 =?iso-8859-1?Q?tmKMd+ZPfMhND42RVZuBuy+ASCq6+6HerGIvuQcPgEzycfHU7YD7EVKVYT?=
 =?iso-8859-1?Q?EJXQ8Q9/3dkHIFewXzpRE5JhzUhF0TwpeouNtEglaQ09mmT2qIiuIWqR2J?=
 =?iso-8859-1?Q?GidwpNcNY+wfNO1hvJkKjN1vNR8Lim45+wcpupfV5SEoGmjzVWc+BqPgIN?=
 =?iso-8859-1?Q?A3exW7mWpqgEbV4UuwfpJazXZWk/PnJrs5DA+pT5FSC0qG4yg7bcCX8JT+?=
 =?iso-8859-1?Q?BYd2cEZs2epptidXCNZnjyjvJQTD33JYoMZS/SFDeWNs4z73BAxp51cfxM?=
 =?iso-8859-1?Q?xT/Be3ib7CwcNImQmh2ExNnQvNxpTnzgF5U8VWA+9EBXhOYQRKX0c6MOAI?=
 =?iso-8859-1?Q?QZo1utOJJGUOZ5Oy1WSWFsKGZ7j3GB/+bU6rF9XigfUg0VlypuU0+miOPb?=
 =?iso-8859-1?Q?p7junzkjvMHdbUvEcTEWTaPSV7jgHvyp3+8WpqNgNxCPk9DRuHooKgfUcd?=
 =?iso-8859-1?Q?GGCiqCL5oTR7fPcoLjdvjdPRIdIcG4PRgqnelmvle69D4pPhMROv5RjTUt?=
 =?iso-8859-1?Q?Mp6EyAxDeq3uHEMTJVW8RdZvnrjs5WupxJ61L8ig82vXF08XZyjpAd9nS3?=
 =?iso-8859-1?Q?/b+zxguOw6KO5V0VIvm/QK9sTENYetXddEHp5IWsJe146kV1FsBYm4JlJG?=
 =?iso-8859-1?Q?R/uQzT7RGR4HloPvNtUWSbrfZndCsTWVhqoELCJ7bZMBmtkPMAMVUhV+im?=
 =?iso-8859-1?Q?p/0M/5G8mFK86/zm7mthtHjKv8o3GlhGOeMCV9fZtFOS0k8V+NX+CwqTEh?=
 =?iso-8859-1?Q?es/EgQLIsiLYCw/ZB6whq3ounDqVedTKyzkB+6FSUMhNaqaL92WvG+C8Sv?=
 =?iso-8859-1?Q?jdYuo57uTtCRN4XOIv8P0Ni1naqO+lROtGMxS61a2wVbGS9i18IdHV6vCG?=
 =?iso-8859-1?Q?wqPRiF4rDQhNB9r3/QFiq5l3FCi6/XmmeGsGtJimuUliMsr31+PLHRrY2O?=
 =?iso-8859-1?Q?Ufh9CVs5LTbrw+RrIfUqyLzjgq37YrX1+cQ9QgppcTNk2BwcssBhcl1WFF?=
 =?iso-8859-1?Q?v7EPXLt/+0L0/X71QAqQ2CGf6JQwUPMWJj5ou1+RvLnteCYKBfaeU+UbEE?=
 =?iso-8859-1?Q?nwcOKn75gMMdYleQ9jGqEZso8pzPyV8FBd4tCEJrrDLgd483bPDcvQozLl?=
 =?iso-8859-1?Q?7j2A35nP0Tp/xB2VEfwfIglJSHcyPmsAtIYEDRRJkFE7YoyyGfO10oTCUl?=
 =?iso-8859-1?Q?ItIsqfM7M1W8JgGrwOYVGzmFpvWv4n2HPORUepp0rygzMptBT2YXP95yMw?=
 =?iso-8859-1?Q?+LbMwEf/qHAYZB6JvyoTALUXvbr+ahvIMK3FVL3VOqikGqbG5B207H5J6A?=
 =?iso-8859-1?Q?Hl0qgljBP1j2XS8osJQ79A1muMISuZzWGQxBanxhgtF47ehgypgZLxv0eZ?=
 =?iso-8859-1?Q?4=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR11MB5703.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(13003099007)(8096899003)(38070700018)(7053199007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?PfQOMAbyFm2ErPWD81s+wU4Wq62TDu5DKrKbAshaLV43gfAGzGqGwzoVww?=
 =?iso-8859-1?Q?/UcdqCPBJQKPj/6hfO191uSzfarYPdAqO5EFFuv2EU6GP58Nl1vUMvOLs7?=
 =?iso-8859-1?Q?pPZpjj/6lBaWxaebvI/XK0G+Ur7S00r3UdOp1PIEqdX0X8cKGXw2kEeanM?=
 =?iso-8859-1?Q?3ewE3gyUsjGMTLLSA2IVT3VxAyOp9T4wNn2UWj9+0mwgsEw24EuH9TKegJ?=
 =?iso-8859-1?Q?CYzFBRA5MGO8lYzX+x7Vfc5fT0fBZYMi4QF5H+ihY9oozk5/uYcMACzRGG?=
 =?iso-8859-1?Q?6hDWIB/YNkw0qcIHvD1EpNulF2qzW5efMybShUgALfcNoZCHhl0AW0NSeh?=
 =?iso-8859-1?Q?zDjjErfH32E6iuvdZM+oNd18eq28HM2aRfLDDAVyIQHNkkbioRxBjFdj9Z?=
 =?iso-8859-1?Q?238/mA2PDdV2vFUPoXgHb46krS6rTZmriSprO59LSeCEiMRCuOd7NliGU8?=
 =?iso-8859-1?Q?pD+PQBlFz4BJywl6xCTVBY/dih9ud8/zJl54/elKBX4GqSP1kLAzGnhzSJ?=
 =?iso-8859-1?Q?XA9I55SS2XZeW+5GMw9TZz6qDE2GuxLlst6rzQRkKimrZbJb3z+NFfy59E?=
 =?iso-8859-1?Q?+/QdsFmBZ4x86EOZ5tJVmyLmIDhbXJnCaFnXlUTYAL7kY7bAFZ1qGoW+Ax?=
 =?iso-8859-1?Q?69ijPoWU+17h6AoSSLiKca5O9BtK5ySnAmluHKUpoA3PMQzf9vFzAkahv8?=
 =?iso-8859-1?Q?GY1/jiiE2rFeILbWFbxeK9ItHef3SGW00HV1D/KiqM5uyr0o78HOvuPS5l?=
 =?iso-8859-1?Q?3kIGq7mhgx9IXfXCuLiww+SeaIofR/CpY9d0RtiS8Nx8LPv8g5Ah8aG79m?=
 =?iso-8859-1?Q?j5dxSYnA/KdEQVPDkaYI7ugy6lMmwmP1gVz11lLQX9Gm31sohIzOui8CME?=
 =?iso-8859-1?Q?5eTEqNH7vYNBczRC4EKssZolnSlLQaaTuq2iUZfAr5rZt/3RMq8rZGQWyU?=
 =?iso-8859-1?Q?to4UUh2zBeihC50wkXzlUQqDO3Q/LEKvoowcet/AP6O2n9ArqlHHXDfSiR?=
 =?iso-8859-1?Q?iiS+IpqR/zlpD5Q3P4mbJt4+1MOPRVJ8NINv+LWbR2vMjQHTwPwC6EsOEf?=
 =?iso-8859-1?Q?rkWGooiyCfVh2aIsY7G9k+fqaxLguhw6p5iXvkrwmxAXY5+c0xP7lB/qyr?=
 =?iso-8859-1?Q?ZEaiO7/vrivvXcCIdzEEm2l1E3/LVeTA0QcYOS8BZvJIPhK+b8bjjSV87b?=
 =?iso-8859-1?Q?4CZjcDq5Un9InrOs+viJigT+txmg5jdKK7rsed6HcFsaEebt3E42Pf2qA/?=
 =?iso-8859-1?Q?1zADhaVUQNhfBaGI3kJgcUcR+TTe8wlf+ik1vw+vSV6vh2+X5eb2Declx4?=
 =?iso-8859-1?Q?2l5Wp69Kx571FhtLzhBAeTWD2qRTynj5nQWpOY2bCq5irnZwqwcjqz1LUY?=
 =?iso-8859-1?Q?e1hUGmmxkWz4wkYkw7zT1MxMuB1NEwNd4yWdUkfIcrIxJ+rHpmSlZlEeBw?=
 =?iso-8859-1?Q?MJG3pK7BbkL52P33q0bNa9oRZOUlWVilPnieRyX7tLtDgxHXr4XoeC54EO?=
 =?iso-8859-1?Q?MutNy6i6U9PLLaN/JsmHwHxDgbqiIQWbILntbuXG+thd0V2e38AcCsnkXD?=
 =?iso-8859-1?Q?2P4irQKPfuwB7F6C2A1aexFcjJ3DKp189jXtwyPYBZbB+26AUNPXuynKTd?=
 =?iso-8859-1?Q?eB+gH/BJDt8ZxR97triUvP8cq2cP45Wzk3tZMmA8UYId2rdfM24ojFTQ?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: multipart/alternative;
	boundary="_000_DM8PR11MB57031452763A7210ED17ED698443ADM8PR11MB5703namp_"
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5703.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca81ece2-235e-42c9-e28e-08ddb9ee3d9b
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jul 2025 04:58:24.3407
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9Q8Zjdj2sCxBaTxH2/Z5wWx13a5hm5dJdibeFn6TgkQ6mYbhr8g4IIvwUXu83tySfcDUpJLS4vHx5UuqhQrDXRJj6m+ID0MJfWnGPqf9VCjQSLn13GnKfVbElpYDf7WX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6229
X-Proofpoint-ORIG-GUID: SPs3ZzM8J-c2aNPpHgGKaRS0AGMrYwU7
X-Proofpoint-GUID: 0vD0d7FaZfwJrjl8rhkKhDcFDvEIs8O_
X-Authority-Analysis: v=2.4 cv=M5xNKzws c=1 sm=1 tr=0 ts=68660df5 cx=c_pps a=atu1pQ1eoId8WxleBF8opA==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10
 a=e5mUnYsNAAAA:8 a=pGLkceISAAAA:8 a=t7CeM3EgAAAA:8 a=Q4-j1AaZAAAA:8 a=wvPkM9v7g1_ikmSEda4A:9 a=wPNLvfGTeEIA:10 a=Q2n49p4uRcIcZi1j:21 a=frz4AuCg-hUA:10 a=_W_S_7VecoQA:10 a=Vxmtnl_E_bksehYqCbjh:22 a=FdTzh2GWekK77mhwV6Dw:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAzMDAzNiBTYWx0ZWRfX/ZAGKcDiXk3W pbPuu8Tyg8KdeAuphgi3xX8K/CU3u3zOyxW69P5+wHjbMv1IkQ5w5yQWkYA9bnedwGxqM51Y5Lz QbLJXRi5uAZA3SZIAuqudtD4bte8y8vxhcvfFjy7WClYY6PyE0WuH8kwD+k34G/Pxxe2EmyB8qG
 1G97hTeAcJAvN+tC7GZ+FPfxgSw3YzwwxKn/PBFBVLYRYNtIYspsZOam9fds4eJ8zH2p6kMZ14U 8jHQnPm6u7ubO+ThDvYUl+sq601M5mTowEabvSoGz1XIBBjSc7kHliH9ewdMWk4yZFy6S2mIC6r yk7CGX5mxPOsf/XQe+4oTvbxOYwxUQcxeQa8ini3tiwc3ltyiTuYoDT2EvP8F5VRNxnMqRz1/4y
 grZvZT/foS67HDB+YbTzivIUImLgKEKmPIcSgl6G5wmlSMV7y2DWo3BQxYFGbpGaUafaYsAt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-03_01,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 spamscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 malwarescore=0 impostorscore=0 mlxlogscore=999 suspectscore=0 mlxscore=0
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2507030036
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Jul 2025 04:58:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219861

--_000_DM8PR11MB57031452763A7210ED17ED698443ADM8PR11MB5703namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

https://gitlab.freedesktop.org/xorg/xserver/-/commit/0235121c6a7a6eb247e2ad=
db3b41ed6ef566853d is patched to  hw/xfree86/modes/xf86RandR12.c

xfree86 module not present in Xwayland


-Archana

________________________________
From: Gyorgy Sarvari <skandigraun@gmail.com>
Sent: Thursday, July 3, 2025 00:43
To: Polampalli, Archana <Archana.Polampalli@windriver.com>; openembedded-co=
re@lists.openembedded.org <openembedded-core@lists.openembedded.org>
Subject: Re: [oe-core][scarthgap][PATCH 6/6] xwayland: fix CVE-2025-49180

CAUTION: This email comes from a non Wind River email account!
Do not click links or open attachments unless you recognize the sender and =
know the content is safe.

On 7/2/25 17:46, Polampalli, Archana via lists.openembedded.org wrote:
> +
> +Upstream-Status: Backport [https://gitlab.freedesktop.org/xorg/xserver/-=
/commit/3c3a4b767b16174d3213055947ea7f4f88e10ec6]
> +

I believe this commit is also part of the fix of this cve:
https://gitlab.freedesktop.org/xorg/xserver/-/commit/0235121c6a7a6eb247e2ad=
db3b41ed6ef566853d
(unless I'm mistaken)

--_000_DM8PR11MB57031452763A7210ED17ED698443ADM8PR11MB5703namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<pre id=3D"b" class=3D"elementToProof"><div class=3D"elementToProof" style=
=3D"text-align: left; text-indent: 0px; white-space: pre-wrap; font-family:=
 Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-s=
erif; font-size: 12pt; color: rgb(0, 0, 255);"><a href=3D"https://gitlab.fr=
eedesktop.org/xorg/xserver/-/commit/0235121c6a7a6eb247e2addb3b41ed6ef566853=
d">https://gitlab.freedesktop.org/xorg/xserver/-/commit/0235121c6a7a6eb247e=
2addb3b41ed6ef566853d</a><span style=3D"color: rgb(0, 0, 0);"> is patched t=
o</span> <span style=3D"color: rgb(0, 0, 0);">&nbsp;hw/xfree86/modes/xf86Ra=
ndR12.c</span></div></pre>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
xfree86 module not present in Xwayland</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
-Archana</div>
<div id=3D"appendonsend"></div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<hr style=3D"display: inline-block; width: 98%;">
<div id=3D"divRplyFwdMsg">
<div style=3D"direction: ltr; font-family: Calibri, sans-serif; font-size: =
11pt; color: rgb(0, 0, 0);">
<b>From:</b>&nbsp;Gyorgy Sarvari &lt;skandigraun@gmail.com&gt;<br>
<b>Sent:</b>&nbsp;Thursday, July 3, 2025 00:43<br>
<b>To:</b>&nbsp;Polampalli, Archana &lt;Archana.Polampalli@windriver.com&gt=
;; openembedded-core@lists.openembedded.org &lt;openembedded-core@lists.ope=
nembedded.org&gt;<br>
<b>Subject:</b>&nbsp;Re: [oe-core][scarthgap][PATCH 6/6] xwayland: fix CVE-=
2025-49180</div>
<div style=3D"direction: ltr;">&nbsp;</div>
</div>
<div class=3D"elementToProof" style=3D"font-size: 11pt;">CAUTION: This emai=
l comes from a non Wind River email account!<br>
Do not click links or open attachments unless you recognize the sender and =
know the content is safe.<br>
<br>
On 7/2/25 17:46, Polampalli, Archana via lists.openembedded.org wrote:<br>
&gt; +<br>
&gt; +Upstream-Status: Backport [<a href=3D"https://gitlab.freedesktop.org/=
xorg/xserver/-/commit/3c3a4b767b16174d3213055947ea7f4f88e10ec6" id=3D"OWA73=
123820-358d-3203-71b0-53ca9137f54e" class=3D"OWAAutoLink" data-auth=3D"NotA=
pplicable">https://gitlab.freedesktop.org/xorg/xserver/-/commit/3c3a4b767b1=
6174d3213055947ea7f4f88e10ec6</a>]<br>
&gt; +<br>
<br>
I believe this commit is also part of the fix of this cve:<br>
<a href=3D"https://gitlab.freedesktop.org/xorg/xserver/-/commit/0235121c6a7=
a6eb247e2addb3b41ed6ef566853d" id=3D"OWA58c3b4c5-6643-29b9-1734-9a9b3bf963b=
9" class=3D"OWAAutoLink" data-auth=3D"NotApplicable">https://gitlab.freedes=
ktop.org/xorg/xserver/-/commit/0235121c6a7a6eb247e2addb3b41ed6ef566853d</a>=
<br>
(unless I'm mistaken)</div>
</body>
</html>

--_000_DM8PR11MB57031452763A7210ED17ED698443ADM8PR11MB5703namp_--

