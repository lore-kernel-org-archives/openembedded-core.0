Return-Path: <Yogita.Urade@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B65C1C27C4F
	for <webhook@archiver.kernel.org>; Fri, 21 Jun 2024 10:56:39 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.70126.1718967397628304642
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Jun 2024 03:56:37 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=690294a050=yogita.urade@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45L1poLv008950
	for <openembedded-core@lists.openembedded.org>; Fri, 21 Jun 2024 03:56:37 -0700
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2168.outbound.protection.outlook.com [104.47.57.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3yvrmr0rh9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 21 Jun 2024 03:56:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lOVclgL6FjK7U/LwyKMVbVLk0jM9KKeEUnbZwtILlRfNsKTJ2rJMrQw+ZcdrcKxRwnk0ZvVrN0bBYu2N3F+beHNEouqSeNf9w9/Y90sc85uhBeTaTCwpZdxFcvGm51UuX0P53KkWd2Lcdsv4cThnQJgeSQqpV/cdp8PEV+sbBBxE/j/hTXo9M1Iu6xIJ7EZFgJ3DsWb8dyXW+uLvsHFMkMY4Q7gfSOxWYNRjls94u8A+dDgNaaYFEjytWwmj9PKTXcBG7k6CKvy+mRnmH8v/xdrVLQ3In8Qjo4b47pWNPptX9c7VcaRcUViAXRs9aLbpSb+/V6RZ+SjHSqGk8DIv9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fYmu1LCK7ML5UpXODsTNchAP763jRYE/ALAmlF00sKw=;
 b=TnHFQ+KZXPd3SSnQO/g3WsBJdlk2jqNU0vw8sP7Dh273srTK7mhC1gIiMCDr2oZuCOwmyZKB7AbZK5R4B7gW6vkgDj+Ch6WpF2GPDwKs+XAzIt1aJSFsnNTMciCYep0kRZM3iopPrLcDcaGeow1zzXw5U1vy2olLydUY+NPgQbpFQ8U1Lkr35IMr5TAut/b9N0Y0FMrFuyfJf+osPErT7Fr9iP4x8eLcjFgJ6PBdGL+a/hZ8bu/2/CcocFRSnq8bkTl7Y5TtmQq9yyOU8RSkWbr/CK5TtwmVgdfufMJTPPdCWOfm6g3ImGicuHXR2ijkWwwqNVRTAdBrf/BSZhHypg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CY8PR11MB7169.namprd11.prod.outlook.com (2603:10b6:930:90::14)
 by CY8PR11MB7922.namprd11.prod.outlook.com (2603:10b6:930:7b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.31; Fri, 21 Jun
 2024 10:56:35 +0000
Received: from CY8PR11MB7169.namprd11.prod.outlook.com
 ([fe80::3f03:81e3:3649:d171]) by CY8PR11MB7169.namprd11.prod.outlook.com
 ([fe80::3f03:81e3:3649:d171%6]) with mapi id 15.20.7698.020; Fri, 21 Jun 2024
 10:56:34 +0000
Message-ID: <233485c0-b84c-4a08-8ca8-a1132529bccb@windriver.com>
Date: Fri, 21 Jun 2024 16:24:04 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] acpica: fix CVE-2024-24856
To: openembedded-core@lists.openembedded.org
References: <17DAFF41F481B682.28936@lists.openembedded.org>
Content-Language: en-GB
From: "Urade, Yogita" <yogita.urade@windriver.com>
In-Reply-To: <17DAFF41F481B682.28936@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR07CA0080.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::21) To CY8PR11MB7169.namprd11.prod.outlook.com
 (2603:10b6:930:90::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7169:EE_|CY8PR11MB7922:EE_
X-MS-Office365-Filtering-Correlation-Id: 2074e4c3-29b6-409d-71e2-08dc91e0d0fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|1800799021|376011|366013|4022899006;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?R1JzSWdIR1RTNmJ0TXRZeTdqQUFjWUJTOXZ6TUxVWkxma1lvRUMyZXRQQVcx?=
 =?utf-8?B?Wm9MVXVRcE9Zamh1ZzhpNzIxTmZub28zL0VMaHU0RjZQdUNjdjNlcGgzVEdh?=
 =?utf-8?B?QURMend2akRVWXdmYkhSZzJHRUU2aDh2aFk0ZE1mbXQvZUZuV0NtY25pcjRj?=
 =?utf-8?B?VTZEdXRwVWZzSGlaUGlZNW05K0Z0WGxYVmt1UWtjTlZFMjBhUGNsYzA2VWpp?=
 =?utf-8?B?TGhBekk0SjVxUGtBMnRyV0VpU0QwMUdvbkltMVV5KzhtNEUrWnlkS0NyUDJ6?=
 =?utf-8?B?RDV6Rk9VeEVrK29oUGYwNE1zaCs2UUF3SlZ1WVpLcEFYbHB0SXlNcVBpZWJ6?=
 =?utf-8?B?emtVSU13aU1BeU9LOUNoejUxSENnZ212SVNHanVGdzRqb2JLdEVsN3Zvc0ho?=
 =?utf-8?B?aHFiTmdiQWgrTmlnTTB0ODE2MHVUNUtyNkQ2MGh5enFDMDFvb281RW1EOGR4?=
 =?utf-8?B?Qks1THpsU1czdmtGRmhzSytVRkJWQnp2Qksvd21XQkU4amxUdWIxUzBtSWVx?=
 =?utf-8?B?d1VzV1ZxeU1QSVI0RllwTHBudGI0WGtSMGsrclU1RDlPZ2s2eTlhbWhQY1hn?=
 =?utf-8?B?N2hNQ0NwWEN6TXgvZ3hGZi9CTml1d1dGQnJmV1d4c2VqWGtqQmtYSEt4aXVB?=
 =?utf-8?B?d1hUWHVEL1hURy9xa3F1bFcxYkZ6eCs2ZGZFSUZscEwwRjk2blBrNURBeC9v?=
 =?utf-8?B?MURFd1RCdFZwNmcySHFseGhKdU5DSHkva0tiZUJaTHQyTHhnOGU5RnZhcjhu?=
 =?utf-8?B?QURjNXF5bVcwcVJ6ZmNGQ0NUTGU4MndtWTIvSXloYXNtV21ITlVnZmEyaGFI?=
 =?utf-8?B?clZQWmdiV0tzWUNHRmlZWThMa1hmMCtXTUhuMXlWMm05bG5TWUpHd0U3SzBI?=
 =?utf-8?B?V2lObmRNVXAxb3o0VGU5ZmdsSnd4TnlYbGd6bDlTakdpZGZYN0QvU2pZMnU5?=
 =?utf-8?B?UXErSUpTbFhZbCt2U25EUnhUdEhldHEwU0cwb0drdEM4MDhkS0pROWEwTUo1?=
 =?utf-8?B?dWREeTVTZGN0c1hZd1VxSElJSlRGemY3UklLNTdVYW5JUnZLNlErTUV4bHE2?=
 =?utf-8?B?Z1VtZFg5YnpWRzVQVFJCZW9UR2pCRkRxWi8wRW1LSTFXamd4dXRCd254ZkxN?=
 =?utf-8?B?TVhIVWxoc1ZCN1FIUnRwOWVKS25LNGtWQkk3T09BendkY0tNdyt1WkZtL3M5?=
 =?utf-8?B?dVZ3N1ZZVzdoRDF3eHUwWkZPU1ZGOWl1MURiaC9KbGZEZVFCK3ZkQnpSVFJ2?=
 =?utf-8?B?K2F3M2pLVkRRdGtHajVla01yNVpyVXBUTDlsWkIrL1JhUnU0VmRUaEJ6NmUw?=
 =?utf-8?B?dVJEbVdhc2JEbzNjVVNyNWNDTExKYldSMEowVFVKL2VLTnlQeWp3K2xMYThQ?=
 =?utf-8?B?K0RhZEt2Q2QrZ2V2aVVESVRqRGpPeDVuSU9nV1gxRjN0cVBWTzZXVkNoa0FR?=
 =?utf-8?B?ZXZDVXc4aGlNSjh1bHYvWjhubGR0Y25DRmNES0xJcFlhRnhHUWFPeFlKREQ2?=
 =?utf-8?B?ZEdKZXJib1NXaFZsaHVjMGY3TTZ2MzdMcjU1V2V2VExMM2ZvejdJZGFYYTZK?=
 =?utf-8?B?eGZZckF0UE5sMnAyVWJzOGJ0NHNVZ050bzFaSlc4ckVUT3BQRlZ1eGxGYmF4?=
 =?utf-8?B?WlZ2T1NCWW1OZU1xek4zZFgxL0NEbW81K3llMGluOHg0NzNaZmljMS81T1pa?=
 =?utf-8?B?aEJES2J1R3E2MmE5SDlXY2pkdHM5MFBXaEc4K0dXcm9RRDZaNGVVNThBPT0=?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR11MB7169.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(1800799021)(376011)(366013)(4022899006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?emVPODIvL05qenpmNjllQ1J6eGtpL1NHWDZvb0JTSk5jRFYzaE9iTGlHZ1Zp?=
 =?utf-8?B?d0hBZGpTdTVUbkR5OWFoNzRwU1ZqVnVpdm9FMXE0UXpYM1RXWnhjWERJb0RQ?=
 =?utf-8?B?bk1rTzNnVmVKbXdjeXZ1UlpBOFNBUnFSRG1PbzRPOUI2WG9mS21PVHRMQmFt?=
 =?utf-8?B?Wmo5NjVKc2tZZEpmR2tWSkdrQmpLSEpWTjJXd21WOENxU0hhMnhvbEMrNG01?=
 =?utf-8?B?K3Z5WGo2SW8rM0dwMWFVTGtwaE1GdHNUZ3FvNHp2RklOL0RZQlFPclVUbmRM?=
 =?utf-8?B?WHVJN01hcmZodGJvbFVSS29IeW02WUgzYW0vQ0puVXVKL3kxZHFseGhvT01F?=
 =?utf-8?B?NDdtcDh3MFNqMVZEd09MNjBCVzVSU2tzeVlMU0MzM1l4eUQ1YVJLYjV2bmNy?=
 =?utf-8?B?c0JiSTBMV3BYcWF2MDIraTVzK2ZIaXVoRytGWWZNUUpKYkN2bUdnQmluRWFF?=
 =?utf-8?B?bGFnUUZPekRaaThKb3ZLelZKelBRQlhpdTlVSmxMSzBMWkZURXZ4a1VRNFdh?=
 =?utf-8?B?cVFFVXhrbVVWRWcwRjhRancybHZsSTBSMXJ3RFI0MHdvcksrVW95cGZGcmxr?=
 =?utf-8?B?Wk1MSStDN1dFcFhabno1OGFtZlkyVUZBUzNwU01kTWdKMzc2a3Y5bzQwcS9m?=
 =?utf-8?B?d0NvSVhnSStoeitVYzNWS3hUOGdEcGMyVmxzazJtczNDb2FTMTE4Z0xCd0ls?=
 =?utf-8?B?VlBYWllVV28vZEltYlFVRDh2MUVlWkg3RU45WFE3OUF1WVpXanEvME5xY05a?=
 =?utf-8?B?cjJTVWpNeDZsdjJGUzVHRVNuMXZSZVNUQmg5Z1VmcTRXcThGOXpJQmZ2YnFs?=
 =?utf-8?B?d2NnOUdtRkFYVGM4QlViQnRIdnFib0dwek1hK3oramtrb1V2ekJkOTcwL3hK?=
 =?utf-8?B?eTY4eHdhY0hRZVRtbGZLMmVyc2tMVDZqV0x4TSsxcUJ3L0JKRmpVd3l6bE5j?=
 =?utf-8?B?V25ub0lhTGQrUC8zaCt3dnRqK2wybG5RVjJxQ0dJUDFBREtRZHluKzdQNjIr?=
 =?utf-8?B?YkdZQVJqNlVsb3lOS1JDTUV6T2xuRmV1cmVtNTQyTTFkaW1IOXAyVks4R1Rv?=
 =?utf-8?B?VVRzVGR3RTNSYnBsdFBQdkQrOUdoQko2TFVDK2dPNEJuMlFzdkRWcUFMdDg4?=
 =?utf-8?B?UjJrZmNKMm1OV0VFYVA0WDBsbUExdHptZFRQeURXenlBRG85UWlJRmFXWGRy?=
 =?utf-8?B?enBIVWFtWjNlYStaUTkyempBY0ZWQkNSZWRnVUpndk1tb2VyNWtkakpiOVZZ?=
 =?utf-8?B?ZnV0OXM0QUpDY2JpTzIvdGxEbGxBVGJaRFJkV1FxU2NCa0h4L2NVbTk3Zm5w?=
 =?utf-8?B?M0RRQ3lkeDJMNHk4anQ5L04wWHp2RW9lU1prNjB2bkVwMmNCWWJXZHNkeWhP?=
 =?utf-8?B?aFRYMDRxNVN6RDlnNXcyVE9BNkR4cFkxSTNRb0RZWnNaci9XOHpxN0MyRlJ0?=
 =?utf-8?B?UWRvTVNHNlhOcjJnWnR0NUNRZGw1OHNhMUtKN21HVFJlK2k1V1lpQk1PN1pF?=
 =?utf-8?B?UVcxd0cvL1ZwZERvSGM1Vkx0eW1oY1NUU0x4MnVaRmZHMFMzcUVxQUk4Q2Yr?=
 =?utf-8?B?U29NWnVXSU1CQ3VPWEtVUldELzFXbkJrVURtQWFCU3kwOVVoZWdOVW5nalpB?=
 =?utf-8?B?QlV4TXArQURXQUtKeEZyTlc5Vm5rbzl4MC9ueWdaTG82SExSTlBtbEM2d0lE?=
 =?utf-8?B?WW5zWEY0Y2FrQlV2ME0vV1JLdVQ2OHhDNW5tcWNRZWhLb2FDOTEvcGhHTmtG?=
 =?utf-8?B?TzV0YlZtVlUyeTYyTGJqTlNBRURjN3VkQW9vd0dIVTU1WDBHYkRaT1lRTXdK?=
 =?utf-8?B?MUJGaGh5L0RLYlZ1eE13ZTIrTUwrQW9DZDZGSVRBVXdFaW8zanZYVnRieFps?=
 =?utf-8?B?S2lkOGUxUGtHQlhDY1Qvak5mZ2pFVCtyQUlRMkFBc2xkMWcva0RVNmZjR1Zs?=
 =?utf-8?B?amNZbjM5MzlpRU1xbDkrOFBMNitLa05penhMUlJCbEJyU3pxTk5ndU9BRjA2?=
 =?utf-8?B?THZwRlovanVrK1RIR2RrYkVmc3ZhMVZGV3ExU0dtcE13TVlhQUxnWGg0MDh2?=
 =?utf-8?B?dzlsVGlCR2NjQ1ZGdldrVUdySHRFYTNtaTlFSVArYmdNUzFIL1lZemp5NFQ2?=
 =?utf-8?B?aEo3ZzNtTUlhcWZDQUc5elY4aElURE9OWE1Zc2pHbDFKV0U1V0lMVkZUdm5U?=
 =?utf-8?B?Tnc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2074e4c3-29b6-409d-71e2-08dc91e0d0fe
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7169.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2024 10:56:34.8043
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6LL6Ny8ieTLjjmP7pJDHT83Gox5d+VkiAWJx3FFthoEJYAWinYMUy7mF/ga6PLkqjfummHWi/jwq9eQ+++VJnjYgb1AegTbkPM4FJnv1Zro=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7922
X-Proofpoint-GUID: j1Kqg6xZbhlxFheQCJHfdnMTSWORdlLN
X-Proofpoint-ORIG-GUID: j1Kqg6xZbhlxFheQCJHfdnMTSWORdlLN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-21_04,2024-06-21_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 spamscore=0 phishscore=0 adultscore=0 mlxlogscore=921 suspectscore=0
 impostorscore=0 malwarescore=0 mlxscore=0 clxscore=1011 lowpriorityscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2406140001 definitions=main-2406210081
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Jun 2024 10:56:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201018

I had forgotten to mention the Kirkstone branch.
Will send v2.

../Yogita

On 21-06-2024 16:17, Urade, Yogita via lists.openembedded.org wrote:
> From: Yogita Urade <yogita.urade@windriver.com>
>
> The memory allocation function ACPI_ALLOCATE_ZEROED does not
> guarantee a successful allocation, but the subsequent code
> directly dereferences the pointer that receives it, which may
> lead to null pointer dereference. To fix this issue, a null
> pointer check should be added. If it is null, return exception
> code AE_NO_MEMORY.
>
> Reference:
> https://nvd.nist.gov/vuln/detail/CVE-2024-24856
>
> Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
> ---
>   .../acpica/acpica/CVE-2024-24856.patch        | 33 +++++++++++++++++++
>   .../acpica/acpica_20211217.bb                 |  4 ++-
>   2 files changed, 36 insertions(+), 1 deletion(-)
>   create mode 100644 meta/recipes-extended/acpica/acpica/CVE-2024-24856.patch
>
> diff --git a/meta/recipes-extended/acpica/acpica/CVE-2024-24856.patch b/meta/recipes-extended/acpica/acpica/CVE-2024-24856.patch
> new file mode 100644
> index 0000000000..beb6a79c8e
> --- /dev/null
> +++ b/meta/recipes-extended/acpica/acpica/CVE-2024-24856.patch
> @@ -0,0 +1,33 @@
> +From 4d4547cf13cca820ff7e0f859ba83e1a610b9fd0 Mon Sep 17 00:00:00 2001
> +From: Huai-Yuan Liu <qq810974084@gmail.com>
> +Date: Tue, 4 Jun 2024 11:52:15 +0000
> +Subject: [PATCH] check null return of ACPI_ALLOCATE_ZEROED in
> +
> +AcpiDbConvertToPackage ACPI_ALLOCATE_ZEROED may fails, Elements
> +might be null and will cause null pointer dereference later.
> +
> +Signed-off-by: Huai-Yuan Liu <qq810974084@gmail.com>
> +
> +CVE: CVE-2024-24856
> +Upstream-Status: Backport [https://github.com/acpica/acpica/commit/4d4547cf13cca820ff7e0f859ba83e1a610b9fd0]
> +
> +Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
> +---
> + source/components/debugger/dbconvert.c | 2 ++
> + 1 file changed, 2 insertions(+)
> +
> +diff --git a/source/components/debugger/dbconvert.c b/source/components/debugger/dbconvert.c
> +index 55307d0..c17a5ab 100644
> +--- a/source/components/debugger/dbconvert.c
> ++++ b/source/components/debugger/dbconvert.c
> +@@ -354,6 +354,8 @@ AcpiDbConvertToPackage (
> +
> +     Elements = ACPI_ALLOCATE_ZEROED (
> +         DB_DEFAULT_PKG_ELEMENTS * sizeof (ACPI_OBJECT));
> ++    if (!Elements)
> ++        return (AE_NO_MEMORY);
> +
> +     This = String;
> +     for (i = 0; i < (DB_DEFAULT_PKG_ELEMENTS - 1); i++)
> +--
> +2.40.0
> diff --git a/meta/recipes-extended/acpica/acpica_20211217.bb b/meta/recipes-extended/acpica/acpica_20211217.bb
> index d1727c1dab..ec253b998f 100644
> --- a/meta/recipes-extended/acpica/acpica_20211217.bb
> +++ b/meta/recipes-extended/acpica/acpica_20211217.bb
> @@ -16,7 +16,9 @@ COMPATIBLE_HOST = "(i.86|x86_64|arm|aarch64).*-linux"
>   
>   DEPENDS = "m4-native flex-native bison-native"
>   
> -SRC_URI = "https://acpica.org/sites/acpica/files/acpica-unix-${PV}.tar.gz"
> +SRC_URI = "https://acpica.org/sites/acpica/files/acpica-unix-${PV}.tar.gz \
> +           file://CVE-2024-24856.patch \
> +          "
>   SRC_URI[sha256sum] = "2511f85828820d747fa3e2c3433d3a38c22db3d9c2fd900e1a84eb4173cb5992"
>   
>   UPSTREAM_CHECK_URI = "https://acpica.org/downloads"
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#201017): https://lists.openembedded.org/g/openembedded-core/message/201017
> Mute This Topic: https://lists.openembedded.org/mt/106796341/7312273
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [Yogita.Urade@windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

