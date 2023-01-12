Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4ED35C54EBE
	for <webhook@archiver.kernel.org>; Thu, 12 Jan 2023 23:07:31 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.72001.1673564845569211284
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Jan 2023 15:07:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=D7/flo85;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=037638941c=randy.macleod@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30CN7O66027984
	for <openembedded-core@lists.openembedded.org>; Thu, 12 Jan 2023 23:07:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=message-id : date
 : subject : to : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=nfRpsVn2mw4I3mPV70y9/c4zReNt+40YXsxh9fK2DvY=;
 b=D7/flo85B/PD/02poVrcf9t2IzwFxZnpgLaKqeTmnNkAcFsfrra5UHmidJYziwPpIASI
 I+QJsEypN2TeJy6NXPMQjENBtksgwA2Xdbe7u7O0E72xDHZRfxRWqSVvGVe474m1sVye
 /qxgWVGiMT/YULcc7lUXJLhbnbxlmpJw2rjSkeu5BAy3ilTB8y4JVATwhriUdUPau/b1
 PS+rExNW3NjAXmwzOI2HYdgQYy0J6kdt8T9jaPwByxK6/7Vcnd4gAOuS2K5M93FfJg/r
 6oiQBUqZgsOrBsPgiVm/fTHZU7n4Ua+pf5V53Lvvh4toB5eiXOtZNPyfHjRP924euowt Lg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3n1k61hx5w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 12 Jan 2023 23:07:24 +0000
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 30CN7OuM027979
	for <openembedded-core@lists.openembedded.org>; Thu, 12 Jan 2023 23:07:24 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2169.outbound.protection.outlook.com [104.47.58.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3n1k61hx5v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Jan 2023 23:07:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Tdt9hM4FHWBLq1+6mDD69HyD+d6Sf4K5hyTrgR0egHk1n2dImfzqGn0RupdcKY7jjEE85uDb+JmV+RpmBibzvXd2+RuX/KQUn1o/HnMU+GZjhguJi3p4Rbrz8epuEcKCVNHqp6FZDBHB0NkFt4xxlc0HMfFsdwp1H/kH6vfMoQlau9NhDCCT8bJm1/ZCnnnHhFFQWxCNvwmHfZ6FyOMQR7d3ssN1SJZl6zq7uCQcq0MfBiTZPAs+pRVYNUHaw2XxLzLG+6Ic6e+56jPjBgBoh3yg8F3ncvigexurUrFlziSKFQ6dPXaaJvkW0YCqK9K9HFgYUhQx6Z2qAXPVPB4Wgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nfRpsVn2mw4I3mPV70y9/c4zReNt+40YXsxh9fK2DvY=;
 b=DFMpWC6j7u2xoVf1x1qlJJfRSU6BPCAmPqHOFWkm7uvtHpDogSViLcj/9Zg4Q9afbvrjlqzZ5yDSu2zbpK7SmjMiPz8VyS+SbY7OfTdG5jDouyXxLuCX5JJijfQxgwWZjVLtl87MiAyYAPnPMX5aM7+9N4R05Q/OSkdaa15NjqTsjJ4Mzeg5VIV/+rJPPQBCyqpz3slZOMwvuKxRURd+5za3Y1U504WWkyvzxIimiUUogbvsdT+54IsCk8FGTmtXRnqJk84ED88RLK8ZyH9Pf5vpoTXAv5+zPHZNY/SDmUxi50S249BJJx7SJ97BClZdFE3WWCLru0jDiokdo5+/4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by CH0PR11MB5314.namprd11.prod.outlook.com (2603:10b6:610:bd::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Thu, 12 Jan
 2023 23:07:22 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::e794:335f:5e0f:8d36]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::e794:335f:5e0f:8d36%6]) with mapi id 15.20.5986.018; Thu, 12 Jan 2023
 23:07:22 +0000
Message-ID: <acdd4b9f-4782-4a19-fd95-9d20788b6efd@windriver.com>
Date: Thu, 12 Jan 2023 18:07:18 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [OE-Core][PATCH] rust: Upgrade 1.66.0 -> 1.66.1
Content-Language: en-CA
To: alex.kiernan@gmail.com, openembedded-core@lists.openembedded.org,
        "Kokkonda, Sundeep" <Sundeep.Kokkonda@windriver.com>,
        "Gowda, Naveen" <naveen.gowda@windriver.com>
References: <20230112064045.7409-1-alex.kiernan@gmail.com>
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <20230112064045.7409-1-alex.kiernan@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR07CA0003.namprd07.prod.outlook.com
 (2603:10b6:a02:bc::16) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB3994:EE_|CH0PR11MB5314:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f9914e9-481f-4926-3e73-08daf4f1c2c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	q7K7tt6u6oznEW8AfjdnCdr2e6uchQWHdRcRr17tZSUtlRzlLvSEqThOXch4Xvgmif+IrnvcoUVSgsAZwQ2gfsfXh3mk7R/QYkozRMIs3S6cDjILWNX5jc+pDvwYlgUE20aAbIQAut4ln1rTAEyepII7pdNS2NKUQbX2M415RS/b9P1BiCUfpLzLabpu3+hwz7UwVZnlv1V3O/e1JMcHCXnN1W3h1aowMJJ4z6QkF0Hd9RjsYm3KLekFaVaTGSimWYosxwXcf4Sa5LEGmgBKyWCtdvqXFoKNm61JXrNccj/S8zJdPHTDqKRWnY21XRXc0GuLwCR0FXyjgqsDF5sL5paAqFkaPorChlOzdURgE1dpGejbTJrUvtOOscVkbENRBrigkGargkQO4oYT2xTsqFB65AmLOHrEb6X5rGI3G1b4Ewjg1W5ZuWm8Z9C4aWFNqwFPJon6shoggXa/TqQmYeA4x0cIwl1xDh+N8FWUsTjSM27rrFeEuF+Yyg0n9kdQb+nA1xSJhlOQ/VtQXBUP720BLYw+HB74hQ4c72tRP5jJAVH7BEFYuYk3IjnGN7JXOXTDtODWwxPjk+BU4q5HFfvQ95r88hD5gdZzF8vsj6lhSKdIhSAdLKO6YADu8sbQkXsIL026BQzPjt6kJL+f5nvS1aYbzgfGhHeU7752KD024ekabch2KY+/rUL9SQFKw56fTPlJNo1vMFdck0QQCCXXSnJMb4KKiVzd4p7vEXaYhfuFmtTMqhXC69pftmDXEks0NSAhQzsMnK/FXesqXOsChZKtK4hT6gHR3rtP02k=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(39850400004)(136003)(366004)(376002)(346002)(451199015)(6636002)(26005)(4744005)(6666004)(36756003)(8936002)(186003)(53546011)(6512007)(2616005)(31686004)(6486002)(6506007)(478600001)(66946007)(66556008)(5660300002)(66476007)(316002)(966005)(31696002)(41300700001)(38100700002)(110136005)(86362001)(8676002)(83380400001)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?NXYybHNrZHJTZTdEc1NIYnA5Nzd2Mms1dGwwODNQWkYrM3J6cFZaYXlMZ0xh?=
 =?utf-8?B?WFQ5eEgxc21NVi9jb0cvVXk2WHVpKzVpcXpKblZOY0xoamFFcjFHZ0hXMGlu?=
 =?utf-8?B?SmpJNzB3K2gxM01ZV1A5WlJOcmt5MEc1bTVrWU1ubVZoMU1iU2taV1F2aTg1?=
 =?utf-8?B?UUkybStPeTgwdzdqVnRHTDZCT1FGUWpyM3ZBeWFUN1B1b3lDQkJOVTF6UklT?=
 =?utf-8?B?OUVrOWNhdjZocXREZnlLSk5DWFdPbkttaEZLb3RqamlFRFNjOVh5Q0VWZGh5?=
 =?utf-8?B?SDRMbUVJcVF4b0ZHMHRjK2FkWUNoTGltbG94Y1g2UW81alp0WURKWk04SCtr?=
 =?utf-8?B?dlU2TmNTUUhZeEFyOW00OFNmN0ZBaG9UcHhqM29XVWY2MnVSYXE3UEFsN1hU?=
 =?utf-8?B?eXlTWUtEZFNqdjFrOEtvN25ITDdmNGZiUUhDU2I3UTNmWWt4VVZyMFczNmxL?=
 =?utf-8?B?emFkWnYxQ3VCaUoxZkc2RURSMDlUOEN6SzZ3YzlGckJydXlJN3NDbUxiL2xE?=
 =?utf-8?B?SjZTalZMK3VtYTIwNXp2Z3o2aXdoMHFQU1BlY2d2dzZZWDUzOG5RbzFOZEJt?=
 =?utf-8?B?TUZBSnB2UTQ0ZXVmUldwOXAyVTFsemFrVjFDVUJ5RWlVRmZLRWpaRFYvdGwv?=
 =?utf-8?B?cjdRSXVhdytLS3Ntd3RZYURHeExySFRjRHNQSlY2aFRoMDFxajlHbVUySVVK?=
 =?utf-8?B?ZDJ6VGQvR2tiQ2hVS2xFbkJYeG55TzdKU0xpSG9DZDgxVXNrZUU1OUl2cTlB?=
 =?utf-8?B?SXBtL1ZNdnVDY3d5dGcrR0tOSk9Kc3pKQ1hEL0UzSXN1WldxaFYyN0FZRk1i?=
 =?utf-8?B?dUdKNEJWbkV6WWRKbi9DNzFZSXpXVEZ6c1orWWMxU0NkM1E4RWg3c2ZONmFO?=
 =?utf-8?B?cXh3VkVnZlBYVk5pQ1Y5RE5vY1FTOER3c2dkRDRIaVhqaXNrNy92T0hoaFov?=
 =?utf-8?B?eG9kcGJlSzI3QjhRSmJlOUxGYTZCSnMyQ0V1ZkhHR3dWbjhoeExiTjgybGVh?=
 =?utf-8?B?LytldlA4cGNLbGJraXlTbDYwRUs4aDY2Q3daTGppRXhJa3liSTh3OGZvbFBP?=
 =?utf-8?B?ZitqN1F6b2hTVUxnRnhNUisrekZLcjNJT211aThEMDlMdEdUYUh0T0VqNkE1?=
 =?utf-8?B?WjF3ekxoZkU3bnlQZWljQWhtc0xjZmN5TjRpTytBcHZQWG9hYk1qUEZoR0ZR?=
 =?utf-8?B?MVJSV0RJZzZxbWJqQisrU25VUkRTMUlYQndHSWRrb2VyRE5tRGlmbWN5ZUdT?=
 =?utf-8?B?SWdGT1dWWWNXZWF5aEkvQmR0MG1LNlJPN3QyREJQV2VjeFlwL1JZbjFoZVpa?=
 =?utf-8?B?d0VYL1g0SkJmOUxQOEpaR3VITnovb0hiUE1rbmhVUXJLRncxY0JOdjFIS0lq?=
 =?utf-8?B?MDlrOGNsNG5MT3haMkM1SzE1WllvMHFQOXl4UGs1S2FtZ3BsZWF3RVpYWDNx?=
 =?utf-8?B?cU1QdEdSbVJpRlZRS3VDaDU2U1Q5cVF1amRXQXVXOStCc0ZmK213VDVjaTRQ?=
 =?utf-8?B?QTFmNHhReHB0ZzNnWDNGQk1PN2w3OTRJaXBZbk9CcDAvbUpoR2lCcHdsK3B3?=
 =?utf-8?B?R2RmS3hjZEtSd0dDU3YybVcvZnR5Mm44WlZud3FYOVJhOTVkaC8wV1BWUStW?=
 =?utf-8?B?VW5CbmNzclVWVnZVN0p3NkVQb2l1WUV2eWlKZEZ6Q3hOWUUxcG5GSGdRRmZm?=
 =?utf-8?B?QnRjQytURzNNSVJjSEMzSFdqQmUzNkNFK090a0xrMThXNlFSYmR5R1lEc1Jk?=
 =?utf-8?B?N1VvZmRucW03U1pqQ21rZ2VoODFkRy9TRmxxZTRoa1ZHSWhrU3p3TFo3Y0hp?=
 =?utf-8?B?UjAxTGVVaDYvZllVY3N2eUN4SjZSa3F5QW9DTHExaEVsWFVtaC9DQWhWeGJS?=
 =?utf-8?B?c3VIQmowVEtsNmhkcDJpTVpQTVkrZFRvTXV5OElabTRhMTNyV0o2U3RNZkx5?=
 =?utf-8?B?SG9UeW1RRy8yWnppN1hzRmRnS1VFOWhJd3gvMGNjUnVJck5MckJ1OTVmaFR5?=
 =?utf-8?B?VStTVGRqaS9RV0xwMDdheFZuendHYkZ1cmR0c25JVEowN1VrbjRhZDEyWTJY?=
 =?utf-8?B?UkdVU3oweFArbUd4TzFvQzAvcHZlOVlSOHVNczhqYktML3BaOTZXbU5DdHAz?=
 =?utf-8?B?b2dnc0RSYTF1N3hHTlRzK05NMld6elhtQlBzNm95THhSM3RlTHZRKys3YkI3?=
 =?utf-8?B?Z0E9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f9914e9-481f-4926-3e73-08daf4f1c2c3
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2023 23:07:22.0561
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mJux8Fzsl2OVBD+2jntmlZDAWT9aXl2jxt8J3gmbQvXnUp6t7FUxjUxjIP4RUeuMfagbPir4y+7H9U/pl5yxHeUAqpb2XgPOL9oC0MH9sHI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5314
X-Proofpoint-GUID: vZB6EtYVUWnzGdl0IIma6o_hrqMZJ_1b
X-Proofpoint-ORIG-GUID: fpYoolCQfFXv77El9zGHlTjzJZ4LhbcT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-12_12,2023-01-12_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 malwarescore=0
 suspectscore=0 bulkscore=0 mlxlogscore=964 clxscore=1015
 priorityscore=1501 phishscore=0 lowpriorityscore=0 impostorscore=0
 spamscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301120166
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Jan 2023 23:07:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175808

On 2023-01-12 01:40, Alex Kiernan via lists.openembedded.org wrote:
> Changes:
>    Added validation of SSH host keys for git URLs in Cargo (CVE-2022-46176)

Thanks Alex!

According to:
   https://nvd.nist.gov/vuln/detail/CVE-2022-46176

   "All Rust versions containing Cargo before 1.66.1 are vulnerable. "

so we'll have to fix:

kirkstone and langdale.



Sundeep, Naveen, or anyone,

Please find out what the upstream Rust team's plan is for older releases.

If they aren't going to release a dot update, we'll have to start 
back-porting the patches
listed here:
 
https://github.com/rust-lang/wg-security-response/tree/main/patches/CVE-2022-46176

-- 
# Randy MacLeod
# Wind River Linux


