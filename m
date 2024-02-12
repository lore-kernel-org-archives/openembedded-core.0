Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE9CEC4829B
	for <webhook@archiver.kernel.org>; Mon, 12 Feb 2024 11:48:38 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.77])
 by mx.groups.io with SMTP id smtpd.web10.4704.1707738515274204402
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Feb 2024 03:48:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=rTY21Dst;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=rTY21Dst;
 spf=pass (domain: arm.com, ip: 40.107.21.77, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=GixrXdIkWZ1ZN4WHVFLAgzaWiugnLnczegozJN8v3/Be4xins2zBuhLyVFyrAdbf87Y8xz5EbtUFvfTfqx2FlTynSBSc05Z7cfC8wH5hm71n+vpPuldWLGLq1FduEB50NWd3zGvHMydF8JMfDW9Es16A/MxOC6CnJyz34QeGLFnAd05FRcCxkShsE8Y4hxBUnkWNyTQtluw5B20EJR2xW50PLoqiQiw3cfgIf+GB81ON6V33e2ZqtY/EuregIOQKzcLH2vSUgb7f71UJQpzHEmkfVks/87OjO08i6D+2UHY+sum5SJy7Eiicr/pd1Hs4CT2NgwX4G3uWoFZjFZLzSg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pMwUwowgQgObEdJireK8UJua6jdhM2KBfrW4oJxjDIM=;
 b=SO6E0P9ZzW0Ghw6XMFNnyp9YlwMWKbs9pDdWVxedSRyOgEK+qmsIlEwgA7SfVLv8oRpskN8QcS2nogZaEIjatbQfPM1hlZt3DioTzldbeRPsh0Et01B+/GfkTmfANHjug/KGkLFducDujFEkXqrqWy246jLxlhnsb7KHqrLaTMsRO1iYDkk1IrWVetSbt9n38PAoSvlg2xelo2kmevw1GAtj+xBVvw+dVn2LPZIvvUdqvErsUwtYjiLwun6kOPerVpgvt6fvtXGDn4asiBOCFyTHHSiVA4ZNesYbwOccRiI6TnQRh/grYgFsEiFNK5JoderJenuBQMsNQOlKgWlO+g==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pMwUwowgQgObEdJireK8UJua6jdhM2KBfrW4oJxjDIM=;
 b=rTY21Dst+uZ6pTEYEJ8zXTugWRLOPwiDdJMLuALSSho1+wl6DDqeKBZ8f4yUBH9LbSXXEc+PeYwGwqoj3dwH+2Q99sRwZuCe/D00/RxMzcwYziHl98Xtu+D38ciziPfjqbfhJPEo0PkFKqndf9yNs8FIFoMboh0xP+MkgjmTuDo=
Received: from DB8PR09CA0019.eurprd09.prod.outlook.com (2603:10a6:10:a0::32)
 by AS2PR08MB10376.eurprd08.prod.outlook.com (2603:10a6:20b:545::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.27; Mon, 12 Feb
 2024 11:48:31 +0000
Received: from DU2PEPF00028D07.eurprd03.prod.outlook.com
 (2603:10a6:10:a0:cafe::5f) by DB8PR09CA0019.outlook.office365.com
 (2603:10a6:10:a0::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.38 via Frontend
 Transport; Mon, 12 Feb 2024 11:48:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU2PEPF00028D07.mail.protection.outlook.com (10.167.242.167) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7249.19 via Frontend Transport; Mon, 12 Feb 2024 11:48:30 +0000
Received: ("Tessian outbound 94d82ba85b1d:v228"); Mon, 12 Feb 2024 11:48:30 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 412abe964d3cce12
X-CR-MTA-TID: 64aa7808
Received: from c2bb42f32c3a.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 7994891C-D1A9-4E8D-8315-38A55E9D8C21.1;
	Mon, 12 Feb 2024 11:48:25 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c2bb42f32c3a.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 12 Feb 2024 11:48:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hnm+zvqolkRsph/vk4dcIr+Ylal8Qos1gxUXQGF6HFhjM51tW4zQl7tQu1LESIPY2JrtYJCWU6JNkV5eMpOJdic3uCj8Ub1gZyJvxXSMmBD5vV7gp9FlGzVQGE1qcWWzIMNxjJf4a/jsn632Zq9aAAEVBktmHZeyAgFYhxiusiI+9cph3djyuwOdEr21LsuNIz9pFx6hF6njWD4pA+TYaOPAmdUo2DM14WI1rJMdtXQjiyqFhdr2DvdBm4TwxDEyf+A/55rnONLouUYMoxsWm0WnhRKDR6jSV1Tww7944HARsm+HPSJ+rBrhcnmPQ2XrcFHHZrZElP+00bDJoXG7Vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pMwUwowgQgObEdJireK8UJua6jdhM2KBfrW4oJxjDIM=;
 b=K8DZn3W82I4h2O/JqiG1pTwHW7fQNivxSmOhF3J7U1MyIBLPJu+aQH3uy3Vpa1teS/4cdw4kgjMmFHzcOT2wd0viGknpp9sodBDIQMdzCKQDjD+hMUonEA3i+70BvMKH2XNFaMFt6Epo5+dERDDVKctWkUIAQS7diO3QsTYGLIbXzEeT7etK4twuqISZm9R4muagMi34bA6Vh4oz08SS3Ba7pBZzCXH4xd6CRPQLR1MurwONGqswuEqVH4QsDXVku4VMoUmZGQVIrUKKlwAzMwdrwVk6ymfUldAQ0pz9gicgeR6Hf4zQPDyqYZPy1h19JqYTvUxBhhChgzXA2rdqgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pMwUwowgQgObEdJireK8UJua6jdhM2KBfrW4oJxjDIM=;
 b=rTY21Dst+uZ6pTEYEJ8zXTugWRLOPwiDdJMLuALSSho1+wl6DDqeKBZ8f4yUBH9LbSXXEc+PeYwGwqoj3dwH+2Q99sRwZuCe/D00/RxMzcwYziHl98Xtu+D38ciziPfjqbfhJPEo0PkFKqndf9yNs8FIFoMboh0xP+MkgjmTuDo=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DBBPR08MB6236.eurprd08.prod.outlook.com (2603:10a6:10:20c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.37; Mon, 12 Feb
 2024 11:48:23 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::740e:ab01:e66a:61c9]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::740e:ab01:e66a:61c9%3]) with mapi id 15.20.7270.024; Mon, 12 Feb 2024
 11:48:22 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "rpjday@crashcourse.ca" <rpjday@crashcourse.ca>
CC: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] more ptest pedantry: why conditionally include
 "run-ptest" in SRC_URI?
Thread-Topic: [OE-core] more ptest pedantry: why conditionally include
 "run-ptest" in SRC_URI?
Thread-Index: AQHaXX5EMrr/sTK0LE+qmnXyzK6NNLEGl7iA
Date: Mon, 12 Feb 2024 11:48:22 +0000
Message-ID: <8C7A9199-D49B-4190-9D96-F060CD858C71@arm.com>
References: <8d71c0f-9120-85b7-80ce-d985aa557f8@crashcourse.ca>
In-Reply-To: <8d71c0f-9120-85b7-80ce-d985aa557f8@crashcourse.ca>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.400.31)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DBBPR08MB6236:EE_|DU2PEPF00028D07:EE_|AS2PR08MB10376:EE_
X-MS-Office365-Filtering-Correlation-Id: 14cd096b-2c62-4abc-f8eb-08dc2bc088d4
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 kX6MfH1p6Sp7nQggfBkZrAnrH2lAX+7mxl6gOG7Z9pgI+3wsHn6QKEtsqojvYhNGwfT5yAxnZNU7GzyDrscFIi0qR5yppFJKg5Un/5SE1Zq1SUrAzLxd94oPLVyJ/C6MIItOeEWJAOxho9XL6iJhwHSrixsa0hKYIvH1d3ZlcDIvcmbMSc/sBYISNTS1W5buMGBCDk/nfSPZKgUCvAXMsiShJiECHs+tUa9NLR59kHIvwfOEEtzIyiS8E9Y3d1VmHuzInkYacfEo7yRWp/B10nRbBOU0QWJV91IxKLDy3QuyHRxiZ8stHWic2q5+5DfCx++8uAoJVo8TJGJOSUbUwctSv1RpxIGgr8W6ge47J04J6CeQdCjNldSie7EWWw0w1CEK793jKbQJLiInEeK76dTWEbaBAgkDa8vvCXTQfJ/IcYHtyxCKUgSaK61XWdYoK2Mwf6yGO6CTfRB++/u1X5dXdGxVWGURpluDwK6CzL7MvyyVWoB6snTpZjPdq6k5YqZKD4hucjJSWjlWuU2iedMp6b8mZ2zFPNMOBE7iYn4OlyoiOlGSOZcYuTPlOBksaknUvNXUF1Gg0b92uH8eI/nobh0h2mtU/ytSxsB4kzY=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(346002)(396003)(39860400002)(136003)(376002)(230922051799003)(451199024)(64100799003)(1800799012)(186009)(86362001)(64756008)(66556008)(66446008)(66476007)(966005)(6916009)(316002)(76116006)(66946007)(6486002)(6506007)(71200400001)(478600001)(2906002)(4744005)(5660300002)(4326008)(8936002)(8676002)(122000001)(38100700002)(2616005)(26005)(53546011)(6512007)(33656002)(38070700009)(36756003)(41300700001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <9E7B9042C43CAA4ABC45302A33EF14F2@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6236
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DU2PEPF00028D07.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	a39d1435-c805-4be6-89a7-08dc2bc083aa
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	w2qAjNn5P8zwajXLJBwZby/ybq6JElaw/ct4w8G6LO7Zw9AcDg/foGZJp7qorqqn0wYDrS3WYrzR7A+3FlbLeaICNY8XKTZG/bOcNHDq6hZROVk7pz7bxvEIFJCFNFgqHKvmVhN3i65Tqz1Q1bebxmuk8ZzE9lKWj2A83iwz65+22dxpLgvjLq/8mKtg2xEw+ypng6tE8tJZG/4YQuG2Mn2BviZf3Sf3iF+C/XoCD1u300w0vFc4qvKRoBs9eYNWmKULJGAEbFHPNoeYCq18vWhjfYdgUA4mUrhZ7WMJDnB8OolnQiVqe12vaF/16p+iHJJAGfp8aPBQb5nBFqvI4yY3QwvjcbTepxToPXZ7Y5YYGKogcRrcARnv6te5sFkOVjcSNgCOjX5FJFdr8uExaYoZFc6J0r9vTAg+JlcjNwd/xGJ5e3NY0056Ex7n8mPZAzK5zPKqdNoIF0o3dPbS+Sk26RRgBYXQdcYrJh5WX20Pe5vTiqNLNDNWxQvpEGgfe79o3yK4//VVA8ws3xnawAyKcVNpkCwhY7lXRTZwnf33FwQynmlxW6o8RIFb3zM5T2erjgVMjPW+qbkt1fdXhw==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(136003)(39860400002)(346002)(396003)(376002)(230922051799003)(186009)(451199024)(64100799003)(1800799012)(82310400011)(46966006)(40470700004)(36840700001)(6506007)(6512007)(478600001)(53546011)(2616005)(41300700001)(26005)(2906002)(336012)(5660300002)(6486002)(966005)(70206006)(316002)(70586007)(8676002)(6862004)(8936002)(4326008)(33656002)(36756003)(4744005)(81166007)(82740400003)(86362001)(356005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2024 11:48:30.9141
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 14cd096b-2c62-4abc-f8eb-08dc2bc088d4
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU2PEPF00028D07.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB10376
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Feb 2024 11:48:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195312

T24gMTIgRmViIDIwMjQsIGF0IDA2OjM5LCBSb2JlcnQgUC4gSi4gRGF5IHZpYSBsaXN0cy5vcGVu
ZW1iZWRkZWQub3JnIDxycGpkYXk9Y3Jhc2hjb3Vyc2UuY2FAbGlzdHMub3BlbmVtYmVkZGVkLm9y
Zz4gd3JvdGU6DQo+ICBtb3JlIGFubm95aW5nIG5pdHBpY2tlcnkgLi4uIGhlcmU6DQo+IA0KPiBo
dHRwczovL2dpdC5vcGVuZW1iZWRkZWQub3JnL29wZW5lbWJlZGRlZC1jb3JlL3RyZWUvbWV0YS9y
ZWNpcGVzLWV4dGVuZGVkL3h6L3h6XzUuNC41LmJiI24yOA0KPiANCj4gaXQncyBub3QgY2xlYXIg
d2h5IHNvbWVvbmUgd291bGQgZ28gdG8gdGhlIHRyb3VibGUgb2YgY29uZGl0aW9uYWxseQ0KPiBp
bmNsdWRpbmcgcnVuLXB0ZXN0IGluIFNSQ19VUkkgYXMgaSB3b3VsZCBoYXZlIHRob3VnaHQgdGhl
IG9ubHkNCj4gYmVuZWZpdCB3b3VsZCBiZSB0byBhdm9pZCB0aGUgdHJpdmlhbGl0eSBvZiBjb3B5
aW5nIHJ1bi1wdGVzdCBpbnRvDQo+IFdPUktESVIsIGJ1dCBiZXlvbmQgdGhhdCwgaSBkb24ndCBz
ZWUgd2hhdCB0aGUgcG9pbnQgaXMsIGFuZCB0aGF0J3MNCj4gdGhlIG9ubHkgcmVjaXBlIGkndmUg
cnVuIGFjcm9zcyB0aGF0IGJvdGhlcnMgdG8gZG8gdGhhdC4NCj4gDQo+ICBpcyB0aGVyZSBzb21l
dGhpbmcgbW9yZSBzdWJ0bGUgaGFwcGVuaW5nIGhlcmU/DQoNCk5vIGdvb2QgcmVhc29uLCBhbmQg
SeKAmWQgYXBwcm92ZSBhIHBhdGNoIHRoYXQgcmVtb3ZlZCB0aGUgY29uZGl0aW9uYWxzIG9uIHRo
ZSBncm91bmRzIG9mIGNsZWFuaW5nIHVwIHRoZSByZWNpcGUgYW5kIGVuc3VyaW5nIHRoYXQgdGhl
cmXigJlzIGxlc3MgY29uZGl0aW9uYWwgcGF0aHMgdGhyb3VnaCB0aGUgcmVjaXBlLg0KDQpSb3Nz

