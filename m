Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48CE2C27C53
	for <webhook@archiver.kernel.org>; Wed, 12 Jun 2024 05:54:19 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.4494.1718171650083283830
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jun 2024 22:54:10 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=6893383dff=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45C5FhG4002337
	for <openembedded-core@lists.openembedded.org>; Tue, 11 Jun 2024 22:54:09 -0700
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ymptg3g29-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 11 Jun 2024 22:54:09 -0700 (PDT)
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 45C5s912022071;
	Tue, 11 Jun 2024 22:54:09 -0700
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2042.outbound.protection.outlook.com [104.47.66.42])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ymptg3g28-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Jun 2024 22:54:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eqgdEWNO0nH5pZQk7gtl0OoWMOeOIOPXuqAQP+UI1UtMZWjR9ARApm639DxEnssp0x+ibE4WlqIFt0ksAOMgzrSKucRapcGVmKukX2N4wAHgxRS420DHm7vSFt3+VKxYfeYirrVBrOLZ47MZFGKBVKLIoReCwLbyFAWh+R4Ql50UiaKLrSlEgZx30pFuWSCevlq1PFXOoo41HaFh3mk674sZhPH35BG+nfAInDb0dZe+Ir23qmVZofRvQe6K1SKF9/mcUEtY9yXDyq7WLh46ROdfN8lKS29aBOuWg6NVhgAwRuwcP/8GtoMI7fvfHioEruhbCSo6lFsMDJZGkGkk7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C5Fkyz3R/tzEwRWHyI1ADu3Nq1T5mswiRdZEMLfMUvI=;
 b=C9BwLGUZCbtKwiiMNoZE9/HbgUijcWQpCYpk/WGITUQR9eiTXa6Iw3YS4LyvIOYQUhEJXPerNLJeAqK7dAmcCmLKYJyrk5vBZ8ey+ue+u/G9CfwQYhtKy3xDnLaMywHDBXh5wTrx+DPAPFF2ntMxLfhz7pMCbPp9rNe6yXDnECUKcqNuE8bq5iOl6Z31uOqUAZ3+LTfsNjOP9kCCLjgQjgKvYv25Vo0yLPglhTQGa+FVIboi+ONIH13ZvZons1pwtlFamPo5iHlBpiTiAbzaxA4pAJVSvgprPFHVHWFMqWhqRdomHtjICZpnPBS6LgXManLkkR44o58kTCoYC0fSUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from LV3PR11MB8531.namprd11.prod.outlook.com (2603:10b6:408:1b6::15)
 by SJ0PR11MB4925.namprd11.prod.outlook.com (2603:10b6:a03:2df::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.20; Wed, 12 Jun
 2024 05:54:05 +0000
Received: from LV3PR11MB8531.namprd11.prod.outlook.com
 ([fe80::d341:6ff5:fce1:c6d]) by LV3PR11MB8531.namprd11.prod.outlook.com
 ([fe80::d341:6ff5:fce1:c6d%4]) with mapi id 15.20.7633.037; Wed, 12 Jun 2024
 05:54:05 +0000
Message-ID: <4d377b0b-ea4b-47ad-8e34-23d6c5fbe6c1@windriver.com>
Date: Wed, 12 Jun 2024 13:53:57 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: Patchtest results for [PATCH v2 1/2] ccache: 4.9.1 -> 4.10
To: patchtest@automation.yoctoproject.org
Cc: openembedded-core@lists.openembedded.org
References: <cb1a3e14bd806b9603df4f0f772db86056fb57d5.1718168026.git.liezhi.yang@windriver.com>
 <010101900affd5a7-04458148-2bf5-4090-a425-4001c7f394c6-000000@us-west-2.amazonses.com>
Content-Language: en-US
From: Robert Yang <liezhi.yang@windriver.com>
In-Reply-To: <010101900affd5a7-04458148-2bf5-4090-a425-4001c7f394c6-000000@us-west-2.amazonses.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TYWPR01CA0011.jpnprd01.prod.outlook.com
 (2603:1096:400:a9::16) To LV3PR11MB8531.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8531:EE_|SJ0PR11MB4925:EE_
X-MS-Office365-Filtering-Correlation-Id: a77625f4-5855-4f35-aa24-08dc8aa41164
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230032|366008|376006|1800799016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?NG1LTnVWMk9WeFhzWlAyMktyaldHc2N6TENSS1h6ZWtsd04vWlh4UHVUZUpH?=
 =?utf-8?B?Rlp5RWdiQU9ISktRRXBiV1hsQ0NjMzBrM0FGUkM5cFJMcjZjcVZ4LzRpZ3VV?=
 =?utf-8?B?WjFIVk1idVUvZ3FoNlh3YzVFUkt0WjFEQ3pVOEcxRW1IZUtMVDUvMmo1RC9l?=
 =?utf-8?B?RTFHdU1LVVlNdklXa0VhcFd4dmZVdkl2UUJNdlMvOVNzWS9TYTh6ajFManBv?=
 =?utf-8?B?UmZzMHJDQlBLRndRV25DMkpBUnB5VTM2TlEvQTBicE9GL1hETEY5Wm5NRlpQ?=
 =?utf-8?B?UkJPbUY4TjVCdkxZUUxnSEU2akZ1c0U2ZFFqdzlsUHRGYjd2dGlJbHo5R3VH?=
 =?utf-8?B?OG9LandLMFBONlh4UEhxOElDVjZsL2l2K0svc2R2bWdwcjZjVzJlTzlWMVdl?=
 =?utf-8?B?QW5qRTROTWZlT1VmendNNXFwQmZjOEpZMkFEdHgvQWh3a3pxK0FwNnpxVGxh?=
 =?utf-8?B?cjFiMG94Mk40TFl1eS9TODFXNmROSXcxcm82WEJuWjRuNEd0YnBPMmZnWHNL?=
 =?utf-8?B?OXVQeXo2TWN3eXN3Y2lsbkFjOStyWk1sYmpzdTV1bE9VQkdGNHFsOVdoZ25v?=
 =?utf-8?B?ZHBsM3pqQ0txQmZtbWIwVmVOdWh1cnpwSWNkU1lWSWlDY3lQK2FKL2pZWS9a?=
 =?utf-8?B?emhXUkFsQmx6OXhMWnVJQjl5d2Y4c0IwdzQ3VFZLZVdGTzZxTGVNMURHaTZZ?=
 =?utf-8?B?T0Y1OUtzSGVaK1I0SFZLMmVUaVpEWVpINXdCL04rTXBod3pjQnNCa2xRT2Zr?=
 =?utf-8?B?QTNZZUZRQTMvUm1YTWRLMXE0ck1SUWxIV01XVVdGYlFGSzBGWTdZb1JUdE5E?=
 =?utf-8?B?RXZmTEpnMjJ3Uy9FWVY3R28rWkhuQm53OGdTcXlFYUY2OXpKVUtzWVZlWHJT?=
 =?utf-8?B?eldIOHdzWWd0cjNTdWNCUHM2ZVBMSkJSb2lRY3JkekNoYlJWWlZxb3h5cmls?=
 =?utf-8?B?cGcvVUFpa1J3RUZwSnljK0YrU0dnaUdMVm9iaHJqUDZGYUIyaFF0b2ZyT2Vo?=
 =?utf-8?B?YVA1WXVMc0todjZhbXhGVHRkQmRGOVRsOUdRU1I2TSs2RE1NVEJKY2F1L0pr?=
 =?utf-8?B?TmcvQ3FzMFpSYzVqcThUNVlLcnBWWE1Lelk5NVl2YUVrNFZTWmE5eEJTSzVZ?=
 =?utf-8?B?M1FCTTFYcFFjQm5sMjh4dmw5NHJGME5zc2d3WGVlM1Y5L2VVMU1YUG91RGhG?=
 =?utf-8?B?ZWlIOVU3ckJRZ0I4WTAwS1E0MnltQ1ZvNDlKS1p6MktSN29nYk0xdnFaUVdn?=
 =?utf-8?B?T0NLYldJYW9weVIrQThjYmRPMVJYZVdrSlROZC9MNEFqZ09Tam45Y2c4UTdO?=
 =?utf-8?B?enZXUU83MWM0MGRpZk4wRTRMNFJCa21vQk9OSU9GTTJBVkJRTWpPSkZNaFV3?=
 =?utf-8?B?b3Bwd2xRWnU3dE5iZGs3eitWUENOTElwRkFrZmtFYmt6V0taemlQcGNzWnJZ?=
 =?utf-8?B?R2NOckJHUm13Z1BveHgvOHRKZE4wT1lJbzZSZEpKVE4rbWU5eTUyQVRzUDlP?=
 =?utf-8?B?MXN4MmlKblBEbVU2SmZZTW9aV0VjRXNVWGszd0l5djYrWGhicnJEaGNRdW1U?=
 =?utf-8?B?NHRhaXdBK0o2bzVGRjVaNTg0WDNTYmxRSzVpb1VnQ0NIVWhabmV1ZGNqTXUy?=
 =?utf-8?B?R2U5MVdmb2hnbk5nVmZlSEVCd29FeEIzdFVvWmw4T1U0bU5tUXFkcWVndXY4?=
 =?utf-8?Q?pKZdu8lPegUcUmiRWjus?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8531.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230032)(366008)(376006)(1800799016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?M1ZVWStWbFZLSHNDcVBaaGNxTDA2MjllTlNsTWhpUWMzMVVhYS8yRzMyMXdr?=
 =?utf-8?B?Zk9ORDFuUnhIZlF3cExoTm5jOHJwYVZQY3VycXlNcEhPUXVQS0RYOUM3SkNq?=
 =?utf-8?B?V3JKY2h1N1k1eFpraitucEVBRFdTN0JYSllaclMyVHA1OW1RMWl3a1luQU1K?=
 =?utf-8?B?a29pMDVkUU0zSVhqcjZPWE1GVzdTVElFU0RKelNMRTdNdks0VnY0R3IzNWE3?=
 =?utf-8?B?dldXQ3FHRzF2Mzh6dmZKazNCMUhxVnVHendMOWJDVktKbExuZWJEWUVCKzBW?=
 =?utf-8?B?eG05MVRtS3RuNWY4aFZYYzhqbTZvOWZsRXZtNlp6V2RqYjRIMm5COXlvUjR2?=
 =?utf-8?B?TWg1ZmJ3TXV2VzRUNW91SFdVZVhYUlVjVHM4dEw4MFNPMGxqaDVOUjNaZlRz?=
 =?utf-8?B?dW1RNDJiUlBaNEcvR0phY2dpb0s1SVltUk9veVdFZXZoM2puSTVsVGpaUTFG?=
 =?utf-8?B?SnoySHRLbGkvTE1pOFVtdlFlZ21nbVJ4TTZSaTI4cm9BYTFCcFU5RWVRT0pj?=
 =?utf-8?B?ZXJ2eDNvRUVMQWFIU2dqemRnZVJXZ2tIV0hTeUZEYVphQjRnVVNyQUJDQ0pV?=
 =?utf-8?B?OStOMUNUQS9HR2d3aXVvYXBSMkJhd1d4UVVRaWZFQzNaZFozSUFvVnJtMGNr?=
 =?utf-8?B?alNKME1GY3orSG1XdFBEbWZWWlZCK1V0NmtHajFSNEpPeEpUWGZrckNITVVC?=
 =?utf-8?B?Z3pobEEwOUo5WGExTzhHdWJFcnVPa1RDcytEamZYWE9sYmhVUGtqMFREcHNN?=
 =?utf-8?B?S1k5RW1CWFlyekFjc1ViQThReVhoNXdDejhOWHhMSVpSTit4bnVCZkFIUHhs?=
 =?utf-8?B?Y3d6QWJRZFJqbGhaZndIblFqeWxORzB2UUFMc2N4TU1pc1ViU2xpOS9Cby9V?=
 =?utf-8?B?M0ptdHlBTGRITWNYY1NGbjV0MlNhZnNlVlJjNTdjbVVTRmd5MHZuNTRSd3hI?=
 =?utf-8?B?YUtsU2plRm00Z1haOUNLN3k1ak1lNU4xSEVxWTdyTnpFTzZPUWFVS3FFVExB?=
 =?utf-8?B?WThGbmxaYkhvRFFscDJxNldxUlB6MEJEOWlWR1U5Qzh1c2w2UFg5b0xwZXB0?=
 =?utf-8?B?c1MyWFV5a2d4Y1ExdnRtakJFZWhmQnVVM1FMekFrWlpKK0hrNitUMnZreHdr?=
 =?utf-8?B?M0NJbkVJMGNHN2NwYmhTWXdCU0tGMzFCVDdsVW5CT2lVaUoyUE56YnVsT0R3?=
 =?utf-8?B?MkNTN3hnb0RieWE0elpwUktRTTFaMEdDVHRheGZlN2o1aUdyS0QyZjhjL1Vt?=
 =?utf-8?B?OXhhR1RYMy9BYnpLZ1BpT0pRaUdnWjcvdzNQbzdWV2RjbVpwUTA1bnpaUzdQ?=
 =?utf-8?B?WTNWcTlUTTFVM1E3MW04N2xvYlQzQUs1QWQ3T2d2b0NxTzgzNHR3UnEwR1o5?=
 =?utf-8?B?S0ljZjdNUG5FU0RMUVJXcmMyRHJmeUdkeENQQ1ErMjlpU0p0VnpKaHhpb1lB?=
 =?utf-8?B?M1J2azVKOFZTa3k2MG9TdjloaENUb1FqTGIvUjJCa0lWQ2ZlQnVScEF5S0R3?=
 =?utf-8?B?K3RrdWtNMFBpUUtrZUNycUJuWmlnbVZMRXMvK1RGVTFWaTEvWUNKRG1RN3VV?=
 =?utf-8?B?aW5PcFN2Y1ozdGUzd0srRE8vYW5Ua0lmZVFMUmJ4dElOSVBLQjNNMUdHU2gr?=
 =?utf-8?B?ODBpRUdrb0YzVmxraTVMOTRaQ3pwaUFWY3hKWVZJUGF1VktIbmt4ZGkrZEV5?=
 =?utf-8?B?UmJQZGF3ZC93R0VaWDcyR0QycWF5VDl6Ymt0WjdnSkZGY2l0dVlXQnhPL1FW?=
 =?utf-8?B?OU9KTTBJVGRzSHlqcjlUZG9tcXUyUitPNU9ibVN2bk51MEVTMjkvaEdhUlZE?=
 =?utf-8?B?QlFGQnI2em1wMnlIb0FSS3Q5bmlEZUFIQmg1SFdTbk1PZXRnNWZRb1FuTUc4?=
 =?utf-8?B?aGNzcDRtNGgxWXQ0UDlLZkhJZFd2UDhEaGJNajFockI5QnlVTGlsWms4aHVx?=
 =?utf-8?B?bDZZcm40WW9pcVJLYXZYZ1IrZ3I4akc2ckZqNkRrWEQzbXhBNFUxUVAzM1Fq?=
 =?utf-8?B?YkdxS1ExNXYrV2ZRQVkwOERKOEJHTnBYOWx3a1FSTUlETVEwL0UzbU9BeWtZ?=
 =?utf-8?B?Zm1lRytjOTdxQWJEWnV5YU5ad2k1RzdBS2xiS2R5OWlnMExwYnV5QVlPNHZZ?=
 =?utf-8?B?Rk9uSEIrZlF3WmF6MW1SMlZ4L0dRV1FVVXpPTVY0QVhUbjR6TjEzSzZQT1Ux?=
 =?utf-8?B?aWc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a77625f4-5855-4f35-aa24-08dc8aa41164
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8531.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2024 05:54:05.2940
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xe4GvhVcJgcLyXdO+G9spE/ckTSchyXwCL47Us+c18IUTMHge/z7xNfvQUncyBHkCcPXlGhhJwcfweRR77KZLsfR+gk3T6VGPAYFZtSh978=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4925
X-Proofpoint-ORIG-GUID: clSCHaDNI3wGV6Lw1ynfJy7HQRS3MnN-
X-Proofpoint-GUID: 6n5O389I0jctai-pEHtzPaRWdS6lxiS3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-12_02,2024-06-11_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 adultscore=0 phishscore=0 mlxlogscore=999 impostorscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.21.0-2405170001
 definitions=main-2406120040
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Jun 2024 05:54:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200566



On 6/12/24 13:50, patchtest@automation.yoctoproject.org wrote:
> Thank you for your submission. Patchtest identified one
> or more issues with the patch. Please see the log below for
> more information:
> 
> ---
> Testing patch /home/patchtest/share/mboxes/v2-1-2-ccache-4.9.1---4.10.patch
> 
> FAIL: test lic files chksum modified not mentioned: LIC_FILES_CHKSUM changed without "License-Update:" tag and description in commit message (test_metadata.TestMetadata.test_lic_files_chksum_modified_not_mentioned)

I did add "License-Update:" in V2:

     * License-Update:
       - Update LIC_FILES_CHKSUM becaue a few third party licenses have been 
removed:
       $ git diff --stat v4.9.1..v4.10 LICENSE.adoc
         LICENSE.adoc | 222 +++++++++---------------------
         1 file changed, 15 insertions(+), 207 deletions(-)

       And add more licenses for third party files.

// Robert

> 
> PASS: pretest src uri left files (test_metadata.TestMetadata.pretest_src_uri_left_files)
> PASS: test CVE check ignore (test_metadata.TestMetadata.test_cve_check_ignore)
> PASS: test Signed-off-by presence (test_mbox.TestMbox.test_signed_off_by_presence)
> PASS: test author valid (test_mbox.TestMbox.test_author_valid)
> PASS: test commit message presence (test_mbox.TestMbox.test_commit_message_presence)
> PASS: test max line length (test_metadata.TestMetadata.test_max_line_length)
> PASS: test mbox format (test_mbox.TestMbox.test_mbox_format)
> PASS: test non-AUH upgrade (test_mbox.TestMbox.test_non_auh_upgrade)
> PASS: test shortlog format (test_mbox.TestMbox.test_shortlog_format)
> PASS: test shortlog length (test_mbox.TestMbox.test_shortlog_length)
> PASS: test src uri left files (test_metadata.TestMetadata.test_src_uri_left_files)
> 
> SKIP: pretest pylint: No python related patches, skipping test (test_python_pylint.PyLint.pretest_pylint)
> SKIP: test CVE tag format: No new CVE patches introduced (test_patch.TestPatch.test_cve_tag_format)
> SKIP: test Signed-off-by presence: No new CVE patches introduced (test_patch.TestPatch.test_signed_off_by_presence)
> SKIP: test Upstream-Status presence: No new CVE patches introduced (test_patch.TestPatch.test_upstream_status_presence_format)
> SKIP: test bugzilla entry format: No bug ID found (test_mbox.TestMbox.test_bugzilla_entry_format)
> SKIP: test lic files chksum presence: No added recipes, skipping test (test_metadata.TestMetadata.test_lic_files_chksum_presence)
> SKIP: test license presence: No added recipes, skipping test (test_metadata.TestMetadata.test_license_presence)
> SKIP: test pylint: No python related patches, skipping test (test_python_pylint.PyLint.test_pylint)
> SKIP: test series merge on head: Merge test is disabled for now (test_mbox.TestMbox.test_series_merge_on_head)
> SKIP: test summary presence: No added recipes, skipping test (test_metadata.TestMetadata.test_summary_presence)
> SKIP: test target mailing list: Series merged, no reason to check other mailing lists (test_mbox.TestMbox.test_target_mailing_list)
> 
> ---
> 
> Please address the issues identified and
> submit a new revision of the patch, or alternatively, reply to this
> email with an explanation of why the patch should be accepted. If you
> believe these results are due to an error in patchtest, please submit a
> bug at https://bugzilla.yoctoproject.org/ (use the 'Patchtest' category
> under 'Yocto Project Subprojects'). For more information on specific
> failures, see: https://wiki.yoctoproject.org/wiki/Patchtest. Thank
> you!

