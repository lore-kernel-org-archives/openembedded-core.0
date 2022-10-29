Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AB40C38A02
	for <webhook@archiver.kernel.org>; Sat, 29 Oct 2022 01:02:24 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.1951.1667005338226859137
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Oct 2022 18:02:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=mFmYB9r/;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=83011fc69f=randy.macleod@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 29T12HBp012258
	for <openembedded-core@lists.openembedded.org>; Fri, 28 Oct 2022 18:02:17 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=message-id : date
 : subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=fjE3J4G+qALZVr6AjNngMQ2SaZcqlziPk5HzPmVa2og=;
 b=mFmYB9r/DwIWWGHnEYaBHPEKo3PikUsd2sP/Nq2ntdQpbCzBkn7XgW0EH4Nd9Yq9I1tq
 qUKhfErcT+4joJOnTzf+lOrLvPGUqGun13M+bXEEFOYVN72i+k4k374y+pxERL+8QGLS
 mfFkG85luDU6z/ATPhy1T1JKnQiKZREsrw4rI14+ffL8pD7JlWCrG8sbj64xpJHJGr4K
 YCRoWsHymkGcsDfJajm954S6T/HLQyypxLyP1x3PFMvB3at7hni9praSofmZ2yxRpsAA
 gj2dnBwN2Lgewlk8lSai7llQ4bZu5a1vkfsjpqx7cwKitKVQ27e36ZKbLZzwikRUCr3I Vg== 
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2169.outbound.protection.outlook.com [104.47.58.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3kfg0r21ec-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 28 Oct 2022 18:02:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YYxVME9ixOITJRf/MoYifPSx6gnSEieA+ohT3Cbt2OKoiH29nIUh5wwJxDxeuOJVov+bkwPCtWs2Ft0jBljjiIL7Y0+rhFKshIwrAGiuHKFyTfGmmmmR7ybVHd4e5b+/DgDsRr4MlvXDq/EMWAbqTWDxs/p+lUqP0lY14NA7z3MzYYc1N8mPo9pvEqoGflqR9l7SrTiExM+Oyw5usxBokj3LGf/htaAkrql/gPDiR11A1KMNOKZTLzvE13jwmHHChh1XJyCdzC3abQZsO1i7nxQelNQoBq9QOXKugn/JkhZE5WmkbmGXmcKBwqQX98MQQYOEFVtim6MYN81sD6NukQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fjE3J4G+qALZVr6AjNngMQ2SaZcqlziPk5HzPmVa2og=;
 b=KCliR/RjkCtOMZr0rZ5sDa6m8b5SxkYyJF1CBXH3OnjquwhMWtJrP742Rj4BclRtuUm58PtWY+sMYGRYMm2lQJxqhqQ3QxNdAPeq/RD7qWBhqYzXrJabqVWZUdkUPxr8in38ZUNOH7SopRUP3hsT7NAok/820UAqqn0NZld5wlwOkpriTn9PHnEj/PQgIOaYdkrHpeqD5nXxk34Rtsh4T2rFQGIFlzT8KZ9HITZKL1rfTr3lYhZtSmlXABHUtkEkcUYp9SLYREemQTSpJGk+jLVTOq0eZHqDa4qfgDVWQ4TJpqR1gFVy+FJPxUUg31RBs0h124vRaBgHANFS/WWKpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by DS0PR11MB6424.namprd11.prod.outlook.com (2603:10b6:8:c4::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5769.15; Sat, 29 Oct 2022 01:02:15 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::daa9:a3d:d4ac:7043]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::daa9:a3d:d4ac:7043%6]) with mapi id 15.20.5769.015; Sat, 29 Oct 2022
 01:02:15 +0000
Message-ID: <ccbdb7ca-401d-2266-6c00-8c0dee802ecc@windriver.com>
Date: Fri, 28 Oct 2022 21:02:12 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [oe-core][PATCH 1/1] libpam: fix CVE-2022-28321
Content-Language: en-CA
To: Archana Polampalli <archana.polampalli@windriver.com>,
        openembedded-core@lists.openembedded.org
Cc: Hari.GPillai@windriver.com, narpat.mali@windriver.com
References: <20221028162507.1617796-1-archana.polampalli@windriver.com>
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <20221028162507.1617796-1-archana.polampalli@windriver.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0P220CA0008.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::17) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB3994:EE_|DS0PR11MB6424:EE_
X-MS-Office365-Filtering-Correlation-Id: 39aa3b55-dbeb-48ca-87bb-08dab949382d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	voOEiaEPY6ByiX19ooQp5lZ6sKtNUb6X0eMhb8ceoycklD7HqKOHk+tmP8tFYFIw7DfNzTnVbitC7+PAYiaiBa29dDghQA3y14Xud5s8rQ+t9QO+4p3wKpZARZ2Cat6uevwmkjG3ChxdPlnhGgm/+myvOGs+LKGeuq1sW+Mlg0mqgPv21iQ7eDcoC+HsaX3LcKD+Q2bzXFACE0i7wPt3THWqzmIZk64eAsXmGiclWv51c6wLFltTf1/m8ivODBg+dHGkddot88o19zWBBHU+1/NuEe0QmrkOp4oX4hPZoe6v50q7VpKqjc5b+uX/fyHm+jwAvj3L2XLERxj4/22hNAmhwsp1xGQ/ainItyshzPMBE+9vIJ2U34AOCQr85JYL0hvJazQos/X369FsVMb9fkC2w1ccmmcH7rzWnbHUpCmTCOoVPehScL7ZtaMURrn3jaGT3+nxQf/s9RN0/0MKPliCWQg/QLa7LCvPSjsm2Wiqtb58Ylde+TSfcFkJ1ToXCEZP8XNhOyoCkMe8R9oW5UqxpvubogAJnHysrtmmOS4I3lu2d3XEdTD2GcavhbZJG88tKCWpBg3OvBORBwfIZdPcXKO4mAu+qoVN4f7qKzfKLJ4QP8sfQ6DhcbIh4nxCBICgx54hKvv5G+szaII9T7Z4BFH26zWK+F7xbXCXWfUlYWBLuJT4PdO6k/3TFFBjEetCfAxpqE8QEZstHP7CrFPykbXuu6mLeuQi/+gaiGwPRdo+6PAI+Z1+1w7j7WCtuwFWWqfeojbfJA2YRy1KX1A/Nw5rXPiQ1SfwPSgrjWRtXaENp81GI1zgX+Nr5OB4Qbs52B5Fq27QSpMu5V9vjwwQn6UMDlkTwUmXb/jPnNA=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39850400004)(136003)(376002)(346002)(396003)(366004)(451199015)(2616005)(6506007)(6512007)(478600001)(26005)(6666004)(107886003)(186003)(66574015)(53546011)(4001150100001)(83380400001)(2906002)(6486002)(316002)(966005)(66476007)(8936002)(66556008)(66946007)(5660300002)(8676002)(4326008)(41300700001)(31696002)(86362001)(36756003)(38100700002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?QkpqTStIem03N1hSSmcyRnM4ZTV6Z0xETEtOU1ozRFZIQWEwUzdncXdZMXFB?=
 =?utf-8?B?c0NpYTlMdmRPS0ZTa0o4UW94YVJrZ0dtRTE2anI5QjF1QnkvbmM3UFowQjNC?=
 =?utf-8?B?TXNNeTlKbUQ3U3hnZi9HUWh2b1U0L3BrbHNqZ3AvZUJ6WnBNUG50dFlUQS9K?=
 =?utf-8?B?a29xQThBaytMU3VxdlZrbFFGQi94WkRwSjYzYUh1WUZabjVFd3N5T2ZrU1Q4?=
 =?utf-8?B?S2xVVVNrNzBRdnZSRHlSZ21DNzFBVVc4bDNIMzlZRjNGU1ZldXQxK0liUnUr?=
 =?utf-8?B?b1poNHorK2lMdWp3KzVFZzdYQzYvNFhlaVQwRjlzaDVUNUU3RzdkVGRzZkZa?=
 =?utf-8?B?WHFseEVZMlJ1blhtcG1JK2c3akJzSk9paTFtRGpjSGlOeTh3eGZjUGNyeCto?=
 =?utf-8?B?YVFMWitsYmkvL0FqR3FMNzJXOUZLMm1UYlk0dERQc2FCNjZMSC9rODNGWE5J?=
 =?utf-8?B?aUVNNTBHOFlrQUEraVRIZldnTmZSb0VMZFRnYlc0RHhKNkZyRUlueHBhd1Z3?=
 =?utf-8?B?aEtzOTdOU3EvUVZ2bjF2YUxKdXBxS0dNVVgvZXRnZGNEQTY2TkR6RDdxSHda?=
 =?utf-8?B?RmZWVU9KY3RtV0REZEFIRGg2ZnkzVXlKd0pDazlIZytrZnNwRnZ4dndkUG52?=
 =?utf-8?B?Y2VVR0s4Zk5UazJJbldpR0g5TDMraFplMUxHRGUzNTNhcm5CQXZ5dmNxVnF0?=
 =?utf-8?B?ekpTUTJIbFBQeGFIS1BiUENneTdybzBhNDIzNllYWVhCR2xIMDVHY2hxcS9j?=
 =?utf-8?B?OG5PcXRoWFA0THg0MTBzRFdtVVFJcWs5K0w3MWRaNjB3bFdhak44TVJQUi84?=
 =?utf-8?B?RnFHMytVd25DU2FkUm1rNTFoaWtZZ0EvMkZxVFJSTlVZdHQxYTd5blAvcGdO?=
 =?utf-8?B?MWVlMUdmYlFCeUNGSGxtdUIwbHIyQVMxNlZTK1c3ellQbVM5QWlnaUE3dU1O?=
 =?utf-8?B?dU4yd0cyajdCT3hVdnZyWExoKytuTW8xOXk5RHNYKzVlMGlyNUZ0NnlqRFRT?=
 =?utf-8?B?Rkhqb1BGOG04dk5IVHlaTGdWQ294MTA3NFNXRGxxdlVTV3gzMGRoL2RobDIv?=
 =?utf-8?B?eUh2eE9sSjNyMVZhRUFBbzZsV2JuRklGNmd5bTlxQVVvaEJlOC9uMVNzek9i?=
 =?utf-8?B?ZFU4YVQvWHROMFAwQ08rQnZhalh0SzJyS1FkWFQ5TGtOaDMzYnlVN05rQ1pu?=
 =?utf-8?B?NG8wU0hwdTduMmVsRkFqRWhpN1dkM25GQ0ZoRE9XbUpBQUswUDBvM2ROYTZS?=
 =?utf-8?B?T0xOVmFQV0pIeGR6ZnJVamxxM3NGM2pIZ3MxcGg0cW4waGZBMXVOSVhCcHhE?=
 =?utf-8?B?anB3b1RtZTk0M2ZvM3JkWWl0czdoMElKNm5pWEpzTDhrQ0hSOVFxaldTYW9s?=
 =?utf-8?B?YXFhSnc0QXVBdVNOTFRHdmpTM3l4aHhLRnhGZFBNWFZpQkJ5QmhrVUo0cGZM?=
 =?utf-8?B?dkxVNmVzeGZ5c245dC9UMTh6YmFNYVhTSnh5dDB0VzJCYlRlSnN2UWJ4ZGth?=
 =?utf-8?B?cURDVjd0Ly9OTVJ2aFNQZTFTcWtCVk5UbW9iS3VUZjFTOGdQcXZmM2hVWllp?=
 =?utf-8?B?V2RiaUlXNVkzZ1RucCs4N0ZvNTBLZzQwTE5XeHVUcDJxQ3FabUREaHEwTEU1?=
 =?utf-8?B?T3VrZnJBaWx0cnJhcVVUM2NrV0p4V2p5ZVhEVzFNK2lpcTlJeUpFWjk3Ty90?=
 =?utf-8?B?M28rZjRDcGVGbjI1eG1JbVA1OE1aSnJHSHIwMDZJREg2bnNlSkcyUUsyMG1Q?=
 =?utf-8?B?UUdUaisvaWc3TG9Hdm9jOUJyZWdGN3RrZnNWeWNJczJKK0FCajhQaDlTbk1r?=
 =?utf-8?B?MFlLcVB0dzFqRnpMeGNUM1p3NEJ1RDY5ZjEzTHkvb0xZTlhPdU16b0M2bHAy?=
 =?utf-8?B?UGlhbkhwR3JFMFBBZ1VMUVlaaHFhR1M4NW1seXFBU3cvbHFma0dlb0lOWnpW?=
 =?utf-8?B?cDUybTNTQ3dFWVBEMThsaGNVdmJmZmlRM215TFhyek13dFUzOHZrYitJYnlI?=
 =?utf-8?B?Q1V1SHpXTXhjb3BlNWFlam5GRlBIVDRWanpteDliMVRDR2ppN1hzSDJDM1RD?=
 =?utf-8?B?ZHA2MlFUVG9tZGwzMkRQMEcrWjZNUjRJZ0ZWUmJyWjFOL2grM0JYQ1BMTXRy?=
 =?utf-8?B?OUZsNjlDeCtyY2wzOGM5cmp4MTVCN2ZzZkE0MUFaelJ4VENRNnVJT3NmdVVM?=
 =?utf-8?B?U1E9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39aa3b55-dbeb-48ca-87bb-08dab949382d
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2022 01:02:15.4011
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yqdAnrjznpgepqXBsqiJntnvjZl26Inw7sxu+99SlUKWrtilLe9nGHRdS6OWi8FDJ4GgXJ4IEn+rKYL6LIzXflNAJEBz6OW+wC1dbBikjtc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6424
X-Proofpoint-GUID: AGn__NhSTsga5L_VELGSKqS1I8o7LNJe
X-Proofpoint-ORIG-GUID: AGn__NhSTsga5L_VELGSKqS1I8o7LNJe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-28_10,2022-10-27_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 suspectscore=0
 adultscore=0 malwarescore=0 mlxscore=0 phishscore=0 mlxlogscore=999
 impostorscore=0 clxscore=1011 spamscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2210290004
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 29 Oct 2022 01:02:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172275

On 2022-10-28 12:25, Archana Polampalli wrote:
> The Linux-PAM package before 1.5.2-6.1 for openSUSE Tumbleweed allows
> authentication bypass for SSH logins. The pam_access.so module doesn't
> correctly restrict login if a user tries to connect from an IP address
> that is not resolvable via DNS. In such conditions, a user with denied
> access to a machine can still get access. NOTE: the relevance of this
> issue is largely limited to openSUSE Tumbleweed and openSUSE Factory;
> it does not affect Linux-PAM upstream.
>
> References:
> https://nvd.nist.gov/vuln/detail/CVE-2022-28321
>
> Upstream patches:
> https://github.com/linux-pam/linux-pam/commit/08992030c56c940c0707ccbc442b1c325aa01e6d
> https://github.com/linux-pam/linux-pam/commit/23393bef92c1e768eda329813d7af55481c6ca9f
>
> (LOCAL REV: NOT UPSTREAM) -- Not applicable, upstream out of maintenance

That's an internal tracking line so ignore this one please.

../Randy

>
> Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
> ---
>   .../pam/libpam/CVE-2022-28321-0002.patch      | 205 ++++++++++++++++++
>   meta/recipes-extended/pam/libpam_1.5.2.bb     |   1 +
>   2 files changed, 206 insertions(+)
>   create mode 100644 meta/recipes-extended/pam/libpam/CVE-2022-28321-0002.patch
>
> diff --git a/meta/recipes-extended/pam/libpam/CVE-2022-28321-0002.patch b/meta/recipes-extended/pam/libpam/CVE-2022-28321-0002.patch
> new file mode 100644
> index 0000000000..e7bf03f9f7
> --- /dev/null
> +++ b/meta/recipes-extended/pam/libpam/CVE-2022-28321-0002.patch
> @@ -0,0 +1,205 @@
> +From 23393bef92c1e768eda329813d7af55481c6ca9f Mon Sep 17 00:00:00 2001
> +From: Thorsten Kukuk <kukuk@suse.com>
> +Date: Thu, 24 Feb 2022 10:37:32 +0100
> +Subject: [PATCH 2/2] pam_access: handle hostnames in access.conf
> +
> +According to the manual page, the following entry is valid but does not
> +work:
> +-:root:ALL EXCEPT localhost
> +
> +See https://bugzilla.suse.com/show_bug.cgi?id=1019866
> +
> +Patched is based on PR#226 from Josef Moellers
> +
> +Upstream-Status: Backport
> +CVE: CVE-2022-28321
> +
> +Reference to upstream patch:
> +[https://github.com/linux-pam/linux-pam/commit/23393bef92c1e768eda329813d7af55481c6ca9f]
> +
> +Signed-off-by: Stefan Ghinea <stefan.ghinea@windriver.com>
> +---
> + modules/pam_access/pam_access.c | 95 ++++++++++++++++++++++++++-------
> + 1 file changed, 76 insertions(+), 19 deletions(-)
> +
> +diff --git a/modules/pam_access/pam_access.c b/modules/pam_access/pam_access.c
> +index 277192b..bca424f 100644
> +--- a/modules/pam_access/pam_access.c
> ++++ b/modules/pam_access/pam_access.c
> +@@ -637,7 +637,7 @@ remote_match (pam_handle_t *pamh, char *tok, struct login_info *item)
> +       if ((str_len = strlen(string)) > tok_len
> + 	  && strcasecmp(tok, string + str_len - tok_len) == 0)
> + 	return YES;
> +-    } else if (tok[tok_len - 1] == '.') {
> ++    } else if (tok[tok_len - 1] == '.') {       /* internet network numbers (end with ".") */
> +       struct addrinfo hint;
> +
> +       memset (&hint, '\0', sizeof (hint));
> +@@ -678,7 +678,7 @@ remote_match (pam_handle_t *pamh, char *tok, struct login_info *item)
> +       return NO;
> +     }
> +
> +-    /* Assume network/netmask with an IP of a host.  */
> ++    /* Assume network/netmask, IP address or hostname.  */
> +     return network_netmask_match(pamh, tok, string, item);
> + }
> +
> +@@ -696,7 +696,7 @@ string_match (pam_handle_t *pamh, const char *tok, const char *string,
> +     /*
> +      * If the token has the magic value "ALL" the match always succeeds.
> +      * Otherwise, return YES if the token fully matches the string.
> +-	 * "NONE" token matches NULL string.
> ++     * "NONE" token matches NULL string.
> +      */
> +
> +     if (strcasecmp(tok, "ALL") == 0) {		/* all: always matches */
> +@@ -714,7 +714,8 @@ string_match (pam_handle_t *pamh, const char *tok, const char *string,
> +
> + /* network_netmask_match - match a string against one token
> +  * where string is a hostname or ip (v4,v6) address and tok
> +- * represents either a single ip (v4,v6) address or a network/netmask
> ++ * represents either a hostname, a single ip (v4,v6) address
> ++ * or a network/netmask
> +  */
> + static int
> + network_netmask_match (pam_handle_t *pamh,
> +@@ -723,10 +724,12 @@ network_netmask_match (pam_handle_t *pamh,
> +     char *netmask_ptr;
> +     char netmask_string[MAXHOSTNAMELEN + 1];
> +     int addr_type;
> ++    struct addrinfo *ai = NULL;
> +
> +     if (item->debug)
> +-    pam_syslog (pamh, LOG_DEBUG,
> ++      pam_syslog (pamh, LOG_DEBUG,
> + 		"network_netmask_match: tok=%s, item=%s", tok, string);
> ++
> +     /* OK, check if tok is of type addr/mask */
> +     if ((netmask_ptr = strchr(tok, '/')) != NULL)
> +       {
> +@@ -760,54 +763,108 @@ network_netmask_match (pam_handle_t *pamh,
> + 	    netmask_ptr = number_to_netmask(netmask, addr_type,
> + 		netmask_string, MAXHOSTNAMELEN);
> + 	  }
> +-	}
> ++
> ++        /*
> ++         * Construct an addrinfo list from the IP address.
> ++         * This should not fail as the input is a correct IP address...
> ++         */
> ++	if (getaddrinfo (tok, NULL, NULL, &ai) != 0)
> ++	  {
> ++	    return NO;
> ++	  }
> ++      }
> +     else
> +-	/* NO, then check if it is only an addr */
> +-	if (isipaddr(tok, NULL, NULL) != YES)
> ++      {
> ++        /*
> ++	 * It is either an IP address or a hostname.
> ++	 * Let getaddrinfo sort everything out
> ++	 */
> ++	if (getaddrinfo (tok, NULL, NULL, &ai) != 0)
> + 	  {
> ++	    pam_syslog(pamh, LOG_ERR, "cannot resolve hostname \"%s\"", tok);
> ++
> + 	    return NO;
> + 	  }
> ++	netmask_ptr = NULL;
> ++      }
> +
> +     if (isipaddr(string, NULL, NULL) != YES)
> +       {
> +-	/* Assume network/netmask with a name of a host.  */
> + 	struct addrinfo hint;
> +
> ++	/* Assume network/netmask with a name of a host.  */
> + 	memset (&hint, '\0', sizeof (hint));
> + 	hint.ai_flags = AI_CANONNAME;
> + 	hint.ai_family = AF_UNSPEC;
> +
> + 	if (item->gai_rv != 0)
> ++	  {
> ++	    freeaddrinfo(ai);
> + 	    return NO;
> ++	  }
> + 	else if (!item->res &&
> + 		(item->gai_rv = getaddrinfo (string, NULL, &hint, &item->res)) != 0)
> ++	  {
> ++	    freeaddrinfo(ai);
> + 	    return NO;
> ++	  }
> +         else
> + 	  {
> + 	    struct addrinfo *runp = item->res;
> ++	    struct addrinfo *runp1;
> +
> + 	    while (runp != NULL)
> + 	      {
> + 		char buf[INET6_ADDRSTRLEN];
> +
> +-		DIAG_PUSH_IGNORE_CAST_ALIGN;
> +-		inet_ntop (runp->ai_family,
> +-			runp->ai_family == AF_INET
> +-			? (void *) &((struct sockaddr_in *) runp->ai_addr)->sin_addr
> +-			: (void *) &((struct sockaddr_in6 *) runp->ai_addr)->sin6_addr,
> +-			buf, sizeof (buf));
> +-		DIAG_POP_IGNORE_CAST_ALIGN;
> ++		if (getnameinfo (runp->ai_addr, runp->ai_addrlen, buf, sizeof (buf), NULL, 0, NI_NUMERICHOST) != 0)
> ++		  {
> ++		    freeaddrinfo(ai);
> ++		    return NO;
> ++		  }
> +
> +-		if (are_addresses_equal(buf, tok, netmask_ptr))
> ++		for (runp1 = ai; runp1 != NULL; runp1 = runp1->ai_next)
> + 		  {
> +-		    return YES;
> ++                    char buf1[INET6_ADDRSTRLEN];
> ++
> ++                    if (runp->ai_family != runp1->ai_family)
> ++                      continue;
> ++
> ++                    if (getnameinfo (runp1->ai_addr, runp1->ai_addrlen, buf1, sizeof (buf1), NULL, 0, NI_NUMERICHOST) != 0)
> ++		      {
> ++			freeaddrinfo(ai);
> ++			return NO;
> ++		      }
> ++
> ++                    if (are_addresses_equal (buf, buf1, netmask_ptr))
> ++                      {
> ++                        freeaddrinfo(ai);
> ++                        return YES;
> ++                      }
> + 		  }
> + 		runp = runp->ai_next;
> + 	      }
> + 	  }
> +       }
> +     else
> +-      return (are_addresses_equal(string, tok, netmask_ptr));
> ++      {
> ++       struct addrinfo *runp1;
> ++
> ++       for (runp1 = ai; runp1 != NULL; runp1 = runp1->ai_next)
> ++         {
> ++           char buf1[INET6_ADDRSTRLEN];
> ++
> ++           (void) getnameinfo (runp1->ai_addr, runp1->ai_addrlen, buf1, sizeof (buf1), NULL, 0, NI_NUMERICHOST);
> ++
> ++           if (are_addresses_equal(string, buf1, netmask_ptr))
> ++             {
> ++               freeaddrinfo(ai);
> ++               return YES;
> ++             }
> ++         }
> ++      }
> ++
> ++  freeaddrinfo(ai);
> +
> +   return NO;
> + }
> +--
> +2.37.3
> +
> diff --git a/meta/recipes-extended/pam/libpam_1.5.2.bb b/meta/recipes-extended/pam/libpam_1.5.2.bb
> index bde7fef8a2..3be879082e 100644
> --- a/meta/recipes-extended/pam/libpam_1.5.2.bb
> +++ b/meta/recipes-extended/pam/libpam_1.5.2.bb
> @@ -24,6 +24,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/Linux-PAM-${PV}.tar.xz \
>              file://0001-run-xtests.sh-check-whether-files-exist.patch \
>              file://run-ptest \
>              file://pam-volatiles.conf \
> +           file://CVE-2022-28321-0002.patch \
>              "
>   
>   SRC_URI[sha256sum] = "e4ec7131a91da44512574268f493c6d8ca105c87091691b8e9b56ca685d4f94d"


-- 
# Randy MacLeod
# Wind River Linux


