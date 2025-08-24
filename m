Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BBFBCA0EEB
	for <webhook@archiver.kernel.org>; Sun, 24 Aug 2025 14:01:51 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.27])
 by mx.groups.io with SMTP id smtpd.web10.17270.1756044107130516654
 for <openembedded-core@lists.openembedded.org>;
 Sun, 24 Aug 2025 07:01:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=bIyOmPAy;
 spf=pass (domain: siemens.com, ip: 52.101.83.27, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hH3xG65Cn44u0tLiTzn6PcGbeNHbgpObsGb0XPOYKS+tS6nDYyATWh13hcDKAHnHtyxRQ0Cz7XLMgT6ihkCJX/QB0DRohfucHs4hifVJfk+SpTAyuUX4w673Cu/jt7WNfq4H4L7Ks2zhdo/YGCSXJt2n7UEerH8v031nSbuJi0IK+Yt3SKqbz2feYaitxrPqs71tLFqv9on+j7NbjwRfXImL+T7iRwdDqvF2XSHnZnj4Rot6/9MBskJ+fa2X6ZuvnM/qJA8JalY+TbrZkRnOc6oCAuLmpbcMMvpcgMENbdNdUPSkYtG21qJMHYK9KxMe/+Z0MSgkzTdAExzHz+aw7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e+Tz/KJy3PPUh5DPgX1WJ793uQzW1NfkSss08iM6e3I=;
 b=KwX7IY8vb6XfXtODipeSbrmEqUI5sBQ4i6+dbtPCqCMbUL2QQ7qF/MrwMU32l+wIIvIUKf1kD3OGpNjTfXn6LDbPhIa2YQg+E2n7Bub89ha4uQ2ZkqPDp/Q39ajCdD+BCOrv+1uSaE2xoeeJyzdh3xXm4lnKyJxdVv9afFUQRC5H0Lw/wNvrVObaKwJbvXbDt3y36tzKpPcBB+CzadwE16TySzoJRO52IA1Je6yNuaQwq0rFPU9RWIc/aP4NJ4m9WW1AHqBOXPxK2uuxT/lez99ZlKeUAsoUQhuNJxN1gEcbjPrRsbHqjLZ4C9JG0KVus96ZCi5RvSfH2zAxMaEALw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e+Tz/KJy3PPUh5DPgX1WJ793uQzW1NfkSss08iM6e3I=;
 b=bIyOmPAymYNcgGOSAhnC0R90sBg2mVPZSqQyykvJtlZIrZG3w7PQYRJCGrKfp9cEIZzhzNx6R6uo12o9QRWDh53Ul+nfbf4f6xH/PeKu+hLu9hSTS3rPoGRXz/IFdBSxFnu1DC/+Ek97Nh6Y6MQ0ctk1yS59MMcNB6L25ab5d3YOu0jYcizlwJGAcnkO4YxoPsQ0N9hvXd7yng2kaAWHLUYmoL/fX7opbF3kaG8GdJWQ3Q24u2ajqjhkDu7OFlX5IZxj60B6o7cYHgPunmir1bCVwU6KXJoiFm4jQCNSg7KMU2EOB+uIwVYeG98hNK5kY4dI7U9xlf28iHRNtGz4Yw==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by GVXPR10MB8298.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:11d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.14; Sun, 24 Aug
 2025 14:01:40 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2%7]) with mapi id 15.20.9031.023; Sun, 24 Aug 2025
 14:01:40 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: Gyorgy Sarvari <skandigraun@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core][kirkstone][PATCH] qemu: set ststus of CVE-2024-7730 to
 fixed
Thread-Topic: [OE-core][kirkstone][PATCH] qemu: set ststus of CVE-2024-7730 to
 fixed
Thread-Index: AQHcFPfYOa1XqjnMokO/+b65J7EGI7Rxx/sAgAANMlA=
Date: Sun, 24 Aug 2025 14:01:40 +0000
Message-ID: 
 <AS1PR10MB56975BBABFD85501239A88C8FD3FA@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20250824130514.1094962-1-peter.marko@siemens.com>
 <324039d0-090a-4bd0-b765-f3afe37317c2@gmail.com>
In-Reply-To: <324039d0-090a-4bd0-b765-f3afe37317c2@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=07136ce1-729b-4314-bb10-bb1b1b0670ca;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2025-08-24T14:01:15Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|GVXPR10MB8298:EE_
x-ms-office365-filtering-correlation-id: 035b3bd3-7832-4d5f-2609-08dde316c007
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|1800799024|4022899009|376014|7053199007|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?NUdLNG9iRWM4SU8rMzFvanRFb1AwVnV2VTNyQkU2SG9HN1JtcFpnNy9BZWEw?=
 =?utf-8?B?Y2w5ZGo2NnlsUXlHamIxclF6NGN1eSs0a0VCTGxRb3lUdHMraklYNkVYOVBu?=
 =?utf-8?B?TmdkdDlKOExwM0J3RW0zbGtLZnJyclNhK2VTclM2UytlMVVGSVU4bUsyL2Ev?=
 =?utf-8?B?L0hzN2ZQRFppelgwSVhkRkd1emtweXdacUZCYzJ4aWJWY005a1IzRDUwUWxB?=
 =?utf-8?B?b1JRanU0WWJ4cjdQSEZYa2l0YmkxblFQUndCMmxRRVoyU3Voc2MwNm5aT0xZ?=
 =?utf-8?B?dnN3R3g0MzJXaEFWYm5jMm92OHVvd0NvWWhTcEJhNXBVSEJlYVJJOVlpcGtT?=
 =?utf-8?B?YXBpREtHTW9OWE90c2dJYnZ6dG5IOXd0VVJoYzNYWTNNaVpFTHB6MGJva3dP?=
 =?utf-8?B?VlphaVBlZURmNWJmUHY2WEdnci9WYUdncGp4NXhpZkhjbWdjbjl0Q1h1TzhH?=
 =?utf-8?B?QXNxWWRDb0VDekxqK2FDeGdsWmlMODlJcEc1QlZhOENzN1pNU3pFUHBBbUFn?=
 =?utf-8?B?Y0JidmthajZ6WGhZVVE1b1JNZWpuK1U0K2ZNN3c5THkvQmNONnNvbE54cm1r?=
 =?utf-8?B?aDNERlpnRjhpcGVDM3YrMzBUTDcwOXE4ajJXVFVYOXBFVmpMZXFWOU9xcW1n?=
 =?utf-8?B?ZU1sRzFId2szOGIwMzRFY2VLSE5UemJ6WVQ3ZzMzaU4zZG9PVXdrTGwyS1JE?=
 =?utf-8?B?N1AzeWt2SnlFUDhxQ2cyNWJvaldIUURJalU3RXk1aGtlZ2tsc0dsQ1pSdmtJ?=
 =?utf-8?B?TUZYWmZ2NC9TNGk0YjBMWW1IQWFhSmFzblUwWTZvT0pKU1dDbkJlbHZCbW1n?=
 =?utf-8?B?NFk0SHVCdHRpSTFKR0piVnREMWlDMVoyTXdidUwrK0RweDhlemlsOXZkdm5N?=
 =?utf-8?B?cnR6L0MrTE8wTW1Sa2NlT25UYTJnZnV3UUs5ZzJXbDNGU3FYZTUyYVZHTEhx?=
 =?utf-8?B?QW96a0Y0NjkycEYwUGY5NnVqcG01K09yV0JFY3krK3NFL204TEVjMDErZUtH?=
 =?utf-8?B?VGRkMUZZaDVyVHBYOEs4VSs4ZkdxU1hvNG5DWlpFRmViKzc0VW95YXgrVWtq?=
 =?utf-8?B?ZGZ6aHNIckgyVFNLQW5Gb252bzMrVVlud1FZTUczM0xTdG9oSkIwazE4WEFU?=
 =?utf-8?B?eVpadVArUXZIVytFK0xLVWdVR2xHWTlDYnZqN2ROWDc2TzA5KzU5aGFXOGVk?=
 =?utf-8?B?aVV4aVQrMWxGT05LU0xCZ3VpWTdaZmltYUZXUFBQN0pRZ0RnZGlwdmV6TDZN?=
 =?utf-8?B?T21JSjhwR0N5cXpqbUpHRzdrRVF0K0d4SVAwVjYybTNHUGV5S215VXI0Y1JM?=
 =?utf-8?B?Q0U5RDgvNmJ1Ui9qQzZiNDd4azZXV3FrYzVLOTJLbVVTMTQ4U29mNDNhaDJv?=
 =?utf-8?B?SG1aclAxUjhWdkc5YU9KVEJkVDJlV0tzdzVPSEZMQTBPckxHWFlyYXFHdjlJ?=
 =?utf-8?B?SWN6eEMreFZFSktYc0FsbmFrU1BlNWxhaS9PSXk4L05HOXFyTm90MlFKRnlC?=
 =?utf-8?B?TkhydDNGSjExcGJtaVZJSmxaYTBvTXcwSy9HSVVxRnM5QnhKV2FvT014RFFx?=
 =?utf-8?B?TS84L0tZOHI2MnpuOHZOeWRweXdwQm1sdm5DdFNVZllxenNFSUFQWWdERFFL?=
 =?utf-8?B?bVV0U2RtM0hBVlprRE1WS3B1ZTBGZTBWc1B3T0oxc3IzdDR6Wnl3U2hCYWFz?=
 =?utf-8?B?T3M0eTgra2ZaaTFrMmxUR3FmaHN4ckdLcEZpb21pNE1TNWdTc0p3VGVnTi9Z?=
 =?utf-8?B?ZW9iY1VhWTJ3dlJ4S1F0amZneURyUzdocG83T2U3SkVQdm8wYmc1Q0RJRHlm?=
 =?utf-8?B?M1JzbGVJWk1zTmJkbnRtVjBQMWFYeGVTYVNEOWt5eFpQb2Izckc2K3NwQUJX?=
 =?utf-8?B?RFJjVDlRdkQ4d0xJZVBZMTluc1ZtYStybGdlaHJFV3kxQVVzMmM5eFRKQm1m?=
 =?utf-8?Q?rOJJKqb4t7w=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(4022899009)(376014)(7053199007)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?WCthUlNxV1NCeEttM1RxTHcrZmI2a3FUUWxod1BBcGlDNUI1YUdic0V6ZVc1?=
 =?utf-8?B?djBtVHJ2ZXVKVFB6WmxrY3hxeEtXWTBPUUEvT3JFNW00UDV6WGFrWG1ySitw?=
 =?utf-8?B?R3RTZkk4WmoxNE52SnJSWTJBWmxaY3V4dnZ6WWsvYlBORnBoVXB2K2Q1Nkxm?=
 =?utf-8?B?YVFqclduRy9OTjdqenN5NzJKbURFQ2ExQkF6VHJDcDJuR3EwdFlHVTY5ZG95?=
 =?utf-8?B?R2VnQjNGSGhHSHpMNVVLOXhLOXI0MHViS0F2UEtDZnVWOWg3bmZ4TjZBeHNO?=
 =?utf-8?B?dlI2V1dQRWIxTnZHNStzMk5aMVpRZXlSdXB4OE9Hb2xPZFprTkRYMThpTXVT?=
 =?utf-8?B?M2tNS3hqVVk0THk1c0picGR1WWIyUEZvRytEUlg2S0FRalFUQUpUa21FYmx0?=
 =?utf-8?B?U0xYZnhZNkRBYlFac3JuZEtQZ01zeU9CeStJMEdhMjNzeXRyYjFIVlhyWVBu?=
 =?utf-8?B?VzhjZ3Vqb2dGT3V1K0ZKTjZRSVllL2lwMlBqaWJXUmw5ZDVMcDcweTVwUjh5?=
 =?utf-8?B?ank3VnJVcGVjUzNPajFFanZ0cTJwMUtpclhLdDJ2TElhWG5GS25uVjBTUnVR?=
 =?utf-8?B?UnhWcFFJREcvbnFnVnEyendINDE4b0RWemVGV3lRS2duMTF2SGxoUTl0RmE0?=
 =?utf-8?B?bFEzUFRJUElxR29ZWFdlRmM4RDcwTkorczEvWjB0ODJpNDNvMmRLN01SK2pD?=
 =?utf-8?B?aDkvTUlSYzdnUzJ2QXVqN0xxc2F1YS9qbGVoQUg4emZES0ppdjhJMk8zditI?=
 =?utf-8?B?YXllTWNFQWpIWEFRZXYveTluU3NZRUVYY1Q5eEhqOGxsZDNQclZtNUxmVkpu?=
 =?utf-8?B?MUpZZVVXeHdRSEcwbGU0SEJKNWtnTUhXTmhwUG4rcm9zT0dIdjVycmJxKzF3?=
 =?utf-8?B?bFFOR2l2c1E2MEt4YUNuUFhrYThheEVxTGlCL040UFpRejVoUEJwZkxhaVJF?=
 =?utf-8?B?TzZNNmJQVnRUVmh0eGp4dW53SWNudXgzb3VkYXlwRmtrYUxHTVVueFErV0Zj?=
 =?utf-8?B?Sm5vS05SNVk5cFRwODR6bU1pTUxmOENMQk84QWlyaEg3NnZoUDNEM1M3OEhE?=
 =?utf-8?B?a0d3Y0dac09ZaTRvTVRDZ0J2WS9iSFN6R0JaajFEb3FQSzU2c24vYU1qelZj?=
 =?utf-8?B?L25sSnlqNDhVSTBxaUhtbWNVY1ZqdE5LT2MrWlVWZVovKzBNN2dtUlF1UWx2?=
 =?utf-8?B?MlZZaG9tRlVQU1Z5Y1diWmcwUzNnSjBuYjQvb1IvUW1XVHpoVG51RUUzcXM2?=
 =?utf-8?B?M0ZWb0tVa3plU0tEeTAxOXZudUdDL3N5TkFhVTMwVVdIYm84Z3hOSWZLTkkw?=
 =?utf-8?B?dXJTMTJkeGZNYU5rY2tkNWRCL1Q4d0JBWVRwWk5EWENIMi9tZjJHMUwxZTFW?=
 =?utf-8?B?T2FmZFhpUUZmWHJRajV1bXR2V2plMW9lTUlLdFJ0UGhZb1cxYXNsd2tJYllK?=
 =?utf-8?B?Q3dHczFDNlQyaDVCZXhQMGxueUFGbUZrcjc2RnpjM1Z3Vk91TnhtMUFxdkJW?=
 =?utf-8?B?OWtGQ0IycGFCdDVZMFZSQmdBZzdtbzZzTml6WXUzSzhra1djdThKWWx4b213?=
 =?utf-8?B?MXhYV2dEQWtialZUd2pnaUFhSDVpQW5zdHo1MmVnbXBKYldJR3hienNZVDlC?=
 =?utf-8?B?TlkwWTRZb3lzK3NiNzdBMEROMmpwSW84QjhSeE5IMHpWUWZsNjJEclBRSWNC?=
 =?utf-8?B?L2d4alpHVWxGdFR2dEkycmJtRWNzdkUxSXBuUWwybzB6VjdLUDV4MHEzdU9m?=
 =?utf-8?B?bW9DQUFScnpwVElza0xHWmkwdUJ2MTZsdHh4a1JFUU4zd2NMOFZZVWg3Vmc0?=
 =?utf-8?B?S1AwUEcvcW1tb2dVeHdRdFRleks5V1QveGpONFNZdWhpZUQxZmkrbndyejNr?=
 =?utf-8?B?TjVqdzdtdGNhZzJGaHNJTS9BZ1BaYysvaXdlUlBlNGVCU0hRL0pYOE51T0o2?=
 =?utf-8?B?SUJnZFJpaTlVbStWV3RMckZibkszSEtXcmJEUzN0MTBKOEt1eEd5dHc3Yzhj?=
 =?utf-8?B?NHZ0UDBGMTYvNitnOG5vOXQrQ2lBSVd2VHFmQjFteTdZNWxqTGh5Y05YUDZ3?=
 =?utf-8?B?dVgrL1MzZVJMOHE0U3lRN00rZndjRllnSlc0dTV0SFc1Q0VEb1MzS0dqaFJv?=
 =?utf-8?Q?iAjCqfOVItr7Ca68uyOOAb4ED?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 035b3bd3-7832-4d5f-2609-08dde316c007
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Aug 2025 14:01:40.6678
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EWzVhH4iBVpbqYDP/44bsAdZX3DNiSS9K2HlfjvcW0NXz/vvk75VcZd5zFyAs82bCQKStcmPb7RBA/f0vjUCvA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR10MB8298
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 24 Aug 2025 14:01:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222375

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogR3lvcmd5IFNhcnZhcmkg
PHNrYW5kaWdyYXVuQGdtYWlsLmNvbT4NCj4gU2VudDogU3VuZGF5LCBBdWd1c3QgMjQsIDIwMjUg
MTU6MTQNCj4gVG86IE1hcmtvLCBQZXRlciAoRlQgRCBFVSBTSyBCRlMxKSA8UGV0ZXIuTWFya29A
c2llbWVucy5jb20+Ow0KPiBvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3Jn
DQo+IFN1YmplY3Q6IFJlOiBbT0UtY29yZV1ba2lya3N0b25lXVtQQVRDSF0gcWVtdTogc2V0IHN0
c3R1cyBvZiBDVkUtMjAyNC03NzMwIHRvDQo+IGZpeGVkDQo+IA0KPiBPbiA4LzI0LzI1IDE1OjA1
LCBQZXRlciBNYXJrbyB2aWEgbGlzdHMub3BlbmVtYmVkZGVkLm9yZyB3cm90ZToNCj4gPiBGcm9t
OiBQZXRlciBNYXJrbyA8cGV0ZXIubWFya29Ac2llbWVucy5jb20+DQo+ID4NCj4gPiBUaGlzIHdh
cyBiYWNrcG9ydGVkIHRvIHY4LjIuNyBhbmQgYWxzbyBpdCBpcyBtZW50aW9uZWQgaW4gY29tbWl0
DQo+ID4gdXBncmFkaW5nIHFlbXUgaW4gb2UtY29yZS4NCj4gDQo+IFNjYXJ0aGdhcCBoYXMgOC4y
LjcsIGJ1dCBLaXJrc3RvbmUgaXMgb24gNi4yLjAuIElzIGl0IGEgdHlwbyBpbiB0aGUNCj4gY29t
bWl0IG1lc3NhZ2UsIG9yIGluIHRoZSB0YXJnZXQgYnJhbmNoPyAoT3IgaXMgdGhlIHVzZXIgZXJy
b3Igb24gbXkgZW5kPykNCg0KVGhhbmtzIGZvciBzcG90dGluZywgdGhpcyB3YXMgZm9yIHNjYXJ0
aGdhcCwgbm90IGtpcmtzdG9uZS4NCkknbGwgcmVzZW5kDQoNCj4gDQo+ID4NCj4gPiBTaWduZWQt
b2ZmLWJ5OiBQZXRlciBNYXJrbyA8cGV0ZXIubWFya29Ac2llbWVucy5jb20+DQo+ID4gLS0tDQo+
ID4gIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9xZW11L3FlbXUuaW5jIHwgMiArKw0KPiA+ICAxIGZp
bGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3FlbXUvcWVtdS5pbmMgYi9tZXRhL3JlY2lwZXMtDQo+IGRldnRvb2xz
L3FlbXUvcWVtdS5pbmMNCj4gPiBpbmRleCAzOGVkNjM3YjkzLi4yMjBmMGExNjFjIDEwMDY0NA0K
PiA+IC0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9xZW11L3FlbXUuaW5jDQo+ID4gKysrIGIv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUvcWVtdS5pbmMNCj4gPiBAQCAtODQsNiArODQsOCBA
QCBDVkVfU1RBVFVTW0NWRS0yMDI0LTY1MDVdID0gImZpeGVkLXZlcnNpb246IHRoaXMNCj4gQ1ZF
IGlzIGZpeGVkIHNpbmNlIDkuMS4wIg0KPiA+DQo+ID4gIENWRV9TVEFUVVNbQ1ZFLTIwMjMtMTM4
Nl0gPSAiZGlzcHV0ZWQ6IG5vdCBhbiBpc3N1ZSBhcyBwZXINCj4gaHR0cHM6Ly9idWd6aWxsYS5y
ZWRoYXQuY29tL3Nob3dfYnVnLmNnaT9pZD0yMjIzOTg1Ig0KPiA+DQo+ID4gK0NWRV9TVEFUVVNb
Q1ZFLTIwMjQtNzczMF0gPSAiZml4ZWQtdmVyc2lvbjogdGhpcyBpcyBmaXhlZCBpbiB2OC4yLjci
DQo+ID4gKw0KPiA+ICBDT01QQVRJQkxFX0hPU1Q6bWlwc2FyY2huMzIgPSAibnVsbCINCj4gPiAg
Q09NUEFUSUJMRV9IT1NUOm1pcHNhcmNobjY0ID0gIm51bGwiDQo+ID4gIENPTVBBVElCTEVfSE9T
VDpyaXNjdjMyID0gIm51bGwiDQo+ID4NCj4gPiAtPS09LT0tPS09LT0tPS09LT0tPS09LQ0KPiA+
IExpbmtzOiBZb3UgcmVjZWl2ZSBhbGwgbWVzc2FnZXMgc2VudCB0byB0aGlzIGdyb3VwLg0KPiA+
IFZpZXcvUmVwbHkgT25saW5lICgjMjIyMzcyKTogaHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQu
b3JnL2cvb3BlbmVtYmVkZGVkLQ0KPiBjb3JlL21lc3NhZ2UvMjIyMzcyDQo+ID4gTXV0ZSBUaGlz
IFRvcGljOiBodHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvbXQvMTE0ODY0NzAxLzYwODQ0
NDUNCj4gPiBHcm91cCBPd25lcjogb3BlbmVtYmVkZGVkLWNvcmUrb3duZXJAbGlzdHMub3BlbmVt
YmVkZGVkLm9yZw0KPiA+IFVuc3Vic2NyaWJlOiBodHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5v
cmcvZy9vcGVuZW1iZWRkZWQtY29yZS91bnN1Yg0KPiBbc2thbmRpZ3JhdW5AZ21haWwuY29tXQ0K
PiA+IC09LT0tPS09LT0tPS09LT0tPS09LT0tDQo+ID4NCg0K

