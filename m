Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1DF3C28D13
	for <webhook@archiver.kernel.org>; Mon, 22 Aug 2022 07:56:13 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web08.15681.1661154966692062986
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Aug 2022 00:56:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=AHS+KiTw;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=523303e571=qi.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 27M7Bglh003661
	for <openembedded-core@lists.openembedded.org>; Mon, 22 Aug 2022 07:56:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=message-id : date
 : subject : from : to : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=xcvCYUA5l+5u+K6RbzOUSigxYYuQ5LyqLd39UO1Co0I=;
 b=AHS+KiTwBnye2kbSWjMDBPrHAOGLghIzoqcXUEIuspQ7naxx5/+PXrMkxWT6AczBBEP1
 KLfW6aKDmgXb4/kFq6d2RnpykRWdpWSbKX9vFs+KVYdCSMd3XbgOVHdNHfq3c7oKHmvX
 iW/1ZomCaXOyCX4IOLmFeGLtEr8MYCPjTfDeJ1k/rE1nOvogB2IIlFGMJWTRr2P5plbg
 jmeRyfhg8z797mYQ2iL8cnLvo+S//xKDI07Wh11tmHhAss6t2h862p+82MJv88dSu9C1
 +qGePUBc12NrPm7NxdqIOfRZcIfbDtu86Hw096P8vMIAhKssuJDbKei0QHhkM6hlqISL 9w==
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2046.outbound.protection.outlook.com [104.47.66.46])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3j2w141q7g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Aug 2022 07:56:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BFM6ytgp2wojkKmkEBkWCh4mgGZrbsCijsOX+Ieg+KTqcEIrduibZCDWEPP/pb1Ev0AW6CVgjZEwq9VGrMdz5EHvdJGeYQ/ZH3MDOZ/Z1nkY1fOOvkPvZfaubdzN7Y0nBoiZYQMylPwNZiKYdZAPhoJwvCmohuyya2By0RNI1d2j+Mh2sUpWCkm9jqv/xkqXPQl8NqpxkFCJiNdCZHD38bPvkxrUarOfpBKxUN2kCO3/ZBb5ZWTHL3M6enTR4g+Zpg6PFijP5G7KjpWmOLKkdN0xG/q3zOCz3v0ndbq4iM+Im6kHzlVxgHdLmRkzphaDAnDvqRCghOO5Hsi43OIByw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xcvCYUA5l+5u+K6RbzOUSigxYYuQ5LyqLd39UO1Co0I=;
 b=MXl56lGS0AmHBhNJvqybUXxxLrGxWLX10DNlr4V9eF7Mn+oJO53tbF9XgP3+WKdd8wiXpQMzPyOfuw9Pz/grhqNeDXdlwEE4iSgfUYYJmCEP7O8xTekorZbzAcT6QIcmvn6SfERkbJc8zTkF7Yz1dCLbMDTWv0mf0OSudSDux4WsC44lYmkiDZKMzW86ndjCYcw0Lc0theKFDSCtno4/iE6kIjIhT684i71nKKXEFhcTgAacKvi5mBN042YK1t0fsPDVADtX6GjJp/PHqkHDQpo9f73D72pd3GIlc06MRWC4izYm5kCmyhYGnYD0Piee8rn7AV60DxGaVC2ULLJXAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by PH7PR11MB6932.namprd11.prod.outlook.com (2603:10b6:510:207::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.19; Mon, 22 Aug
 2022 07:56:03 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::c112:6e86:1bdf:66ed]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::c112:6e86:1bdf:66ed%3]) with mapi id 15.20.5546.022; Mon, 22 Aug 2022
 07:56:03 +0000
Message-ID: <89ab561c-6aa0-6fa1-e1b1-7ebf25f92801@windriver.com>
Date: Mon, 22 Aug 2022 15:55:57 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [OE-core][PATCH] python3-hypothesis: revert back to 6.46.11
Content-Language: en-US
From: ChenQi <Qi.Chen@windriver.com>
To: openembedded-core@lists.openembedded.org
References: <170C51E3D604CDAA.19212@lists.openembedded.org>
In-Reply-To: <170C51E3D604CDAA.19212@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR0101CA0271.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:68::32) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cb9878f1-1ca7-418c-8b16-08da8413c2e7
X-MS-TrafficTypeDiagnostic: PH7PR11MB6932:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	QkDLpN0nuUJgIOqA5MM7ecThh05y5naNH13UXUl0p+kccsD7380PP9Ex/pBnBqR0Pp5T1E8+I5c/gf+iyfxhaYQ73DRI+29fwEthEcuF52OIvhjgbWfxHzEauz76uRBPoPUxIsSELoo6V369B5SH+eF95DlJPiAcBCLkjkSqnQWVJpnVXCacjFBMe0vTMmSN+/qQ9MMI6ooksME6bX2sa/1SFDY3fzDQNMu8z42VSMEJcPW3x7p6bsUL0Ljax3/sccHKawhIicsBR0Z6mS5WHISsbKVR4t0Q8fE7hkUMxL5u1ICn3UTt/XIwE74SdAMVmBGiLQacTXiZOv26r5S0C2cAD97o3sKtO+GR7UPSZSQLUpuparflwQj4TsU1uaePf6jx5asXb43zSSsvtCJ5rmPwJjifb5w/GxAWVylvvi6/fmP4DTHzwb+4RjRbNfZRrhxS6NeqCFPU0w2O6yqdKEaNIc7XqOnArr3kjGE2cdmrhkChnMuRI79zsgBrY2g/GlaLQelaVQOPRCytK81yyxe/UddaBhGC/Hf45ssqJpUbWAxWG29EZMGu0XNMGE6A6tzRg4TD2h1DhMrir/SxRzyIMJrbwCBqpyusc9T8MNnXw4YPab2CLHfJdj4vkiHTeGuBSPq0fO0ODZLHKG4+d6zyzL+FvN8iqianJ0pkRp0b6eTB/spA2r4JiRod1pc8zudrQYJ/4C8Y630p6L0eT41qqnL7+Oy+TQbMqXJj0i1t4sQtzy5JLu+FhTWdTpE/wRo4f/EsHgl0HUO8+a4XtT65wc5MP6r+yyYH8o7Sk/ylgY1qmSTcYBapq71ns0CaxIYuiN7y8dHdI/+lnSvGsPJDPawPQE19UG/ZekhrRTI=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(376002)(396003)(136003)(366004)(39850400004)(966005)(6916009)(316002)(38100700002)(5660300002)(8676002)(66946007)(66476007)(66556008)(6666004)(31686004)(41300700001)(6486002)(8936002)(478600001)(36756003)(186003)(6512007)(53546011)(83380400001)(2616005)(6506007)(2906002)(26005)(31696002)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?L1ZidHlIUTE5VUVNRkNJakVBSnNuME1vZWJjL09XL0xmU2ZFRk1XejV6YUJ0?=
 =?utf-8?B?S1ZoZmFkNVh5Z043ekxCRmtvS3Y2OFdUOWYxMVNlZWdlR1hraHdFLzhUbDUr?=
 =?utf-8?B?SWtWYWVCZnZHVGU2VE9pUmNYaXRMRXRlRFhWeDYwRVY0OGNUbnVzbUljVnEz?=
 =?utf-8?B?aVZLMGVVU2lZNVBWdWdGek5hWjJvYjJDaVdTWVZTSjNxQjhkbSttbTZ3SXlO?=
 =?utf-8?B?K1M4dlVlVjNOOFFYL2JmT2t4alZkYkRnUERyZWhIMEhaSmgrdWFXbXMwYUd3?=
 =?utf-8?B?TlQzNnpoM0hMQ2VvaFQ3U0hNZWZJbGl1Mm1SaHFXRWNGc1BZM1VwdlU4bm9E?=
 =?utf-8?B?NDBhOXF4UTF6Wk5TR2YrYUpFSHVTZmZRb0hrNnBXS3N0N3FtVUFyTE55ai9G?=
 =?utf-8?B?b2NQcmtOMUtuVVB6Z1VDWUtPWXdHamlwb0s1Ti92czRoYnZaemVjWUlLdFow?=
 =?utf-8?B?c0o4TVdLb0dUS211MldMNlRETS8vSVI1OVN5UEVsUFZGU1A5dy9oNS9iTEN6?=
 =?utf-8?B?NkI5bDNsNGVBdFlyU1RVengvVlU3RWNXUzRONkYxNGFDU0Q5eDdjS3hLZ1N2?=
 =?utf-8?B?WWJWY3oyZzIwTXVnMWtVM2x2K044Q2lDZncySnk4VmpCckJ4YUFOWURzL1Qx?=
 =?utf-8?B?UmpaV3pNaTNXVHBjdVp6NWtsbmk2eWhyMFE3dVBQbVVnUllzZUxLdGx0NTJQ?=
 =?utf-8?B?bmFxR3oyMkJDZ2dkWXplT2huUmRoVEg3N2ZDRkxOa0hMNXhYKzBRQzAzZWxp?=
 =?utf-8?B?N1hRT3NsNUFsbWRhSDZEb0hySzJ6dlBscFBFRnkzR2k5RVNmbmxiSmxGWUJE?=
 =?utf-8?B?RmZYT09WNFZPSk5RZlVFTnRVY0FDTkVFY1BYeTVMdWJ5MG9CZkpNMFptWmkz?=
 =?utf-8?B?TTQ3Q3UwY1U2dE5GNGRoR0FaRW5TcWlJWmtNUjZJeC9RVWNoRnhiMEJIaUVC?=
 =?utf-8?B?eTdIUzU5Q2RoY0VhQURmN0dEQkZFSUZXK0Yya2R6OEV4eFRPOG4ybVJDSDlW?=
 =?utf-8?B?QUdxVEJPN2MvZHhCU20ybVFuNUI5ZzhGWERJTTNMNUtXbm9sVWZjbzZpUE5P?=
 =?utf-8?B?MnhISnRUZ0NvaHR4ZnZmVmZQbzBjSnRTQWR1aDI4MDdBb2hzRXF0TkUxQmpK?=
 =?utf-8?B?MXhheEgxZmQyckxhdkRmVGp3ZUJPSlpHdy9iQWpUeWNjRytTTGszaXlPUnY3?=
 =?utf-8?B?RjMzeDlQS010WHNjN085YUNLV05aTTVTcFdHYkQ3dU4vUDdPQkc4VFZoYzI5?=
 =?utf-8?B?T2xRa2wwU3JIOUQvdHM1QlRsbC83eGlwZnppanBlQlhpcUMzY0lrVHRLYW5s?=
 =?utf-8?B?NXRTTzBGVlE2emxNVzRFUGNHYUMrelkreEd6MlorNUhEcFMvSFIxbHhWK3Zo?=
 =?utf-8?B?ZlY2ZHVReXFtUmJwQ2kyTUhVdFFVeEhVMStPOXJ5NGtUV1Jrc210blFxLzYy?=
 =?utf-8?B?NUtKeW94Q3YzNE1PdzRObEpmbmxUNlQvbUtLM0wwblBDcC85TWUwRENYWlYr?=
 =?utf-8?B?TG1idm01OGhydHNwaW1zWHVOWVpQcDhYV3VFY2l4R3N3Y1c5U0N1MGMyM0Jo?=
 =?utf-8?B?bG80cEhJQVpEMkxjV2I5QmlDRXJGWUJ5SUlMTVRTSGFHczRKOVhLZHYvdkVJ?=
 =?utf-8?B?ZjJQcjgvYkFDeENQMGxmNVp4OExHRTRmbjBtcm84a29mY2dBSC9FYVBYc2VP?=
 =?utf-8?B?QyttcGdjUkRLbTZrNnhzK21Ed1JoblFXZTRuLzBFM3RzdEF0d2YyUHpuc1dN?=
 =?utf-8?B?VURlcHBzWVVMQnI0MWYrOFlvdmlnQ1Q0R1l5Wk5XR2d5NGJrS1I3MVRSUEZl?=
 =?utf-8?B?SmR2d21iVEI5VUxRV2JsREtFVUVSQXEyNll2a1o5cC83ek1NdHJiTWl6OFNr?=
 =?utf-8?B?WkxJckRPeW1CMWRjL2prZlpBL2VwM1VQdHRjdkRqN0NmVE5UR0Z1STdNaXZv?=
 =?utf-8?B?M3JVTXA4UXpRWW1jNDRRSC9jTmxxVlJQYjFja2VzY1NuNWNNcDBzUGd4V0lF?=
 =?utf-8?B?YUJGUlM3eTVIWmtaRG9TVEZLeENWUnhkaEJuYWdBNDFDOHdPZGV1dEdValJu?=
 =?utf-8?B?dlFNWnhDWFMwbmdiU3dhZVViN28vdUhFOUc0TUdSTGcraHVibERORDJaY04y?=
 =?utf-8?Q?I5DikPQk9y0GSKRRGBC807/Se?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 cb9878f1-1ca7-418c-8b16-08da8413c2e7
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2022 07:56:03.6689
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 AkWyiz3wXESOwwmXAyl8wUEyDEdregHkD3F15jlvRN4dTzQ1sgjhGjnSviR/g1Q9ICw5nnBg5LYZ+qfoOiVKuQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6932
X-Proofpoint-ORIG-GUID: qgRt8thqQ0jKkRvbjR0dTM_z7O3RvNDF
X-Proofpoint-GUID: qgRt8thqQ0jKkRvbjR0dTM_z7O3RvNDF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-22_04,2022-08-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0 mlxscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 priorityscore=1501
 mlxlogscore=683 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208220033
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Aug 2022 07:56:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169664

ping

On 8/18/22 11:13, Chen Qi wrote:
> This package was broken since it was upgraded to 6.48, because
> it started using 'exceptiongroup' since then, which is missing
> in any meta layer. On target, when importing hypothesis, we meet
> the following error:
>
>    Traceback (most recent call last):
>    File "/usr/lib64/python3.10/site-packages/hypothesis/internal/compat.py", line 18, in <module>
>    BaseExceptionGroup = BaseExceptionGroup
>    NameError: name 'BaseExceptionGroup' is not defined. Did you mean: 'BaseException'?
>    ModuleNotFoundError: No module named 'exceptiongroup'
>
> The related codes as below:
> try:
>      BaseExceptionGroup = BaseExceptionGroup
>      ExceptionGroup = ExceptionGroup  # pragma: no cover
> except NameError:
>      from exceptiongroup import (
>          BaseExceptionGroup as BaseExceptionGroup,
>          ExceptionGroup as ExceptionGroup,
>      )
>
> We can see that it tries to use ExceptionGroup and falls back to
> use an import from exceptiongroup module.
>
> Looking at the https://github.com/agronholm/exceptiongroup, it says:
> """
> This is a backport of the BaseExceptionGroup and ExceptionGroup classes from Python 3.11.
> """
>
> So instead of adding a new recipe for exception group, it might be
> better to revert to a working version and wait for python 3.11 to release.
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>   ...thon3-hypothesis_6.54.1.bb => python3-hypothesis_6.46.11.bb} | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>   rename meta/recipes-devtools/python/{python3-hypothesis_6.54.1.bb => python3-hypothesis_6.46.11.bb} (91%)
>
> diff --git a/meta/recipes-devtools/python/python3-hypothesis_6.54.1.bb b/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb
> similarity index 91%
> rename from meta/recipes-devtools/python/python3-hypothesis_6.54.1.bb
> rename to meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb
> index afcd5e64ef..1d9772d4ff 100644
> --- a/meta/recipes-devtools/python/python3-hypothesis_6.54.1.bb
> +++ b/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb
> @@ -13,7 +13,7 @@ SRC_URI += " \
>       file://test_rle.py \
>       "
>   
> -SRC_URI[sha256sum] = "de63c34309181875e71d0f5d1c1051c9320a1fe0517ea6733af8cedf818191f4"
> +SRC_URI[sha256sum] = "f5c1cf61b24b094355577a6b8fbbb8eb54c1b0216fbc0519af97c46bddf43c42"
>   
>   RDEPENDS:${PN} += " \
>       python3-attrs \
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#169512): https://lists.openembedded.org/g/openembedded-core/message/169512
> Mute This Topic: https://lists.openembedded.org/mt/93097229/3618072
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [Qi.Chen@windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


