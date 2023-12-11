Return-Path: <hayama@lineo.co.jp>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90EC8C4167B
	for <webhook@archiver.kernel.org>; Mon, 11 Dec 2023 07:51:51 +0000 (UTC)
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (JPN01-OS0-obe.outbound.protection.outlook.com [40.107.113.132])
 by mx.groups.io with SMTP id smtpd.web10.3570.1702281103719662867
 for <openembedded-core@lists.openembedded.org>;
 Sun, 10 Dec 2023 23:51:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@lineo.co.jp header.s=selector2 header.b=AKR9lTiB;
 spf=pass (domain: lineo.co.jp, ip: 40.107.113.132, mailfrom: hayama@lineo.co.jp)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SR66AXlxBqe1d6Qefzg7D2drYEVrfWe3idyFhxe8e52vpjoazS60fGGZnsvbX1V8diN4a5zHWRgiZ4wKdWblsvVhHRS+udbOCOsdXrTn7+arln5kSJCY1UFgM3q9MKO0AxY/6Fh8PhPAY89C3qKJHud7OEmBor3NS/CBMqKsDGdQKhh+Pqo1+JdMnjHh88dxuKKkifJbxK/PAotyqQcdXhqQPZjKltuyrRsozoomdj0KnOFgfKa1bLyueP+HDzKcmlHUHTUS0qN74g4gvwaYjRB92euUI9j6UWJhRNuTnf3hGXY2e6d8xqurPN1HPtEXa+1gMlwIuFLSax/ZY52iow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RkgXDqg3iCX7q0FrCkktqZngV5ZC71+3i4ikZlqOY2U=;
 b=Cec4KlDcTMQM1mPTzLbiP4fzbeAW4NAgvto597CwTCFvOxaqRPfoVM4+qDETL96fc7i9sdAdUr3As213qnvx63G1bOZo0SU9tITfI3W/5S2vtsnl5PzZ1GdVURLH1QANfhuvjeFh8G7wVoHPlFv4KnUJANBBkx4RIqEPxCqpjVH4ExOyV7LDtAGLkNzC2RYLZds5et/1x7piqIkOG+CucK33droYat5zpeSm5NbZhDU93ZfLPrsJbQQQTjBVYDM6vdgr1w0FXa7q5Rib8SK2z1mjcEFLBAq0+kchBTlcpg2RkEnKO+CG6+dqgbBHxZtHQ0rB21oKxmyO7w7A9Zxp5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=lineo.co.jp; dmarc=pass action=none header.from=lineo.co.jp;
 dkim=pass header.d=lineo.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lineo.co.jp;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RkgXDqg3iCX7q0FrCkktqZngV5ZC71+3i4ikZlqOY2U=;
 b=AKR9lTiBU9Uf/27bZS9ECRt2GkhupGETUw4ChVaYeiqVCa4y/TscVgm4eeDS54nR2zSJMmilwkaWgWdDXfiLpvUOa7GYIxoStexn32WyGr4DyJ31kV/3O+qrsx8sgqY+LOmykp4SP0x5MBLrh6LOeaf4vSAODAZ/uOFl1pX1LZhEWQluECoPoNb7OjuSHJsW8x8YZVEqk7PufvrI1YU58PSNSTNgcu9g3XbuwtoVPYIs/8Qvm0n/f5NT472S1BdcPGInruCpwdJq7F/ZGL7BQ2LIab3VdgNltpn8DLGy3JNrXkgPHS46grXpai/BnZZRyxNEGo7hlFwpyXwl7GW6xQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=lineo.co.jp;
Received: from OS3PR01MB8115.jpnprd01.prod.outlook.com (2603:1096:604:171::9)
 by TYYPR01MB7901.jpnprd01.prod.outlook.com (2603:1096:400:114::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.21; Mon, 11 Dec
 2023 07:51:38 +0000
Received: from OS3PR01MB8115.jpnprd01.prod.outlook.com
 ([fe80::9538:79a:d7:b2a8]) by OS3PR01MB8115.jpnprd01.prod.outlook.com
 ([fe80::9538:79a:d7:b2a8%3]) with mapi id 15.20.7091.020; Mon, 11 Dec 2023
 07:51:38 +0000
Message-ID: <581f915c-39e0-41fe-8258-84739b5ace41@lineo.co.jp>
Date: Mon, 11 Dec 2023 16:51:37 +0900
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [master] [PATCH] cve-update-nvd2-native: increase the
 delay between subsequent request failures
To: dnagodra@cisco.com, openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com
References: <20231208050439.461257-1-dnagodra@cisco.com>
Content-Language: en-US
From: Yuta Hayama <hayama@lineo.co.jp>
In-Reply-To: <20231208050439.461257-1-dnagodra@cisco.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TYCPR01CA0019.jpnprd01.prod.outlook.com (2603:1096:405::31)
 To OS3PR01MB8115.jpnprd01.prod.outlook.com (2603:1096:604:171::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8115:EE_|TYYPR01MB7901:EE_
X-MS-Office365-Filtering-Correlation-Id: 853d3676-7e1f-4d76-82cd-08dbfa1e017f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	7TKQixoARq5+3HuU9CtesNQPB5lT19b37RPqc3ZHqdqPVeeEKUd+Wl+7A6k4Xxm7/QKSUHuB9dAXAuiTqro/jPeeLuUDgV4DkNRmyITSeChUkw8C2lK8xs68KxYMt1TAoORgxvQDduVmviefu9UN0oIhDifbC6RW6bgS+14ik7F2ZgBHq1Ti/peBSo5AqnkqV0KLv0t/tJoRLo4Gsfv1rzB7BSNWx2dHsjUkroCtx+pxUFz0IOCzkHHNkqLdjshkamZGY20pIHz612OSZ5Vljv9SckfhhcP0XCKZLVG6zhXxl72h3jS7eM+qejvwTM+SH5ER9GnN4/ieHXLqxEXrfV7USDwgwJ/MaIbZmF3CrQNyflwQAHqFdAyCdHR8Hs9Y1Eg0+jBMYcdOMIjfLp/9yz4RFKSgLHi5SUwVqrjXdkTZmHiDIEObDX9j08OaMtsydyT6qbnkmjvtHq8gpU+0bg+3I1xAFDm4w34BbJxgAODb6SBMtgnNfdgSYdNTQ1Sv5GjreL9eGHcwvjqm37BOPV1dKpKlEZOWisidddQPa3MXwubbVUIivzCBbc6PXIx6NIvpIuMc8EljD2mEVqCrdsIieSfLQ6iD1amfF3l9UXlYNpVK8dGti/b5r+2PUsi0/LPsozyaQHuJD1VRDBEP6o/DcspYa2nSXcszVdOMfsw/jqmGv5WbEObVCRGQw9NK
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8115.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(396003)(136003)(376002)(39840400004)(346002)(230273577357003)(230922051799003)(230173577357003)(1800799012)(186009)(64100799003)(451199024)(31686004)(26005)(2616005)(36756003)(38100700002)(31696002)(86362001)(83380400001)(5660300002)(15650500001)(6512007)(53546011)(6506007)(8936002)(8676002)(66946007)(6486002)(966005)(66476007)(316002)(66556008)(41300700001)(2906002)(478600001)(4326008)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?aWM5Zk5wT2w4Ym1oMFV3Tm9Fa0JzejZaemZpZ2I0Z3NieDNuc0FTU0NmdDl6?=
 =?utf-8?B?VThkamk1T0tVT1B2TzN6dmhqenZYYy9iUnVXVlR6M2NEV1kzajR5aGQvUWk1?=
 =?utf-8?B?eWZ1QThKbE5yREwwWXpnczVLbjNNWUZaSW0wTi9qWVIveW1vbFdpR3lUMXU5?=
 =?utf-8?B?b0Z2ZDNoTWR1MUF4bEFHdjFCOTNQSXBTTjVsNGdFTEZnejFzNEw3SWUraFpW?=
 =?utf-8?B?c2hmZ3E5alFocml1RERtQ2ttVEJwaUhDcGtCRitqK2cvT3B4TU8rcUZUNjJF?=
 =?utf-8?B?SlB2MXdpVy9iK0hxQXEvUXJjdzZzUGswOWVtRzVNZmJBeTNHTHJ4ZjlRQ3RZ?=
 =?utf-8?B?ejZ0SklQOVp0WlpEV1B4WGpBWE9wdXRHV0dsK2k1akduZFhaVXBwcTUzcFVF?=
 =?utf-8?B?Zlg2L2R3OEI0bzJla0Y1YlZBMXYrSURsVGZxbFhPTThuL1pDdHU1RG9WSWtp?=
 =?utf-8?B?enlxZVAvZWRmTVFlVTJBWTA0MVIyekRCQ3dXZGF3SkMyRGcwWWpoTmdoMGdK?=
 =?utf-8?B?a3B2VHQxZmw2MGU2WXZHbkQzeS8zN1NjR2hmMWU5U1MydXNIQUx6YnNPWWxy?=
 =?utf-8?B?bXAxbkNSTUdIaXhNbjYxaGk3cm84VVlnVkVPaGR1YU5pR2dyVElOSWs2VWlW?=
 =?utf-8?B?UzlPTUErSEFtOVY2RjZoNllQQ1ZwM090aTQ4MWZEZ2FzbEY2L3NjeXRNLzNG?=
 =?utf-8?B?bE1EL0g3T1NUVnpoTWR3bWpUek1MVU8rV3F5TGNuN2JmM09YU1BmVUZ3WGFM?=
 =?utf-8?B?bFRFdlprUUZIazhZTkpzR2E2ZGpiNjhZVnkrSkVkeTBoQVRuc2VOazV6V2ll?=
 =?utf-8?B?bzlBUE5GVDl4VWZYNStyMnBrZFBTL3FpWGlidVBBVDMvNHl6blkrazNobmQv?=
 =?utf-8?B?L0FMSVJMOE83M0xpZGFUV3VKQkRqTTQyY0lucmZxU0dCZDNYaCtlZElOWUMy?=
 =?utf-8?B?VERMMjlwUi9aQ1lEODFBUTdDVVZpM1dmZi9BbTRHcmJKVGJsMXlWRXRHTnM5?=
 =?utf-8?B?ZW15UjlkVTArbitIUHFsczByMS9SOFZES1NxcVFUTStvbXhPZkJ1MUxibndW?=
 =?utf-8?B?NGpPeDd4VDlkNlZVdWh5Skt5RTZ5czA1eHlyMnJCUkZLQmZBL3NiUnpVUmYy?=
 =?utf-8?B?T1VCZ0RmRHJ3YjVCRkg1NXYzbVYxTDk1V1BwaEJwbTYyYzJFU3BEejZJZDVk?=
 =?utf-8?B?V3VJZG5yTndRdnNveEgwUFBZWFJXZUlIV3piOGc0cW5qcnl2SzFvaHhlZ09X?=
 =?utf-8?B?NTlFNDBmUmN1NFpHdDluYkZKTVZvMjVWNDBhbUVJcGxzSmVqZ2hNem1zV052?=
 =?utf-8?B?RUNqRkRFcDB4dmFndXFuRWNsWXMybzVXL3JJWTVETHZSaHg2aXE0a09lV1o0?=
 =?utf-8?B?cHRNdkNwSk5EdWorZEpjQ2V4aTJOTTBRM1BVV3B6NldiTHZuV0lwdVVFeTFC?=
 =?utf-8?B?anlyQnZrRlZxdVMrR2RCbjhrcUh2dFF2V2xZMC9KRVBNYWhUY00rN0ZiSXh2?=
 =?utf-8?B?Tzh5eEhCbThkaUhid3ZYNzVmUjdwMUZ2OE40cjYyVHpMMVBOVVRCYS8waHl5?=
 =?utf-8?B?QlhNWXArRGxrRFBEZzR0SXlIUEVvcnBEbks0VGlZN1FZMWF2S2w0KzZRZ1Qr?=
 =?utf-8?B?WDgwVUFwbEFRUytMMmFJdUdIY2lTUzlGMCtxWUZQNDd3Yk1aaWJiVUI1aHRM?=
 =?utf-8?B?OEV2TlJ1eGNOOFlTSkk4Z3VqMjVENzZRRm8xaDJsTnZjZkZwTE9kNE1oUU5Y?=
 =?utf-8?B?dlFhUVlmRGRySUg1OWNhcWlwa0VZQTVEcWh5UlFibXBIbGJIYlQxajNMenZw?=
 =?utf-8?B?TkU2T04xNHd3ZEFLdWx4eHI2NHVVZTVDMG9hZUN2cFd4d0w4TTVaY2Q5Tit2?=
 =?utf-8?B?OEJKVHlzN2E4ZE93bVBzdG5FZEIzeFNsbkVxczJvclBzeGpXUHlzWEFxN1hs?=
 =?utf-8?B?bW1DaWpBcTVOKzBMZlhuaUxRQllpcjh0cTBRUUdybDdzQmdoTEh4MEplRzR3?=
 =?utf-8?B?anA0RmNPc2MwcENHb1JCOTlBZkRBR216dGRSWVEwS2lwTG5jaU5NWVlHMytJ?=
 =?utf-8?B?MmFQcDQ0TzRrN0N4NWlaTHROQ3o0aGJKSEVOV0J1Z2VIbjJhaWdDRjZlY0Fl?=
 =?utf-8?Q?rtEDSHp01av3lJ0UkVj47QM6p?=
X-OriginatorOrg: lineo.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 853d3676-7e1f-4d76-82cd-08dbfa1e017f
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8115.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2023 07:51:38.5278
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 850e1ad4-d43d-42a8-82ab-c68675f36887
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SWYBnL3l9Qw3hmzR/Ag9QEOmqVZ8VPA00ul6M1dwW+gCn8qyR+/S85eoepdnHRloGfYulH7BXXnsd83TTQkfyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB7901
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Dec 2023 07:51:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192145

Hi,

On 2023/12/08 14:04, Dhairya Nagodra via lists.openembedded.org wrote:
> Sometimes NVD servers are unstable and return too many errors.
> There is an option to have higher fetch attempts to increase the chances
> of successfully fetching the CVE data.
> 
> Additionally, it also makes sense to progressively increase the delay
> after a failed request to an already unstable or busy server.
> The increase in delay is reset after every successful request and
> the maximum delay is limited to 30 seconds.
> 
> Also, the logs are improved to give more clarity.
> 
> Signed-off-by: Dhairya Nagodra <dnagodra@cisco.com>

I was just working on a similar issue.
As a specific example, multiple cve-update-nvd2-native:do_fetch runs in
parallel can easily reach the rate limit. It can be assumed that this situation
will occur if several people run bitbake in one office. (often unaware of each
other...)

I have observed the do_fetch logs and found that HTTP 403 errors are returned
if the request is blocked, probably due to rate limitation.

NOTE: Requesting https://services.nvd.nist.gov/rest/json/cves/2.0?startIndex=6000
NOTE: CVE database: received error (HTTP Error 403: Forbidden), retrying
NOTE: CVE database: received error (HTTP Error 403: Forbidden), retrying
NOTE: CVE database: received error (HTTP Error 403: Forbidden), retrying
NOTE: CVE database: received error (HTTP Error 403: Forbidden), retrying
NOTE: CVE database: received error (HTTP Error 403: Forbidden), retrying
WARNING: CVE database update failed
DEBUG: Python function do_fetch finished

Other times a request may fail with IncompleteRead, but this is clearly
distinguishable from an HTTP error.

Here, we can think of the following ideas.
If an HTTP error occurs, assume that the rate limit has already been reached
and wait 30 seconds to ensure that the next window starts. The patch will be
something like this.

---
 meta/recipes-core/meta/cve-update-nvd2-native.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/meta/cve-update-nvd2-native.bb b/meta/recipes-core/meta/cve-update-nvd2-native.bb
index 9ab8dc6050..34fcc0317e 100644
--- a/meta/recipes-core/meta/cve-update-nvd2-native.bb
+++ b/meta/recipes-core/meta/cve-update-nvd2-native.bb
@@ -121,6 +121,7 @@ def nvd_request_next(url, attempts, api_key, args):

     import urllib.request
     import urllib.parse
+    import urllib.error
     import gzip
     import http
     import time
@@ -142,10 +143,12 @@ def nvd_request_next(url, attempts, api_key, args):

             r.close()

+        except urllib.error.HTTPError as e:
+            bb.note("CVE database: received error (%s), wait until the next window" % (e))
+            time.sleep(30)
         except Exception as e:
             bb.note("CVE database: received error (%s), retrying" % (e))
             time.sleep(6)
-            pass
         else:
             return raw_data
     else:
--

The time taken to fetch is likely to increase further, but the probability
of failure due to error is expected to decrease greatly. Unfortunately, if
the number of parallel executions is too large, this is still not good enough...

I will consider what to do with this patch after your patches are merged.
Since it may be enough to just extend the delay each time.


Regards,

Yuta Hayama

