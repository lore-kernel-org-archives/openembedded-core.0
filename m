Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD1E1CD128A
	for <webhook@archiver.kernel.org>; Wed, 10 Apr 2024 16:00:20 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.45])
 by mx.groups.io with SMTP id smtpd.web10.3767.1712764810219252097
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Apr 2024 09:00:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=nRhJ7ETe;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=nRhJ7ETe;
 spf=pass (domain: arm.com, ip: 40.107.7.45, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=SADZR7/EspKin85L4RTwB4wMxw1yL+WMs2fzHwUo8OfttR+2qWfCiBwDHeawt+lnf2/t05tVQO3rcTVsp3x4CDLwEyMDL61lGSSdNrFvGbFVklfuqZDjmnDzx4mWN/NaBfjAsCJ13RTPRvJD/WDii59NQA8+HxNKFuLOzVeIPNoS2bBX/DgZJw3HAEiiNnXCSqceckAin+vLeYSgug3dvKDSNPXgU4d2VJeN5ztVg1azPqvzbbdl6Q9YzffMNb9MkJDr7n36ZeBCH7eAoftGUjxjWjhZ1IivWjZGV728nXmSplddh5aX4wT/k03L4HDRka4Q6LD+31HKD2UUjQz+8g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nDpWkA1duTS+VsOvRer6NUKMGQ7hWFytAbJwVw1HX+Y=;
 b=HL1ko8n3JvTqlkWLqAb85IXpiJhCGb7WB8nUhGu/jr9CUeqwyrxcdrtmVBxbMtdmcrlwaSKk1Qe7wB2ebzYpuoXH80K8RhWtjeY6o6VVbi8Vgtaaqql6jDg+ao9uH6J5Tyo48XjcX2rtB2Ll6JMnQrFkVUPbO9EFUYvh6NENf0bq/U40IpS4IMfaX1ak7YcsTm8+LDrecnM2Gc0Tz0bievVOut8uUdlx6YgcuBsKWov2f16zfk1AzgzTci7wdInMO4yZa6XwFTEI9WcM38p522bLE1MibeL70lB9d8wWhZ7KuYsv2Pba5AXPLJa3pYeKI4OuIOzrQW/xdSiiwQLgEA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nDpWkA1duTS+VsOvRer6NUKMGQ7hWFytAbJwVw1HX+Y=;
 b=nRhJ7ETebzNmu1lKLHOEiI6D9FgrJ0KpNTHnKZbNzSw52xCEAz476fVu/Jhvo1MR+qi9jqx8Z1nDOPsPY0+5DoigLBVWgElrpwrTNYmeXYjnmbd/adudLq8O9+JAMFygDrpZ620UfR+wGoA55vxmXiw3WdV8k7wA60gY/lnHj2s=
Received: from AM6P192CA0095.EURP192.PROD.OUTLOOK.COM (2603:10a6:209:8d::36)
 by AM9PR08MB6178.eurprd08.prod.outlook.com (2603:10a6:20b:2db::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.55; Wed, 10 Apr
 2024 16:00:06 +0000
Received: from AMS1EPF00000049.eurprd04.prod.outlook.com
 (2603:10a6:209:8d:cafe::3) by AM6P192CA0095.outlook.office365.com
 (2603:10a6:209:8d::36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.19 via Frontend
 Transport; Wed, 10 Apr 2024 16:00:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS1EPF00000049.mail.protection.outlook.com (10.167.16.133) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7452.22
 via Frontend Transport; Wed, 10 Apr 2024 16:00:05 +0000
Received: ("Tessian outbound 9d16f63426bd:v300"); Wed, 10 Apr 2024 16:00:05 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: c0a35aa5476b9595
X-CR-MTA-TID: 64aa7808
Received: from c3663bdcc906.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id A3B42D8A-0F13-435F-BD62-672E60E7F259.1;
	Wed, 10 Apr 2024 15:59:58 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c3663bdcc906.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 10 Apr 2024 15:59:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nMHBRnyRSa5uJh81beiumvNOKWuqYhQiquB+x5/flywWYRLDbNo2i1Vk7uuj+2QjLXngTDXgW3j9tlk6NEDq14TbDvsSG8BS6WJTXghBr9nnzHkB9dEdnp2OT99e9xjLmQUNH343DFpPXMBOerF54O9n0LFxgjvCZ3CP1CUGr6JeFCtbEN5X/XFxT/grcg4UuifXuvC9Su6ZbEmkC9im0OXnAy9aU6RdjrBcp0l3rPv7XUgF0hIaONrY/AuJzZ7vaKkNDYAUdpayM8ofLMXIVQQ7pRjsIJ0auneIIMx9orG7Q40/XvBuLJ1CLoJxOng0ybIDHajrugyrKRZB6Md8Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nDpWkA1duTS+VsOvRer6NUKMGQ7hWFytAbJwVw1HX+Y=;
 b=Tx7U/AIgyQa7kopwSbyGG+8kGE4B4p5wUkA3ywYV4P5pMw564ov9pXgUHgfgpr8KXoBcw5F99+gYtU3fntztmdXmh5y0DLrTWKS8wgmUS2GEpbFuUHlPhjNpe1OWBB8gvEI+lyEkfW5nodiBLXy6jZjL17G/Q2laAFzY2hpsHN1W1r4wbjChcTXCOBYbAQKOpkOHxxkpcYTsKqXje5FMRoHX+4B55lyo1Fgq10ToXSH48s/ziA61liGHwyqxxd1wvmwFoKfqLqB/dfd5Rd+sYEAZatYRFzHO/vaZXJ3nCBuTGVHp06Gi3YCslHXhbRKQeVtNrxC7Xoxfop7kAzfqhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nDpWkA1duTS+VsOvRer6NUKMGQ7hWFytAbJwVw1HX+Y=;
 b=nRhJ7ETebzNmu1lKLHOEiI6D9FgrJ0KpNTHnKZbNzSw52xCEAz476fVu/Jhvo1MR+qi9jqx8Z1nDOPsPY0+5DoigLBVWgElrpwrTNYmeXYjnmbd/adudLq8O9+JAMFygDrpZ620UfR+wGoA55vxmXiw3WdV8k7wA60gY/lnHj2s=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS4PR08MB7406.eurprd08.prod.outlook.com (2603:10a6:20b:4e1::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Wed, 10 Apr
 2024 15:59:54 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%4]) with mapi id 15.20.7409.053; Wed, 10 Apr 2024
 15:59:54 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "peter.marko@siemens.com" <peter.marko@siemens.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][PATCH] systemd: make predictable name mac policy
 opt-out
Thread-Topic: [OE-core][PATCH] systemd: make predictable name mac policy
 opt-out
Thread-Index: AQHaiYND6p/3Rsy9aEO8Y3h9yFvSNbFhrS4A
Date: Wed, 10 Apr 2024 15:59:54 +0000
Message-ID: <DD50CE1C-F584-49BA-845D-ACA0F3B91450@arm.com>
References: <20240408070450.27686-1-peter.marko@siemens.com>
In-Reply-To: <20240408070450.27686-1-peter.marko@siemens.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.500.171.1.1)
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS4PR08MB7406:EE_|AMS1EPF00000049:EE_|AM9PR08MB6178:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 MlFurdnLLSUJ6wxga/xkK2XybwhwvsO/KCFfzWtUSsXduZAUYUhsy418nHeHgO4NEshjIEyMpga6n3iDCHyfPVFsCvf29oV0CnuLT1U+6YSprKud5OFDjwO6Lzk8yqXSsIcTfqeu/W1eL2oWu0mMlmZQQrPUQP9v5X6hisiiJqf5pSrGxD9eL1xuFLl+z6FkMSaUE7XwLx6fcoHh6QBVZhfP6yf7+tWs4wCpOnlq6RCjXysa0dyHFgJHXCEmkM5gWdYCx4vVVK0zMtnTr1zNYyFUbjhoYaPLwN+QiidzGhD8oeE43iFmRut8SbE7i7+bF1Iof+TRnZ/uec0NBA2wJlyHmf4RBmPB6lOxV7Q6yGRZVZa8wyOLUWhj8L/k/cLxhKBDR4wJc7Wmrwk1nxyrM2cwvz9CSFavdkxFVawDRVJrJWQRfuinvrldfHYdb1b88XNrih7pWPuY7tLs7G+ci8wrkOi91M9o9axdClXUZBo+SuFK71OzDukqsP7CHEG1Rq3qq53BSMnsnX0QPdvCXbvWmaMbDiAJuLe2bQlhOcQqDtY6a3Fl0e8OKIG4vJbMVY4FAvuOv1WoHCVeU85IPqBMVH99lAqDt+4vWCDSnwhGz0E9yH32VN+F8ixMOs014iTkTpg4wzIVoFoSsgOqkKBAK+IoT04tINjX2mlGsVo=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(366007);DIR:OUT;SFP:1102;
Content-Type: text/plain; charset="utf-8"
Content-ID: <8710FD92CC64FD41A68970F364400C90@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7406
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AMS1EPF00000049.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 928e5490-361a-4237-c87f-08dc597749df
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	XiBh6t5xy0xsTYNa65wRB7yhrTOQz8+/wMGilfNvzh7nYqTH34ANvAb+oPJVBBWrt4tCIQ52grWc5QL5xzU2i78Uo4d3WfFEygz2FbfgwfXBMFdASHQrW0HMnYiVVjjpzBpsnkjE0BY8FZwfDCkaQo/T47iarvgmVlXQJzs759gmGydRVi9ginlB+knTmV8R9P5kFb8gDZemssD5RdWlHciWM3qxBJPD7ABE5mLiBOikEZTbbie506quJZYtIZ1mPwzNDMICWYTzH31ewJEx4D6lyg9u8pRavavQL0MppbBTA/hXWrbCMAdLRZdVD4w7pvEYSu67Nvp+OHjbcmP/pqVw91wQ40rCbJ+hm0yXTayjtNXcryZNbF1d7fS6PE8/TgUqKwWjkbt1oM6b6Ittx8MeDLKV+3bxC/7v6Fd+b6u7hcgy4etftaA55zXjZI8lINNJ5i0lgRPDkJQShi6trq1H/jJAP5idRergO8NP48gt6ygCJAOI+VYfl9pl8Ny97fYML37psl1PfSlHcGdOUxbbddOZ231A3QE3svDdZzKcFQuLvR6dtV41XNrCt1xEKjhEyMiCgm7/z1CSLQFGuXe2ElFC9zOSIikv7/B1G55cZoovohjT0dNuZEB0eaDt4ccOY//EvztN1lpOCh+OpCqmnC5DNrzZ7Lb0NtKs0xbe7tZKXPWkklT41OCjlS9elDRISBqllmh9gLRmEZbWBJpXB55YyGabuczUKoqcR6K5rN1nKLPsqZif5/j/EDkP
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(1800799015)(36860700004)(376005)(82310400014);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2024 16:00:05.4681
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 928e5490-361a-4237-c87f-08dc597749df
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS1EPF00000049.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6178
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Apr 2024 16:00:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198101

T24gOCBBcHIgMjAyNCwgYXQgMDg6MDQsIFBldGVyIE1hcmtvIHZpYSBsaXN0cy5vcGVuZW1iZWRk
ZWQub3JnIDxwZXRlci5tYXJrbz1zaWVtZW5zLmNvbUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPiB3
cm90ZToNCj4gKyAgICAgICAgICAgJHtAYmIudXRpbHMuY29udGFpbnMoJ1BBQ0tBR0VDT05GSUcn
LCAncHJlZGljdGFibGUtaWYtbWFjJywgJ2ZpbGU6Ly8wMDAxLU5hbWVQb2xpY3kucGF0Y2gnLCAn
JywgZCl9IFwNCg0KVGhlcmXigJlzIGEgZmV3IG90aGVyIHBsYWNlcyB3aGljaCB1c2UgdGhlIHBu
aS1uYW1lcyBESVNUUk9fRkVBVFVSRSAod2hpY2ggcHJvYmFibHkgbmVlZHMgdG8gYmUgZG9jdW1l
bnRlZCksIHRoaXMgc2hvdWxkIHJlc3BlY3QgdGhhdCBJIGd1ZXNzLg0KDQpSb3NzDQoNCg==

