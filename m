Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 352E1D3517D
	for <webhook@archiver.kernel.org>; Wed,  1 Apr 2026 12:41:20 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12159.1775047277916630575
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Apr 2026 05:41:17 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=IF6UCI9g;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=85517cb114=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6312Fm6S808174
	for <openembedded-core@lists.openembedded.org>; Wed, 1 Apr 2026 05:41:17 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=CYO8YVQqFUVXk+2twXYSHUrFIxaUk2SnLZ7JqJKcLW0=; b=
	IF6UCI9grJadkeqVByY4T6H8L5omCToYMwdPC4p4CRjiXG1f0e35kfUG3Jk7t1T5
	0axJn9L9Immf4QHGoxUeQYVxeRvAWxflRPWSrKfMlWSaw46S0PHtz5CcvAZdXCWk
	5BjL4m49M3UfomToMSHoIDvAJMsSG4EEQyiPcc5tJlljvmWdqh+0pLeuOTz9aBPc
	Cm4HgsgHiuJWP6rxhPsKg3ytH2nFC3MVdo6m+og99XHKmbpen2YbLz9MfDHalQFc
	ANLvCWEyprNePTwqDDoLr+x4oCAMndveim1GPX5DrRGUIB9NHNVCzU65nowr5wzC
	iQNsJEgkidnSMeuptgP+kg==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012062.outbound.protection.outlook.com [52.101.43.62])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4d6egbw7n9-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 01 Apr 2026 05:41:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IXYqVAX1Cv2Er1rlxrdgMeAuyeoQ2m4q8lKdREiR1mgvBOdtloeJbf/3m2yzg2To4SHMiV3bGHeE3nzndNtMSx99jeZtM3ur15ms0SbEfOQ47wlAplbStEwroFoNUUicOHJ+dUwHJLxJzfCuFSSB3lgsTU1biCT5Uiq2cYs49rZB4+Znv2TxeoDmdyUoKr2ms52tJNCnqOYUKjyLO6dhx5ke+/7f70dQoKzGH2I3LvkJlKR4SROD/d4lVDAA44Bvwq4O658ezSPDk6uQeitdSsbUpSci9Oth5Wiz88fNyxZh/B5rXq6m/aueDtYsi47WB05LL4MUaEb28gdXkl8J0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CYO8YVQqFUVXk+2twXYSHUrFIxaUk2SnLZ7JqJKcLW0=;
 b=lJVQBJy5y48mPFSSjO9JyWC4wuxiiK1lTsxIt4lTLJnrRBCx8O5Mx2tQj+FyZL7VUm35sFPaTePJ29IjXfmpcGmqBRhdokOOJECO/RiudG+1MTzfOY7nOjolKNP+iruwHPPSUgYZ3WIBOoaYvE4CTrQ09bacM5E1B7535Qylnq2df2YEwJCQaPZBEjclibX9sdueetOLN8zDFoeI5X2Ou9lAOyB+ZLqUKenNIM8r0aDigJbOl3RFgkC6G21NXMhS6CuLovBeP81pWrjSn54jWX0Mk+96F+lfdWN00YxOebOevrP5t4RUO5T+g2gDRe8f71vIsxMQdLJnEzamZtVRJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5651.namprd11.prod.outlook.com (2603:10b6:5:356::20)
 by BY1PR11MB8077.namprd11.prod.outlook.com (2603:10b6:a03:527::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Wed, 1 Apr
 2026 12:41:13 +0000
Received: from CO6PR11MB5651.namprd11.prod.outlook.com
 ([fe80::ff15:8168:45e5:396a]) by CO6PR11MB5651.namprd11.prod.outlook.com
 ([fe80::ff15:8168:45e5:396a%5]) with mapi id 15.20.9769.016; Wed, 1 Apr 2026
 12:41:13 +0000
Message-ID: <ceebb344-ebba-4da8-b80a-75212151f834@windriver.com>
Date: Wed, 1 Apr 2026 18:10:53 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 1/2] binutils-cross-canadian: Add missing perl
 mpodules to RDEPENDS
To: Khem Raj <raj.khem@gmail.com>, richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org, Sundeep.Kokkonda@windriver.com
References: <20250930123901.949798-1-Harish.Sadineni@windriver.com>
 <d04d310ec882ddea6f9578eeb65d99cfae1abe69.camel@linuxfoundation.org>
 <93d2d7a5-a6c7-4b0c-ad89-01be28b407ed@windriver.com>
 <d63a917901287e45aeee4b6b256615537124c2a6.camel@linuxfoundation.org>
 <CAMKF1sqqwTwN2z1=rFbUVgFm3sFdd48MvtXPt3=B5_+MZJi26Q@mail.gmail.com>
Content-Language: en-US
From: Harish Sadineni <Harish.Sadineni@windriver.com>
In-Reply-To: <CAMKF1sqqwTwN2z1=rFbUVgFm3sFdd48MvtXPt3=B5_+MZJi26Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: MA5PR01CA0214.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1f3::10) To CO6PR11MB5651.namprd11.prod.outlook.com
 (2603:10b6:5:356::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5651:EE_|BY1PR11MB8077:EE_
X-MS-Office365-Filtering-Correlation-Id: e5f67486-aab3-4b31-b43e-08de8febf54a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|4022899009|366016|1800799024|376014|52116014|38350700014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	/qoT8voTc0fC5FsYjZVtBwZsbWFaDB1Fdx+NqZ9GudC5fQGmSGpWfOOaLrn70Rf5eTejApHhV2NbdFcvm3f1IHt7JMXhMEhQSvifSfV4nNcEh0H3is6lDi55LUynqQ3vxggCj0mrCgDljyDQ7VeMhk/zW/FYiy6F8n52iZq7F12G+zxcVoO+RpssY6SYxWc4Nb5MeR0OBz4lBotomnraKwIGB+kKKxiOuEftJPlyr2G9Nt9uvIMG01nrQadzeqeRv7D7NqPRTYNBeZ/xpKVjMlx2iW+WBuQ4KMtAAAtv9zNs6t4IVATxZIj7b8+Zv+IuPxOf3SWACymFtjKgJwVTJ+HQchndd/N7R7eNeTub/J2nyizNfeXK+tvXmtrvmUUGHUJ87hGBgIDrh6tpkpb3WgrUltbUQ8qPT8tXkRUDXm5YTnUxk39MbCVvi3c96XRxcqwX6viwHtNKPN3qGAm/z+Q+Jl33MbfufQgNcA7Z3MEnTFqxstVAu2Kwm//KH+r3DNohkns7n+X0JzLys7UWO8DwAv5qJZYPRborjHYITJvv9/Xaqqj3JMDl80jogw7/C4+eNKoP9ZJnqgjVNP30TkKn1gg7m7eqDLyGi4B/3x0G8iAo6WkAC2+wUnBGRcGjPnBlEEK3eg+pgQi/3166XeqBfBIkvNFaUbNbMyqbhanKeKjWvgEiLGBB7A5tqDgS0Pt00o5jqzkhgQP6Zn1DtaDQ683uhPkJr1O9WSJn65KfHtdZOcHE0H+/CL6v05XJ
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5651.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(366016)(1800799024)(376014)(52116014)(38350700014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?YTdaMWdvY2owa0RHQkpGck5IQ0lEMzBSQ1dOcm5ZdEphdkNKbFg2SERFUU5q?=
 =?utf-8?B?L2QvNXpNdWVQNzEwZFN2TmZnRU15WDNvc0haYjRTNXB6V0hheWNENW5xYlVj?=
 =?utf-8?B?VDBqMFVldmZodnR0Y1BVdXRNQ1FsNFEvSlNqeFpwUHJmWkdFRkFSUW1rdk5J?=
 =?utf-8?B?aWdBSHhaMzJqeG9sek1uMTlNYUs3R1JOaGp4Ky9hRkZqeU5CRXNYYXUrMU9y?=
 =?utf-8?B?R25RMW8wWHhrS1pkSTNldTQ5NWJic0ZRaDFTcVFjc1pjdTRnTElEMDhqVGJx?=
 =?utf-8?B?aXpNQ09UNEZMdktIVzNCUTlwMmdCUm9sRDlobEJUOXZNdEs3Zk4yNFRCMFVC?=
 =?utf-8?B?TnlLSFhEQy9sNU5mZk9KSXhDNVFKWU5NS0s4ZGp4QzdhbnZINDVmWUJ4aVp3?=
 =?utf-8?B?a3M5QXdZNjgyTm50T0ZLNmtWTWdFaVJqOW9XcENjOTk2aGlJTHZ6MFcrN0s4?=
 =?utf-8?B?TmVYbmRRWHcrRDVwVm01dzM4aENDbCttVDdJNDFYUjRtMk13c3BmMjExSTNS?=
 =?utf-8?B?ZUJGWW5MTlJrK2JJOWtZSUtnTkVGek9jSzlnMmtFdFFPbXQzUVlhNkIxb2ox?=
 =?utf-8?B?UUNVeU1lbWZMSGZudVY1bC9FRUI4U0crdmJGemtJbW0wRFNxZ1JzSG5aclJW?=
 =?utf-8?B?TUgyRDJKejQ0eGJuYlpveGdLeDB1ekIxTEJoM01PZnJqUm9sVWpqWDlxb05S?=
 =?utf-8?B?NlFhemZCYkpXbDE4UmN0N1Z0V1ZNVnp2bkpQVmV0aWQzdHlmeU8waUpLWjdp?=
 =?utf-8?B?bnRRTFBpUUU4eVNsWlJ2am5KRm00NHVFdGxIUUNTWVVRL3VzYXgzdVFhQk1u?=
 =?utf-8?B?Sy8ydng1dmhybUtTMFhLOTNQcFIwWkM1WUo2T1dJdTg1aWp0MWk2bkd0ekFo?=
 =?utf-8?B?ejJxeWw4RXZzV2VHU3VvMHk5dmZKV0Rmem9kd0ZOQ3I4SzRVVFZnMFloUkRp?=
 =?utf-8?B?RVNxdDMybW1iMTBRdFBFVzFSa2UxWmREVGNseHhZbVl2WCsvVVhsOWpCYXhs?=
 =?utf-8?B?Umlhd3hiN3FvYTArSjVBNkZ3eFltWHZrbW1lK2Y3SFlQQzBGVzNFSmVVYzRp?=
 =?utf-8?B?a3R0REprSWhUVkVseUVDMjIzQ2tJbXdJZDlyMlF2b2w5b0JDUFpqMXc4R2c0?=
 =?utf-8?B?SlkxcUdIRzlMSUlnR0h2RmVRS0tpOUV2blpKejNtQmlaVGtpN1JWWHcrdXF6?=
 =?utf-8?B?T3lXbTl1dStMWmsxN1RxM25uTUFPWEd0SFN4Y0lqTFp2bkQzV05oK1ZSRUtV?=
 =?utf-8?B?dlAxYlJtempuNTN3T2pCVG5iVUxuRkhtZ3VjdVk2UzRCanltbER6QnNyeVdJ?=
 =?utf-8?B?YVc3a004MkUvYlFPQUd0VDJZZEZBQURiZ2RzUTVsalBWV3NUMFdzY2UwK3R4?=
 =?utf-8?B?aEc2MDBxZEMzOUZNbHFkYTZaSFMxUlBaalRJWnBwb1ByVmZqR1QrdktwL2NW?=
 =?utf-8?B?VDFUZ3ZkZ3pnZHpUN01YbG9RNzZ4R1J6MTh1Y3YySFhEU1BQdlhrS3NOcXdC?=
 =?utf-8?B?a3BSa01mNHRyRkRDbS95T2o4SFQ4ditDWWVyRFpYU2g0TkFlcmZwMzBYNmdF?=
 =?utf-8?B?c1BCQW9vME9zWU9GVCt5RnZyZmFyU2Fpb0MxNk82ekhYTTlrN1dLelMzVkty?=
 =?utf-8?B?MTFpa3BIbHV3bWYwRmRxa1N2eTRvRW8wTnB4U3hiV0dPalBFS2FoYnVpWVp3?=
 =?utf-8?B?Zm4vczduYUQyNFdIR1lHWUtaZnpXblV0VE1TR0kwRjFRYjByUWI4T1lyeXly?=
 =?utf-8?B?QjE0a0I2TTlTNWg5WlI2RUdqRlo2c25idWE2YS9SMzhxWUluWjFyRldEMjRu?=
 =?utf-8?B?bVMwSGUwTjgvR1k3S2VjWWl4dDJxL1doamJkb3VSWDk0ZFJRdXJRWWVRNFdy?=
 =?utf-8?B?YXlkSWc1NVVOUnBCaHcwZGMzNXUvT0VCNEVObTRUNVVSSlJOdWpkekNFS3JJ?=
 =?utf-8?B?QjNGYy9FL1lJaFBOVkV1cFNPVFhWRCtDTmpJY2lsc0pHTHIrUk1nV1B6Tkdr?=
 =?utf-8?B?M2J1MGRCUXhmMDJqbWNKeEFKYWdNVXYrTkhFWHJzazNPTmdWRWZxY1ZCVnhI?=
 =?utf-8?B?U05wWFJqYXNKSnlEQ3RMU2RQdkpud2hreXhMNHR0M3p5T1RIQTdaK3VPd09r?=
 =?utf-8?B?Wjhmdi9PVVErUHBnSm5rci9Ja1dBUmttRWlCQ21teEs3QVdqSGdpNzBiTlU1?=
 =?utf-8?B?VWtyekdBeGpyWXd2NUU3bU95b3VoMS9QdVk5dkdOYS8zRUdyNEFrbVdqdmdi?=
 =?utf-8?B?aDF3N2poYnJhRUZGMlovanQ3U2dvc1RVWTZ4RTgxYVpDYml3RHpWM2NRMTBM?=
 =?utf-8?B?Wk11YUU4M2g2MWo5OEgwTkEzWEpSdGMxazE5RFBDS3VJWTR5VkdRY3FKY2oy?=
 =?utf-8?Q?lTqozcBiugjHXdwY=3D?=
X-Exchange-RoutingPolicyChecked: 
	XJDfz4H4jg+JlqIggMv/ffuLr6Hquo/5mM1KIPjUOsTWeK33aFfDH7SNdnuZ7j8XDVxz6SPqFV8Ib2B2wTrZeXt5WPlLf/9r79FN9ld6KCnS/xo3IxljQbAd43FuayDJbJe85makAOJnGc0oWjF01eskfCtJX9hnc+94EoZ7D/7Mwi/Q4aUWhq5SlTvRPOz6IxRgJdb6AIvxCXN1RoKgPHS1P38aFmQQe1NFwMC3tL0ebNtTvrfQwOIz/Lopd+WR2qxBEqTVel5bTrmPVaK+MHvUJ7DzDQ4nMUHI4dO1y/pYu7wybd3x74qTTn+JLTtszsTKHACXazF8wjEkcYVARw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5f67486-aab3-4b31-b43e-08de8febf54a
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5651.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2026 12:41:13.5151
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D/zKb1XeFXEWgBfb2hIfy5kNeYE6GWbs6LzxJQTCr8KBLuxiv6I5bi24rqb2gfYgzNQYOW6+sdExI+UOujlRcTAdAC8PDor5kYhwX4LnEZs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR11MB8077
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDExNiBTYWx0ZWRfX9ZC5lfWFcxm6
 d/U47ixXHrxGjVnC5uWjxmNGH8E88VFRf1N+A38SExZ2dF4X2Q0dZAypXMl2rKEIgujBjKTQlqC
 cqNeeeBZl2dL3n2B1W6r6B6lN7JylTVUe6loHZa59568lFoSX3/4xaeNyd6/gXl01/ZSl1Lhf0I
 uF1zFXZp42MuaY4knj/S/C/XFhqtLr99CRTj8j7pWyt7QVIbpjXUmIyMnVLACku67m//A5PmmqW
 JK2cubxX8y27ApgL6ntXNgQcwyR365AUJPm8/GqklzTUIb3mdtTPIWk3jIBgBwY6Qdx/qkesn2v
 oJkFllXAbPAAMYvA5SGn9zzDb6AhuXJghDI4RNmOUl82TvV4KV42+EmEFcETFRUFlR0yeSrW0wv
 AcEr/z2QsDdO5wdlYOSbXXKP83KrilkJ+gRPOdvSae2wOTjALv8ivEmav/Tm/OIiUkOasw9Mj69
 VHEmctz28g8wUehhocw==
X-Proofpoint-ORIG-GUID: GyK-ROQlOYs7zLbEdLKEEyxR5nVROGzd
X-Proofpoint-GUID: 4eK9dnv4EvQ-FEu7RtFEogIF7Lq3OUhr
X-Authority-Analysis: v=2.4 cv=fvrRpV4f c=1 sm=1 tr=0 ts=69cd126d cx=c_pps
 a=qMfGPIaByV4ZnHoTJsbowg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22
 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=I6fOfVh3Xcv-51cTHW0A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_04,2026-04-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 clxscore=1015 impostorscore=0 phishscore=0
 spamscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604010116
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 6312Fm6S808174
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Apr 2026 12:41:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234347


On 10/1/2025 10:26 PM, Khem Raj wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> On Wed, Oct 1, 2025 at 2:57=E2=80=AFAM Richard Purdie via
> lists.openembedded.org
> <richard.purdie=3Dlinuxfoundation.org@lists.openembedded.org> wrote:
>> On Wed, 2025-10-01 at 14:17 +0530, Harish Sadineni wrote:
>>>   On 9/30/2025 7:17 PM, Richard Purdie wrote:
>>>   On Tue, 2025-09-30 at 05:39 -0700, Sadineni, Harish via lists.opene=
mbedded.org wrote:
>>>>> From: Harish Sadineni <Harish.Sadineni@windriver.com>
>>>>>
>>>>> In sdk while running "x86_64-poky-linux-gp-display-html --help" giv=
es
>>>>> following error:
>>>>> $sdk/sysroots/x86_64-pokysdk-linux/usr/bin/x86_64-poky-linux->
>>>>> ./x86_64-poky-linux-gp-display-html --help
>>>>> Can't locate bigint.pm in @INC (you may need to install the bigint =
module
>>>>>
>>>>> By adding the following perl modules to RDEPENDS fixes the above er=
rors:
>>>>>    nativesdk-perl-module-bignum
>>>>>    nativesdk-perl-module-bigint
>>>>>    nativesdk-perl-module-math-bigint
>>>>>
>>>>> Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
>>>>> ---
>>>>>   meta/recipes-devtools/binutils/binutils-cross-canadian.inc | 1 +
>>>>>   1 file changed, 1 insertion(+)
>>>>>
>>>>> diff --git a/meta/recipes-devtools/binutils/binutils-cross-canadian=
.inc b/meta/recipes-devtools/binutils/binutils-cross-canadian.inc
>>>>> index 7d7ffe92ce..9dc73fbdf1 100644
>>>>> --- a/meta/recipes-devtools/binutils/binutils-cross-canadian.inc
>>>>> +++ b/meta/recipes-devtools/binutils/binutils-cross-canadian.inc
>>>>> @@ -5,6 +5,7 @@ PN =3D "binutils-cross-canadian-${TRANSLATED_TARGET=
_ARCH}"
>>>>>   BPN =3D "binutils"
>>>>>
>>>>>   DEPENDS =3D "flex-native bison-native virtual/nativesdk-cross-cc =
virtual/nativesdk-libc nativesdk-zlib nativesdk-gettext nativesdk-flex"
>>>>> +RDEPENDS:${PN} +=3D "nativesdk-perl-module-bignum  nativesdk-perl-=
module-bigint nativesdk-perl-module-math-bigint"
>>>>>   EXTRA_OECONF +=3D "--with-sysroot=3D${SDKPATH}/sysroots/${TUNE_PK=
GARCH}${TARGET_VENDOR}-${TARGET_OS} \
>>>>>                   --enable-poison-system-directories \
>>>>>                   "
>>>>>
>>>> This is probably the right direction but shouldn't this be for the
>>>> gprofng package rather than ${PN}?
>>>>
>>> Hi Richard,
>>>
>>>   In the SDK at $sdk/sysroots/x86_64-pokysdk-linux/usr/bin/x86_64-
>>> poky-linux, the script "x86_64-poky-linux-gp-display-html" is not
>>> pulled or packaged by the gprofng package.
>>>   Instead, it is installed as part of the binutils-cross-canadian
>>> package.
>>>
>>> Adding the perl module dependencies to gprofng package will not
>>> resolve this issue , it would be effective only if "nativesdk-
>>> gprofng" is explicitly installed by the user.
>>>
>> Fair enough. Should x86_64-poky-linux-gp-display-html not be part of
>> the gprofng package though? Perhaps we should change it to be packaged
>> there, then add the dependency to that?
> right, that would make it live with the right set of sub-package as wel=
l.

Hi Khem, Richard,

We attempted to package gprofng separately from binutils-cross-canadian.
We=E2=80=99ve verified that under the package split and its working corre=
ctly,=20
and gprofng is being generated as an independent package.

However, during SDK population, the gprofng package is still being=20
included along with the main binutils-cross-canadian package,
even though it hasn=E2=80=99t been explicitly added.

I also checked whether there is any code that packages all the packages=20
created under binutils-cross-canadian,
but I couldn=E2=80=99t find anything relevant. Is this expected or do you=
 have=20
any suggestion.

Thanks,
Harish

>> Cheers,
>>
>> Richard
>>
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#224204): https://lists.openembedded.org/g/openembe=
dded-core/message/224204
>> Mute This Topic: https://lists.openembedded.org/mt/115512852/1997914
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub =
[raj.khem@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>

