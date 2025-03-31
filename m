Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 659C7C36010
	for <webhook@archiver.kernel.org>; Mon, 31 Mar 2025 16:11:04 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.57])
 by mx.groups.io with SMTP id smtpd.web10.982.1743437457582778316
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Mar 2025 09:10:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=boL7ybD/;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=boL7ybD/;
 spf=pass (domain: arm.com, ip: 40.107.21.57, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=WUUg4O7PZQIRN4M8ZLxITHxl7mZQno0kBnejMs42SjFWEE5QS8JWD2KZ9G4TUYuAezKvz2NklZJ6aJxpI3H16oT0Pvpm5hU9A6tkZcs1VEU8ydoJ3PhGVVsBESuWg6U7ZJ8EC/HYew8fn1DZrQ3BHwq17hasYlNsx4EdL6wEAC60fC7grpKEPfDBDUVOSpDMnl9edxhLX11OoF2GTSWCtt5ITYGOcTUkaums3BcSNHw4Q4zdMR2Rw+eGsOqYh3wf554xmfxfe0B9CQBWko7qQPOwZWSA+jsymERX4dxkIObmbhmiLl3po6obnb4fGV3R3WfZx5Ped4GTHo7fThP4tg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fmgLQYm/uPDId40eYUOWYthLfGPlt0OdmfTu5+XQKq4=;
 b=FEAT6DdBOK1IAJTPfrEnZGvSGoHFnK/5maxB/D8nFCRcj6b7ZKT3XFxDP2fhbXXUQrCV0NkAsWWnQcNnqECvP9hKH99JaNrLmOnYUDnm6sbP7GJ0Br5NVH6lbTvXKBRCkNYRErtMwk12ycA1KhbI7+pyVQw50OJnQ1Xt/uzGSvcha8HIevzdSEOdSXXW1F5gPcR2i+/snFrSfrvZcRnrAbPMzw9CGMe5ZnoD+YUsFjxjQLBBbYcp0Rp6g43dohvkFzmoinpWjqoH/UIWZrqqM2n4CPvsNti/kUbC/rQd2h5pn/k7ymZ1LqHPoXx6ID8D5Z7yqCfJJDK68Jv6KISFQQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=fail (sender ip is
 4.158.2.129) smtp.rcpttodomain=oss.nxp.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fmgLQYm/uPDId40eYUOWYthLfGPlt0OdmfTu5+XQKq4=;
 b=boL7ybD/r+eVJ3rw9o+3TuJhJrrr8SbsvmohmWmSIgvQounKp4sz9GszO2xd7jzQf52rG6hg4YY2LkkdlFKoDmigi+9zrMVZiiMkwsPeTw6hV6jiCYd7d/VskoMDNDxiZXtvOMOM1I11XbV68mG5nahzosFPXIZjV2Fms1Pz1MQ=
Received: from DB8PR09CA0022.eurprd09.prod.outlook.com (2603:10a6:10:a0::35)
 by AS8PR08MB6614.eurprd08.prod.outlook.com (2603:10a6:20b:338::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.48; Mon, 31 Mar
 2025 16:10:52 +0000
Received: from DB5PEPF00014B8A.eurprd02.prod.outlook.com
 (2603:10a6:10:a0:cafe::b) by DB8PR09CA0022.outlook.office365.com
 (2603:10a6:10:a0::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.54 via Frontend Transport; Mon,
 31 Mar 2025 16:10:52 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Fail (protection.outlook.com: domain of arm.com does not
 designate 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com;
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB5PEPF00014B8A.mail.protection.outlook.com (10.167.8.198) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8606.22
 via Frontend Transport; Mon, 31 Mar 2025 16:10:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=INjKD5O+zztB64twwxZYay6+PGz+lfoR54r2VUAFUJi/QglUtFottU3HfvSVhb3EaLevKZ6E+cFyUDMdsBpciZmeNC7RdPE9k1U2EB5IXeH9OpO0or5N3vz39J5N8X/mK36bY4o5hn+NgIjDbZSUoahsQ0JpmjfI0IYE2nhErwKaTJPbFG+0eWG9e7aY5Ph8xO3aTDKO9sbi7XTZWsP9Bi10bc3iE9Wgdj4Gj1y2xCdSDj6CS2YfdNwelO9MVStj2ZEpW24FO6aA3XLbaAY0GpBFbIFqkHciKKpEsxvHDEsZZaLCasxCioPAG8DQsy16h+91AQhMPSpOJnAzdRdKkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fmgLQYm/uPDId40eYUOWYthLfGPlt0OdmfTu5+XQKq4=;
 b=iph2VfUsjaFaoqn5St3s70kwgZHBqq8hFfBakRpyo8+o8mLcK/sNubxSOgEanjDBkaOesDpOMJ5udTqdaj4Bfu/EwFrK2nU/J6oof7eJqrEIR5R2c3Ys8wndhSXHztJN2fo9GsAHVsY9QFTJwF4w7VRlAQKtig7XTYUIPtg+69O6kw8IByYzt/EYCDZGi0Nhig6Du5sRfaWpvmMqZ0olfq12iilluRHDotutm9DdeAuzBeNLKZXBkyVoqPnzSBMDligDQz0Vno8yPRm3Ud4zpFFttQHIcS3TgDF4hW9VXoIEsF+egjB/TRpeef8/ZeOMRhYoFo7jwFgo+WIWEZyA/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fmgLQYm/uPDId40eYUOWYthLfGPlt0OdmfTu5+XQKq4=;
 b=boL7ybD/r+eVJ3rw9o+3TuJhJrrr8SbsvmohmWmSIgvQounKp4sz9GszO2xd7jzQf52rG6hg4YY2LkkdlFKoDmigi+9zrMVZiiMkwsPeTw6hV6jiCYd7d/VskoMDNDxiZXtvOMOM1I11XbV68mG5nahzosFPXIZjV2Fms1Pz1MQ=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by GV1PR08MB10752.eurprd08.prod.outlook.com (2603:10a6:150:15e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.52; Mon, 31 Mar
 2025 16:10:18 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%5]) with mapi id 15.20.8534.043; Mon, 31 Mar 2025
 16:10:18 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Ross Burton <Ross.Burton@arm.com>
CC: "tom.hochstein@oss.nxp.com" <tom.hochstein@oss.nxp.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v3 1/4] toolchain-scripts: Export meson settings
 for SDK builds
Thread-Topic: [OE-core] [PATCH v3 1/4] toolchain-scripts: Export meson
 settings for SDK builds
Thread-Index: AQHboNXHF+6qzh/B7kedLOdjz3rcArONVSgAgAAX6gA=
Date: Mon, 31 Mar 2025 16:10:18 +0000
Message-ID: <E1CC9EF5-BE32-4C79-91A8-E6B16355DF35@arm.com>
References: <20250329180853.1057381-1-tom.hochstein@oss.nxp.com>
 <DB618274-577E-40BB-A811-A96042B3FE73@arm.com>
In-Reply-To: <DB618274-577E-40BB-A811-A96042B3FE73@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.400.131.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|GV1PR08MB10752:EE_|DB5PEPF00014B8A:EE_|AS8PR08MB6614:EE_
X-MS-Office365-Filtering-Correlation-Id: 248377b5-019a-4450-3cd5-08dd706e9bda
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?us-ascii?Q?IcDdL06txxq1EU0H2qhXd02RZG+aayTilvfyG6XITYwu9v/VWted0WrDUPqp?=
 =?us-ascii?Q?HjXSC5mc1ftaJ1pV0MbiRABCfkjFGm53Hrw6VaQYZNUSaGV6jc+hQjBgoCOb?=
 =?us-ascii?Q?rR+d80kstQrrZ2QU40TOd1Nj5/4JqdjvG5RA6LlLB6X4QlTBt8Y4Td5lVITB?=
 =?us-ascii?Q?VFUxJKcRGvxpDFm010hKqPzuD7319y7QoZ4kjccJ8O4e6FqHenXrCSJWTA1Z?=
 =?us-ascii?Q?K4mTYU6u2wheDPeY8abfm5M7vSt21Ax2hMfE9h3xHjm44bbicyQh3IZUiJHY?=
 =?us-ascii?Q?EL3BAslCykpKgCZ4FZtsI6uxA+/8RR0kr5hW9LULc22FmNfy24QvPazQ6pUs?=
 =?us-ascii?Q?Ga0k1icT4JBzxTiCsp+MP7huIp2LE2BgS6MKUffbgPz873tEO4cVhBTMJZQI?=
 =?us-ascii?Q?Mj+x56QtRHjnkXMNzbKIR9Obf6Gi7OEapM/fnorvbtbuXi1kHDq3IWE6wBKY?=
 =?us-ascii?Q?zT2jQsq+ghPB56cl3ylmki52p58TK8pqv2nr0jpG0+DOsAzirDOmj9nLJhwl?=
 =?us-ascii?Q?7sG7bPZMdUGoSR1E+e2YsnF+GC0Rck7Qod2bpB5ysbTL9aaBVL857bbctE3E?=
 =?us-ascii?Q?j9jdWkjpbaYCt4mO7AbXF183V2WdZyBN0/PdiZkFeKCBqFl8qGpgK/oercxy?=
 =?us-ascii?Q?+tEQAM3L8oPPubMYakWBDZ3If2KC09OZt3T/+lrvoN0o1DKpDbQTRg3pzuAg?=
 =?us-ascii?Q?vMn9JF6TRqBgcUWuIpHUgqGpHMaNmoMZaizUsq1FDDoBgl+dyFs1V5GdEav0?=
 =?us-ascii?Q?GXFCSqnqHrmyoz1bFzHEqRpHV6NET2GWGScqaGEVAwAAHeUcrQKa0yqx2TjQ?=
 =?us-ascii?Q?Pyyor7pnXdwgIy6Mo/gsrhCWcttoBs5fI59/wNemUWkpZMoR4KHfUAk5pUQr?=
 =?us-ascii?Q?+MiZX+faRV6BCImslmSj9R8tpKlK/YJ+B4oJtIikBGj9AY49ejc6wPdA5IbS?=
 =?us-ascii?Q?vZfvjN8llNfSqE9qHoBGWpMZJzSqbwr63OvLFMo9Smq+FaOL88w9rfnmPQ+t?=
 =?us-ascii?Q?X0dS4UQiJAT6G81oXkB92vrLv5OpbSJBq0unw43oRh4ddWEq+XK+KyTkAsyT?=
 =?us-ascii?Q?DOkY2q3TuYj58p08s4WLrLGaoP1i4YnPHCfo+JVRRHj6zrhLC0VAQ+DIgumP?=
 =?us-ascii?Q?XCgmNgsU+QqM7DahdZL7EoD2bbAl/9DDzGP0JBUhXOQ88R8XfCwWvfKFKPZW?=
 =?us-ascii?Q?YMyULPdOZh8/J/SGkyiQPj3xV8MdbmtNJ+sjoNH6WaXsLJ94pX1Nhl2cTiTi?=
 =?us-ascii?Q?f2HfzpMMqG4DB52LtsWKlEfck22+gW8AWd3dXbXLLRaRDpFMZY2T3n35VCQA?=
 =?us-ascii?Q?H52hjMuvwImGftaBdQ0UnIAtxcL9+ohYPs7EIMZwYLIHREgPDOl/ATMtpj7m?=
 =?us-ascii?Q?q/Jwcp1jUznTiUz2pnWNvlA6JD6gmyIbfgdPz+bKGjV4+CamIlrKIUGGI7sJ?=
 =?us-ascii?Q?lnn8aoK6isQ=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <261082F7650CDF4ABAE5943B0AAC14A7@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB10752
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5PEPF00014B8A.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	c538d3cc-76f6-42fc-13ac-08dd706e87f4
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|35042699022|14060799003|376014|82310400026|36860700013|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?2vddBo1sR8CaO6aLQc4KsjPa4I4tth1H95HH8zHbWDfYZafvW8G59lQ++7Rm?=
 =?us-ascii?Q?+CNTyEedSS2yhdmW6L18jjZlDrWKbXJfoGq1I5kRtVolDIUd2mCXzGfXxIW+?=
 =?us-ascii?Q?lx7PzpW+jEZlwvi2GJtuCSnw05kMWgQNe73MMcc8n0GCq4cS/SNa0WaH6wca?=
 =?us-ascii?Q?nhD4KKlln6f5xt3MBvgWCfMYuXV7Z2vaYh7+4YT6L2d6YlfTvBRC1bbMe+BG?=
 =?us-ascii?Q?96pkxDblJGbVOb3Dv4cZuk4fNq11+j+fQQeWV3w0ChCw8KWLbfRj/163F4pe?=
 =?us-ascii?Q?qNyksxLsQWmfNGbdJXKs+pJ7k2X0XM/UB6kp2hD00rpDmNLDkaZsujX5mBMZ?=
 =?us-ascii?Q?mjF0coffcVrkquJ7i4GzTeFUQF+0t03h6F/HgiBYsgGUeXNjt+C01CagWNer?=
 =?us-ascii?Q?LWUAUBoWltqFt6g4cvKHzBEdJCNQCKkh3kplfJsDZg15DZ34qe2BP0YaKXbr?=
 =?us-ascii?Q?sXhK2WqAMpRDLIesUG635sKT+BtJ7hf3yL0lrxslYtA171A1iHI3lckDvY5Q?=
 =?us-ascii?Q?2Z19WDXx6Or6twAqOI8LSo+DmZrndl74ub5vs1/meW2TNB0nRmTwxVVhBl4m?=
 =?us-ascii?Q?CF5XIUQ9vL0A3zPSibr40G2YK4uQUJOA8N1SoZo6I3X36hpV+sHHXVOqz8iv?=
 =?us-ascii?Q?rEwi4652R4MlF3XDizegpZLqBDJJNUDSpoPieP5OUU+RQfDrcN8MsSOi0TsI?=
 =?us-ascii?Q?W4cljXsFakQZjMmIAsxlM+MAGL2jgpdbEUf8oQnXSF6YAcxiHQZQeOb/FSz3?=
 =?us-ascii?Q?ipbQdeui97Z6qLHjnE3uCZ3Li4lYmKvkVkAqUIwccypOxRiKOeTEOx86aqaJ?=
 =?us-ascii?Q?usq0qZFNejSv/dfG7LYy+BOdvDYJSoDKD1BnUvRa50Xxto1aw/FNE0j9v/eb?=
 =?us-ascii?Q?56py0bznIPVs/pnaAB5Teo2AIDz8x0Vpe32mh0+xHXHWMqmNHT5n/Sz+0hMX?=
 =?us-ascii?Q?d/LLTIX5agtyv8ULmlpAAINapfYcIM2eN0mP6Hg8dG+wiUOaBqCt4CiEMzyB?=
 =?us-ascii?Q?TXRAX1ksaANtQtdI162GnzBcIr2wnu1HPbZL80rv4++lcu0JiMPrGB/hXJ3j?=
 =?us-ascii?Q?4jNShPxWkERRow01I/yVhH5qKrmmTz+3XZbBUCITY5sOIfOD4ZuvOD3x1ayR?=
 =?us-ascii?Q?nIgK25+gJcHiE1IxdbXEI3/EWgElnKeTj3UhyxyE5BjX77XkgxkZEPbl69Tz?=
 =?us-ascii?Q?RuyhE2tCJVJ/nyP8xKS9gZ3ETayY/nTtrM8qp9vmxNQrTkNL4UZSXFMwAfNA?=
 =?us-ascii?Q?r1WS2wrAStCsONS/dqbmDWjQt/FtD/T47+AVHH6eGBtOcXns+ni/V4DFQasq?=
 =?us-ascii?Q?/P/g5PqUeC9v/E/zXHn7JmMjqGur5msrK9RV1e4XcG5Y3mVA4ZdAnx0jPsUu?=
 =?us-ascii?Q?xkXilCSvKvLqyEX100qMhd8ubDUgM4Vu9kK540+DUKmbfIeD6g5m77l7hoxX?=
 =?us-ascii?Q?6EmUJ4M3BGg=3D?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35042699022)(14060799003)(376014)(82310400026)(36860700013)(1800799024)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2025 16:10:51.9650
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 248377b5-019a-4450-3cd5-08dd706e9bda
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5PEPF00014B8A.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6614
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 31 Mar 2025 16:11:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213986

On 31 Mar 2025, at 15:44, Ross Burton via lists.openembedded.org <ross.burt=
on=3Darm.com@lists.openembedded.org> wrote:
>=20
> I spent a little time glaring at the meson/sdk interaction previously bef=
ore getting sidetracked, can you verify that the test case change I attache=
d still passes?

Also some relevant bugs:

https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15486
https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15485

Ross


