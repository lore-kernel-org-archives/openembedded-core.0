Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7F18C4345F
	for <webhook@archiver.kernel.org>; Wed, 17 Apr 2024 15:49:53 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.88])
 by mx.groups.io with SMTP id smtpd.web11.17411.1713368988751145079
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Apr 2024 08:49:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=aqO35Yxf;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=aqO35Yxf;
 spf=pass (domain: arm.com, ip: 40.107.8.88, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=KR3RkQDEV2abH+XTFyt98ISfh2sprpWbXx1b0grmzBzSTf29zkN09oJYXStk7LDFE978SiEO1fuZw5Pyk8wpVul12PI/0xUZ/hjba4r3Zh4QC+0dSN8vC/sQv5oFrnbmeTUwiha9w9C+Kpsh0Jv6D+XI2Z7umCPpgl20/p1nXMxMsGniNuhJiPvg+JqY/IaaPpWUGDavfp3BCz/kyQPxfta3aPWQTVnAKY9240byp4EeQs0qY/pkFTdUFqpWabWGIynVFAJCXvkmcZtt9i3EILADcT1eLs2Et39zMo+LN2cH/VtvBohE0sPMSChOuNgr+sxU6pZVN9/3ICEkB0AP4g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iR9e4gzdS9gtzzUQUTvaKer0JA0CkX4x6TLM6aOto+8=;
 b=LF/WjN1VFIZxR8TI+puAGNn9OIoDe6FkpFMqEExArnDFgbWUbEDkolfNtIlTOLPXNS3um5tzO4ZdlCcu+eUoNnQfMxc0AbX7TB5cTLaCP8O4NnU3qniLpAIH+CqyGldGwWUGzpsi2E231RBpmR8w66vNiNAaUTeDGDVxsJoa+K8NNnMiTc/jBrgEI9Bhn3+qUzIp+4ZTPCzDhI5iJSaCzobFgAmOfv5a4eRmSdCfLvYHgsk5iR6EM7xR/rMFi6stIAU9a4X5m/GqrdEDtPJ/Px4CjS3sAobj104PqwPZnG91yvg5gq7iGkyuqZKfsRwQfwgFe7bQ7bRQLyOa/DXz7A==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iR9e4gzdS9gtzzUQUTvaKer0JA0CkX4x6TLM6aOto+8=;
 b=aqO35YxfyPt42IGVd57uIi2o4b8/E2+pYnprHTe8cVrtgdLUZK4Miwb7bNAIaQ39IzrTEdY26P5k9uCTkMFd/Zn6I9URpqKRf49C44Yan2MnAvMW7TjkMWjhwQ+NxVN8yqSYiWEjmsQKH3yU8o6eWN1nNs6LQbr1TeDl2wJysyg=
Received: from DU6P191CA0010.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:540::7) by
 AM8PR08MB5745.eurprd08.prod.outlook.com (2603:10a6:20b:1c5::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7452.50; Wed, 17 Apr 2024 15:49:43 +0000
Received: from DB5PEPF00014B93.eurprd02.prod.outlook.com
 (2603:10a6:10:540:cafe::ef) by DU6P191CA0010.outlook.office365.com
 (2603:10a6:10:540::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7495.23 via Frontend
 Transport; Wed, 17 Apr 2024 15:49:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5PEPF00014B93.mail.protection.outlook.com (10.167.8.231) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7452.22
 via Frontend Transport; Wed, 17 Apr 2024 15:49:42 +0000
Received: ("Tessian outbound 93e51b94fd50:v313"); Wed, 17 Apr 2024 15:49:42 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 170240c7ebaefb20
X-CR-MTA-TID: 64aa7808
Received: from 16a662eeb7cf.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 91F67A43-6578-4CC7-BA39-25E3750EEAD1.1;
	Wed, 17 Apr 2024 15:49:35 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 16a662eeb7cf.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 17 Apr 2024 15:49:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mk2Af5RIEcluLicEKXK9dJVpPIOfPPw9PP/bICouHjRyB+pEqySTTTQ3vppLRHNWhgpo/qCfRsruh6U7XX0X4lbEuNrJdT+zAm+137QuNG4VFgQJKMDIXvmhmBgCRu1Kd9MFgl8E3UE3Meem3T8mYMnS7e0XxpxeUotp/Azw5zDZqBr+vXUdTIYbp3xYcfZcP3JwOsLSENZbAqvbO1tAjRr5eCNJu3HtB5p8GafV+/nQoalIkWRStsUb+y4EMVJWAjJ39RneKFKOMru8mcGi0yVSwyJFZl2/FJGH67nLPlT85z8f1Dfo7NLFbsvS24NsUYmPE2yGsKQNKuzGzgF2fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iR9e4gzdS9gtzzUQUTvaKer0JA0CkX4x6TLM6aOto+8=;
 b=PxhNPUFLW26f3LyeS3XDIx0c82pVVhcnrgfRnq6+/ht2Ialr17C8MCoz514uO28XfK8nge1gp4CbAdaLZj++WNCd24M8M8ELOcRupuWQnfwoatM6FEDGTP3opkvsEDK3qa02bsCM7FIathEyfhA1W0HO6aSZgB7i0frieYajr+dAyinVzQiAl7LeLUmMY7Y76gsS86ugO/SX8/MdlI2mENYzrPPBdPszezUfnVbsoq0dAn4L3q36+6jyXqNmyAZ0AxRDXy05YNoVocTQzQxNWy5AkmyN5ifEZ1vIoZk5ZyN2aO50yLjcfr2ky+9sTrvCIxJ5rEKgowLLiNaqRW1gRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iR9e4gzdS9gtzzUQUTvaKer0JA0CkX4x6TLM6aOto+8=;
 b=aqO35YxfyPt42IGVd57uIi2o4b8/E2+pYnprHTe8cVrtgdLUZK4Miwb7bNAIaQ39IzrTEdY26P5k9uCTkMFd/Zn6I9URpqKRf49C44Yan2MnAvMW7TjkMWjhwQ+NxVN8yqSYiWEjmsQKH3yU8o6eWN1nNs6LQbr1TeDl2wJysyg=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DBBPR08MB5899.eurprd08.prod.outlook.com (2603:10a6:10:208::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.37; Wed, 17 Apr
 2024 15:49:34 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%4]) with mapi id 15.20.7452.049; Wed, 17 Apr 2024
 15:49:34 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "emil.kronborg@protonmail.com" <emil.kronborg@protonmail.com>
CC: OE-core <openembedded-core@lists.openembedded.org>,
	"rasmus.villemoes@prevas.dk" <rasmus.villemoes@prevas.dk>
Subject: Re: [OE-core] [PATCH] at-spi2-core: set CVE_PRODUCT
Thread-Topic: [OE-core] [PATCH] at-spi2-core: set CVE_PRODUCT
Thread-Index: AQHakNKUl0AUh6e/i0u9IUH+LdBIlbFsnAmA
Date: Wed, 17 Apr 2024 15:49:34 +0000
Message-ID: <A027C9CE-BAAB-4B81-9A17-B8B95E1837CB@arm.com>
References: <20240417142100.56518-1-emil.kronborg@protonmail.com>
In-Reply-To: <20240417142100.56518-1-emil.kronborg@protonmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.500.171.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DBBPR08MB5899:EE_|DB5PEPF00014B93:EE_|AM8PR08MB5745:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ccc107f-e9e9-4753-e918-08dc5ef5ff93
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 OLyrNPCoe8dg6O7laqdLj3/xxPr7juw8sh60d1ODsMegv1PM2hJY1aOFFqf2WvDjoz3L6Njiapaz2A3hOEfDwL8PK25o2uOaTIHf6lJhW4Le8rwFEc/r32E1EuL2dhdeN6NYHOwoHEeBiACcP93daluj8b1dMOnJn6dQiIBN9/KoE09l4+xNOqw1OZbmZHoon5YijpaLd2J1xAT6Fzy97wcMOTahAzJzzxkKJDkmvA8SM+1X4mJ2lxCxJ7WEaF+lcOS6HQdPO1Qo3QMpDrxRZgk2vysGGpcoSpQt3pWqT2YXDUyG8Wl+tkP/99TKUtLv7LRS4sB5CANlbUDHdLU8Yj8F8tbOitzmYgPmP8Dc78LMiMn62qjxnS8qUeUWxz2cXBeZmUHtDtaFZikz1M4J+V6S4Q7/7FUaqWuuOOvhkdyTIGwO9JAct4GwuI2F6CtqNK6KJ5xDprHQsDHYxWmM1A8pkpEzd7Xvu/GOaoz7SziZ48WLaKWG+YOjelHsXn+CAA/wiNUCO4mkm8vfMD/8bj0FgaohQyKDa//UZ9tTdSd56KKIM3s0ZRKAHxzD5FpLtJ3itiPc8IesTY2Mv6Ci1H0QtfPSVLN02wavwIru3T+nBNNlPygyWyPWwc0f6Zlrs2i6XibcQCCR73hUXh3b3duljRFsMx3/bS0sYkeuUJ0=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(366007)(38070700009);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <898A53241DB497458C0C45FAD305471E@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB5899
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5PEPF00014B93.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	17b750d5-e001-4c49-45e7-08dc5ef5fa83
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	aop36p4mpF76y+FVAvCq6inMWuf5X1Zy15YrFab7sX7V1zVuJCHUt1Fph+VIsQI+ENEQF88gUN9U7mdx1/Jn+tZrVOfMi2Y1oD3EJDUFPUqXGpldBMhPUzOxBF9ixG3MV8+TiL4968r2Tbde/FQWtC+0uknAvMBDxhRnzge6GjCJzh0kuVNApigZGXgQQw3Doci7VucxWnlrgaF3PkGz+PNaUMqvHpY2BMzrxlk9AXEuVxy+DgMMkEFBFMJt96DeEf1WLlk5JfMMXmbWn1ughNNd1z7s5a80QkwVssJKttNebIY4jXwgzCTZIQQuLmsmGkfid5ePgwWRuYq0/6f7fKtxJlNuyAJUzQnL4eervP2ENMMaFUh88bR7s/etmUFjLCx3zdddVN5TCN0lSGIOkiUyL7vhBm/RQd1TVvh0TF/a3i49Wv/1shmKsvE7tJH+wyWvKqF9dibWKM1i3VnV6P9cSoTXW+DNwVZ6JBNuX2sRbQard2CIJRAlxXMc94j7AXWF7kw+asjZ5SCIfhM88xLK37hW+Fi6LBT43f5wpL9pk7ic4Q3CVCPQ0wyrXuEyq503iPTVcUe/bl8G1PWnKAjJM/4CuS8YX6FHQwttCAVg3bbq7E5WtjpW/9JCmHKUz7ZOhYp4GG2wJFsMnSXvGEM6TjWLlmPQMZdFjhF65SbmfoWglgHVMGKXyTNEUaGRNHlWySyYn1cYPnz1hBHKSA==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(376005)(82310400014)(1800799015)(36860700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2024 15:49:42.7649
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ccc107f-e9e9-4753-e918-08dc5ef5ff93
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5PEPF00014B93.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5745
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Apr 2024 15:49:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198469

T24gMTcgQXByIDIwMjQsIGF0IDE1OjIxLCBFbWlsIEtyb25ib3JnIHZpYSBsaXN0cy5vcGVuZW1i
ZWRkZWQub3JnIDxlbWlsLmtyb25ib3JnPXByb3Rvbm1haWwuY29tQGxpc3RzLm9wZW5lbWJlZGRl
ZC5vcmc+IHdyb3RlOg0KPiANCj4gU2lnbmVkLW9mZi1ieTogRW1pbCBLcm9uYm9yZyA8ZW1pbC5r
cm9uYm9yZ0Bwcm90b25tYWlsLmNvbT4NCj4gLS0tDQo+IG1ldGEvcmVjaXBlcy1zdXBwb3J0L2F0
ay9hdC1zcGkyLWNvcmVfMi41Mi4wLmJiIHwgMiArKw0KPiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNl
cnRpb25zKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvYXRrL2F0
LXNwaTItY29yZV8yLjUyLjAuYmIgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9hdGsvYXQtc3BpMi1j
b3JlXzIuNTIuMC5iYg0KPiBpbmRleCBjZjIyMWUwMzg5MjcuLjJhYjQyYmExM2Y1MCAxMDA2NDQN
Cj4gLS0tIGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvYXRrL2F0LXNwaTItY29yZV8yLjUyLjAuYmIN
Cj4gKysrIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvYXRrL2F0LXNwaTItY29yZV8yLjUyLjAuYmIN
Cj4gQEAgLTcsNiArNyw4IEBAIEJVR1RSQUNLRVIgPSAiaHR0cDovL2J1Z3ppbGxhLmdub21lLm9y
Zy8iDQo+IExJQ0VOU0UgPSAiTEdQTC0yLjEtb3ItbGF0ZXIiDQo+IExJQ19GSUxFU19DSEtTVU0g
PSAiZmlsZTovL0NPUFlJTkc7bWQ1PTRmYmQ2NTM4MGNkZDI1NTk1MTA3OTAwOGIzNjQ1MTZjIg0K
PiANCj4gK0NWRV9QUk9EVUNUID0gImF0LXNwaTItYXRrIg0KDQpEb27igJl0IHlvdSBtZWFuICs9
PyAgV2UgY2FyZSBhYm91dCBpc3N1ZXMgYWdhaW5zdCBhdC1zcGkyLWNvcmUgdG9vLCBzdXJlbHku
DQoNClJvc3MNCg0K

