Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20455CC6B1D
	for <webhook@archiver.kernel.org>; Wed, 14 Oct 2026 15:03:58 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.31])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15972.1791990235994891744
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Oct 2026 08:03:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=mDC7PM5F;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=mDC7PM5F;
 spf=pass (domain: arm.com, ip: 52.101.69.31, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=SFFPa9EoVQaSQyP7ZyuBSn+miVMrgXrMsSJrAn4ln0pxgERgUuLfX+zvG3UsUyNIq6j7LyEGDA7cLV+j6GyAIl+dnaDQNymcHWnwM/7EUVxo7NtthqnOsd6KcFpYwWDkFDDJSSnB6uOcbyIytSjAfYe0sQgBRUIVKyaybPf+5hUwRfZQVwjm90FwuNyERrR8iUBUyOZ7EshPCVnjVgaqH8fxHDCoFDI4hRH8Cm8W4Z3MluEiGMrkdw133l/UXH9AJprA+xClT0Mt/IYR/XemyfZ6nQUUNdvJoC1+dx6aH6IQIUwuFEKvR6mAfMTOG0Ghi2ZzFH8SL0norPKOH/XHXw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jv0kvg5bqUiKBOJg6Nwd8CYCJ8yHDu+O7B/X9/aU+Hk=;
 b=j9Mkd0hK/COXr9X7Duy2xgFEnz4GZJtzgKGtVWLZG0Js6IYa2mpcybXc/9nEz7UocB6JLWztsCjfwTZz2GS1pv40ywFSZhfqjVaWpm1J4cbTTp4rNSBKpCcw6VwmSkVRaj7duQMvMhwBLXGVQp2aJTeelnHYauXettSDDldEHfqD18p1ovyOexvhz+k38KJj6AjRbplXP4EtGmMgftHfOjPg4ph5KFy39Yxqyki4XmGlffDI1yZ7uY9q1VgztcSPplDrmR3uVMWROWNKPMuPMmd5kl5lRUaYUNaiBpEsGPVazKHa0o7psXF1fFaErNj3lE8+WBuSzIQeBXMmlRwlwQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=bootlin.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jv0kvg5bqUiKBOJg6Nwd8CYCJ8yHDu+O7B/X9/aU+Hk=;
 b=mDC7PM5FjCk64vKl9g2PdYkxkQa1+XQvfwxrLwYZhZSlx3xvCUlbcNJPG8vvoHj7hOpqu4fRsXeyBrO+ZIdybjHCvqQ/2mu1pJpq4cPFbprri7Rv2/lRX1PjkpWY12ITdV10e1sv3XuHAegufAiW67Ihn0FRb7//L4HzLYUzRus=
Received: from WA0P291CA0016.POLP291.PROD.OUTLOOK.COM (2603:10a6:1d0:1::28) by
 GV2PR08MB8511.eurprd08.prod.outlook.com (2603:10a6:150:b5::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.9; Wed, 14 Oct 2026 15:03:48 +0000
Received: from WA1PEPF00009B3C.eurprd05.prod.outlook.com
 (2603:10a6:1d0:1:cafe::2e) by WA0P291CA0016.outlook.office365.com
 (2603:10a6:1d0:1::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.496.5 via Frontend Transport; Wed, 14
 Oct 2026 15:03:48 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 4.158.2.129) smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 WA1PEPF00009B3C.mail.protection.outlook.com (10.167.242.42) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.6
 via Frontend Transport; Wed, 14 Oct 2026 15:03:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WWehG2npQP2LFKLPO6LANC+toE9D81syr4qriSOZIHxYoffMT6th+C4/FJD94mEAC74Gaa2i0anxJunLxmMElEbkeLjQj3bS5JpNOvgWhnEph0mT0f0H+ofh1qETy1WUK4tErdCCdVFFWD5S/Dqc9HF/AeLNDiZygnlMxyA7joqHm+hyU9mhh0cBsXg84AKUFDnlaaaVJ3WtnAZfQz3D9li5rp7Sv4cX5312TvlSLbs7h73hpkNTsK28SueYaPw8a7fnyJuYjG3CXHUO0qxu+mbHpOvfne3lvkhDlpJGSz5oUd0gZtD3BMsrN6Wdt3yojnpb0FZJZCD0WS6Twrgajg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jv0kvg5bqUiKBOJg6Nwd8CYCJ8yHDu+O7B/X9/aU+Hk=;
 b=yjTvaX/ttI+uf+Evy5ivO6PO8xjRGErETh3Uc9ge6XQhk7JMGOM3vFFG2t8ONxYBxxNzuCbbpg+ObfzmcLnPAJAI67gsH/B9H29pIs8a8IaPlUlHMBYSIi9ndrxnt84aG+Vbd5n6mWL3kjaHvO0lTetJMEQgU8ElZwr7VwLIrZlS270YotTc1bfcwCZXysuFq8A7bckLBKJWp3tRdOgvx5JO7sO8hS9QsgPFErBby8Q/2tryXFVls/QRB9LaitCPAnXYtI70jVlJJn0eTbrxzRfSzEDVw+uXXTRXvLIBiruyMKWgQJQsj2n9H+rC84yufZezavJeP+B4Hc2ATWohHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jv0kvg5bqUiKBOJg6Nwd8CYCJ8yHDu+O7B/X9/aU+Hk=;
 b=mDC7PM5FjCk64vKl9g2PdYkxkQa1+XQvfwxrLwYZhZSlx3xvCUlbcNJPG8vvoHj7hOpqu4fRsXeyBrO+ZIdybjHCvqQ/2mu1pJpq4cPFbprri7Rv2/lRX1PjkpWY12ITdV10e1sv3XuHAegufAiW67Ihn0FRb7//L4HzLYUzRus=
Received: from AS8PR08MB9410.eurprd08.prod.outlook.com (2603:10a6:20b:5a9::13)
 by AS8PR08MB6373.eurprd08.prod.outlook.com (2603:10a6:20b:33a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.7; Wed, 14 Oct
 2026 15:03:15 +0000
Received: from AS8PR08MB9410.eurprd08.prod.outlook.com
 ([fe80::1f2c:bae7:a4d3:fefb]) by AS8PR08MB9410.eurprd08.prod.outlook.com
 ([fe80::1f2c:bae7:a4d3:fefb%5]) with mapi id 15.21.0522.011; Wed, 14 Oct 2026
 15:03:14 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "mathieu.dubois-briand@bootlin.com" <mathieu.dubois-briand@bootlin.com>
CC: "vanusuri@mvista.com" <vanusuri@mvista.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][patch] python3: upgrade 3.14.7 -> 3.14.8
Thread-Topic: [OE-core][patch] python3: upgrade 3.14.7 -> 3.14.8
Thread-Index: AQHdVwOq0F6jJlZMqUakWhdNdSrGZLb07/yAgAg8NYA=
Date: Wed, 14 Oct 2026 15:03:14 +0000
Message-ID: <7E3E512D-59C7-42EF-896C-257A336EFB0D@arm.com>
References: <20261008090135.1485765-1-vanusuri@mvista.com>
 <DM070UI0TERG.1A3WINVYE19HJ@bootlin.com>
In-Reply-To: <DM070UI0TERG.1A3WINVYE19HJ@bootlin.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3864.700.51.1.1)
Authentication-Results-Original: mx.microsoft.com 1; dkim=none (message not
 signed) header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	AS8PR08MB9410:EE_|AS8PR08MB6373:EE_|WA1PEPF00009B3C:EE_|GV2PR08MB8511:EE_
X-MS-Office365-Filtering-Correlation-Id: b86de675-5542-4137-afbe-08df2a045966
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|1800799024|23010399003|366016|376014|38070700021|56012099006|11063799006|4143699003|261009223027099003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info-Original: 
 ZbhfpSd6uNjc1WQ8rcDMQfG9FmwJcUeqDKIDDS98iuvFQdUo4rFj5ScYyIJ1TCXgXh2Yyy+42goAsumjWnF0LLd03Q2vOVXGJVa/c28x0Rrt/8Y0XrHWAYkEwKB/KA5/tio3VadFt/jq7IKU/r2D9plXyMDGw9r1GV8wQzZrnbzxUrduGt6PmaY7OPmlJVqzHY6BEAfmexw1JO0L64vFbLKAttmK2ziNDwx58X/a9z7uwEvHdQt++nTbCjSbZFf4dzMPvK7cWpibue5qDUGeS47pj8xBeRsyV0YjL5rRe1OcCoAKu1/CZHrmYQ5kMT6IOPNN1dqun3IUhUxjOG1XlsWdBrCj9fTKi/XNYdvpTAsDo297TTaHCGbtFKD2irxG8/4aEudo0BCcgTXOzp8PGg9T4H5O0cyui/mf0ZOs/Chwzfiql5tHN988sYuRAMlx5UGjvPlIXuJ6x+0mrDU61MqsaRfYqbsFGEedx0Sjf5/OYHcj0VOKuty5fzYUhn9YMbJiZKzvXof1rOHHAg9zKwEoq0XcfibusQb6GVlfznTuIRmBN8pjZUoA3r97Q1qnUj/A+wFgStMGiTs/PEtaFEiaYypXSJjyMbJEKEUglxJRVvwYzAWhvESeiK4telk7NXJlSBj1J8GOk5WeMD6glUWrC/xH0tlXqumHMqm1uRA=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB9410.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(38070700021)(56012099006)(11063799006)(4143699003)(261009223027099003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <9E838B12774E684ABE5F71831E615FFD@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
 XBBWEdX85NQUYzSZv/NTuCWcw3cO4e5QCIj/bSSzobatw5w+7rNz38I6cyhzt8rU2VaSn7PxWUz3SgWbDYTtnb3Q35ZlBmOTZrlFhS2advGvp0vRjsNz32/hD+wwaSQHiiNom5PVoqp6xWL8p7SW4jPOD1O6YTW+F0VNMgvwN8GZjzrADcndKQicwqB3PQoKgPZiw/T9H+ufOrra1AIv3oZjKBvxhWpE+zqCIvmdj9srP54LMq+oegbA8Awuec3PrthkVCar7+yj6kCEe+7sJOuJYUYgeWhNAYG4UuZprKQ3ru1cn8sCp/k4pj4ZTFjRaCMY0gF02G78KmYCP0XfoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6373
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 WA1PEPF00009B3C.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	f1ad14d2-9ae6-4c94-feab-08df2a04455b
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|14060799003|36860700016|35042699022|1800799024|376014|23010399003|22082099003|10067099003|18002099003|13003099007|261009223027099003|4143699003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: 
	6l6YsGmkIvCthOmh5xuTpBHjoVZrGPchpTstxx6Z6zuNw+LNysYo8mWN0A9DYYCXLQ/E4ajrkerXI3BVk4g73+F0gKoptQpRh9+Nth5LBPtiLogADg2AIkfg6qXEEhHw+b+VCgGZUj8fpHVHJQJ6dbPg1c1Yp1IybniZHrLwtBlVpmid7J0d2NM5bNiA8UG3pVo2ubPzyEFB5dS2FLIhpuQRRV0KLrS3Gi/2/pCMTVYwOi7xioLy8ADsPzaDQEcW5pwBJIuRBpbfywKJ5VfuQmosyEsHJvslzY+/uM7X/pMr2pe0hVaCstFECqwWUGqs5uya+yNzObPvDZ6k+/ROpIpybsfxbt4WplAZRZwxjjYh7cgawX5Yv2sd1r47yMZnMffq0AwUxcB6OzFJ3N9s2q/0FyfdErHZp35uQYQlAGaC4cGPUWqplshZQjqSIMsYf4GiQ+eNwCIsJEFM8pVUAulZAUCIZuXQYy56ceaHa2lb4+ZPn2frHRoSrOMR/8rBMJmAJy6wy+26aqV+u7kBSe+OsWKOtSARN5Dyy1j1I1D+lMuNufe0KJKtmW8osLCqID5pkgkJUSBLK0OVnx3LI1WEmJtJKx6CnynXwWtIZvcV1GKXfR3o+ejP+JgKLPUhU+3zWBcYDpAhlRZ/YZL47Q==
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(14060799003)(36860700016)(35042699022)(1800799024)(376014)(23010399003)(22082099003)(10067099003)(18002099003)(13003099007)(261009223027099003)(4143699003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	9w5xb+VZzLohqXaXcuXKV9F1QNnNtAcbbf0TzePiTm/Mtbbqvxjo2WwESrVOUkKmuxgtlXKEfj2nytHuOyOYxC5XFTv+vWuqKlICWrYjgOYd/0SG4DYmaKAhbN1efczPdGRQLDFPA3jxdHH9XXTsm4Tw6Qa2f1Nb/Zl2pe/Ay9QKqKNXhFq11as+ha2HdIj7TYpf7HqLNdAN01l/hr6UuNQ2xO9+q6aZQGZHcZ4yD1J7j3Wr8fHbjuJsFrvt5w6jXU1y/JGL0Jrsa8DNMjTsn6FoA7PGWOEwzAKm5uzmPbJTNeuWnvGah41pYP26McVMJM7iZEhL3umK24e2TyI4eIRn0mQuYiq3c4ivOtaLXKSDVMCrV/FU+RyrK1MqlRwwN55KiAMZ1vUO/PHo8w8B6QuOi205cjbnNwIZvn841iSCQsH6mm+KukAV8EnAbrkm
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2026 15:03:47.6197
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b86de675-5542-4137-afbe-08df2a045966
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	WA1PEPF00009B3C.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB8511
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Oct 2026 15:03:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247779

On 9 Oct 2026, at 10:17, Mathieu Dubois-Briand via lists.openembedded.org <=
mathieu.dubois-briand=3Dbootlin.com@lists.openembedded.org> wrote:
>=20
> On Thu Oct 8, 2026 at 11:01 AM CEST, Vijay Anusuri via lists.openembedded=
.org wrote:
>> Release information:
>> * https://www.python.org/downloads/release/python-3148/
>> * Python 3.14.8 is an expedited security release and the eighth maintena=
nce release of 3.14, containing around 354 bugfixes, build improvements and=
 documentation changes from 142 contributors since 3.14.7.
>>=20
>> Handles CVE-2026-19445 CVE-2026-19553 CVE-2026-19672 CVE-2026-15310
>> CVE-2026-15806 CVE-2026-17084
>>=20
>> Changelog: https://docs.python.org/3/whatsnew/changelog.html#python-3-14=
-8-final
>>=20
>> Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
>> ---
>=20
> Hi Vijay,
>=20
> Thanks for this upgrade, but we have failing ptests when building with
> musl:
>=20
> WARNING: core-image-ptest-python3-1.0-r0 do_testimage: There were failing=
 ptests.
> Traceback (most recent call last):
>  File "/srv/pokybuild/yocto-worker/qemux86-64-musl-ptest/build/layers/ope=
nembedded-core/meta/lib/oeqa/core/decorator/__init__.py", line 35, in wrapp=
ed_f
>    return func(*args, **kwargs)
>           ^^^^^^^^^^^^^^^^^^^^^
>  File "/srv/pokybuild/yocto-worker/qemux86-64-musl-ptest/build/layers/ope=
nembedded-core/meta/lib/oeqa/core/decorator/__init__.py", line 35, in wrapp=
ed_f
>    return func(*args, **kwargs)
>           ^^^^^^^^^^^^^^^^^^^^^
>  File "/srv/pokybuild/yocto-worker/qemux86-64-musl-ptest/build/layers/ope=
nembedded-core/meta/lib/oeqa/core/decorator/__init__.py", line 35, in wrapp=
ed_f
>    return func(*args, **kwargs)
>           ^^^^^^^^^^^^^^^^^^^^^
>  File "/srv/pokybuild/yocto-worker/qemux86-64-musl-ptest/build/layers/ope=
nembedded-core/meta/lib/oeqa/runtime/cases/ptest.py", line 27, in test_ptes=
trunner_expectfail
>    self.do_ptestrunner()
>  File "/srv/pokybuild/yocto-worker/qemux86-64-musl-ptest/build/layers/ope=
nembedded-core/meta/lib/oeqa/runtime/cases/ptest.py", line 121, in do_ptest=
runner
>    self.fail(failmsg)
> AssertionError:
> Failed ptests:
> {'python3': ['test_append_limited_history', 'python3']}
>=20
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/109/builds/1353
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/110/builds/1341
>=20
> This was recently discussed here:
> https://lore.kernel.org/openembedded-core/DLUD1OK99YO3.1QPQV67EMZI06@boot=
lin.com/
>=20
> Are you willing to investigate this further? We need to understand if
> the test is failing because an issue in python code or because of a
> dependency we are using in oe-core.

This is probably related to some libedit fixes that merged upstream, in an =
attempt to fix tests that were failing when libedit was being used:

https://github.com/python/cpython/commit/e87da800b6103fd890841688da48e41e21=
1be7b9

Ross=

