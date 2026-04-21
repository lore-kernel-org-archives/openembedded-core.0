Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34872F8FA6E
	for <webhook@archiver.kernel.org>; Tue, 21 Apr 2026 12:32:55 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.26758.1776774773508083593
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Apr 2026 05:32:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=rWeR/iLV;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=rWeR/iLV;
 spf=pass (domain: arm.com, ip: 40.107.162.56, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=GNRCQTSvo/gQ0RNk9DXR7N6URSoDaoLLciK6JNDoMqKUMN/bWJzlew+bxNFJqPB6pz1stRrnXM19OHb++MnAna/fTtGgkrqHMjifyTVWYnf4pgiE/h73LcqHgxnyY45HE6iBYTznoOt9o87raFBW+X1fG5JAUuCD4bkCxpUYPKh2YIYSpdIbUMBWRZ6PSLHVjzg2K3i8zthxZe5HJ1fjnbgFeu+3pNWNG0QWakS9+I/jIFiuV4KerUYVGeWH+a6PTQf88RJFuoaIJBdPZ1kWHe004M0TCJOCOqeoyyVPZ9jUEO+y4FBy8m7aTX9VB38ZhdWmL4mc6KOZZbuE+NFj/g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tZ9wJwpbalah+VRfkBMrR9nxi0lVKNIwiPAEVBFPoaA=;
 b=VKby1g78IFgpwc7geMz/+Vq/90LOXaxo5wStjRYofd/p45eTiGQSQwMC0FhZvyb44R+Q7C7A7YAi1IdTNGw3eK4NSJ3cQ6jrynrAsacPNqYo+UgWhegkNIKddEK0d7hUEgVaBL3mMg4Q9STbJ5JhirNFE9R/F+SyI0QxJaPoVA6ur4X5qa40Ddo6gO65infMyyb/3OYFOLoJlrRc2LPvKPg5rtKDNp1xnyZkpfV1jxNcjnSSImzajyo1txH8rU027Fo7+dEKBxeitJdlc4hyKvfX7tIFvYubAnqpbQMhT43NTUKLTDWHxOUHJ9eDK1I23AeG5W6mJNs/d1fnvxXrYw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=underview.tech smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tZ9wJwpbalah+VRfkBMrR9nxi0lVKNIwiPAEVBFPoaA=;
 b=rWeR/iLVDJxv4tfMBtcTcxyV/eddUUiF2w5k0GsGRVt2AKN6419YJ2aHFutGtoDeJ3kvGbvqSn2zc1kE7zAfrlpuzECH01SfU3/NDN+zn9rb0bzrQonvcFgtfa80cxZK3evFB9660kyNDNOG+6C4r14tJjzK83uTwOq42fCTV/U=
Received: from DU2PR04CA0074.eurprd04.prod.outlook.com (2603:10a6:10:232::19)
 by AS4PR08MB7806.eurprd08.prod.outlook.com (2603:10a6:20b:519::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.33; Tue, 21 Apr
 2026 12:32:47 +0000
Received: from DU6PEPF0000952A.eurprd02.prod.outlook.com
 (2603:10a6:10:232:cafe::37) by DU2PR04CA0074.outlook.office365.com
 (2603:10a6:10:232::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Tue,
 21 Apr 2026 12:32:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU6PEPF0000952A.mail.protection.outlook.com (10.167.8.11) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via
 Frontend Transport; Tue, 21 Apr 2026 12:32:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IRYSX57KksQWDIEnrdb3RcNJ3WEo6SIeK8yQ3xwK06StIdf6x1Opy12E8mFHPimLZSqC8mqbm6Raldk1CisC9cX78rUDdWzQiXPulYFge098g0sq11utsQ1ATFA4RXwnJRDt4//GPt5sAmFP9Q8copHqItWmyDF2JMW6+89qJoVusRvVH872CxiKTbWN0ZY70UBc85vdyO9+OBGljO8R4fspi30oOjMWnExXqVk6MCDRA7sNsreLTFw/C0c9vAA91emgMMCSLLpzPVW+6E4B4+jqPJUP8s2yHr2rszu5yzuswGEzW13OHQufmPXbpq8YLNX9WZu7P32xj24B/8E1Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tZ9wJwpbalah+VRfkBMrR9nxi0lVKNIwiPAEVBFPoaA=;
 b=VwiJqv+9naTn2/Qvq7d4/Sz+LsRiBtcIuKhGzEQXh4rZ9RCRFkUKsq7XMV+r1EewbN/mmSBf9qO/VTWO9fw5779bSdJdiOE4jryc1VzMeNac1fbDGTxyM1F7Q1nqKRU8dRvm3l4uFVkoFDQ8A5Yo4wniNFZe0H7rqigUfN/6nNxvl1fkB1Dn3YR1ahuvvQqYbdFQwm3idFa/AFgrkOFMXWYi0tR95kwfUW+Ykd/MLYfRi+dG6Igb803rfxl1RV0h0oUPru98WVs/JZtrsCOnyFbG0qgczkNSf+e82HVLmJhTJooAIrd7BEaxNClrGpKituxxCkOKqH6n4z1N/eagZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tZ9wJwpbalah+VRfkBMrR9nxi0lVKNIwiPAEVBFPoaA=;
 b=rWeR/iLVDJxv4tfMBtcTcxyV/eddUUiF2w5k0GsGRVt2AKN6419YJ2aHFutGtoDeJ3kvGbvqSn2zc1kE7zAfrlpuzECH01SfU3/NDN+zn9rb0bzrQonvcFgtfa80cxZK3evFB9660kyNDNOG+6C4r14tJjzK83uTwOq42fCTV/U=
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com (2603:10a6:20b:287::19)
 by PA4PR08MB6143.eurprd08.prod.outlook.com (2603:10a6:102:ed::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.32; Tue, 21 Apr
 2026 12:31:45 +0000
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b]) by AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b%6]) with mapi id 15.20.9818.033; Tue, 21 Apr 2026
 12:31:45 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "vince@underview.tech" <vince@underview.tech>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] grub-efi: support custom embedded grub configs
Thread-Topic: [OE-core] [PATCH] grub-efi: support custom embedded grub configs
Thread-Index: AQHcz31oKtHBgVuZhEe0ypT2Otl1vbXpdpkA
Date: Tue, 21 Apr 2026 12:31:45 +0000
Message-ID: <9973BEAD-DA01-46ED-8BA5-C950F4B15DBD@arm.com>
References: <20260418214910.47616-1-vince@underview.tech>
In-Reply-To: <20260418214910.47616-1-vince@underview.tech>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.700.81.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	AM9PR08MB6258:EE_|PA4PR08MB6143:EE_|DU6PEPF0000952A:EE_|AS4PR08MB7806:EE_
X-MS-Office365-Filtering-Correlation-Id: 67f0175d-2617-4a76-a080-08de9fa2185b
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|376014|366016|1800799024|38070700021|18096099003|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info-Original: 
 MGRO3Siq78Qa9rhCQqfjjiavYM32M24vLxYlWqQHGChVlk7q3NsAYysW4lNYTMK6lc2LP2sDK5eCO3YlB5+7jZMla+JigDWZYP72cXOIit7f6pYavAmJBgfAPS1GoNf64cjnPCMWjvEcjWTF7w9p6Hi/RpQLHIdg5rpefibkUiFShfKLQlX1T1FBbNc1NhJjgso8pCVKDmcdmBFymC7/K7AbSziqtGvztpRKcTdVU8fGp9vI5qCiGsEFBnBgmDbSLV45HW6AdoEP/LZUeLk5RTE5XVVWNm+72+iQ65pYKbwwKB6DkOaGntiXhxRd2B9zbG5vlP69mYXAk13BS1PLRdcIIqvQxOwKfyt1OeZLIsFWHUjvTyzmbTWIzzuYFQQNEyJNMvIze3OnqqvUIeOyTtei08Zo9j9uBVI4Om31jHqUGwPGWSHubGrKkRATEGugNsAOOgvVat74LEF9WKJDUlKC92CP1EeISyaMqISsMQ6q3t5CtJ0sMuLYDTf76VlDYltcRtulA4+W1ZESzBMdrMPmsB8PzkS1VsuzF/KOZa5HXPp2A9kXezc3yU4JDobmSc554yjAto/MqBHxCkQuHBDouRKHjfG5Z1DvQFvw7R6SkY8xl4f9Ig7Kx461j5Qz9mycOKVpgD7Jvt/4PcTuiyP/rfrl9h2ILGObYLT3kNo4k4bOJqiWHB4ZHDb8kfyLsOv98IIkY6dF3G7LM0aHOyBamHyS8yPqELPKvXU/co7/k489GNZaMlC9PQOK9m1fiHnbIduKyG8qmiZIpIleV0ASM7oHN0RgVS6hQiZoxiA=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB6258.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021)(18096099003)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <B5B0C5C35AD0254BA29E7E48860D57B6@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
 E1nEBmBHTF2xStguDJ6rS+ypY/2u5pdZqp609rTvxboKrSH2TwMIoQYYgL0kVU6IL2UPgwy3i01BhGiVbBvy0iYjZFjlQK9H/LoJnBgEIYCglOv8+4yCqVqHaHuLTQz6aEAMUglQH3Y5kMVq7ecUpCrv8QzzKdszC+y9CEGVrurFzCHbh10cayyj0MYS2/4gQUny/fXLXlyHLn1A4yqwmrbTtW6H0+6h4D9OjqE0bADmNIo3/wfnIWQUF1aN7MIqUooAMTh2ijxSblmda+Ggf9yv6Ce2XwvVZyk+p1hl+Nwjh+gm6LCjz+/WczuwIKceVBAMGzW28L+RAUKjiPnihg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6143
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DU6PEPF0000952A.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	9b0e70ad-f40d-4889-eabe-08de9fa1f31e
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|376014|1800799024|14060799003|82310400026|35042699022|18002099003|56012099003|18096099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	iAIqZ1N4v+hKBcBDcDQHwMCcQg4Y7fCh3YRYU1gUF9D/scpj3kvsNdzcA2qlFG2gyPGMWKKz6JoYB8xkNrNC0nZ7HR+Sfs+COuw2zC/rWCfu3YDKesFCr5dMJpC6z9mqdWQoWj2k4AXBSx+Cn3U82sc2kLzXVjt/A7ET12N6mo5sTFg8PDy7HyDL2k1b+oAfzizR8N+0PGtO/8PolRvfc3c5AGE5Fla0GR6dQ1EhwEoPE3digXTZOtZt9oH4NAb/fSZMPwymIlukDhYmq8c6BCcAfqBmiMBm65D370hWny7jw4p/K5TxHBm5DFWpIVE3uJl+5QDzR/z1dHHe6rRHaiCxatBrZwPSvEQKc1di82Hd+rSSwUE1+3BLWrXeJynB4+4PcehmT3g1WJ/fmi8SSNBlsQXYiZDQWzj/xoyVCo9kqMEDTuDyO2K70dFJPjlklA/vFS/ZrM1dSdfnOG1QKaJFJ9Bd7/6YL8/mAx8Q9PYyAD63ZuFRvz/uYra1V9GTwLAr6uGPf5n+8Bw3dIxmf/c0fcAGoGQs0NhkflIEsssKeqzPptu/85z+IXtnMzs15CwXJjXOqfx3RTKixP0fY9JGG0A1PHsPcPa4aJDuLIjMzWv3YBlo3Lu9Lq+W/anQUTdhdLyAn8z5adTSmvj6J0oolXYRq3+jjutL86PauEKr3jwuJEcb0SnSYGYWs1QxXVDYr+MR1sPOKZyXd+Ss78vd/Po5Y3ZYlnBFExk1/TPtBBA8IZnhmkD5E8TCWR6p0yPBD52wCAXflTcQnyBNqg==
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(1800799024)(14060799003)(82310400026)(35042699022)(18002099003)(56012099003)(18096099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	iaATna82DNbS16OrJHdlTfejGB+QFOMi8fMuoL1nd0u2ICoe2EzeN2DGBNlEJ27DCkPVW4oyLiEIRuJZYzbrbc7/PZ0VBYFv2s6k12thglbgaDsM3eP3VMILg6NQUgc73aFSPzDT2PFjoxlEXt92uF9D/y5I8tagVItgGqfnl6AJVtNSFcrCypwOESQQ3hw0gHLCpO0q4/YfaVfZIqFn9XbeGXtfykcaj0kWVrYRTS9AGAObMhKOg86RJK84r1JhvviQtt6UrIjAT1S6/qwgviM+82CnZ0OYYGlxJy1aVszrjK0Dflvolbu8HkNFfryPDMDssa89pjJ4G0ogyhAUbFfzBzYL5IJmTVmUwfZUbuo27+sKMdgLms8+diD2TajF6fBQIIjOCzFzR74feMm5HjDa2FdfnVIP6CVptk80L/5NWDQoeHxTmzF56I7UAXUz
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2026 12:32:47.4923
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 67f0175d-2617-4a76-a080-08de9fa2185b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU6PEPF0000952A.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7806
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Apr 2026 12:32:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235675

On 18 Apr 2026, at 22:49, Vincent Davis Jr via lists.openembedded.org <vinc=
e=3Dunderview.tech@lists.openembedded.org> wrote:
>=20
> Adds support for including custom
> embedded grub configs. The default one
> provided in OE-core is limited to everything
> being in the /EFI/BOOT directory.

The cfg file is in SRC_URI, so you can do this with a simple bbappend to pr=
ovide a replacement cfg file without any changes to the recipe.

Ross=

