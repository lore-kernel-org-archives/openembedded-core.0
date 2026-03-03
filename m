Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58E7AEDA687
	for <webhook@archiver.kernel.org>; Tue,  3 Mar 2026 15:21:09 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.16])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.20960.1772551262334432821
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Mar 2026 07:21:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=Nt+FopwD;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=Nt+FopwD;
 spf=pass (domain: arm.com, ip: 40.107.130.16, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=Zwu3IR2yBd/WJPOtIeO/xYDgULsqMbx476jBIZHfhOTLPGpkdVhfrjK+cIls3UBXTlX1DhPqA8TJZeqza/Fs6keHxfQ8nJUtySzPwaH6r7YPvxhDSWId4b7mfxs+g5VRpOVJSpngb0QAyZ8SStWgsqmV3Qek85sBkh1UK6/jKs9G3/ciziPLioZSiQsafFnFYcx68NAzqRbIyim97xhZuZIA2CfnfvCqvzi12xWDtc0u1yxR0+1ouFtbDQJI28tPy8H29JyzJNCsIMTCTImG5ZnnKFM2uuUZ4gVDMJT/SvSwDt4Ubkq+ep1ooVNreWsIpgLBOuEHFUWo75mOVZSeIw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rxJh3xjEXlvkjIxd3SDh0GWU/AdGla3rd7yeQZlaLz4=;
 b=wSfRSNb0Q5rdSa0DXu3DSMBiBB10OPYDYX8YD7LbQH31K11gKPHZeymxGt9Zkl8zFAAllVJ0Ppj+AZfRPiF1y5gYC4uaXm6wPTy7jSlZ24F6c1YT8qASFC1EmFA3T9vHLOdCvoQthYjXRKx6r+2KkFCwGTnVk6iiAz4iN6nkT3rVQE99Euxe9Ti1NwJ1Z5cazr3AqEGo1Q5cuxi2siQrRhdJuT12brxbw6j/qanljdilikHixngCTJAARcOsLUJZuq1ToRZvo+ccHbQ9c4GnMgLZ7sVcYHWtbr7v0+RrwBwgs7KPpwWnBfCUFdZn1bk9LCDJ24LShzn3lfYSL2W5Hw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=cisco.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rxJh3xjEXlvkjIxd3SDh0GWU/AdGla3rd7yeQZlaLz4=;
 b=Nt+FopwDNpyQHAKcebsN3bXvw8Z21a9eEVwo9tTK5KDVtf4rLSYDexGjA9YzpAUb99mZcZGUAq40lHCEmc4Vt+CkvOrm9Mu9DgKAM1FkMyt+d87Re8uCddGkoUuUs1q33nXqFdFentJBUXU6+SdIhflKoYk4Wxo0UdxBIKV/jx4=
Received: from CWLP265CA0538.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:18d::11)
 by DBAPR08MB5559.eurprd08.prod.outlook.com (2603:10a6:10:1a4::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Tue, 3 Mar
 2026 15:20:56 +0000
Received: from AMS1EPF0000004B.eurprd04.prod.outlook.com
 (2603:10a6:400:18d:cafe::6c) by CWLP265CA0538.outlook.office365.com
 (2603:10a6:400:18d::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.22 via Frontend Transport; Tue,
 3 Mar 2026 15:20:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS1EPF0000004B.mail.protection.outlook.com (10.167.16.136) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.16
 via Frontend Transport; Tue, 3 Mar 2026 15:20:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n80nKveVc+NZv4v7LU1DaOhG3MTlL24QoPHjv3Q2LE1acVP78RU3cY63VVdyoWKg9xMsR1cZopXrsuWcvpRsY20YKdfjpXdPmkcmGSo8LYB1sKbhNvUMscXCmpDbuZow6Vyzl8IzL0XFCW5dAmTnO/zRdsw2xFQmoc9mowAtwyncXiEMoCa74QsiUUKkMpayzJnUkk8ue3gejFqNDpMl+udRLFoSiZ//zYZ2vcRNQCFjbkfQWOoLGw8TQ4KuQQ7gr1hvkqNdcIheYzyhgUr5n/cqH/ZVfxw3qeswa8Pr0rIfq9dNy6G+11wVPRW5cay4kkDSJNwYpdZRvoZ4yJ7bPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rxJh3xjEXlvkjIxd3SDh0GWU/AdGla3rd7yeQZlaLz4=;
 b=aIYU8k/u4PQ+4WArzTkIErcADLH2UigZ0+4CzCRkwU67q6CMeKGN+Vttm6uOn1hixrL5SC+O1/ghJA/hgCa1IAbWgCJFvMdu6GoqWdKE1qRp/5EIroBO9Q40nT9CP69qePWlNZjoHzeBS4IgBa+c+sqXPZfOl0KB0BINQh2EjhQ3gjKszUkuK4v8oolGd3AQWiC3BmzLxiEzHdHKJEZnOEA2sFV8Hhq5pFpGk+to8Ndy/6/LoNjCmn0YApUOp5XqPMsRpGPaHsW2JbH+BJQ7hFJq80BekaY/yg6sX2nWhmaDQOdqd7MG2thhnn3flB6i3Q0QF3caEryHyNfcFCdxdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rxJh3xjEXlvkjIxd3SDh0GWU/AdGla3rd7yeQZlaLz4=;
 b=Nt+FopwDNpyQHAKcebsN3bXvw8Z21a9eEVwo9tTK5KDVtf4rLSYDexGjA9YzpAUb99mZcZGUAq40lHCEmc4Vt+CkvOrm9Mu9DgKAM1FkMyt+d87Re8uCddGkoUuUs1q33nXqFdFentJBUXU6+SdIhflKoYk4Wxo0UdxBIKV/jx4=
Received: from AS4PR08MB7429.eurprd08.prod.outlook.com (2603:10a6:20b:4e1::9)
 by AS8PR08MB9338.eurprd08.prod.outlook.com (2603:10a6:20b:5a6::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Tue, 3 Mar
 2026 15:19:54 +0000
Received: from AS4PR08MB7429.eurprd08.prod.outlook.com
 ([fe80::9c90:b612:8e37:fe68]) by AS4PR08MB7429.eurprd08.prod.outlook.com
 ([fe80::9c90:b612:8e37:fe68%5]) with mapi id 15.20.9654.022; Tue, 3 Mar 2026
 15:19:53 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "hetpat@cisco.com" <hetpat@cisco.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v1] python3-dbus: Add CVE_PRODUCT to support
 product name
Thread-Topic: [OE-core] [PATCH v1] python3-dbus: Add CVE_PRODUCT to support
 product name
Thread-Index: AQHcpx8Mf+lpKiMulkW6UFm/YOHyWrWc9BSA
Date: Tue, 3 Mar 2026 15:19:53 +0000
Message-ID: <2A48C2E9-A501-4B74-87F0-16A831DEB842@arm.com>
References: <20260226125415.53196-1-hetpat@cisco.com>
 <20260226125415.53196-3-hetpat@cisco.com>
In-Reply-To: <20260226125415.53196-3-hetpat@cisco.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.700.81.1.4)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	AS4PR08MB7429:EE_|AS8PR08MB9338:EE_|AMS1EPF0000004B:EE_|DBAPR08MB5559:EE_
X-MS-Office365-Filtering-Correlation-Id: f1b8862e-9628-4f59-19f3-08de79387766
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700021;
X-Microsoft-Antispam-Message-Info-Original: 
 eeIxc4v7b+FikJJncNl0HSg7JG+4enpfA4954tqJhDXP5NXsM0K1L4H280F+8w7IqXB24W2aPu3MJ1vZYupo9c/13DB6qKJQ493rzlEgK/d5nWOjPs7a3awXMIWwzfx6wPEK/7zW4aCZ3OvE+39tyQMk0lqVsxMOBvUZBju39+mi9LuMlhaKC/EhDgdjIFwpj/wJbQ5ou4mAtMGm2Tq3Z8D7Sqj7RbYAoyEWKFmlii56PsDNAvAsPzmSo2MUktWCet0i6yhszrg3NtyAvxtXKwr6q9DKpDbtILuWlP1bnfxTToDsO9uj+InfbacJHcabhcvidfR1xOSKtrJAlJxYLoo/xV9gtpWSIOlPuiRzcaepdDh5Dt6CNJT8OADJUaJdMDot919Yywz4QkM7CCXU0iKDwTzncBVbs2jIvfx9nNHhs3oQVwx88mDiQwJS/jFJ9S7N7e2mAF4A5XG3YkPCzzYgOnK7jga6UxJb03JVZqsIBmG4PeLH+qwUBU6WbzNsdqqAmsFJVfl4y6TO71NR/G0F+Gj+ehwgyUArJng5wWrz2Hp9sK+2MnkmSyqRCFNVz/wPVTSm6jQS/VI+JDgKOgmYF0ZB61y6TI1T/GYg9Viivs2gDJGMGRtninJxjEpn5ZpBu94BLCJmCdi4Swv0Aj5P8VJKvoEBVLOh8mpyhnNwO51r6o5e3HxfJFGZM50Oc6sdSgqM4Lc7MKy4eSQ75dP1rGK9WPm56TRcTnan43GqBtzpE/cNOUH67sHx49NwExXoRIp2lr3RU8KigoTijg==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR08MB7429.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <E87ECAE8983ABA459272370947E2E7F3@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9338
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AMS1EPF0000004B.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	fcdb4e35-a199-4b98-c9a6-08de7938520d
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|14060799003|35042699022|376014|82310400026|36860700013|7053199007;
X-Microsoft-Antispam-Message-Info: 
	61Reas1by/6pmNJzXeC/qSNA/soVNbEUGOMBJyQJQ3Zk92b1CyaFxLkd6O4c8T1r5v82XCduHGgnqEjWwiuQEkPqcBA7yIOWYncvTONx+L6rnhntdkaXG45C0Klo73okq0d/eKicrX/t0cdWBwiYxfHTTu18We2QxD1HcO1j843rIWD//HHBGs+8o2ADD4Gwh6c2KFVG5LeKOou8G4nQZ0pi/e7bUrdwATrxW6kWtDUEQkJgsUb6CQ/FicEVvyoF/myslwol+TV2OJycSnbnKpGffNTJHdhRoq52GEfxE+I42g48oW6G3Tr8AzXezSYzbkXjV1CY8vIIWLsyqdPa5yDzdutiEgEUKTuXDXsksccndWdRiPJWM7VjoPJAOtUQnRchvNl4zRZ/gm08r6eLfUvqqDrSEJiPBmyL9JcHkmPTXb+M7dCgRUSabyubzX1n6xHuwJLZJ4y08AX4k2wXuaJxhrm0yLLOT6DaGBm5eiIFvLemwGx4VbQdfWPOCejIxMfNgVRCp2FLcdzPpNwK5GqDZ57/9aBoMcytQig1mso8SQ/3HRI+mOBahhxaVYeV+NqSQWhRX7DaBwC63O2dtZU2t39tl2/LClFhvfXW0G4V8EouToy56fgk4rw75OeYjwdRZfjagCIWoHEv2bANguUPHBr1Fjg4cJ2OrFm6V3lKugvIIgg/NU1AlsAR8ReBc8H2LRfS0W67e7vBtsmJwX7HgyzOj9yvGhO0VnGm3r/BAFX4+aXBPqzoi+3yF4VHRaLpXdwwflRCAYseis2V8PolMpGFFpG5zWV0hOzI2TPuxSv8oU0BlI7bXX8U4xmv
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(14060799003)(35042699022)(376014)(82310400026)(36860700013)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	FmKHrzvUx4YYa8xoR8jMxdkT/Ib+59BNbN73qQqjLQYIiyADxjIfprLt4HuR5JzwQCZ8QNNaoMX8kA7JEwJDhddZDZ0AbA48wDUrk62LzcwxQACZcPwz5hLynAnjpFpyaMLYafX9mlXiryni68SwTCk9r0aEjffHEJDxK69olhpdYDhwSdNplgWME9URyOCXR+GV1ZC6Ls1fN/gQTUg1Fz/UTOvnSMjuRoPmUeXXHi2I7o93Vgez1tRFIkJk3JFoFQ+HIJWRTVUFhKFXvHNADWm0srvzjpCOk2OakAsgt55gaUSoWr4MpKJlBTGYA+htWqsJ9TGT9u6Wzs+jzACt10zMzsaqhknnWwaTL/dl6MoaFV2otVrJtgoeVaRoVfiFgMHHYhe7Rqz+HP17WNyNBhcxQd6Te0SghGEa0sL6k/sARwoAueCoHOx4d+MHmIvb
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2026 15:20:56.1051
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f1b8862e-9628-4f59-19f3-08de79387766
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS1EPF0000004B.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5559
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Mar 2026 15:21:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232319

T24gMjYgRmViIDIwMjYsIGF0IDEyOjU0LCBIZXQgUGF0ZWwgdmlhIGxpc3RzLm9wZW5lbWJlZGRl
ZC5vcmcgPGhldHBhdD1jaXNjby5jb21AbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4gd3JvdGU6DQo+
IA0KPiBGcm9tOiBIZXQgUGF0ZWwgPGhldHBhdEBjaXNjby5jb20+DQo+IA0KPiAtIFNldCBDVkVf
UFJPRFVDVCB0byBhbGlnbiB3aXRoIHRoZSBOVkQgQ1BFIGFuZCBlbnN1cmUgY29ycmVjdCBDVkUN
Cj4gcmVwb3J0aW5nLg0KDQpIYXZlIHRoZXJlIGJlZW4gYW55IENWRXMgZm9yIHB5dGhvbi1kYnVz
IHNvIHRoYXQgeW914oCZcmUgc3VyZSB0aGF0IHlvdeKAmXJlIHVzaW5nIHRoZSByaWdodCBDUEU/
ICBUaGlzIGlzIHRoZSBDUEUgZm9yIHRoZSBmZG8gZGFlbW9uIGFuZCBsaWJkYnVzIGFuZCBweXRo
b24tZGJ1cyBpcyBhIHNlcGFyYXRlIHByb2plY3QsIHNvIHlvdSBjYW7igJl0IGtub3cgaW4gYWR2
YW5jZSB3aGF0IHRoZSBDUEUgd2lsbCBiZSB1bmxlc3MgaXTigJlzIGJlZW4gc3RhdGVkIGluIGFk
dmFuY2UsIG9yIHRoZXJlIGFyZSBDVkVzIHRvIHJlZmVyZW5jZS4NCg0KQ2hlZXJzLA0KUm9zcw==

