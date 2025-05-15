Return-Path: <luca.fancellu@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01361C2D0CD
	for <webhook@archiver.kernel.org>; Thu, 15 May 2025 13:52:35 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.76])
 by mx.groups.io with SMTP id smtpd.web10.13101.1747317148790014701
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 May 2025 06:52:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=FHMOhwfN;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=FHMOhwfN;
 spf=pass (domain: arm.com, ip: 40.107.20.76, mailfrom: luca.fancellu@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=HPNFl0rBXJ9w0pZufW5oZuqpfI6gRqSzyq1IjrPItL7kd9uwi54yPs3T1YFMzdk75qwCkENjurRE9e2sEOUdErFil6AhADzEdmbRFGd/OKCPrFfuBCuAUOXDYRb21FlpOYOCnEA4mrH/N6L2KSspr2IbYHEa5Jpaqlf5+6wdt9IAphiwJnN7P0DaLH0TtfTMYNUiMTZuPVmneVNo2BYOfcf6fPDeXgYBZdRVIJBQtD8wnlKFtbHSR4iLDZM1rXt0fMXwHmC/+9eKaDC8D6SwBaauAKn8hOKghgJpJ0P5g1tyWoZW5muHxiBh8SdFcjoBhnQrZQcP4Iq9wMDaedBAbg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d1THeoQnoobzhl4y7dqYRStKQeCv3YQRCFs86sR10Rw=;
 b=Dxogb45RCjWFnQ8KaZWlQk8rhaUZkVMGb3XyWepDk16DOg5vhAmMIZ8nOsfel6bF424fiV7z5qANh9a8Un5/g8c7yff31+jvf+16/XXuQ6ldtYsD3RUIbyHnQyJtRvq+N22VqKB3RnQMyKatCZv1AH8MGmEOHqa+Izf5TPIu5JAjPWy8jRIXC2tyYu1RdtM+4XXi3U/KmXDSBxFpHtQkcx/B/PsC6c731UD/v4ig4CigXMoApddl5eKCeCILZ51V4O0wqyJJ6/gvmAUTtf/11xUSpySnoLDbYtUJfyP41Hmc4mf4aWAKR4qutlfRz+4Sl8U3BoPX7HvrJ1SXilNqDA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d1THeoQnoobzhl4y7dqYRStKQeCv3YQRCFs86sR10Rw=;
 b=FHMOhwfNRBhxWkyTDFVfMDEiokSzphQpfl7C1zaZkcKdhs4a6phoKnZYyZwWQdSLFIRm04yslVDiYnsFCcY1WwqIycLX5pMROaf6S4egpECKR4Q85HOUEmKT0g4CAQcA/ah3sjZ6TYyXMvH+UFGW6i1Z0dk6qYVCGYFEPDOMkTg=
Received: from AS4P191CA0005.EURP191.PROD.OUTLOOK.COM (2603:10a6:20b:5d5::15)
 by AS8PR08MB6533.eurprd08.prod.outlook.com (2603:10a6:20b:33e::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.32; Thu, 15 May
 2025 13:52:24 +0000
Received: from AM1PEPF000252DE.eurprd07.prod.outlook.com
 (2603:10a6:20b:5d5:cafe::e1) by AS4P191CA0005.outlook.office365.com
 (2603:10a6:20b:5d5::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.18 via Frontend Transport; Thu,
 15 May 2025 13:52:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM1PEPF000252DE.mail.protection.outlook.com (10.167.16.56) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.18
 via Frontend Transport; Thu, 15 May 2025 13:52:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DZNxmjHQdo6IXZyV/iNM8GDpeaT+WXe/nDzOqklCoirozkIVP75emyk9jAS71pSTP60YniwvjxmilGMVEmT1Dj0rZZjhSCbey+vRKsBppIelG+xx9KiNQkHnjbiHRUa43nMPl9xjCWpwE2hN0CokoITzYYgjY622OcVma7WUndStfuJMgSNJ6ZoGXsEo0zAJIlDGvycg0CaMSbPpaq8Mk9nFY9JV2W4bJxtlevVLQvuE6zMIBcX1YlUEv7G1BtJUOIW9XK6SNqo9FM08U8s7orYg9xEB3ZaqAho4JqJWyENsPY73oMObe7JyvhaBI+3sbTR4gzx3W56pR7qll89Qeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d1THeoQnoobzhl4y7dqYRStKQeCv3YQRCFs86sR10Rw=;
 b=vuNZWH3p4hzo6CJLicpIvQWv7wm4lElGVO+MmCOAg+kqOHubQlfBc/aBzdfMJ/2ehupoJWrZRR5FiP6JmISrWdH9hfBAPa3/xbFhTz0wXkuxQSNp6F2pJwk1roX64s/sHnj+8RK9L0v+9vk4DO7K/P/bGrsKJuff9r3JzmcZZngW142L357R3GLQYaiO6OxRf30r5ctzKxhEnqYcM1cNq7tbxm7WriVNV3QxbuKCnzSoM6+26gJzpMQpkOVT0p2JoPq4l2IYxackpqwwNhEx5phD3I0yK1mEK/aXhwnzG0JjA/X+fe5cVpl1UXC4ie/d24Y+dkMgxNQ6gibavuvhBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d1THeoQnoobzhl4y7dqYRStKQeCv3YQRCFs86sR10Rw=;
 b=FHMOhwfNRBhxWkyTDFVfMDEiokSzphQpfl7C1zaZkcKdhs4a6phoKnZYyZwWQdSLFIRm04yslVDiYnsFCcY1WwqIycLX5pMROaf6S4egpECKR4Q85HOUEmKT0g4CAQcA/ah3sjZ6TYyXMvH+UFGW6i1Z0dk6qYVCGYFEPDOMkTg=
Received: from DB7PR08MB2987.eurprd08.prod.outlook.com (2603:10a6:5:1c::25) by
 PAWPR08MB11141.eurprd08.prod.outlook.com (2603:10a6:102:471::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.30; Thu, 15 May
 2025 13:51:51 +0000
Received: from DB7PR08MB2987.eurprd08.prod.outlook.com
 ([fe80::d53f:b16d:70a5:8668]) by DB7PR08MB2987.eurprd08.prod.outlook.com
 ([fe80::d53f:b16d:70a5:8668%2]) with mapi id 15.20.8722.027; Thu, 15 May 2025
 13:51:51 +0000
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] clang: Include the libclang python bindings in
 the build
Thread-Topic: [OE-core] [PATCH] clang: Include the libclang python bindings in
 the build
Thread-Index: AQHbxZq5ZISzQqXBeki2/byi0MF8RbPTsSuAgAAA5ACAAAObAA==
Date: Thu, 15 May 2025 13:51:51 +0000
Message-ID: <1CB83516-B9EF-4381-85DE-59B4C55A031C@arm.com>
References: <20250515130753.326236-1-luca.fancellu@arm.com>
 <CANNYZj9qTsHiDK-hHgNUN72+i--RamkCNt760Fa3ZjWkEzqSAA@mail.gmail.com>
 <6C8DA825-0E82-4776-9E56-55B17CF1052A@arm.com>
 <CANNYZj-71JnUvJb1tAZ34TGQX8RTwGB9ATUVc7-ptf+CemP+XA@mail.gmail.com>
In-Reply-To: 
 <CANNYZj-71JnUvJb1tAZ34TGQX8RTwGB9ATUVc7-ptf+CemP+XA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.500.181.1.5)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	DB7PR08MB2987:EE_|PAWPR08MB11141:EE_|AM1PEPF000252DE:EE_|AS8PR08MB6533:EE_
X-MS-Office365-Filtering-Correlation-Id: 53de6087-8967-424a-e69d-08dd93b7b82a
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?cG9hUGtLTDk0aVVkUXNuSGJaOHhsSDQ3eXJRYlZjYWlVQ0UrVmorOU1rTStK?=
 =?utf-8?B?bUZ3WTRPWWNSWjgvTVk0dTBhakU2cjUyRFZmV0ZSUFpJVU1EN1FacURHZEsy?=
 =?utf-8?B?dmFrMkorVlBaOWJNc2xpeWc2MHdLMVlLUTF5Zjd6TmdCbC9hSEMzMnZUUmdt?=
 =?utf-8?B?WWtMajJkWDFPbHhwTDd3c3FQbzBnd1J0ZGh2b0hPL0g4N0VrTGtUUlp3bzE1?=
 =?utf-8?B?ekhxRkRrT1hQMGo1RXdOSDVYMXltb1BSWndCb04vQnRCeDJ1K0dYM2htSy8z?=
 =?utf-8?B?czlrQmVsem5RZHUvckF6RFlzMDI4bThCd01idWt2UmVWeHVDcWJadUhPam1U?=
 =?utf-8?B?RzllSkJKa2s2Q3R2dGtnMlBLalFRNHNCMmpyN2liUjhXeitGbG5KL2Y3dWVB?=
 =?utf-8?B?T1lwaTJlZC9zTDdrM2lVZUU4QjIxdGxYSkVxc0YxaE5NeUtUSHJnNkp3SXRY?=
 =?utf-8?B?bmdSVm9LSEluQkRrcm9FZnlZZHp4WHEyNXlyN09rUjl3MHJTajFwNjFTZys5?=
 =?utf-8?B?MEJpcGlJeVlpcTJRWXFRS3YvU2wxV0J3ZldlYnR5YUwyUlJWWEVnK1lvckpY?=
 =?utf-8?B?ZmFYSTAvMWNGRjhXV1JoWEJYMHV5Njd0TXRzMlZmcURwaVBpdk5mYTVHQ0Np?=
 =?utf-8?B?c0F5ZHBjT2hxUGRVeUZkN3RJeTBlOFhvSmNaL3NEVUk4YVphK0JGQU1GV2N4?=
 =?utf-8?B?WHZCdEFmdFpkVERxeGRxaGkyVzBBQjFmRXNUWlRrK093UmJQbUhtMlVleUVO?=
 =?utf-8?B?QlpKSXAzSnh0c2ZlSGIyYkhkRlpHVlRQbTYxM3I5alZvTm9UZFZMZHhpcGdD?=
 =?utf-8?B?MmlZbG9mSWZZMTRoZTBCaUU5SVFkdytKWmpmbGhZWFpERnFNK1lPNHd4Nzly?=
 =?utf-8?B?TExZY1FoemdpSlQ1MkVtaS81bFNTZUl1TnJwdnpnS1hEaGdNdXlNVWV1Y1hD?=
 =?utf-8?B?KzdoVzZvb3BzdldUSWFlY2Z6cmtzS0JidFluZzNKaHRIbE1GNzY1dklMNkJ6?=
 =?utf-8?B?amtXRkFyMGFUOGZoRFAzQ3Z6eHhGNGVobnRSbzlTRGVVYUpWNXAzTzVPQ0E1?=
 =?utf-8?B?R29yT3ZhemtLcXduQkFwcDZtSGRwaUZYR3NJYTU1TkZQVTdpbmRRcEdPTm5z?=
 =?utf-8?B?ZWtUVHZmZ0FsWVhLNDYzSkZhcXphdm5IZXRSU09JbDBDTmZ5eVhJbitKTWFK?=
 =?utf-8?B?UXV4TUtHOFZqOTVTU2NLeCtYZUhxOUdUWlBXUE4vTTRMUk5yWm0vSVF0bVJP?=
 =?utf-8?B?WEVqWS9jcDNXbmxpUFZJSUdQK0RreEFmNEhrZlpXN2YvNU1GZzkxTG5QVTZE?=
 =?utf-8?B?RThndjVRWHEvY1hrbm56NHVPNnh5ZGlWb0VxZFpUc09MaTBCOXJDamVMOFVQ?=
 =?utf-8?B?R2hXVW13NlowbW9Mb2ZXNGNhU0ptNFI4RDBuM0ZQV2xJR3g1bE51QVdQWlJx?=
 =?utf-8?B?N2JlK05mK0owNU1UdHBVbUV2bUlnWTlMQTEvNFNMaS81OVZTcnJFZG1XUEJQ?=
 =?utf-8?B?ZC9LV0dPRmt4bDBxQTRPSWtUakhINklab0pIZVJLejhGRnlMYldYN3VRNWZI?=
 =?utf-8?B?TXU1VzN1R3lDaU5qblpPYnAwVXlhRWcxOEVYazJsV1dKd0VXSXR0MGV3cjNz?=
 =?utf-8?B?TndzMGZEdzBtVnlrdWdSRFBveTBHTUFjbDVDNC9aSVgvdlNOc1lPWWEwdGZt?=
 =?utf-8?B?WWpXeHN2eXRiMjdxSUt5WGlud0gvY3A0RzViUzF0MGpnMzRtei9LVEx0Snkz?=
 =?utf-8?B?V2hqUTlTK3hQbkY5NDZadVEwYmJOTHpMaUQxdFlBN1preDV6MXhmdFhFVGxq?=
 =?utf-8?B?SW1jcGoyYWs0QWVzTnFLcERYWTZ2azlVWnF6T2dSYzl6eUIvTFdpSFVMTUNF?=
 =?utf-8?B?OTgrZXZ6TEtVSXI2N01YWHBlc3BUclFLN2Jzc1RLWmZaR1YxcXRrS1pUVy9N?=
 =?utf-8?B?OXZLeUpUWkxZTXFPZWx1UGdyWW10eUEvcWlvc3dwaFJ5ZHhLRFlxNDlwa2NS?=
 =?utf-8?Q?6Bj3N567bgHR6puks78uSSfgbNgYjk=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB2987.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <DDEAA5528335B64BA7D680672D475E73@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB11141
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM1PEPF000252DE.eurprd07.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	64ae5ac0-0577-4d61-b6ce-08dd93b7a4e5
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|14060799003|376014|35042699022|36860700013|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?SldBNzFFR3YzTmxTYmpCRjRPMDhzSldhNFZYQW1RNXpkRi9BMEM5NTZaTis2?=
 =?utf-8?B?T1pycEFETFlHNmlzWjZKT2JpMGduTXJuY1hQWDEya2RMdFVmVXRCQnFnMVZV?=
 =?utf-8?B?ZytLRzA0aUpRSlFUK0NWMWZIZ0tsdVg0cFZSVGpoU3A4NzBCd211ZFZrSXc0?=
 =?utf-8?B?OUl2TGFmdmVvdnFvT1doejBQb0dwOEJ4RFo3VzlWeVBjRWJTQU5EbGNpS0lV?=
 =?utf-8?B?Z3lWb29sZTE3cEp3cUVERlkwRWtxcGU4VG9weWVIclR6V3JUTlo4eVczZENj?=
 =?utf-8?B?VytSOE5LdXR1R0F4SmQxV3VJOEhBcVRGSTBCV0JIUGxBNkZ0QWF6dnRjTVRG?=
 =?utf-8?B?YjRiZjAxQjI0cXUySEZrVDZLTFZOSmRlbzJPbkRJTTRWQTk5T0ZIek9GWGxn?=
 =?utf-8?B?UDgzMlpTc3BBTmR1aE1XYzQ1SGRPRFhadm0vMWczWlZCK3VtcDlzN1J4Zkdi?=
 =?utf-8?B?SEtqbUN0QjVPTHBNQ3BaTUtxT1c2bFZLZ3BiT3NNMmV1UWk3aHhkMCtHOU8x?=
 =?utf-8?B?NHNQMWlnSVRSVVdCcWNtS1RYYitEdnZzekk1a3VBaVNvY0FUVU1jWGY2aDBa?=
 =?utf-8?B?T1BIc2w0L29zZFNkUzZGb1owU3lsWHFjLyswSEhncUVsajZlL1VvUWhWOGxS?=
 =?utf-8?B?dkFtVHJuM2J2QkYydFFsbEkyQUFpOGk2bWIxOVEyUVloek9nVldLSXRuUjVM?=
 =?utf-8?B?eXozTGZWQVM5bTIwMW9pZzJSM2ZtTVlFNkFQWmRXWFMwaDNMSm5keERJTU5I?=
 =?utf-8?B?L2pmZk5hd1Yzck1XMUxUNThnclBDT3dKUXJNdkhTUjhyWlBGNHQ0OUcwRG5j?=
 =?utf-8?B?bFR1cHVDeDRyYkZkZDBQRkdXeHoySHhPcmo0RGIxWTVxcmxSb0hRaTQyWnlC?=
 =?utf-8?B?UGMrODQxV1RKYmJsN1hORDFYNlVUVW5RbitYczJaaU14WG1OMGVXbmVUSmhv?=
 =?utf-8?B?NlZJbUFJckR0ZDVKNUhleWZCbnFoRiszOE13NTdKcjZCeUlBQWlXRXBLSFhy?=
 =?utf-8?B?TzUvdE1qS3hvWjJtK3VhM2p0ekdvRG9vQklLLy9MY3FDYWUwUEt1TkRQTFd0?=
 =?utf-8?B?Q3RVMFNDN0c0WUxOd3MrM01EMC8vdE56YkhaQjlsNS90czdaa0ZSVVk4OGVY?=
 =?utf-8?B?amRzaDdkL010dS9rNzJmS2Z0NFZSTFFINmFhZVRKNjZ4algxc2RMOER5SnIy?=
 =?utf-8?B?ZXZweFRHbCtRNktMdk01YWJmcFBKcnp3d2I0NXp3TlRYM0x2MDhrcnZobjB4?=
 =?utf-8?B?eWpndkdLUmRMeklKTXplSGVaWTVTenVLdTdDcmhyaWVNazhiQXBzQkJ4TC9w?=
 =?utf-8?B?U09oemhRQTFsMUVOMmV3c0ZqT2FoR0gyZGlTNFVOYXlZVmN4TmxtWG10eE81?=
 =?utf-8?B?bGlPTXdyaVF3YzVkbGpsMDNabURXQ3lpNVRwWlRKUndkLzRyeWV2UUJ1VnhJ?=
 =?utf-8?B?VEc1dkhneW94VUxQNytLaFk3OGVISmJaZnByeVp2N0RzTHI0T2U1em4xcHFF?=
 =?utf-8?B?U3BxSFI2cjYyVnE1ZUxrSTQ3cDZpL1FjQjVodWd3enRWOUdGeGEzLzZvU0Zm?=
 =?utf-8?B?Nm9EV2t5c2FKOHhORUZ6eXB5Q2dOZ0Z1SHJrMzRGcVg0bHFlV2dpaHdEOE40?=
 =?utf-8?B?T1duYWpsaU45aXVPa3hDSUZSYXhHQzMzeDVBK0UwUjFsM3VnRmxKYWNZUlVH?=
 =?utf-8?B?bFdnVVRtRzAzMEczOTJ4NUdpb2ZBM0Q1a0c5ekEvRzlFaXIzelRKMVlIRkta?=
 =?utf-8?B?ZlR5cGxyS0Y3L1NZLzBaSHJ5Y2luZEdhUE9wbHo3NEdoUGM2ZUcxWmh6cWZ3?=
 =?utf-8?B?bzd1Y1VWNGF6NU1xUGdHejNQbncyL0ozaGNNZ1IzV0MvelE0b21TTGx2bTVY?=
 =?utf-8?B?RGY4MUljK0lTME5WTGUraWJVWHpPVXlwVGErZWw0eDROMXdVL2t4NmYzNzR1?=
 =?utf-8?B?c2FVL3NNOG9Ub1lCYVNVR1hIT0E4QmhFbWVCY2k4MUt3cyt0RUI1enZ3Z1Qw?=
 =?utf-8?B?akliY2ErSmdYcFYyRG1tbEdZdi93ODNyRlRuUHVpU09tSUREZU9mWDM1a0k0?=
 =?utf-8?Q?PdT6Oi?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(14060799003)(376014)(35042699022)(36860700013)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2025 13:52:23.4237
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 53de6087-8967-424a-e69d-08dd93b7b82a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM1PEPF000252DE.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6533
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 May 2025 13:52:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216680

SGkgQWxleA0KDQo+IE9uIDE1IE1heSAyMDI1LCBhdCAxNDozOCwgQWxleGFuZGVyIEthbmF2aW4g
PGFsZXgua2FuYXZpbkBnbWFpbC5jb20+IHdyb3RlOg0KPiANCj4gT24gVGh1LCAxNSBNYXkgMjAy
NSBhdCAxNTozNiwgTHVjYSBGYW5jZWxsdSA8THVjYS5GYW5jZWxsdUBhcm0uY29tPiB3cm90ZToN
Cj4+PiBXaHk/IENhbiB0aGF0IGJlIGEgUEFDS0FHRUNPTkZJRz8NCj4+IA0KPj4gSSB1c2VkIHRo
ZSBzYW1lIGFwcHJvYWNoIGFzIGxsZGIsIHdoeSBkbyB5b3UgdGhpbmsgd2Ugc2hvdWxkIHVzZSBh
IGRpZmZlcmVudCBhcHByb2FjaD8NCj4gDQo+IFRoZSByZXF1ZXN0IHdhcyB0byBleHBsYWluIHdo
eSB0aGlzIGlzIGJlbmVmaWNpYWwsIGFuZCBzaG91bGQgYmUNCj4gYWx3YXlzIGVuYWJsZWQuIFdo
YXQgaXMgdGhlIHVzZSBjYXNlIHNwZWNpZmljYWxseSBpbiBjbGFuZz8NCg0Kb2sgSSBzZWUgd2hh
dCB5b3UgbWVhbiwgdGhlIG1vZHVsZSB3aWxsIHVzZSBzb21lIHB5dGhvbiBiaW5kaW5ncyBmb3Ig
bGliY2xhbmcsIHNvIEkgZ3Vlc3MNCnNvbWUgcmVjaXBlIGNvdWxkIHN3aXRjaCB0aGUgZmVhdHVy
ZSBvbiBpZiB1c2luZyB0aGUgbW9kdWxlLCBvdGhlcndpc2UgaXQgc2hvdWxkIHN0YXkgb2ZmDQpi
eSBkZWZhdWx0Lg0KDQpNYWtlIHNlbnNlLCBJ4oCZbGwgdHJ5IHRvIGltcGxlbWVudCBpbiB0aGF0
IHdheQ0KDQpDaGVlcnMsDQpMdWNh

