Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0929DC433F5
	for <webhook@archiver.kernel.org>; Tue, 15 Mar 2022 14:24:35 +0000 (UTC)
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (EUR02-AM5-obe.outbound.protection.outlook.com [40.107.0.60])
 by mx.groups.io with SMTP id smtpd.web12.11350.1647354273168833568
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Mar 2022 07:24:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherrycloud.onmicrosoft.com
 header.s=selector2-cherrycloud-onmicrosoft-com header.b=rCbD8GlS;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.0.60,
 mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e1zxyqU2bdew40PpMgCqr/pv/i1dtJwaqpvO3t2ctJC40y3KRzRyoMCqoGQ8Y08dgjIIs/O34IdsCV/2QuGmtQugHQyXvRfrTKCovHLfyo0RLOEI1G1Keadj4ksJ/CzElVeHjm+v1V7YykLGypRphxRZRC7u4LXI5bhcxOK2IXPv5gTvbadAXNS9tcLotEKXJ2mDyd2CJ2Hy48nSkgdTpInKE1sbZWqr2ojlh5oPGZeGxh2BKrKwwCy0W7LMowmWvs+/SjDidIZBZpRRSS9sOmI/S6iXCa6JCQRNACN8F/VfLBzGCiODSIpwEyx53/yJ4512AzyocOdVv0e/ewKRaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e21M1mwsft1nP/VQScR22xoZtRp3yeZ0lx/8cDYftFA=;
 b=iQrZsV3CBDYh+8fm+nxlRmvojXT4SGz8ctTMQAZAEyw20B/QuZlsymAWa1uKcN8+rr6H2BBBkh++XBS8VeP3kSqQR0g977o4inwR1x1hkyOCEaQgmHpsT/xYwEVkATWQ8Zl9/4eRbItp+V6aHlSYNTZT38jILaTn9DD5tQh28ANXN+ln0QPVwjtXoULJQ/4lBcAnqJ7qzeLOBf4sT/PAxVHVNZ0/r58HwbNA4+q7+cpHq7bmTWUOMldM2heHyX3rS6FOBUoJnFUAZ2aezoRkJ/YRQNiXlJkP+NoWFAd2/bFC0k6LIbidMFskSljkV05jPmLbyNIEA2ecgQQemNvIaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e21M1mwsft1nP/VQScR22xoZtRp3yeZ0lx/8cDYftFA=;
 b=rCbD8GlS1Ceky7RPlBRtiFC+I/1iAeOwyo9QfgYeiBwuO2fAUjI7J4EswDdMPQiuwyCr0Rku01dnGmJHICun9m6tkR6RbP2uHEcTqNbdMas04sVbj0D+Pmk19CFkk1zqkeguKUpDptlQ0ZDDy+Z2iVLWZet0As/B6L+YGj2gzf4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com (2603:10a6:102:2aa::7)
 by AS8PR04MB8120.eurprd04.prod.outlook.com (2603:10a6:20b:3f1::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.14; Tue, 15 Mar
 2022 14:24:30 +0000
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::1d2b:fd77:d076:a391]) by PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::1d2b:fd77:d076:a391%6]) with mapi id 15.20.5061.026; Tue, 15 Mar 2022
 14:24:29 +0000
Message-ID: <05c881e9-6518-9525-1182-1c447e865bae@theobroma-systems.com>
Date: Tue, 15 Mar 2022 15:24:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [OE-core] [PATCH] sdk: support uppercase characters in MACHINE
Content-Language: en-US
To: "Arnout Vandecappelle (Essensium/Mind)"
 <arnout.vandecappelle@essensium.com>,
 openembedded-core@lists.openembedded.org
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
 "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
References: <20220315135646.3687446-1-arnout@mind.be>
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <20220315135646.3687446-1-arnout@mind.be>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR07CA0188.eurprd07.prod.outlook.com
 (2603:10a6:802:3f::12) To PA4PR04MB9367.eurprd04.prod.outlook.com
 (2603:10a6:102:2aa::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bae97f2e-de7d-4e57-5d3d-08da068f843b
X-MS-TrafficTypeDiagnostic: AS8PR04MB8120:EE_
X-Microsoft-Antispam-PRVS: 
	<AS8PR04MB81201936FDAC9CA3DE681C82C2109@AS8PR04MB8120.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	UTdT+QcOtBrYfuV4uyYDQOX6zEePDlzqX1jNCte3ATzqNg+Q/GRgoXzsTqrunKKIwzkgn/nTmGkhr5kCU9SFkz8dw8n2TGbOUxLTldMYNNyGp1bO3fhi0ReUEShr/ii9uNAuONOOw5LN3jZFLQG7jLmsnQNJNBETelajc5j/PXG0NZ9OZBxKY/RmCQTZVJRAU0R36CKNf6E73+QAXg5NLY9l3O6NlEm1gkj16PRFt+FsxdZ+OmsPEkmxPN6Zws3FJoihhrZlLU3yJEo+4ZC0dHJmiL46onq1162U0BV13KIyDwTWUUcUZYpe0wRdQAmel+pGai+MabemN9EQPD39sEbmsnmAKy9VozoUybWJdKbGAupzD++aYWEmAPt7y80EikhgAMTpbBxMWlXKzCZ2bbyhQ/eVOJSPs5U0Q6unZn1Wjpz+ENbIPqM5ibtobWFf2pauLPrx98hbUsnw6+zgGdQkGAKjJKtyQS5D0coGZl7UGcMHQGb6MVWSTqW2ulV3AGlFQTR5qbiXSarLwhOQxJ2Mfz2YnHg+QRahQWfcurZrOhe40JyHzBkUNSCPNYP4Dxs5Yu22woqf7bPF/JXead0YgO/vPPkKxEpwQ0mD629F4QAzsZ2o4oHVlwr4tH7p+QtvmQi3LFXkEZ0g3NlccrzMVIVX2Y1b+IOErsBHDd6cHd5eRuhEeaMggWKcgDyapBUmt1LLZmgJ5gPkBlHJLlrk+6lnl8WaWOdAFKnrvtuBa69AeaiKSocJZ73y+DSTWAZNWhaRXOEMWqj1F8ezWIg7PbxsQpRJv2fDbpnkN0M=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9367.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(508600001)(36756003)(316002)(8936002)(86362001)(66476007)(66556008)(66946007)(31696002)(26005)(186003)(5660300002)(966005)(31686004)(6486002)(54906003)(53546011)(2906002)(38100700002)(44832011)(6506007)(6512007)(2616005)(8676002)(4326008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?VG9rTGxDdDdObFh3dDFPaHAxY1lMTGVjWENlT0l2STBEOTFQcHhVZlNUWjdV?=
 =?utf-8?B?M3VaMzhQOXMzRTBpNzhOOTdyV0dRbmhqY05JcWcyeFdtY1Z5SDdYRjRSUVJr?=
 =?utf-8?B?WUtBR3BIb3FIcUE4bTNzV2xTWkVEbHA1cnZTUFBFWjUwcVdBaUNWaUJoek1q?=
 =?utf-8?B?QnhoeVpPa3lyVDhEU0FsUUlTdk5HaW9jRHMxcEhCdktlTEk3RnpaRWlrKzRB?=
 =?utf-8?B?VTl4VEtQdGoyOEZYdzlCaHhBQ1ZHelFCTmtKemZEN0gwMi9yNUZWN2VxMENJ?=
 =?utf-8?B?VkdicmJybmpoNWxFT2hkUVJLcmRlYkRFR0FqczlTQ2JWY010MWRSRXo5NWJ1?=
 =?utf-8?B?VnFsa0RveGFobjlyTUV1YjVpV1hIL1NqVitPd1VrVkhSdFBMbFNoMDB5ZUNU?=
 =?utf-8?B?QTZNY0wwSTFmNytDMmYwNFhJdWNnTWpvWnNnemtUMGhKQzdTdVRqWXZoRjRS?=
 =?utf-8?B?Uy9CN09zV2tneTJ6MUJyV0dzS01zeVF4dEJTMDNBbTNHc0ltc1ZoS1ppMGhC?=
 =?utf-8?B?Q0prTnBvdFBGeUFhY1pFeXJIckpxbnFheXVsUUNsMVg3c2NEa29QekRJNGVm?=
 =?utf-8?B?amlYS1RDSnRrdUxuQm94a3l6STk5S1RCaUM3djZoZFUxWWtqYUUrZy9YSWR4?=
 =?utf-8?B?TkNwWXdLVlc1STgzeFdDQzNxWCt3SkE3dTl0U1dCU09laGlwQlFhYmNVbE5z?=
 =?utf-8?B?SEY2LyswMzg4NDQzWFZSbUxtU2lMckYzVDdFcXQ4dG52b2hXdm5jQXYrRzlO?=
 =?utf-8?B?aktYdFl2MU1xN3R3eVQ3M3QxSWpBd2R3eEdXT00xNng4dXMwbU9OY2JFNUFT?=
 =?utf-8?B?Yk5LZkdzMGNVUEk4dE1iMVJoeWRJMUh6VFoyaW1MNjZ0K1g0L1c0dVpGRWNO?=
 =?utf-8?B?WUN2eGticzhkSFZLL3RGc2VEcU8ybHZUUDBzdHlSQjk5QjM3bGJtTU5nKzlE?=
 =?utf-8?B?Um1ERkw4bks0Y2ZOS280MGJVOG0zTnZOdFNILy9PQk1XazErMkRINzFSUFpq?=
 =?utf-8?B?OURnbWJ3MUUrL1g4Q2xNWTVBMS9oWU5hZzNpaFVoOUxUb3ZpVi9qZTRUSGZV?=
 =?utf-8?B?UThKdTdaWXhBcmNJejFGYWFvZUdSc2VZeXpVZm9OeHZQTkZvOStWSWdDbnFw?=
 =?utf-8?B?bVIwUHgyeDdSejU2S2lPU25SV1hqVDFXclFRSDl2WTJGaWp5by9ETjFjUGp5?=
 =?utf-8?B?L2k0dUhjUGJ5U1ZaOTlmYmE2d01iVzJJMXpWd3dXWDNFbHRRc3VaYk9rajBT?=
 =?utf-8?B?MWJhR3pDQW4yam8zYVdlMDJYc0g1NGlGUjJWaVN3T0diVTc2TDRidVE0QW56?=
 =?utf-8?B?YnQ0djE1RnI4dzlSNk4vbzJPVDNadkxBNXFZS3RnK1ZuNmF1dm1PUE9mVEFQ?=
 =?utf-8?B?TFFCNXJrK3B0blhSMGJVYURESDd4YzVFeGJkaFZ2MVI0aVo2eXBTRjRmWXQ5?=
 =?utf-8?B?ekpDNkpPK0N0MnkxZlNVdy83L0Z2bkJqRkQzQnAyWUtKSVIxNTF0ZExrK3FN?=
 =?utf-8?B?SWNvY0UvRG9mWnhvZko3S3hXU09oejVJV1crTE00eTYvK1hXSW8vWVZNUk1Z?=
 =?utf-8?B?V2N6TkVaeFB3QzZUYVBoSHNiMlNLWng4RTRXSTEvQ1lOczdJdWpKaUgyempz?=
 =?utf-8?B?UWdhNExxZkJaUzRuYmt5eGJUZ3JtNisxZEdyanJ5QVN6SjNPbGZJT0hJTFVR?=
 =?utf-8?B?TG5tN3hrMVJuTzI0a1lSKy9ta3ZpeXhlZnNlNXNXTTh5WjQ4bHpUem91TWhm?=
 =?utf-8?B?aVpvdDIrZGJxQ0VmT3NTTS85R2FBaThxM3d2cUxTcFVubWN6bFVxSmQwb09R?=
 =?utf-8?B?aUs5Mk44WFZRanQxMDNNYWpVenZ4UlpnTDZ6TkRiYXRtQUgzbnRIQ1M1YzJ2?=
 =?utf-8?B?cEd0ZmVlSUIrRWphd3ZCNWtXeFE4Um5razlDNUJ1MndqRVZLQTdyTi9XS1lX?=
 =?utf-8?B?MFpqZ01EcWlyNmNjWUd6RnlqMEkwa2g2Qmg2VlZiZmcyYWRMR0UrRGw3QlhB?=
 =?utf-8?Q?YpvC9+7LjwtmiQ1DTdZ/Bt83jY0CKo=3D?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 bae97f2e-de7d-4e57-5d3d-08da068f843b
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9367.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2022 14:24:29.6807
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 HI+a3xFN/YtsIZhFS9HJah9D5IqZZK/QQmCk1bPTYQJdofvjOf5NWCyW2Kaa4t4uk69HO3/evIcnyuF6IcgZX+a7brQrC+JBIgKP+2L3RkssdbCscGC9474ORo/yy0ET
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8120
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Mar 2022 14:24:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163289

Hi Arnout,

On 3/15/22 14:56, Arnout Vandecappelle (Essensium/Mind) wrote:
> There are no real constraints on the values that MACHINE can take, it's
> perfectly possible to define a machine with uppercase letters, and
> building for that machine works fine.
> 
> However, the (extensible) SDK targets include packages and packagegroups
> that have MACHINE in their name, and uppercase letters are not allowed
> in package names.
> 
> Therefore, convert the machine name to lowercase when it's used as a
> package name: for meta-environment, meta-environment-extsdk,
> packagegroup-cross-canadian, packagegroup-go-cross-canadian and
> packagegroup-rust-cross-canadian. Propagate this change to other places
> where those packages are referred to.
> 
> Alternatively, it would be possible to outright disallow uppercase
> letters in MACHINE. However, this would affect any existing
> configuration that currently works fine except for building the SDK.
> 

Overrides for machines starting with an uppercase letter have been 
broken and might still be (I was bitten by this on Thud). I don't know 
if this issue still applies after the migration to the newer override 
syntax though.

e.g. FOO_Machine will not override FOO for Machine, it'll just create a 
new variable named FOO_Machine instead.

Also, I seem to recall some weird issue with uppercase letter in the 
middle of package/recipe names. Bootlin discovered that issue in their 
training based on Rocko (?) a few years back because of people trying to 
use nInvaders as the recipe name instead of ninvaders. Pretty sure it 
was Alexandre who found the issue (don't remember if we ultimately found 
out what the issue was or just recommended not using uppercase letters 
at all).

> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
> I have only tested this with the base SDK, not with the extensible SDK.
> I also haven't tested the changes to tclibc-baremetal, tclibc-newlib,
> packagegroup-go-cross-canadian, packagegroup-rust-cross-canadian and
> maintainers.inc. packagegroup-rust-cross-canadian doesn't even seem to
> be used anywhere, so I guess this change would need to be propagated
> somewhere externally.
> 
> Ideally in addition to lowercasing, any other illegal package name
> variables should also be removed or converted. It's less likely though
> that other invalid characters would be used, since that will easily
> break existing recipes. Also I couldn't find a conventient function to
> make such a conversion.

I'm not sure it's worth the added complexity and confusion instead of 
the other way to do it which is to check for "harmful" characters in 
some critical strings and flat out fail the build if one is met. But I 
guess something needs to be done.

https://docs.yoctoproject.org/bitbake/bitbake-user-manual/bitbake-user-manual-metadata.html#conditional-metadata 
is the only place where I could read something about the allowed 
characters. I guess we should explicit this in some other places, such 
as MACHINE in the ref-manual.

Cheers,
Quentin

