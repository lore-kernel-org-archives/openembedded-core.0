Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E837CCCD1BF
	for <webhook@archiver.kernel.org>; Thu, 23 Oct 2025 13:26:12 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.35])
 by mx.groups.io with SMTP id smtpd.web11.20821.1761225967713393376
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Oct 2025 06:26:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=OfgHBx8M;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=OfgHBx8M;
 spf=pass (domain: arm.com, ip: 52.101.72.35, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=oN1X8MKJG/Qjnz7739gT3jQQ4CSVIznPDIdF9FQUe+dYjYOyqffdha9zCcYSWBXzswjzTbxM/Jo9Aj5TnbNe6RmApJpSfhiy+9CsMWYvgvsHsNxGMrGXLa8lwsYeWnukdL5wrxb1b3XbuYVz0Pbk104N0IVODQ/MEgq9XtjoduF0m6DpTjJA1jzdML4Eti7prajBr/F7KyQPS/0nD40LTmXEbAOkbwqzmfJAMk/5KDWaj9kALQWi1BU34S78YeW4xIPxR5nCs9PwvO9qC1ppVGB+zNbMKbJtKT8EHSsK1dH8iHnP6NApFM1EQBgwGo6PrZq1VWy7qYzy46BF+xLwww==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T5igEh2XomK3Eu/LFV2Bb7LupL7qom6m/yGRQ02zL6o=;
 b=kK8U4LT8X+LKWr50RaZg34Fpmf0zsYHKFkN6Fo0TMk5TLEPnkLC6rCPchvd92exfrzCpIl1BQJIwOmRtvdIfDvK5bqKxs7G4jC7syd/tnqX0OWtmjy7XnXRnhr9OGVsObvLGsKuTphB2lfhkwwPaHXkk6ppWOJOw83jnm3ZFzj0RPyG+L4EF5mnuzol/63wOCncvIQzPO8czCzkAe4VS8Y8n6rLMUCHP7c+wLDKWWmOUYTJlzl6Q44V9GIJzA7EYR1vtw85TM6Tvobjw8Ke1XfQrKqT9STbkgKHhAPC4w9QWN6xgfmkMU4wH73YF0t0bzklcAV8eRzLF18cs4w4ONA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=munisense.com smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T5igEh2XomK3Eu/LFV2Bb7LupL7qom6m/yGRQ02zL6o=;
 b=OfgHBx8Mhs7Ts9j4/gctL1JNB7Yf2djxB+KochBcyeTaNqVvX5RQ+Y1Rlei1Z0GiBPtV3bqr/aRSxhpyPkBUrAJ5B0VA5FqpAFDjEFTl+lbEikCNINAVdMKo3aK7zmb2xcZia4fVoLBsjK5ntFJXXJasb+cNaCgnodRF0zPh1Ko=
Received: from DU7P191CA0007.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:54e::32)
 by DB8PR08MB5324.eurprd08.prod.outlook.com (2603:10a6:10:11e::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Thu, 23 Oct
 2025 13:26:03 +0000
Received: from DU6PEPF00009528.eurprd02.prod.outlook.com
 (2603:10a6:10:54e:cafe::10) by DU7P191CA0007.outlook.office365.com
 (2603:10a6:10:54e::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.12 via Frontend Transport; Thu,
 23 Oct 2025 13:26:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU6PEPF00009528.mail.protection.outlook.com (10.167.8.9) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.7 via
 Frontend Transport; Thu, 23 Oct 2025 13:26:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rzN5kwcxShDK0tJ50LG+EmEaB4gLHDC+VSJKC0mR7zS9rytPwjcVLSlBZSlJRuGBMdpPlTWhAYk//0ZuvDQ/F3T0sc46j9N8qO9CNBnxQFaJVEyW1/Pauf8nDcnbzpMXlyWpyoBzlu8zo8fwolE5VgsT6TGxRnJF1bUHaON98LkZbfGmVEcl0Yf8EIjc52MBWr3SVBecob7qkrAyw8BCfzDZlj9HBHNwRqXa9lVu9SKrYjKytD9X4//jNrOSfhFGD+IEGuil2rmL5uYgotkc7/ZUMhrmsZAWQyHPf3yebJFV/7dg8kXaIRr9YvdGVZ+XukgscJpjR8UXvFXV/PTv+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T5igEh2XomK3Eu/LFV2Bb7LupL7qom6m/yGRQ02zL6o=;
 b=xSCn5J7SaA+nCqnnMldyhVevSq164qUsDttS6TdcKB06rk8yOQv+dh163eywwQ8S7KymzoD/wbVDH6PRQrajZfr342jH8XjTU78aplNd4JtTUx6Zghi8t8wuRzBICq04gaigvJr8lS6EyDwE+qVXkk/Jzh1TmM3b0KSWIOVYsD9gaW1nRdAIUxMQWREua6jTMJN5BbOXX4tqxr/3QjiqJLqoqXb9dhplcCWsmZaxjBGbfxIht+tiBwRYtmiivOME0a4XGCUn7WcsZsA2EvSwAtBWPZ2OqRmERbAjkrQ6FLHO0l1Bb2Q7ULFl8qD3+CR1PTqhR1Qf2TyWpM2PJyq99w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T5igEh2XomK3Eu/LFV2Bb7LupL7qom6m/yGRQ02zL6o=;
 b=OfgHBx8Mhs7Ts9j4/gctL1JNB7Yf2djxB+KochBcyeTaNqVvX5RQ+Y1Rlei1Z0GiBPtV3bqr/aRSxhpyPkBUrAJ5B0VA5FqpAFDjEFTl+lbEikCNINAVdMKo3aK7zmb2xcZia4fVoLBsjK5ntFJXXJasb+cNaCgnodRF0zPh1Ko=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS8PR08MB8015.eurprd08.prod.outlook.com (2603:10a6:20b:548::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Thu, 23 Oct
 2025 13:25:30 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50%4]) with mapi id 15.20.9253.011; Thu, 23 Oct 2025
 13:25:29 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "gijs.peskens@munisense.com" <gijs.peskens@munisense.com>
CC: Alexander Kanavin <alex.kanavin@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] Ubuntu 25.10: base-passwd fails to chown. (pseudo
 issue)
Thread-Topic: [OE-core] Ubuntu 25.10: base-passwd fails to chown. (pseudo
 issue)
Thread-Index: AQHcQzohPfYjs2KN2EO2/TddTZaKy7TOAuCAgABSLICAAWVzgA==
Date: Thu, 23 Oct 2025 13:25:29 +0000
Message-ID: <32D1EB3F-639F-45D3-BD4C-D5C6023A893E@arm.com>
References: <567bf317-620c-4f00-827c-50a511d431c7@munisense.com>
 <CANNYZj8WZ+hx_OvO+=m_JsayTZEB9GmC6ma4xEp-qPqXso=aog@mail.gmail.com>
 <e13e095b-3174-4f07-af32-b562ee3edc77@munisense.com>
In-Reply-To: <e13e095b-3174-4f07-af32-b562ee3edc77@munisense.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.700.81)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS8PR08MB8015:EE_|DU6PEPF00009528:EE_|DB8PR08MB5324:EE_
X-MS-Office365-Filtering-Correlation-Id: f79814cf-c6df-4256-1e2e-08de1237b63a
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|366016|376014|1800799024|38070700021;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?YjVCNVlRWWN4MWROakJ1SVIybURSbDUyTkVFTjZRU3pEQlhtR0FQWnhNc0tE?=
 =?utf-8?B?dGk5Z0dUeFl4aDQvVzZ5a2l3TlBGUElxM0lKRC9ZcC9LU2U4ZGNMZGszWXFy?=
 =?utf-8?B?cUV5dnl6VXdka2RZQUV1OEhtRFVPM3N5eGVOTEpaQ0hDVzVjVC9meHdETUVi?=
 =?utf-8?B?YkdSODVoMzNHZElUMk1idk5yekwwN1BnUFVDWThwd3NOUlBRMWRkdzQ1NnRK?=
 =?utf-8?B?RXNiTlRzWUdwNTU2d1B1U21jd3BKNVJCemZGVnFPdFMvdFdXbExPRHJCUFMw?=
 =?utf-8?B?VnVyZ1VNL3pGUXYrWmlsdjJLTk1aN0RYbVhlRlUxNTJvbnJ0UnUwL09CbGkv?=
 =?utf-8?B?Q1V4VlVFclpMcWJlTWpDUnVUaG1kUkpYR21jZzdpbTRhdEpQZ1hFYXdRVjdl?=
 =?utf-8?B?Rm5iam5zMWxxUm1nS1RSY0JIOFNlbUhVVTVTZFQ2Q1pEbEo1aWhhR1k0Lzd0?=
 =?utf-8?B?cHRHakhwRFhNbXd5QmxWMUQyRjRaN2hhckF1R1N3bTJRSmRoNldyRUo1ODhl?=
 =?utf-8?B?RW5iUjdPVkpoS0w0cXJhNS9SNjNqZ0I4UGQ1VGx3RHlTbmh1aGZYWks4YXZl?=
 =?utf-8?B?WDdNWGw4V1dUcmxMaU53dFRReEVaVXlLUkJrcitFZkxyd1U0MXlIOGtmZ2tW?=
 =?utf-8?B?RTJBOVZoZXhmc3VWeHJJNFcxTkExTW1zZDhXcGVDYmpFOXNEVnZjbEdkM0Fq?=
 =?utf-8?B?QStCQk9LZ2NraE5vRDUvTy9FODZneUtPRWR0aFp3TEk5bG40VFFXTmxKOTBu?=
 =?utf-8?B?Q2owNk1KWGFjWGJmYnlDUzhGMUM4aGlpM2RpMFNxWllIWTV6ZktKVXpBTUpx?=
 =?utf-8?B?WER6WEkxakt0aVRaNzh5ZnhGMThwamRrWWgxNXNzQ2xmMGNrdStSYlN2dXB0?=
 =?utf-8?B?c0tXWXViM0pENWVzcVFiR2J2dHQ4RTZwWGdIdE5RZk1zcGlsM2ZsbXUyOFhy?=
 =?utf-8?B?Zi9rcjQyejR0dzloYmdVbG52S1k3VjVFMVJyMUVVdWRMN0IvcVp2aVJuNW1M?=
 =?utf-8?B?U2gzWVgxZW94c3owVUx6Q1dhUFhkZUdsVU1WYys5VTIrd2VwdjBxSnA3VHRB?=
 =?utf-8?B?ZjdwN0RLYk5zSno1VUVKSTNDVW84RUM3b01UaEZYbXVaSmJRWW1NOFl0Mzhn?=
 =?utf-8?B?Z0kwTWtTS2N0a1BlQ2Vqemh3dnJDNTRkRU9MeGwzcDNqc2g4YzlJNUxCakZr?=
 =?utf-8?B?ZzF1K1lqWUd3RVZGOWR3cmpqNFBjcXppODlmUEwzMjBWbEU0aDF6UWphYjY5?=
 =?utf-8?B?WEhUc2ZRMjd6QndCc3ZlSWgxUWxWeWVzNlh6TDdKTXZBS2tJSXdwbDJSVE01?=
 =?utf-8?B?T3kybUZUWk9pVkUycWNOU3RKMEFDVmxmajIzUFBBaW5HUnlvbU9mZDVOODFi?=
 =?utf-8?B?VXJ6dGdycHByU3ZCUEZzOTAzdm1xcUN2RU1jVXhxaDVxeVdmUy9kaVZ0SU13?=
 =?utf-8?B?aEtVcXo1cHFQb2tpZjNSTzBQSkRnL2hYOTk4ZzFuS2p3dFRKZzh1VFg0NVBv?=
 =?utf-8?B?N1A1VmtNYmJkdUdNYjVtWXA1aExIR0EwVlluTll1TnkwWlJqaGZGQVE3Y25u?=
 =?utf-8?B?N2I3NkdScGtldk1SdWYxc0QzVTdpay9xTXlWQXpEcW5KTmppVURlbUZ5eWVH?=
 =?utf-8?B?V2NIbGExdWJZUlh3R1BIcDhUd2dSVWNSQS9kR1dDd1Y2dHZXcEp5SGh2c3hm?=
 =?utf-8?B?ZUpoV0lZb2d4ZmJuU0ROS1hEQkx0RmtXandhTndZY2hYVWZFb0RSSzBacHMx?=
 =?utf-8?B?Wlo4dHhkWHl6RnVTRmx1UFljczNWU1lnNHNJczN2T2d2bUplQjVlc2JNM0Uv?=
 =?utf-8?B?LytFMTRRRzFQY0M4azAxUldoYTZBK3h1eHF5K3FuQnVMOXYvOXJDa0I5TkZJ?=
 =?utf-8?B?T3lNSmpGRDczNWFGcm1qa2VtbXBFQ0x6eXdoZkw4V2VPaC9BaElVQTRBNGJj?=
 =?utf-8?B?Z2MyVUtVNXJJSlo5Nm9ocmRRWm9Sd0NvRXp0SVcwTHJtQ3EyWXVpWnRFSHFW?=
 =?utf-8?B?enFpZ1F2Q3ZnPT0=?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <5DAC14D93F21AB4CA6EA3ED329F4B47D@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8015
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DU6PEPF00009528.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	3adeccc9-a1f3-4097-ac16-08de1237a2f1
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|14060799003|376014|35042699022;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?YmlXMnZxcm5oUzlaZEIyaVVzNENIbnowSUl5LzdDN3Q1em5saVRTcGVkeEZW?=
 =?utf-8?B?NU9XUmhQNXo4ZGhiLzhHWE1nd3VkU09aWGNQckpiZ2ovQitaNmhUYVJqZThv?=
 =?utf-8?B?OU5HMTJacmJIS3JzVU9BT1ByNVc1SjlldG90K1VKTkNtSWU5OVBUZFg1WUdB?=
 =?utf-8?B?SVhjRGpHcTBJUm8yMzRuN2Y1S0UxSjdDRWkwRUJvZmpyd3owSUU2bC95eGhL?=
 =?utf-8?B?ZE5kL29BcThHZFM4QnlTRWFWTHl1QVdHdXFod2ZvbGlzRzZvbDBmeDBEdlRV?=
 =?utf-8?B?dWloK1JrZUpKRDcyRm1UallFa0F2ZGRjU1hNNndvWCtRMWhlWDdjRm4vYitE?=
 =?utf-8?B?M3AvUjhJTks4bUVMYUx5Y0k2Ull1cXdmNXY0WUxEY29XS1FVRWZnSmZRY3hF?=
 =?utf-8?B?d0VIYnpKZE4wWGlhckt1TEhRWU5xcE5NWXo5elZodDFzbGRxVE1hQ2g5bllM?=
 =?utf-8?B?YjV1TXlXanFOSVNYSW1GcDdLc0ZkamM1T2U0VWpWM29tT3pYMnJlcXVDMnE0?=
 =?utf-8?B?OXJpbEw2SWhxa05OTXJMdkhmajc3TlE2a1N5aFBSSkFEVTlYVzlhT3Z2YjlI?=
 =?utf-8?B?Q29jMHhJaDNtT0U5VFgxb0d3Mmd6VzUzeDQwVllka0VETU92eFJuRHg2NjNo?=
 =?utf-8?B?bkdsc25KWHVWYTI4NnFhc1RlRkovMVJxRDFYbTliR0tWUmMydTVBNFZuNlkr?=
 =?utf-8?B?WjBBRFFIemJDL2ZQdzJHRC92RnNxQXlxMXN6eGU0QVl5dStlKzhRQkZCdXU4?=
 =?utf-8?B?ZUxoUDM0RlpEQnVhRmtmWld1amxxRFR1azRPWmdrZkpsVTRUNU0zNSs4NVJI?=
 =?utf-8?B?ZHMvWlZRaUVMcHc4SnZ5YWFZVXZrZjlZVi9JZGFpRkFZWGNvckVXcnR2T3Vr?=
 =?utf-8?B?a3Y3NFNSaWNVaUhmWUJyVGJCc2FkV2l5dUlOVzBtNnd6UVZwMGc1UEludHN4?=
 =?utf-8?B?dGl6VFdMRjFqQTJabVlTSXBuV1BOd1pGRGoraFNZWUdDdGhnbi9LMW1FU1po?=
 =?utf-8?B?dkZCOVBicDV0QlQ2cFNzdk1KV3hxT3B3MGFLcnhKMHRXK29CSzJkT2dacmFX?=
 =?utf-8?B?V1ZtREg3bi8zU3U0Z3NWUzlEcXZLaGpCWDIzSHlDMVZoWWovRUJITFlhZWRH?=
 =?utf-8?B?Y2Z1SHpJM25Hb3RuRE5Sb0NmSWtCSEd0Y25pbXVsTGFlZURRaU1uWUo3Ni9V?=
 =?utf-8?B?L0JwblppV09EZ1B3OGtHUDBWeWcvUmxsY3FSalFmWWh3R0ZpUWtXQXJZelVs?=
 =?utf-8?B?UzRmT3hrclpkVVFQMTl3TVh5SjN2dWNFTDVKU2M0ZFlncUU5Q2k2aWtTTlFn?=
 =?utf-8?B?VjZJSDNNTnorWFBLKzMvV0NBVnZ5QTl6c01JcWlvT1dtMTZiZDlDZU1jeTZh?=
 =?utf-8?B?NW9wY0ZqK0h1STJ3dHRweGd1UE9RKzcrR05aVjk4QWN1QjU0SUNMK1pjeDdP?=
 =?utf-8?B?dUZISFk5VGtHd3BkcDBoQUJtNVY2WnovUXgxNEUybnB6WWUyREF1ZTdSVVBj?=
 =?utf-8?B?OUFuY0dIN3M0Z2xQWW43bWNJOWpidXRSUVhGWTNIczgvRFBwQlpmMEtzZTlH?=
 =?utf-8?B?UGt5YTN1ZlNvUmJGeUkrbFJBdVQzQllCWHhtU2NGTWpPU0RCZHFtcXNaMzQv?=
 =?utf-8?B?bDFCMmRKUkxKbkZaNVF2S0YyM0VnaHgxN1BCenBsc21QdzVtOXUxeW5kVHRC?=
 =?utf-8?B?R2M0RURpYnlGUHp6ZHBIUGQvVDBzVW1XNDlFdzFmNEF6TEdXSU9ZM0dYdVRn?=
 =?utf-8?B?Q1BsTktpSlVNdmlLN3MybFpiUExqbGVoQURHMDFiTnF5VnhZUzFIc0U0dVdo?=
 =?utf-8?B?VEZPZVVyY2VPaFJkeVdsVGMxdWlhRkJtZlVsNUUxY2JER0RuSVB4ak1JY2NR?=
 =?utf-8?B?VnJDTytNaUQvS2ZCaGt4elYxbXorb1VWdkVOS2VuRTUzSDZFV0tvc3ZJVGV4?=
 =?utf-8?B?L3hkeldiS0RzVnA3VkNnTllZaXhyeFY2RThVcjF4bHNvTWFsRXZkTW1WTzB5?=
 =?utf-8?B?dmxTVWozOHZERUVGZDYvb3NpbE5aNERmMUVTd2ZmN241OG5kVmQvVU9PVmYy?=
 =?utf-8?Q?T61kXb?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(14060799003)(376014)(35042699022);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2025 13:26:02.1936
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f79814cf-c6df-4256-1e2e-08de1237b63a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU6PEPF00009528.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5324
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Oct 2025 13:26:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225258

T24gMjIgT2N0IDIwMjUsIGF0IDE3OjA1LCBHaWpzIFBlc2tlbnMgdmlhIGxpc3RzLm9wZW5lbWJl
ZGRlZC5vcmcgPGdpanMucGVza2Vucz1tdW5pc2Vuc2UuY29tQGxpc3RzLm9wZW5lbWJlZGRlZC5v
cmc+IHdyb3RlOg0KPiBPbiAxMC8yMi8yNSAxMzoxMSwgQWxleGFuZGVyIEthbmF2aW4gd3JvdGU6
DQo+PiBUaGFua3MgZm9yIHRoZSByZXBvcnQuIEkgd2FzIGRyZWFkaW5nIHRoZSBkYXkgdGhpcyBo
YXBwZW5zLCBhbmQgSSdtDQo+PiBzdXJlIG90aGVycyBhcyB3ZWxsLiBDaGFuY2VzIGFyZSwgb3Ro
ZXIgZGlzdHJvcyB3aWxsIGZvbGxvdywgYW5kIHRoZW4NCj4+IFlvY3RvIHByb2plY3QgaGFzIGEg
cHJvYmxlbS4NCj4+IA0KPj4gU2hvdWxkIHdlIGJ1aWxkIEMgYmFzZWQgbmF0aXZlIGNvcmV1dGls
cyBhcyBlYXJseSBhcyBwb3NzaWJsZSwgYW5kDQo+PiB0aGVuIHVzZSBvbmx5IHRoYXQ/IFRoYXQg
bWlnaHQgYnV5IHNvbWUgdGltZSwgYnV0IGlzbid0IGEgcmVhbA0KPj4gc29sdXRpb24sIGlmIEdO
VSBzdG9wcyB0aGVpciBkZXZlbG9wbWVudC4NCj4gSSdkIGd1ZXNzIHRoYXQncyB0aGUgbG93ZXN0
IGVuZXJneSBhcHByb2FjaCwgb3RoZXIgcm91dGVzIHdvdWxkIHBvdGVudGlhbGx5IGludm9sdmUg
d3JpdGluZyB0aGUgdXRpbHMgdGhlbXNlbHZlcyB3aXRoIHBzZXVkbyBpbiBtaW5kIGFuZCBjYWxs
aW5nIGJhY2sgaW50byBob3N0IHV0aWxpdGllcyB3aGVyZSBuZWVkZWQuIEkgZG9uJ3QgYmVsaWV2
ZSBHTlUgd291bGQgc3RvcCBkZXZlbG9wbWVudCBvbiBjb3JldXRpbHMgYW55d2hlcmUgaW4gdGhl
IG5lYXIoaXNoKSBmdXR1cmUsIG5vciB0aGF0IHRoZSBhcHByb2FjaCBvZiBidWlsZGluZyBuYXRp
dmUgY29yZXV0aWxzIHdvdWxkIGJyZWFrIHNpbmNlIGl0IHNob3VsZCBtb3JlIG9yIGxlc3Mgb25s
eSBkZXBlbmQgb24gdGhlIGxpYkMgYW5kIGtlcm5lbCwgdGhpbmdzIHdoaWNoIGFyZW4ndCBnb2lu
ZyBhd2F5IGFueXRpbWUgc29vbi4NCj4gDQo+IFBlcmhhcHMgc29tZSBtYWdpYyByaWdodCBub3cg
aW5zaWRlIGJpdGJha2UgdGhhdCBjaGVja3Mgd2hldGhlciB0aGUgaG9zdC11dGlscyBhcmUgdXV0
aWxzIGFuZCBmYWlscyBlYXJseSB3b3VsZCBiZSBuaWNlIChhZ2FpbjogSSdtIGF3YXJlIEknbSBp
biB1bnN1cHBvcnRlZCBsYW5kLCBlbmVyZ3kgc2hvdWxkbid0IGJlIHdhc3RlZCB0b28gbXVjaCku
DQoNCkkganVzdCBmaWxlZCBhIGJ1ZyB0byBlbnN1cmUgdGhhdCB3ZSBkZXRlY3QgdGhpcyBhbmQg
dGVsbCB0aGUgdXNlciB0byBpbnN0YWxsIHRoZSBHTlUgdG9vbHM6aHR0cHM6Ly9idWd6aWxsYS55
b2N0b3Byb2plY3Qub3JnL3Nob3dfYnVnLmNnaT9pZD0xNjAyOA0KDQpCdXQgSeKAmW0gY3VyaW91
cyBob3cgVWJ1bnR1IGlzIHN1Y2Nlc3NmdWxseSBkb2luZyBidWlsZHMgb2YgcGFja2FnZXMgd2l0
aCB0aGUgcnVzdCBjb3JldXRpbHMsIGNvbnNpZGVyaW5nIHRoZXJlIGFyZSAoYWZhaWspIG5vbi16
ZXJvIHBhY2thZ2VzIHRoYXQgbmVlZCB0byBiZSBidWlsdCB3aXRoIGZha2Vyb290IHN0aWxsLCB3
aGljaCBkb2VzIGludGVyY2VwdGlvbiB0aGUgc2FtZSB3YXMgYSBwc2V1ZG8gZG9lcy4gTWF5YmUg
dGhlaXIgYnVpbGRlciBqdXN0IGhhcyBjb3JldXRpbHMgaW5zdGFsbGVkPw0KDQpSb3Nz

