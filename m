Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36BDAC07548
	for <webhook@archiver.kernel.org>; Wed, 15 Nov 2023 11:03:39 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.41])
 by mx.groups.io with SMTP id smtpd.web10.10659.1700046211394906095
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Nov 2023 03:03:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=PdUCvjOr;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=PdUCvjOr;
 spf=pass (domain: arm.com, ip: 40.107.8.41, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=BjQbc76+KZuCzLlALZBeYLTLzkL+dkq5yiAoYzEEFYZCOSbGDlgQdMNiveLhepNBKU81oQE9YLmtBuP0rdLsm4JupCpimdvJnPJG7Ikj7C2+c+nvQZmq2WGqSNDwBsL0oBUAgs+ByWNtKC+2LstY/SQxcW9AYi2n3M9ZVz3s7HCf4Sn03FG9KCn4T5YVqQMosK/lZX4ss3GK70efQ2Co6pWxl+ZleOpqrnitJe5yDa2HxwMn5R65966vRPLzrH5Y2v7Z61ES7wPcg2tf9VzqlknrVxkKERHwXqpugvroar300Rq4RAFT7ns+WzqO3ZS58WPI8jwq5Pircf7/qNpbDw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VhOx0IkOjBCTlSDumdp8wXsbdOYdSYNZVvv8Y3L6xMw=;
 b=IT6v/JaklXt7bQMnxeS0x4djXxMrcjv/4aOc1rjM+igIhgzcPoWo8YXFVp8bCjQMEPy9V6RxUfhpFQcrOZEMTsFHBWtZphTihg1IHCBQL8qvwJvPOxM7YxZN2r2Pm5Y43vemOaLj+0QD8JmILFAvuWqeLrWDhAF+KqaabvgWgilt+NjpPmjRK7LGFROGY9YEg7GosoylkHkRYQpwRcmmr1m81EMO+n0eQJZmW4LG/yGz2W4wBiaL5M+FkxK0K2U7A0ir4eO2TsvxLSzGfaJ7yR1EVVA60LkoufQkUlKwSjJMOz3RZrAuUFpbWxMDJdtJG1rzzQafYIe2A6UN+yrpEw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VhOx0IkOjBCTlSDumdp8wXsbdOYdSYNZVvv8Y3L6xMw=;
 b=PdUCvjOrtfHX1H/uzPLIpeuKG37q+a058VnujD9p2eXDNCi1HG4/wpi5ceMgkzp/ZJt8yYrQhejCj/RaxsAxt5qFzwcM1aiXzf7yCPUgMNaMtpgEWLN9+3ZFLmC6l6F54H/LGCWTRn+hFEoq7iUHwhRH287x5LquIOJHQ+ZazGg=
Received: from DU2PR04CA0174.eurprd04.prod.outlook.com (2603:10a6:10:2b0::29)
 by PAXPR08MB6733.eurprd08.prod.outlook.com (2603:10a6:102:15e::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.31; Wed, 15 Nov
 2023 11:03:27 +0000
Received: from DU2PEPF0001E9C0.eurprd03.prod.outlook.com
 (2603:10a6:10:2b0:cafe::6e) by DU2PR04CA0174.outlook.office365.com
 (2603:10a6:10:2b0::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.18 via Frontend
 Transport; Wed, 15 Nov 2023 11:03:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU2PEPF0001E9C0.mail.protection.outlook.com (10.167.8.69) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7002.20 via Frontend Transport; Wed, 15 Nov 2023 11:03:27 +0000
Received: ("Tessian outbound 7671e7ddc218:v228"); Wed, 15 Nov 2023 11:03:27 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: ce9c0dbdc472012f
X-CR-MTA-TID: 64aa7808
Received: from 5a7db47ec3cb.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id BB4CF4FD-A7A3-40AE-9F25-A339F5E58555.1;
	Wed, 15 Nov 2023 11:03:20 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 5a7db47ec3cb.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 15 Nov 2023 11:03:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OFP73+IeOEA/aILrrc+yAn433swQsJ+jiIOexZTThd24XlXw1iy24xvRwdF9zg4/cu+mTJv27n6u0lHLKYQbemkfstm2Sek2rFLN4H2ERt2IFWIXBczjf0y9HLtofZYl53cmXSJ03DKrlIznOqCW3yUViWB8yWxDb3E39IHlUsj/Qrw0nXFBMcxBnHuX4xEpG9V0CAEH2wYa0LEmuvQw6FkVjJ3/DIDxF/7pwo3Lh8EXHKxjl0XhfoCAiXpVEpQ78h27/4kZ93OGBXzhifvv9bVvAnp9tsJe86Q6DJte5Q4e3auwLad190ys54rDL0CHQHqZ01BN+0QJAvzPjCwslw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VhOx0IkOjBCTlSDumdp8wXsbdOYdSYNZVvv8Y3L6xMw=;
 b=MbB9TOHOEM26f7yabMyhZ/YMY6AYPsyeOjqmnQWz7sGRsi7+D4/GNmVbx2RUL+iLNOZoJHxK5B0QCmnohFwZUhZs4A0rHA48i67YyZ/p0h0p5SREeJvvxkb40ajC78rczL98WoCW1Hmo2/11Ena+/UjyU2/09I5J3FmNrrMnZ1akfUqEDSKvv+XCs8zuTbpk27r9ReW24Bgi/5OWzzTZFuNAP0RDFgmCsWE6MqY9ZlEQCoSR0Z3/F/dzQVyFTkwIk32V4dk7ttkkmNBEBXwxgYhGt7nMzksvGpL4eVNh/HR+Bk5DLvNyafveZCKuZLwlbj4BmeNgzr4I/zpyZts7BA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VhOx0IkOjBCTlSDumdp8wXsbdOYdSYNZVvv8Y3L6xMw=;
 b=PdUCvjOrtfHX1H/uzPLIpeuKG37q+a058VnujD9p2eXDNCi1HG4/wpi5ceMgkzp/ZJt8yYrQhejCj/RaxsAxt5qFzwcM1aiXzf7yCPUgMNaMtpgEWLN9+3ZFLmC6l6F54H/LGCWTRn+hFEoq7iUHwhRH287x5LquIOJHQ+ZazGg=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DU0PR08MB8472.eurprd08.prod.outlook.com (2603:10a6:10:404::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.18; Wed, 15 Nov
 2023 11:03:18 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::ef47:2c42:1ef6:fe5c]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::ef47:2c42:1ef6:fe5c%6]) with mapi id 15.20.6977.029; Wed, 15 Nov 2023
 11:03:18 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "rpjday@crashcourse.ca" <rpjday@crashcourse.ca>
CC: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] how to INSANE_SKIP duplicate installed files?
Thread-Topic: [OE-core] how to INSANE_SKIP duplicate installed files?
Thread-Index: AQHaF6yFQX2vC/H04EGt8fxzWM7OcrB7N0eA
Date: Wed, 15 Nov 2023 11:03:17 +0000
Message-ID: <0E9B17AD-8CA7-4C05-B2ED-1B976D1FC4DC@arm.com>
References: <a0951c4-a5cc-15e0-91a8-f51fb5be8ed5@crashcourse.ca>
In-Reply-To: <a0951c4-a5cc-15e0-91a8-f51fb5be8ed5@crashcourse.ca>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.200.91.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DU0PR08MB8472:EE_|DU2PEPF0001E9C0:EE_|PAXPR08MB6733:EE_
X-MS-Office365-Filtering-Correlation-Id: 4048b09b-15d7-4809-893f-08dbe5ca7e78
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 y4a/+P88vjoygnkpGa+WhCPw5ge9bD00g0KjgfI7NCfmWxz1lMkUoEju6NgAwE4sNTZwVwTXzdIyw3d4UAu+jzMxTuD3esKF1qQN8mvFl6eUJz4UoOB4YlyF00RXDgovLLAsd77k+HlMNJDkGaTC7J4wiNXgV1NkruLsHnfWneyyba88fnMYOnVh06e+Nz7+1RgNEKkoCkFdvfYXnAvkP6+0C5r2mQyai5U5+T/k0g/cIwssV37a/BmnsklmpYFYURaBbesNQtxOtaXLqHq51Btjz5A+gANrV8FEJTikiYAOAYTqQz7BlyPgF0roKOx2ih87AGFcyumt12QijmURpNX0VRJ+gM70CzQJa89AYRxzC2Yl4fmqlBuyR44nnQh0pngqIN58gD5LSOBqgkQ//2ky6z/gQ+9JRBqQsnb16Rt2S242QkXVmHjl2zK6rQHynRxpxtnRZNGV67oz5DYrXBr6La566TUBdHrYrhIA00hPca0iiCSU2ds711wZoV7pUG6MuRBOQBBnNR/al8h8Y7JrIWrmOXxS38YovqWr3siFiKpnZKsLw1lo6Cq67LretiWBFoA20f9B17gQNExXZZFWaZUfqpNEu9MyDw10Rz6iqPqPFFxfX7B0ZO7FtBRhEv3K2qqp6CUPlOFaFEXc+A==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(366004)(376002)(136003)(396003)(346002)(230922051799003)(451199024)(64100799003)(1800799009)(186009)(4326008)(2906002)(71200400001)(41300700001)(36756003)(33656002)(4744005)(86362001)(122000001)(5660300002)(316002)(478600001)(53546011)(2616005)(66476007)(66946007)(66556008)(66446008)(64756008)(6506007)(38100700002)(76116006)(91956017)(26005)(6916009)(38070700009)(6512007)(8936002)(8676002)(6486002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <F9B3384B6F0BCC45AAAF4854CF311783@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8472
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DU2PEPF0001E9C0.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	375ac837-415f-4f7a-4e86-08dbe5ca790a
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	zqgP7pujyxbWSbJX55RIXhK4I20MaegW0fFfyBv5QXDRiaZjC5QA3ILsS8ybulgdBZpyyBIYgP2FE7Nd0WH6Z4N+fooF+CA9AqaScJA92WkSWwpepnkhhIFiOufwkzHFnQfWH3qxeIfs8boN+yp/1xy6W2bits8xANS4BXh3akIcoZF1zp2fTXTGWpS3q7Xf4xr8gf3UcypG9HlQsTqHz3vwMrV5EpPF3kin1vHmxBnS5rztbZY2/ehilD1p4ZlaHW4kFztF51kBrvB4fVi8cdot6o6P8u4U3accCjDwBgvOyAQ93OAZ55EeCm9B/LEiZxJB8M3GebyfkgZfuIyvyRjP0nV2Y8WKTIhBwQcjl8Wnf5A/EdPyj0RnlajfGTZloPTMNLnpzgYXfNbGzlb/O1ktHjrAh1q20Kh9xZQJBXNBHQFRxJqS1jpQUnk8MiSaHLlvoDtEcvMiU5qCFzxu/vMNE+9qU76Ko0VB7ma3FIwMyBtS/oTWyS5l5uUSWdPr5r+Jrr5P6IkHhI5d9C83aehCAt1GvlzBk1Bj2Be3iVrgYBT5lAz4vNGeCAoxVr18y8GNNxQI/5DccLQuWAo0e5EtbkWC44zY8QaiUA1Uxf0w0xTPYvEiFlPIz44farl7skLd6kdFgDigJt4V/SEIQsXcnXQBr/86IH9rJOTJAUIhr+PAcH49H5eqhHHDtRCypG5sIPWmCmYsrYh15XMJV6Jv1E/IrIJvL3aHBiEcApBfLtwMc8jfkDk972cWdTVU
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(376002)(39860400002)(346002)(136003)(396003)(230922051799003)(82310400011)(186009)(64100799003)(1800799009)(451199024)(36840700001)(46966006)(40470700004)(356005)(40480700001)(41300700001)(40460700003)(2906002)(4744005)(5660300002)(8676002)(8936002)(6862004)(4326008)(6486002)(53546011)(33656002)(316002)(36860700001)(36756003)(82740400003)(86362001)(70206006)(47076005)(336012)(6506007)(2616005)(70586007)(81166007)(478600001)(6512007)(26005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2023 11:03:27.1040
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4048b09b-15d7-4809-893f-08dbe5ca7e78
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU2PEPF0001E9C0.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6733
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Nov 2023 11:03:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190584

T24gMTUgTm92IDIwMjMsIGF0IDEwOjEzLCBSb2JlcnQgUC4gSi4gRGF5IHZpYSBsaXN0cy5vcGVu
ZW1iZWRkZWQub3JnIDxycGpkYXk9Y3Jhc2hjb3Vyc2UuY2FAbGlzdHMub3BlbmVtYmVkZGVkLm9y
Zz4gd3JvdGU6DQo+ICBpIHN3ZWFyLCBpIG9uY2UgZGlkIHRoaXMgYnV0IG5vdyBpIGNhbid0IGZp
bmQgdGhlIHNvbHV0aW9uIGZvcg0KPiBhbGxvd2luZyB0d28gcmVjaXBlcyB0byBpbnN0YWxsIGR1
cGxpY2F0ZSBmaWxlcy4gb2YgY291cnNlLCB0aGUgcmlnaHQNCj4gYW5zd2VyIGlzIHRvIGZpeCB0
aGUgcmVjaXBlcyBidXQgYSBjb2xsZWFndWUganVzdCB3YW50cyB0byBnZXQgaGlzDQo+IGJ1aWxk
IHRvIHdvcmsgc28gd2hhdCBpcyB0aGUgcXVpY2tlc3Qgd2F5IHRvIGRvIHRoZSBkYW5nZXJvdXMg
dGhpbmcNCj4gYW5kIGFsbG93IG92ZXJyaWRpbmcgaW5zdGFsbGVkIGZpbGVzPw0KDQpSZWNpcGVz
IGNhbiBjcmVhdGUgdGhlIHNhbWUgZmlsZSwgYnV0IHRoZXkgY2Fu4oCZdCBiZSBpbnN0YWxsZWQg
YXQgdGhlIHNhbWUgdGltZS4NCg0KSWYgdHdvIHJlY2lwZXMgaW5zdGFsbCB0aGUgc2FtZSBmaWxl
bmFtZSBhbmQgdGhleeKAmXJlIGJvdGggcHVsbGVkIGludG8gdGhlIHN5c3Jvb3QgdmlhIERFUEVO
RFMgdGhlbiB0aGF0IGlzIGEgZmF0YWwgZXJyb3IgYW5kIHlvdSBjYW7igJl0IGF2b2lkIGl0Lg0K
DQpJZiB0d28gcGFja2FnZXMgaW5zdGFsbCB0aGUgc2FtZSBmaWxlbmFtZSBhbmQgdGhleeKAmXJl
IGJvdGggcHVsbGVkIGludG8gYW4gaW1hZ2UgdGhlbiB0aGF0IGlzIGEgZmF0YWwgZXJyb3IgYW5k
IHlvdSBjYW7igJl0IGF2b2lkIGl0Lg0KDQpSb3Nz

