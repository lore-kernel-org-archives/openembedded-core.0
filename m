Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD554EB5951
	for <webhook@archiver.kernel.org>; Wed, 11 Feb 2026 02:37:43 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10142.1770777457555600257
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Feb 2026 18:37:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=db6KKD8J;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=6502e0d1f2=qi.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61B2YL6m3640614
	for <openembedded-core@lists.openembedded.org>; Wed, 11 Feb 2026 02:37:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=L3zInG6W9DaCAp2qby+2Nyi8MCn/IRJfZw5j50TkUDQ=; b=db6KKD8JdHxW
	RCPqBFy6T17M3FXvrWNy0Au8c27QL9rMV2AODflOyo6roXgtK0g++ZtIdfnZ+r5v
	PDnsVXZZ6DfFM2wZRxvL4X9lKMFCfYy/jGWPUSsCM4ZYwtfMmKlf4el+0mZ0YOPf
	XFWcTUJ6la2u7sBz/GzH74HonoP4f/4V1EkOvp+6ogkfpjg6scBF77i0nlMu+cT1
	OLu/rq5GQJKqy4eZt/QJzazT1uziowS0BpxrWjepId0cWm63sAO+G+u5S1RdhFCG
	OIZBwSyo/MqzWEFJ/Z7x+Y0alLeQibnkcUEcCk3Uk+ClldS3mMrfX6nk+bj97q2G
	Fok+7xRS9A==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011028.outbound.protection.outlook.com [52.101.52.28])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4c5tkwm6xj-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 11 Feb 2026 02:37:35 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BYVM7GbfAAUDSMUGroEoeaQHQ6F4RkdRjGqMh+GaWRs1mrMn3NRZOhlO1/AQgAbBSQCRBPwWOGvyOpr1zRMiIdtTbdAVSLIT6HIHmnG+NJd2GRbWv+fV2Wu7p++GyRODNBn98GPLd3xcmV7zsL7cY4jvfm42Nv/+2SgD0FwmFnYFEu7NTQKBRa8jt4ZUPNbUc6E3PkoyILxAXfkUiM7DV5WGNdycWRAjzsBaoIXDnRkkssoCPHBTAP1EALloDHlKi/GMo9GEH9UoABEbr6sLaSfkUrmBIzVsuoVsLyjqxl5mrqu6Pn1AbirUhbMLdBhDWxmdYT1znD59Q/KbioIQTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L3zInG6W9DaCAp2qby+2Nyi8MCn/IRJfZw5j50TkUDQ=;
 b=GHhh/ugy7FNvu0WW0mbp/Z2Bq9861hyAWnwzXxcMcmKkT32Fu1JCrr0U3cv45kyIQtAgvp6ms8Y8de48klFPl1cm7KM93p+cB1l1/h0GDqAJnZbjD234oEbgXYpd6J3tOP2jpb1iCWm3NB4q+5jZwAQ6wi/SfzVVpYAjdEHUoO4cTdV3yeKtSD2Yo1NLM87aVGuxdFKVfcSlkrT1WBxtT8JUvbsw3xDYtBCHOPTKvPKnAgT5tBdPKnDRuwnpwkMS0wlO1zZZ3FuGc4j9daNQURBRprbA7pG6PyKFilF9fk66RrSTgjPbx9U6MvjUUUwUaBkNT55xturQdhyVxJIIXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5611.namprd11.prod.outlook.com (2603:10b6:510:ed::9)
 by SJ0PR11MB4973.namprd11.prod.outlook.com (2603:10b6:a03:2de::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.20; Wed, 11 Feb
 2026 02:37:33 +0000
Received: from PH0PR11MB5611.namprd11.prod.outlook.com
 ([fe80::ecf9:dbb:16bf:5b2d]) by PH0PR11MB5611.namprd11.prod.outlook.com
 ([fe80::ecf9:dbb:16bf:5b2d%6]) with mapi id 15.20.9587.017; Wed, 11 Feb 2026
 02:37:33 +0000
Message-ID: <4c9879c8-d2fa-4912-af56-c2e60653314f@windriver.com>
Date: Wed, 11 Feb 2026 10:37:03 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][PATCH] shadow: upgrade from 4.18.0 to 4.19.3
To: mathieu.dubois-briand@bootlin.com,
        openembedded-core@lists.openembedded.org
References: <20260210044850.2866022-1-Qi.Chen@windriver.com>
 <DGBED9UTZVK0.2P2KE59AW872@bootlin.com>
Content-Language: en-US
From: ChenQi <Qi.Chen@windriver.com>
In-Reply-To: <DGBED9UTZVK0.2P2KE59AW872@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TYCP286CA0061.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31a::13) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5611:EE_|SJ0PR11MB4973:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a192bb8-d419-4149-9d8c-08de691679bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|4022899009|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?RGhFQXFEaldBbnZuazZwRCtwY1BwaklINHhsTGlKb1IzVzhha1NveVI1NFRa?=
 =?utf-8?B?NU5mU2UrZ2F6MHdBZVlTeDlFczBranlhdXdhWWpZWFNNZVZWTVIwWkNrdXlM?=
 =?utf-8?B?RG8raklZSEk1amRKUlJLUUU0RzJlZEhSRjVyT2QrVjhGeXdxK1NKVzZVU045?=
 =?utf-8?B?Vm5VUnYyZG8zSVFwWituTUZrVUVCbk1BQnFOeHhQQ0F0dFo4UGVMMGlRNm15?=
 =?utf-8?B?dFFBbWNLQmtNbFlRVDN0dlVYZm01WVFlNi9CYkNpVWM2Q1BmZzdWakRJdit0?=
 =?utf-8?B?U0UvaW9kUFZyMDllVmZ4UFlNYkxvZ0FKRENHQkwxUjduYThzR2tLaDI0NDdh?=
 =?utf-8?B?akxkbE90S0szRnFNYkpHSjBrVEZaMHJzRGdQT2MvZlJWZlF3eDVhd1BOMDI2?=
 =?utf-8?B?OG9DMlBqVzR3MlMxY3NSa1puS0RIcXpRejhOcWhzOVRBdXpVNlREeWVoMEZW?=
 =?utf-8?B?Z1ZSNDl3eGJnb0x5WFJNTUtydW03aVdxY1VIeVA3K1lkcXkrd05UblNOcmJD?=
 =?utf-8?B?Y0ZFN3RzQXZwSS9VbWtMNTJ1cDlqWlRmRVMybVFVY2JWUzRtcWZhRyt4eFJO?=
 =?utf-8?B?TllXNkFSUlp5WW9WSTJ3UThpRzFsMS9iK2JLOHBTZFZRYjRucEQzdDE1SFB3?=
 =?utf-8?B?a2w1WG82YmVsZkI3bzNiNDY3bEttT2k3cDA2NFJPTFNwelFuRGF1MEd1SjFC?=
 =?utf-8?B?UFVCLzNlVXV3cTJvT1U4a3dOZFhMeEtFOFBLSDlnMU5oWjlmTUpNbWZIOWV0?=
 =?utf-8?B?czBPc0JWbGU4WEhrdmhjN244VmxlZDZseGxKR3hTY1EyNkdrelhTUUtjWklq?=
 =?utf-8?B?TitNNndsR3JhKzFLOExRQ0I0Q0lPcTB4NGxiZTNFQU5Fb2VtVnRkY3M2eDFR?=
 =?utf-8?B?LytzdkcveHE4Kzd0RzZKeFI0ckVoNWtUSTAyN3J5SHhHSXo3dzAyVE9RRG1n?=
 =?utf-8?B?aE1odEYyOXJrQjI4WWlWcG1qVVBsTFV0SGVWU0JBT0VJbzZEWVVIU3JlQnRk?=
 =?utf-8?B?eXJYZ01tRDhTU1VXZE1say9ENWF5b3YxOTNpbmpIYzJwaWRhN3ZjMWJZRUVI?=
 =?utf-8?B?UERWNGZPMUkzaE5Qb1huejRhNUlaaWVFWXRDSVR4bnUxc1JtMS8xZHZzL0l5?=
 =?utf-8?B?TkVaZ2R5bFZkcVkxdWFjU0JsNlo5a0VzNG5uRFJMU3ZTZDBtcGxDa3MvMy8z?=
 =?utf-8?B?NWRzQ0FSZkY4MjF2aFFqYVJKM2Q1V1d1cHdjNjI0ckxUeW52RTdtRXoxcWdW?=
 =?utf-8?B?U3VHTjdnRnZZNCttblBEZityNTVJSC9oa0FvVXBtNC9YTnZhS1BNa3VGSjJF?=
 =?utf-8?B?N3oxb1U0ZTRsU1l4RmFnNG1TajJBSjlGTk10c25LS01sTUs0MzRJeDZGWG9G?=
 =?utf-8?B?NS82MUIzWU4xQnlnWHdZRTFiU0tSYjRVRkYra25zM0VyN3FpbExzM1BndjM5?=
 =?utf-8?B?VU5PNG9RNDFYQlVkQ1Q1TjVVSlRHaHNJWTRZcmRoWG1yUVk0Sm5EOHdSOGFQ?=
 =?utf-8?B?ZkU5Y2hGdHB3ZTFvT00yWmYxdkl6Y1Qza29vRTJRNmdZeU5yd1ExUTI3ME5R?=
 =?utf-8?B?bWVWekQ1UFZYK2kwMFdlQzQ4STVqVW1PdjA5NlNQRU9mT0x3SWNXMDNBMWlj?=
 =?utf-8?B?N2Q5NDdYeHZYelp3RjZDV2xNUExUT2ljS2JPKzFUUHREbmx6QmJOK3k0VGti?=
 =?utf-8?B?bmlCRWttMWQ0cUFJZG9YUW12Rk1ZM1c3TlQvemVGUDZNWWU0ZHV4aEllOFlF?=
 =?utf-8?B?dHBHTm9JSHFPeG5yenEvZHF3Zk5iSkxUaUR0SHU5bjBUR3NQVVZXZldqNFVZ?=
 =?utf-8?B?L3lnM3o3ZnVkdTRjR3N4akFUMGU4djd3d2hTMHBTVDRtaGRWV1ZnSEUzcGJE?=
 =?utf-8?B?ZWZja3JLb3BYZVBHSVZzNGtlTlFTOXQrZmFtTWJXMWcxK3RtdlhJUU9icUVi?=
 =?utf-8?B?b2NZSWJIa051L2RrVkMxNG9DWHFLS1NWbGhZUGFpRStzU1h3SVZtdmlxd0ZE?=
 =?utf-8?B?Z2ZaMXhmemRlVlBzRDBTQTVQdE43bGlOWmY5ZXUzUGcrZ0x0aCtwZFJRVFhZ?=
 =?utf-8?Q?pDAJIn?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5611.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(4022899009)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?cEE1TmlIWHR4d1FzYk1WS3p1MHJTUE9GMURtbDlnNDM0L0F3MlczSURqQ0dF?=
 =?utf-8?B?TmMxTHVuRFEvOGcyUU8zNFg0Szl3MWdPbncwelVnRmsxdE5iUFBsS1hNUzhY?=
 =?utf-8?B?VTVQU0ZuN2ZKY2tpcGRUK2ZaaUpUV21YeUhueFgrOFg1T3QwdTc1RGdRT0lU?=
 =?utf-8?B?MUQrYVJuRzBBTTE1Z084bmhHRU1ES081ZnVkc1MvUmI4ZVlnU3RqdGdraGFi?=
 =?utf-8?B?ZmQwZzJYLzNaaFh6U0ZPaG04elZDYlh5Z1dCRjRsQVBlRXorN0VpUUIwTHZx?=
 =?utf-8?B?cXFWOHZQV2laVGMyeEVsVk44VmZha2RpRTlMQUdxTStPOXYzaTNOT0ZQL09m?=
 =?utf-8?B?WFJHRE5LTVA3M1dGUzFaOHJwY24zemo0bE5uRVFUMDBscnU0RW5IRWlxc2JY?=
 =?utf-8?B?T1A5WnlsTFc4ZkVSbDd2MTk1ZmJHN2RTaHBoQXBmbEFQaHJjMDlGNDNlMkdO?=
 =?utf-8?B?RlhyNWNZNm1BbzlVd0JPZDdNcDVYUkNkdkhWenBUc1Nkdnc2a1R5ekZrS0JL?=
 =?utf-8?B?TXU5RGdaZEJQWXBxeGJ1NGJDNTM3bDRvL25nYk0vMFBUSzlhdU5CcHMzRlNZ?=
 =?utf-8?B?dGtyMUFNWXNIRm5pUlJOcUlKemUvSjUvdmpudFpXbnFObkc0WmFSTGtBckRt?=
 =?utf-8?B?ZEd5cmkrMjhNOFI2QXVUUHRITE00L3hPRVlwYTZpcjRiS0FqblVubnkyZ29I?=
 =?utf-8?B?YVRIQmcwT3lZS3g3dEFKQi9RZHI5eXJyWW1KdkFseUdjNmkvRFFIM1dISWl4?=
 =?utf-8?B?SldrWnZpdXJZbldkVE5Sb0c5Q0txS0xoaUpIbFBzalVJQUhUUlBaRnZYalV6?=
 =?utf-8?B?Nll4UERvbVkvdWliODN4dUJ2OFZ3NVJOUlpnQ2tNcHUydjVGNUJ4VTMvYyt1?=
 =?utf-8?B?MGhYRmVmclFlYkFjaWpnQTNEaHEreit3WWt5dFdBTmNxUlFnZjZjeCs2RkQr?=
 =?utf-8?B?b2NPLy81dU1Yemo2bTZ2QWhudDQzYlNjaVcwZjBhdEpiV3ZiRHVobnpXUmRo?=
 =?utf-8?B?VW0vM2h3ckRxbTM1S0dKdGxlbldIY2g2eXY0RDAwNytWbVhaUUpZd2ZOejZ1?=
 =?utf-8?B?clgrL3lRUWxyR2pHQUdhMTBOUks5UVVqVVpvTFJOQ1VYLzhNR2ZLclFtcU43?=
 =?utf-8?B?OXdFWi9JWjltMW9yZ1NnL2VCZHhKTzFNbzBSN003amlRVHAxVjZMWUw1T0xR?=
 =?utf-8?B?RXpWVmRUSWtMWHgrOW5BUDdRUTUzRG1mN055dTU4TzV4RzU3L0p5Y2cvTUtZ?=
 =?utf-8?B?cmNmNURQMUY4ZVhhZmNGVlFOcHh4OXNxSFp4ZzN2RFRxME1MTnQ5Z1VPTlhI?=
 =?utf-8?B?QUE4WDMyWnMrSDZ1YVNDbEU0TUtHSTRyVm82RzNSR2RqcDUzbHBkU2cydnYz?=
 =?utf-8?B?UmtDM3Y1YlFsdk5sS2prQ1FDNEdFUStESTcvRWtqMUdleUZWNlVZUGl1Z3Ax?=
 =?utf-8?B?U3o3Y1dRelhlbm1PZnMzWXZEdXJkNFhuODk1bENDUnRqMGVaL1N4emhnOVJO?=
 =?utf-8?B?WWpmZkR0NE1oMXRJVlhZM2dnWDlHcHEyb3VNcGF2K2lnRG5DTVlwalpqbVdZ?=
 =?utf-8?B?b0o1TWtJRW05QUpFKzNHbUdpSWFLRHE2Y0hJNFlkZVg2L2tzVFlQdW5DdHJk?=
 =?utf-8?B?UXVWbVZXQzhBL1hHWE1BTkJwWUFNOVBOc3ladC9yaWxzTlU4ckpHMWtTTWlT?=
 =?utf-8?B?OFh6Mmo4RUZ5MnFsY2VVZUszZ3FqL3VPOXl6NXZ6UGd0M1dJNHlvU2ZqOTk5?=
 =?utf-8?B?aG9ES0VXNWZ0RW9yaEpJeTNZcVIvdHdnYlU0R2UvUXBWcDh6RGdGeW4zeGV6?=
 =?utf-8?B?UVEva0Z3N2QzRXNkOTY0YnlvMnl4VDhJWVVhMUtYNGlJRmtZenBWSjJ2YkJC?=
 =?utf-8?B?QncwMEt4ZDZXK3djcDdoeDg0VWo2TzNGMytvQUZiMHdEVzRBdHFIQXVRdWZm?=
 =?utf-8?B?enIwZlRSNmVvb0NXdmV4MUJMRHdicEdiemw3SXVjU1IwcEk5NENGQnlGZEVv?=
 =?utf-8?B?bXVVcTlEYUQ5bnliYUVyYmhhd2hSWGdSSW5HNENyZ0h0MnQydWtYYm52Zk04?=
 =?utf-8?B?Um90Qmg1OUlsQ3U0MldDRHgrb1pIaENxVElrcXNaTU9RdjA0TC9qT3VGUDY3?=
 =?utf-8?B?djJlMjdKKzJrMGk5b3F1RnpnN29ranpkQXdzcDdVcHYvNUI5dEdOeTEwL3hX?=
 =?utf-8?B?OVhNRDk1M2ZxMFJsTEhoUlQ4eCt0bmhrOFIzSmdzUVBQM1hURkFGa242TkF5?=
 =?utf-8?B?TXhVeXd0bG41M3pvcnZnVSswdm5GSnVYNFBibndZM29MZ2ZoVnQvTjBsTjVR?=
 =?utf-8?B?bFdjRnZjR0pzNlEzdEw4Y2NERGE4TyswMG1UbVVnbDZVeDhGekVPdz09?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a192bb8-d419-4149-9d8c-08de691679bf
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2026 02:37:33.2110
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: solrY91fbEfiZg+sJqCm6q6y836wKpX84xNF4oo6mzwPxbbqPk2xu7OlvZStrzqB3EV6wcqtAZx5wBbd9B3R0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4973
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=bvBBxUai c=1 sm=1 tr=0 ts=698beb70 cx=c_pps
 a=GsI8iPYaTsLAaW3Q0Q+aKg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=jVwDQN0dAAAA:20 a=iGHA9ds3AAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8
 a=QaxGZeoUi6Tkj1E2X9QA:9 a=QEXdDO2ut3YA:10 a=nM-MV4yxpKKO9kiQg6Ot:22
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22 a=bn7x_FpfJtc3yKQXRW3z:22
 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-GUID: pM-5_NeGiL_LxroG3XsF9KuZcjjAlgtC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjExMDAyMCBTYWx0ZWRfX6DHUpPyXk1QY
 xrSHsLe7+PaD4amGEBT8SJFFXGWqWx37RFBmFsRyI1JS9jyBW9Sq6gz7md+U6ecvSplY7nAlD5k
 pmnoJ2bEuuZ4BK+mPuP4r4q8z8ojdvPZICAasXNkvavi2VaKIpKjMC7sFXoK6ben1rAS5QLh05r
 +2qurLoH2RpwYqRcEVGcyohofmA9OXC8cLzr/Q8ev73+3tSMaeokz3QKrwrnFvxaDWUWhnx9bRj
 CLAtQzznkkdDMfViQRHveAscidnEHAQ41lsiYHz5HpJAShCvFQx+XGCVf2b2OQEsq3Bgad4fwJB
 zwxuTYC4q9gbV57wmQYGy1e7vW8a1kG1t3xQ2wumWpMht+fazWhNi7WF6djGMXIXVONByQLPTZ3
 YMAGVE3bWljSEUTwH1F84PaJPkeiuswFCVIL2+/aWeDPW2mzwpQTH7/xgcbyzFXMoDMKOgKKkMj
 r0BrUJhQoPQ6Yoy9JZg==
X-Proofpoint-ORIG-GUID: CY6QNwYMZVQ3x4lfeQ_VSvw61oVX0YNa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-10_03,2026-02-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 adultscore=0 impostorscore=0 bulkscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602110020
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Feb 2026 02:37:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230947

On 2/10/26 23:46, Mathieu Dubois-Briand via lists.openembedded.org wrote:
> On Tue Feb 10, 2026 at 5:48 AM CET, Chen Qi via lists.openembedded.org wrote:
>> From: Chen Qi <Qi.Chen@windriver.com>
>>
>> The major changes in 4.19.x:
>> https://github.com/shadow-maint/shadow/releases/tag/4.19.0
>>
>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>> ---
> Hi Chen,
>
> Thanks for the upgrade.
>
> It looks like this version fails to compile. Given the error and the
> fact that it builds on some machines, maybe it is linked with the host
> gcc version?
>
> ERROR: shadow-native-4.19.3-r0 do_compile: Execution of '/srv/pokybuild/yocto-worker/musl-qemux86/build/build/tmp/work/x86_64-linux/shadow-native/4.19.3/temp/run.do_compile.674478' failed with exit code 1
> ...
> | ../../sources/shadow-4.19.3/lib/sssd.h:14:18: error: parameter name omitted
> |    14 | sssd_flush_cache(int)
> |       |                  ^~~
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/6/builds/3175
>
> So yes, we have a static inline function that takes one parameter but
> does not use it. And the compiler is not happy as it is not named.
>
> Can you have a look at that? Maybe there is already a fix upstream or
> one could be submitted.
>
> Thanks,
> Mathieu
>
Yes, I'll look into it.

Regards,
Qi

>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#230913): https://lists.openembedded.org/g/openembedded-core/message/230913
> Mute This Topic: https://lists.openembedded.org/mt/117733474/7304865
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [Qi.Chen@eng.windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


