Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9B1FC71136
	for <webhook@archiver.kernel.org>; Tue, 17 Jun 2025 17:16:53 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.36])
 by mx.groups.io with SMTP id smtpd.web10.25173.1750180603241904813
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Jun 2025 10:16:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=XfAsWuI/;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=XfAsWuI/;
 spf=pass (domain: arm.com, ip: 52.101.65.36, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=HdJ2xqtfDzmKtSHdyXZMcsaT2PDg7lxkITeYIo0NF+xhpVNs3iMQ7Rs8MLu+W5wdDwy8Lf8G7XRWLWvdGNBHBa+oAsmuDeh+KwRdDgYHXF8EPUMm49JjFh1FaS8PQz8mOlAmknaOZwkx4fqd+MGnMQvCL+xiI9qcSeax1BLGMtsJIigJMTZC7A2u9rtqOz8gsTWSUphW8OaA2fBF3+sd7KvumN3lg8zrfJZJktP51ZvyGjEmmXooFuJzObDSrR62DjVMUuFergGqNLwL7cCbyQRSndOd1XGWrNel6zJdwWvoc6lqjjrsjuBA7DytMrRB6cPzQto3UsJJ2Y/FqnrQ/g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MgKmdZ+6ZJQBvtQOm6TP9F2A1n0ghfH/tR5EMYAel70=;
 b=S9WvrIjU6kwn7loEEcB4hPn5y25B4acorgAIcj5L/AWFmrlC9hh/gLWys3yh44f0bE6bRItIGL3Bt9kRMioZ7yqaNGyUrAz2MeE8ZIcNckMIMclLXg44pFd2EgQTPrdXzVWeB7HL/QEWqwOrqWnZkjHkDnGKQF47FWg7sS96vnECF+JGKt+lcrbn+dN5l/DEQgVcPdPX7RWCitmyp5tI4NMhRTp2JZ01J30BoBI8cVH6dKXQiyjVDSV7OvNPQmOCBhmO7mhomjQ6s6SiUcmt0bTmKCgP6Py56iqB5MxPG1kBR3JblDYLkd9O9ryfYIz9IimcPhPhRiB16ZyTPp075Q==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=ti.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MgKmdZ+6ZJQBvtQOm6TP9F2A1n0ghfH/tR5EMYAel70=;
 b=XfAsWuI/ZFYjghF5/AHwm8pd7TqD/E8Yyh3+haqMNV472kCyg7mgXf8BzS439qE4Yq2zK1JSl1BJLt1KyJU4SgSc7tVLPUP9AK3ntDw3y17/+Kq6bSD2GGvyxfIZy6Yx6zSRv6JEagdqbCVFlXZtxsOJLyjkHXW2I1Qk9h1kGDE=
Received: from AM0PR04CA0094.eurprd04.prod.outlook.com (2603:10a6:208:be::35)
 by GVXPR08MB11060.eurprd08.prod.outlook.com (2603:10a6:150:1fb::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.28; Tue, 17 Jun
 2025 17:16:38 +0000
Received: from AM3PEPF00009BA1.eurprd04.prod.outlook.com
 (2603:10a6:208:be:cafe::d4) by AM0PR04CA0094.outlook.office365.com
 (2603:10a6:208:be::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.30 via Frontend Transport; Tue,
 17 Jun 2025 17:16:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM3PEPF00009BA1.mail.protection.outlook.com (10.167.16.26) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.15
 via Frontend Transport; Tue, 17 Jun 2025 17:16:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ytVfpKRQFUt08R7DP/N9ZIHxaXDD5YVErrNE370bYCOMhs0GSJiUWl58tnvXDxKLmG8t/QR07kiUMK5w49UwITnDW2rGzeT6PCFPyaEJ2ambkeGKPPPZFRLiiUnHUkQytFH7MuWfLHyUHKYAmj6pSRtCGTy6d/TK5Tvo8TXnmM9u/4l44d7AY5CfRj2/EQ4UylNXJ4WYZwu9EFPZaZph2mh/7+Ik1119IPwSkJ/ufe2aEFm6FfrcCZ2FftoVG1FkWsnm1iUs+6+q/zDUGQvfTG7IrmSRSN1/QlnpDg6X5JeonI6yA4zJ89mkFxR+cL6k9zbev+NExY5QHWjTymJ7xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MgKmdZ+6ZJQBvtQOm6TP9F2A1n0ghfH/tR5EMYAel70=;
 b=GThpmqeSuhIZ+FrmAFIr5F2Yor12r3EfDIMchMyIG4l9CeqtLki3ppklPg/h9UiZNeN2pcc8w7OxvbgnPgmzTVmm+J0DUYQXiymG9+LEifCP2UYnYeYwHjw4RgNqge9axfNLt/1QqF+ZfriGUbQlGKueuKPQUIqkDnXvYhseWuQtHuGt4Bo9VKLBH4QR1RYWvYobaVcXpdtkpy4eI7014YrF0jn0WSmit+aFKeMe/jhs6+1MW2WkAw56UP9SEIv2tormWvh/fqZjLyTm0UXi2GEXFaZ0IL1tngwzKXNhY9Dfr/GTYgSHGWKYnllHV168KV3x7G0oDl/SJLp9OtZiQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MgKmdZ+6ZJQBvtQOm6TP9F2A1n0ghfH/tR5EMYAel70=;
 b=XfAsWuI/ZFYjghF5/AHwm8pd7TqD/E8Yyh3+haqMNV472kCyg7mgXf8BzS439qE4Yq2zK1JSl1BJLt1KyJU4SgSc7tVLPUP9AK3ntDw3y17/+Kq6bSD2GGvyxfIZy6Yx6zSRv6JEagdqbCVFlXZtxsOJLyjkHXW2I1Qk9h1kGDE=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS2PR08MB9045.eurprd08.prod.outlook.com (2603:10a6:20b:5fd::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Tue, 17 Jun
 2025 17:16:03 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%6]) with mapi id 15.20.8835.027; Tue, 17 Jun 2025
 17:16:03 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "reatmon@ti.com" <reatmon@ti.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][PATCH] u-boot: Allow for customizing installed/deployed
 file names
Thread-Topic: [OE-core][PATCH] u-boot: Allow for customizing
 installed/deployed file names
Thread-Index: AQHb2wOywqbujoCalU2Hf/I92vitQrQHoO6A
Date: Tue, 17 Jun 2025 17:16:03 +0000
Message-ID: <12269899-C562-4B4A-987E-27A2F770B694@arm.com>
References: <20250611190430.13378-1-reatmon@ti.com>
In-Reply-To: <20250611190430.13378-1-reatmon@ti.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.600.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS2PR08MB9045:EE_|AM3PEPF00009BA1:EE_|GVXPR08MB11060:EE_
X-MS-Office365-Filtering-Correlation-Id: 64fdd11b-dafb-4ef7-c64e-08ddadc2b720
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?aXh0anc4bFRYM0dod1gyYzFNQWg1NGxkRGRvN2JyZ0pBdi9XSm8zVWdqNVVD?=
 =?utf-8?B?cjMvNzFzajZhSXBkaEVYSnZWdURWeHI1TFI0ZmpTR1VGVFVGV1BackdKUjMy?=
 =?utf-8?B?akw4ZVVDNnJ1NmFVbzQyYitBREhhV0dBd2xyMjUxdkpkbWVXejVMOGtuaG5l?=
 =?utf-8?B?b083aVY3L3VTM3EwYVI0UEdFVnptVWZZNEdhWjlyOHM1RjEwTVdhNmsxd3c3?=
 =?utf-8?B?N3hTbnJzWXV1RExGY0lQWWRJV0YwUXRWcTJPV0M1T3FWdTlBME84WXRnS3U4?=
 =?utf-8?B?VnU4ZjdURkMvcThZL2lOK0kyL0hPSk1IS0lVeFBQbTlmM1BBdnQyTzc3Mmp5?=
 =?utf-8?B?L01zK1hLdVZPLzhUL2JTY0VPcTBDUjhvVjJTcVNsandQbkFWTnYzdmU5WFBG?=
 =?utf-8?B?L1VvbExjSjFxdHlEMFdReUxnK1lZU3RXOVJxWCtDNUhiNUpCbDkxRUNUWDZB?=
 =?utf-8?B?bG5WcXNGZ1JTeVlSZWhOSVExUkk0MkNIcnI5eHRVSFQyWlEyaUY1VjFVUmdt?=
 =?utf-8?B?WXo0NTJLWlN4UzBiWFlWS3E2ZUxvZ0VKZTA1cXg4dVhzajZkSjRKbXRhb1Rn?=
 =?utf-8?B?R3U3eDNlL2g2Q1AxejRQTkh6Z05zN1ZCN2R4YjN0RFlhL25xMFgxWDNkbUNm?=
 =?utf-8?B?VFM4WGhpanJnT1VHK3lrMXIzZkRMWnd5SFBjM2FDRnpKeEJEV3liekNIaE5h?=
 =?utf-8?B?ZTdac214TnNWbkY5dWpmVDAyWXRKVVk4eXl5aE1UdURsdnNFc1NyUFB4bnp2?=
 =?utf-8?B?bXJyak5LR3ZCU0V3NVFQNFBHV1RMdmp2MXZZN0djKzZPeXZZazd5RFRkM1Ry?=
 =?utf-8?B?Z29rQVdyUnl0S01zWDRRM2hDYnlXS1cxblVJZUEreTFyS1MzakZLSisvdmxL?=
 =?utf-8?B?QUcxTWNPaTE0Zlc4YUcyOElTTVJCT3lvVjlzYnhETmN2K1phRGlmT2FzV1RP?=
 =?utf-8?B?WnpMM2V3bktsL080ZmFUQkZmdVVUeWpXVFI1aWM5em1WSGErT2Q5QkRHRTVn?=
 =?utf-8?B?YTBRSEJ0VGIvRmpJMnZzNXBFMjV6WjNUeExCcmpoMGtldyttQnRlRDEwK1RJ?=
 =?utf-8?B?VHFydVByd3dHMVQ4RlRmRUVnVjFodU13T1FDOVJhNnZjTWNqVGthWFFLeWxE?=
 =?utf-8?B?U0ZHNkEyNWtuK1FiLzF3eFBOVlhvb1pjOEszc3JabHczV1dNV2Frb3hPV0o3?=
 =?utf-8?B?L0dFVXVMV1lYbGhvR0E5SitrdlhJSDhpS2ZVcloxampvNXNsNTZmUk5FKzJw?=
 =?utf-8?B?L1hSN2x1UDRSRnkrKzJNbksvTDVwaHJNYlBFZXdzSEhPT2xCUGM4dUxFd0pp?=
 =?utf-8?B?bXVadi8vZ3NPQ0VTV0VPRXJCZ0Nneno2SmhNMGxYcUU3Q0VLQUIrT0pDV1Fl?=
 =?utf-8?B?TmdaZFd5Wk5RK1F3VnNKTUtpQ2plOTJKVUN0c3lGOXkrSmQ2citGNjFwUXQy?=
 =?utf-8?B?NVZMMmlzdFZzUXZrTEk2bWszN0QxMloyYy9QYzkzd3J0ZVJWZ0VhdjgxK05S?=
 =?utf-8?B?ZjhOL3NvZGI1dG9BZlFZWkM1N3lKMUtUeUpJZWZSYkxUVExRM2RxNkNSdkJw?=
 =?utf-8?B?dkNNVy9uRFEwUEJxeEx6QlE2M0RmMzZ3L0hjR0lteVJUYTk5bXd6LythdVhw?=
 =?utf-8?B?T292VUhQRjMwNlg3dG8xVGhob0F5dU1lOHIwaHEvTU1IZVA1TDdSTlV6ZVpS?=
 =?utf-8?B?YzRWRW1iWTBYOFFmdVN6SXUxcTg2d0szdEF0YlBsMnFvSEF6RzBlaDE3V05S?=
 =?utf-8?B?UVVlWktsbE1qdmV5b2RDSWx3QSt1a3EzZ3FFRUNsSWN6azJHSklybnJCeU9s?=
 =?utf-8?B?SDYyRzlWTHh6N1ZuT3FTRXN2NDI0RFowVXVQclVBQVc0TXFpNXViTzlLWmVl?=
 =?utf-8?B?UGYzd2gxZVVYMUdaOW80TnZla3BrRmE2S1B4OW1kekVZcXNiTUtpUTlCbDhX?=
 =?utf-8?B?QVFUWTFmbms2Ti9JV3FrVGJtb0hWVVFWa2FYbGhmVVJVN2I1QzRtbnMzZm5n?=
 =?utf-8?Q?Vo9VItJL2imfFy42rGD9/1/4d0oKQY=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <D21CC2E102DDEC4A99D0755E80EFCD75@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9045
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM3PEPF00009BA1.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	66e4fee2-d5bf-447a-89cb-08ddadc2a386
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|35042699022|376014|14060799003|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?V0tUVXVmZGdpTDVjUXJCOWVkUjRlNUVFL094d0NSQ2xrcXM5MHAvNzBiYjk4?=
 =?utf-8?B?djVHMGF3dURobFFBVElncnhmNGVQT0pNVFljdXZ6TlgvSitjS0M3WmxoSXBu?=
 =?utf-8?B?bWg0VFI2TERYV2c1UlJTQkdCRVlvUUpyMHFLdUNZa05GQjFWZmFtbXJnZWFp?=
 =?utf-8?B?dTF1Yk10bEJCc2JEK1BadUQxSzM5cnE1NEJ1TGt0dDg5dmsvdSs4clcvVzRQ?=
 =?utf-8?B?THAzUUMrVkdncURSTkdtNFlUNWZjV3ZMMTdBamxzZGl6N2NYUmFUWktPZ1Nv?=
 =?utf-8?B?LzBxL2VPUzBvK3l2dDg3dUk3NzFncDdTbEFiMDI3MlZDVnVRempPeHRCaVQ5?=
 =?utf-8?B?RWI4ZjdBL09VQ0JyWVJiT3VrL0RuLzV4Z1VHaDhPblpCNHpkRVdjYi9aV09M?=
 =?utf-8?B?Z25xVUY0S0lBV3BvTFAyV0xIVlBnVzl3RWgwTGZCSVdJTmFhSlFMNzVCdmlG?=
 =?utf-8?B?ZmJUeTRyT2IvL1VxcW1kdmU3NEUwcWpJWEZmdGE3TUQ1dS9kL1JTTk9DOE9Z?=
 =?utf-8?B?dzMxcW9NSGg4UCtPVENMM0FQSzBwSlVNK2pkd29yQnhGUThMUjhzd1VlL0VU?=
 =?utf-8?B?Y2tsTHZUN2FrOWhhdys2UTQ2N29oWjIrcTlHTnNjL3I3cXVLMkwxWjY0M2Nk?=
 =?utf-8?B?TGQ4V3l6a3J5a28zNUkvaCtoRkxqWkladGlaZC9KSG8zbG1MR3JXOEk1U2hu?=
 =?utf-8?B?SzcwUUVtQWh1SGxWRk1waXhaVmNSV1l4b3FVZGxkbW9zNmhqWG5FVG5SSS90?=
 =?utf-8?B?VkRnL1cwZkdsdmhRMlgvNHJ5MU9vdTZOVnQraUZEaTkwOGNLWm5nb1lyTEJj?=
 =?utf-8?B?SWFXRFQyN05jZHM3Zm4wWWlyRFhzaEZhRlNhOVhEN2dCVGtGTmI4OU9uMVhX?=
 =?utf-8?B?d29mcmszQlR1NDMrdEJHZGErOFl1dzYwamRVNG5IMnJzVEFkdi9zRHFhazd5?=
 =?utf-8?B?UnNldnVoT3kzWkJ4azBLb0NiWVlReXQ2YmNoaUUxVnZXMHllajh4RjA2WGdT?=
 =?utf-8?B?REtJZHAvYmpSZE1PQVFYKyt2aHM0SngvVEVLMTVpYlQ1QVJtQWVHSGc2R3Fa?=
 =?utf-8?B?eHpLenBacTJPWUVUV0ZuNld0Nzd5Tm1oUDJpUEYvRU1OeFdmMmhlZ0s1ZnhQ?=
 =?utf-8?B?VGpkcFZCaGVZR3ZYZ1Fsbk9SMFE0UzlSOUZiMFd0TFFQanFObWZYSzNMVUFQ?=
 =?utf-8?B?SDlOdFJSUWQ0cE9qWWFjQ3lwOGFmOVhxb2VjNVd4UDNWUkEvNFdDTklFaUFZ?=
 =?utf-8?B?d0I3OGc0Um9pOEYxWDBudThja1VUL2hvUkhKdG4rK0JSR2c0dDdLeDNPT3dw?=
 =?utf-8?B?ZXFnekdsdStVOXNZMW1TbEw4VFlSQU15K1dNNlg1MkQ4V0E5bTlmMGNkTm5D?=
 =?utf-8?B?SnVkK3V6eWNnWkt0WlZCNUZRL3U4WklFYUZ4VkJ0dUI4WGtUOFlwR0VsaE1K?=
 =?utf-8?B?QTRPeE9hYVJON3lIcTdDTnRvZW90VUJZby9NSlg3Rm5qemM1b1p4NVVwbkRG?=
 =?utf-8?B?T20yREkwOW5zQWpLUiswREdlSW1VclpTRkVPZDdsb3VMM200bWU0S0hZekdE?=
 =?utf-8?B?RzZKckpTTHNxYkZkd1V4SWpvNFB0dU12bkdmZnBDaXFUcXNlSW0rbVc3MllX?=
 =?utf-8?B?VHhzcnVLU0kxRmdtOGFnVzEySVR1YmJyNlRlaXFrL0FNdExzVkQ2Nk5lVVRL?=
 =?utf-8?B?U0prWkhvZUQzbFFJaEIzTXNOWEpSMEdsTzlScWpsaUF4RkpoQk9RMkEwd1hB?=
 =?utf-8?B?Y29iS1Rjb2dzQWp2MjVacnVYWkhXVlNlaHNGZW91L2FFRDVubzJNMFk1SGY2?=
 =?utf-8?B?d2ZCUDVGU1paUmtJbzhNQnozeHdxRFJTNit0dmlTYitRZTk1QnhHVDVjQUo3?=
 =?utf-8?B?U1AxeHdlODJCeWVkU05GdE9CVXhpUnF0d0NGVmVCMnBsZ0VpeXJyaUs5Rzcz?=
 =?utf-8?B?dlcrRnZrODZVWk8wQ29nOHcwSkhDL1pEMjRLMnJiVzlSQSsvK3prVnd2TnV1?=
 =?utf-8?B?YWpwZC92T0huYi9ZazZEbGNLUStXYUNEZlZFTENMcS84VDlyZ0RPdXpCdXdY?=
 =?utf-8?Q?InscdV?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(35042699022)(376014)(14060799003)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 17:16:36.3704
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 64fdd11b-dafb-4ef7-c64e-08ddadc2b720
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM3PEPF00009BA1.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB11060
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Jun 2025 17:16:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218914

T24gMTEgSnVuIDIwMjUsIGF0IDIwOjA0LCBSeWFuIEVhdG1vbiB2aWEgbGlzdHMub3BlbmVtYmVk
ZGVkLm9yZyA8cmVhdG1vbj10aS5jb21AbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4gd3JvdGU6DQo+
IA0KPiBXaGVuIGFzc2VtYmxpbmcgYWxsIG9mIHRoZSB2YXJpb3VzIGZpbGVuYW1lcyB0aGF0IGFy
ZSBpbnN0YWxsZWQvZGVwbG95ZWQNCj4gZnJvbSB1LWJvb3QsIHdlIGhhdmUgYmVlbiBpbmNsdWRp
bmcgdGhlIFBWIGFuZCBQUiBpbiB0aGUgZmlsZW5hbWVzLiAgVGhpcw0KPiBjaGFuZ2UgaW50cm9k
dWNlcyBhIHNpbXBsZSB2YXJpYWJsZSBpbmRpcmVjdGlvbiBmb3IgdGhvc2UgcGxhY2VzIHNvIHRo
YXQNCj4gdGhlIHZhbHVlcyBmb3IgUFYgYW5kIFBSIGNhbiBiZSBtb2RpZmllZCBpZiBkZXNpcmVk
Lg0KPiANCj4gSW4gdGhpcyBjYXNlLCB3ZSBhcmUgd2FudGluZyB0byB1c2UgdGhlIHZhbHVlIGZv
ciBQS0dWIGluc3RlYWQgb2YgUFYgc28NCj4gdGhhdCB3ZSBjYW4gcGljayB1cCB0aGUgZ2l0IGNv
bW1pdCwgYnV0IGEgY2hhbmdlIG9mIHRoYXQgbWFnbml0dWRlIGluIGENCj4gYmJhcHBlbmQgd291
bGQgYmUgaW1wb3NzaWJsZSB3aXRoIGFsbCBvZiB0aGUgcGxhY2VzIHdoZXJlIFBWIGlzIGhhcmQt
Y29kZWQuDQo+IA0KPiBUaGlzIGNoYW5nZSBzaG91bGQgbm90IGJlIGRpc3J1cHRpdmUgc2luY2Ug
dGhlIGRlZmF1bHQgdmFsdWUgZm9yIHRoZSBuZXcNCj4gVUJPT1RfUFYgYW5kIFVCT09UX1BSIGFy
ZSBqdXN0IFBWIGFuZCBQUiByZXNwZWN0aXZlbHkuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBSeWFu
IEVhdG1vbiA8cmVhdG1vbkB0aS5jb20+DQo+IC0tLQ0KPiBtZXRhL2NsYXNzZXMtcmVjaXBlL3Vi
b290LWNvbmZpZy5iYmNsYXNzIHwgMTUgKysrLS0NCj4gbWV0YS9yZWNpcGVzLWJzcC91LWJvb3Qv
dS1ib290LmluYyAgICAgICB8IDgwICsrKysrKysrKysrKy0tLS0tLS0tLS0tLQ0KPiAyIGZpbGVz
IGNoYW5nZWQsIDUwIGluc2VydGlvbnMoKyksIDQ1IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAt
LWdpdCBhL21ldGEvY2xhc3Nlcy1yZWNpcGUvdWJvb3QtY29uZmlnLmJiY2xhc3MgYi9tZXRhL2Ns
YXNzZXMtcmVjaXBlL3Vib290LWNvbmZpZy5iYmNsYXNzDQo+IGluZGV4IGY0NDYwNWNiNmEuLjYy
ODc3MDE4ODggMTAwNjQ0DQo+IC0tLSBhL21ldGEvY2xhc3Nlcy1yZWNpcGUvdWJvb3QtY29uZmln
LmJiY2xhc3MNCj4gKysrIGIvbWV0YS9jbGFzc2VzLXJlY2lwZS91Ym9vdC1jb25maWcuYmJjbGFz
cw0KPiBAQCAtMjIsMTIgKzIyLDE3IEBAIGRlZiByZW1vdmVzdWZmaXgocywgc3VmZml4KToNCj4g
VUJPT1RfRU5UUllQT0lOVCA/PSAiMHgyMDAwODAwMCINCj4gVUJPT1RfTE9BREFERFJFU1MgPz0g
IiR7VUJPT1RfRU5UUllQT0lOVH0iDQo+IA0KPiArIyBXaGVuIG5hbWluZyB0aGUgZmlsZXMgd2Ug
aW5zdGFsbC9kZXBsb3ksIHRoZSBwYWNrYWdlIHZlcnNpb24gYW5kIHJldmlzaW9uDQo+ICsjIGFy
ZSBwYXJ0IG9mIHRoZSBmaWxlbmFtZS4gIEFsbG93IHRoZXNlIHRvIGJlIGN1c3RvbWl6ZWQgaWYg
ZGVzaXJlZC4NCj4gK1VCT09UX1BWID89ICIke1BWfSINCj4gK1VCT09UX1BSID89ICIke1BSfSIN
Cg0KPiAtVUJPT1RfSU1BR0UgPz0gIiR7VUJPT1RfQklOQVJZTkFNRX0tJHtNQUNISU5FfS0ke1BW
fS0ke1BSfS4ke1VCT09UX1NVRkZJWH0iDQo+ICtVQk9PVF9JTUFHRSA/PSAiJHtVQk9PVF9CSU5B
UllOQU1FfS0ke01BQ0hJTkV9LSR7VUJPT1RfUFZ9LSR7VUJPT1RfUFJ9LiR7VUJPT1RfU1VGRklY
feKAnQ0KDQpFdmVyeSBpbnN0YW5jZSBvZiB0aGlzIGlzIFBWLVBSLCBzbyB3aHkgbm90IGhhdmUg
YSBzaW5nbGUg4oCcVUJPT1RfVkVSU0lPTuKAnSB2YXJpYWJsZSB0aGF0IGRlZmF1bHRzIHRvIFBW
LVBSPw0KDQpQdXR0aW5nIHRoZSBQUiBpbiB0aGUgZmlsZW5hbWVzIHNlZW1zIHdyb25nLCBidXQg
dGhhdCBjYW4gYmUgYSBmb2xsb3ctdXAgcGF0Y2guDQoNClJvc3M=

