Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD604C3DA49
	for <webhook@archiver.kernel.org>; Wed, 17 Jul 2024 02:55:41 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.6987.1721184936177942071
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Jul 2024 19:55:36 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7928052a7e=changqing.li@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46H1iPLX031854
	for <openembedded-core@lists.openembedded.org>; Wed, 17 Jul 2024 02:55:35 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 40dwenrbpk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 17 Jul 2024 02:55:35 +0000 (GMT)
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 46H2tY1n003031
	for <openembedded-core@lists.openembedded.org>; Wed, 17 Jul 2024 02:55:34 GMT
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam04lp2041.outbound.protection.outlook.com [104.47.73.41])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 40dwenrbph-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Jul 2024 02:55:34 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JOoNeISvZ74qxgoloedfkIbsRBD7bIONKpDpPXTJpmByM+4vMoANyTTaITZyLHwcsndZ2p88JLAZnRsO9VU2rCQ8p3SpnQkGxT+x8/MKkBZuijmtAezPnry4BiLkLp2od0SYSaIvmdMXoJhSdzCpRNbqFlvP/0XZqEcNYcLK90pGmn/2PuQxyZDQGrwvuw+yOxzabTAb7V82T7Skm+cgMz35XFcxURDt4Db+H4HuRSFpcQBbK2eK4JvWptQYAoHpZ93KULDdAtqK6kCYWrgb0hhAQ8UoVwEf2rF1AiuJ/zeYRBpzQvVOdLKe4VH+MD4MC5IbzNltyc5Uln36H0I0Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l8uegY3Wmwg94JjRQeFxI+pS0rDSY4qA9jZMORkdUp4=;
 b=FyjXkzET8CqEyHthRet0Z6WIYXwBhMhs1534qPiJeOKdRyX92RakvlTpl5S8FFpr9CjcIXQPF1od5YlH3fKwxV9W822HPz3Z653Q4Il0LRRM3yU1fLezgAvMbzNcmRgDhMoPVPpG+Ft9+Hpg13za5omJvmrPzuqi9ez+D0qLqPFim7BQhDEqi9HvWThRfaheEoEWN/siMQ5D5v6AVdk/L0/i6BMSPR0xzY9vvjPIh/Qoplr7BWU6u8Q65qaGx+LI9Ka4L9Co6izJ/XBoQFhTBEAaK/qEL5Fn53dLvRt8CeyeptEk+Vdg2mGJF4QaWa+qlvcucznhBLJG67R/syMoaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by DS0PR11MB7406.namprd11.prod.outlook.com (2603:10b6:8:136::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.28; Wed, 17 Jul
 2024 02:55:30 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::8436:b2d3:31a9:1c8c]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::8436:b2d3:31a9:1c8c%4]) with mapi id 15.20.7762.027; Wed, 17 Jul 2024
 02:55:30 +0000
Content-Type: multipart/alternative;
 boundary="------------jK0cc94LavxNYHOSeCccxZR9"
Message-ID: <1d0210ba-b44c-4e08-912d-b325f91a2665@windriver.com>
Date: Wed, 17 Jul 2024 10:55:23 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] gettext: fix a parallel build issue
To: openembedded-core@lists.openembedded.org,
        Steve Sakoman <steve@sakoman.com>
References: <17D39C0F507EB7F4.7888@lists.openembedded.org>
Content-Language: en-US
From: Changqing Li <changqing.li@windriver.com>
In-Reply-To: <17D39C0F507EB7F4.7888@lists.openembedded.org>
X-ClientProxiedBy: TYCP286CA0142.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31b::18) To DS0PR11MB7312.namprd11.prod.outlook.com
 (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|DS0PR11MB7406:EE_
X-MS-Office365-Filtering-Correlation-Id: 711542d9-5851-4565-b76d-08dca60beb3c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|4022899009|366016|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?eUFJTzlLQXc1Y1F6YVQrdk5VYjNYMnc2cDNSQ1BDOVcyRzRaaGd0OCtmMThL?=
 =?utf-8?B?N1plVXF6U1ZoaHMwRmNGUWsvSTN4aFZMVE44a3M4Z1RGd3BZeU53cXRnS20y?=
 =?utf-8?B?R2JWdTVFU3RtajhDVDU2dWN6YlI3SlN0UUhOcnZWOWZpTnN2TVZmbWlzT05v?=
 =?utf-8?B?M29wOVVpSjBIazJrUE81NWRkamdnTG50dlBCMnh2ZW4vazRQNGd6OENHZnJE?=
 =?utf-8?B?UVQ4RWhqSGRUSkdGTDZ1RGJoeTd2ZlY4UG5OcSsyRVRjQUNGdTlnSFJYWWRw?=
 =?utf-8?B?dW1qZGp5ZnVwS1QyME80YW8rY1VSdFRaZDFleTdicUNOUC9PRURQSEE2UG1x?=
 =?utf-8?B?MFB0TWdRT1ZuSFp4QWY2UzFacXpQbnNiaW4rWklGNHZFK0o5VkVENC9aYUFS?=
 =?utf-8?B?ZWs4alVYR09kWm9FaVErOTV0UFFVdERIZW54RVpnelVMY3Q0TGRwbVl0WUVY?=
 =?utf-8?B?VEkzZEtzdHlGQkYxaUw2MG9VWWtmb0xBdExDTDdiZXRDUzhELzNNbHVnVWVi?=
 =?utf-8?B?WmU4dU1WTWl2V3crVDFDeE5OVjJ3MDNvU2l3VGhVeVQrS1RVdmFmWTNEQ2hu?=
 =?utf-8?B?K0J2UDl6cVAzVzhERDR4Y2hnb2lvZFN1ZFNVQTNaUTQvZlVKeWZ3VnVlTXpq?=
 =?utf-8?B?Qm55UGgwZXF2WEdCYThtcjYrL3ZsM3BhQWFudGliMDFiREY3Q1VSVHQ5K0Ru?=
 =?utf-8?B?S2hyZE1WczBVTnB1M0JmNjdiclAxS0pKU0I5dC9QKy9VWEpYZ0ZiMkZXSUF1?=
 =?utf-8?B?azRzRUVhMzcwUmluZHdGWlNJMXBYMklnc0V4bk82N1VKMXFlb1libWpRMkFj?=
 =?utf-8?B?d3lycTUvT1laUllyRHFvL1ZZWGhxOGlYUWhNQ2p2U2RCeTcxNVZ5ekl0a0Yr?=
 =?utf-8?B?TU9NR2xrVmJnc2RNQzRHdmtWYjFNL3orckNDK1l4dGhadDNUMi90Qlg3LzVI?=
 =?utf-8?B?elI3VW9JQThWTnJEcEtNMHl4Z0dkNkNFbTlERlI4cWZTUnB6VElWSUxSYVJk?=
 =?utf-8?B?c29QSUlyT0xleDF5Ym9IVkNQYVdzZ253eURpdmY1WUFVT1Uxekt1OGRrQVVt?=
 =?utf-8?B?TDRXajdLK3lhNzNaRkQ2RTJvUFdwMXM5Ujd1azNNdFRTS0xpVzFjNk1meFZN?=
 =?utf-8?B?clRSMTFYWHlIdkxnQjNzeXgvNzRleExFKzlaQTU2SGQwMG5RTlU3VzUvTXZS?=
 =?utf-8?B?dU1YUUh0NUF3ZTl1eVNKUkUrdjFkYTBNZ0w2eUFsdm9hekMxVmNFZUN1Zjc0?=
 =?utf-8?B?Tm9ubHhYZ2dpTVN2UVFSUy9DM3ZseVZWcklEeVRuWXpQdW9DMlQxdVA1ZmlE?=
 =?utf-8?B?RUJRM3FyaTZRRmh0TnJjaUE5d0FmemsrbFlwaFlUZ0daSmVpY2ovSi9UZDJL?=
 =?utf-8?B?ZEJUUzFZcEcrSVQ0QmpMUkw3WERSeUlOVjBVTVZrSXdJVnJnZXhPZ3NTYmpk?=
 =?utf-8?B?bDRVSVc1aUZUdXRhZG5ldm92TzhvOTgxQmpGUXJPVjJPQXNvSytLeG5yTkJk?=
 =?utf-8?B?eUg0amNxckZFTHkvYUw1OGliS081R2VxYk04TEwrckF3RjRuREkrdm81RFhs?=
 =?utf-8?B?c1ozR3NpMWhLYkRUQzBZSkRHNC96TE5qcEhtbVBoY3psellWbWUzYytzTko0?=
 =?utf-8?B?UUFjNEJCSmU2L0hoNXEyb1BZSGZrSi9OVXdJZnZtZGJsekhkLy9Mdk9qQ20v?=
 =?utf-8?B?c2o4akNTVDI0L0oyQVpiNlhtZ3NUTE8xVkc5S2tIQm5QQm5yMXNIWG9jUHM2?=
 =?utf-8?Q?FFtgsyOtVKK+lcLkKg=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(4022899009)(366016)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?WFBsYUQyRUJuVWx5TXZ5Vi9iOFpQYk53OG9zWkhmcTJzYmF2S0FpQWFCQ1pB?=
 =?utf-8?B?UGRPdWpDbkJMSEgxa1BERGk0NVFmQUxwZFZXeGp1bWdNcVNubmRCMXVLU1FN?=
 =?utf-8?B?Tm5zVHl6eFVUR1BOVkJHUDlPd0ROQ2RuZmNzTm1STVJXbXhjMUVYdSthYXJE?=
 =?utf-8?B?ZmhHYy8vbzJWRFlaYUY4UDM3ZHBXYlMxS3YxOFllUmZmV2pFMTRETWhodFQy?=
 =?utf-8?B?a3hxMW1ycS83ZmxxSVp6b2YxS2tmNWNPOFRPRG9INnVYWVBkaWVmaFBHbVVh?=
 =?utf-8?B?NzJkSFcxb2QwemQvNnQ3ZHNhODNNbE11WUdEekJtZWxPWmE0NDM1TWtvbTVz?=
 =?utf-8?B?c2JYczlYLzlJQUpGVXNPbUxPVWhYam92NzRoc0FCMmNiRWdhWWFvYTlrdll2?=
 =?utf-8?B?VE44RTdBU1NGVXRCY1FBUkk1a0hEMEFGMERvRXFSbm1MMVdaT3d0RTZNRzhm?=
 =?utf-8?B?TmYxQ0pZZC9NNW9ncDVVeXpISFkxeDQxZit2SkhZZVMrT0JlTStDZDBjUDI2?=
 =?utf-8?B?T2pkVjZ4RkE2bkRVT0RsSzhpNG9aWFRIQjhjWkU0YjNKM0tMOER4REMrczlH?=
 =?utf-8?B?a3JtZkFuSVQrYnNreGN5VkhIZjV4T0NTT2pxMUd0eWJFUkc3a25HbXlPL1do?=
 =?utf-8?B?S1VMZHdvZXp6MUUvTjlWcTVMTVJEQkRPVUNPeGJ2L0ZBT2d2SUVDbVVXQldG?=
 =?utf-8?B?TVBUM0pLZmNMV0dmdFN5L3B3bGV3Q0swK3lrODc0UmF2WXl4dmw5TWRROVhZ?=
 =?utf-8?B?bWxyR2xmM0tiL043SW5oeE93OWpxNjg0Um5RYlBvTFRjTTQvT21jY0dBRGs5?=
 =?utf-8?B?QnFxTGNjcnE5VDdiY0NNS2pnZE04SkZ0NTRUaStuRmN3ZkovUW83ZzZUdG9O?=
 =?utf-8?B?TkJKSUs2ekU5dm9ueHhzdjlkdjJOTUVBbzYrdnlLU3czQmlad0gwcmNUT0kr?=
 =?utf-8?B?MGpEeVRFZWUzaGJhNTdSZ0xacFhvRHhyK0dUY3IwWjVxczNnNXFvLyt4ZVpY?=
 =?utf-8?B?SmFDOGVGc1FjclJnYitHK29pcG0rbWZ1THlIMTQ0SUg5SjJNUzdPRm5zWm1a?=
 =?utf-8?B?TFpEeC9LRlhLOHp0YU5DL1dleXB3N1FUQjk0SDZ5bER4UDBWKzdYM1g3em1x?=
 =?utf-8?B?UlVPTEhEamllMk1iUzNYUDh2QnJlOUhZa1hYOExhcmM2REMwMnBlWXZ2WU9K?=
 =?utf-8?B?RWVDNkF0Y08yUmRsVHRISUxUVTVwTmtTblYzazlLbkc5dGtvL2xNdDBXNUlX?=
 =?utf-8?B?dldBZzVXa2RxNy81VHhnZVoraTRvNFpIZm9jVjVQblo2eHhnWGVUR0FucVdy?=
 =?utf-8?B?Vkc5WncvcTIzY1dha1p2SWVpVkJhbXNXNFRnMFBhM01QR0g5eVFTOUg4Tjhj?=
 =?utf-8?B?L1ZUNjBMcU5uVWVRZGh5RXY5Z0ZGUGNrM2ZiTkxQSTBZcTYrQ3JxWjU1bmYx?=
 =?utf-8?B?WlV0dVpUU1I0WnZvcGFFK3FoM1ZuVmdIS2RlbHczOE5QUlp4QURTaG5PMVF4?=
 =?utf-8?B?ZUYxZTdPUWdROEI1UDlESElnaDJVQ3BnazBOUGRacnVoNmRsRUFKMkhYS21i?=
 =?utf-8?B?Ynl0WFV4dkVxb2pUR1NjTSt6ZjVBZ2phamRndnRoN3lzR3M1bDBmdDdNbVdP?=
 =?utf-8?B?cTZHMWZ0cGNVN2ZpUHlvVFljdzhrTkY4Tjg5TEVwbSswVjduUGRaZ0twbllh?=
 =?utf-8?B?REpodmdVbkZmY2NGVFBxL3dIL2pDYTVYYU5xd21oczRjSm90N1dCeWdNc3BK?=
 =?utf-8?B?RXlaR2o5VnJCaXo4Qkh0V3MrUHQrOTNhUVIyTENSQ0RiNTNZSXRidVRQWFhC?=
 =?utf-8?B?dVRaYTJiNFU5RGJKWHBmcEpka0pWbTU1K3F6YkFHcExMYWN1ejJRTUF4OVkx?=
 =?utf-8?B?RG9EQkRWU3JzazQvck9XbDNOYUJUUmxNUDRodjh3TzBhUkttVTRxL3E4bS9H?=
 =?utf-8?B?MEhXa01ndFdzeUFjSjJ4ZHpXbmxWZ1l4Z1NKOVFpVGxkSFFSZjVZQUozcEQ1?=
 =?utf-8?B?eFU3aHYrSFdLS3pzWmxRRG1KYXpDa1U0eGNQOHo1L05VK3FzL0JHc3dYYjRq?=
 =?utf-8?B?UHZPOGxyaGp0VmREdkQ1Y2FJU0RiMFV3ZHVaT2dNbEh0QnpaVElNYmlqNVdW?=
 =?utf-8?B?MCtuR2hzOTlGN2xkQzJZTHIxNjl2ZURQRDhjcjlQamxjSG9rSDdQS20wY1h6?=
 =?utf-8?B?V2c9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 711542d9-5851-4565-b76d-08dca60beb3c
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2024 02:55:30.3421
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RwDVxIfHp159dCrkJM7Y2oIIeP9aApeBDa3AGI3G5HOHm+3FGI48469fveSix+ebRSMOnJ7bf0LGytNixQe19gaM6nAxpGw9jrbvpXHCPVE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7406
X-Proofpoint-GUID: l4cerd8qg_W3sebVSb029qNPC43yGBGj
X-Proofpoint-ORIG-GUID: F3QtMhrjQ3nL1_ArUMB0_x1hyypfvYi1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-16_04,2024-07-16_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 priorityscore=1501 mlxscore=0 adultscore=0 spamscore=0
 suspectscore=0 malwarescore=0 clxscore=1015 phishscore=0 mlxlogscore=999
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2407110000 definitions=main-2407170021
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Jul 2024 02:55:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202136

--------------jK0cc94LavxNYHOSeCccxZR9
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi, Steve

Could you help to cherry-pick this patch to scarthgap? Thanks

Regards

Changqing

On 5/28/24 17:11, Changqing Li wrote:
> From: Changqing Li<changqing.li@windriver.com>
>
> Occasionally, gettext will build failed with error:
> In file included from ../../../gettext-0.22.5/gettext-runtime/intl/gettextP.h:71,
>                   from ../../../gettext-0.22.5/gettext-runtime/intl/log.c:24:
> ./libgnuintl.h:98:1: error: unterminated comment
>     98 | /* The user can define _INTL_RE
>        | ^
> ./libgnuintl.h:17: error: unterminated #ifndef
>     17 | #ifndef _LIBINTL_H
>
> In file included from ../../../gettext-0.22.5/gettext-runtime/intl/gettextP.h:71,
>                   from ../../../gettext-0.22.5/gettext-runtime/intl/langprefs.c:25:
> ./libgnuintl.h:98:1: error: unterminated comment
>     98 | /* The user can define _INTL_RE
>        | ^
> ./libgnuintl.h:17: error: unterminated #ifndef
>     17 | #ifndef _LIBINTL_H
>
> It is a parallel build issue caused by missing dependencies, backport
> patch to fix it.
>
> Signed-off-by: Changqing Li<changqing.li@windriver.com>
> ---
>   ...1-intl-Fix-build-failure-with-make-j.patch | 35 +++++++++++++++++++
>   meta/recipes-core/gettext/gettext_0.22.5.bb   |  1 +
>   2 files changed, 36 insertions(+)
>   create mode 100644 meta/recipes-core/gettext/gettext/0001-intl-Fix-build-failure-with-make-j.patch
>
> diff --git a/meta/recipes-core/gettext/gettext/0001-intl-Fix-build-failure-with-make-j.patch b/meta/recipes-core/gettext/gettext/0001-intl-Fix-build-failure-with-make-j.patch
> new file mode 100644
> index 0000000000..144259dd3f
> --- /dev/null
> +++ b/meta/recipes-core/gettext/gettext/0001-intl-Fix-build-failure-with-make-j.patch
> @@ -0,0 +1,35 @@
> +From 97a6a63ad61949663283f5fad68c9d5fb9be1f15 Mon Sep 17 00:00:00 2001
> +From: Bruno Haible<bruno@clisp.org>
> +Date: Tue, 12 Sep 2023 11:33:41 +0200
> +Subject: [PATCH] intl: Fix build failure with "make -j".
> +
> +Reported by Christian Weisgerber<naddy@mips.inka.de>  at
> +<https://lists.gnu.org/archive/html/bug-gettext/2023-09/msg00005.html>.
> +
> +* gettext-runtime/intl/Makefile.am (langprefs.lo, log.lo): Depend on gettextP.h
> +and its subordinate includes.
> +
> +Upstream-Status: Backport [https://git.savannah.gnu.org/gitweb/?p=gettext.git;a=commit;h=97a6a63ad61949663283f5fad68c9d5fb9be1f15]
> +Signed-off-by: Changqing Li<changqing.li@windriver.com>
> +---
> + gettext-runtime/intl/Makefile.am | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/gettext-runtime/intl/Makefile.am b/gettext-runtime/intl/Makefile.am
> +index da7abb758..9e56978bc 100644
> +--- a/gettext-runtime/intl/Makefile.am
> ++++ b/gettext-runtime/intl/Makefile.am
> +@@ -387,8 +387,8 @@ dngettext.lo:        ../config.h $(srcdir)/gettextP.h libgnuintl.h $(srcdir)/gmo
> + ngettext.lo:         ../config.h $(srcdir)/gettextP.h libgnuintl.h $(srcdir)/gmo.h $(srcdir)/loadinfo.h
> + plural.lo:           ../config.h $(srcdir)/plural-exp.h $(PLURAL_DEPS)
> + plural-exp.lo:       ../config.h $(srcdir)/plural-exp.h
> +-langprefs.lo:        ../config.h
> +-log.lo:              ../config.h
> ++langprefs.lo:        ../config.h $(srcdir)/gettextP.h libgnuintl.h $(srcdir)/gmo.h $(srcdir)/loadinfo.h
> ++log.lo:              ../config.h $(srcdir)/gettextP.h libgnuintl.h $(srcdir)/gmo.h $(srcdir)/loadinfo.h
> + printf.lo:           ../config.h
> + setlocale.lo:        ../config.h $(srcdir)/gettextP.h libgnuintl.h $(srcdir)/gmo.h $(srcdir)/loadinfo.h
> + version.lo:          ../config.h libgnuintl.h
> +--
> +2.25.1
> +
> diff --git a/meta/recipes-core/gettext/gettext_0.22.5.bb b/meta/recipes-core/gettext/gettext_0.22.5.bb
> index 1a66d37916..7eeb1a86fd 100644
> --- a/meta/recipes-core/gettext/gettext_0.22.5.bb
> +++ b/meta/recipes-core/gettext/gettext_0.22.5.bb
> @@ -28,6 +28,7 @@ SRC_URI += " \
>              file://serial-tests-config.patch  \
>              file://0001-tests-autopoint-3-unset-MAKEFLAGS.patch  \
>              file://0001-init-env.in-do-not-add-C-CXX-parameters.patch  \
> +file://0001-intl-Fix-build-failure-with-make-j.patch  \
>              "
>   
>   inherit autotools texinfo pkgconfig ptest
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#199962):https://lists.openembedded.org/g/openembedded-core/message/199962
> Mute This Topic:https://lists.openembedded.org/mt/106345410/3616873
> Group Owner:openembedded-core+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub  [changqing.li@eng.windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
--------------jK0cc94LavxNYHOSeCccxZR9
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#cceed0">
    <p>Hi, Steve</p>
    <p>Could you help to cherry-pick this patch to scarthgap? Thanks</p>
    <p>Regards</p>
    <p>Changqing<br>
    </p>
    <div class="moz-cite-prefix">On 5/28/24 17:11, Changqing Li wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:17D39C0F507EB7F4.7888@lists.openembedded.org">
      <pre class="moz-quote-pre" wrap="">From: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>

Occasionally, gettext will build failed with error:
In file included from ../../../gettext-0.22.5/gettext-runtime/intl/gettextP.h:71,
                 from ../../../gettext-0.22.5/gettext-runtime/intl/log.c:24:
./libgnuintl.h:98:1: error: unterminated comment
   98 | /* The user can define _INTL_RE
      | ^
./libgnuintl.h:17: error: unterminated #ifndef
   17 | #ifndef _LIBINTL_H

In file included from ../../../gettext-0.22.5/gettext-runtime/intl/gettextP.h:71,
                 from ../../../gettext-0.22.5/gettext-runtime/intl/langprefs.c:25:
./libgnuintl.h:98:1: error: unterminated comment
   98 | /* The user can define _INTL_RE
      | ^
./libgnuintl.h:17: error: unterminated #ifndef
   17 | #ifndef _LIBINTL_H

It is a parallel build issue caused by missing dependencies, backport
patch to fix it.

Signed-off-by: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>
---
 ...1-intl-Fix-build-failure-with-make-j.patch | 35 +++++++++++++++++++
 meta/recipes-core/gettext/gettext_0.22.5.bb   |  1 +
 2 files changed, 36 insertions(+)
 create mode 100644 meta/recipes-core/gettext/gettext/0001-intl-Fix-build-failure-with-make-j.patch

diff --git a/meta/recipes-core/gettext/gettext/0001-intl-Fix-build-failure-with-make-j.patch b/meta/recipes-core/gettext/gettext/0001-intl-Fix-build-failure-with-make-j.patch
new file mode 100644
index 0000000000..144259dd3f
--- /dev/null
+++ b/meta/recipes-core/gettext/gettext/0001-intl-Fix-build-failure-with-make-j.patch
@@ -0,0 +1,35 @@
+From 97a6a63ad61949663283f5fad68c9d5fb9be1f15 Mon Sep 17 00:00:00 2001
+From: Bruno Haible <a class="moz-txt-link-rfc2396E" href="mailto:bruno@clisp.org">&lt;bruno@clisp.org&gt;</a>
+Date: Tue, 12 Sep 2023 11:33:41 +0200
+Subject: [PATCH] intl: Fix build failure with &quot;make -j&quot;.
+
+Reported by Christian Weisgerber <a class="moz-txt-link-rfc2396E" href="mailto:naddy@mips.inka.de">&lt;naddy@mips.inka.de&gt;</a> at
+<a class="moz-txt-link-rfc2396E" href="https://lists.gnu.org/archive/html/bug-gettext/2023-09/msg00005.html">&lt;https://lists.gnu.org/archive/html/bug-gettext/2023-09/msg00005.html&gt;</a>.
+
+* gettext-runtime/intl/Makefile.am (langprefs.lo, log.lo): Depend on gettextP.h
+and its subordinate includes.
+
+Upstream-Status: Backport [<a class="moz-txt-link-freetext" href="https://git.savannah.gnu.org/gitweb/?p=gettext.git;a=commit;h=97a6a63ad61949663283f5fad68c9d5fb9be1f15">https://git.savannah.gnu.org/gitweb/?p=gettext.git;a=commit;h=97a6a63ad61949663283f5fad68c9d5fb9be1f15</a>]
+Signed-off-by: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>
+---
+ gettext-runtime/intl/Makefile.am | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/gettext-runtime/intl/Makefile.am b/gettext-runtime/intl/Makefile.am
+index da7abb758..9e56978bc 100644
+--- a/gettext-runtime/intl/Makefile.am
++++ b/gettext-runtime/intl/Makefile.am
+@@ -387,8 +387,8 @@ dngettext.lo:        ../config.h $(srcdir)/gettextP.h libgnuintl.h $(srcdir)/gmo
+ ngettext.lo:         ../config.h $(srcdir)/gettextP.h libgnuintl.h $(srcdir)/gmo.h $(srcdir)/loadinfo.h
+ plural.lo:           ../config.h $(srcdir)/plural-exp.h $(PLURAL_DEPS)
+ plural-exp.lo:       ../config.h $(srcdir)/plural-exp.h
+-langprefs.lo:        ../config.h
+-log.lo:              ../config.h
++langprefs.lo:        ../config.h $(srcdir)/gettextP.h libgnuintl.h $(srcdir)/gmo.h $(srcdir)/loadinfo.h
++log.lo:              ../config.h $(srcdir)/gettextP.h libgnuintl.h $(srcdir)/gmo.h $(srcdir)/loadinfo.h
+ printf.lo:           ../config.h
+ setlocale.lo:        ../config.h $(srcdir)/gettextP.h libgnuintl.h $(srcdir)/gmo.h $(srcdir)/loadinfo.h
+ version.lo:          ../config.h libgnuintl.h
+-- 
+2.25.1
+
diff --git a/meta/recipes-core/gettext/gettext_0.22.5.bb b/meta/recipes-core/gettext/gettext_0.22.5.bb
index 1a66d37916..7eeb1a86fd 100644
--- a/meta/recipes-core/gettext/gettext_0.22.5.bb
+++ b/meta/recipes-core/gettext/gettext_0.22.5.bb
@@ -28,6 +28,7 @@ SRC_URI += &quot; \
            <a class="moz-txt-link-freetext" href="file://serial-tests-config.patch">file://serial-tests-config.patch</a> \
            <a class="moz-txt-link-freetext" href="file://0001-tests-autopoint-3-unset-MAKEFLAGS.patch">file://0001-tests-autopoint-3-unset-MAKEFLAGS.patch</a> \
            <a class="moz-txt-link-freetext" href="file://0001-init-env.in-do-not-add-C-CXX-parameters.patch">file://0001-init-env.in-do-not-add-C-CXX-parameters.patch</a> \
+           <a class="moz-txt-link-freetext" href="file://0001-intl-Fix-build-failure-with-make-j.patch">file://0001-intl-Fix-build-failure-with-make-j.patch</a> \
            &quot;
 
 inherit autotools texinfo pkgconfig ptest
</pre>
      <br>
      <fieldset class="moz-mime-attachment-header"></fieldset>
      <pre class="moz-quote-pre" wrap="">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#199962): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/message/199962">https://lists.openembedded.org/g/openembedded-core/message/199962</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/106345410/3616873">https://lists.openembedded.org/mt/106345410/3616873</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a class="moz-txt-link-abbreviated" href="mailto:changqing.li@eng.windriver.com">changqing.li@eng.windriver.com</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</pre>
    </blockquote>
  </body>
</html>

--------------jK0cc94LavxNYHOSeCccxZR9--

