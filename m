Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29185C433F5
	for <webhook@archiver.kernel.org>; Fri, 11 Mar 2022 17:24:33 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.8093.1647019472552466103
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Mar 2022 09:24:32 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com
 header.s=pps06212021 header.b=H9tOC1i6;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=0069af0ac3=randy.macleod@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 22BGxoBL021012
	for <openembedded-core@lists.openembedded.org>; Fri, 11 Mar 2022 17:24:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=content-type :
 message-id : date : subject : to : cc : references : from : in-reply-to :
 mime-version; s=PPS06212021;
 bh=rnqJLFt1qZ6E41ayMVkXxFW8IysXq0hj9Jl4Y8I8jas=;
 b=H9tOC1i6miOQ8GiCn+C1ztPhorUCZ9AmStFjM9hkLBC1TTdb/CEfdT/FgXn4d68OPWO1
 wWcg6r5BWzJgK35M841gsox6YngnNnw1HoySHuGv1/B+6pQYqP/LVv5ZHUA2SYho/vMv
 TRs8yGjSGVIuOJtqugm79QyEWGdm9mbfawHGqhDfJ89af3s/OJfKDMqkv2uVPoRHtc05
 6HdrEq0TCy7JOXrUMhOwTqvgO4mBlW00aHXaWS8uPw85fRcsl1sh4VTKlOmRulNlgx1n
 HdDQ/M9TfoqwJJjlgIGMNzN+A4qvzT914KKjuQXdRBRJhfTAsT2Fod6u5eHeoUAVHm2d ig==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ekw305fg3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Mar 2022 17:24:31 +0000
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 22BHOUG2011953
	for <openembedded-core@lists.openembedded.org>; Fri, 11 Mar 2022 17:24:31 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam08lp2048.outbound.protection.outlook.com [104.47.74.48])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ekw305fg1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Mar 2022 17:24:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jBPdXfkRtM/qnWUh9X0Qge8q9PACeQL9wbloI0+3PtRUX1Tbt4liSpZg9SXgs/e+M63QRbpHCHekLLU+bxrIe6MA2EMYwtQzQZsxYEH1+7E0mawSLhgkiJEf/n4FNaPH/3o5tZ6xEyRTLQRdI7hhhyzf0jI2C51362PqdFZk28CFIE1jecsj178/h5Tx7/REKinLQzvX6Uw5IGFDi7xn1LIRLSCVnh1kkD8mXy9RHYPqmIBlUG4LhIgzBErx5DG7ceoJdEedKd6kygh/dUEMK3tmCIiPSiwZkGW0hBA8eE2Fl92D4W9QzlTFG4AlnF0hgDRvB1HE9IoUNmAhKqqh9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rnqJLFt1qZ6E41ayMVkXxFW8IysXq0hj9Jl4Y8I8jas=;
 b=QWYMRr+j6cQg4whVQMAe/9JLNARDcl+YzAPzBTZoEj+5fXEfk67acjsSozbRo2gxzshnS/sMMyo8r7NDirLOxALjNRUVF/ku/WiBp6IGyOdWghd6tjPuiJZLs2EIMtNc7i+udxCpKcSk3pSiVwXMysi+Q2thpqPAOAPs9+BVzVTIs0vNTm2UUSwNsAg1XbWdbc/CYIqr2q6ilMlr0C+eWhGgaZMqRPt+yNlYNpbbCkBhI22viwMfZMFn6oc5tKa9elNJ8/iMqx4UdrpBllkE31pTsM6KXOdyE8zrxAzJe8a1WUsJKnQZ7c23mQ9nY/k79JsOMVDtruoDbCu2Jaci+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by DM6PR11MB4724.namprd11.prod.outlook.com (2603:10b6:5:2ad::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.22; Fri, 11 Mar
 2022 17:24:27 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::19c6:8fec:7ecd:a91]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::19c6:8fec:7ecd:a91%5]) with mapi id 15.20.5038.027; Fri, 11 Mar 2022
 17:24:27 +0000
Content-Type: multipart/alternative;
 boundary="------------HW9NWkX7PhMUNh190KddHHC2"
Message-ID: <5e59bd3a-b214-e05e-fe21-3ff11d5163fa@windriver.com>
Date: Fri, 11 Mar 2022 12:24:22 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [OE-core] [master][PATCH] PR sanitizer/101749 -
 sanitizer_common/sanitizer_posix_libcdep.cpp: Prevent generation of
 dependency on _cxa_guard for static initialization.
Content-Language: en-CA
To: Sundeep KOKKONDA <sundeep.kokkonda@gmail.com>,
        openembedded-core@lists.openembedded.org
Cc: anuj.mittal@intel.com, rwmacleod@gmail.com, umesh.kalappa0@gmail.com
References: <20220311090534.1133919-1-sundeep.kokkonda@gmail.com>
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <20220311090534.1133919-1-sundeep.kokkonda@gmail.com>
X-ClientProxiedBy: SJ0PR13CA0214.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::9) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6f78a828-b0dc-4876-bbe2-08da0383fed6
X-MS-TrafficTypeDiagnostic: DM6PR11MB4724:EE_
X-Microsoft-Antispam-PRVS: 
	<DM6PR11MB4724CB9A651212B7BDF04FB5F80C9@DM6PR11MB4724.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	/tgql8z+vz/QnR4UNVU3d+CUwsnjtMa7/V6azaUlQr4EEsWMD0K0T7Qq7+NT8D74CJSvpic2gyuCajWaQ3O/kEl6rfXgWA2pHaaq+zvnsNmBly3iabgh6VC52pI1CEnG7862P/NePu7S5gsgU3C8dhm3JcMqrBI9n743vXJaWBPpMIjtAx0zkG9zAlPzP1ArwX1nIv/wKV0p2IdZD46iOFPfeKvfWAjUXYEIOEQ4IaTfqEXxTQfQz6EO+Z9quIH9eWEqFumSm8AREhUNySBinVlDZv6Cemms4H1A/hIifo3FxEcOgcnHs9rOzuhAcIRbvQ0d+CCYV/OP5JNZNKLzjXN9VTodnTnFzYetwCNq4RThwT18KHw9JoP+o2BfszyQOOwyHItmQrZYpf+8Ytnspc+fRJP9k9pZULDm9Lxko8fx99KK8umXbHg3Ky76ixdPKwPdQxKgK0wpHHx54eFfSobq5S/YqxNVkJL9hBeGZ7HXDUoiMZDeypISnB0N2jFFcGx3/2++J16RM7utWJxaRzAqC7UkyGF3dqz2NZgFjFP6g1U4dbd35OVI1FISSZLMUgLOd5V9MbzC6NwFYY3Vfzl82xeKKEo38Bp+L2saV77rKodGjmEhdhzX55kgSpPJeCNJ1CG8kkHmGVOdr3w712czA3OE1+97GYpgS1WqkzpluIm15IFv+1SKv8SiaKoC7hY/MLCBxDuXN5GnST9MQdnjVCpTEqw2aPPPac4rknaMjtim/qGNzIRux9xxM3joYEXX+6+jRZfCS6nwfUjXOQeBlqRI2EaDz3LXzvn2eyF0GwL4bM9NpDxGCWXpbkcUtnyQZUYYlvm+CQ0xS5f833daQVwau0PtXjfJypPOk2icCcK3TDyJPbwFE//BmxNRU/il2QFNRWd4ZsLGyNzk9g==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(186003)(26005)(966005)(86362001)(31696002)(83380400001)(166002)(8676002)(4326008)(66556008)(66476007)(66946007)(2616005)(316002)(38350700002)(30864003)(38100700002)(33964004)(52116002)(53546011)(6512007)(2906002)(6506007)(6486002)(508600001)(36756003)(31686004)(5660300002)(8936002)(6666004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?b3lGT1pOcSt2WVpkQ3ZsSVpWZ3g4eWY2cGhGdTBFWVVlN3dKc3pCemxNMEVZ?=
 =?utf-8?B?RGUrUDdYSWdhMUl5T2hwZ295NzZ2OFRBcmpMaXJsYnBpbXB4L3p3MUdLT0ps?=
 =?utf-8?B?cEJ6RTloKzlMNGFYMWZhQ2lzbjN2YW8zNHZPNStlMjU2NG1adkt4MDg3cDlQ?=
 =?utf-8?B?QitaYW44Vy96ak5UdnJBUnRBcW1pS0tEVGl2Y0hiRFR3NEw5SHRoTHZZTnBG?=
 =?utf-8?B?MDI1VTlkRnNLVERvdEpXUmFOY0EzNzhKMzFRdWYvRGc3MGM3VjIvRWxCbmJ5?=
 =?utf-8?B?OXJaWnk3dVFET28yaFdzMjBXSUZGZU43S0V3VitmUy90YVJYTElWSUxZYkxO?=
 =?utf-8?B?dnd3akxlUUJZbTRGU3dkdlZaUjVHbGZWZEpMdXR4aXBwSkVRaHl3OE9qU0g5?=
 =?utf-8?B?Wi95M043N0RwVVpmaE51Y3hkY0NscWhoZjJpc1Z6dncvelViRGs2Q2pzUXZQ?=
 =?utf-8?B?cEpLRjYvay8vQ1JlNm93TzE5aXZFQzJmbjhjNGFNVWZDMVlNT0lwVmJ1blB1?=
 =?utf-8?B?aktCUTFROGQxRUZIT294WGQwWmRmUzV2YVZRMFFOWGV5MnEyOFZWMEhpZHZZ?=
 =?utf-8?B?RlFTS3pUREpvYlNMNVFIdkhjNFp2WUlVQTZZdWpraGJHNDg3TE45TUhjUEN0?=
 =?utf-8?B?dy9VOVJ1Q3pnRG5GbVZhaTVqdGx5ZC9GUWV3YUpBK0M3czVaajgxK05rMnhR?=
 =?utf-8?B?SzNtQXlpQTVialFRNGZCOERNTGsraFdCRkVSUjhZeDA5R3pVc3IrOEZSWHky?=
 =?utf-8?B?QmpramVBNjkyVFp1WDBwMXBOaEJVM2gyQUcyV1Q3OFhuV0FVaWNHSHE4am5m?=
 =?utf-8?B?cmFTWG5qcTZ2V0NjeWtqdUhrOTlpUGRxR2VjUU5BaEN5VnY3MHo5bXlQZWo5?=
 =?utf-8?B?dnp1dWJkNFRCWlFTZGZTNHlzU0JlU3R2R0F4cEt3S2lhQkpxRHNNZEhwMVdJ?=
 =?utf-8?B?c0RpUHJOMm1KOW5reU8rbTJGVTJMbU05cjM5Q1g2YlhJam1PZURCR084VHJH?=
 =?utf-8?B?c2ZLSjRQTks5eUNXVmNQVExIK09FNjJOQ0crbHpRU1p5SHNmVk02UU1WY2V3?=
 =?utf-8?B?dHBudkpDa3Blbi9iN2RrYTB2WmtSUzJsQlp0ODlySFI5YjVlcDljVXpSZzhW?=
 =?utf-8?B?ZVpsNy9TNHdqdG1sbGJMRmNJYVR0MUFFcWlnYTViQkxBMGh1dW5DbFFrVXJR?=
 =?utf-8?B?eWNCMlVycDJ0MFlDSlBwSDIxbjI4cWtsdCtmMnJ4ZVFUSDdGaXZPOUo2dE9D?=
 =?utf-8?B?WWxQUGlOWC9Md1BtZEtsaWlwU1dubmk3TGg4NFFKSk1XZXVUUm1NQk5iSk1l?=
 =?utf-8?B?RXRsencyWTQwUEhUNmVneVZSVFBObGlUWmNPbVBjREFzc1hacGpnM2pDSisv?=
 =?utf-8?B?UUNzdGVTR0cveWczQjNmMG9IR2lRbi9NSThzalZXNW90T2pqU0ROZTRZUElm?=
 =?utf-8?B?bis2Y2RLZlVXajViTmhHRDRlK3R1ZjFKL1ZmZ2xMUnJFekhWQUVrWE5NNm5o?=
 =?utf-8?B?Zy8ySVFYK0I4eXJRcTR1dnN1RkN2RXdnYi85UDRtcGV5Q2kwbmN5SkV6TG5Y?=
 =?utf-8?B?QUdWWDlDQnU1RURQTVRWTzJsalZYblphQ25iVFFWVjUxN3JLek9uelZFQ2hy?=
 =?utf-8?B?WW5XY2VGZzBaZXBXSTVILzFTaWRTd2VKZklVYk1xbHp3SkNNR0FkTHgrY0FB?=
 =?utf-8?B?NWhvcVZQOGE0d2EraHV5Q0p5WVNpcGMxSUZmOVdMbHo0L0RQRnpiV3h5cXNY?=
 =?utf-8?B?VCsvanYrY0xHU1h6OG1ta2ZuT3oxT1ZyakY1Z2xVaFhwOVpXblpBZDZ3bUw1?=
 =?utf-8?B?bi9jeFA1bzNKSVFDcmJidTRLdXQxdnVKQ2JxQTBjeExxSVgrcTJBUmN5WTRJ?=
 =?utf-8?B?TEFvVHVYeWxlQmgvQys1L01PZVdsZk51WEUzdjZmQlk0WW5oMUpuWVVSNTBI?=
 =?utf-8?B?N05kUEVQL2o2RFdLNW10VnJsVThLc1RFWnlxc0x3MElETm4zdkdtdHJVckE1?=
 =?utf-8?B?T2p1RmdVQ0FnPT0=?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 6f78a828-b0dc-4876-bbe2-08da0383fed6
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2022 17:24:27.8681
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 DzEvVcnVPK0JsPfGk01mQqnNOpJ1r35h8TWzOrLT1JprKdtRj2VUrDtHu5soo8WowvEvZrcKcGUMqxDaYfCUQQTfNrYj2lFNXTBryekhu7M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4724
X-Proofpoint-ORIG-GUID: -SQoiayJiJI6LuBaGMKCwu9m09-qbwrH
X-Proofpoint-GUID: BtB5t8rLdIxpSwE7hH1w7Ev6KuzRWbE0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-11_06,2022-03-11_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0
 impostorscore=0 mlxlogscore=999 malwarescore=0 suspectscore=0 phishscore=0
 mlxscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1011 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2203110086
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Mar 2022 17:24:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163071

--------------HW9NWkX7PhMUNh190KddHHC2
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by
 mx0a-0064b401.pphosted.com id 22BGxoBL021012

Hi Sundeep,

I'd like to see a v2 with some log changes.

First, Anuj maintains 3.3/3.4 so no need to CC him.


I'll make some specific comment below but please also read:
https://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded
 =C2=A0=C2=A0 and links in the "See Also" section.

Your subject (142 chars!)
-------
Re: [OE-core] [master][PATCH]

--->
PR sanitizer/101749 - sanitizer_common/sanitizer_posix_libcdep.cpp:=20
Prevent generation of dependency on _cxa_guard for static initialization.
<---
-------
is too long. Look at 'git log --oneline and you'll see that we try to=20
keep the commit length
to under 60 chars and most of the exceptions come from when the project=20
used SVN rather than git.

$ cd ../oe-core.git
$ git log --oneline=C2=A0 | cut -c 12- | awk '{print length($0)}' | sort =
-n |=20
uniq -c



Also, we have a convention that the subject prefix is the package name
so the shortlog should be something like:

 =C2=A0=C2=A0=C2=A0 "gcc: sanitizer: Fix asan against glibc 2.34"
taken from the shortlog for the master commit:

$ git log -1 d9f462fb372fb02da032cefd6b091d7582c425ae



The long log should explain what problem you are trying to fix
in your own words, not just as a link to a YP Bugzilla item.

As explained in:
https://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines
---

Short log / Statement of what needed to be changed.

(Optional pointers to external resources, such as defect tracking)
  =20
The intent of your change.
  =20
(Optional, if it's not clear from above) how your change resolves the iss=
ues in the first part.
  =20
Tag line(s) at the end.

---

Also, when it makes sense, it's good to include some parts of the error=20
message that you
are fixing so that someone can search for that string.

Finally, since this is a cherry-pick from the release/gcc-11 branch
you should mention that in the long log as well as what you have done
in the patch itself so that when someone updates from gcc-11.2 to 11.3
they'll have two tips showing that this patch can be dropped.

On 2022-03-11 04:05, Sundeep KOKKONDA wrote:
> Signed-off-by: Sundeep KOKKONDA<sundeep.kokkonda@gmail.com>
> ---
>   meta/recipes-devtools/gcc/gcc-11.2.inc         |  1 +
>   .../gcc/0042-Fix-thread-stack-size-init.patch  | 18 +++++++++++++++++=
+
>   2 files changed, 19 insertions(+)
>   create mode 100644 meta/recipes-devtools/gcc/gcc/0042-Fix-thread-stac=
k-size-init.patch
>
> diff --git a/meta/recipes-devtools/gcc/gcc-11.2.inc b/meta/recipes-devt=
ools/gcc/gcc-11.2.inc
> index 2394c86e29..0c6c54888c 100644
> --- a/meta/recipes-devtools/gcc/gcc-11.2.inc
> +++ b/meta/recipes-devtools/gcc/gcc-11.2.inc
> @@ -68,6 +68,7 @@ SRC_URI =3D "\
>              file://0003-CVE-2021-42574.patch  \
>              file://0004-CVE-2021-42574.patch  \
>              file://0001-CVE-2021-46195.patch  \
> +	file://0042-Fix-thread-stack-size-init.patch  \
>   "
>   SRC_URI[sha256sum] =3D "d08edc536b54c372a1010ff6619dd274c0f1603aa4921=
2ba20f7aa2cda36fa8b"
>  =20
> diff --git a/meta/recipes-devtools/gcc/gcc/0042-Fix-thread-stack-size-i=
nit.patch b/meta/recipes-devtools/gcc/gcc/0042-Fix-thread-stack-size-init=
.patch
> new file mode 100644
> index 0000000000..ab463f252a
> --- /dev/null
> +++ b/meta/recipes-devtools/gcc/gcc/0042-Fix-thread-stack-size-init.pat=
ch
> @@ -0,0 +1,18 @@
> +Upstream-Status: Backport [https://gcc.gnu.org/git/?p=3Dgcc.git;a=3Dco=
mmit;h=3D90e46074e6b3561ae7d8ebd205127f286cc0c6b6]


This commit changes lots of files:

$ cd .../gcc.git && git checkout release/gcc-11 && git pull
$ git show 90e46074e6b3561ae7d8ebd205127f286cc0c6b6 | diffstat | wc -l
134

looking at:
$ git blame libsanitizer/sanitizer_common/sanitizer_posix_libcdep.cpp | l=
ess

it seems you should reference this commit:

$ git show 91f8a7a34cf2
commit 91f8a7a34cf29ae7c465603a801326767f1cc7e9
Author: Martin Liska <mliska@suse.cz>
Date:=C2=A0=C2=A0 Thu Aug 5 04:43:17 2021

 =C2=A0=C2=A0=C2=A0 sanitizer: cherry pick 414482751452e54710f16bae58458c=
66298aaf69

 =C2=A0=C2=A0=C2=A0 The patch is needed in order to support recent glibc =
(2.34).
 =C2=A0=C2=A0 ...


> +---
> +--- a/libsanitizer/sanitizer_common/sanitizer_posix_libcdep.cpp	2022-0=
3-08 03:04:25.871012986 -0800
> ++++ b/libsanitizer/sanitizer_common/sanitizer_posix_libcdep.cpp	2022-0=
3-10 23:28:20.131064433 -0800
> +@@ -166,9 +166,10 @@
> + #if !SANITIZER_GO
> + // TODO(glider): different tools may require different altstack size.
> + static uptr GetAltStackSize() {
> +-  // SIGSTKSZ is not enough.
> +-  static const uptr kAltStackSize =3D SIGSTKSZ * 4;
> +-  return kAltStackSize;
> ++  // Note: since GLIBC_2.31, SIGSTKSZ may be a function call, so this=
 may be
> ++  // more costly that you think. However GetAltStackSize is only call=
 2-3 times
> ++  // per thread so don't cache the evaluation.
> ++  return SIGSTKSZ * 4;
> + }
> +
> + void SetAlternateSignalStack() {


And given that this started with glibc-2.31,
you should backport to honister, hardknott and dunfell.

https://wiki.yoctoproject.org/wiki/Releases

once this is in master.


Lots of clean-up for a modest patch but once you get into the groove
of how we do things, there should be fewer, if any, comments.

Thanks!


../Randy


>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#163047):https://lists.openembedded.org/g/openembedd=
ed-core/message/163047
> Mute This Topic:https://lists.openembedded.org/mt/89706923/3616765
> Group Owner:openembedded-core+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub  [=
randy.macleod@windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

--=20
# Randy MacLeod
# Wind River Linux

--------------HW9NWkX7PhMUNh190KddHHC2
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">Hi Sundeep,</div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix">I'd like to see a v2 with some log
      changes.</div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix">First, Anuj maintains 3.3/3.4 so no
      need to CC him.</div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix">I'll make some specific comment below
      but please also read:<br>
      &nbsp;&nbsp;
      <a class="moz-txt-link-freetext" href="https://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded">https://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded</a></div>
    <div class="moz-cite-prefix">&nbsp;&nbsp; and links in the &quot;See Also&quot; section.<br>
    </div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix">Your subject (142 chars!)</div>
    <div class="moz-cite-prefix">-------<br>
    </div>
    <div class="moz-cite-prefix">Re: [OE-core] [master][PATCH] <br>
    </div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix">---&gt;<br>
    </div>
    <div class="moz-cite-prefix">PR sanitizer/101749 -
      sanitizer_common/sanitizer_posix_libcdep.cpp: Prevent generation
      of dependency on _cxa_guard for static initialization.</div>
    <div class="moz-cite-prefix">&lt;---</div>
    <div class="moz-cite-prefix">-------<br>
    </div>
    <div class="moz-cite-prefix">is too long. Look at 'git log --oneline
      and you'll see that we try to keep the commit length</div>
    <div class="moz-cite-prefix">to under 60 chars and most of the
      exceptions come from when the project used SVN rather than git.</div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix">$ cd ../oe-core.git<br>
    </div>
    <div class="moz-cite-prefix">$ git log --oneline&nbsp; | cut -c 12- | awk
      '{print length($0)}' | sort -n | uniq -c&nbsp; <br>
    </div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix">Also, we have a convention that the
      subject prefix is the package name</div>
    <div class="moz-cite-prefix">so the shortlog should be something
      like:<br>
    </div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix">&nbsp;&nbsp;&nbsp; &quot;gcc: sanitizer: Fix asan against
      glibc 2.34&quot;</div>
    <div class="moz-cite-prefix">taken from the shortlog for the master
      commit:</div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix">$ git log -1
      d9f462fb372fb02da032cefd6b091d7582c425ae<br>
    </div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix">The long log should explain what
      problem you are trying to fix<br>
      in your own words, not just as a link to a YP Bugzilla item.</div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix">As explained in:<br>
    </div>
    <div class="moz-cite-prefix"><a class="moz-txt-link-freetext" href="https://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines">https://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines</a></div>
    <div class="moz-cite-prefix">---<br>
    </div>
    <div class="moz-cite-prefix">
      <pre>Short log / Statement of what needed to be changed.

(Optional pointers to external resources, such as defect tracking)
  
The intent of your change.
  
(Optional, if it's not clear from above) how your change resolves the issues in the first part.
  
Tag line(s) at the end.</pre>
    </div>
    <div class="moz-cite-prefix">---<br>
    </div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix">Also, when it makes sense, it's good to
      include some parts of the error message that you<br>
      are fixing so that someone can search for that string.</div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix">Finally, since this is a cherry-pick
      from the release/gcc-11 branch</div>
    <div class="moz-cite-prefix">you should mention that in the long log
      as well as what you have done<br>
      in the patch itself so that when someone updates from gcc-11.2 to
      11.3<br>
      they'll have two tips showing that this patch can be dropped.<br>
    </div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix">On 2022-03-11 04:05, Sundeep KOKKONDA
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20220311090534.1133919-1-sundeep.kokkonda@gmail.com">
      <pre class="moz-quote-pre" wrap="">Signed-off-by: Sundeep KOKKONDA <a class="moz-txt-link-rfc2396E" href="mailto:sundeep.kokkonda@gmail.com">&lt;sundeep.kokkonda@gmail.com&gt;</a>
---
 meta/recipes-devtools/gcc/gcc-11.2.inc         |  1 +
 .../gcc/0042-Fix-thread-stack-size-init.patch  | 18 ++++++++++++++++++
 2 files changed, 19 insertions(+)
 create mode 100644 meta/recipes-devtools/gcc/gcc/0042-Fix-thread-stack-size-init.patch

diff --git a/meta/recipes-devtools/gcc/gcc-11.2.inc b/meta/recipes-devtools/gcc/gcc-11.2.inc
index 2394c86e29..0c6c54888c 100644
--- a/meta/recipes-devtools/gcc/gcc-11.2.inc
+++ b/meta/recipes-devtools/gcc/gcc-11.2.inc
@@ -68,6 +68,7 @@ SRC_URI = &quot;\
            <a class="moz-txt-link-freetext" href="file://0003-CVE-2021-42574.patch">file://0003-CVE-2021-42574.patch</a> \
            <a class="moz-txt-link-freetext" href="file://0004-CVE-2021-42574.patch">file://0004-CVE-2021-42574.patch</a> \
            <a class="moz-txt-link-freetext" href="file://0001-CVE-2021-46195.patch">file://0001-CVE-2021-46195.patch</a> \
+	   <a class="moz-txt-link-freetext" href="file://0042-Fix-thread-stack-size-init.patch">file://0042-Fix-thread-stack-size-init.patch</a> \
 &quot;
 SRC_URI[sha256sum] = &quot;d08edc536b54c372a1010ff6619dd274c0f1603aa49212ba20f7aa2cda36fa8b&quot;
 
diff --git a/meta/recipes-devtools/gcc/gcc/0042-Fix-thread-stack-size-init.patch b/meta/recipes-devtools/gcc/gcc/0042-Fix-thread-stack-size-init.patch
new file mode 100644
index 0000000000..ab463f252a
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc/0042-Fix-thread-stack-size-init.patch
@@ -0,0 +1,18 @@
+Upstream-Status: Backport [<a class="moz-txt-link-freetext" href="https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=90e46074e6b3561ae7d8ebd205127f286cc0c6b6">https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=90e46074e6b3561ae7d8ebd205127f286cc0c6b6</a>]</pre>
    </blockquote>
    <p><br>
    </p>
    <p>This commit changes lots of files:<br>
    </p>
    <p>$ cd .../gcc.git &amp;&amp; git checkout release/gcc-11
      &amp;&amp; git pull<br>
      $ git show 90e46074e6b3561ae7d8ebd205127f286cc0c6b6 | diffstat |
      wc -l <br>
      134 <br>
    </p>
    <p>looking at:<br>
      $ git blame
      libsanitizer/sanitizer_common/sanitizer_posix_libcdep.cpp | less<br>
    </p>
    <p>it seems you should reference this commit:</p>
    <p>$ git show 91f8a7a34cf2 <br>
      commit 91f8a7a34cf29ae7c465603a801326767f1cc7e9 <br>
      Author: Martin Liska <a class="moz-txt-link-rfc2396E" href="mailto:mliska@suse.cz">&lt;mliska@suse.cz&gt;</a> <br>
      Date:&nbsp;&nbsp; Thu Aug 5 04:43:17 2021 <br>
      &nbsp;<br>
      &nbsp;&nbsp;&nbsp; sanitizer: cherry pick
      414482751452e54710f16bae58458c66298aaf69 <br>
      &nbsp;&nbsp;&nbsp; &nbsp;<br>
      &nbsp;&nbsp;&nbsp; The patch is needed in order to support recent glibc (2.34). <br>
      &nbsp;&nbsp; ...</p>
    <p><br>
    </p>
    <blockquote type="cite" cite="mid:20220311090534.1133919-1-sundeep.kokkonda@gmail.com">
      <pre class="moz-quote-pre" wrap="">
+---
+--- a/libsanitizer/sanitizer_common/sanitizer_posix_libcdep.cpp	2022-03-08 03:04:25.871012986 -0800
++++ b/libsanitizer/sanitizer_common/sanitizer_posix_libcdep.cpp	2022-03-10 23:28:20.131064433 -0800
+@@ -166,9 +166,10 @@
+ #if !SANITIZER_GO
+ // TODO(glider): different tools may require different altstack size.
+ static uptr GetAltStackSize() {
+-  // SIGSTKSZ is not enough.
+-  static const uptr kAltStackSize = SIGSTKSZ * 4;
+-  return kAltStackSize;
++  // Note: since GLIBC_2.31, SIGSTKSZ may be a function call, so this may be
++  // more costly that you think. However GetAltStackSize is only call 2-3 times
++  // per thread so don't cache the evaluation.
++  return SIGSTKSZ * 4;
+ }
+ 
+ void SetAlternateSignalStack() {</pre>
    </blockquote>
    <p><br>
    </p>
    <p>And given that this started with glibc-2.31,<br>
      you should backport to honister, hardknott and dunfell.<br>
    </p>
    <p><a class="moz-txt-link-freetext" href="https://wiki.yoctoproject.org/wiki/Releases">https://wiki.yoctoproject.org/wiki/Releases</a></p>
    <p>once this is in master.</p>
    <p><br>
    </p>
    <p>Lots of clean-up for a modest patch but once you get into the
      groove<br>
      of how we do things, there should be fewer, if any, comments.</p>
    <p>Thanks!</p>
    <p><br>
    </p>
    <p>../Randy<br>
    </p>
    <p><br>
    </p>
    <blockquote type="cite" cite="mid:20220311090534.1133919-1-sundeep.kokkonda@gmail.com">
      <pre class="moz-quote-pre" wrap="">
</pre>
      <br>
      <fieldset class="moz-mime-attachment-header"></fieldset>
      <pre class="moz-quote-pre" wrap="">-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#163047): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/message/163047">https://lists.openembedded.org/g/openembedded-core/message/163047</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/89706923/3616765">https://lists.openembedded.org/mt/89706923/3616765</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a class="moz-txt-link-abbreviated" href="mailto:randy.macleod@windriver.com">randy.macleod@windriver.com</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</pre>
    </blockquote>
    <p><br>
    </p>
    <pre class="moz-signature" cols="72">-- 
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------HW9NWkX7PhMUNh190KddHHC2--

