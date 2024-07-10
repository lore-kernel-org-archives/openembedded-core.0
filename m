Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35480C38150
	for <webhook@archiver.kernel.org>; Wed, 10 Jul 2024 08:29:28 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.9419.1720600161757033451
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Jul 2024 01:29:21 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=79219e7e24=qi.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46A4KUXe008899
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Jul 2024 08:29:21 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 406u4x3m3f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Jul 2024 08:29:20 +0000 (GMT)
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 46A8TKSk030484;
	Wed, 10 Jul 2024 08:29:20 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2171.outbound.protection.outlook.com [104.47.58.171])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 406u4x3m3e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 Jul 2024 08:29:20 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GpigBQO09wfvUsvviwnBVlL18YyrDGe8uf6PZSACb1/f1fBSwkueMSy7GRYNa4OwaG5ckM1d+qg8ZxWX64BGKie4+JPYjAJv7q6NzESDe2W43ZimAVXMo1XIKGkH+ZAiALrZt6ZDJ6Tk3MQKDnm7LaQj8Kerx2Cv4b3dMEsehascyhZ1BcNGfz2OB4Wo5jWACLwLo65Lrpm4gMOXme4Xi4pN3A+YIaefkImtIZ4hQpeizd3ko2/Hdt/H36lwx0ceOX2+uMO5ChZ9W/uEIsnqBOZvvRGwksCnZr3CeITyHQglaB/4MnAm3Se8Egb6aOL3V4DXSNFQa/VAyB58Kr1Tsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y0iGws+T7JdbQk6E+tXbKLq/YVLvzHJqbzZsJQiM8Zs=;
 b=YZmG1X7A/iLdrgOqq4ZuHEl1X7ujpuf+DP9E3WBrdZCaKpApxvVyJZO6BiyITEuHOTGnfXZM+ty1q6dqdfJCzBEcLXn86PreDo7R6mKZ9eNVon0Vq6wVCd0/zHlV0Ip3UzbQbinhsOztMyZ2F1aEM/lFbH/Zoa8UZ+f1AdDdTsaiaIrEBN8zK4SNI/+sSp85ovTtI+hBF9CpB6UL/o5Aztk6rfhw4MV/NjUE9gfisjpVXemhpfQ10qhGdOTa/M5lDxPb0962tvXTt2JTyQGT3Dubp5ON3XXN/UmYvT96WLqZXO3UbSpWZIhLwZ8HMQydUG6m8VNnKAaSRK7Gvwl2rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by PH8PR11MB7021.namprd11.prod.outlook.com (2603:10b6:510:223::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.36; Wed, 10 Jul
 2024 08:29:16 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093%4]) with mapi id 15.20.7741.033; Wed, 10 Jul 2024
 08:29:16 +0000
Message-ID: <520b132c-8301-24f4-62e8-192a5f9c44b4@windriver.com>
Date: Wed, 10 Jul 2024 16:29:11 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [OE-core][PATCH 3/4] util-linux/util-linux-libuuid: upgrade from
 2.39.3 to 2.40.1
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
        openembedded-core@lists.openembedded.org
References: <20240704082444.3886275-1-Qi.Chen@windriver.com>
 <20240704082444.3886275-3-Qi.Chen@windriver.com>
 <81ce71fcc1dd30844fe99c2e8808d4abee803b36.camel@linuxfoundation.org>
From: ChenQi <Qi.Chen@windriver.com>
In-Reply-To: <81ce71fcc1dd30844fe99c2e8808d4abee803b36.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: SI2PR02CA0018.apcprd02.prod.outlook.com
 (2603:1096:4:194::18) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|PH8PR11MB7021:EE_
X-MS-Office365-Filtering-Correlation-Id: e315c593-c5d2-49a4-9651-08dca0ba62cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?cGI2WGtSdTBqTlE0UWxRRCtGSlJjcXZwZEdKOVYzckpHV2RKZkZ6d043VGly?=
 =?utf-8?B?cWVkWndwQkF5MHAxQTNlU000aVhpQUNrRHUveFdjMDFwT3lXWFd0c2VVUjdF?=
 =?utf-8?B?T1l0Q2ZEbEgrRHVBNElDWUFDb3I5bk5pMW5IbVAxb29Vem1xKzUyd3VucHFQ?=
 =?utf-8?B?Wk1ySnBqNFhmZ0hjVC9KRkdKbEpnVzhlemtXMWVSK1lacnJSQWxEeGdBTUZ4?=
 =?utf-8?B?aEhaeVYyYzgrbW4vMDVQaXQ0OU9qRG04MjU5ZkdmRElzN3ZRak8yY3E1TWdV?=
 =?utf-8?B?TFpvS29jbC84dUZXS0tybGc0bEs1dDZWRlJtakl6MmNTblFkNURwaTFRMncz?=
 =?utf-8?B?SXJialNRZHpTYzZzZGtzRmdDT2RTZjVUelJJYkpwMGNrWTFmbmR5QU1mR3BI?=
 =?utf-8?B?b2NUU1B4cTNPMU95MG1XQ1RQRDJ3M1FieUFTT0tEV3ZhQnZYamgvcFgwQk5r?=
 =?utf-8?B?aGJiVVYyVnBzVUJuODE5VW9xTHBBUG4yR3R4SkNEdUlwazdsNmlYcGJpTC9t?=
 =?utf-8?B?azRVZDZvbk44L1pBQittS3J3cmoxUjc1SkVJa1dZNlY5MTZQZ0tOamtIanR0?=
 =?utf-8?B?UGdoSXhZZ29hbDhxVFVNWktGRzlUTlhmdlNRdmtTY05TZkNlQkhvUmdhMEs0?=
 =?utf-8?B?aE5Nd0MxenVQU2pEVER0cktlRXQzc2s2NnlqeEJwNlFIaWtqZVBWeFo2MzlQ?=
 =?utf-8?B?SWkrYVV5UmJvU0JhVElzZi9OSGNJNFEyWFhzTmN4UkVXR2NMVzRkNkpRZU5h?=
 =?utf-8?B?K3E4K2gxNW9GcWY5V0MralVDcGJVU04vN3ZyZys0RWhjK2ZzTGxTVW1Dek1N?=
 =?utf-8?B?UnpJNUNzVVQrdk1jMk5QOXV6Uzl0ZjhXU0pXaklwQ2FDVWJHMVJyd0xYb3dh?=
 =?utf-8?B?UllxZS8yaEkyQmQyS2NMVlZEVmNKdUVEUGF5SC9BUldUdmI5UjBJc09hWXY3?=
 =?utf-8?B?Mm5OTVlUcTBhdHU1TmQrOXp5T21Va25lQUZaZHFVYzJ3MWpIM1FiNk5QejlO?=
 =?utf-8?B?eXJuZUdhamNuamR2c21pSTBRU2p4a210bFJEQjJsV1VSdU5EUy9GVmhZNnd3?=
 =?utf-8?B?b2VQRml5RUZmdXlhd2l3d0I1c0V4Wm9rVkR3eE1QdGhva29Fb0orYUhCS05T?=
 =?utf-8?B?VENyaDhCckw4T2g0Vm95WGpVS1NiREVxL0JyRFV4OFdBMVhjN3lEQWozRkJB?=
 =?utf-8?B?WW1SWDRNK0o1NURBVWUyK09ISnpCZmV5NWhkZ0x2OW41Nm9JQXJxNEFmdTdI?=
 =?utf-8?B?UGFXbzlEb0VhckNJOTlXUlNYYjRPRGJFTm5CZFExUGlHZkNCbXJNK3o0bVh0?=
 =?utf-8?B?cUZ1QU4zSUd1MUpQMVppQzkxaFVXdmlEZ0ZmV25jbjVveDhBeEp3OXUvaDVC?=
 =?utf-8?B?Z1REK1Q5a0IvZXA1bjlKeGczVmVHaEVXTzJYa2dRK1dsR0d2UExJdktHaHE0?=
 =?utf-8?B?YXExblNPY2Q3ckcrcHg2Wmg1dkZjK28xdXpZZlhFTGoyZHhzVWFiUTdQMzdC?=
 =?utf-8?B?T083Tjl3TDVWUXZ2UW1icEc5RFV6cHUzS1VjV3hRYWpWZ2Z2aTRUZzF5NG5G?=
 =?utf-8?B?WDQ1SFY3c290KzJoak10TEVIMUVOVmhQZUNlTEYyTzJ2YXhPVGYwY01jMnQ5?=
 =?utf-8?B?bHIwRDhqTnQ4eERzdFFBNEFQTGtId01FYlFGd1BkTDczMVh0OURJOUFLU2JJ?=
 =?utf-8?B?OU95alB5K1lvRzRLZTRyVDVBOENlY0N4MVRKYnptdWoyTkZ1TDR6VUVqZVVK?=
 =?utf-8?Q?jtv8XVehb1ugchBfdA=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?WkFlbDVvLzZZK2h5dzNhSnJqOC84SnpFMDhVUUVRUERHRmxVMkpHcVlVUmhs?=
 =?utf-8?B?V0F2Yy8rTC9ab0VDc3lpenY2QlpWbHYwWEZKS3pESnArYi93blFxQW5yYUln?=
 =?utf-8?B?dEdkQ1FPN1dvNGZXajhYM0NDTklIWXdJaTBxYlZWQUlBOWlMeTNaMkM2K24r?=
 =?utf-8?B?QXY5b3R4STZ6Z2VZRkpMc2JJZVMwL3ljS1h4ZDZrVGRSWW8zRW5aRzVJVlRm?=
 =?utf-8?B?UzJHOEJqem8xVUxaSWczcGc4MjhkRG83OFJlZmViY0lhaWczZ2pSS2RwTTBZ?=
 =?utf-8?B?RTFhVlBUeDZJV2pvWEdheTQvYk1yMS9BUjhnekE4a3N4Ny9aVHh4NVdWTHR0?=
 =?utf-8?B?cTZRdXR2cXk1d2RlZ2dUUFJzc0NGTm41T0I3RjdUVmdlQWQybmRuMXBLUHMv?=
 =?utf-8?B?UDJGOUhORjB1UjdPekdtdTR3Q3RwVU9qQUFmRjhWenQ2TFlCRllCakpRRUNz?=
 =?utf-8?B?VTBGZjVqOGdYR2YyekZpcDIyNExpeFlMRExpRVFRRUdjTU80M01lOHhXUjkv?=
 =?utf-8?B?V09zWGxWMkdKYXFBTFFLcjRYOXhWWDJnSG13N3EyWXFQa3UvNzd3M01XaDl0?=
 =?utf-8?B?U2t6aXgrVVVockM4dDFWQU5hVkM4L3hzZ043M3hHaElqR0JwYnJBU3BpTVNI?=
 =?utf-8?B?SWExSm1MSDNQcWdSWjV0U0pSVEVzS1JSRUVwTEZsL3RSWk01a0IvWDU0NWdK?=
 =?utf-8?B?ODNIMyszRU8wS1B3K1Q2cjdwUVFYWmxkajFjaEZVL3NXQnduTlp0VUNSNnpY?=
 =?utf-8?B?ODlNOC9JRllSUGlHcnVMenFScmZVZWh5UnhQOTlxdE1iZlJZbGNhb1hZeitU?=
 =?utf-8?B?YXVYMWYvbHYxdnd0Z2oxMlN3a1psNEVhT1hWTXZadlo0MFZoL1R0dWhZOEln?=
 =?utf-8?B?ZXVKTXM0cE1pOWlTbFAxb1ExR045VnZ1Ym9iaWlmaVJiLzhTNzVjOTNON3R6?=
 =?utf-8?B?TzZZVTVXWFlQOGxDSy8zazhkRWVwQXNCN0RucGs4SGZ6UWxhazJiMFBmOU9u?=
 =?utf-8?B?T3F1cDVwL2VpeUdXN0pFanFreVZUZ1pJMFZSWGd0bERDSmV3QzFtN1ZNMVRJ?=
 =?utf-8?B?RkJIbHdtRlU3Rnc1TUJyaVNRNVMwNFhhdEdEN1ZqdzgzcDVFR1Q1WDBRQXJZ?=
 =?utf-8?B?ZUJzRnhkTmVGOFBIT0xqZ2l2U1AycXIyT3NWelE2V1daT1JJTVM0OVpHVlQ5?=
 =?utf-8?B?eEMzdFdFd3RZVXhNUDlzWXRMV3FKN3pLT0pGUU8vWUMzMEtlc0JQS2JDVUNI?=
 =?utf-8?B?UldKWEkzMlFoMTduYksvOVpyOVpoYmZvM3FMTU01SGVDZXVDdXFxOHNjU2hM?=
 =?utf-8?B?dWtoOUlrZkRjRzVHcC9aM21UQjlMUHgrV0h4dG14QXpQa0ZoYm1YNXNkZmtM?=
 =?utf-8?B?Yi9kd2plZnFOS2hEdTJveUdQSVh3c1Q5ejJkTzVXbUlRbHVZZE9rSU1Vd0Yv?=
 =?utf-8?B?U1hacG9ja1crNnVpL1lCNUFBMzBRbGtpRzVZME1hT2FldlNUaDhtNEJZN0pW?=
 =?utf-8?B?VllVZ3JZNjVQUHBFQzhDMENiK0VaQmpxVHR3aXlrMzF1K2dZNksxcEhhZjJD?=
 =?utf-8?B?aG8wcDR6V1NUMy9LbTU5ZEhVNTBoUGFsTWtHd3VwNEthOU5zY3o1TDkyVFpG?=
 =?utf-8?B?Q1dqWEgyS2hibnEwYWNWZEQ4WWgrTDFtU2hWZk10VE9tWWcxR0kwbG8wYzlY?=
 =?utf-8?B?K1JYSzErTFR2NkhaZm1pSmNudHlvRmZaWEpldG5OSlVqb3ZMZ1oyOEkwVzRj?=
 =?utf-8?B?N0ZDNU9qbWVjVlZ0cFQ0OE80cVM3SFBnNHJNdlRkQ21zekw2ZDlYaTV4NXNr?=
 =?utf-8?B?ajVTcmFXa3BmRFhibEZaQytBbUljRFQ4aC84dWpFbGMzTWJEajg1aHZkZlo0?=
 =?utf-8?B?UUt5QWxUTm05NVd2YjlnZlBSRWRDUE81UUNMbVJ3NjdMbllMVi84SDd3azAz?=
 =?utf-8?B?a216TVF1eXpOWlhsdUF6YnlzMHZWRXhUR295cUVuM2UxNFZJaUVOL29jVU9j?=
 =?utf-8?B?SDdZVEE2clRFNEtuWGlWckdFU3RCWlB6NGR2Qi83eHpaUWVKbWRTRGxTWFVB?=
 =?utf-8?B?NkxISUVvSEJWUVMzanV2L0ErY0pFemc0SC9mS083RzlrV3kzTGFWS3ViRVNH?=
 =?utf-8?Q?8Z1O3x12zaeOvSGISiAS23pTw?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e315c593-c5d2-49a4-9651-08dca0ba62cb
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2024 08:29:16.2814
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YeqsUmGKHvI7dnMTgc4frvvG6mpiXwztu0zjPtv30c75cUuq5vaEqUfXG1RZ62S3O4X4xSPwm0+MQlYtVdStEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7021
X-Proofpoint-ORIG-GUID: z0xEGM7h_gTJefyBF2SPvceLPTKJ9P00
X-Proofpoint-GUID: lVSXhHYRsLv30fZDXgnjkBYVLI4Eq9Ec
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-10_04,2024-07-09_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 malwarescore=0 bulkscore=0 clxscore=1015 spamscore=0 mlxlogscore=999
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 phishscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2406140001 definitions=main-2407100057
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 46A4KUXe008899
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Jul 2024 08:29:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201690

On 7/10/24 04:54, Richard Purdie wrote:
> On Thu, 2024-07-04 at 01:24 -0700, Chen Qi via lists.openembedded.org
> wrote:
>> From: Chen Qi <Qi.Chen@windriver.com>
>>
>> License-Update:
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> GPL-2.0 is changed to GPL-2.0-only in README.licensing.
>>
>> The following two patches are removed as they've been there in new
>> release:
>>
>>  =C2=A0 0001-login-utils-include-libgen.h-for-basename-API.patch
>>  =C2=A0 mit-license.patch
>>
>> Other existing patches are refreshed to avoid patch-fuzz error.
>>
>> A new PACKAGECONFIG, lastlog2, is added, which serves as a switch to
>> build Y2038
>> safe lastlog pam module. This is a new functionality added in 2.40.
>>
>> This 2.40.1 version has the problem of unnecessary remake, causing
>> intermmittent errors at parallel make. The do_compile:prepend is a
>> workaround for this. Upstream issue and PR are:
>> https://github.com/util-linux/util-linux/issues/3061
>> https://github.com/util-linux/util-linux/pull/3064
>>
>> do_install is changed to do_install:append, the legacy codes are
>> removed. They've been there since the born of oe-core. I tested
>> with ccache, there's no error.
>>
>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>>
> I think these warnings in musl builds may be related to this:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/9230/=
steps/11/logs/warnings
> https://autobuilder.yoctoproject.org/typhoon/#/builders/45/builds/9241
I've reproduced the above issue. I'm looking into it now.
>
> As well as this ptest regressions:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/81/builds/6786
>
> (arm ptest is still building at present:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/82/builds/6608)

I'll look into the ptest failure ASAP.

Regards,

Qi

>
>
> Cheers,
>
> Richard



