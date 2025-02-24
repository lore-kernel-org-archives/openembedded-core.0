Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A66EBC021A4
	for <webhook@archiver.kernel.org>; Mon, 24 Feb 2025 12:24:16 +0000 (UTC)
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (EUR02-VI1-obe.outbound.protection.outlook.com [40.107.241.76])
 by mx.groups.io with SMTP id smtpd.web10.87389.1740399853495417463
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Feb 2025 04:24:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=MfcZhy3S;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=MfcZhy3S;
 spf=pass (domain: arm.com, ip: 40.107.241.76, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=RVsL3Z0DhXgnoudqWChNvNNjdvGQ7WCk2ZBJW9SdO5DduZdgxt9HiMzKCP4vxxYuzr115VizsVlNs1WYev4HIchdEHiNivOydYV4G7lolqqQHpWnxf7buZeueLUsdYB9Lri0RyyNkOgWE/iw17D8mke1yBI6Qk3MsTo6oRWbXEgWxiBQ1o7Em0ILT+HqDp0stGcR7sVm0V/SH0DhlHrbTMFcP+nyApLBsI5jS6JmoHRNbVahOv0PqCHNQm5QKjD1ueQ04OMlVBiyzseOjlc5xulM7FZ0hWIRG/h3uXEN2eg8ASR33uVCWX9krCz0HTxUt1qSCpaNNTTA2fBucCMecQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tt7KvnCpSfjn1kUVe9GTxadzM6BSxoQdw4+EdvZieGI=;
 b=Taq8iHuLB3uFi74VHUFB/LIYXtu2epYLXPVA28QyLEgqas4BGuiL+deO7PTivkEfzV50WovMfbuJA0UjZ72knj2A7xxjAw/PQnWNhgxQBrgbRnVthEYXpgaaXGehq625T0Hf8Ir9OftI+OXjxyImz2MXbx72awPK+/mk86VIVrlFv3GSlrRcYHeRszV+YIgZ7r3G6ZF7yn2ZwOAw7zm9blzR/vNVzQ8j69aX000gwVrTuQME/37uEl965mW9oJf3cZIeOkplM4mhUDprLtTLsV2Bii6N8lQgovJ1dvRpyI08P00nJKEkds9cXG7rP8LtUFvoiXKTeF3DeWF1JcckBg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tt7KvnCpSfjn1kUVe9GTxadzM6BSxoQdw4+EdvZieGI=;
 b=MfcZhy3SFcwct7Y2TtWfvqd8nOjQGsBomLY3s9iGPVekWODmu66VdX9hlQrOGDwQ+UNr6YSwXQnvYN4eg1XPywEIvkEVoxaAebpZ9P6x23oG8feAlA6ujXULS7a/YLlf9LqswrBmLtSCcD2Vcbzpl7nIFaRZW+GoJq3oVK9KIO8=
Received: from PR3P189CA0034.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:53::9) by
 GVXPR08MB10405.eurprd08.prod.outlook.com (2603:10a6:150:14c::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.19; Mon, 24 Feb
 2025 12:24:07 +0000
Received: from AM2PEPF0001C710.eurprd05.prod.outlook.com
 (2603:10a6:102:53:cafe::5b) by PR3P189CA0034.outlook.office365.com
 (2603:10a6:102:53::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8466.21 via Frontend Transport; Mon,
 24 Feb 2025 12:24:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM2PEPF0001C710.mail.protection.outlook.com (10.167.16.180) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8489.16
 via Frontend Transport; Mon, 24 Feb 2025 12:24:06 +0000
Received: ("Tessian outbound 93a06e49d4fd:v585"); Mon, 24 Feb 2025 12:24:06 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 97fc80d448938b9d
X-TessianGatewayMetadata: bs+a+BZ9/rlYXhzIbgq4mAaLTX2dkP9lDyvW4zn/iAnMY77FvAmFXoUr36F4ZVkaUwXoiEcD/OY9DbOwo2YozHUYjfoKyXcMg4Rzt7ied9pZPypsDy8wT6o8ZRpT/dHuyDsJgWteaOvXj9eKVRTIiH2Kbupki10QJsR6WSx8VO0=
X-CR-MTA-TID: 64aa7808
Received: from L53b96ebe69fb.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 2E938B1B-843A-4747-B99F-9B2EC936A0B3.1;
	Mon, 24 Feb 2025 12:23:59 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id L53b96ebe69fb.1
    (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
    Mon, 24 Feb 2025 12:23:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oEbJSGJPpJpy5mUX/GD+iwqV1QnKsfaGhQK7l1UhQwnR1JBIiG9ycgfcmki6b9HAk7g3T6lQWmy6i/3iDxQ6bzeESgFbJSIY5p8xZziqr6J51V8qEjEqSagTH1O+9FcodXnTavehFImtiRH7YJCV/QO/BJAC60QzScO8Vo4Vj7ho3p0HonL1+6Y3ZBiAi+La/W4VXQ90SZT7JR0n1H4pBEpULKFo3vFfehqVWxpJSwQKzTym1rWv1xaceJfmk7/MI5mPKNE08A4Smy4RsceyYvhIWquURkJqiNKuJw4TLg3Ah5S+Eu11LaOrPC7d2SY5x1wXUf1u628RcQ4i5E3Ixg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tt7KvnCpSfjn1kUVe9GTxadzM6BSxoQdw4+EdvZieGI=;
 b=TgP4b7/nC9cYJGJVZlcWAuYTeY3OJp1j5AI3pS2QltjNrDzJU2vLyq0KbAdmwbfAz+VUH8ip+5Q3c3kcJnnLrGR7I/FUhEgPKmQ3VcgQRhVuTeXc8gSuqLSnyBZZnOhfUiOwjLjcytDo/kFpU5CuIU8wNCcOPuJJ7yDi+0u1NoAMMNmf5mA6nbNjSAueNfbTDEdpG11oNqj0e556TWy27tCtfNr/93p8OPIDsft/9WR7cqPPQWsxVz8V5dZBWNxXaRgVKNUU7qbgqhvRDrijJ+VvwK2fqGI6TykeocQNswzDJ9PKtud/gRAzRjU+zfAfDq+wmSWsXcsIxmAhVuW5Ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tt7KvnCpSfjn1kUVe9GTxadzM6BSxoQdw4+EdvZieGI=;
 b=MfcZhy3SFcwct7Y2TtWfvqd8nOjQGsBomLY3s9iGPVekWODmu66VdX9hlQrOGDwQ+UNr6YSwXQnvYN4eg1XPywEIvkEVoxaAebpZ9P6x23oG8feAlA6ujXULS7a/YLlf9LqswrBmLtSCcD2Vcbzpl7nIFaRZW+GoJq3oVK9KIO8=
Received: from AS4PR08MB7429.eurprd08.prod.outlook.com (2603:10a6:20b:4e1::9)
 by GVXPR08MB11131.eurprd08.prod.outlook.com (2603:10a6:150:1fb::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Mon, 24 Feb
 2025 12:23:55 +0000
Received: from AS4PR08MB7429.eurprd08.prod.outlook.com
 ([fe80::8db5:7772:a426:2afe]) by AS4PR08MB7429.eurprd08.prod.outlook.com
 ([fe80::8db5:7772:a426:2afe%7]) with mapi id 15.20.8466.016; Mon, 24 Feb 2025
 12:23:55 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "festevam@gmail.com" <festevam@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "raj.khem@gmail.com"
	<raj.khem@gmail.com>, Fabio Estevam <festevam@denx.de>
Subject: Re: [OE-core] [PATCH v3 2/2] mtd-utils: Upgrade to 2.3.0
Thread-Topic: [OE-core] [PATCH v3 2/2] mtd-utils: Upgrade to 2.3.0
Thread-Index: AQHbgv9WX5PNc2F3lk+VFuXcuSlJrbNWZ+UA
Date: Mon, 24 Feb 2025 12:23:54 +0000
Message-ID: <4CEF303F-CC01-4067-A1DB-2F9C1A2990FA@arm.com>
References: <20250219185119.2168718-1-festevam@gmail.com>
 <20250219185119.2168718-2-festevam@gmail.com>
In-Reply-To: <20250219185119.2168718-2-festevam@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.300.87.4.3)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	AS4PR08MB7429:EE_|GVXPR08MB11131:EE_|AM2PEPF0001C710:EE_|GVXPR08MB10405:EE_
X-MS-Office365-Filtering-Correlation-Id: 42e04f88-8e3c-452d-ce59-08dd54ce21cd
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?YVE1Rno3Sm1sckJFNkgrNzNkTG5adUpBYUh6ck9kWnFac2kwWHZRaHJUUDdp?=
 =?utf-8?B?Z1A3bkpyTGx0TGFEMnhNcVc5OXpldzF4T2JocXY4T1VxM1IvTG1DNldlcnJx?=
 =?utf-8?B?SFVOTlNkRnVwZUJDYkJhdTFhOUxMdVl0WUcxS0hlZzIwbEo0L3dtcWJ3YjZz?=
 =?utf-8?B?NHE2VzcvekVVc1p2U0ZQSmQyd2FMczNsV0hpTWx5K1FKOW9FQVRVRm9pNkFM?=
 =?utf-8?B?UkIyRll5TFdsMU9XMFlISG5OanFQUjFRK1NLZ25uU3Fnd1krUkNDLzBNWWtG?=
 =?utf-8?B?cUI0NHhCUmdyUFE4M2QvQnZ6WUc5OUprZnNlUjVVRkhqKzd6VjRwZCtiV3JI?=
 =?utf-8?B?UWRKRE1FekczUjVtdlU3Y0pEOGZxR3h2RWgraVY3S2RKVExsOU5JOVZ6WkUy?=
 =?utf-8?B?V1pScDI4bmZnci9keGRIV2ZlMUFUdkxadjNzSERTTzNMRE8zNjhvMUhLVExy?=
 =?utf-8?B?SUNkZ2d6d2llelhBQWE3RndhakZhMEQ5QUtwUkd4NUt3ZGdhbDRKczBaOVZ0?=
 =?utf-8?B?MExBWW5sT3NPdHRsN0pJTVB4eGhZWUFSekQ5aGNzcDYvVDl0MkZJS1A3NjVO?=
 =?utf-8?B?ODlDSUJ2dHBSYmtYTERGZHBPUXE2QnRuWnZYZjZJajZvWGxmRlNPdmVHSkEy?=
 =?utf-8?B?NHlUdzNxSktNWkRXSnNoaUhOWk45YW1rQmVoYXh3WlUyNjJ2L3hCcHpoa0ZZ?=
 =?utf-8?B?ODl2b1FKK0xRaUhmb2YzZExVcFJwd3RQMERRNlBNeW9ocGVYNGRnYkJSKzBI?=
 =?utf-8?B?MUY5QnEyWXVuVTRPRkxidFNxb0dtNHdZa28vLzFhckN1andYdmhIZjh4TU40?=
 =?utf-8?B?SW5iZTV5Z01qdHc5bmR4OUFEUEtNZUwxc3YrK1g3SnQ2ZFdrTTExVGtUdTRk?=
 =?utf-8?B?ZnBmeHR0aStXRFE5Y3Z4TG1ybUdQb3ZHVjFvL3hEZWJzSzBYdzlMUng5QzB1?=
 =?utf-8?B?SUVHTG1Cd05zNjBVUHdyNnpxR2MwKzV1ZDVjZ29mVmZjL01DcC9Zak0wV3pt?=
 =?utf-8?B?Z2RzNWwwTjI2aDJ4bmpkUkNhTGVOTndMMmZJNmZ1NnR1bzFjZy8waDRkY1hm?=
 =?utf-8?B?QjhRQ0Vua2NnejYwT1Z3WThLOW5zaGM1VlI0aUxaWGZFYlJjVGRUNTRDRzlz?=
 =?utf-8?B?YUdzcmpzaDVJWDQwekFDbGU3WDdYZFhPWmZ0b2plcXpLVjNTdkdMdmQrTFdo?=
 =?utf-8?B?azNVWE5BdkhhTklURlFJM0g0SlFsVDhoaVJST3Rpa0lpd1VGQWt2Q2s4T3JV?=
 =?utf-8?B?b1M5eDRwbUNkUFo3VGszVU9LZlo0VHVEcWtvNlRYRUxGQisvSG1KeVFXTVRH?=
 =?utf-8?B?cUdTMS9RYndkRDJkUHROOW0zOFg1amsycHVFSzVpbFdTRGlOMUV4UEY4ZElV?=
 =?utf-8?B?NWNCSnhQd3VLY0piQmtyb0tBUWVYaHlBRFJodDJoTmV5ZWlKV3ZZOExEZUh4?=
 =?utf-8?B?TW8xWFl2WnpLRnUyOGIwb1llWGRreERhVERqbW9iNzlzUHVMVlgxUGlTby8w?=
 =?utf-8?B?NjJ5a3RON3ZKOGsyUDEyNzNSWm9wTndUZXl0WHVubzZIS3BTMTBydjlEREhH?=
 =?utf-8?B?d29FUnc3bDVUb28ySzBlSHFrRWk0OWdhT0g2TFVEeXJYZmNmbi9YMFQ5a040?=
 =?utf-8?B?U1haQ0syTGhTWWNTeWs0NVMyNnZ5NXhtaWhBMkgvZE9jOU5Va2dEd0phc3JW?=
 =?utf-8?B?d2FCRS92ZGI3VVEwdElTOHltZjlMbkdYKzB2dkIrSERGMmdQOGZwTEE5WGxk?=
 =?utf-8?B?Q1I1TGFxeTNxTUtEcFF5cm1nbkxiQU10S0M2SnlMRWVwRmZDM01PcUlTejR4?=
 =?utf-8?B?enBFRXcwZ2VDS2k4MkphL2tiOEFlby9zc1Y5dW5JSi9oZlpqcjJkR01GWHNV?=
 =?utf-8?Q?VSSuO46j8hhqb?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR08MB7429.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <E22D7B8F4C57394A9B48ABDD79FC15F4@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB11131
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: 
 ip=[2603:10a6:20b:4e1::9];domain=AS4PR08MB7429.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM2PEPF0001C710.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	1cb2230b-18db-437c-eba0-08dd54ce1b0e
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|82310400026|14060799003|36860700013|35042699022;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?VGR2T0ppdXZmdHovUTZzckxTOXVWdFZhVStDUm54QU9CYXJweWdoQU5hLzhB?=
 =?utf-8?B?dE03NkphUk8vb1BCSEo0QnhqZXo5d1NGYkZEYS82dkdGZWhhb3JJeGRrM3dC?=
 =?utf-8?B?aVdkYmdWRmRJNnFQeFJaKzBFNWMzODRnUTM3c1FGME5FcVZXTHEyQ01LbTBj?=
 =?utf-8?B?YVgxZElqaWZpeEtOcjhMOFJlZUxlYUoxU2l6dXNJbWRyU1NKeFEwb3IvcmtM?=
 =?utf-8?B?WGtjeFMxOXdVTDhEdGRUZGtuL2RuemdjeVpHOUpzb1NvOUUxNy9NVlo4dEhv?=
 =?utf-8?B?ajFnaE5HbTFzL2J0eVQ1R1dyWVFwcnFibWhtRjVmUFVIRmNxVWMxMFpGemNa?=
 =?utf-8?B?MmozQ1RaZG5LMjJaMCtMbmFPeVZDQk02c29EUFFTTXFZbnZOTDlOMzBLMXZP?=
 =?utf-8?B?THBhUUFYN3dNWDhwMTMvdERWVkVDdjdEcW9wSC93ZHYxUFBDbDl5U0lGc2Mv?=
 =?utf-8?B?RTd2SEpXTmhRemREcHFLT1ZmRjdzYVhPK0VBbEdMRlJNbWd3d3JlRmZmeWlv?=
 =?utf-8?B?ckRJc0hTM3A4WGc0aFhuMVUybXVNbkszOW9RUWxLbzFFUmRqb0pINjBWb29V?=
 =?utf-8?B?WHF5U2J5TnlHSnEreHExV1Zad2pZMmUwUmg2bk1CQlVVdjQxT0FiK0FhWTJM?=
 =?utf-8?B?cnh4YjErSmcxUng5YVVZUVl5Q2JnMEZ5bms4a1VBc1VyVThFc2JHVURETGRZ?=
 =?utf-8?B?ek4rV3dFS2tDelNTQTRwSWdPN2d6L3c5d2FnQnRLT0Nad0RqN1BrKzk2ejli?=
 =?utf-8?B?Vkh3NmplQnlYRkVaL1hDV3FReVJZbUVTUmk1am81T2xuS0tsVHdCWHZIYlRG?=
 =?utf-8?B?N2dITzBNOVJZK1FQd1ZsTWtvZStRTU15emU0Vzlnbm4ycGtrWDFNRkhxN0JN?=
 =?utf-8?B?Z2Y1cWR6dTlaaURvbGxvNFJUWFRFTmU0R3FRNXU1Q3NXNVJsaDBXcXlpeFow?=
 =?utf-8?B?U2hlQUpuSS9UaGZCVEFQSmxFVXlmRGFqWXIxN2F3aTRhN1JjWktZeVU4ZnMv?=
 =?utf-8?B?ZXlrT1laYkNZYjJSdTNucDlVWnR3cEc4V3pNWjdZVXJTeDdnWkJIamVxY29y?=
 =?utf-8?B?THlyVkkxaEZmMHZEYzU5dWRZZlFoL2FJZ1FaUzhvaE9tdVU5cTJjOHZkT1NB?=
 =?utf-8?B?UGtLMTRrNS8xdEk3VGQ3YjRtNGxGQzF2eERpYWFsRlIzTnV4ZkNTR25IMTZw?=
 =?utf-8?B?YkVjQTZIalBPTVZ0eGlBTzZhR0FaVzBqUXJyY3JJTVNiajlWQjBmWVQ1dkYv?=
 =?utf-8?B?d29LcVZPUVdlcFo0eHl4VWdmUGIwRER1SDFTYVB1b0xPU3FYOXA2eHJKd2t1?=
 =?utf-8?B?TmRacEd4c0lCRkp2SytOZXNZRmUzQldPWUxFMWlEdWFwNC9FMjVMQjBQMElx?=
 =?utf-8?B?Wmk2NTdhZE55VFJIaFVKa0RCNklPT1UzOUxvWXkyOUFyK3BZOWZsL2xHd3FP?=
 =?utf-8?B?TmVnc2o0TjNQcnpRcnhGaTFDb3RseXJrOUIwaElZUHJIN25DSWlmU1p4TGo2?=
 =?utf-8?B?Y2pRUURNU1FvOUVpQWwrNHJ5VHoxbkdFU3RNV0RieHhZWE0zbmNNaHI5VTU5?=
 =?utf-8?B?V1pJbzV3VGYxT2pVN2hacG51N2E5VnB3VnU3R0xwczZGWTJPTUgzWGpTSlVi?=
 =?utf-8?B?KzRCWjU1M012WERyRFE4dHI5emZFM2FQL0dSSjZsZkkrTGNmNGdEODNSaXoy?=
 =?utf-8?B?WTlUQVFDWld4ZXFJNVNvWERERzUzVUF4cVJIRkE2eEMzZUI4S1VJVmFmTmda?=
 =?utf-8?B?S3VRU0p5d25rMGxpMmhGeDdYOTNZWXVmbGV0WU4xUDZCSzd1cUFzNCt2STB2?=
 =?utf-8?B?UzhPQ2dqK1VIWnczbFRKdUY2N0xGb2tBRmhYc21FcGJUaEx5MUo4cnJDWTNS?=
 =?utf-8?B?eUNsdzhMOWJHZmVMZkI2NW5DTFJ0Z3A0cVF6bGpJaXZLb2lLb08wREovTFox?=
 =?utf-8?Q?EzaC6HRfYyQ=3D?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(14060799003)(36860700013)(35042699022);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2025 12:24:06.3141
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 42e04f88-8e3c-452d-ce59-08dd54ce21cd
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM2PEPF0001C710.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB10405
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Feb 2025 12:24:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211844

T24gMTkgRmViIDIwMjUsIGF0IDE4OjUxLCBGYWJpbyBFc3RldmFtIHZpYSBsaXN0cy5vcGVuZW1i
ZWRkZWQub3JnIDxmZXN0ZXZhbT1nbWFpbC5jb21AbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4gd3Jv
dGU6DQo+IA0KPiArREVQRU5EUzphcHBlbmQ6bGliYy1tdXNsID0gIiBsaWJleGVjaW5mbyINCj4g
K0xERkxBR1M6YXBwZW5kOmxpYmMtbXVzbCA9ICIgLWxleGVjaW5mb+KAnQ0KDQpXZSBhbHJlYWR5
IGhhdmUgYSBnY29tcGF0IHJlY2lwZSBpbiBjb3JlIHdoaWNoIHByb3ZpZGVzIHRoaXM6DQoNCmh0
dHBzOi8vZ2l0LmFkZWxpZWxpbnV4Lm9yZy9hZGVsaWUvZ2NvbXBhdC8tL2Jsb2IvY3VycmVudC9s
aWJnY29tcGF0L2V4ZWNpbmZvLmM/cmVmX3R5cGU9aGVhZHMNCg0KV291bGQgdGhpcyBiZSBiZXR0
ZXIgdGhhbiBhbm90aGVyIHJlY2lwZSBmb3IgdGhlIHNhbWUgY29kZT8NCg0KUm9zcw==

