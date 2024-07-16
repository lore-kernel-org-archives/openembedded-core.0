Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA629C3DA59
	for <webhook@archiver.kernel.org>; Tue, 16 Jul 2024 11:29:09 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.50])
 by mx.groups.io with SMTP id smtpd.web10.8513.1721129348246545718
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Jul 2024 04:29:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=Zr5vsKR7;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=Zr5vsKR7;
 spf=pass (domain: arm.com, ip: 40.107.22.50, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=FVaIWnQcG2KQiGTONo38Rw0Fsnkn3SDo8AevhGHCcnW3h91qnzQINNp6rVCuD01NjuKNmye93WQqO3G9vbcZQLsgTpDDI99onk8tyfO2DWCjl7eZC41iQMh90jZ7nvoUgzN0qUapDXm8LgR1EjXWKho0LEvpYQe3Wy77OWN+L4BgW9ndZrLbqRYggWlNO71PIbQfPglHJhe3Ny2ZezJzx6zyai4gd3I4YgnOU1+7CjTE14UFPYAjbyp/EQGwebUvHmbcdG7a5znG2ISJfTrz44Zn5TSK3DbhjDZW8ysReXxuPSpHEYhk6L9xrKZjO3p9yY9SKwxXJwjPSfh2DCpaXw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qpn4eVSZEQSbyOuh03OsLaeLE/RZ6GxS3dabpjcWvkk=;
 b=QiAHheTb+5maj+UkrKzj9c2wAfvsvMXi9nohgPdC3HSf8JHMse1Yc2krJ0nh3OyPgDWw0LkWwXKzvsEkCVZtY4g8F2liMv54BBMr1V92poB2Hs5h4/TyPCGf0ifFACm2lXT97JGc/VAgY8GgeYMFKI579eYf5Qckzn+zdKDxITLOuKfYHqhkdUvJSc4HHTrCTFdG33zmvYCkNQMplW4ZwH892cYUox9o0z+4aDy/CdUhoEsWXc+fLg+/u57/AxyEeNP6mlctdytB03cXk3VmFYMR7QgIHlagvvSx5K4MJjNmi/3Exv7sHof7siZ6b9oJrJajEVWMvZElirldmJzExA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qpn4eVSZEQSbyOuh03OsLaeLE/RZ6GxS3dabpjcWvkk=;
 b=Zr5vsKR7wRQeJbHB9xj6XFLGJ+hMoLXPHTOwVVBPH050+wdXuN5Kwfjsx8jWKD2Y7TvDyy5cAp9rm9zVQalYbjhJCEH7EFT+oUijMhMO6tuir6ifAK/dR5CBYQ1VJsEnFZs/k5jm984svriK+fjGG3F+m55OEMN92gAxr/Dvjwo=
Received: from DU2PR04CA0002.eurprd04.prod.outlook.com (2603:10a6:10:3b::7) by
 GVXPR08MB7822.eurprd08.prod.outlook.com (2603:10a6:150:3::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7762.29; Tue, 16 Jul 2024 11:29:00 +0000
Received: from DB1PEPF00039231.eurprd03.prod.outlook.com
 (2603:10a6:10:3b:cafe::96) by DU2PR04CA0002.outlook.office365.com
 (2603:10a6:10:3b::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.29 via Frontend
 Transport; Tue, 16 Jul 2024 11:28:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB1PEPF00039231.mail.protection.outlook.com (10.167.8.104) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7784.11
 via Frontend Transport; Tue, 16 Jul 2024 11:28:58 +0000
Received: ("Tessian outbound ab09e808a502:v365"); Tue, 16 Jul 2024 11:28:58 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 899b170a95dbe56e
X-CR-MTA-TID: 64aa7808
Received: from Lb6042ea70522.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 1FEB867E-C4A7-49E6-BECE-3CEA951D12AF.1;
	Tue, 16 Jul 2024 11:28:50 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id Lb6042ea70522.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 16 Jul 2024 11:28:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QxjsVZjzXoxhHqmb+m/HhSXlk07ksDR+Ug1ZhvtzDSphxdY7Knim5fJwDryAnd94cvAHqnePW+H/MsOu3IMTas8LYU4WwFNdRplc+xtsclbbMFQH+JruS/Z7KAe2/ZqH7WZwueOQQhZaJTPo3M5q0GSXNeJgutnzh25NYqGfUJxnXkLWVV5mdeNv0pfEwO9Mz6ID1yus8oPcpU8584GW0cY0XxjKamIS5F+9V9Cjasf4lRGFDOHRVPylG3n7fGyzVoocPKjDP1zmaFzd3uvT3U2/MREQ3GoF3hGZao0Vc1Pi8s8utLcKtAqXLr8LAf3KnoBIUvoHmivFwaavLYeoXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qpn4eVSZEQSbyOuh03OsLaeLE/RZ6GxS3dabpjcWvkk=;
 b=QMaW36O82YWSRAbFSq1hiO4jJv2bpL5zP1t/iHzvOfFDL4A6baRrqL70pYL1y1CHlVg8tLFPov1Gc4LGWg3nl9Pyi4Q48lV8Enx6SgF8KL2qaDoZg0/+7wcadnl6/riyhcg17ru+ukW1ZaBQ1l421ik8uK6Cmlzk6qWSrMMVvqnUHOxnP6zsBUmmM+zStHJIT8AQoRLPgka498G+GjefeRB46NPnsPfO7oJ4sC4QKWRBOU7GUTyQHQVDKf0FEnZ0QFUBbREPZYR/Awho3TxygexexxufVergBp64omDKkcgTPxUufQhrGxjEwrvoRB6DESFxdeac1MeEgoo1PaiPCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qpn4eVSZEQSbyOuh03OsLaeLE/RZ6GxS3dabpjcWvkk=;
 b=Zr5vsKR7wRQeJbHB9xj6XFLGJ+hMoLXPHTOwVVBPH050+wdXuN5Kwfjsx8jWKD2Y7TvDyy5cAp9rm9zVQalYbjhJCEH7EFT+oUijMhMO6tuir6ifAK/dR5CBYQ1VJsEnFZs/k5jm984svriK+fjGG3F+m55OEMN92gAxr/Dvjwo=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by VI0PR08MB10559.eurprd08.prod.outlook.com (2603:10a6:800:20f::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.29; Tue, 16 Jul
 2024 11:28:47 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%4]) with mapi id 15.20.7762.027; Tue, 16 Jul 2024
 11:28:47 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Marcus Folkesson <marcus.folkesson@gmail.com>
CC: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v4 0/2] image-bootfiles: new class
Thread-Topic: [OE-core] [PATCH v4 0/2] image-bootfiles: new class
Thread-Index: AQHasnZiGPZ/sgkfz0mWOdiPzUYBgbHCcaaAgAAuXgCANuGnAA==
Date: Tue, 16 Jul 2024 11:28:46 +0000
Message-ID: <B8E92509-1DB9-4B4C-BE85-CAE559E59506@arm.com>
References: <20240530095314.407638-1-marcus.folkesson@gmail.com>
 <F9A4DF94-3431-46E0-A0BC-9804279DC91C@arm.com> <ZmhPsNk6T5PRxTbW@gmail.com>
In-Reply-To: <ZmhPsNk6T5PRxTbW@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.600.62)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|VI0PR08MB10559:EE_|DB1PEPF00039231:EE_|GVXPR08MB7822:EE_
X-MS-Office365-Filtering-Correlation-Id: bfff8a3d-6ae4-4c78-ef24-08dca58a7bfb
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?VXA5RlFZa0tOQldkZnZFVzhoeFJRUVhHRTN2dTgzcy96RGZVNUtTZ2VWZFJl?=
 =?utf-8?B?V3BLSGhvM2IrZmNhanJFY0ZqNzg0VUxKZzE0aU9zL3h5ZVYwUkwvRG5WNzBt?=
 =?utf-8?B?dGRZZXM2Vzl0QW8yNzl2V3Rza2xyQzRFdVFDd0NUVGJBRHF5VlhHS0xQaE1X?=
 =?utf-8?B?cGlRdXBDYTJFNXlPcmdwTExjaTdDRnVWVG5RT05pZlNpNC9DbTJvM2NLM1R0?=
 =?utf-8?B?YVRyVmh1R292WHgxa21NWnpya3ZoVmlLeXlyeU5PdFVHeE9iM21vaGRMNDI5?=
 =?utf-8?B?SEpRRGJtRGZIRmc5dkM3SDQwQkdTSWFDeEVWOHJpbzQ1aG5Ta1NUNWdyMDFk?=
 =?utf-8?B?bmJxY1RSL3l6RFY4Z09UYnExdmZyQld5cit5MmlpbHY3UEJTcHpHWG5OcnQw?=
 =?utf-8?B?RmpmM3RsNFpGQ3FITFE4anZGQ3FDVS9EWjRCa05BSnJkd3VuY1lPRG55Sllx?=
 =?utf-8?B?WU4xS00xNmE3K3gyVUxCTVRrUGQ5cTdvMTFBRVprWDhyNEZhdC9KT0FhT2Jw?=
 =?utf-8?B?WXpJcGZONlU2OVFDbEdXaEkrVjROby8xUzlFTjJhUVlPS1ljWk9IUGNJTzFm?=
 =?utf-8?B?WS9wbm1hZDVCalF4c2hqaWphU3Zya2tKVURuQmZRVjBBenZUeHI4dDN5M05r?=
 =?utf-8?B?MHVNMTZiSWpTZWQxK2laSSs0SnAwT3BoNlVVRE8rZ01aY1pXNklFcDNDZ1Ra?=
 =?utf-8?B?UC9VT1VPcnR1WWNueTZOaDRQKzBhZVFnVTVpUjJ2VWdGUE9WRXdaUktTQ0Js?=
 =?utf-8?B?akZKYk1nRjlPU1lYcnROU0lGc1VRSm50aWxpYnAzNUVqM0VHblRWVGU3TU9r?=
 =?utf-8?B?MXl2ZGRRUzgveHR2SThLdlhpUEdrU0hFejlvWHRxQ1duMjZORjBkcWhXUEd4?=
 =?utf-8?B?U2R6Tjdhbi9lOFVYSkt0WUU2QmtGVmd2VlFuQllSMlBydmtObTJXWnN6UnpK?=
 =?utf-8?B?UGFicnVKN3g1OGRqZWw1TUNtZTQzZXVVZXlCdFZ1SFd5ODRXRFArVUl2RUUy?=
 =?utf-8?B?WHhrMUpQa2FiMWZ5MFRNN2hkTFpIOEN2YUxtaU5XS1kveVRmaXlXbmdYM2tZ?=
 =?utf-8?B?dlF5d3RhMmJVUmxGd2NvbEpvc2FnZlFYZDkxL1BLYm9JOWJtQ3ZYSmxiTEpu?=
 =?utf-8?B?MjR5U1l6OE9MU1RiL24yUTZuem8zL2pPUjFTSVFJSjJqR040WVQ5K0hVWWtp?=
 =?utf-8?B?Qy9iM3JWTFBobm9mRE1GNDU1aGJaODZjdkMzK0MxMzJUbzhiemxWREMyOFo4?=
 =?utf-8?B?cGkwM0Y5RDFMbWlWNjA2ejFaUG9uZkh4K1pKd1I4alNBWElyNnV2Mk40aGlo?=
 =?utf-8?B?UWNCVHZCajVYcjY1dVZ5b0FYTjBDaEI2czYzRVBXMXB3NFZzcXM5K3lNSzRM?=
 =?utf-8?B?VUQwOHQ1aU1RbDBFQWVlS0pLZEdiWXFqVDBoa0JjVk0zaUlLNitYK0NKMWRo?=
 =?utf-8?B?RzdXYU54eTNzL1Z5RFZFZXZObEp4NWlkaXdFcHc1YlFDaXI4Tnc1VjhJYmFG?=
 =?utf-8?B?d2NibXFueGRFZnZHaHNxblU5dUpDRzBCc2xOOVN6MkhheStZWENtNmduRHFx?=
 =?utf-8?B?aHNBWTArMkdvSERUUHY5VDdNYWRxRU1nVER2cWxtT0tNVnBqZjF3STlzbjVi?=
 =?utf-8?B?OWh4SHV1V1hPRlFhQkZXYkFyNjdVb2ZoQWVUOWN0b1JlK2x2dDE4SHdMWG53?=
 =?utf-8?B?OS9kOXZWbTRwRk50NE9Nam44S3NvTlVYcU5ObmVzQjZ0V1NZa1hmNGE3d2Q1?=
 =?utf-8?B?UWlIcmhST2JqZ2dxRyt3anE2RGs3dFRQRlpiL1ZodWxtQUl5QkRtM3JzSHFB?=
 =?utf-8?B?NDBxaFFRanl0OFVkUzg1MmJpRnl4RFZyU1duOHBIdEhQVXVwcGFkRStLRmVo?=
 =?utf-8?B?M25UMlVKS0pLSys3VkovY3BTT3Y5cEVQK2ptWmpHemp1NXc9PQ==?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <0467A3B73E67364EAB5E3AC866814BB9@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR08MB10559
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB1PEPF00039231.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	fb156e92-8a71-4b48-dbbc-08dca58a7535
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|36860700013|35042699022|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?U2FkRVcxSjRjTGVRL094ajJ2bUtIdkROWisreTF5eldxU2YzSURSQjg5NFZV?=
 =?utf-8?B?M1NJSUpwZzZkRUlvanp0TFVkOTJ1UzJVbmExZE5mVFhaclNZM0VYa3VxZytR?=
 =?utf-8?B?OFZadXpmRXVEQndDTXZUSzBsbUVwVThHb1haZmJoNkdBMGErTUtUVkFmWXNR?=
 =?utf-8?B?QmI0alNVWGptWFl0dXVMMndhaFoybnBSU3c3angvU0dwL0dBMkVTVU43YWhs?=
 =?utf-8?B?cWRVVno4VFFlZEJUMDRGZW5jUjNBSDR0VDhta1JYcUdXVld4cUxTdGovNTdi?=
 =?utf-8?B?UkFiMG0wQVFSeGZ5Wi9vVGxYWnJXakNCNzlxU0Z6eGxtMDVFczE2VE1WeFhv?=
 =?utf-8?B?K0E0Mmt2YlBzOEJucHA2OFJ1WjBCV0R5V05NMEYwUFdoSmtHU0xTaS9ieDk0?=
 =?utf-8?B?dytLS09RRjZyVWUzMkZiZkZicVBvSU1YM1pTT0JaTkdNdVBxa3VOTDJOK1p6?=
 =?utf-8?B?a1ZhbG9pbjdiTnBBYjJOWWpQUkI1R2gzVTNuU2hCdUNmT3lTTFhVZklYNTF3?=
 =?utf-8?B?dnI2M2dKcDJPRWtIbjdHWVJsaG1LZG9FUlFIZWw0MDcwcmJSMWQxblhRTlho?=
 =?utf-8?B?V2daeXhBQ3NiVlVzUTVLcjlpTDlnMmo3K0ZSenpxcUgrbFYvNkIwYUpKMzY4?=
 =?utf-8?B?TWorSSt4LzNyZE5BUENPaStxbFg0ZXRFcGpXdm5VQ3hXWlo3dXgzeFptbjQv?=
 =?utf-8?B?THV2bTFRTlpnVTM1R1ZqL01BS3hqZVBIUVpTd2ErV1d4TWdMOVlnbmR1TWp3?=
 =?utf-8?B?dThoMGZjUERzWDV4aVdJYnZqSWYvS2c0R0V6TVBVUnJGZnlvaGxzOHBwVDJ2?=
 =?utf-8?B?RWxiVmNnb1VxVHMrKzlrQWpBbHRnV2FMK0RqTVduQmM1U0NtWmxiTW9UUTY3?=
 =?utf-8?B?VHdpVVNRRU55WjJKU0tobnFzd0FGSm9obGJHTythY21BWWhJV2VuUDBOR1BQ?=
 =?utf-8?B?YkJlYk5WSFQ4T3ZRcU1MMk9EdDIwNVRaVkhxTFpSQm9xa2Y5VndwV0pMQ2lt?=
 =?utf-8?B?MGRFY2xZNGlBRk5JNEl6UklJTmpyNUZHa0pzaW1zM1JVUUJzN2xPaW9ITTNa?=
 =?utf-8?B?MDcxQytFSEFvSlNUZWVpb1YzVkNuU0NFQ0NGRGFoK01VZzlCaVpBS05ZNHlX?=
 =?utf-8?B?SWpQeExVQ2l4YXJoYjlaR1M4LzF1RkVDRzlpNHFxRlBLNzMzQjJQazNvTHZD?=
 =?utf-8?B?eW03V0JaL3NEb3RPMDJ3eklheE8zL3dEUHVKL01QakN1L2Q3aTI2amRrUndT?=
 =?utf-8?B?QWNhY1pBVG8rMDhTNDZzWFVxcVV0OXFTR0hWOGhzTENNV2hUTVZoR3BmTytp?=
 =?utf-8?B?MjZYbFYwMFVjcTViaGhnWU5KTG1YbTNxVjExakhpTlRYeVBraCtOSDAzUXdV?=
 =?utf-8?B?V2g3dCtrUWorbWRkUnpZSzdyM2VJTGRvYmtyLzRaWHV3dE5Fcldtd2RLMGts?=
 =?utf-8?B?SFhFeWhPT2w0eS92d21rcDNmeit5Ri9GMHRXNlJWc0xEV1JkY005YUlkVXJa?=
 =?utf-8?B?bHFwYlozQnF6WlVyWW9nckwzOFA5azhlWFlXM2xJMklkSFM3WWhMTUdiN09t?=
 =?utf-8?B?Z2FzMlpZK0JKV0VKYkdsTjdkdmRnakRWU3MrbkJxVGQrTXFpYVh5YUVSUDZJ?=
 =?utf-8?B?RGovaXR0MldaWVU0Wm5Wdm94YlBndHY2ZTFKd3RhY3orRExiaWVSTG1rSWJF?=
 =?utf-8?B?NVY4Ui82OURkQzBobTFnVGd2VnlGcmZCellubTFDY2tjQW54SFJ3T2pnYjhX?=
 =?utf-8?B?R3dQcjI2bUFtbmJxVS9GWkZQMEUxQ1ZzUFpZNHI2NzIzRk1FVEdXZUVsVXFj?=
 =?utf-8?B?dUJxdGh1eHhCZnorMTEzdUk3aWk2VlViTmhvVHFPejlUemVQWS9HSi9tTW9V?=
 =?utf-8?B?azBmMG9Vd2dXOWh5WmFBYkhtSmFRckdrcHlSNzU1TWNDYkRmSW05M1RVeHlL?=
 =?utf-8?Q?pBF9g4VX4Sqq+Vz3L+t4kV6RpdjKQrRP?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(35042699022)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2024 11:28:58.3789
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bfff8a3d-6ae4-4c78-ef24-08dca58a7bfb
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF00039231.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB7822
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Jul 2024 11:29:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202108

DQoNCj4gT24gMTEgSnVuIDIwMjQsIGF0IDE0OjIyLCBNYXJjdXMgRm9sa2Vzc29uIDxtYXJjdXMu
Zm9sa2Vzc29uQGdtYWlsLmNvbT4gd3JvdGU6DQo+IA0KPiBIaSBSb3NzLA0KPiANCj4gT24gVHVl
LCBKdW4gMTEsIDIwMjQgYXQgMTA6Mzc6MDZBTSArMDAwMCwgUm9zcyBCdXJ0b24gd3JvdGU6DQo+
PiBPbiAzMCBNYXkgMjAyNCwgYXQgMTA6NTMsIE1hcmN1cyBGb2xrZXNzb24gdmlhIGxpc3RzLm9w
ZW5lbWJlZGRlZC5vcmcgPG1hcmN1cy5mb2xrZXNzb249Z21haWwuY29tQGxpc3RzLm9wZW5lbWJl
ZGRlZC5vcmc+IHdyb3RlOg0KPj4+IFRoZSBpbWFnZS1ib290ZmlsZXMgY2xhc3MgaXMgdXNlZCB0
byBwdXQgYWxsIGZpbGVzIGxpc3RlZCBpbg0KPj4+IElNQUdFX0JPT1RfRklMRVMgaW50byB0aGUg
cm9vdCBmaWxlc3lzdGVtLg0KPj4+IA0KPj4+IElNQUdFX0JPT1RfRklMRVMgaXMgdXNlZCBieSB0
aGUgYm9vdGltZy1wYXJ0aXRpb24gd2ljIHBsdWdpbiB0byBwdXQgdGhlDQo+Pj4gZmlsZXMgaW50
byBhIGJvb3QgcGFydGl0aW9uLiANCj4+PiBCZSBhYmxlIHRvIGxpc3QgZmlsZXMgYXMgImJvb3Qg
ZmlsZXMiIGluIGUuZy4geW91ciAuY29uZiBvciBpbWFnZSBmaWxlcw0KPj4+IGluc3RlYWQgb2Yg
aW5zdGFsbCB0aG9zZSBpbiBldmVyeSByZWNpcGUgaXMgYSBnb29kIHRoaW5nLg0KPj4+IA0KPj4+
IEl0IGlzIG5vdCBhbHdheXMgZGVzaXJlZCB0byBoYXZlIGEgc2VwYXJhdGUgYm9vdCBwYXJ0aXRp
b24gZm9yIGJvb3QNCj4+PiBmaWxlcy4gU29tZXRpbWVzIGl0IGNvdWxkIGJlIGdvb2QgdG8gaGF2
ZSB0aGVtIGFzIGEgcGFydCBvZiB0aGUgcm9vdA0KPj4+IGZpbGVzeXN0ZW0uDQo+Pj4gDQo+Pj4g
Rm9yIGV4YW1wbGUsIGlmIGEgZG91YmxlIGNvcHkgc3RyYXRlZ3kgaXMgdXNlZCBmb3IgdXBkYXRl
IHRoZSBzeXN0ZW0sDQo+Pj4gdGhlbiB5b3UgcHJvYmFibHkgd2FudCB0byB1cGRhdGUgYm90aCB0
aGUgYm9vdCBmaWxlcyBhbmQgcm9vdCBmaWxlc3lzdGVtDQo+Pj4gYXQgdGhlIHNhbWUgdGltZSBh
cyB0aGVyZSBtYXkgYmUgZGVwZW5kZW5jaWVzLg0KPj4gDQo+PiBJbiBteSBtaW5kLCBJTUFHRV9C
T09UX0ZJTEVTIGlzIGEgd29ya2Fyb3VuZCBmb3IgdGhlIGZhY3QgdGhhdCBzb21lIC9ib290IHBh
cnRpdGlvbnMgKHN1Y2ggYXMgb25lcyBnZW5lcmF0ZWQgYnkgd2ljKSBhcmUgbm90IG1hbmFnZWQg
YnkgYml0YmFrZSBkaXJlY3RseS4gIElmIHlvdSBoYXZlIGEgc2V0dXAgd2hlcmUgeW91IGp1c3Qg
aGF2ZSBhIC8gdGhhdCBjb250YWlucyAvYm9vdCBpc27igJl0IGFkZGluZyBlZyBncnViIHRvIElN
QUdFX0lOU1RBTEwgc3VmZmljaWVudCB0byBnZXQgaXQgaW4gdGhlIHJpZ2h0IHBsYWNlIGluIHRo
ZSByb290ZnM/DQo+IA0KPiBJIGRvbid0IGtub3cgYWJvdXQgdGhlIHdvcmthcm91bmQsIGJ1dCBp
dCB3b3VsZCdudCBzdXJwcmlzZSBtZSBhcyBpdCBpcw0KPiBub3QgaGFuZGxlZCBieSBiaXRiYWtl
IGFzIGl0IGlzIG5vdy4NCj4gDQo+IEZvciBzb21lIHBhY2thZ2VzIHllcywgYnV0IG5vdCBmb3Ig
YWxsLiBJZiB5b3UsIGZvciBpbnN0YW5jZSwgaGF2ZSBhbiBlbWJlZGRlZA0KPiBzeXN0ZW0gd2hl
cmUgeW91IGRlcGVuZCBvbiBvdGhlciBmaWxlcyB0aGF0IGFyZSBjcml0aWNhbCBmb3IgdGhlIGJv
b3QNCj4gcHJvY2VzcywgdGhlcmUgaXMgbm8gdW5pZm9ybSB3YXkgdG8gc3BlY2lmeSB0aGF0IGZv
ciB0aG9zZSBmaWxlcy4NCj4gDQo+IElNQUdFX0JPT1RfRklMRVMgaXMgZ29vZCBhcyBpdCBsZXQg
eW91IGluY2x1ZGUgZS5nLiByYW1kaXNrcyBhbmQgc3VjaA0KPiB0aGF0IGRvZXMgbm90IGhhdmUg
aW5zdGFsbGF0aW9uIHNjcmlwdHMgdG8gdGhlIGJvb3QgcGFydGl0aW9uLg0KPiANCj4gVGhlIHVz
ZSBjYXNlIHRoYXQgSSBoYWQgd2FzIHRoYXQgSSB3YXMgZmlyc3QgdXNpbmcgYSBzZXBhcmF0ZSBi
b290DQo+IHBhcnRpdGlvbiB1c2luZyB0aGUgYm9vdGltZy1wYXJ0aXRpb24gd2ljIHBsdWdpbi4g
RXZlcnl0aGluZyB3YXMgZ29vZC4NCj4gVGhlbiBJIHdhbnRlZCB0byBpbmNsdWRlIHRob3NlIGZp
bGVzIGludG8gdGhlIHJvb3QgZmlsZXN5c3RlbSBpbnN0ZWFkIHRvDQo+IGJlIGFibGUgdG8gZG8g
YW4gYXRvbWljIHVwZGF0ZSBvbiBldmVyeXRoaW5nLCBidXQgdGhlcmUgaXMgbm8gZ29vZCB3YXkN
Cj4gdG8gYWNoaXZlIHRoYXQuDQo+IA0KPiBUaGlzIGltYWdlLWNsYXNzIG1ha2UgdGhlIHN3YXAg
ZnJvbSBib290aW1nLXBhcnRpdGlvbiB0byByb290ZnMNCj4gc2VhbWxlc3MgYXMgaXQgdXNlcyB0
aGUgc2FtZSBtZWNoYW5pY3MgZm9yIGJvdGggaW1wbGVtZW50YXRpb25zLg0KDQpUaGUgdW5pZm9y
bSB3YXkgdG8gcHV0IGZpbGVzIGludG8gdGhlIGZpbGUgc3lzdGVtIGlzIHRvIHBhY2thZ2UgdGhl
bSB1cCwgc3VyZWx5Lg0KDQpGb3IgZXhhbXBsZSwgdGhlIHUtYm9vdCByZWNpcGUgcHJvZHVjZXMg
YSB1LWJvb3QgcGFja2FnZToNCg0KJCBvZS1wa2dkYXRhLXV0aWwgbGlzdC1wa2ctZmlsZXMgdS1i
b290DQp1LWJvb3Q6DQoJL2Jvb3QvdS1ib290LXFlbXVhcm02NC0yMDI0LjA3LXIwLmJpbg0KCS9i
b290L3UtYm9vdC5iaW4NCg0KSWYgSSBhZGQgdS1ib290IHRvIHRoZSBpbWFnZSB0aGVuIGl0IGNv
bnRhaW5zIC9ib290L3UtYm9vdC5iaW4uDQoNClNvIHNvcnJ5LCBJIHN0aWxsIGRvbuKAmXQgdW5k
ZXJzdGFuZCB3aGF0IHByb2JsZW0gdGhpcyBpcyBzb2x2aW5nLg0KDQpDaGVlcnMsDQpSb3Nz

