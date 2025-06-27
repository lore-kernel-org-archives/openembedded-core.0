Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 257A7C7EE31
	for <webhook@archiver.kernel.org>; Fri, 27 Jun 2025 12:22:17 +0000 (UTC)
Received: from AS8PR03CU001.outbound.protection.outlook.com (AS8PR03CU001.outbound.protection.outlook.com [52.101.71.27])
 by mx.groups.io with SMTP id smtpd.web10.12326.1751026933357877528
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Jun 2025 05:22:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=QZh0vAgE;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=QZh0vAgE;
 spf=pass (domain: arm.com, ip: 52.101.71.27, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=KvJK0Ibj9pXdUn+qYFmK1556N9fIhzNGWpUXOoM1qXiZjd4RG+ad6QC0DWdnAtL64FetFzbSjGqb+911QKPUK+BKJkYE3OmQJmLB9QQBQT66KBZCG+JlNkN85IUrkOMyP8esY1C8ccnLjd1xKLsjjMoIq6KQyxVBmQfldYUnAXRW3Es47uTVhznNspRH+RBRwqCE60Bu5puYLqwKPwaFJxlaRWFSkalfo/1O0klP6lpQQlbeyDMU/9U1alr1+aVbumuVKjtrZXXZdICNMy+OPXMM7FfIvs7jxsRvR/MUs204hmDr9gP3DglHET4CLGBsiR+h6ddneS12OYI8Iudcsg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hEozVlQyxbYbHq39JI5k/gCKEBd5MsSuaVOJkUpPmM4=;
 b=ALEsM0vqhKUdcT8L7cbX5/YYy3gP54bsMIdZDmo7YM/PQcfBBv2KvtHlJM0+drrtfBdnd7tm+T0YeTtyW+fDXpI336EWTMOo2IgF8pwWPpewD/I9ErGHNRw+FsrDgKXRSZ7mumbk0k2dTNpXBLZILCKiDuFBCEqxOIG6Abl+mDS6Y3BepSwL213m9ht5jhkMz4ESHNKs3PaOIRBpHBHd/Yy5dhTLx4Hh1C/JxVSVOnxIFBMvmyPKDwdVZh0r8onr4hGoTCZYpldJ1PU97TrswAW5US2hRagkXE1DKeUlcwP4ErkOCrFdVCKFQHWQCa7I/Ca7mrZ7N8Kp3cyS+lOnmQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=oss.qualcomm.com smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hEozVlQyxbYbHq39JI5k/gCKEBd5MsSuaVOJkUpPmM4=;
 b=QZh0vAgEvFpTwI249IWm8Hq/NRUsh2do+eurbhUT7nPp/h7auT0Mfq2hIYQzuWPtIhCMgW6bCrzagWOouvuXqIeI01qvYSnSYiEjOAXNh7/Y3Vx7zn+kVWc+ebWhKn0Qfc8+glJ/IkrM7SM+Gh8lNJO6wCHyCZbEHJ0eryZ7n3I=
Received: from AM8P251CA0024.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:21b::29)
 by PAVPR08MB9113.eurprd08.prod.outlook.com (2603:10a6:102:2fe::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.24; Fri, 27 Jun
 2025 12:22:09 +0000
Received: from AM4PEPF00027A65.eurprd04.prod.outlook.com
 (2603:10a6:20b:21b:cafe::a) by AM8P251CA0024.outlook.office365.com
 (2603:10a6:20b:21b::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8857.31 via Frontend Transport; Fri,
 27 Jun 2025 12:22:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM4PEPF00027A65.mail.protection.outlook.com (10.167.16.86) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.14
 via Frontend Transport; Fri, 27 Jun 2025 12:22:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iJiLbZ2Ct3F/Ql/Bh0rrq+CeQe7n8CFYLLa2oewckqp/KID0/AQGxmEjwLQ8lTxYO5KuZQS6N4okPIhUo/wEtyPxS+aEFeFFgwHIMNmHwDovD//VBkLZrhMEVqxGg/JP99QFJXHj6NufEGaQjw7Qq6ZwCplc+4olQUSQWJc8YZVUQag20BOUnmzqjGalQz5AeD74+9cKRaOF7jDWNKj5Q7RFaXudIp/CUrl/2JYE8p6VLNjAtUt94mlhAsziP4641FSuAQztQsFCl0MLX8EriMuq1OPcMhSObccYdKInQu7t2Ysg20ZdNEypRHHhVKAmUjxziA70BSKsCPkPxb2Pgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hEozVlQyxbYbHq39JI5k/gCKEBd5MsSuaVOJkUpPmM4=;
 b=sdijU/j4iaGw4MU9J4ezHFUw5lUGYHVTvbgaCPjHHWDLnbw1ff2VutHHXwpKCd6J4kJ5Bc8BReePM1iYZdaMpDb8D/KBeh9ErKq5JzDvTzaA3edD9DItYn5SI1FSLngI+a0vwetSS+AP9Ut1thaCyRyBuynhxVFGsVQ0qcSGUzdD2kIaNy0EyZnDvNpjjTo/YFsF9GXF2HAsp0iRSZyRvTQ/AClnbAOo7SDyGQh0fCe9bpA3Tvwxpq7zogsbr7UNPNvg2ZNutmn/0LNIoyz+zS2R1qVlvLSqZ8JY6uiVbKZDsVH89H/x8I8jFDIqbVt6FVRB3rR4y5rKUNNFZ4BnsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hEozVlQyxbYbHq39JI5k/gCKEBd5MsSuaVOJkUpPmM4=;
 b=QZh0vAgEvFpTwI249IWm8Hq/NRUsh2do+eurbhUT7nPp/h7auT0Mfq2hIYQzuWPtIhCMgW6bCrzagWOouvuXqIeI01qvYSnSYiEjOAXNh7/Y3Vx7zn+kVWc+ebWhKn0Qfc8+glJ/IkrM7SM+Gh8lNJO6wCHyCZbEHJ0eryZ7n3I=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS2PR08MB8336.eurprd08.prod.outlook.com (2603:10a6:20b:558::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.28; Fri, 27 Jun
 2025 12:21:35 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%7]) with mapi id 15.20.8857.026; Fri, 27 Jun 2025
 12:21:35 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "dmitry.baryshkov@oss.qualcomm.com" <dmitry.baryshkov@oss.qualcomm.com>
CC: Vivek Puar <vpuar@qti.qualcomm.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] linux-firmware: upgrade 20250509 -> 20250613
Thread-Topic: [OE-core] [PATCH] linux-firmware: upgrade 20250509 -> 20250613
Thread-Index: AQHb5wO8ce4IMyoD906P0EEFBAHbZ7QW7fcA
Date: Fri, 27 Jun 2025 12:21:34 +0000
Message-ID: <37DB3440-188D-474C-A944-86E9B3831BA2@arm.com>
References: <20250626194543.2363054-1-vpuar@qti.qualcomm.com>
 <CAO9ioeUxY7g+=_7qUDFDAfYgoe=_nEH7cv1HgH__V4ve-roGag@mail.gmail.com>
In-Reply-To: 
 <CAO9ioeUxY7g+=_7qUDFDAfYgoe=_nEH7cv1HgH__V4ve-roGag@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.600.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS2PR08MB8336:EE_|AM4PEPF00027A65:EE_|PAVPR08MB9113:EE_
X-MS-Office365-Filtering-Correlation-Id: a839da22-1a7c-4e05-6506-08ddb5753c30
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?WUZEdGhmQlJ3YkxoWGswdGlFTWRRcVBFakhpZzMwMUoybzNISXA3WmRzQU1k?=
 =?utf-8?B?UWRjandwTjFIeFJSZjJWUUlZRjZKK1dMNldlK202dnRaRnBiQ2o5SXFrRmVY?=
 =?utf-8?B?MEJ4STVkbnlLdmF6azRjWkpVQzZyaTAyelVNNjBZR013ZjNZWWRFZG5DblFZ?=
 =?utf-8?B?ZWYwR3U3UVVwaUJEMExpRWYvbERPb3dYbFdIcmlMck5sTUUxZXo2TVY3QnVw?=
 =?utf-8?B?N3dpSEFBVlQ0YnRjZEpHMVhBVXN1S0FsSUVnWWNERTA3UVd6aUV6cHJEckdN?=
 =?utf-8?B?ZGVjcndGd1d0cG5xaFJCVFIyMHdlZmZYbUhyTTh0MXlqaWxuUW9tVmliM0JD?=
 =?utf-8?B?ZFBNVGVyTlQzWkFqS21nNHUzcnJlOS9nRjNhUUhzV3pxUmdoR1AyaGpiMldj?=
 =?utf-8?B?UGJQM2I5bUJueDdiSUJQNjYrZk5BN1c1YndEVERFNGE4c3FtYnJOWTNvT2pL?=
 =?utf-8?B?TldiWkNoaTVCRHQxQ3VPV1M1TVBjRUh3QlcxQlZLaVRMOE5qamw1NXpjcS9w?=
 =?utf-8?B?N2VCS1dvZnFyMG1DZG05ZHpYMWdzMlZDVmVPNGpXdWgxc0djRkM0bE9reDBR?=
 =?utf-8?B?M3YrSi9sc1FjWGpXcVNtZ2pwVVRNblFtdkF5SGkzbUJZc0tSaVVOZm1rWDBR?=
 =?utf-8?B?WUZQSitDU1BDd0VEdUErTTYrbWdXR1JOc2dQN2YwZzNnQitYelNvcXErbHE1?=
 =?utf-8?B?bGc3MVI2WU92MFlRdTAxU3dKY0NHUzg5UlE2Y3ZWeFJCaG5Gd0dqYWU1T0Zt?=
 =?utf-8?B?Zks5WCtZQjRvL1Z4RlBPMCtBUTFOUyttYTVvQWtETHhYdFRPaTVPQzVYdkln?=
 =?utf-8?B?TSs2TllCcmEyNjNZNy9VWEZETjVXalZFeXVPQjNMR084dU8rdUN6Vll6eEFk?=
 =?utf-8?B?RE9UeHhOS2JDVkUrU1dlRVRkUnZyQjFhbStOL1JHN0JLUUZpOUY2TG5YVEVr?=
 =?utf-8?B?Mmw5UlpHbVlBa3c1V3A0ZjdNUGRPakhWV1pkT2tLbzJzclM5Y2VsOUlXa3c5?=
 =?utf-8?B?My9IQmxVUVJYNDFWQjUwclZGRkNnVzZqTXgrKzZtNG1wY2htdVVGOEZFalhD?=
 =?utf-8?B?cURVYjJTNTh0UHoxRjJXQmJmNVFLK0VtTmRZVlY5R285L2w3WWtweXFFY3Vr?=
 =?utf-8?B?V3pjQlNwemRnY0NESCtXN0E2MkxIV0xjcE12UDVHL1JrV1d2RHNpT3VQM0Rk?=
 =?utf-8?B?UDFxUzN1b012NDRoWVlHTFFOUmVzcU01eTZnc201eFhGQ1pDcnN1bStUVWE3?=
 =?utf-8?B?VTY0bzNQMWxxUkxoblBJSnAzOUF2STFDTi9kM3A2ZG1pN2RPOFMrckllQStY?=
 =?utf-8?B?SThRQVNRZ0FCSXdvQzkweTlZUjlFOHcwSXI3RFlCc2JGeE5yVE91VktnQktt?=
 =?utf-8?B?NW5obDlnVW1Mc1hpdTdGWjBRYkZSY1hQdk95cWI0WllDdDM0Y2g1M3RNZlFy?=
 =?utf-8?B?VnRQc1grMWdXZ2xSc0c3Y3YvZGs4a3BQdHYvcERDbzBUUkY1NDNTMkdhNmEr?=
 =?utf-8?B?VlJBMUVuYXlEL1IrTmxLdWFkOHBiNHBDSFc4cXpqaFErMmZLVDFHM2VGT0Jj?=
 =?utf-8?B?RXlieTdjbG9hS2h4cEhQZ2xTd0tjRXJ0ZUJVTi9zSHNWZ0FiMzVoc3U4Y2g2?=
 =?utf-8?B?M3U1QjJ2dFR4SzFDY3pqQWlXTG1KOHNuMC9uY0dJakwwOWh5Sk8wOXN1TlJx?=
 =?utf-8?B?MkE2MTcrN1pFNGFjZlZwUzJ3c2dXb3VEYThEdEtETkY3TEx4NXNQQ0FydWd6?=
 =?utf-8?B?VmJKeVo2U0g3S3RsQkluUFRCWkZ0cEJzTGlBbEVVcFd6d05MWWZ0cklmZXdI?=
 =?utf-8?B?UTdveGdaenlOSHJUWE9wTkJWWjRmcDNCbVp2c3R3SHdXWU90NWtTOHFkeXBi?=
 =?utf-8?B?Tjdvd3YreXJmdTYrajNCQUJpSG5KQlpuaHFqb1p5UTVjSUhuRytmSVQ5ZGox?=
 =?utf-8?B?V2FnZjU2YVEwTUV1Z0Y5cXRBVlA5LyttS0ZaamxKdnk1SHdRTmgzSmU0dFFh?=
 =?utf-8?B?aFFNMjVWY0hRPT0=?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <A4B4653B90D08F45B4CD0CD602F7EFDC@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8336
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM4PEPF00027A65.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	50572aa6-0dee-417c-3fab-08ddb575285e
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|376014|82310400026|14060799003|1800799024|35042699022;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?NXk1RzNrVWRWdDVJazVQdFl1UGFYdStLS1pzWHJmLzBPQkpLdGwwVksyWXBi?=
 =?utf-8?B?SGFFc1o5L2ttclVtbVRwVFloemlHNTZ3Nnh0cTVBamFGZWVxTXVWV3R1Y3hK?=
 =?utf-8?B?NzgwU2NOaGZyYmt2d2lidWQybXNJY0RIaUdsUW1nQ281MFVXZXN3d3RvZ1Ey?=
 =?utf-8?B?NDRYbGZjbGtzTWZONjQycVQzSkw0WmFMVHRaKzhGaDAyR2JjNThFMkwwQXlC?=
 =?utf-8?B?dUUvNDB0d3ExOWpYa0crcE95MVgrbytCU3orSzJ3bEloZk5rQldTdU9YVVV6?=
 =?utf-8?B?OHloN3BxbVBkS2QwT2xJZEI4bmY5ank0UmVkdmlCNWZDZXpwV0RHWmMrNGxo?=
 =?utf-8?B?UUZLSk5QaGw2aTBCVjBudnJMYURQcklYVmdEVFRUSDM1VGVkNEZMWEQxelVY?=
 =?utf-8?B?ZCt1dWNKR1JtR2IyNlhOamU4Rll5QmtlRkh6QzV2WkZacmNVUHNNMElxUjlt?=
 =?utf-8?B?SkFiY0hOMURWUXZQTm9lY0R5ZXd5QlErV2Z5QUlPOGdNbTFza2VzVkxMYzF6?=
 =?utf-8?B?cmJHcVd4RXMxeEZNYzFwejlTK20vSWdmS1p6VW5SVkNYV0NCZGZrQmszbU9B?=
 =?utf-8?B?SnVwM0hPUC93R0krV3BCTzNsSUNoNEtML2hIOWhLMC9zNFV2aXc3bFdMTjNo?=
 =?utf-8?B?MWxhL1lZdFZlUFFicWI3MkxscTI2Vm5QRWUrcUhqckZka3VBcE1hN05hYzUz?=
 =?utf-8?B?bzl4ak1acnhocFlvSG81OGhrNHBEa3Y5SWVVMjN2ZW8xNnpTUHFBR1RtUEpU?=
 =?utf-8?B?TG5qQjdsdGhFeGtZTFBGWnd3QUFvSmk2V01CUGZCSWwzZVBxYzFvOGpVYkhJ?=
 =?utf-8?B?OWxKaVN6TEhOaU5vNzVHd2VobmxlQmlLNDg0dCthNk1DVmlmS2E3VEEzb0Va?=
 =?utf-8?B?Ujh5UE5zdlVRZWFQd0VTVUxjYnNaQlMwcEJUbk5yRVNjUHJBWWc0a1h5U2xC?=
 =?utf-8?B?Z0pIWUVURjNqL1dEdCtWWDZtRmNLaURiamxwODhGVWxEY1pCU0dkbktWQ1A5?=
 =?utf-8?B?K09RckJ2bSt2SkNwNU9LcU1ad3h1UXhJVHY5TUlqTmFvOXdxTFNkYVIyNkRu?=
 =?utf-8?B?MU1NWmxodFpUclB0STVqN0J3eWVnZFlwV1IrWDVDc1Jjam90djcwVWlXbmV5?=
 =?utf-8?B?Z3grSEYzN2Erc0tPUkVvYzcyR0x0RytuRVZSTTVUNVFDQUk3MWo2bkpxRWty?=
 =?utf-8?B?Z3VWdGlDcm9ZZFBaMldhSmcwRHlnc2N1Nk1MdWtqZkc0SWt3eXM3T0pwU2s2?=
 =?utf-8?B?cmVZKzdVdGhNTzFkQ2lsWDc2eG1qdFdGbDlibWs4ZWk4dHNzSkxreWdQdG5x?=
 =?utf-8?B?ZktoV2VuMVdRTk5NbnZsc3krRnljUnpZWTl4ellKeWhCZ2ZjT1RnNVF6eldy?=
 =?utf-8?B?SnFnUklpaWNGdnpWbzloZExiOTZ0WHhTYnVVbE0wRWpQckJ2NTl4Rmwwci9h?=
 =?utf-8?B?bmFlY3hkVDdpaHFzMXpUdi9yOHo4bThKSWlqQ2NZdGE3WW1UWTdZa3NhdElx?=
 =?utf-8?B?a1dsR0p1U0p4QUxuS05QUG1vRWpEUDU5TkpWZm5GL29ZT3VWRnY4YmFibEZY?=
 =?utf-8?B?ZFNUTldYZy9xV1MyaTIzSmxkL2tXend4VmNiUUVyUEs2am41MERsVjVyU0ZV?=
 =?utf-8?B?ZmpEVVF0RnRvYVZOT1IvS2hSSFBMREkvNHh4M3o3d0VMK1Y4ekdPSzBibStu?=
 =?utf-8?B?aWNaYXRBSE1OV3FMaXV3eEh2YWF4cnFBMTFlekM5SUNYM0kzbGlyeXJhVndC?=
 =?utf-8?B?bXNqU0VYYWZjWTkremVkbWEzbTVocUVFNnliNjFXTlloYUNXSzRKRDZ2NHp6?=
 =?utf-8?B?VENkcXdscGNYRDBXT0RUbDVmNm9wSkNtM1d1bUV1RU8wZVFtNSt6SCtMT3ox?=
 =?utf-8?B?OXNqL0d1L294OWRaREZlZktvV1g3WjNKRFdmbkhQY1RpTFBsSW9BK013QUJu?=
 =?utf-8?B?NFlxeStoTEplNFVLOTQ3VmJQb09ja1Z2MzN5Z2N3SGsyRkttSHZYMjFQM2hL?=
 =?utf-8?B?SVR4Y2pXblRKQTRnbXN0czFDcS9kQnhuL3g5WllkUU9LZjYyVThVWGtHUW5t?=
 =?utf-8?Q?so+n1f?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(14060799003)(1800799024)(35042699022);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2025 12:22:08.1098
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a839da22-1a7c-4e05-6506-08ddb5753c30
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM4PEPF00027A65.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9113
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 Jun 2025 12:22:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219404

T24gMjcgSnVuIDIwMjUsIGF0IDAyOjM0LCBEbWl0cnkgQmFyeXNoa292IHZpYSBsaXN0cy5vcGVu
ZW1iZWRkZWQub3JnIDxkbWl0cnkuYmFyeXNoa292PW9zcy5xdWFsY29tbS5jb21AbGlzdHMub3Bl
bmVtYmVkZGVkLm9yZz4gd3JvdGU6DQo+IA0KPiBJJ3ZlIG5vdGljZWQgdGhhdCB0aGlzIGxpc3Qg
aXMgbm90IGNvbXBsZXRlIGFueW1vcmUsIE1heSByZWxlYXNlIGdvdA0KPiBMSUNFTlNFLmludGVs
LCBjb3VsZCB5b3UgcGxlYXNlIGFjY291bnQgZm9yIHRoYXQgKGluIGEgc2VwYXJhdGUNCj4gY29t
bWl0KS4NCg0KVGhlIGdvb2QgbmV3cyBoZXJlIGlzIHRoYXQgSSBmaW5hbGx5IGdvdCBhbm5veWVk
IGVub3VnaCB3aXRoIGxpbnV4LWZpcm13YXJlIHRoYXQgSeKAmW0gd29ya2luZyBvbiBhdXRvbWF0
ZWQgcGFja2FnaW5nIGZvciBpdC4gIFJpZ2h0IG5vdyB0aGVyZeKAmXMgYSBsb3Qgb2YgZ3J1bnQg
d29yayB0byBjbGVhbiB1cCBsaWNlbnNlcyBidXQgdGhleeKAmXJlIGJlaW5nIG1lcmdlZCBhcyBJ
IGRvIGl0LCB0aGVuIHdlIGFkZCBTUERYIHN0YXRlbWVudHMuICBJ4oCZdmUgYSB0b29sIHdoaWNo
IHRoZW4gcGFyc2VzIHRoZSBXSEVOQ0UgYW5kIGdlbmVyYXRlcyBwYWNrYWdpbmcuDQoNClRoZSBv
bmUgY2F0Y2ggaXMgdGhhdCBpdOKAmXMgbm90IGFzIG1vZHVsYXIgYXMgaXQgY3VycmVudGx5IGlz
LCBzbyB3ZeKAmWQgbGlrZWx5IHdhbnQgdG8gZXhwbG9yZSBhIHdheSB0byBmdXJ0aGVyIHN1YmRp
dmlkZSBsYXJnZSBmaXJtd2FyZSBjb2xsZWN0aW9ucy4gIFRoYXQgc2FpZCwgZm9yY2libHkgc3Bs
aXR0aW5nIHRoZSBmaXJtd2FyZSBwZXItZHJpdmVyIHNvIHRoYXQgdGhlcmXigJlzIG5ldmVyIGEg
bmVlZCB0byBpbnN0YWxsIGV2ZXJ5dGhpbmcgaXMgbGlrZWx5IGEgd2luIGFueXdheS4NCg0KUm9z
cw==

