Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77951C3DA50
	for <webhook@archiver.kernel.org>; Thu, 17 Aug 2023 16:32:36 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.1476.1692289946777589673
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Aug 2023 09:32:27 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=o1wz4Jni;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=75933f8e86=randy.macleod@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 37HCSpD5010748
	for <openembedded-core@lists.openembedded.org>; Thu, 17 Aug 2023 16:32:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-type:message-id:date:subject:to:cc:references:from
	:in-reply-to:mime-version; s=PPS06212021; bh=swS9oydRP7oG1WhoBns
	u/BYJjKzJDJ3Ww6xgricsrAw=; b=o1wz4JnijoGR6LLJvFboN5o4ho4v5RRm1c4
	P1raS65FOxtpitWlngyEHm9QJnJD9gCFnx+wJfuf6K9Q8AErYDKSuccScMfzTKJp
	q9+0KuCfpPJuTdDzzHYScesqfPZbVtXNxpPbcZMroNuKhL8l5ziAOukPnWgo7pw0
	R4qgdgPq5XUePUPL/BwUJJUg+L0xSG7vMckxV2gBqMqI4UixNp/185UTCe5YOqHp
	yMgUlzULqunYJVKwogfxxBXP8fVUu14gElvDdDiv1EwCEkARnm43eMDVI0Uizf6m
	1MyYFYWIXdX1mZguy0kxISaCmiyosG+QgzIJa/Ql4dYsftI2mcQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3se125w4r3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 17 Aug 2023 16:32:25 +0000 (GMT)
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.22/8.17.1.22) with ESMTP id 37HGWPfQ025005;
	Thu, 17 Aug 2023 16:32:25 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2103.outbound.protection.outlook.com [104.47.58.103])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3se125w4r2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Aug 2023 16:32:25 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IhpSPgFPqL1rGdvB91YqJdSCb8t1HoTHhllLnJD1/dEo4i7CNswUX1JMBG23kT8VMQC07ZPlFZVxgU++pvws62cE5Ak0LjWXOx/NDQkNJeM9FFuoA0NfqMhbpMYFUUxEsEaM9h4yLt6jj70VZH0pS88GtdLt1escPQ7nj8AP5z9nx0frf1ptBgvSpjBPaUfCNXt7nD1MRcmk7adLVnLtFPkoXUU+HLPG2nT+CHhLnrMl4MxtQ7vCRV5qAhrMxOOkP4MVfSsUAyNvo0IT5iv00FLh5dRFM8Apv4Bu+P7gmvDia9git3MNaQgrsgRMreDNdsetIleYGHxN47hssjS4RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=swS9oydRP7oG1WhoBnsu/BYJjKzJDJ3Ww6xgricsrAw=;
 b=QL9Pam97aP7FdnUvKdKT34rk1hEpY0V1LGoSpeusTBufvBVKm8ns11o39vLrn5g/V7IGJ8DWxJDsLGkQ/Zw3+aEP+bhF+GZTfcbTwyL2SbiVpJLTeaTTsI+Def9lCTMkmFdjatC8iaH9vjByIeUpsnhiaSOua1YJwXUZLTpFqR7qYyYv7NTv/G/QJDTn5zkwdiL4/KOWtDoUY5zxMw9E8FG69zXRiQyNSIQcAEXH+adXsQ9epWDGaOlMQY9RG2I31fsCBoApBtO9rJ7oMUSFttAWfeLyG/qLQAGVl1LXoC3DjS8CqsMCCexevzOiGvRaj3vdCpmw9WJFETKPKnsOlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by PH7PR11MB7643.namprd11.prod.outlook.com (2603:10b6:510:27c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.31; Thu, 17 Aug
 2023 16:32:21 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::144:140c:a640:f799]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::144:140c:a640:f799%7]) with mapi id 15.20.6678.031; Thu, 17 Aug 2023
 16:32:21 +0000
Content-Type: multipart/alternative;
 boundary="------------MVYQurnZDjgkBTycQ2435lTc"
Message-ID: <045998ba-2016-606b-8f41-59ee6f188cf1@windriver.com>
Date: Thu, 17 Aug 2023 12:32:17 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [OE-core] [PATCH v2] rust: Upgrade 1.70.0 -> 1.71.0
Content-Language: en-CA
To: Alex Kiernan <alex.kiernan@gmail.com>,
        Alexander Kanavin <alex.kanavin@gmail.com>
Cc: "Shinde, Yash" <Yash.Shinde@windriver.com>,
        Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
        "Kokkonda, Sundeep" <Sundeep.Kokkonda@windriver.com>
References: <CANNYZj_WLs2V=DtsaG7XH862Xn2rJnn+bZZBbVd+5J=Wh_StXg@mail.gmail.com>
 <4191.1692280258442699624@lists.openembedded.org>
 <9d57a013-9737-f119-2e43-e8dd1a71684b@windriver.com>
 <CAO5Uq5SGgQ7vJ0HFSDXO8LPZTHUBV5tJH_R6d8yZS-NT5VO_Ow@mail.gmail.com>
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <CAO5Uq5SGgQ7vJ0HFSDXO8LPZTHUBV5tJH_R6d8yZS-NT5VO_Ow@mail.gmail.com>
X-ClientProxiedBy: SJ0PR13CA0152.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::7) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB3994:EE_|PH7PR11MB7643:EE_
X-MS-Office365-Filtering-Correlation-Id: a0e004df-05ee-4b88-85af-08db9f3f877a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	mitB1hP4vLzYy1JXzyQVXc28/CocMMy966fYG+hBpysDGqqSxhdH5gI/DuY3NqDLVcnhn0JMUcRMQEFkUSeEmfHhJe62DFJPq0b7xjMcEzbEcbeJlrpzl8Q6MMCUIu5rZmeDCpSvYnOaT/exQpJofo2TfuHL8aW/1SL+n5+Zw07phpgf059i/eQG728bne2ccpYpUU7x1BoFylzb6bL80qbOIyElG4v48Z4Jlmif1i5akYydASIpFT7XzztJAZgNK5HjaZOVP5srt+0TjyyEtDaxleMsNDzrkapoHWjy19xYrPWy2tUectwii7q48RlLG2SVln+q/xxrVt+zviPcJzpz4KyVZgIxHbk/7ZSWtDp6E2fGoXo0KppIJWUhhq3MX89tLMFWZR5y1HcPg2kO7V8T7N/5QODNuwe/tUrc75MAAxCNZpEGc/H3oLjApeJmDl0rledgKYB6Zu5UDJHWnwo+aiYcYke30Ru0hd/Mg6Y67azw7TEWzvLzKZfre6ohzscVt28gLOcNChpQHn+ygVIshvtHjlQvFsXF6WE6pOHJQXShUGVEAt1T8m8FGNBihtMRvjgiJrP4jM6rsgAaekaQ9p6mp1pIxsmrNPQtu8bgQfVKy5+L37ViLTAwBRyc7GKEVmO1+r5wYsL55Vkovw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(376002)(346002)(136003)(396003)(39850400004)(186009)(451199024)(1800799009)(36756003)(86362001)(31696002)(31686004)(5660300002)(8676002)(4326008)(8936002)(53546011)(2906002)(41300700001)(26005)(166002)(107886003)(6666004)(6486002)(33964004)(6506007)(2616005)(83380400001)(6512007)(478600001)(110136005)(54906003)(38100700002)(316002)(66556008)(66476007)(66946007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?aGxUdEt0ZnE2MkF2QUhkRlVsVEY1N2RqYitzWlBreDV3SzI3UTBqVWIvODNj?=
 =?utf-8?B?ZzlRT3Q0V1IyQVpUbiszalN2UXZTMzJnVUtpay9mNG1LTmt0RlM2NmYxNmQ4?=
 =?utf-8?B?cFRtYmZGNlFIT1p6aXN1RzVYbFF1R1ZuMkM3ZU9TbCtSMDVYZmxmL21HQW9r?=
 =?utf-8?B?Nk0yM3M4eEpoTjRISElFL0Q5SEFpQlRZK3ZoU1ZsSkU1enRXTWZJMjZOMHow?=
 =?utf-8?B?OGMwdkJNSzZHMWpmNnk4Q0NOcXo2RFlPckVKc0l3TytjaytRcWd5a1RIS2hq?=
 =?utf-8?B?T2JJQnhyNUFrWkM2TGJTRU9kZzg2aDMwUTdlbHd4WHdLUi9qaHlJV293U1ZF?=
 =?utf-8?B?elRFMEZvQnB6OUhMdm5oMTlXcDZNL09rLzYrbzFsUEk3WSt4Z2syQ0F5S3JD?=
 =?utf-8?B?T1Ewanh5ZUlqc0VxWEFrNUp6SkFPenJIOHZyTDI4UzR0bStGRC80Tk9yaDVr?=
 =?utf-8?B?ZFB5TCt3R0ZOTXpxRXpsVkx2dmN5VUxrUGEwMWFHVjluVTZzWjB3UzVsdVRw?=
 =?utf-8?B?VWtaMytpV2RhYTUrc3FLNmE5WW84MjhHZGxHU2R5cEZIRCtWUHB5Z3V5R1Yz?=
 =?utf-8?B?QldtdUtFT0lweXdTUCswZFpHTHRLbzAzZUgyRm9RcDNiYVlScWtMQVhnWkw1?=
 =?utf-8?B?WCtwY2FBTEpwdnFOSFhNUHVkSHAzZ0l2NWR0ZmpPWmpmTGJoZDdlYkUwVFNa?=
 =?utf-8?B?bVBUWFZUa3Q4YnB2YS9Wd1pIZTdxemxOYklaVHI0ZW1zTi9TQjB5aER3UjY4?=
 =?utf-8?B?L0hSYmdSVVAydjZVSmpRdVIzeFUzYzl0U2dPUWNWUHZGVk1WVGRZUmxNYjIz?=
 =?utf-8?B?VktyQW5CUTNDQmR0cXVjY1RKWXR3KzJCMDdabWx5QXcyYUxXa2FBeHZ0NnJh?=
 =?utf-8?B?TVFiTmlMWDNRMnpmVXVPVVlMT3ByMjlzTkE0Z3FuYkhkVERBNndocEdLdDBF?=
 =?utf-8?B?WDBVM3puYnN4aGp4eGF6c1VQQTY4NGFYU1h0TDdKSk16OEI4aXdLWXBYQzUx?=
 =?utf-8?B?Q3BGVGVpa0lwdEtLekVZTkxCV280VUxMQmJaYUJBTWNaVVpWVktPemxrL0lQ?=
 =?utf-8?B?ZVZnMkQ0OG5DVkdsL3IyNENPcGp1Qis5aWxxd0wwN3FMMHN6ZG1pVkN3eHFV?=
 =?utf-8?B?WXJIWmNabTNQdWFNdE9qUmEyQm1DTTBYM3hQZEtwY0kxQTlTWXd3RVN4d2hY?=
 =?utf-8?B?eGIyOFFWcDhMam94c0cwbXJCQTcrU3kwdmxkSjlQTXZGNVRQUUNVMjJqbXpY?=
 =?utf-8?B?TndmWVNtMUkrS2tZV21YL3JyL0Z4emdLdmJrMWlRZCtkdEFmQ3doaTlDY1FV?=
 =?utf-8?B?NVdpdit3N2d0emt1Vk9wYldFc2xEODhCUlNtWFJsdHdzalZmWWhCQ0JrclJI?=
 =?utf-8?B?dFFLVnMvRE5nZDBYVUZPUVZ5c05sanFJeS9qT3FaL3pxUmQ2UWNWMTQ1VUk1?=
 =?utf-8?B?d0JiUEgzYS8rMmgzOHNBTGcwMVhZLzhuYlhwTHVOeTNIUmFkZGlTa0YrVDI3?=
 =?utf-8?B?d3lETi83cE05aUNEYXprQjJmcGtOcmlOa3l5UGZFWVZyYTd0N3l0U2xqSENu?=
 =?utf-8?B?OElLekxvQzM4TWRqbUNUS0R5bU5yZCtQb3M2Umx1cG53Sk82aUM2RFV1RzJT?=
 =?utf-8?B?NncxRm1nVUwwUHdYd1UyU05qOHlvNVpwbmxsaGpuOEROT3V1eVpHY1ZBNUZK?=
 =?utf-8?B?RG91TS85RTAwTktObzIzeDQwK1owR042S0RpcXRGM3o0UDhoUU5EaGxPMlZv?=
 =?utf-8?B?d0pnYUVoMzViWU9ZVVlrMldId05BTGl2elRuZy9CSEJWUnovcEg1UTR2eXNI?=
 =?utf-8?B?Q1JJWFZRdnBTY09PWmdwenFQNW9LZEo4UFgrZ2lDRkNGUStqeHRwbTJLUnRI?=
 =?utf-8?B?KzE3S2RSWVRqT0xQdE1raERNeWphdUdUUGZYV240ZGZUUG0zU1Zxak5MMGor?=
 =?utf-8?B?cFhWNjNWWWRjRVFiWE5Hb3VXR1Jjd3U0MmpYZXR6WEVkdkpWNExucFlPbHN5?=
 =?utf-8?B?VEpJM0R4QkFNQVRQRy95NmprUWJ4Z1FveUVxVEZsUmJYV241T29wUHVsUnZa?=
 =?utf-8?B?SXpzb0I0bXV4YlBmbUl6SUNpQU90ZU1oNjZHT1NkblRsamdaL2NndkIybzBR?=
 =?utf-8?B?SVIwd2xESDdoNmVQRHRqaTVheDI1Y2RvNW11T3RDVEV3THhIQ1Y2TVJUbUd0?=
 =?utf-8?B?UVE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a0e004df-05ee-4b88-85af-08db9f3f877a
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2023 16:32:20.9609
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3PEludRBzR+Cc96APMInWbFtEYJpcTxpc/L3/eiro9XH3N+uGydKt9SXEhBAKikcqxJM+NbfuyCN+9ML2UmLRdlm6gXF32UGWNWZpyLVBqU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7643
X-Proofpoint-GUID: f5r_cTbc7V9SP2qxTIi_fV6XtG6dWUs6
X-Proofpoint-ORIG-GUID: QEkfSdLMg1uBJbh2OpBDAk2epyWCdVoN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-17_11,2023-08-17_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 mlxscore=0
 mlxlogscore=999 spamscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2306200000 definitions=main-2308170148
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Aug 2023 16:32:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186327

--------------MVYQurnZDjgkBTycQ2435lTc
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 37HCSpD5010748

On 2023-08-17 10:58, Alex Kiernan wrote:
> Hi
>
> Yeah, you're correct... Currently sitting beside a pool in France,=C2=A0=
=20
> having discovered that the DSL where we're staying is basically useless=
 :)
>
> I've been buried in an ESP32 project before we went away, so not=20
> meaningfully got back to this.
>
> I did start looking at rebasing the patches, but there's massive churn=20
> and my suspicion is taking the changes to parameterise the test=20
> exclusions will be the way to go.
>
> There biggest fix I had in the 1.71 update was to use the sysroot=20
> target for libstd, which is a much cleaner interface.


Alex,
Thanks for explaining the situation.

Sundeep and/or Yashe will take time to work on the 1.71.0 rebase and
send it to the list as suggested by Mr Kanavin.

We'll get the fix for CVE-2023-38497=20
<https://www.cve.org/CVERecord?id=3DCVE-2023-38497>, in the 1.72.0 update=
=20
for master.


Enjoy the pool!

../Randy


--------------MVYQurnZDjgkBTycQ2435lTc
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 2023-08-17 10:58, Alex Kiernan
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:CAO5Uq5SGgQ7vJ0HFSDXO8LPZTHUBV5tJH_R6d8yZS-NT5VO_Ow@mail.gmail.com">
      
      <div dir="auto">
        <div>Hi</div>
        <div dir="auto"><br>
        </div>
        <div dir="auto">Yeah, you're correct... Currently sitting beside
          a pool in France,&nbsp; having discovered that the DSL where we're
          staying is basically useless :)</div>
        <div dir="auto"><br>
        </div>
        <div dir="auto">I've been buried in an ESP32 project before we
          went away, so not meaningfully got back to this.</div>
        <div dir="auto"><br>
        </div>
        <div dir="auto">I did start looking at rebasing the patches, but
          there's massive churn and my suspicion is taking the changes
          to parameterise the test exclusions will be the way to go.</div>
        <div dir="auto"><br>
        </div>
        <div dir="auto">There biggest fix I had in the 1.71 update was
          to use the sysroot target for libstd, which is a much cleaner
          interface.</div>
      </div>
    </blockquote>
    <p><br>
    </p>
    <p>Alex, <br>
      Thanks for explaining the situation.</p>
    <p>Sundeep and/or Yashe will take time to work on the 1.71.0 rebase
      and <br>
      send it to the list as suggested by Mr Kanavin.</p>
    <p>We'll get the fix for <a href="https://www.cve.org/CVERecord?id=CVE-2023-38497">CVE-2023-38497</a>,
      in the 1.72.0 update for master.<br>
    </p>
    <p><br>
    </p>
    <p>Enjoy the pool!<br>
    </p>
    <p>../Randy</p>
    <p><br>
    </p>
  </body>
</html>

--------------MVYQurnZDjgkBTycQ2435lTc--

