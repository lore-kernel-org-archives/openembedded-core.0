Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2B47CCF9EB
	for <webhook@archiver.kernel.org>; Mon, 27 Oct 2025 17:39:36 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.46])
 by mx.groups.io with SMTP id smtpd.web11.39173.1761586771655082635
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Oct 2025 10:39:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=P0D7VpYz;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=P0D7VpYz;
 spf=pass (domain: arm.com, ip: 40.107.130.46, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=OP6RlsjtNO9Nz0JogW6KQnKvBTrmcW3LNfN6KxPeW4nUktjJYf5cExBt7yW8skRRaDPl1vrqUfi5fmPXlwMsEKeFY0W5/rJHa0cnIFKn/X1Cz9y2TcxPFiJ0ZaWqm4he+3/eeNM1imIzbwswdQ1+fgwni9sB/F5IJShZ41ZWaraOSQA3rwUkGFNI99kovpOn8O1GBmxfFucVhxg7Xj23YEEypI68K8+qAi8+tA2XZX5ZTQT+XS9qsrSwne1Mpxmj3u3F/EpI3owNGvwF9zOUtyJqCKTnc3YXVHRO6EeOq1NQ0YLbQXUxL2a13uESuXDg2qxv+3MGkL+umly0VGoGtg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yucnnvy0U6V0qP6sLYXMwKmlktCHkR0IeGF6g5aaGz0=;
 b=MsHH3PiRg/z3NWr4xl11HeHCSJPGZgW4tBjKuw5FYYZM59yp8FF+KoiBmmKSKrHUQWa4HOwoYx9/5tkXaTDzViYsKHM6VmA/u3CAfvl258qz8rO5QgI5eayoM6j9iOLpN+EPOeePp1RgXSU+hdZsltmdEBnqjP+jCAvRxLhBt2/DpfGoQ7SBHe3RB2602Gu6QeSdMBcYXGGbj+RNK2dxozGA9drb5HPXpEwj7p1djOzz3UgO73IT5NriWN3kA46xS6Yk+jGa2/GCCObrWGTkO5MNy8bHi475PZDJg87K+2r5jc3h2lEoIIVpDXf2ffAc3L40qCbw5KxKNYk1EC7yNA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yucnnvy0U6V0qP6sLYXMwKmlktCHkR0IeGF6g5aaGz0=;
 b=P0D7VpYz+I2BOulq1234BMzQO+WRJHd9q79eaq44sgcbf0xUwXD/uC25POLP6n2f2/ARZctXv+6S3bcXRhfxetHSDox0evxSAsFpR+Udw5LHbufY6hUeU/FdkmhexqXJJHRMwb43O0BKaNH1E/IOCb1i/AhrgkwoK1YiHG62G00=
Received: from AS4P190CA0012.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:5de::12)
 by VI0PR08MB10509.eurprd08.prod.outlook.com (2603:10a6:800:1b9::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Mon, 27 Oct
 2025 17:39:27 +0000
Received: from AMS0EPF00000195.eurprd05.prod.outlook.com
 (2603:10a6:20b:5de:cafe::10) by AS4P190CA0012.outlook.office365.com
 (2603:10a6:20b:5de::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.18 via Frontend Transport; Mon,
 27 Oct 2025 17:39:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF00000195.mail.protection.outlook.com (10.167.16.215) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.10
 via Frontend Transport; Mon, 27 Oct 2025 17:39:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g5NyAP54C0swoKjeQnh8mSbDh7YXrWy+8js4cYjddMmSicU7EGrp0NdtsVJQ0G3w0zs1Thc/Mqfa4Au6h1uvYqwJCi0Gb4Q41fBXeLXGvOmm07efKBMsJmHlzpaXoT3RGPwDh9z7pVfYvh4Hhlx8+h3nymykPnKd184yj3srFCKIbnjrfTq6QhvhwlyVKOYAmlmqCb+GpnYTVL5fFgJFbSYgdmiCN/fgmAsZlW3ELWUtq5ImIu3Jl6a81p0ccEbWYLlZpX3UOL7WurmZwDy5DsrhUic+Fb7SGpxfW36x8ARkx8gGmJzwrPRB4zSOb9IaR3iOxuw0xIkZJHZlGTPAyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yucnnvy0U6V0qP6sLYXMwKmlktCHkR0IeGF6g5aaGz0=;
 b=MuP07b197e8ZX9ygwGP/uzNcQVF6YQIK2wuFY262gmkOvzhRiq9xS369x8dEEBXvEqI0DBR1X51tq/kE+++Ruud+5bH3CHsHiuMmw4unu6CD4BXoCbVhCrffc8nmuKy9zd89zf2YyYETORekyIX8i2J0h4DyCPaMIKZczl9zKFOBkpmfls5Uym5/eWcpmVj+Gk0lePtjfi1ObqbR/pWQnBhBgCljhKsm7oXXuA4qisH+LGVrnsjneKCPxh4YL5p7XIjDhexrd+mNsM1WyW/nra/MjzMEA5SCnAdErZI1cynstJQV83wlSGiMgkQBZbZtTtbi8rdev53CFOaSg9SrSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yucnnvy0U6V0qP6sLYXMwKmlktCHkR0IeGF6g5aaGz0=;
 b=P0D7VpYz+I2BOulq1234BMzQO+WRJHd9q79eaq44sgcbf0xUwXD/uC25POLP6n2f2/ARZctXv+6S3bcXRhfxetHSDox0evxSAsFpR+Udw5LHbufY6hUeU/FdkmhexqXJJHRMwb43O0BKaNH1E/IOCb1i/AhrgkwoK1YiHG62G00=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DU2PR08MB10232.eurprd08.prod.outlook.com (2603:10a6:10:49b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Mon, 27 Oct
 2025 17:38:48 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50%4]) with mapi id 15.20.9253.017; Mon, 27 Oct 2025
 17:38:48 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "skandigraun@gmail.com" <skandigraun@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] tar: use diffutils for ptest instead of busybox
Thread-Topic: [OE-core] [PATCH] tar: use diffutils for ptest instead of
 busybox
Thread-Index: AQHcQ4yXP/DWkBHuJUmP/cZ81ERsirTWSfOA
Date: Mon, 27 Oct 2025 17:38:48 +0000
Message-ID: <AD10B0FC-5551-4970-A2CB-544018F83F32@arm.com>
References: <20251022194628.2462629-1-skandigraun@gmail.com>
In-Reply-To: <20251022194628.2462629-1-skandigraun@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.700.81)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DU2PR08MB10232:EE_|AMS0EPF00000195:EE_|VI0PR08MB10509:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b779866-9ac0-4685-4ad4-08de157fc584
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700021;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?NGFWVHpabXVmdXF0cDVyZUx3ZXNoVFQycCtkSHB4U1VOdXV2R0lub3lyL2Iv?=
 =?utf-8?B?ZXlzQmdTMFErZGEyMzBOQTROUk5VRURaRnlVWXVyZm5LQU9hd2FXeDNodDZK?=
 =?utf-8?B?RGlHcGZZenYvanl0K3hhN2J6T2J0WC9wS3oxQ3ZERmhSSFNFbGlQQjEyZ0pa?=
 =?utf-8?B?blBoRGtsZ1Jia0xsVFFWQWQxZWE0ZE1RQ1drT05FemhYKzluUVBSZzRURTdi?=
 =?utf-8?B?VDdrcXdOVXJJR1hsOGd5Q1oyRFJobDJHVUEvaTM1SjFwT3psbGJjeWxhTmIx?=
 =?utf-8?B?TmY5cEwwa2lrN0VZTkk4eWZxSHVJRHRucnRqRWJ1NStnd25Qc2NGeVRoTjBy?=
 =?utf-8?B?RTJMM3pmUnRtUnM1bmk0SStQU3A2WXM3RkNIRHZKRXJtZlNsY2pIclZUZ0lV?=
 =?utf-8?B?QVljZjdJQTJ0dm1ZUHhvd2ViRnQvWFE5YXAzVWFzM3ZJWStDbnFwNno4Wlo2?=
 =?utf-8?B?eHlrUWJMK2EyRldiN1dCRUFLMDIzeHhLZGIzcGFhbUlEcVZXTGhxbEJpbDhI?=
 =?utf-8?B?SmYzbTdiRFZXZFhma0tlL1FNNDhhQ2Q4VDloajBMbzY1Vk43QjFaRlVpN1k5?=
 =?utf-8?B?R1lzNGVCbkJNS0NqdkV1NDdUa1g3a3JyRnEvTFlpR2Z0dzA2Y0FOQ0ZQcWcx?=
 =?utf-8?B?Y2RLbEhzSjB5d1FqYkhJOVRESzJJWndQS0ozdzhEOUdKMEZaTkwvYkVOT2x4?=
 =?utf-8?B?MjJTb3dPSUFQQ3lJMFdYemNKTlNpSThxKzU1QnpwQ2IrdThSMDZTYmJwK3RN?=
 =?utf-8?B?YVY2UVpxQWFCNEtQZ09ESklpdlo1ZEJPZ3ZXSXh3dHp0cFVEQlZOeEJzbzRz?=
 =?utf-8?B?MG9BNWwzbXQzZEVubG83c2QvL3NCTEpMNHZwM2d2WTdCSjFEYmdEckJ1ZjIv?=
 =?utf-8?B?VFlpYWxwWTFXc25RcnM0VkhlNE8yc1hNNzVVTWFTZVl3L2tYM2R6OWZhT3Z6?=
 =?utf-8?B?MzIzYU81a0ZPcEQwVDFkSU9IK3AxVWZINnNuZkd3blVxZEREWHpORUpYc0FT?=
 =?utf-8?B?bzE4QWhscUhlclVlVTkyOEwvaFg1bStZOFNuNExqSHFuY01WUW41L3NYN0Rj?=
 =?utf-8?B?V1pzaVdNZDFTNi94MnEzWk04dEUzWTZVbXAvQnBtSmhESEFQeUpNTUtTN2w4?=
 =?utf-8?B?L0lmS0MyR01KU0hja3pVOTRKTUxqQmxiQXVYUDV3UVFjQ0pKY01xMlY0S3Iw?=
 =?utf-8?B?di91dmp6bGliNTI4Y2JERXMxZkNkKy82U1kwZFpCSit0cFRORVluSThyNVA5?=
 =?utf-8?B?ZFg3Vkg0eklRS0h5WUp3WWNsT1lIM3lrRUtFNVlIbDZQeWpWbU9TaU1xNUtL?=
 =?utf-8?B?aXhDc21PS3d3YW9CQm9ycXRiZ2N6bG5PTDFuTkNoWVRqR1VXTEdXUHdqS2F4?=
 =?utf-8?B?N2lucTNRL2p4empteUFhdkNSUnNHdDArYkZRT3J1bTJuSlJzOWhrWk5SajZJ?=
 =?utf-8?B?RzM5WmM1aEsxYjVwSE1JZmdjNjVvRklMc3BBZjFrL3JnTFZFUTA1ZnYwV3Nl?=
 =?utf-8?B?RWtGaGU1ZEM2bGlhdEJVY0c2Mm1tcmJwWGxPNUx5WHRQWUdqTVB5K1VmdFVh?=
 =?utf-8?B?V2pvVi9kMWpobEhiRXlISVM1TFBzZDJBT2hVN2p4dXBrOVprTnRldE1lMHNP?=
 =?utf-8?B?OThjcjdsUmxidDlWWmZCUnNxUW05cXpLL3ZzbGQ4V0IzK3BEN091TmtxVk16?=
 =?utf-8?B?aU02V2h5L2pPcC9nbHErWGh2Y3l1U2w0VkJFQnRucjVLUXFvUGd2R1EzeTBy?=
 =?utf-8?B?OHhjcnpkMWNaS2VoaElkMVI3WFRWUWZqS1BtMUJjN2N6dnRJY1RiK1p6T2VP?=
 =?utf-8?B?SEEzUjltNmZ5NjZwcDZPNXVIalhuaXNHT0ZjVm1OWW5melJEZTBXYnJoN3lv?=
 =?utf-8?B?RFVoWk5KZW1iRXI5dUlzTmNORitLRG5HWmlOTGQrSjZRNFhETmJqY3BOVDBs?=
 =?utf-8?B?ZkNrK0Y3ZTFWakI3REcrN0lWdDJOME03UXpyK1VXZWt2M2h2QmwvVGNJNHpy?=
 =?utf-8?B?VVkrbHJmU2ZIMDBNbi9YZjliVzQycnZCUkRtSWhjM2pOTzRuMm82SGZNQVpO?=
 =?utf-8?Q?LiDJ5b?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <CB2686FF3F2D3E4B923EB242674C4B5D@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR08MB10232
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AMS0EPF00000195.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	89b84a95-f3ec-4194-8a03-08de157faf7f
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|14060799003|376014|35042699022;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?SVh6L2M5aDZMR1JFcFNudlR5THRrd2VlWmhqM0R3K2FoZ0YxS09GejBTMFJN?=
 =?utf-8?B?cjJYOHp6QXF0dThFOG5OeVZ1ZVlyNnJ6M2dLeWRubmtJbVhTSlpXSDVuSWRr?=
 =?utf-8?B?cWRZM1YrR3ZmSFBqb3IxUk16ZjVDN0M4YUZic1FFNC9NZ0dGKzNXN3NJcDJr?=
 =?utf-8?B?YWx4Qyt5ak5rQllqUHdUU2hwL0I0c0hjaGczOGFzV29GL3lDY3RWcFV5Yndq?=
 =?utf-8?B?UGJKVEF2bVJqTFF6YjhiVUJEL1RrTS9waGJibnJzWHpnRVdhb2cxQjcxZXdL?=
 =?utf-8?B?dEVJNEh1cUpLdkRUQlJwQjNxdTBQZ25TOHp6SDFDVE04WjFBc2dWWWRlbVFs?=
 =?utf-8?B?TG1OTFQvbTlqYXh3RC9RRVY4aUNsaVhRODVlQnE1N3V6cWVhQUZIRFBzUjVI?=
 =?utf-8?B?UE04R1Exa0V1aExEbmRmdWFYek1yTDR5T0xheDRaeEJhK3N3NzRqYXBlQ1Bs?=
 =?utf-8?B?OEhTMWxvMnJwTVlUWnBOcVJPUS9qbHl5VkkzRFh0WW8rbSsydnVkK1pxRnZk?=
 =?utf-8?B?bnBldmNRVmJXZkkwN1d3alMwem50SmxxS25CeThVUnE0L1dmK1Q3Y3hWQ3R4?=
 =?utf-8?B?NWF5ajRieE9xNHpsa2pIK0t4emplT2V6SUNlaTJ0RmhQQy9RWWN4TUV0TDdl?=
 =?utf-8?B?d3lwRzlyQ3lXR3VVaVYzK0tVUDVIbDIzUXI1NmQ4dTA0V1o3SmRYVmpYQ29W?=
 =?utf-8?B?eTR6UmRqMXN5cGxzdWV3UjhGOUlRYlhKQ25kWmlOOTlvTGtueXhKV3ZMT2Rz?=
 =?utf-8?B?ZmtyMWpkZnhCL0Fva1FhbjBlVzd5WjNEamJSZmNMVW9xZHhIdCtXZ3czQTNi?=
 =?utf-8?B?MmExWmJaRWZXVkhHVzNlaS9ZVDBnaERZM3VKTzN6VDVFM2wzQUJzUXU3ZEtt?=
 =?utf-8?B?MzFnVm5ZVHFmeWxIclFqUGFiaVdFb0I2TzRhaktOZGVHNzQwVUt0VXh0R01v?=
 =?utf-8?B?bDVydXRFVSthS0lYeFkvdmE3aFZ2a1lZMTRFZWNsaDlYRWZVOXF1bGkyTGZ0?=
 =?utf-8?B?N1hkMlQ3aHZjMUJWeGFVZlczZWF5c2I3elhybWVMWlh5R1NEMUprQW5ZZFJE?=
 =?utf-8?B?Z29HT1BmZ0I5RFlOMG1iLzI0TkdoaE9WQkRVV0FwcnhzWkl3Z2NtY3h4bjgx?=
 =?utf-8?B?ZS9RTWgzL1EvRm5NSnB0dGVlcFhHR3dodXE4T1F6NkdVRWJyUFRGMDd5YWxt?=
 =?utf-8?B?dVYrM3hWTDc5OThtdjVseG5yTWNqNnRMWEFzbUVZVnBjTTRLaGs4cmpCRnZT?=
 =?utf-8?B?WkE3SFBzdHI1Y0hMZm1aSUd2c2Fabnl0Y0FDYmhqa1BiVXNoNFozUjJwOEFK?=
 =?utf-8?B?RXhVcUxBbHNTWHVUNUk1Mi90TzM5QkNWZFhhNlpwYkk3MFJsVWhRa1JTQVl4?=
 =?utf-8?B?RDc2YmRLSGoydERtekVObGdNZW9UMVdOMzBRNzFkR2VPTjJXVlA2QWxaQklp?=
 =?utf-8?B?SlRZamVFOFhiSzA5NDZhOEt0eWZNMEc1d2ttWlkrVGhVNWdrR1hub0VNSWhZ?=
 =?utf-8?B?ZmpzZ1F2VmJvZ2FJVUFybExKT0cySlZ3ZEFtdUxPQjd2Wmh5UzNOODRUWEVD?=
 =?utf-8?B?MTFDWlFQdCtFczRYOTdndWVBNFF4cHNzbzMySWZ1NkZWVXFoVy8vUUFmbnho?=
 =?utf-8?B?L2JLOTIvKytyK3kvMEczcmFWWFMyQlhxSHdFU2E2VWhZL2c5MmxEall4dUJC?=
 =?utf-8?B?TGJFaGg1NTNzVlpMeTZrWVkvRVpuWVQxV0ZSa3k2dUJyZkpKeSsvYlRCSCsx?=
 =?utf-8?B?aVV4MWltNnJ5T1g4SUp3WkJJVU41V0pnQndURFB5NEpQeWgzZXhESEdiRG1n?=
 =?utf-8?B?R2NybC9VUmliOGhveU1LNkhabVdORDB6Q2svZmtXbGdOMm1MLy85a0tmTS9C?=
 =?utf-8?B?eVExVDlPZHlIYzRHaHJZd2xPZ01NT2pPdjlwZVpMNXNXL0pMMzlCN25reEVv?=
 =?utf-8?B?MEM5MEw3RTdOQUxybjNzRXFWSWR1YkFqdS9uWDUreEFheDJGb2Z0VHZEb0RN?=
 =?utf-8?B?L2pPNnp4MHF5Q2lwMlJvU1ZDWmxIemQwTERLRU5LMWN6cDFNUE5Gcm5kUklQ?=
 =?utf-8?B?UHN2ZFpIZXhPL3pSRjVpS2ZmMnNxQ2xESEZjc2NGUmFNMFhhSkM5d1pzbE0r?=
 =?utf-8?Q?L58o=3D?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(14060799003)(376014)(35042699022);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2025 17:39:25.1609
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b779866-9ac0-4685-4ad4-08de157fc584
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF00000195.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR08MB10509
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Oct 2025 17:39:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225342

T24gMjIgT2N0IDIwMjUsIGF0IDIwOjQ2LCBHeW9yZ3kgU2FydmFyaSB2aWEgbGlzdHMub3BlbmVt
YmVkZGVkLm9yZyA8c2thbmRpZ3JhdW49Z21haWwuY29tQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+
IHdyb3RlOg0KPiArUkRFUEVORFM6JHtQTn0tcHRlc3QgKz0g4oCcZGlmZnV0aWxzIg0KDQpGcm9t
IHRoZSBleHBlcmllbmNlIG9mIGxvb2tpbmcgYXQgYXNzaWdubWVudHMgbGlrZSB0aGlzIGluIGEg
ZmV3IHllYXJzIHRpbWUgYW5kIHRyeWluZyB0byBleHBsYWluIHdoeSB0aGV5IGV4aXN0OyBjYW4g
eW91IGFkZCBhIG9uZS1saW5lIHN1bW1hcnkgb2YgeW91ciBjb21taXQgbWVzc2FnZSBhcyBhIGNv
bW1lbnQgaGVyZT8NCg0KKGFsc28sIGN1cmlvdXMgaG93IGJ1c3lib3ggZm10IGlzIHNvIHNsb3cg
Y29tcGFyZWQgdG8gZGlmZnV0aWxzLCBjb25zaWRlcmluZyDigJxyZWFkIGZpbGVzIHVudGlsIHRo
ZXkgZGlmZmVy4oCdIGlzbuKAmXQgZXhhY3RseSByb2NrZXQgc2NpZW5jZeKApikNCg0KVGhhbmtz
LA0KUm9zcw==

