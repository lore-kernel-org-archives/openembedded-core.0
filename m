Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1309DD24457
	for <webhook@archiver.kernel.org>; Thu,  4 Dec 2025 17:54:38 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.12])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.49952.1764870869015479706
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Dec 2025 09:54:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=nSCH26Cf;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=nSCH26Cf;
 spf=pass (domain: arm.com, ip: 52.101.70.12, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=ZtQM8ThMW6WHlRvDiXDoOjo2Bv1n5PbKPTVtNdntt/Jmz9rfuASLrsvoeIUv0Nnp/gUKSmgPZLIuDYnpea58Y37gL+QVnuTaHWhybe8r78nIelZnU4IrEwTDZZTnNC3pRYd3rJPXn3df+vRj9vI+ajTKHg8MOm45S7bI4ko9hj8YEPcWe2Eo6XcGvZRsrBC1AJP6yFdqdWO0hj5LO80feErtYdaPx8rIX0M8lxYagRV6jK0sDKNvXpong11aH+DEgo1D84oZjt8z/KrUrjSrCm6xGf4bP9gZGf5ifYh6Zx+0mimrmu8NqC7iwvms9SeFnZGCNBanFNHmFjmmeoqp1w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uDlVyLUMd9getRqCxFAK6vE56XerSL2xb1IFn+drkoQ=;
 b=TqUcEJRTjUaaYkeNHcyjZZ/KDf0F2xulw9VWPeeJNdX+ZeaP4cYs1OWOTa47mEW1orhhRPkoOyy17k0/sh4K4EjtA6Nvk7EZaFnQuqCnD5zHPIxpL2yVDdesfWoyk7rUoXWPJwrD7kagMn/59p/ECx31jC4eW2LOwjdineE5/ViiO73cykQ2ttwVnAv1WwAYrws+YmwnNRdLv5JoGjnLFa8afuEsn+w41vlAcSqp7JMZLsnjy3ZfEOZCogC5hbe/T3uOefGVWb3CFL5zXgSUkvgSiiW+dAIb0cAJi+lepir11Bm3En099LZQxQYSbsFYc1F16zcIQeNLQLSy93PpRA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=eng.windriver.com smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uDlVyLUMd9getRqCxFAK6vE56XerSL2xb1IFn+drkoQ=;
 b=nSCH26Cfwlm5zJNvDlU5jqxW5NQctC/Zy9pBUOrJ0CdECCBc+uSKcFw9of5sLWmChC4QdvY4ZlHwkAvhNG4zfT57HLrPsKqW1tl55TZi3Pr1v7oXizLjdiQUqHvFV+UsRuyBlh3vti/1/+GyeLUJTiy/DAPCJ+VqHJMYlG/3tj4=
Received: from AS4P190CA0062.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:656::23)
 by PA6PR08MB10646.eurprd08.prod.outlook.com (2603:10a6:102:3ca::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Thu, 4 Dec
 2025 17:54:24 +0000
Received: from AMS0EPF0000019E.eurprd05.prod.outlook.com
 (2603:10a6:20b:656:cafe::e1) by AS4P190CA0062.outlook.office365.com
 (2603:10a6:20b:656::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.11 via Frontend Transport; Thu,
 4 Dec 2025 17:54:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF0000019E.mail.protection.outlook.com (10.167.16.250) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.8
 via Frontend Transport; Thu, 4 Dec 2025 17:54:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aTFr2sO7GpXofoCQhfacVuq5GxF0h0w6f5o0g9NqPtWDzC4k1g1+jtZYbMyfq8jfuwxKOQpzdPRB5M/O6h9Dm5UGqPOH9Z7jma5aN/+6Qf8sOt8A+nmErY5BTG/RTOOxSsBxeyU9ghz0TUXaF0L4YIk1jkP7u2Rxn1NkbFmKDg6FYncCieMKfquH/sRg65QtXJdyp4YTVDzK8iRbnaOLOWEKW8q+nQQ2MuoY2GwaglVCoGL4MDftudfqvqdxiE6R19LPbLdwjIOAPNYCG2X8dDr34irmKfQ29SHLxBYeP475JZ+a7zZsS8wIHhZIo7i6nh2YcwZQ+evw3b1bMBAfeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uDlVyLUMd9getRqCxFAK6vE56XerSL2xb1IFn+drkoQ=;
 b=BfAzZL4zScO5+3zYfxo3jCE9Imj1aDZJaQAhVRKMUSnKMeuaaimlIRWtZDQg30zN6cCYoWl3aKNgtTNOYPZv86hIBKds78hHeF0ZveTT7YUNAM2m0Qw67xk7qpeorwB+rqlmP7Rc1Uap79nMQmgM4LCYZyYKHA9t2D2IMP3Gc9/Yh4s4xvJ0Zkca9FIHyebEM+Lyzna2//A7TEp833y+3hedNG3owWc1RX7PT9F99cmYr0DtMz78SznGf4u3mmbOVM5f6V4Vlh9ReLrgWvdJsnUVhoQKQ8OIj7iVkkczhkCugQRBoTl4X1cK42tyDwVZkY9kd8jgkUZY1Uv51ONJIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uDlVyLUMd9getRqCxFAK6vE56XerSL2xb1IFn+drkoQ=;
 b=nSCH26Cfwlm5zJNvDlU5jqxW5NQctC/Zy9pBUOrJ0CdECCBc+uSKcFw9of5sLWmChC4QdvY4ZlHwkAvhNG4zfT57HLrPsKqW1tl55TZi3Pr1v7oXizLjdiQUqHvFV+UsRuyBlh3vti/1/+GyeLUJTiy/DAPCJ+VqHJMYlG/3tj4=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DU0PR08MB8399.eurprd08.prod.outlook.com (2603:10a6:10:405::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.11; Thu, 4 Dec
 2025 17:53:20 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50%4]) with mapi id 15.20.9366.012; Thu, 4 Dec 2025
 17:53:19 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "yi.zhao@eng.windriver.com" <yi.zhao@eng.windriver.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] kea: set correct sysconfdir and localstatedir
 for keactrl
Thread-Topic: [OE-core] [PATCH] kea: set correct sysconfdir and localstatedir
 for keactrl
Thread-Index: AQHcXvXrv9EmbgyO7EOGjEtk1hBPf7URz8eA
Date: Thu, 4 Dec 2025 17:53:19 +0000
Message-ID: <69AC3CF4-0AEF-470E-BA32-1BEC61390E06@arm.com>
References: <20251126165806.3422444-1-yi.zhao@windriver.com>
In-Reply-To: <20251126165806.3422444-1-yi.zhao@windriver.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.700.81.1.3)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DU0PR08MB8399:EE_|AMS0EPF0000019E:EE_|PA6PR08MB10646:EE_
X-MS-Office365-Filtering-Correlation-Id: 89d343d9-5342-4619-2de2-08de335e2808
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|376014|366016|1800799024|38070700021;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?VTVHR3p4Nm9Ha1FvVGU3NFhuc3VIQ3M5bzE1T2Y4Tk16TEx4VXlzQjMyZnYy?=
 =?utf-8?B?cGlsSjlCbmQ2VStXZlBDc0RPMzV4UTd0NXR0Q2RtcmtjOTV6TENmWjA3OTBt?=
 =?utf-8?B?ckFZKzVjQS9KMktTY2JKUlRGNG5Mbm1vQXJQeGJnekJReFNKaDBrM0Qrc01k?=
 =?utf-8?B?MHN6MzBhWWdKUWZNdVBuYUkrSU5nNmhzQlNKR1N3clVxUTFySGg1dGsxMVNZ?=
 =?utf-8?B?ZHVsZXdsSGx0ZHJjY2MvY29ETVRKek5DaVF1eTUwdm1CZEJrdEJGWnVvN0Zj?=
 =?utf-8?B?LzZsMjRvZVBESmQ3QVFBR1YxUjk4dGVhTXRHZ3g3eTUwOHRNOG4zbG5RS3JI?=
 =?utf-8?B?dmpGQ210VWtOTVNYcERvbFJOa1Jaa29ZMlc0dlVMSThaZjlpOFFhS3daa04r?=
 =?utf-8?B?akVDQjNTNjYvZkpzNEFySjlsS1lSNDJMMWRJellPbk91djdvVTVRYXNSVC9k?=
 =?utf-8?B?NXBrdFpPTktZbzhkMGtHMzZBS0lXOTdmYjlRcE54bUZ4MTdUV1dnc0s4RUM3?=
 =?utf-8?B?Q3RBSGJPNlVPK2Q1SFUyVnRTRTcvclRPcGhaSWVDeTF3cVBYNkk4MjF6cjA5?=
 =?utf-8?B?UllFUm5LN3pwMzJwR2tFL1VTK0FjeVA5MXZDM3RNUVE3NjhNZzZxYVVSUC81?=
 =?utf-8?B?cHN2amdCbFRWMEt0amU1Q1JlbmZzdGpZd3ByYzZEb2xjRnd3QUZXYWtBcE81?=
 =?utf-8?B?ckg4WEo2bW42WXdBNXI5T2xNUUVOTjJ3Vit4RGQrMTRra3oreVFlWmMrLzd1?=
 =?utf-8?B?c1MzSWxIb0VKR0REZVNzRzBhMlJyNmtQRDBBbDh6MHF4Y2dCNW43cS9WdnVD?=
 =?utf-8?B?N3lnNFYzQ253N29XdFBGZEdhZldhMTJGVy9NU1RmRmpxd1h5c0pSb2kxUy9r?=
 =?utf-8?B?VFhFTzlieVFNMGFXZkE4cGxIREtXUHU2T2NzSjEwVVl2cWhyQXhFRVh5UFBL?=
 =?utf-8?B?YmdQNU1OVVNleWlGWmFzMGJtV3J6Z0s4ejNDZGRCYnZ6VzcrN25lUEVJTjQ0?=
 =?utf-8?B?d0swMTJBTG1ZdUlzUDdubTlyN2tSR2xtYWxQVW0wdVVkMHhicktyd2JvMFNU?=
 =?utf-8?B?M0VmSlI1eUJkYS9QN3JIdlh1bHlHWGlTODVpeEhyRVluY3ozc2hiZ2t4aUNI?=
 =?utf-8?B?OHFjdjRXYVVrWGptcWFGYXFsZ3NoSEhaWkQzV0tVc1J4R08zUEk5Ry83U2Vs?=
 =?utf-8?B?UCtFRzVOZURuR0w1K3dhRE1TRWN0NWk2QW5WZXBEUktsV2VrOC9Zdm5aRVAz?=
 =?utf-8?B?UEpZK3lGc01FMDBPK0R0bzdidXlDTUtLZzJnL0Irb2E3L2ZEVFBHNnlqMVh1?=
 =?utf-8?B?N1ZuS05NdnUzcW94Y0tmeGcwNGpRMWxuaCtYcGVYcWpUN0xqMzU3UmxBT2pF?=
 =?utf-8?B?cnpSRllUVnJSck55SER2VGZ6eEN4R1VqU29USGEvVEdzckNySzZHUGMxMVVj?=
 =?utf-8?B?QTB6Wjd4a1JTNW5QcFZYTjA5STJIUTZRdHJSU21YZmlDU0NFTUJuWDVaZWNs?=
 =?utf-8?B?Rm1QZG1odExWeit4WUM4bTNMcXBSZWFRZUdTTkEzT3pQSjRtYjQrQThKcVFM?=
 =?utf-8?B?VElHcUFjOEQ2d01GaUs5OTBDNFFQcXBKL01FRUdBelRoMG5EbDBlUEUxcE5T?=
 =?utf-8?B?TEswRE05UUJhaEUyS0hnckdmOHJFSXBIamhySEE1YWNLRDdKMFlIelBhNmdK?=
 =?utf-8?B?QVZGSkx6T3NOckxJVGg0a1YvUS9GbXgweklPT3d1QTA1NEFXTEFQMVJXYklq?=
 =?utf-8?B?Y0ZwNy9ENlI5VElRdjU3azlMQjZHeGpqQnk0MUdMZ2NqWHhxby8vYzhMVGdu?=
 =?utf-8?B?Qm9XS01KVmZ1T0dxZTNteks4M2Rid24vUlJCZENyWEFGUVA1M3ExWUREUkxB?=
 =?utf-8?B?RXpOWmFRdkovM3dEUnVlanVPUEdXTFcvb2cwd0d3WFIzdlh0YXdVcjc3WndW?=
 =?utf-8?B?dmV5LzdoYUFqNWpGeTRkcVhtbE9td2FXeEJKSkE4MktUQ1RBbURqZGRwVVNJ?=
 =?utf-8?B?czJPY0xaMXN3YWFISUFVT000K2ZGOHoxZE9tdUJuY3pYOHRKZi9QUDNnQmtP?=
 =?utf-8?Q?PdU1qk?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <D555E1BD51A52340944EE1E72EA8EF6C@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8399
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AMS0EPF0000019E.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	eb3fa3f8-bb60-48da-eff4-08de335e02b6
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|35042699022|14060799003|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?am9kUy9EZ2k1MUZqNzNBMkZoeUFHUWo0VGVMdE5KMGVNRVVSYjNBOU9mazVR?=
 =?utf-8?B?ckxWUng2d3hqK1RYcGR4YnVxQ0lmZGZDRDhWbnd0R0JIcUFJUlUyd2x4WWNJ?=
 =?utf-8?B?NzU2ZStwYUduN2lPbmtkcmFNc2k4SW55OGhNREV2aWhBY0IzWlJyZkJ3Z29G?=
 =?utf-8?B?eWFidmlCYjF5YWVxSnR1YXM5NEs0WTBKTEJheHhsNCtFb0krVDBwOXlOVVh3?=
 =?utf-8?B?M3p1bEQyS1hXRHcyTXIzMm1MdjJDbVBrQUtsaWtJS1hlb1o3VmZzQXZhWk42?=
 =?utf-8?B?ZW9aZXZhRzZIVnpKc1BGeW56WU4rOXQ2ZHBFcUlidHpsdWxteUdDSllaMW5h?=
 =?utf-8?B?dkg5VjFxbk1qS0lISlNJa3ZTVE9WVFVyMnI3MzQzK3BpenRSb29SK2VZODFt?=
 =?utf-8?B?SjVzaWMxVWE2Y05WVk9GSE9WbXhQVXhVUmlzT0RRU21CdHFzYmVjNXJMNVhj?=
 =?utf-8?B?TWZmUjg2UGxKckRWMkE1TUdseXo4SndDSFgyNXhTdVM3RGZxKytVVW5jVVRK?=
 =?utf-8?B?Q0ZrOGYzbENkcnBNbzFyZS8rSmpTRWhMTzFDY0htMnV6SlovSER3YVhSSzBs?=
 =?utf-8?B?UGRVY0Z0YXFlcXFCeFBTVXVGSk1oWDMxQXJBTkR1a284dENjMU9CL1h1NWhB?=
 =?utf-8?B?bGtFVDFOOE1TendwTlJXbyswd2ZWdnlJQ1BSeUJQUlc1Mk1tZi84blBHTlM4?=
 =?utf-8?B?Rjd1V3lRUWRwVk02VVg3YmtKOHRSVVdETzJsNlZWazlGWkxYZVdNbnkwd3BJ?=
 =?utf-8?B?NU9wbnBSZ2d5cmIrb1RjTDNjYTA2Yi9FaDE3SDBqeDliVkdqcldFNWxiNUNO?=
 =?utf-8?B?Q1BiYVFWZ3RJT250TXVTTzhRR2Vuc2tuNGFGN09KNlpvWXRURUtLYWRXaHUr?=
 =?utf-8?B?TXVLeExFZktuQndKY2JENjlGZkEyWk1TUEFmampSR0RFZUlZZnZGT01ic1ZI?=
 =?utf-8?B?N21zWHlxTmtNMGl0R1pzc1poNTdpeW0wSlhQR0tzbkNDdFAvalhyam5FWTBj?=
 =?utf-8?B?NWdRdWFQZk1neFVCS3A4ckRKaVVTdFJsTm1zSXR3cGxLVUNTbnl2L2NkdFJn?=
 =?utf-8?B?czZPd0NrbkVBbHZsNUFoMElSUllHZzRqcWhTK2NPU2lUNitQM1VQaURMcjQ2?=
 =?utf-8?B?UjlIYVBhd0ZwQmRRSU95VXFTZURJVkpzcHlGYkhkNGpMOWUwT2FBaytodGdW?=
 =?utf-8?B?aERHRitmRGFMYU1tazRpOGVocmx5bUxzVk82K2NiMXgvaFNIdWNUYUJONjM2?=
 =?utf-8?B?VnVoMW9WdnM2THFld01HemFSNVRubk5XWkwwUU1oWnQ5QXRKMjM5S3FHbXFu?=
 =?utf-8?B?Q1RZUzZHNEovVTYxVkNKc0R3VW8zcWxaeVdHa3J6UGwwNENOTlFSVmpVSzdU?=
 =?utf-8?B?Uko0RmFnWnU4MnZxSVBiZmh5T0pmNmdJWHZSV3RYcnNyTTAwTFV5bEVkTHNt?=
 =?utf-8?B?Y2pVUGppZWZ0N1RhNm5xVDU2SWZmNTN4S2QxNVpoa1hETWNVWllMRmN6VGZV?=
 =?utf-8?B?UmpZb3kzY2NWelIzVWdzWHY0WmJQZk1pTHVnM3VnZWZHZUpnUHdpUEpqbGRh?=
 =?utf-8?B?QUtHZTF2bDZpTjRSVWlDcjZjbHYyZDE0YUpHYmRiaGpINjlIQkpzQzFqL3U0?=
 =?utf-8?B?aWpRd1lJRnR0UWtzS2JtRENVWTVEb1hkaGtPbmxOcWZZWHJzWVJ1b1JWV3oz?=
 =?utf-8?B?My90OUp3OElxY2s3dHI4d1pwQXFKZjVHVXZGemNZa2tMYzN3Y3NvMS9VQ3ZR?=
 =?utf-8?B?eS9PRDhRdCsydzBjcVRJK3h6ZDY0ajcrUmFheGdlb1hBNmNtT00wQWh6Q3d6?=
 =?utf-8?B?S0l6cWVWWUxwd2k4NTRsU3hDVTZvWDVzdW9TQ1lFR0M1ZVN3MjBicTg1a1FE?=
 =?utf-8?B?dlBSdDA0TDdkUGZ0Vmh5eXoraHV5YURINHJWT1luS0QxVEZlSTRORXRmRENm?=
 =?utf-8?B?OFVMY0ZyTGM3eWFJMms0R1hyb1ZCOXJKOStuemdpZXVQWDdzNm0rb3Y1bmxR?=
 =?utf-8?B?aytFb0Y5VVkyNGpMVGczdlJieVFucTZkNXZseGpBNVdnaHVGSmVnYXNvMHB3?=
 =?utf-8?B?eGFiM2J0bzZTRWR5YzJJWGtHcW4yUFpFWEhDanltUmJJMjExNmpqTFltajYy?=
 =?utf-8?Q?cXF8=3D?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(35042699022)(14060799003)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2025 17:54:22.4347
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 89d343d9-5342-4619-2de2-08de335e2808
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF0000019E.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA6PR08MB10646
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Dec 2025 17:54:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227308

T24gMjYgTm92IDIwMjUsIGF0IDE2OjU4LCBZaSBaaGFvIHZpYSBsaXN0cy5vcGVuZW1iZWRkZWQu
b3JnIDx5aS56aGFvPWVuZy53aW5kcml2ZXIuY29tQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+IHdy
b3RlOg0KPiANCj4gSW4ga2VhY3RybCBzY3JpcHQsIGJvdGggc3lzY29uZmRpciBhbmQgbG9jYWxz
dGF0ZWRpciBhcmUgcHJlZml4ZWQgd2l0aA0KPiAke3ByZWZpeH0sIGNhdXNpbmcgYW4gZXJyb3Ig
d2hlbiBrZWFjdHJsIHJ1bnM6DQo+IA0KPiAkIGtlYWN0cmwgc3RhcnQgLXMgZGhjcDQNCj4gRVJS
T1Iva2VhY3RybDoga2VhY3RybCBjb25maWd1cmF0aW9uIGZpbGUgZG9lc24ndCBleGlzdCBpbiAv
dXNyLy9ldGMva2VhL2tlYWN0cmwuY29uZi4NCj4gDQo+IFJlbW92ZSAke3ByZWZpeH0gdG8gZW5z
dXJlIGtlYWN0cmwgY2FuIGZpbmQgdGhlIGNvcnJlY3QgZGlyZWN0b3J5Lg0KDQpUaGlzIGlzbuKA
mXQgdGhlIHJpZ2h0IHRoaW5nIHRvIGRvLg0KDQpXZWxsLCB0aGUgc2NyaXB0cyBfYXJlXyBicm9r
ZW4gYmVjYXVzZSB0aGV5IGRvIHByZWZpeCtzeXNjb25mZGlyLCB3aGljaCBpcyBqdXN0IHdyb25n
LiBVcHN0cmVhbSBzaG91bGQgZml4IHRoYXQuDQoNCkhvd2V2ZXIsIGtlYWN0cmwgYXBwZWFycyB0
byBiZSBhIHRvb2wgZm9yIGRldmVsb3BlcnMgb2Yga2VhIHdobyB3YW50IHRvIHN0YXJ0L3N0b3Ag
dGhlIGRhZW1vbiwgYW5kIG91ciBpbml0IHNjcmlwdHMgc2hvdWxkIGp1c3QgY2FsbCB0aGUga2Vh
IGRhZW1vbnMgZGlyZWN0bHkgaW5zdGVhZCBvZiBnb2luZyB2aWEgYW4gaW5pdCBzY3JpcHQuDQoN
CkNhbiB5b3Ugc2VuZCBhIHBhdGNoIHRvIHBvcnQgdGhlIGluaXQgc2NyaXB0cyB0byBpbnZva2Ug
dGhlIGRhZW1vbnMgZGlyZWN0bHksIGFuZCByZW1vdmUga2VhY3RybCBmcm9tIHRoZSBwYWNrYWdp
bmc/DQoNClRoYW5rcywNClJvc3M=

