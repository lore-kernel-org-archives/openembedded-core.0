Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E900C021A0
	for <webhook@archiver.kernel.org>; Fri, 14 Feb 2025 01:55:06 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.10992.1739498096680392342
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Feb 2025 17:54:56 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=4140fee6b2=qi.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51DNuIpc013966
	for <openembedded-core@lists.openembedded.org>; Thu, 13 Feb 2025 17:54:56 -0800
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44qwy6ks4m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 13 Feb 2025 17:54:55 -0800 (PST)
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 51E1stEi022626;
	Thu, 13 Feb 2025 17:54:55 -0800
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2045.outbound.protection.outlook.com [104.47.58.45])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44qwy6ks4k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Feb 2025 17:54:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LzXSJKungsaRcSwVwkGWzWWvf/c4XSH/27h+qnrzvLiT5QvOrDHnD/zN31otXbFytmxLB+bIAxeo6j3EPg1i3g6fJFe/qyKnFFyA9786k+ugbsrlzFGSNLtBPkZHK25sZPPYBvoE9nz9jOvlAId2rE+fYOpOaApwifqv0J1DmXaDbNwq5Pa6+szVAl1jP+PuSIdY+7/tVxT4yQEYHBMQo4CEkZ4Z9iiOcczHuCzu7Eqz4sfAXYZPLO3SXpP00e7mG2gb9I91gejqDeVTC0ZfqOaahYSB31dsnuoCdpaY2GeduYN21tns2wfi0kawmnzob5uXtesg/q4ttxtZWoS/Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Upx2WuTgEt0RdzpMN2d5Ck3QJ3BiypG86EtH5/mgNBQ=;
 b=Q8qRtCpfVtY1sFRtPgDyYaGwWkl7DWqJm5zd//TcE9WOSRZE1W4dQ7S2efNFuEMOHSsqlCcU8M8L6JECVCAoqbkmmXojKo/Mb716u8Fu2YADc1JPKNOpb294Kcsa0dMlZHhs9vIv/oa07kQ8lwj77wzn6avJfZbZOCbjk0H9sJwjiKSdG3NRXjGsIZ+kW9yLClEWoisD+pTze+J7uTRwXiH+Gf8XsS1tmnitXOB6ZCpZLybczFQW9kkGmPN7m8ApnxOJ6ImJ3cTgIuXJeRBC9iy0YfCWHcEIV5bD2fYeqdqV+9QMhpAQlOPt19U1DIVlVa9K5sGcUxrgWAVKFvOkzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB5613.namprd11.prod.outlook.com (2603:10b6:a03:3ab::12)
 by BL3PR11MB6506.namprd11.prod.outlook.com (2603:10b6:208:38d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.18; Fri, 14 Feb
 2025 01:54:51 +0000
Received: from SJ0PR11MB5613.namprd11.prod.outlook.com
 ([fe80::615c:ca2f:d093:16a9]) by SJ0PR11MB5613.namprd11.prod.outlook.com
 ([fe80::615c:ca2f:d093:16a9%5]) with mapi id 15.20.8445.008; Fri, 14 Feb 2025
 01:54:51 +0000
From: "Chen, Qi" <Qi.Chen@windriver.com>
To: "mathieu.dubois-briand@bootlin.com" <mathieu.dubois-briand@bootlin.com>,
        "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core][PATCH 5/5] util-linux/util-linux-libuuid: upgrade from
 2.40.2 to 2.40.4
Thread-Topic: [OE-core][PATCH 5/5] util-linux/util-linux-libuuid: upgrade from
 2.40.2 to 2.40.4
Thread-Index: AQHbfdyLckh/QV1vnE2IUxkvNOF9dbNFPAKAgADPDyA=
Date: Fri, 14 Feb 2025 01:54:51 +0000
Message-ID: 
 <SJ0PR11MB56137330BD1EBC897BB56AA1EDFE2@SJ0PR11MB5613.namprd11.prod.outlook.com>
References: <20250213060000.1092285-1-Qi.Chen@windriver.com>
 <20250213060000.1092285-5-Qi.Chen@windriver.com>
 <D7RCUCDJ0P1A.2V3UWW92HAQV@bootlin.com>
In-Reply-To: <D7RCUCDJ0P1A.2V3UWW92HAQV@bootlin.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR11MB5613:EE_|BL3PR11MB6506:EE_
x-ms-office365-filtering-correlation-id: 2f4f58a2-4663-4810-1a32-08dd4c9a9203
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?QmFHTUR4Y2c1VGJXcjJIbnJibDFxdXc4SVlmN1FqZXBvL1M0bUVGRmNxbTFh?=
 =?utf-8?B?SUovUVlmM004b29xdFh3d0J1SXRPTngxUk5ndGVISWQrYWxRdjRrVVgxZDYx?=
 =?utf-8?B?d0NtV1B5UXRDalRCYVNKeWFHM3pBZmpNYWpBVG9sakY0STZlZVlNR1FXbUEr?=
 =?utf-8?B?U1haZTIvRzBLVDg1RmQxQ09hYjREQjBkdFRwbG1hcm94bXpSck5xU05xd0Z2?=
 =?utf-8?B?aTg2amZxRTB0WTNNdXBVOGNDNXY3NWp5UXdQTmp5ckNQUnV0b1VJaDJpWVZ3?=
 =?utf-8?B?NWVxajFCbHZQMldZZmYrc0hFNXcrNnZaejRJYXRVcitRa2w4elVsYUY1YWxl?=
 =?utf-8?B?TG43N2ZxQk82MS9UNGcxZHcyV2lZYStUUmFrU1NIemRLZ1FGTTFMcmtYOFRK?=
 =?utf-8?B?TjZYVXVXV3FTcTZqMWtZREkxd2JVWG5Gckt4M1Z2VEt2QlJTSnhsVU92a1VN?=
 =?utf-8?B?ZituZ1N2K3hyQ0JWUEFoa0FXb0RwWWNSWktIWW4xZUNtYkJlNWo3a3FYaHZ5?=
 =?utf-8?B?a2VTd2ZWUTVRTUoyazE0QU9naThRTnpxY0xNMEY3WDl5eXBrRkxSMnV4MFZI?=
 =?utf-8?B?amVTckJWVUVrZVlKNnlhZmdnTjV3Z2ZTcE1TUmlKcTdhS1dNWktGdFQ5M2d3?=
 =?utf-8?B?bGhyOVFxV2t2ZjRGZmYrdFVCL3pWOWxxdktObHJwd3dOa0pKM3k0RGlwVXpu?=
 =?utf-8?B?OFNOb0YwaU9oN2diZ3ZOWVRMUW1DNUh3RW1US0VjeVI1UkI4K29jSzM1YUlx?=
 =?utf-8?B?OEZoUXV3Y0RtQlVLSkpVWTFKby92RjdJNEY0VVNkWTlXc3hZRXZKZ0xGVWJk?=
 =?utf-8?B?T01JUEhJYU04T2oyM1FzdFhNSjQ5ZWR2YnJ5UXFyUkRtbmRmYnY5d1NKN0Jx?=
 =?utf-8?B?UDZTc3pLYnNIVFk2Umxxa1hnRU9CY25XRHpvZzU0ZFZTNFJGaXJlVmJqUDli?=
 =?utf-8?B?Mit3czVkV3h0Mkp0cjMyQ1FNVEM3RDBNV21QbG85aEhxRjBHYll6QmRRdUFo?=
 =?utf-8?B?bC9ZY3BZZWxnVmhtalF0M2ZWR1dZbWVGNGVDQ2pkSVdhd0FiMlV1WlNwTW9P?=
 =?utf-8?B?Q3ZHV1dSc0M0cjMxVTRPb0d0MXdhbUl0bmM4STdzLzkrUWVTbTVLUmMxcXBB?=
 =?utf-8?B?VG96N0NUSlE5bXRXTXRoSVJKTWpqeXVYbnVwZFBQeWpGbllET05DTmFFU0JW?=
 =?utf-8?B?RnlCYXhxSndSZVZzVDh2c1ZXZHVjK1RhUUM3UU00OUt0ZlVzeU1DTmdqeDVO?=
 =?utf-8?B?azZmMCtPT3p2UzNTRTFiOUFGYXZid1lqV2pzY0oyN0k1TUhWaVVpcTA3Zk1u?=
 =?utf-8?B?SjRZeitpTHltZDZDWFZDR253WjVDWXVnenpIK1k4VFNOMzNjZ1VyRndPdFdE?=
 =?utf-8?B?QkFHanZQUjZUZzhocDdaWVh5UDlvekhnQTZXOGlnd0piKzVzNzdTcDUrNkVj?=
 =?utf-8?B?OCs2b3gzNmk3WnFhODNMNlc1SDhwd0pNU2lHK0wzeVM4aEpUazduNlZ2dW44?=
 =?utf-8?B?b1FaT3Y1QTkyWnBQOE1VM1NUbkU2NXdJRStBYlBxRS9scC9EN3JKSDVtRUxC?=
 =?utf-8?B?SWxxU2REKzBlRWZkaDJ4WlJCaDQ3WUlJeE5lcHVFV2ozWEd6dkFaWDRiRG94?=
 =?utf-8?B?Qyt3SmlYUlphWVBac0lhVHRTdEdla2lHZXR2aE1QWFpxWUtNK1dVSGZhOFUv?=
 =?utf-8?B?TkFMREgrKys3R2F3WFl1OWUyeERkT2RIbUhsR1orWFpLamdVYXJBa25oRzlz?=
 =?utf-8?B?akQwNWlsUVkrUUZWbkFnYS9KUitKNkMwa01ZeWRRNm9IWStYeVM5YUFYMXZY?=
 =?utf-8?B?Si9wcVlYWld3TDJ5MG15VllUaGRRMHJyRHNYbmZzM0ttaTdPdU1TSUFtR3VS?=
 =?utf-8?Q?M2c4mSYRhcUxj?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5613.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?ZWNqcElNYzRuZU5ETXpzZHBuU2lMMHFrSXFQZndMbjE3MEtWWFVOdjY3MnJK?=
 =?utf-8?B?VTdmQ1dlUFE2U1doZi9pUVg3QndFeG9wZkl6djJmcEdVdkVUM2x6aWd5UTNJ?=
 =?utf-8?B?b3dhSVl3SEJjcDd3cGZDWWp4ZWhhQWd2ODcvSnNtalNUWkNsVzdLUExQUGpC?=
 =?utf-8?B?alVUaVpYaEdJK0RrSE9vRkhDaUl0VkNUNm4rYTNzNENSYW8zTzc4dmQ1TEVH?=
 =?utf-8?B?SUtvNmM2RWV0YmVORE9PbjBoZ0sxeFhyRkZvaUZsMG9KdURzTHZhaFZMb0M3?=
 =?utf-8?B?OUtzbUZ3WHU2VVk5VjVYdXUwZDRUSk9vZ2tJL04rMVFSM20zYmg5V2FPUyty?=
 =?utf-8?B?em92SDlvaTJ2UDhQOFExbVk4RzhxQXc5OTRobFkyVXl4TURLb1dwMmNVUkJY?=
 =?utf-8?B?OEF5SnNFa09pZk5CRVZ0SU1BV3R2N1NGVXg1UGFkVXhRVFZSb0tES1FOWGww?=
 =?utf-8?B?VjM3bVlRcFIzNlBBV1RpVG9nUURHYm1zb05ybjlieUVmZzc4c0UxZXhaS0oy?=
 =?utf-8?B?ZUZqN2l2MmNVRnBTNkpQMVVIbHZvWUN1SVphRnpmRFhYd3l3ejhwTFduOWVS?=
 =?utf-8?B?b1dmTXNVZ2krMVN0R3JKcjk3eDdsZzRYWEd4bGtGbmxRTW9DajdyZEY3anRq?=
 =?utf-8?B?dTBmd0s4ajVZTExpT21SbEZpZUlxWlllTktpeFRXUjd6cFZlK2ZITFl2QTEv?=
 =?utf-8?B?bENoT1RNaUIxWXBtVUQwVm5pc3VuYXR5Ty85Yy94M3U4Ti9BdXJhbXpPeFRJ?=
 =?utf-8?B?WWt5Uk1Za2JscFptY2dSZUhXUnFRbnVORGVsd2RSSnVhTlI1S0tkZW1STGtp?=
 =?utf-8?B?WGtZc3FFMEdyWTlSNlpDU3lrSmVYNk1XZmRsTXY3V1hOVjN1WGFnU3BYOTBE?=
 =?utf-8?B?bGxUZi96YVFXK0RsRENqZUkrc1A0Y3gzVEJLbEllZFFXQ1JUU1gxckZTQVNw?=
 =?utf-8?B?WDZOTkFqaUdibXNCYzJyRFdRTGthaEplS2pZVHdoTVJJNVNCZXZTOG5tWlll?=
 =?utf-8?B?RnhWYXAzc1l5QU11RHR0L09GODVIY1QyOFJLRkV2T2R3aGJmL3Bqcm9TZGx3?=
 =?utf-8?B?VitWaGZFcGpESlJDT3pEbkRqM1pmU21lUzcrMXk1OTlmSW5xVVF6b1lQazh4?=
 =?utf-8?B?WFc1UzRtUytySkxuazZIYTlNQzVwczJ4MjROazhQVjY0STE5VTVIa2tCa29Q?=
 =?utf-8?B?cU0yYmRFdzJQSmFpYlNTTTZpdEJ2MElxQ1hjckZzSGlBWGFyMHVHNk9BSEpq?=
 =?utf-8?B?Qk01TE9ORGtyZmsrUDFnSWNtNWsxVG11NndwYzFaRU4rUlVVd0QvUldMUDVa?=
 =?utf-8?B?anJsQU95SGc0V3c2bWpqdEQ2VkZrYVdjbmNML21jK3lrb1hGb1lJVGFnY1Vs?=
 =?utf-8?B?aXhqVzRzTEp1dnQvdHFaL1hCNWRLYk8vSXZGK3NXSEwwUk41bWF3WUR2RjJy?=
 =?utf-8?B?RlRaalVoQ3JmZkVBRUMvMU9obHFPM0orTmpPTXZMYk1ONGFaalBYSnJYSEpC?=
 =?utf-8?B?eDJKb3BvN0d2aGpGS0hlUjlQMWFoLy9XVEdUbDV1eXNadmR6RXp3R1ZycU4x?=
 =?utf-8?B?dUpwcFpFRjNIVFZYV254TVFHTUEweGZOZ3NtNHB4M1Vjb29Pa3UxODUwQmpu?=
 =?utf-8?B?dC9yRmNZZWFUT1lDOG5XU0JKWjd3NE1WVEhQejV0RWQzZy9pUExETDU3azhC?=
 =?utf-8?B?cW90Uk5lQ1NSWjVpTVN5SlhrdGpjN2hSZnk5NlNLT2FHL0Nzb1BsSTM5L1RN?=
 =?utf-8?B?elUzbUdram00L2dVN3NTMWF2OE1xMGE0d3laSXcyVXhEVVcyQW5kRGtQSkIx?=
 =?utf-8?B?LzZhbTdRUjM2WXhFTnFYdzlZSkpGODZZN1E3QWptRnU3Z2FxVlNHWVZKMklP?=
 =?utf-8?B?aVpPZU04WlVDU0dXTllJZXdncmQ3QXJMUmxYSVBhUitTWUNJRGpIUzRVMGsx?=
 =?utf-8?B?YzVJTHZkdjVHOXVMYXk4RmVLalg2SmlicHRBK2c5MjI5KzhCZjlGT2tUU3ls?=
 =?utf-8?B?NzRSWkhZaWowZHdoZ3I5a2dtb3dSdDRHc1REL0hhOFdNaXN2MStWUFM0MTB0?=
 =?utf-8?B?Rm1XZUZXelJOOGhzNlNCWndBYU1qaFdUdEhZSFBxWUVncU1aSjdjaXdEdk1v?=
 =?utf-8?Q?AtSx6NXTgYELLIOgCbzduNS5x?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5613.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f4f58a2-4663-4810-1a32-08dd4c9a9203
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Feb 2025 01:54:51.4786
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SyaN8viiY0tRZZQZirxI+IY9HDs13gqKo+XoeDlhYJbfoM6xjGCSiVZq3Yg6gh8E16w32Ncgj1CPqr+eB3pUyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6506
X-Proofpoint-GUID: 8a8WDNaVtqs17DPZA5-XioTHJwTL-Lkj
X-Proofpoint-ORIG-GUID: S_-CEIvGBXDGDGSuavMVk7Ii-j2iHzZ8
X-Authority-Analysis: v=2.4 cv=G8nmE8k5 c=1 sm=1 tr=0 ts=67aea26f cx=c_pps a=Syk5hotmcjzKYaivvMT4gg==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=T2h4t0Lz3GQA:10 a=bRTqI5nwn0kA:10
 a=iGHA9ds3AAAA:8 a=P-IC7800AAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=LGpZLEyVdnCNnF2gUIQA:9 a=QEXdDO2ut3YA:10 a=nM-MV4yxpKKO9kiQg6Ot:22 a=d3PnA9EDa4IxuAV0gXij:22 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-13_09,2025-02-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 adultscore=0 priorityscore=1501 mlxlogscore=999 malwarescore=0
 impostorscore=0 spamscore=0 mlxscore=0 suspectscore=0 bulkscore=0
 phishscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2501170000
 definitions=main-2502140011
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Feb 2025 01:55:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211371

R290IGl0ISBUaGFua3MuIEknbGwgbG9vayBpbnRvIGl0Lg0KDQpSZWdhcmRzLA0KUWkNCg0KLS0t
LS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9w
ZW5lbWJlZGRlZC5vcmcgPG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+
IE9uIEJlaGFsZiBPZiBNYXRoaWV1IER1Ym9pcy1CcmlhbmQgdmlhIGxpc3RzLm9wZW5lbWJlZGRl
ZC5vcmcNClNlbnQ6IFRodXJzZGF5LCBGZWJydWFyeSAxMywgMjAyNSA5OjMzIFBNDQpUbzogQ2hl
biwgUWkgPFFpLkNoZW5Ad2luZHJpdmVyLmNvbT47IG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9w
ZW5lbWJlZGRlZC5vcmcNClN1YmplY3Q6IFJlOiBbT0UtY29yZV1bUEFUQ0ggNS81XSB1dGlsLWxp
bnV4L3V0aWwtbGludXgtbGlidXVpZDogdXBncmFkZSBmcm9tIDIuNDAuMiB0byAyLjQwLjQNCg0K
T24gVGh1IEZlYiAxMywgMjAyNSBhdCA3OjAwIEFNIENFVCwgQ2hlbiBRaSB2aWEgbGlzdHMub3Bl
bmVtYmVkZGVkLm9yZyB3cm90ZToNCj4gRnJvbTogQ2hlbiBRaSA8UWkuQ2hlbkB3aW5kcml2ZXIu
Y29tPg0KPg0KPiBUaGUgZm9sbG93aW5nIHR3byBwYXRjaGVzIGFyZSBkcm9wcGVkIGJlY2F1c2Ug
dGhleSBhcmUgaW4gdGhlIG5ldyB2ZXJzaW9uOg0KPiAtIDAwMDEtYXV0b3Rvb2xzLWZpeC1zZWN1
cmVkaXItYW5kLXBhbV9sYXN0bG9nMi1pbnN0YWxsLnBhdGNoDQo+IC0gdXRpbC1saW51eC9saWJm
ZGlzay1jZmRpc2stYW5kLXNmZGlzay1zZWN0b3Itc2l6ZS1pbXByb3ZlbWVudHMucGF0Y2gNCj4N
Cj4gU2lnbmVkLW9mZi1ieTogQ2hlbiBRaSA8UWkuQ2hlbkB3aW5kcml2ZXIuY29tPg0KPiAtLS0N
Cg0KSGksDQoNClRoYW5rcyBmb3IgeW91ciBwYXRjaC4NCg0KSSBiZWxpZXZlIHRoaXMgaXMgYnJl
YWtpbmcgc29tZSBzZmRpc2sgb3B0aW9uIHdlIHVzZS4gSGVyZSBpcyB0aGUgZXJyb3Igb24gdGhl
IGF1dG9idWlsZGVyOg0KDQp8IEVSUk9SOiBfZXhlY19jbWQ6IGV4cG9ydCANCnwgUEFUSD0vc3J2
L3Bva3lidWlsZC95b2N0by13b3JrZXIvb2Utc2VsZnRlc3QtZmVkb3JhL2J1aWxkL2J1aWxkLXN0
LTU0OA0KfCAyNy90bXAvd29yay9xZW11eDg2XzY0LXBva3ktbGludXgvY29yZS1pbWFnZS1taW5p
bWFsLzEuMC9yZWNpcGUtc3lzcm9vDQp8IHQtbmF0aXZlL3NiaW46L3Nydi9wb2t5YnVpbGQveW9j
dG8td29ya2VyL29lLXNlbGZ0ZXN0LWZlZG9yYS9idWlsZC9idWkNCnwgbGQtc3QtNTQ4MjcvdG1w
L3dvcmsvcWVtdXg4Nl82NC1wb2t5LWxpbnV4L2NvcmUtaW1hZ2UtbWluaW1hbC8xLjAvcmVjaQ0K
fCBwZS1zeXNyb290LW5hdGl2ZS91c3Ivc2Jpbjovc3J2L3Bva3lidWlsZC95b2N0by13b3JrZXIv
b2Utc2VsZnRlc3QtZmVkDQp8IG9yYS9idWlsZC9idWlsZC1zdC01NDgyNy90bXAvd29yay9xZW11
eDg2XzY0LXBva3ktbGludXgvY29yZS1pbWFnZS1taW4NCnwgaW1hbC8xLjAvcmVjaXBlLXN5c3Jv
b3QtbmF0aXZlL3Vzci9iaW46L3Nydi9wb2t5YnVpbGQveW9jdG8td29ya2VyL29lLQ0KfCBzZWxm
dGVzdC1mZWRvcmEvYnVpbGQvYnVpbGQtc3QtNTQ4MjcvdG1wL3dvcmsvcWVtdXg4Nl82NC1wb2t5
LWxpbnV4L2NvDQp8IHJlLWltYWdlLW1pbmltYWwvMS4wL3JlY2lwZS1zeXNyb290LW5hdGl2ZS91
c3IvYmluL3g4Nl82NC1wb2t5LWxpbnV4Oi8NCnwgc3J2L3Bva3lidWlsZC95b2N0by13b3JrZXIv
b2Utc2VsZnRlc3QtZmVkb3JhL2J1aWxkL2J1aWxkLXN0LTU0ODI3L3RtcA0KfCAvd29yay9xZW11
eDg2XzY0LXBva3ktbGludXgvY29yZS1pbWFnZS1taW5pbWFsLzEuMC9yZWNpcGUtc3lzcm9vdC1u
YXRpDQp8IHZlL2Jpbjovc3J2L3Bva3lidWlsZC95b2N0by13b3JrZXIvb2Utc2VsZnRlc3QtZmVk
b3JhL2J1aWxkL2J1aWxkLXN0LTUNCnwgNDgyNy90bXAvaG9zdHRvb2xzOiRQQVRIO3NmZGlzayAt
LXNlY3Rvci1zaXplIDUxMiAtLWRpc2staWQgDQp8IC9zcnYvcG9reWJ1aWxkL3lvY3RvLXdvcmtl
ci9vZS1zZWxmdGVzdC1mZWRvcmEvYnVpbGQvYnVpbGQtc3QtNTQ4MjcvdG0NCnwgcC93b3JrL3Fl
bXV4ODZfNjQtcG9reS1saW51eC9jb3JlLWltYWdlLW1pbmltYWwvMS4wL3RtcC13aWMvZWZpLWJv
b3RkaQ0KfCBzay0yMDI1MDIxMzA5NDktc2RhLmRpcmVjdCAwMDAwMDAwMC0wMDAwLTAwMDAtMDAw
MC0wMDAwNGQ5YjllZjAgDQp8IHJldHVybmVkICcxJyBpbnN0ZWFkIG9mIDANCnwgb3V0cHV0OiBz
ZmRpc2s6IHVucmVjb2duaXplZCBvcHRpb24gJy0tc2VjdG9yLXNpemUnDQp8IFRyeSAnc2ZkaXNr
IC0taGVscCcgZm9yIG1vcmUgaW5mb3JtYXRpb24uDQoNCmh0dHBzOi8vYXV0b2J1aWxkZXIueW9j
dG9wcm9qZWN0Lm9yZy92YWxreXJpZS8/Iy9idWlsZGVycy80OC9idWlsZHMvOTIyL3N0ZXBzLzE0
L2xvZ3Mvc3RkaW8NCg0KQ2FuIHlvdSBoYXZlIGEgbG9vayBhdCB0aGlzIGlzc3VlIHBsZWFzZT8N
Cg0KLS0NCk1hdGhpZXUgRHVib2lzLUJyaWFuZCwgQm9vdGxpbg0KRW1iZWRkZWQgTGludXggYW5k
IEtlcm5lbCBlbmdpbmVlcmluZw0KaHR0cHM6Ly9ib290bGluLmNvbQ0KDQo=

