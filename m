Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 983F5C5B559
	for <webhook@archiver.kernel.org>; Fri,  6 Jun 2025 10:28:19 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.24])
 by mx.groups.io with SMTP id smtpd.web11.30453.1749205697325195005
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Jun 2025 03:28:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=bdNp2KWU;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=bdNp2KWU;
 spf=pass (domain: arm.com, ip: 40.107.130.24, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=SWaiaVmxT/i0a+ij/+Ik73GvVQ9OvkE4xmHqp4yghcHIiM1/MHG6DtxLWbBmtCCaLtu+UxXpSnxqKfw7dwCEEei9c0g06oevkCr6yvKku2Orsk9WSJPQGeip6WvaBuRrzUTuFd838k+fCvcXZCxbGWmQLCwndGfjtu/dwOVGbtx5dTjCzncTNM2cGS5Vys1zpjHjTyAg1cWWtV6rm94Enn1CLS3Jkpy8aAv015Fu2ykYh+fP7C5+/th4ovjzLC/C8PLkV4skZOAU8FsIhKZb6Zgb0GHd9WLTNSR7vRV5tAG6Ct1xgbIy0jgZLTfVXQSDnrHx0YIPTO+X05QzcCBgfA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ezYb7LHi770sDLW1M2PSf8WcAjAZBN/SuQOTThS+b3Q=;
 b=Qw3CmNqQHph74JNLdSjLo7szZud2AcCyzdBpPDiZnwbU25C1pZEsA3pLGu6k26LRbUK9V49K2vCM00lv8jPNkQTNntPQ7urofRD2bI6L4zc9Etsq6bEz6XxAMk2lxLEN4C+z7frZab2/aJVXiXjGUd3H6XO4T6Y6PzDChm3GS/URKu+d2zsT4xVmcgFL1fFdTH2IdshjJixjHrU3JCYl7bcTFohRUZ0UP2n+zbVHwppSY3pxrhh7WecvxuaTtnxodZF6Pk/AFpYHW1JvRsT5rrxhhlXGyfsEDbR/UW/IhETAE6chQ5WkOzHtmqMYYsqGUW1c6JdXuNBd5GhkUeOjTA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=bootlin.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ezYb7LHi770sDLW1M2PSf8WcAjAZBN/SuQOTThS+b3Q=;
 b=bdNp2KWUVrHy5aYJ8LXWQsjX7Sha+velYDVc3y8U2q9hI70xzTqZMOSzdVGgleSz3wkB8C/1Nx8qXvCNOyK5OSSpjIlLT7Tbs9mt7hepkT3AbA+OJkF0xYrx+VNO/i2392Aws8iaueIvvIlgF8u059ELB4TI6BEalTS4/gunUo4=
Received: from DU7P194CA0021.EURP194.PROD.OUTLOOK.COM (2603:10a6:10:553::27)
 by AS8PR08MB10361.eurprd08.prod.outlook.com (2603:10a6:20b:56d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.20; Fri, 6 Jun
 2025 10:28:11 +0000
Received: from DU6PEPF0000952A.eurprd02.prod.outlook.com
 (2603:10a6:10:553:cafe::35) by DU7P194CA0021.outlook.office365.com
 (2603:10a6:10:553::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.35 via Frontend Transport; Fri,
 6 Jun 2025 10:28:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU6PEPF0000952A.mail.protection.outlook.com (10.167.8.11) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.29 via
 Frontend Transport; Fri, 6 Jun 2025 10:28:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YRgTkK/7UhCDi/jMdmOhLZDEOMcSBPXTMsVyHzeeeGC7G5TkfLA7ddPs14cuM7wriXXC83MtBe/t3drZZz7w2hcp6W3778bJElejhKjxIundfk8wXyS2fvdOQsBtvsYeqsLXP4tUkJ8pQ7KF9HWp+BvlHHP792uoKsUtDSW6Tg5gaDaSv8yoa02MlN2FVEOIv0upuEJ7YFs8yzoarQc8yJiAwo6Q0s+xVjMYcAvSfnAOVsVVgIkwSJd0lqOIB/YQJ3g4jpFXNJlcDCxrCdJQe6vgJJ9E/VA8lUJzot8p6QEu/XeY7+WtuDzsDfnQu+ubirDJdqNcN/9eCAtNqTNzrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ezYb7LHi770sDLW1M2PSf8WcAjAZBN/SuQOTThS+b3Q=;
 b=AgA/opq3NWv6zTg/bAoOVJuGb3aKkDR9DoYii//wE41EJ8YP4G0g+mwpogUQy7iMY7TV6obNbPnoGuYnrEfJLlZJe/aBJFm/yaPog+21w+/kKmAa9RgopsaZdYDpqQO9y9QdRlvCAuppo62uKDNPy1ZqK6GoDS1LZctAgUcL3K3o6g7vsCkOSxISnPx6Hc3KkumxKiC2u2po9OdpSG7Z/bLvsTbBx983B/I6Hx44Rm9ZrIB5mozdW6Ghcalrbn6yyf9HswN6PutvFEfli7NbGQAeYcewajVidZJvwT3IjneHhOeZqosluim2bA84F/jAeZFdIxdzhj7hrMcTY0EfSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ezYb7LHi770sDLW1M2PSf8WcAjAZBN/SuQOTThS+b3Q=;
 b=bdNp2KWUVrHy5aYJ8LXWQsjX7Sha+velYDVc3y8U2q9hI70xzTqZMOSzdVGgleSz3wkB8C/1Nx8qXvCNOyK5OSSpjIlLT7Tbs9mt7hepkT3AbA+OJkF0xYrx+VNO/i2392Aws8iaueIvvIlgF8u059ELB4TI6BEalTS4/gunUo4=
Received: from AS4PR08MB7429.eurprd08.prod.outlook.com (2603:10a6:20b:4e1::9)
 by DB4PR08MB9263.eurprd08.prod.outlook.com (2603:10a6:10:3f8::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Fri, 6 Jun
 2025 10:27:37 +0000
Received: from AS4PR08MB7429.eurprd08.prod.outlook.com
 ([fe80::8db5:7772:a426:2afe]) by AS4PR08MB7429.eurprd08.prod.outlook.com
 ([fe80::8db5:7772:a426:2afe%5]) with mapi id 15.20.8813.018; Fri, 6 Jun 2025
 10:27:37 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 4/4] oeqa/selftest: add test case for
 oeqa.utils.subprocesstweak
Thread-Topic: [OE-core] [PATCH 4/4] oeqa/selftest: add test case for
 oeqa.utils.subprocesstweak
Thread-Index: AQHb1VmQGCADJOG9i0yODXEEotLvjbP04WMAgAEPHIA=
Date: Fri, 6 Jun 2025 10:27:37 +0000
Message-ID: <C7177F73-F04B-45CA-9C66-A1CE03CF9AEF@arm.com>
References: <20250604140326.2214919-1-ross.burton@arm.com>
 <20250604140326.2214919-4-ross.burton@arm.com>
 <DAET0ITMMXA6.6EQ7Q81PC9XH@bootlin.com>
In-Reply-To: <DAET0ITMMXA6.6EQ7Q81PC9XH@bootlin.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.600.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	AS4PR08MB7429:EE_|DB4PR08MB9263:EE_|DU6PEPF0000952A:EE_|AS8PR08MB10361:EE_
X-MS-Office365-Filtering-Correlation-Id: babb0fd3-79af-406b-2a89-08dda4e4d570
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?us-ascii?Q?Z8bs5jB1WFI7nnEMZV15eB6YhsiBw8ODYk8K7S/tyz+HpjzJhkQY0UmyWT/y?=
 =?us-ascii?Q?JJm5hd11PReQH05XXnfGH0EL/F9dk/f1Lr0Y3w5W8Q1nTTerUwFTnZm7tlVW?=
 =?us-ascii?Q?VpGs2JNRF2dwmtMRGRqXFUS9s3tQM1xX+SsKloufcInO57ctUtzrCPokpwSG?=
 =?us-ascii?Q?Fu56kHdPhgidGfydYptVHijXryHSYEidFz9v2iHmlhXWsm3rWNZqxBuyoKHD?=
 =?us-ascii?Q?XpBcDgBMY1UYumG0GVg8rZUnYr/+qpHEHprF5VXXG6CT0lcM89EUXbxqidEI?=
 =?us-ascii?Q?UDbnQwRm1bCnCgqx16VWitlrTxxIYeipotdY+rcFqObnY28pMWvYByBJM6t8?=
 =?us-ascii?Q?gqDO9mHXbI/cHlblhkkoIKW3cLNH0bvYsJ9JQORX3xKTsggRmUxBZED4o9DW?=
 =?us-ascii?Q?Vtmrb6i2+RUlbz9wEC1ZRC8wuGGtcnKc9rqBc57a2myM6kUID6mGLPtWhSPZ?=
 =?us-ascii?Q?fF4ui2Vm4qb+0nvpf63XK/ALSoLsMFupFxO9iCUHKuKJPIyufqLXoYe2wAWj?=
 =?us-ascii?Q?yLfhafWtQNd4rjT/bTVULNYSw204sPPf4Q/xi8TYv0XrFC80rNcuzpsJdpCo?=
 =?us-ascii?Q?h17tVrhHbBB6DdaVGuVpgz+s3i3LeMsGHMbVxrK60WNcZW9bScq+KkeipFux?=
 =?us-ascii?Q?uK8aDXlXwyWkHbR/iG01mQ35uMwsQvV3RHInv/2J3nK2Ok7ibke/dm9i89eC?=
 =?us-ascii?Q?Gq/5FEEJ0JDr/bi52M7LJ6Dcm+Ftm3VaMo1wVCJfu4jpUr/GqMtpy/vmppdc?=
 =?us-ascii?Q?etpcvef+VrJUge8jGslqs2Isnv1K+UbuAKl91I/OJ1VyVkj0tYB4rIylDNDG?=
 =?us-ascii?Q?CO8iUoMpusYxGFChU2WU+MAiI3oQSwTzVJojKFkqxfJwJSPCwzeCQ5o7GcJG?=
 =?us-ascii?Q?AOrBhUnMcWLE8BD8vSUfPlzgZvKNjVF6+RpYB05xDPn/WTlHmlBbD6e/0DIu?=
 =?us-ascii?Q?f2LggMJw8n+BjA/Bc4OD0MgcQO06gxlqL5tj8izVuB8zPw4btPXiFpbZGBR9?=
 =?us-ascii?Q?5vf06A11VEGeiFtlIdYdEbrQaCe1w78mTRb9adeRGgPDf0LRk+OjQgEyyUgX?=
 =?us-ascii?Q?A0CrMuJ1LVhH5wdRxnN8jDLgdiXugreQZMYekRbruX6Gu+uHjw3Q0y3zLfv7?=
 =?us-ascii?Q?qp/YTu4DpS/cutbzyZv66xaJHV59qkxkJzCohxdCAd0yxf2v6bL5L04stEp+?=
 =?us-ascii?Q?a2jWLlGE08W/XwjYgYPtHho9dviXVFiLZmx53zasOMwgSvUPxc8BD4tcWgJC?=
 =?us-ascii?Q?zxNh/EW3L+BOyFntaRBcuhBz5bh54ysDkKhLMfqc0tqThJTAFgbCAH+76N4t?=
 =?us-ascii?Q?eYK/oRvUXbaeYh34kdDxsfcGX+VybWxECE7DXa+eP2VuzQQn6E++Pn+HktgE?=
 =?us-ascii?Q?XSGjStcYaR2N4FdkTth0ahAoJRyLzGUDkF1AZS0XpgC8YlGFHkZVUrqCwOoC?=
 =?us-ascii?Q?sj8AjnXga6fYAqi0v6/fdZzsxczJruBWLh7l/WaT1ZEKMQusKaOom1aL6Emi?=
 =?us-ascii?Q?uzPixtyk6aXq1d4=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR08MB7429.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <3775C41644C38E4F9C7C7569AAF11DF2@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR08MB9263
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DU6PEPF0000952A.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	06642f5f-9a0d-4e2d-3578-08dda4e4c234
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|35042699022|36860700013|14060799003|376014|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?YDXDEGVjtaYsGtY1xyd1Mbt555NpIUkRTh2cZlWJpMYhE1j5fxNBbiFoHknn?=
 =?us-ascii?Q?dRvAndxI3kG1t6Qy5RtU2DetWayFABDeKlfPO4uBbY6p3hWxUi4S5elGlrGh?=
 =?us-ascii?Q?CloO6Diq/nidd0FOof3FpnVZ9ePRbYGYOUoOl79H1WiwB/VYe3140xbve6Xo?=
 =?us-ascii?Q?Bf9z1vrY17y2ajIXTR6+WsQouplsPbO6h/aFoP4mmStvnXhDM1c+r0VpwmKo?=
 =?us-ascii?Q?Nnh0Uh14lO6DnhkLwSEzmhpwVjPBfCSQvsI2HjO099M6MkN4CdXHZXf3Srxa?=
 =?us-ascii?Q?yQS3387+i4Nu6QpGp02UHxI1El/N+HCVyCZVwxVccU4BcFXaMj/DwcMiZ9wV?=
 =?us-ascii?Q?Q5nESLHOcYmGKIRNQNWX0xjF7rKbP/uLJjoo3tGTl6A7aDNWOpgAV08ixSum?=
 =?us-ascii?Q?POcslP1ENuW27MhsBjjZ+wJlcpiOCIOZvMTrzVzy/O71rQ7bNsNeaiBRZ6rZ?=
 =?us-ascii?Q?eKCZ8CCVbakSZuyjYBnun7OcviZ0q7ivvBXkIVMoD6OSksApP5sda2EJ0ZnX?=
 =?us-ascii?Q?ptkHzeyDiittPMTnKh02NfuhJIrP7+7vPGP4KGaG6ujhsA70QKgZI2/v7Khs?=
 =?us-ascii?Q?6Y/DaOSH679LTqqEy/hWlReY4BjrcGV4VONz9h3AELKO6JHH/oL9uRBpLn3p?=
 =?us-ascii?Q?/6pr2mNSG1mqnvWdtLe4ejpM/dJ0Xlt4C+8/fMG7kfXyKKTaxxeaUvHWfIb9?=
 =?us-ascii?Q?13sNyn4O3WxjitBt1ERWy+px1ZsuL1GCbXR9YDWaDx91q54DFtfM+n55Moa3?=
 =?us-ascii?Q?wTwoule9nMYi/B35B/BlIqr1ggTYSpx0rzPjv1Qd6NV2EWiNlEODwoudrKln?=
 =?us-ascii?Q?s3JPrFqwmYjQjcUgrVHRyWqvYQZrrgQ9JY8VIAWq1wOKXxV+9CvuCOTSrDs9?=
 =?us-ascii?Q?/jHRt905c0s763kjIyQyw+AN4eHjOEIzhs6IT2e+vP3QFbX+iAWV0o7WALxD?=
 =?us-ascii?Q?k5wCOf4FLJRC0RIqoXVITJqSFnD4QLiW/z331HZRAG34loJ7i1HJZ1RjYndL?=
 =?us-ascii?Q?4WGJHItYY6AnrAtOgZ2mQTAKBJUvUCYEL/f6b69RjascxD5ru0bzcxmKtR/A?=
 =?us-ascii?Q?Bx4QdBPaz7toyvkicsVR9oolwOeq4/VdCtY2czZ9y7UO2zEZyqpwHWF4Bj7L?=
 =?us-ascii?Q?Isf1/6UzNP4+HLNBtLMZm3QPuZ3TL0fAqn+ZDanx7yIY+PbKV+Vc+ItBjBiL?=
 =?us-ascii?Q?6xGx6Y21UUdflnRxPuS2mgAGP9LBjq39nDpaYay8FqMIgbQOc5NE/C4HHq0H?=
 =?us-ascii?Q?LVKL9eS8SHrjABRxQpHHKnNYDg/+zTl1TI2Ixb0CFyHTm84rw8qH+q/JJfY6?=
 =?us-ascii?Q?MFYmfeHzcuSdzQA+wsm+8fKeEe86bTUuWUNJfCNZGZJSx7VQRgWDNxlU7A1I?=
 =?us-ascii?Q?0wWr5HTj0bVbV5kA+KowsJ+yVz/ZAI0eDxDU+nrpJyQwULvvky/y7B5+/4FO?=
 =?us-ascii?Q?DeUcIRkdU9GvQNyWj+3dQIgk8iTsl4UPYeQXsDK1zgbYx04IdbLyJTYe6voY?=
 =?us-ascii?Q?O8fHOZGolZ1bvHQoCjJnAvcUbNxFWBFBFiQY?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(35042699022)(36860700013)(14060799003)(376014)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2025 10:28:09.6440
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: babb0fd3-79af-406b-2a89-08dda4e4d570
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU6PEPF0000952A.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB10361
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Jun 2025 10:28:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218127



> On 5 Jun 2025, at 19:17, Mathieu Dubois-Briand <mathieu.dubois-briand@boo=
tlin.com> wrote:
> I believe we have an issue with this series on selftests:
>=20
> 2025-06-05 11:58:18,605 - oe-selftest - INFO - setUpClass (liboe.CopyTree=
Tests) [ (subunit.RemotedTestCase)
> 2025-06-05 11:58:18,606 - oe-selftest - INFO -  ... ERROR
> ...
> 2025-06-05 11:58:18,606 - oe-selftest - INFO - testtools.testresult.real.=
_StringException: Traceback (most recent call last):
>  File "/srv/pokybuild/yocto-worker/oe-selftest-fedora/build/meta/lib/oeqa=
/core/case.py", line 39, in _oeSetUpClass
>    clss.setUpClassMethod()
>  File "/srv/pokybuild/yocto-worker/oe-selftest-fedora/build/meta/lib/oeqa=
/selftest/cases/liboe.py", line 16, in setUpClass
>    super(LibOE, cls).setUpClass()
>          ^^^^^
> NameError: name 'LibOE' is not defined

Yes, the v2 fixed this.

Ross=

