Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65C9ED20690
	for <webhook@archiver.kernel.org>; Thu,  4 Dec 2025 13:26:16 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.62])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.43327.1764854766383029795
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Dec 2025 05:26:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=Ruw+7TzV;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=Ruw+7TzV;
 spf=pass (domain: arm.com, ip: 40.107.159.62, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=JY7lbzbKKggYxscWe7ovjUrWTl576c0mX4nD9fbdXlNnkkSYHdJuQzZWSpldfjMAMB+yRBNdVrp+ogKq7Nri7kxK4oEsnibJY8pfZ6LojyWTnRMQuS7+jKXVQTLcyo209VKObaEbWRmVGyzq92Rp41ijZJqSZdNIrjGgo/x9oEsjr1QSS7BMH9oEN7Qc6EdyDl2EgUO5+fzPQ6kcLanM4ZeVJBUrUCZ2zrCLQi9dZH0SoziBQ+dyUz5A843eniv1MrzSkqUA22IWps5z7ukBZPkLD5jS+7Exx4jkcGpNZxxEs/e9K7Ug2GGAuYyhIERFl39Mik8u6i8iG4Z3BVhcog==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9rlvsyXqGJCXa4mciforaUxA8359oPc1AlzgWKrN2J4=;
 b=aLSCOMfz0az8vWoaWXqHzuplL3iCK5SUr9PaEwePgfnFfd3UfeDSD8RVy70PoKdgNWtKqezQsrYyVARvCYXGnSYf0HLJuX1wMENMX/fPzQLtYDjL2k5GI8s8rRpCIXy43+3H/hlrJtGuQhtDLFG79MmN9KUGjvIgiCxQpruJhpSgcT9fNO0b5X1/mYkU2UrwNvI+Q+yH4hsALkkn4mLGBwFolNHttFnQxGhL9XNzL+lrloT3wsdvFn+HrLsHwoVr+S3W7p3wclB6ldGpKZrUVOQI51wmpPfu7HzqIodJlNUPZzj8QqtVdAUL5/PJDLeXq+q57sWX6XUqHdrZQqat9A==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=est.tech smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9rlvsyXqGJCXa4mciforaUxA8359oPc1AlzgWKrN2J4=;
 b=Ruw+7TzVWJTXaptfMLlxoQ+bpU4PEMR5fD8jaNiYKrcAKBSKJUlG208hq+DkHmE/srJ61+Roh4cWEExEnJG7sOUS6iiVfxCLlhh1lJ9AK/aIXx2K8x8WHvCJtA0KNZpOw0Kba+ia+P9tfbJdMzWWZMtXuYLeWCnc2sc+aWwGMiU=
Received: from AM8P189CA0004.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:218::9)
 by DB4PR08MB8029.eurprd08.prod.outlook.com (2603:10a6:10:38b::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Thu, 4 Dec
 2025 13:26:00 +0000
Received: from AMS0EPF00000191.eurprd05.prod.outlook.com
 (2603:10a6:20b:218:cafe::45) by AM8P189CA0004.outlook.office365.com
 (2603:10a6:20b:218::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.17 via Frontend Transport; Thu,
 4 Dec 2025 13:26:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF00000191.mail.protection.outlook.com (10.167.16.216) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.8
 via Frontend Transport; Thu, 4 Dec 2025 13:25:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P6gaoTM8pME1HLK6CuUkQStrkEAsxs3AUHUtTV6BtzRBnNsmOAiufJrNyScq99ywvXhAAcVIn+SX3Z3XaK5kZu0KCcOseho2q6U+vqHwc8YyaP8f4ezm6pyKE6u26R2T+abnc6i7foy9iT2ZBhwpCN5KRrXPNqiRgW6BCe7jetNvBvMxHVxDY7BbakL2IRmj3hOdc3+rGZHyd/h4WoDNHEqBSlXr5+UhhYosZFAX2zPj94p4qbu3XR21G9J5YvfoP+/g6cZJaY5WQPiNeClBv6STVm4ukiViRfM1xK2iYK2JqxiVJAg+4OU8wcnByyMhu9tn1pDBrqSZRSHFBmApKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9rlvsyXqGJCXa4mciforaUxA8359oPc1AlzgWKrN2J4=;
 b=s/TrJXfiy1zQnE5p7/uWQRwzamH3/jeN48aj0fUdLW+2sLNgvl/k3qpAqbh9UQ/xIGZQLqtlnJVgy02H9g136U0L2fx/osxPDh+biBndyPadpyMbAoGe0TozXScx/uZ04+Z1zCd8o732zMX6yVFLjf0qbBm0087ZHeF3k7reW46D3/q0xoQ8n9S/Rdzhu0KrHKJpFKPIyBlnb/i8P8N2RBJoa+ooGEu4oECgEoXPERqzdtQIxKBgdaQMVCR3RJNre/+bsaYaf9g6dtoPdGB6a5P54wgTxuQme9jF+weXvgTGQUhsO33A7KJc4m9a/2QxcZh7n5kISr5ASBF3Sn9urw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9rlvsyXqGJCXa4mciforaUxA8359oPc1AlzgWKrN2J4=;
 b=Ruw+7TzVWJTXaptfMLlxoQ+bpU4PEMR5fD8jaNiYKrcAKBSKJUlG208hq+DkHmE/srJ61+Roh4cWEExEnJG7sOUS6iiVfxCLlhh1lJ9AK/aIXx2K8x8WHvCJtA0KNZpOw0Kba+ia+P9tfbJdMzWWZMtXuYLeWCnc2sc+aWwGMiU=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DB9PR08MB6393.eurprd08.prod.outlook.com (2603:10a6:10:25a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Thu, 4 Dec
 2025 13:24:57 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50%4]) with mapi id 15.20.9366.012; Thu, 4 Dec 2025
 13:24:50 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "pratik.farkase@est.tech" <pratik.farkase@est.tech>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "pratik.farkase@ericsson.com"
	<pratik.farkase@ericsson.com>
Subject: Re: [OE-core][PATCH v3] libyaml: add ptest support
Thread-Topic: [OE-core][PATCH v3] libyaml: add ptest support
Thread-Index: AQHcWuij1JkWGSnpOkG8vaK+MiYE2LURjN4A
Date: Thu, 4 Dec 2025 13:24:50 +0000
Message-ID: <56537EAE-D886-452E-8613-30E11147BF10@arm.com>
References: <20251121115420.15308-1-pratik.farkase@est.tech>
 <20251121131306.19079-1-pratik.farkase@est.tech>
In-Reply-To: <20251121131306.19079-1-pratik.farkase@est.tech>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.700.81.1.3)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DB9PR08MB6393:EE_|AMS0EPF00000191:EE_|DB4PR08MB8029:EE_
X-MS-Office365-Filtering-Correlation-Id: 56c6e336-ae24-4696-37a1-08de3338aa0e
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|1800799024|376014|366016|38070700021;
X-Microsoft-Antispam-Message-Info-Original: 
 =?us-ascii?Q?IqCSRM/nNY2TXbgqabIddiBmTpc27H/VEm4dSpek6YPdCVFpDBkiHfmimlEy?=
 =?us-ascii?Q?hfX3NhJvbPiDuXiPkJn1s8km1JY2Njw1bBiKfjYRdHSHRCfYRH3KYSXr15j9?=
 =?us-ascii?Q?a1znEJoWNJSDeAFGir04HHmq4GDP+vbVYdK24XJax3zS1JFTaLx5U3boV/Gr?=
 =?us-ascii?Q?PVfvQ0M0wCjtd4BiQZILIXadBwUv1LI4I30dV8rKJHePLQlqec7pwF6CKNyA?=
 =?us-ascii?Q?MX3JC86j1xlQPPSnxno6eJfNqFAn0UPG22+8UQziqo9lf8+3/qza7HxVvxGY?=
 =?us-ascii?Q?hX1YeT15OVBxsr06W70uAbwpDbrxq3c971BISWNaj8JUrMTGPnhb2pNSQno9?=
 =?us-ascii?Q?Y+RJluMwjpn9YhfjBfFgRJ7RmSyx+pg08n/pLHqSAzhX2nZ3Acq9IZJwOENp?=
 =?us-ascii?Q?iVnajn7qzstiEOx4zLl/DJIcMRckD1bj0l4sgXfVmuxupZMlQtbtYE25g9T/?=
 =?us-ascii?Q?ASEdOZ0qE7L1tbUBmNhg6bC9zDKhWN003SE+8qx5hDNWEC5iLbs8vW8jlxPg?=
 =?us-ascii?Q?FdzPtA2jFudLjjPRne3nSOa8CkACyj1xnB89N3D3BsW4ReKyrQRj2B/JmNHm?=
 =?us-ascii?Q?a9+Ch7EOPPPqXkC1Xfu/4LVHZtNn6muK5sZBY9YfhkKpI19RUTZulsRLiGR9?=
 =?us-ascii?Q?WyBM+1y6hN4Fa8vWvyS7/dzC3zfUGDR8lUQppmaVYHWWqZZBHKItM4ODZXf7?=
 =?us-ascii?Q?jmDhpWbOgDh+Ol83fktak5o/zDTMShcuWAzFAbpfb1Hj8fBr0WpbPEQ4Vrc9?=
 =?us-ascii?Q?8w3YTzb3IbEWeeT5mfrhh9DyzeLK8Bx/i7ZzYlHbNyIIY3r0LNtHwH/A9lNT?=
 =?us-ascii?Q?095PR9g/HQv7qgE5z0QNZXTiyAQlncPyTQNLIIYZAYJ1A7F73li2zAK/nPyL?=
 =?us-ascii?Q?bU0fpJQyRg9vgEL5dGcghIN2IP7GkhX+MUumfuubE6CGViXhFL7VsPyXWxjr?=
 =?us-ascii?Q?RcK9+jpvStfSEsOxeFDEUWkKHmlUxxaEUzeLDqocqeH8JvMwazQe5IbpU10j?=
 =?us-ascii?Q?Cep28lqJPBn7zjPq5fEw+2FeIEzx4kSkuq6H5A7R8EwbR3o759WRTv591yEF?=
 =?us-ascii?Q?R13m69ljs6pE14TMJdn0XZ5uxi2Z6VYPGkoV3xtTL87xNIJJbpC/E1ZQMIgX?=
 =?us-ascii?Q?31KCUkEdSqbXd5jN6qIpsZPA5b3etpQRDWNR9d9a6AVWoydyZkpq53UldoM4?=
 =?us-ascii?Q?aI8A28mbXfH7qm0HEhQ8fhDc2UvPaT4dhng3H4icflK56nDgiviPv5nIiWdg?=
 =?us-ascii?Q?LMlMRludJEugcDlqOvRzzWFwY1eGG7J4kEZsH+MmciRISLvdoYi0oYQJwSw1?=
 =?us-ascii?Q?usazVvxYlZRwE/QVX6MtBdyJZxSt14PtoVhZRhcJwOHofCufAAFU8BGixh7D?=
 =?us-ascii?Q?hSKKjavR1wkcBdaHfuQlUw9h1Y4HTfqYzpx4Bdvxit4y2KpxbmC7yVDv5gVZ?=
 =?us-ascii?Q?Z4NqTWGVLQanI8fkQ/xLSBGI5lOWOifTJeagMBhgvxb2QPi9MAKDJwiLE1U8?=
 =?us-ascii?Q?k1Yw7uKbkPiC0n83drGot4ciL/LwhQJngyy/?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <BA0409D51F2DD542B725DF5FFB51FDD9@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6393
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AMS0EPF00000191.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	9e40c3ce-1977-458b-fc0c-08de333880d8
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|376014|1800799024|35042699022|14060799003|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Iimj0HSyBbMQhum7qPcwoMb5WEPCbcNnJEzCAamUAt5k8wQtRozrt8P7PxhC?=
 =?us-ascii?Q?QiJydxFTqmjgLbd6HEJ2CNHjsqBEMCRjoBCXMQTnNH/UMo5K2uZDNg6DKJDu?=
 =?us-ascii?Q?OifkfO2NAM5OQ+Btrj5t/rYvXfE3kVAzJSsPzPOGJcyu2w0m67nqrDBEpGE7?=
 =?us-ascii?Q?/V3BfKIxVFAnUcmyxXzkOys1hCBBT5415t42D2qh2BiNyzsBneEahMdeXQv3?=
 =?us-ascii?Q?TNNLubjJKPjJIXEwD2cD9qIJBLfQzqChRICFxECqHsEX+Eez/g5zZ8nbqSHr?=
 =?us-ascii?Q?kNg5onaCqDtP4eoAF6BeQJ1RazPgsFtoNDRkYBHbBrrwA74nB+7U+hWdfzGa?=
 =?us-ascii?Q?5ND1LwvOpCWb3xdS/NU5GwAVeTCCpxKjsrcRIFu5BNLyMVewv9ou4znB3xde?=
 =?us-ascii?Q?xjzu68A1x3XyknsPkzSkvHG5n6uXblO0k3phVxegP2r7f1eIdjymCswXlLM6?=
 =?us-ascii?Q?gc/iT9a8H6mYQ5T7WqsZfvxldTrfxP5Kri0lTirPXgiN5ssmZnI1rCQub6Am?=
 =?us-ascii?Q?rirZ6UFeW/FS6utjLRIPXnkwrJ4jQYM9+fDKJB0LKAVp8qnmdpWmfkK01hSl?=
 =?us-ascii?Q?MpqqcG3CUUVxrlmAYlm0AndVib9SpZCackHjGvNMUPwdU7lg03/+z3FhcPir?=
 =?us-ascii?Q?CW7Ee0XChf+IU9Y1uKbysbP68/B+wL9ca0qe6mSay3jlOgEwfEJz34ZB1BlT?=
 =?us-ascii?Q?LVnJyKzdBcEjRwmoQrZMam4iEU8QNxhsHqTOXjG4NBFA5jHenQT3WYO7qgob?=
 =?us-ascii?Q?H8locsgo7hcX819D/tdi2Mqo0ka/tKgPhG1RJHTin/t1SbBu6GTRjdkHBTCv?=
 =?us-ascii?Q?N/l5viY3yn9WxuDHUeNA+GY7Agqu+vFfVEFj5qllBRQQe9MnKeto1KZR9N2x?=
 =?us-ascii?Q?jAPvQZH6fZiLsneRhK3heHTDJHcTmex8GAYfW0W0I9szYJJFvVW5/X6t0TrB?=
 =?us-ascii?Q?j86LaEBlsRDKYX7DNrCrowL2oLYZc0bXlvtscfDmsMimmrlOdQGRNNXvRcC/?=
 =?us-ascii?Q?oYKmK+Huz0y0hkxeltB0+HEBIcKhSvVg8SaKqkPkNms96slYcXMKYUBRZ7AL?=
 =?us-ascii?Q?EQEPHzajnJtqvoH+Bhn/QT/0NPOeXILXFanG2aQfYAsA1wNCIPz4Bv8wYaeO?=
 =?us-ascii?Q?usR5dAUWrUOgsazAgNgAVysX7hvKVTmxSZ9hUFkOA97yyBCnuclD3vKEb5/+?=
 =?us-ascii?Q?dNEa1/jSISbKAgNT3ToLZ0seTlqG7X82YWejSxjnO238rJ96S7kE4+Jt7tPw?=
 =?us-ascii?Q?zeh12SrOk6AYWGbCF/aN4UpaYK4FIeW9QrQjqlu0RNfrJOyoJsbM0SzinCCX?=
 =?us-ascii?Q?VG79FhokypudV1cQMgKtlpNR2kKw7ss5nvlkn66eXcqCVWp4WWAglCK3F65M?=
 =?us-ascii?Q?vVBnCIRWeGPrZaTORyOUgkEOhWW+jzp0Hmq4k3GruYwGRhofQ6E7yAAyegw9?=
 =?us-ascii?Q?IAF2KP4J05BOnefVSPCVZNyMY+pBeEqpLfjDFyUco9KB7wZontwbp9RUlEhK?=
 =?us-ascii?Q?gMcPw5CMvsc5/KOAoFbQv0r34Z0Y9VddEa2JTswLxnN8X302GmRcLNFSQcnf?=
 =?us-ascii?Q?eiDdjhN+IVdu4TB9nRE=3D?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(35042699022)(14060799003)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2025 13:25:59.6395
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 56c6e336-ae24-4696-37a1-08de3338aa0e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF00000191.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR08MB8029
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Dec 2025 13:26:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227294

On 21 Nov 2025, at 13:13, Pratik Farkase via lists.openembedded.org <pratik=
.farkase=3Dest.tech@lists.openembedded.org> wrote:
>=20
> +    if ${test_bin} >/dev/null 2>&1; then

If the test fails, it would be useful to have output to say why it failed. =
 So I suggest not redirecting the output.

Ross=

