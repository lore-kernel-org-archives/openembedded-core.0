Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4F5DC4345F
	for <webhook@archiver.kernel.org>; Tue, 23 Apr 2024 11:03:21 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.42])
 by mx.groups.io with SMTP id smtpd.web11.15647.1713870198304494330
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Apr 2024 04:03:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=sOk+Mxyi;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=sOk+Mxyi;
 spf=pass (domain: arm.com, ip: 40.107.21.42, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=mqBUp4AuR2f9uBOn18UxyUfx29/xKh7wO/OLYNgqeFZAf7wUI24odzMO/FzDwPBA4mpAbwsp+TBJmTcf6RXPsoUMULpkDM+4Q6Y/N7g0sO5ytOMk+LhnWqQY7fKEWD9oSNvzgIi7m/FFipKoGbUl7N1wOmdpu3FlNRaY0Z1ULI/UsyAOVnMevrrH5lrkhoGvkf+EI+RzBKJZoGWWfD/jy3oj8Vam1Xvhtms/6KB9+BTe38Sb5E4Cp1nM0OgJanmkym3Z4M/my0/NTXd8rBVE1IgTq3GR/iQfBpig5HKzHfT6ML8D+N9X+EC9RFCNbCsnYYmYg/1L2hDI5+Kg4ypxPw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ck/6XzYEvznCFj6STwNVd4JYqiw4M2juAfSCk0Shpik=;
 b=F7gxxV/YZiSyZK3jdOfRvu7QIWCecV0prYMmUB7ALYbus8tMS+aiVxvRmQdcQCmWDw/EMq3pzmad8SqmcQBa5m28cGCV13NOvBS+5ohNJo8k1IaR1hj3QAWFtFz7aFaifUVkeZXMi3ZRiF+OacrTLF91zOpFy2ldHK+2hdYImUXU1FLaf+sPl2ETMSr+x9+d8Y8Ux8qsl7zG7JIFlRMUkilgU8BqMmy7IXrbuw+X1cLZ2EzVDBcK/oov45Fi3l2BzHFdsq35nIycrZlJt6J6U8QWCHe1pyEL8bPHNz1LYQtekZNLZ57jaltHCFXJfBV5tqCnInv5lY2yoPBN68jEhw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ck/6XzYEvznCFj6STwNVd4JYqiw4M2juAfSCk0Shpik=;
 b=sOk+MxyiDDMmWgERidHrlX/l+CZM/rmTadtuHHBdtALLiBDVeVIZciTFbFci+a2kLqheuuzCHxaCpjpS3lcVoVnQjdmE2VpXJF6d8uZAPl6EgHAoRPGNGb6ABQNegR8xXyv2rd6LvdyqvTufZfkNw+hVbhjrawMQj9f5YHo2tGk=
Received: from DB9PR01CA0026.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:1d8::31) by PAWPR08MB9029.eurprd08.prod.outlook.com
 (2603:10a6:102:341::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.44; Tue, 23 Apr
 2024 11:03:15 +0000
Received: from DB1PEPF000509F8.eurprd02.prod.outlook.com
 (2603:10a6:10:1d8:cafe::c2) by DB9PR01CA0026.outlook.office365.com
 (2603:10a6:10:1d8::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7495.34 via Frontend
 Transport; Tue, 23 Apr 2024 11:03:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB1PEPF000509F8.mail.protection.outlook.com (10.167.242.154) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7519.19
 via Frontend Transport; Tue, 23 Apr 2024 11:03:14 +0000
Received: ("Tessian outbound caed45120527:v313"); Tue, 23 Apr 2024 11:03:14 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: b1826c54e67c5c4a
X-CR-MTA-TID: 64aa7808
Received: from a06354e4944a.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id EA7C25B7-459F-4552-BC3B-584E52345141.1;
	Tue, 23 Apr 2024 11:03:07 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a06354e4944a.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 23 Apr 2024 11:03:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d8B0S8MiKORcnq/H1wA4jLoV+5A7E1H4A8qzw3cPfDFVcexAH1qNXFEhRpymgEYuN3RwU7jRAgaK8ImcmQqZamAJ/XeXXgi1JUfAWZBEq58i8oBUXSUZR0n3b9gC74rJS1IOVL9iMmXD09PzaKB09mEd8G03J5ItQE5CZW71s8r6YQLsMZ5f3djN+HwEhoT8ALh+c9zuSXTuC+yAyUryKW8Uq60AX3ferG4IHK4OkCsdDTfyEN+jEgXaw17l8+Axgt2fIlXstm2/tfvBWGvhCHVteAp3dLhfCmqcpScJKd2rR4GFrm4Ov35VYAxaUCkGAlmlCMqHW8Sc4JsSuLFCew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ck/6XzYEvznCFj6STwNVd4JYqiw4M2juAfSCk0Shpik=;
 b=b939S5HWOzWtQDAfkJ0MtdR9wZ0hE/DXmbQgspl4gOo9s1HkYAEDCy+DIgO7gQWhpmSuAuBbR2QaElN7+9uWycWKpovw+65ttQIQAW0gA5PRyjsIox4+CgK2SUyCDu8RoHnd6RWfNafX69LPz+t88f96NXNEx2R5L+EHk6QDRgpS8CRC/sfStke5VYyC9fS7BLisKBzjtrz40GRyz86dPlQkEvuna5JqJm1jYijR+GOMgUHeYpsTzIkLQefKUK3NrlWBJmOW5mc1uDHHI4hT+j10Qahm1l+HoIyrjvFAeY+UcNcDAkYITlZrxzH+IMpGSy30Cb/6uhVYE9/rvuk61Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ck/6XzYEvznCFj6STwNVd4JYqiw4M2juAfSCk0Shpik=;
 b=sOk+MxyiDDMmWgERidHrlX/l+CZM/rmTadtuHHBdtALLiBDVeVIZciTFbFci+a2kLqheuuzCHxaCpjpS3lcVoVnQjdmE2VpXJF6d8uZAPl6EgHAoRPGNGb6ABQNegR8xXyv2rd6LvdyqvTufZfkNw+hVbhjrawMQj9f5YHo2tGk=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DB9PR08MB9609.eurprd08.prod.outlook.com (2603:10a6:10:456::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.44; Tue, 23 Apr
 2024 11:03:05 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%4]) with mapi id 15.20.7472.044; Tue, 23 Apr 2024
 11:03:05 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: OE-core <openembedded-core@lists.openembedded.org>, Alexander Kanavin
	<alex@linutronix.de>
Subject: Re: [OE-core] [PATCH 19/19] connman: submit
 0002-resolve-musl-does-not-implement-res_ninit.patch upstream
Thread-Topic: [OE-core] [PATCH 19/19] connman: submit
 0002-resolve-musl-does-not-implement-res_ninit.patch upstream
Thread-Index: AQHaklR1406IhAlvWkS7W14czE/fl7F1tusA
Date: Tue, 23 Apr 2024 11:03:04 +0000
Message-ID: <BC1E5D12-5A20-4413-B3B2-71E2B6FC3318@arm.com>
References: <20240419121945.1920944-1-alex@linutronix.de>
 <20240419121945.1920944-19-alex@linutronix.de>
In-Reply-To: <20240419121945.1920944-19-alex@linutronix.de>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.500.171.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DB9PR08MB9609:EE_|DB1PEPF000509F8:EE_|PAWPR08MB9029:EE_
X-MS-Office365-Filtering-Correlation-Id: e399dd3d-63ba-426d-8def-08dc6384f929
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 =?us-ascii?Q?3Qhuv7bFss8lph9ZBhTQjIGP2sqdabQRzwkN37GZS6IZvBgxx0cO9DBM7im+?=
 =?us-ascii?Q?PE3OT6F/smur4f8b02ZoHNhjjrSbkfgbILotGQhlO9Ne4R5oOIMRkxUhNDwm?=
 =?us-ascii?Q?ErxWCpoZIjMCH23wkVFW0GwmkPvKJb6kjRZIeC+XpVDZVNAaEUjHG/sEtrsz?=
 =?us-ascii?Q?rfXZh8hg0+liwjCvDSJD0ZyQ1uXm0gQCqr7905ldURrXnKJwM7655J5kFQJ9?=
 =?us-ascii?Q?YiYDn/g3KhTZFJ/mLQYe0xpF/r5P2gRUBHFdDy+keyR4aJnEMOGlB9LOswuE?=
 =?us-ascii?Q?c9am4kbiLbb6OeMSM+08g7L6GsRFUND4AAOxrSzfRKtMpqCMOgjphJnMN8PU?=
 =?us-ascii?Q?pCcSBN7UgfS/kWeQEEBX8DbfHHmD+3TYrFxz0ezSCf2kp+rCHSNW6TNw6vgw?=
 =?us-ascii?Q?mr+VrqKhagEwn48bh2btGvjSPGnxn6ef16U+fa6mdofd+9V7cLcWYb92WuAW?=
 =?us-ascii?Q?KvS+C2VajfVhuoSbGmpH/1EsYe7V4ZkSWgBxXr5+IVKJwYCYSx4mLpvzvgYB?=
 =?us-ascii?Q?E7qv0sQlptaM/r+l7B6uyPSoGCFOk+Za/h/EQTYPtNbBwcgkhMqRqX8Z7XKn?=
 =?us-ascii?Q?pfY5RkRiASMSF8v4O5D+jCtqDJRDXODZ7IFLts0IAVqxZR5XEdSDum0hOGRw?=
 =?us-ascii?Q?gZcJ3RK3ILVc08baCScpmmneaAjnWAxPK1nYIM5/aGz6IpzRuUARUtLTjrye?=
 =?us-ascii?Q?W7GJYdgzmntHVkxfG8FMJ82fQDwB/9k+lIvrT3ed8Lw7m3PtaIZQD5Ng7j7C?=
 =?us-ascii?Q?OKBAJdq6dqAiUjbtpVLtgUF2rVxQZn4c1nvyEC0/IDNL8YsDZrgfhSD+vrco?=
 =?us-ascii?Q?Q9cnEnOAA6qmImrj4SoZ7V4Bu4Cwvv/YdOaYDOtjmVT5dxMPjunNhOGtY5Ph?=
 =?us-ascii?Q?WcFZVgq4elyZYc3s0kpR0Lehg2/evHSsFoyWRY9f0Xngd/9RfpBzc7HWe8BW?=
 =?us-ascii?Q?uaS22GHvyWu9u9DWv9l+XPby+5QJcejd2fJCTDmoRTtw+M9B+HxwcuCjAGpr?=
 =?us-ascii?Q?MQkdot9a+a7gSy0BvhUWako1caMIQDIf+tcVYtG7MYps7T0aiTud1gihllox?=
 =?us-ascii?Q?i5uav1ucxnD8yFo7g+dCrht7xRMcPvuoVAwpsbPdEqvL/jIUV9v+nyEzTKFn?=
 =?us-ascii?Q?s27fuOKPTJBuCQ81Bjj17159tc3Ah1k0fQsg1pA4RgbM2Ta2wUwn79+3F50n?=
 =?us-ascii?Q?2at/C0fCxXNQCjUfnfcfHg4avMMqMLbwiV9HW8X7z7lxUinMJQYRFhdI/LLA?=
 =?us-ascii?Q?AcJHrdRGwnaPZPGVYHHSMW99IUMp6hEEqPciW/bT+A=3D=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(1800799015)(38070700009);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <39D64C82545EB14285F0FD889B8A7B9D@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB9609
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB1PEPF000509F8.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	5ee6737d-7077-4c01-3f48-08dc6384f359
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?ZuZjvPkITJIAmf6B2F5K2DUQauZdACUTafROArA569bo8gCra5FUdXYTKgoY?=
 =?us-ascii?Q?VvL8Z8bdukrCXeAMtdXLuY/ZXeNsM5hkgVLkifIHQOC4gIkFIXZzNvTXwrUF?=
 =?us-ascii?Q?e75Os3MvP3sgZt0z9Zuy+ukSeN8GTHsSHBuxgz3393TknSbSjWHURQbLO+56?=
 =?us-ascii?Q?jjeQ/WJk/FMf2M4KOXhL1ql2A3oLy7wnO7+5J19lvHs3u+TOGVGQfo/AFnQV?=
 =?us-ascii?Q?NvP85pPnnYLAu9J8cl2C57qxOjNPbqomYPZnvYFcfh9ygntBCNHKtkOfPe/w?=
 =?us-ascii?Q?A8GFstYPtpcO5Ao8eKa3KoZCrTTLTUCz/1lBY2/L3Uo6iz6PAGPdGcbYftZd?=
 =?us-ascii?Q?vErCcguMHvAKNLsg0IhFRIdk4nkqfCJXwRsQTDirZRq6eYLdECY+9yuWTWpO?=
 =?us-ascii?Q?/AvaOojmgNWnAH83Q7bwUgq5d5jyDUf3aWUxvI+tNd/+cdIvZQDkwr+ONn4c?=
 =?us-ascii?Q?LO2uzukrzYQOnGHs213Xy4xl0WxiqD6RmsY+sjylZ4ZCMQpR9jIkQG2N+g6m?=
 =?us-ascii?Q?AyuPqDlnNkPLFOjvcwgmAvre16VfE+DuQ0ewo+w3izkZcBMLau3Oj8eq0KKl?=
 =?us-ascii?Q?gUIoISdNzdb5UaEnZHn+nTpRHXnhQ1/UMTAQEymtZvwXioZ4986jWIez7jB3?=
 =?us-ascii?Q?oaQATEWjZ5dMx4z2+ymPzUbed0u2Uayk1UzxxlJ3J8zC53tpNLGf4bfl+Kov?=
 =?us-ascii?Q?/Qu44kIHQ7jBpgSFdbOksOqPtN0EhHePseCPHuoOqWA6Oh0v4bpj11RnKS3W?=
 =?us-ascii?Q?DvJHb0L0YE8QGI7hYDaL3fq9DGWcWRJORKy91F15hJuKFUFBjWx7kV7glZGV?=
 =?us-ascii?Q?mrzCDdKCT+X6g4Ctxs4h2CGv8PMzYsve5C9oRFiDVoKT/oEiNeFjdAJT+ZT3?=
 =?us-ascii?Q?3Kg7UWGazI3rM20YycjnmTgSVAOxjSPVK2VpT69Gu+vllic3dlz+v6hZxhwu?=
 =?us-ascii?Q?rNMPlV8ajCwSnprmWJ8VZ1R1fvFYWYJBr/1Z2iFcCboOzrbyscczbME8Mm7e?=
 =?us-ascii?Q?k3dDgEwvBddeOfVnjubtam3x+/98igNT3OQPPtDTmmua3VBpf0XaRE03DK0j?=
 =?us-ascii?Q?+4FJBsA24Wwuv1GVfvoDbz8zeotGu9jF3/HPVMFiod1b85yiX7djviw5+BeT?=
 =?us-ascii?Q?I6LCI6vjbYnWd0/gmbtbTpVa4Kmy5qDBYrroq4t3ExTXpfn7TcQ9zuRzph6N?=
 =?us-ascii?Q?RJSPibcdLFAY8rnqKpXarp5K1qhA8GmMJdmy0cWOc9XTzIx6954/UfQXa5F1?=
 =?us-ascii?Q?2ioZB4Ch+iR99A2KIQhyY/Y6QDNqQxBXYhD3tfo35wLrdMRDVru7Mc1dw85e?=
 =?us-ascii?Q?nGBNB8HqhEA/yoQJYw+UVBnc?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(376005)(1800799015)(36860700004)(82310400014);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2024 11:03:14.6850
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e399dd3d-63ba-426d-8def-08dc6384f929
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF000509F8.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB9029
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Apr 2024 11:03:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198614

On 19 Apr 2024, at 13:19, Alexander Kanavin via lists.openembedded.org <ale=
x.kanavin=3Dgmail.com@lists.openembedded.org> wrote:
> -Upstream-Status: Pending
> +Upstream-Status: Submitted [to connman@lists.linux.dev,marcel@holtmann.o=
rg]

Links to the actual posts make it much easier to find any discussion in the=
 future:

https://lore.kernel.org/connman/20240311110918.1399173-1-alex@linutronix.de=
/T/#u

Ross=

