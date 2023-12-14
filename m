Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29EAFC4332F
	for <webhook@archiver.kernel.org>; Thu, 14 Dec 2023 09:44:57 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.18482.1702547095998197102
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Dec 2023 01:44:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=kz+nVL4h;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=0712f56345=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3BE6eDNN020274
	for <openembedded-core@lists.openembedded.org>; Thu, 14 Dec 2023 01:44:55 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=message-id:date:subject:to:cc:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	PPS06212021; bh=Udf49jCrJWKWAWxLlg7ihjc2b+WDHiifUXwueWYxHTA=; b=
	kz+nVL4hR3L7F3hwyH6jE4VKIbckW5/qIRxH/6V8TfPo/fHIkxnyuLtMDTtJWVvN
	4yUvWK5KDfGc/n+1cmLjO4/RjIGN2G2dFns/KIr8CWF/LVjHV8Mamdmrnwo8c4Th
	972n8qTK/ndbBXRd9guJVsydvReiH8i4pFPbgg3PVw/FeKW0KzSaP6tRC5NnZoye
	/rzhxvxdj15Fruqe4iKegb3ur6iV8ERSB5LuB3yeqjNQvyxKO75l6JZwB50Uvch2
	GNU78JzsMgX18wX2ffij9xlxyt3PAcYHQayZBnVdGKKr7YjPDfXNIkGN65or1bJ2
	Peh0+l/gr9YGebZNDhGhOg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3uyr7dga3s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 14 Dec 2023 01:44:55 -0800 (PST)
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.24/8.17.1.24) with ESMTP id 3BE9f4t8029670
	for <openembedded-core@lists.openembedded.org>; Thu, 14 Dec 2023 01:44:54 -0800
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam04lp2041.outbound.protection.outlook.com [104.47.73.41])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3uyr7dga3r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Dec 2023 01:44:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gBMjs0q+Mhw6JadWBJ4PgwPXshiHVNPW/AUZa3LUNgm6CWBfrwKvXCBqfEFf4WFdls4ckihsAduQNKG1BCXbcxt0bZPGgrw5cnd2hqI6ZibYQVt2FH8P9UgfMUd8levISfIN/0EmYcgXgmyWAsq2j/nJZuCFQxoeH41d6qNQonIlJXhp45gmH1b9d9gDDB8L1GLK3lkls56a+iaqqnkzvjOesqSxyjzCYDuoWI6oezDU8MZsvTjEgSDcKewbpFKiu+2Xj0KEtFRyyi9z6Kp60G5fFdcn4x3fEiCX0QhogDfhD5RSnsmYFKpwzAWaYAAiJu+Ix9LxItyte6Q5fI/EOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Udf49jCrJWKWAWxLlg7ihjc2b+WDHiifUXwueWYxHTA=;
 b=R7TVIFft9riKyY65hgqmekOPiFMoIRUhtMnYi41xBoV82bEk8qJHLpZpTJJlWmIn4uGFL0DPoRN7KfKivIGmlJcf1sQDN4sLGWlxhXX1GE1EQAPNwQvZw7fGteDa7c5DfhOz6C8o3osEtmF7evczStN0a1zkg83FlrxXN1MkkmBIrs9Rlk4yGiTq2tCr4J02ZE2M/gs+mGNzT+NSVk0MLe9UthkItflnYqC1ttj4f9/K7DtOJyHTAra/k3bY3bggdYaDkwUpfmtllwD9m7RF/TpiD8Y9K6WsrJKKbSGgkqTZmvUzk7BcAoIzJV1gkIqpWqCpN4aEf3+3NgbtTIcG9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from BYAPR11MB2789.namprd11.prod.outlook.com (2603:10b6:a02:cc::11)
 by CO1PR11MB4948.namprd11.prod.outlook.com (2603:10b6:303:9b::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.28; Thu, 14 Dec
 2023 09:44:52 +0000
Received: from BYAPR11MB2789.namprd11.prod.outlook.com
 ([fe80::5d43:ce18:14be:b2f7]) by BYAPR11MB2789.namprd11.prod.outlook.com
 ([fe80::5d43:ce18:14be:b2f7%7]) with mapi id 15.20.7091.028; Thu, 14 Dec 2023
 09:44:52 +0000
Message-ID: <6a650579-d140-4635-a9a3-db08a1dc7e4b@windriver.com>
Date: Thu, 14 Dec 2023 17:44:44 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v3 1/1] nfs-utils: Upgrade 2.6.3 -> 2.6.4
Content-Language: en-US
To: Ross Burton <Ross.Burton@arm.com>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <cover.1702306082.git.liezhi.yang@windriver.com>
 <fbf5151e16f5c406e752c3e221d8ebdb5286c7be.1702306082.git.liezhi.yang@windriver.com>
 <08A00A79-3042-4BE0-B549-6D4395067DB3@arm.com>
From: Robert Yang <liezhi.yang@windriver.com>
In-Reply-To: <08A00A79-3042-4BE0-B549-6D4395067DB3@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG3P274CA0003.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:be::15)
 To BYAPR11MB2789.namprd11.prod.outlook.com (2603:10b6:a02:cc::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2789:EE_|CO1PR11MB4948:EE_
X-MS-Office365-Filtering-Correlation-Id: 969268c9-1b38-4549-d786-08dbfc895242
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	+7pzd8qu/592rLuf0/DLlhUEHhuWSjsXMvXA54YeFxw7xyKshMvTrHvd3AqqsC5BDWEkqJC3CiTvqzMN5QbNXrgMMLCbSSTzHQs28ZDGqcy5zZW9cVtDpB4ISZfLWgO73K8HzEc37Tw2OBO5mkZbv+L7/3k80mqWdLELIzrPUMMQQzJf0npQthPZw2gdRHO+NwVA8OG0iDxaYuzGxVJdzNsDT8Lz4qDLxzPkNcPHljEjTVODXMZhTc+fMso1ExBfEl29U/drg+r1Ot2GVxF7lpXqyizFJPggrvhjeUYlFMZW4d2bcW/MySlMIL5qs8LwX2pazXe3KoSauMi8SFl8606UPppABRcX5AL4FzKiPa3NugOFlItnlRUfG0B5s4ZlYK1Jt3h/16ghOZEPMpq/L/58tNW8vsMG4PB3uLlBh/IQgetOd2uHSu4OZPFnjY7tlI63HfC6jQ620MmFnajMSMNN1RbrL+5DcydUI0IOOIVxdIaFCnM+2QC1TJ92M7TtsgOQOQjeZdt11s/vzmblztl/iyqOcqGSmuqGvnAFJGF9sKiVo36xcL16TYtKlj/DU36dKIZek7Yet+4N1yHrNSEtnsGTk2a/4UXC/YJb2UKR5CJR+wZi5m1rwms9scr4
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB2789.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(39860400002)(346002)(396003)(136003)(376002)(230922051799003)(451199024)(64100799003)(1800799012)(186009)(4744005)(2906002)(31696002)(966005)(6486002)(478600001)(41300700001)(31686004)(86362001)(5660300002)(4326008)(2616005)(66476007)(66556008)(66946007)(316002)(6916009)(26005)(53546011)(6506007)(6512007)(6666004)(8936002)(8676002)(36756003)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Um4vaGFNWXZBREZSNDBMK3pGUFhDQ0p4NVRCR0VndmVSNFI3MVRIbjlsNDhi?=
 =?utf-8?B?WWxwazhvTzZmZEVyK2tjTm1mQzdlV1N2UWtpQkpCV1NnMC9GR2RhKzVpdG5C?=
 =?utf-8?B?dnNQR25vdWpSM0lyV3RsaTFIQmFiOXBXRlZyYlF3UjFTdGFvbmNNN1Z2T1BQ?=
 =?utf-8?B?QWI4NXBTQXN1aGJudGVzMWozOUloRnpiUUdCcGl5ZEZBSGdhem1YY2IrN3oy?=
 =?utf-8?B?aWtpY3ROa3A3a2ZESndSTEVTeGIxalViT2U1STFzL0NCbFhNejRIdmExQklN?=
 =?utf-8?B?RGN3QWNqVmllcXh5MVJxbUoyNlZBZjZGb3F6SGtQK2UyZ2orZFZhdXo0UEhs?=
 =?utf-8?B?N21hYjNFdnU0YW1jaXN5ZFBDTUU4b1BFMVZYZ21GNlExbnFiMjM4THI2ODJD?=
 =?utf-8?B?Mmg0aHI2dmtKZXBEQlc2M3FjYkh3b0FQRUFFbGFzaXh2S2RwWDFtWUVxdWhx?=
 =?utf-8?B?Ym94UThtcHVES1l3RWF5aWNhQmNrUFNlam02UEduUURqaStkTEFja0djWXR2?=
 =?utf-8?B?OGhnQlRVUlBYRUtYVDVLYUNPLy9PT1dNdHhKUmxrUW0vbmVNRDNoOUQydE9o?=
 =?utf-8?B?UzZGZ1hhZXBwR2pySWhyY0l3WEFJa0FJS201Q2xRa3lJd1JoWWQwWkU2K1lJ?=
 =?utf-8?B?cmMyZGdydHo5RzV2QmhiS2I0M2pEdFV3cFlMVmlVVEMybHN0R0wxekEwclNN?=
 =?utf-8?B?YkFKa0tTZmF2dFlpVHlaQ1F3a1AyMG9VRFlhZWRsSWYwNUorbk4zdjc3cGJj?=
 =?utf-8?B?N0JISHBacDd2SUk5UWF3K0ZJa3FBOTZCS1F5cUtITFh6SFNYYkZHbGtGMWtR?=
 =?utf-8?B?bUlLL2F1UWlYTjdKR1NtTlZ6Nk0xMlZvenNzSERlSVk5VktOdXNXUGxPUllo?=
 =?utf-8?B?NE9NTU9rbHBTcjNsMDRpYVlCcXJtWVYzN1RQYmdSRWpnL3hHdExqTzl0aS9I?=
 =?utf-8?B?Z0lmblkvaWpNZUtmdTYzQ0hjelMweTZMZGpZU25wZ2JCZXpFNjRKTU5XSFRy?=
 =?utf-8?B?T2Q0R2k3UWhjQmV3RlpNWFRxeHlYTjZyL3Njb3BYOUpHS2UwR3p6RjFoKzYv?=
 =?utf-8?B?WnFwNTVRNmF4TlUyOUNycS9aei9KNzdOUEF4ZkU2NTNEWS9qWSszQ2dCSjJZ?=
 =?utf-8?B?VWJjK3NXK1RISVdRY3diY3Q3N2ZmSS9IZUJ4cC96MDloZm9EcHc3ZHhxWE1Y?=
 =?utf-8?B?YkV1V1l6SFZ0S0tHVG50WlhrVVJZS3daK1ErZUxnOVduanhRdjN3RDgwRVZM?=
 =?utf-8?B?OTZvaytCeTg4R1BWMEtnUkNyOHJVNXVJbHFNSEZra1Jpd2laUEpOQXlINXZx?=
 =?utf-8?B?eDUwODcweUlod2hlUTFwYmRMM05kTnhWNjVyUENxNTBtMFpLOHdFRVJSR3Zx?=
 =?utf-8?B?RWtTTEd0T3ZwUzliTmgrdEpPWlNER2pBU0x5ckV4MUxGMXI3Ri82eUVrM3I1?=
 =?utf-8?B?a2k1b2lYWFZtVkFic1B4M2VpSitpNzgydkdLK054NG5kSTRRTWhkMVFta21l?=
 =?utf-8?B?R0dYOUpFNlZuTzM1dTNNakpLN1VUaWtkY2VjcmEzVElub2pRMHBLVWIvQ3Vy?=
 =?utf-8?B?WmhTZlFEc1lVbzFGK2FoMFNFSE9iM3V1RjVnRWIyN05pVFN6ZFc0TDVaZWZm?=
 =?utf-8?B?ZTBSZ2VPd2c4Uk5tcW1LeUJmVHdKQmo3d1VIZXpmSjdRMlJVY0FnaFpvdm1z?=
 =?utf-8?B?SzM1WHMwU2FqT2FVM05lazhDaTBsWUF6eHdHZXVvY0FnMGFYazVySHJLV2oy?=
 =?utf-8?B?YUVsQ1JTUlp4dlFuMFFqZ2pvbXpMa0VpRDIydEFKZEVSTDRwbEFEMFhFVjMz?=
 =?utf-8?B?UFBKSlNWc2NhVmdpWDRJelBIK0lBN01ZbkVPSVBHS1VhWkM0aGJ2dWE5ZlFL?=
 =?utf-8?B?Nm15MGlmNWlHaGNSWnFZS3UwVkgwOXNFc2ZIdU0rVHVNZWxHdUxhV29HSTB6?=
 =?utf-8?B?YnBBclRYYnpvMGpoS0lkMjJERDg4OFZpZ2wxTmpYWHErcGJWSXhkV2pkemhV?=
 =?utf-8?B?T3JZMHZQRHhuS1VZdGh5eiszZ09UTDZ6UkN4dEViK0RIcklZMStuVnJrelA5?=
 =?utf-8?B?RVoxL0JqcHpEeXdRMnlGalRmcjVYNTh1UXFFQ2lUU0xQcjVVdVhLL09WQ1ZY?=
 =?utf-8?B?K3dNVkFCdEx3T2gxeTUrZ1FwS2QwZUNXQ2Y5YTRkdFA5Um1leVA1ODkyM2dm?=
 =?utf-8?B?Tnc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 969268c9-1b38-4549-d786-08dbfc895242
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2789.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2023 09:44:52.6900
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: svxtyBnNeYldx4unUzKu6tyS4XAiSb/qsF0+pX5ShTS8K8vNxx3XmZH/WMZAvehpcJt9d1P07pgLjE8KCZJ32Sdadik+XnBuJzoyjwPUpyw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4948
X-Proofpoint-ORIG-GUID: IlDK74y6lO_VUUCkFg58ttvITO4DVJy7
X-Proofpoint-GUID: Xq8Gt8LEPMPToo3IVVF-lE-wGny8vKWV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=863
 impostorscore=0 adultscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 mlxscore=0 bulkscore=0 malwarescore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2312140064
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Dec 2023 09:44:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192342

Hi Ross,

On 12/13/23 19:19, Ross Burton wrote:
> On 11 Dec 2023, at 14:49, Robert Yang via lists.openembedded.org <liezhi.yang=windriver.com@lists.openembedded.org> wrote:
>>
>> +++ b/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-reexport.h-Include-unistd.h-to-compile-with-musl.patch
>> @@ -0,0 +1,34 @@
>> +From 45597a58e98f351b18db8444292b1cf6dd0cd810 Mon Sep 17 00:00:00 2001
>> +From: Robert Yang <liezhi.yang@windriver.com>
>> +Date: Sat, 9 Dec 2023 23:34:08 -0800
>> +Subject: [PATCH] reexport.h: Include unistd.h to compile with musl
>> +
>> +Fixed error when compile with musl
>> +reexport.c: In function 'reexpdb_init':
>> +reexport.c:62:17: error: implicit declaration of function 'sleep' [-Werror=implicit-function-declaration]
>> +   62 |                 sleep(1);
>> +
>> +
>> +Upstream-Status: Pending
> 
> Can you upstream this please?

Submitted: https://marc.info/?l=linux-nfs&m=170254661824522&w=2

// Robert

> 
> Ross

