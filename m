Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5C0BC46CD2
	for <webhook@archiver.kernel.org>; Fri, 22 Dec 2023 21:31:18 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.33395.1703280670175694784
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Dec 2023 13:31:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=o9fdsJ2Q;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=0720a8e353=randy.macleod@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3BMLAtUa012870
	for <openembedded-core@lists.openembedded.org>; Fri, 22 Dec 2023 21:31:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-type:message-id:date:subject:to:cc:references:from
	:in-reply-to:mime-version; s=PPS06212021; bh=XzYcFTECpQDVex9/nFe
	jDEeGuve+m7f079w0XxuGZcU=; b=o9fdsJ2Q+/i/VPgN7u7DU9TEBbIacNuv+ZL
	9OB0kpKHh1JjGEnk9Ak0fiZGI4dTf/z6af9C75J45vAdQ4u/HNK2JJwu+hjKjf9p
	ZUC5a5K6cLTryJzh0AcfEfqFBG6am6+sQiI+uIsedxNMXKG9p3lu33/htQoJjfcf
	U7Fvyyde6oQmSmiAA+PVSViczdjaA4VheKNnMyRr6DycDecLdrQMdpu+IVRwbcjl
	SIYItdglrnMVRlFnISeV52tILB8VrSaktAxjHQCwI2hxlVduc/qg8Y/6odSvcEAE
	DiBQKzeSK8pQmBQ2zMZCsIDWgurValb+cyMPFWLt1N+WAyTXrtA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3v113xg7r7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 22 Dec 2023 21:31:09 +0000 (GMT)
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.24/8.17.1.24) with ESMTP id 3BMLV8jP002541;
	Fri, 22 Dec 2023 21:31:08 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2169.outbound.protection.outlook.com [104.47.56.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3v113xg7r6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 22 Dec 2023 21:31:08 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ReIc1YMGYHaByJGwcNGmudKjDwi4CPa7AWpW93nNqsucCbgXO4mhOk/2pA2ln12Ao0+kT3v5ogfkIvGn1ri6hWTfp5W4xOgFBK5AgxOYgDtnV4WIkA/gEYsvjB+ov5IpHvOwVpLHt16vLkqnpIgyTdjkOsijmkxkFpfPf8JNlEnSmPsjRe3ntfT+q+wN9nHmYYvmcSTJpFgJhF8sjv/iM5zR6yycIeYtIttgtdn31EAEcu1zvuX88fn+Q23tP2dYE0MvdxvkIg8M1v1ZCfiHGLkLGLePQFi33G0FHi3igc5phVy+aZuMseIRGfAAXEmMhrMLGKPGWbHkuTlKQWe2jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XzYcFTECpQDVex9/nFejDEeGuve+m7f079w0XxuGZcU=;
 b=BdDjc9TgCUVT++NdE2RAN2dcO3IEv3Ntl832td/XSq6fGeJAnQzOmwxz/Zv3c1gwprxeJW5TdfhscA2NYAYJcjiC43X7jWWuBNzMHCHUl4QPyF73k72vCKdC32e+wIVx0BaVRXzxbpK0FgdvmDOejq7mbl4cJ7xdh/wT9/ibTXnCMrWERGoWNahiZE8JPXp6L6Sed9bCBgeATr7HyWybnG5hvgJ+BSmiS4hPgRcffv2R2bCoIzMnbL8prVzZzzWNDO14ERpifXNX2/FX2xb6mD0jO0NQwqk6h/haNOAsWN3oBidXWefGT6oE6QVCxEyFvw83ayY7iPH1Fmp/BY3m7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by BN9PR11MB5385.namprd11.prod.outlook.com (2603:10b6:408:11a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.21; Fri, 22 Dec
 2023 21:31:05 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::b0b6:b188:9e9a:2c2a]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::b0b6:b188:9e9a:2c2a%5]) with mapi id 15.20.7113.019; Fri, 22 Dec 2023
 21:31:04 +0000
Content-Type: multipart/alternative;
 boundary="------------cMyEJ1qxPMBgEeT3JL0EuTve"
Message-ID: <c2e5182f-de0d-4de4-b37f-403838bf013f@windriver.com>
Date: Fri, 22 Dec 2023 16:31:01 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [meta-oe][PATCH v2] uninative-tarball.xz -
 reproducibility fix
Content-Language: en-CA
To: oecore.mailinglist@gmail.com, openembedded-core@lists.openembedded.org,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Robert Berger <Robert.Berger@ReliableEmbeddedSystems.com>
References: <20230630131430.5051-1-Robert.Berger@ReliableEmbeddedSystems.com>
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <20230630131430.5051-1-Robert.Berger@ReliableEmbeddedSystems.com>
X-ClientProxiedBy: SJ0PR13CA0112.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::27) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB3994:EE_|BN9PR11MB5385:EE_
X-MS-Office365-Filtering-Correlation-Id: 68264903-a5c4-4b6d-7be9-08dc03354d60
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	n5Bv+b4MBjiSfS58UUUVTeqHDl/L/x2pN3wqiZywGXhhsSyTymPYxJDyKy0T1wruHGSESgOBQ3+4KNTi7glkZEvh0cJT6CUqYLSNg8VHbT9eNpMRQRmz5MZR2pz5l6O8SligTLqiiWbvj0RpX74h7lN0yMi/cDXC8lvj9CZyGFkEc0duHwJXmsY2CnEYhdAAhII5TK7Fttxx1LvonBjegFyoleBhbhdCmesL5I2q03YYNxFrMhslw50NegBWjbfrcWB+8JIWSuRmkdT9jH0laqlm2jCqU/vQAe/yEZuayKD/A9aJnaTcxpfUxWeMCuP1cII7RCBL6MMH7hx5TdaPYa73i9tyFa1MTjLvXmADXJo2lFxKOf586FbyHOsgfTySmr3Tu3ipxPhpCPRLzPZ6hhmFLngs8Qt4ihuX2E3o9ZybUbZ6huTiD4N2J0OJELNl4jjfLsVUq0XLoWK9L4Q1L5fdtI2T1GUoznI/gT/PxTm/UiyBnqgUkre9RxMujl9zyGj9ej7PHDLODrBWe5rNGPgzEI+HHPElbI+cMqh29wLLu83EQDAa7bJMCSy8UMdEJSAg8jQ4bZo8r4W/tSv6sCi4O+jTikBS2CTCfL2Lm4bqh+H3prAAhcEJSPzPd4Gf
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(39850400004)(396003)(376002)(366004)(136003)(230922051799003)(64100799003)(1800799012)(451199024)(186009)(4326008)(8936002)(8676002)(66899024)(66476007)(316002)(66946007)(6916009)(36756003)(2906002)(31696002)(86362001)(41300700001)(66556008)(38100700002)(166002)(5660300002)(478600001)(33964004)(6512007)(6506007)(53546011)(6666004)(966005)(26005)(2616005)(83380400001)(31686004)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?eGozZURIdnkzeU9QdkNJZkwvcitSWERBTTNsOERoUDVOVGpoWHQ1Y1NBcWNI?=
 =?utf-8?B?OHlnYy9CaVYrVm5rY2ZEL0s2dTZOazRsMGppUXBqZG5yVFAzTEwwN3o5U284?=
 =?utf-8?B?WFpBajJRYmhoRmpBaG9Hazlpd0pSSXpVRXNlNHNNbGh4RmI2c0Z1Q012RE9o?=
 =?utf-8?B?ZzFGbWloRHhnTVBzV0FIcUJQeVRGV0xoZlN5SzNPZFhud2IrUDBXZkVIbFJ1?=
 =?utf-8?B?ZHNML0ZydUowNUQxMnRKYmMrejR2dE5OcjI2Uy84ZkN3cjFKMzNHa3duL0kw?=
 =?utf-8?B?Z0pZYVAwd3RyRGlwS0lRb3NKS1laZzBzTGY4QzV0Y1lrclU5M2UwMElFanMz?=
 =?utf-8?B?WVI4SHhTcEZmLzcrQW1rbXp4akFNemlCQVVZVFUrUmVDWG5ZNEhTeitUZnZr?=
 =?utf-8?B?RW5yOEZ1aXFwTkhmOERxaFp5VHhrMnlyQUZjUXYvN1ZieUU2bGtod3l2L2t1?=
 =?utf-8?B?aE9wc2VUN3J4YnJBcWlZNENzTmxqOVhDMUdwcEJpUk1OenozTThwUVpNeDFI?=
 =?utf-8?B?NlR6REZBUU4zVUNhT2RWN1MySHRyVmwrSjh3dWc5YmIrdUdjUnNFQ3BRd3Jy?=
 =?utf-8?B?b2crcWt4NDRMclA1Y3N0bEZEQmxEVGZPOHRxMU5Lc1RqY2pqanpIMmdEUVU3?=
 =?utf-8?B?MWk5aFZEYU5udUJUV2daWUliNlhSOUpNTGRPZXJmdmVnZ05sbkl5cll2Qlgv?=
 =?utf-8?B?NDJVdVFnM2xlK0p4WkxlZDZocjZQN0U1SkppVWJTOWc3bzdvNk4wTDlBR1Ra?=
 =?utf-8?B?U2RVVFpFTE44SFl2T2Vac1IzbHNUSEttVm5MTTZVdWVoUDdBN3VwTmw2Q3FO?=
 =?utf-8?B?aDdFS21QRzdMemxxVitORVFxQmRQVkpSaUZVVFBGUXZoVEpvVTJVbnJpWC9L?=
 =?utf-8?B?Z1J3eU92TWgwZFVQcmxMVGljNjJycDVxVUx2UHBhVHVtUE9FOUhmNWNoeE1r?=
 =?utf-8?B?Y01FcElON2pYa1ppMGp5Y0RhMlN5b0tVa1MxOWFhMXJZZG5kendURDlrZVZW?=
 =?utf-8?B?eEc4VnJoRHI5MTlhWkV2S1hlc2dwR3A3cHR2dVRWanBRQWhBUHYzcFlaaEUr?=
 =?utf-8?B?MDUwNzN5RXgwRXc1L0ViMjI5VUNJY0N6Vy9MQXN4Y003bXRiMmNrUGk2VW9i?=
 =?utf-8?B?OGwyeCtvY3Q5Q051UjdxVXE4MnNIQkxMd1h6Q293UFZCN0RkVGwvNTZpbHY2?=
 =?utf-8?B?NStYbTFrOXkrN2RpOHNQQS9vZFV4NU1Vc0NwbzNFYnF2a1JhMVk5ZHRlWlhM?=
 =?utf-8?B?dGtCTHhDdWJWY1NTNFJxTDBZWEp5ZHA0TTkzYTRVRHZpUU5kYTIwYlVrZzJp?=
 =?utf-8?B?ZWVKTGRHcXVQNGlJczhZSDBrc3JRaWlKWXo0SFpTNFdXL0RMcmI5R1VvU01y?=
 =?utf-8?B?NFpyejg1ZVVaZHBMU0IvaTVUbXZldU9FaUJhQk00LyszKzNNOHhMMTI0SXBW?=
 =?utf-8?B?S1JhRTV6QjJqU0kyUnFHVHRXUktScFJBaC9FUWhDVitNOXcwRFdja3FEblRl?=
 =?utf-8?B?ZUtaL0ZRcTFMc00zVURlRHBVRG1mMEtDSUEwaHI4WnhOQWFYSDl1cXA2dXZw?=
 =?utf-8?B?UEZMdE5acmdybkV4emUrbVZQaWFsMUR4V3d3V1RmdjFXNmRMck11aXRxaGds?=
 =?utf-8?B?RjlUczZuMkVibDNDNUVsRDFtL295ZW4venp3MTAxUHdoNVVIUXZvNFN0QUlI?=
 =?utf-8?B?RzZ4QmxybHFsWjRrV3lNWVhTaVRzZ3Q5STBQcnhTQTBMQk1MeWc2aWYrWWV5?=
 =?utf-8?B?UUZFY21NMHVrSFQyZENEdGVKN1BETGpqUUpmdXg3dTJ5ZVhCa21pc0xXVnlL?=
 =?utf-8?B?YnVFQ3BFM3Y4eHdSZ3lTN0Z2Y0cwK3MwenFMeXZERTZrVHN1V1J6MHFJNW9l?=
 =?utf-8?B?VjBKZXFseVE1TU5rOWFNcE5PTS9jeFo5S2wwTTNyL2h1QU92YVh2d0c3RHU0?=
 =?utf-8?B?QU5CNDdZZWRJMS9sS1BTYnYyMis1VnQ3NzVSdStZZkJOcjZyOFdzbERqZWtk?=
 =?utf-8?B?SkxDWlVDdlhHdnhDMUFkQm5sTlpPa2pxaGFtTFN6RHU0U3FscDVRaVh3ZmxB?=
 =?utf-8?B?NkFWOGl3dzlsbkh3NUMrY0t6bzA5OXQrQjZUa1dHVlJQdjZHN0ZzbkU2TFRt?=
 =?utf-8?B?OVhwcmpsV3YrbngrcDFiRzdRang0TkNFTENSKzlqM3lIUTlwYi82VnNEa3ZX?=
 =?utf-8?B?TWc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68264903-a5c4-4b6d-7be9-08dc03354d60
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2023 21:31:04.7507
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8l6fSXxUcDt/LQP2rIWT7MBGrzaXog9/ulZYDlE+nBvD4mxTXOw5zS43rE16RHTtt8RHC+X/H91vZlFlVVRcAHpQcdaWtQCVu/TdN1jP9IA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5385
X-Proofpoint-ORIG-GUID: yt-WlyIgK341njAE6BqOnZ-3eqKn17AJ
X-Proofpoint-GUID: ZsvVP7zmt-IYD0AI9PIuanmfr661ETL2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 mlxlogscore=999 malwarescore=0 spamscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 lowpriorityscore=0 mlxscore=0
 suspectscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2311290000 definitions=main-2312220157
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Dec 2023 21:31:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192878

--------------cMyEJ1qxPMBgEeT3JL0EuTve
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2023-06-30 9:14 a.m., Robert Berger via lists.openembedded.org wrote:
> see:
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=15148
>
> Signed-off-by: Robert Berger<Robert.Berger@ReliableEmbeddedSystems.com>
> ---
>   meta/classes-recipe/populate_sdk_base.bbclass | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/classes-recipe/populate_sdk_base.bbclass b/meta/classes-recipe/populate_sdk_base.bbclass
> index b23ea26d40..24db703534 100644
> --- a/meta/classes-recipe/populate_sdk_base.bbclass
> +++ b/meta/classes-recipe/populate_sdk_base.bbclass
> @@ -285,7 +285,7 @@ python check_sdk_sysroots() {
>       dir_walk(SCAN_ROOT)
>   }
>   
> -SDKTAROPTS = "--owner=root --group=root"
> +SDKTAROPTS = "--owner=root --group=root --clamp-mtime --mtime=@${SOURCE_DATE_EPOCH}"
>   
>   fakeroot archive_sdk() {
>   	# Package it up

Ping.

I think this patch was just missed back in late June.

../Randy


>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#183694):https://lists.openembedded.org/g/openembedded-core/message/183694
> Mute This Topic:https://lists.openembedded.org/mt/99872409/3616765
> Group Owner:openembedded-core+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub  [randy.macleod@windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

-- 
# Randy MacLeod
# Wind River Linux

--------------cMyEJ1qxPMBgEeT3JL0EuTve
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 2023-06-30 9:14 a.m., Robert Berger
      via lists.openembedded.org wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20230630131430.5051-1-Robert.Berger@ReliableEmbeddedSystems.com">
      <pre class="moz-quote-pre" wrap="">see:
<a class="moz-txt-link-freetext" href="https://bugzilla.yoctoproject.org/show_bug.cgi?id=15148">https://bugzilla.yoctoproject.org/show_bug.cgi?id=15148</a>

Signed-off-by: Robert Berger <a class="moz-txt-link-rfc2396E" href="mailto:Robert.Berger@ReliableEmbeddedSystems.com">&lt;Robert.Berger@ReliableEmbeddedSystems.com&gt;</a>
---
 meta/classes-recipe/populate_sdk_base.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/populate_sdk_base.bbclass b/meta/classes-recipe/populate_sdk_base.bbclass
index b23ea26d40..24db703534 100644
--- a/meta/classes-recipe/populate_sdk_base.bbclass
+++ b/meta/classes-recipe/populate_sdk_base.bbclass
@@ -285,7 +285,7 @@ python check_sdk_sysroots() {
     dir_walk(SCAN_ROOT)
 }
 
-SDKTAROPTS = &quot;--owner=root --group=root&quot;
+SDKTAROPTS = &quot;--owner=root --group=root --clamp-mtime --mtime=@${SOURCE_DATE_EPOCH}&quot;
 
 fakeroot archive_sdk() {
 	# Package it up</pre>
    </blockquote>
    <p>Ping.</p>
    <p>I think this patch was just missed back in late June.</p>
    <p>../Randy<br>
    </p>
    <p><br>
    </p>
    <blockquote type="cite" cite="mid:20230630131430.5051-1-Robert.Berger@ReliableEmbeddedSystems.com">
      <pre class="moz-quote-pre" wrap="">
</pre>
      <br>
      <fieldset class="moz-mime-attachment-header"></fieldset>
      <pre class="moz-quote-pre" wrap="">-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#183694): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/message/183694">https://lists.openembedded.org/g/openembedded-core/message/183694</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/99872409/3616765">https://lists.openembedded.org/mt/99872409/3616765</a>
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

--------------cMyEJ1qxPMBgEeT3JL0EuTve--

