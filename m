Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00C39C87FD1
	for <webhook@archiver.kernel.org>; Tue,  5 Aug 2025 18:56:27 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.39])
 by mx.groups.io with SMTP id smtpd.web10.7241.1754420182495643545
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Aug 2025 11:56:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=nu4ongi/;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=nu4ongi/;
 spf=pass (domain: arm.com, ip: 40.107.159.39, mailfrom: jon.mason@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=dGKYVJnN5ytzWhK7e59iPzpOSyFhFUH42IOiX1VlfqdcC3oAl/rGZv8oVW2gG/y7licwOXWC+4jBfzdf/BrZQJIO0jwSUkHtIzaxizqSnBKYM7bFx+zSEUJoAk7ztljgfExCGWHI5pPBbUT4xBdhHic2yxsTTm3faO8mGB3R80/6FIkip4IpACemiGlDs1IZ5EKEpxBOgHvKuyjpfg1jM0M71M94kTzDd7EwnfpE5+Y2xxmNQguCC14TQR/2tA3HbSv/CzyJc8iVZv6+sWoKY/b4RiYoODCoo/x7e5wXvU8di9mgarJSq/gjbtgutUYVf6TrogYpKM+QsWSNKRNuwQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4Jj8DwhyaUwiHvX2HoHWAz0X+WBwVR+G9bdu45E/2+E=;
 b=N3lRjEEAsckFsNy0MzKqCGJzuPp25hqMeSlMrXjiSPHqzFkMs9R0Zfx0I6xtslzgxGlN0qFe4/z/qoPUI4MDD04NYa+Gd7VpcIoB4lKY6HJ2+8hy5gyEhOJ+k5czm6XDT5wnBkxLJBbZ2iBoOUGvNRWBmtNQEG/LIIYKsiPp+M7a0GGLHQGhJzghwGwCClnc/Ovu2Qu948uT2z/PJKhhUyw8DEaQtVhNhJI6K8ZVjcFrm9BqqhkFO0usoZxVke1bBER4SO9V5Aj/hw9NdP/dWgwXeb405rE0MDUNq2YNAvo0C6Xa/PVUHUrgPvpOlGhtrTL/ZU2LZD9G59NH/q7qrQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4Jj8DwhyaUwiHvX2HoHWAz0X+WBwVR+G9bdu45E/2+E=;
 b=nu4ongi/RwVf+BMPbEob1dGBvZEerNrPK+hokkZI//Efk+UPnNeAPciN1Jj/7tadAaX6wq2vPr1PdDXazknpcdWPlH2aG/bYhguirHZa2+FOMnnX9JIDUPUwQ/XLLcODE204/TmDArrhKSw9XeM5A518TVDXmG17V/+nVgmLkWw=
Received: from DU2PR04CA0056.eurprd04.prod.outlook.com (2603:10a6:10:234::31)
 by AM8PR08MB5556.eurprd08.prod.outlook.com (2603:10a6:20b:1db::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.21; Tue, 5 Aug
 2025 18:56:15 +0000
Received: from DU2PEPF00028D08.eurprd03.prod.outlook.com
 (2603:10a6:10:234:cafe::76) by DU2PR04CA0056.outlook.office365.com
 (2603:10a6:10:234::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9009.14 via Frontend Transport; Tue,
 5 Aug 2025 18:56:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU2PEPF00028D08.mail.protection.outlook.com (10.167.242.168) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9009.8
 via Frontend Transport; Tue, 5 Aug 2025 18:56:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iPMQ7l7nfyBbnSf8dJxBnVz+myPS8a+dkKNh2hr2/S/0LeN2JWtcwMcMhDUB79bkTg8N/DPMQRqa25KAG4xJT9LJeHMQ16WKOPcHyG1d/ymRYeRbqL2K5K7UH9zqnjxHiPI6ZKYZDlkhzlidmoNjPsSvS4pOSG7SPFUm/Bpra1q0PS9uh5uzc+gVQvdbK73W05A0CP9Us9bqSBGzyAcinwW6lP5sS+uWj7fli2nh0KsOu2uQK3fYVFX7fIblAIDAMD8N2iBd54pH6NkwZwJR1V24UIItHP1iKSloDO0JwrszF5hWdLuQUzyAQQf1IduPPy7Kt1xI4cfAcfTSiOO4aA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4Jj8DwhyaUwiHvX2HoHWAz0X+WBwVR+G9bdu45E/2+E=;
 b=Vv38YvR2DO7AmvKojo6hGHrRn9RvotKNom7woaLWcwA2W+M1c6bcHkStFghHm3hBLIaWI6KxqZYfeeTPxdXD97pjHmm49p7A7gJj2Hgkw9mZGxck1GR7vQPwB7u21eloTlPzD2MC5kWNeriJydKn6f/AAmAQ9TJELYVqYmQbHeXXkjGfmPE8VruzJDOrca9Mxhv0lrYhZY9hMkHYddy/15CqLXUrgAwbZ+zKCRoaWFAGbEp42+WahtUU3fgBC/6A9wGzVnRDCHkHuXXEJZ8LsVlsj9bkhUhtI+SbAwNuJsoqEzeKedSjiSp/LpH5la5+eg0RZHWKBJYSo3r+oPE+QA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4Jj8DwhyaUwiHvX2HoHWAz0X+WBwVR+G9bdu45E/2+E=;
 b=nu4ongi/RwVf+BMPbEob1dGBvZEerNrPK+hokkZI//Efk+UPnNeAPciN1Jj/7tadAaX6wq2vPr1PdDXazknpcdWPlH2aG/bYhguirHZa2+FOMnnX9JIDUPUwQ/XLLcODE204/TmDArrhKSw9XeM5A518TVDXmG17V/+nVgmLkWw=
Received: from DBAPR08MB5798.eurprd08.prod.outlook.com (2603:10a6:10:1a6::21)
 by PAVPR08MB9089.eurprd08.prod.outlook.com (2603:10a6:102:322::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.20; Tue, 5 Aug
 2025 18:55:41 +0000
Received: from DBAPR08MB5798.eurprd08.prod.outlook.com
 ([fe80::4a66:d3e2:570:9632]) by DBAPR08MB5798.eurprd08.prod.outlook.com
 ([fe80::4a66:d3e2:570:9632%6]) with mapi id 15.20.8989.020; Tue, 5 Aug 2025
 18:55:41 +0000
From: Jon Mason <Jon.Mason@arm.com>
To: Khem Raj <raj.khem@gmail.com>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: Khem Raj <raj.khem@gmail.com>, Ryan Eatmon <reatmon@ti.com>
Subject: Re: [PATCH] machine/arch-arm: Append TUNE_CCARGS_MARCH to TUNE_CCARGS
 conditionally
Thread-Topic: [PATCH] machine/arch-arm: Append TUNE_CCARGS_MARCH to
 TUNE_CCARGS conditionally
Thread-Index: AQHcBiytmY+Q6NBPvkyOBIw88KclubRUaJHz
Date: Tue, 5 Aug 2025 18:55:41 +0000
Message-ID: 
 <DBAPR08MB57986297CB7002A0526D376BF022A@DBAPR08MB5798.eurprd08.prod.outlook.com>
References: <20250805171619.1357193-1-raj.khem@gmail.com>
In-Reply-To: <20250805171619.1357193-1-raj.khem@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-reactions: allow
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	DBAPR08MB5798:EE_|PAVPR08MB9089:EE_|DU2PEPF00028D08:EE_|AM8PR08MB5556:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c28e6e8-e40e-449b-a3b2-08ddd451c0d3
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|1800799024|366016|376014|13003099007|8096899003|7053199007|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?us-ascii?Q?PQKKLI7ySd9D6z+DtVKsrUCpYxuM85xxflFhKzxpUT287LMocqrWZZBl+XjE?=
 =?us-ascii?Q?KNt6iBZamC0Zkwp5YSD7Lu0HfYqApQTjTUrjpsIXVPWPjh4zb3PM15DIdSOT?=
 =?us-ascii?Q?jaDN3mfJI9wUS+sbKDss7xhxjdVh6A+fOLxwIWq0JCM+U5etfLGsIblkxEK2?=
 =?us-ascii?Q?DCfxgjRKFJxW8aLKjHVFfezVyepOgC9vt5vtFZnPa2d/RZDuyAvdUzzqGFFx?=
 =?us-ascii?Q?xsSRj7hLIJi1APcdvaTyY4Yn3Em9SPQS3C29D/rvQjOToqB4L6BW2szuXXFB?=
 =?us-ascii?Q?tAhPNKCRLzgF40xBmSYrbPlhi7DnXscQndeDFCsgrWGP4sMwYo5KDYhgzYb5?=
 =?us-ascii?Q?vUPP1dVyI2yS5dpE3DtmNJvqYM/WXhA8TM5voKm+f+qdEBROJvNsG+Y6TCAD?=
 =?us-ascii?Q?OV3RHWEM0BRmDWcAfd3JNoKeENvGvDBpo0F6ttaGyaauEDxKHK/XI9yaJksH?=
 =?us-ascii?Q?hwOozlpUT41KrzZL9MmKOCxZuIqi/XA2KYxqRbWGydh2KWTOqFrYsoji3SqN?=
 =?us-ascii?Q?sZ0LO8AZFEB3iJ1HspbWwHUZcqWy4/pTIgCIr639DclhJhhG3Rh6lkiPrY8t?=
 =?us-ascii?Q?Tog8yVNp9gFz8ERQ9fE6NO1WHgVA68DiRsgRFNjDopVyBqamvricZmMfR8G7?=
 =?us-ascii?Q?BZyVRJKrdpEi8Tjn70FnrYCtZH5KCgSOoNm2q7Yga3HY6Y7fhTYp61eYS/w6?=
 =?us-ascii?Q?pD408+tnbd9/CzGgX4W61ANgMTlBO6/mh1V3Kpr/TtD76q+BcuS8tdap2MaQ?=
 =?us-ascii?Q?86OBEXW5PmnyLsDJu/IBHd6Jm/DMFrmKQ/mB5hnIRTwd2j8f4V19RVx+nCft?=
 =?us-ascii?Q?00iv+CNVz2OnZAypGGda4TMipECG6ndKicqLuPy0TnA5UfO6m3l9gNBbf3q6?=
 =?us-ascii?Q?6OtNU+DxISHgT/RW1a2zO5XthsZ+LsNAX0k8mJT0/oVAOXgkB46nV7HD1UHs?=
 =?us-ascii?Q?Cn0E5BaxaD70/25ulRz3wC95V06D4DAw//mS/iFAefkMl4BjvvrnRtDsHBXb?=
 =?us-ascii?Q?Ed0WahVE1GT6G6c8PL3STcVx/l9eglutPE+Q4R5AykAOwyW8KHy495aO37xy?=
 =?us-ascii?Q?aieT0YRGrH1pIoYIcsRHYGpZwfIjdUfE5XTj1E3dlf27X61/7TtyqFmkIYow?=
 =?us-ascii?Q?Ro1xQhmGdpY5JVvrk6mTK707Bg/pvKHWNw78+15VXh/mHcb3YFk6EXsieQpx?=
 =?us-ascii?Q?FAAtQe9ntw4rUW2OnZJqjveTxJitaYSNCzG4wZIqMYRYlUSfknT5Yiz3Oih4?=
 =?us-ascii?Q?ngtDwVOTPkhWZmuuRkTEagt2H5/WA5gopBjHbzw2oAjA4RHT/NywUkMElCti?=
 =?us-ascii?Q?6kENw2xzBKdIvRITrtInLEFGXYw5sJ8r/rlMYhkp/cZ3sA1s0QjNy7ES2Iu0?=
 =?us-ascii?Q?vKXIQUwOM8xU1Dif7JQfWznSq8CpPqX26ZiCw5S6XfGaFhg0btosU1fVmwn5?=
 =?us-ascii?Q?5mo8NakL1c0=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBAPR08MB5798.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(13003099007)(8096899003)(7053199007)(38070700018);DIR:OUT;SFP:1101;
Content-Type: multipart/alternative;
	boundary="_000_DBAPR08MB57986297CB7002A0526D376BF022ADBAPR08MB5798eurp_"
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9089
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DU2PEPF00028D08.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	267f518c-e4f3-4698-28f5-08ddd451ad04
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014|14060799003|35042699022|8096899003|7053199007|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?Y3ZsQktIREZ0Y1ZmVTcwU2NxYjVTSTlSeUcxNjJPbUNITFZXWC9FR3NWZnlZ?=
 =?utf-8?B?YjBHREhocXJBLzdqRUIwamJVME9SSSs1VUZFTjFHd3QyK1pLckcxSnBWUkpF?=
 =?utf-8?B?TE9HbW1SZ25VZ2VOb3EvVWZDOUpZMDRCeHlEbmJVWDFuSTFyeU9lWFV6TFlW?=
 =?utf-8?B?YitWZEJZeGw4dWRRZWpFNjlOc2phbU4vSkVDcWQ0Nk1QRVI3Nm5JNUQ1R1A0?=
 =?utf-8?B?cmFtc3NJSlNYcFpROUZBa3dMVU15cVdGRkJaS21UeFl4VmhVYWYxR3JQVGo5?=
 =?utf-8?B?ZmZsUytXUVZXWkJFOS9SQlg0RnBFV3ZiRndJbjhCVFM1clNzd3RBdVAxZlly?=
 =?utf-8?B?bm1rZ2dveFRoR1JOMFZCUUsyUUt5djNKZGtrcC9GMlRFNmRORWw1aUxqWFJL?=
 =?utf-8?B?UkpoYlhCRkczaHB6M25CV3JIbC9uT3ZucmdBdTAzZ1VmVi95VjlQM1JpNmhz?=
 =?utf-8?B?Yll1TjhOS2U1bXRadDIrazYwWnNXRGEyUjJYcjQzMnE4aE5aUjZ4aSs0b2p5?=
 =?utf-8?B?K2ZOcm9MNElNeUNBb1lBRmNXM3RRdHRkUHF1dCt6REdzZXkvQzhWazV0MFlC?=
 =?utf-8?B?UUhqb3VnUVRxR2M2WjI4Z2FpaEhFQ2hiYVNuVU9XR3NNUVBDSVBwTWlrWlF3?=
 =?utf-8?B?TzFTR092NWN2QTR0N2xwWHhGMXovdHR2N29jREhDZ0EyakpWd3hMUnFwU2h5?=
 =?utf-8?B?ZWtTbVAxeUNoU3JiQXdpeFpGRHdDelNzRXpDOFJlTVQxdGFoaVdYTU5Wd2M4?=
 =?utf-8?B?bi9vZzM4b2dYS0psVENVSVZkWXdhVmE1Q1lFSTlIblcrZlJkS0hvaHVHYWlz?=
 =?utf-8?B?Q3RTTXQ3d3RsanFrUzN1Rk9Hc1kycGdXNERnUUZnZUZjdlh4K1h3MWZPbGl5?=
 =?utf-8?B?SXFQakhsd3A4ZFhFcHh4T1d3ampYQWlrdk1LT25hZ25rd1JTMWJPVlVtZXBs?=
 =?utf-8?B?ZlZna08rVWExSWZIM09QN2xqTEVFMmorQnBuOEZoM3c4czkrbEd3ck42bHZE?=
 =?utf-8?B?VGcvejhwV3JsSkJmR3QrdEgvcEltOFl4MVEyNURMdDVaU3pudU9RaVd1cXlV?=
 =?utf-8?B?ZXZ4eHZUODNyRFlYTG9XeU9Vb3g0dmIxYnYvVGJZRXlOYm1MVzEyeTZBSmIz?=
 =?utf-8?B?Q3hBWFpPNnZqUU1WTWVaSDFueGVUdmEzYm5nMzI0RkhXR2crZzdoYnFiZUY4?=
 =?utf-8?B?V0hWejN3Y1FPWm02SVBIczhHdDRKRVk1WGplYTk2cnl5bGYzVHh6UTZoOVh0?=
 =?utf-8?B?Wm9lNFpPTDdnWE12ZGFvOTBEQThsak0vU3hxTG1OcFNKbU9SWmVvdXNGWmhv?=
 =?utf-8?B?WmZISFJPY2RKVVcrQWwvc1doK2FqV2czTHpIRVk4dlpJLytDb0M3cEx5YWd4?=
 =?utf-8?B?aVJQVXg2R1ZoVXM2ZVBicWpNdFcwcTZ1VDFDQkhiT3B6UmhPb2ZoTGo2R21j?=
 =?utf-8?B?cGZac3RENldhcUpySCtZaEdidTJxUTZHckFxZnBOb0YzN1dvRFRzaXJ4cmJm?=
 =?utf-8?B?MlB2Nms2ZXZsRFAvbGdzRlFTNGRqYUFtQkNGTmtJV1VlUis3MjVMSG55Q0Ez?=
 =?utf-8?B?OGkzZE9UNlRDZ3ArVmNUVmlPOElsaGVrSzIvMGdvRlVTL1FpYU1DT0dJUFVD?=
 =?utf-8?B?QUpKSXZjWnpVVlpXN2UxN21Oa0FjZEx5K1BiK1JPQ0R6RVVNNGt4RXRhQVQv?=
 =?utf-8?B?RjZrWHgvTXlDdFNWNElTT3ppWGFqV3JsM0wvRjFjV1R5SWN6Q3UwT2Z0alBG?=
 =?utf-8?B?ZHJxL0hoeXFLNGJYeEtac0luSzJrTzFDNXN6QnFVRFhSTVV2YnQrWG40Nk0v?=
 =?utf-8?B?bW5nblJvMGhHUHZ6S3dKUkRCZml6ZjQ4MFJBQy9IeWZkUncrUEhtTmxnd1hF?=
 =?utf-8?B?TXYzcDZwSVI2cmJGOExYTzRGTitrdW1SaDcybmxKZTVPSThMV01YcEhlY1ZH?=
 =?utf-8?B?ZGRxcTNPU0dCZEZWSzZIUEo3OC9Vc25Ja0ZxbThZSkhIUjNCZnFTZkF3STR2?=
 =?utf-8?B?cFZ2S0c5VFZnPT0=?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014)(14060799003)(35042699022)(8096899003)(7053199007)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2025 18:56:14.7928
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c28e6e8-e40e-449b-a3b2-08ddd451c0d3
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU2PEPF00028D08.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5556
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Aug 2025 18:56:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221485

--_000_DBAPR08MB57986297CB7002A0526D376BF022ADBAPR08MB5798eurp_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

VGhlIHBhdGNoIGJlbG93IGNvcnJlY3RzIHRoZSBlcnJvciB3ZSB3ZXJlIHNlZWluZyBpbiBvdXIg
Q0kuDQoNClRoYW5rcywNCkpvbg0KDQoNCkZyb206IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5j
b20+DQpEYXRlOiBUdWVzZGF5LCBBdWd1c3QgNSwgMjAyNSBhdCAxOjE24oCvUE0NClRvOiBvcGVu
ZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnIDxvcGVuZW1iZWRkZWQtY29yZUBs
aXN0cy5vcGVuZW1iZWRkZWQub3JnPg0KQ2M6IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+
LCBKb24gTWFzb24gPEpvbi5NYXNvbkBhcm0uY29tPiwgUnlhbiBFYXRtb24gPHJlYXRtb25AdGku
Y29tPg0KU3ViamVjdDogW1BBVENIXSBtYWNoaW5lL2FyY2gtYXJtOiBBcHBlbmQgVFVORV9DQ0FS
R1NfTUFSQ0ggdG8gVFVORV9DQ0FSR1MgY29uZGl0aW9uYWxseQ0KV2l0aCBbMV0sIHdlIG5vdyBo
YXZlIGEgbm9uLWVtcHR5IGVsc2UgYmxvY2sgZm9yIGFybS1mZWF0dXJlcywgdXB0aWwgbm93DQpm
ZWF0dXJlIGluY2x1ZGVzIG9ubHkgYXBwZW5kZWQgd2hlbiBmZWF0dXJlIHdhcyBzZXQgYW5kIHVu
c2V0IGNhc2Ugd2FzDQphcHBlbmRpbmcgZW1wdHkgc3RyaW5nLCB3aGljaCBoaWQgdGhpcyBpc3N1
ZSB3aGVyZSBUVU5FX0NDQVJHU19NQVJDSF9PUFRTDQpjb3VsZCBiZSBub24tZW1wdHkgYnV0IFRV
TkVfQ0NBUkdTX01BUkNIIGlzIGVtcHR5LCB0aGlzIGlzIHBvc3NpYmxlIHdoZW4NCmEgdHVuZSBm
aWxlIG92ZXJ3cml0ZXMgVFVORV9GRUFUVVJFUyBhbmQgZG9lcyBub3QgaGF2ZSBhIGZlYXR1cmUg
dGhhdCB3b3VsZA0KYWRkIC1tYXJjaCBvciAtbWNwdSBhdCBhbGwuDQoNClRoaXMgY2hhbmdlc2V0
IGFkZHMgYSBjaGVjayB0byBub3QgYXBwZW5kIGF0IGFsbCBpZiBUVU5FX0NDQVJHU19NQVJDSA0K
aXMgdW5zZXQuDQoNClsxXSBodHRwczovL2dpdC5vcGVuZW1iZWRkZWQub3JnL29wZW5lbWJlZGRl
ZC1jb3JlL2NvbW1pdC8/aWQ9ZGIxYjM1NWIyYjE1YmE1N2JkODljMmRmYjg4YzJjNjY3NTUxODYz
ZQ0KDQpTaWduZWQtb2ZmLWJ5OiBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPg0KQ2M6IEpv
biBNYXNvbiA8am9uLm1hc29uQGFybS5jb20+DQpDYzogUnlhbiBFYXRtb24gPHJlYXRtb25AdGku
Y29tPg0KLS0tDQogbWV0YS9jb25mL21hY2hpbmUvaW5jbHVkZS9hcm0vYXJjaC1hcm0uaW5jIHwg
MiArLQ0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQ0KDQpk
aWZmIC0tZ2l0IGEvbWV0YS9jb25mL21hY2hpbmUvaW5jbHVkZS9hcm0vYXJjaC1hcm0uaW5jIGIv
bWV0YS9jb25mL21hY2hpbmUvaW5jbHVkZS9hcm0vYXJjaC1hcm0uaW5jDQppbmRleCBmMWU5MmUx
OWM2MS4uYWU2NjFiMWFiNGYgMTAwNjQ0DQotLS0gYS9tZXRhL2NvbmYvbWFjaGluZS9pbmNsdWRl
L2FybS9hcmNoLWFybS5pbmMNCisrKyBiL21ldGEvY29uZi9tYWNoaW5lL2luY2x1ZGUvYXJtL2Fy
Y2gtYXJtLmluYw0KQEAgLTE3LDQgKzE3LDQgQEAgVEFSR0VUX0ZQVSA9ICIke0BkLmdldFZhcign
VFVORV9DQ0FSR1NfTUZMT0FUJykgb3IgJ3NvZnQnfSINCg0KICMgU29tZSAtbWFyY2ggc2V0dGlu
Z3MgbmVlZCBhICtYIG9wdGlvbiBwYXNzZWQgaW4uICBTaW5jZSB3ZSBjYW5ub3QgZ3VhcmFudGVl
IHRoYXQgYW55IHNwZWNpZmllZCBUVU5FX0NDQVJHUyBvcHRpb24gaXMgc2V0IGluIGFueSBvcmRl
ciwgd2UgbXVzdCBoYXJkIGNvZGUgdGhlIG9yZGVyIGhlcmUgdG8gYWxsb3cgZm9yIGl0Lg0KIFRV
TkVfQ0NBUkdTX01BUkNIX09QVFMgPz89ICIiDQotVFVORV9DQ0FSR1MgLj0gIiR7VFVORV9DQ0FS
R1NfTUFSQ0h9JHtUVU5FX0NDQVJHU19NQVJDSF9PUFRTfSINCitUVU5FX0NDQVJHUyAuPSAiJHtA
JyR7VFVORV9DQ0FSR1NfTUFSQ0h9JHtUVU5FX0NDQVJHU19NQVJDSF9PUFRTfScgaWYgZC5nZXRW
YXIoJ1RVTkVfQ0NBUkdTX01BUkNIJykgZWxzZSAnJ30iDQo=

--_000_DBAPR08MB57986297CB7002A0526D376BF022ADBAPR08MB5798eurp_
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWwgeG1sbnM6bz0idXJuOnNjaGVtYXMtbWljcm9zb2Z0LWNvbTpvZmZpY2U6b2ZmaWNlIiB4
bWxuczp3PSJ1cm46c2NoZW1hcy1taWNyb3NvZnQtY29tOm9mZmljZTp3b3JkIiB4bWxuczptPSJo
dHRwOi8vc2NoZW1hcy5taWNyb3NvZnQuY29tL29mZmljZS8yMDA0LzEyL29tbWwiIHhtbG5zPSJo
dHRwOi8vd3d3LnczLm9yZy9UUi9SRUMtaHRtbDQwIj4NCjxoZWFkPg0KPG1ldGEgaHR0cC1lcXVp
dj0iQ29udGVudC1UeXBlIiBjb250ZW50PSJ0ZXh0L2h0bWw7IGNoYXJzZXQ9dXRmLTgiPg0KPG1l
dGEgbmFtZT0iR2VuZXJhdG9yIiBjb250ZW50PSJNaWNyb3NvZnQgV29yZCAxNSAoZmlsdGVyZWQg
bWVkaXVtKSI+DQo8c3R5bGU+PCEtLQ0KLyogRm9udCBEZWZpbml0aW9ucyAqLw0KQGZvbnQtZmFj
ZQ0KCXtmb250LWZhbWlseToiQ2FtYnJpYSBNYXRoIjsNCglwYW5vc2UtMToyIDQgNSAzIDUgNCA2
IDMgMiA0O30NCkBmb250LWZhY2UNCgl7Zm9udC1mYW1pbHk6QXB0b3M7DQoJcGFub3NlLTE6MiAx
MSAwIDQgMiAyIDIgMiAyIDQ7fQ0KLyogU3R5bGUgRGVmaW5pdGlvbnMgKi8NCnAuTXNvTm9ybWFs
LCBsaS5Nc29Ob3JtYWwsIGRpdi5Nc29Ob3JtYWwNCgl7bWFyZ2luOjBpbjsNCglmb250LXNpemU6
MTAuMHB0Ow0KCWZvbnQtZmFtaWx5OiJBcHRvcyIsc2Fucy1zZXJpZjt9DQphOmxpbmssIHNwYW4u
TXNvSHlwZXJsaW5rDQoJe21zby1zdHlsZS1wcmlvcml0eTo5OTsNCgljb2xvcjpibHVlOw0KCXRl
eHQtZGVjb3JhdGlvbjp1bmRlcmxpbmU7fQ0Kc3Bhbi5FbWFpbFN0eWxlMTkNCgl7bXNvLXN0eWxl
LXR5cGU6cGVyc29uYWwtcmVwbHk7DQoJZm9udC1mYW1pbHk6IkFwdG9zIixzYW5zLXNlcmlmOw0K
CWNvbG9yOndpbmRvd3RleHQ7fQ0KLk1zb0NocERlZmF1bHQNCgl7bXNvLXN0eWxlLXR5cGU6ZXhw
b3J0LW9ubHk7DQoJZm9udC1zaXplOjEwLjBwdDsNCgltc28tbGlnYXR1cmVzOm5vbmU7fQ0KQHBh
Z2UgV29yZFNlY3Rpb24xDQoJe3NpemU6OC41aW4gMTEuMGluOw0KCW1hcmdpbjoxLjBpbiAxLjBp
biAxLjBpbiAxLjBpbjt9DQpkaXYuV29yZFNlY3Rpb24xDQoJe3BhZ2U6V29yZFNlY3Rpb24xO30N
Ci0tPjwvc3R5bGU+DQo8L2hlYWQ+DQo8Ym9keSBsYW5nPSJFTi1VUyIgbGluaz0iYmx1ZSIgdmxp
bms9InB1cnBsZSIgc3R5bGU9IndvcmQtd3JhcDpicmVhay13b3JkIj4NCjxkaXYgY2xhc3M9Ildv
cmRTZWN0aW9uMSI+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBzdHlsZT0iZm9udC1zaXpl
OjExLjBwdCI+VGhlIHBhdGNoIGJlbG93IGNvcnJlY3RzIHRoZSBlcnJvciB3ZSB3ZXJlIHNlZWlu
ZyBpbiBvdXIgQ0kuPG86cD48L286cD48L3NwYW4+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+
PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMS4wcHQiPjxvOnA+Jm5ic3A7PC9vOnA+PC9zcGFuPjwv
cD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTEuMHB0Ij5U
aGFua3MsPG86cD48L286cD48L3NwYW4+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PHNwYW4g
c3R5bGU9ImZvbnQtc2l6ZToxMS4wcHQiPkpvbjxvOnA+PC9vOnA+PC9zcGFuPjwvcD4NCjxwIGNs
YXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTEuMHB0Ij48bzpwPiZuYnNw
OzwvbzpwPjwvc3Bhbj48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBzdHlsZT0iZm9u
dC1zaXplOjExLjBwdCI+PG86cD4mbmJzcDs8L286cD48L3NwYW4+PC9wPg0KPGRpdiBpZD0ibWFp
bC1lZGl0b3ItcmVmZXJlbmNlLW1lc3NhZ2UtY29udGFpbmVyIj4NCjxkaXY+DQo8ZGl2Pg0KPGRp
diBzdHlsZT0iYm9yZGVyOm5vbmU7Ym9yZGVyLXRvcDpzb2xpZCAjQjVDNERGIDEuMHB0O3BhZGRp
bmc6My4wcHQgMGluIDBpbiAwaW4iPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCIgc3R5bGU9Im1hcmdp
bi1ib3R0b206MTIuMHB0Ij48Yj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjEyLjBwdDtjb2xvcjpi
bGFjayI+RnJvbToNCjwvc3Bhbj48L2I+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMi4wcHQ7Y29s
b3I6YmxhY2siPktoZW0gUmFqICZsdDtyYWoua2hlbUBnbWFpbC5jb20mZ3Q7PGJyPg0KPGI+RGF0
ZTogPC9iPlR1ZXNkYXksIEF1Z3VzdCA1LCAyMDI1IGF0IDE6MTY8L3NwYW4+PHNwYW4gc3R5bGU9
ImZvbnQtc2l6ZToxMi4wcHQ7Zm9udC1mYW1pbHk6JnF1b3Q7QXJpYWwmcXVvdDssc2Fucy1zZXJp
Zjtjb2xvcjpibGFjayI+4oCvPC9zcGFuPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTIuMHB0O2Nv
bG9yOmJsYWNrIj5QTTxicj4NCjxiPlRvOiA8L2I+b3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3Bl
bmVtYmVkZGVkLm9yZyAmbHQ7b3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9y
ZyZndDs8YnI+DQo8Yj5DYzogPC9iPktoZW0gUmFqICZsdDtyYWoua2hlbUBnbWFpbC5jb20mZ3Q7
LCBKb24gTWFzb24gJmx0O0pvbi5NYXNvbkBhcm0uY29tJmd0OywgUnlhbiBFYXRtb24gJmx0O3Jl
YXRtb25AdGkuY29tJmd0Ozxicj4NCjxiPlN1YmplY3Q6IDwvYj5bUEFUQ0hdIG1hY2hpbmUvYXJj
aC1hcm06IEFwcGVuZCBUVU5FX0NDQVJHU19NQVJDSCB0byBUVU5FX0NDQVJHUyBjb25kaXRpb25h
bGx5PG86cD48L286cD48L3NwYW4+PC9wPg0KPC9kaXY+DQo8ZGl2Pg0KPHAgY2xhc3M9Ik1zb05v
cm1hbCI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMS4wcHQiPldpdGggWzFdLCB3ZSBub3cgaGF2
ZSBhIG5vbi1lbXB0eSBlbHNlIGJsb2NrIGZvciBhcm0tZmVhdHVyZXMsIHVwdGlsIG5vdzxicj4N
CmZlYXR1cmUgaW5jbHVkZXMgb25seSBhcHBlbmRlZCB3aGVuIGZlYXR1cmUgd2FzIHNldCBhbmQg
dW5zZXQgY2FzZSB3YXM8YnI+DQphcHBlbmRpbmcgZW1wdHkgc3RyaW5nLCB3aGljaCBoaWQgdGhp
cyBpc3N1ZSB3aGVyZSBUVU5FX0NDQVJHU19NQVJDSF9PUFRTPGJyPg0KY291bGQgYmUgbm9uLWVt
cHR5IGJ1dCBUVU5FX0NDQVJHU19NQVJDSCBpcyBlbXB0eSwgdGhpcyBpcyBwb3NzaWJsZSB3aGVu
PGJyPg0KYSB0dW5lIGZpbGUgb3ZlcndyaXRlcyBUVU5FX0ZFQVRVUkVTIGFuZCBkb2VzIG5vdCBo
YXZlIGEgZmVhdHVyZSB0aGF0IHdvdWxkPGJyPg0KYWRkIC1tYXJjaCBvciAtbWNwdSBhdCBhbGwu
PGJyPg0KPGJyPg0KVGhpcyBjaGFuZ2VzZXQgYWRkcyBhIGNoZWNrIHRvIG5vdCBhcHBlbmQgYXQg
YWxsIGlmIFRVTkVfQ0NBUkdTX01BUkNIPGJyPg0KaXMgdW5zZXQuPGJyPg0KPGJyPg0KWzFdIDxh
IGhyZWY9Imh0dHBzOi8vZ2l0Lm9wZW5lbWJlZGRlZC5vcmcvb3BlbmVtYmVkZGVkLWNvcmUvY29t
bWl0Lz9pZD1kYjFiMzU1YjJiMTViYTU3YmQ4OWMyZGZiODhjMmM2Njc1NTE4NjNlIj4NCmh0dHBz
Oi8vZ2l0Lm9wZW5lbWJlZGRlZC5vcmcvb3BlbmVtYmVkZGVkLWNvcmUvY29tbWl0Lz9pZD1kYjFi
MzU1YjJiMTViYTU3YmQ4OWMyZGZiODhjMmM2Njc1NTE4NjNlPC9hPjxicj4NCjxicj4NClNpZ25l
ZC1vZmYtYnk6IEtoZW0gUmFqICZsdDtyYWoua2hlbUBnbWFpbC5jb20mZ3Q7PGJyPg0KQ2M6IEpv
biBNYXNvbiAmbHQ7am9uLm1hc29uQGFybS5jb20mZ3Q7PGJyPg0KQ2M6IFJ5YW4gRWF0bW9uICZs
dDtyZWF0bW9uQHRpLmNvbSZndDs8YnI+DQotLS08YnI+DQombmJzcDttZXRhL2NvbmYvbWFjaGlu
ZS9pbmNsdWRlL2FybS9hcmNoLWFybS5pbmMgfCAyICstPGJyPg0KJm5ic3A7MSBmaWxlIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pPGJyPg0KPGJyPg0KZGlmZiAtLWdpdCBh
L21ldGEvY29uZi9tYWNoaW5lL2luY2x1ZGUvYXJtL2FyY2gtYXJtLmluYyBiL21ldGEvY29uZi9t
YWNoaW5lL2luY2x1ZGUvYXJtL2FyY2gtYXJtLmluYzxicj4NCmluZGV4IGYxZTkyZTE5YzYxLi5h
ZTY2MWIxYWI0ZiAxMDA2NDQ8YnI+DQotLS0gYS9tZXRhL2NvbmYvbWFjaGluZS9pbmNsdWRlL2Fy
bS9hcmNoLWFybS5pbmM8YnI+DQorKysgYi9tZXRhL2NvbmYvbWFjaGluZS9pbmNsdWRlL2FybS9h
cmNoLWFybS5pbmM8YnI+DQpAQCAtMTcsNCArMTcsNCBAQCBUQVJHRVRfRlBVID0gJnF1b3Q7JHtA
ZC5nZXRWYXIoJ1RVTkVfQ0NBUkdTX01GTE9BVCcpIG9yICdzb2Z0J30mcXVvdDs8YnI+DQombmJz
cDs8YnI+DQombmJzcDsjIFNvbWUgLW1hcmNoIHNldHRpbmdzIG5lZWQgYSArWCBvcHRpb24gcGFz
c2VkIGluLiZuYnNwOyBTaW5jZSB3ZSBjYW5ub3QgZ3VhcmFudGVlIHRoYXQgYW55IHNwZWNpZmll
ZCBUVU5FX0NDQVJHUyBvcHRpb24gaXMgc2V0IGluIGFueSBvcmRlciwgd2UgbXVzdCBoYXJkIGNv
ZGUgdGhlIG9yZGVyIGhlcmUgdG8gYWxsb3cgZm9yIGl0Ljxicj4NCiZuYnNwO1RVTkVfQ0NBUkdT
X01BUkNIX09QVFMgPz89ICZxdW90OyZxdW90Ozxicj4NCi1UVU5FX0NDQVJHUyAuPSAmcXVvdDsk
e1RVTkVfQ0NBUkdTX01BUkNIfSR7VFVORV9DQ0FSR1NfTUFSQ0hfT1BUU30mcXVvdDs8YnI+DQor
VFVORV9DQ0FSR1MgLj0gJnF1b3Q7JHtAJyR7VFVORV9DQ0FSR1NfTUFSQ0h9JHtUVU5FX0NDQVJH
U19NQVJDSF9PUFRTfScgaWYgZC5nZXRWYXIoJ1RVTkVfQ0NBUkdTX01BUkNIJykgZWxzZSAnJ30m
cXVvdDs8bzpwPjwvbzpwPjwvc3Bhbj48L3A+DQo8L2Rpdj4NCjwvZGl2Pg0KPC9kaXY+DQo8L2Rp
dj4NCjwvZGl2Pg0KPC9ib2R5Pg0KPC9odG1sPg0K

--_000_DBAPR08MB57986297CB7002A0526D376BF022ADBAPR08MB5798eurp_--

