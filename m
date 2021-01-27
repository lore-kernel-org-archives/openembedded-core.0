Received: from NAM10-DM6-obe.outbound.protection.outlook.com (NAM10-DM6-obe.outbound.protection.outlook.com [40.107.93.52])
 by mx.groups.io with SMTP id smtpd.web09.5638.1611740266776315413
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Jan 2021 01:37:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=eGdE2YyK;
 spf=pass (domain: windriver.com, ip: 40.107.93.52, mailfrom: qi.chen@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ppk2SD7WUb5syQtZm8imAtZcOCg0OONp1QRR1MguourDOtSgdtfB9jJ8hvhUONhTTO9sB0FndOthYPCzkEz99R/HJGaMXOuDOATemE5lOkxaoBkVSJckX7rLrh1vF3zAKOXq0yibLnTaFuan6NudGy88DmpZsp2hsY+r8jeqtyPOm20ZBlNSuMPRvG8YmXtIqgFjl4gWrkE0jeBfnNoQ3AEF8dDKWhAJvc0+GZ/Lxsb1XCRy+slmH4zzu6mPTqHVPVCSsDNsJGZ1ja7G/cK5X4h1i8gLmJ7bBzim55A8fnwUODKf68V50yY0vcPggMLzN7gX/e/qPjuRMd0HrY3KWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4tOgGTCvZXjITXqSa3LQKzOGXShYhe9vwIqZm6QrMGE=;
 b=YTdPeJH2AwydYdBhLJsk5Rt8MevfZUtFwyvi50Hpl+lq9v40WfgSzAoRQ3cc2amjwNQPTjcq5KRCRMOxjpeLIGTqaAQJvECMuC4ddXfYOOaTANi1WK3iU1Y5vp3JZvwQNNJ9YhijhTgP3L6naHIyXJZFGwx7FzJlCio9CtR9UWm3wg0SxVfsUnrHnGaEPFjVD+LAnJjsVxchguFVLyPPttJ7YN1JReNUFm9irjC2gT0S1kuT/o/YijHTMdLM1srYEqwCgJq2dJ7hjTHNPWlizRLXXkS9pnRzotJqIG2r14IN3NQi6j688x/96dXyNoS7RXqjMHgkUnYbwB+/CmWZow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4tOgGTCvZXjITXqSa3LQKzOGXShYhe9vwIqZm6QrMGE=;
 b=eGdE2YyKwN9cEV8lDaJsJOvBfUMp9kJiKTvVSFQr0uIemuKYHrLjcic9gTCGsillhXWSxL/+rNzR82pk951v6socTebQEqrNF7NJ9sSY361C0d02w6SnQUK4zq+dmkwYYaohtO/8pDcnIXFeIR+bAcDEbwp5WotQsUuGdY3btl4=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BYAPR11MB3480.namprd11.prod.outlook.com (2603:10b6:a03:79::27)
 by BYAPR11MB2839.namprd11.prod.outlook.com (2603:10b6:a02:c8::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.12; Wed, 27 Jan
 2021 09:37:44 +0000
Received: from BYAPR11MB3480.namprd11.prod.outlook.com
 ([fe80::d9b:3f7c:136d:e60]) by BYAPR11MB3480.namprd11.prod.outlook.com
 ([fe80::d9b:3f7c:136d:e60%7]) with mapi id 15.20.3784.019; Wed, 27 Jan 2021
 09:37:44 +0000
Subject: Re: [OE-core] [PATCH] sanity.bbclass: verify that user isn't building in PSEUDO_IGNORE_PATHS
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 Dorinda <dorindabassey@gmail.com>, openembedded-core@lists.openembedded.org
References: <20210125230811.21862-1-dorindabassey@gmail.com>
 <77ad8e184576449791b56fe9c6e0fc872cc98a42.camel@linuxfoundation.org>
From: "Chen Qi" <Qi.Chen@windriver.com>
Message-ID: <4e6da54d-f6ef-9c04-4bdb-5af64807cbd7@windriver.com>
Date: Wed, 27 Jan 2021 17:46:38 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
In-Reply-To: <77ad8e184576449791b56fe9c6e0fc872cc98a42.camel@linuxfoundation.org>
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK2PR04CA0086.apcprd04.prod.outlook.com
 (2603:1096:202:15::30) To BYAPR11MB3480.namprd11.prod.outlook.com
 (2603:10b6:a03:79::27)
Return-Path: Qi.Chen@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.161] (60.247.85.82) by HK2PR04CA0086.apcprd04.prod.outlook.com (2603:1096:202:15::30) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.20.3805.16 via Frontend Transport; Wed, 27 Jan 2021 09:37:40 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9b8c1708-5936-4b8c-b48c-08d8c2a73242
X-MS-TrafficTypeDiagnostic: BYAPR11MB2839:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB28390D5E932A0D2B885D2670EDBB9@BYAPR11MB2839.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	5+u3vlG1OpI5odSFZAU3OxYc1g6qWHWVo8mAAlZfRhrFj/uL01tgDYJRsw34XNJVIuX3o1Wb0Ni8rgpYQG7+I6QAabsgjRoFVw9bdFuPsgkKgiP25+aPI9FoTiCFCFqtXRQvhDloOK6q/jjnFTWt867xVXHO0fwBg6olIzKYffOKoz/jSIS+ntFaGipCIA6qE+nbqBlGcRiHBXpAzqktP41W+44NKZY4AEpTlzNLCh+H+iav+25HiStTqDL7kP8w96+MnShor7G1t1hG6iRRskubpeiHiGTjeHlk5cmZ86zJZ2+NXhSXeO4JPTe8SiavfPdDTWmlAjtLBSHmuzIP9Nl/umOuigCD40073y6qaSDA4rtz1Zr8QBTLvLejCk8vtIsT+Nps1s6lNs5Yc0ZDCUQ8Sf/gSfXMpRyZP9BrrRw9tkzWf93YErYkDSZ27Fth+2xPS0h67uYzwA22nwGO4DiDn1J/xlRhiwUcf9FwoYuqqaXHLsy9Nq39via+y4jRwQz5sJ0D9rT92RZUKtD07uZRpXn+c/7RHeRIxcW8ujyPjNLbAZKaUkFmTfdcbU6XVy0pISy2zKhX7g4SHKn5EHOXHR2VanphMi6RqBGAB6mFuy51ZtUJ9CptKxRgJzPFeznhxKwYjUvlWce5SYxBvM5LXHvywnkfW3rXLCkAW33s6T7NuTQwbCuhHssZYC8i6Iovd7SEyQnyoCePU8Cy2A==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3480.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(39850400004)(136003)(396003)(366004)(166002)(5660300002)(956004)(2906002)(33964004)(86362001)(2616005)(83380400001)(66946007)(110136005)(6706004)(16526019)(186003)(52116002)(26005)(66556008)(66476007)(8676002)(53546011)(31696002)(8936002)(36756003)(31686004)(16576012)(6486002)(316002)(478600001)(15650500001)(966005)(78286007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?cDloNUJQN2VySVlWSDFjWHFnZXRPY1ZtSXRmcHVubUFUcHU4bGUwOUxvbHNS?=
 =?utf-8?B?QmpTTnE1bFhSa1ZXZ3RleHVZVkwrY2RtTUkyNDV3VW92ekI3SCt3bkRsK2dS?=
 =?utf-8?B?YTlWcUZzV3NLY2RUWlNmU01MU2JZWjI3Z2tCL1gxR0hxYzhXUXVtdGRXK1N1?=
 =?utf-8?B?U0wvUFdDWEt2ZU50aTJ1eEpmcWpIVHNmdU12NWRpSXpxZk8wbHpLaUNNUUdI?=
 =?utf-8?B?RTREYy9UdXF3TXFPQ3hWVFJ0dS9QUE4rWkNTL2VWQ213a3hPWXpiM2ZVQlF6?=
 =?utf-8?B?VGV6QXpVeGJPZzV2bExQQ09yRDQvUjNYdU5uRkd4aC9KU1Iza1pSRzdNMmQ1?=
 =?utf-8?B?dWZsZnZlNXA5bitWNjlIM1RwZGZJeGFGWEdOWEZlUHh2Yk5XOFNIWWYyT2JP?=
 =?utf-8?B?V2VSc29VcGJxbmpyTlUwZzJXVksraDVEYTlrZVYxNUREa2ttem5MckRjWUw5?=
 =?utf-8?B?ZGR0VFpPWmtldEhSVEd1cTNzZnlSZktmNFBIcHhaR1doNVgzck9oWERzc2cx?=
 =?utf-8?B?Yjh4aUo5dEpndmZERmJ1VkwybGw0bFlnRDA0TGFSMUsyZlp5SUJ0UFQ2dk11?=
 =?utf-8?B?blZ4QlArdHlYOTJycHUreU9ob09WUEtCSG9lY3kvck1mM2hoelVGaU5zNXl6?=
 =?utf-8?B?WW05MGVOQmZHV2loTUxPRy9CT2tqZmZObnNKeSsyNlE0RzlqRjV1UndsWUw3?=
 =?utf-8?B?T1ViSDBzOGQ1NGRjNjZIM0Z2Qmh6Zk9acGc1dDJEdUVwNWQxVG9vWXVMUlJS?=
 =?utf-8?B?cDNOUHRiZFJUNTRkOVhpUWtPZEl2eDhDbmgxdTNwVEh6eUorQlJTRy9tQmFZ?=
 =?utf-8?B?WDAvV1ZyRThUdjNZOEF4M3kzNnovL2Z0cFZqQ0pNYVpLYzllYzg5K2FNUHRN?=
 =?utf-8?B?TWxCSXdPd2FSSHBsM1EzQnRJUkVtN3IyRzlnL1pQczlEMVM3SGt5a3ppcFR6?=
 =?utf-8?B?Zjh1TkU2YVA5RmdvNGY3b0lvMjNwcGxESnZNWXc3QWxsUnR0MHhSdWdIVE1T?=
 =?utf-8?B?dUlZOWNSMzhmREltNWhVVnhNaEhyMGt5TGNFaUlzNk1MandRSlVsNkRKM1JS?=
 =?utf-8?B?MCtmMGtkTXNaWjVXVld4NzMxeVdaTy82NWlENmJLVS9SSjdnK0RXWUgvVzVF?=
 =?utf-8?B?bCtBbXlTNVdBbmRuRnM5VUFBVktMblNYOFQ5UnZFM0FJbm80Z216aHA2RjVI?=
 =?utf-8?B?Zks4Rnh1bGFtYXFVakRac3RtdlRLc1VSb0EwOGdTcUtMcXA3ZjZSK0dvMmJu?=
 =?utf-8?B?STF6WGwrWHBjQi9pdmQwMVpZVGRBcEZWTXBndERRVXZrcG9HWUdXK1BGSE9D?=
 =?utf-8?B?MEpobElIb2Y3cStCME85VkdMNFFIQVRibWJkdW9yOGRKdjQ2UXNYQm9IM3Q3?=
 =?utf-8?B?NHZUZC84emZwWEdNWWJLTDVyM29DN0dhZzl0MlNwT3pQTW1QZUlveTlLaHlv?=
 =?utf-8?Q?xG0SJPin?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b8c1708-5936-4b8c-b48c-08d8c2a73242
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3480.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2021 09:37:44.4087
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cg6WuZYbxiuz9ntX1VwcWfOD0VGheEMSRAQyjE/xxFDGPsSVpoK4LgfMTifSNeTID1tYB0ie/VRUV6t5HqreIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2839
Content-Type: multipart/alternative;
 boundary="------------09194F07D983EEAB988C80C3"

--------------09194F07D983EEAB988C80C3
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Richard,

Is it possible to use an opposite way for pseudo path filtering?
Instead of ignoring paths, only take into consideration paths in 
something like PSEUDO_CONSIDER_PATHS.
The list should be short. ${D}, ${PKGD}, ${PKGDEST}, ${IMAGE_ROOTFS}?

Best Regards,
Chen Qi

On 01/26/2021 07:54 AM, Richard Purdie wrote:
> On Tue, 2021-01-26 at 00:08 +0100, Dorinda wrote:
>> If a user builds in a path in PSEUDO_IGNORE_PATHS, random failures are generated. Hence this patch adds a sanity check in sanity.bbclass to ensure that a user isn't building in PSEUDO_IGNORE_PATHS.
>>
>> [YOCTO #14179]
>>
>> Signed-off-by: Dorinda Bassey <dorindabassey@gmail.com>
>> ---
>>   meta/classes/sanity.bbclass | 7 +++++++
>>   1 file changed, 7 insertions(+)
>>
>> diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
>> index 2040b48595..14271c1ca9 100644
>> --- a/meta/classes/sanity.bbclass
>> +++ b/meta/classes/sanity.bbclass
>> @@ -703,6 +703,13 @@ def check_sanity_version_change(status, d):
>>       if (tmpdirmode & stat.S_ISUID):
>>           status.addresult("TMPDIR is setuid, please don't build in a setuid directory")
>>   
>>
>>
>>
>> +    # Check that a user isn't building in a path in PSEUDO_IGNORE_PATHS
>> +    pseudoignorepaths = d.getVar('PSEUDO_IGNORE_PATHS', expand=True).split(",")
>> +    workdir = d.getVar('WORKDIR', expand=True)
>> +    for i in pseudoignorepaths:
>> +        if i and workdir.startswith(i):
>> +            status.addresult("You are building in a path in PSEUDO_IGNORE_PATHS: " + str(i) + " please don't build in this directory: " + str(workdir) + "\n")
>>
> To ensure the user fully understands this, should this be something
> like:
>
>
> status.addresult("You are building in a path included in
> PSEUDO_IGNORE_PATHS " + str(i) + " which will not work, please locate
> the build outside this path.\n")
>
> as we then tell the user what to do (and don't repeat effectively the
> same information twice).
>
> Cheers,
>
> Richard
>
>
>
> 
>


--------------09194F07D983EEAB988C80C3
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">Hi Richard,<br>
      <br>
      Is it possible to use an opposite way for pseudo path filtering?<br>
      Instead of ignoring paths, only take into consideration paths in
      something like PSEUDO_CONSIDER_PATHS.<br>
      The list should be short. ${D}, ${PKGD}, ${PKGDEST},
      ${IMAGE_ROOTFS}?<br>
      <br>
      Best Regards,<br>
      Chen Qi<br>
      <br>
      On 01/26/2021 07:54 AM, Richard Purdie wrote:<br>
    </div>
    <blockquote cite="mid:77ad8e184576449791b56fe9c6e0fc872cc98a42.camel@linuxfoundation.org" type="cite">
      <pre wrap="">On Tue, 2021-01-26 at 00:08 +0100, Dorinda wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="">If a user builds in a path in PSEUDO_IGNORE_PATHS, random failures are generated. Hence this patch adds a sanity check in sanity.bbclass to ensure that a user isn't building in PSEUDO_IGNORE_PATHS.

[YOCTO #14179]

Signed-off-by: Dorinda Bassey <a class="moz-txt-link-rfc2396E" href="mailto:dorindabassey@gmail.com">&lt;dorindabassey@gmail.com&gt;</a>
---
&nbsp;meta/classes/sanity.bbclass | 7 +++++++
&nbsp;1 file changed, 7 insertions(+)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index 2040b48595..14271c1ca9 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -703,6 +703,13 @@ def check_sanity_version_change(status, d):
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if (tmpdirmode &amp; stat.S_ISUID):
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;status.addresult(&quot;TMPDIR is setuid, please don't build in a setuid directory&quot;)
&nbsp;



+    # Check that a user isn't building in a path in PSEUDO_IGNORE_PATHS
+    pseudoignorepaths = d.getVar('PSEUDO_IGNORE_PATHS', expand=True).split(&quot;,&quot;)
+    workdir = d.getVar('WORKDIR', expand=True)
+    for i in pseudoignorepaths:
+        if i and workdir.startswith(i):
+            status.addresult(&quot;You are building in a path in PSEUDO_IGNORE_PATHS: &quot; + str(i) + &quot; please don't build in this directory: &quot; + str(workdir) + &quot;\n&quot;)

</pre>
      </blockquote>
      <pre wrap="">
To ensure the user fully understands this, should this be something
like:


status.addresult(&quot;You are building in a path included in
PSEUDO_IGNORE_PATHS &quot; + str(i) + &quot; which will not work, please locate
the build outside this path.\n&quot;)

as we then tell the user what to do (and don't repeat effectively the
same information twice).

Cheers,

Richard

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

--------------09194F07D983EEAB988C80C3--
