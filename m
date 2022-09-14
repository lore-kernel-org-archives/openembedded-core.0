Return-Path: <kai.kang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE0ECECAAD8
	for <webhook@archiver.kernel.org>; Wed, 14 Sep 2022 00:52:09 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.987.1663116722737912182
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Sep 2022 17:52:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=o/R4Pdgy;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=6256982d2d=kai.kang@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 28E0paZS021512
	for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Sep 2022 17:52:02 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=message-id : date
 : subject : to : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=bjBv9I0ZlhV0BjQy7wLJHvq3ZiupAuVtMHKraruPtL4=;
 b=o/R4PdgyfBKkPIkzunOMk6LbHWnEVlxoaHlHZMLswDsYWGsn0mVYIBn6n24xpJBZM16z
 vPT7Kt78mqlUZPbFBboqSjPHVmB6pLFH5VodwL7gS/buRKao9C7XdNS7lkIqlOnGSbDN
 YVa2Fg0RqTmRKfua1AGaWAJ+yz49YamKIGwqz0GPf44saqXuKabhGVLb4QeQIdISFbtK
 jJ75/lM7DUtEjC2wZvSlN08lb8qfIxXd3MmSUYqO4jGi3du2/ABqcLZA1PZQpm0FsruF
 UOrECH6WH0Aks9xisCIxcgYpt4yqF0HHS+0H5OihsPzhVbz35opEyuLDDDcQtNN9WWX2 xg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3jk4sh000m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Sep 2022 17:52:02 -0700
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 28E0q1Pt021622
	for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Sep 2022 17:52:01 -0700
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2170.outbound.protection.outlook.com [104.47.59.170])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3jk4sh000k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 Sep 2022 17:52:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n30QQ4/MQfsyPgnN3z0OYo8Fm9mIJTeJVwz87Vwdwex8kXXC2xH6CWXcvtKUx9+6sBV8jMZDbIvady/yxnBUiRL0LNQG935I7C6dqFkvd+8Qtl2ayg1cbzP7Qnvy+HZLzXBsoQZ31wsV3uO3nL6kQS/zQfRFhyyE1EVySZOWfBRF1yKsK4KmXxxRoVRjuzmQAm9t5ELhj+fY0x12euO+Ap3SP78HPU48RgpsHfjuDbRfKoERIZes+inve9f27hgTLT7DdYn5TwcVS+caPJaQyOukkTCYBGBXCcrZg0XavLrIPe2/FC9Ys2aDQoiCTQSNXIE+cL8SVy9/opCwFryqpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bjBv9I0ZlhV0BjQy7wLJHvq3ZiupAuVtMHKraruPtL4=;
 b=E7bsXNHjSdevBCqavQ+jubXKOsDiR5Cb4AD8HuKZlfhKN0byipnASMlema5Ch3chuX7bhC0Ej5pkcTpzf6teKXwry+lzElxuWj+a2qDFnMPCnesMtmbXXSCgvt0DC1EBAb5GvhXpS59Au3grOin8u2Km4p+R2HxfCRPACrwjM9nSIqxgD1cBBqpXYptO+g2yPjr3eDItb2394fuY72WPp7gKiLiMLSm/zo0kJZaSZDQI5Po2C33sJtwbG35Hn0IRj8S5CFEVfb+HoYFeANiHzY4mvpM0NIrMOxsgKomboHN2TljKOAfk5BjYCGLsVpdon685Q5i7DNjfg7IAIMc59A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS7PR11MB6064.namprd11.prod.outlook.com (2603:10b6:8:77::14) by
 DM4PR11MB5261.namprd11.prod.outlook.com (2603:10b6:5:388::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5612.20; Wed, 14 Sep 2022 00:51:59 +0000
Received: from DS7PR11MB6064.namprd11.prod.outlook.com
 ([fe80::b936:e3e1:5794:4ac8]) by DS7PR11MB6064.namprd11.prod.outlook.com
 ([fe80::b936:e3e1:5794:4ac8%5]) with mapi id 15.20.5612.022; Wed, 14 Sep 2022
 00:51:59 +0000
Message-ID: <79093951-8358-c91e-90ab-e84fbb91f295@windriver.com>
Date: Wed, 14 Sep 2022 08:51:50 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [OE-core] [PATCH] binutils: update USE_ALTERNATIVES_FOR for
 symlink files
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
        openembedded-core@lists.openembedded.org
References: <20220911084756.10315-1-kai.kang@windriver.com>
 <25a7f967e61230b78da3b59dd687e82aca414f82.camel@linuxfoundation.org>
From: Kai <kai.kang@windriver.com>
In-Reply-To: 
 <25a7f967e61230b78da3b59dd687e82aca414f82.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SL2PR04CA0001.apcprd04.prod.outlook.com
 (2603:1096:100:2d::13) To DS7PR11MB6064.namprd11.prod.outlook.com
 (2603:10b6:8:77::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB6064:EE_|DM4PR11MB5261:EE_
X-MS-Office365-Filtering-Correlation-Id: fb1a3cf7-3711-4ced-d4cb-08da95eb5481
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	8PX+77Hpy8cy+6yy77J8JbDfcDgLUe5zKH3dWw/+3M2/EfteZlCTgqDzf6pBaHreRu42IjoLv3toGp+bveBMg3DEzZtoSLODSzg/HhzDfQcTIq8zJnfbG3gOnSlYdh3sIClvDpXTDZgymUpOATtq8Adin6EdA4djAaAHBS4X+283QlcuSppmjPTNNGYj30Axpz6rjqvPC6AUq7sQibbRhC6jBYkMkVpaIiFs9Vcg1kFCuYwU5PUMF8bySOCB7fzkGJkcvqpUkwIh4t8B5Aqt9zctsPnWmGscgRmSjAHMKPxTGthkiKVE3uma0kzbDTvdbe87nqf5ne+QJylLoGqN+Sk6pc7DWZsavVqXLxq4/BZYIDdJAna6NJmITVN+ujpjBfSyzwUn2UiLeV41lC+SUQSEratoT34AmTWO+iVk05EH0R5Up7JBuaArN3L8/qIFZv/wWN4z7h8SH8E2kSuET/XXRwubpIdiTbNKVI6mp9YxH7DbxNkeOHVAdSbItppoGLJyBp6TAI7HltIszFfRMQbdhL2X8A76/UthKKH/MueEIHOycam9M0qy3s3cmn1146c3c5p8DePDDJuhhlXM0as/fGBvTeaKtS6OUwhqMaVCbhX1n4CMoR/F0bAOQqbsai4MrSB6YPQcv+96WNiFEZv4TCJDMiDUU6eY7E6eLj6CJ+jvnOPhApSzPD4piDF9yhxDv9TG+rvrtOwtntOWPJjBvgpYpOElC24DNQ75GoOV8fIlXVZrcwzKmddht8oKBDCl4Je1slqsqmg72aEpHGh77cv+DUnOlXyxL4G/s6YSG9sUBLUWpWdm2mLQN/OIFsYNK/wXkxHoGUsVAAMIq726Diq6/qVdtUL/uqZBpJo=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR11MB6064.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(39850400004)(376002)(136003)(366004)(396003)(451199015)(6506007)(316002)(41300700001)(66476007)(53546011)(2616005)(6512007)(36756003)(6486002)(66556008)(478600001)(186003)(2906002)(6666004)(66946007)(8936002)(966005)(5660300002)(86362001)(15650500001)(38100700002)(31686004)(26005)(8676002)(31696002)(83380400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?a3VkUWc2QUlleTllZWc2K09ZbjEwVXZXVk5pMTVBYStkblVNbEVXYS9oaVR0?=
 =?utf-8?B?UVlwaU5oaE0xVXAvWVJDeTU0MzI0YXMzQmNDUjg3eXVsRHZ1MHloWlVWd21l?=
 =?utf-8?B?c1pjYlhrZWtJaExsSW84YkVGY3FkRVpOMGdIaEM5Y1pDbVJ2M2VkckpDWW1H?=
 =?utf-8?B?VWwrUzY1SDNFM2JKY1RFaFppZkVDb1o0OVhwYzBYckd1SnQ3RWE1SklUZi9n?=
 =?utf-8?B?L2c1WWcwUitraTBCdzdSOWNFUy92LzVXdjdFMStQZ3hQYTJDdlFmSzI1d1hX?=
 =?utf-8?B?M2lnZG5BeWFIeXEvRXB0SXV4UVJadk9LTjNob1VWeVh4ZDVsTFA5UFQ2ZlNw?=
 =?utf-8?B?ZkExZ3Y4QmpFaGNZU2VoVlVWbUovT0tyL0RzVU12S1JOSGx4RHF1T3MyWW1Y?=
 =?utf-8?B?TjI5UXdlQWJZVW8xK3FEK1ZZMkpxZTlJMXFWMUR5RjhyTFFIc2NxaWZWa3Jt?=
 =?utf-8?B?NVRNMFNOU093cVIyZkxRZDFmOXBFOGhWY0pZK3JKNWdLK2cwOTNtbzV2ckNa?=
 =?utf-8?B?ZUVpb0t0UkkvWlBVUjNxS0txTUJFOCtHd1p4UVdOaHBkWEJHNEsvK2I1MWlM?=
 =?utf-8?B?U1poZXBsNVNyMUdMajdvNWhNeUtDZ1BubHpxWUt6RkpEWXVPSUJuR2xKK2N2?=
 =?utf-8?B?THNDYmFqY3pJeHoxY0pkNk9kZlQ0U205QjhsREoza1NiYTdueWR6blFsOUc3?=
 =?utf-8?B?NTNKWGZmd0YyS0YrK0sxdVNTS0ttRVlDTkxpc0g1VVBzbW95VVVZbkhpdHVE?=
 =?utf-8?B?VitFVlNNNjI3bHBydXdaY3NabG50UkFyeCtwZkl1MlFsaUNCMXN3ZElCNmRr?=
 =?utf-8?B?OTdJMXhSdTlRYTAzM3UxNTRKN0FvV2ZBV0F1ak5jRU4zUlBHZU5CT3ZNUkcv?=
 =?utf-8?B?eEwrMFVkaFlpQVJKVjRhbU1QRmtPOG43Zk1xY0xjeXlZdUs4aGZTanpyNWI1?=
 =?utf-8?B?UCt6cXpyMGEydlE2THJJM0pYaG1oTms5NSs5K09FdUJZVjFaYS9IclBpUEVh?=
 =?utf-8?B?OHZpYlczQXQrVmpUTUtSZzh0TFE0NUs1d0RUdDVoS29wUG90NWoya1ZkVFJi?=
 =?utf-8?B?SytYWUdjalJwcTJNcVFFS3N5cmdpaE85Vkloai8wRFlYYWVrLzEzQXVwM0tu?=
 =?utf-8?B?TXYyOWM4aUNuWXQzRlFlYUdESlY3ZTZxQVVGMjBZdW9Oemw4YVZpVGgrOE9T?=
 =?utf-8?B?YWdNRHVsOEVFOSs4UjZ4WVlLYTgwYmV6dkJoRVBsVTA1T3gxZUlUT0gzNm9r?=
 =?utf-8?B?LzdyLzU0SHU0eUlqNWVSeUphRzMxby9VWlZtbUpSVUpPWG4vall2clpBcXcx?=
 =?utf-8?B?MlptUGFuVThWUFYxVHltSlZZNm84ZzhXZURSUmJNTENMT1F4cjNuZUd0Q3Bw?=
 =?utf-8?B?ZUhlOVRUM0lUSGNSZisvOFY0THpYQjlBUU80dFVCNDhzb2kraGppWk9PeVBk?=
 =?utf-8?B?emNLVHRXZGtmZ0JONndlZVkwYzVla2RYcWxwTzE0Rk5zSWJvaENkNWxaTEJv?=
 =?utf-8?B?bjdNRU1SNGdWckFIdm02V0NtakQzZEhvQ1VPUTN1SHNBWkVxbnk5K3h0bi9i?=
 =?utf-8?B?Qm5KUnMyVmgvYUc5bHNtT2xuUVFxR0o2V0c3ZU5OczNadUdLeGJiMnFmWnVl?=
 =?utf-8?B?QmZhMUlNWUVzdHRTNWlGNkRIN2tvdnJXbzV0YUlyTmpJSWdYdnIxWmRYdU5X?=
 =?utf-8?B?NFp1blR6ZUZvMVFtd1E2TDl5bVRMcHJUNXZWOWJ3cEF2bmhWOGlSSHprT3dQ?=
 =?utf-8?B?T2JUb1NvYngveDBnYjN1MjBlL1RCTDNQWlE1ZkFQMU8vZWlONzk2eE9tUEVv?=
 =?utf-8?B?dVpKZWJ0R3lyNGZJSkRxZ1NLdUpRU3pYeXRwZHJwWks4VWh4MGpxNFpGN1lH?=
 =?utf-8?B?RDM4eE9SVFpmdEN1Q2Exb2kwT2tBNS9Hek41dHdXaHd1cnVtamJYWUI5azg4?=
 =?utf-8?B?M2ZaMDdKZlp3MzNFSDRHb28rNHhWK1J1TUpTeVVhdy9VTEZhMDNXVUtKRHox?=
 =?utf-8?B?eFQ5ZDhvdDdrR0RaNFA1c1pqb2hVUXNLNy81UU41QzhhR2NaMkRNKytJNmdM?=
 =?utf-8?B?WUF2N2N2dzZ2b3dqcDhJS0hHcHpmM0F4WEFpWnpCWlVudlUrTXVaVkhUTitp?=
 =?utf-8?Q?wXE07NAqZeJf03GYuBNS5ZNuP?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 fb1a3cf7-3711-4ced-d4cb-08da95eb5481
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB6064.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2022 00:51:59.6806
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 U61NvZbAik7PgaQ4GAdtV3Mx6NdAL4crDt9DuBbR0UhYnQ6U9k6noQmIwUnu6xoZEfFdN8+ADddPpjV/QQbw/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5261
X-Proofpoint-ORIG-GUID: qPf5vxziM-ZjyCSC5dZil1uToAbRIqxH
X-Proofpoint-GUID: L8sLRL2uXtJSXSoKH1U3BWwOXcd_Zt_T
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-13_12,2022-09-13_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 mlxlogscore=999 suspectscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 adultscore=0 mlxscore=0 spamscore=0 malwarescore=0 impostorscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2208220000 definitions=main-2209140002
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Sep 2022 00:52:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170615

On 9/12/22 22:58, Richard Purdie wrote:
> On Sun, 2022-09-11 at 16:47 +0800, kai wrote:
>> From: Kai Kang <kai.kang@windriver.com>
>>
>> It provides more binary files by binutils 2.39. Then add them to
>> USE_ALTERNATIVES_FOR as others to handle symlink files via
>> update-alternative mechanism.
>>
>> Signed-off-by: Kai Kang <kai.kang@windriver.com>
>> ---
>>   meta/recipes-devtools/binutils/binutils.inc | 6 ++++++
>>   1 file changed, 6 insertions(+)
>>
>> diff --git a/meta/recipes-devtools/binutils/binutils.inc b/meta/recipes-devtools/binutils/binutils.inc
>> index 789c8bec21..9d33a64371 100644
>> --- a/meta/recipes-devtools/binutils/binutils.inc
>> +++ b/meta/recipes-devtools/binutils/binutils.inc
>> @@ -47,7 +47,13 @@ USE_ALTERNATIVES_FOR = " \
>>   	as \
>>   	c++filt \
>>   	elfedit \
>> +	gp-archive \
>> +	gp-collect-app \
>> +	gp-display-html \
>> +	gp-display-src \
>> +	gp-display-text \
>>   	gprof \
>> +	gprofng \
>>   	ld \
>>   	ld.bfd \
>>   	${LDGOLD_ALTS} \
> This throws tons of warnings:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/4219
>
> e.g.:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/65/builds/5896/steps/12/logs/warnings
>
> but many more.

OK. I'll figure it out.

Regards,
Kai

>
> Cheers,
>
> Richard


-- 
Kai Kang
Wind River Linux


