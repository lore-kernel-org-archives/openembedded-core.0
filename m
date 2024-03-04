Return-Path: <changqing.li@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A801FC54E49
	for <webhook@archiver.kernel.org>; Mon,  4 Mar 2024 07:37:37 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.93304.1709537848753288330
 for <openembedded-core@lists.openembedded.org>;
 Sun, 03 Mar 2024 23:37:28 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=Bbmri2jc;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=3793ed8a9d=changqing.li@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 4244mhT9026215
	for <openembedded-core@lists.openembedded.org>; Sun, 3 Mar 2024 23:37:28 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=message-id:date:subject:to:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	PPS06212021; bh=xUBmA+90WA4wghRu0KBmpme2KdblKcDL4N4zcGySPMA=; b=
	Bbmri2jcsvTlx2TC6pjvSmsOkokE7AB5pfH76+gENnuqPQoUCaM2YhDmMMCridKi
	c4xFodeT0oWcYU3VYLRl7Wi+T+GsCoHLklU3bf42W7SNidgHXhqxeAVcA7WBXwju
	1F8woJ6wCUne+H4+LW7qwf4+mJotKPNf9rXZiwOPZuXgKSLGM/YNk+AvxYiy1tSX
	JyhtSG+P5R12bZUWQ88/lGb2Ad0kG27jhXhkNAY0GK9DprV4yCLaqqVbWZlLJ00a
	HWbayp2ohLi7WamAWZ96v9PxxVOylN8XmOY1jM6yMMrSYiCuqb91pp0evYkOakWL
	bvw18A7XGbt+JCyXozPLJg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3wm4gm16jt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 03 Mar 2024 23:37:28 -0800 (PST)
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.24/8.17.1.24) with ESMTP id 4247bRTs000804;
	Sun, 3 Mar 2024 23:37:27 -0800
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2169.outbound.protection.outlook.com [104.47.56.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3wm4gm16js-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 03 Mar 2024 23:37:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OuVwlfxM0WTSRqJUyNkuiO9SwauhB8eVu/xyJesfTZy3CqMyl1A1Gr1r6NQ2eQ6U86f/Urae1UjLBjagviwEZG68ZNxTPpoWPYh7HI/q+v0f2IHBMM7dNcfvNW4nGjoyCe0wemrgYDrE6t88OU5p4Lp9BEpvww8xdhS8ao9pERqbJPAF9bv2bpnW8gP6n5FhltcM1xIeV6bv9lP1+hWVXRE5bZnooDOUOiLawRb7PQ/he44i9PPurVykjrGndE8WLL2QpthlSQCK7Ka1on2ZD3XmGI0HwKRLz01ldKUMNo99aZV5qcCwg2XxsunWE4sw4nHdJWhUBvFsCCyJrlAKYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xUBmA+90WA4wghRu0KBmpme2KdblKcDL4N4zcGySPMA=;
 b=HgWy7AfhHEYkqU+zY7wIG2F7KrpC55gclTXJXW12vX/bjWnvQoSmMm6g4+A8BbKoCpNgzNrm1mirwJHUO2UF2vrAPSpusfq1kk5gU8aRcI2py0ybAPPcRjmw27e1qfyj0nIRiCMMqAqQkxNrc02aCQzjhduubKtHQrDqk5X93ikAGKbE+dfv/cpKEgq3lv7CkT6z3AaS2PrSeCrn70bbmA/TgUm0vbcOBHw0w4S1tkgYL8Lkh260fmLjJE1DJI3Ikq9MS0t6vFgg5p6MICa6C7cjlwVlC1FxcsyyDf+iK+f8H/Lxov6CcPHlQnBlAywjR7ArNMNwXxLsG18VV1Ggaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by PH0PR11MB4934.namprd11.prod.outlook.com (2603:10b6:510:30::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.22; Mon, 4 Mar
 2024 07:37:24 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::d168:2e49:fb61:dc21]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::d168:2e49:fb61:dc21%7]) with mapi id 15.20.7362.019; Mon, 4 Mar 2024
 07:37:23 +0000
Message-ID: <376e37d8-2b6c-4106-b8b1-9e8ca5625e33@windriver.com>
Date: Mon, 4 Mar 2024 15:37:17 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] go: filter out build specific path from the
 linker flags
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
        Changqing Li <changqing.li@eng.windriver.com>,
        openembedded-core@lists.openembedded.org
References: <20240229012140.1355863-1-changqing.li@windriver.com>
 <717d4653e5002408884110178013804b645e2b38.camel@linuxfoundation.org>
From: Changqing Li <changqing.li@windriver.com>
In-Reply-To: <717d4653e5002408884110178013804b645e2b38.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: PH0PR07CA0084.namprd07.prod.outlook.com
 (2603:10b6:510:f::29) To DS0PR11MB7312.namprd11.prod.outlook.com
 (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|PH0PR11MB4934:EE_
X-MS-Office365-Filtering-Correlation-Id: 7784e4e5-b63e-4df3-2e1b-08dc3c1dee4f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	M8ZmMgGUSCOCRGGgYy+oVXr4V/ea/s2t3U/+mq18+uPPmiKmD/nIYGTODPImXVAD9SI65FQhrvpPY70k8Rc0sCm4RF6NBZJkLTGKEXK/Ebss7RdXMHoZBimuTIMTHbD1eWG1F7LZYuxj/mLpzR78mCfOgB//ex+PjAZUAthgCGPon/8lCxvasdT2lgc7Qrzo7S5NEco3lNj5Czq0cSB7N6HzwksSIX/lstQ1xpx+jufOLa7InyES45TAvbYuznkARH/M962fyVlruZvg1+jG/Obd15ks6LrjRPMwvx1XAzFmP1BMo9FoNqyD9gmENhbgTaxqWZQOa+L9LpF4rZSRqBckoHoJeg+sB9o2MmoJRL2bBGvsh1jgENrDhMwRhSTX8SlvOps4s5ETYWuoFLRYZr5SZ71EZaEcnFgoHqYLF+Pii4awjPwe+sp0HXWRFAE3qrXlTLTUZOcmXOEhXtmq6kHk68iodWHX4FK/niNv2mFRYLeOpwreRLQMUpgi7G4r/HxQBwjRwNctLdtBWORIeDFwuEjtB6tQL71eovYx3zqiKK6GiEI1mUNm7fNGSCI7zWfyMTrzFVRoxJ5Qmf5O1Gffu3hfzNU1oz0wH+oBJAc=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?enRVYU9Ma1FUblpXQUpqL2VTcTNNVWJ4OE9GUWVqNk82OERZNmVZLzJGbll1?=
 =?utf-8?B?bDhJdi85dVMyNU12UStJd2FvUERPRnh3ZVNGUEZhVDVwQnpSM0ViWmdXS2d6?=
 =?utf-8?B?UjBzeFUzTStBOS9yR3NKMmZzd2pXNEE0Z2NSb082eDZnQzNrMGF5OGpGVTZK?=
 =?utf-8?B?VkNJWCtmUjRLSCtXa3hMQk1IQ21zNS9SZStZSWZOYWlyZWl3QmtaQVo1SUlu?=
 =?utf-8?B?M3VrNUxnU3hZaWxsV1N3TnZTNmoycTZLMkY3ZHFRODkvK2dONXZoZHJKZENz?=
 =?utf-8?B?S091YzFVZUpTRXk5QkRDTTFGSm5KQ09jSVRVVFF5VytJNkNVMzgzUFc2eUpG?=
 =?utf-8?B?VkJmOTA0RWFOQmhFQ1Q1VENxRUFEb2NBVWl4TVZaYVR1R1lVNnJ5Qmplekg1?=
 =?utf-8?B?T3hPUVNMellqQzY4eDZDZEx1Rjg2U0VyUWtpSmREbUpGMkRtdTg2OTdFUitz?=
 =?utf-8?B?Q0hxL0dhaTlDWTdjZ2RLd1ZYdWlwMWxURTlaR2pnOWp3U09RaTM5TVdLQ1lh?=
 =?utf-8?B?N0pwVnFNeEV6bkZJdVB3Q0syeEpoT3V6Z3BUUURlOXg4VzlEQmlKNktkbTNL?=
 =?utf-8?B?UzJFallQcytSWEpYbDdRUFlydHBZOW1tU2tFbVpTekcyUFY2SDJrYk9UcnVB?=
 =?utf-8?B?bnh4bFRhU2tRZU04WDhYenRFWExwM3E5UCtVVlVEM2tTRVNaYXVKYWZJSEFV?=
 =?utf-8?B?RTlaY1VmNlhBTGEvOGFXUkNtRXlVcU9CWW4rb2hCZXhQWG9VWU1oMlJMZHBl?=
 =?utf-8?B?Z0NMMkRtZUNsS2dQVG9weTNRVU5BV2xvck1XOTE1OHVXMFdLM05VdW95czlp?=
 =?utf-8?B?VXZmKzJVelZvMXJwQ3ArU0krdXlpTGM4alR6MW56czNzSkthcFF4cWJJQjA1?=
 =?utf-8?B?Q2ZFVnNic3pSMkNIMDU5RUlWTUMramF2UVRMZm1NK3VWMXErVURldnY2Y3Nr?=
 =?utf-8?B?NkloMnRpelRGSm5sWDlReHBiWmZCTlRzaEpRTzJlbmo5SXFGWW55Q3kreHJN?=
 =?utf-8?B?bVVBR05DTGI4WCtLbjhnM3IyTHpsOHpLWmJySzJLVXhsa2lIWE8wMkY2elE5?=
 =?utf-8?B?d2tqS3h5M293eUhEaVBPeGxycC9ZWHlIZnJkVjdZelhCbmNOWDE2SkdRMnZ1?=
 =?utf-8?B?WExMRmZwK2lQOXZCL1UyRy84dFB2SWFyS21Xb1U3UUNHQXdqemZIOUhPclg1?=
 =?utf-8?B?V3NyRjk0MFdQbG1XWDQ2QkFyWHd2dkhZcWNJY1E0TVpUa01VYUltUk1xSThu?=
 =?utf-8?B?SlYxUVdwT3VPeUpZS3o1ZU9MQzhTdGNsbXBmSEZOeUtyWmtwTlV3MEllOG9n?=
 =?utf-8?B?dzVGOHBONm5PNEU1VTFPQ0J4bkdJUUV6UWxGRXk5Y3U4bjR3dGdjNCswZWk5?=
 =?utf-8?B?YTl5amh1Tzh3S0ZVcEZSeUZXRmhLVXpBTVIxV2J2eHVmS2Q0M1VEQ1BKNnA5?=
 =?utf-8?B?VjJjVUhEMUQ1NUFhVEdiSEdPNG0vK2wzTWs4SU05SHpkSldLMnpDeU04aWdn?=
 =?utf-8?B?T3JyczY2TExkRkY0VEdkVkJlUHA0elVpeGtoeEQ0SVpuOXZiT3lqdW84WTUw?=
 =?utf-8?B?QWtXQkI1c2lpUjFWamZKQ0pnNGRub29aOWNMdzFyV25ja0F6RnlpaERvUitL?=
 =?utf-8?B?b3JnVlNHcHJFdVZNbVNNOXdsbnpCMVpGRWcxTmxRR2FhYTlmQ2xWMGpDZTZm?=
 =?utf-8?B?ZFFYSFlhOW44bC9Vc2E5VE84WjR2MXBXUFkveEJlbnVMbEd2c3dxVWJzS0Ju?=
 =?utf-8?B?V0RJUm5ZWTVUUm1VaFlBS05CckxEbHo3dkRGL3M3emZjVDlpVy9xZVdNMitD?=
 =?utf-8?B?eXlpaGRjUzAwVzg4by9sa3p2YW9BRThMd2FtUzJ2S3lpaFVGQWtpRldYSDZl?=
 =?utf-8?B?SjFQQUxDalRLVFZBMHhsYnlqYks3b3hQMlg2MHlrdHE1VFl5UnFETDNnQktU?=
 =?utf-8?B?WEltRjZxaTFHQk1hYkUyaGhLQVoxZisxazdiM3o1SjVaa2t1OG9kWlNKa3FQ?=
 =?utf-8?B?N2ZoSk5RdXZkajJLWFE0MFovR3lIdnAxREw0Q1V2NDdVdnNPN3J3bG9OemZo?=
 =?utf-8?B?akRoa0lUR0tORm5xSEFQbHJpRkViUHZXVDl6cloyc3FlcUZkRHlEcDNUd3ZC?=
 =?utf-8?B?b1FITnJpWlFBMUdwNFNRZFg1SmlrNWR1VGJWSVlNK2FvZDRteFJvWUxFV2V4?=
 =?utf-8?B?YWc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7784e4e5-b63e-4df3-2e1b-08dc3c1dee4f
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2024 07:37:23.1219
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pQnEWra/IJ2dQFGA2RIgKMbrd3S7xAwck9qaRbPH9drdu2LX4fo1nSj0pQTrrOqVmN+JdlyAIqbH7IldB+JtPTHuc/Vb9P/n6bOM2z3RMIY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4934
X-Proofpoint-ORIG-GUID: 5tSCUAMo6mEvBL_8m2gv30zem2Q2UxvO
X-Proofpoint-GUID: q8gfG2c-mRcXeFbFZaIG_9Ipxzl2HGnV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-04_03,2024-03-01_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 malwarescore=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 mlxlogscore=791 suspectscore=0 impostorscore=0 mlxscore=0 adultscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2403040056
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 4244mhT9026215
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Mar 2024 07:37:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196591


On 3/4/24 00:32, Richard Purdie wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> On Thu, 2024-02-29 at 09:21 +0800, Changqing Li wrote:
>> From: Changqing Li <changqing.li@windriver.com>
>>
>> patch 0007-exec.go-do-not-write-linker-flags-into-buildids.patch
>> removes linker flags from buildids for not breaking reproducibility,
>> but it seems that this will make go not rebuild when linker flag
>> changes, Refer [1]. So remove this oe-specific patch, and change to
>> filter out build specific path from the linker flags
>>
>> [1] https://github.com/golang/go/issues/63760
>>
>> Signed-off-by: Changqing Li <changqing.li@windriver.com>
>> ---
>>   meta/recipes-devtools/go/go-1.20.14.inc       |=C2=A0 2 +-
>>   ...ut-build-specific-paths-from-linker-.patch | 61 +++++++++++++++++=
++
>>   ...not-write-linker-flags-into-buildids.patch | 41 -------------
>>   3 files changed, 62 insertions(+), 42 deletions(-)
>>   create mode 100644 meta/recipes-devtools/go/go/0001-exec.go-filter-o=
ut-build-specific-paths-from-linker-.patch
>>   delete mode 100644 meta/recipes-devtools/go/go/0007-exec.go-do-not-w=
rite-linker-flags-into-buildids.patch
> Whilst I think this is a good change, I decided to take the 1.21
> upgrade and this conflicts. Would you be able to rebase against the new
> version please?

OK, I noticed that there is a 1.22 on master-next. I will rebase against=20
on 1.22

and send a V2.

Regards

Changqing

>
> Thanks,
>
> Richard

