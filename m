Received: from NAM11-CO1-obe.outbound.protection.outlook.com (NAM11-CO1-obe.outbound.protection.outlook.com [40.107.220.56])
 by mx.groups.io with SMTP id smtpd.web10.3229.1619491513307313245
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Apr 2021 19:45:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=h8+w1TGJ;
 spf=pass (domain: windriver.com, ip: 40.107.220.56, mailfrom: qi.chen@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=buytsRygZ9dPlzcKWHiSlywKV1Ue8HBoJsiEV3OXq70Z+mAgeVVbLu0rwv3AKRxL6Q58jOpi4Gm6UeRKlBvrt3KxZQiHRx/6iVtgdOddWFZEFSExEq6BNI8fcYnsJNUsxX+Ak+9DbWfOHyxRz7UwxhQRQLhsTK1MtuyT2UtmVDkh4JAMvjIn93bI36Gqs9YzbViXUJ1w8SpD+MHY2N+T59tbKcd//PtjoEhxi6CTkAbOA/RRkTP4J9ap+Mo75LDvm1ahV3UIgbEbvzD9uzgml3Ev8s0SbnA+F1aCvgrGID6J79SmuAW7Qoj6x61wLnvDONAoTaATT/mDCeLGTrSOlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W3vezyXgei1vGjC1OY+CahWsxaCi/dGvumxsMmQpFW0=;
 b=UswYF80PiNuVtM7MT5vdvDG1p9UYU1mqXlM46qBR0jq9elWrD7EVszE3MJv074mlG7bJg1XZMzFkaR8oF5hCGubgc7dWYGlHwIsN3DBkATDEzlWIBOyqsCsK/jzJ8Hn8iLh4itk48jlz/4iW3kvPsWcuERinqpYcaSAlefEBEoJitjVwIy91KZ1w1vk5Ewh5Kh1qF3dF2gz+46L+3DxAzH5bSzlDkWfH2oHiQUcLfyNMCrsepDBfcFvOVoAVh8AlPvdy6SMNovISt/YkilPMslt3iRJ2T2lWwMIu3UpUIHuqwwqk/5kR7sb/hQuDESig0x+lzK/Tj93heab3ECtA9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W3vezyXgei1vGjC1OY+CahWsxaCi/dGvumxsMmQpFW0=;
 b=h8+w1TGJvDFNOzCmGiu06cgERvIkJD0WasZKYa7IgsiqatAc95yqgkZJadEz9pj+kEEis/rhc8vqEJByQtlP5RVWUfNeN9Xy0BB7lhGNjT7+5Ug5Pl3mREN+zQbtgEQQYex2LJo3rPBTK+68fPA4+zpgBXlR+VhdB7yMUfB1Nn8=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BYAPR11MB3480.namprd11.prod.outlook.com (2603:10b6:a03:79::27)
 by BY5PR11MB3976.namprd11.prod.outlook.com (2603:10b6:a03:187::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.20; Tue, 27 Apr
 2021 02:45:10 +0000
Received: from BYAPR11MB3480.namprd11.prod.outlook.com
 ([fe80::5091:f32:2586:572b]) by BYAPR11MB3480.namprd11.prod.outlook.com
 ([fe80::5091:f32:2586:572b%7]) with mapi id 15.20.4065.027; Tue, 27 Apr 2021
 02:45:10 +0000
Subject: Re: [OE-core][PATCH] oe-pkgdata-util: ignore SIGPIPE
To: openembedded-core@lists.openembedded.org
References: <1677842B2B4EE882.30395@lists.openembedded.org>
From: "Chen Qi" <Qi.Chen@windriver.com>
Message-ID: <3ac27cf1-cf76-8a04-3d55-c2d99622d6c6@windriver.com>
Date: Tue, 27 Apr 2021 10:53:45 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
In-Reply-To: <1677842B2B4EE882.30395@lists.openembedded.org>
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HKAPR03CA0019.apcprd03.prod.outlook.com
 (2603:1096:203:c9::6) To BYAPR11MB3480.namprd11.prod.outlook.com
 (2603:10b6:a03:79::27)
Return-Path: Qi.Chen@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.141] (60.247.85.82) by HKAPR03CA0019.apcprd03.prod.outlook.com (2603:1096:203:c9::6) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.20.4087.17 via Frontend Transport; Tue, 27 Apr 2021 02:45:09 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1d8fee20-9036-4e7d-6621-08d909267991
X-MS-TrafficTypeDiagnostic: BY5PR11MB3976:
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB397669E3F0E85DA8A05D1BD2ED419@BY5PR11MB3976.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	mAjNPaCebi/JDgP93XhYzJjmYTK2xYAMc/Ar2o4iQeNTrrqehvfsY0z3p1pZBde0ndipnCkZE3LetmjVS7QDTEZ9eoCVn2/b7PtfjhH7JyuitAR3zfPqg4y2MgPOWhJttRLZ+x8OX+5qmB/bnnhPlx+CdDkp+O647QcM3J4bzkbP+ChDWpUArxojTvyUnFMQgJ+4znEwvzfMEB+zAemYmSpQKj/wD5hw1OY+1WsE2Q6r77+fF8kBeofMA+PkM3zJrJCTjQbP+l3vGe8BSo8UVL9C4kdXlwdyxMLEGrwyWXKrkJjLJD7XoR23dnwGhOXHlCc8iqKsuv9Y1vFPqwkWQgTzX5Wd2ehk19ukhpo3rAQtJq4lZEyt4SvhpilKwZiwb7p4Ab/3XiPEacAIoogu4aO0W8NbHShR7A8S+o87NP7aebxkvROTlBfO+dN4g9DVLF2EwAovlocSPdNpdVK7KxUn1gEVwEoy6EilCtu89agzVq+7y/aybzKiiYNcuTZKL0R1URN3Doi9uWI5rB6N22Gbc57JPDU5AdaIR92AaZIpuIbwtnew0Rin025ZOwB9NERDhluwbcIqYU993mVx92OJNJZIvcOeKQ46WZFtrwBaXrTM0hy9E2Fhf7cpHq2HvUj8if23OKnJ7Y58gg3mTojmA2gtv4e5YLR6HH3NzQ0vdLaaEdzmARaDHtMB5n6RCnskklp2WYBtYi/eoJ0/OyN0QdqRgrQdPkUh8JikLYZRgKfv9Kz1eY0sA7F5GetLhcyboYAGbWr5UwH6BZFf0Q2Z4kAcr8/SIbJwumMtGAm5MlSY4t4JJn8Z9NHwPoRE
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3480.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(396003)(366004)(376002)(39850400004)(136003)(5660300002)(38100700002)(8676002)(8936002)(6486002)(26005)(16576012)(16526019)(316002)(36756003)(33964004)(52116002)(166002)(86362001)(6706004)(186003)(956004)(66556008)(66946007)(53546011)(31696002)(66476007)(6666004)(6916009)(2906002)(31686004)(966005)(2616005)(478600001)(38350700002)(83380400001)(78286007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?ZjVidVFjN0g1RzJoWU05UGZQVENlQTZLcWVGNWF4cEZFOXZvQ3hGdEpxL0VW?=
 =?utf-8?B?Y0JUODhWemNLMVhFOVpMRG9va0M4NUpmSEVmT05BSGFvdmpwb0tMUklFS1p3?=
 =?utf-8?B?d0FkTXZobUVmNjM5WENnUHZiaDRsSUdDL1FtZ0RybG1QRSsrNHpoVDhHMkFV?=
 =?utf-8?B?c3JyU1VOWldRV2VoV1JDQ0Y1endxaDVWcTI5aE1ucVU2Qk9PZnlvd2RvdnZM?=
 =?utf-8?B?V1NhNmltanpMbFRSdVlUYjVzUXBRYXhCNS9pWGpUN0ZvS3hKRExtaG4yQWtx?=
 =?utf-8?B?WnR4bnlUZFdOTjhRa01wS2VRQlhOQTNOZUd2MEg2WkFNMTNqRlo3eXg4T0k3?=
 =?utf-8?B?ejJuM3FVRVBYL1RpNDc2R2ROVU02cnRReW5UaCszQXlZZXorZFFKclEwcUxM?=
 =?utf-8?B?Y09QSEkrdHRKWHJkMVRGWDRqK0R2c1pJRGE5cXI5akROUW8yb01kSDRDb0xO?=
 =?utf-8?B?Kys1OElmMDgvZkFlVnpzTHV1cUFpanM0MFYrYkFIL1YyNmdnRFFYbVpad1RI?=
 =?utf-8?B?ZUhhU1pLWUlBL3Y0OVNGcnV4VXFLWmh1T09rYk91Rk95bVZHNWN6bGxxMGNL?=
 =?utf-8?B?V1pRSmJZaENVWTAzcnA4OG5hcWRmL29FQkJLRzBjSjdjNWxQdXNoV2hCVE5i?=
 =?utf-8?B?d3FDamVYMklxbW5FNGtCY1BmQklJUDI1VlE3QUpWejJ1SjdxV3BLU216b3NY?=
 =?utf-8?B?ZTlia3FSL2dCQkZyMithNGZ3dWIrbEVOMk1IbDVHQzFUR2FaQ0JMcEovYzVE?=
 =?utf-8?B?YmZHOWZnbmdwdzU4M0N3OTZKRGs0YkxUd2NXODNKeTZFL1V4T055QlpCOUVx?=
 =?utf-8?B?QVZpOWJQK1pyaHFwRjdjc09EVWhLMnhMR1gyZnZsNWtwbWd3SjJXSk5vRW85?=
 =?utf-8?B?VG1VdkR1MUMxSVVaQ0lkaTNTYUhxVVVnU1VlRjJHakRxMUhrTjIwUk00aXRY?=
 =?utf-8?B?WEFTT0gybnd6VE9HT0NTYUhMQTR4d2wzV3Q0TFVncFhwT25mYTlQc0d2U05S?=
 =?utf-8?B?aGRnQTBVcjdTckM1VDFPRW1jMzhTamMvSmYrQlhIMHQ5K1lwdHlrZ1lVUU44?=
 =?utf-8?B?Z2cyWHFwZEFFZ1JIcHJ1R0IwUzViZEwxdkh0RlBMckg0ajBUUmwrbnZkcTZM?=
 =?utf-8?B?cko3blpUa2U4MG5qcDBNRGFRWml6NXNUTlhCWDNuYWtjSVlwS2puY1BWTGVp?=
 =?utf-8?B?RnJKQ1RDdTBWNWhFbTdPMkk1NXBvMjZPaDhuT0NCWjcxQU95QWd2U0V1ZEtz?=
 =?utf-8?B?Y3RNb1hzN0JZa3pJcVlJczFESng3ZjR1TE1XakszR1BKMVVzV3h0S2Q3dXEx?=
 =?utf-8?B?T21YZ1Y2cExucXhNWVdDWVVxV3FPSnUwcGVrQ2FXWlBEbFlWRU5FUWRrYmJr?=
 =?utf-8?B?V3VKZDNDYVZSYVRXWXpKNDN5QXFqOHAyakFKTjBQSCs3bXBTMVA5NDNxbVBr?=
 =?utf-8?B?UWgyem9JZWVLa3RaVVhCSmc3VGVZQjZLSk9NeEJxZm5JT3hIL3h1dGd6dTY5?=
 =?utf-8?B?QlRnMElEV0VRSjdlc3NVS0lZbWtjUHF1VWhIdVljZCtKZm1uR1MvUWFDczho?=
 =?utf-8?B?MEVHRWwwL3Vyb3B2RmlyNzFKbkQ4M25JK2x3OXlXcVczK0VkTHBKVzIwai9V?=
 =?utf-8?B?bk1OMGsvYkJVQWVpbWdaTEdNbjVMQmtDRlNSK1BsVUhxNUU1bWVhbGllZldP?=
 =?utf-8?B?ajlPZU5uR2F1M212ZiszY1pWMExIQ1lORnJUemsybWNXRDBodk5RbnJzTWRG?=
 =?utf-8?Q?UegcLa/ENaXThmj+G8paWe2bNo3oTc1dyp0XwHQ?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d8fee20-9036-4e7d-6621-08d909267991
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3480.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2021 02:45:10.6422
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iEHmOGznW3UNGhEbmpZrBahx2cs3d7dABduIpk/eiA0CAu5O2+mdCT6jJseFXtibQaR5RfAjPOaefWnp8GjssQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB3976
Content-Type: multipart/alternative;
 boundary="------------B63E4BF1F4FDE7383AD8D676"

--------------B63E4BF1F4FDE7383AD8D676
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

ping

On 04/20/2021 04:37 PM, Chen Qi wrote:
> oe-pkgdata-util sometimes outputs a large amount of data. When used
> with pipe, it's likely to get the following error.
>
>    BrokenPipeError: [Errno 32] Broken pipe
>
> The problem could be reproduced by running `oe-pkgdata-util list-pkg | less'.
> Type 'q' after running the above command, and we get the error.
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>   scripts/oe-pkgdata-util | 5 +++++
>   1 file changed, 5 insertions(+)
>
> diff --git a/scripts/oe-pkgdata-util b/scripts/oe-pkgdata-util
> index 75dd23efa3..4aeb28879d 100755
> --- a/scripts/oe-pkgdata-util
> +++ b/scripts/oe-pkgdata-util
> @@ -17,6 +17,7 @@ import re
>   import argparse
>   import logging
>   from collections import defaultdict, OrderedDict
> +from signal import signal, SIGPIPE, SIG_DFL
>   
>   scripts_path = os.path.dirname(os.path.realpath(__file__))
>   lib_path = scripts_path + '/lib'
> @@ -615,6 +616,10 @@ def main():
>           logger.error('Unable to find pkgdata directory %s' % args.pkgdata_dir)
>           sys.exit(1)
>   
> +    # It's possible that this program will output large contents, and when used with a pipe in command line,
> +    # we will get a 'BrokenPipeError: [Errno 32] Broken pipe'. Ignore the SIGPIPE to avoid such error.
> +    signal(SIGPIPE, SIG_DFL)
> +
>       ret = args.func(args)
>   
>       return ret
>
>
> 
>


--------------B63E4BF1F4FDE7383AD8D676
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">ping<br>
      <br>
      On 04/20/2021 04:37 PM, Chen Qi wrote:<br>
    </div>
    <blockquote cite="mid:1677842B2B4EE882.30395@lists.openembedded.org" type="cite">
      <pre wrap="">oe-pkgdata-util sometimes outputs a large amount of data. When used
with pipe, it's likely to get the following error.

  BrokenPipeError: [Errno 32] Broken pipe

The problem could be reproduced by running `oe-pkgdata-util list-pkg | less'.
Type 'q' after running the above command, and we get the error.

Signed-off-by: Chen Qi <a class="moz-txt-link-rfc2396E" href="mailto:Qi.Chen@windriver.com">&lt;Qi.Chen@windriver.com&gt;</a>
---
 scripts/oe-pkgdata-util | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/scripts/oe-pkgdata-util b/scripts/oe-pkgdata-util
index 75dd23efa3..4aeb28879d 100755
--- a/scripts/oe-pkgdata-util
+++ b/scripts/oe-pkgdata-util
@@ -17,6 +17,7 @@ import re
 import argparse
 import logging
 from collections import defaultdict, OrderedDict
+from signal import signal, SIGPIPE, SIG_DFL
 
 scripts_path = os.path.dirname(os.path.realpath(__file__))
 lib_path = scripts_path + '/lib'
@@ -615,6 +616,10 @@ def main():
         logger.error('Unable to find pkgdata directory %s' % args.pkgdata_dir)
         sys.exit(1)
 
+    # It's possible that this program will output large contents, and when used with a pipe in command line,
+    # we will get a 'BrokenPipeError: [Errno 32] Broken pipe'. Ignore the SIGPIPE to avoid such error.
+    signal(SIGPIPE, SIG_DFL)
+
     ret = args.func(args)
 
     return ret
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <br>
      <pre wrap="">


</pre>
    </blockquote>
    <p><br>
    </p>
  </body>
</html>

--------------B63E4BF1F4FDE7383AD8D676--
