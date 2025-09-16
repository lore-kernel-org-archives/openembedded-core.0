Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90AC8CAC599
	for <webhook@archiver.kernel.org>; Tue, 16 Sep 2025 14:51:56 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.342.1758034307110792159
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Sep 2025 07:51:47 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=nhfgRSzZ;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=1354292d0a=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58GBq7OP2100217
	for <openembedded-core@lists.openembedded.org>; Tue, 16 Sep 2025 07:51:46 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=3vHh2ArGg
	nwkc5g90qwPOB2p+M25INOSEiIP5f19s9g=; b=nhfgRSzZ4PGXmbnmlN6j4jjiL
	eHZ5V8c76+C/ZQ21jYb0ifSi4rS3eWl2R3r9kjoyDJHuKKlTvXcGg4NmRpDbAAY9
	znzf+BHoxnCxVTnCiieP/b1dPR7Dr14+ydFAyRPsFgvrrbCgux0mm2+zmtBRpNrQ
	7PmzhAf2vK5LlhFOQyArmN7ad/uFJmHZWXkFzKdNnLEQfy2fWKwrqmL2wKBGr8De
	QoV+Yk1reTZGUaE8tCxKDGtI2SI9LtM/4IU2nqHD3iwiiMSQftwuPptMo5LYxEBP
	TiIjPDTQGdjrThqd5ZZJZlcPXQL7GRo+9qKjThWGNQGUFUEM3Ii1oCewoH50Q==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011016.outbound.protection.outlook.com [52.101.62.16])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 49584hk5v6-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 16 Sep 2025 07:51:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oGQx7yd2CAcqemIEAOikzXAnlO89iWIQGI5K4IVZN7xwRibiF+OHu16EIkU7irofALw71yZl/7g5QYGAEbCGo4X009/O80Jo4qADLd56q5cCK+Zb7cEVqthwqC2rtocdPlcZ+BwQ7OXDkkIr6y4NfDyvT8UutQ5f72Ba51ottyqxLTKVSuADSJfQ+J175Ma5zNP6JSb5gY9KTbjHdUhRtO91nE30/S3rObH5B756x7jLq5cSEO2PiERzaC6kfjfEGZ6Glqxb/dZ7SomNclkrZjG44urOhTsF0zrOj+A13pLJ/6sUSTSIEGnBZyQN1p87xDcLYQQv6Q7my6IMxExApQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3vHh2ArGgnwkc5g90qwPOB2p+M25INOSEiIP5f19s9g=;
 b=zAzEC25KueQ7nCcWgTWdI8/iJZTVtwz5VJE8Wuzofx5+N0o86q+e5G2Xw86P+FskWOEJcBblQauJbemKssWa03a6jzyIAwdgdfNCZ8Plq1pf9k1lomsnTRst1GpgHyqSQPmEqYZxIYsYauBgXtr4sZIa/JfvOllw1Ub3UhXAp66cmUNK+i6Vi74Qu3t8I+vb0MqDeIAoycDBT0sYVA4MvIzmra7MxQb80fLrRm03ogss2w6h+RZ66AHsa2esUS5scuMF9TN4IS+qEkS1Q8Ziv7liVCNfA9fz6T+ODh46y4O1aH1hkLTAsXcJECRFRpW3Z+DepRij8twywpzZUkPQgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com (2603:10b6:a03:302::11)
 by CH3PR11MB8415.namprd11.prod.outlook.com (2603:10b6:610:17b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.21; Tue, 16 Sep
 2025 14:51:42 +0000
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f]) by SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f%5]) with mapi id 15.20.9115.022; Tue, 16 Sep 2025
 14:51:42 +0000
Message-ID: <2906764e-7bca-4947-93f0-2564ccc75129@windriver.com>
Date: Tue, 16 Sep 2025 20:21:35 +0530
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Cc: Ross Burton <ross.burton@arm.com>,
        "Kokkonda, Sundeep" <sundeep.kokkonda@windriver.com>
From: Deepesh Varatharajan <deepesh.varatharajan@windriver.com>
Subject: Remove rust-llvm dependency after LLVM split
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: MA0PR01CA0102.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:af::18) To SJ0PR11MB5648.namprd11.prod.outlook.com
 (2603:10b6:a03:302::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5648:EE_|CH3PR11MB8415:EE_
X-MS-Office365-Filtering-Correlation-Id: 97190566-a0c5-462a-56ab-08ddf5308c0d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?ZERkR1dVTXpLdlgyU0ZCYjlkWjVXcVdhU090T0VPd2czZmJYcmtNcUNQTG9U?=
 =?utf-8?B?azREZmtTVDY4MHY2ZUY2NjRqV0dQcTcyT0pPNmRPYXQ5ZXE5bWJGRHRDY1A1?=
 =?utf-8?B?NVFNMGUwZHpuVVNEUE0rbkFNc3FYbVVHSy85S0pUVloydUxtd3JsYjNkajI5?=
 =?utf-8?B?Qm15Nm1zd05EcTJUdHVhajE3RnhnajJJTHlQc0NmdnlSTVBEbVJ4VmFocUdm?=
 =?utf-8?B?Z1g1Sk1tYUZqZVdPRmh5eWY1SzhubTZpcU1hcnVCWDVBSm00VnVxekhFV2VV?=
 =?utf-8?B?MmJWUU8zSFBwSTNoOFAwTTQrQVF5VHdPVU9GUmVWRGl2Z2hyMzl3N21NOE5O?=
 =?utf-8?B?akdKSDZzbEltRWtNQ3NhVXRyTmxGdStHSWV4REFlZVVuWmpvUEwyY1FwVkpl?=
 =?utf-8?B?UTBUYkFjL05RL2VOMU9VOU10VVY2dHRRYjNraTRRbEFMK0IrdFU2SGxuWkFP?=
 =?utf-8?B?OVc2V2NVckZnU0NjM0xTY3ZsZE5Fa0t1VThqdUR5OG9qVDZXbkFtVDRpcFA3?=
 =?utf-8?B?dk9ZYVk4MDFuUFRTVjdOT0VEcHRtS3o5L3p2cG5FUCtOYTAycEc1SEFFS0kx?=
 =?utf-8?B?WTFKejNXdE55TElWRXh5Z2xMVFgxSGlja09hcDJybDA4TVAyVHNKakxZOEda?=
 =?utf-8?B?OTNDbGlxNVc0cmszMUFUTTJ6UEY2U2JoY1pRUWg0cjBNLzN6K1dtNG1tVlZt?=
 =?utf-8?B?WUplNG10Vyt1YWxCSGZoYlo2OVpkVWY1WWJrTFgrbzFBVnNTZ2ZQaEpKNytD?=
 =?utf-8?B?cXY5UEZ1d2tLWkZWdnZOVXNrd1NRTkNTNkpRUjVzOW0zMW9xVWkwNzhJMnRo?=
 =?utf-8?B?Y1hZbDZkRkRMSHRZdWVZbWIrNHM5ZGhuQ1k2UFNMV3NwandSMWIyZVBKSWZP?=
 =?utf-8?B?NitXK0FlOWxaZGF0T2FxVi9XaHpZanBIakNkV1QvK2hidW9ScUV0cWJHVnZ5?=
 =?utf-8?B?QmtnUm9WNjFNdzI2WldSeXdnTGQyZ3k1RmpXQVZpeFJwVlI0U2lNYlltWmN5?=
 =?utf-8?B?QXdWcDA3bU91TkNaMTZ1U0F6MHFpOW9PNEJnWmhVUjNtN2tOWHlBN0I1QVVl?=
 =?utf-8?B?UzZXM29uSjNsdytscWhOUzhXcm9LeGVTWWZoRlAzTlY4d1hwNVBDd1lYR0w5?=
 =?utf-8?B?aEtPVUVWR0RQaTRuSVlBdFFhYldjRjdiTWJMaEhiamJoWkRGczVWK251Mys5?=
 =?utf-8?B?SG9NUTZCTTVza2MwZU1TMTRzTlUvY01WUzdWTmREUUxQNVVGSTc2aStjc0t5?=
 =?utf-8?B?ZW1Hanc4M0VvOE9oNlUrZ2VXTDg0WUlNcEQ0VjdmbVJYcEVucWwrR2NwdjZU?=
 =?utf-8?B?M3orNTRZNDFJVTNzS2RJYkRMUEZ6WGFIUlltRWdSeGZBenozeWdPdDk1cVZ6?=
 =?utf-8?B?L0hQWnJWNGVwN3NMWFI5NTZ4Ym94M3NRNlZyZGRvOHhhQzhwUjc5bm1qamZ5?=
 =?utf-8?B?dEJHTGUvK056dlJZWlZTYnk2OHFuVk5RKzFQU1lKRlVCR2U2LysxZEQ2TnA5?=
 =?utf-8?B?U2xNakwzaUR6QkxoazhXZW93cFZaNGd1aG9iemMrQ253c2lBRkQvSVNNSXVG?=
 =?utf-8?B?VGRpakxkRURUckV6dUhWWDdXbWJSNDlGVGN5S0tnR2RwN3lhKzRjaVIxT21o?=
 =?utf-8?B?anZtaE14TUdnRG1KZXNGYURUWVlDaVBGU1lreERnUVVuMzUrU0t4V2xmRHdv?=
 =?utf-8?B?UFFXZVRXKzhhTlBBc3ZKUVNWWjJIckszSURUM3ZCcEp6SUpVaWYzb2F5RGlC?=
 =?utf-8?B?RG1kSk9yaGhhZy9wZHY0RjhSNzJlQkV2bEg1Y3ZWdEFEK2REYzZJdmFaeERp?=
 =?utf-8?B?YmY1RmdjUlo0dFlYYituTnowc0ZOOGwvSngvTDhPNERocFdpYzJuUHNiUFNh?=
 =?utf-8?B?MlQ5bXRqYTVVZTJybHJCQU9NRkp1aDBIK2k5ZUhzZzVMRnRjbFZTZThWeEFn?=
 =?utf-8?Q?ENmICst7Dbw=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5648.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?dGJIRmtpYnBkd2FlWVJIWFhWMU0vVGhhQjFRWHFQSmZVUWZhMjJvM2ZRVkdu?=
 =?utf-8?B?UHpKN3lGeUlpTEdTdkk0SDRsOGR3eFE1SXIzVFNLY2JOWm92R3U3VHBuWjFs?=
 =?utf-8?B?LzJFblJnUEZaZDlndmVaVDFlMjRlVVEwTTdIbWZqYy8wWEtpVFVBU2FwRGtN?=
 =?utf-8?B?enQ5dzd0MHhmK1JHaEdzU21QUHN2bWh1TEhyVnZqckJSK2puaHZGcTY4WVpm?=
 =?utf-8?B?WHBKSDlxbDRvREVTaEtGR29MTEVhV1J2YTh3QTUyM0JxaVlaQ0xzRDNPcjVq?=
 =?utf-8?B?RE9JQUhVTkVFMDZBT0IrcU9Ccnl5WHhvdWNBazZGMjFXbVBjNGt3Nm5xeHNN?=
 =?utf-8?B?a0lXRDJDQ3N0aDY4V1NqRFFmMndPOFFZTml1UjcrMXdHS3M3RTc0eWhSN04y?=
 =?utf-8?B?MXZrYlZzYnJKbFN4bExZS21aM0NBZHBtN3ZSaFkxUzBSb0ozcGxlRWhFZ1hu?=
 =?utf-8?B?dkRqWHl2NFprTnBNampBcktob0xYOUNjQWg3WXd5RWlDUDloVUdFZ0Q2UldM?=
 =?utf-8?B?clYxOGF2VytTU0VYOWxpbktqbTFNZXdLd2l2N1pWNjVyYXo1ZjBheURYeFBn?=
 =?utf-8?B?U0dGdkpTcjFiN3VwMGg1RTBOZWgrOSt2YjFQVUhKYVY2TGpiNlB4MEsrUmVv?=
 =?utf-8?B?ekhwRjhRUHJBZWtCSS9qbEUzYnlxbDAxQ1ZFdVQ2Y2VXSFBMUTFzaWxZMlEr?=
 =?utf-8?B?UGpSQmVWM0dwQ1hNajNYTGw0UE9HQko1RjFTaUFzeUtQMSswckZVM2kyM2w1?=
 =?utf-8?B?eHpNZXBUMitvdi9VSk1ML3dWMjN5V3MwM1JDVEp3ZDFmNGEweXFsWjdqQ2dN?=
 =?utf-8?B?aVBBaEZCM2F2dGhGQzVhWWpSUnV2c3JRa1FWdjVaZkRJTktjMThZN0RCOGRH?=
 =?utf-8?B?NkhVbWZBVEdpb2JWNEtHYXJqSTBXL28zSXQ4RjFZcTk5ZitIMGtmL3FkcXBX?=
 =?utf-8?B?YzNjU0xCWFZyYzQrWUlWYkU0WlRaLzlrbWpoVmp4Yjc2a2JNZGN5TWV6eXNB?=
 =?utf-8?B?RjBrcnJBNVN0aDdLOVo2MVZJVFdGYWpwOEpvNk0wZmpEalgyNG0yWGdVSWdy?=
 =?utf-8?B?OWFDd09IVit6S2xjRm1uUUtINlQydjJMdGJHK0VGVEppSUJTamtPYnV5UzRC?=
 =?utf-8?B?UmErTk80L1VXa1BrVC9iZWZuRVF1dlNxNXA3L3BCVjM0QjI0NVZWSUNobDhL?=
 =?utf-8?B?dTBxT1g0MXJ5UDFZMTlwdndXbjZzVTRXTXN2Z1RaMTJNeWJWRlNSWnJGODBZ?=
 =?utf-8?B?WmhFMFVpWnRoZ1ltZEQyQy9yQXgxR05xUFlnYmY5WjFJYVJ0MGN2MlBOWEhM?=
 =?utf-8?B?aWFQRFpkUk56K2h2VGFLa2RsQXlSUFQrdExLRndVb0hCanhvUXg0clVlNWJU?=
 =?utf-8?B?RWRtVzhwYk8xSUc2NGM0K0RHbFpyQTdFeDRXVE84dzUwM1lJaC9sVGtVbmEv?=
 =?utf-8?B?TXVKcTN5SXRnK3F2M21MQTdkWVFORXZGelErMmlpSXVhQjRpWnRIUUpLRnpV?=
 =?utf-8?B?UDNzOThUVnlLS2pEZVI2MVgrK21LaXF2WFF6b2FMS2ZnZWMzNTF4RjNGeXBU?=
 =?utf-8?B?a0Yyc3pNUXkxd2liNWFabjAwVWh3WFpIV0ZOdUt0ZWFrekhoUjhzQnNaOFpI?=
 =?utf-8?B?cVpPK0JyajUxdUhQVkxwWEt1Wis5N2ZVVmNtaWF5VEMzdjZSRTB0c1ZXOXpK?=
 =?utf-8?B?NEw4YkhJSzgvOHZncXdoVVFCWTBiMndUMExvSy9BRkFOZm4vYW1ESXN5Z2pT?=
 =?utf-8?B?TE42bWd6K3NrYlRzRFRZUjdTZW11ZDkzdXF1bm5LMHNwU2RNTnlFRjU4clZS?=
 =?utf-8?B?ak13cThUckloRFM0Ty9teDdNUXIyazZDSG1JSEhJSnN0emxRWENUV3lQdW9p?=
 =?utf-8?B?dzRsditxdnl0OWJvejNJWGl2ZVFYTVN3ZU5ZMFBGdURhWVJXZ1hvUnZpS1FN?=
 =?utf-8?B?OCtsb1htSllTSW0zVjZNQnArOVM3VEdGMVRON0RUQThjUlR2Kzh0NSt2RmZP?=
 =?utf-8?B?R0FPaU5VN0s4WVdCT25Ua0J0bklCSnF4R3FLUFdmdDYyMGhYdkJXejh4K21h?=
 =?utf-8?B?Rzh3ZUkvdVQweVdSbzFLNGx3bkp3SVM1eXdrN2c0NHFyYlRna0hGLzdkS1l4?=
 =?utf-8?B?RERlOVhISytGNEdmUEw3NjJ6QXQ0SnowdWNuTzVUV2RJOFphQVhEYVhpaTRm?=
 =?utf-8?Q?cAIkPWBlFwYQ42yvUqwrL4k=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97190566-a0c5-462a-56ab-08ddf5308c0d
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5648.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2025 14:51:42.1004
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NPwOSiKpLWfEIbeEqP+GIZjOQ/j9jHvq/EjtJ9xnRZujZ1+HScX+8TAs3btztDVqo3AAjdFjIzwGZCVsWxd1G3QR6MYh8W1lqwRqlatclUouHzZAFm9y9lDD4rCx6GAR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8415
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=Pbj/hjhd c=1 sm=1 tr=0 ts=68c97982 cx=c_pps
 a=4s+CrTYCAhIFSJe2+GBd1A==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10
 a=eQaJi54MV42PVZSwhEEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDEzNyBTYWx0ZWRfX78UyT34W37du
 7bxMdtiDUsElyFTeV1qdCCUPlLBY1VUAWSwLRqP0Z2rlluWBWpE7mZ2QcYV17/+QzQgAwyslnmo
 xssPXqyp/dZJc4Cr/+aw/u2TFLn2aekXlim7roXs8GRF+5BPgjuo+U8NfN45KJLAHpDK1GnHq3N
 U96YtA49K0EfgeQXHxKBPzmdupbudjjle1ZB3r06h5ot11OwWcRpLF9c3OE/+Jghk96tF3WEgsK
 jMPF4Z2jQf9G2tedtZYN6ZfLJVkYf/7qCk4i+sLUV815UFniTNNblf05ltPvQbXL7zC/M81BP2Y
 K8SAH3r4ZTRBfrw6t6nou5hxJHy+D+orB3j4lbU3Fgno+NFiAY58yvvh2vX2qs=
X-Proofpoint-GUID: vPcy1FK4GZQ7K_AzXJACunq74kPzZ-0a
X-Proofpoint-ORIG-GUID: RSynTK4tszBWdUT7ngnwgzlRAcDK7k-v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-16_02,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 suspectscore=0 adultscore=0 bulkscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2507300000 definitions=firstrun
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 58GBq7OP2100217
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Sep 2025 14:51:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223561

Hi All,

We have successfully built Rust 1.91 (nightly) using Clang 21.1.0 after=20
removing rust-llvm dependency. Additionally, we used
Ross's poky-contrib branch, which separates the LLVM recipe from Clang,=20
to build Rust-1.89 with LLVM 21.1.0 without the
rust-llvm dependency successfully and below are the results.

Rust Build Results

With rust-llvm :

real=C2=A0=C2=A0=C2=A0 50m1.506s
user=C2=A0=C2=A0=C2=A0 0m13.196s
sys=C2=A0=C2=A0=C2=A0=C2=A0 0m1.429s
Disk usage 40G

 =C2=A0With LLVM :

real=C2=A0=C2=A0=C2=A0 53m29.662s
user=C2=A0=C2=A0=C2=A0 0m12.940s
sys=C2=A0=C2=A0=C2=A0=C2=A0 0m1.176s
Disk usage 43G

Can we submit the rust-llvm=C2=A0removal patch once Ross's patch is merge=
d=20
into the poky=C2=A0master branch?

Regards,
Deepesh




