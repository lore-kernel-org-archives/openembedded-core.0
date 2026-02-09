Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A28A5E7E0D2
	for <webhook@archiver.kernel.org>; Mon,  9 Feb 2026 18:13:38 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1154.1770660810988830829
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Feb 2026 10:13:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=m7sjrh9T;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=m7sjrh9T;
 spf=pass (domain: arm.com, ip: 52.101.70.49, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=pplan3gZM4ZVIi6wS1bZV9Pic/zcHmcrdVS3Yn513bDX2chFxKr3IVzCVasgc0exBWPc3i3KMvFXxhUX4Wx3ZaPbG7PZUaw2fEq51GFpurpJ1tNO4+jNARpmR/K/SNBqh0dCAiCGNosGhMwosVvOZVRiRIkMBjM+pzPwLmNKPiC0S6TZt72FXZGoFewIJCCsXGW4zGROcfSLrYltc8BBIshz8sT3AwTfNgeFsTzoDb5AWLVoZduc+vSRmzZGbwuKpe7DqvJzTnUrcx1EpL3rFtEm6p/NNWgFPzqU0dx7Mnge7CD7qsP927nqVVT3Y/RhDEA1TTnP8wtzXMfQpkPvfA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wnIPP09ES6xYxO6OSWNmqac2ypuAVcASZvb9K8pqe0w=;
 b=o4Mlp91TVb6v1BMnTJ1GQWjcReEMUH3YdYxRUzZRo/Le46RuvYc7PkAOLaBnpwvH82Y1JgzZbDqfx768Ej+8oFvBvLtJ9d1vC/KbrkmvUoD69/bqKKP/vmKG1EH1Uaxhj2+pEKKdnMlkamn80GWJtRCq+iJ3DLYbxdZisQu/ZSd1kZD3YQAwNoEs2T6P3zP+1yZyoWkgOGB0J+boXfpSez+DKblHthLaOmLpYxI8S+3oldaAnxRI848ASXcmw37IgX3rrdXAKqPlPdjVbqXUDKNlKUQxN3/kcJOITGnLgY5ybn9W8gd18ORi3uFkaXpQA5FyTNR1+b375MbVd43qgg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=windriver.com smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wnIPP09ES6xYxO6OSWNmqac2ypuAVcASZvb9K8pqe0w=;
 b=m7sjrh9TxoYnV9LLHMiG4Fl7jXVxJ4R0zN+fEEll3I/2qIlZj1mXrQ7GSIviTc5EfMh0z5GBRdJbfnXJ+i6BSqTnVtSLYP5LBb65OnsZR7/3ys9tuh2gfjEDj2Sm5Ic8ac9IAcIsGDj6xBejr9Q0Zn43pJ6y2hmpMmOtwgUz9dA=
Received: from AS4PR10CA0012.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5dc::15)
 by DU0PR08MB9702.eurprd08.prod.outlook.com (2603:10a6:10:446::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.18; Mon, 9 Feb
 2026 18:13:24 +0000
Received: from AMS0EPF00000198.eurprd05.prod.outlook.com
 (2603:10a6:20b:5dc:cafe::d7) by AS4PR10CA0012.outlook.office365.com
 (2603:10a6:20b:5dc::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.19 via Frontend Transport; Mon,
 9 Feb 2026 18:13:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF00000198.mail.protection.outlook.com (10.167.16.244) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.10
 via Frontend Transport; Mon, 9 Feb 2026 18:13:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OReVEr3WDDi6X1HnHtuSm081YdHRxGZKQbfm2mIiaGUjUxtM8e35XI5TX0zZc6y0ulTFNzPT0xh/JBGqbon3ACowflxdsq0pKwdXhkxxouv0R642gfhwUAhlrmhfjGm48M/+8mKW/BjPEvUDoCL8tYZ6fUOnq9nUzJh+88V6KboKNiL3L9/N4fbnny+gztnbmZUXTIXyW9NAOVUkS38/FiuI+UYRiI1MGmgwH8HFNjgFrBGwPObJcKYXAoh3WnLtwfDWz38RF3lJcWVCdSIEu/poXsK/Mc9zvMueGoFiFADbvkp5JcLnyfmQP1E7ortqI0yTH08B79lw1cDyIc5MdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wnIPP09ES6xYxO6OSWNmqac2ypuAVcASZvb9K8pqe0w=;
 b=ASBQQxT8s7zdYAmeh6kDZYO+hP1CZ/do2dXyTo7ewodBQa5myisCDH0ZVxzAju3+SA7kZNhtaFy5RmYJHSETflCvY8BHeBqJ1Re7JJiXs4TeE9GM4CYmuEm9IG0CQLpSjfKwHpy2BY5BYXNfl5FqsfUEcV133M3Ta6YElYcYGzFCq0raRwFoF2tPsURwPvWdwya6ybMmIXW1VwaU8MTBtXLZASNnp1eUzbRDYbxculnO884qYUSlmJHo0VfgjuK07BDm3xF0Gq0pFeVQhJ7iU0eDgslfgDRHW6u1RcFYEM0vBPFJmCIhx1kPjkWoXUaXu7S+hT6c5V8QaF3uK5cwYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wnIPP09ES6xYxO6OSWNmqac2ypuAVcASZvb9K8pqe0w=;
 b=m7sjrh9TxoYnV9LLHMiG4Fl7jXVxJ4R0zN+fEEll3I/2qIlZj1mXrQ7GSIviTc5EfMh0z5GBRdJbfnXJ+i6BSqTnVtSLYP5LBb65OnsZR7/3ys9tuh2gfjEDj2Sm5Ic8ac9IAcIsGDj6xBejr9Q0Zn43pJ6y2hmpMmOtwgUz9dA=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DU0PR08MB7615.eurprd08.prod.outlook.com (2603:10a6:10:31f::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.18; Mon, 9 Feb
 2026 18:12:14 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50%6]) with mapi id 15.20.9587.017; Mon, 9 Feb 2026
 18:12:14 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Daniel Dragomir <daniel.dragomir@windriver.com>
CC: Paul Barker <paul@pbarker.dev>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Richard Purdie
	<richard.purdie@linuxfoundation.org>
Subject: Re: [OE-core][PATCH] wic/engine: warn about old host debugfs for
 standalone directory copy
Thread-Topic: [OE-core][PATCH] wic/engine: warn about old host debugfs for
 standalone directory copy
Thread-Index: AQHccAdOaIzJ9bc2/kOUGJ7fBSv2OrUnRH6AgAADdgCAACIEgIBTlSiA
Date: Mon, 9 Feb 2026 18:12:14 +0000
Message-ID: <8D0B2530-B94A-4B18-8341-C64D76D56B60@arm.com>
References: <20251218101524.703244-1-daniel.dragomir@windriver.com>
 <494e78c31feaaec6cf5c4c96ad3cbf45ac19dd5d.camel@pbarker.dev>
 <a77d83f822d4431d08307570482ebd024bcc5238.camel@pbarker.dev>
 <bce56a9a-88a2-4642-a42a-9ece138fb8ea@windriver.com>
In-Reply-To: <bce56a9a-88a2-4642-a42a-9ece138fb8ea@windriver.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.700.81.1.4)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DU0PR08MB7615:EE_|AMS0EPF00000198:EE_|DU0PR08MB9702:EE_
X-MS-Office365-Filtering-Correlation-Id: 27c8be40-28df-49df-592f-08de6806e929
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700021;
X-Microsoft-Antispam-Message-Info-Original: 
 =?us-ascii?Q?+Qv2Bz9VpEY+DjQocVAvOFu3UMrsPq1Lr2QqO3LRLhEzc2GfXCUQq1ODXY8u?=
 =?us-ascii?Q?Yv+4NDgT2AcgDEouTuDFfA+oK1Ejt4i1z5PbBAT2MCE4yhq+1OEcTeVDuZ+6?=
 =?us-ascii?Q?691gvfDiB/ncxJVhCtoNICVxjz4hVQ8ukf99kWMN69DNsqpx07827A3R2SB8?=
 =?us-ascii?Q?vWZOAwALHK1IlNHtU9Ur94FpUMp582sSoAut357cKb1Fqel/V6syfAIP04pW?=
 =?us-ascii?Q?QMyNHtn2LQDJgjQ7POhVt4kiwzg+1sIeiZMxPAOS1O/cSXYt5SEpORzFgnEv?=
 =?us-ascii?Q?e7GfQ79VNGBsf2tpa/xHg+z8Z2kKwuIgRUbVdxje17RiBEwJT4uHlDnKAnBY?=
 =?us-ascii?Q?vHIwfJ4RC1n1EU1eBs5tCjvcKM4+BG1a7TH2MhSkv24vd9i29GQSGbV6sozH?=
 =?us-ascii?Q?1Ql8t0HCUmSMwHkOyBNEW2RTi7VW3z9bQVvFUlX68HiLK/nqswQP2/8MxbZl?=
 =?us-ascii?Q?V/27XnpmZGM10Xr08Zzks+XIXnAWv4P+khttlmry5/X3yPa5on4+AsVzt6f2?=
 =?us-ascii?Q?WLKUM7BRn/iz2HOA0XVkcgBTsZfgzRJqq6J7OWeQDjTeOM6xjmrQipvJ/BrU?=
 =?us-ascii?Q?WGXDsHZEMRoEtXK4xCuZEbN332W6XZJpcMZMhyTNAjVLmLvTrLYulIP0jGvi?=
 =?us-ascii?Q?BcEXYQG9754HhE1c39XO3RGxoVg5ZldegOp6kUAn6oFs3CwmCNcntb9nlfAV?=
 =?us-ascii?Q?Vwtu0WyPbrnyyxf6PEU5Ww+zTD5EN9spna/4u5xuFwKf/7x9b2WZu+PbtCn3?=
 =?us-ascii?Q?7PS/d6fI/MISEJyDL4N967/foUL2flfhXBgjXsHXq0UWpqA46O2ATY5B02wI?=
 =?us-ascii?Q?lqqMreD71K9bT1Hw41FPxsIohUivGZQc+W3WzwHpwTbV4o68+tpCqRvms8be?=
 =?us-ascii?Q?ykoa13AthxACV5RUMYI7sFa3j1lBX2x/RMtj5ekKgKe7zza2ToeE/E2Y6f4d?=
 =?us-ascii?Q?e5rjzsuMaZDrWRp6fOuJl6AHMf+sOZViTQ7Z6alrOThU+1pfzx7nJShkV0I5?=
 =?us-ascii?Q?6oaefFdyVORZuB1e1X8O1MsR6poaldpmyvlHuLafqZB8knVwYO8WAQXEsQFR?=
 =?us-ascii?Q?358j0PVtXtnFOBU21fJju4/dyC1R98O4CiANvYd+vVloRyCnOPwrSWI7eTT2?=
 =?us-ascii?Q?YFLZuE0Pdh4pfNLw2o8ztY5wZlhA9GPFWxkZvAQmwve63I6FZbHOpOF39u/o?=
 =?us-ascii?Q?kW+td5kWSSkIs8wQwfjho8/4OEUF4LE/SEhLwz1L8j9ELMJgZJtdIraT5Uk3?=
 =?us-ascii?Q?p4rflaKjjjfJSBAugLNQC+R9vcq0OhQ29ZGjOz31GAyR/52drB/OLmU9wwi5?=
 =?us-ascii?Q?iFvRgPQ5raKzPK6UX32mLT0vp6fsnFt/+N3H5O7l5V+WtEDWYTBuB+HGhPPu?=
 =?us-ascii?Q?PwyTfpaIjF5KIB2OImS6uj0HOf6+ZX841XfkghHQ1fiwMc8XYn5awFmWM8gG?=
 =?us-ascii?Q?fwsB6udD27uE2m8D6n/J43m4gEZ5tgWJLQA/kErHBUFRx0eE4DC2ARJc9yv1?=
 =?us-ascii?Q?40sllihifihxQOrLn/ERQB3u9D83D5oi2IuNkZMOTxFethYp3WXqFD3gEgPr?=
 =?us-ascii?Q?5HbduyD/cd13Q4DI7b0qLy8tr/4zkRHvLh40LWThgEXTqzpoDhbo0R5SVDrx?=
 =?us-ascii?Q?Aq6G/NgJ38X8MiW1AVFgwEg=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <D870F0A995882E41B5984DED06467026@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB7615
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AMS0EPF00000198.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	cdaefa96-3af4-4c64-2c4e-08de6806c095
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|14060799003|82310400026|376014|1800799024|35042699022|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?jInPlAiNG1m0UOElM7l3hmsvNI3xGQP6bXEJkw8xbnALmofQ/zduypUaHSJ5?=
 =?us-ascii?Q?Q3Cz746S4GBFry6m3vRw+EmN7Mj5qhdVSKqzvFRhMAph0e0eggekBpFfxx/I?=
 =?us-ascii?Q?ETA2v02LZ3HqY/e5zTIGCFzTbxZJovO4QSNWByuvymeePic3aA3JfruRuSDY?=
 =?us-ascii?Q?Aj6a7KWUlQwS6TCLpk6dXupUSWq+j9i1hq5UHfVpD88uTvV6kboJAAR/BF7u?=
 =?us-ascii?Q?F/5hcM4ov8hgKT6mByqck1AsJKRfGBQGodvXlSRPkGjYJgfVZrc4Xue2KRt8?=
 =?us-ascii?Q?DTNOzRvWBoWpsVJnw2CAEI8a2lF9uY3NkEWO9etMJyd69rIVwyZQTFATwHgY?=
 =?us-ascii?Q?K143S1pWAIHH/DMSi3EU3YBfTsf5XpO7oe/nP5hLLyF79gu2KbsrfkT8Gp3f?=
 =?us-ascii?Q?207YnKPYiZvczZ9pqGi2S0T/Wjq2+QuJ2G4yQbP+wiN4EVe0P+DcrFVNL7dk?=
 =?us-ascii?Q?gU7VDhYV/UrQYa/Q08WJwc9aT+5GLwudCDFQXSsno5qozzfrPP+NkfNHgtUe?=
 =?us-ascii?Q?4Eb21DUKd2vPPCO3dRCziI7SzXxPVlNJyJkRpgY0gQcAFqgIj0Q1wgn9sl5N?=
 =?us-ascii?Q?ixgHO1GQgBYN0nfh+0X//TV2ceyQFaDEbq9rutHaIPK4W7wVJdTxHLbbuRLx?=
 =?us-ascii?Q?1cqk3Oz0yUl+VyG7HSZBKUwblHzvet9KqA8nd2fy5qaiJc15duMMCMkUHWWG?=
 =?us-ascii?Q?Go8Vn1XDnd1lVgmyG2q+TxDyMpZZo7zWQ971MkMxucu8pUmoIX4RsfH+AQsk?=
 =?us-ascii?Q?Lvrbg9MyR8HbeP3pnY2RD0l5eel+dW1YTQRRIy+7+L3XDmT2tXcXTAJgil2e?=
 =?us-ascii?Q?dn8Mct5JGYtV16aTLB3IJ0QfzW1v8+1NUTc/E6T/gnXsn6dzyNHRccSPy/3i?=
 =?us-ascii?Q?RDIgDIWJtbC+2zZ+liZBHMiTFrqGxh4bplER3ROrWaTDCwI2O/5GaG71wb6f?=
 =?us-ascii?Q?78v7MPlAzmKSOQ0sYKgQexGYc79KK55dsblDxHQ1wtmfadAU6N9BBdcP4n30?=
 =?us-ascii?Q?wEIM60h7Zucma5ogDpLP7aHsGpvT8Q1mNwxlLjXblu01qTxm9uqFtf9gHyCw?=
 =?us-ascii?Q?0vlCAqzKtQPFWGBI0Zq/BXQ40E8QcSWaDGbU0Nge+DefOq0IjeEQe/FZ3j1U?=
 =?us-ascii?Q?2NjMNCr0HCrYZsAYDkFl7J3+ch+uPOZMIifSHEYNG69gkrDtDLl7+JXiPI2u?=
 =?us-ascii?Q?vIqs1Rj7zlYPeu0ewde/Oi9GTLzUKIChnRqhkScv45OsHLA218QppVxO2L6w?=
 =?us-ascii?Q?rFLNJEguF9wZsM7j6NlEM01bR2hJbX+B1Pmq6eIQ0vXe1WkEhEQhyKYvgfWD?=
 =?us-ascii?Q?620GpaGaMxtc0oBJuGV2aVkIYMiLjL1Z3FwGqVujIHp1BjuEiYby6nqtni/O?=
 =?us-ascii?Q?j+apRp2ocLx+BU6SnHuH9pLrfwiK2d0J848wFTZhxzhZ2/emG2qu5WTp8k6T?=
 =?us-ascii?Q?fj07jI8efo25lOZwtcqndiQgSQQgoHvJ5LR6+kRffaJ+lozkb6/pxDONaHMA?=
 =?us-ascii?Q?8WpRSrEpx8Sf7bZfWM+rB4MGclAlH05H11oaN8DvF+m+OJ92GAWH0kAP4K+Z?=
 =?us-ascii?Q?wcCVck1z+nppTBCpkgedHavcGRbtd/s8jn+yu3o1bSNvPu3bA8HfS/cGrfIu?=
 =?us-ascii?Q?Es+hkC4F/5p16HXHn0fVzYkt5yXQVuwUAmTBDcJ5Ir7qs5MpWH5zdvcbJEyG?=
 =?us-ascii?Q?SgvRGA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(14060799003)(82310400026)(376014)(1800799024)(35042699022)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	VscvlExySKkF6qn49Aimf2+s7yauox2nA3/ilQsR9gZb7Sx6IzNcXDOmW9UMeGIcJz6NxEAS6KbwHn82JMYZhHWOHyeGuptwVTrrAMU840VMjXK5eXy8IRtcVcs9PGJoXaEgruQ/X/QXZw3gMiB6LqXpiDdZwcsZQZXg/KFYF8cbUFu/jimaMAjBjYt2YLoi5MvWu299vinm5RKCcSsLkTx8PZ8ET8CE1eZbk/dUO+Sg2bY/FagtpxKINFHjITa+3U6N6MurhOkHZeThbSRt5GkH+yqC2WZIT4HfoLaxjRE1hQ25RixzNd0LqQI7DpjPYCmwKEE82j6Bq1+OoN20DCR1+hicYzftpOBsS3ZvwTMP/ptKKK/w3nc//+2ejrFySw8gPhp/qi1GwPZSAB1XV+iK+Y9uh19FJqZRamLpIplDHe2MlVlV4V5//FvP8Ce+
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2026 18:13:22.3219
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 27c8be40-28df-49df-592f-08de6806e929
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF00000198.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9702
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Feb 2026 18:13:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230811

On 18 Dec 2025, at 13:48, Daniel Dragomir <daniel.dragomir@windriver.com> w=
rote:
>=20
>=20
>=20
> On 12/18/25 13:46, Paul Barker wrote:
>> On Thu, 2025-12-18 at 11:34 +0000, Paul Barker wrote:
>>> On Thu, 2025-12-18 at 12:15 +0200, Dragomir, Daniel via
>>> lists.openembedded.org wrote:
>>>> When wic is used in standalone mode, it relies on host tools such as
>>>> debugfs. For directory host->image copies into ext* partitions, wic
>>>> uses scripted debugfs "-f" input with multiple mkdir/write commands.
>>>>=20
>>>> Older host debugfs versions (< 1.47) may behave unreliably in this
>>>> mode and can silently miss files. This does not affect builds using
>>>> debugfs from OE where the version is known to be sufficiently new.
>>>>=20
>>>> Add a debugfs version check and emit a warning when an older host
>>>> debugfs is detected. The warning is shown once per run and does not
>>>> alter execution.
>>>=20
>>> If the risk here is silently missing files, resulting in a corrupted
>>> rootfs or worse, I think this should be a hard error.
>>>=20
>>> Consider the case where someone relies on a device having a firewall
>>> enabled, but /etc/nftables.conf is silently missed during construction
>>> of the rootfs ext4 image. That could result in all ports being open.
>=20
> This failure can only occur when copying directories into an already
> created WIC image with an ext* partition. It does not affect image or
> rootfs construction.
>=20
> My understanding is that `wic cp` is a post-creation image manipulation
> tool and is not used during rootfs generation or WIC image creation.
> It is intended solely for modifying an existing WIC image without
> mounting it.

Which can be done by people in production, so I agree with Paul: this shoul=
d be a fatal error, not a warning.

Ross=

