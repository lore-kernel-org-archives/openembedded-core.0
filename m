Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAED6C43458
	for <webhook@archiver.kernel.org>; Mon,  6 Jul 2026 08:12:03 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.60])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.146435.1783325518214713456
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jul 2026 01:11:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@est.tech header.s=selector1 header.b=yYwVzHBe;
 spf=pass (domain: est.tech, ip: 52.101.66.60, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HMePEoIIDetkJt7NuNtqOVrie38anD1wUDF7cki1jK/fKJSziICDyXCnuewvT1T5v1ruMzqQHfPGQyF2aBBebkv1NkC6EcfLWEctScAacUXj3JO1YmaQ/59RcvK+1k+4U/fi3nFnd7hL12LD14ENkEqjjHatcF3AwjypmODQNik8qHSHHxN1IGCHN1J1+MXrvtAqEwge62U13itf4u1m1IRdpvkI0wET9iSkM7LZ4qGOYNbSwDIa/vlfqSSom2TFkvvX9gDvyx0q+L4j5Rzc7kZJMJTapG7CogwoeVFOvZqaJI9lZNgL8jx9XdpvAG5dEZFjK8TELfhHk74gCkURnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YlIs+vsCgNncLhqYTp+ghf0wNjTd6SnSGvt+qMBkS9Y=;
 b=cfv967WXjGZ68Euc05dbIVHIRjvt+t1irD+oHtxZSQe+Uog4St/3FZVysamWX6hfxSB5860NE1nUGim4jWw1FDk0LMQDC0gAehpup7pcBwNbl86QiBbZJdEg87/Lmm8wm6BKKbdW01fNw3srx1cIPX8lgOGR6BYkQ78qN2fWiiCOPDHONPniVp3SqfNcnF5gUSlnLlBS0mvHgYbWIF+kJWk14LZ+vYBYfm6SWLj/s5klFfHktWuh0Jj9Dzn/OACXL57PtmGh+OwPhdlM8tKIO6u5tu7/y3iO3NrsZAN9ZTWegykFSGup7D2yOI3niawWfmmXpIpUmHJBb7hDuwGo1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YlIs+vsCgNncLhqYTp+ghf0wNjTd6SnSGvt+qMBkS9Y=;
 b=yYwVzHBek6Y2TwxDpR+xdgRxVS5x7rR6txR64n/r04eiMmGxeai0OcX59SrEC/85TgHcstz9v6xkEPVZxL9HpHHgT/bdh82phTDmXV0tq0h45IKK+pitzUTQcWJ6k25+ylcDK1pJDFBib83eAmFpY1SC25sHwQDTWniLhXXA0kit3MrLITHpUfRSWRxaQZSdlnFfBFAU0DyX6oMX1D0XUyBZFE4JKUwaYXq7DFpuWgdeOQAyJqjZ/Y6cV1alIQ6FfLkBLj6LRWj4N/mVVIhHnumuN50CtutLY/v089YP1z98BQ7Rv5PzHyhOMRnk0gbBjIaSNgSvaF0/a5JQR37UtQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by PR3P189MB1083.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:2a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.13; Mon, 6 Jul
 2026 08:11:51 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85%8]) with mapi id 15.21.0181.012; Mon, 6 Jul 2026
 08:11:51 +0000
Content-Type: multipart/alternative;
 boundary="------------4fm2qxv2zLaOn3QidwwEgJEz"
Message-ID: <fc772a58-d943-4634-b3af-31069dd3e3cf@est.tech>
Date: Mon, 6 Jul 2026 10:11:50 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [wrynose][PATCH v4] curl: fix CVE-2026-5773 - wrong
 reuse of SMB connection
To: Yoann Congal <yoann.congal@smile.fr>,
 openembedded-core@lists.openembedded.org
References: <20260623120850.29881-1-jaipaul.cheernam@est.tech>
 <20260703092551.87871-1-jaipaul.cheernam@est.tech>
 <DJQZ7ABAP9UE.1YN66ML3FTCEH@smile.fr>
Content-Language: en-US
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
In-Reply-To: <DJQZ7ABAP9UE.1YN66ML3FTCEH@smile.fr>
X-ClientProxiedBy: DU7P191CA0028.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:54e::19) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|PR3P189MB1083:EE_
X-MS-Office365-Filtering-Correlation-Id: 24cb1526-fe6a-4aa6-b95d-08dedb363bba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|18002099003|22082099003|13003099007|8096899003|4143699003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: 
	MzfJcl+ShqaLLA03BCCgyBCKDF0NxG6rOJ7g+fyRrWQnRWWbdhiXpOurRg0ahlNxlgmCxMZARpZB8dtPJtpd+krCRXdq10qdlbfpoQv/gbi5HG2LngBWXOVqMX9hP7W8kvBMraVTrLnV2MHGYgM3w0mPU6ghlMuaB/qCzdj11RbWTRmcbzDBTwDRlzhbg2jqlyOSFULmuRjpXs6unvHque2aPLVXztW/0ANfVgyBwZbEPyAntFq5aOdWFpTOwNycaKGKOjyY+sS/W0oZZCVklJBVpWKmE5F7NuRPn5VpnaJiC4iGvmI/c4zp2ki2uhjJZlPp2XNxwOLapLQ128B59tP04xtGczmIGytTtCtzqpTsoxeddLNKq2gqQhrkUOaXNRdGWOGRp4ZjYtCXgmTo93yzDtQL3qatO2AvFU+FFgCr2jJKXQmZNoq8+N3AMVgg6f1SzZlvp2Ih66EKwn55Zmo8e/lVBncn637P6ULWDK64WyNAfGua9lzdTZUgbwTlN4c239V6DvUZAiYAw1F0C8B4ZsSWMDa4PX5iDGYRh/JnwmjHDcuVeMLt388De++rc7wg7co56RIutuiCDtZfOYQ28XoE4bMoGsYE0JKCLpjPGtYcwPCO9ZLRDdbWg/AA09XMNXPjwDOZ0uyeAOVFa6RSOCzg2QMeNYoJIfbTB/0=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(18002099003)(22082099003)(13003099007)(8096899003)(4143699003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?WUdnZUFYd2dpNVF6N2tmK0J1ZnBPekNTNEQ5b3ZXd21MWWQ0UkMxYVdvZjRa?=
 =?utf-8?B?NVhCdlBFbUtVWVd6cEJnYTgya1FUbkw1QU1kSGZnZGNFSFI5Z1pMUnlwYnRZ?=
 =?utf-8?B?V0RjZjUzRWVSRDN2b3JSVmlmQzgwblBSK09QTmpBZmZKaEorSUdNckJtRi9a?=
 =?utf-8?B?RG9FMHFtS0J4QUFBbis3ZGhsKzVFU0NlNW44SmRmQlpWN25qaWxiNzNyNldx?=
 =?utf-8?B?Y3BLZS8zcVFKaURDRjkrMGN5bnNKNmQ2RDdndWJRckRxSXcwZWd2UzNaZGRL?=
 =?utf-8?B?MVZzVUxDMjkzWkZPTTFkMFlqTkZ3Z09HdjVQeGwwYUM4SWtveE5QTGZjRnlm?=
 =?utf-8?B?OTBkYTk5L3p3QURhMTRWMC8xd3krcDYreGQ5TFh2NTZUM25ZSXhFY2grSk5i?=
 =?utf-8?B?RytabklUVFFWTFBqdzZtaWc0M3p4SzJwbHNxa0RySHZHL1RZUzJhNklLSGhx?=
 =?utf-8?B?SzZaVXBFOW1XMWtheW1iRWdaQi9CampUd0E5OXRjQ2VWOUtnMytrNFVERGox?=
 =?utf-8?B?UFkzQjlhdC80Y28rK05CMTF2Tk45SUJEalc1NW1TRS9PRmpkSDdCUnUxbUNv?=
 =?utf-8?B?amFaNXF3WFFHd0tiZGRiWkJ3L2FFbHZyRGlpM1RXSDhsM0hSbWlKMDFWSER2?=
 =?utf-8?B?SjI0Y05qdDI0NGpSMUJyRzJsNUpNcXNSMytoaFpUQ1pjMTE5U2xQZmpZQ2dP?=
 =?utf-8?B?ZU5CV1p1b0xaa2E2QjRhc3A0ZnA3eEtqT25zZGZDSE1JZkNaN08vdkNhSkpI?=
 =?utf-8?B?RHlhZkxYYVg4WGo3ZzAzeE1VWXR4a0hNajJ3S2R4bUpuZVlrd3dWMW9lL05i?=
 =?utf-8?B?ZHBDaUMxMnM3VVZkNVVVUlV5UFZXeXFOb2dwK21WdjhrVEtoaXMzWEFZMnhj?=
 =?utf-8?B?Smd0ZW1WVEF3VmR3Q00zNDMyZExjcDF0bWcxamFFU0V3a2dodTAwRGtaY2VG?=
 =?utf-8?B?Y3VOd2NCUk9ManB0N1U0VnQyeHJzaFZ1WHhwUDZ6WHRrcjdzUU9BY3FWZ1dy?=
 =?utf-8?B?bFdpK1M4RGIyNE55Rjl2VUlhRmlrWllYdEsyOURCOHpwUno2KzhDRElyK1dR?=
 =?utf-8?B?ZUlmWHZtRE5xYlFOcWFjdk14UlNnMDVSRXNNUDBMYmJnT2VyN0g1Rit4WWh3?=
 =?utf-8?B?bWJuYVRkUVNPTDdPV3daM1FFK2ZXdjc1dmpQZDhUTDVxNE9abmpFR2FkSlFS?=
 =?utf-8?B?Y21MdkVkWHRqRzJiU2RLSUNjayt5TEl3cVM3aTdXUHIzaWhNL1plVGhpMVhW?=
 =?utf-8?B?NmNPakpSaGZVSmlxNm8ybFFnLzFsTkY3cy9rSGVSSVBpVFVKb2pkVUU0dVVV?=
 =?utf-8?B?U1Q5U1ViSExQTU8xNk96RHFzMGpKUFZqU09sWmliMUprVDgzZXk5NGVrS2Jk?=
 =?utf-8?B?RER0OEpucFNrclJJckVVSE52aUpTTzdKVmF3WmIxVzBPMEZYeG12SWs1eFRa?=
 =?utf-8?B?eE4vL1RIZzBzVmJoSTFQVldQYzNsMTZWYkpnOUs5ajQvTkhRYVA5QU9NT0sr?=
 =?utf-8?B?ZnRCOW5XMmRKMlN3UnUrem43V1A3aWZFeStkYkpMODZwYWNFMTRibzdPTEhM?=
 =?utf-8?B?VHJnUnVTeVZZQUQzbFgrS0RQcnRrRWo2N1RlWEZFTXRXdnhETldWL1YrWEdN?=
 =?utf-8?B?dDczTlBUMmlNS1ZMbWU3L2huVGI0UTA1Q0s4cURTWWdSeXR1akErTmIzdGt5?=
 =?utf-8?B?MTVjQitlQWc0WDA0dVd3amtqVm9KV2RCZmlrcnNlQ1c1S3d0RnUwdi9RQ2ZS?=
 =?utf-8?B?TXRqWU5GTlpnVGhPSmpTNTBZM1hHL3RqRWVxVUdYTHlVOWJwaHllWjFiN3Zq?=
 =?utf-8?B?K2RUUkZFRFkyKzNqclcxWUJtV3gyaGZUVGJCMmpwV1JhTHBBYnc1K1lTVXdk?=
 =?utf-8?B?Wi9VQXhsb1pDRE1tcXljUDBNQTE0RXozY3h2TEZXSUZacUQzT2VjVk5LRjNB?=
 =?utf-8?B?WVZUeXFydHpDRDU0WGpzQWlOUzlKd2JRWkhmZjMzMzZGVHo3ZEpsRTVpaHZP?=
 =?utf-8?B?L0VEcldZNUNyN0JmZHZldytQcGUvT05KcnZqMVlEZlQyZ0Vxd2JJUW0xanRy?=
 =?utf-8?B?dTYxdzlXVWgrQjlhbDZCRHFVbXgySzZ2V3Z1dVh3YlJDNWdNMisxSDkrTkVQ?=
 =?utf-8?B?OWV6M1E4M01SRHNPd1hBeU9TYks3b2JNN2tVUS9OOENtTzJkUyt0V1ZDTW1i?=
 =?utf-8?B?NFkxbndWMXNKYWxMdmpLKzFWZ2psTWxJVnFncTFQdkxRc29kc212YmdyN2dR?=
 =?utf-8?B?OExVOGVHMzhqaDN1VVIvUWtka3ZQUC8yRjJZajM3c3Q5MXI2Y2VWRnlSdUht?=
 =?utf-8?B?QUttSVR5UTZ1TjNHSEVxQ0FrRDlzbUd6L1VrTEdHendQdVMwajRZUT09?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 24cb1526-fe6a-4aa6-b95d-08dedb363bba
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2026 08:11:51.1221
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dueLKzrbp+/tplv5cwBZ16yjxMh75Oo/xbuVC0q7Ef9BrSrWImpGmSvb3vM3K7abpx5Pa4Hi5fmcmJvN5JvcmOEn2QSHdgCgjfs0lL2q5GY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3P189MB1083
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2026 08:12:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240218

--------------4fm2qxv2zLaOn3QidwwEgJEz
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Yoann,


You're right, the upstream commit doesn't have a Signed-off-by. I 
mistakenly added it. Removed in v5 and will send v3 for scarthgap also.


Regards,

Jaipaul

On 2026-07-06 00:03, Yoann Congal wrote:
>> +Upstream-Status: Backport [https://github.com/curl/curl/commit/74a169575d6412dc0ff532acdf94de35a6c2a571]
> Hello,
>
> The referenced upstream patch does not have
> "Signed-off-by: Daniel Stenberg<daniel@haxx.se>".
> Why did you add it?
>
> Regards,
--------------4fm2qxv2zLaOn3QidwwEgJEz
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>Hi Yoann,</p>
    <p><br>
    </p>
    <p>You're right, the upstream commit doesn't have a Signed-off-by. I
      mistakenly added it. Removed in v5 and will send v3 for scarthgap
      also.&nbsp;</p>
    <p><br>
    </p>
    <p>Regards,</p>
    <p>Jaipaul&nbsp;</p>
    <div class="moz-cite-prefix">On 2026-07-06 00:03, Yoann Congal
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:DJQZ7ABAP9UE.1YN66ML3FTCEH@smile.fr">
      <pre class="moz-quote-pre" wrap=""><blockquote type="cite" style="color: #007cff;"><pre wrap="" class="moz-quote-pre">+Upstream-Status: Backport [<a class="moz-txt-link-freetext" href="https://github.com/curl/curl/commit/74a169575d6412dc0ff532acdf94de35a6c2a571" moz-do-not-send="true">https://github.com/curl/curl/commit/74a169575d6412dc0ff532acdf94de35a6c2a571</a>]
</pre></blockquote><pre wrap="" class="moz-quote-pre">Hello,

The referenced upstream patch does not have
&quot;Signed-off-by: Daniel Stenberg <a class="moz-txt-link-rfc2396E" href="mailto:daniel@haxx.se" moz-do-not-send="true">&lt;daniel@haxx.se&gt;</a>&quot;.
Why did you add it?

Regards,
</pre></pre>
    </blockquote>
  </body>
</html>

--------------4fm2qxv2zLaOn3QidwwEgJEz--

