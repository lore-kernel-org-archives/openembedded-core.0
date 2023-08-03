Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEB3FC001DE
	for <webhook@archiver.kernel.org>; Thu,  3 Aug 2023 00:45:34 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.4204.1691023533117655240
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Aug 2023 17:45:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=duGIhp0m;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=75795fa799=randy.macleod@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 3730faWE005049
	for <openembedded-core@lists.openembedded.org>; Thu, 3 Aug 2023 00:45:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-type:message-id:date:subject:to:references:from
	:in-reply-to:mime-version; s=PPS06212021; bh=MkJpbcANVjCxRhOhBux
	Wn+L3j4ieack3wFopc/zRPiQ=; b=duGIhp0m3btpvH+afPJcQGSegICbckM/E58
	cGrQkk/0NuLtiib8a5EIwOBZIEhOYjjf4w0DjW8YtJ+F4IB5r0jZXhPGLaTnfON1
	qnkn0s6c7lYzvAX7qwmQF7PskJPO+VEtlyHjatXjmUEZf5B+UZppS66aOj2oUlTa
	2xl7dxlVoh6LbOFG3NMforqAd8VcfxaFv1ONFUtphgqdyP4TliGtSvSOhZ8pL6xY
	s8CjzCPnHh/vTkbU436zMHfeu+GOr+Hgnlw7TOXZjAahl4dBlYzqCEidSXNjZnvf
	FHFasaUBVyIJMJ5pejhxwThiwSXI+hLW08Xq7fV2sf6V4TYsb7w==
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2044.outbound.protection.outlook.com [104.47.66.44])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3s4sr64b1q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 03 Aug 2023 00:45:32 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZCZXivmjqd5FAvEKaGCjJCmrCIzghSSXgo1NsaqvzjGQsFOK2uFKIbP4WMiipSyz+Z037by16Qlvqb187k3NKRsTN4iOBNEFT/+rtXbJgJDvkLg/Tj1GW5xMPjivmGBQ6vOGIS0je+ffr9IIeHuJvpRS5ctMtKI4fu8dSxGy//ocqkE6uVGacvHluQfj0ajE79k/Sp7xk05dCDxR6LndsRw3j+PFzglS68EPYo+dtt35dcMXuSVNB+IcjZj7cd51BNw8r60vs1YyRY3EIjzpyMbsjLs6m5gyKE0Grz/zktsvFz0+/nfQed5HQ5YJC6DbePBzapMEYLdLlqUA9NGhAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MkJpbcANVjCxRhOhBuxWn+L3j4ieack3wFopc/zRPiQ=;
 b=KlvXEQZzwXYZ6WRRiezIJmOEaMi8SuH5ElVvR93mn9nO5HzpAUvT1/aUGSbWZzNnqBGHfw1+06gRAizDFVl7Z91PGXJeMBK5O3o4ERb1NgkipEUajLxvYVgXu5hzPjgqMRsAOLTly4fOBW1e8/wbnzcCU5IVfUS9k0fxULosVVacbb9TjL7PBdjRNuS3Y5HnTe45RGuzaiqeEumyQ48kYZJjziTW3J5iDtPtsbq+2O2eETt7E3aFcGi0FZK7E28xWKG6AbbRfHicfODrCQOYlw4+xdkAwgX6sE7jWWWd1sLtHEU7lAMemZesYl6AGI8qoztvAqg1+M+3wTpgRGSSLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by DS0PR11MB7189.namprd11.prod.outlook.com (2603:10b6:8:137::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.47; Thu, 3 Aug
 2023 00:45:29 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::144:140c:a640:f799]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::144:140c:a640:f799%7]) with mapi id 15.20.6631.046; Thu, 3 Aug 2023
 00:45:29 +0000
Content-Type: multipart/alternative;
 boundary="------------xKQQaYjZnqahindwvh0uUT2o"
Message-ID: <09448132-5fa3-0f6f-ed2c-ac3ae52e9e04@windriver.com>
Date: Wed, 2 Aug 2023 20:45:26 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [oe-core][PATCH 1/1] runqemu: add some logging control
Content-Language: en-CA
To: joe.slater@windriver.com, openembedded-core@lists.openembedded.org
References: <20230802233626.3642612-1-joe.slater@windriver.com>
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <20230802233626.3642612-1-joe.slater@windriver.com>
X-ClientProxiedBy: PH8PR15CA0018.namprd15.prod.outlook.com
 (2603:10b6:510:2d2::11) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB3994:EE_|DS0PR11MB7189:EE_
X-MS-Office365-Filtering-Correlation-Id: 22e89a24-762c-44c7-974c-08db93baef85
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	YmbA2bZIqMHO6YIVCaNcZkp3dk1V/W0x3H8GSLZjpGCvMEtFfF/z7D7Tz5yyXR8rIckaM2uZtbMxrqxmEXZNoWL4zPqsAxsQlo1JNEeUbTf6/KU/UjR5bgAlIektIFuwq9DvktOnatY5IE8MygY5UAycWK8N5fJH53XLIqHiNzrBJoPBhoBpkU3jyFjKk3CtXH5sPX9Hd0MDvW6akCINrnJDRvs5I/8ha7FoKuk+0Kpb9YdAGzpehxJH11t1suGxiFNjeJrYnORlN0TezPVu7P/ALdDH9dXIRQJspppFht4bl7fn11wMGkLHhER7KN4UBJd6cUBy+JdNl+0e9F2Yj65/BIHpuMbpuwmPlQIeNNqyvi05O9mdoyDapO/6FWfbx5Ia3ckD6Ss8iXWQ/Pt96O1tOpHT4xtFRxBTDk73SqTwKSx1jYz/1sgpH9Qbc0oqHBSRk1ge0y1YCW4KSs34aneYC4EZkRrJpB3wf2Ks+8aX54Y3fXrq3BBVTCAJ3Nd59L01twEkwaw/W2DfPg4kaq40C7GkLQdUHsItI3IQ6BIs8xP+yk2WXLGw5t43jz73+8kb1+spbwrGLbeyTVhnvM4CqCVR/0cFNjHuYVZcQfdFQI7RSGCUQc6rlf1E0o693xyHtmr2wuzHuJJrvdDBBg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39850400004)(136003)(366004)(396003)(346002)(376002)(451199021)(2616005)(53546011)(6506007)(26005)(186003)(83380400001)(316002)(2906002)(66946007)(66476007)(66556008)(5660300002)(41300700001)(8676002)(8936002)(6666004)(6486002)(6512007)(33964004)(478600001)(38100700002)(36756003)(31696002)(86362001)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?N2VUNHZONVhqNWoyTEE4R0NwT1dBRHd0SFZNaVZmejEvaExqSDZHYkR1NjlV?=
 =?utf-8?B?QWlhamNtWFlUMDVHS0IvMVJxWWoxc2hEUlNQL2RpRWk3ZWQ4TG95MEVKQXhQ?=
 =?utf-8?B?aEtRUlUyc2tqZmg0Y0FoUUxDNFpWOGxsV3BPNVIyWGJFS3FaRFZCcmxCMzM2?=
 =?utf-8?B?UUk3VUJaVXRCTW45RndnVDg1aHdmNUdsLzdSL29TbFlPSnhuOFBDdFd0ZEYv?=
 =?utf-8?B?YlpkSGJxalJZVFJDMEhlTm1WcGVTUVpKTktXekdJQWxkOW1BdnpqUHJQQSs4?=
 =?utf-8?B?a3Y5a2tqVlVzcHhVUVJBWXFsVnIwSnVVbTBoUk9oOW1oUkRqMmlIbHExZ0xT?=
 =?utf-8?B?OWJQWkh4cExTWkczKzMwamxQV3dDWi8zc1FncHp6WkNhczZUVkpqQU90bkpR?=
 =?utf-8?B?Z1lXSDRGck9qQUthajNYdU1kL1FleERrcExDYVhtYTh6S2ErNVNqRk0wT3dR?=
 =?utf-8?B?a0NWQThtcHU0aEt1VlQ4Tkt5QTJ6NmFzZzdQM2ltemRpOFNjTWJGNWpZdHRr?=
 =?utf-8?B?V3NyeWgrNWVEOGJkSGlGcWNjMjFrQzJhNFpRbFlnUjI3My9jYWZ2TmJGODJw?=
 =?utf-8?B?eWx2bitKM21pVjBkMzY0enNwbGxseFdZQTZmbDZXcTFST1k1Z25mOU1UTHBJ?=
 =?utf-8?B?MEFLeGsxTHJRdEJIV3JlRmtvYTBpYUZEbzdKRGxDZzBVbzlremh3UXdXKzh5?=
 =?utf-8?B?RlJDUlF5UTRyeFVQam1STnJwaHhKekxIaFZ3aG5XUmlBL015K2ZnUmxxL0dH?=
 =?utf-8?B?MzRQV2tneDNva2Jidjk5MHYvTGNaWEN3YTVxdFRLZURZaUl0SW9UZ3VFK01j?=
 =?utf-8?B?aW5MTnczd1RUM3lsZ0ZndkFrM1hZU25NdjQyUHdyZ0NZc1lmOUcxNERiNmxa?=
 =?utf-8?B?Ly90U0ZrZUZtME41RVJYOUk1RlZDN1JyQklIalY0NU5lcE0relB0R0dVUFg5?=
 =?utf-8?B?T3g4NmFMbjB6dkNGMjlQeHJoOGhrZm96WDVHUmxYcm9sdSttSVBxTTQ0eVpw?=
 =?utf-8?B?SG5rZEdlOHNZZ2ZlWGwwUWpzODlmKzBldnRaRHNseDlTeW41bHV2bEFNSzdu?=
 =?utf-8?B?cGtuWVh6ZnI4d0ZvZWRySStLakxIRmU2KzJ1bDlxTUhlR0YySzYyN1hlRGdT?=
 =?utf-8?B?Z3c2UHdUQkdlMFlnQjJNUG9aNjJFVXBTSGpWRE5Gc0FrOHFjSGFBMkxvU0Nh?=
 =?utf-8?B?QUk4cjdlWkNGOVBDMWJKU1FEOVEwTG4zK2ZLL2hOZEpTTSt1a2R5NTdIUGpl?=
 =?utf-8?B?VWlEMnMxVEZod1lJUk9uem1ZVnNmY0M3bzlTNlFjbjhxcFBqbXU3Mi9VL0o2?=
 =?utf-8?B?TzBHNk9GUG5jYzB6NlJieHQzdnNiOGRkWlJ5TGxJQWhkdlZOZFNROXhPSlVE?=
 =?utf-8?B?WEt1eitOSTlwNlYyQWRzYnFyVnROcCs1UHh4WkEwL0c1ekVOSHBKcmg4ZzU0?=
 =?utf-8?B?R0NoWDBiYzMxRkxVZ1FxRmtrNEd6ZE8wc3RQSDVsME9FZGJhYWNuKzZPU2JV?=
 =?utf-8?B?VjBpalJzTTRENU4zaFl2OWFrL21XV2pkTjVmTk84R2dvQVRzT3hWekhiSnNH?=
 =?utf-8?B?US83eFg4UE5oRTNqSjRSTkpxNUxyZXhEZjBaUm02SFhIRzg1RlozazJNbDNG?=
 =?utf-8?B?OHdKUXE3eGxFRzZUaFMwUTZKQmdEMG9IY3l2cEl1L2RKRHNkRGtrOG8vNnhq?=
 =?utf-8?B?S2lIRWhWeHIraTVjVS9VN01iOE9jS0Y3Z01MbWtXTHpJa0puMHc0NTJRS3dy?=
 =?utf-8?B?bVZSbHdLRTBBbzFEbldYRjA5ajduaXFGMDJmRDYyeFU5MHdmcDBsYTZnRE9z?=
 =?utf-8?B?aG9XWEpVSW5iQXVLeUE5Y2tiUVFrUDA5QWl2YnBJL0N6ZUEyRllQMUs2d3FQ?=
 =?utf-8?B?R2ZYaTB0cDZMaEFVYXFVNU5WenlMUlA0VFpJeGZDemdySVIvNnJ6bGVhZStJ?=
 =?utf-8?B?OCt2bTFYNXYxQUJreThQUmxIeU9PMG96WmNYNjVGdEdRUXhZNDAwbWNIR0pP?=
 =?utf-8?B?U0RGaTVhaTJwTUM0Y2hYcHlDRGZHMkoybHhhNkdmWDVQZDh6RkNja2JYaXJF?=
 =?utf-8?B?S2RGTFcyb0MvM2NQeW1XZHZLczNiUXk3RUdBUzRIeTByWDY2eXo3clJuK3lo?=
 =?utf-8?B?UVJWSXdPRG1EUk1DRjR1VU1CamNoU2JUTU0wOHJSb08rZHdIMVNvaWNneUtZ?=
 =?utf-8?B?Tnc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22e89a24-762c-44c7-974c-08db93baef85
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2023 00:45:29.7813
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x6/OSdsi6IepFH/ACTG0r7eukr3mbHwNqUnnh00FM1pWZSj9El651cc9d5UiCaFSVPY8qMDjOkl8fKt9VzwP3mK3NsaqkHWRs/WEoQuJ2s0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7189
X-Proofpoint-GUID: _pUCr5nOYog5uYwN5iokD4REkL2OvCj1
X-Proofpoint-ORIG-GUID: _pUCr5nOYog5uYwN5iokD4REkL2OvCj1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-02_20,2023-08-01_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 lowpriorityscore=0 spamscore=0 malwarescore=0 suspectscore=0
 mlxlogscore=868 priorityscore=1501 impostorscore=0 bulkscore=0
 clxscore=1015 adultscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2306200000 definitions=main-2308030005
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Aug 2023 00:45:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185445

--------------xKQQaYjZnqahindwvh0uUT2o
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2023-08-02 19:36, joe.slater@windriver.com wrote:
> From: Joe Slater<joe.slater@windriver.com>
>
> Use QB_LOG_FILE to log to a file, and QB_LOG_LEVEL
> to set the base log level.  Example values -
>
> QB_LOG_FILE="runq.log"
> QB_LOG_LEVEL=DEBUG
>
> Signed-off-by: Joe Slater<joe.slater@windriver.com>
> ---
>   scripts/runqemu | 16 ++++++++++++----
>   1 file changed, 12 insertions(+), 4 deletions(-)
>
> diff --git a/scripts/runqemu b/scripts/runqemu
> index 5e6793d44e..bea164d041 100755
> --- a/scripts/runqemu
> +++ b/scripts/runqemu
> @@ -36,12 +36,20 @@ runqemu, i.e. `runqemu /path/to/my-image-name.qemuboot.conf`\n\n %s" % message)
>   
>   def create_logger():
>       logger = logging.getLogger('runqemu')
> -    logger.setLevel(logging.INFO)
> +    try:
> +        logger.setLevel(os.getenv("QB_LOG_LEVEL"))
> +    except:
> +        logger.setLevel(logging.INFO)
>   
> -    # create console handler and set level to debug
> -    ch = logging.StreamHandler()
> -    ch.setLevel(logging.DEBUG)

Better to keep the log level the same or call out the change in the 
short/long log.

../Randy

>   
> +    # create a handler and set level to debug
> +    try:
> +        ch = logging.FileHandler(os.getenv("QB_LOG_FILE"))
> +    except:
> +        ch = logging.StreamHandler()
> +
> +    ch.setLevel(logging.DEBUG)
> +
>       # create formatter
>       formatter = logging.Formatter('%(name)s - %(levelname)s - %(message)s')
>   


-- 
# Randy MacLeod
# Wind River Linux

--------------xKQQaYjZnqahindwvh0uUT2o
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 2023-08-02 19:36,
      <a class="moz-txt-link-abbreviated" href="mailto:joe.slater@windriver.com">joe.slater@windriver.com</a> wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20230802233626.3642612-1-joe.slater@windriver.com">
      <pre class="moz-quote-pre" wrap="">From: Joe Slater <a class="moz-txt-link-rfc2396E" href="mailto:joe.slater@windriver.com">&lt;joe.slater@windriver.com&gt;</a>

Use QB_LOG_FILE to log to a file, and QB_LOG_LEVEL
to set the base log level.  Example values -

QB_LOG_FILE=&quot;runq.log&quot;
QB_LOG_LEVEL=DEBUG

Signed-off-by: Joe Slater <a class="moz-txt-link-rfc2396E" href="mailto:joe.slater@windriver.com">&lt;joe.slater@windriver.com&gt;</a>
---
 scripts/runqemu | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index 5e6793d44e..bea164d041 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -36,12 +36,20 @@ runqemu, i.e. `runqemu /path/to/my-image-name.qemuboot.conf`\n\n %s&quot; % message)
 
 def create_logger():
     logger = logging.getLogger('runqemu')
-    logger.setLevel(logging.INFO)
+    try:
+        logger.setLevel(os.getenv(&quot;QB_LOG_LEVEL&quot;))
+    except:
+        logger.setLevel(logging.INFO)
 
-    # create console handler and set level to debug
-    ch = logging.StreamHandler()
-    ch.setLevel(logging.DEBUG)</pre>
    </blockquote>
    <p>Better to keep the log level the same or call out the change in
      the short/long log.</p>
    <p>../Randy<br>
    </p>
    <blockquote type="cite" cite="mid:20230802233626.3642612-1-joe.slater@windriver.com">
      <pre class="moz-quote-pre" wrap="">
 
+    # create a handler and set level to debug
+    try:
+        ch = logging.FileHandler(os.getenv(&quot;QB_LOG_FILE&quot;))
+    except:
+        ch = logging.StreamHandler()
+
+    ch.setLevel(logging.DEBUG)
+    
     # create formatter
     formatter = logging.Formatter('%(name)s - %(levelname)s - %(message)s')
 
</pre>
    </blockquote>
    <p><br>
    </p>
    <pre class="moz-signature" cols="72">-- 
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------xKQQaYjZnqahindwvh0uUT2o--

