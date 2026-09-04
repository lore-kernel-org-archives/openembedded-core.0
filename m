Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 874D4C624D3
	for <webhook@archiver.kernel.org>; Fri,  4 Sep 2026 13:41:58 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9047.1788509209513047411
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Sep 2026 01:06:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=ApMmJW1U;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=37077ff900=himaniramesh.barde@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 684650sS629685
	for <openembedded-core@lists.openembedded.org>; Fri, 4 Sep 2026 08:06:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=JpNPNznfIm9BWpikb9NQvG
	hp2VOtSveyn8AE/MhaaKk=; b=ApMmJW1UJSb3aPry3YKvGiMv7Ty/0qlzskOepB
	yFxb6dsBcnIB2LttSUzz7I+VpN5C14YF+0MY+k3zKUWqhG22xCgPcn7u6VJmx5Z4
	AhIqoRSUhbiL43dJ1Uc7S6LX4rqqC8Q9xa3uvCyRiKy1aVhqi2IseK9NEYt5zkzi
	yxDBKK+2d6M36X06QPV9g+r5URKsDn82kkdaFrB25qkFmcMEqMtzICaLnWBVNG2Y
	AZ+qGaA4Ny5etlmp84wZBeDw2YM4LqRC8lQp+qdOnRsaBMvF5HUeC2cJwf3xyB+f
	0M6c+c9NSP/f+DjUEMGDlIjvdvJzsQWU/kgqMsz0z+tb60+A==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11022121.outbound.protection.outlook.com [40.107.200.121])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4gf5q0j0y2-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 04 Sep 2026 08:06:47 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ge3yY/ELRVBong2UKhC99KgelsRevLNGQfTxjWTWKGhM5ZCGlI/eEQz+FJ/EMM66PnMsoZiB2cVMRFezhH/Kun4pCOqWaAZipqaoEdFtS3qssP0IYVy7nbSsD0je5vcqedQSuk6ibJ3d8abV0/S25eha3fDHVbJWi3tE1+O8RehMGqJctnYBLtuYwvjNZN9TyKeHMOY50oxBbFRM9s9rXq1Yg5vYW5Im80qgGKXr7b5f26fUWD74PRXfYKpaNZ9ZjnTap0ySEOgn9Ti6kRFQCxC/+ezjh15cej6pDKjo9ppS5cT2VWsnWub7IvVQsI4U2zsMFTTVIxkSbFwaq7rJEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JpNPNznfIm9BWpikb9NQvGhp2VOtSveyn8AE/MhaaKk=;
 b=nZKGEoZ557mN2yQ6J/fafRqcYMLSEApymjb+RXlzuz3FnKV1r1xaFtyZbRGsY+Wrhnqt+ip2PlnV43FA4w5ti0n5IvTqtZy3N1cNLmGlvNeKtOIPB0W2S/+XLVsyWh2Wjk1VKCcwoMDah+1cRq9eyOWZ3H9Xe4lyEPJwjBr0F5InGTgdR2eXaa+dferv32ELtLS7AQVzgvAbZTxiPZTm9uu9mDpBz6K8sg1X4Jtr+aU014kUCAGQtkRhUIFMZxyXCzw9pXT9r9vCWkAzaap41KdwhHfqqK94106HwaFemRot64PXfzU7ItCEQN+eqlAVi7ip07utXWOtj382/qJF0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8774.namprd11.prod.outlook.com (2603:10b6:610:1cd::15)
 by PH7PR11MB8570.namprd11.prod.outlook.com (2603:10b6:510:2ff::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Fri, 4 Sep
 2026 08:06:41 +0000
Received: from CH3PR11MB8774.namprd11.prod.outlook.com
 ([fe80::8925:311f:7018:b3ec]) by CH3PR11MB8774.namprd11.prod.outlook.com
 ([fe80::8925:311f:7018:b3ec%6]) with mapi id 15.21.0360.008; Fri, 4 Sep 2026
 08:06:41 +0000
From: "Barde, Himani Ramesh" <HimaniRamesh.Barde@windriver.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "MacLeod, Randy" <Randy.MacLeod@windriver.com>,
        "ross.burton@arm.com"
	<ross.burton@arm.com>
Subject: Re: [OE-core][PATCH] systemd: re-enable ptest support
Thread-Topic: [OE-core][PATCH] systemd: re-enable ptest support
Thread-Index: AQHdPEN4Ca+0G4QdO0OZ3EpvFGRptLa+EAeb
Date: Fri, 4 Sep 2026 08:06:41 +0000
Message-ID: 
 <CH3PR11MB8774ED1E3724326A2C81F3308FB52@CH3PR11MB8774.namprd11.prod.outlook.com>
References: <20260904080004.2501262-1-HimaniRamesh.Barde@windriver.com>
In-Reply-To: <20260904080004.2501262-1-HimaniRamesh.Barde@windriver.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Enabled=True;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_SiteId=8ddb2873-a1ad-4a18-ae4e-4644631433be;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_SetDate=2026-09-04T08:06:40.670Z;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Name=INTERNAL;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_ContentBits=1;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Method=Standard;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB8774:EE_|PH7PR11MB8570:EE_
x-ms-office365-filtering-correlation-id: a47903a1-5a56-4df6-e3d2-08df0a5b7412
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|10070799003|23010399003|366016|376014|1800799024|38070700021|13003099007|56012099006|10067099003|22082099003|11063799006|6133799003|8096899003|18002099003;
x-microsoft-antispam-message-info: 
 TM9RvPa6t/LkhWhq0JWhO0tabUtYxQRdvgnZW2iJ2KQIwLYutmcuJnKkn8Qi6KHdAvKksnRd0hOe/i5bh0vJ+CDthwWl9RwQPa4JSNyEuk/0GprgSAyM7r2aWmXhcYSfM7V5itQ9hlJjX8xdNdEe3nKtsP4oL4Ms+k8iCo7mS3UiQSBrElrCCoM1jThmcaS4+9pPK60x8N6e2p7Y/Kr+XAA/yuJkcg4CnMK+fhrKy8XfYYoVzABMkPo30d/GIx8AvFVAsEfzjrFslDqJTfnCJyYMEPHbqU3GRIS0O4k/SLehlOwVgnDHOZ6g9tZaj3xWZlYxygKvCp+BfwdmfdBDS70eHyZCaGgMboEA8vhhCcT285nt3lJlTGviYuQJmDZeJ1HsKEI4ZOU29EN3zBHomzGsveBhkEVD3GthqStVBWjL2FlZ+EdXs3oa2nnnPl6EKP2JDExQiKZ+OQKDY9kc/Dh8l5QlQ0fsc4gJg9bAj3lQjg/GBOBcrGPphHmqQVssUTXCkZsLrdn/ClKgd2VDrGuBzz6dW6H3BMmLrkZanKlgZs/k5Q7rOdHEqjdHJeuY2dr2trqPWFbNZsepMYzsQ56dU3X8KrBpFgd5Q4xu1gtvUR/QyWtwfE+WupeJ0EWyGvkjkV9A42XEJIKcD9xiDTedSW/jmwAkg+a22SNhV4A=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8774.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(23010399003)(366016)(376014)(1800799024)(38070700021)(13003099007)(56012099006)(10067099003)(22082099003)(11063799006)(6133799003)(8096899003)(18002099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: 
 =?Windows-1252?Q?FPn2TgIi3JEYsQoDw6bqRFGB7D9+/UxzvumPLkTA4DIQbQGWguO201st?=
 =?Windows-1252?Q?/DQgfCFEhOaHtDyam8LrNjlXp13jNyVs3YaQx5zPa/4oZP/n8+PGHB3x?=
 =?Windows-1252?Q?vbuUYpR9cGXWzTFJ6D/yV2rjpWCCoInC22L8JZ+JkmywEKXKD5tprAUl?=
 =?Windows-1252?Q?C/i72Iz6hAVwbbApo9v0SuCThTr+wSqr48Dlh1IcBOYLy8g9gFvrZXiL?=
 =?Windows-1252?Q?8D9kXk8sqSZaEDdtzVZxA3hwX5J5mOeiiRwYwMc9AUYahdTKZcsFHZ/Z?=
 =?Windows-1252?Q?g1YW0dItjgXNWOjl9kRhmfqwORcrioURs4qX1NC+O2bp06QUxJykaJop?=
 =?Windows-1252?Q?nc6f6RrMjgW/h4ttG0TrTkhULfBtcs6yaLUB0LOPP9/vGNVf/vDhSJo3?=
 =?Windows-1252?Q?tQmSir6ivrDmA7hpyTE+CMPouCaiACtZRhevHeVB/LmjOxwU4ZQWjGcF?=
 =?Windows-1252?Q?spY6L80fQqu/spB7eB+OuT5eDppaZpLM+A97I0LXZYuFF+q5ctqGxXyG?=
 =?Windows-1252?Q?4C20YGmFX/dS5PEXy2wodDfDrYLbzniee7d9FtG9ejYkiKsz2U+W7Kzm?=
 =?Windows-1252?Q?w9jiKwsuPJKBH97FTSjtZMFffzU4bDQikFmbtFQty4EjPUeqfXF6QANY?=
 =?Windows-1252?Q?h982gC/QEqp9QBpXZaDG2cZFxW28wfCFL0kzUdCuKIZ6jaScVyO6X9+1?=
 =?Windows-1252?Q?oKuAzuFQ/gURxPD/2gZPnScLrDGaP/frE0c/Pr/PL4IZnd49+T/y4ebx?=
 =?Windows-1252?Q?uLnkGVRHzVeA4MsPZggJCyrrPD6aJnqtPkPvzvLQ6APNn4C98DseTsWd?=
 =?Windows-1252?Q?sA9HcL2bRaQlIuJzezmdg2phQ2T8zxvc4QVzQLKvxIqfA3IrQzRCh85k?=
 =?Windows-1252?Q?fE6AYKc5Fp42IegrsA4bImw42Xqhi8LtrbhOOnvEMGPCCNbGyVuO/jPp?=
 =?Windows-1252?Q?o8zZMJtO2uQMW9IOn9o37hfxS5X5dKdJ8w+UPGdnSz6z+QlA/S2wh11A?=
 =?Windows-1252?Q?Ga7lFXZ+G5LQVx6PjRbfehXcZWzc1LJztP2v3rChVSsPIxmkA73IKNZl?=
 =?Windows-1252?Q?OF/f4ka/Xfm+hkPmJezuQ3EHFt5LUvpboOdCuLn94tb/z8IRZvn9uzi3?=
 =?Windows-1252?Q?x5SL21mE/VLdtB00aZs1teq4B6LekEmmf/17WOlQDe0Jw9H8mEQ9XFXh?=
 =?Windows-1252?Q?WVzTcF3d5XE2qX09A2A1SR6vDWOyi+0+tLLX9eQFtRKIvixIrGnEsef6?=
 =?Windows-1252?Q?vJg/2wfXiuwv0IIwkPTUraz3mxB5wrJAcVpn4y1K9QTRgGGiiafDJAhs?=
 =?Windows-1252?Q?ot6hn9YCbrfKbNDFPFIuCjo+FVl364kAohLbGX4AAyn7WQOZxBRcrZfq?=
 =?Windows-1252?Q?SZExBQ4j4lSJpCk9ydG+7aCQOfOV9gLcuyXNFE+Ze8wZuLJSr7QQKwl3?=
 =?Windows-1252?Q?9yY1B6g8kweENyo+DVlluQLacjD9go8GMxau07gEMoHIuE5qq6hg8bXH?=
 =?Windows-1252?Q?O2m37M6jqBur//VTsng4KJsIMen3bfOOOEYWM6yhExBgpoPef2Xf8xAY?=
 =?Windows-1252?Q?DjYeJ+pkMPUlUY6Ml3aajjBHTOvr8njJDTY9GRjg3LSts/47VbK6m6uD?=
 =?Windows-1252?Q?2xjantIPYGaBz23tBt1TwmD3sBw3ZPWVusgFvWYOAEsBvLz7cQ30qejM?=
 =?Windows-1252?Q?/GUiB6U/A8+gx+EwEs20HBphgDKlnYkRsDySL0Ty6xwRusER06nfcJET?=
 =?Windows-1252?Q?FC2W+pSSJp73T2S/XM6NZ9xwgCbNtxDbgBFLK2L/a5igBUUw4sCTXzms?=
 =?Windows-1252?Q?qoBzra44CPEW1/ZxSgFd/qGyJiI+6QVTeZFy7jFSejGLmQSW/SXMh7Aa?=
 =?Windows-1252?Q?lwVoVpuYcuiIo1NDMLUyi9EZRuQyYUuAnTWwsgzoSwJuShVr6612OxQo?=
 =?Windows-1252?Q?V8I9E7p4?=
x-ms-exchange-antispam-messagedata-1: bpcraGYuiN2HqiB6o+aipOWH4mFhb84gYgs=
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
	GamjUJT5AWii/e+re9r73ULHpvqBYqNene0pErmXQW8g08ZgG+z+zmxPIy1vn4d5Fygpw3vCLIpYJygVjq521CnUoGeg+7qK63NqNXGAWbhQElmAeu6t4QQIE3lCNBs5dQyaO7yU5XmdZdeszWPlMqBBZpoZlNFX86/YhwSDywz+KtdPOubX2uh4cVbSPFvCn2GUQeZIKeK+W+EE2P60UhBfsq7Xhqt5uvwzazVTDKOCpWET77Nu+PUAyLldNYt/7fq0V8EaL16ex6v7ccaQiYZLpzcRtxXL46iE9ojSzU/o8D3HqzD/SsPMQakq/TVNSjg3YWw1gtJCXZsBjEz7Gw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8774.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a47903a1-5a56-4df6-e3d2-08df0a5b7412
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Sep 2026 08:06:41.5194
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Y8sZl8ivni1zIm+dS0gUpsqETaz1MhkQD0LaSslO4gUgKfLQ3jm4dRuX55JOlSGDY3BbKXr3aBOVDZhHD3syreKFV3cCur6PbfT0uGP+UUU7otav6uK5Zm9CUA4g+gx5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8570
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=Po6jqQM3 c=1 sm=1 tr=0 ts=6a9a7c18 cx=c_pps
 a=PlzX2GN61/O3EU/AUs1JWA==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=VdqzKS8jKosA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22
 a=GhQEx97vAAAA:20 a=t7CeM3EgAAAA:8 a=Q4-j1AaZAAAA:8 a=7CQSdrXTAAAA:8
 a=-rGjSfZCEIhsc_kMMYcA:9 a=pILNOxqGKmIA:10 a=aJht-OV7rMPkvIJg:21
 a=frz4AuCg-hUA:10 a=_W_S_7VecoQA:10 a=FdTzh2GWekK77mhwV6Dw:22
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=a-qgeE7W1pNrGK8U0ZQC:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-GUID: kHrMxbb8PojmLGVVXs1Obw5CVBdGyoIX
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA0MDA3NCBTYWx0ZWRfX2d09GmThpCHG
 4RETDHgUGWTSCNNG98WKruHNk2M9z44dhbUeJq47NV+Uhp9mu3fJjg6uFFfhU1nhugc0BtzGJ8y
 bFD+Vw0vl0wRrsJ/lYjUasi58lqR5kaJeCCqV3V5ukOHU1a37QbC
X-Proofpoint-ORIG-GUID: fs6RSacK4myxyIVEJ1MGcvCb5g3BZo5-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA0MDA3NCBTYWx0ZWRfX3Khdo5chlgKN
 aUkj2fAYb/THmBC4QPfGF4UtArti/u1iGJd7FK/HgGv2ryikmsD+YR64ylA5Sf3cXWjqi0AW5Yt
 5/ZDX5PYleD2bqqRhaJ0wxKvVzL37oP6OCIad7PpGOQtkqKrQNHmzNB2tfCXe+6QKci4hqVzrWx
 4ZGMIHUqFVz7Wi3unJPawSCWwcK1emk5l+WmLX/El8DS8c8cEbsrDWpEQxwfO58dKwsZY1+bjCN
 6Vvz9XmD/O3mT9spmcl/BMe2ETsxiB4z2wLgojmoLbiqgJJsr3fW/Rqk9Dmml4761ZmypQ0VrL0
 4LhtYDR2Tm4FeCQTicm5VkKB2hyF//iLzf9Ur0bg7oHvYy4hrYkxXK5HCFwfFT/w/rkEVmD0Tyg
 vM5TI7djFUFuGy4gTlAxanTdy84dvZ+I85V8wdqiefSSBlmDca9BC8ENsZKQUG6MMKwKeEPs6xb
 cnzQ13fqEguEk1IXrcA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-04_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 impostorscore=0 suspectscore=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609040074
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_CH3PR11MB8774ED1E3724326A2C81F3308FB52CH3PR11MB8774namp_"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Sep 2026 13:41:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245114

--_000_CH3PR11MB8774ED1E3724326A2C81F3308FB52CH3PR11MB8774namp_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Apologies for the duplicate =97
this patch was sent twice by mistake. Please review either copy; they are i=
dentical.
Sorry for the noise.

________________________________
From: Himani Ramesh Barde <HimaniRamesh.Barde@windriver.com>
Sent: Friday, September 4, 2026 1:30 PM
To: openembedded-core@lists.openembedded.org <openembedded-core@lists.opene=
mbedded.org>
Cc: MacLeod, Randy <Randy.MacLeod@windriver.com>; ross.burton@arm.com <ross=
.burton@arm.com>; Barde, Himani Ramesh <HimaniRamesh.Barde@windriver.com>
Subject: [OE-core][PATCH] systemd: re-enable ptest support

ptest support for systemd was dropped in 2018 (commit 906230a73b3c) when th=
e recipe switched to meson, as there was no easy way to install and run the=
 test suite. Current systemd and meson resolve this: the meson 'install-tes=
ts' option installs the unit-test binaries and a run-unit-tests.py runner u=
nder ${prefix}/lib/systemd/tests, and run-unit-tests.py already emits PASS:=
/SKIP: results per test.

Enable install-tests, package the installed tree into systemd-ptest, and ad=
d a run-ptest wrapper that drives run-unit-tests.py. This provides ptest co=
verage for the systemd:test and libsystemd meson unit-test suites.

The test/units integration tests, which require a booted system, are out of=
 scope here and can be addressed separately.

Verified on systemd 257.6: -Dinstall-tests=3Dtrue installs 313 test-* unit-=
test binaries plus run-unit-tests.py; systemd-ptest packages cleanly. The r=
ecipe change parses without error against oe-core master (261.2).

[YOCTO #16386]

Signed-off-by: Himani Ramesh Barde <HimaniRamesh.Barde@windriver.com>
---
 meta/recipes-core/systemd/systemd/run-ptest | 11 +++++++++++
 meta/recipes-core/systemd/systemd_261.2.bb  | 18 +++++++++++++++++-
 2 files changed, 28 insertions(+), 1 deletion(-)
 create mode 100755 meta/recipes-core/systemd/systemd/run-ptest

diff --git a/meta/recipes-core/systemd/systemd/run-ptest b/meta/recipes-cor=
e/systemd/systemd/run-ptest
new file mode 100755
index 0000000000..b2204b96d4
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/run-ptest
@@ -0,0 +1,11 @@
+#!/bin/sh
+# Run systemd's installed meson unit tests in ptest format.
+# systemd's -Dinstall-tests=3Dtrue installs run-unit-tests.py plus the
+# unit-tests/test-* binaries; run-unit-tests.py already emits PASS:/SKIP: =
lines.
+set -u
+here=3D"$(cd "$(dirname "$0")" && pwd)"
+for cand in "$here/run-unit-tests.py" "$here/tests/run-unit-tests.py" /usr=
/lib/systemd/tests/run-unit-tests.py; do
+    [ -f "$cand" ] && { python3 "$cand" 2>&1; exit 0; }
+done
+echo "FAIL: systemd-ptest (run-unit-tests.py not found)"
+exit 1
diff --git a/meta/recipes-core/systemd/systemd_261.2.bb b/meta/recipes-core=
/systemd/systemd_261.2.bb
index 80e1aa07d1..dfd2b7c0c9 100644
--- a/meta/recipes-core/systemd/systemd_261.2.bb
+++ b/meta/recipes-core/systemd/systemd_261.2.bb
@@ -9,7 +9,7 @@ DEPENDS:append:libc-musl =3D " libucontext"

 SECTION =3D "base/shell"

-inherit useradd pkgconfig meson perlnative update-rc.d update-alternatives=
 systemd gettext bash-completion manpages features_check mime
+inherit useradd pkgconfig meson perlnative update-rc.d update-alternatives=
 systemd gettext bash-completion manpages features_check mime ptest

 # unmerged-usr support is deprecated upstream, taints the system and will =
be
 # removed in the near future. Fail the build if it is not enabled.
@@ -37,6 +37,7 @@ SRC_URI +=3D " \
            file://systemd-pager.sh \
            file://0001-binfmt-Don-t-install-dependency-links-at-install-ti=
m.patch \
            file://0003-Do-not-create-var-log-README.patch \
+file://run-ptest \
            "

 PAM_PLUGINS =3D " \
@@ -937,3 +938,18 @@ python do_warn_musl() {
         bb.warn("Using systemd with musl is experimental, see https://gith=
ub.com/systemd/systemd/blob/9ca4334/NEWS#L524 for details")
 }
 addtask warn_musl before do_configure
+
+# ptest support: systemd's meson 'install-tests' option installs the unit-=
test
+# binaries and run-unit-tests.py under ${prefix}/lib/systemd/tests. Packag=
e them
+# into systemd-ptest and drive them via run-ptest. [YOCTO #16386]
+EXTRA_OEMESON:append =3D " -Dinstall-tests=3Dtrue"
+
+do_install_ptest() {
+    install -d ${D}${PTEST_PATH}
+    if [ -d ${D}${prefix}/lib/systemd/tests ]; then
+        cp -r ${D}${prefix}/lib/systemd/tests/* ${D}${PTEST_PATH}/
+    fi
+}
+
+RDEPENDS:${PN}-ptest +=3D "${PN} python3-core bash"
+INSANE_SKIP:${PN}-ptest +=3D "dev-deps debug-files"
--
2.54.0


--_000_CH3PR11MB8774ED1E3724326A2C81F3308FB52CH3PR11MB8774namp_
Content-Type: text/html; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DWindows-1=
252">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Apologies for the duplicate =97</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
this patch was sent twice by mistake. Please review either copy; they are i=
dentical.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Sorry for the noise.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Himani Ramesh Barde &=
lt;HimaniRamesh.Barde@windriver.com&gt;<br>
<b>Sent:</b> Friday, September 4, 2026 1:30 PM<br>
<b>To:</b> openembedded-core@lists.openembedded.org &lt;openembedded-core@l=
ists.openembedded.org&gt;<br>
<b>Cc:</b> MacLeod, Randy &lt;Randy.MacLeod@windriver.com&gt;; ross.burton@=
arm.com &lt;ross.burton@arm.com&gt;; Barde, Himani Ramesh &lt;HimaniRamesh.=
Barde@windriver.com&gt;<br>
<b>Subject:</b> [OE-core][PATCH] systemd: re-enable ptest support</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">ptest support for systemd was dropped in 2018 (com=
mit 906230a73b3c) when the recipe switched to meson, as there was no easy w=
ay to install and run the test suite. Current systemd and meson resolve thi=
s: the meson 'install-tests' option
 installs the unit-test binaries and a run-unit-tests.py runner under ${pre=
fix}/lib/systemd/tests, and run-unit-tests.py already emits PASS:/SKIP: res=
ults per test.<br>
<br>
Enable install-tests, package the installed tree into systemd-ptest, and ad=
d a run-ptest wrapper that drives run-unit-tests.py. This provides ptest co=
verage for the systemd:test and libsystemd meson unit-test suites.<br>
<br>
The test/units integration tests, which require a booted system, are out of=
 scope here and can be addressed separately.<br>
<br>
Verified on systemd 257.6: -Dinstall-tests=3Dtrue installs 313 test-* unit-=
test binaries plus run-unit-tests.py; systemd-ptest packages cleanly. The r=
ecipe change parses without error against oe-core master (261.2).<br>
<br>
[YOCTO #16386]<br>
<br>
Signed-off-by: Himani Ramesh Barde &lt;HimaniRamesh.Barde@windriver.com&gt;=
<br>
---<br>
&nbsp;meta/recipes-core/systemd/systemd/run-ptest | 11 +++++++++++<br>
&nbsp;meta/recipes-core/systemd/systemd_261.2.bb&nbsp; | 18 +++++++++++++++=
++-<br>
&nbsp;2 files changed, 28 insertions(+), 1 deletion(-)<br>
&nbsp;create mode 100755 meta/recipes-core/systemd/systemd/run-ptest<br>
<br>
diff --git a/meta/recipes-core/systemd/systemd/run-ptest b/meta/recipes-cor=
e/systemd/systemd/run-ptest<br>
new file mode 100755<br>
index 0000000000..b2204b96d4<br>
--- /dev/null<br>
+++ b/meta/recipes-core/systemd/systemd/run-ptest<br>
@@ -0,0 +1,11 @@<br>
+#!/bin/sh<br>
+# Run systemd's installed meson unit tests in ptest format.<br>
+# systemd's -Dinstall-tests=3Dtrue installs run-unit-tests.py plus the<br>
+# unit-tests/test-* binaries; run-unit-tests.py already emits PASS:/SKIP: =
lines.<br>
+set -u<br>
+here=3D&quot;$(cd &quot;$(dirname &quot;$0&quot;)&quot; &amp;&amp; pwd)&qu=
ot;<br>
+for cand in &quot;$here/run-unit-tests.py&quot; &quot;$here/tests/run-unit=
-tests.py&quot; /usr/lib/systemd/tests/run-unit-tests.py; do<br>
+&nbsp;&nbsp;&nbsp; [ -f &quot;$cand&quot; ] &amp;&amp; { python3 &quot;$ca=
nd&quot; 2&gt;&amp;1; exit 0; }<br>
+done<br>
+echo &quot;FAIL: systemd-ptest (run-unit-tests.py not found)&quot;<br>
+exit 1<br>
diff --git a/meta/recipes-core/systemd/systemd_261.2.bb b/meta/recipes-core=
/systemd/systemd_261.2.bb<br>
index 80e1aa07d1..dfd2b7c0c9 100644<br>
--- a/meta/recipes-core/systemd/systemd_261.2.bb<br>
+++ b/meta/recipes-core/systemd/systemd_261.2.bb<br>
@@ -9,7 +9,7 @@ DEPENDS:append:libc-musl =3D &quot; libucontext&quot;<br>
&nbsp;<br>
&nbsp;SECTION =3D &quot;base/shell&quot;<br>
&nbsp;<br>
-inherit useradd pkgconfig meson perlnative update-rc.d update-alternatives=
 systemd gettext bash-completion manpages features_check mime<br>
+inherit useradd pkgconfig meson perlnative update-rc.d update-alternatives=
 systemd gettext bash-completion manpages features_check mime ptest<br>
&nbsp;<br>
&nbsp;# unmerged-usr support is deprecated upstream, taints the system and =
will be<br>
&nbsp;# removed in the near future. Fail the build if it is not enabled.<br=
>
@@ -37,6 +37,7 @@ SRC_URI +=3D &quot; \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://systemd-pager.sh">file://systemd-pager.sh</a> \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://0001-binfmt-Don-t-install-dependency-links-at-install-tim.patch"=
>
file://0001-binfmt-Don-t-install-dependency-links-at-install-tim.patch</a> =
\<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://0003-Do-not-create-var-log-README.patch">file://0003-Do-not-crea=
te-var-log-README.patch</a> \<br>
+file://run-ptest \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;<b=
r>
&nbsp;<br>
&nbsp;PAM_PLUGINS =3D &quot; \<br>
@@ -937,3 +938,18 @@ python do_warn_musl() {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bb.warn(&quot;Using system=
d with musl is experimental, see <a href=3D"https://github.com/systemd/syst=
emd/blob/9ca4334/NEWS#L524">
https://github.com/systemd/systemd/blob/9ca4334/NEWS#L524</a> for details&q=
uot;)<br>
&nbsp;}<br>
&nbsp;addtask warn_musl before do_configure<br>
+<br>
+# ptest support: systemd's meson 'install-tests' option installs the unit-=
test<br>
+# binaries and run-unit-tests.py under ${prefix}/lib/systemd/tests. Packag=
e them<br>
+# into systemd-ptest and drive them via run-ptest. [YOCTO #16386]<br>
+EXTRA_OEMESON:append =3D &quot; -Dinstall-tests=3Dtrue&quot;<br>
+<br>
+do_install_ptest() {<br>
+&nbsp;&nbsp;&nbsp; install -d ${D}${PTEST_PATH}<br>
+&nbsp;&nbsp;&nbsp; if [ -d ${D}${prefix}/lib/systemd/tests ]; then<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cp -r ${D}${prefix}/lib/systemd=
/tests/* ${D}${PTEST_PATH}/<br>
+&nbsp;&nbsp;&nbsp; fi<br>
+}<br>
+<br>
+RDEPENDS:${PN}-ptest +=3D &quot;${PN} python3-core bash&quot;<br>
+INSANE_SKIP:${PN}-ptest +=3D &quot;dev-deps debug-files&quot;<br>
-- <br>
2.54.0<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_CH3PR11MB8774ED1E3724326A2C81F3308FB52CH3PR11MB8774namp_--

