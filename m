Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D24FC5CFDB
	for <webhook@archiver.kernel.org>; Thu, 13 Aug 2026 11:05:29 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.11])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16452.1786619128620050996
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Aug 2026 04:05:29 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=NP++ljvj;
 spf=pass (domain: est.tech, ip: 52.101.83.11, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iqvNGN1V9iScsqI1WxLUzKxdapZXDPXTtbVPoa49/Rea1Gpg//kP5vm2T5O2kn0ywAWyaeugCHaqPMVKK3YlD+ZvWSFGD4LnmWx7Ez3YV38jUZJqGahTCAjj9q2uBmsjPA3veV0ks1IpwlWWZu+xutIz841agWjuZhvrkOnWiJMriiIa01Fvq2n2a4Z5wj2z1kHZ0BPUCjQBGjpwbqXAS3Qg3GWveY81PgWYIaAjoquxu4ZvVtMpEGz8PMh989dWTlGzeAjpWmKL7QyUXiVoal2FyaJKHjZs4XwgkRKyxRWN786YS5iZ7/VasyRj+lcDshF2JkbEkVp1modsDq0cAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G+aRZPuQZiJPTXzPel6TXrBvuMHk9g83u4DXfTe/eKs=;
 b=q5lQwQP5q/Pt53kIZX+ZcqHx2n01kYqO13HAs1v8jA7v2VVKK+FTRx6Jj7vkoblpbBVUFoFHqGBU48YaGeQtNl65YutEO6V7oDHPzdZbfXR8lC7HThE6fiagaA+10cbTiXFJcZ3D9GWIoWzEwUldtxFfg436Q7RShPprEbwu+1fEsDgiol56goJYgU6OjsqNNRNzxM70WVkCKVSCxPq7+7+LWvAev/QUvFjNjIBEpHfk+kcS5D3hIvmU6qg5ZqN3tedGVgqjmH6FyUzEcFNZ5c5iNuV4k+IEhPrGRVnEdCBdnPYYFqImL+WuTh7jaIEqCoQTZKxuFXKqYU3+xmyPAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G+aRZPuQZiJPTXzPel6TXrBvuMHk9g83u4DXfTe/eKs=;
 b=NP++ljvj1TUK9Pp1xsrjoTyQ8PkUsyAyT0FlK62OuHJrIZz65OhMRzUIEfQNzjHqbDBMx27g1RHlCPg7DfS5OCLY9UjqqjQcKFh4lHxQxxzwaanIZjAPMy6t6oBR5DE9HvDdSoZT9ByuVIw/z0urcoAHxfTdDgXYjt8u6+EymLR8h12yivrVmMfPqFEzQ/Z/SraRkzmB/NkEE7DudqoiJPeilZjYWcx2cad9bM+eGdzXH1WutXAiBIDKEhnn33h5BiL/Rn3NyjASj0dyMz9fcyXwI9h8l9yeZWky99+bMJ3oStnf1d9Ex7hxdFv/ZvkVfklOYlgcY3vqsfoCE7XLLQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by GV4P189MB3680.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:2b5::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.3; Thu, 13 Aug
 2026 11:05:20 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85%7]) with mapi id 15.21.0339.002; Thu, 13 Aug 2026
 11:05:20 +0000
Message-ID: <b33742e3-d23b-4a8d-afe2-11379a5e6083@est.tech>
Date: Thu, 13 Aug 2026 13:05:18 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] rust: Upgrade 1.96.1 -> 1.97.1
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: openembedded-core@lists.openembedded.org
References: <20260717091912.1752666-1-Deepesh.Varatharajan@windriver.com>
 <1500499.1786618088330989780@lists.openembedded.org>
 <CANNYZj9cTUg+Q5JF3GcpXGVOtNHn_TYvKUjj4mQdsyVfiBjLRA@mail.gmail.com>
Content-Language: en-US
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
In-Reply-To: <CANNYZj9cTUg+Q5JF3GcpXGVOtNHn_TYvKUjj4mQdsyVfiBjLRA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: LO4P123CA0047.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:152::16) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|GV4P189MB3680:EE_
X-MS-Office365-Filtering-Correlation-Id: b779af7c-1c9e-4d8b-16b7-08def92ac39a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|1800799024|23010399003|10067099003|4143699003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	HdZ3FTsoWXdvJEcEPho/mqjKHzhXqw/8+u6hRubX8KsGBa/0ekF4oy7vjDSpv2V0ia713El0pzqaJ+RE7w3BgkGzKI0N74s/Lkqdj9TXn2kBnnvoNHURULMy/EBukqF15xBIuMK7ArC/N2PTc4imiUcswOlj82U7ZHwaZkt4Ae5Dhl0OJejhQRqOPaLys61IIaYEqImiCFW7Gz4Nyiks4BKbw+xBMHarIjzkjnnxbA9AmrgIi2A9447EaJc0UcO2bfZqAAXQZrLdWQ24/Ne25DkXwN3RfwC0CXcPhiWHTQwVyaHj957BRW+f++wPNW3sMOe7vXfM2TT4nAwdYISyxw+PYHNkBL6tbc84k7DKYwIiIWoGeE5DvhFJi7QgJYV1cI1fj03MKH28yneAWbykl2244SyouQXnx/am1NiSEYrhF7tKdUWMT0CsCb2PYnRir686oryKWfNlHh7KWuvg5zL4zCQRWozPVgZw84q975xeIG6zzjSvtZ0ceV7bws1fyF3nM7GG4tb9Rqn8WEor4lkW0x3kwcAW8pdvaTgjN94dOGbdNXd3Acmop5dhquB6E4WFuV8C6q3enyUKRVdpRpiWXK00T9M6OriRj+7XB2cBZ+OZ929uWKJu5kny3n8YJNWe84ccrfTxjiEOHOBSplrjzc8h16mlw6+eqUseP5I=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(10067099003)(4143699003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?TDIZOV3SJoTmt/ksmlL077C97ISRoUvSy6cvkKq9utmxvg0aLmLU4vMQuxKK?=
 =?us-ascii?Q?JaSo6CS8cTwKngOf26bogpKLNuS7s+V8vDp2r6vdmXTzABquJykjDLEjWdly?=
 =?us-ascii?Q?jcDIsoXHdBMaRnhKZ+0J80wTEqFkAiTF76kQWSz0Zq4dRiccsg+g0O37AxSn?=
 =?us-ascii?Q?VpPiIBZLRbGfZUDHrL0GQLUH13LRFQ6uoGo91KjjtQYqweMStFzX2ouNA/XA?=
 =?us-ascii?Q?t5sSXg/ZNnw3YYmn55V/9RxQIwGxlD177JyCnLw2apL5hOEYkpKS7OEfR3NR?=
 =?us-ascii?Q?mTjihxSG8Oo6/DM+xRu+nKUyk7O++coOFnJdaIRlNG+bfQybBrkaLRjge6Tn?=
 =?us-ascii?Q?M2cKRMDHwBVYd0XTSvV9YRPwfL0L7Y0vfCIav9n0C3erob0h4SkiMnsFe2Yz?=
 =?us-ascii?Q?p4FWsEfXXMtoPoTuTp5hKtsltxrM6Cq7blX3kP44hyMegKU8LHSGt/MCz50B?=
 =?us-ascii?Q?P+0k6UHrLoF64Zf5Z7KFiGFrGnOVjxjUQs9/f2cZfpnVzKrMueEry1Nt1WOo?=
 =?us-ascii?Q?itgLmY3Zmy6lw/9kn2B2lJvSDC/Hczwe2b89LBgDGF8Be3mXEHG2VN0KxI3W?=
 =?us-ascii?Q?uHTqSBNx1LTjnusd4mVNdmc5oty2fqjCq9UbhC6Yxaa+vk4EJ3tsSPp8mgEJ?=
 =?us-ascii?Q?axStiuf52qPO1XLtzS5TJmRm2UU7cvJ/6/3jjGJZHt58HIkLeZISQ0qmcXHn?=
 =?us-ascii?Q?/Xro9NfYALj6rP/OPAWrgNmt7URZWIJ+Ie6A0e5mei3EAA6CLwAmN9zo0liB?=
 =?us-ascii?Q?LY7MiAkzQN6Ft+cLfW6EYvNs+zq59btf33MYHCiX62wAR33762+j4Ey9BPXR?=
 =?us-ascii?Q?fbRUIx30ju4/wr2uo4wmawvoaUhVzgXp4GvWNF+PJg6nqGEtI8cEjD3Wg6lP?=
 =?us-ascii?Q?+HADR0F2COjzpH40J1eh6WKYWPmGcvvwDxxS3KUQEizoMaHnOM2uPOdRGhi3?=
 =?us-ascii?Q?ClPKuGn/eyAmLiyznxK4y/RqVR387myRdOQyWDb3IqMz1XrA11xYaY2fXKPt?=
 =?us-ascii?Q?/AqR5iPuRpBL+moFVpRhaf+D8bs0ehuDda1gyC9HZW1wJSpeY8SDjbtGtVeJ?=
 =?us-ascii?Q?+r2hFhrr4AU/8QCT7ipQsJaO/J6Qv6pdX0LrwK+IS39b5M1jfMN0yWR4jNgi?=
 =?us-ascii?Q?dxKFxWQljcmudhwyoes6ySew79fs6YYtyMg+WoH34DuJvN8v29ozpKY+Hxow?=
 =?us-ascii?Q?0KzQ6JFSu1VzEvJfHyoLphtPv/NMkG+ychBL4eUzcLzNRLBfkazKrGJE+QOT?=
 =?us-ascii?Q?wWku0MHXdszx+pfzlPnJE52Ck3l7ZGv7Kw3Uh0MSNqW1fIrJdPiXLTc23wW1?=
 =?us-ascii?Q?t2DMeu96tOGuDUb7PVwAoMAWAm97ZWnQivmBlh8zc+gAexaXgH3WtoXNbGHM?=
 =?us-ascii?Q?2RCrUpb3ZCaG1vhhADqtjXjcs4I31vMsh/3cPJ6tzzAPX4Wq8bcIvSmXRkKN?=
 =?us-ascii?Q?8KxMpWUr16CY+mqC6rUZRm1471sG2ie9mUuUoEeuFavw0fUO66aP55Kp76HF?=
 =?us-ascii?Q?ShIh/DVb6t6eM81UNeltDq3F8RGlAJhCQRzqdC5nfEYHXysc4gOOsg99BjmG?=
 =?us-ascii?Q?baRX3zm5IryWcz0UAKA/kXDeJclyTCgp5c3XffG2GVQ9tLK25xil2cAki01g?=
 =?us-ascii?Q?as8tH4GZ1j1hsmPGSodgzGW6UXO+CXHsytkebpzNPscmgw+7rTJl8AlzyJKi?=
 =?us-ascii?Q?Jbv2qRZRfXQ7uaagXmcyYPn3gs6WBcg4ChiRPrwy/UtdBU5R5wT4mHQnXGDE?=
 =?us-ascii?Q?ORK4l8++Y++aIOsTLeOElOpemEwxSaM=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: b779af7c-1c9e-4d8b-16b7-08def92ac39a
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2026 11:05:20.0011
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3cp5YJkrdM5uUAHFtEbdgM/gZW2VfJmBuTbA62g0DJcPw2ZSwaxLa60VDfoTpzhU1vh3w9N5QN0HGb+6yWXEw9M5NyN8hL17YdrK3LtoDwA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV4P189MB3680
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Aug 2026 11:05:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243347


On 2026-08-13 12:52, Alexander Kanavin wrote:
> On Thu, 13 Aug 2026 at 12:48, Jaipaul Cheernam via
> lists.openembedded.org
> <jaipaul.cheernam=3Dest.tech@lists.openembedded.org> wrote:
>> I see this patch got "Changes Requested" on patchwork =E2=80=94 do you k=
now what needs to be fixed?
>> I'm asking because I'm upgrading OpenSSL to 4.0.1 and cargo-native fails=
 to build without Rust 1.97.1 (the vendored openssl-sys in 1.96.1 doesn't s=
upport OpenSSL 4.x).
> This is not related to rust, but last time I tried to add openssl 4.x,
> that quickly ran into python support issues, as currently released
> python does not support openssl 4.x even in the latest commit on the
> stable branch, and we need to wait for a new major release sometime in
> the autumn. Did you check that? Has the situation changed?
> Hi Alex,
Yes, I ran into the same Python issue. Python 3.14.7 fails to build _ssl=20
against OpenSSL 4.0.

The backport PR=C2=A0(#146403) was closed without merge.=C2=A0it looks like=
=20
they're only targeting main (3.15).

I've included it as a backport patch(CPython main 3364e7e62fa2) in my=20
series.


Alone with Python, I also had to fix:
 =C2=A0 - socat: two-line fix for ASN1_STRING made opaque (sent upstream)
 =C2=A0 - openssl recipe cleanup for deprecated engines
 =C2=A0 - Rust/cargo-native: needs 1.97.1 for openssl-sys 0.9.114 which
 =C2=A0 =C2=A0 adds OpenSSL 4.0 support

Happy to share the series if you want to take a look.


Regards,

Jaipaul


