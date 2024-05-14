Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C9D7C04FFE
	for <webhook@archiver.kernel.org>; Tue, 14 May 2024 15:25:44 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.18727.1715700343113359434
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 May 2024 08:25:43 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=5864fc38da=randy.macleod@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44E6hxIR010951
	for <openembedded-core@lists.openembedded.org>; Tue, 14 May 2024 15:25:42 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3y1yn52w9x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 14 May 2024 15:25:42 +0000 (GMT)
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 44EFPflb009251;
	Tue, 14 May 2024 15:25:41 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1nam02lp2041.outbound.protection.outlook.com [104.47.57.41])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3y1yn52w9v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 May 2024 15:25:41 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FRFdwYx5nPrkJAQi2eZOArMEkYRAIoJU5G6Hg4odKq9wlaOwF6CleuLttgIg3oEEzfHKH6g8S6J2M/VFrwsonUK0TeE9inhjgvEpJcxA+SMZWG/2Zp5CuXISYn8pTcVRnXcXbE73OEZbhalj87JEb3UqYDDl3m6o3nM3yY2GqMIIM0A210aJe6G7mKuIe8Dpyho7cOtLn2Ezw4b98JoUARj0gX7SB2xzNqOt5rhJ8JnpBnXFOzEAQqbj/j3G3F2ph4evvVmwTbc88JAbWalFzShNIRkXYjshXw0y4G1sIFGlMaY7eVlCf0WPIQjtaF+LRI9PTj5GYpJhfv6beMi7/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N25WfR4M8wQjvnBUFF9lhSAgJHS6O/i4W8laofG26NE=;
 b=PabO3U+riE19q7qdgEBbL+QFklznz8zhl1X8OZSEsnjR6o35+Fj71vc74excT3+5tfXjltuF86y7tB9etGYdjnEUx9w+4QtY1QoTBz+zMmZJNN2ZZ+pdFGMeXwJ/Gd5vM9OfAsGXCco/MIZsHcvwcg2t/joCpGFuhobv/mVBHyQsNIsA7wxkfZ1c3nAtKZsD1riODrETb4uTOc6Z65J36CbwcNZxIMAMrbVQZQmv5jkucRB1ShIGAAiyWI/3BvuoXuxC8BQrYbeIWEtP2X3ufgyQAZJhpRfMpusVjE5IDPOLwtqcO/SgZ3oxzEfDtWw6tB89VZXbvJwUjanYOByhhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB5920.namprd11.prod.outlook.com (2603:10b6:a03:42e::9)
 by PH7PR11MB8525.namprd11.prod.outlook.com (2603:10b6:510:304::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.55; Tue, 14 May
 2024 15:25:37 +0000
Received: from SJ0PR11MB5920.namprd11.prod.outlook.com
 ([fe80::c141:cdae:82f5:1b89]) by SJ0PR11MB5920.namprd11.prod.outlook.com
 ([fe80::c141:cdae:82f5:1b89%4]) with mapi id 15.20.7544.052; Tue, 14 May 2024
 15:25:37 +0000
Content-Type: multipart/alternative;
 boundary="------------816rLefHdoYGl4fwt0KV0p2C"
Message-ID: <bccbb448-10d9-48e8-9b9a-72de5b7d9072@windriver.com>
Date: Tue, 14 May 2024 11:25:34 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v2 07/11] kea: Remove
 -fvisibility-inlines-hidden from C++ flags
To: alex.kanavin@gmail.com, Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
        Martin Jansa <martin.jansa@gmail.com>
References: <20240507053320.1566814-1-raj.khem@gmail.com>
 <20240507053320.1566814-7-raj.khem@gmail.com>
 <CANNYZj_w95u_j3XTgAMzHJ3_dYKyBzqL4tj6V3pS=sAXFjyP_g@mail.gmail.com>
 <CAMKF1soraS1+kfj9jkSqOo6LiaZnOOqzj9PimZXssfDu0kuHqw@mail.gmail.com>
 <CANNYZj_dZEQgVtihxZ-PtiBHBB44OqMF7ebLKQTEg7Bt+rrJCw@mail.gmail.com>
Content-Language: en-CA
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <CANNYZj_dZEQgVtihxZ-PtiBHBB44OqMF7ebLKQTEg7Bt+rrJCw@mail.gmail.com>
X-ClientProxiedBy: YQXP288CA0024.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:c00:41::32) To SJ0PR11MB5920.namprd11.prod.outlook.com
 (2603:10b6:a03:42e::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5920:EE_|PH7PR11MB8525:EE_
X-MS-Office365-Filtering-Correlation-Id: 6810a2d6-bb40-4c2b-ec35-08dc742a1aec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|366007|1800799015;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?YmR1V05hYnlvK3U2TmVUekw0VC9PT3gyaDRwUXNQSjFLVyt5UkFWY0RtdTQ3?=
 =?utf-8?B?aFBOdG5jUEtiMFppWVN5OFVIRjNYUFJqeVhpUXdKb2kwbDhwTVFEUkNIZEJn?=
 =?utf-8?B?ZkVPcDJWT1o4YTlnZVl6akZMMzdxZGdLcDJxZGRQZEsrSTBEYVEzUkI2MWx4?=
 =?utf-8?B?T3p0K01xejdWaTdKcG1ybFh0ekhBOUFEOCsxVWZEMitCNDV2bURQWFYwWUIv?=
 =?utf-8?B?djRLUXlRdDlsb082bFdTZkRGdHhkZTQwY252SnBIQ00rRzhvcjhKRVZHZS84?=
 =?utf-8?B?ZUFYUytUTENITEg4Wm5Ob3dGVXJwMktKcnJlU3p5RDAvMFRLMDhnSlVEbEJ6?=
 =?utf-8?B?eGdXTmliL253Y0xDRFdPL3REL2FCaTNVQ1hBdjRqZER6Q0VtaCtIODNxbWxD?=
 =?utf-8?B?a3RqYjI4enN2eTRQVjY4a0RxZmtMZnJOMkVvNUlVRkNFam90TmgyRWY5ZHI3?=
 =?utf-8?B?UzdiUU54NzNEUUNtRXp1cEJBMGJ1VlowTFNPbVJXdmtLN0cyemcvZWNaTFc3?=
 =?utf-8?B?Q2tDWE5YTmU0cUdQcTgyMWQ5c1pscnM4N25ENkVHQi9nMGlyNmlnY24xK1Q1?=
 =?utf-8?B?VSswSUNJaE9NRkNjL0w5a3B4Y3ZsWGxtdUErM3IrZW5NenBsQWJNMTJ4RUNM?=
 =?utf-8?B?VkVjUytaQ3ZmWkg4eWlSQzI4d3FhYWtWclB6TDF1cjNHeXRvcHBDWDF3c2lQ?=
 =?utf-8?B?cHg4SkdLRU4vRWNDLzFhc3lkMTBQQ1FHYVAvb0hwRUw4OW5aVlF0TkFVQmcz?=
 =?utf-8?B?SDlaSUxNekF4WG5DekhnQ1M0dUhGZklEa0ZOWFVhMEI5WGpRUDg1TldsOW1P?=
 =?utf-8?B?d2dWL1lSdTlpSTFtVEJPdE5UY0t3NkVDR0hUMnN4K1l6YnJleEFDdUpmVjBu?=
 =?utf-8?B?ay9MZVJkTzNvZ0wySFJGUzFjV2FkNGNPMWduYWxKT044VE1oU3JzVEdMQU9z?=
 =?utf-8?B?TDYrSE1CMEM1RVdLQmpDZVBOcmZGS05LeG1OdWpGS3B5Y0FrY2RvMW82S2pH?=
 =?utf-8?B?WUIzdzVnV2NUMmFUQ0JSL2wxMU4vWEIwQUI1Zy9kVks5b05xNmFXRWh5cVZ5?=
 =?utf-8?B?TWwzL1lPZlgwWXdwUGw1S2djSFFvL3U1Rmxwd25DMHppSFUwczBvOUZUZEhZ?=
 =?utf-8?B?QWtsTzNiZHVwMFNHZFRQMzFXRm9ZbzUrekRPNEVGcU8xZ3pkY3ExMHhwQU1Y?=
 =?utf-8?B?WjBhR1NBLzFWYnd5c2pGMmR3endrdVRZUVh2cW5Xc3dyY3VGak5vUUNQRVBG?=
 =?utf-8?B?Y3V0M05oR1FLQmc2U2t4YjZ2SnZqc0hzQk96Wng0c1dnZXRNMEZ4NE8wdjhr?=
 =?utf-8?B?WlhlaDMrNHdwdTNjTmR1NUk1cE9PeU44Mm5ZQ2hiWkxkb1pwUkFDRUF6eUtD?=
 =?utf-8?B?bVNRL2twcS92REV6ZHB6dmtTVVhUZWhVQ1FDS2dCejRJVnJLZkhGSGFtR24v?=
 =?utf-8?B?YXhuVWsxKzRvenZaS1RxLzd5WVYxV3ZON2hRRVZoYlpzOUM2SG02MElZMVNl?=
 =?utf-8?B?NGdaRE5qMHVxQytRV0NmSytoTTh0UnN3VmhLSk1EVTdoYTR1bkQ1SlRzT015?=
 =?utf-8?B?RjJDL1l4c1k2V0lCOUVEL3NSUHJzQ3ZnTTlTemtMbHJYVEZOR2RXd0Jld0JS?=
 =?utf-8?Q?nrlNNDnVDvRKblL+Os7bZNrDeviP0CTntWREmrnOdFHc=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5920.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(366007)(1800799015);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?dEpHQS9QQ3k2ZVAxVGJtZkZHVjhadXQxQVFROThISXMydnNKNHMwUWZNT2Iv?=
 =?utf-8?B?QjgyOXlRMEpVSzJnKzloMEVGaDQrUlV6SXRVM3hlS1BDUTRwaDZJelFBYzZD?=
 =?utf-8?B?WEQrWXdPV0RsMERMcHduVkpFTkVlb2ZGWGhGZU9qKzUrRkFxU0NOSGdYYk90?=
 =?utf-8?B?R2hCeUl5MVRmNlQ1ek9LMlluSjBocTByOTNlN1BOV3pLRFdhdjFCSlJGQ0Yr?=
 =?utf-8?B?R295RS9YZjh6WmpqODlTMmVVWXlsWXE1TkUzWXdkWE1OaVdWRDRkSjB3NCtE?=
 =?utf-8?B?MkNrakVKVWhHT1IwWUZtNno2SzVBYTFXZTR4ZGRmY0crbDEzTEZoM1VJZmJa?=
 =?utf-8?B?TFRBQytIaFBGVWNCN1pNdHhRUU1UUmhSRGFHQTV6Ky92MkczWWFLbzFHSXVM?=
 =?utf-8?B?aUtmSW1PRG5ORktXUU1wWGExTTh6MkF3d3FtRGEyVVRlaGpGYzdzY1BYckdz?=
 =?utf-8?B?OGVZTDEzVWpsbFNuTnNDSDk4aFcrQVZJYUtKakdRQktWMGFqOEZ6cDcxYkxD?=
 =?utf-8?B?T21XN1RrL2FsVjhMZEpIc2xsVDdSeE9pRG92dzBWTGJPcEt4NTFLZ2I2dWxW?=
 =?utf-8?B?Z1Brem51NHFEc0RYV3ZJdW85dWtBUUVkWkFrMXpwTCtPOVlCb3ZyV25YM2Yz?=
 =?utf-8?B?QzFmck0xY015YjJwbnRJdi9MV0JpVXQvaTZEbDJSTFpkck5ORWZWK0piT25V?=
 =?utf-8?B?YWN6VFlwZmVpSjVuaUxybFJZcGp0V0hCdDNFOVBOSWpHMmh4OEFaSmFPTDBB?=
 =?utf-8?B?VGVTd2VYUG52VUdjVGlzTmFwRVhNQlJVdUpqc3hFcWYyVU91T0wwRytyanJF?=
 =?utf-8?B?aFZZMWJEWFVKSXBLeWtFeVpoQ0VCVVlRRVhPbUJ3QTlXeThBeEljY1pjK3NV?=
 =?utf-8?B?NUN4TjFFNnBmVzN2cEhINkVqSFJPM05WakEyUTdXdEFLWmtBb2VFWE1KUFlN?=
 =?utf-8?B?L3VCQzNIMzFxd1BjYzFsTnhTQkNhNlcyUFJ4L1FiY0lCU1A0WWQyNlBpTVRi?=
 =?utf-8?B?OGFmVnVuMENxNW9MMm1nVklXS04wTHpEQklCQ09mRkROQ2M1cjVENHFDeUtP?=
 =?utf-8?B?ZEY0OXljTWcxQmVucE0vSFlNNHBpejY1VkVId0wvYTV3VzRQNk9TTE1uQnBr?=
 =?utf-8?B?VndWbkF4cXRCNllvdjRzdmFmQXFRT09hYi9FU3Fsa1RtcEo2c1R1S1JjcWN4?=
 =?utf-8?B?UTRkWFVaZDZ4dy84ajZ4TlBWNCtoYzMvT3BPY09ENjJqQ2xpRG5BVm83SWNj?=
 =?utf-8?B?WU5pK0YyV3QzUGlsL3BsZWNCaW00TlZEOWExNGNCR0tTY2dpUjFrS2pWVzVM?=
 =?utf-8?B?RXQvd2VkKzlGUStYcURPSlNFOHQ4cUFKaWZSTXVPL1RkTVdQNW5nOUsxWGs2?=
 =?utf-8?B?SlB0OENUWk9Xam5LenlQZGxlSklUUHQ1Sy9MSmM0YjVZK09FZENKaUxpL1M2?=
 =?utf-8?B?bmViRVpVVEFuVTBJMC9saENhdi9CSHJSVURNTXBYeTF1d0xwbzV3MndBZXVR?=
 =?utf-8?B?cmhmd1BSV0x2V2xocEtCbXNqWHdEazVwL2RFL0FWNkUva1ZXZ25UV3JPT1hY?=
 =?utf-8?B?Sk1JVEpjNCtZQ2EvVExTSHlBOE5NNG95ZXJFaFZBNW1xQ0tYamdPVFRiY3A5?=
 =?utf-8?B?TFJFbklJSHpNU0Y0R1kxS08rU2lXMjFsdzF5QnNwNnFGcFR3blN5cDVPa2RW?=
 =?utf-8?B?NHpMbHlscG95K25EQkdkRVV2dWxUdm1pOGppMmw0UjZxOG1STkZESkdSY1Fq?=
 =?utf-8?B?RWZXWENoa3lOaVIvYlJZaXk2SW9ySzAxc0RudGhhNzdIYWIvQWZEZy95S2NC?=
 =?utf-8?B?UFlWOHdSY1RMbVJIbko5OXRYZmNIRUdNZHd4MFNQQng1RUR3S3JCZXlFVmlO?=
 =?utf-8?B?ZG9yZGhJaVppbXRLU0w3eUU3NWJjYlBraEtzL25BS1Y4KzFkNVVKMXpmczdM?=
 =?utf-8?B?KzlwakZBTklZbDc5TmtpM1R2YkFUQmZBbDNYVmtkdVI2MmwwckV2a0RmYjBL?=
 =?utf-8?B?QndCM0hFblNyWVhTbmZhYmcxbnpIR0xVanJwVmlIOWNaUlFOeUVjbUMyT1Vv?=
 =?utf-8?B?TUVVZU04d21MUGlhUGgrWG12c2pkMWZkU0dHeldoVVFXS01wQU92eXcycjRO?=
 =?utf-8?B?c1Y0YnNaRVZmUlhtMTM2K01WbGRySm9xRzJzNFlOLzUxbGE4SUdsQUNTa2FY?=
 =?utf-8?B?eUE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6810a2d6-bb40-4c2b-ec35-08dc742a1aec
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5920.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2024 15:25:37.0377
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q32UWUw1JrdV04OlQWUKylREIzL0smIY7y4b02ylD0b+NGRobeQ+MYs7j0MtrvxLAti781GVNXGc5HYCdyBthpdPVHRAcS/Dn0KNZc4qGO4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8525
X-Proofpoint-GUID: XfQIK0CRjb6znnvGRHEwZ0bPZkKedzJV
X-Proofpoint-ORIG-GUID: 5HwtozoXav74vYqswxYKDvn-wgamnejV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-14_08,2024-05-14_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxscore=0
 phishscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 mlxlogscore=999 impostorscore=0 malwarescore=0 suspectscore=0 spamscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405140108
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 May 2024 15:25:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199260

--------------816rLefHdoYGl4fwt0KV0p2C
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 44E6hxIR010951

On 2024-05-07 3:56 p.m., Alexander Kanavin via lists.openembedded.org wro=
te:
> On Tue, 7 May 2024 at 18:13, Khem Raj<raj.khem@gmail.com>  wrote:
>> Firstly I am inclined towards removing it if we can, since I think it =
should be
>> packages to decide to use it, then they can maintain it better from te=
sting POV,
>> However, there is something
>> to consider w.r.t. to this option. This does help in optimizing loadin=
g DSOs
>> by reducing the number of PLTs and improves loading time for DSOs whic=
h might
>> be quite meaningful for embedded devices that we target. However, we o=
nly
>> enable hidden visibility only for inlines so it won't be full benefits=
 but we do
>> have better default compatibility.
>>
>> Since we have had this option for a long time and it still seems
>> relevant, I would
>> think it would make sense to do some benchmarking on a sizeable C++ pr=
ogram
>> perhaps chromium or webkit, and see the difference in DSOs sizes with
>> and without
>> this option and also benchmark the loading time of the resulting
>> chromium package.
>>
>> maybe we will find that the gains are not as significant, in that case
>> we might drop
>> it from defaults.
> I digged deeper and this is where I think it originated:
> https://git.openembedded.org/openembedded/commit/?id=3Dddd6d1fd26416a37=
66d754eeda4237a680a65520
>
> Ah the simpler times of oe-classic, when one could bundle four
> unrelated changes into one commit and explain none of them.
>
> Benchmarking I have no time for right now, just wanted to point out
> that adding the flag was never justified in commit log. Can you
> experiment with webkit?


I tried to build chromium with and without this flag but ran into build=20
problems - sigh.

I pulled out the next most-bloated single executable that I could think=20
of: nodejs

The bottom line is that the flag reduces the nodejs executable size=C2=A0=
 by ~6%.
Actual sizes:

 >>> 37333922 - 35245092
2088830

so 2 MB out of 37 MB !

Chromium has been updated over the weekend so I'll try that next.

What else would people like to see to assess the utility of this=20
compiler option?


../Randy

Original build:

=E2=9D=AF size=20
../chromium-poky-m-aab1335523/tmp/work/core2-64-poky-linux/nodejs/20.12.2=
/packages-split/nodejs/usr/bin/node=20

 =C2=A0=C2=A0 text=C2=A0=C2=A0=C2=A0 data=C2=A0=C2=A0=C2=A0=C2=A0 bss=C2=A0=
=C2=A0=C2=A0=C2=A0 dec=C2=A0=C2=A0=C2=A0=C2=A0 hex filename
35245092=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 628548=C2=A0 154=
792 36028432=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 225c010=20
../chromium-poky-m-aab1335523/tmp/work/core2-64-poky-linux/nodejs/20.12.2=
/packages-split/nodejs/usr/bin/node

With this patch:

=E2=9D=AF git diff
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_20.12.2.bb=20
b/meta-oe/recipes-devtools/nodejs/nodejs_20.12.2.bb
index d86c38f2f..50cff533f 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_20.12.2.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_20.12.2.bb
@@ -42,6 +42,8 @@ S =3D "${WORKDIR}/node-v${PV}"

 =C2=A0CVE_PRODUCT +=3D "node.js"

+CXXFLAGS:remove =3D "-fvisibility-inlines-hidden"
+
 =C2=A0# v8 errors out if you have set CCACHE
 =C2=A0CCACHE =3D ""


=E2=9D=AF size=20
tmp/work/core2-64-poky-linux/nodejs/20.12.2/packages-split/nodejs/usr/bin=
/node=20

 =C2=A0=C2=A0 text=C2=A0=C2=A0=C2=A0 data=C2=A0=C2=A0=C2=A0=C2=A0 bss=C2=A0=
=C2=A0=C2=A0=C2=A0 dec=C2=A0=C2=A0=C2=A0=C2=A0 hex filename
37333922=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 628548=C2=A0 154=
792 38117262=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2459f8e=20
tmp/work/core2-64-poky-linux/nodejs/20.12.2/packages-split/nodejs/usr/bin=
/node

=E2=9D=AF python3
Python 3.10.12 (main, Nov 20 2023, 15:14:05) [GCC 11.4.0] on linux
Type "help", "copyright", "credits" or "license" for more information.
 >>> 35245092.0/37333922.0*100.0
94.40500786389386



>
> Alex
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#199104):https://lists.openembedded.org/g/openembedd=
ed-core/message/199104
> Mute This Topic:https://lists.openembedded.org/mt/105955497/3616765
> Group Owner:openembedded-core+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub  [=
randy.macleod@windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

--=20
# Randy MacLeod
# Wind River Linux

--------------816rLefHdoYGl4fwt0KV0p2C
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 44E6hxIR010951

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <div class=3D"moz-cite-prefix">On 2024-05-07 3:56 p.m., Alexander
      Kanavin via lists.openembedded.org wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:CANNYZj_dZEQgVtihxZ-PtiBHBB44Oq=
MF7ebLKQTEg7Bt+rrJCw@mail.gmail.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">On Tue, 7 May 2024 at 18:13,=
 Khem Raj <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:raj.khem@gmai=
l.com">&lt;raj.khem@gmail.com&gt;</a> wrote:
</pre>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D"">Firstly I am inclined towa=
rds removing it if we can, since I think it should be
packages to decide to use it, then they can maintain it better from testi=
ng POV,
However, there is something
to consider w.r.t. to this option. This does help in optimizing loading D=
SOs
by reducing the number of PLTs and improves loading time for DSOs which m=
ight
be quite meaningful for embedded devices that we target. However, we only
enable hidden visibility only for inlines so it won't be full benefits bu=
t we do
have better default compatibility.

Since we have had this option for a long time and it still seems
relevant, I would
think it would make sense to do some benchmarking on a sizeable C++ progr=
am
perhaps chromium or webkit, and see the difference in DSOs sizes with
and without
this option and also benchmark the loading time of the resulting
chromium package.

maybe we will find that the gains are not as significant, in that case
we might drop
it from defaults.
</pre>
      </blockquote>
      <pre class=3D"moz-quote-pre" wrap=3D"">I digged deeper and this is =
where I think it originated:
<a class=3D"moz-txt-link-freetext" href=3D"https://git.openembedded.org/o=
penembedded/commit/?id=3Dddd6d1fd26416a3766d754eeda4237a680a65520">https:=
//git.openembedded.org/openembedded/commit/?id=3Dddd6d1fd26416a3766d754ee=
da4237a680a65520</a>

Ah the simpler times of oe-classic, when one could bundle four
unrelated changes into one commit and explain none of them.

Benchmarking I have no time for right now, just wanted to point out
that adding the flag was never justified in commit log. Can you
experiment with webkit?</pre>
    </blockquote>
    <p><br>
    </p>
    <p>I tried to build chromium with and without this flag but ran into
      build problems - sigh.</p>
    <p>I pulled out the next most-bloated single executable that I could
      think of: nodejs</p>
    <p>The bottom line is that the flag reduces the nodejs executable
      size&nbsp; by ~6%.<br>
      Actual sizes:<br>
    </p>
    <p>&gt;&gt;&gt; 37333922 - 35245092<br>
      2088830</p>
    <p>so 2 MB out of 37 MB !</p>
    <p>Chromium has been updated over the weekend so I'll try that next.<=
/p>
    <p>What else would people like to see to assess the utility of this
      compiler option?</p>
    <p><br>
    </p>
    <p>../Randy<br>
    </p>
    <p>Original build:<br>
    </p>
    <p>=E2=9D=AF size
../chromium-poky-m-aab1335523/tmp/work/core2-64-poky-linux/nodejs/20.12.2=
/packages-split/nodejs/usr/bin/node
      <br>
      &nbsp;&nbsp; text&nbsp;&nbsp;&nbsp; data&nbsp;&nbsp;&nbsp;&nbsp; bs=
s&nbsp;&nbsp;&nbsp;&nbsp; dec&nbsp;&nbsp;&nbsp;&nbsp; hex filename<br>
      35245092&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 628548&nbs=
p; 154792 36028432&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 225c010
../chromium-poky-m-aab1335523/tmp/work/core2-64-poky-linux/nodejs/20.12.2=
/packages-split/nodejs/usr/bin/node<br>
      <br>
      With this patch:<br>
      <br>
      =E2=9D=AF git diff<br>
      diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_20.12.2.bb
      b/meta-oe/recipes-devtools/nodejs/nodejs_20.12.2.bb<br>
      index d86c38f2f..50cff533f 100644<br>
      --- a/meta-oe/recipes-devtools/nodejs/nodejs_20.12.2.bb<br>
      +++ b/meta-oe/recipes-devtools/nodejs/nodejs_20.12.2.bb<br>
      @@ -42,6 +42,8 @@ S =3D &quot;${WORKDIR}/node-v${PV}&quot;<br>
      &nbsp;<br>
      &nbsp;CVE_PRODUCT +=3D &quot;node.js&quot;<br>
      &nbsp;<br>
      +CXXFLAGS:remove =3D &quot;-fvisibility-inlines-hidden&quot;<br>
      +<br>
      &nbsp;# v8 errors out if you have set CCACHE<br>
      &nbsp;CCACHE =3D &quot;&quot;<br>
      &nbsp;<br>
    </p>
    <p><br>
      =E2=9D=AF size
tmp/work/core2-64-poky-linux/nodejs/20.12.2/packages-split/nodejs/usr/bin=
/node
      <br>
      &nbsp;&nbsp; text&nbsp;&nbsp;&nbsp; data&nbsp;&nbsp;&nbsp;&nbsp; bs=
s&nbsp;&nbsp;&nbsp;&nbsp; dec&nbsp;&nbsp;&nbsp;&nbsp; hex filename<br>
      37333922&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 628548&nbs=
p; 154792 38117262&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2459f8e
tmp/work/core2-64-poky-linux/nodejs/20.12.2/packages-split/nodejs/usr/bin=
/node<br>
      <br>
      =E2=9D=AF python3<br>
      Python 3.10.12 (main, Nov 20 2023, 15:14:05) [GCC 11.4.0] on linux<=
br>
      Type &quot;help&quot;, &quot;copyright&quot;, &quot;credits&quot; o=
r &quot;license&quot; for more
      information.<br>
      &gt;&gt;&gt; 35245092.0/37333922.0*100.0<br>
      94.40500786389386<br>
      <br>
    </p>
    <p><br>
    </p>
    <p></p>
    <p><br>
    </p>
    <blockquote type=3D"cite" cite=3D"mid:CANNYZj_dZEQgVtihxZ-PtiBHBB44Oq=
MF7ebLKQTEg7Bt+rrJCw@mail.gmail.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">

Alex
</pre>
      <br>
      <fieldset class=3D"moz-mime-attachment-header"></fieldset>
      <pre class=3D"moz-quote-pre" wrap=3D"">-=3D-=3D-=3D-=3D-=3D-=3D-=3D=
-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#199104): <a class=3D"moz-txt-link-freetext" href=3D"h=
ttps://lists.openembedded.org/g/openembedded-core/message/199104">https:/=
/lists.openembedded.org/g/openembedded-core/message/199104</a>
Mute This Topic: <a class=3D"moz-txt-link-freetext" href=3D"https://lists=
.openembedded.org/mt/105955497/3616765">https://lists.openembedded.org/mt=
/105955497/3616765</a>
Group Owner: <a class=3D"moz-txt-link-abbreviated" href=3D"mailto:openemb=
edded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.op=
enembedded.org</a>
Unsubscribe: <a class=3D"moz-txt-link-freetext" href=3D"https://lists.ope=
nembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g=
/openembedded-core/unsub</a> [<a class=3D"moz-txt-link-abbreviated" href=3D=
"mailto:randy.macleod@windriver.com">randy.macleod@windriver.com</a>]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

</pre>
    </blockquote>
    <p><br>
    </p>
    <pre class=3D"moz-signature" cols=3D"72">--=20
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------816rLefHdoYGl4fwt0KV0p2C--

