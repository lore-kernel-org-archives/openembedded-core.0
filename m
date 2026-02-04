Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85599E83EF6
	for <webhook@archiver.kernel.org>; Wed,  4 Feb 2026 17:31:14 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.24])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.529.1770226265024511981
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Feb 2026 09:31:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=irPZDnGI;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=irPZDnGI;
 spf=pass (domain: arm.com, ip: 52.101.70.24, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=eXeAowXzgd0gn3mIc7BwoVFXd/2PrZ/D+HUxt9zgWZho1oVvgowhhqLBTeGxPKrUATRFy9r041EVrJBW522ERNM8Re9mmoJWhjDIFW6CdUH/99O+oitj1ycXsucVKfrnHiElIDsSIiCne73WkGLWxG9rE2FdyLKjYJzS8pOnTSFM4eMx2j4gfVXPGHCLOKNEcKdd+PKksf/kwVQPXa6rSj4Sws9oGUoyHHsxj5pG4V9DO5wWRH8qUxjJEZdqsr7WoZC1XtimRHKAlJbVqpXFfuw697LIpgqLSdt0wf/2gJKE6VN2fiv9ksuYcILnliYeMugSmRtfK0Scm1sc3DCsbg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rLwRRkdl9apeImhAVmGFg1TLlV0DDpRSFWql4JEawaY=;
 b=ppB44o3aZ1bSTuAichv8GLneaeybpD7GbH2x0BNQHl47ZMj655hrDWrxoLFfP6EbeRhcK+WLinvftdhaEN7kkt7v9Jd8EdZn2ze5aMw5XAiQehHFZeTiyPS+h/ZltMF7GFKL8PaWfwXtTR7vgOhuAezBM66x2jC/Q1BWfxXx+XBAufrHQnC31wggagZmpqlk3c5TQB6S6aPkSFv8UFXgFX2PRIkQWSjVbazdhcI9m1gSs4iwh2NIWxqZEfB+qK5XcMR+me/0yDWMFzPMnj/OY03kxMIhs02MnLFQPoUc8psIhqPlUbTR4MxcF7vzbvK7JaSnCoJ8B0V1USIhgH8hKw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rLwRRkdl9apeImhAVmGFg1TLlV0DDpRSFWql4JEawaY=;
 b=irPZDnGIjqBInTe5Zg1EI+2mBvEnsHVVQA6SDUNGv0ctoQeKwObi9GxJK6ZfPgwPJvF6qz3HgZ4Z7kd/fCdFqDqUHNL9F3qkG2eDdOTskvajv2feGXzNJ9O9Toz3915rZkFEnWiJX7bhhnZcS9CtBld+klyNmG5uOOf78VPMvOw=
Received: from AM8P191CA0028.EURP191.PROD.OUTLOOK.COM (2603:10a6:20b:21a::33)
 by AS8PR08MB9696.eurprd08.prod.outlook.com (2603:10a6:20b:614::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Wed, 4 Feb
 2026 17:30:57 +0000
Received: from AMS1EPF00000049.eurprd04.prod.outlook.com
 (2603:10a6:20b:21a:cafe::69) by AM8P191CA0028.outlook.office365.com
 (2603:10a6:20b:21a::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.13 via Frontend Transport; Wed,
 4 Feb 2026 17:30:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS1EPF00000049.mail.protection.outlook.com (10.167.16.133) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.10
 via Frontend Transport; Wed, 4 Feb 2026 17:30:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g/ZpBTfXCNPO88Co3CWLltE4FKr/ex2zxnAm+zWiOYbJmyaOiCx7SgqTzF2znQH5RFGWRSz9ZzRyiKn3P6JsaI606ujdYzp3J//3wEM8Pu8Cwh+NDl+wkakgbOTqZ/ZC+qdS8uPSqeKhZKPy8Dbf60ntCTp8VB4T5YTr5BazL0hgNmBbhLTCCOHEycqTpWa76GYzVRpDKfW2U6TKVUXtSdTIpNhgVu+lFsj4rYig3RkX3WJ6nejxTWljfmCM0fGYjXGe6gRpl8txXie2Fn8Ku4FxktWBaf30WOFYcz+SwWY40/aAvkipJW+XVfYqFeGaOsLrwRrQzOA6fkFh6yHSUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rLwRRkdl9apeImhAVmGFg1TLlV0DDpRSFWql4JEawaY=;
 b=HfkxmGxQIkSmw33dgmfd6CgpKqNsxpCDy3kE/Q6Emc8aTUH922wa9PTyvulJ1E1WLIOYS4gVZy+1q1JqeBbklzAUd6Xvy3zncXfdAzsYA0dFURCibwu7pSR2qjcj/2UpNDUKc0VJx1rtr3nmdg1/SVwlrwn6tzt3Ghb0LlGGtY73jDVU8xkA9xXZAtrlQlmRooEkYeub3zQOgsML5e5+8I+x+N0mlBBDtlKiWvJdzRe6Ra5km+fLQBB/eDTM9Q4jkAGEQxTsoVeJj0Mdp+sz3fuoLRbKcAA7GaGK4XHbbKdMV8GNn9s1nG2yFvW9P0ZIb9x/9R+U3R5kOQY4JL2czA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rLwRRkdl9apeImhAVmGFg1TLlV0DDpRSFWql4JEawaY=;
 b=irPZDnGIjqBInTe5Zg1EI+2mBvEnsHVVQA6SDUNGv0ctoQeKwObi9GxJK6ZfPgwPJvF6qz3HgZ4Z7kd/fCdFqDqUHNL9F3qkG2eDdOTskvajv2feGXzNJ9O9Toz3915rZkFEnWiJX7bhhnZcS9CtBld+klyNmG5uOOf78VPMvOw=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by GV2PR08MB11794.eurprd08.prod.outlook.com (2603:10a6:150:300::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Wed, 4 Feb
 2026 17:29:54 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50%6]) with mapi id 15.20.9587.013; Wed, 4 Feb 2026
 17:29:54 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, openembedded-architecture
	<openembedded-architecture@lists.openembedded.org>
CC: Joshua Watt <JPEWhacker@gmail.com>, "benjamin.robin@bootlin.com"
	<benjamin.robin@bootlin.com>
Subject: Comparing cve-check with sbom-cve-check
Thread-Topic: Comparing cve-check with sbom-cve-check
Thread-Index: AQHclfvgyd8b8lkDDE+HyTNqc0pBVg==
Date: Wed, 4 Feb 2026 17:29:54 +0000
Message-ID: <2CD10DD9-FB2A-4B10-B98A-85918EB6B4B7@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.700.81.1.4)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|GV2PR08MB11794:EE_|AMS1EPF00000049:EE_|AS8PR08MB9696:EE_
X-MS-Office365-Filtering-Correlation-Id: d0bf747b-e4af-4bd2-a409-08de641327fd
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|1800799024|376014|366016|38070700021;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?KzRZQjlMYXNNY1p2VjlqZHd4ait2Q3NWM3lqNnJqRTVTUXErV1ZoRDJPd1V0?=
 =?utf-8?B?dTVOUUdSck8xeXJJYVlPQldhSm13SlBRbjhmWEp2cnpXMTFXVDhubDNyUUxR?=
 =?utf-8?B?eGZEMHpnVzNmMUtxaUxIYThGTjZvVHp0MVZQTWo4SGIzYzB2RUZKRFVqN1g4?=
 =?utf-8?B?NnJPM0tLNndlbWxHWHVlbmJ6TFNrSjgvOG42T3I3LzZ0M2taUDBYcStaQVBV?=
 =?utf-8?B?cXlad1R3Qzl6SG1uNDVpZmJkcXB4bXE3eU1WakNIaWtKcGhPNEdPZ1JuL1ZC?=
 =?utf-8?B?cGxxK1Z3TXBsSE9BOVJnUmZRcXBzK0ZaNUV0SmFjdm5Dd3dzRUpueGIyRXJK?=
 =?utf-8?B?SDdyWVJ5bEZhUk1zVno5WjB3Nyt6VWszc0lPSldZSFRCN0huMU90MHdMS1gz?=
 =?utf-8?B?SmpBTVN6RGFFU1R2ZEhKNXJLSXYxQzFPbXJoWnJWc1huSXJNWnRUYVdUVVMr?=
 =?utf-8?B?dTZnTnhWRFAwNmpWWWQ4VURVRUVZKzU3UENBUlRLK3FUcUNHUUp1Tjh1Yjhw?=
 =?utf-8?B?eFVmcGRuWGV4ZUd3ck9XdUdleHJZSXdENWU1OTFjU3pWZ0o0V2RaYVR6anA4?=
 =?utf-8?B?M0FkVnliTkFDWTExSkRBWERHM0U0dGRFWDNPK3Q5NjEwY25FSHQ2VzliV0Vm?=
 =?utf-8?B?Y1J2cTFvVmNoRloxbVNPOXBRY1ZaL05wTmJ2WnpZY2w1c3k3QzI1TE5kamhs?=
 =?utf-8?B?S3Q1eHUzTG9pQ2U2dTRxWDU3RHpROWZ5dUg0WG5YRlIzdXZvVjV1LzZLQ1pn?=
 =?utf-8?B?SGRIWmp6L0NoZTFDRlBmSUR0eWNYdjNFLzVLMEsyQkhWSmZqcVYxOGJra2Zm?=
 =?utf-8?B?cUVYY2U3Ky8xdjlyRnQrVUtQZXBGRjQyMmk3TEtvWWdBall2cWlObm0zMWRm?=
 =?utf-8?B?Zzh0eW11aU5Nck9Cb0dubUUvWDNSc1FJRS9VeW1RMzVydE5GK2F5Y04vVkFX?=
 =?utf-8?B?d1d4K2hseDJLS1NMYjdsQnVmQ2RGYkZxM2hEUi83bGEzcFJ0U3FoeHV1L0pB?=
 =?utf-8?B?SVBXUDVPN3k0T2FXYnF6N3NLSnd0aUNSdVJ0YzAyd2sxMXpiQXpna0tDL1RR?=
 =?utf-8?B?aHBhaUNGWXAwQmdwU0tVNWFaUTMxZ3FQSW9McC9rVE4rL0gyT3Rpa2pEcGda?=
 =?utf-8?B?QnNnb28zT1daZVF5UTFQVUdXbnA1cmtSdWFuRlUrb2RaRngyd0lqOEtaSmxI?=
 =?utf-8?B?TmhiTzFkaFVYa240VWIydWdZd1l4WnRtM29uMHkreUFHSDhnMW0wMG9ZYUFr?=
 =?utf-8?B?ZnFDRFUyTDlHM2xJYUtJU01wNEVoZUhHRTUySHZqcFoyWWtKaDdhbE5ydGlL?=
 =?utf-8?B?WHBZWjQxdmZ6em5tOFM0Z0JJcngzRTNHWUJRZjBGeWcrQzZFS2ZxTzhIcGpP?=
 =?utf-8?B?SXdPdkxvc0xadGw4eXNlOUwzcnR4L2Q0V3lSa3lScVR3NHE1SFlmbFR2Ykw0?=
 =?utf-8?B?MGdKejM2Z0NqMjRSVXc1NlBOWUplOHM4T1c5R3pjSUw5SSs3Qmp4VllQbUxT?=
 =?utf-8?B?TFRjQzRBTW5OR2FLMktKSFdWUElkc3EvbEgvUUMvYXVwTEdNcTZrYXdTZ0VQ?=
 =?utf-8?B?eHF6MGdwZTdpeEdKTW5OaDFJYmNiTEhMcUxzSUM0VDFGY1VIY1N1Mk03d0pv?=
 =?utf-8?B?TFdGQVBUMEorSVRxU2VPWW5KRHRRWnRIRWZiZVMyUnhxNCtPMDJaTHZRQ0th?=
 =?utf-8?B?Kzhzd3Bjb3owKythZGZ2YXVodktabE4xNWk1TWYwQjFObldlektGTndVcWxD?=
 =?utf-8?B?SWtyWXNmSUV6Y2ZxNUpCdEJkanlUTkVSazlNUVhNM0t5aUpQOThXcDVHMlNx?=
 =?utf-8?B?U3dOcFhuOVhLVFlCN1hEUUpHcDhXeUVrYUUvU3BzU2lLaFc1YmgxSDhmSzJx?=
 =?utf-8?B?aFluWUhETTRjUGZBUkNKYWtCYnlnVzlkQlVEcjNOaDVRT2hXUXVDZ0JGUGQ5?=
 =?utf-8?B?ZTZReU5NcmVIaFpZMHFPQ0IzY01lMEZ5K1dac1lOTUVPUlkwUmEzb2xrNk5M?=
 =?utf-8?B?Y1cxeFo5UjNpNXBkbzBYMFFHYUJnTFQyTnRXamdIY1k0cTlSL3pmSlFySU5Z?=
 =?utf-8?B?eFRadUJDcS9POW1yZTMwMHVBc1FhbG1EUEU1V0dobzB3ZUhpK1c3eTdtaXNP?=
 =?utf-8?B?NW12VWxWWFkvR3oyRUt5dmkzUEJHMVFPRll1bTVuTkltakU2aUNLaWxoTjQv?=
 =?utf-8?Q?nLCBMkY/6L2xmhpHXhSL2jvw7PSeig+7plOfuWHcXizo?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <CB01217A77834443B567CB825097BEC9@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB11794
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AMS1EPF00000049.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	98b3934e-21bc-418a-8543-08de6413028a
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014|14060799003|35042699022|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?MjZZbDF6RmR5WnhpYVFYN09mMTVmOUFyWkFvaXdMY0FzN1cvL2I0Q1NzcGpk?=
 =?utf-8?B?ZlJ1dG9kNllxcnNseWNjNDV6d3NOMUVxL29QT2VhbkhLTHhJdk4zWUdHNHBY?=
 =?utf-8?B?T0VRVkttZ0dRdFFWdEphc2RKVFdEcnRhUDZHM2RXMkFla1ROWEZkdVNHVnVL?=
 =?utf-8?B?MUoxUVByZmxxY2NYdloxTUN2TURaekh1UzlmZDFrUGxBcGJmdktFZ3NSZ1ow?=
 =?utf-8?B?UkJ6UVJHdjNobVNTTUJyZTdaaWV5SloxdVN0V2d3KzlhVC9WMWg4RUtHWGg1?=
 =?utf-8?B?UDN4eWhJWUNSclJZMVpETllQNVJEVXRiR2tpUEp5VUVhOGpHTHk0NFlCTnhw?=
 =?utf-8?B?ZEljSzRJTDNyT2E2dTl3VGVtMUdkWXErWWkzY3cwMkVibkxMOUNOL3ovaCtX?=
 =?utf-8?B?c3VxV20zaDRwd1Fnd2lKMEtid3N4TVJFVEl3elEydWlOTlAvTko2cjVCUG82?=
 =?utf-8?B?ejFFWWRWMThma2VsV014V1VZSDhLdnE2clEyOFFkUnN5UlVBZkh1Y1B5WEJ5?=
 =?utf-8?B?WGJtaE1LV2k4WUp5a01LNDIxcDh6UFFMNFpKN2RlM1lGd2lpTC80b3lScDI1?=
 =?utf-8?B?aDFoa0t1Rnh4UDNvS2lTWUVUa255WGJGZUtmblNpVE5qYkRZOCs2NEgvZXRE?=
 =?utf-8?B?UitkK3hySXhsbTNRN0J3V3JlQ2FKa0I3YVRwQXd5M0J0TVpqdXB2T2QxR1ZP?=
 =?utf-8?B?aUx2em5tNDdSbEpISjBiSldPOWNzRTAzNnQ5eXV3NExlSUpOSkRMN1JvRWdF?=
 =?utf-8?B?SXlac0hjNVlIUlIzZkxnSExkOC9idlVMNUNjSDJ0RWVRKzd3OVVoN2dlRDZt?=
 =?utf-8?B?TWFlVFB4eDB0cFRQNTh2VVJ4N0VCR3JwcmZ4dVZzaHcvbHVLREtGb1VqQTdL?=
 =?utf-8?B?TWp1aEJOSG42L1F0amtvR2RLQ29LUHVTM3hIdDBMYjR2WkNma0xHZlNrUkYz?=
 =?utf-8?B?Rk1WM0l3OG9QdjVUUnpYeUhieUxBNlM3WFpvcXhmejRkamN5WWl2NWJ5am52?=
 =?utf-8?B?eHJNV3NkOGdGakNtZm9ZZ05FZE1xdHdJeWFrY3UvMVBmZExSZlNTd3ZxWDho?=
 =?utf-8?B?VVRjOStFVFpFTlYyVUtXS1RIL0I3WHk2RzlhL2dlTk9PK0wrNnozTjlXQ1A5?=
 =?utf-8?B?TnR4akNGRDdvTlZybzgydVZMb0NwSzZ4Q1gxVG1VbjM5aXFpNFEvVk1Ua0Jp?=
 =?utf-8?B?ZHZuOWNCSGFiMytKNUV4Vno1RFowMmNjOHRwQTRFdnFBcXFIZVdxVUFEbWJo?=
 =?utf-8?B?eTBBQVc5bHJTK3E5TStHaUlQM01WUEZkNWgxOTMvSFMxOUM3VTBaV3hvaDdW?=
 =?utf-8?B?VW9veHhLMTRrNnFaYmdjUVB2V052Sjd0TXBhNUJOVHA1b0FzOUFYUG5GaFpP?=
 =?utf-8?B?MDgrdjZhWUVTMitZRTE0bmNvRU9IWHJMT0dXMkV0bnVyMUdKdHFyKyt0bS9r?=
 =?utf-8?B?amFsR3R1a0lkbzcvVU5DbmlBWDlxOHFPUkRneFJ3MlhleVNWblpBV1VwREl0?=
 =?utf-8?B?ajYwUGZzZFFSbkZtTWNlQTh6OTJxanEzQm9McWtDSVdPYUZBSTJvK2FFemV2?=
 =?utf-8?B?b0FzUU1LTVpNNGxtMTQxZ3FweHhKdm1raC9Nei9mU2tDNkJDWmc4MVFFbDZ5?=
 =?utf-8?B?RjJ6ZytUN3pYOFFSTG9DWXZzZmRwNExvVjM1UVg0Y3RocHZTUGdtRVorUXpv?=
 =?utf-8?B?Y1hkQWUvT2hIUmgzQW56dE1sU1daR3FvVmNaWGg4OW9teDRvNHVGNXZ6UlBy?=
 =?utf-8?B?c2VSeG8rWG5ZaVZ5SFlJR0pOWjlTQnMxL0lheG4vbEtFQktyWDB2NzIxQ0ta?=
 =?utf-8?B?WHUxNFpvdUtERm83SHp4WE1IR2tzaWxhbGNFaTczU1I3UzRXcWxURDd0S2tU?=
 =?utf-8?B?SXNReFJaZFZEMythczdvOGZKTGl5SzlyYkFvL05BZUJYL3lvWHFGWHBPa2RQ?=
 =?utf-8?B?c1JoQU5TL3FjQi9zTTYwdCtTMUVNUi9VTU1UMG5yQktLVmFwNEpNMnVzUjQ5?=
 =?utf-8?B?QW56NlpmbUNKbzdwZDYrbEZjekpZSEYwa1BkUVhLSmd5cnFoV29oUmE5Sk02?=
 =?utf-8?B?MUpUN1NxK0pWQkxaNHY3bk9CQjU0RVZCM29nSFZYeUNmd0pqT0NJMGxQZEV4?=
 =?utf-8?B?QUpha0VCQk1zTUQ2V2NBZXVxRVdPc1FWS1YzajNObE82WkU0d0NsdW9nTVI1?=
 =?utf-8?B?ejJmdTRtNEVvd2dHY3Nhb25Tb1dsQzhEQTFBOWNZT1hxb0xtaXcvMllkMXNW?=
 =?utf-8?Q?uCye6AOLS4uyFRptpF3HtV2dlR/Zsn7g3teOsu4OSg=3D?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014)(14060799003)(35042699022)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	kex2wH3CJj9UdGkBq6lZ9us972sq+L67tmJeUskjtBIeKzAYIXyb/QI5RGbEMDXG78zZ/9eTRXsJRDk4hXtsl5VWrcQK+hah8udVVbNFEOgKSLvwIxwbM9CFufWZC884DnnRhz+YbrmMby+24+f/qVuBUiQOOoYJOOFtBDXMG2IMrYtsgYqnp8v9nff1lMDJzq/8LAmUjI1uLJi+jSM3Jq7dxFdzeMyJf39yTMhwu95JaZSG07giD4ZOSxd4dbWdQ48CLA39Fm9aClxRsNNJ03ih7Y+x+ni0cztxz7hH0h0g9WaAzMUYoslnBxHEfznAAgEDEFnqjoUyQWDo6Rkl8uQOAv+FzNfQRGuohp740uXXSrQEcpl7LI+wgV2I1Y52rrG/l9NiEoevBpCQosP0kg6pHQlUehvHcrno6xGKt6g6J2ozOxsL7Q2uGit0vb25
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2026 17:30:57.0290
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d0bf747b-e4af-4bd2-a409-08de641327fd
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS1EPF00000049.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9696
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Feb 2026 17:31:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230557

SGksDQoNCkkgc3BlbnQgYSBsaXR0bGUgdGltZSB0aGlzIHdlZWsgY29tcGFyaW5nIG91ciBjdmUt
Y2hlY2sgd2l0aCBCb290bGlu4oCZcyBzYm9tLWN2ZS1jaGVja1sxXS4NCg0KdGw7ZHI6IGhhcyBw
cm9taXNlLCBuZWVkcyBhIGxpdHRsZSBmdXJ0aGVyIHdvcmsuIEkgdGhpbmsgd2UgY2FuIHN3YXAg
Y3ZlLWNoZWNrIGZvciBzYm9tLWN2ZS1jaGVjayBpbiB0aGUgTFRTIGlmIHdlIGh1cnJ5Lg0KDQpU
aGUgYmFja2dyb3VuZCB0byB0aGlzIGlzIHRoYXQgdGhlIGV4aXN0aW5nIGN2ZS1jaGVjayBjbGFz
cyBoYXMgc29tZSBrbm93biBsaW1pdGF0aW9uczoNCi0gVXNlcyB0aGUgRktJRSBmb3JrIG9mIHRo
ZSBOVkQgZGF0YWJhc2UgYXMgYSBzb3VyY2Ugb2YgQ1ZFIGRhdGEsIHdoaWNoIGRvZXMgbm90IGhh
dmUgdGhlIGxldmVsIG9mIG1ldGFkYXRhIGl0IHVzZWQgdG8gaGF2ZQ0KLSBPbmx5IGNhbiBiZSBy
YW4gYXMgcGFydCBvZiBhIGJpdGJha2UgcnVuLCBubyB3YXkgdG8gZG8gcmVwZWF0IHNjYW5zIGEg
bW9udGggbGF0ZXIgd2l0aG91dCBpbnZvbHZpbmcgYml0YmFrZQ0KDQpXaGVyZWFzIHNib20tY3Zl
LWNoZWNrIGlzOg0KKDEpIGFuIGluZGVwZW5kZW50IHRvb2wsDQooMikgc2Nhbm5pbmcgYSBTUERY
IG1hbmlmZXN0LA0KKDIpIHVzaW5nIGJvdGggdGhlIEZLSUUvTlZEIGRhdGFiYXNlIGFuZCB0aGUg
Q1ZFIFByb2plY3QgY3ZlbGlzdC4NCg0KVG8gZWxhYm9yYXRlIG9uIHRob3NlIHBvaW50czoNCg0K
MSkgQXMgYW4gaW5kZXBlbmRlbnQgdG9vbCBpdCBjYW4gYmUgcmFuIGF0IGJ1aWxkIHRpbWUgKHBv
dGVudGlhbGx5IHVzaW5nIG1ldGEtc2JvbS1jdmUtY2hlY2tbMl0sIG9yIGJ5IGNhbGxpbmcgdGhl
IHRvb2wgZGlyZWN0bHkpLCBvciBhdCBhbnkgcG9pbnQgaW4gdGltZSBhZnRlciB0aGUgYnVpbGQg
dXNpbmcganVzdCBhcmNoaXZlZCBtZXRhZGF0YSB0byBjaGVjayBmb3IgbmV3IGlzc3Vlcy4gVGhp
cyBpcyB2ZXJ5IHVzZWZ1bCBmb3IgbWFudWZhY3R1cmVycyB3aG8gd2FudCB0byBzY2FuIGZvciBp
c3N1ZXMgcm91dGluZWx5IHdpdGhvdXQgaGF2aW5nIHRvIGRvIGJ1aWxkcy4NCg0KMikgV2hlcmVh
cyBjdmUtY2hlY2sgc2NhbnMgZm9yIENWRXMgYXQgYnVpbGQtdGltZSBpbiBhIHJlY2lwZSB0YXNr
IGFuZCB3aWxsIChiYWRseSkgZ2VuZXJhdGUgYWdncmVnYXRlIHJlcG9ydHMgZm9yIGltYWdlcywg
c2JvbS1jdmUtY2hlY2sgdXNlcyB0aGUgaW1hZ2UgU1BEWCB0byBrbm93IHdoYXQgcHJvZHVjdHMg
dG8gbG9vayBmb3IgaXNzdWVzIGluLiBUaGlzIG1lYW5zIGl0IF9vbmx5XyBzdXBwb3J0cyB0aGUg
4oCcd2hhdCBpc3N1ZXMgZG9lcyBteSBpbWFnZSBoYXZl4oCdIHVzZS1jYXNlIGFuZCBub3Qg4oCc
d2hhdCBpc3N1ZXMgYXJlIG9uIG15IGJ1aWxkIG1hY2hpbmXigJ0gKGVnIGlzc3VlcyBpbiBuYXRp
dmUgdG9vbHMpLg0KDQozKSBUaGUgdXNlIG9mIHR3byBkaWZmZXJlbnQgZGF0YWJhc2VzIG1lYW5z
IGl0IGhhcyBtb3JlIHNjb3BlIGZvciBpbXByb3ZlZCBtZXRhZGF0YS4gIEl0IGN1cnJlbnRseSBz
dXBwb3J0cyB0aGUgRktJRSBtaXJyb3Igb2YgdGhlIE5WRCBkYXRhLCB0aGUgQ1ZFIExpc3QgYnkg
dGhlIENWRSBQcm9qZWN0ICh3aGljaCBpcyBnYWluaW5nIGltcHJvdmVkIG1ldGFkYXRhIHZpYSB0
aGVpciBFbnJpY2htZW50IFByb2dyYW0pLCBhbmQgZnVydGhlciBzb3VyY2VzIHdvdWxkIGJlIHNp
bXBsZSB0byBhZGQuDQoNCkFzIGEgdGVzdCBJIGRpZCBhIGJ1aWxkIG9mIGNvcmUtaW1hZ2Utc2F0
byBhbmQgZ2VuZXJhdGVkIGEgcmVwb3J0IHVzaW5nIGJvdGggY3ZlLWNoZWNrIGFuZCBzYm9tLWN2
ZS1jaGVjay4gIFRoZSBkaWZmZXJlbmNlcyB3ZXJlIGludGVyZXN0aW5nLg0KDQpjdmUtY2hlY2sg
cHJvZHVjZWQgdGhpcyByZXBvcnQgZm9yIHRoZSB3aG9sZSBidWlsZDoNCg0KV0FSTklORzogYXZh
aGktMC44LXIwIGRvX2N2ZV9jaGVjazogRm91bmQgdW5wYXRjaGVkIENWRSAoQ1ZFLTIwMjUtNTk1
MjkgQ1ZFLTIwMjUtNjg0NjggQ1ZFLTIwMjUtNjg0NzEpDQpXQVJOSU5HOiBidXN5Ym94LTEuMzcu
MC1yMCBkb19jdmVfY2hlY2s6IEZvdW5kIHVucGF0Y2hlZCBDVkUgKENWRS0yMDI1LTYwODc2KQ0K
V0FSTklORzogZXhwYXQtMi43LjMtcjAgZG9fY3ZlX2NoZWNrOiBGb3VuZCB1bnBhdGNoZWQgQ1ZF
IChDVkUtMjAyNS02NjM4MiBDVkUtMjAyNi0yNDUxNSkNCldBUk5JTkc6IGV4cGF0LW5hdGl2ZS0y
LjcuMy1yMCBkb19jdmVfY2hlY2s6IEZvdW5kIHVucGF0Y2hlZCBDVkUgKENWRS0yMDI1LTY2Mzgy
IENWRS0yMDI2LTI0NTE1KQ0KV0FSTklORzogZmZtcGVnLTguMC4xLXIwIGRvX2N2ZV9jaGVjazog
Rm91bmQgdW5wYXRjaGVkIENWRSAoQ1ZFLTIwMjMtNTE3OTEgQ1ZFLTIwMjMtNTE3OTMgQ1ZFLTIw
MjMtNTE3OTQgQ1ZFLTIwMjMtNTE3OTUgQ1ZFLTIwMjMtNTE3OTYgQ1ZFLTIwMjMtNTE3OTcgQ1ZF
LTIwMjMtNTE3OTggQ1ZFLTIwMjUtMjI5MjEgQ1ZFLTIwMjUtMjU0NjggQ1ZFLTIwMjUtMjU0Njkp
DQpXQVJOSU5HOiBnbGliYy0yLjQyK2dpdC1yMSBkb19jdmVfY2hlY2s6IEZvdW5kIHVucGF0Y2hl
ZCBDVkUgKENWRS0yMDEwLTQ3NTYpDQpXQVJOSU5HOiBsaWJwYW0tMS43LjEtcjAgZG9fY3ZlX2No
ZWNrOiBGb3VuZCB1bnBhdGNoZWQgQ1ZFIChDVkUtMjAyNC0xMDA0MSkNCldBUk5JTkc6IGxpYnNu
ZGZpbGUxLTEuMi4yLXIwIGRvX2N2ZV9jaGVjazogRm91bmQgdW5wYXRjaGVkIENWRSAoQ1ZFLTIw
MjQtNTA2MTMgQ1ZFLTIwMjUtNTIxOTQgQ1ZFLTIwMjUtNTYyMjYpDQpXQVJOSU5HOiBsaW51eC15
b2N0by02LjE4LjYrZ2l0LXIwIGRvX2N2ZV9jaGVjazogRm91bmQgdW5wYXRjaGVkIENWRSAoQ1ZF
LTIwMDgtNDYwOSBDVkUtMjAxMC00NTYzIENWRS0yMDE5LTE0ODk5IENWRS0yMDIxLTM3MTQgQ1ZF
LTIwMjEtMzg2NCBDVkUtMjAyMi0wNDAwIENWRS0yMDIyLTEyNDcgQ1ZFLTIwMjItMzgwOTYgQ1ZF
LTIwMjItNDU0MyBDVkUtMjAyMy0zMzk3IENWRS0yMDIzLTM2NDAgQ1ZFLTIwMjMtMzkxNzYgQ1ZF
LTIwMjMtMzkxNzkgQ1ZFLTIwMjMtMzkxODAgQ1ZFLTIwMjMtNDAxMCBDVkUtMjAyMy02MjM4IENW
RS0yMDIzLTYyNDAgQ1ZFLTIwMjMtNjUzNSkNCldBUk5JTkc6IHBvbGtpdC0xMjctcjAgZG9fY3Zl
X2NoZWNrOiBGb3VuZCB1bnBhdGNoZWQgQ1ZFIChDVkUtMjAxNi0yNTY4KQ0KV0FSTklORzogcWVt
dS1uYXRpdmUtMTAuMi4wLXIwIGRvX2N2ZV9jaGVjazogRm91bmQgdW5wYXRjaGVkIENWRSAoQ1ZF
LTIwMTktMTIwNjcgQ1ZFLTIwMjEtMjAyNTUgQ1ZFLTIwMjQtNjUxOSkNCldBUk5JTkc6IHFlbXUt
c3lzdGVtLW5hdGl2ZS0xMC4yLjAtcjAgZG9fY3ZlX2NoZWNrOiBGb3VuZCB1bnBhdGNoZWQgQ1ZF
IChDVkUtMjAxOS0xMjA2NyBDVkUtMjAyMS0yMDI1NSBDVkUtMjAyNC02NTE5KQ0KV0FSTklORzog
dmltLTkuMS4xNjgzLXIwIGRvX2N2ZV9jaGVjazogRm91bmQgdW5wYXRjaGVkIENWRSAoQ1ZFLTIw
MjUtNjY0NzYpDQoNCkFzaWRlOiBjdmUtY2hlY2vigJlzIHBlci1pbWFnZSByZXBvcnRpbmcgYXBw
ZWFycyB0byBiZSBzbGlnaHRseSBicm9rZW4gYW5kIGNsYWltZWQgdGhhdCBteSBzYXRvIGltYWdl
IGluY2x1ZGVkIGltYWdlcyBmcm9tIG1ldGEtb2UsIHdoaWNoIGl0IGRpZCBub3QuIFRoZSByZXBv
cnQgYWJvdmUgaXMgdGhlIHJlcG9ydGluZyB0aGF0IGlzIGxvZ2dlZCBkdXJpbmcgdGhlIGJ1aWxk
Lg0KDQpBZnRlciB3cml0aW5nIHNvbWUgdG9vbGluZyBmb3IgdGV4dHVhbCBzdW1tYXJpZXMsIHNi
b20tY3ZlLWNoZWNrIHByb2R1Y2VkIGEgcmVwb3J0IHRoYXQgaXMgc2ltaWxhci4gVGhlIHJlY2lw
ZSBsaXN0IGhhcyBkaWZmZXJlbmNlczogdmltIGFuZCBhIGhhbmRmdWwgb2Ygb3RoZXIgYXJlICBu
b3QgbGlzdGVkOyBidXQgcHJldmlvdXNseSB1bnJlcG9ydGVkIENWRXMgaW4gYnVzeWJveCwgY2Fp
cm8sIGV4cGF0LCBnbGliLW5ldHdvcmtpbmcsIGdudXBnLCBsaWJnY3J5cHQsIGxpYnNvdXAsIGxp
YnhtbDIsIG1wZzEyMywgcGVybCwgdGFyLCBhbmQgdGhlIGtlcm5lbCBhcmUgYWRkZWQuDQoNClRo
ZSByZWNpcGVzIHRoYXQgYXJlIG5vdCBsaXN0ZWQgYXJlIGVpdGhlciBuYXRpdmUgdG9vbHMgKHdo
aWNoLCBieSBkZWZpbml0aW9uLCBhcmUgbm90IGluIHRoZSBpbWFnZSkgb3IgcmVjaXBlcyB0aGF0
IGFyZSBidWlsdCBmb3IgZGVwZW5kZW5jaWVzIGJ1dCBkbyBub3QgZW5kIHVwIGluIHRoZSB0aGlz
IHNwZWNpZmljIGltYWdlLiBJbiB0aGlzIGNhc2UsIGRvc2ZzdG9vbHMtcHRlc3QgUkRFUEVORFMg
b24geHhkIHdoaWNoIGlzIGJ1aWx0IGJ5IHZpbSwgYnV0IGFzIGRvc2ZzdG9vbHMtcHRlc3QgaXMg
bm90IGluc3RhbGxlZCB0aGVyZSBpcyBubyBuZWVkIGZvciB4eGQuDQoNCkEgbnVtYmVyIG9mIENW
RXMgYXJlIGFkZGVkLCBmb3IgZXhhbXBsZSBDVkUtMjAyNC01ODI1MSBpcyBhIENWRSBpbiBidXN5
Ym94IHdoaWNoIGlzIG1pc3NpbmcgdGhlIG1hY2hpbmUtcmVhZGFibGUgQ1BFIGluIHRoZSBOVkQg
ZGF0YVszXSBidXQgdGhlIENWRSBMaXN0IGhhcyBiZWVuIOKAnGVucmljaGVk4oCdIGFuZCBoYXMg
bWFjaGluZS1yZWFkYWJsZSBkYXRhWzRdLiAgSeKAmXZlIG5vdCB5ZXQgdHJpYWdlZCBldmVyeSBv
bmUgdG8gaWRlbnRpZnkgdGhlIHJlYXNvbiBmb3IgdGhlIGFkZGl0aW9uLCBidXQgSSBleHBlY3Qg
dGhpcyBpcyB0aGUgbWFpbiByZWFzb24uDQoNCkEgbW9yZSBpbnRlcmVzdGluZyBmZWF0dXJlIGdh
cCBpcyB3aGVyZSBhIHJlY2lwZSBzdGF0aWNhbGx5IGxpbmtzIHRvIGFub3RoZXIgcmVjaXBlOiBp
biB0aGlzIGNhc2UgdGhlcmUgaXMgbm8gU1BEWCBwYWNrYWdlIGVudHJ5IGZvciB0aGUgbGlicmFy
eSwgc28gaXNzdWVzIGluIHRoZSBsaWJyYXJ5IHdpbGwgbm90IGJlIHJlcG9ydGVkLiBXaXRoIGN2
ZS1jaGVjaywgdGhlIGJ1aWxkLXJlcG9ydCB3aWxsIGNvdmVyIHRoaXMsIGJ1dCB0aGUgaW1hZ2Ut
cmVwb3J0IHdpbGwgbm90Lg0KDQpUbyBzdW1tYXJpc2UgWzVdIHRoZSBwcm9zIGFuZCBjb25zOg0K
KyBzYm9tLWN2ZS1jaGVjayBjYW4gcnVuIGF0IGFueSBwb2ludCBhZnRlciB0aGUgYnVpbGQNCisg
aGFzIGJldHRlciBkYXRhIHNvdXJjZXMgd2hpY2ggcmVwb3J0IG1vcmUgaXNzdWVzDQotIG9ubHkg
c2NhbnMgdGhlIGxpdGVyYWwgcGFja2FnZXMgdGhhdCBhcmUgaW4gYSBmaW5hbCBpbWFnZSwgc28g
d2UgZG9u4oCZdCBnZXQgY292ZXJhZ2Ugb2YgbmF0aXZlIHBhY2thZ2VzIG9yIHN0YXRpYyBsaW5r
YWdlDQoNCkkgd29uZGVyIGlmIHRoZSBlYXNpZXN0IGZpeCBmb3IgdGhpcyBnYXAgaXMgdG8gZW5o
YW5jZSB0aGUgU1BEWCBnZW5lcmF0aW9uIHRvIG5vdCBvbmx5IGdlbmVyYXRlIGFuIOKAnGltYWdl
IFNQRFjigJ0gYnV0IGFsc28gYSDigJxidWlsZCBTUERY4oCdLCB3aGljaCBpcyBlc3NlbnRpYWxs
eSBhbiBhZ2dyZWdhdGlvbiBvZiBldmVyeSByZWNpcGXigJlzIFNQRFggdGhhdCBpcyBwcmVzZW50
LiBBIHJlY3Vyc2l2ZSBleGVjdXRpb24gb2YgdGhlIFNQRFggZ2VuZXJhdGlvbiB0YXNrIHdpbGwg
bWVhbiB0aGlzIGNvdmVycyBib3RoIGFueSBuYXRpdmUgdG9vbHMgYW5kIHN0YXRpYyBsaWJyYXJp
ZXMgdGhhdCBhcmUgaW4gdGhlIGRlcGVuZGVuY3kgZ3JhcGgsIGZvciBtYXhpbWFsIGNvdmVyYWdl
Lg0KDQpUaGlzIGdpdmVzIGEgc29sdXRpb24gd2l0aG91dCBuZWVkaW5nIHRvIGJlIG1vcmUgY2xl
dmVyIGluIHRoZSBpbWFnZSBTUERYIGdlbmVyYXRpb24sIGZvciBleGFtcGxlIGluY2x1ZGluZyBw
YWNrYWdlcyBmb3IgYWxsIG9mIHRoZSBidWlsZCBkZXBlbmRlbmNpZXMgKGJlIHRoZW0gbmF0aXZl
IG9yIHRhcmdldCkuDQoNCklmIHRoaXMgaXMgZG9uZSB0aGVuIEkgdGhpbmsgc2JvbS1jdmUtY2hl
Y2sgaXMgYXQgbGVhc3QgYXQgcGFyaXR5IHdpdGggY3ZlLWNoZWNrLCBhbmQgaW4gbWFueSB3YXlz
IGZhciBzdXBlcmlvci4gVGhpcyB3aWxsIGFsbG93IHVzIHRvIG1lcmdlIHRoZSBmZXcgcmVjaXBl
cyBhbmQgY2xhc3MgZnJvbSBtZXRhLXNib20tY3ZlLWNoZWNrIGludG8gY29yZSwgYW5kIGRlbGV0
ZSBjdmUtY2hlY2suDQoNCkFueSB0aG91Z2h0cz8gKGxvb2tpbmcgYXQgSm9zaCBhbmQgQmVuamFt
aW4gcHJpbWFyaWx5KQ0KDQpUaGFua3MsDQpSb3NzDQoNClsxXSBodHRwczovL2dpdGh1Yi5jb20v
Ym9vdGxpbi9zYm9tLWN2ZS1jaGVjaw0KWzJdIGh0dHBzOi8vZ2l0aHViLmNvbS9ib290bGluL21l
dGEtc2JvbS1jdmUtY2hlY2sNClszXSBodHRwczovL252ZC5uaXN0Lmdvdi92dWxuL2RldGFpbC9D
VkUtMjAyNC01ODI1MQ0KWzRdIGh0dHBzOi8vd3d3LmN2ZS5vcmcvQ1ZFUmVjb3JkP2lkPUNWRS0y
MDI0LTU4MjUxDQpbNV0gQXQgdGhpcyBwb2ludCBJ4oCZbSByZWFsaXNpbmcgSSBuZWVkIHRvIHJl
YWQgVGhlIEFydCBvZiBFeHBsYW5hdGlvbiBieSBSb3MgQXRraW5zLi4u

