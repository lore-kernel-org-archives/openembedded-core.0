Return-Path: <Jinfeng.Wang.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF08EE67495
	for <webhook@archiver.kernel.org>; Fri,  1 Nov 2024 02:03:21 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.28318.1730426598903262004
 for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Oct 2024 19:03:19 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=10350dd57e=jinfeng.wang.cn@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A11jd2O030132
	for <openembedded-core@lists.openembedded.org>; Fri, 1 Nov 2024 02:03:18 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2171.outbound.protection.outlook.com [104.47.56.171])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 42mf2e8ctm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 01 Nov 2024 02:03:17 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HKxo/CN+0Fb2Npkvvlgp2bKp9BHhFb5k2ATusid8pOeRC4Gxol/anCV0i6PfvBOi/IdXjLmWnelSRzSZ44a9aKZnvT0DJCI7le8s9HHdo5Pi3CqBZbmC85QOewtwoAdKsifzWWUTOGfqBqPWPhNQNN4ZK1yF8yIKbI/wxtA17LJYFLjtQNi2AeUnnP/i6xS9GCSkNY22Gpkd7OjZ5CM0iUbQho67JAdtQe93zPJS2dlZY59QE/bA0JtUW/AkTgrVd1chfTdrYQSMWu1af2Zz0rgMGi/12wsI+v5BcmcyBgTgreGanoc/L7++84dIJd7jBWlQUppMI4fMlZJU3gaVBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+M9CAjm5GR13sCWn3imnRvkQVobdeGHh9wW/Hg8CYWc=;
 b=NzbRZarhnp8Lmvh1jJV1SS3fHNiBVhDYND2EoNRC5wtDg2r6q7pvH3SiWKqBC1P9pyCINVxt59HG8JXJlgLUuh5FsIHnVLMRBzM5t1pso6/2WaCXl94OJ+sOLpZUlIc8q4oHDM+oQz+E2MUNALizRjsZTEkpu5r+5pnY7YFeTyyJ7WhAthuR1eNc/5YyouWBmPDAcLe4/oNmi4OuNA747Zbbi5pryjzzfku8Awbe5pJNJWrJYSNfqKPq9/LJjAGa4pp28r2EOOvl7G2WTc8AA9o4KYgsxI/fvbHwlRpPmS2jgwC1FClHimj+Bnb1UUeM0iThsfjR7dv7ATFbYbEAQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM4PR11MB5533.namprd11.prod.outlook.com (2603:10b6:5:38a::7) by
 DS0PR11MB8134.namprd11.prod.outlook.com (2603:10b6:8:15a::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8093.32; Fri, 1 Nov 2024 02:03:13 +0000
Received: from DM4PR11MB5533.namprd11.prod.outlook.com
 ([fe80::8ce3:74f6:33ca:3dfd]) by DM4PR11MB5533.namprd11.prod.outlook.com
 ([fe80::8ce3:74f6:33ca:3dfd%6]) with mapi id 15.20.8114.015; Fri, 1 Nov 2024
 02:03:12 +0000
Message-ID: <b039e834-4deb-49b9-80f1-267174c7d942@windriver.com>
Date: Fri, 1 Nov 2024 10:03:06 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [oe-core][PATCH 2/2] glib-2.0: fix glib-2.0 ptest failure when
 upgrading tzdata2024b
To: openembedded-core@lists.openembedded.org
References: <20241028080425.2232475-1-jinfeng.wang.cn@windriver.com>
 <18028F3A690769AE.20159@lists.openembedded.org>
Content-Language: en-US
From: "Wang, Jinfeng (CN)" <jinfeng.wang.cn@windriver.com>
In-Reply-To: <18028F3A690769AE.20159@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR01CA0049.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::13) To DM4PR11MB5533.namprd11.prod.outlook.com
 (2603:10b6:5:38a::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5533:EE_|DS0PR11MB8134:EE_
X-MS-Office365-Filtering-Correlation-Id: 00fa6c84-986e-45fd-ffdd-08dcfa195720
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|4022899009|366016|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?V0N5S2p4Ym9SVTFhTmZBK3E0U0dtMTFtT01sVWhYRmpZcG80NEx5aDg3UUkx?=
 =?utf-8?B?VENFM2hmRFZrVFUvTWovRlV3OXRRMnFSZUs0U0hENEpmVnBua1Z5aXFxMWVW?=
 =?utf-8?B?WXFoeGtrU0xJOVVJZUlhNkp6dTAzZDBvK2VJSERDc1BhQy9HcDlYZXZvZnht?=
 =?utf-8?B?Uld0VjlWWDRPYUIrT01jVWxqVXlQcTVIY3BhYjdhcnZPVzFZYVJ3Vi9UYjVC?=
 =?utf-8?B?enR6UEVEY1dFQUx5c3dOUkJ0T281WHQ0SEYwdTdQYXpmekJlU0lxazU3UGFp?=
 =?utf-8?B?d2t6cFdPTVpScGhHVGJRVjZpVDJWZEpHeHlDanlHSVpEOUcxakQ0THNCNnhM?=
 =?utf-8?B?b0VQZzNIWnZmT3ZIRU9oNDN5WFlla2pwZDFvVktsUk5tRUsrSW93UXVjNnRk?=
 =?utf-8?B?aU5qaExpVVc3Z3Z3cVlRaUI2TlZ2MkFEbEFqVEpHN09wTzAvVjh4bnVPeVRZ?=
 =?utf-8?B?VlgxNWdob0lNbEpMTDNqODVuZVl4SUNVbUs1bTlEQkRHV2I0d2dpS1lMVElK?=
 =?utf-8?B?QW9rQXRzNFRpNHovYjAzUWtNSC9hTnp1dG5PYTlQMEx6VFJONkNjZUhTdEV1?=
 =?utf-8?B?VVQ3eDBFdlZuZVJoUGZjZGIzMUUvdlI1TzVxSzUzMEgrUHRFWjcxdFpFY3Q1?=
 =?utf-8?B?VGM2ai83NnRFbDdNYldyRzlrb0s1RkxBc2RGWG5oK3BKdkdaK0h1NEg5SHhr?=
 =?utf-8?B?cUN0b2F1cER6R1dYY1VucnBBWHY3c0EwcFBIOXJ0bHc3MStFWGMwV2ZDbk5V?=
 =?utf-8?B?anVIeFYrVlVXcXduNmdodURTRnlvOWlEcUJKbmc0NDA4ZDQzV3VITnJmd2NE?=
 =?utf-8?B?RU1zTjdoMlVUQ0gyN0U2ZS94NkY5c1JDREFKN3FpTFdIREQ4NXFGamJWY014?=
 =?utf-8?B?RlcvUUNOVFFjN1BDSzZ6dW5mMm4vM3dPd2V1b28rWTQxSEsvVm9tYmxnQmV5?=
 =?utf-8?B?YVdjVXdJeEppcWpLRk9xNm5VaWFiSkJsaURoTml0UUtucnhhaTZVTFRkdDNJ?=
 =?utf-8?B?cEFmNk5peHh4Q0xsWVZJQ2RuVkFLeXRIWWhmTWNBNVhRY2FVSGV3ZTZYdzJR?=
 =?utf-8?B?N3lNYTRmMDhSWklEMkRKazJiVEYvWmRWNG1UUnE3UTNxL3VPYjRqbXZYQXJL?=
 =?utf-8?B?WW5QSjZrWWVGUE1kajQrbUZYSWNtQkltdGxoQ3laSEQ1eWpwVzFGWHNQQmFM?=
 =?utf-8?B?Q3ZtMG90YzhIaWswanBsYUFOZVR2ZmxORWExRnRUcHVkdDc2cmdLSitZVmhE?=
 =?utf-8?B?eFJsS2d3M0VZYjlrSXBpREdUTWdLbFNWSXpSVUc5ZzdxQTNwbnVwT3pXdVRJ?=
 =?utf-8?B?Rlk5TlRGREFRanZUVVY3L1I5MGpDMWt5anVaMGRQQWtsdVUrYldNMXQzRmw1?=
 =?utf-8?B?b0gyek1TaC9GUW1TWWdoZlNhNm9uK2FSKzZQRVdZQnp5RGNSWFhrMVNpMkYx?=
 =?utf-8?B?eUoydmtWcTR5aHdFQ05TbFFaMEJNdCtqK29zQ1FWWXg5WitLeXU3NENZczR2?=
 =?utf-8?B?WTFsQlhsRHVOYmxhV2wzeHUvSVNMdHkrUFVpTDZFRHdIUVNvUEFXK1JXL2RF?=
 =?utf-8?B?YUpqMTM2QXhGZmRoWjBxdlBFYlUvOUZtdmJiL2JXb21jcnphUkUvNEdjK21n?=
 =?utf-8?B?WEQxOGFlM2xDbFdYUExQZ3VrY0dmckplNHRURVFUc2RVeUlLc2VNMXlPY3Jt?=
 =?utf-8?Q?DDU24TSf3tR3ijxNa7ld?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5533.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(4022899009)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?NzVNN1JGOHNscFBMMUcvMmVRM1ZxdDJReERndnNhOWRLS3hJL2sxMVYrRW1P?=
 =?utf-8?B?bDNQYkNaR1FOaVUzWkVUMU5ieFlyU3BGeGhYTnp5VXBEUVhPNXRaSjZBUnUx?=
 =?utf-8?B?R0ltUkFtVzlYVklSUmd3N2JxaGNDekNaMlVxQ1I0WmtjYkpLMVBNNG4vZHRr?=
 =?utf-8?B?aGw2My9veWdjMlFVNTIvQ09JdXpGaHRFejZYQWNQZW9DNWkweVRQNG9kR2l5?=
 =?utf-8?B?QXJWUVpRNUFCeW5nZDY3bXIxckJvQWlpWDFwODZ2NkRnRUhkN2pOU0xzZWhG?=
 =?utf-8?B?cFZ3M1Eyb25QTFI1bXIvRlZWeTBmeFBxdm8wb0F6Skk4emlTNmFQM3RTdGdy?=
 =?utf-8?B?NVkzZ3dUMDM1WmdrNlFiaEl0YWU5eWxibzl6QkRodkl5cEd2bmtuQ2hKODNG?=
 =?utf-8?B?Zm5UV0R5emdLN0Fxd1hQTy9UYVJKbllxbFBHOE01dkZkeGQ4S0ZseUpYV2s3?=
 =?utf-8?B?dzRFQ0pmbXgvTHpPTGVCekZrMmh5cHBiS1E2SlhzUG5JS25scXRjWkUwalNB?=
 =?utf-8?B?OXVpTTNMQ2Q1MCs0elFGcC9OTHRJQVB1UkdzSmRNdFRWZERUdVc4eiszc0NZ?=
 =?utf-8?B?dHRyTHMyVzJidWVoVWhPdFBZUU1oQk5rMG5LZksvVGZEcWI2SjlRb0cyMkJC?=
 =?utf-8?B?VFhZdDc4OE0ySC93SG1PdmUyN0tnVmJTeWluNlpJemdsOVlsWlZHUEhWRmVm?=
 =?utf-8?B?VnA3cHF3blE2OGQ3Z3hDazVCTzlBQVd4RWh6M2NOcXowb3pUTWNmbWJIQWdW?=
 =?utf-8?B?dWRyRG1iSUNzSjVwSGgwTzdjNHl0U3RFanRKQ3dqVWZ5M1o0VjdhU0pZQTh1?=
 =?utf-8?B?U1V6dmdNbWVOMjMrYmNNWU4vNURXaGJoQVNOdFlYdHMrZlVLWlNScUk0bWgx?=
 =?utf-8?B?NStkbUo2U094SXlJckxaTklPY3Eyb2NFMmhPeExaM0pMQVVjcmh5T0ZhTzlz?=
 =?utf-8?B?bnpXK1BRWnVpQlY2ZXpoeFBkSHkyS1I5amFRdmE0RXhmOUl5WlRWZ3ordjZm?=
 =?utf-8?B?dWNYQUQyeU1XMm9oZHd5bE13c3hQSmdWVWROYjdQbGFXY2VQemw4Ymo5cWor?=
 =?utf-8?B?SFZrazRwUmI0WXB6dzF4WmR4NXo5emdhazZrWGlvem9HRWltZXFkV1BlUzNp?=
 =?utf-8?B?bDVSN1dGKzFLRnNVbEg2QzlxOERWRWR0cUlKeGlwbG1zZUlmWW5EcXUwenRa?=
 =?utf-8?B?K1hCSWlYTHE5L0JJZG84Q0ZmOEdaclFQWkdpSkV5UnJ5em9lMnBMekNaSDhT?=
 =?utf-8?B?REIyZHFWbWhFWnh0K2pVejMrU0o5K2QzSnBTMGdLc3FZSzlQQ0xIaDN0Zmtl?=
 =?utf-8?B?QnliMFFlWmFESytlRnQ2WmdtU3RONFRYbmdQU0x2QVZYWXZSOGVNM2xhUy9G?=
 =?utf-8?B?UElPUm5PQWNKdW91VzY1Q1g0SlNVMVo1VXFVamNRY3NITEpVSXlhTnhtVHow?=
 =?utf-8?B?Sk9wQkhLejM4YXF5Rmc1TW8zUFhqczcvcHJ0MzF1SURkd3BaTmVZU0ZRM1ow?=
 =?utf-8?B?cmRYMEpsVVVCeTFuOHFKcTdVOVV4K05hVzRoWW5lSnBZREh4QzlwWmsyeGU4?=
 =?utf-8?B?RklHaWV4VWJ0dnltVy96VXcrK1ZhS0ovS0dJMzlyWDRna3hmR1F6NHNwTHk5?=
 =?utf-8?B?TUppaWZLZWozL0tRTVBiRzBWYlc3Mk9oVGFpZFdtYk44RFdjd01JM3dWanVS?=
 =?utf-8?B?RTN0MG1tcmM5VG5VSUNEQXA0b29ORlU3bllGNGVDV1RXaEQ5Yk1JdE1hQ3Bj?=
 =?utf-8?B?Wm1CSDk2dEhucFVBQ1J5MUFZcEZoT2dGaFVOZ2Q2UGFCQ3o3b0RxTHZ0dHFr?=
 =?utf-8?B?bWp1czF1eXJhNnpKTHVJN0JaVkNaa05kcUxlaGRDaDBHem04aFV1UHI5MVk4?=
 =?utf-8?B?NFRYT2kvS3k0TVRNVDNaYU5oMFhySUQxRU9vZmJNdmpaQ1Q3SSt4Z3B6eXJj?=
 =?utf-8?B?YVlKWkVuMXBraHl4YStYOW9LSUdOelVtMy9Hcjg3WGhPeEIyeGovaTgzeVhx?=
 =?utf-8?B?NGJsM3Baa1dpNmJVOHh6d3c3WlJVOElMZFVmaTRQZDhlQ0hDVUk3ajdiUkQv?=
 =?utf-8?B?WjJaZW5Va1ZSbE1BcVBiUW1TelVOZUxLZm94NkhyYkYzUWtWMTZmc25zUkVs?=
 =?utf-8?B?b0swWGYrcjVtaG1JQ0xlWjhMSzBnY2FJSk5tVmlYYTNMd3E4aEI0Z29WS2Fs?=
 =?utf-8?B?M2c9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00fa6c84-986e-45fd-ffdd-08dcfa195720
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5533.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2024 02:03:12.6344
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YcD3Akx7K2HZGU9wp3IFYc7E2ucpr1JGApC/XnGpeikRFskqE2zt1i3SSCFvQ7Lw+TxxSxH6uWOr+JZuMdbqaDMcpQaXJfGcFJUJlnFUqtA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8134
X-Authority-Analysis: v=2.4 cv=K4dwHDWI c=1 sm=1 tr=0 ts=672436e5 cx=c_pps a=vIBLTX18KUGM0ea88UIWow==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=VlfZXiiP6vEA:10 a=bRTqI5nwn0kA:10 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8
 a=xNf9USuDAAAA:8 a=NEAV23lmAAAA:8 a=PooQbQ-LlydZ9UKJ6UUA:9 a=QEXdDO2ut3YA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: xw0rx8gq-f881V4NRQiquHjYnHXtN2Tg
X-Proofpoint-ORIG-GUID: xw0rx8gq-f881V4NRQiquHjYnHXtN2Tg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-31_14,2024-10-31_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 bulkscore=0
 spamscore=0 suspectscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 priorityscore=1501 mlxscore=0 phishscore=0 lowpriorityscore=0
 mlxlogscore=999 classifier=spam authscore=0 adjust=0 reason=mlx
 scancount=1 engine=8.21.0-2409260000 definitions=main-2411010012
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Nov 2024 02:03:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206598

Please ignore this patch. I will send a V3 later.


Thanks.

Jinfeng

On 10/28/2024 4:04 PM, Wang, Jinfeng (CN) via lists.openembedded.org wrote:
> From: Jinfeng Wang <jinfeng.wang.cn@windriver.com>
>
> Signed-off-by: Jinfeng Wang <jinfeng.wang.cn@windriver.com>
> ---
>   ...all-back-if-legacy-System-V-PST8PDT-.patch | 79 +++++++++++++++++++
>   meta/recipes-core/glib-2.0/glib.inc           |  1 +
>   2 files changed, 80 insertions(+)
>   create mode 100644 meta/recipes-core/glib-2.0/files/0001-gdatetime-test-Fall-back-if-legacy-System-V-PST8PDT-.patch
>
> diff --git a/meta/recipes-core/glib-2.0/files/0001-gdatetime-test-Fall-back-if-legacy-System-V-PST8PDT-.patch b/meta/recipes-core/glib-2.0/files/0001-gdatetime-test-Fall-back-if-legacy-System-V-PST8PDT-.patch
> new file mode 100644
> index 0000000000..1909abb557
> --- /dev/null
> +++ b/meta/recipes-core/glib-2.0/files/0001-gdatetime-test-Fall-back-if-legacy-System-V-PST8PDT-.patch
> @@ -0,0 +1,79 @@
> +From 2edbf994f9625a564ecf4a6e7f39de077d6b3b77 Mon Sep 17 00:00:00 2001
> +From: Simon McVittie <smcv@debian.org>
> +Date: Fri, 18 Oct 2024 11:23:42 +0100
> +Subject: [PATCH] gdatetime test: Fall back if legacy System V PST8PDT is not
> + available
> +
> +On recent versions of Debian, PST8PDT is part of the tzdata-legacy
> +package, which is not always installed and might disappear in future.
> +Successfully tested with and without tzdata-legacy on Debian unstable.
> +
> +Upstream-Status: Backport [https://github.com/GNOME/glib/commit/fe2699369f79981dcf913af4cfd98b342b84a9c1]
> +Signed-off-by: Simon McVittie <smcv@debian.org>
> +Signed-off-by: Jinfeng Wang <jinfeng.wang.cn@windriver.com>
> +---
> + glib/tests/gdatetime.c | 38 ++++++++++++++++++++++++++++++--------
> + 1 file changed, 30 insertions(+), 8 deletions(-)
> +
> +diff --git a/glib/tests/gdatetime.c b/glib/tests/gdatetime.c
> +index d46f653ac..01498cb54 100644
> +--- a/glib/tests/gdatetime.c
> ++++ b/glib/tests/gdatetime.c
> +@@ -2930,6 +2930,8 @@ test_posix_parse (void)
> + {
> +   GTimeZone *tz;
> +   GDateTime *gdt1, *gdt2;
> ++  gint i1, i2;
> ++  const char *expect_id;
> +
> +   /* Check that an unknown zone name falls back to UTC. */
> +   G_GNUC_BEGIN_IGNORE_DEPRECATIONS
> +@@ -2952,17 +2954,37 @@ test_posix_parse (void)
> +   g_time_zone_unref (tz);
> +
> + /* This fails rules_from_identifier on Unix (though not on Windows)
> +- * but passes anyway because PST8PDT is a zone name.
> ++ * but can pass anyway because PST8PDT is a legacy System V zone name.
> +  */
> +   tz = g_time_zone_new_identifier ("PST8PDT");
> ++  expect_id = "PST8PDT";
> ++
> ++#ifndef G_OS_WIN32
> ++  /* PST8PDT is in tzdata's "backward" set, packaged as tzdata-legacy and
> ++   * not always present in some OSs; fall back to the equivalent geographical
> ++   * name if the "backward" time zones are absent. */
> ++  if (tz == NULL)
> ++    {
> ++      g_test_message ("Legacy PST8PDT time zone not available, falling back");
> ++      tz = g_time_zone_new_identifier ("America/Los_Angeles");
> ++      expect_id = "America/Los_Angeles";
> ++    }
> ++#endif
> ++
> +   g_assert_nonnull (tz);
> +-  g_assert_cmpstr (g_time_zone_get_identifier (tz), ==, "PST8PDT");
> +-  g_assert_cmpstr (g_time_zone_get_abbreviation (tz, 0), ==, "PST");
> +-  g_assert_cmpint (g_time_zone_get_offset (tz, 0), ==, - 8 * 3600);
> +-  g_assert (!g_time_zone_is_dst (tz, 0));
> +-  g_assert_cmpstr (g_time_zone_get_abbreviation (tz, 1), ==, "PDT");
> +-  g_assert_cmpint (g_time_zone_get_offset (tz, 1), ==,- 7 * 3600);
> +-  g_assert (g_time_zone_is_dst (tz, 1));
> ++  g_assert_cmpstr (g_time_zone_get_identifier (tz), ==, expect_id);
> ++  /* a date in winter = non-DST */
> ++  gdt1 = g_date_time_new (tz, 2024, 1, 1, 0, 0, 0);
> ++  i1 = g_time_zone_find_interval (tz, G_TIME_TYPE_STANDARD, g_date_time_to_unix (gdt1));
> ++  /* a date in summer = DST */
> ++  gdt2 = g_date_time_new (tz, 2024, 7, 1, 0, 0, 0);
> ++  i2 = g_time_zone_find_interval (tz, G_TIME_TYPE_DAYLIGHT, g_date_time_to_unix (gdt2));
> ++  g_assert_cmpstr (g_time_zone_get_abbreviation (tz, i1), ==, "PST");
> ++  g_assert_cmpint (g_time_zone_get_offset (tz, i1), ==, - 8 * 3600);
> ++  g_assert (!g_time_zone_is_dst (tz, i1));
> ++  g_assert_cmpstr (g_time_zone_get_abbreviation (tz, i2), ==, "PDT");
> ++  g_assert_cmpint (g_time_zone_get_offset (tz, i2), ==,- 7 * 3600);
> ++  g_assert (g_time_zone_is_dst (tz, i2));
> +   g_time_zone_unref (tz);
> +
> +   tz = g_time_zone_new_identifier ("PST8PDT6:32:15");
> +--
> +2.34.1
> +
> diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
> index 0855e6eb00..6dcb0eb866 100644
> --- a/meta/recipes-core/glib-2.0/glib.inc
> +++ b/meta/recipes-core/glib-2.0/glib.inc
> @@ -225,6 +225,7 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
>              file://0001-meson-Run-atomics-test-on-clang-as-well.patch \
>              file://0001-gio-tests-resources.c-comment-out-a-build-host-only-.patch \
>              file://0010-Do-not-hardcode-python-path-into-various-tools.patch \
> +           file://0001-gdatetime-test-Fall-back-if-legacy-System-V-PST8PDT-.patch \
>              file://skip-timeout.patch \
>              "
>   SRC_URI:append:class-native = " file://relocate-modules.patch \
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#206423): https://lists.openembedded.org/g/openembedded-core/message/206423
> Mute This Topic: https://lists.openembedded.org/mt/109253284/8617462
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [Jinfeng.Wang.CN@windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

