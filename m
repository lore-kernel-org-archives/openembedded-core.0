Return-Path: <alex.stewart@ni.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 211EBC54EBD
	for <webhook@archiver.kernel.org>; Mon,  9 Jan 2023 22:03:01 +0000 (UTC)
Received: from mx0a-00010702.pphosted.com (mx0a-00010702.pphosted.com [148.163.156.75])
 by mx.groups.io with SMTP id smtpd.web10.87103.1673301777663893351
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Jan 2023 14:02:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ni.com header.s=pps11062020 header.b=hIrZjYrZ;
 spf=pass (domain: ni.com, ip: 148.163.156.75, mailfrom: prvs=0373619e9c=alex.stewart@ni.com)
Received: from pps.filterd (m0239462.ppops.net [127.0.0.1])
	by mx0b-00010702.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 309GuGsU028623
	for <openembedded-core@lists.openembedded.org>; Mon, 9 Jan 2023 16:02:57 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ni.com; h=message-id : date : to :
 references : cc : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version : subject; s=PPS11062020;
 bh=+7N7osIVt8q7zzqPLxIEXkoKeg8Jn3ZwOC6V1ttIWYI=;
 b=hIrZjYrZEzi4S28LAGirnnmiHGXE72fUjuqlSNoNZPO0MzTwXgUG/bwKNp4Mm1WHUN+d
 H0pF8KEusyBaZl4zK4LO5/AEL1S9KQP1zZ3QL99+uJTzQZ1ODSZtu9Wg7bpD/u7f0eJG
 h+Ahelub02567tl0EidgY/3+GCBTuFzX7u4CYDpYa6XX3gB4osYkWtDRJtLt9TQJa3qo
 uJdkwKupC6hWHa3VxfeXq96F9lEd7H3lH3iSRqQj4oknoUwrWxQiD1V8uRQpbb5i8XNG
 Ql4bIjTlR9wLXL2nIWvw6A5rwblL+C6Z6qiHUUvZUFZevBikwilTHwjF7dYRtxYbJbri aw== 
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02lp2048.outbound.protection.outlook.com [104.47.56.48])
	by mx0b-00010702.pphosted.com (PPS) with ESMTPS id 3my5pmbqnp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 09 Jan 2023 16:02:56 -0600
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VcrDEpLy+xgy+9g6KExuHo7huMIS8c0NlqLJVL+LYKi2RhoFLpjj9FkNMYZum3AdU/EzJ1e6I94iaUxYhJzN3fHiRoxY5tPJ3CzdI0c5Dt39+ooveS8C5B4P7N+ZRj+Fy138lPf7FpqIMYDsBoBDR2s72pbj8+SqbmmpStZ3BOh11ri6RToPT2eeek3lDm7kexl8nf1cQfe+iUMchwHvQEQuJQwxh9vw+NQdmRe+tySLjiID7C7vlgD+yvOEp8urz55EZDN3nntddgwfswo/or7wsKorhKnqxaBr9ap1q1ZjLS2D5H/pbHJUTEXzcwnVOBaR+c94vfytdiqpxae2tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+7N7osIVt8q7zzqPLxIEXkoKeg8Jn3ZwOC6V1ttIWYI=;
 b=RbMsJVH6m3sWYBVhGOU2OrcFpLRQUiruyXg85evYE7gL6Z8EzXZ2NbEE7SoizyT3HaUyEUlMRrk3e2vnS5wzjmhSpwn1svkJNG+dmqpNNWFBYsckCgtYzh8pk5ka6i6I3wSGVba/lDNRH9oZbAHWgoMpn5WXH9WPe9A5vRu1GO1EiFrSoH3TugdQRzC2JAM0opbQ5Qf9iag/ZygVJn95MS9vqNJbQNHUUXi2S4Xcd3wuCkGbPe4mqKguDSe9VXcffEUlqWACfm4sRpB1R8liNgHp3gw8bfs0LGZViyBaz5181XsBfjZJ9ShlFLF2m0A6pKa6ZkZ8O68XgX5bbAIjpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ni.com; dmarc=pass action=none header.from=ni.com; dkim=pass
 header.d=ni.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nio365.onmicrosoft.com; s=selector2-nio365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+7N7osIVt8q7zzqPLxIEXkoKeg8Jn3ZwOC6V1ttIWYI=;
 b=Ji8epk0enHe03T+WZsEiZ0AbWoUyCKzUvCLFYZpYJUj+r2+MjtyBS5PMmrOtj32161IOc3s1lxZOD6uOAdj3/4hwNn0QwfYVLkNZFVdKX2Ch+Vk12RFfkvyr12pTq1l4hw2UpQT/caZMoUZrUxSrsMqIAcdypXh982hK0u8R5zc=
Received: from SN6PR04MB5151.namprd04.prod.outlook.com (2603:10b6:805:90::25)
 by MWHPR0401MB3673.namprd04.prod.outlook.com (2603:10b6:301:79::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Mon, 9 Jan
 2023 22:02:47 +0000
Received: from SN6PR04MB5151.namprd04.prod.outlook.com
 ([fe80::a2a:9230:796a:b163]) by SN6PR04MB5151.namprd04.prod.outlook.com
 ([fe80::a2a:9230:796a:b163%5]) with mapi id 15.20.5986.018; Mon, 9 Jan 2023
 22:02:47 +0000
Message-ID: <5eda82cc-cf6d-c8a8-64d2-d2dfa3af9388@ni.com>
Date: Mon, 9 Jan 2023 16:02:44 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Content-Language: en-US
To: Charlie Johnston <charlie.johnston@ni.com>
References: <20230109212200.500890-1-charlie.johnston@ni.com>
Cc: openembedded-core@lists.openembedded.org
From: Alex Stewart <alex.stewart@ni.com>
Organization: National Instruments Corp.
In-Reply-To: <20230109212200.500890-1-charlie.johnston@ni.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN6PR2101CA0030.namprd21.prod.outlook.com
 (2603:10b6:805:106::40) To SN6PR04MB5151.namprd04.prod.outlook.com
 (2603:10b6:805:90::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR04MB5151:EE_|MWHPR0401MB3673:EE_
X-MS-Office365-Filtering-Correlation-Id: c1122020-f257-4ffc-6863-08daf28d3e20
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	erWbT+m8m+uETHc+1WeisHcIV3fLDa68cpYsEzAcudjw4Z7hVywPkd6Dh35jwDM03JPFTnV6bq25UA0+PPIlJQl7VJQLpPeN21VYap84eUNmc0zgr2e1WC0wZfQIhlTZ3SRkoYjhQ7b9toj3t58HAfd3/3GD8gGdoH4a8gaoIxBbttHmdti3ofq2GyyQ1yscg+jiUDLr7tO/b9eyoSk9SdI3SPQnkvUthVt3T97K89s8U3C7RCn56dskf7IuCL7WwMFpI2CQJfc71ZThlFNWEMX2vUfv/HWaQdppRLwPWtnmQoxV9zBvXwlYCXCjAozlfLpKYSrAHYmXD3yZhZnBfkSlyoFs4fgeA5lm4FJRHv0L8yQKBCJH0JxJCGcO3oXDNg7CKnTFixzWsW1raNcRPKw+w1YY9jK5edsjg3nzeyl2wHDZTS+ZYtK4/0zJVLbbZy3mbUH7luDqrjdVfCZq3aDE+SzDwTK/V9h5qWi34VLB89EAu7MXv0pXjxgVat/Q44KHIJGBRMlfL0IRGyh33ELB7fAVO3ahBCu5NFOPkCVgsZ6QDNCIxHGaZV20pz6utjumNLcQmf6QCvZwSKX03zh07ziKjneXaTFYNDpoIrnDvZEZ9s1qcoRZ3F4E+QiwQOSFL1kOJwaelSkeiYAFCNaoBSTY5oFgJCzFxTuBS8LWnbBASVQzrYcncUwQnotQ36ev07f3BdpNHXbuChOAifruKnaXBVdj5L2wDsYeNxX1HiHr9eaN2W6T/ZAoIkv0HxJrUNy8wnIIg0Uob50Vg33YswPj54PLlJ3+1+N26HE=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR04MB5151.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(346002)(39860400002)(136003)(366004)(396003)(376002)(451199015)(66899015)(4326008)(8936002)(66946007)(66476007)(8676002)(66556008)(6862004)(31686004)(5660300002)(86362001)(37006003)(26005)(6486002)(6636002)(316002)(36756003)(38100700002)(36916002)(966005)(41300700001)(31696002)(2906002)(53546011)(6506007)(478600001)(44832011)(83380400001)(6666004)(6512007)(2616005)(186003)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?VGVuMDMyQ3B3OUR0eWpsT3BKcElsSDRlblFXSlNQU0U2Qm5maTY3dExJM1pS?=
 =?utf-8?B?aTZZQlJ1Y1BsYUFxL1BrQ2hlVG5hamQ5V014SWJ0RGRiRDZYd25ISWVHMUp6?=
 =?utf-8?B?MWJmQ3FPbVF3SXdacXFNMkw1MWRzZGFic2kyT011REJDckpMU1BzNDVySmR6?=
 =?utf-8?B?V2pOdG1pQWZtMXV4bHVZMlhXbzJ1Z0pLVno5SHM1dy84MFI2MzREMGlydklk?=
 =?utf-8?B?ZjBpaXVPT1MxSEdhMFRXUVVuVm1jVlFFSmFZYkFUdkR4SnhUdTVtNmVFRmNr?=
 =?utf-8?B?NHJpcTQvbE1FSnVrMGZyZWUyTU1JVmZlY1pVL0t4Zkd5WlVDdmtsS3NQdUNF?=
 =?utf-8?B?NEVUSVNHSUo3TUhoM0c5cmplcmg3ZElva2ZRYWNtWmh2USt5UXRONldSZ0VZ?=
 =?utf-8?B?Mkp0UVBVUUJYeThaQ01uVkVMNVQ5SDFwUjUxS29GWGkzZXY2L0VwOGxzZWZR?=
 =?utf-8?B?ZWhZaUI0aWN6eVl2MmMrUWxoUDU5QXFVd3ZsVUl0Y0V2OFAraThaWEtWbHRM?=
 =?utf-8?B?blZSTGIyWmtuWStjWXVXQUFlUGsyOE51OEpKaG05M1VJY0FnNFNtNEg1Yngx?=
 =?utf-8?B?NWFJRFc1S1g1ZEtiUFJEeFBPRjJ5Y2g1cVl0Q2g0TmNEeGhFWXByYUc2aHVE?=
 =?utf-8?B?dHVVWnlvanNzcXgzNVhLQU5Bbk9CSHd4SzhhWjhXMFQ4bU50cE1aaVFBMlRt?=
 =?utf-8?B?dlFWU3Y3VmdiWHlKejRra0h2bzJvTjlVajFnZ2lDWUdORjllTmVKVlJua3Fj?=
 =?utf-8?B?VEpRR054ZG12c2g4RmhmVUtwWFFBR3NXUzUwQ01rUEFUTVZwWVRUYzV6Q2do?=
 =?utf-8?B?WFZEcVdKeXdKeDRpTmtSNm5NNmtscXJQUzlzMHBDaDYzRXZUNm9Na284NnM0?=
 =?utf-8?B?WnlxbzVxa1N5SVR5WFJ5OWp3T3p6TnRTbWc4UCtpbHI3a1RSOXNGMzRxMGZ1?=
 =?utf-8?B?aGpTcUNkTFE1bHFJQjNobHRMcDhzS2FDSUpEVk9WcVJWV2IxdGhleFRRQ2NH?=
 =?utf-8?B?VS9OeHZlcjhST0x0UzZZdWFpYVRrR1dPQVhDeDgvOS9lbnArSHdnaThTNUhh?=
 =?utf-8?B?VGJ5WFZlcmNJMUQzQTdMck5zcCszRmlYSG5aRDdYNnJDVURYRFlWc3RWNy9p?=
 =?utf-8?B?UU0yQjhldDhWSHpBVzVXeEhzT3YvWUk0OHQyTituejdabGdIL3VBMHJpeXBI?=
 =?utf-8?B?UHlHOTY0TkRYZ2VDdDljakxUeWVUWGNic1d1cUpMU01BWWZpWVIzUVF0NEJ5?=
 =?utf-8?B?cndLeHR3b0s5WDM3YjBMN3p1WVFMdkk1TVBRY3lJdGpNam04SHk4VTNhNGlD?=
 =?utf-8?B?RTQvQ0JWYzBMUTFKTjB0c0c4VGZUQVhRaHhQM0FVVjNDa3d1bktvM0lnN1NL?=
 =?utf-8?B?NS8zRW84TXZvbzhmU2RGb2wyTUlEeng4c3ZRV2tiemNvY0FoZXVsMVZyR1JD?=
 =?utf-8?B?dXg5VTR3YlNsWk5EdTF2VjhSNjFiWk5meTdjbzR4OUhWeWhkZUlweUlGZ0Z6?=
 =?utf-8?B?WnN5VGRSWDlJTEYvNnhhY282VXBVTllLYndCNEVwZDJHK3VvL0FFRGZXTlB5?=
 =?utf-8?B?Q1NsMlRSZ2pnTDRla1RCYkZ4Q0lIMWMvMk5OOEdvUTdPSlNjNjVTM2l4Z0FX?=
 =?utf-8?B?UFQ4bVFDc0xqbnlOSVVoSys1NGMrdXY3SGczeFJtTVV3YUUrRjVTRUpUdnln?=
 =?utf-8?B?b25DS3FZUTdqcWpmbHZTTWRUMlZMc0hxUFBsYU5HbGZBRGFXV2JhbzJNTEVs?=
 =?utf-8?B?SHAwb1loT3JpNS9QWll0N0xxMHFPYjBQS0N5amdmdks0cWdnVSt6V2Znb3Nu?=
 =?utf-8?B?bDhvcXJINGtWYUZleTIrclMwWEp6ZzlORU5PTzFzNEhNSE5SdDdaMFdYZm1o?=
 =?utf-8?B?VFFKUW40VzY5M2VmbG1oMmhHOHhpV1N5N2NiUXcyRzZUd3VsazRiSVNHYjA0?=
 =?utf-8?B?eGlldGp2UFZKRVkxWVZtemhhK2JSL3pTTE5neVdzd2RnNjhZenU1S2pjS2Zt?=
 =?utf-8?B?Q2Y3VTZtWkFxaGlMYldSQTN3U0lrVG8zaStRTzNzZkx3NEloZExLZnZIUXpZ?=
 =?utf-8?B?RENXcU0vRVpEMmtaVlphNCtIQ1FZL1ZsZk1ueXExdHVsVkdTdVFsVTJjTmM0?=
 =?utf-8?Q?pN3MTtS7HQTmq4ilxZBaBTjfa?=
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1122020-f257-4ffc-6863-08daf28d3e20
X-MS-Exchange-CrossTenant-AuthSource: SN6PR04MB5151.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2023 22:02:47.4218
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 87ba1f9a-44cd-43a6-b008-6fdb45a5204e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: anQyFYMD3J7jfl84gXbS3kjqTNAPQTPcHJ7ryoGO9KtJtN83Wr8k2TMviyvfkp2ufhwWRcbh7jZhqaQQHRpCBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR0401MB3673
X-Proofpoint-ORIG-GUID: ggXcAfKPhWF9MeRFRYPshtqUpWUuEMVr
X-Proofpoint-GUID: ggXcAfKPhWF9MeRFRYPshtqUpWUuEMVr
Subject: Re: [oe-core][PATCH] opkg: ensure opkg uses private gpg.conf when applying
 keys.
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-09_14,2023-01-09_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_policy_notspam policy=outbound_policy score=30 spamscore=0
 clxscore=1011 lowpriorityscore=0 suspectscore=0 priorityscore=1501
 impostorscore=0 mlxscore=0 phishscore=0 mlxlogscore=999 adultscore=0
 malwarescore=0 bulkscore=0 classifier=spam adjust=30 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2301090153
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Jan 2023 22:03:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175701

ACK. We'll ingest this change naturally in the June opkg release, but it 
is reasonable to pull the .patch now.

On 1/9/23 15:22, Charlie Johnston wrote:
> Currently, the opkg-key utility calls gpg with --no-options,
> which uses /dev/null as the configuration file. This means
> any configurations in /etc/opkg/gpg/gpg.conf were being
> ignored. This change applies a patch to remove the
> --no-options flag.
>
> Signed-off-by: Charlie Johnston <charlie.johnston@ni.com>
> ---
>   ...emove-no-options-flag-from-gpg-calls.patch | 34 +++++++++++++++++++
>   meta/recipes-devtools/opkg/opkg_0.6.1.bb      |  1 +
>   2 files changed, 35 insertions(+)
>   create mode 100644 meta/recipes-devtools/opkg/opkg/0002-opkg-key-remove-no-options-flag-from-gpg-calls.patch
>
> diff --git a/meta/recipes-devtools/opkg/opkg/0002-opkg-key-remove-no-options-flag-from-gpg-calls.patch b/meta/recipes-devtools/opkg/opkg/0002-opkg-key-remove-no-options-flag-from-gpg-calls.patch
> new file mode 100644
> index 0000000000..f216950002
> --- /dev/null
> +++ b/meta/recipes-devtools/opkg/opkg/0002-opkg-key-remove-no-options-flag-from-gpg-calls.patch
> @@ -0,0 +1,34 @@
> +From a658e6402382250f0164c5b47b744740e04f3611 Mon Sep 17 00:00:00 2001
> +From: Charlie Johnston <charlie.johnston@ni.com>
> +Date: Fri, 30 Dec 2022 15:21:14 -0600
> +Subject: [PATCH] opkg-key: Remove --no-options flag from gpg calls.
> +
> +The opkg-key script was always passing the --no-options
> +flag to gpg, which uses /dev/null as the options file.
> +As a result, the opkg gpg.conf file was not getting
> +used. This change removes that flag so that gpg.conf
> +in the GPGHOMEDIR for opkg (currently /etc/opkg/gpg/)
> +will be used if present.
> +
> +Upstream-Status: Accepted [https://urldefense.com/v3/__https://git.yoctoproject.org/opkg/commit/?id=cee294e72d257417b5e55ef7a76a0fd15313e46b__;!!FbZ0ZwI3Qg!uX10EXcajL9EJS2NNmNl-z9VLeBT_HgjQJ4VJ50BN5lRXJeOM8sdVBZomrkIauJ3ufVPp8ogpBgNKQwCGuVlotE$ ]
> +Signed-off-by: Charlie Johnston <charlie.johnston@ni.com>
> +---
> + utils/opkg-key | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/utils/opkg-key b/utils/opkg-key
> +index e395a59..8645ebc 100755
> +--- a/utils/opkg-key
> ++++ b/utils/opkg-key
> +@@ -53,7 +53,7 @@ else
> +     exit 1
> + fi
> +
> +-GPG="$GPGCMD --no-options --homedir $GPGHOMEDIR"
> ++GPG="$GPGCMD --homedir $GPGHOMEDIR"
> +
> + # Gpg home dir isn't created automatically when --homedir option is used
> + if [ ! -e "$GPGHOMEDIR" ]; then
> +--
> +2.30.2
> +
> diff --git a/meta/recipes-devtools/opkg/opkg_0.6.1.bb b/meta/recipes-devtools/opkg/opkg_0.6.1.bb
> index 50c9451a57..712f066f0e 100644
> --- a/meta/recipes-devtools/opkg/opkg_0.6.1.bb
> +++ b/meta/recipes-devtools/opkg/opkg_0.6.1.bb
> @@ -15,6 +15,7 @@ PE = "1"
>   SRC_URI = "https://urldefense.com/v3/__http://downloads.yoctoproject.org/releases/$*7BBPN*7D/$*7BBPN*7D-$*7BPV*7D.tar.gz__;JSUlJSUl!!FbZ0ZwI3Qg!uX10EXcajL9EJS2NNmNl-z9VLeBT_HgjQJ4VJ50BN5lRXJeOM8sdVBZomrkIauJ3ufVPp8ogpBgNKQwCyEuKCuY$  \
>              file://opkg.conf \
>              file://0001-opkg_conf-create-opkg.lock-in-run-instead-of-var-run.patch \
> +           file://0002-opkg-key-remove-no-options-flag-from-gpg-calls.patch \
>              file://run-ptest \
>   "
>   
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#175700): https://urldefense.com/v3/__https://lists.openembedded.org/g/openembedded-core/message/175700__;!!FbZ0ZwI3Qg!uX10EXcajL9EJS2NNmNl-z9VLeBT_HgjQJ4VJ50BN5lRXJeOM8sdVBZomrkIauJ3ufVPp8ogpBgNKQwCJKW8IrE$
> Mute This Topic: https://urldefense.com/v3/__https://lists.openembedded.org/mt/96163153/3616788__;!!FbZ0ZwI3Qg!uX10EXcajL9EJS2NNmNl-z9VLeBT_HgjQJ4VJ50BN5lRXJeOM8sdVBZomrkIauJ3ufVPp8ogpBgNKQwCA2OYbZ8$
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://urldefense.com/v3/__https://lists.openembedded.org/g/openembedded-core/unsub__;!!FbZ0ZwI3Qg!uX10EXcajL9EJS2NNmNl-z9VLeBT_HgjQJ4VJ50BN5lRXJeOM8sdVBZomrkIauJ3ufVPp8ogpBgNKQwC1cnWJuM$  [alex.stewart@ni.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

-- 
Alex Stewart
Software Engineer - NI Real-Time OS
NI (National Instruments)

alex.stewart@ni.com


