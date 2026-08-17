Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44AFCC5B572
	for <webhook@archiver.kernel.org>; Mon, 17 Aug 2026 11:22:45 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.33])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.28088.1786965759650416096
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Aug 2026 04:22:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@est.tech header.s=selector1 header.b=c8obpFUZ;
 spf=pass (domain: est.tech, ip: 52.101.65.33, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cOYOOJtlFuHCfEoLKqLZT5Lb7UZ+Jb66WTdUw9QUcbtoEDGBs34y5apLnN05YBQeWW4enfKBOkZlRRiiU8UMH75nc1C9dJNZswZxVe4oQUw3AA+jdDi/v49sQQaFvRA/qXLefADoPRWutRLLJOxcYugMPpweTyF0ZJrZJHtebgP2CvdjXG/029F7R2Dg2oznaFYdrNHlw3P7kwhoUW+CN3NopIC+epJ+Ju6EZ1S7A/AjmECZw6q7619z/EnRoepHudrpulD4LxoRa2owNHncoeDaPex+t35n0vP6JXregdu5JjPRWwPjkYYLw3MXmAAODPjrrK7AIREFNLGMGPSUTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+/CqAqXk3CSrSrndQf1pD+6+aOUT1uWiSSKt/pXNPD0=;
 b=jCP0pqj0xbICKqPF+6VUBVhMLgK34u1mLk0P8mxRu8umsxcnI5qCnyLQgJ5IPwYZ1lYapyutTJZGGEi1llMIsV4G2hNoW8cArLSGtYBkDDPrkV8wve3kYYxuP9sSiAOmPLFRIewhYsg0Bl4aj/rXFSvKqq4a+Po5XKQmkzzYvM5saRL7hslCv3Bz7hcumwGRW+WPKWlBOIIeRmPv1lvmHgw6vbRi4SC2bcblMIe/8+kyhgmQCz31E3F02Sr89InE+z3RsA+w7J0u9l+GaBZyu1gaHoXx3uONmFWc34jpMxTk3du54TI6LxDu84AiiHRT3T1SEbyXlUvD6mAiZwl7bA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+/CqAqXk3CSrSrndQf1pD+6+aOUT1uWiSSKt/pXNPD0=;
 b=c8obpFUZI9zqbL3iZuxItk56pjQZ/QSma1opyYdiut2b6J1eQfHUCHJp5dlESu7QIwm6e/j8mnjr+mWVJLs9JVVIA7kwdz6D6+GdK1rmxMZ9OuxMPETPE5PIgQImNqNOA41XBC+eU8T6G1zL/HTvfatZ9AYj2eyC7dPTnAQAfFk4IpLf06uHOAaUXKqhj+X0Jr8zweUCdKrS0GBxTuu7Xm2xI+AEcodoCmeJgF3iZYTE+8olE4pyJfut2LFfwtO5P4ykWlD1/7VogPkDh+0AMzUEQpBAry0Ca5cttZ8YPThYC0/O8neNiZ/gIx5APwPNIKByxQy1PyR/D1e6CE2tFQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by GV1P189MB3156.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:294::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Mon, 17 Aug
 2026 11:22:32 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85%7]) with mapi id 15.21.0339.007; Mon, 17 Aug 2026
 11:22:32 +0000
Content-Type: multipart/alternative;
 boundary="------------raWZXkF5DZ5eWJ3JZKZNdjHI"
Message-ID: <c136135c-2adf-4e14-9f0a-0a46855e8d19@est.tech>
Date: Mon, 17 Aug 2026 13:22:30 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 2/2] boost: upgrade 1.91.0 -> 1.92.0
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
References: <20260816162611.41933-1-jaipaul.cheernam@est.tech>
 <20260816162611.41933-3-jaipaul.cheernam@est.tech>
 <CANNYZj_pOq7-E-5BbF_1UE8FSR6xvmoc7=8kfGxzokyLqcrXSg@mail.gmail.com>
Content-Language: en-US
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
In-Reply-To: <CANNYZj_pOq7-E-5BbF_1UE8FSR6xvmoc7=8kfGxzokyLqcrXSg@mail.gmail.com>
X-ClientProxiedBy: DUZPR01CA0067.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:3c2::6) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|GV1P189MB3156:EE_
X-MS-Office365-Filtering-Correlation-Id: 57bcec40-d234-4415-14a1-08defc51d45d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|366016|23010399003|10067099003|56012099006|5023799004|11063799006|4143699003|6133799003|22082099003|18002099003|8096899003;
X-Microsoft-Antispam-Message-Info: 
	5VD6+e5UWd+mBWwS3+6NpwcziID6uEeYadKk8cdQyv/SfRYSYr5wtG15NKcGuUEUGJNIfuDeQnplOy2pMBjgtqimPLOCQHDTEUZOYNh39gfTLqPPY9BV8k5G25MVPhkkyg2BM7jUXKsjfx+wJBxtLyGVMzglmxH0bQfRyOOjhCBd9wkTztmRT6YnGmsVnbGrl7CFeQ2OYogPw+Q33IbR0c3J7bUGVcrrtgJscgTwKphHTW4mrlh/rUWuHGQsqVIti9Hs4OVH2EstqmS1ySJdnhUK/Hl8jcd0yTfgGtl9XoTRPmugdc3MnP6nrMFGFIDBAXlQFkxjijKf578lkAZ9XyHuHvQWXOxjo09wwSg+laLadCWjYtTNei3+YzC1fE8/nQBcOR7iiKeGK0baWEJgMApzHdBAt9UH/pfZZB3CnjT3EDHBq3OffWTRkpgpPGmdno7FkqGE6m9biPMdFbr5LZrE5tgG1vK7xx+U1zL9mX7sYpCQKm0Rn/njBx1SoftmJjh/pfWxoxbzJhC9RzGDCe5TpyGJvmZZdVgCIofCbTFkUDLcNBccCMPrBocKNLM/iSfxqBr2O0gpvG1HgBWlEGmcq0oKhqz7VzEDu79jXBcjpKuqvTLG1diYyHPAFxs5+N5U8RGIShNu0WE7z8TlbDldWC+dCMaprZaEP9F0lh0=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(10067099003)(56012099006)(5023799004)(11063799006)(4143699003)(6133799003)(22082099003)(18002099003)(8096899003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?OTRYc0dPalRUVVFpcG13SnFjdHZ6d3MrQldqdjRsUjlpRUVXQW1GUWhFN1Jo?=
 =?utf-8?B?c1ZPWUpaUFgrTTRzWUR1dTVlR2E4NlE3S2g2Y1d4UXl4SGZiam0zZE1NdWRp?=
 =?utf-8?B?T3J2b1pVdXJJL2t0bE9TcjErT3pITXRKd2F4WlV4VEo1WWFrSXNXaW5Za2JT?=
 =?utf-8?B?bG5kS0tyY1NDVy84K2gxZlBDY1FYSmZMTzJTT3RDSGR1OUJWTGl4R1pPZzB5?=
 =?utf-8?B?dEM0QlNxOFJuZktZKytkZzBpMHZKNTRvWG01ZENUU1djUlJDSkwwU0JTMXRh?=
 =?utf-8?B?ZUdiWTRtZGZxUS9MdnFSMFk2R0t2TEVHZ29iNGdxTzNhMXc2SlRXNkdIQTZH?=
 =?utf-8?B?RXU5Z21LZEpXTWdadGRheWJNbmwxN2hUWm5uc0lRQVJEakoyaUY0MEJWS1Er?=
 =?utf-8?B?bEgrOGtFTWo4T1pRZ1RqdGFIYTg1ZU5BeGIyclhRRTRTcUVrQ0NCNk83SzVx?=
 =?utf-8?B?U3dmVFFNaER2NzM0MmR4MGIydXlYTFZaWkdiTitNZlhkRlpYZnJWMmt0S0lC?=
 =?utf-8?B?TGJwSUJ3SjFiTUNueGNIK2dkdDI1L0tqL1ZXNzZtT1A2WERtd3VvM2x4UElj?=
 =?utf-8?B?RUpZdDFLeU45dkFlTGJVQ0NwU0U0bzQ5elQySkRpR2h0TGwwUmtBdG5qTHp5?=
 =?utf-8?B?WHpiYkZaOEFSOUduNXByQnJoSWZSQUFjbjN2K05JREFKZkNPMm1ta3F6OE90?=
 =?utf-8?B?MEdTV3F6R0NoMTZ5dUloTzFPZm9NYkpaQVc4M255VWJCMnA4TFcwV3hqNXBE?=
 =?utf-8?B?RWVRQmcyQTVjL05nTkRkZFNZYlYrTnc4TC9NdHU1cndGeVdVdk5FRHo1WkRs?=
 =?utf-8?B?V3VxZU1ac1RWam5lSllkUytuRWJIT3pVQUg0Y3N1KythbHNIZTB0TjQ3TWlN?=
 =?utf-8?B?N2hFYUIxaDVZNi9TaDNEY3hWR2FucnFtNjhXelVkUll5bFBZclF1RjBQTjEr?=
 =?utf-8?B?U0hGSS9VT0FWQm9YRzU3cStlNU1wVXBWdkpYTEw0MkpMWHVDd2xkNnIvZitz?=
 =?utf-8?B?OXNGazNMK1dkTy9ONDlieVRVT2ZEZktVRkFmY245eFNETjVkQ29GTXZCTHIy?=
 =?utf-8?B?UHM0S0hJZGxDMzhWNWE1M0Q2MVYzbUd4L1p1bUxkaUowaFE1NVJ3dWxKYVJK?=
 =?utf-8?B?bTBQeTcrc2ozKzkyYVMwSnFmQ1J6VGdBYWhTYlNpeWN5L0ZOWGlzS3ZaRWxt?=
 =?utf-8?B?NGNjZEpSbHhtSmRLY0FweFhrZHl2SEJ4dTBqYVRWSkozMXFZeW03aUp4R0pr?=
 =?utf-8?B?UThyRHZXaW9TNFRXaDZKNEh4dE5kUkZkeDV1K0ZLQndteTV3M1RTOTlKczhG?=
 =?utf-8?B?Z2o1bXE2VUJXRy9sWWsxU0YyeXU2aTh3WEUzUExEdzBILzUra1A1bWJUSldt?=
 =?utf-8?B?aWVTZXhoazFwcVFhMkxGS2dxeVdLZ2laN0NIZDh3aWx6WURnTVFPaExaL1Fv?=
 =?utf-8?B?WEJCcjVWb3ZnS2JLM0FXelpjYnd3c3NQYWlMalBFNExPOGdEZ2trRjlXVGNh?=
 =?utf-8?B?aEN5UXBGUVNqZkMwa2I0N082SVUxM051S3ZKYXZpd2xpM25pNExZbFZONVp3?=
 =?utf-8?B?SXR6c2t1K0RnNzc5YUlGNVRjcnZLUk55Y1FXamFPRG9GU29QNFdQWTF6ZExQ?=
 =?utf-8?B?eDZXcUVIdUxuczZRRHdaR3ovM3Yvbm5vUCtoK1E0Z3VFUmUxcmpEMkZINWpq?=
 =?utf-8?B?Lyt6RzAzUkpNdzZ3M2pIb1Jaa0k1Qk0xUDdKdnNqeUhuNDErS1cvQ0xEWXNM?=
 =?utf-8?B?aitjRnJWbDZSdCtnZFhucUtMWndxdzlzWkljUUdJVGtVVGtKWVZjNWtlaXF3?=
 =?utf-8?B?Q1dFR1BiaVgxNm9KM1lkaXNubWY3WXowTUoyVHlQRFNDWFduQ000UXdhMUJh?=
 =?utf-8?B?ZDF6bEl6a016U3RHckt2M2xmRitzN0ZoMThNTUwwRE5mZWo1T1ZXa0FTTE5s?=
 =?utf-8?B?S0dRN3JpbXJvRUppb2xWbnVtSUlTUlRBdndQUHNJcmQ2M3Z1RVV6dmxRR2Zo?=
 =?utf-8?B?NzJDSGxvbkNvMnRsM3dJaVBOM0tMWVdwZ0V0SzdvZ0lPU244YjNVNFZTUXZm?=
 =?utf-8?B?N3YzYUlmV2taeGloZTl6emVTQmZPZ08zNXRsWktqdGRiUFFIVEhldXIvLzRT?=
 =?utf-8?B?TE51M3l0S3Z3bjZ1MXRjS00vREVNUkJKclpla0dEYktjVXhSZGVkSVpITVNa?=
 =?utf-8?B?ZTZaRTMwM0ZZVjhNaDNWMjJneTBqemxxR01jeTFETmlKMitCNzZzTVZLL3FD?=
 =?utf-8?B?eUJ3ZDRobmUwNkx2QVB5WnN3Ui96L1RhamRrMzNlS0o5QWxWcThnSjhMb2x3?=
 =?utf-8?B?YW9Md1EvQUptTU1KZ280VTZ4VVBKblBja1ZnOUxlaytTQkxRelJsNk56QVFI?=
 =?utf-8?Q?sToLKA9TRLTGPxac=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 57bcec40-d234-4415-14a1-08defc51d45d
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2026 11:22:31.9429
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Bw7S/vFu5WaT9u8TYn2+pyvq6UBFpk+UlXcG0yQfgSDG1AX+Vgm6ufyqaSX8kporlHg/koaDu9wWt06YQLzx2fOciaNkFVkIo2KiLnFHmEI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1P189MB3156
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Aug 2026 11:22:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243618

--------------raWZXkF5DZ5eWJ3JZKZNdjHI
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 2026-08-17 13:09, Alexander Kanavin wrote:
>> +        # Remove boost_predef b2 check tooling - not needed for runtime or
>> +        # cross-compilation, and was never installed in previous versions
>> +        rm -rf ${D}${datadir}
> Removing all of datadir is excessive. There might still be useful
> pieces in there, if not now, then in future versions.
>
> Also, why remove something that upstream has started to install? Say
> something is 'not needed' or gives 'permission errors' is too vague,
> and not a sufficient reason,
>
> If they deem something useful, then we should not go against it; if
> it's not useful in the package it currently goes into, then we should
> find a better package, or make a separate new package for it.

Thanks Alex, I initially had it in boost-dev but switched to removing it 
after finding it was never installed in 1.91.0.

v2 ships it in boost-dev alongside the cmake files — both are build-time 
tooling, and a separate package for a handful of files would be 
unnecessary overhead.

The --prefix addition remains needed because B2 1.92.0 now invokes 
predef's install-data target (not triggered in previous versions), and 
without it the path resolves to /usr/local.

Regards,

Jaipaul


--------------raWZXkF5DZ5eWJ3JZKZNdjHI
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2026-08-17 13:09, Alexander Kanavin
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:CANNYZj_pOq7-E-5BbF_1UE8FSR6xvmoc7=8kfGxzokyLqcrXSg@mail.gmail.com">
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+        # Remove boost_predef b2 check tooling - not needed for runtime or
+        # cross-compilation, and was never installed in previous versions
+        rm -rf ${D}${datadir}
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Removing all of datadir is excessive. There might still be useful
pieces in there, if not now, then in future versions.

Also, why remove something that upstream has started to install? Say
something is 'not needed' or gives 'permission errors' is too vague,
and not a sufficient reason,

If they deem something useful, then we should not go against it; if
it's not useful in the package it currently goes into, then we should
find a better package, or make a separate new package for it.
</pre>
    </blockquote>
    <pre><font face="Al Tarikh">Thanks Alex, I initially had it in boost-dev but switched to removing it after finding it was never installed in 1.91.0.&nbsp;</font></pre>
    <pre><font face="Al Tarikh">v2 ships it in boost-dev alongside the cmake files — both are build-time tooling, and a separate package for a handful of files would be unnecessary overhead.</font></pre>
    <pre><font face="Al Tarikh">The --prefix addition remains needed because B2 1.92.0 now invokes predef's install-data target (not triggered in previous versions), and without it the path resolves to /usr/local.</font></pre>
    <pre><font face="Al Tarikh">
</font></pre>
    <pre><font face="Al Tarikh">Regards,</font></pre>
    <pre><font face="Al Tarikh">Jaipaul</font></pre>
    <br>
    <blockquote type="cite" cite="mid:CANNYZj_pOq7-E-5BbF_1UE8FSR6xvmoc7=8kfGxzokyLqcrXSg@mail.gmail.com">
      <pre wrap="" class="moz-quote-pre">
</pre>
    </blockquote>
  </body>
</html>

--------------raWZXkF5DZ5eWJ3JZKZNdjHI--

