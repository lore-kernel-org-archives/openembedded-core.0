Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5B4EC83F1A
	for <webhook@archiver.kernel.org>; Thu, 17 Jul 2025 12:13:14 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.61])
 by mx.groups.io with SMTP id smtpd.web11.47569.1752754386066094065
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Jul 2025 05:13:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=XHSFuhkv;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=XHSFuhkv;
 spf=pass (domain: arm.com, ip: 52.101.66.61, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=U2FSJwOdS3v5YbkB0s9rOsqCFhvyV2eRnHbd5EMdIO1kSaPs0S2hdRirBQinV6lAK0x4FyxVqlBQF5I0QScOMIKS6QduAeEKZUCA79Hol+cobuTzRzIYbaKtJipjLXnIyQXWsdUr0YbCXTF+eawkVsJGkMxsNNQW84jDm6c9c/XrNUzj+0f5KptZ2vKMYWln97D7gbl+PpVtgF5ejxT3iax5O5Yay1WgkNthVhEa42ZMAayan8G3XnrDmR+bO3IxwWBUZ33dpFMLlYI+lnUKFxhz1M5UoildpeVgW5uSty5becAHYdpKEgIaoaygxbv/y3mi0sFIIOIpZja7sd99BA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K3bdQnD9i65pPGj7cJwRzAG2M/g1A9MnOLH/Dz+218M=;
 b=OQ4+kFzjdJWPTtSjY/49AzUqgxaBmYGPxuxC3v3bH5kghq/MeZIsx+1NvLtV1UJu8me7on8W/eG4KUQFE48Jn+LjED7qltiNJD78WxGr9CphycNM2fVxJ9pVgq2vl6Jax+ua9L/EBWCM5cxQu0TDajl9Ro7lNkz8Bz8WfG5kGVMGcA0nC+/o5BxavHUVj2nS2kdGfNKZ3CADSssq5Sf3YuHh94vILobssR+OHM4GHXodCDrUR/LLLvT//ofcZdLj8mb4U0oUH7hFM0BExNT5WCz+8K59fsoZRv5VkiDq2WVA9EfEJTGZ+OHV6SEbN50eZqIT902DTpni00Ar7/c39Q==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K3bdQnD9i65pPGj7cJwRzAG2M/g1A9MnOLH/Dz+218M=;
 b=XHSFuhkv4emcmPo+OCsmvl+XT2tu39Mdq91RpdFfspFz5mdsuvNYzHtwTgTqcVMXWf7Em7Av2nelh0mUJVY8Wr7/1MeSKZCdaUyINxl9zd3d4Knb2kI5fvumb3yDVSqXix1oFJOSKTltNvcQpXRerXhqeKQEbHXp7Iz4nxIP4Cw=
Received: from PR1P264CA0044.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:2cb::13)
 by DB5PR08MB10062.eurprd08.prod.outlook.com (2603:10a6:10:48f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.32; Thu, 17 Jul
 2025 12:13:01 +0000
Received: from AMS1EPF00000047.eurprd04.prod.outlook.com
 (2603:10a6:102:2cb:cafe::2a) by PR1P264CA0044.outlook.office365.com
 (2603:10a6:102:2cb::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.22 via Frontend Transport; Thu,
 17 Jul 2025 12:13:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS1EPF00000047.mail.protection.outlook.com (10.167.16.135) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.21
 via Frontend Transport; Thu, 17 Jul 2025 12:13:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=suLAWv8jvgD82EsKZ7nCFSEP/zEp8BoeCchEpOVAKn8YurM9s/OLzoATGBA6EkBdq8VSu2xSy5bXedkiNVb8JjCcn+OFJJGgPmZ9jUhAOKHHAAVnObsZ34rKuTx8CKpByjx9hdPKbLL7+uRBlA+YzGHoTz1H3tVKKyxRXLurKuYKc+cbf/80Ep7zmnMXFAu0IAyOUBDDWD2KFif30NV/V6taqpQ24Bd4mNCwzUxNq1a12APOvI6wxCp+uWO6qF7bEOtti3oRuk4Ov+C1SdIcEZrtq9Mo5Rn+5qMPsx7ETAiVsBx20euuvjq5xkad3pjByqDUuHpxrAuYPfvoO3jNUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K3bdQnD9i65pPGj7cJwRzAG2M/g1A9MnOLH/Dz+218M=;
 b=BLZ2vpda1gPgweAZMR0JnW4C90zQA0pEoT0obpY+XOzqkf7mKvRWZPeYRDW8gYrFHpgfIm2ucWMbIh0suS79WwTxLOSVRIro1jEWMu3dXP9/zUDyC2TCgji9Yot/es14t2zrFocgV5Kqvw3kTgjVZllF5GTT0vw0uwsYAMo1c4oFYtYUpjQN68otJEB6Ed8CuFpDufaKUdWB9a3u7MHQTzps8mPWQ/VAxq6fv2egv3wQ+5r6X4ylG6dyE1qgGa2ND7VGYWBrBpFi79ma5IHN/8KW881ZTTaiaQ0HdrowG9UO0gic36ohGOF+A2hbY3tb3iLIF8xFhIYZPWyJywjL8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K3bdQnD9i65pPGj7cJwRzAG2M/g1A9MnOLH/Dz+218M=;
 b=XHSFuhkv4emcmPo+OCsmvl+XT2tu39Mdq91RpdFfspFz5mdsuvNYzHtwTgTqcVMXWf7Em7Av2nelh0mUJVY8Wr7/1MeSKZCdaUyINxl9zd3d4Knb2kI5fvumb3yDVSqXix1oFJOSKTltNvcQpXRerXhqeKQEbHXp7Iz4nxIP4Cw=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS8PR08MB6664.eurprd08.prod.outlook.com (2603:10a6:20b:351::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.39; Thu, 17 Jul
 2025 12:12:28 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%5]) with mapi id 15.20.8922.037; Thu, 17 Jul 2025
 12:12:28 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Khem Raj <raj.khem@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] clang: remove obsolete 'terminfo' PACKAGECONFIG
Thread-Topic: [OE-core] [PATCH] clang: remove obsolete 'terminfo'
 PACKAGECONFIG
Thread-Index: AQHb9k2BwjlLcQnN/0GMSRC6kO37BLQ1iK6AgACyyoA=
Date: Thu, 17 Jul 2025 12:12:28 +0000
Message-ID: <FF19A1C4-1D84-46F9-917E-90F7C2078E87@arm.com>
References: <20250716123047.1322878-1-ross.burton@arm.com>
 <CAMKF1srjH=+jMcY4BqMToXWF_Q0DfPcnWynuqVBPK5h5H8azJg@mail.gmail.com>
In-Reply-To: 
 <CAMKF1srjH=+jMcY4BqMToXWF_Q0DfPcnWynuqVBPK5h5H8azJg@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.600.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS8PR08MB6664:EE_|AMS1EPF00000047:EE_|DB5PR08MB10062:EE_
X-MS-Office365-Filtering-Correlation-Id: e4154154-ddbd-4446-e848-08ddc52b45e3
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?ZnBQWHJGcVU3SHB1NDlYVnR0VE9RY244aldwZVVLYkNUTUc0a0VqOGJFRFFY?=
 =?utf-8?B?VnNaMXQ2YklrWFBuK0xFSE9ZNzhjbTVQaG5HVUZuS09JdDB4MzJVN3Zqejdp?=
 =?utf-8?B?b3hnVWhCYjNQaTJaNlI0NzZJaSsvaWV6cEptekxpTmVMNVB1T1lWR2QvVE1I?=
 =?utf-8?B?WVhnOTVuZmJJWGNzMjV1WGEzcXFvLzQ2VVF5aTlvY0lyRUJSK295dmwzYjV0?=
 =?utf-8?B?Ump2VWpOUll1LzM2b1YyeEtIYTdSZXpSZVdVWFFjb2RLTEp2UWNWaUJncGls?=
 =?utf-8?B?TW1vbzYwd1ptSDZNYXdDNi9qamp0elRJWFk2MVlkWXJ6dHlWUC9RU2xPbE5R?=
 =?utf-8?B?UllielQ2V2RwNTZ0bnM3bmpCd3huK1ZNcnBGMnBhL1JUbkNmUldlY3I2Z3Vz?=
 =?utf-8?B?S1hYSWdaWmRlYzA2OEx2UHV6MDNJS040U0RITXV1WmIxWHdtOFdXTVdhbUNk?=
 =?utf-8?B?dFA3VmpxZVcxRFdtbldwNy96VEwvTmltTzYvZzFpS0swYnRrTmFBbVJVaFky?=
 =?utf-8?B?eDVZYzJDYkxXcnJRdTdmT0lJY3ZxMDQ1VEEwclZwOVBuSmcrMnNSSTRCOXNS?=
 =?utf-8?B?OUlYeEFsbVNZRmdnZ2s4YnJhb2Mrd0ZjaE1idnJDTU11Q0NGV3hUczI1MlZw?=
 =?utf-8?B?WjRVeFZxOEsvblc3aTE5bUNaalF2NWx6aFlITHlVY1FMa1FNNzJtcEdIWEhR?=
 =?utf-8?B?bk9TU25XL3puT1IwUERDYUQzeU1IT3poUzVPbC9iTHY2Y2FvbGdsR3drK3pv?=
 =?utf-8?B?c3pZN3RJM0kvSVVTUHVHVCtjMVFGL1d0Sk9SRmJvbC9DeVJIU2xoQ2pOOW13?=
 =?utf-8?B?aXB6dmJJTWVpMzkra3pBRmp0RGs1elA1N0hZSXExNjdaaHlnR1BLeWVKZzhl?=
 =?utf-8?B?cGZLUjFDNFZFRnYzazZZMUVySEoyUERnZjk1KzNhSG14UHlRTWV6QmJkZXFL?=
 =?utf-8?B?V3EvcjJabDlXSEYwbU5NQjRLYzVQVWYzZGN6SjlJOXFwNXA1cG5NTE5TSVpo?=
 =?utf-8?B?R0N0K2JiVWVYa0xWYUw5WUlzSjVGcjRsQU55NzNrVXE1dEdXQnZQbTVUbFhj?=
 =?utf-8?B?QVVYTVBDSnRaN0VQdmZPQmRlelJQUkE4YWE0eUo3NHZ0SDArSWhEM0NwNm9t?=
 =?utf-8?B?V094RGFtNC8yWjZoaUFlQnFyU2EvbTE0MkJVSUhUVDVTNmN3bTdyVEFjSGFh?=
 =?utf-8?B?TjE0T3lSaDRWVVQ2RGd0U0lwNHBIMDk0SlRqcGpSL1IvcmNXQWVDWkF2RWtE?=
 =?utf-8?B?eUVDaUI0SUU1cWxRa1BIekYvYkxkQU5EWnZxNUMxdzlKenMzSDR5U3M1TStI?=
 =?utf-8?B?U2hwVVNXTXZydnBDV3JtMjhSajJzdDlxRTNHK09oUXNTQk55VnNaSDNIWCtL?=
 =?utf-8?B?K0NEU1VISkllSEFrNU9qTERpZjIrc0hCeU5EdFp2ZUtvbjkycjNmaHVPMXd4?=
 =?utf-8?B?NG1kZlhneEdWUmdvUTFWOHJleU92K1g2dGJSci9rSVNCT2d0OWFjLzdmU0tn?=
 =?utf-8?B?WU90TU0zZWVwMXNTRTJpOEJVS2V0Y3FjNERHb2RQUFV0YnlSajY1bFNTSUhL?=
 =?utf-8?B?VXNKbllwK0szRytXNWM4QzRTZXRJSkljN2NvZ0lrWWlTaTZXSmJsU1ZhRW45?=
 =?utf-8?B?bGl4VEJNdlJ0R3dJbWphSkpLRit5KzZDdEdXWW05RGtrNGs1TllNL3BZeGhX?=
 =?utf-8?B?dW1tckhHeXhyTTRmekRwdFZUYjcwcGdoNjBnbU02aGFFZStoUzY5UVZSNW4z?=
 =?utf-8?B?djVZQXoyN0oyajEyS3VXclJ3RFpqVStURklkUitFVnp4TTI1SFhOYmFmem1Q?=
 =?utf-8?B?aTlQWnUraVk4OXJaekhBbGVhcXZtV1VBMHBCR0M4dTVyR3JtMzVVOVU3WldO?=
 =?utf-8?B?cUprVGxZdXFTd21NczNTMjdGY0ZGTnRRWmY2Sy9QMk1uSU5GSG1VbThHRnNq?=
 =?utf-8?B?QWJzZTh3TXJQamJxam5HVlZTaUFrMjZJOGxXRGVHUFZQc250cDhCeC9LQjNV?=
 =?utf-8?B?SWYwZVlScXNnPT0=?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <43F72E1866F4A34DA0DF7DC873E1088A@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6664
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AMS1EPF00000047.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	c03c4939-a64f-4b13-e3b0-08ddc52b32aa
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|36860700013|14060799003|35042699022|82310400026|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?MzczUHBackRBendnUTRVck5Vbkd4d095aGlHT3ZTd3J6YXZseTAyMnRKNnhW?=
 =?utf-8?B?Zk5WT0VKSlZDOHlXMFFGbDRWYzdWWFZNVmJ3RTE4bG1VWWZ3UHg5Ui9MbmVW?=
 =?utf-8?B?dXprSS9lYTVoNTZheGUrL0NQdjBHODFqa2RRTHdNVU55ZTQ3WklBd3JzNzZK?=
 =?utf-8?B?bGRXS1Bhell4cDhyWS8wZXlUajRVUUYwdCtvYXlkUTdDcjJxTFpUVkU4Ly9N?=
 =?utf-8?B?OSt6RlpHakQ3UXh3UG40WXhOWktDYVdKQ0haY2RGRlViS2J4aDdlME5PdTNw?=
 =?utf-8?B?QnNneldDOTlxKzBTSkRLaUY4NW1uaFE0c3V6c3NSZ3BJd3c1aVBCQ1NDK0I4?=
 =?utf-8?B?dnpwa3Y0LzFZdVBkY3d2dXc4TVV2UTBRaUs2ak1iWjVhV2RjOXFUbzZxekU2?=
 =?utf-8?B?NE40SDVJOStKSFVPTTNDeWUvZi94cnIzaExZWVJ1MXhVTzBpenF2YTZsblZZ?=
 =?utf-8?B?bElKVlFjZUFYdzBLVFdkNFR6SGp4UnFVdy95UTBjNkVteVZURDV1bWsxWmx1?=
 =?utf-8?B?ODg4ZUFFSnlvMDZrdGlQeXkvZ2ZVSmR5bVIyYTRWajdBQzJNU1BnNGNYck0w?=
 =?utf-8?B?UTExOHhlRkpvTngwSVB4b1RVOHN6dXF5SG5rUHYvSkRyYVZpTG9SUjBJRUVo?=
 =?utf-8?B?ZTdZSXhHT3Fkci9nRjE4Q0NwZEtXRlYxd3c2VmR6Uno3YXVXVTZWM2JUVWhD?=
 =?utf-8?B?NGw3cGF6S3NRSEVjNzdpWFdDeitkUkYrL0hrWDB4ZVZzYUlPdW9WSnE3bVZ2?=
 =?utf-8?B?NFA5eFl3TUEvZnp5Q282YUk4TWRQSG1RQVpqc2dxVXhpdmw4MjNUa0JBTzBj?=
 =?utf-8?B?cTNCaU1sTy9CQndLakh6clU3eHp0bEp5Ny8waExIYkRWbEFPQmczL2NsR1My?=
 =?utf-8?B?QU96WHNTSklQaVBnTlhROHFOVUJmMEhyZFV4LzlRZ3kyQmxGQVZKTjUyZDJI?=
 =?utf-8?B?NHBZaEQ1QTVzRjFqd2o3SWRTUm10djVPbE5xK0dxVmcwWURFM1VyQ3JtSTJi?=
 =?utf-8?B?TTJkWlhST0hvN3BxeVYwZzRUR1V0QWZJaGd4V0RtMkJzS1ZyNTg0NVNpU1hy?=
 =?utf-8?B?Yjk3aUl1dUIvMTl5N0RQY2dEN1VGc05LNCsyTThMWG1QbkhMenBBRjF3azM2?=
 =?utf-8?B?eHJCbFM3VkRYbndrNk9yamg3ai9nQmhURlNBbDdvMWs0TG9QZ1o5eUs0T0ZN?=
 =?utf-8?B?a0wvckEyY29nSFNiUm03QU5Eank2NVZBWWYwMzhkdnc0c3hzL1ZpaGt5alNv?=
 =?utf-8?B?dGxWVUwrOFI1bVNkMlZMYUNTa2g0VE5hVVJpd0JxVlhIZFdieDVvUUdZT0g5?=
 =?utf-8?B?MlZDT1RxamVIQXFjYnlSQUllUEhTaVlNS25mNXhYTGVKdEpuWnlHbk5hMG12?=
 =?utf-8?B?aU5xalgvSHp5M0s5ZkxFZHliQ1J4c0FkS25CM0NqSGNvRjdnV3diV1B5TVA3?=
 =?utf-8?B?QUFxNWtKV0ZJZDZCWmVUeDdaeWJCNi9MVFdveG94a2U1YTRsYTFIbkZzWTVk?=
 =?utf-8?B?dFQvMmdNZVJEY2JKcHpSV0VhTnJadUdtQ3dHS25xdFdoeDhhMVFMSC9EWmFG?=
 =?utf-8?B?MWtZcDhyTHBiUktsVW5GVnFsYS9BTWRJVzhVVURGcndLV3pFTFVXL2o2aWZy?=
 =?utf-8?B?cjY0ZXdscU5NYTdiaW9CQ2lxV3BIa1poTkVzVjZLZ2RmWjl2a09EenprUndm?=
 =?utf-8?B?QXBqTG45U3JHUXRzL0RnaFNrbjFMZ0FDemlYTXM5MStrdnArekhYa3psR0NT?=
 =?utf-8?B?UDhTTXJoemJrUnR5bmNzZU5ValhxYis5bVJCUHBBL1kwZXd1MFJ6d1JMMEI5?=
 =?utf-8?B?NHJrN2hFZTFlVGVHQUJ6dEdhTlI4bzE2VThFTks1RUNZTFNtNUE2K3pHd0RO?=
 =?utf-8?B?dkFXVSt5eWIvV0UwczFiZTB1ODArNTlCY2I4TFhyWDJuckEzU0NBWFQwUWNT?=
 =?utf-8?B?K1dOQW1GeDJMUFdiZGxYUlY3cnJYUitMRTVycEpZLzZ1QndJbEdLNlVkMGpo?=
 =?utf-8?B?SU81aHNKUWhEanhGV1A4R3oyU2NtMUNSNlBneHBRSVJ6eENCM0RzdzRVdUdk?=
 =?utf-8?Q?y9V7ms?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(14060799003)(35042699022)(82310400026)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2025 12:13:00.2861
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e4154154-ddbd-4446-e848-08ddc52b45e3
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS1EPF00000047.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5PR08MB10062
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Jul 2025 12:13:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220537

T24gMTcgSnVsIDIwMjUsIGF0IDAyOjMyLCBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPiB3
cm90ZToNCj4gDQo+IE9uIFdlZCwgSnVsIDE2LCAyMDI1IGF0IDU6MzDigK9BTSBSb3NzIEJ1cnRv
biB2aWEgbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiA8cm9zcy5idXJ0b249YXJtLmNvbUBsaXN0
cy5vcGVuZW1iZWRkZWQub3JnPiB3cm90ZToNCj4+IA0KPj4gTmVpdGhlciBMTFZNX0VOQUJMRV9U
RVJNSU5GTyBvciBDT01QSUxFUl9SVF9URVJNSU5GT19MSUIgYXJlIHVzZWQgaW4gdGhlDQo+PiBj
dXJyZW50IENNYWtlTGlzdHMuDQo+IA0KPiBJdCBoYXMgdHJhbnNmb3JtZWQgb3ZlcnRpbWUsIHNv
IHJlbW92YWwgaXMgcGVyaGFwcyBmaW5lLiBhbHRob3VnaCB0aGlzDQo+IGhhcyB0cmFuc2Zvcm1l
ZCBpbnRvIGxsZGIgY21ha2UgZGV0ZWN0aW5nIGl0IGZvciB0aGUgYnVpbGQNCj4gc28gaXQgbWln
aHQgYmUgZG9pbmcgdGhlIGpvYiBkdWUgdG8gbmN1cnNlcyBiZWluZyBpbiBkZXBzIHdoaWNoIG5v
dyBpdA0KPiBnb25lLiBUVUkgd2l0aCBsbGRiIG1pZ2h0IGJlIGRpc2FibGVkDQoNCkkgZG9u4oCZ
dCBiZWxpZXZlIHRoaXMgaXMgYW4gaXNzdWUsIGFzIHlvdSBzYXkgbGxkYiBkZXBlbmRzIG9uIGxp
YmVkaXQgd2hpY2ggZGVwZW5kcyBvbiBuY3Vyc2VzLCBzbyB0aGUgZGVwZW5kZW5jeSBpcyBzdGls
bCB0aGVyZS4NCg0KUm9zcw==

