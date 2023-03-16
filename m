Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C15D3C61DA4
	for <webhook@archiver.kernel.org>; Thu, 16 Mar 2023 00:02:53 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.985.1678924964274616176
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Mar 2023 17:02:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=YBzft8td;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2439aa34d3=randy.macleod@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32FMwMnr003955
	for <openembedded-core@lists.openembedded.org>; Thu, 16 Mar 2023 00:02:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=content-type :
 message-id : date : subject : to : references : from : in-reply-to :
 mime-version; s=PPS06212021;
 bh=J9zURFKkJb4V1+viGl/qSwDkSpH2jUUDQtcEwoG8W8k=;
 b=YBzft8tdVhas35ntDkMHGWEn2fWU+h4TG06TDLtJjYjeQiNF5Yo/jNt+PdG2fYmM99KI
 BI3VGgT3D2kg6RJbS3VE+H26rA3n+zaFq3GWs/enmHyteKiPF4nr8HGiYpYcdJ5EK3y/
 nBVN6GsSFLbZltWUnO+Lmn6wbYf8Oi1cxGFixd4ssSHjsKaRDQucFU6Ngbs67EwUV5ZP
 VkPG0d1O6WxHnt6/Fpc7+M/u9VJ8QerT2vvEXOTaoTYB+0jgFCWBUW1Gijg7IAmB/cc6
 eCihzbWS62+NKH0YlQRNDTqCaiyHeUqiTvHAz/8Fn0n6Slo08Ht1OPmT23s6ubESf2tQ Pw== 
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04lp2040.outbound.protection.outlook.com [104.47.74.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3pbq1h81n6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 16 Mar 2023 00:02:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=My6i+qeUDQhB54N0OWebVwX5pi3PLN5XWaQJn3Vl0jPm1fH1y/cZSo8XeVI1yqyGTtytncvnquCfZ+m7OJyu4y2x64cMa50szPIHQyml/HiWck0okd/WZrVU1v6AAumxazg23Mi5f3H6yXkkxOLobDPpSLfIPm+tE865LlfmSxtggIB7pC4+flnRzFFEY3Vj5y++CUvZWXsai/IZmdWOnma7p5ANpaTkGb1+i4yvvoEGjXix0cACZJg3j5/sPkBDe13vP23SPKA18D9JgN2cnJhlXwALc6TV4bqkR89NstbTAE+0KK8gIdKHn1naiErt26Z+63nFtxxBShLm1EOEOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J9zURFKkJb4V1+viGl/qSwDkSpH2jUUDQtcEwoG8W8k=;
 b=fkxqWtmpdglJyC8Hyo1957yXyPv68oVOkeEddhhH418mhXDkEuAFMYGQMlAqE9XETxjAJuc+b0ytNUG5l3WxuToFTXGFhMLe2srj44PnMXbyaNJlFC1rOHkYpfnX3/zEo0WFpyoeAoiRCqiaZsZ9NuF6tTek+MKineSpVO/Hf6IZIyaFPbeTgeVCOVxbQq+P980ADOfv6Xynx52VFc1mvGshiDfjUA4qXcEZPD/mAAqpAg3HK9KUUmBfaZkj2DT2Ye7F8x6P6QK/P8sWvGnCazf1oQIhgcBm3FGswvm+aSeoDn+sqQGJkD+WE4VHkSqLAeu2d5cVcx/tBuPMqRNVkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by MW6PR11MB8312.namprd11.prod.outlook.com (2603:10b6:303:242::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.29; Thu, 16 Mar
 2023 00:02:41 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::ceb7:f166:2f0f:4f67]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::ceb7:f166:2f0f:4f67%6]) with mapi id 15.20.6178.026; Thu, 16 Mar 2023
 00:02:41 +0000
Content-Type: multipart/alternative;
 boundary="------------KIFNhXwGp04hxZxvNtIujyAR"
Message-ID: <7b2609b8-5834-1639-3885-388e3f9c3cc2@windriver.com>
Date: Wed, 15 Mar 2023 20:02:39 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [OE-core] [PATCH] openssl: update from 3.0.8 to 3.1.0
Content-Language: en-CA
To: openembedded-core@lists.openembedded.org
References: <174C7E5950269FC6.10695@lists.openembedded.org>
 <174C7EF34675A6EF.8829@lists.openembedded.org>
 <174C9C60B65DBC68.8829@lists.openembedded.org>
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <174C9C60B65DBC68.8829@lists.openembedded.org>
X-ClientProxiedBy: YT4PR01CA0254.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:10f::9) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB3994:EE_|MW6PR11MB8312:EE_
X-MS-Office365-Filtering-Correlation-Id: d31ee2a5-1256-4055-1826-08db25b1c2d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	zbEcLz/WHec93NlJtm4y24/lq+fkS62iL900xOdMuZ+cag6FYkenUxsI+RaK8/S5ufiq7XmziyJV6RSaY4+D5nBOSRTc4YrhxPdio9Bu9q91s9Qir7Q+UrCHA7A2ig/B/yU0LtsYq8UaGR/rZ4M5vYgb5cVd6JXXyov6xVmkPok/x9bYtH2AW4KmjuZDLXFrymdP8/JsyWUA609bo45IiwU9UUTuHG3Kz9mAvUsW/7Nzpz1Ekp8UPIqrz46/5X7RCW9p164M2ipAyzIIZwWnKF3FQVBARyKJdkxdryvZd46xan+Be1HgsqWkD+bFfZ6Pl33Ye5KocFYCodhkHQtHJl8r02PDAFbOklqsTEJhJapyiebDqjSyNe/q82/theX29M69lJqxmt6uV5uxlVdZXAVTAlJBLlplaRxJ2HPSNfpyYfx6fJKOTQ0VMwbMqY7dIlJGkVl4Rx2HkQT41wUR4C/XadGSnEZObRPiwUEwO/+pfleibDMIca3AgFBnCh7aTiuH9oXAq2m6yenbLb8FQt7yCKhVw/NCdyMPq47ykA8b9gkJ0XYWWfQRjmyttPu+SORjADyOaZwQfLLrO94Seeaipah7bnCg4gGAsBwRiEmsXlr2a13fXs1qy3JzXZsvgQg7gXIY/bkJMXxMu1iU4QmlK6Y+lRrucEr55JESUilBtUKfqv3UCcg3bxOQXONUchvp56/RoRUJb2dUcEtKtT7MTVrnpMmCRCaPZf7N9LI=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(39850400004)(366004)(396003)(136003)(346002)(376002)(451199018)(38100700002)(31686004)(186003)(2616005)(6512007)(8936002)(86362001)(26005)(31696002)(6506007)(41300700001)(5660300002)(166002)(2906002)(53546011)(33964004)(66899018)(66946007)(66556008)(66476007)(316002)(6916009)(8676002)(83380400001)(478600001)(15650500001)(36756003)(966005)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?aHNWSkFOMDYrajNoQVF4SlhkRm4vV0hSa0l6YjcxRkEzd085aEZzV1hTeXl3?=
 =?utf-8?B?aXhHTUswa1RwVTRJSURreVlQeTlkZmwyclptbU9sSGJpQUdFNlh5SnNqMHVz?=
 =?utf-8?B?Ui9pZzlheW5oUFNINkpSMHZ0dlp1ZHdVYWZsZEZ4ai9OQlR5UGRyT2Vwb0dj?=
 =?utf-8?B?bWFtTFBwRjVTNjM2Snk0cEl1S1dpYzloT3Z6WThaQ2hRRHg0R09DM2xoR1E3?=
 =?utf-8?B?ZkJMMzdBb3ZpaVdvOUphSGRnYlNLaCtudG9vZjR0R0R2eVY0bWRhMWVWK0Vz?=
 =?utf-8?B?UnRSY0FyT25CTHZEWGVzT3pnTWRFT1dZRjB6OWxiMEN6S0NObHp3VStGb0Iz?=
 =?utf-8?B?RG01cFdoWU9sQUtFVFJ5Nm9XRm5KbHNwV0ozNVc3WGdsZ01UcWp0eUVBVHdI?=
 =?utf-8?B?eVk4S0ROM0krWmtmcEdsV09mekNsNFppT09YUTVpTGhybjRrRGJJQjJBVTAz?=
 =?utf-8?B?M2g0OUNhcTI1MVhYQ1lTTnlaR0VCdkhGV1JBWUl0eFVwQ0UrenVOYjJqckNQ?=
 =?utf-8?B?YTFRTlZ2MElaUExDUU55LzVicXdrZEJ1Y3hvbGxUZis0MnMweGNkT3ZzMk9N?=
 =?utf-8?B?ZHdPSGxMMFhCMkY0cUlZZXVwNDhGOWZxYzJLMVpqck42NWV4aElXL25WUnpG?=
 =?utf-8?B?ZlpWUWtESnh1cGVGekh3YUlGTEJpTDNzTnhLaUdIdmwvUzg2VVE2TG5ZU2NM?=
 =?utf-8?B?Qng4aEVhYy9TS0lnWHlReUJIenJtVjlkdy82UEVON0ZoRG52ZXRlQ0FrWHBv?=
 =?utf-8?B?TTJlSmxadm85M1E3bk0xSm1iYm1tNnZ1SSt4Unc1bW1wakxydHN4dkkrYTR0?=
 =?utf-8?B?VUYydk41M3M5Mi9UbmhqSnpxaE1SYWIvc09FaXIvODFSM3NLSThPbUhTRUlH?=
 =?utf-8?B?VjNNN25uNGFwSElKOGlaZVl6L0tDL1JnNTBRSnZDSmRSRkcyUTh3UzBMVUpI?=
 =?utf-8?B?RzJHRkFmanZlZ0FBd2ZsUnRtUFpMRU02anZOK0JXWUp2bVUxbnF5Z090anF3?=
 =?utf-8?B?OU0yZ2xxZGExVkFLK2E5MGNpQ3NNTS9WTm1PbUw3ZzY2NlI5YjNZMmpqR0p0?=
 =?utf-8?B?MWw4cCtJdWxhVUxYRXZPeU5PS2hoc3pnOHF6WmNuMTZHMmdicVh5OEp2dlZN?=
 =?utf-8?B?Mk1jSnlnbkFybmFNNHRkZ0hVMGlLQkRKZDdpYzMrNEw2WHltVVh5TVl0NU5V?=
 =?utf-8?B?RnlneEpOVlowSjBCcExUK3krZXNhd252eWxJbnNUUm1WQW1IZHhFQk5HQm1N?=
 =?utf-8?B?NGJYWjNNMG92MHZEVzdzeHdST1hjdjMzSURHUlFaSG5Cb2YraTkzZm9wbFBP?=
 =?utf-8?B?ZkVoUEFyUEtiV3N5NGhleGllMWdyYjF1K1psbzlGMTU4bFVXeUlIZ1lXT1NF?=
 =?utf-8?B?aW1mdDluY2w1bUJ6S1pUakt5dFZGUGZ5bVlkajNzeWxseGZYMzZ2cXNTQXlD?=
 =?utf-8?B?VHRseVlJMGxVeFRnYWZ4RVJXM0JjempHRTFSUjZnbC9mZ051Uk9XS3FtQVpo?=
 =?utf-8?B?bkpMN0U5Y1M1eEVMWXBES0dJbDBuZ1FTTFg3TkdITDBQYWhnUnlJRHp1MXIy?=
 =?utf-8?B?WEVsVFBkNS9LYlVNYnl3a3MwdzNPOENPQW9rNXIyd3dNWnl0b1ZzMmNxelJm?=
 =?utf-8?B?RHRYTWE5S3RxYzZDNDFkVkFBWWY0aXlqUmlheTc5NjY5K2xOaVBGNVBaZEo2?=
 =?utf-8?B?ckdZcGxTZkpxUzJYK3dPSHRGT0tFc0szSGJlYXU1QVlENnpQQWlaekZlVjhr?=
 =?utf-8?B?UEZnRFBNMG9TM1NxTzJ6d3NUNmV4Rm5LSElXcHVjOUFJamtjaGphUHV2emdR?=
 =?utf-8?B?Z0ZjclVQa3h3YUE0ZnQxNkREaHhLdjJZUTBlLzM1M3EvNnZMbmJlbXVvL0Zl?=
 =?utf-8?B?SXR3VXdHMllOVXFQSkg5eGZlZ0JSZjJRRWZFTGl5c2paaTdPMHN2bnczR1Zw?=
 =?utf-8?B?NTdXbnVySnljUXJzaGc5ZzRQNUxieW9BTSszSEFpQ1NBcW1wbzhXWGtEZXRl?=
 =?utf-8?B?UytOWnFHRmFncEoyZ3cwbjd3Y0pZeWFwMkJ3Z052c0YwOWJEbXBiTXBMbDNo?=
 =?utf-8?B?azk1Vldockg4T3NzZ1dhd05GSkovRWRORmROQ2RPbEtjRFV2OVFUbXlvSXdX?=
 =?utf-8?B?U2luaHFkbW1rNEJaOEJLMkFqMFoyeHFDRC9kR1lZZ3dIb1B5TTNoaXpORDVF?=
 =?utf-8?Q?CmI6ABI/Gh+o7SaJZjJNQuk=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d31ee2a5-1256-4055-1826-08db25b1c2d6
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2023 00:02:41.3650
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +6ScafC8e2TPqD0a2Ke2K7va1xR+nX5lUDYi5D86rpfojhmuWoGOLHQ39fke2sqhkuED/ANRJ4/u4EPGjm6ZyewWbeyJ2WMmAnJyRmw9gMc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR11MB8312
X-Proofpoint-ORIG-GUID: W2cPEc4cZbGZlYCvX0upaHdEsm1dYonZ
X-Proofpoint-GUID: W2cPEc4cZbGZlYCvX0upaHdEsm1dYonZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-15_12,2023-03-15_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 spamscore=0 clxscore=1011 adultscore=0 mlxlogscore=634 impostorscore=0
 bulkscore=0 suspectscore=0 priorityscore=1501 mlxscore=0 malwarescore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303150002 definitions=main-2303150196
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Mar 2023 00:02:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178663

--------------KIFNhXwGp04hxZxvNtIujyAR
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2023-03-15 09:58, Randy MacLeod via lists.openembedded.org wrote:
> The ptests all passed or were skipped as you'd hope and expect from 
> openssl.
> Results below.


The autobuilder shows that the updated openssl isn't reproducible:

https://autobuilder.yoctoproject.org/typhoon/#/builders/117/builds/2552/steps/12/logs/stdio

I have something more urgent to deal with next so if anyone wants to 
pick this up,
just say so, so that we don't duplicate effort.

../Randy


--------------KIFNhXwGp04hxZxvNtIujyAR
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 2023-03-15 09:58, Randy MacLeod via
      lists.openembedded.org wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:174C9C60B65DBC68.8829@lists.openembedded.org">
      
      <div class="moz-cite-prefix">The ptests all passed or were skipped
        as you'd hope and expect from openssl. <br>
        Results below.</div>
    </blockquote>
    <p><br>
    </p>
    <p>The autobuilder shows that the updated openssl isn't
      reproducible:</p>
    <p><a class="moz-txt-link-freetext" href="https://autobuilder.yoctoproject.org/typhoon/#/builders/117/builds/2552/steps/12/logs/stdio">https://autobuilder.yoctoproject.org/typhoon/#/builders/117/builds/2552/steps/12/logs/stdio</a></p>
    <p>I have something more urgent to deal with next so if anyone wants
      to pick this up,<br>
      just say so, so that we don't duplicate effort.<br>
    </p>
    <p>../Randy</p>
    <br>
  </body>
</html>

--------------KIFNhXwGp04hxZxvNtIujyAR--

