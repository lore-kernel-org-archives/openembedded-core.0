Return-Path: <hayama@lineo.co.jp>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E9B6C4332F
	for <webhook@archiver.kernel.org>; Tue, 12 Dec 2023 02:54:13 +0000 (UTC)
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (JPN01-TYC-obe.outbound.protection.outlook.com [40.107.114.103])
 by mx.groups.io with SMTP id smtpd.web11.4506.1702349648717162829
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Dec 2023 18:54:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@lineo.co.jp header.s=selector2 header.b=KS+RjHu2;
 spf=pass (domain: lineo.co.jp, ip: 40.107.114.103, mailfrom: hayama@lineo.co.jp)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Afnxg0lFqVfhuWEM8mCitxYBV0gaejDyvc4Pbh6m1hOapSq8z4Q11pdb2eYibpFCJqYsYeDcj2+GeFjLqfsi+PDwG6olt88X2C9bsBZI/0uUvF/WO7TBl5I7m27WW1/8PkG4SphdGZ/dWMUx7Ug55hSPkMmMGXJ6bkH/8Uf/VL27ojVh3GO40iGk//7SclUQRPcstwCXwUQdwfi2NK9GPBsH2LpDIknVA14IPU/OuC6M2lRkYAhRuVXLNP+kNi4d5qkOnU+1z5YQ2dIxV1AQy72L9w62eiHc5+XFpn6m9P8jbg2EftINFXxiJ6LUJGvKaYfIdeg6dkNUgC31udpI+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VdMG8hzcpewcfBkwqUdm2xN4BoFUkyLC5i8q+xw6/eA=;
 b=DEusAZ+ZHjgPnVBndb9/hvd+UegsMsveJ03OOpdYL7TGgL4NSts3dumCC3Mc+WaWmr7xEqjMrAXWnYAJlv/AJ3I9iRmUYUADJaXTiThX1b6loE+R7TpRIO9SiGiJbtY8QDzQ4Udeo+iU/+L9If1vGAM5CHZVtf4USRh/YOaQNLTb/uswvHGL0nJ1nArNaPRGj3eaxHg4epfJWnVbwkI0G0COkxdjX7YoD6cfH3kjJ10SBabnFxdyy0bOM/VSsK1nfvFlEhCP0xbVa8KxohKIupwj4ADnuBJCCKC/tqBA7zz3TH2lxuBIMTPZuFjrJKrtu/p5Leh3+Xx6RmNR67LWqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=lineo.co.jp; dmarc=pass action=none header.from=lineo.co.jp;
 dkim=pass header.d=lineo.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lineo.co.jp;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VdMG8hzcpewcfBkwqUdm2xN4BoFUkyLC5i8q+xw6/eA=;
 b=KS+RjHu2yaMQDChQhMew2eGSI1E+JSqkFVPy5HhFt/lY3nOKbH35Rfuu6ApmlncDX8Ji/1646yTHSFjkZ3ZVbpAoS+shMYOcX04PFCP8VI/qQPr65PwO0waKgc2R8sGp0Dm1WQRH7GtmdfLqWAzMiJ4wt3FHl1zU+S6UBSxb6auGQ1GdCIj/fBNzB9fS6sxTaBmtAkqnpykBULS6rB7O6VQes1hQLxrD3Up5jTiH3sjcGcv6OAVW/2PdgX2p6er8TjtRKNunnGGIbdWhTNeUO4JvXnzDXB7y0k4WgASV69RIUEpde9iiW4QXLJJK5tC1cme7951rlOTD7cX2LAj8Fg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=lineo.co.jp;
Received: from OS3PR01MB8115.jpnprd01.prod.outlook.com (2603:1096:604:171::9)
 by OS3PR01MB10138.jpnprd01.prod.outlook.com (2603:1096:604:1e3::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.21; Tue, 12 Dec
 2023 02:54:03 +0000
Received: from OS3PR01MB8115.jpnprd01.prod.outlook.com
 ([fe80::9538:79a:d7:b2a8]) by OS3PR01MB8115.jpnprd01.prod.outlook.com
 ([fe80::9538:79a:d7:b2a8%3]) with mapi id 15.20.7091.022; Tue, 12 Dec 2023
 02:54:03 +0000
Message-ID: <3fd7f96f-4b1d-41ef-9d5d-679297598e53@lineo.co.jp>
Date: Tue, 12 Dec 2023 11:54:01 +0900
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [master] [PATCH] cve-update-nvd2-native: increase the
 delay between subsequent request failures
Content-Language: en-US
To: dnagodra@cisco.com, Yoann Congal <yoann.congal@smile.fr>,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Cc: "xe-linux-external(mailer list)" <xe-linux-external@cisco.com>
References: <20231208050439.461257-1-dnagodra@cisco.com>
 <581f915c-39e0-41fe-8258-84739b5ace41@lineo.co.jp>
 <a11d36d5-5151-404d-8065-f68cb2eadd19@smile.fr>
 <SN7PR11MB6971B5B0381A29B57317419FD48FA@SN7PR11MB6971.namprd11.prod.outlook.com>
From: Yuta Hayama <hayama@lineo.co.jp>
In-Reply-To: <SN7PR11MB6971B5B0381A29B57317419FD48FA@SN7PR11MB6971.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TYAPR01CA0084.jpnprd01.prod.outlook.com
 (2603:1096:404:2c::24) To OS3PR01MB8115.jpnprd01.prod.outlook.com
 (2603:1096:604:171::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8115:EE_|OS3PR01MB10138:EE_
X-MS-Office365-Filtering-Correlation-Id: 4de9ce9d-59f7-4fb0-73e0-08dbfabd993c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Iw1Mzf/NxGPiOSsfWzi3yXSzKTHVJKaMHh6EdMyExe2p8jjZppu8nRCkvkVNCkAfALDJpvPU84JWCmZfA9ID65ldVi714C6dfo9z+eLph0XfxhjBg2NwAUir4Q3E8o4KZCMLH7WBCWg/QPWJaRQsKYqOrRv2KGa1golLRgcnVfBWiybHhF6osKOBUh7ODxICZJRxSx2LHzIxemX4ksPmnlXRs1uRDjxqOHYe9DnQJb5BQxMUUAhpGO21wO22dpnd90Li3twAK//GOJT/4OffEZkRzSWhFBikbLzyN64Ct77iyUQKNZylwXEqluWBhCHyBco/28m9lrYKWPmiWWitQ3zdWOVkqc+glUOki0yp7sOAnPyeG7ZKEDjM9aHONaivjE2F/dgN6czunDFkGHf45DxtdarPv1MGU9FMtZmrlIQW8M+1g1BtYZwN9N7EYF4n+6dvfGy8A0+8xYRRjIaoEDbqpxz5y0RpEvqRpcXG6Z8UW6wi3T5WSLONkb9FmVl+yQYl+R45AFU+YwyE4oY+x9HrOzgWZozbzXCwlEvocxA+t9Kgl9Pq1iPYdbcCiZK+DrsDHAFTpHJmGanw01hbeOQh+/MW+SKlxojI35h40ki051vita3/aqE7F/+tyv7DDznrXnsfm4Spp+X4YlGg9w==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8115.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(39840400004)(136003)(366004)(376002)(346002)(230922051799003)(186009)(451199024)(64100799003)(1800799012)(36756003)(53546011)(6506007)(478600001)(2906002)(83380400001)(26005)(6512007)(2616005)(6486002)(4326008)(8936002)(8676002)(5660300002)(15650500001)(66946007)(110136005)(316002)(38100700002)(31696002)(31686004)(86362001)(66476007)(66556008)(41300700001)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?bTV6UkMrQ1R3TUNDUTNrQUVwdTFaWjQ2cDkwc0xhV2hBTEExam1wWUxkRkp3?=
 =?utf-8?B?YmlYMTZYSkdzVHZJMCtMSW1sSnpOQ1E2ZGRWdVROWXVCbjdTeWtHbnhjTFc0?=
 =?utf-8?B?NWFIaDRLZ1pla0NaRE1qR2grUUg2ZGhscllSbWsyQWNxWmZsR1doQThIc2lH?=
 =?utf-8?B?aUhDdE5QQXRxSEI5aFJmQzkrZTRBUnF4b3AvSHpiY2hZV3hsdFJMdXR2ZzBB?=
 =?utf-8?B?MHF6SUliMDRnbzJLL0tzaXVzNnIzMHQrRnFtNThidWFsN0FXZXV6UEcxa0hE?=
 =?utf-8?B?UzAvT29aMDNRRFVsZ0pwZzlRUkFzOU8zaHJDSmRhLzBVZVRkNkRxdlVlZW5U?=
 =?utf-8?B?QThmTVNFUjlXMmN4d2NxQkpJZkgwRzYzbE1hYjNSQ0lNWGNDRzBDZm9LTkJh?=
 =?utf-8?B?U3lxeGtkenpxU0h1T2tJNTUrbUVCekFIYStmdHZXQmxWbmZtek1XNTBKaHFy?=
 =?utf-8?B?N0xVYmd2UWt1and2Y1RuS08wNmVjbFdpd29DNVUyWFRZWlpRZGJrb2hsTmdI?=
 =?utf-8?B?emFWY3dNd2hIVWNxbUlkbXIxbGVKT0VQZ1A0c0lSd2liY3ZKek9OemdPWU5L?=
 =?utf-8?B?VVd4RGtTTk16YTBsSVd3OTZJaFIxMDJaSWQwZ0EwdklMZFJrdllLUUZOWFBv?=
 =?utf-8?B?K0wvSmowYWFqaXJkTVdJVXExVmFINExJVzE2ZFdqN2N2bmRidmY4WDJ5ME04?=
 =?utf-8?B?cG5BaVFqbHFkSGdDZk9JeHFveEE5T25OcExMY2Eza1NGRVRCc2tMR0FoeGdw?=
 =?utf-8?B?MnN1UHVBQ2FDUWdWQTVwRjc3R3FHMXhVcng0VjVScEhRb1FpTEpEM1pUTXdY?=
 =?utf-8?B?Nm14aWpYLytIRG04S08zeE9rUzY3b0p6VFo4WnZJUnBMaVF6MnozUFYvby9z?=
 =?utf-8?B?ZHY2R3VXMGlLYVZXVlVnR3JDUWhyL2JPUWY5RmNZQ1hULy83b0tteUZXSmRr?=
 =?utf-8?B?Y280YWxnVXVDWERFNkt6M2pqVlVLQnMvRlYzWGZGU3JxM1VFNklZZWZLMmww?=
 =?utf-8?B?WVEzb3NKWmw2Qng0SkluQXpLU05ybGt2bmVtQzc1UkoxVW5XL21nSzMwbCs0?=
 =?utf-8?B?cUs4Y2k3N0Z5U29KSUpwVllzU3JIQ0dHUklCOTBjSjdGMmpxdzdpNUIwejZI?=
 =?utf-8?B?aGg5VkkyRjBvSEhFWTN4YnRlWnRraDMrWXRUUy9LaFpubGkrL05SNDF1Qksw?=
 =?utf-8?B?U0VyelpDaEg0UVNqQy9FN09zTk5FSjQ4LytmMEt2L2RWL0Z5NlRUYVRVUmdq?=
 =?utf-8?B?YStMSytTSEwyeEFHNG42ZG9DaVIvTWlwcUNqb2dVYU5YdG5lUW8yL1RjVmNt?=
 =?utf-8?B?YktvTFVESWxrZUFFemJmVldtSVBtRU1VVkt0aWNSQmQ4NmhFc0hJOGw5bTlk?=
 =?utf-8?B?M1JLSmNOaGxOV0ZqNzhDeUpEbGJNTmk0YzB6ZVpuWnozVU5VYXJlRy8xVDRN?=
 =?utf-8?B?M1ZQcC9FNk9IQXVWSjBzYUd1RFUyQlRWSEdIWG93dEswcStXb1RtSW5rdE1S?=
 =?utf-8?B?VGRWOHEzYTF0WVc3WTJtSzIrYUVyUmxlYXRxbG1KOGZzT3UydW13SkdrbENW?=
 =?utf-8?B?NmtPZTJBMWNRYmxRM09mZDh4eDk1RHZmUXVNVU03ankrTk1kY1A5Ykkzdlpz?=
 =?utf-8?B?YkJRdkFNc2VKSUg5b1VRUWxHdlpzc3pyalhmNEVDT1p2RnY4citTWDl2WUVM?=
 =?utf-8?B?SFlSMkxPRWdMSGNtSmlIM1FNMFFxK25NVTJkY0s5a3M2elpjQ3BRdXlIZ24w?=
 =?utf-8?B?ZnhDWnVRSmtGYlpRZ1RyOUhNSnd2OWprcWpmQ1JySHlPQndmTTB5bCtueUE5?=
 =?utf-8?B?azE0eW5PaHhPdEtiLy9YZ2pjMXlBbThNOWsveVgwL1pHSW42OWJ6Z0lSM0Fs?=
 =?utf-8?B?ODFhNzNmQmRFNE5YN09Ycjl4ZXAveXJPbitzTm9VNlVzdXpuZ3RQcWs5UVA1?=
 =?utf-8?B?RklQZFBQbi80RnN6VkVGcGNoM3FzdGJLdmJEajdMd2VXb2FueUVkalRuQ0hx?=
 =?utf-8?B?VDBPa1ZsRmdYVFhFcHlMNlZHb0s0SXRpNGhQNXpsRVJoZFd4YzluSmtaMmt4?=
 =?utf-8?B?NDdWcXQzbUpLSGtpUVJRbFpFdE9FaW9wdk1TbTM0Y0dUWjhyOGIwRzZxVXYv?=
 =?utf-8?Q?UfpF1ImGQhf1gqEgUBU9gof68?=
X-OriginatorOrg: lineo.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 4de9ce9d-59f7-4fb0-73e0-08dbfabd993c
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8115.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2023 02:54:03.1193
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 850e1ad4-d43d-42a8-82ab-c68675f36887
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: temO3L5F8bMGL2+svgp5ayhYOT3bBApJMIpsk99/WXjI22euINd+jQSX+/A7HDYG1MVhsT7g4646jtean3Wtmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB10138
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Dec 2023 02:54:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192188

Hi,

On 2023/12/11 19:28, Dhairya Nagodra via lists.openembedded.org wrote:
>>> I have observed the do_fetch logs and found that HTTP 403 errors are
>>> returned if the request is blocked, probably due to rate limitation.
> 
> As per my knowledge, HTTP 403 is related to a permission issue rather than a rate limitation.
> I have not seen an HTTP 403 error, anytime. Can you please help clarify how was it generated? Is it reproducible?
> I tried removing both sleep delays altogether (and without API keys) to try and generate an error. In that, I couldn't generate any errors instead, got the response with a 15-20 sec delay. So, I guess it stayed within the rate limit.
> 
Yesterday I also tried to fetch with sleep removed, the result was the same,
no error of any kind occurred. Perhaps someone has not read the documentation
about rate limiting, so the server is putting a delay before returning a
response.

That is, I think a single bitbake will not cause the issue.
The HTTP 403 error should be reproducible by running multiple
cve-update-nvd2-native:do_fetch at the same time on a single PC.
Here, I noticed that yesterday I could reproduce the error by executing two
tasks in parallel, but today I had to execute three tasks in parallel to
reproduce the error. Somehow, the delay that may have been provided by the
server may have become longer.

I think you are right that HTTP 403 does not look like reaching the rate limit
(As Yoann noted, 429 would feel right). The HTTP 403 error returned may be
because the request is being sent from a single PC, so I will try
cve-update-nvd2-native:do_fetch on three different PCs. This would be closer
to the actual use case I have indicated.
>>> As a specific example, multiple cve-update-nvd2-native:do_fetch runs
>>> in parallel can easily reach the rate limit. It can be assumed that
>>> this situation will occur if several people run bitbake in one office.
>>> (often unaware of each
>>> other...)


Regards,

Yuta Hayama

