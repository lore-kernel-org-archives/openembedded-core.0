Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AB46EED62A
	for <webhook@archiver.kernel.org>; Thu, 12 Sep 2024 17:28:34 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.68])
 by mx.groups.io with SMTP id smtpd.web10.53792.1726162108336144745
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Sep 2024 10:28:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=L7zgS3kO;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=L7zgS3kO;
 spf=pass (domain: arm.com, ip: 40.107.20.68, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=ZAPxd/n+DMszDZVzV6hpuPkIHRojKqgtUegf/i2PpU1VRQ/oYEwbk5Pk4s58bs1LoIVgGrx+qRm+Jw7xpFRvjSbsrM0r6Zfio3Q4bgZSaXg/i7iw6cJDRnSY9CtuF68UuQLlvai3XchzbVIgHPnl4Ys3oXA6FQlK8QnYYXrIGo3RnfjCdCkGzrYIKDvC5xWNzmP0VVi9n6TZqR9A6WGzPKDCgaHO+G0lBQj66wWL/ogpiTBLUBOfa4mjcjkjtyLPGwcHjhlwbDLYm+7aZf5EtVMhsUTR2vHZW7AWr5bTgFkHYTjbju7y4GYV/EPjsYmy3py27jtOY4Kmp/sWSmD7CQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n4nPNyqZU/rG8bMSgmOXaeBqHj+JDh8CBwv5TKjF2L4=;
 b=UCxFcB6YeNnXssb8xPZe9tSDPjp34exz3zQCl+vJCDhdPQwZzkqVDzeY8z7eWDBc3PgwkmmwxpX6shAhJ98zzFTVw0c1kOkcg7KjhRbIY6X+gGn6b3sEziIySM4bl+2uZBbCyaxEp9XhTUVxEbzDN9IXCWGYj9BDM1swtjZ92c1ThbmyP3yfsxqX7RCHEBhzbYvH4r8eMC4yY5s4i0+efbWGYrZDx9drttOvg2IENLoirAVnyS4LlPdGtzbeJXD4+HJd1g5carB2IiETsMDgSsfT6svR8x65Z0J9sy/ioy8VOpYsT31Lo4X7tcxA/PMqcwDCyJ2q9O/7p9e0BZTCwQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n4nPNyqZU/rG8bMSgmOXaeBqHj+JDh8CBwv5TKjF2L4=;
 b=L7zgS3kO1JflxbNNgUntePeHVV+WGIsNx1gA/fDQtCIbmdi6BXyJdcgS0zyyFe1W0c+ty8bCMeVTj6gHjRr9ZBvVbASdOVnLEn1SAvKHUC4VHMAjw+Oj/hyVZatXh4tz7E20KXgGab+5BlOeICEZj6eEQhInalg7G6aGWrVaecA=
Received: from AS8PR04CA0084.eurprd04.prod.outlook.com (2603:10a6:20b:313::29)
 by DU0PR08MB9028.eurprd08.prod.outlook.com (2603:10a6:10:474::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.17; Thu, 12 Sep
 2024 17:28:21 +0000
Received: from AMS1EPF00000043.eurprd04.prod.outlook.com
 (2603:10a6:20b:313:cafe::db) by AS8PR04CA0084.outlook.office365.com
 (2603:10a6:20b:313::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.26 via Frontend
 Transport; Thu, 12 Sep 2024 17:28:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS1EPF00000043.mail.protection.outlook.com (10.167.16.40) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7918.13
 via Frontend Transport; Thu, 12 Sep 2024 17:28:20 +0000
Received: ("Tessian outbound ee7a81b3b7b9:v441"); Thu, 12 Sep 2024 17:28:19 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 4afdd0874f5ac5c6
X-CR-MTA-TID: 64aa7808
Received: from L349e8e4a6c6d.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id C241CD77-1AC7-4D6D-9512-666F5F1086D7.1;
	Thu, 12 Sep 2024 17:28:13 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id L349e8e4a6c6d.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 12 Sep 2024 17:28:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c2838MoOefYshQgLx0tbCQF4LZHxsH2uH3vqxdb1Sk+GjStLt8vaoLQWPw857WW2JzT47D/+1EXB4rYpNb/UJc9nBV76EEZZNSGZ7G5hzzcrPJYvgq8g5BUUCCptYTir+PPnItBwonCsP9dckH0H/M1y7ylhxoYbUjjs/U/OGCEsLpXxQjKc2kfmnh4nuEg1JY5IZe9HZXCDdoAhIXTzAXMR/PfT4iz3jITXJ+HzG+dvUVZ07UvLYMrvx5nEdAJovEsZnDeEAuTE3xebZK6oOOCd/i0jqEV2TsSECyYnNpdOuMum8OnQ+AYKZ3fs4MZpVKWv6IsnHvMb1T0uKA1Wxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n4nPNyqZU/rG8bMSgmOXaeBqHj+JDh8CBwv5TKjF2L4=;
 b=p5Qj7BPCzZBGvV2e5ktor7evs52wgWFelR30ngHzGimewZ9T87lG5qgMBBM9TS6E78Wfu2D2sGNSFuNkNPI1nRtZV0raRhSZM1niCJraXcSv1UgCKqJG5zsFIMtLjOaXlLW+AFdk8eaeDPN+xHUpR9pgyeuuP6KbGnP1my4d5eYE8narFuo0PLw003vHNx4dyyO7DwQag+S1vFkErJgwrPzGtkwxJEHBp84ZW1JqrmRBOwRNSIh1d9tX6ILloj5xpHrEDDIO12O5/mOA9FHSCbBgDRzb5sXvwGi4r5Uqfcefuz3z9MFW5+zZyZNfh0MuQzROyItg2V3Xm3bBa2ryPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n4nPNyqZU/rG8bMSgmOXaeBqHj+JDh8CBwv5TKjF2L4=;
 b=L7zgS3kO1JflxbNNgUntePeHVV+WGIsNx1gA/fDQtCIbmdi6BXyJdcgS0zyyFe1W0c+ty8bCMeVTj6gHjRr9ZBvVbASdOVnLEn1SAvKHUC4VHMAjw+Oj/hyVZatXh4tz7E20KXgGab+5BlOeICEZj6eEQhInalg7G6aGWrVaecA=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DB4PR08MB8029.eurprd08.prod.outlook.com (2603:10a6:10:38b::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.17; Thu, 12 Sep
 2024 17:28:09 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%6]) with mapi id 15.20.7962.014; Thu, 12 Sep 2024
 17:28:09 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Martin Jansa <martin.jansa@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] sanity: check for working user namespaces
Thread-Topic: [OE-core] [PATCH] sanity: check for working user namespaces
Thread-Index: AQHbBTTqtFkQSUQE+k+aEcpYynnOFrJUX7yAgAAGbACAAAGmAA==
Date: Thu, 12 Sep 2024 17:28:09 +0000
Message-ID: <40EF6753-F47A-47AD-B93C-0D3DE7DD9FFD@arm.com>
References: <20240912165736.1531460-1-ross.burton@arm.com>
 <64B7E637-6165-4267-A45E-470A16DE53C1@arm.com>
 <CA+chaQf3yD3bLOihOAQC+wfzZpsJ5QJgOvcDiAG0YowuRobpGw@mail.gmail.com>
In-Reply-To: 
 <CA+chaQf3yD3bLOihOAQC+wfzZpsJ5QJgOvcDiAG0YowuRobpGw@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3776.700.51)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DB4PR08MB8029:EE_|AMS1EPF00000043:EE_|DU0PR08MB9028:EE_
X-MS-Office365-Filtering-Correlation-Id: 20ded885-87b5-4154-4aeb-08dcd3504bd5
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|376014|4022899009|366016|1800799024|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?dlVLbGxxMDVLa2RlUFFhaXpzVTVPWEpWckp4YTBnbWR3R3UyMld6TVBPazg0?=
 =?utf-8?B?YkpqT1VIMEllNE9DUU1KeUlVU3M2SVlZTnAwMTJqOFMrb04vZEVTTHAxU0dE?=
 =?utf-8?B?RXRNMWRBdnpRSFhlWVZWcTk0ay9XSTFMWGw4V1JGeWwrcWM0VzZXV0pabWY4?=
 =?utf-8?B?Y3lscnFqSDJxY1l3bGRIWU9HWlRRZnBYRGRqM3ZLV1ppZ2g2Z1JncXBnZUNk?=
 =?utf-8?B?WC9XMVd2c090eVhpUUxLeTRCTFJrNit1YkxnUmpzamplUDFGRTI2UkRyVnp0?=
 =?utf-8?B?SGZWM2l1SjlWSnRtUkhuc3g0V2VvdU5rRDd5d1lFNEs0bXRzYktTa2NIUXRk?=
 =?utf-8?B?bVlvN2M0RktPcno2eHpxc1IzcU93aWZldG9kd2dUQXhHQlUyaG5meFg2NXhy?=
 =?utf-8?B?Z0tpUUxrVzBOR1RDaGZNZDhaTURaMS90SnRtOEpqNkdpK3JvR2FTQmwxTnZG?=
 =?utf-8?B?Sm41NzFiS0J2WERYdDVieTZ2cy9jYnltM2pJVUtZWnV5S1hBQUJqcXh3QVFZ?=
 =?utf-8?B?ZmZrSWxrb0h4ZHBXRG9WSy9XTktoc0tIL3lZR0E4UU5YWGpJWllEb0tkMGgy?=
 =?utf-8?B?TE00NHNCUXVZS3JWbk9XdnlhdzdNQlVGOUVINnJJMFloN0JHVThuUEg0QmY3?=
 =?utf-8?B?cy9RV2dqR2NPSFlMekkzQmUwQmUxRThZZVRVa2NuV3NNSGRhR1hHanBjVmFY?=
 =?utf-8?B?andybURSWmV3M3l1b3BJdWswVDNzekZGZ0tUTkpYTlRTV0VwYnoxWW1yRVhV?=
 =?utf-8?B?eDhNYmZneW5MalNqL1NPc2Eya2x4OW40ODFPcTljVi9VMmhNNVk2OTBrVENH?=
 =?utf-8?B?T3VzU3I1YVpmUlhaenJacG5CYVc3aE9XdU5HRGZqQWwydWZEK01zcnlYNEdZ?=
 =?utf-8?B?aGM4YWF5YWw4d3FMZXF6aThycGpkNUQ4eDIvWHNtWWd2N3crV0l2RktuWkhQ?=
 =?utf-8?B?VmxEbzZsa3dLd3N4SzFKU2ExVnhGdjI4cTVVSGRNR1V4T3B4WTZzOE55Y0pa?=
 =?utf-8?B?V3pMZm5LZGdNT0Q0ZHJzOXF5bWtDY3p5NkVBbEtBU3p4bXBrWkF6c1RIWWIw?=
 =?utf-8?B?Z2pMaWYvakl0cW5hQjVYZ25SRDNOOENzSG8yYlY0azQzWFR5Ky9LNDZpK080?=
 =?utf-8?B?cm9uVTVRdXFwL2dEcGFvL1R6VC85TDIxb3U3Y1A2Q3BXdVhlMXh2dmZ6WDVz?=
 =?utf-8?B?eER3OXhSMElGV0RiWmJLV2E1S2hNMStjb0lrVG4yQmtYR1BkaWVnMEsrNlhh?=
 =?utf-8?B?blcrcmZnU0JJdHNqWjJKV0E4WGptaEFwOUZOVVRXTkxoQ0NDbTRSM0pDRCtK?=
 =?utf-8?B?MmIyTnUxSVRzWGpRVmJLUlpIaUhacWk4UXFOcW9MY2dvZzlZZnFKN01aV1Zl?=
 =?utf-8?B?Q3RWemJsak5CL0JUOVhDM0Z4RWNUTTNGRllpM0ZJa1ZKRW0zazA1V1owTXFG?=
 =?utf-8?B?a1hldFdyMitPcUcrT0ZkOHdQUGc4QkZGVzhoUUZKU1QrSFVmcmFhQnZpeDNz?=
 =?utf-8?B?TUpXUUVXM3NDZnpkWkMxV2F5alhKMUFhMFBzTksrSWdiVkxIdUJlakJIemFk?=
 =?utf-8?B?Skx1ZHJRQmwzOG1rc2wxcTZWN21veE55ZlBGR0s5cHM5TlRGajlRbXJNSlpz?=
 =?utf-8?B?NFZObUhvKzBwWlBIUHVEV05WUTZYUHA1eGFRVERmMnRPdUI5dzdncUlNeXJk?=
 =?utf-8?B?NVptWEFldDg2Z1BUc1VYOGltYUNRREllaDdnOWQxYjJ5MHJGZVRlaDQ3cFlh?=
 =?utf-8?B?Z0JJbUQxUCsrWWdoTzdZenFnZFRWeXVtbFh3cnFSNjlCMjdwM3liaHZHZGlU?=
 =?utf-8?Q?afK9cUOK1zbok32HbNfGDBx0nYud2hiZh49CM=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(4022899009)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <9A1AE1CDD0D9114FAA96458C233AB48D@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR08MB8029
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: 
 ip=[2603:10a6:102:2a3::12];domain=PA4PR08MB7411.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AMS1EPF00000043.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	bac71117-39e2-41e2-3afc-08dcd3504522
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|4022899009|82310400026|35042699022|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?QzNOTGlFVkQ5ODI4bk5yM3RSOEh4WkFCcUlyZjU2bDNSYTh4Y3IxdEJKRWhD?=
 =?utf-8?B?LzJxQk11Yy9pU0pnaDUvdE1iUDBtd3NqK1NkMEVqRFR5Umdwa2lIWElnM2Jw?=
 =?utf-8?B?bWdua1YyQTY5bWVCcEE1TlBQMkU3alJpUVBNRTJHTWwzR0wzY1FEZFRPWGlB?=
 =?utf-8?B?LzkzdVpYNkduMXFPdFpZUnREcmJSelJPa2sweXVaRmxyQkxKUmFVUjJYcDRT?=
 =?utf-8?B?UGthTjN1S3V2U2JoeUg1TFF5OVhpZXAyWlJwUUFUWTNqNHgvOFR2R2lpRG5F?=
 =?utf-8?B?ZE5Wc1JFQUlPeWc4S3NrdVJibkJUUGlneE1iRnY0WnA0YmtyazJWanpBcms0?=
 =?utf-8?B?dUFxQTNkcWtBNkRwcjhWeUYzOHBxV3p1cEp0bU5rSk1sSTVhR1VvUHA1WXVV?=
 =?utf-8?B?VDV2RUtjMzZEWmVhajkraTBVNmk5L3J4OGRaOEgwOHpuNGhVcWpQdDlPL2lL?=
 =?utf-8?B?aTNrV09vWkg2VEcrQ0NTNThvaURXZUpXazJVNUVkR3ZYVk1EOXBVVEdBb2NB?=
 =?utf-8?B?RFFXUzg0NmF3Q0JuOHhIVlRrcGtMem8wd1F1ZVdWSTRsWkJQVnFadVg2Rms3?=
 =?utf-8?B?VEM2czJCMndaRXdBTk1SMmtDbDJQd0h4bU1VUjB5V25QNnhkbW80ZWRibmMw?=
 =?utf-8?B?UTRGUVdPM1poYUh3Qkc4cUhZMWFuMDlZU2ZzcGh1bGNZcXIwZGJxQmZQNVlj?=
 =?utf-8?B?YzlUTDI5eSt6c0xvL3hkVktSaTBDMktOM2ZKNUJlSTdtVmkyaGsydExnSFhD?=
 =?utf-8?B?ZnpiWUd3ZE5BU3dsSjBTa0gvdmNOM1Buajc3VldlblJ4NjFCSDhtcHZaSGNE?=
 =?utf-8?B?ZitBUGg5ZG1YVmFxNDBmbnJJUytxVFRBaGc3Y2xrZkhpekZQVFpLdzBJcm01?=
 =?utf-8?B?OGFWcFNFeWkvaDR4dGJ4Zy9SaEI5MG1YalgxUmkxRFpPUWw3RUZOdXdTWnN2?=
 =?utf-8?B?N0M1bWV6Sy9aN2tEWkg4ZE5ORFo1cmpxN0prb0cxemtzN1hOZXQ2RzNWdG5l?=
 =?utf-8?B?ODFoTmV0eGc4cVlVTGxZSXVrR0l3bDM5Z2ZVcnArSFZ1THp4S1RkNitOazlH?=
 =?utf-8?B?VVJ0cG55Q0t1TDgzeE9MRjhxR2RpdFg2T2VNM0pqdENmY2FoTWU5ZXlralpB?=
 =?utf-8?B?eEFnVk9LcmI2cHk2WWljaDcwS29OQytvWmJUeEtadlVQM0J5cXJtYXd4Tjl0?=
 =?utf-8?B?bHIxUk56VVgvbFR4c0liMm1uV3NRNG4vQVd1endhbmNHR1dsay9IWU1ZZEZH?=
 =?utf-8?B?cHV3YVlUbzFaWUwrdTM5UGVRZUZ6L3NXTzREaW1Naks0dG9MQzlkZlFLdkIy?=
 =?utf-8?B?NjFEMnVQeThnQ05wdzE5Z3NHdUNQdnA3K3V4TzNlT21Kei9UY1EwNVVuZEo0?=
 =?utf-8?B?UkVOdTdCOXQ4ZzFxTzVlR3RtUG9acGN3TEF1eHluMG11cHhLTHJpcXhRT01X?=
 =?utf-8?B?UjhuYkZ1bllIREV1ZVVXRXRBOGxTeVB2NGJIQ1FhL0toK0ZiSlkzejE1bjZ3?=
 =?utf-8?B?RlFxaFk3QWRrckJ4a2F4UHJCZUdOWHQ0L1hwQ1ZNQkZKYUJMLzdKZ0plSmh4?=
 =?utf-8?B?UWwwTXVGY3NCWkNVQzh6L3VmbWxqZFFXNWJsNXlVNkp5NEszRTlFMG44SVdK?=
 =?utf-8?B?MW1UUXA2S3VHQk4rK3pLYnlKNGlmUGRuVzA3eVNBUDR1MEw2SXNBeDJndWpq?=
 =?utf-8?B?MGlLeVRZTjQ5T2lzQWZFSnR6MUl1QXRjTitwZzdlL3g0bzltSWtHV1VKTDhV?=
 =?utf-8?B?UUpseTZUWThXWk4vdkFNKzA5VG1jaDI0dGV4eXdmeTIydjN3bFVZSFBMb2VE?=
 =?utf-8?B?bXBGNFVmNkZlK09JdE93YUR2STBBajhIWlgybS8zTEV0UVU1SnpHOE50R3ph?=
 =?utf-8?B?VXhub0V2UXlqanhhSWFYK1hWdGUrbHFvbVhyS1NvUmUvaFE9PQ==?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230040)(1800799024)(376014)(4022899009)(82310400026)(35042699022)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2024 17:28:20.2256
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 20ded885-87b5-4154-4aeb-08dcd3504bd5
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS1EPF00000043.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9028
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Sep 2024 17:28:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204453

Qnkgd2hpY2ggZG8geW91IG1lYW4gdGhlIGJ1aWxkIGZhaWxlZCBncmFjZWZ1bGx5LCB3aGVyZWFz
IHByZXZpb3VzbHkgaXQgd291bGQgaGF2ZSBleHBsb2RlZD8NCg0KUm9zcw0KDQo+IE9uIDEyIFNl
cCAyMDI0LCBhdCAxODoyMiwgTWFydGluIEphbnNhIDxtYXJ0aW4uamFuc2FAZ21haWwuY29tPiB3
cm90ZToNCj4gDQo+IFdvcmtzIGFzIGV4cGVjdGVkLCB0aGUgYnVpbGQgZmFpbGVkIDopLg0KPiAN
Cj4gb3BlbmVtYmVkZGVkLWNvcmUvYnVpbGQkIGJpdGJha2UgLWsgemxpYi1uYXRpdmUNCj4gRVJS
T1I6IFVzZXIgbmFtZXNwYWNlcyBhcmUgbm90IHVzYWJsZSBieSBCaXRCYWtlLCBwb3NzaWJseSBk
dWUgdG8gQXBwQXJtb3IuDQo+IFNlZSBodHRwczovL2Rpc2NvdXJzZS51YnVudHUuY29tL3QvdWJ1
bnR1LTI0LTA0LWx0cy1ub2JsZS1udW1iYXQtcmVsZWFzZS1ub3Rlcy8zOTg5MCN1bnByaXZpbGVn
ZWQtdXNlci1uYW1lc3BhY2UtcmVzdHJpY3Rpb25zDQo+IGZvciBtb3JlIGluZm9ybWF0aW9uLg0K
PiANCj4gVGhlIG9ubHkgaXNzdWUgbWlnaHQgYmUgdGhhdCB0aGVzZSBjaGVja3MgYXJlIGV4ZWN1
dGVkIG9ubHkgb25jZSwgc28NCj4gaWYgeW91IGhhdmUgZXhpc3RpbmcgVE1QRElSICh3aGVyZSBp
dCB3YXMgZmFpbGluZykgdGhlbiBpdCB3aWxsDQo+IGNvbnRpbnVlIGZhaWxpbmcgd2l0aDoNCj4g
DQo+IEVSUk9SOiBQZXJtaXNzaW9uRXJyb3I6IFtFcnJubyAxXSBPcGVyYXRpb24gbm90IHBlcm1p
dHRlZA0KPiANCj4gRHVyaW5nIGhhbmRsaW5nIG9mIHRoZSBhYm92ZSBleGNlcHRpb24sIGFub3Ro
ZXIgZXhjZXB0aW9uIG9jY3VycmVkOg0KPiANCj4gVHJhY2ViYWNrIChtb3N0IHJlY2VudCBjYWxs
IGxhc3QpOg0KPiAgRmlsZSAiL2hvbWUvbWFydGluL3dvcmsvYml0YmFrZS9iaW4vYml0YmFrZS13
b3JrZXIiLCBsaW5lIDI3OCwgaW4gY2hpbGQNCj4gICAgYmIudXRpbHMuZGlzYWJsZV9uZXR3b3Jr
KHVpZCwgZ2lkKQ0KPiAgRmlsZSAiL2hvbWUvbWFydGluL3dvcmsvYml0YmFrZS9saWIvYmIvdXRp
bHMucHkiLCBsaW5lIDE2OTYsIGluDQo+IGRpc2FibGVfbmV0d29yaw0KPiAgICB3aXRoIG9wZW4o
Ii9wcm9jL3NlbGYvdWlkX21hcCIsICJ3IikgYXMgZjoNCj4gUGVybWlzc2lvbkVycm9yOiBbRXJy
bm8gMV0gT3BlcmF0aW9uIG5vdCBwZXJtaXR0ZWQNCj4gDQo+IHVudGlsIFRNUERJUiBpcyByZW1v
dmVkIGFuZCBzYW5pdHkgcmUtZXhlY3V0ZWQuDQo+IA0KPiBPbiBUaHUsIFNlcCAxMiwgMjAyNCBh
dCA2OjU54oCvUE0gUm9zcyBCdXJ0b24gdmlhIGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gPHJv
c3MuYnVydG9uPWFybS5jb21AbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4gd3JvdGU6DQo+PiANCj4+
IE5vdGUgdGhhdCBpbiBpdHMgZmluYWwgZm9ybSB0aGlzIGlzbuKAmXQgaGFkIGFueSB0ZXN0aW5n
IG9uIGFuIFVidW50dSBtYWNoaW5lLCBzbyB0ZXN0aW5nIHdvdWxkIGJlIGFwcHJlY2lhdGVkIGlm
IGFueW9uZSBoYXMgYW4gVWJ1bnR1IDI0LnggbWFjaGluZSAobm90IGEgY29udGFpbmVyLCBuZWVk
IHRoZWlyIGtlcm5lbCkgd2l0aCBhcHBhcm1vciBlbmFibGVkLg0KPj4gDQo+PiBUaGFua3MsDQo+
PiBSb3NzDQo+PiANCj4+PiBPbiAxMiBTZXAgMjAyNCwgYXQgMTc6NTcsIFJvc3MgQnVydG9uIHZp
YSBsaXN0cy5vcGVuZW1iZWRkZWQub3JnIDxyb3NzLmJ1cnRvbj1hcm0uY29tQGxpc3RzLm9wZW5l
bWJlZGRlZC5vcmc+IHdyb3RlOg0KPj4+IA0KPj4+IElmIHVzZXIgbmFtZXNwYWNlcyBhcmUgbm90
IGF2YWlsYWJsZSAodHlwaWNhbGx5IGJlY2F1c2UgQXBwQXJtb3IgaXMNCj4+PiBibG9ja2luZyB0
aGVtKSwgYWxlcnQgdGhlIHVzZXIuDQo+Pj4gDQo+Pj4gV2UgY29uc2lkZXIgbmV0d29yayBpc29s
YXRpb24gc3VmZmljaWVudGx5IGltcG9ydGFudCB0aGF0IHRoaXMgaXMgYSBmYXRhbA0KPj4+IGVy
cm9yLCBhbmQgdGhlIHVzZXIgd2lsbCBuZWVkIHRvIGNvbmZpZ3VyZSBBcHBBcm1vciB0byBhbGxv
dyBiaXRiYWtlIHRvDQo+Pj4gY3JlYXRlIGEgdXNlciBuYW1lc3BhY2UuDQo+Pj4gDQo+Pj4gWyBZ
T0NUTyAjMTU1OTIgXQ0KPj4+IA0KPj4+IFNpZ25lZC1vZmYtYnk6IFJvc3MgQnVydG9uIDxyb3Nz
LmJ1cnRvbkBhcm0uY29tPg0KPj4+IC0tLQ0KPj4+IG1ldGEvY2xhc3Nlcy1nbG9iYWwvc2FuaXR5
LmJiY2xhc3MgfCAyNCArKysrKysrKysrKysrKysrKysrKysrKysNCj4+PiAxIGZpbGUgY2hhbmdl
ZCwgMjQgaW5zZXJ0aW9ucygrKQ0KPj4+IA0KPj4+IGRpZmYgLS1naXQgYS9tZXRhL2NsYXNzZXMt
Z2xvYmFsL3Nhbml0eS5iYmNsYXNzIGIvbWV0YS9jbGFzc2VzLWdsb2JhbC9zYW5pdHkuYmJjbGFz
cw0KPj4+IGluZGV4IDFkMjQyZjBmMGEwLi43MmRhYjBmZWEyYiAxMDA2NDQNCj4+PiAtLS0gYS9t
ZXRhL2NsYXNzZXMtZ2xvYmFsL3Nhbml0eS5iYmNsYXNzDQo+Pj4gKysrIGIvbWV0YS9jbGFzc2Vz
LWdsb2JhbC9zYW5pdHkuYmJjbGFzcw0KPj4+IEBAIC00NzUsNiArNDc1LDI5IEBAIGRlZiBjaGVj
a193c2woZCk6DQo+Pj4gICAgICAgICAgICBiYi53YXJuKCJZb3UgYXJlIHJ1bm5pbmcgYml0YmFr
ZSB1bmRlciBXU0x2MiwgdGhpcyB3b3JrcyBwcm9wZXJseSBidXQgeW91IHNob3VsZCBvcHRpbWl6
ZSB5b3VyIFZIRFggZmlsZSBldmVudHVhbGx5IHRvIGF2b2lkIHJ1bm5pbmcgb3V0IG9mIHN0b3Jh
Z2Ugc3BhY2UiKQ0KPj4+ICAgIHJldHVybiBOb25lDQo+Pj4gDQo+Pj4gK2RlZiBjaGVja191c2Vy
bnMoKToNCj4+PiArICAgICIiIg0KPj4+ICsgICAgQ2hlY2sgdGhhdCB1c2VyIG5hbWVzcGFjZXMg
YXJlIGZ1bmN0aW9uYWwsIGFzIHRoZXkncmUgdXNlZCBmb3IgbmV0d29yayBpc29sYXRpb24uDQo+
Pj4gKyAgICAiIiINCj4+PiArDQo+Pj4gKyAgICAjIFRoZXJlIGlzIGEga25vd24gZmFpbHVyZSBj
YXNlIHdpdGggQXBwQW1ybW9yIHdoZXJlIHRoZSB1bnNoYXJlKCkgY2FsbA0KPj4+ICsgICAgIyBz
dWNjZWVkcyAoYXQgd2hpY2ggcG9pbnQgdGhlIHVpZCBpcyBub2JvZHkpIGJ1dCB3cml0aW5nIHRv
IHRoZSB1aWRfbWFwDQo+Pj4gKyAgICAjIGZhaWxzIChzbyB0aGUgdWlkIGlzbid0IHJlc2V0IGJh
Y2sgdG8gdGhlIHVzZXIncyB1aWQpLiBXZSBjYW4gZGV0ZWN0IHRoaXMuDQo+Pj4gKyAgICBwYXJl
bnR1aWQgPSBvcy5nZXR1aWQoKQ0KPj4+ICsgICAgcGlkID0gb3MuZm9yaygpDQo+Pj4gKyAgICBp
ZiBub3QgcGlkOg0KPj4+ICsgICAgICAgIHRyeToNCj4+PiArICAgICAgICAgICAgYmIudXRpbHMu
ZGlzYWJsZV9uZXR3b3JrKCkNCj4+PiArICAgICAgICBleGNlcHQ6DQo+Pj4gKyAgICAgICAgICAg
IHBhc3MNCj4+PiArICAgICAgICBvcy5fZXhpdChwYXJlbnR1aWQgIT0gb3MuZ2V0dWlkKCkpDQo+
Pj4gKw0KPj4+ICsgICAgcmV0ID0gb3Mud2FpdHBpZChwaWQsIDApWzFdDQo+Pj4gKyAgICBpZiBy
ZXQ6DQo+Pj4gKyAgICAgICAgYmIuZmF0YWwoIlVzZXIgbmFtZXNwYWNlcyBhcmUgbm90IHVzYWJs
ZSBieSBCaXRCYWtlLCBwb3NzaWJseSBkdWUgdG8gQXBwQXJtb3IuXG4iDQo+Pj4gKyAgICAgICAg
ICAgICAgICAgIlNlZSBodHRwczovL2Rpc2NvdXJzZS51YnVudHUuY29tL3QvdWJ1bnR1LTI0LTA0
LWx0cy1ub2JsZS1udW1iYXQtcmVsZWFzZS1ub3Rlcy8zOTg5MCN1bnByaXZpbGVnZWQtdXNlci1u
YW1lc3BhY2UtcmVzdHJpY3Rpb25zIGZvciBtb3JlIGluZm9ybWF0aW9uLiIpDQo+Pj4gKw0KPj4+
ICsNCj4+PiAjIFJlcXVpcmUgYXQgbGVhc3QgZ2NjIHZlcnNpb24gOC4wDQo+Pj4gIw0KPj4+ICMg
VGhpcyBjYW4gYmUgZml4ZWQgb24gQ2VudE9TLTcgd2l0aCBkZXZ0b29sc2V0LTYrDQo+Pj4gQEAg
LTY0MSw2ICs2NjQsNyBAQCBkZWYgY2hlY2tfc2FuaXR5X3ZlcnNpb25fY2hhbmdlKHN0YXR1cywg
ZCk6DQo+Pj4gICAgc3RhdHVzLmFkZHJlc3VsdChjaGVja19naXRfdmVyc2lvbihkKSkNCj4+PiAg
ICBzdGF0dXMuYWRkcmVzdWx0KGNoZWNrX3BlcmxfbW9kdWxlcyhkKSkNCj4+PiAgICBzdGF0dXMu
YWRkcmVzdWx0KGNoZWNrX3dzbChkKSkNCj4+PiArICAgIHN0YXR1cy5hZGRyZXN1bHQoY2hlY2tf
dXNlcm5zKCkpDQo+Pj4gDQo+Pj4gICAgbWlzc2luZyA9ICIiDQo+Pj4gDQo+Pj4gLS0NCj4+PiAy
LjM0LjENCj4+PiANCj4+PiANCj4+PiANCj4+PiANCj4+IA0KPj4gDQo+PiAtPS09LT0tPS09LT0t
PS09LT0tPS09LQ0KPj4gTGlua3M6IFlvdSByZWNlaXZlIGFsbCBtZXNzYWdlcyBzZW50IHRvIHRo
aXMgZ3JvdXAuDQo+PiBWaWV3L1JlcGx5IE9ubGluZSAoIzIwNDQ1MCk6IGh0dHBzOi8vbGlzdHMu
b3BlbmVtYmVkZGVkLm9yZy9nL29wZW5lbWJlZGRlZC1jb3JlL21lc3NhZ2UvMjA0NDUwDQo+PiBN
dXRlIFRoaXMgVG9waWM6IGh0dHBzOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9tdC8xMDg0MTY5
NzcvMzYxNzE1Ng0KPj4gR3JvdXAgT3duZXI6IG9wZW5lbWJlZGRlZC1jb3JlK293bmVyQGxpc3Rz
Lm9wZW5lbWJlZGRlZC5vcmcNCj4+IFVuc3Vic2NyaWJlOiBodHRwczovL2xpc3RzLm9wZW5lbWJl
ZGRlZC5vcmcvZy9vcGVuZW1iZWRkZWQtY29yZS91bnN1YiBbbWFydGluLmphbnNhQGdtYWlsLmNv
bV0NCj4+IC09LT0tPS09LT0tPS09LT0tPS09LT0tDQoNCg0K

