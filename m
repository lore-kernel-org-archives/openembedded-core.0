Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49793CA1015
	for <webhook@archiver.kernel.org>; Thu,  4 Sep 2025 12:22:40 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.17])
 by mx.groups.io with SMTP id smtpd.web10.38020.1756988553646908817
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Sep 2025 05:22:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=LpJKgsOj;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=LpJKgsOj;
 spf=pass (domain: arm.com, ip: 40.107.159.17, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=WiRWgHINF4bili0y+JV56kbERMEin3tC3KyDnFs4wegCBu7Ew3yHgE6dR2XJgKhwsZqoWEZCGn0JVQn1XwzqBIvh9m4mtiOjSOeXDXWcXC+GReJY/9F0e/4Hh/GEL6SxdP9vtZN7UAuYYGL3+wumb6L+J7d2bRROPyUbfQ/aWgyDeW47n+khvsXPXjMauKZR5MlioUWn0wOEioXPWAMKjEiOCJ7/m5Bw6YgB4p0Vro9+ZOraO44P5GsHvJ2w9TMwuLqFXd92g09aC/wng9agdu/A8cx/WRvpjtTwImk0Z4EfLHhNI6kuBQnIvX7SKLw7cX0bzYIbDeTKoGwfENwTpg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Iq+XzrzP6OLzMsZoUL5Xj5/wOLN8J/g/7bJh3nyH1U0=;
 b=R0rMMLB5NRnfcQTFlqtmfYKDK5Gf/QSLAxIw2WlX8C9mWjcb0Wt718i0YFsPYioGpuyuwnOohfrd1Bmxvh/Fg5wuVuIBgCl/QCvYeteNL117RSL6N3CiAMXdY+XUeSybNMuddzdhplwO9DJ/5TwOVRHaGZbfduKt8TvMSY8CICu2oTzTbXpTwCbpiCGRbslqrreBPMZhBiIyromEzRoqFTeFdrcsWHRqkCTh0HxaDB/Zr8iUf4gs48ryyPVMTpIimepm1RAD6ZyR0IearPkMzPSmp9O4r0xAcwvpTyncKUs56ajI3gcxypHnSaHxDu6GKfzP8hjO9AIfIudet+3xTA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Iq+XzrzP6OLzMsZoUL5Xj5/wOLN8J/g/7bJh3nyH1U0=;
 b=LpJKgsOjZ2/YCIXbF3qiLFrLlfU1SKWqnsyUP/s5T1VBfdUQPG9GFWCKwiqpwXapJ2+Jkogd0EfmSqcz6RPe8EBqMaO4u1cBXKR4HaAXjwj/RVQZwSfO4jiOTHi0HnkaIjkQiHqDZg9HbZMNrOoMKXzoKEPZS0ysOruSjaMbrko=
Received: from AM5PR0101CA0020.eurprd01.prod.exchangelabs.com
 (2603:10a6:206:16::33) by DBBPR08MB10385.eurprd08.prod.outlook.com
 (2603:10a6:10:52a::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Thu, 4 Sep
 2025 12:22:28 +0000
Received: from AM3PEPF00009B9E.eurprd04.prod.outlook.com
 (2603:10a6:206:16:cafe::81) by AM5PR0101CA0020.outlook.office365.com
 (2603:10a6:206:16::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9094.18 via Frontend Transport; Thu,
 4 Sep 2025 12:22:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM3PEPF00009B9E.mail.protection.outlook.com (10.167.16.23) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9094.14
 via Frontend Transport; Thu, 4 Sep 2025 12:22:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c+49bfz5td6vBw7j7m7PeKRjK8l+fx9suluFlfPVKYbMEmhGDM0/BQ3ylo5V5o2if+e0UgBMY8/MdjerX1GEIuhqhbesU6mxz5Hyl2Y2niQOg96JaE2Jq4c97dEcWOOuG6ki7qed9v8F7utrMNdmaZPYEDygSNEsYCPxoNWsglPHv0PLcGpQkhrKXLfnptWrmCOpQ8mvf7oEwW0zn5ghmpNI8yRl2uXApsvGX0OpQzVBIyQaJATpv6P5Da5qDNVZdE5O1SHIPQ6V/iUjdiBKcBo59YdaPmiliOoByaM2F+gFJWzwn4Gv1Gb14oCkIUJQ3sNx5f7M/T8JXv2/Wkp4rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Iq+XzrzP6OLzMsZoUL5Xj5/wOLN8J/g/7bJh3nyH1U0=;
 b=b9H1UeJ+D9J5b0KpYSOaxfKj1JduzxhUX2ssAsf6BBNoNpoCEwXIa+quYYwJjhGaGL3Up3GWuxULzaWgdOgvQVZ/qLXB/zC4Xl+3Ptgs/9b3Vf+CrQOk/ojv4NgCPP/i7309bc2Ukt1ubdeV/cAcARIpBHog7J/SqFVXAu60T7AXAAJL1EWp5GvGCEzUSmW6JMQ1vBg2IXx07VHRBYNvWuiImWhetHjhV2gjKjpK3Nmq6/jd+EP5AL0VplZe+f+QGbN4M9c1lcmaWWaX2jANm4rj99TgA4KoRVYAwjIU97eC8oyXI1xxonyEKrAuKgCxWYbHLe4iXDrW4djzNZecbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Iq+XzrzP6OLzMsZoUL5Xj5/wOLN8J/g/7bJh3nyH1U0=;
 b=LpJKgsOjZ2/YCIXbF3qiLFrLlfU1SKWqnsyUP/s5T1VBfdUQPG9GFWCKwiqpwXapJ2+Jkogd0EfmSqcz6RPe8EBqMaO4u1cBXKR4HaAXjwj/RVQZwSfO4jiOTHi0HnkaIjkQiHqDZg9HbZMNrOoMKXzoKEPZS0ysOruSjaMbrko=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DBBPR08MB6073.eurprd08.prod.outlook.com (2603:10a6:10:1f7::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.18; Thu, 4 Sep
 2025 12:21:53 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50%4]) with mapi id 15.20.9073.026; Thu, 4 Sep 2025
 12:21:53 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "raj.khem@gmail.com" <raj.khem@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] python: Correct the upstream status in NODEV
 patch
Thread-Topic: [OE-core] [PATCH] python: Correct the upstream status in NODEV
 patch
Thread-Index: AQHcG7BUb0CLQTZfH06UPaKvKl/1g7SC9ZGA
Date: Thu, 4 Sep 2025 12:21:53 +0000
Message-ID: <31C35016-F8EA-4763-8274-4C229DF73079@arm.com>
References: <20250902022119.3497724-1-raj.khem@gmail.com>
In-Reply-To: <20250902022119.3497724-1-raj.khem@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.700.81)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DBBPR08MB6073:EE_|AM3PEPF00009B9E:EE_|DBBPR08MB10385:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d1c2575-24f8-4853-9473-08ddebadb5d0
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|366016|1800799024|376014|13003099007|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?aG1SNlNFYk8zSzNPLy9SSUorQm5pR0JabWgvdmNuOWg4V1NaZ2YzdlJJR3li?=
 =?utf-8?B?dDFJS0Q3QUdDZ2NCcWhVdWpTT1lqSkM1Q0gzOFhRdk5QQ0JoZTY1SWdnQnh2?=
 =?utf-8?B?K25Kd1lmWi9USzFjVnRoM1ZLMlRmb055bnpralo5aVJINnVGaURJaUVRWk90?=
 =?utf-8?B?MzRrR1BuWHYrOVFIZnl2Qlp3YWVLT2FGdkRNUkxWU1B4NHk4V3NnOXNwbHBY?=
 =?utf-8?B?RWMxTTdJa0tYVGZEc2ZGTkNEYXoraGpuK1pxZ29BTHU5T2pKbjRyNFlPYVk5?=
 =?utf-8?B?ekZqN0dXYld5NkhyN3k4TGEwbVRTMmQ3ZXBPbUQ3OFVxNVJ5QjlKLzlYWWsy?=
 =?utf-8?B?SjdvVlVMWXBIYm54UmtzbzNLQjllNmw1Q3pONHdZTXh6aytMSERObmFUaXR1?=
 =?utf-8?B?VnllUHdHcWtPViszTXN5aTJwaE9Ba0hQeGJ3SFE1THRCRzF4Y0RoblBHL2l6?=
 =?utf-8?B?OUFGN0ZzMnhmdU9jZjRpbWozMGRaMHdISGhBa1hKaXFIcXc3MVl3MVZLSkxV?=
 =?utf-8?B?cFZhVGh3NFhMYVJHMHVCSDBnN3lPUTloU3g0cTJlbFpPdEpRYy9YeEJLdkpL?=
 =?utf-8?B?ZzVmMEtCalJtWHBMWFMwUEtXQ1hnd3RTbUd2VFd5RzMyWG00UTl3dExpd2ZP?=
 =?utf-8?B?QXBZc213NE80VUlybjhOVTZCclRWaTRkYldyN2NId214Rk92MlRWekxxbFpW?=
 =?utf-8?B?dldwMEV6RVUzK1lGemJiTExsRUo1eEhHSWF0YStpQ1VRcFQwNlcwcmF2ZkMz?=
 =?utf-8?B?NFVLTFA3ZEpZL2RLckZBUHJwc1Y1c0FNWkpCYWZ5TURoZm96TDJIV3hUY1VI?=
 =?utf-8?B?MFZtSDNMYWNKa0xNbHRaRVVVcjBjQURuUERoQ1hMQWM1TWc3bkYwNGJXQ3NL?=
 =?utf-8?B?VmtiSWVCY1FVM1FOTkk2WmRoT3c3Qjd1KzdzbjJjcS9UYmNTdWJ1Yk9MRE40?=
 =?utf-8?B?TDZTUUtHdktneGM0OWl2bE96WlhyTWFzSUh5SUhGZEh3clBOa0xSa0l6dUJZ?=
 =?utf-8?B?bHBxTWJJMHNNV21QUmhCNm9rczd0NGxFOXZQZEd4bml3dG5LVlZILyt0NVBU?=
 =?utf-8?B?VFdHVjNpdkNpOHB1d0M0aHZlLzQ2a3RKaEdiRE93N2ZOcERRdFA3L1lINlpG?=
 =?utf-8?B?amVBaEhVNFVLeEpwUHFESVpvQ2ZYcXFCeTZQZUZpMW96SVhFeStXNkZzRlpV?=
 =?utf-8?B?UmErNzNGVmUwMXo1eDdXaEg0ZStYWG5LaWhMOXRuYXJMT1Q2Qmh6VmNDV3Vi?=
 =?utf-8?B?NWRHdXNQVUt2bFFKV2xoeldabFZkWE00SitITmM4SXYxWGEra200U05aUm9y?=
 =?utf-8?B?aXdtVTJSRVdwZlZ5L2xudXo1K3F2MkwyYU5WMzVPT0ZvajNIWWVIZkp3bUFX?=
 =?utf-8?B?RGxxdGhGeGJOSitPMmNWMklYWSs2MkoveWpiSnNTS1FCd29KcW54SEhrVmhW?=
 =?utf-8?B?QTBZZzAzMklxb08wVjRIMzJGK3J5NVpOdGhzQXBZK1ZNTzVpbUFFYmtvRlhF?=
 =?utf-8?B?Z1JkMjB3WSs2THJCQmM5RVR4bGdUOFRMd2pZRFBwcXpaa0lTdERKR3M1VWMv?=
 =?utf-8?B?RFA5clR0WXR1QUxKN2twMVhsS1M5TFluVCtiWnBrWjA0WDZkdTlwSm0xQzVq?=
 =?utf-8?B?SkNNdDlkTmZ0UHFES3lhcTArTTI1R05LenlyVmhoeHhiMWNZZUxyMFBiT0JU?=
 =?utf-8?B?WHZONEFJby9XZXFoMitZUk9WVk1xTit6L1oxUklBcDVCMG1VTUtwSXZjbHJo?=
 =?utf-8?B?d1ZGZlJ2eFBHZ1hhRkxuN205akY3aXBDejdJWjl5UFJRajNDOEtqWThCc2I1?=
 =?utf-8?B?MlYyOGttR0NTaEtPbXdtNlBlWjBjWFFGdUR2Q2xtbWl3MmcyQUZNRHhCcHZH?=
 =?utf-8?B?SGw4TGZPcS95OXByZGhheFcxWGZJQjlzeVMyTUVyamM5R0hGU2dvSit2ZDVI?=
 =?utf-8?Q?ExYnndJ0rqI=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(13003099007)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <675077956C99F849BDC1B592663A7E7F@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6073
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM3PEPF00009B9E.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	24dff752-2056-4eb6-24bf-08ddebada220
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|376014|1800799024|14060799003|82310400026|35042699022|13003099007|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?ZjFhTFBhWDhnM3hvVjJEV3d3OTRvRTQ0UkhkdlNUbVc3REkyeHBFTmE0bFhR?=
 =?utf-8?B?YldlSUJBeVpUSkNOYStBeEJrenBsdXFKMldVY0ZVRHBJSlZNZ3lmdGF6UUJp?=
 =?utf-8?B?YVhQSXZ2OHlacDdlRnIxUXhJeFRUOXp4S2FXemF4MUNNRENBVm84MlFCTnVQ?=
 =?utf-8?B?NHQvRHJ0MkM5ZHQ5dWF2WHdHdCsrOXNjYXl0UUVCSzNOQllQREt2NThRUDd5?=
 =?utf-8?B?OEp0RVdIalRoRlNKMjNLaHFmZHBEeEt0ZDd3d05FN0hLSHF5OXpmZ3JxQkxx?=
 =?utf-8?B?QStvR3dNSUFOeU5kc1FQY3FqSFFEMDZnTXRwemFqbGNibFIwOUtXR28zemtK?=
 =?utf-8?B?ZEVzdHpMbWRaYjlsZXRJOVZRc29tUU1CTjRXQmpMRCtWSUVmSlRuekNQM2dx?=
 =?utf-8?B?QmM2dHNRSzBaMi9ESTMvcnFuNDNCWmZuWjZmZ2d5ek5yRGVtUTNoRTV3U3Q1?=
 =?utf-8?B?dWJ3UG5kblcxbzVteG5qNkZMaGZFNkFSd1Qwb1AyVGpWc0Q1YUc5U2VMK1Yr?=
 =?utf-8?B?WGlnZk1MZlMraTczSUFsVUdHclJWWkVNRDc1WjJvSm03cVpxT3FQM1RVZzQ0?=
 =?utf-8?B?K1F5VWtsd2UvblRzSXRrNkl0VDRDZ0YzalJZK2ZkaUpoUmxqT3RKcU9DOFc2?=
 =?utf-8?B?S25CdzZMSEo5ZU0velgwV094TUF5cUZPQzJYQzlWMDFlYUZuVnRDT0hQeVow?=
 =?utf-8?B?cWRYNjNEK21TNFJ3blpQelFyMHFFTGoyZDl6akZQQ0xrRXZqd0J4MktHUk9X?=
 =?utf-8?B?RHRkYUtndXlmbnNVMUZrb016QVdIRDJaWFg1bGI2cE5wMk95SzV0cS9lbCtQ?=
 =?utf-8?B?M3Q5OU9KbnRmNHhxcjhVT3ZVL3dkcVNIaVhENFl3S1dwRmhTOTZsWm1ZNWRu?=
 =?utf-8?B?NTZEdEpLRFZ0NkMwZlRuVUsyZjlVZnl4SVJrQ25nZy9lTS9oa1hqMXdFMG00?=
 =?utf-8?B?YlVTdTVBd2pmYTUzZmFXZmEwTnVhbXRtREgvM3NSK3NuWTFobkozMjluT2or?=
 =?utf-8?B?NHY2K3NDK2lNNi9ZQktnNlFIeWN1ZXNLSGpYWUZvdWRTU0pTdUM1MWhQU1g3?=
 =?utf-8?B?V1ZJUFRERU4yNy8yOW5wcWcyNkl6c3pMczgzMGw0b1VFUXM0eGpYWXBrckVZ?=
 =?utf-8?B?T2RwSTJSZlM5ZWRpajFSRnJQa01NQnJGenltMy9panpRVjEwUlhCcWpKVHVk?=
 =?utf-8?B?M2R3UWVIUys0ZWJnSnFqckw4Y2QvS0ZPN1JRYkF3SUZ5MkVEKzRCN3JOZmFB?=
 =?utf-8?B?bVBKbVNhNDhURGJyekJxVzFFWkdVa1djK2VwZEh2ZHlxWXZEYk5DeU8vM0Nq?=
 =?utf-8?B?TW5OWUVXa2FLTFpReVZmSGZpQVR5ZHFnTDc3QlFCZ28zaVc2RTFuZktXVG5C?=
 =?utf-8?B?cmtHeGZmWjdQWThKaTJyMGEyRlBwMEFzNEVSalFzSmUzMWd2MmNTUDFZNXpp?=
 =?utf-8?B?SWIyVUpQVEo1c1FaaENsdk92cTFUS3VMUTA5VW1oRWhhVUpuVUF0eWFYV0Fl?=
 =?utf-8?B?WS9QT0Q4K0o1NlJyemFnSnRVVjVqRTlUbitrUGlGMFQ0K21QVmlySU5GdXg1?=
 =?utf-8?B?RU5ybXFod213MStkTHJsYTFiaGtMUnliSTA2c21WY1RHQmtGS3dheFo0NDll?=
 =?utf-8?B?YTgyNkJ2ZjQvYlZvYUtaaUZ0b0lzdDI4RUE3WG40Umxwemp3aWJTdWpnSzFS?=
 =?utf-8?B?OThVRFZHOUdGVnpjTThoU3pjKzFkQlNZdThTUEs4endNOGZTd1dlekZZcnJW?=
 =?utf-8?B?c1UrMTdqUDFtYUorUlp6c0RKbDNHRytPQUh1QnU0RStlSXVwaGZpUjlCdkdl?=
 =?utf-8?B?U2NOVGlPZEpvRG4zVEI3NTdIbERtSlRQb1lnT2ZCemhKOGR2OVZrK0ZrWUNB?=
 =?utf-8?B?S3d3Uk0vbllha2xlQmhUSkZ0K1U1ZDdCNGV3NmdHdGhQRWZhajVrSkE2NU1n?=
 =?utf-8?B?OUpHbGMxUmRtSGZzckZ2SHhKUTV5Y0R6Q0Jrdnp6UDRUYnVzQzExV2d4MkRq?=
 =?utf-8?B?ejhiOUNLeFRnPT0=?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(14060799003)(82310400026)(35042699022)(13003099007)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2025 12:22:26.8317
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d1c2575-24f8-4853-9473-08ddebadb5d0
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM3PEPF00009B9E.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB10385
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Sep 2025 12:22:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222922

T24gMiBTZXAgMjAyNSwgYXQgMDM6MjEsIEtoZW0gUmFqIHZpYSBsaXN0cy5vcGVuZW1iZWRkZWQu
b3JnIDxyYWoua2hlbT1nbWFpbC5jb21AbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4gd3JvdGU6DQo+
IA0KPiBFbnN1cmUgaXQgaXMgcmVmbGVjdGluZyBjb3JyZWN0IGluZm9ybWF0aW9uIGFuZCBzdGF0
dXMgb2YgcGF0Y2gNCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFp
bC5jb20+DQo+IC0tLQ0KPiAuLi4vcHl0aG9uL3B5dGhvbjMvdGVzdF9wb3NpeF9ub2Rldl9kaXNh
YmxlLnBhdGNoICAgICAgICAgICB8IDYgKysrKystDQo+IDEgZmlsZSBjaGFuZ2VkLCA1IGluc2Vy
dGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMvdGVzdF9wb3NpeF9ub2Rldl9kaXNhYmxlLnBhdGNoIGIv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zL3Rlc3RfcG9zaXhfbm9kZXZfZGlz
YWJsZS5wYXRjaA0KPiBpbmRleCA4NTc2N2UxZTg5OC4uZGY2MDMwMjUyMGUgMTAwNjQ0DQo+IC0t
LSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy90ZXN0X3Bvc2l4X25vZGV2
X2Rpc2FibGUucGF0Y2gNCj4gKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRo
b24zL3Rlc3RfcG9zaXhfbm9kZXZfZGlzYWJsZS5wYXRjaA0KPiBAQCAtMSw3ICsxLDExIEBADQo+
IERpc2FibGUgcGFydCBvZiB0ZXN0X3Bvc2l4LnRlc3RfbWFrZWRldiB0aGF0IGRlcGVuZHMgb24g
dGhlIE5PREVWDQo+IG1hY3JvIGJlaW5nIGRlZmluZWQgKG1pc3Npbmcgb24gbXVzbCkuDQo+IA0K
PiAtVXBzdHJlYW0tU3RhdHVzOiBTdWJtaXR0ZWQgW2h0dHBzOi8vZ2l0aHViLmNvbS9weXRob24v
Y3B5dGhvbi9wdWxsLzMxNzk0XQ0KPiArU2VlIGh0dHBzOi8vZ2l0aHViLmNvbS9weXRob24vY3B5
dGhvbi9wdWxsLzMxNzk0IHdoZXJlIE5PREVWDQo+ICtoYW5kbGluZyBpcyBpbnRyb2R1Y2VkLg0K
PiArDQo+ICtVcHN0cmVhbS1TdGF0dXM6IEluYXBwcm9wcmlhdGUgW011c2wtU3BlY2lmaWNdDQoN
CkNhbiB5b3UgZmlsZSBhdCBsZWFzdCBhIHRpY2tldCBmb3IgdGhlIGlzc3VlIHRoYXQgdGhlIHRl
c3RzIGRvbuKAmXQgd29yayBvbiBtdXNsPyAgKEkgc2VlIHRoYXQgYWxwaW5lIGFsc28gaGFzIHRo
aXMgcGF0Y2gpDQoNClJvc3M=

