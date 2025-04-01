Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4558C36010
	for <webhook@archiver.kernel.org>; Tue,  1 Apr 2025 15:50:58 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.50])
 by mx.groups.io with SMTP id smtpd.web11.63.1743522649574441335
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Apr 2025 08:50:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=dVXYsIEK;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=dVXYsIEK;
 spf=pass (domain: arm.com, ip: 40.107.22.50, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=bbyYrElKSJpVsYiRnBdUi6f1leFchFbx31uJInHZjInnf3cto2WKJyJP3CLktp3hQelrLx1S6V9IlG82YxlV0rBg0OxY2GfX3E0oIu2fLB64rwmwlj8TPBgHFxIwnwIBtujyHOVZ+FJC6WneI3LOmI3q02UPmI23G6VlsvLFksQHjY14UJ4QeeG2MVvLtzQnk6gAwiWUsLWIZ4bjM7zj22Q7L84brJVmnF+6m9qmLRpg0yk5ajo6Y0zdgANTCV4WRMhLLUsY1AFX8B95i6VRZUuA4aI3asSU1sFLTW8PlstLuy9lngYEMhDs7dvZH0anQ7n529n5uA9OImh9cgRk/Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HkkGIb6df+sj8sSCRqtdR/ThzGhKltVpIvsfl2wF9po=;
 b=ia8oQy4aoH5uglRN0gpPrTFuVCGtfm8fNfa8LVzBkLRAdi3Wd7Q9ok15/dRyq58zli9YVckjFOTSbUJ1NCucd+aHqNbAZAQYna7CqcRsuLmG6FAcKsmvX0r23/apA68OBzYV2Xf2wBJDBUJGtTmkbezkcpIqcbLz8wZdzQIspNnWrmhHUbOi5bPa9wxqOavdaCkG0YBpazEIRWR8nFjB2uGn6RtFL8ItX07+DwCxDoHVra4ERYJCc26fkW9DwryD+CM7HERYLjd+llXQ0YfcZf6i+shCtKF4HNWGObFAyGlt6WqcLbL5+uAS0rWhKy8eueEYE8uqWQ2X4hvyZquPMA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=fail (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HkkGIb6df+sj8sSCRqtdR/ThzGhKltVpIvsfl2wF9po=;
 b=dVXYsIEK0X1mu7JmyqddbyE5QtqqQsnZ6G/nRH7xoQjxZQmSUmWWog0N44kQEORxCyUN51nUFEgljnu3zVS6/5bJILxc4UskyiKIBN4DbMuPpOX/4WHF8/Gt/LjKxDKa/2g4xmN9cHn/7U9yIRmtK8fjmSYjKlEOyziugCLbn5I=
Received: from DU7P190CA0021.EURP190.PROD.OUTLOOK.COM (2603:10a6:10:550::17)
 by GV2PR08MB8584.eurprd08.prod.outlook.com (2603:10a6:150:b1::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.47; Tue, 1 Apr
 2025 15:50:44 +0000
Received: from DU2PEPF0001E9C2.eurprd03.prod.outlook.com
 (2603:10a6:10:550:cafe::1a) by DU7P190CA0021.outlook.office365.com
 (2603:10a6:10:550::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.54 via Frontend Transport; Tue,
 1 Apr 2025 15:50:44 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Fail (protection.outlook.com: domain of arm.com does not
 designate 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com;
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU2PEPF0001E9C2.mail.protection.outlook.com (10.167.8.71) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8606.22 via
 Frontend Transport; Tue, 1 Apr 2025 15:50:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bFOhGepCelD+vzG04oQ+G3D38Gn/cUitPHdxn6tIXBVALYeZXKip+UYrXncVWFaPEg8hHiFn0gX1jdNnPYs8OkTUNh9svaTREBH+nAyRMVhQTByrSwS5lXPiB2W5SuULQgXiq3osjWEKsrzD+NWAo/dE38nA6gJOWqbIx3iirhOIMvBYJfFB4/ZcpuW+IgdRO0x/fKgMfRKAE+A2EBAfmCxyKA53Mv+FWxWUeoA5b0H6LPTpcklce/1W/mCKQCxO+3ujDcMzHl+IfXGafvnKf1asmawOg9uCnqqQFmdfmJbhGGZ4+DGoFaI0On9vZmbAXx8GtcNkokvHsZQQ6JEiHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HkkGIb6df+sj8sSCRqtdR/ThzGhKltVpIvsfl2wF9po=;
 b=JsfYnYrW9tWuLIX4qXGKxA2zhn1iqB1+tlEfwX5UiCwr92EuYjYEbDQBDJ6nGdVelhvTmQZBmiL7VFxa9qzeqrrmH/dyUy01os3jIrA++iPfCI8dt5S4AJRQX+KPb7iXzTDmY8lVj6LRllNFWpWOoYLRH70bWHe7qZH+ybr3nCldP4mp/W0IqCW4pOyt7k9Fw6Emqa5f8NDs1yp5ZUOqWCG0ta905CcZY1rB59q7nwJjqEsoM3z5oFVfnNh3CSFz5Muq2K8CnbYEFAwx6X6G06Ck4p8u23S8vdMC6bkcWodnqvXbxqDBenX0R5DGaWyjATI89h6GHTQ3kCGysGSdFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HkkGIb6df+sj8sSCRqtdR/ThzGhKltVpIvsfl2wF9po=;
 b=dVXYsIEK0X1mu7JmyqddbyE5QtqqQsnZ6G/nRH7xoQjxZQmSUmWWog0N44kQEORxCyUN51nUFEgljnu3zVS6/5bJILxc4UskyiKIBN4DbMuPpOX/4WHF8/Gt/LjKxDKa/2g4xmN9cHn/7U9yIRmtK8fjmSYjKlEOyziugCLbn5I=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS8PR08MB10070.eurprd08.prod.outlook.com (2603:10a6:20b:631::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Tue, 1 Apr
 2025 15:50:11 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%5]) with mapi id 15.20.8534.043; Tue, 1 Apr 2025
 15:50:10 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "gudni.m.g@gmail.com" <gudni.m.g@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v4 6/6] recipes-connectivity: Drop dbus from
 RDEPENDS:${PN}
Thread-Topic: [OE-core] [PATCH v4 6/6] recipes-connectivity: Drop dbus from
 RDEPENDS:${PN}
Thread-Index: AQHbow8abA2gNYoVjUGAmmzYQhPqW7OO4GiAgAAU7AA=
Date: Tue, 1 Apr 2025 15:50:10 +0000
Message-ID: <94D7F01E-ACE1-4B65-995A-9EE519B3D533@arm.com>
References: <20250401140430.13837-6-niko.mauno@vaisala.com>
 <27416.1743518107824629818@lists.openembedded.org>
In-Reply-To: <27416.1743518107824629818@lists.openembedded.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.400.131.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS8PR08MB10070:EE_|DU2PEPF0001E9C2:EE_|GV2PR08MB8584:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b22d651-6c83-4e8f-9c26-08dd7134f5c8
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?UktQaVVDTkJhMnJOK1FwQTNBWHkvSU5IMk5FSmIvQkwwUUw2RjR1UDVDV2lx?=
 =?utf-8?B?bERJeDFRSlJpQnE5eDZwWTcrcGZwcmFvWlUvazVQWDUzR2VJK3NZaGo5THlq?=
 =?utf-8?B?SGM0dXl6Mjg1UjVmbFFsVjdoa2NmSisxWWtBQ25xODNuQlU0V0Uyc3BwdWxT?=
 =?utf-8?B?NURoa3NvQ3VNYm1LcURBY3NYY05oNjN4VWprTmhpOGhKeitOL0dnY3VQVlBX?=
 =?utf-8?B?RHdDMWxsVXQ5ekE5aTNrV3k5dVlydDJHSEYzK0FzaUlXR0lJcFNsNUFrMHlD?=
 =?utf-8?B?WC9lSzEvb21IVXdyWk9YbFVsKzIvbEZ5MFFwaEVRNzhoWWtZYzlOT2xCYm5S?=
 =?utf-8?B?WkI2UExOdS9zcGpTYW1ybndlNThUMWpKdXJuSzFRMTFOUFNMQVdJbzJ6K1h1?=
 =?utf-8?B?OUZEUVNQVlUvT2dWRG1nRGQ2ck1Ecnl2Z2RVZm9vT3NTSm9LZERHQnpYVElC?=
 =?utf-8?B?WnVmY0Rjelc1K3FVai9HcDRIQ21BVnJlS04zRXdCOWU5UXp1UkVZU0NqVGVl?=
 =?utf-8?B?MnNORkZ0Q1FRTlgwTnNTUFBmR0lTK0U2YkVMYjZ1aGFrcERPeW9VbFFTVjNE?=
 =?utf-8?B?R1pWclNaU3NoWFh0MWZZdERIMGZXUHdzQjAzemRrYjY5SXFTK0R4cnhUajF5?=
 =?utf-8?B?MWlzZld6N25lSGpVVzg4YmlLVkZneXlHaUt4UmhiQTVWempGdU5rT09PVnVO?=
 =?utf-8?B?L2kxdjRNNVdSMVZBeUhTdjNweEhLSFZVOEdkdnR6MStONFZaYWpDejZYcmRZ?=
 =?utf-8?B?djNjS01FSDRsb2FEZnBkRlhDWkJHcVliOFpiakRlcEw3OVU4MWRzem5vRXdM?=
 =?utf-8?B?a3BkNXZPWldmZ1Z5d05wNmlBRTE2S0ljNVBxUTBkdTRsQVhoTGpmZnZKdWdS?=
 =?utf-8?B?U0xxZUVUVkE3d1lveUtNMHdVYzhUMWdlMFNmcWhqVzRSTEJ2Qk5zMUZaTFly?=
 =?utf-8?B?RkpLeGNnN01Palo3RTJpMjVBL3czOGhtbitlUWhmQmU4Sjk3dGpWSEtiSEYw?=
 =?utf-8?B?amxiVWViSEJ2TjFDTzZQVmVjbjBSM29NV2NRRDJuNC9ndktkY3Rma21HRjFw?=
 =?utf-8?B?em1MV2FnUWRleWZCR1Y1Y3BzWFBRQnFuemJveE1ieGlJb0pBUU5UYzQrcVhJ?=
 =?utf-8?B?RWRzMTRYSXhHTHhGQXBwYjNseU5TL1dTdDJudkZkK3AvaVRobTgzeDY1R0Qy?=
 =?utf-8?B?cTlRM01FQ21LKzZFSm4ySnE4V2ZJMzlSbU5DaWI0cnBmZUk0cVE3Y3M2bksw?=
 =?utf-8?B?WTJQSGUvVlBlOHBFaE03UklObllBT3Z0WXByVmNwc2FlZk81OEV0SFV4Rit1?=
 =?utf-8?B?dGdWbnkyVE95OEtpUkErUCtSdzFNcEJBY2NrUEpRTzlVUklQYjRYWGM0eDhU?=
 =?utf-8?B?bi9EMGhaZ1lndDN3UHRQY3JnaCtXSFJrdTMwUnJUNEdOaHNSNFo3RzJlNUZ1?=
 =?utf-8?B?Ty85RXIyNTc0NVFla2YyRkNoaEFrT0xnNUtSUWVDa2ErTkw4bE5uaWJ3YXZO?=
 =?utf-8?B?NDA2SEtET0JqQ2pQRmhkTGdhdHlSUlJKK0wwVjZvRGRLR3puUUlOUGErUFR3?=
 =?utf-8?B?b081K0N4eHNkeEtqUVdOc1FFdGpEM2V4a1RGM3Z1ZGZPUnl0Y0krVWhUTGgz?=
 =?utf-8?B?bzRCclYraUZINFJlY0plcTdLNmVPeXd4aWdZa1FuVFZ1eWdEdE11aFdwRTVX?=
 =?utf-8?B?cDZ3V0swb2gzZFpaTWxlQmR4SEJONFZLUkxOSnJDdnZteURtUDBlb1BVZEtX?=
 =?utf-8?B?M1NQK1lJQlNXbGVEZDkwdmFpamZsdnB0WlhkTVdKVDlKOUE2cmVhaDByV01t?=
 =?utf-8?B?UnJoeEdJQjBLWE9NZG9YT2t1T1VVSWlMbHkxbWxEQUI0T0F4dUcyVWI3TVo0?=
 =?utf-8?B?SVV6TjFDcjBkeEZOcS9Xd3poeXNWTUg5UXlTWU50TTcza3ZyZ2k2WTJIakgv?=
 =?utf-8?Q?3VqsVMzis3QplSs48XAm7ueFi0g9fV6V?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <DA62127369D5FE429BC8A9FF837C954B@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB10070
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DU2PEPF0001E9C2.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	90092027-a9a3-4e20-ac1d-08dd7134e27e
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|35042699022|82310400026|1800799024|14060799003|36860700013|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?MmpuQnhaaGRoMmVMVHYyem9YbVFtS29yQmh2cmxoeWZoSzJWL05YS1BISFZJ?=
 =?utf-8?B?UEhaSU0ybytvNnQ2Sm1hRGdqUURnQjhUWGlUeVRsOXdTSUREdTJIcGNpQlhn?=
 =?utf-8?B?R2RMcmFHNXlFc09qQlRmZ3VBN0NnVDF1YUI3c1lJa2VZSGt5NWkrY2FQY0xS?=
 =?utf-8?B?clhXQ2hNTDhZZnI1VHJSRFVvYjRtcHErcjAxeVB0TGF0ckZ2bUFaTk1JU3lE?=
 =?utf-8?B?ZktTa2t3T1hsZXErR0RuaHR0MjlSQnFnZTRSTlNFMUFHY1VsRlljZ0JobEVM?=
 =?utf-8?B?S2srQW5JTWRNZ0VuYjdzS0FLUXNnOFN1NHQ1Yzl1ZFQ0aGVzV3hVM1p6czZO?=
 =?utf-8?B?T1RmeEJLNjN2MDdYTjBUVnN4SGhWcmxOajcxZlA4eUtBTkY4TE41akhHOGFJ?=
 =?utf-8?B?L0VoWlVVNys3clVNZ0VFcVlyOUpGLzBEcENtVEJnSTkrQ0V3U21RaEpyMTg1?=
 =?utf-8?B?TE9BbEV6L0x1UGhoNEZXN29sSjJUODBuYWF0UUtiMzJoNHB6dHVHMDBpdzF3?=
 =?utf-8?B?TGtRTTRzdWN0N3BPZkVKSjcrS3FaUEVzOEw2NTdkK1B5cWVzNkpXV0ZkKytX?=
 =?utf-8?B?Q2pJSDdjRmdJLzBSMVpNVm5SMFJZYkpSMlVjYmFJQmdDM0k1UmQzZVNVSVdB?=
 =?utf-8?B?NEUxZTZ0Z1B0eVFBWStUa2VGMnVkU3BZUVQ3Sy9oMHNXYmNwMjlXOEpjVXQ3?=
 =?utf-8?B?SUI0TENwMWpRWHByV2cwOUlta1ZJYThrNWRnajBTVFlSWFN6TFU3emZ6QXdu?=
 =?utf-8?B?bFpYQWJpWUp3YVB0S29TS0xub0FpSk5nTktSZzh5bkZVbkNuRmdhNE9KVmtO?=
 =?utf-8?B?bVJzWnFNZFNIem9UU3IydEgrb1h5bFBVLzNvTEZLb3NLd2dYU1ZMMU9PYzRC?=
 =?utf-8?B?b2tTMFZwNlBrRVA5cmt1MFJsbHFDcVZ5QlBwSFVMMUovU0pFTWl0UjJYUnM2?=
 =?utf-8?B?ZEVhejJLZFk4VVUvd3RyY29aWXF5NzhJVHBITUNrUmlFUWI2dWpCMUlGT0NE?=
 =?utf-8?B?cUc3cWFXazkxTWJRek1kMUZUdVh5YVd6V25vSjlwUUVUUG03OW82OGwvaUlS?=
 =?utf-8?B?UHp4QlhsODdQWG5CL3NvQ3dDN2lROXBGbUNySTMzdExYWkd5c2h0R0tDcEhV?=
 =?utf-8?B?TFJscUg0R2IrVG9TVXIwK2pSZk1mcFN6anVtWkp2eDNyajZ1OG1paWZHS3ZO?=
 =?utf-8?B?V0FZTlhKeER5SjI2cFpZR1FTalJrTk1PRnNDdGlFY3NiVGlFRjRpYndYSU11?=
 =?utf-8?B?amtIV2lKcWJ3VXR3TWNwdWUvcUV3TVdFSW12VlBFUHdpWDRVblBVOVdyR3ds?=
 =?utf-8?B?RVNKVkZYako4dDV5QlNwdEhkbzZIMnFMdllVY2Z2Y1N6a3Z1dDNsSUM5b3pj?=
 =?utf-8?B?VEY0M1lEdUVyMkc3MmtSNWFyZDVwdE5SRmtOUUsrdDU5MUFDZUR2Zm90VVBB?=
 =?utf-8?B?ckRKRmQxR3Z2UGI2TURiTmZaSU5yeUhDdSsrTU1YVi91aU04MDNmVWs4N2FJ?=
 =?utf-8?B?YVlpMmZvUHFqNkdGYU9RakVlRGNNZlRuaWtrSm11ZjlSV0h5R1lTVzFMZENH?=
 =?utf-8?B?bjZTVkxBbko5cCtTUjA2dUpGUktOdExaTHQrZ2JYQ1cwcHpOc3kwTXRPVUFY?=
 =?utf-8?B?SEh5ZzV4czR3dVQ3NWVWT2tNb3NGVGlubnMvWmc5ZXFoa3M4Y3BEaVhYNFN0?=
 =?utf-8?B?U1JQN3B3aisrMmJOK0o5NDZzdk9vbjlZWEIzODRLTjYyUTlWcmZvSjU0bjlt?=
 =?utf-8?B?YzZKMkFxS2dyclUxWndZK0RJdkI3cnk5VWdsVlVZK2dwbGN5QXI0UTlMd2Q2?=
 =?utf-8?B?YlJ3dDdCNFF4MjhCYTJrZGt3TnRTUzI1K1g5V3lWR3JlbnJyc1Q5N3B2TUl4?=
 =?utf-8?B?N2c3NFNORk1SSVVTbzVoTGRMdVIrZmNqSGlEdzdBWTJ4YWxodzF1b2FMUmk0?=
 =?utf-8?B?QWVyalEyVVZqamcvdEFyaWtHbldNdmxXWk9SSEhXU09tODhuWDlrYW1EcG5o?=
 =?utf-8?B?aFAvZUNlNE5BPT0=?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35042699022)(82310400026)(1800799024)(14060799003)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2025 15:50:43.1812
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b22d651-6c83-4e8f-9c26-08dd7134f5c8
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU2PEPF0001E9C2.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB8584
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Apr 2025 15:50:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214139

T24gMSBBcHIgMjAyNSwgYXQgMTU6MzUsIEd1w7BuaSBNw6FyIEdpbGJlcnQgdmlhIGxpc3RzLm9w
ZW5lbWJlZGRlZC5vcmcgPGd1ZG5pLm0uZz1nbWFpbC5jb21AbGlzdHMub3BlbmVtYmVkZGVkLm9y
Zz4gd3JvdGU6DQo+IA0KPiBCbHVlWiBkZXBlbmRzIG9uIGRidXMgYXQgcnVudGltZS4gU2hvdWxk
buKAmXQgdGhlIHJlY2lwZSB0aGVyZWZvcmUgZXhwbGljaXRseSBsaXN0IGl0IGluIFJERVBFTkRT
PyBJdCBzZWVtcyB3ZWlyZCB0byBtZSB0byBoYXZlIHRoZSBkZXBlbmRlbmN5IGNvbWUgZnJvbSBh
IFJSRUNPTU1FTkRTIGluIGRpZmZlcmVudCByZWNpcGUuDQoNCmJsdWV6IGFscmVhZHkgUkRFUEVO
RFMgb24gbGliZGJ1cyB3aGljaCBkZXBlbmRzIG9uIGRidXMuDQoNClRoZSBwb2ludCBoZXJlIHdh
cyB0byByZW1vdmUgZXhwbGljaXQg4oCYZGJ1c+KAmSBkZXBlbmRlbmNpZXMgZnJvbSByZWNpcGVz
IHdoaWNoIHRyYW5zaXRpdmVseSBkZXBlbmQgb24gZGJ1cyBhbHJlYWR5IGFzIHRoZXkgdXNlIGxp
YmRidXMuIA0KDQpSb3Nz

