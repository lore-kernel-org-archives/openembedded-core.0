Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44E1DEA8107
	for <webhook@archiver.kernel.org>; Tue, 10 Feb 2026 12:04:24 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.19])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18086.1770725053339519862
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Feb 2026 04:04:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=OI32WBBZ;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=OI32WBBZ;
 spf=pass (domain: arm.com, ip: 40.107.159.19, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=YM0WqyHuFz8DoSCwRi7eZFoAZXqUuRbR/7chrD3Z/WA9nfV0B3AWgvTHhqHKIplsCnmNvafHo4hy3HgQIbEdWS7CQVUliRPRWM1II5EeZnluGh12PpcgvMSNNfAzJLWBt9ExbW1GXkFqXQgnlMQqlIkhIn2yeJ8Pm68Ap2ZPnbf8e3aLLmK39XHTvKy+thfihWT3BmsUsuJRQx1WSxvhcdkC96LybAdh+mmxAzIB9W3SdqkUxEKcwgl5wYeOtHFCB0RXpboIihPmiJf4OJ8xOKQgjiS59qUuDzbhB2ax+s6oUR3ky5D4MRMUfOpfm+e8aY699E1pLXpUVYjQsCJrcQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wblJpIthsYPDZTXjdjONrcRUmeNfoYEkAIJIAPFq68k=;
 b=a97gvQNYeW53Jtn2W/HuRZdpg0aUwecqQ4F43VtYlW0u24SgyBRM6Rf+liGgiLTwc5+/X8njRJxQfW4e6ZBhv31Vl/aSFROmX5R+Fb7ExfWTMn8c7I/A8l6v+K44XwyAJm+P98vWfblRfPI0QuGrwYv80lHjOVRHi9x+3F9xXt8nt86J1neHb86LbAHwq5tRDT/SGWDk7riMm6uXZ6SL8+BXNMJ0Tpf+kEMFtIqMI2nuM+EGOyO35sFhCQWxfHS9t+djni3g4tbzDnGp0dIvLyqRDobyA3YJhAmjHGdpi8K/w1NPXANHTIeeon954vek/bcKYImdv27Cm98kOOTJjw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=est.tech smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wblJpIthsYPDZTXjdjONrcRUmeNfoYEkAIJIAPFq68k=;
 b=OI32WBBZ5Hv9PnwExPAgbDDGnkeT6Ftgj4O5GXFcJCPbtoxAUQGJv++w0wSdgZQJ3AdxrWJ1zwMyDD/klR54cbXcUgVF4aBCO/kZ1UbHmCkmH8vMw4C8rDXzmkyeH4rJuBTXshROuPbRL5VV3BsaQU1ATMuYZUziwxzzJ3CWRVQ=
Received: from DB8PR04CA0014.eurprd04.prod.outlook.com (2603:10a6:10:110::24)
 by GV1PR08MB11180.eurprd08.prod.outlook.com (2603:10a6:150:1f4::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Tue, 10 Feb
 2026 12:04:04 +0000
Received: from DB3PEPF00008859.eurprd02.prod.outlook.com
 (2603:10a6:10:110:cafe::d7) by DB8PR04CA0014.outlook.office365.com
 (2603:10a6:10:110::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.19 via Frontend Transport; Tue,
 10 Feb 2026 12:03:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB3PEPF00008859.mail.protection.outlook.com (10.167.242.4) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.8
 via Frontend Transport; Tue, 10 Feb 2026 12:04:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rKfAVzKpSeiJ7YsuMmnrJLXWtsjxpaMV1yNjeThVUAuxPpR48hZEZwbEufuv+dSqRKdOgiI9M8JQhyCFpj3WJbhuRExGx1zyh98gr8acHvZ4yaM9j65gMeaxypAI7/2xKN0wmuKfJDLSzpdwpXJwMYcjKxkJdNfZKmwY6T+M80XXuZ4iLaY+gJcf7AyLWb67+jcvcdGs7ruxP1MWZQ7UTCPNsKZOm//3W4yRqjAatcvbT8h+9zGnmFQwUY/F9iyCcZNjc6tAn5kdbfPUwF7l1MIwJjoyy79oAaZv4zvtFXY11f9WKYx8zS8EzRQsTDnK82V6UsBAsJmFhrBNQZ8i8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wblJpIthsYPDZTXjdjONrcRUmeNfoYEkAIJIAPFq68k=;
 b=d9PRXF8P+B0Tt0psAN2RiQqS0FyeQQfa34z9ErvEif3T7k78RcT1xGQ66g5hXTAHwelS17jm65+/GHRS7n797QQLfoUGwjkbWen4JMR/DWYRMBqUOlaHKBg4KiBGnWAJ6D4nFofkRzNV5YgdeA0tHgcABsORXlJrvzhkDNyB+qmwEvTAyllLDQLAz5Oz6QMnemkQeG2+0182DYICEj6ExbPVgzQPAkPuoKdB3aj3xzPfps+1THDDe1O80KEIfR4uclCqWOdXKWyYoM65el46mpkBEe/qN4Qc/6NTljwpo27tHtQhwBe0z36Z/PsBmxRfy8CHnxO/ZGKgpUwPcc4YwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wblJpIthsYPDZTXjdjONrcRUmeNfoYEkAIJIAPFq68k=;
 b=OI32WBBZ5Hv9PnwExPAgbDDGnkeT6Ftgj4O5GXFcJCPbtoxAUQGJv++w0wSdgZQJ3AdxrWJ1zwMyDD/klR54cbXcUgVF4aBCO/kZ1UbHmCkmH8vMw4C8rDXzmkyeH4rJuBTXshROuPbRL5VV3BsaQU1ATMuYZUziwxzzJ3CWRVQ=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by PAVPR08MB10329.eurprd08.prod.outlook.com (2603:10a6:102:32c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.18; Tue, 10 Feb
 2026 12:03:01 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50%6]) with mapi id 15.20.9587.017; Tue, 10 Feb 2026
 12:03:01 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "pratik.farkase@est.tech" <pratik.farkase@est.tech>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "pratik.farkase@ericsson.com"
	<pratik.farkase@ericsson.com>
Subject: Re: [OE-core][PATCH v1] libsolv: add ptest support
Thread-Topic: [OE-core][PATCH v1] libsolv: add ptest support
Thread-Index: AQHclJRr1pJ1FtQ5A0aUKlQudyHc4bV74TIA
Date: Tue, 10 Feb 2026 12:03:00 +0000
Message-ID: <8E143994-B189-43BD-BDEA-419F9FDC84AF@arm.com>
References: <20260202223606.19978-1-pratik.farkase@est.tech>
In-Reply-To: <20260202223606.19978-1-pratik.farkase@est.tech>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.700.81.1.4)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|PAVPR08MB10329:EE_|DB3PEPF00008859:EE_|GV1PR08MB11180:EE_
X-MS-Office365-Filtering-Correlation-Id: a708b6e8-9ad8-4a7d-afb3-08de689c7c1a
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700021;
X-Microsoft-Antispam-Message-Info-Original: 
 =?us-ascii?Q?WQMfK4v/v6vqucfJK+8Z4Kz18Ojf774BVACMIgSQwYVlkjheQFWFBzTMXv8K?=
 =?us-ascii?Q?IAvd6H1DbZG9YjcxkxJIk/A0RDp5YMU6564nayJbnd/EOnCKpWT5/ZfZhXRO?=
 =?us-ascii?Q?JzfH2MREsjV1/Ky0MXemzmi3TwOFKKpLKee3hom68GvI90ejBDyCw+TsXlZs?=
 =?us-ascii?Q?AVJxvAreR+QoTltn52BdW7QIiUqFIL1p1XO94dB8yBGGBXW/+jTZOWLtFIhx?=
 =?us-ascii?Q?jdCsAFIxMB9SAvAXU1G8MZpB8q7JLqBowM70CQ5sRouH6Nd7i46j+p8wlyY2?=
 =?us-ascii?Q?diFdugje0go6+y0mjugL8+E0edUdI8lxa30xKnjLxMB0RlJFusljpR95jbCP?=
 =?us-ascii?Q?BjgeD/ZgjEGn//hv6sbJq0A2dC1e0JLiJwWmuaCjfbGoZGyMSJ/3G1DGldF4?=
 =?us-ascii?Q?+O/HmtmFQbFS9EoLxYPcPCC/wdIBr0TlQFnkVkMYmwwn7SuaLB+NFkiHjtp3?=
 =?us-ascii?Q?gVafKmosy+M4DzFoNmi0rS+oJ+utn2Lzzcpdq/j93YQ9hreLqMtoynhWYskw?=
 =?us-ascii?Q?n15ZXX7uYKXaIrq5YLzkKdv8NoutopEVbcK4PSNgdCDtVvTtuyulzSCdCvXL?=
 =?us-ascii?Q?JwTgJ477bzcjNEurEij1cO9PDzvIBTdAetZL2FOH7HTFjGYxoAj2vz1wDX40?=
 =?us-ascii?Q?l2i4S3A9xbqyu9AVaTESHNMmNZ5dFhd1fKCA8kK7UxWuqc8FNZ2Ex5aHqtmu?=
 =?us-ascii?Q?xYu7lsuuGz9Zv3pD94tLdkwi7frPOOcdDYbSCmKVFB1Rkd+Olf0kps7zorYN?=
 =?us-ascii?Q?Pd6hNQXR1YwYhaXHdjRB1UawYi5oQMu/b5ucXXsAkenM7Ro7k9irOnGOh0Sd?=
 =?us-ascii?Q?scaDTOYtBDXDdURE2uUqO3iMBvDfjaiUHGURTona0buu1mHIs+g6rP9220AO?=
 =?us-ascii?Q?VoVOa5msfG2AyfsTEl9Rnb22NBUaCprlLpm14PsIO9PAwO8LC530mEVs4OwA?=
 =?us-ascii?Q?ZLyO6wmF79A+VtUnH4KqCaNjbZ2M22hDtzSZjv45N5aQarHwiXePULoGJ1wG?=
 =?us-ascii?Q?nJTzTZqHNZkwYckA1m1alFgA7t5I4TLiXuEPqhRxbrxEqZDUDvZgtbQLFSiy?=
 =?us-ascii?Q?LX+bdJ7mKmQN1tRYOtN/IhyNuqf99D0a+0Ekbt66sMuMuiSD6ulfbFdTbv6W?=
 =?us-ascii?Q?4duQxQOJz+9QZ/v4bjAY8DkHHyKhy5x4vd3/rmJ9QGLQHh5QMKK+jtJTygaX?=
 =?us-ascii?Q?w69x5qjajv5UTVOazSw4MraQ7Arerdckq7NxcppQEMP2CFegZsrRPBkWy8vw?=
 =?us-ascii?Q?aT5qJpF81VcYvR0EbVWWUWFNibzNUWVDAb2rRkhcNGcxhkuCvL0OlCIhWJEB?=
 =?us-ascii?Q?oSCd56M4EHbq5Aqkb7p558eldN4AQbnSGW/jSfNCpCj4HH6fBHeqYqMCrARY?=
 =?us-ascii?Q?tFQ2SyVWJve3St1ixhQdDGvtdCeq4fvv6XU+fFgbEdg3mBbsgNHL2TlQtEcz?=
 =?us-ascii?Q?tUyZYSW8vp07erQ0x8WiHisGrPvrGJQffiAPGdRv62vfJuuT4fj5xWykFGZX?=
 =?us-ascii?Q?Aq6u6JUb8LzuEsBQQMJIProKB+Xh4RtNJiA/ajlgf1+BUXyIl0b8X8oCH869?=
 =?us-ascii?Q?OpdW02JczSiJRltohO+V4DWyNNGWVFpCWjB5tlxC5BFAPJwBliG24eqWGw3Q?=
 =?us-ascii?Q?gfob1wLMh80LqNwRggdTnzQ=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <57C50A351BFF7A43BD30D5F6735B9BAF@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB10329
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB3PEPF00008859.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	03bc8f9a-81f9-4215-0ca1-08de689c5693
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|14060799003|35042699022|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?QcrElmc4oOI/q0t0c7lLiqBmISkisC9dBocF4vlM3V2Z2bHetdG1PkwJk+wc?=
 =?us-ascii?Q?5BET0GyyaTVc+fFeL7mvgoI2IrFkYOzxlVWMuOrUc6WzHqILiE9cfwrq8gAY?=
 =?us-ascii?Q?POBmylFxKQ7E7bEr7cD6ayVKU3tT9F/W5NTe/jVSKFR+XqvepW8M+Dz95e3b?=
 =?us-ascii?Q?wFCjoT08QqIEuVaNy3uvvllVhaCjrPRJHzyjrFR5iLZXF4R7h4972HVgna3Q?=
 =?us-ascii?Q?CZ6OdIsH67j9ve61mDPBDDD2b6iYH2eiumXorYGsbNH8p+v+jiFlgBPjqxid?=
 =?us-ascii?Q?5Du/bOtaZ7aR6g/QMyv1aWG5Owv+kuHkm83NdGD0yGyRNrjIZRprvBsM9XCp?=
 =?us-ascii?Q?auVAlRsAVma6GVi48ov9J/FoeFcB6iJUI3pwn2gO0I3DT9OiI/cHMDVkWwUP?=
 =?us-ascii?Q?otOABOgRi5gBDvyeWtrDbMS5YBKAEjNSKU+rTaClrZWSNI3VZ+8HpD0uqybA?=
 =?us-ascii?Q?AfFDvcs/4BhJ35YgXinTvHvUtOceKsoymKdHQtXn8bsnwtmkZNZzjyPtY7R4?=
 =?us-ascii?Q?wWeOnhyQhC9Gp33mQdxsMxjdB2jH657kZzR3AzwGNRNWGSiZQjfkI+11pKiE?=
 =?us-ascii?Q?uKbmZWozfYL8hAUOHdcCrnM/u3L0oh+NRZMsaWJbmneT9nQGuMTbqpIvPRnU?=
 =?us-ascii?Q?jk4m2YwVP5APSqKA+FmG6F2ErbCVbk6Byt0T1jUjgWUYDk8CUMXZ+xXZihzZ?=
 =?us-ascii?Q?NmbQ01k8XXaxzXMsFz7bVi0o6sv/o3+bKEDKbYDQF/yYbs76wS1b1+dmGDln?=
 =?us-ascii?Q?obyZKdaq2/WDvGSXKlbu3nxLmNN6T6+v7p0DarW8JyqFiZqTwU2iBdORBHwO?=
 =?us-ascii?Q?BRpK3vTx3QFU4zAvxdKCrccx3ItiQJzeO2dGJp+DQCyeTH5aS/+x7dOHfq4G?=
 =?us-ascii?Q?Aud06ZJu4to23TLVkUTXFfT/MXzCPfWufzXL/2upDMR8LxOWQotH+QoWdwMv?=
 =?us-ascii?Q?GaumWvPSxopqXRZ83e5q1dQb1nh8RoYkxVC+dqc0d4YgnUe+WVvhsBfy4vaz?=
 =?us-ascii?Q?dvvckx13u4bA/1oozgIPpLgwgTuLRHHCP9HicYdzfQ8sirsHz2Fx1frAS0J1?=
 =?us-ascii?Q?FrdFzWkSyXAgztLo+oXsoD3mhutu1BUKJXceooK0fVAUJ6hlP9LHQZz1WaWa?=
 =?us-ascii?Q?lsaW+TqT+Fl2ef6EquUowX8yNHJLMnEjj+2F0ufeXqhDZikyp/CtLeaVECip?=
 =?us-ascii?Q?FX7yUjPANjLOakd1Wtl1oq+OO4gNC2TGmbdmr4F5EKRY5VU5+WIv7jYGlcgd?=
 =?us-ascii?Q?80Asp3+prZzwcjSnf25WA6l1PbcEQWLjhpjhc+AYy8EL/UhoudpSj19a8Bcg?=
 =?us-ascii?Q?FtbnPJV6lzLg8/KrqEcscJcfHabdjL9dDG4uqfnsLuagSDqnhpzY3wDoa/NM?=
 =?us-ascii?Q?MUP1B0yUFZHXRpmZXK1lb2u/yiHvo8T62TZw4n3ZhZDOPhc+qPm6zlnABBEq?=
 =?us-ascii?Q?yiApH5FiJhhZZVezEsZEqbMx6+JaW2uKq2Iy50wSdhfC5tbYQ8EcSDwTjuvq?=
 =?us-ascii?Q?D/GRg4S6R8B/doa3RG/dymugC+CgN/IqwUSKpqKkMdZ9JPvZqshYBsOE85oB?=
 =?us-ascii?Q?Xeq1h1zMFZLOOI9fq3zvMpeRX1FGKAlXfeItS9QrHcyYvmPOrPVXabn+IdSU?=
 =?us-ascii?Q?GC5VZbMeIUa2VELseNNwWZq3pk7f9j8oeSnxBIeT/zyxPxc49zl8bCTZ9s8I?=
 =?us-ascii?Q?i9NX6g=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(14060799003)(35042699022)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	PJ65GWgDyJR6eoll1CRSjDnqORvYUu04y0jxjANZkrobbDFupMFwCc9EINgJkAYJsXzWj/cfVOvcrzFMbPF0YljgLLs7YVLLmRdISYouiGbHgc72pCrrPnmvh5oB6yEP/i0rg2zg/19ax7wf+r6DqLt1t9p4uMOi/9lBw/FL+hkrkvYSaEVaudxX9EehLxADzGR3ljeksffp9eYwfE+yRlM4apPaDZR7gpL+z29eGY3kJXlN4N85C/NuPIdTSoTBYOG9UK6TwliL4hjwHM45Ozh1C9Mnv2NLnDM8hEA8hP99lwpCJjGxbtUyNc0NrflWdEIGBcgtHGTNdE0A9GWPZ0zKiUccFh48TWUyEPe4Hda8Qnh2Ut6rnaHoWtOH6rvWbVlCMrkLT2kQKiKsrVXvWMO2eTIFRK++iYttAJm4CrBOlbVLQTNUBlmNQDLwyXxl
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 12:04:03.8359
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a708b6e8-9ad8-4a7d-afb3-08de689c7c1a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB3PEPF00008859.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB11180
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Feb 2026 12:04:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230890

Hi Patrik,

We merged this, but the scripts seem overly defensive, would you be able to=
 send a follow-on cleanup?  See comments below.

On 2 Feb 2026, at 22:36, Pratik Farkase via lists.openembedded.org <pratik.=
farkase=3Dest.tech@lists.openembedded.org> wrote:
> +for t in allowuninstall alternative blacklist choicerules choose cleande=
ps \
> +         cplxdeps distupgrade evrcmp excludefromweak favor focus forcebe=
st \
> +         lock lockstep multiversion namespace proof recommendations sat =
\
> +         selection strictrepoprio strongrecommends targeted testcase wea=
kdeps \
> +         whatprovideswithdisabled yumobs; do

Can this just be for t in testcases/*?

> +    if [ -x ./runtestcases.sh ] && [ -d testcases/$t ]; then

You know these exist as they were installed, and if they were not then we w=
ant the tests to fail. Remove the checks.

> +do_install_ptest() {
> +    install -d ${D}${PTEST_PATH}/tools
> +    install -d ${D}${PTEST_PATH}/test
> +
> +    if [ -f ${B}/tools/testsolv ]; then
> +        install -m 0755 ${B}/tools/testsolv ${D}${PTEST_PATH}/tools/
> +    fi
> +
> +    if [ -f ${S}/test/runtestcases.sh ]; then
> +        install -m 0755 ${S}/test/runtestcases.sh ${D}${PTEST_PATH}/test=
/
> +    fi
> +
> +    if [ -d ${S}/test/testcases ]; then
> +        cp -r ${S}/test/testcases ${D}${PTEST_PATH}/test/
> +    fi

Why all the checks? If the tests rename or move then we _want_ the recipe t=
o fail so the ptest installation can be updated.

Cheers,
Ross


