Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA5F3C433F5
	for <webhook@archiver.kernel.org>; Fri, 21 Jan 2022 03:53:44 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.7378.1642737223256275366
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Jan 2022 19:53:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=YKd4ZH/8;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=8020d4495e=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 20L3rhJj018058
	for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Jan 2022 19:53:43 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=subject : to : cc
 : references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=x+A/C5yfqqZ3MbGC9j/YAVeEgoyQw0UMQZ83azrEVHE=;
 b=YKd4ZH/89LGeJGgkwagyq3N/xgwh6MghU+7naKTlvHuprEesJt/M3wiXYKgkNz9n0NmQ
 ktc/iqWilcCQoYbMc6N+RhrhjvADL38dTGVWm5bkJu1eHND8xwXq+OlGWkZWygK7Wvfg
 9N/alys62oUuv6MAa98oaOuGOZwXXVM0IM++Cat3c2S6/qd7W2Cn0NEwJKvTMiMBGzmn
 kbGTTSpCD0IQx6BGUGrFE32Tj0PZpyw14ATf8AtYXTuG+8XLUp4Vaxhj9sI2l1/ROIus
 59pukTXwYnkF9ZIUkPM9f0YjoiaGSYaybjIDpQ5Mee3nP2FPJBLaGHtqWshYEQDFnOUo TA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3dqhx183g3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Jan 2022 19:53:42 -0800
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 20L3rgsZ018052
	for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Jan 2022 19:53:42 -0800
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2173.outbound.protection.outlook.com [104.47.55.173])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3dqhx183g2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Jan 2022 19:53:42 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fk/hTys48iC1EDiQvqqUhKg28tdr/s9AdSz20rB4e8bHSyqBTjbKhuP4Tfk6GZkI1ESY+SqmxaL+hA7qD+oZ+xM/uata7ZhAl8Fji21vZ5rvSfiffPaApJp6k0m6p6Hrfb75GHXgQmEmyOQcfcSuZtKPGYCkhYb7XmHuTEQg3YnPXHSdZcIz7u1xtP6duz/qooJf3l0dBoSeEdr/Fz7NrLqbUcP62SbHwzTFQ4Emb8Js2BKQ7jQkNGOkRT4Zy8yyuh/lRRvb0Hv521lrDOTI0YyEl9e+tIfVpTCE4TVkf/K8W3CKDgC5Nax4+k7clb/uGoGm5h3EDrUkiP60A4LVfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x+A/C5yfqqZ3MbGC9j/YAVeEgoyQw0UMQZ83azrEVHE=;
 b=a0/X4wAo7UAEsqLguWvHe8WWlnTRvcqibhQbb4LhHRAVXCaHebOL0ZNf4PfbckY2dB2uGU0k3gzCqSnt+KBLdVykVdau0Hv8hVbRiDf77wt4s9V+dRaHdhjUNbjZwSHTiPgrEvqH5X0YijiBhhjzi60hpafW47HghCGo0Zg/d0wD+Rlm2vJ2ebvZ8R+UEbgsb5mSFid6lDgMwDjFGjNprLvvIOsisdXyuz094LdDRKDCeod+drZ2FhX9T0+s8g8gG/Fk6++/51n8SzyuqHACBGLP+1z4GDjoMofXjcbK5YAandhhs2iCH2+0jMWtJiSd/DbKZwfOGWkbN8UKNXezpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from BYAPR11MB2789.namprd11.prod.outlook.com (2603:10b6:a02:cc::11)
 by CY4PR11MB1688.namprd11.prod.outlook.com (2603:10b6:903:25::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.12; Fri, 21 Jan
 2022 03:53:40 +0000
Received: from BYAPR11MB2789.namprd11.prod.outlook.com
 ([fe80::5cb5:e426:2e48:17ed]) by BYAPR11MB2789.namprd11.prod.outlook.com
 ([fe80::5cb5:e426:2e48:17ed%5]) with mapi id 15.20.4909.010; Fri, 21 Jan 2022
 03:53:40 +0000
Subject: Re: [OE-core] [PATCH 1/1] bitbake.conf: Add BB_TASK_NETWORK to enable
 task network globally
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
        openembedded-core@lists.openembedded.org
Cc: jupiter.hce@gmail.com
References: <cover.1642662353.git.liezhi.yang@windriver.com>
 <bb3ae8dbd929eac83394be5fe3284dd79c895e44.1642662353.git.liezhi.yang@windriver.com>
 <c32a692ede9b0d10593a960056d7def198dee056.camel@linuxfoundation.org>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <ed821ea3-0568-9da0-7add-fd83c0728f3f@windriver.com>
Date: Fri, 21 Jan 2022 11:53:34 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: 
 <c32a692ede9b0d10593a960056d7def198dee056.camel@linuxfoundation.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: HK2PR02CA0181.apcprd02.prod.outlook.com
 (2603:1096:201:21::17) To BYAPR11MB2789.namprd11.prod.outlook.com
 (2603:10b6:a02:cc::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0c517194-516a-41a5-e3e2-08d9dc919c32
X-MS-TrafficTypeDiagnostic: CY4PR11MB1688:EE_
X-Microsoft-Antispam-PRVS: 
	<CY4PR11MB1688D989EEDE839D9D9931B3FF5B9@CY4PR11MB1688.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	AV3UkwgSfta1LL0Q9Y63zif4bIwUDbHdxTVhRuJJM6rhEQOhBxp0eK45bPBIICMCB3SaVUe0wa9cPWsofWFo6VylD1cb30UTz3zZbzpREFvDOpKVGek0fwSCySxxGT9AR1XY3LWU85XfNmJovIkbfR7qGKJiu1/uFlFRvDQluE4az7A2qqssgupGpNAuCgkHMjItfiZF8U8WdB/jCdKPXsfjnM78W5cEfOvtGD2mHM1i/ZZo42bdal5tkbk6zainFsz09jDFHpA0FGwFdd4gVD2Dyssp8XXwkzGlZAOYe9XtM1Bcx4Aqqb8tDRDL0lzt8zMtHfDQZmJQBdCBCOl/46lhqJf+GZD6LjscIXMJX4Gkj7S0Oedus4yQeZRjqf0kDCSIMcMmQGEg36b83C/sLTwkmOuw5n0u9g0w4XHW2TR8FQZebN8QO41s++YSQ8qvVqQmisBytCfjhACFV2n+WPMpi2A4nF39t3eJx9bwiMVg7D1DiyJKyWFr18xG5VRzLPcdJo3FD8sIbTRQksGKg+PLkWpi2LtTHDg4nV545WGyqEC899q8WhAmMa1tcl/JSaJu7wJEPlCI1jG9QsT4BffPHwAWZh7J5LLirtVc9SnTFpGh0AIFoMF9D10DuVUO3jpsvHgrIecEwvNCwSUysAUKVab4md5Zxu2256ygI7NbXV1ATmepOvI9ux8iXtMdZq3dwIWcKXg4FeR6C6Tjx0pad1D0M7RJjsSobUz3CTEgQuiaF1dxBYKb0FsvVjtoTH5N9AAynTsM+ir1+6di0g==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB2789.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(316002)(66476007)(6512007)(66946007)(8936002)(6486002)(31686004)(53546011)(2906002)(2616005)(86362001)(83380400001)(52116002)(66556008)(6666004)(36756003)(8676002)(4326008)(5660300002)(38350700002)(38100700002)(186003)(508600001)(6506007)(26005)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?c08vM0tQYWhqSjI2QmhPKzRlT1ErS2lydmpocytxWFpqclFYZUsrOTJqNUdx?=
 =?utf-8?B?ZHlVZWl5bTN3TlkreEkvVCs1NjlkV0h0Z3NZaEFrTnROeDdmMzQ0M3l3TDA1?=
 =?utf-8?B?b2FucWxHOWxVcVV3aG5JRDVlUG5wSlh0VkhyVlkyZmpXcGgvRG8rVUNTSnE3?=
 =?utf-8?B?RGZpamtRa2lTVWwrdmVDeFJDUnJtckFNT3h1bkhaUVFGTGdRWDBvdHh6eit0?=
 =?utf-8?B?d3greU1DajgxaU1sTFI5aG5ET2V4T0pncVh4U2JOMDJXS2IxMjBGUnZXdUlE?=
 =?utf-8?B?UFphVzU5Qm9MY01HWWpnVVB0WVZYV1ZOMmQrSktROURTMWI0VDNLdU84ZkNQ?=
 =?utf-8?B?MzBKaG55d0NvMUZoSWJER1J3MHNhSUw3V2xHZ0UyeGtBbVc5T2ZDOTg4SVR6?=
 =?utf-8?B?b2J3Z3hOYWxTWSs1UVJzTFZtMUF5TFQ3YTd1Rnhud0pETGlUdGxuUFhsR0ZH?=
 =?utf-8?B?azN5NW9iTXZaWkE1U3h4ZHZVT2pEaWtka0FIS0pqZktCUFZCS2pwRXJTTnJs?=
 =?utf-8?B?d3JkRVozQzZjQVhpYUgrMDg1bjFmNy9KdVJxaGYxVnRrS0NVNklkcE5keDlt?=
 =?utf-8?B?anQ1RVlmWFhDR3pPdWMxMGxEKzZjdnl2OUgwLyt4ZlVMMWp2RFJGNFNwck92?=
 =?utf-8?B?N2pqVlNwMGNFOTZoNzk1OWNhbklGc21JMjZ0SnVRYi85M1BDaVE1SFE5ZHhB?=
 =?utf-8?B?akZEL1AxRGM5RmxaeTh6T01PRHRablVUamx5L1ZHQ0VrSXVmaC9qYjNhOHdK?=
 =?utf-8?B?cW82bzRWb25kQXlQcVlteHJnazRtWm40dWgrc28vKzJFMC9Sam9uMmFnWlVi?=
 =?utf-8?B?c3QyblhtTjI5Wmd1VlpoL1c4OG5Vc1A0SUljODF4OU5vM0tLc0FDUDBBaXVu?=
 =?utf-8?B?eXpDa2xROXVRamxJeFBhUGMwQldQUStPQkRnd0Y2Qk53dUVhWXUzMHd3OTVa?=
 =?utf-8?B?K04rTnpmb0ZOSGdtOWJFZCttMVUrWXZGNVUvZGZYVnNYaHVmbmtoazFVWmlv?=
 =?utf-8?B?VVlTNUlzdlRXOFF5aXJHelZmS050WmZWdkFqQ1Q4c2MweW5MWldDZ3hwcGJ5?=
 =?utf-8?B?Z0htUmxQbTJLR0tOS1dha09zY3BQR3IrSXRBam9KYzM0dlZwSCtCR3RMM3VY?=
 =?utf-8?B?K25JcGtKRVQ3cHUvZnQzejRkZUFtbE42cGhDbng0eFdZam9iaGF5R1gwamwv?=
 =?utf-8?B?UEFuNGViaGRPZDZ5dHhLY1d6UFloSlVRc2lDdkN1MGpvUDBETDdPaFhBdUxV?=
 =?utf-8?B?cGliQm4rRmRydjRjcUd5cktHWmp6Yndkd2dMek1EQU5FRFhLdnNQc0t5eVo5?=
 =?utf-8?B?czFuTUgyK0NaTnA0NG94WGlLd2FvWWlnc0dQcENHbGFvaDVNUEp2NEZtbjQx?=
 =?utf-8?B?S0RYSHFDZnlQKytkZ1hKeE5TOURmdy8yemEvY3ZqaklMRTVDdVRIWDJHb2cy?=
 =?utf-8?B?UFFESjlwcnQyUEVGSFE1VWs5b0xsS0MrRnFuT0dBbWpMdm1oSWdBQWZxUHFI?=
 =?utf-8?B?WEdNSGdOaGlVUUtiSVFMRlduVXZmK29MYTFtSVNRdERzYlU2bS9XR3k2alJa?=
 =?utf-8?B?bzFFRmp4OVNVZ3BUWGNwTWlLZERKajlweExYSlhRSUpwNXNrU3A3N1NjNWJQ?=
 =?utf-8?B?OGlsVkkvVTEvTkNWSDNIZWpnVHJiV3N0dFJpTk9MZ1l4NklxQlY1K3dtWks0?=
 =?utf-8?B?aXRrL1ZSN2xnWEEybHEvRlZqMlRYRHU3U2tDY1ZpQTgyZHVhZWd4OVVxWmZT?=
 =?utf-8?B?dmp6djdTYk51TG43ZGZLblhJdDd0SEhuK205b290dVZZZENoVkZWUGxtcVBu?=
 =?utf-8?B?L1BZaFM1bDcwN1NKS1FhUTI5MFYrWFJ1dU5WMWJjUjhiRXNPdUJuMmVSSEUw?=
 =?utf-8?B?Ym9rK0hseGFZSFpIRytUcmlzL0IrQnVENEE5OUIvdjNQaTlxRno0WVZNUFFs?=
 =?utf-8?B?SUw3YnozNkpRa04vcnplTCtqNzFzMmdQRnk0TnU3aEdyRUs2ZWNETktqMGkr?=
 =?utf-8?B?TXNSUHVCcUN4SlJjd2F0WUN6aG0vM2dqY2NmemRmUHFHR3k3dysxS2VHVktG?=
 =?utf-8?B?ZWdKNXRZK1lNVUFWYTZIMW5EbTJNUytrZnBsalVwa0V1UFVTU2l3R0o4aUJR?=
 =?utf-8?B?dWtQVEg3V09GcjZibC9QTGx6R2FrUnRQM1hCL0NFVzdhbVVTZ1NtdTFIWTlO?=
 =?utf-8?B?K21LMmNZejVTQmFldTNRMTFlNTNBYURYTm02cWYwV3Z1T1g0RW44bitnYURJ?=
 =?utf-8?B?TnpHclYxZU5sODRjT0hiYzlPQTBRPT0=?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 0c517194-516a-41a5-e3e2-08d9dc919c32
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2789.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2022 03:53:40.1241
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 eDED/cWlVa+5/dq1I6hxpJnY0/xOnECoWwN4B3+saWAH3zWKwzGUxst4e2ujjPdBCJwI4W+YcxD1juNyrwumn/GQ/WZoE4Qsx6AVuDfwNEU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR11MB1688
X-Proofpoint-GUID: RCEP4NEpqDsXAYOU_i9xQwWZBTSlZtrB
X-Proofpoint-ORIG-GUID: 5PnPamB0GAU0Cs3ObAWCg20YR2iolOs0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-21_01,2022-01-20_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0
 spamscore=0 bulkscore=0 mlxlogscore=999 priorityscore=1501 malwarescore=0
 clxscore=1015 phishscore=0 suspectscore=0 lowpriorityscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2201210025
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Jan 2022 03:53:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160812



On 1/20/22 9:38 PM, Richard Purdie wrote:
> On Wed, 2022-01-19 at 23:09 -0800, Robert Yang wrote:
>> The NIS or icecc can't work when task network is dissable, add BB_TASK_NETWORK
>> to enable network globally for such exceptions.
>>
>> Note, enable nscd on the build machine might be a solution, but that isn't
>> reliable since it depends on whether the network function has been cached or
>> not.
>>
>> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>> ---
>>   meta/classes/icecc.bbclass |  2 ++
>>   meta/conf/bitbake.conf     |  3 +++
>>   meta/lib/oe/utils.py       | 15 +++++++++++++++
>>   3 files changed, 20 insertions(+)
>>
>> diff --git a/meta/classes/icecc.bbclass b/meta/classes/icecc.bbclass
>> index 794e9930ad9..c39c86458a4 100644
>> --- a/meta/classes/icecc.bbclass
>> +++ b/meta/classes/icecc.bbclass
>> @@ -41,6 +41,8 @@ ICECC_ENV_EXEC ?= "${STAGING_BINDIR_NATIVE}/icecc-create-env"
>>   
>>   HOSTTOOLS_NONFATAL += "icecc patchelf"
>>   
>> +BB_TASK_NETWORK ? = "1"
>> +
> 
> As Quentin mentions, I'd much rather this was done on the tasks using icecc
> using the flag.
> 
> 
>>   # This version can be incremented when changes are made to the environment that
>>   # invalidate the version on the compile nodes. Changing it will cause a new
>>   # environment to be created.
>> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
>> index fba99e8f0cd..bf5bcd55519 100644
>> --- a/meta/conf/bitbake.conf
>> +++ b/meta/conf/bitbake.conf
>> @@ -946,3 +946,6 @@ MULTILIB_VARIANTS ??= ""
>>   # what it would be anyway if the signature generator (e.g. OEEquivHash) doesn't
>>   # support unihashes.
>>   BB_UNIHASH ?= "${BB_TASKHASH}"
>> +
>> +# Enable task network for remote user such as NIS.
>> +BB_TASK_NETWORK ??= "${@['1', '0'][oe.utils.is_local_uid()]}"
>> diff --git a/meta/lib/oe/utils.py b/meta/lib/oe/utils.py
>> index 136650e6f74..c21f034aafc 100644
>> --- a/meta/lib/oe/utils.py
>> +++ b/meta/lib/oe/utils.py
>> @@ -595,3 +595,18 @@ def directory_size(root, blocksize=4096):
>>           total += sum(roundup(getsize(os.path.join(root, name))) for name in files)
>>           total += roundup(getsize(root))
>>       return total
>> +
>> +def is_local_uid(uid=''):
>> +    """
>> +    Check whether uid is a local one or not.
>> +    Can't use pwd module since it gets all UIDs, not local ones only.
>> +    """
>> +    if not uid:
>> +        uid = os.getuid()
>> +    local_uids = set()
>> +    with open('/etc/passwd', 'r') as f:
>> +        for line in f.readlines():
>> +            if not ':' in line:
>> +                continue
>> +            local_uids.add(line.split(':')[2])
>> +    return uid in local_uids
> 
> I think we should move this code into bitbake as I really dislike having it in
> bitbake.conf and that [0][1] syntax is horrible too...
> 
> I'm also not convinced about the name "BB_TASK_NETWORK" and think we need
> something better. If we're moving the code to bitbake we might not need a name
> right now though.

Yes, it's enough for NIS without a name, it seems that NIS is the only case atm,
I will send a V2 about this.

// Robert

> 
> Cheers,
> 
> Richard
> 
> 
> 

