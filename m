Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEF85C87FDB
	for <webhook@archiver.kernel.org>; Mon, 11 Aug 2025 11:23:15 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.45890.1754911389083428699
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Aug 2025 04:23:09 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=0318d5fa94=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.8/8.18.1.8) with ESMTP id 57BAP7DN2457658
	for <openembedded-core@lists.openembedded.org>; Mon, 11 Aug 2025 11:23:08 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 48duj2hh6j-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 11 Aug 2025 11:23:07 +0000 (GMT)
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 57BBMDFR2550702
	for <openembedded-core@lists.openembedded.org>; Mon, 11 Aug 2025 11:23:07 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12on2072.outbound.protection.outlook.com [40.107.237.72])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 48duj2hh6h-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 11 Aug 2025 11:23:07 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VY3RMglzA3ps1lYDjfnhaKtYz1v/o0GpLMhWIbbfg0veyXA8MEYcTkBzv+/SR7bXVsXP158se3JTSh8aNvfF4w8c8pME0zVgHfAwzBFlm9cyNm2BY7yFDU/lsXKAYkppT7N9ueyLlWTSFu1usQ6H1gmLnvREadh5wFpzritazVEJ+1kOBg5APEKJd3ARJ8/U7QzwDFBMSO5/sZdJCAmcu9wUTMFUR+YZm+0suKevgRs7DDy/qCBRdQ8U8E8qZ0+IrtNsRQf0uDpGvGbhqgq/BPQ/dH1WeqCp4ksG8VsfnmVOdwLjcGye9k1RXC8dUoX/ti/y5hIKFLCqT0eaq88e5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IcV0oQ+NFqJesZLIvmmAx20H6FANKmvLIXU7FeiHheU=;
 b=q9ZLh372ZXTZTdS8FFEcJ7n5N83KaMw/OcHqq7qWHfqoG7wGz3km3tLDkqE9P2rB6ioeowjRwVBVjOc5FiVH4zcQZfMdhiU9eD+3f2UvRO/g1sFXINkF8aABgyb8twEKBzGEDRoB2R38vbXeNm12RoM+AWnjqSM+tgo3pfc4JUPGf+/8keToWHT7Dqrto/uZTxJjgAej0jIyywOOrhkb3WwBa7q88uOk+KR7OUMay5+Mc+INM1kUKpWo5rrTYUJ+/0H9XyZICchvWe4RT77nNQTNYCvFwcXWEpjNraRNxYm6idfRqBp96jjELV5VgefvA1k5eqvVQ0bCcHpsfzissw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by MW6PR11MB8391.namprd11.prod.outlook.com (2603:10b6:303:243::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.21; Mon, 11 Aug
 2025 11:23:05 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0%6]) with mapi id 15.20.9009.021; Mon, 11 Aug 2025
 11:23:05 +0000
From: "Sadineni, Harish" <Harish.Sadineni@windriver.com>
To: Khem Raj <raj.khem@gmail.com>
CC: Richard Purdie <richard.purdie@linuxfoundation.org>,
        "MacLeod, Randy"
	<Randy.MacLeod@windriver.com>,
        Patches and discussions about the oe-core
 layer <openembedded-core@lists.openembedded.org>,
        "Kokkonda, Sundeep"
	<Sundeep.Kokkonda@windriver.com>
Subject: Inputs required on multilib patch improvements
Thread-Topic: Inputs required on multilib patch improvements
Thread-Index: AQHcCrD2XdZpv10/RUqdQR6gkdsHTQ==
Date: Mon, 11 Aug 2025 11:23:04 +0000
Message-ID: 
 <PH0PR11MB5658E5F05122F21E42A05313EF28A@PH0PR11MB5658.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Enabled=True;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_SiteId=8ddb2873-a1ad-4a18-ae4e-4644631433be;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_SetDate=2025-08-11T11:23:04.289Z;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Name=INTERNAL;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_ContentBits=0;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Method=Standard;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR11MB5658:EE_|MW6PR11MB8391:EE_
x-ms-office365-filtering-correlation-id: 6f1e1019-c7eb-4209-9d81-08ddd8c970d8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700018|8096899003|13003099007;
x-microsoft-antispam-message-info: 
 =?iso-8859-1?Q?otoMrqvMdmAYn9yq0G+slUgQTHUyaQW4A7llM6ahEMjsbJWxL/Vc+8XEDb?=
 =?iso-8859-1?Q?3z6HDpiZjD9yn07VY20V8s7sUYmQodL+JKyIjomloM1KwrfVap7VqDI63Q?=
 =?iso-8859-1?Q?tTzu8u0htxrmmw/XiaPtCwUGY2VwVaJlTgufyF6C5VWPyUDpVx15H31Wnp?=
 =?iso-8859-1?Q?mcobikzl3Xelr8Bm6HvidixaDZfIAetYuxzq0iU7aFVhvQQYKwH+OCjlzc?=
 =?iso-8859-1?Q?AnM0TodcMT6EKwH7EYO8HpUToQsg2FhVxxC3AFoM6c4E9VMGlj8PKFRJ0H?=
 =?iso-8859-1?Q?zlUS1+Cl+zBMYl2qHODJZ8P/JvR3mp5AEw7uat/SKCkr6/0e2zayTj4Ett?=
 =?iso-8859-1?Q?TAIPQ2qjkPexK2g08DX5e+YP2aLegd0W/MzvAz3R8Pp/MUM7zqmU8AqxkN?=
 =?iso-8859-1?Q?Id527+muPl8r2vIzdyQAtIcsDSJjcLxf3ag75wxGcnmXE6gvj701CzGzAY?=
 =?iso-8859-1?Q?WYTMBwiagks/Cwpu2wQ+B4jMdF7Ai7VB329oftjkMrtblGB4nyFLsdB7wG?=
 =?iso-8859-1?Q?wh4cyrsgKaxjjDFQ/tfT8Dv4SPxPyILPw3yViHWPArvgC2jQRwTAQ/FxzU?=
 =?iso-8859-1?Q?xV4mHzx8qSPeaTIS/DLkUWzUL+QnQquwo1j/2iOgYfXVmjiYd6jM4pfSOa?=
 =?iso-8859-1?Q?yB+cSGmqNY1HqFx/OOGfx7Y0/gPnc5nOw7nkVvi6QliVQGQiZxD5Relx5N?=
 =?iso-8859-1?Q?V+hqvbseLkY+Bf+P5dWxdB3xB24isXnUunLH1yKm7ucw8IeMWWVldDMpki?=
 =?iso-8859-1?Q?Ol5eGuPoS1UOKcf/Mf+ArtAI8ZrDoTSiCPwwRl/3w6oj9W+1wkbIfol6eE?=
 =?iso-8859-1?Q?nTxqrrPnQWOlxcLGlDDKFsLQmcYo0XGVwmfnl3xC6m6trY8Nws0lYJiSWU?=
 =?iso-8859-1?Q?ijxpBtW12H7xI3Ni3fBljUvOg099n0+bJH0cPAWRQaA7pwgc9NEk+KOqDw?=
 =?iso-8859-1?Q?gaGJx6AxyDNLvg/YH4czxeVJ89otD2YvTn+0AMsulIYCFDs07I3RASJzLA?=
 =?iso-8859-1?Q?MA9m0lq6rqggTCjaZB6aFL+iHLqIXh89qPEW7tJTjPuKpAslyWuJ5f0ncD?=
 =?iso-8859-1?Q?2o1q1htepKoYDcWAM/I+WMSnHMqPnesL4L8iratsgPWIQyf2KtcREkC58w?=
 =?iso-8859-1?Q?Tc7DcxsQczE5Uxa/BfI9xL8WjsefIUZYt7JkC1IN2R+VgD611rNY0aQdrS?=
 =?iso-8859-1?Q?vCVEmaaH2JWJI8hmaFe44Vej82+gUNcNkQ77metbkXBgapJq0C6YmCNy2o?=
 =?iso-8859-1?Q?8o/2hqe0YitiU8w5oHN6jrWhD+07fZiFJ++MWohHXbG/BW8wFLIfuGNrik?=
 =?iso-8859-1?Q?0eft9G6PSI4dmVGTZOpd000fp/3U0ZrIjbiC7P1xyOaE4ip5/3k+BYe4f8?=
 =?iso-8859-1?Q?ZwcoPLBUiPVdLZNHHqKpDeB0IA0Z9kva39HPOlH+0SjP8qSVgr5983kdfw?=
 =?iso-8859-1?Q?vOiR6qevsNaBOlfvH2MDYZQ9xLZ6M5JAwxV3cIIwL7JGOPltF5MOeuZt4G?=
 =?iso-8859-1?Q?PVgpnyAv7j3Elkd2XDw860?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018)(8096899003)(13003099007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?uKaJ64EMKKPSqUN0LKdJHaQqFEoUg4ICqiiP/IXHOElEZ4KKEdcSUnAkHE?=
 =?iso-8859-1?Q?1Gfb43HS6+xYtpVD+eD7iCUwv3D6ZkOxeo+tVcru+euZQNd6JKBmpZ7xkw?=
 =?iso-8859-1?Q?wqLS4sM0cTed7jUB4Ol2QudKzZVNBNbwKEzjzjKgMpBeSX0SQN3esVl7lt?=
 =?iso-8859-1?Q?S9gvpSIBIg3kokRvwd0kbN3P/pFqsAkhtK5BKArg6ifDGm2YbsFLQIPalo?=
 =?iso-8859-1?Q?7jcHcZSYXUkT+rlzuGY6g2r/ByiBbgHeREdRHx1nlwDI5a01JEwlX5ANaU?=
 =?iso-8859-1?Q?T3syJFPAGITi2Jfu8PBiyCr2MN+iCyhOxOet04S3fQos4iVCrIq0oZ0/LA?=
 =?iso-8859-1?Q?6lF0rdmpwu0Oe+3Px0+iu8uYY1XrLxhtDorYqLJ4lJIYxHXnO/fSWvLBQB?=
 =?iso-8859-1?Q?xYykt8Lu2PxydvjTUAWJpb0rKRM9cfCOGk8JKrx4c/qVi4JujRfv+AGafj?=
 =?iso-8859-1?Q?J3zg39vYku6mxTz4KwDxqXJiWhmsINNEtjFn/oMynObCE3NJj/PxRtBodM?=
 =?iso-8859-1?Q?NNJmEWcat1PqbJe1t4ynaYXTh5N6/GSz0WTFrKvgFsII4LMJCqszjJV9T4?=
 =?iso-8859-1?Q?HObQSZl6LndHkwB5EtugPeDvxRu25/0qrk00V/43/CgTI+qPTQSVNrz0g6?=
 =?iso-8859-1?Q?NmNDQjtWqltsnEq90W129VfImh78LQ4X2+F3jpEsJc5KaVpFwns37QZXW5?=
 =?iso-8859-1?Q?OnEFYUsEVo11flUqs+FZS8FxGZcGMOtOLYjiVuus49yrnAnigtkSECuFLg?=
 =?iso-8859-1?Q?Yx5eq9XQ/IXLHUf60cfEsVnQ1KYW4dVDOmLsqSGLLZFErA4AefGsQoSXNI?=
 =?iso-8859-1?Q?lOQ95rVbUJNdq3o7HxTzlpEqzCQ/MkCEFfIEE0r9Z+KUKfUYUiTOiisZQQ?=
 =?iso-8859-1?Q?Jb5q6g4AlR42pPNfKEyoK79ViINSkYZMvlOAyUkPET+1wGhlxhwGESOh9W?=
 =?iso-8859-1?Q?Z+m6pBQNcUKEcXd4JU4+isgxNMcDHA6bda2C+ZwiBD2uEf+05drbLJLT8D?=
 =?iso-8859-1?Q?36UKo1zR0ahaTvisSx4NhTX+g1oBddkr2Gx59ajiopi3p7rpoBgUvTAE9t?=
 =?iso-8859-1?Q?tUdogtZIs4X0FOOUHfjb6I06dymQ+8lVVWESVa4oJDzYP85f0IUf5etsLF?=
 =?iso-8859-1?Q?l6OTvQ2h8+dhwjils8IUpIujsZG8Z0/F5gtT6NH9uTzu7brpNizIQrqy9r?=
 =?iso-8859-1?Q?oVCUSf3zV9/F0DRztrRHxO8PMTbXN4oNcdpCjflSY2XLwkS87Q2FVDUIYg?=
 =?iso-8859-1?Q?T374a1P1RTHsBxbDaw0hel8vCD8mGMpOS/TstnWbLzO7Ne2vBasdxdgTq9?=
 =?iso-8859-1?Q?eiQN2Shwwsn3G5Qi8C+gA1qNDpDy85v9Ksv04A8gIzMWSLDZcbz5KCUg23?=
 =?iso-8859-1?Q?piMXAYs5ZZBJNHzJ0+xY3mf4e/FuJH5/QYeriu7zLHxlhJJchzwPA6xUGa?=
 =?iso-8859-1?Q?rWm9Cn4mAo+/41xgrReaehGVPk1+Aa+Rei939kE/z+Ds/WCF2469OY9pbl?=
 =?iso-8859-1?Q?0y3lN6ENQN+J4Yba7E4yUDeIgIrx7Q6NL/jaZ/MPqRHYZ2HWI1i892i15K?=
 =?iso-8859-1?Q?61ZoXIl4du3LzrYVOKslVz5SIIGD7ifRPPtptnQZHRBmTkm1lvNrFwOHxw?=
 =?iso-8859-1?Q?6t/aJgfeXUPVO84Tzk3eWumLZBNgXdJSwmhaqr8GLDYbIpYJ4Y5gi59A?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: multipart/alternative;
	boundary="_000_PH0PR11MB5658E5F05122F21E42A05313EF28APH0PR11MB5658namp_"
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f1e1019-c7eb-4209-9d81-08ddd8c970d8
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Aug 2025 11:23:04.9254
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: at6NSh8g8zAQlvfZQGX+URW9huc/BdCLsG2w8qYco/70x7rrmeS91+bDtpBNgRa1PgIwGUp0N/LAp+N/kBbC9XyZ1htMNJXpC5LtIctPA5M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR11MB8391
X-Proofpoint-ORIG-GUID: ITc-DnejBKfSn20kApKeW7RYISGmjAK0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODExMDA3NSBTYWx0ZWRfX3S7YhJatYCvD
 Uqz5pssFYtX5FfsoX+h4Evgp8KLATQ08EWjIMHFdsKcD5eVQUZOWT+VNUMjz9FOe4O1j+8EXgWg
 TU5xTbEh5aJxgPl6GFvGxJJFcIFsBYjnDNAuLGytlzqXaaMyhfRKisEyot4nwTYWSBj17oWmKip
 giwEmeFdnz7w8PT3ofemsRBsD/oEFGeDkQPLuVvWwQMLtyy5p+v5oFLluAe6BX5VLC4NrR+/hOg
 71VR2noYVMCx6BBYcSxWx2/xKAP/g3naWF1tlinJc0V08YgQ0znY8n5/xHO6ICvM8C3viTeTX9Y
 rfJMXgCBqW9Zp+duH+jvm/6CByV4TpwT/LV8qM/mDWcupP7DXwSBsSL1FFyfZw=
X-Authority-Analysis: v=2.4 cv=ZKTXmW7b c=1 sm=1 tr=0 ts=6899d29c cx=c_pps
 a=3w+TbvVJ0pkczneH0cxqQw==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=2OwXVqhp2XgA:10
 a=Q4-j1AaZAAAA:8 a=AzRvsRTxhiAW5DSvXccA:9 a=wPNLvfGTeEIA:10
 a=IFP_ZR2myz7AG5pAGdwA:9 a=S5uEswrzWwl_tyVE:21 a=frz4AuCg-hUA:10
 a=_W_S_7VecoQA:10 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-GUID: HFEs15mMmnvQ6QqWRDscqEByX7qHXi46
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-11_02,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 phishscore=0 clxscore=1015 impostorscore=0
 malwarescore=0 spamscore=0 bulkscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Aug 2025 11:23:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221732

--_000_PH0PR11MB5658E5F05122F21E42A05313EF28APH0PR11MB5658namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi Khem,

The following patches removed from master next, We heard from Randy that, b=
ased on the
discussion in the patch review meeting, the following patches can be improv=
ed before merging.
He also mentioned that you would be explaining what improvements can be mad=
e.

https://lists.openembedded.org/g/openembedded-core/message/221109
https://lists.openembedded.org/g/openembedded-core/message/221110
https://lists.openembedded.org/g/openembedded-core/message/221111
https://lists.openembedded.org/g/openembedded-core/message/221112

Could you please let me know what improvements are needed?

Thanks,
Harish

--_000_PH0PR11MB5658E5F05122F21E42A05313EF28APH0PR11MB5658namp_
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
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Hi Khem,</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
The following patches removed from master next, We heard from Randy that, b=
ased on the</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
discussion in the patch review meeting, the following patches can be improv=
ed before merging.</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
He also mentioned that you would be explaining what improvements can be mad=
e.</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<a href=3D"https://lists.openembedded.org/g/openembedded-core/message/22110=
9">https://lists.openembedded.org/g/openembedded-core/message/221109</a></d=
iv>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<a href=3D"https://lists.openembedded.org/g/openembedded-core/message/22111=
0">https://lists.openembedded.org/g/openembedded-core/message/221110</a></d=
iv>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<a href=3D"https://lists.openembedded.org/g/openembedded-core/message/22111=
1">https://lists.openembedded.org/g/openembedded-core/message/221111</a></d=
iv>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<a href=3D"https://lists.openembedded.org/g/openembedded-core/message/22111=
2">https://lists.openembedded.org/g/openembedded-core/message/221112</a></d=
iv>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Could you please let me know what improvements are needed?</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Thanks,</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Harish</div>
</body>
</html>

--_000_PH0PR11MB5658E5F05122F21E42A05313EF28APH0PR11MB5658namp_--

